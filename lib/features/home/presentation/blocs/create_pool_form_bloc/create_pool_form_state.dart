part of 'create_pool_form_bloc.dart';

/// Maximum length of the optional pool description.
const int kPoolDescriptionMaxLength = 200;

/// Fee taken off the target amount before the beneficiary payout.
const double kPoolFeeRate = 0.02;

@freezed
abstract class CreatePoolFormState with _$CreatePoolFormState {
  const CreatePoolFormState._();

  const factory CreatePoolFormState({
    @Default('') String title,
    @Default('') String description,

    /// The whole entity (not just a display name) so the category id is on
    /// hand for submission.
    PoolCategory? category,

    /// Whether every member contributes the same amount. Defaults to `true`
    /// (equal slots) — the form no longer exposes a control to change it.
    @Default(true) bool evenContribution,
    @Default('') String targetAmount,
    @Default('') String slots,
    DateTime? deadline,

    /// The whole entity (not just a display name) so the bank code is on hand
    /// for the account name enquiry and submission.
    Bank? bank,
    @Default('') String accountNumber,

    /// The account the bank name enquiry resolved, mirrored in from
    /// [CreatePoolBloc] by the page so [canSubmit] can require verification.
    BankAccount? resolvedAccount,
  }) = _CreatePoolFormState;

  String? get titleError => AppValidators.required(
    title,
    message: 'Tell people what this pool is for',
  );

  String? get targetAmountError => AppValidators.positiveNumber(
    targetAmount,
    message: 'Enter a target amount',
  );

  String? get slotsError =>
      AppValidators.positiveNumber(slots, message: 'Enter the number of slots');

  String? get accountNumberError => AppValidators.accountNumber(accountNumber);

  /// Both enquiry inputs are ready: a bank is chosen and the account number
  /// is a valid 10-digit value. The page listens for this to fire the lookup.
  bool get canLookupAccount => bank != null && accountNumberError == null;

  /// What the beneficiary is actually paid: the target amount minus
  /// [kPoolFeeRate]. Null until a valid target amount is entered.
  double? get recipientReceivesAmount {
    final double? amount = double.tryParse(targetAmount);
    if (amount == null || amount <= 0) return null;
    return amount * (1 - kPoolFeeRate);
  }

  /// The [kPoolFeeRate] cut of the target amount. Null until a valid target
  /// amount is entered.
  double? get platformFeeAmount {
    final double? amount = double.tryParse(targetAmount);
    if (amount == null || amount <= 0) return null;
    return amount * kPoolFeeRate;
  }

  /// The enquiry result applies to what's currently typed — guards the gap
  /// where inputs changed but the cleared/re-resolved result hasn't
  /// round-tripped through [CreatePoolBloc] yet.
  bool get accountVerified =>
      resolvedAccount != null &&
      resolvedAccount!.accountNumber == accountNumber &&
      resolvedAccount!.bankCode == bank?.code;

  bool get canSubmit =>
      titleError == null &&
      category != null &&
      targetAmountError == null &&
      slotsError == null &&
      deadline != null &&
      bank != null &&
      accountNumberError == null &&
      accountVerified;

  /// The submission payload derived from the current inputs. Only call once
  /// [canSubmit] is true — the non-null assertions rely on it.
  CreatePoolRequest toCreatePoolRequest() {
    final double amount = double.parse(targetAmount);
    final int members = int.parse(slots);
    final bool splitEven = evenContribution;

    return CreatePoolRequest(
      name: title,
      description: description.isEmpty ? null : description,
      categoryId: category!.id,
      targetAmount: amount,
      maxMembers: members,
      splitEven: splitEven,
      // The form only collects per-member shares for an even split; uneven
      // pools let each member pick their own amount, so no share is sent.
      memberShareAmount: splitEven ? amount / members : 0,
      beneficiaryAccountNumber: accountNumber,
      // canSubmit implies accountVerified, so the resolved account is the
      // enquiry result for exactly this account number and bank.
      beneficiaryAccountName: resolvedAccount!.accountName,
      beneficiaryBankName: bank!.name,
      beneficiaryBankCode: bank!.code,
      deadlineAt: deadline!,
    );
  }
}
