part of 'join_pool_bloc.dart';

@freezed
sealed class JoinPoolEvent with _$JoinPoolEvent {
  /// Loads the bank list, reusing the cached copy when one exists.
  const factory JoinPoolEvent.banksFetchRequested() =
      JoinPoolBanksFetchRequested;

  /// Resolves the contributor's account name for [accountNumber] at the bank
  /// identified by [bankCode].
  const factory JoinPoolEvent.accountLookupRequested({
    required String accountNumber,
    required String bankCode,
  }) = JoinPoolAccountLookupRequested;

  /// Drops any lookup result/error, e.g. when the user edits the account
  /// number or bank so the previous resolution no longer applies.
  const factory JoinPoolEvent.accountLookupCleared() =
      JoinPoolAccountLookupCleared;

  /// Submits [request] to actually join the pool on the server.
  const factory JoinPoolEvent.submitRequested(JoinPoolRequest request) =
      JoinPoolSubmitRequested;

  /// Resets the submission status/error, e.g. when the form is reopened so a
  /// previous visit's outcome doesn't leak into the fresh attempt.
  const factory JoinPoolEvent.submitStateCleared() = JoinPoolSubmitStateCleared;
}
