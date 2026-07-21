part of 'pool_payment_bloc.dart';

/// Lifecycle of the payment-initiation request.
enum PoolPaymentRequestStatus { initial, loading, success, failure, confirmed }

@freezed
abstract class PoolPaymentState with _$PoolPaymentState {
  const factory PoolPaymentState({
    @Default(PoolPaymentRequestStatus.initial) PoolPaymentRequestStatus status,

    /// The initiated payment — set exactly while [status] is success.
    PoolPayment? payment,
    String? error,
  }) = _PoolPaymentState;
}
