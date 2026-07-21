part of 'pool_payment_bloc.dart';

@freezed
sealed class PoolPaymentEvent with _$PoolPaymentEvent {
  /// Initiate a payment for the pool in [request].
  const factory PoolPaymentEvent.payRequested(PoolPaymentRequest request) =
      PoolPaymentPayRequested;

  /// Drop the previous attempt's outcome once it has been handled, so the
  /// next attempt starts from a clean initial state.
  const factory PoolPaymentEvent.stateCleared() = PoolPaymentStateCleared;

  /// Internal: the socket confirmed that this payment settled server-side.
  const factory PoolPaymentEvent.socketConfirmed() = PoolPaymentSocketConfirmed;
}
