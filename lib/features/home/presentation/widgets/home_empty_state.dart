import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeEmptyState extends StatelessWidget {
  const HomeEmptyState({super.key, required this.onStartPool});

  final VoidCallback onStartPool;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.images.imgEmptyPool.image(width: 120),
        const SizedBox(height: AppSpacing.s24),
        Text(
          'Be the first to start one',
          style: context.styles.h5,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.s8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s32),
          child: Text(
            'Join the people around you and pool towards a certain goal.',
            style: context.styles.bodyL,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: AppSpacing.s24),
        AppButton(
          label: 'Start a pool',
          variant: AppButtonVariant.outline,
          size: AppButtonSize.medium,
          expanded: false,
          onPressed: onStartPool,
        ),
      ],
    );
  }
}
