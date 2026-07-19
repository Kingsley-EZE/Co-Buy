part of 'create_pool_form_bloc.dart';

/// Maximum length of the optional pool description.
const int kPoolDescriptionMaxLength = 200;

/// Fee taken off the target amount before the beneficiary payout.
const double kPoolFeeRate = 0.02;

/// Categories a pool can belong to. Presentation-only until the pools domain
/// lands with server-driven categories.
enum PoolCategory {
  groceries('Groceries'),
  electronics('Electronics'),
  fashion('Fashion'),
  homeAndKitchen('Home & Kitchen'),
  utilities('Utilities'),
  other('Other');

  const PoolCategory(this.displayName);

  final String displayName;
}

@freezed
abstract class CreatePoolFormState with _$CreatePoolFormState {
  const CreatePoolFormState._();

  const factory CreatePoolFormState({
    @Default('') String title,
    @Default('') String description,
    PoolCategory? category,

    /// Whether every member contributes the same amount. Null renders the
    /// "defaults to Equal slot" hint; treat null as `true` at submission.
    bool? evenContribution,
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
}
