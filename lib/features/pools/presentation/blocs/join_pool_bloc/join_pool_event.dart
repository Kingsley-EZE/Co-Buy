part of 'join_pool_bloc.dart';

@freezed
sealed class JoinPoolEvent with _$JoinPoolEvent {
  const factory JoinPoolEvent.banksFetchRequested() =
      JoinPoolBanksFetchRequested;

  const factory JoinPoolEvent.accountLookupRequested({
    required String accountNumber,
    required String bankCode,
  }) = JoinPoolAccountLookupRequested;

  /// Clears a stale enquiry result when the user edits bank or account number.
  const factory JoinPoolEvent.accountLookupCleared() =
      JoinPoolAccountLookupCleared;

  const factory JoinPoolEvent.submitRequested(JoinPoolRequest request) =
      JoinPoolSubmitRequested;

  /// Clears a previous visit's submission outcome when the form reopens.
  const factory JoinPoolEvent.submitStateCleared() = JoinPoolSubmitStateCleared;
}
