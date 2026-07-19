import 'package:co_buy/core/components/atoms/app_text_field.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:flutter/material.dart';

/// Dropdown select atom with the same look and sizing as [AppTextField]:
/// rest border `stroke.primary`, focus `primary.base`, error
/// `state.errorBase`, disabled `stroke.secondary` on a `bg.quaternary` fill.
/// Renders [label] above the field when given.
///
/// ```dart
/// AppDropdownField<PoolCategory>(
///   label: 'Category',
///   hint: 'Select a category',
///   items: PoolCategory.values,
///   itemLabel: (c) => c.displayName,
///   value: state.category,
///   onChanged: (c) => bloc.add(CategoryChanged(c)),
/// )
/// ```
///
/// Passing `canSearch: true` swaps the Material menu for a bottom sheet with
/// a live search box — use it for long lists (banks, countries) where
/// scrolling a plain menu is painful.
class AppDropdownField<T> extends StatelessWidget {
  const AppDropdownField({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.itemLabel,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.validator,
    this.enabled = true,
    this.autovalidateMode,
    this.canSearch = false,
  });

  final List<T> items;

  final ValueChanged<T?>? onChanged;

  /// Currently selected item; the hint shows while null.
  final T? value;

  /// Text shown for each item (and the selected value); defaults to
  /// `toString`.
  final String Function(T item)? itemLabel;

  final String? label;
  final String? hint;
  final String? helperText;

  /// Error shown below the field. For [Form]-driven validation use
  /// [validator] instead.
  final String? errorText;

  final FormFieldValidator<T>? validator;
  final bool enabled;

  /// Set on the field (not an enclosing [Form]) so interaction tracking is
  /// per-field, matching [AppTextField].
  final AutovalidateMode? autovalidateMode;

  /// Picks items through a searchable bottom sheet instead of the Material
  /// menu. The search matches case-insensitively against the item labels.
  final bool canSearch;

  String _labelOf(T item) => itemLabel?.call(item) ?? '$item';

  InputDecoration _decoration(BuildContext context, {String? errorOverride}) {
    final AppColors colors = context.colors;
    final AppTextStyles styles = context.styles;

    OutlineInputBorder border(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: AppRadius.br12,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return InputDecoration(
      enabled: enabled,
      hintText: hint,
      hintStyle: styles.bodyL.copyWith(color: colors.text.subtle),
      helperText: helperText,
      helperStyle: styles.bodyS.copyWith(color: colors.text.subtle),
      errorText: errorOverride,
      errorStyle: styles.bodyS.copyWith(color: colors.state.errorBase),
      errorMaxLines: 2,
      filled: true,
      fillColor: enabled ? colors.bg.primary : colors.bg.quaternary,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s16,
        vertical: AppSpacing.s16,
      ),
      enabledBorder: border(colors.stroke.primary),
      focusedBorder: border(AppPalette.primaryBase, width: 1.5),
      errorBorder: border(colors.state.errorBase),
      focusedErrorBorder: border(colors.state.errorBase, width: 1.5),
      disabledBorder: border(colors.stroke.secondary),
    );
  }

  Widget _arrowIcon(BuildContext context) {
    return Icon(
      Icons.keyboard_arrow_down_rounded,
      size: AppSpacing.s24,
      color: enabled
          ? context.colors.text.subtle
          : context.colors.text.disabled,
    );
  }

  TextStyle _valueStyle(BuildContext context) {
    return context.styles.bodyL.copyWith(
      color: enabled ? context.colors.text.body : context.colors.text.disabled,
    );
  }

