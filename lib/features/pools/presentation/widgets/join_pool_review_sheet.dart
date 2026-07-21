import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/common/app_sheet_close_button.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/formatting/app_formatters.dart';
import 'package:co_buy/features/pools/domain/entities/pool_details.dart';
import 'package:co_buy/features/pools/presentation/blocs/join_pool_form_bloc/join_pool_form_bloc.dart';
import 'package:co_buy/features/pools/presentation/widgets/account_verified_card.dart';
import 'package:flutter/material.dart';

/// Sheet result (`true`/`null`) lets the caller navigate after dismiss.
class JoinPoolReviewSheet extends StatelessWidget {
  const JoinPoolReviewSheet({
    super.key,
    required this.details,
    required this.leaderName,
    required this.formState,
  });

  final PoolDetails details;

  final String? leaderName;

  final JoinPoolFormState formState;

  static Future<bool?> show(
    BuildContext context, {
    required PoolDetails details,
    required String? leaderName,
    required JoinPoolFormState formState,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (_) => JoinPoolReviewSheet(
        details: details,
        leaderName: leaderName,
        formState: formState,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.colors;
    final AppTextStyles styles = context.styles;

    final String? description = details.description;
    final List<(String, String)> rows = [
      ('Led by', leaderName ?? '—'),
      ('Your Slot', '1 slot'),
      (
        'Your Share',
        // amountPerSlot 0 — amount chosen at payment, nothing to preview.
        details.amountPerSlot > 0
            ? AppFormatters.naira(details.amountPerSlot)
            : '—',
      ),
      ('Deadline', AppFormatters.deadline(details.deadlineAt)),
    ];

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
                  Expanded(child: Text('Review & Confirm', style: styles.h4)),
                  AppSheetCloseButton(onTap: () => Navigator.of(context).pop()),
                ],
              ),
              const SizedBox(height: AppSpacing.s8),
              Text(details.name, style: styles.bodyL.semibold),
              if (description != null && description.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.s4),
                Text(
                  description,
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
                      _ReviewRow(label: label, value: value),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.s16),
              AccountVerifiedCard(
                accountName: formState.resolvedAccount?.accountName ?? '',
                bankName: formState.bank?.name,
              ),
              const SizedBox(height: AppSpacing.s16),
              const _EscrowNote(),
              const SizedBox(height: AppSpacing.s24),
              AppButton(
                label: 'Continue to payment',
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  const _ReviewRow({required this.label, required this.value});

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
          // Expanded, not Flexible — loose children left values mid-row.
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

class _EscrowNote extends StatelessWidget {
  const _EscrowNote();

  @override
  Widget build(BuildContext context) {
    final Color color = context.colors.state.warningDark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.gpp_maybe_outlined, size: AppSpacing.s20, color: color),
        const SizedBox(width: AppSpacing.s8),
        Expanded(
          child: Text(
            'Your money is being held by monnify, not the pool leader. It '
            'moves only when target is met or be refunded back to you.',
            style: context.styles.bodyM.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}
