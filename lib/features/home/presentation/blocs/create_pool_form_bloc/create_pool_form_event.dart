part of 'create_pool_form_bloc.dart';

@freezed
sealed class CreatePoolFormEvent with _$CreatePoolFormEvent {
  const factory CreatePoolFormEvent.titleChanged(String title) =
      CreatePoolTitleChanged;

  const factory CreatePoolFormEvent.descriptionChanged(String description) =
      CreatePoolDescriptionChanged;

  const factory CreatePoolFormEvent.categoryChanged(PoolCategory category) =
      CreatePoolCategoryChanged;

  const factory CreatePoolFormEvent.targetAmountChanged(String amount) =
      CreatePoolTargetAmountChanged;

  const factory CreatePoolFormEvent.slotsChanged(String slots) =
      CreatePoolSlotsChanged;

  const factory CreatePoolFormEvent.deadlineChanged(DateTime deadline) =
      CreatePoolDeadlineChanged;

  const factory CreatePoolFormEvent.bankChanged(Bank bank) =
      CreatePoolBankChanged;

  const factory CreatePoolFormEvent.accountNumberChanged(String accountNumber) =
      CreatePoolAccountNumberChanged;

  /// The bank name enquiry produced [account] (or was cleared when null),
  /// mirrored in from [CreatePoolBloc] by the page.
  const factory CreatePoolFormEvent.accountLookupResultChanged(
    BankAccount? account,
  ) = CreatePoolAccountLookupResultChanged;
}
