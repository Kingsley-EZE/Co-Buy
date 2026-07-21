part of 'create_pool_bloc.dart';

@freezed
sealed class CreatePoolEvent with _$CreatePoolEvent {
  const factory CreatePoolEvent.banksFetchRequested() =
      CreatePoolBanksFetchRequested;

  const factory CreatePoolEvent.categoriesFetchRequested() =
      CreatePoolCategoriesFetchRequested;

  const factory CreatePoolEvent.accountLookupRequested({
    required String accountNumber,
    required String bankCode,
  }) = CreatePoolAccountLookupRequested;

  /// Clears a stale enquiry result when the user edits bank or account number.
  const factory CreatePoolEvent.accountLookupCleared() =
      CreatePoolAccountLookupCleared;

  const factory CreatePoolEvent.submitRequested(CreatePoolRequest request) =
      CreatePoolSubmitRequested;

  /// Clears a previous visit's submission outcome when the form reopens.
  const factory CreatePoolEvent.submitStateCleared() =
      CreatePoolSubmitStateCleared;
}
