import 'package:equatable/equatable.dart';

/// A beneficiary account as resolved by the bank name enquiry.
class BankAccount extends Equatable {
  const BankAccount({
    required this.accountNumber,
    required this.accountName,
    required this.bankCode,
  });

  final String accountNumber;
  final String accountName;
  final String bankCode;

  @override
  List<Object?> get props => [accountNumber, accountName, bankCode];
}
