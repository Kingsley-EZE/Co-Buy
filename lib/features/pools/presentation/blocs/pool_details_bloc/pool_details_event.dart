part of 'pool_details_bloc.dart';

@freezed
sealed class PoolDetailsEvent with _$PoolDetailsEvent {
  /// Loads (or reloads) both the pool and its members; also dispatched by
  /// the retry buttons.
  const factory PoolDetailsEvent.fetchRequested(String poolId) =
      PoolDetailsFetchRequested;
}
