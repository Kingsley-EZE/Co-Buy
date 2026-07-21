import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/formatting/app_formatters.dart';
import 'package:co_buy/features/pools/domain/entities/pool_member.dart';
import 'package:flutter/material.dart';

/// [slotNumber] and [isLeader] are derived by the page — the members API
/// carries neither.
class PoolMemberTile extends StatelessWidget {
  const PoolMemberTile({
    super.key,
    required this.member,
    required this.slotNumber,
    required this.isLeader,
  });

  final PoolMember member;
  final int slotNumber;
  final bool isLeader;

  String get _subtitle {
    final slot = 'Slot $slotNumber';
    if (isLeader) return '$slot • Leader';
    final when = AppFormatters.timeAgo(member.joinedAt);
    return member.hasPaid ? '$slot • Paid $when' : '$slot • Joined $when';
  }

  @override
  Widget build(BuildContext context) {
    final styles = context.styles;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s12),
      child: Row(
        children: [
          _InitialsAvatar(initials: member.initials),
          const SizedBox(width: AppSpacing.s12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: styles.bodyL.semibold.copyWith(
                    color: context.colors.text.header,
                  ),
                ),
                const SizedBox(height: AppSpacing.s2),
                Text(
                  _subtitle,
                  style: styles.bodyM.copyWith(
                    color: context.colors.text.subtle,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.s12),
          _StatusPill(hasPaid: member.hasPaid),
        ],
      ),
    );
  }
}

class _InitialsAvatar extends StatelessWidget {
  const _InitialsAvatar({required this.initials});

  final String initials;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.s48,
      height: AppSpacing.s48,
      decoration: const BoxDecoration(
        color: AppPalette.primaryLighter,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: context.styles.bodyL.semibold.copyWith(
          color: AppPalette.primaryBase,
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.hasPaid});

  final bool hasPaid;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (
      String label,
      Color background,
      Color foreground,
      Color border,
    ) = hasPaid
        ? (
            'Paid',
            colors.state.successLight,
            colors.state.successDark,
            colors.state.successBase,
          )
        : (
            'Awaiting payment',
            colors.state.warningLight,
            colors.state.warningDark,
            colors.state.warningBase,
          );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s12,
        vertical: AppSpacing.s4,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: AppRadius.brFull,
        border: Border.all(color: border),
      ),
      child: Text(
        label,
        style: context.styles.bodyM.copyWith(color: foreground),
      ),
    );
  }
}
