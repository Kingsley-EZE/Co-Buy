import 'package:equatable/equatable.dart';

/// Everything the server needs to create a pool, as the domain sees it.
class CreatePoolRequest extends Equatable {
  const CreatePoolRequest({
    required this.name,
    this.description,
    required this.categoryId,
    required this.targetAmount,
    required this.maxMembers,
    required this.splitEven,
    required this.memberShareAmount,
    required this.beneficiaryAccountNumber,
    required this.beneficiaryAccountName,
    required this.beneficiaryBankName,
    required this.beneficiaryBankCode,
    required this.deadlineAt,
  });

  final String name;
  final String? description;
  final String categoryId;
  final double targetAmount;
  final int maxMembers;
  final bool splitEven;
  final double memberShareAmount;
  final String beneficiaryAccountNumber;

  /// The holder's name as resolved by the bank name enquiry — never typed by
  /// the user.
  final String beneficiaryAccountName;
  final String beneficiaryBankName;
  final String beneficiaryBankCode;
  final DateTime deadlineAt;

  @override
  List<Object?> get props => [
    name,
    description,
    categoryId,
    targetAmount,
    maxMembers,
    splitEven,
    memberShareAmount,
    beneficiaryAccountNumber,
    beneficiaryAccountName,
    beneficiaryBankName,
    beneficiaryBankCode,
    deadlineAt,
  ];
}
