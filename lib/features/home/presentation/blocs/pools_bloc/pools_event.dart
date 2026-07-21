part of 'pools_bloc.dart';

@freezed
sealed class PoolsEvent with _$PoolsEvent {
  /// Loads (or reloads) the feed for the current filter; also dispatched by
  /// the retry button.
  const factory PoolsEvent.fetchRequested() = PoolsFetchRequested;

  /// Switches the feed to [filter] and refetches server-side.
  const factory PoolsEvent.filterChanged(PoolFilter filter) =
      PoolsFilterChanged;

  /// Starts real-time updates via WebSocket. Call once after fetchRequested.
  const factory PoolsEvent.socketStarted() = PoolsSocketStarted;

  /// Internal: the socket pushed a pool:update — triggers a silent background
  /// refetch of the current filtered feed.
  const factory PoolsEvent.socketUpdateReceived() = PoolsSocketUpdateReceived;
}
