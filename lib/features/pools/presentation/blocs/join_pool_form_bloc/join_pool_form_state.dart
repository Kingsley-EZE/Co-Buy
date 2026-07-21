part of 'join_pool_form_bloc.dart';

@freezed
abstract class JoinPoolFormState with _$JoinPoolFormState {
  const JoinPoolFormState._();

  const factory JoinPoolFormState({
    Bank? bank,
    @Default('') String accountNumber,

    /// Mirrored from [JoinPoolBloc] by the page for [canSubmit].
    BankAccount? resolvedAccount,
  }) = _JoinPoolFormState;

  String? get accountNumberError => AppValidators.accountNumber(accountNumber);

  bool get canLookupAccount => bank != null && accountNumberError == null;

  /// Guards the gap before a cleared/re-resolved enquiry round-trips.
  bool get accountVerified =>
      resolvedAccount != null &&
      resolvedAccount!.accountNumber == accountNumber &&
      resolvedAccount!.bankCode == bank?.code;

  bool get canSubmit =>
      bank != null && accountNumberError == null && accountVerified;
}
