part of 'create_pool_bloc.dart';

@freezed
sealed class CreatePoolEvent with _$CreatePoolEvent {
  /// Loads the bank list, reusing the cached copy when one exists.
  const factory CreatePoolEvent.banksFetchRequested() =
      CreatePoolBanksFetchRequested;

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
}
