import 'dart:async';

import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/formatting/app_formatters.dart';
import 'package:co_buy/features/home/domain/entities/pool.dart';
import 'package:flutter/material.dart';

class PoolCard extends StatelessWidget {
  const PoolCard({super.key, required this.pool, this.onTap});

  final Pool pool;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final styles = context.styles;

    return Material(
      color: colors.bg.quaternary,
      borderRadius: AppRadius.br16,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text(pool.name, style: styles.h6)),
                  const SizedBox(width: AppSpacing.s12),
                  _SlotsBadge(pool: pool),
                ],
              ),
              const SizedBox(height: AppSpacing.s8),
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: AppSpacing.s20,
                    color: colors.text.body,
                  ),
                  const SizedBox(width: AppSpacing.s4),
                  Flexible(
                    child: Text(
                      'Led by ${pool.leaderFirstName} ${pool.leaderLastName}',
                      style: styles.bodyM,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s8),
              _VerifiedChip(label: '${pool.beneficiaryBankName} Verified'),
              // amountPerSlot 0 means uneven split — no fixed per-slot price.
              if (pool.amountPerSlot > 0) ...[
                const SizedBox(height: AppSpacing.s16),
                Text.rich(
                  TextSpan(
                    text: AppFormatters.naira(pool.amountPerSlot),
                    style: styles.h5,
                    children: [
                      TextSpan(text: ' per slot', style: styles.bodyL),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.s12),
              ] else
                const SizedBox(height: AppSpacing.s16),
              _FillProgressBar(progress: pool.progress),
              const SizedBox(height: AppSpacing.s8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${AppFormatters.naira(pool.amountRaised)} of '
                      '${AppFormatters.naira(pool.targetAmount)}',
                      style: styles.bodyM.copyWith(color: colors.text.subtle),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.s8),
                  _ExpiryCountdown(deadlineAt: pool.deadlineAt),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SlotsBadge extends StatelessWidget {
  const _SlotsBadge({required this.pool});

  final Pool pool;

  /// Warning tint when this many or fewer slots remain.
  static const int _lowSlotsThreshold = 2;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final slotsLeftLabel = pool.slotsRemaining == 1
        ? '1 slot left'
        : '${pool.slotsRemaining} slots left';

    final (
      String label,
      Color background,
      Color foreground,
      Color border,
    ) = switch (pool.status) {
      PoolStatus.filled || PoolStatus.funded => (
        'Full',
        colors.state.successLight,
        colors.state.successDark,
        colors.state.successBase,
      ),
      PoolStatus.expired => (
        'Expired',
        colors.bg.primary,
        colors.text.subtle,
        colors.stroke.primary,
      ),
      PoolStatus.open when pool.slotsRemaining <= _lowSlotsThreshold => (
        slotsLeftLabel,
        colors.state.warningLight,
        colors.state.warningDark,
        colors.state.warningBase,
      ),
      PoolStatus.open => (
        slotsLeftLabel,
        colors.bg.primary,
        colors.text.subtle,
        colors.stroke.primary,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s12,
        vertical: AppSpacing.s4,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: AppRadius.brFull,
        border: Border.all(color: border),
      ),
      child: Text(
        label,
        style: context.styles.bodyM.copyWith(color: foreground),
      ),
    );
  }
}

class _VerifiedChip extends StatelessWidget {
  const _VerifiedChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s8,
        vertical: AppSpacing.s4,
      ),
      decoration: BoxDecoration(
        color: colors.bg.primary,
        borderRadius: AppRadius.br8,
        border: Border.all(color: colors.stroke.primary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check, size: AppSpacing.s16, color: colors.text.subtle),
          const SizedBox(width: AppSpacing.s4),
          Text(
            label,
            style: context.styles.bodyM.copyWith(color: colors.text.subtle),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _FillProgressBar extends StatelessWidget {
  const _FillProgressBar({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.brFull,
      child: LinearProgressIndicator(
        value: progress,
        minHeight: AppSpacing.s8,
        color: AppPalette.primaryBase,
        backgroundColor: context.colors.bg.tertiary,
      ),
    );
  }
}

class _ExpiryCountdown extends StatefulWidget {
  const _ExpiryCountdown({required this.deadlineAt});

  final DateTime deadlineAt;

  @override
  State<_ExpiryCountdown> createState() => _ExpiryCountdownState();
}

class _ExpiryCountdownState extends State<_ExpiryCountdown> {
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _startTickerIfNeeded();
  }

  @override
  void didUpdateWidget(_ExpiryCountdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.deadlineAt != widget.deadlineAt) _startTickerIfNeeded();
  }

  void _startTickerIfNeeded() {
    _ticker?.cancel();
    if (widget.deadlineAt.isAfter(DateTime.now())) {
      _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {});
        // Stop ticking once expired; the last build already shows "Expired".
        if (!widget.deadlineAt.isAfter(DateTime.now())) _ticker?.cancel();
      });
    }
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  String get _label {
    final remaining = widget.deadlineAt.difference(DateTime.now());
    if (remaining.isNegative) return 'Expired';

    String two(int value) => value.toString().padLeft(2, '0');
    final days = remaining.inDays;
    final hours = remaining.inHours % 24;
    final minutes = remaining.inMinutes % 60;
    final seconds = remaining.inSeconds % 60;
    return '${days}d ${two(hours)}:${two(minutes)}:${two(seconds)}';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.access_time_rounded,
          size: AppSpacing.s16,
          color: colors.text.subtle,
        ),
        const SizedBox(width: AppSpacing.s4),
        Text(
          _label,
          style: context.styles.bodyM.copyWith(color: colors.text.subtle),
        ),
      ],
    );
  }
}
