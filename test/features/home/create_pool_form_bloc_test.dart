import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/home/domain/entities/bank_account.dart';
import 'package:co_buy/features/home/domain/entities/pool_category.dart';
import 'package:co_buy/features/home/presentation/blocs/create_pool_form_bloc/create_pool_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CreatePoolFormBloc bloc;

  const bank = Bank(name: '78 FINANCE COMPANY LIMITED', code: '305');

  const category = PoolCategory(
    id: '1e9d8011-cb58-4e96-a568-547c763413df',
    name: 'BulkPurchase',
    description: 'Bulk purchase — rice, gas, building materials, groceries',
  );

  const account = BankAccount(
    accountNumber: '9064076777',
    accountName: 'DAVID SAMSON ADELADE',
    bankCode: '305',
  );

  /// Fills every field except the enquiry result, leaving the form one
  /// verified account short of submittable.
  void fillFormCompletely() {
    bloc
      ..add(const CreatePoolFormEvent.titleChanged('Mama Gold rice 50kg'))
      ..add(const CreatePoolFormEvent.categoryChanged(category))
      ..add(const CreatePoolFormEvent.targetAmountChanged('5000'))
      ..add(const CreatePoolFormEvent.slotsChanged('10'))
      ..add(CreatePoolFormEvent.deadlineChanged(DateTime(2026, 8, 1)))
      ..add(const CreatePoolFormEvent.bankChanged(bank))
      ..add(const CreatePoolFormEvent.accountNumberChanged('9064076777'));
  }

  setUp(() {
    bloc = CreatePoolFormBloc();
  });

  tearDown(() => bloc.close());

  test(
    'a fully filled form cannot submit until the account is verified',
    () async {
      fillFormCompletely();
      await Future<void>.delayed(Duration.zero);

      expect(bloc.state.canLookupAccount, isTrue);
      expect(bloc.state.accountVerified, isFalse);
      expect(bloc.state.canSubmit, isFalse);
    },
  );

  test(
    'a resolved account matching the typed inputs enables submission',
    () async {
      fillFormCompletely();
      bloc.add(const CreatePoolFormEvent.accountLookupResultChanged(account));
      await Future<void>.delayed(Duration.zero);

      expect(bloc.state.accountVerified, isTrue);
      expect(bloc.state.canSubmit, isTrue);
    },
  );

  test(
    'editing the account number after verification disables submission',
    () async {
      fillFormCompletely();
      bloc.add(const CreatePoolFormEvent.accountLookupResultChanged(account));
      await Future<void>.delayed(Duration.zero);
      expect(bloc.state.canSubmit, isTrue);

      bloc.add(const CreatePoolFormEvent.accountNumberChanged('9064076778'));
      await Future<void>.delayed(Duration.zero);

      expect(bloc.state.accountVerified, isFalse);
      expect(bloc.state.canSubmit, isFalse);
    },
  );

  test(
    'a resolved account for a different bank does not count as verified',
    () async {
      fillFormCompletely();
      bloc.add(
        const CreatePoolFormEvent.bankChanged(
          Bank(name: 'ANOTHER BANK', code: '110072'),
        ),
      );
      bloc.add(const CreatePoolFormEvent.accountLookupResultChanged(account));
      await Future<void>.delayed(Duration.zero);

      expect(bloc.state.accountVerified, isFalse);
      expect(bloc.state.canSubmit, isFalse);
    },
  );

  test('recipientReceivesAmount is the target minus the pool fee', () async {
    bloc.add(const CreatePoolFormEvent.targetAmountChanged('500000'));
    await Future<void>.delayed(Duration.zero);

    expect(
      bloc.state.recipientReceivesAmount,
      closeTo(500000 * (1 - kPoolFeeRate), 0.001),
    );
  });

  test(
    'recipientReceivesAmount is null without a valid target amount',
    () async {
      expect(bloc.state.recipientReceivesAmount, isNull);

      bloc.add(const CreatePoolFormEvent.targetAmountChanged('0'));
      await Future<void>.delayed(Duration.zero);

      expect(bloc.state.recipientReceivesAmount, isNull);
    },
  );

  test(
    'toCreatePoolRequest derives the payload from the filled form',
    () async {
      fillFormCompletely();
      bloc.add(const CreatePoolFormEvent.accountLookupResultChanged(account));
      await Future<void>.delayed(Duration.zero);

      final request = bloc.state.toCreatePoolRequest();

      expect(request.name, 'Mama Gold rice 50kg');
      // The empty optional description is omitted, not sent as ''.
      expect(request.description, isNull);
      expect(request.categoryId, category.id);
      expect(request.targetAmount, 5000);
      expect(request.maxMembers, 10);
      // The untouched "Even Contribution?" hint defaults to an even split,
      // whose per-member share is the target divided across the slots.
      expect(request.splitEven, isTrue);
      expect(request.memberShareAmount, 500);
      expect(request.beneficiaryAccountNumber, '9064076777');
      // The account name comes from the enquiry result, never user input.
      expect(request.beneficiaryAccountName, account.accountName);
      expect(request.beneficiaryBankName, bank.name);
      expect(request.beneficiaryBankCode, bank.code);
      expect(request.deadlineAt, DateTime(2026, 8, 1));
    },
  );

  test('an uneven split sends no per-member share amount', () async {
    fillFormCompletely();
    bloc.add(const CreatePoolFormEvent.accountLookupResultChanged(account));
    bloc.add(const CreatePoolFormEvent.evenContributionChanged(false));
    await Future<void>.delayed(Duration.zero);

    final request = bloc.state.toCreatePoolRequest();

    expect(request.splitEven, isFalse);
    expect(request.memberShareAmount, 0);
  });

  test('a null lookup result clears verification', () async {
    fillFormCompletely();
    bloc.add(const CreatePoolFormEvent.accountLookupResultChanged(account));
    await Future<void>.delayed(Duration.zero);
    expect(bloc.state.canSubmit, isTrue);

    bloc.add(const CreatePoolFormEvent.accountLookupResultChanged(null));
    await Future<void>.delayed(Duration.zero);

    expect(bloc.state.accountVerified, isFalse);
    expect(bloc.state.canSubmit, isFalse);
  });
}
