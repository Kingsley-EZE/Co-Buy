part of 'pool_details_bloc.dart';

enum PoolDetailsRequestStatus { initial, loading, success, failure }

/// A data class rather than a union: details and members load independently,
/// so each gets its own status/value/error slice.
@freezed
abstract class PoolDetailsState with _$PoolDetailsState {
  const PoolDetailsState._();

  const factory PoolDetailsState({
    @Default(PoolDetailsRequestStatus.initial)
    PoolDetailsRequestStatus detailsStatus,
    PoolDetails? details,
    String? detailsError,

    @Default(PoolDetailsRequestStatus.initial)
    PoolDetailsRequestStatus membersStatus,
    @Default(<PoolMember>[]) List<PoolMember> members,
    String? membersError,
  }) = _PoolDetailsState;

  String get membersHeader {
    if (membersStatus != PoolDetailsRequestStatus.success || members.isEmpty) {
      return 'MEMBERS';
    }
    final int paid = members.where((m) => m.hasPaid).length;
    final int openSlots = details?.slotsRemaining ?? 0;
    if (openSlots <= 0 && paid == members.length) return 'MEMBERS – ALL PAID';
    return [
      'MEMBERS',
      '$paid PAID',
      if (openSlots > 0) '$openSlots OPEN SLOTS',
    ].join(' – ');
  }

  /// False while members are still loading so member-only UI never flashes.
  bool isMember(String? userId) {
    if (userId == null) return false;
    if (membersStatus != PoolDetailsRequestStatus.success) return false;
    return members.any((m) => m.userId == userId);
  }

  /// False while members are still loading so the CTA never shows prematurely.
  bool canJoin(String? userId) {
    if (userId == null) return false;
    if (details?.status != PoolStatus.open) return false;
    if (membersStatus != PoolDetailsRequestStatus.success) return false;
    final membership = members.where((m) => m.userId == userId);
    return membership.isEmpty || !membership.first.hasPaid;
  }

  /// Drives "Continue to payment" vs "Join pool" — re-joining would be rejected.
  bool hasUnpaidSlot(String? userId) {
    if (userId == null) return false;
    if (membersStatus != PoolDetailsRequestStatus.success) return false;
    final membership = members.where((m) => m.userId == userId);
    return membership.isNotEmpty && !membership.first.hasPaid;
  }

  /// Filled pools block [canJoin], but existing unpaid members can still pay
  /// before the deadline.
  bool canPayExisting(String? userId) {
    if (userId == null) return false;
    if (membersStatus != PoolDetailsRequestStatus.success) return false;
    final d = details;
    if (d == null) return false;
    if (d.status != PoolStatus.filled) return false;
    if (d.deadlineAt.isBefore(DateTime.now())) return false;
    final membership = members.where((m) => m.userId == userId);
    return membership.isNotEmpty && !membership.first.hasPaid;
  }
}
