part of 'create_pool_bloc.dart';

enum CreatePoolRequestStatus { initial, loading, success, failure }

/// A data class rather than a union: independent async slices (banks, lookup, submit).
@freezed
abstract class CreatePoolState with _$CreatePoolState {
  const CreatePoolState._();

  const factory CreatePoolState({
    @Default(CreatePoolRequestStatus.initial)
    CreatePoolRequestStatus banksStatus,

    @Default(<Bank>[]) List<Bank> banks,
    String? banksError,

    @Default(CreatePoolRequestStatus.initial)
    CreatePoolRequestStatus categoriesStatus,

    @Default(<PoolCategory>[]) List<PoolCategory> categories,
    String? categoriesError,

    @Default(CreatePoolRequestStatus.initial)
    CreatePoolRequestStatus accountLookupStatus,

    /// Cleared when a new lookup starts so a stale name isn't shown.
    BankAccount? resolvedAccount,
    String? accountLookupError,

    @Default(CreatePoolRequestStatus.initial)
    CreatePoolRequestStatus createPoolStatus,
    String? createPoolError,
  }) = _CreatePoolState;
}
