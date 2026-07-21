part of 'join_pool_bloc.dart';

enum JoinPoolRequestStatus { initial, loading, success, failure }

/// A data class rather than a union: independent async slices (banks, lookup, join).
@freezed
abstract class JoinPoolState with _$JoinPoolState {
  const JoinPoolState._();

  const factory JoinPoolState({
    @Default(JoinPoolRequestStatus.initial) JoinPoolRequestStatus banksStatus,

    @Default(<Bank>[]) List<Bank> banks,
    String? banksError,

    @Default(JoinPoolRequestStatus.initial)
    JoinPoolRequestStatus accountLookupStatus,

    /// Cleared when a new lookup starts so a stale name isn't shown.
    BankAccount? resolvedAccount,
    String? accountLookupError,

    @Default(JoinPoolRequestStatus.initial) JoinPoolRequestStatus joinStatus,
    String? joinError,
  }) = _JoinPoolState;
}
