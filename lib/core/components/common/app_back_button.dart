import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Circular outlined back button used at the top of full-screen pages.
///
/// Pops the current route by default; pass [onPressed] to override.
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Material(
      color: Colors.transparent,
      shape: CircleBorder(side: BorderSide(color: colors.stroke.primary)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed ?? () => context.pop(),
        child: SizedBox.square(
          dimension: AppSpacing.s48,
          child: Center(
            child: Assets.icons.icBackArrow.svg(
              width: AppSpacing.s24,
              height: AppSpacing.s24,
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
