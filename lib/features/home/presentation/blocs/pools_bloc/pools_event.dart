part of 'pools_bloc.dart';

@freezed
sealed class PoolsEvent with _$PoolsEvent {
  /// Loads (or reloads) the feed for the current filter; also dispatched by
  /// the retry button.
  const factory PoolsEvent.fetchRequested() = PoolsFetchRequested;

  /// Switches the feed to [filter] and refetches server-side.
  const factory PoolsEvent.filterChanged(PoolFilter filter) =
      PoolsFilterChanged;
}
