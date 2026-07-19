import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

/// Circular outlined close button for bottom sheet headers.
class AppSheetCloseButton extends StatelessWidget {
  const AppSheetCloseButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;

    return Material(
      color: Colors.transparent,
      shape: CircleBorder(side: BorderSide(color: colors.stroke.secondary)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(
          dimension: AppSpacing.s40,
          child: Center(
            child: Assets.icons.icClose.svg(
              width: AppSpacing.s20,
              height: AppSpacing.s20,
              colorFilter: ColorFilter.mode(
                colors.text.header,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
