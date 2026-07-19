import 'package:co_buy/core/error/failures.dart';
import 'package:co_buy/features/home/data/datasources/create_pool_data_source.dart';
import 'package:co_buy/features/home/data/dtos/bank_account_dto.dart';
import 'package:co_buy/features/home/data/dtos/bank_dto.dart';
import 'package:co_buy/features/home/data/dtos/create_pool_request_dto.dart';
import 'package:co_buy/features/home/data/dtos/pool_category_dto.dart';
import 'package:co_buy/features/home/data/repositories/create_pool_repository_impl.dart';
import 'package:co_buy/features/home/domain/entities/account_lookup_request.dart';
import 'package:co_buy/features/home/domain/entities/create_pool_request.dart';
import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/home/domain/entities/bank_account.dart';
import 'package:co_buy/features/home/domain/entities/pool_category.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreatePoolDataSource extends Mock implements CreatePoolDataSource {}

void main() {
  late MockCreatePoolDataSource remote;
  late CreatePoolRepositoryImpl repo;

  const response = BanksResponseDto(
    success: true,
    data: [BankDto(name: '78 FINANCE COMPANY LIMITED', code: '110072')],
    message: 'Banks retrieved successfully',
  );

  setUp(() {
    remote = MockCreatePoolDataSource();
    repo = CreatePoolRepositoryImpl(remote);
  });

  test('getBanks maps the response DTOs to bank entities', () async {
    when(() => remote.getBanks()).thenAnswer((_) async => response);

    final result = await repo.getBanks();

    expect(result.getOrElse(() => []), const [
      Bank(name: '78 FINANCE COMPANY LIMITED', code: '110072'),
    ]);
  });

  test(
    'getBanks maps a DioException to a Failure instead of throwing',
    () async {
      when(() => remote.getBanks()).thenThrow(
        DioException.connectionError(
          requestOptions: RequestOptions(path: '/banks'),
          reason: 'offline',
        ),
      );

      final result = await repo.getBanks();

      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) => expect(failure, isA<Failure>()),
        (_) => fail('expected a Failure'),
      );
    },
  );

  test('getBanks falls back to UnknownFailure on unexpected errors', () async {
    when(() => remote.getBanks()).thenThrow(StateError('boom'));

    final result = await repo.getBanks();

    result.fold(
      (failure) => expect(failure, isA<UnknownFailure>()),
      (_) => fail('expected a Failure'),
    );
  });

  group('createPool', () {
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
      deadlineAt: DateTime.utc(2026, 8, 1, 12, 30),
    );

    setUpAll(() {
      registerFallbackValue(
        const CreatePoolRequestDto(
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
          deadlineAt: '',
        ),
      );
    });

    test(
      'maps the request to a DTO with an ISO-8601 UTC deadline and posts it',
      () async {
        when(
          () => remote.createPool(body: any(named: 'body')),
        ).thenAnswer((_) async {});

        final result = await repo.createPool(request);

        expect(result.isRight(), isTrue);
        final dto =
            verify(
                  () => remote.createPool(body: captureAny(named: 'body')),
                ).captured.single
                as CreatePoolRequestDto;
        expect(dto.name, 'Mama Gold rice 50kg');
        expect(dto.description, isNull);
        expect(dto.categoryId, '1cf21de1-1b33-4aeb-a3f0-4cc6cae31fa1');
        expect(dto.targetAmount, 5000);
        expect(dto.maxMembers, 10);
        expect(dto.splitEven, isTrue);
        expect(dto.memberShareAmount, 500);
        expect(dto.beneficiaryAccountNumber, '9064076777');
        expect(dto.beneficiaryAccountName, 'DAVID SAMSON ADELADE');
        expect(dto.beneficiaryBankName, '78 FINANCE COMPANY LIMITED');
        expect(dto.beneficiaryBankCode, '305');
        expect(dto.deadlineAt, '2026-08-01T12:30:00.000Z');
      },
    );

    test('an omitted description is left out of the JSON payload', () async {
      when(
        () => remote.createPool(body: any(named: 'body')),
      ).thenAnswer((_) async {});

      await repo.createPool(request);

      final dto =
          verify(
                () => remote.createPool(body: captureAny(named: 'body')),
              ).captured.single
              as CreatePoolRequestDto;
      expect(dto.toJson(), isNot(contains('description')));
    });

    test('maps a DioException to a Failure instead of throwing', () async {
      when(() => remote.createPool(body: any(named: 'body'))).thenThrow(
        DioException.connectionError(
          requestOptions: RequestOptions(path: '/pools'),
          reason: 'offline',
        ),
      );

      final result = await repo.createPool(request);

      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) => expect(failure, isA<Failure>()),
        (_) => fail('expected a Failure'),
      );
    });

    test('falls back to UnknownFailure on unexpected errors', () async {
      when(
        () => remote.createPool(body: any(named: 'body')),
      ).thenThrow(StateError('boom'));

      final result = await repo.createPool(request);

      result.fold(
        (failure) => expect(failure, isA<UnknownFailure>()),
        (_) => fail('expected a Failure'),
      );
    });
  });

  group('getCategories', () {
    const categoriesResponse = PoolCategoriesResponseDto(
      success: true,
      data: [
        PoolCategoryDto(
          id: '1cf21de1-1b33-4aeb-a3f0-4cc6cae31fa1',
          name: 'Ajo',
          description: 'Ajo/Esusu — rotating savings, monthly contributions',
          isActive: true,
        ),
        PoolCategoryDto(
          id: '1291a375-bd1c-4bd5-b53c-fd82bb840e70',
          name: 'Custom',
          description: 'Custom — any other reason',
          isActive: false,
        ),
      ],
      message: 'Categories retrieved successfully',
    );

    test('maps the response DTOs and drops inactive categories', () async {
      when(
        () => remote.getCategories(),
      ).thenAnswer((_) async => categoriesResponse);

      final result = await repo.getCategories();

      expect(result.getOrElse(() => []), const [
        PoolCategory(
          id: '1cf21de1-1b33-4aeb-a3f0-4cc6cae31fa1',
          name: 'Ajo',
          description: 'Ajo/Esusu — rotating savings, monthly contributions',
        ),
      ]);
    });

    test('maps a DioException to a Failure instead of throwing', () async {
      when(() => remote.getCategories()).thenThrow(
        DioException.connectionError(
          requestOptions: RequestOptions(path: '/categories'),
          reason: 'offline',
        ),
      );

      final result = await repo.getCategories();

      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) => expect(failure, isA<Failure>()),
        (_) => fail('expected a Failure'),
      );
    });

    test('falls back to UnknownFailure on unexpected errors', () async {
      when(() => remote.getCategories()).thenThrow(StateError('boom'));

      final result = await repo.getCategories();

      result.fold(
        (failure) => expect(failure, isA<UnknownFailure>()),
        (_) => fail('expected a Failure'),
      );
    });
  });

  group('lookupAccountName', () {
    const request = AccountLookupRequest(
      accountNumber: '9064076777',
      bankCode: '305',
    );

    const lookupResponse = BankAccountLookupResponseDto(
      success: true,
      data: BankAccountDto(
        accountNumber: '9064076777',
        accountName: 'DAVID SAMSON ADELADE',
        bankCode: '305',
      ),
      message: 'Bank account resolved successfully',
    );

    test(
      'passes the request as query params and maps the resolved account',
      () async {
        when(
          () => remote.lookupAccountName(
            accountNumber: any(named: 'accountNumber'),
            bankCode: any(named: 'bankCode'),
          ),
        ).thenAnswer((_) async => lookupResponse);

        final result = await repo.lookupAccountName(request);

        result.fold(
          (failure) => fail('expected a BankAccount'),
          (account) => expect(
            account,
            const BankAccount(
              accountNumber: '9064076777',
              accountName: 'DAVID SAMSON ADELADE',
              bankCode: '305',
            ),
          ),
        );
        verify(
          () => remote.lookupAccountName(
            accountNumber: '9064076777',
            bankCode: '305',
          ),
        ).called(1);
      },
    );

    test('maps a DioException to a Failure instead of throwing', () async {
      when(
        () => remote.lookupAccountName(
          accountNumber: any(named: 'accountNumber'),
          bankCode: any(named: 'bankCode'),
        ),
      ).thenThrow(
        DioException.connectionError(
          requestOptions: RequestOptions(path: '/banks/name-lookup'),
          reason: 'offline',
        ),
      );

      final result = await repo.lookupAccountName(request);

      expect(result.isLeft(), isTrue);
    });

    test('falls back to UnknownFailure on unexpected errors', () async {
      when(
        () => remote.lookupAccountName(
          accountNumber: any(named: 'accountNumber'),
          bankCode: any(named: 'bankCode'),
        ),
      ).thenThrow(StateError('boom'));

      final result = await repo.lookupAccountName(request);

      result.fold(
        (failure) => expect(failure, isA<UnknownFailure>()),
        (_) => fail('expected a Failure'),
      );
    });
  });
}
