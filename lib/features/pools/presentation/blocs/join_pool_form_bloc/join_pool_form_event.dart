part of 'join_pool_form_bloc.dart';

@freezed
sealed class JoinPoolFormEvent with _$JoinPoolFormEvent {
  const factory JoinPoolFormEvent.bankChanged(Bank bank) = JoinPoolBankChanged;

  const factory JoinPoolFormEvent.accountNumberChanged(String accountNumber) =
      JoinPoolAccountNumberChanged;

  /// Mirrored from [JoinPoolBloc] by the page.
  const factory JoinPoolFormEvent.accountLookupResultChanged(
    BankAccount? account,
  ) = JoinPoolAccountLookupResultChanged;
}
