part of 'pool_details_bloc.dart';

/// Lifecycle of one async request the details screen depends on.
enum PoolDetailsRequestStatus { initial, loading, success, failure }

/// A data class rather than a union: the screen holds two independent async
/// concerns at once (the pool renders while members are still loading), so
/// each gets its own status/value/error slice.
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

  /// Members section title: "MEMBERS – ALL PAID" once the pool is full and
  /// every member has paid, otherwise the live tallies
  /// ("MEMBERS – 8 PAID – 2 OPEN SLOTS", dropping the slots part when none
  /// are open). Plain "MEMBERS" until the list has loaded.
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

  /// Whether [userId] may join this pool: the pool must be OPEN and the
  /// user must either not hold a slot yet or hold one they haven't paid
  /// for. False while members are still loading (or without a session) so
  /// the CTA never shows on incomplete information.
  bool canJoin(String? userId) {
    if (userId == null) return false;
    if (details?.status != PoolStatus.open) return false;
    if (membersStatus != PoolDetailsRequestStatus.success) return false;
    final membership = members.where((m) => m.userId == userId);
    return membership.isEmpty || !membership.first.hasPaid;
  }

  /// Whether [userId] already holds a slot they haven't paid for — the CTA
  /// reads "Continue to payment" instead of "Join pool" then, since joining
  /// again would be rejected by the server.
  bool hasUnpaidSlot(String? userId) {
    if (userId == null) return false;
    if (membersStatus != PoolDetailsRequestStatus.success) return false;
    final membership = members.where((m) => m.userId == userId);
    return membership.isNotEmpty && !membership.first.hasPaid;
  }
}
