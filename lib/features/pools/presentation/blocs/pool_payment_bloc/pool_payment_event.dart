part of 'pool_payment_bloc.dart';

@freezed
sealed class PoolPaymentEvent with _$PoolPaymentEvent {
  const factory PoolPaymentEvent.payRequested(PoolPaymentRequest request) =
      PoolPaymentPayRequested;

  /// Clears the handled attempt so the next pay starts from initial.
  const factory PoolPaymentEvent.stateCleared() = PoolPaymentStateCleared;

  /// Socket confirmed server-side settlement — details page pops checkout.
  const factory PoolPaymentEvent.socketConfirmed() = PoolPaymentSocketConfirmed;
}
