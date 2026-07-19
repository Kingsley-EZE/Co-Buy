import 'package:co_buy/core/error/failures.dart';
import 'package:co_buy/core/usecase/usecase.dart';
import 'package:co_buy/features/home/domain/entities/account_lookup_request.dart';
import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/home/domain/entities/bank_account.dart';
import 'package:co_buy/features/home/domain/entities/create_pool_request.dart';
import 'package:co_buy/features/home/domain/entities/pool_category.dart';
import 'package:co_buy/features/home/domain/usecases/create_pool_usecase.dart';
import 'package:co_buy/features/home/domain/usecases/get_banks_usecase.dart';
import 'package:co_buy/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:co_buy/features/home/domain/usecases/lookup_account_name_usecase.dart';
import 'package:co_buy/features/home/presentation/blocs/create_pool_bloc/create_pool_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetBanksUseCase extends Mock implements GetBanksUseCase {}

class MockGetCategoriesUseCase extends Mock implements GetCategoriesUseCase {}

class MockLookupAccountNameUseCase extends Mock
    implements LookupAccountNameUseCase {}

class MockCreatePoolUseCase extends Mock implements CreatePoolUseCase {}

void main() {
  late MockGetBanksUseCase getBanks;
  late MockGetCategoriesUseCase getCategories;
  late MockLookupAccountNameUseCase lookupAccountName;
  late MockCreatePoolUseCase createPool;
  late CreatePoolBloc bloc;

  const banks = [Bank(name: '78 FINANCE COMPANY LIMITED', code: '110072')];

  const categories = [
    PoolCategory(
      id: '1cf21de1-1b33-4aeb-a3f0-4cc6cae31fa1',
      name: 'Ajo',
      description: 'Ajo/Esusu — rotating savings, monthly contributions',
    ),
  ];

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
    registerFallbackValue(
      CreatePoolRequest(
        name: '',
        categoryId: '',
        targetAmount: 0,
        maxMembers: 0,
        splitEven: true,
        memberShareAmount: 0,
        beneficiaryAccountNumber: '',
        beneficiaryAccountName: '',
        beneficiaryBankName: '',
        beneficiaryBankCode: '',
        deadlineAt: DateTime(2026),
      ),
    );
  });

  setUp(() {
    getBanks = MockGetBanksUseCase();
    getCategories = MockGetCategoriesUseCase();
    lookupAccountName = MockLookupAccountNameUseCase();
    createPool = MockCreatePoolUseCase();
    bloc = CreatePoolBloc(
      getBanks,
      getCategories,
      lookupAccountName,
      createPool,
    );
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

  group('category list', () {
    test('a fetch loads the categories through the use case', () async {
      when(
        () => getCategories(any()),
      ).thenAnswer((_) async => const Right(categories));

      bloc.add(const CreatePoolEvent.categoriesFetchRequested());

      await expectLater(
        bloc.stream,
        emitsInOrder(const [
          CreatePoolState(categoriesStatus: CreatePoolRequestStatus.loading),
          CreatePoolState(
            categoriesStatus: CreatePoolRequestStatus.success,
            categories: categories,
          ),
        ]),
      );
    });

    test(
      'a second fetch reuses the cached list without calling the API again',
      () async {
        when(
          () => getCategories(any()),
        ).thenAnswer((_) async => const Right(categories));

        bloc.add(const CreatePoolEvent.categoriesFetchRequested());
        await expectLater(
          bloc.stream,
          emitsThrough(
            const CreatePoolState(
              categoriesStatus: CreatePoolRequestStatus.success,
              categories: categories,
            ),
          ),
        );

        bloc.add(const CreatePoolEvent.categoriesFetchRequested());
        await Future<void>.delayed(Duration.zero);

        expect(bloc.state.categories, categories);
        verify(() => getCategories(any())).called(1);
      },
    );

    test(
      'a fetch after a failure retries instead of caching the error',
      () async {
        when(
          () => getCategories(any()),
        ).thenAnswer((_) async => const Left(UnknownFailure()));

        bloc.add(const CreatePoolEvent.categoriesFetchRequested());
        await expectLater(
          bloc.stream,
          emitsThrough(
            isA<CreatePoolState>().having(
              (s) => s.categoriesStatus,
              'categoriesStatus',
              CreatePoolRequestStatus.failure,
            ),
          ),
        );

        when(
          () => getCategories(any()),
        ).thenAnswer((_) async => const Right(categories));

        bloc.add(const CreatePoolEvent.categoriesFetchRequested());
        await expectLater(
          bloc.stream,
          emitsThrough(
            isA<CreatePoolState>().having(
              (s) => s.categories,
              'categories',
              categories,
            ),
          ),
        );

        verify(() => getCategories(any())).called(2);
      },
    );
  });

  group('pool submission', () {
    final request = CreatePoolRequest(
      name: 'Mama Gold rice 50kg',
      categoryId: '1cf21de1-1b33-4aeb-a3f0-4cc6cae31fa1',
      targetAmount: 5000,
      maxMembers: 10,
      splitEven: true,
      memberShareAmount: 500,
      beneficiaryAccountNumber: '9064076777',
      beneficiaryAccountName: 'DAVID SAMSON ADELADE',
      beneficiaryBankName: '78 FINANCE COMPANY LIMITED',
      beneficiaryBankCode: '305',
      deadlineAt: DateTime(2026, 8, 1),
    );

    test('a submission creates the pool through the use case', () async {
      when(() => createPool(any())).thenAnswer((_) async => const Right(null));

      bloc.add(CreatePoolEvent.submitRequested(request));

      await expectLater(
        bloc.stream,
        emitsInOrder(const [
          CreatePoolState(createPoolStatus: CreatePoolRequestStatus.loading),
          CreatePoolState(createPoolStatus: CreatePoolRequestStatus.success),
        ]),
      );

      verify(() => createPool(request)).called(1);
    });

    test('a failed submission surfaces the failure message', () async {
      when(() => createPool(any())).thenAnswer(
        (_) async => const Left(ServerFailure('Deadline is in the past')),
      );

      bloc.add(CreatePoolEvent.submitRequested(request));

      await expectLater(
        bloc.stream,
        emitsThrough(
          isA<CreatePoolState>()
              .having(
                (s) => s.createPoolStatus,
                'createPoolStatus',
                CreatePoolRequestStatus.failure,
              )
              .having(
                (s) => s.createPoolError,
                'createPoolError',
                'Deadline is in the past',
              ),
        ),
      );
    });

    test('clearing the submit state resets the status and error', () async {
      when(
        () => createPool(any()),
      ).thenAnswer((_) async => const Left(UnknownFailure()));

      bloc.add(CreatePoolEvent.submitRequested(request));
      await expectLater(
        bloc.stream,
        emitsThrough(
          isA<CreatePoolState>().having(
            (s) => s.createPoolStatus,
            'createPoolStatus',
            CreatePoolRequestStatus.failure,
          ),
        ),
      );

      bloc.add(const CreatePoolEvent.submitStateCleared());
      await expectLater(
        bloc.stream,
        emitsThrough(
          isA<CreatePoolState>()
              .having(
                (s) => s.createPoolStatus,
                'createPoolStatus',
                CreatePoolRequestStatus.initial,
              )
              .having((s) => s.createPoolError, 'createPoolError', isNull),
        ),
      );
    });
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
