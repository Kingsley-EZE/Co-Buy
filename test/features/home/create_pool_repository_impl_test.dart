import 'package:co_buy/core/error/failures.dart';
import 'package:co_buy/features/home/data/datasources/create_pool_data_source.dart';
import 'package:co_buy/features/home/data/dtos/bank_account_dto.dart';
import 'package:co_buy/features/home/data/dtos/bank_dto.dart';
import 'package:co_buy/features/home/data/repositories/create_pool_repository_impl.dart';
import 'package:co_buy/features/home/domain/entities/account_lookup_request.dart';
import 'package:co_buy/features/home/domain/entities/bank.dart';
import 'package:co_buy/features/home/domain/entities/bank_account.dart';
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
