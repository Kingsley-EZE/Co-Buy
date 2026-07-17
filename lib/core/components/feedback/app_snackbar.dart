import 'package:co_buy/core/design_system/design_system.dart';
import 'package:flutter/material.dart';

/// Feedback snackbar built on the `state` colour tokens, with one visual
/// treatment per outcome so screens never hand-roll [SnackBar]s:
///
/// ```dart
/// AppSnackBar.showSuccess(context, 'Account created');
/// AppSnackBar.showError(context, 'Something went wrong');
/// ```
///
/// Showing a new snackbar replaces the current one, so stale feedback never
/// queues up behind fresh feedback.
abstract final class AppSnackBar {
  static void showSuccess(BuildContext context, String message) =>
      _show(context, message, _AppSnackBarType.success);

  static void showError(BuildContext context, String message) =>
      _show(context, message, _AppSnackBarType.error);

  static void _show(
    BuildContext context,
    String message,
    _AppSnackBarType type,
  ) {
    final AppColors colors = context.colors;
    final Color background = switch (type) {
      _AppSnackBarType.success => colors.state.successBase,
      _AppSnackBarType.error => colors.state.errorBase,
    };
    final IconData icon = switch (type) {
      _AppSnackBarType.success => Icons.check_circle_rounded,
      _AppSnackBarType.error => Icons.error_rounded,
    };

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: background,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.br12),
          content: Row(
            spacing: AppSpacing.s8,
            children: [
              Icon(icon, size: AppSpacing.s20, color: colors.text.neutral),
              Expanded(
                child: Text(
                  message,
                  style: context.styles.bodyM.medium.copyWith(
                    color: colors.text.neutral,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

enum _AppSnackBarType { success, error }
