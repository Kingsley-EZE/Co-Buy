import 'package:co_buy/core/error/failures.dart';
import 'package:co_buy/features/pools/data/datasources/pool_payment_data_source.dart';
import 'package:co_buy/features/pools/data/dtos/pool_payment_dto.dart';
import 'package:co_buy/features/pools/data/dtos/pool_payment_request_dto.dart';
import 'package:co_buy/features/pools/data/repositories/pool_payment_repository_impl.dart';
import 'package:co_buy/features/pools/domain/entities/pool_payment.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPoolPaymentDataSource extends Mock implements PoolPaymentDataSource {}

void main() {
  late MockPoolPaymentDataSource remote;
  late PoolPaymentRepositoryImpl repo;

  const request = PoolPaymentRequest(poolId: 'p1', amount: 2000);

  const responseDto = PoolPaymentResponseDto(
    success: true,
    data: PoolPaymentDataDto(
      transaction: PoolPaymentTransactionDto(
        id: 't1',
        poolId: 'p1',
        membershipId: 'm1',
        paymentReference: 'ref-123',
        redirectUrl: 'https://my-merchants-page.com/transaction/confirm',
        // Null until the gateway assigns one — the fixture locks in that the
        // field parses when absent.
        monnifyTransactionReference: null,
        state: 'PENDING',
      ),
      merchantName: 'Co Buy',
      checkoutUrl: 'https://sandbox.monnify.com/checkout/abc123',
    ),
    message: 'Transaction initiated',
  );

  setUpAll(() {
    registerFallbackValue(const PoolPaymentRequestDto(id: 'x', amount: 0));
  });

  setUp(() {
    remote = MockPoolPaymentDataSource();
    repo = PoolPaymentRepositoryImpl(remote);
  });

  test('payForPool sends the pool id and amount and reduces the response to '
      'the checkout urls', () async {
    when(
      () => remote.payForPool(body: any(named: 'body')),
    ).thenAnswer((_) async => responseDto);

    final result = await repo.payForPool(request);

    result.fold((f) => fail('expected Right, got $f'), (payment) {
      expect(
        payment.checkoutUrl,
        'https://sandbox.monnify.com/checkout/abc123',
      );
      expect(payment.merchantName, 'Co Buy');
    });

    final sent =
        verify(
              () => remote.payForPool(body: captureAny(named: 'body')),
            ).captured.single
            as PoolPaymentRequestDto;
    expect(sent.id, 'p1');
    expect(sent.amount, 2000);
  });

  test('payForPool maps a network DioException to a Failure', () async {
    when(() => remote.payForPool(body: any(named: 'body'))).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: '/pools/pay'),
        type: DioExceptionType.connectionTimeout,
      ),
    );

    final result = await repo.payForPool(request);

    expect(result.isLeft(), true);
    result.fold((f) => expect(f, isA<Failure>()), (_) => fail('expected Left'));
  });

  test('payForPool degrades an unexpected error to UnknownFailure', () async {
    when(
      () => remote.payForPool(body: any(named: 'body')),
    ).thenThrow(StateError('boom'));

    final result = await repo.payForPool(request);

    result.fold(
      (f) => expect(f, isA<UnknownFailure>()),
      (_) => fail('expected Left'),
    );
  });
}