  /// The classic Material menu path.
  Widget _buildMenuField(BuildContext context) {
    // Without alignedDropdown, Material inflates the menu 16/24px past the
    // button's edges (the legacy "unaligned" margin), so the open menu bleeds
    // to the screen sides. Aligned keeps the menu flush with the field.
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField<T>(
        initialValue: value,
        items: [
          for (final T item in items)
            DropdownMenuItem<T>(
              value: item,
              child: Text(_labelOf(item), overflow: TextOverflow.ellipsis),
            ),
        ],
        // A null onChanged is what actually disables the underlying dropdown.
        onChanged: enabled ? onChanged : null,
        validator: validator,
        autovalidateMode: autovalidateMode,
        isExpanded: true,
        icon: _arrowIcon(context),
        style: _valueStyle(context),
        dropdownColor: context.colors.bg.primary,
        borderRadius: AppRadius.br12,
        decoration: _decoration(context, errorOverride: errorText),
      ),
    );
  }

  /// The searchable path: same field visuals, but tapping opens
  /// [_DropdownSearchSheet] instead of a menu.
  Widget _buildSearchField(BuildContext context) {
    return FormField<T>(
      enabled: enabled,
      initialValue: value,
      validator: validator,
      autovalidateMode: autovalidateMode,
      builder: (field) => InkWell(
        borderRadius: AppRadius.br12,
        onTap: enabled ? () => _openSearchSheet(context, field) : null,
        child: InputDecorator(
          decoration: _decoration(
            context,
            errorOverride: errorText ?? field.errorText,
          ).copyWith(suffixIcon: _arrowIcon(context)),
          isEmpty: value == null,
          child: value == null
              ? null
              : Text(
                  _labelOf(value as T),
                  style: _valueStyle(context),
                  overflow: TextOverflow.ellipsis,
                ),
        ),
      ),
    );
  }

  Future<void> _openSearchSheet(
    BuildContext context,
    FormFieldState<T> field,
  ) async {
    final T? selected = await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.bg.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.r16),
        ),
      ),
      builder: (_) => _DropdownSearchSheet<T>(
        items: items,
        labelOf: _labelOf,
        selected: value,
        title: label,
      ),
    );
    if (selected == null) return;

    field.didChange(selected);
    onChanged?.call(selected);
  }

  @override
  Widget build(BuildContext context) {
    final Widget field = canSearch
        ? _buildSearchField(context)
        : _buildMenuField(context);

    if (label == null) return field;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.s8,
      children: [
        Text(label!, style: context.styles.bodyM.medium),
        field,
      ],
    );
  }
}

/// Bottom sheet body for the `canSearch` mode: a search box that filters the
/// item list as the user types. Pops with the tapped item (null on dismiss).
class _DropdownSearchSheet<T> extends StatefulWidget {
  const _DropdownSearchSheet({
    required this.items,
    required this.labelOf,
    this.selected,
    this.title,
  });

  final List<T> items;
  final String Function(T item) labelOf;
  final T? selected;
  final String? title;

  @override
  State<_DropdownSearchSheet<T>> createState() =>
      _DropdownSearchSheetState<T>();
}

class _DropdownSearchSheetState<T> extends State<_DropdownSearchSheet<T>> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final AppTextStyles styles = context.styles;

    final String needle = _query.trim().toLowerCase();
    final List<T> results = needle.isEmpty
        ? widget.items
        : [
            for (final T item in widget.items)
              if (widget.labelOf(item).toLowerCase().contains(needle)) item,
          ];

    return Padding(
      // Rides above the keyboard so the list stays visible while typing.
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSpacing.s16),
            if (widget.title != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
                child: Text(widget.title!, style: styles.bodyL.semibold),
              ),
              const SizedBox(height: AppSpacing.s12),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
              child: AppTextField(
                hint: 'Search',
                prefixIcon: Icons.search,
                onChanged: (value) => setState(() => _query = value),
              ),
            ),
            const SizedBox(height: AppSpacing.s8),
            Expanded(
              child: results.isEmpty
                  ? Center(
                      child: Text(
                        'No matches',
                        style: styles.bodyM.copyWith(color: colors.text.subtle),
                      ),
                    )
                  : ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        final T item = results[index];
                        final bool isSelected = item == widget.selected;
                        return ListTile(
                          title: Text(
                            widget.labelOf(item),
                            style: styles.bodyL,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: isSelected
                              ? const Icon(
                                  Icons.check_rounded,
                                  color: AppPalette.primaryBase,
                                )
                              : null,
                          onTap: () => Navigator.of(context).pop(item),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
