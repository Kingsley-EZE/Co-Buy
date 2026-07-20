import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/common/app_sheet_close_button.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/formatting/app_formatters.dart';
import 'package:co_buy/features/home/presentation/blocs/create_pool_form_bloc/create_pool_form_bloc.dart';
import 'package:flutter/material.dart';

/// Bottom sheet recapping everything entered on the create-pool form before
/// the pool is actually created.
///
/// Purely presentational: it renders a [CreatePoolFormState] snapshot and
/// reports the choice — "Create pool" pops the sheet then calls
/// [onCreatePool]; "Edit details" and the close button just pop back to the
/// form. Show it with [PoolSummarySheet.show].
class PoolSummarySheet extends StatelessWidget {
  const PoolSummarySheet({
    super.key,
    required this.formState,
    required this.onCreatePool,
  });

  final CreatePoolFormState formState;
  final VoidCallback onCreatePool;

  static Future<void> show(
    BuildContext context, {
    required CreatePoolFormState formState,
    required VoidCallback onCreatePool,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      // The sheet paints its own themed surface; a transparent modal keeps
      // the default Material from poking out behind the rounded corners.
      backgroundColor: Colors.transparent,
      builder: (_) =>
          PoolSummarySheet(formState: formState, onCreatePool: onCreatePool),
    );
  }

  String _naira(double? amount) =>
      amount == null ? '—' : AppFormatters.naira(amount);

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final AppTextStyles styles = context.styles;

    final String feePercent = (kPoolFeeRate * 100).toStringAsFixed(0);
    final double? targetAmount = double.tryParse(formState.targetAmount);

    final List<(String, String)> rows = [
      ('Category', formState.category?.displayName ?? '—'),
      (
        'Contribution Type',
        formState.evenContribution ? 'Equal slot' : 'Custom',
      ),
      ('Target Amount', _naira(targetAmount)),
      ('Number of Slots', formState.slots),
      ('Platform fee ($feePercent%)', _naira(formState.platformFeeAmount)),
      (
        'Deadline',
        formState.deadline == null
            ? '—'
            : AppFormatters.deadline(formState.deadline!),
      ),
      ("Beneficiary's bank", formState.bank?.name ?? '—'),
      ('Account Number', formState.accountNumber),
      ('Recipient receives', _naira(formState.recipientReceivesAmount)),
    ];

    // The widget owns its background (theme-aware, so dark mode gets the
    // dark surface) instead of leaning on how the modal route is configured.
    return Material(
      color: colors.bg.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.r24),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenH,
            AppSpacing.s24,
            AppSpacing.screenH,
            AppSpacing.s16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(child: Text('Pool Summary', style: styles.h4)),
                  AppSheetCloseButton(onTap: () => Navigator.of(context).pop()),
                ],
              ),
              const SizedBox(height: AppSpacing.s8),
              Text(formState.title, style: styles.bodyL.semibold),
              if (formState.description.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.s4),
                Text(
                  formState.description,
                  style: styles.bodyM.copyWith(color: colors.text.subtle),
                ),
              ],
              const SizedBox(height: AppSpacing.s16),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.bg.quaternary,
                  borderRadius: AppRadius.br12,
                ),
                child: Column(
                  children: [
                    for (final (index, (label, value)) in rows.indexed) ...[
                      if (index > 0)
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: colors.bg.primary,
                        ),
                      _SummaryRow(label: label, value: value),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.s24),
              AppButton(
                label: 'Create pool',
                onPressed: () {
                  Navigator.of(context).pop();
                  onCreatePool();
                },
              ),
              const SizedBox(height: AppSpacing.s12),
              AppButton(
                label: 'Edit details',
                variant: AppButtonVariant.outline,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final AppTextStyles styles = context.styles;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s16,
        vertical: AppSpacing.s12,
      ),
      child: Row(
        children: [
          Expanded(child: Text(label, style: styles.bodyM)),
          const SizedBox(width: AppSpacing.s12),
          // Expanded (tight), not Flexible (loose): a loose child
          // shrink-wraps, so its unused allocation became free space at the
          // row's end and the value sat mid-row. Tight fit stretches the
          // Text across its half, letting textAlign.end park it at the edge.
          Expanded(
            child: Text(
              value,
              style: styles.bodyM.semibold,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
