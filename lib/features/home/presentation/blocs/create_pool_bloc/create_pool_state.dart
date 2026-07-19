part of 'create_pool_bloc.dart';

/// Lifecycle of one async request the create-pool screen depends on.
enum CreatePoolRequestStatus { initial, loading, success, failure }

/// A data class rather than a union: the screen holds several independent
/// async concerns at once (the bank list stays on screen while an account
/// lookup runs), so each gets its own status/value/error slice.
@freezed
abstract class CreatePoolState with _$CreatePoolState {
  const CreatePoolState._();

  const factory CreatePoolState({
    @Default(CreatePoolRequestStatus.initial)
    CreatePoolRequestStatus banksStatus,

    /// The in-memory bank cache — once loaded, fetch events are no-ops.
    @Default(<Bank>[]) List<Bank> banks,
    String? banksError,

    @Default(CreatePoolRequestStatus.initial)
    CreatePoolRequestStatus categoriesStatus,

    /// The in-memory category cache — once loaded, fetch events are no-ops.
    @Default(<PoolCategory>[]) List<PoolCategory> categories,
    String? categoriesError,

    @Default(CreatePoolRequestStatus.initial)
    CreatePoolRequestStatus accountLookupStatus,

    /// The account resolved by the last name enquiry, cleared when a new
    /// lookup starts so a stale name is never shown against fresh input.
    BankAccount? resolvedAccount,
    String? accountLookupError,

    @Default(CreatePoolRequestStatus.initial)
    CreatePoolRequestStatus createPoolStatus,
    String? createPoolError,
  }) = _CreatePoolState;
}
