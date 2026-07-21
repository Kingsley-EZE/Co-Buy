import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/formatting/app_formatters.dart';
import 'package:co_buy/features/pools/domain/entities/pool_transaction.dart';
import 'package:flutter/material.dart';

/// One row in the pool transactions list: payer, amount, status, and when.
class PoolTransactionTile extends StatelessWidget {
  const PoolTransactionTile({super.key, required this.transaction});

  final PoolTransaction transaction;

  String get _subtitle {
    final when = AppFormatters.timeAgo(
      transaction.paidAt ?? transaction.createdAt,
    );
    return transaction.isPaid ? 'Paid $when' : 'Started $when';
  }

  @override
  Widget build(BuildContext context) {
    final styles = context.styles;
    final name = transaction.memberName.isEmpty
        ? 'Unknown member'
        : transaction.memberName;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s12),
      child: Row(
        children: [
          _InitialsAvatar(initials: transaction.initials),
          const SizedBox(width: AppSpacing.s12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                AppFormatters.naira(transaction.displayAmount),
                style: styles.bodyL.semibold.copyWith(
                  color: context.colors.text.header,
                ),
              ),
              const SizedBox(height: AppSpacing.s4),
              _StatusPill(isPaid: transaction.isPaid),
            ],
          ),
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
        initials.isEmpty ? '?' : initials,
        style: context.styles.bodyL.semibold.copyWith(
          color: AppPalette.primaryBase,
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.isPaid});

  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (
      String label,
      Color background,
      Color foreground,
      Color border,
    ) = isPaid
        ? (
            'Paid',
            colors.state.successLight,
            colors.state.successDark,
            colors.state.successBase,
          )
        : (
            'Pending',
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
