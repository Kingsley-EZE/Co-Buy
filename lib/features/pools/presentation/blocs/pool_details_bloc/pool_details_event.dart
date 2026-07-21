part of 'pool_details_bloc.dart';

@freezed
sealed class PoolDetailsEvent with _$PoolDetailsEvent {
  const factory PoolDetailsEvent.fetchRequested(String poolId) =
      PoolDetailsFetchRequested;

  const factory PoolDetailsEvent.socketStarted(String poolId) =
      PoolDetailsSocketStarted;

  /// Silent background refetch when the socket pushes a pool:update.
  const factory PoolDetailsEvent.socketUpdateReceived() =
      PoolDetailsSocketUpdateReceived;
}
