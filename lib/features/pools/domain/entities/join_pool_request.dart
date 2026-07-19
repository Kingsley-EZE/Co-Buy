import 'package:equatable/equatable.dart';

/// Everything the server needs to join a pool, as the domain sees it: the
/// pool plus the contributor's verified refund account.
class JoinPoolRequest extends Equatable {
  const JoinPoolRequest({
    required this.id,
    required this.bankName,
    required this.bankCode,
    required this.accountNumber,
    required this.accountName,
    required this.memberShareAmount,
  });

  /// The pool being joined.
  final String id;

  final String bankName;
  final String bankCode;
  final String accountNumber;

  /// The holder's name as resolved by the bank name enquiry — never typed by
  /// the user.
  final String accountName;

  /// Zero when the pool doesn't split evenly — the member's amount is chosen
  /// at payment then.
  final double memberShareAmount;

  @override
  List<Object?> get props => [
    id,
    bankName,
    bankCode,
    accountNumber,
    accountName,
    memberShareAmount,
  ];
}
