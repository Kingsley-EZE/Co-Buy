part of 'join_pool_bloc.dart';

/// Lifecycle of one async request the join-pool screen depends on.
enum JoinPoolRequestStatus { initial, loading, success, failure }

/// A data class rather than a union: the screen holds several independent
/// async concerns at once (the bank list stays on screen while an account
/// lookup runs), so each gets its own status/value/error slice.
@freezed
abstract class JoinPoolState with _$JoinPoolState {
  const JoinPoolState._();

  const factory JoinPoolState({
    @Default(JoinPoolRequestStatus.initial) JoinPoolRequestStatus banksStatus,

    /// The in-memory bank cache — once loaded, fetch events are no-ops.
    @Default(<Bank>[]) List<Bank> banks,
    String? banksError,

    @Default(JoinPoolRequestStatus.initial)
    JoinPoolRequestStatus accountLookupStatus,

    /// The account resolved by the last name enquiry, cleared when a new
    /// lookup starts so a stale name is never shown against fresh input.
    BankAccount? resolvedAccount,
    String? accountLookupError,

    @Default(JoinPoolRequestStatus.initial) JoinPoolRequestStatus joinStatus,
    String? joinError,
  }) = _JoinPoolState;
}
