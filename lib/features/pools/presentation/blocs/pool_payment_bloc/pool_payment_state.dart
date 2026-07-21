part of 'pool_payment_bloc.dart';

enum PoolPaymentRequestStatus { initial, loading, success, failure, confirmed }

@freezed
abstract class PoolPaymentState with _$PoolPaymentState {
  const factory PoolPaymentState({
    @Default(PoolPaymentRequestStatus.initial) PoolPaymentRequestStatus status,
    PoolPayment? payment,
    String? error,
  }) = _PoolPaymentState;
}
