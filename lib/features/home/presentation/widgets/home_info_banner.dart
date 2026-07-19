import 'package:co_buy/core/design_system/design_system.dart';
import 'package:flutter/material.dart';

/// Warning-tinted notice above the pool feed reminding users of the
/// automatic-refund guarantee.
class HomeInfoBanner extends StatelessWidget {
  const HomeInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.s16),
      decoration: BoxDecoration(
        color: colors.state.warningLight,
        borderRadius: AppRadius.br12,
        border: Border.all(color: colors.state.warningBase),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.error_outline,
            size: AppSpacing.s20,
            color: colors.state.warningDark,
          ),
          const SizedBox(width: AppSpacing.s12),
          Expanded(
            child: Text(
              "Every pool must be filled, if it doesn't, all contributors "
              'are refunded automatically.',
              style: context.styles.bodyM.copyWith(
                color: colors.state.warningDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
