import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/features/home/presentation/blocs/pools_bloc/pools_bloc.dart';
import 'package:flutter/material.dart';

/// Horizontally scrolling pill row for picking a [PoolFilter]. Scrolls
/// edge-to-edge; the screen gutter is applied as scroll padding so chips
/// glide past the screen edge like in the design.
class PoolFilterChips extends StatelessWidget {
  const PoolFilterChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final PoolFilter selected;
  final ValueChanged<PoolFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
      child: Row(
        children: [
          for (final filter in PoolFilter.values) ...[
            if (filter != PoolFilter.values.first)
              const SizedBox(width: AppSpacing.s8),
            _FilterChip(
              label: filter.label,
              isSelected: filter == selected,
              onTap: () => onSelected(filter),
            ),
          ],
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Material(
      color: isSelected ? colors.button.primary : colors.bg.tertiary,
      borderRadius: AppRadius.br12,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s20,
            vertical: AppSpacing.s12,
          ),
          child: Text(
            label,
            style: context.styles.bodyL.copyWith(
              color: isSelected ? colors.text.neutral : colors.text.body,
            ),
          ),
        ),
      ),
    );
  }
}
