part of 'pool_details_bloc.dart';

@freezed
sealed class PoolDetailsEvent with _$PoolDetailsEvent {
  /// Loads (or reloads) both the pool and its members; also dispatched by
  /// the retry buttons.
  const factory PoolDetailsEvent.fetchRequested(String poolId) =
      PoolDetailsFetchRequested;

  /// Starts real-time updates for [poolId] via WebSocket. Call once after
  /// fetchRequested so the screen stays in sync without polling.
  const factory PoolDetailsEvent.socketStarted(String poolId) =
      PoolDetailsSocketStarted;

  /// Internal: the socket pushed a pool:update for this pool — triggers a
  /// silent background refetch of both details and members.
  const factory PoolDetailsEvent.socketUpdateReceived() =
      PoolDetailsSocketUpdateReceived;
}
