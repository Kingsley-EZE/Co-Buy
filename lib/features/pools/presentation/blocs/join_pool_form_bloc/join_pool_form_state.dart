part of 'join_pool_form_bloc.dart';

@freezed
abstract class JoinPoolFormState with _$JoinPoolFormState {
  const JoinPoolFormState._();

  const factory JoinPoolFormState({
    /// The whole entity (not just a display name) so the bank code is on hand
    /// for the account name enquiry and submission.
    Bank? bank,
    @Default('') String accountNumber,

    /// The account the bank name enquiry resolved, mirrored in from
    /// [JoinPoolBloc] by the page so [canSubmit] can require verification.
    BankAccount? resolvedAccount,
  }) = _JoinPoolFormState;

  String? get accountNumberError => AppValidators.accountNumber(accountNumber);

  /// Both enquiry inputs are ready: a bank is chosen and the account number
  /// is a valid 10-digit value. The page listens for this to fire the lookup.
  bool get canLookupAccount => bank != null && accountNumberError == null;

  /// The enquiry result applies to what's currently typed — guards the gap
  /// where inputs changed but the cleared/re-resolved result hasn't
  /// round-tripped through [JoinPoolBloc] yet.
  bool get accountVerified =>
      resolvedAccount != null &&
      resolvedAccount!.accountNumber == accountNumber &&
      resolvedAccount!.bankCode == bank?.code;

  bool get canSubmit =>
      bank != null && accountNumberError == null && accountVerified;
}
