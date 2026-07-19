import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/pool.dart';
import '../../../home/domain/entities/pool_category.dart';

/// Everything the pool details screen shows for a single pool (members come
/// separately from their own endpoint — see PoolMember).
class PoolDetails extends Equatable {
  const PoolDetails({
    required this.id,
    required this.name,
    required this.description,
    required this.leaderId,
    required this.category,
    required this.targetAmount,
    required this.amountRaised,
    required this.amountPerSlot,
    required this.maxMembers,
    required this.splitEven,
    required this.beneficiaryAccountName,
    required this.beneficiaryBankName,
    required this.beneficiaryAccountNumber,
    required this.shareLink,
    required this.deadlineAt,
    required this.status,
    required this.slotsRemaining,
  });

  final String id;
  final String name;
  final String? description;

  /// Used to mark the leader in the members list (members carry a userId).
  final String leaderId;

  /// Null when the server omits the expanded category object.
  final PoolCategory? category;

  final double targetAmount;
  final double amountRaised;

  /// Zero when the pool doesn't split the target evenly across members
  /// ([splitEven] false) — there is no fixed slot price to display then.
  final double amountPerSlot;

  final int maxMembers;
  final bool splitEven;
  final String beneficiaryAccountName;
  final String beneficiaryBankName;
  final String beneficiaryAccountNumber;
  final String shareLink;
  final DateTime deadlineAt;
  final PoolStatus status;
  final int slotsRemaining;

  /// Short reference for the meta line ("pool #156d36f4") — the first UUID
  /// segment; the API has no separate human-readable code.
  String get shortCode => id.split('-').first;

  int get paidSlots => (maxMembers - slotsRemaining).clamp(0, maxMembers);

  bool get isFull =>
      slotsRemaining <= 0 ||
      status == PoolStatus.filled ||
      status == PoolStatus.funded;

  /// Whole-number funding percentage, clamped so over-payment never reads
  /// above 100%.
  int get fundedPercent => targetAmount <= 0
      ? 0
      : (amountRaised / targetAmount * 100).clamp(0, 100).round();

  /// Only the last four digits are ever shown ("****9987").
  String get maskedAccountNumber => beneficiaryAccountNumber.length <= 4
      ? beneficiaryAccountNumber
      : '****${beneficiaryAccountNumber.substring(beneficiaryAccountNumber.length - 4)}';

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    leaderId,
    category,
    targetAmount,
    amountRaised,
    amountPerSlot,
    maxMembers,
    splitEven,
    beneficiaryAccountName,
    beneficiaryBankName,
    beneficiaryAccountNumber,
    shareLink,
    deadlineAt,
    status,
    slotsRemaining,
  ];
}
