import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/formatting/app_formatters.dart';
import 'package:co_buy/features/pools/domain/entities/pool_details.dart';
import 'package:flutter/material.dart';

class PoolDestinationCard extends StatelessWidget {
  const PoolDestinationCard({super.key, required this.details});

  final PoolDetails details;

  @override
  Widget build(BuildContext context) {
    final rows = <(String, String)>[
      ('Paid to', details.beneficiaryAccountName),
      ('Bank Name', details.beneficiaryBankName),
      ('Account Number', details.maskedAccountNumber),
      ('Target Amount', AppFormatters.naira(details.targetAmount)),
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: AppRadius.br16,
        border: Border.all(color: context.colors.stroke.primary),
      ),
      child: Column(
        children: [
          for (final (index, row) in rows.indexed) ...[
            if (index > 0)
              Divider(height: 1, color: context.colors.stroke.secondary),
            _DestinationRow(label: row.$1, value: row.$2),
          ],
        ],
      ),
    );
  }
}

class _DestinationRow extends StatelessWidget {
  const _DestinationRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final styles = context.styles;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.s16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: styles.bodyL),
          const SizedBox(width: AppSpacing.s16),
          Expanded(
            child: Text(
              value,
              style: styles.bodyL.semibold.copyWith(
                color: context.colors.text.header,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
