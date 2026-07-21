part of 'pools_bloc.dart';

@freezed
sealed class PoolsEvent with _$PoolsEvent {
  const factory PoolsEvent.fetchRequested() = PoolsFetchRequested;

  const factory PoolsEvent.filterChanged(PoolFilter filter) =
      PoolsFilterChanged;

  const factory PoolsEvent.socketStarted() = PoolsSocketStarted;

  /// Silent background refetch when the socket pushes a pool:update.
  const factory PoolsEvent.socketUpdateReceived() = PoolsSocketUpdateReceived;
}
