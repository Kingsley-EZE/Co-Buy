import 'package:co_buy/core/design_system/design_system.dart';
import 'package:flutter/material.dart';

/// The green confirmation card from the join-pool designs: the resolved
/// account name alongside the selected bank, marking the name enquiry as
/// verified. Shown under the form's account field and again on the review
/// sheet.
class AccountVerifiedCard extends StatelessWidget {
  const AccountVerifiedCard({
    super.key,
    required this.accountName,
    this.bankName,
  });

  final String accountName;

  /// Appended after a bullet when known ("Golden Harvest Foods • GT Bank").
  final String? bankName;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.styles;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.s16),
      decoration: BoxDecoration(
        color: colors.state.successLight,
        borderRadius: AppRadius.br12,
        border: Border.all(color: colors.state.successBase),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: AppSpacing.s24,
            color: colors.state.successBase,
          ),
          const SizedBox(width: AppSpacing.s12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Account Name Verified', style: styles.bodyL.semibold),
                const SizedBox(height: AppSpacing.s4),
                Text(
                  [accountName, ?bankName].join(' • '),
                  style: styles.bodyM.copyWith(color: colors.text.subtle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
