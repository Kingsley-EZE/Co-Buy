import 'package:equatable/equatable.dart';

/// Payment state of one member's slot; unknown server states degrade to
/// [pending] so a new state never shows a member as paid.
enum PoolMemberState { paid, pending }

/// One participant on the pool details screen. Slot numbers aren't part of
/// the API — the screen derives them from list order.
class PoolMember extends Equatable {
  const PoolMember({
    required this.id,
    required this.userId,
    required this.name,
    required this.state,
    required this.joinedAt,
    required this.avatarUrl,
  });

  final String id;
  final String userId;
  final String name;
  final PoolMemberState state;
  final DateTime joinedAt;
  final String? avatarUrl;

  bool get hasPaid => state == PoolMemberState.paid;

  String get initials {
    final parts = name.split(' ').where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '';
    final first = parts.first[0];
    final last = parts.length > 1 ? parts.last[0] : '';
    return '$first$last'.toUpperCase();
  }

  @override
  List<Object?> get props => [id, userId, name, state, joinedAt, avatarUrl];
}
