import 'package:co_buy/core/components/atoms/app_text_field.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Multiline text area with a live `n/maxLength` counter rendered inside the
/// field's bottom-right corner.
///
/// The counter listens to [controller], so the widget stays reusable without
/// coupling to any particular bloc — callers still receive edits through
/// [onChanged] as usual.
///
/// ```dart
/// AppTextArea(
///   label: 'Description (optional)',
///   hint: "Describe this pool's goal",
///   controller: _descriptionController,
///   maxLength: 200,
///   onChanged: (v) => bloc.add(DescriptionChanged(v)),
/// )
/// ```
class AppTextArea extends StatelessWidget {
  const AppTextArea({
    super.key,
    required this.controller,
    required this.maxLength,
    this.label,
    this.hint,
    this.onChanged,
    this.maxLines = 4,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.sentences,
  });

  final TextEditingController controller;

  /// Hard cap, enforced with a [LengthLimitingTextInputFormatter].
  final int maxLength;

  final String? label;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final bool enabled;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppTextField(
          label: label,
          hint: hint,
          controller: controller,
          maxLines: maxLines,
          enabled: enabled,
          inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
          onChanged: onChanged,
          textCapitalization: textCapitalization,
        ),
        Positioned(
          right: AppSpacing.s16,
          bottom: AppSpacing.s12,
          child: ValueListenableBuilder<TextEditingValue>(
            valueListenable: controller,
            builder: (context, value, _) => Text(
              '${value.text.length}/$maxLength',
              style: context.styles.bodyS.copyWith(
                color: context.colors.text.subtle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
