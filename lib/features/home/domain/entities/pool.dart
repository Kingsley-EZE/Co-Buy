import 'package:equatable/equatable.dart';

import 'pool_category.dart';

/// Lifecycle of a pool as reported by the server.
enum PoolStatus { open, filled, funded, expired }

/// A group-buying pool as shown on the home feed.
class Pool extends Equatable {
  const Pool({
    required this.id,
    required this.name,
    required this.description,
    required this.leaderFirstName,
    required this.leaderLastName,
    required this.category,
    required this.targetAmount,
    required this.amountRaised,
    required this.amountPerSlot,
    required this.maxMembers,
    required this.splitEven,
    required this.beneficiaryAccountName,
    required this.beneficiaryBankName,
    required this.shareLink,
    required this.deadlineAt,
    required this.status,
    required this.slotsRemaining,
  });

  final String id;
  final String name;
  final String? description;

  /// Null when the server omits the expanded leader object.
  final String? leaderFirstName;
  final String? leaderLastName;

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
  final String shareLink;
  final DateTime deadlineAt;
  final PoolStatus status;
  final int slotsRemaining;

  int get filledSlots => (maxMembers - slotsRemaining).clamp(0, maxMembers);

  /// Funding fraction for the progress bar, clamped so an over-raised pool
  /// can never overflow the track. Falls back to slot fill for a defensive
  /// zero target.
  double get progress {
    if (targetAmount > 0) return (amountRaised / targetAmount).clamp(0.0, 1.0);
    return maxMembers == 0 ? 0 : (filledSlots / maxMembers).clamp(0.0, 1.0);
  }

  /// "Mary S." — first name plus last initial, matching the card design;
  /// falls back to the beneficiary when the leader wasn't expanded.
  String get leaderDisplayName {
    final first = leaderFirstName ?? '';
    final last = leaderLastName ?? '';
    if (first.isEmpty) return beneficiaryDisplayName;
    return last.isEmpty ? first : '$first ${last[0].toUpperCase()}.';
  }

  /// The payout account name arrives shouty-caps from the bank rails
  /// ("KINGSLEY NWABUEZE UGWUTA") — title-case it for display.
  String get beneficiaryDisplayName => beneficiaryAccountName
      .toLowerCase()
      .split(' ')
      .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
      .join(' ');

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    leaderFirstName,
    leaderLastName,
    category,
    targetAmount,
    amountRaised,
    amountPerSlot,
    maxMembers,
    splitEven,
    beneficiaryAccountName,
    beneficiaryBankName,
    shareLink,
    deadlineAt,
    status,
    slotsRemaining,
  ];
}
