part of 'pools_bloc.dart';

enum PoolsRequestStatus { initial, loading, success, failure }

/// Owned by the bloc (not the chips widget) because filtering is server-side.
enum PoolFilter {
  all('All', null),
  open('Open', PoolStatus.open),
  filled('Filled', PoolStatus.filled),
  funded('Funded', PoolStatus.funded),
  expired('Expired', PoolStatus.expired);

  const PoolFilter(this.label, this.status);

  final String label;
  final PoolStatus? status;
}

/// A data class rather than a union: [filter] and [pools] survive reloads.
@freezed
abstract class PoolsState with _$PoolsState {
  const factory PoolsState({
    @Default(PoolsRequestStatus.initial) PoolsRequestStatus status,
    @Default(<Pool>[]) List<Pool> pools,
    String? error,
    @Default(PoolFilter.all) PoolFilter filter,
  }) = _PoolsState;
}
