import 'package:co_buy/core/design_system/design_system.dart';
import 'package:flutter/material.dart';

/// Text input atom built on the design-system tokens.
///
/// States map to tokens: rest border `stroke.primary`, focus `primary.base`,
/// error `state.errorBase`, disabled `stroke.secondary` on a
/// `bg.quaternary` fill. Renders [label] above the field when given.
///
/// ```dart
/// AppTextField(
///   label: 'Email',
///   hint: 'you@example.com',
///   keyboardType: TextInputType.emailAddress,
///   validator: _validateEmail,
/// )
/// ```
///
/// Passing `obscureText: true` adds a visibility toggle automatically.
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.controller,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.autocorrect = true,
    this.autofillHints,
    this.focusNode,
    this.prefixIcon,
    this.suffix,
  });

  final String? label;
  final String? hint;
  final String? helperText;

  /// Error shown below the field. For [Form]-driven validation use
  /// [validator] instead.
  final String? errorText;

  final TextEditingController? controller;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onTap;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final bool autocorrect;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final IconData? prefixIcon;

  /// Custom suffix widget; ignored when [obscureText] is true, where the
  /// visibility toggle takes the slot.
  final Widget? suffix;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscured = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final AppTextStyles styles = context.styles;

    OutlineInputBorder border(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: AppRadius.br12,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    final Widget? suffixIcon = widget.obscureText
        ? IconButton(
            onPressed: () => setState(() => _obscured = !_obscured),
            icon: Icon(
              _obscured ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              size: AppSpacing.s20,
              color: colors.text.subtle,
            ),
            tooltip: _obscured ? 'Show' : 'Hide',
          )
        : widget.suffix;

    final Widget field = TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      onTap: widget.onTap,
      obscureText: _obscured,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      autocorrect: widget.autocorrect,
      autofillHints: widget.autofillHints,
      focusNode: widget.focusNode,
      style: styles.bodyL.copyWith(
        color: widget.enabled ? colors.text.body : colors.text.disabled,
      ),
      cursorColor: AppPalette.primaryBase,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: styles.bodyL.copyWith(color: colors.text.subtle),
        helperText: widget.helperText,
        helperStyle: styles.bodyS.copyWith(color: colors.text.subtle),
        errorText: widget.errorText,
        errorStyle: styles.bodyS.copyWith(color: colors.state.errorBase),
        errorMaxLines: 2,
        filled: true,
        fillColor: widget.enabled ? colors.bg.primary : colors.bg.quaternary,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s16,
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                size: AppSpacing.s20,
                color: colors.text.subtle,
              )
            : null,
        suffixIcon: suffixIcon,
        enabledBorder: border(colors.stroke.primary),
        focusedBorder: border(AppPalette.primaryBase, width: 1.5),
        errorBorder: border(colors.state.errorBase),
        focusedErrorBorder: border(colors.state.errorBase, width: 1.5),
        disabledBorder: border(colors.stroke.secondary),
      ),
    );

    if (widget.label == null) return field;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.s8,
      children: [
        Text(widget.label!, style: styles.bodyM.medium),
        field,
      ],
    );
  }
}
