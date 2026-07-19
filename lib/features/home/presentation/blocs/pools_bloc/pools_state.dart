part of 'pools_bloc.dart';

/// Lifecycle of the feed request.
enum PoolsRequestStatus { initial, loading, success, failure }

/// Status filters for the home pool feed, in display order. Owned by the
/// bloc (not the chips widget) because filtering happens server-side: the
/// selection drives fetches and must survive reloads.
enum PoolFilter {
  all('All', null),
  open('Open', PoolStatus.open),
  filled('Filled', PoolStatus.filled),
  funded('Funded', PoolStatus.funded),
  expired('Expired', PoolStatus.expired);

  const PoolFilter(this.label, this.status);

  final String label;

  /// The status sent to the API; null means no `status` query param ("All").
  final PoolStatus? status;
}

/// A data class rather than a union: [filter] and the previously loaded
/// [pools] must survive a reload, so the chips stay in place while a
/// filtered fetch is in flight.
@freezed
abstract class PoolsState with _$PoolsState {
  const factory PoolsState({
    @Default(PoolsRequestStatus.initial) PoolsRequestStatus status,
    @Default(<Pool>[]) List<Pool> pools,
    String? error,
    @Default(PoolFilter.all) PoolFilter filter,
  }) = _PoolsState;
}
