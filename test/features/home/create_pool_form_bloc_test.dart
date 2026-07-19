import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/home/domain/entities/bank_account.dart';
import 'package:co_buy/features/home/presentation/blocs/create_pool_form_bloc/create_pool_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CreatePoolFormBloc bloc;

  const bank = Bank(name: '78 FINANCE COMPANY LIMITED', code: '305');

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
      ..add(const CreatePoolFormEvent.categoryChanged(PoolCategory.groceries))
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
