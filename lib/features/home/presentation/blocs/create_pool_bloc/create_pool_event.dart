part of 'create_pool_bloc.dart';

@freezed
sealed class CreatePoolEvent with _$CreatePoolEvent {
  /// Loads the bank list, reusing the cached copy when one exists.
  const factory CreatePoolEvent.banksFetchRequested() =
      CreatePoolBanksFetchRequested;

  /// Loads the pool categories, reusing the cached copy when one exists.
  const factory CreatePoolEvent.categoriesFetchRequested() =
      CreatePoolCategoriesFetchRequested;

  /// Resolves the beneficiary account name for [accountNumber] at the bank
  /// identified by [bankCode].
  const factory CreatePoolEvent.accountLookupRequested({
    required String accountNumber,
    required String bankCode,
  }) = CreatePoolAccountLookupRequested;

  /// Drops any lookup result/error, e.g. when the user edits the account
  /// number or bank so the previous resolution no longer applies.
  const factory CreatePoolEvent.accountLookupCleared() =
      CreatePoolAccountLookupCleared;

  /// Submits [request] to actually create the pool on the server.
  const factory CreatePoolEvent.submitRequested(CreatePoolRequest request) =
      CreatePoolSubmitRequested;

  /// Resets the submission status/error, e.g. when the form is reopened so a
  /// previous visit's outcome doesn't leak into the fresh attempt.
  const factory CreatePoolEvent.submitStateCleared() =
      CreatePoolSubmitStateCleared;
}
