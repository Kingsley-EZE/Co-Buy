import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/formatting/app_formatters.dart';
import 'package:co_buy/features/pools/domain/entities/pool_details.dart';
import 'package:flutter/material.dart';

class PoolRaisedCard extends StatelessWidget {
  const PoolRaisedCard({super.key, required this.details});

  final PoolDetails details;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.styles;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.s16),
      decoration: BoxDecoration(
        color: colors.bg.quaternary,
        borderRadius: AppRadius.br16,
        border: Border.all(color: colors.stroke.secondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RAISED SO FAR',
            style: styles.bodyM.semibold.copyWith(color: colors.text.subtle),
          ),
          const SizedBox(height: AppSpacing.s8),
          Text(AppFormatters.naira(details.amountRaised), style: styles.h2),
          const SizedBox(height: AppSpacing.s4),
          Text.rich(
            TextSpan(
              text: 'of ${AppFormatters.naira(details.targetAmount)}',
              style: styles.bodyL.copyWith(color: colors.text.subtle),
              children: [
                TextSpan(
                  text: ' • ${details.fundedPercent}% funded',
                  style: styles.bodyL.semibold.copyWith(
                    color: AppPalette.primaryBase,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.s12),
          Row(
            children: [
              if (details.isFull) ...[
                const _FullBadge(),
                const SizedBox(width: AppSpacing.s8),
              ],
              _SlotsPaidChip(
                paidSlots: details.paidSlots,
                totalSlots: details.maxMembers,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FullBadge extends StatelessWidget {
  const _FullBadge();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s12,
        vertical: AppSpacing.s4,
      ),
      decoration: BoxDecoration(
        color: colors.state.successLight,
        borderRadius: AppRadius.brFull,
        border: Border.all(color: colors.state.successBase),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check,
            size: AppSpacing.s16,
            color: colors.state.successDark,
          ),
          const SizedBox(width: AppSpacing.s4),
          Text(
            'Full',
            style: context.styles.bodyM.copyWith(
              color: colors.state.successDark,
            ),
          ),
        ],
      ),
    );
  }
}

class _SlotsPaidChip extends StatelessWidget {
  const _SlotsPaidChip({required this.paidSlots, required this.totalSlots});

  final int paidSlots;
  final int totalSlots;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s12,
        vertical: AppSpacing.s4,
      ),
      decoration: BoxDecoration(
        color: colors.bg.primary,
        borderRadius: AppRadius.brFull,
        border: Border.all(color: colors.stroke.primary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.person_outline,
            size: AppSpacing.s16,
            color: colors.text.subtle,
          ),
          const SizedBox(width: AppSpacing.s4),
          Text(
            '$paidSlots of $totalSlots slots paid',
            style: context.styles.bodyM.copyWith(color: colors.text.subtle),
          ),
        ],
      ),
    );
  }
}
