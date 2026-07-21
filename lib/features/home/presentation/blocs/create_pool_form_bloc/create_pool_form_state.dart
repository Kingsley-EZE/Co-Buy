part of 'create_pool_form_bloc.dart';

const int kPoolDescriptionMaxLength = 200;

/// Fee taken off the target amount before the beneficiary payout.
const double kPoolFeeRate = 0.02;

@freezed
abstract class CreatePoolFormState with _$CreatePoolFormState {
  const CreatePoolFormState._();

  const factory CreatePoolFormState({
    @Default('') String title,
    @Default('') String description,

    PoolCategory? category,

    @Default(true) bool evenContribution,
    @Default('') String targetAmount,
    @Default('') String slots,
    DateTime? deadline,

    Bank? bank,
    @Default('') String accountNumber,

    /// Mirrored from [CreatePoolBloc] by the page for [canSubmit].
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

  bool get canLookupAccount => bank != null && accountNumberError == null;

  double? get recipientReceivesAmount {
    final double? amount = double.tryParse(targetAmount);
    if (amount == null || amount <= 0) return null;
    return amount * (1 - kPoolFeeRate);
  }

  double? get platformFeeAmount {
    final double? amount = double.tryParse(targetAmount);
    if (amount == null || amount <= 0) return null;
    return amount * kPoolFeeRate;
  }

  /// Guards the gap before a cleared/re-resolved enquiry round-trips.
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

  /// Only call once [canSubmit] is true — non-null assertions rely on it.
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
      // Uneven pools: memberShareAmount 0 — amount chosen at payment.
      memberShareAmount: splitEven ? amount / members : 0,
      beneficiaryAccountNumber: accountNumber,
      beneficiaryAccountName: resolvedAccount!.accountName,
      beneficiaryBankName: bank!.name,
      beneficiaryBankCode: bank!.code,
      deadlineAt: deadline!,
    );
  }
}
