import 'package:equatable/equatable.dart';

class AccountLookupRequest extends Equatable {
  const AccountLookupRequest({
    required this.accountNumber,
    required this.bankCode,
  });

  final String accountNumber;
  final String bankCode;

  @override
  List<Object?> get props => [accountNumber, bankCode];
}
