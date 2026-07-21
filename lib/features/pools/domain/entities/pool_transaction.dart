import 'package:equatable/equatable.dart';

/// Settlement state of one pool payment attempt; unknown server states
/// degrade to [pending] so a new state never shows as paid.
enum PoolTransactionState { paid, pending }

/// One payment attempt on a pool's transaction history.
class PoolTransaction extends Equatable {
  const PoolTransaction({
    required this.id,
    required this.poolId,
    required this.membershipId,
    required this.paymentReference,
    required this.amountExpected,
    required this.amountPaid,
    required this.state,
    required this.paidAt,
    required this.createdAt,
    required this.memberName,
    required this.memberUserId,
  });

  final String id;
  final String poolId;
  final String membershipId;
  final String paymentReference;
  final double amountExpected;

  /// Null while the payment is still pending.
  final double? amountPaid;
  final PoolTransactionState state;

  /// Null until the payment settles.
  final DateTime? paidAt;
  final DateTime createdAt;
  final String memberName;
  final String memberUserId;

  bool get isPaid => state == PoolTransactionState.paid;

  /// Amount to show in the list: settled amount when paid, otherwise the
  /// expected slot amount.
  double get displayAmount => amountPaid ?? amountExpected;

  String get initials {
    final parts = memberName.split(' ').where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '';
    final first = parts.first[0];
    final last = parts.length > 1 ? parts.last[0] : '';
    return '$first$last'.toUpperCase();
  }

  @override
  List<Object?> get props => [
    id,
    poolId,
    membershipId,
    paymentReference,
    amountExpected,
    amountPaid,
    state,
    paidAt,
    createdAt,
    memberName,
    memberUserId,
  ];
}
