import 'package:co_buy/core/design_system/design_system.dart';
import 'package:flutter/material.dart';

/// Visual variants from the Figma button tokens: a filled brand button and
/// an outlined one.
enum AppButtonVariant { primary, outline, danger }

enum AppButtonSize {
  small(40),
  medium(48),
  large(56);

  const AppButtonSize(this.height);

  final double height;
}

/// Primary button atom built on the `button` colour tokens, so hover/pressed,
/// and disabled states follow the style guide in both light and dark mode.
///
/// ```dart
/// AppButton(label: 'Continue', onPressed: _submit)
/// AppButton(
///   label: 'Cancel',
///   variant: AppButtonVariant.outline,
///   onPressed: _cancel,
/// )
/// ```
///
/// A null [onPressed] renders the disabled state. While [loading] is true the
/// button keeps its enabled look, ignores taps and shows a spinner.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.large,
    this.loading = false,
    this.expanded = true,
    this.leadingIcon,
    this.trailingIcon,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool loading;

  /// Fills the available width when t
  ///rue (the common mobile CTA case).
  final bool expanded;

  final IconData? leadingIcon;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    final ButtonColors button = context.colors.button;
    final TextColors text = context.colors.text;
    final StateColors state = context.colors.state;

    final Color foreground = switch (variant) {
      AppButtonVariant.primary => text.neutral,
      AppButtonVariant.outline => button.outline,
      AppButtonVariant.danger => text.neutral,
    };
    final Color disabledForeground = switch (variant) {
      AppButtonVariant.primary => AppPalette.primaryBase2,
      AppButtonVariant.outline => text.disabled,
      AppButtonVariant.danger => text.disabled,
    };

    Color resolveForeground(Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled) && !loading) {
        return disabledForeground;
      }
      if (variant == AppButtonVariant.outline &&
          (states.contains(WidgetState.pressed) ||
              states.contains(WidgetState.hovered))) {
        return button.hoverActive;
      }
      return foreground;
    }

    final ButtonStyle style = ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (variant == AppButtonVariant.outline) return Colors.transparent;
        if (states.contains(WidgetState.disabled) && !loading) {
          return variant == AppButtonVariant.danger
              ? state.errorLight
              : button.disabled;
        }
        if (states.contains(WidgetState.pressed) ||
            states.contains(WidgetState.hovered)) {
          return variant == AppButtonVariant.danger
              ? state.errorDark
              : button.hoverActive;
        }
        return variant == AppButtonVariant.danger
            ? state.errorBase
            : button.primary;
      }),
      foregroundColor: WidgetStateProperty.resolveWith(resolveForeground),
      iconColor: WidgetStateProperty.resolveWith(resolveForeground),
      side: variant == AppButtonVariant.outline
          ? WidgetStateProperty.resolveWith(
              (states) => BorderSide(color: resolveForeground(states)),
            )
          : null,
      // Background/foreground swaps cover hover and pressed feedback.
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      elevation: const WidgetStatePropertyAll(0),
      shape: const WidgetStatePropertyAll(StadiumBorder()),
      minimumSize: WidgetStatePropertyAll(Size(0, size.height)),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: AppSpacing.s24),
      ),
      textStyle: WidgetStatePropertyAll(
        size == AppButtonSize.small
            ? AppTypography.bodyMedium.semibold
            : AppTypography.bodyLarge.semibold,
      ),
    );

    final Widget child = loading
        ? SizedBox.square(
            dimension: AppSpacing.s20,
            child: CircularProgressIndicator(strokeWidth: 2, color: foreground),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            spacing: AppSpacing.s8,
            children: [
              if (leadingIcon != null) Icon(leadingIcon, size: AppSpacing.s20),
              Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
              if (trailingIcon != null)
                Icon(trailingIcon, size: AppSpacing.s20),
            ],
          );

    final Widget buttonWidget = ElevatedButton(
      onPressed: loading ? null : onPressed,
      style: style,
      child: child,
    );

    return expanded
        ? SizedBox(width: double.infinity, child: buttonWidget)
        : buttonWidget;
  }
}
