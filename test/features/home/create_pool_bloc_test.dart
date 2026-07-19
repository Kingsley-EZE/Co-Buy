import 'package:co_buy/core/error/failures.dart';
import 'package:co_buy/core/usecase/usecase.dart';
import 'package:co_buy/features/home/domain/entities/account_lookup_request.dart';
import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/home/domain/entities/bank_account.dart';
import 'package:co_buy/features/home/domain/usecases/get_banks_usecase.dart';
import 'package:co_buy/features/home/domain/usecases/lookup_account_name_usecase.dart';
import 'package:co_buy/features/home/presentation/blocs/create_pool_bloc/create_pool_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetBanksUseCase extends Mock implements GetBanksUseCase {}

class MockLookupAccountNameUseCase extends Mock
    implements LookupAccountNameUseCase {}

void main() {
  late MockGetBanksUseCase getBanks;
  late MockLookupAccountNameUseCase lookupAccountName;
  late CreatePoolBloc bloc;

  const banks = [Bank(name: '78 FINANCE COMPANY LIMITED', code: '110072')];

  const account = BankAccount(
    accountNumber: '9064076777',
    accountName: 'DAVID SAMSON ADELADE',
    bankCode: '305',
  );

  setUpAll(() {
    registerFallbackValue(const NoParams());
    registerFallbackValue(
      const AccountLookupRequest(accountNumber: '', bankCode: ''),
    );
  });

  setUp(() {
    getBanks = MockGetBanksUseCase();
    lookupAccountName = MockLookupAccountNameUseCase();
    bloc = CreatePoolBloc(getBanks, lookupAccountName);
  });

  tearDown(() => bloc.close());

  group('bank list', () {
    test('a fetch loads the bank list through the use case', () async {
      when(() => getBanks(any())).thenAnswer((_) async => const Right(banks));

      bloc.add(const CreatePoolEvent.banksFetchRequested());

      await expectLater(
        bloc.stream,
        emitsInOrder(const [
          CreatePoolState(banksStatus: CreatePoolRequestStatus.loading),
          CreatePoolState(
            banksStatus: CreatePoolRequestStatus.success,
            banks: banks,
          ),
        ]),
      );
    });

    test(
      'a second fetch reuses the cached list without calling the API again',
      () async {
        when(() => getBanks(any())).thenAnswer((_) async => const Right(banks));

        bloc.add(const CreatePoolEvent.banksFetchRequested());
        await expectLater(
          bloc.stream,
          emitsThrough(
            const CreatePoolState(
              banksStatus: CreatePoolRequestStatus.success,
              banks: banks,
            ),
          ),
        );

        bloc.add(const CreatePoolEvent.banksFetchRequested());
        await Future<void>.delayed(Duration.zero);

        expect(bloc.state.banks, banks);
        verify(() => getBanks(any())).called(1);
      },
    );

    test(
      'a fetch after a failure retries instead of caching the error',
      () async {
        when(
          () => getBanks(any()),
        ).thenAnswer((_) async => const Left(UnknownFailure()));

        bloc.add(const CreatePoolEvent.banksFetchRequested());
        await expectLater(
          bloc.stream,
          emitsThrough(
            isA<CreatePoolState>().having(
              (s) => s.banksStatus,
              'banksStatus',
              CreatePoolRequestStatus.failure,
            ),
          ),
        );

        when(() => getBanks(any())).thenAnswer((_) async => const Right(banks));

        bloc.add(const CreatePoolEvent.banksFetchRequested());
        await expectLater(
          bloc.stream,
          emitsThrough(
            isA<CreatePoolState>().having((s) => s.banks, 'banks', banks),
          ),
        );

        verify(() => getBanks(any())).called(2);
      },
    );
  });

  group('account name lookup', () {
    test('a lookup resolves the account through the use case', () async {
      when(
        () => lookupAccountName(any()),
      ).thenAnswer((_) async => const Right(account));

      bloc.add(
        const CreatePoolEvent.accountLookupRequested(
          accountNumber: '9064076777',
          bankCode: '305',
        ),
      );

      await expectLater(
        bloc.stream,
        emitsInOrder(const [
          CreatePoolState(accountLookupStatus: CreatePoolRequestStatus.loading),
          CreatePoolState(
            accountLookupStatus: CreatePoolRequestStatus.success,
            resolvedAccount: account,
          ),
        ]),
      );

      verify(
        () => lookupAccountName(
          const AccountLookupRequest(
            accountNumber: '9064076777',
            bankCode: '305',
          ),
        ),
      ).called(1);
    });

    test(
      'a failed lookup surfaces the failure message and clears the account',
      () async {
        when(
          () => lookupAccountName(any()),
        ).thenAnswer((_) async => const Right(account));
        bloc.add(
          const CreatePoolEvent.accountLookupRequested(
            accountNumber: '9064076777',
            bankCode: '305',
          ),
        );
        await expectLater(
          bloc.stream,
          emitsThrough(
            isA<CreatePoolState>().having(
              (s) => s.resolvedAccount,
              'resolvedAccount',
              account,
            ),
          ),
        );

        when(() => lookupAccountName(any())).thenAnswer(
          (_) async => const Left(ServerFailure('Account not found')),
        );
        bloc.add(
          const CreatePoolEvent.accountLookupRequested(
            accountNumber: '0000000000',
            bankCode: '305',
          ),
        );

        await expectLater(
          bloc.stream,
          emitsThrough(
            isA<CreatePoolState>()
                .having(
                  (s) => s.accountLookupStatus,
                  'accountLookupStatus',
                  CreatePoolRequestStatus.failure,
                )
                .having((s) => s.resolvedAccount, 'resolvedAccount', isNull)
                .having(
                  (s) => s.accountLookupError,
                  'accountLookupError',
                  'Account not found',
                ),
          ),
        );
      },
    );

    test('clearing the lookup drops the resolved account and error', () async {
      when(
        () => lookupAccountName(any()),
      ).thenAnswer((_) async => const Right(account));

      bloc.add(
        const CreatePoolEvent.accountLookupRequested(
          accountNumber: '9064076777',
          bankCode: '305',
        ),
      );
      await expectLater(
        bloc.stream,
        emitsThrough(
          isA<CreatePoolState>().having(
            (s) => s.resolvedAccount,
            'resolvedAccount',
            account,
          ),
        ),
      );

      bloc.add(const CreatePoolEvent.accountLookupCleared());
      await expectLater(
        bloc.stream,
        emitsThrough(
          isA<CreatePoolState>()
              .having(
                (s) => s.accountLookupStatus,
                'accountLookupStatus',
                CreatePoolRequestStatus.initial,
              )
              .having((s) => s.resolvedAccount, 'resolvedAccount', isNull)
              .having(
                (s) => s.accountLookupError,
                'accountLookupError',
                isNull,
              ),
        ),
      );
    });

    test('a lookup does not disturb the cached bank list', () async {
      when(() => getBanks(any())).thenAnswer((_) async => const Right(banks));
      when(
        () => lookupAccountName(any()),
      ).thenAnswer((_) async => const Right(account));

      bloc.add(const CreatePoolEvent.banksFetchRequested());
      bloc.add(
        const CreatePoolEvent.accountLookupRequested(
          accountNumber: '9064076777',
          bankCode: '305',
        ),
      );

      await expectLater(
        bloc.stream,
        emitsThrough(
          isA<CreatePoolState>().having(
            (s) => s.resolvedAccount,
            'resolvedAccount',
            account,
          ),
        ),
      );

      expect(bloc.state.banks, banks);
      expect(bloc.state.banksStatus, CreatePoolRequestStatus.success);
    });
  });
}
