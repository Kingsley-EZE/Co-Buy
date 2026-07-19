import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/features/home/domain/entities/pool.dart';
import 'package:co_buy/features/home/presentation/blocs/pools_bloc/pools_bloc.dart';
import 'package:co_buy/features/home/presentation/widgets/home_empty_state.dart';
import 'package:co_buy/features/home/presentation/widgets/home_info_banner.dart';
import 'package:co_buy/features/home/presentation/widgets/pool_card.dart';
import 'package:co_buy/features/home/presentation/widgets/pool_filter_chips.dart';
import 'package:flutter/material.dart';

/// Pool feed for the home tab: the refund notice, the status filter row and
/// the list area. The banner and chips stay in place while a fetch is in
/// flight — only the list area switches between spinner, error, empty and
/// results. Pure renderer: all state arrives via props from [PoolsBloc].
class HomePoolsFeed extends StatelessWidget {
  const HomePoolsFeed({
    super.key,
    required this.pools,
    required this.filter,
    required this.requestStatus,
    this.error,
    required this.onFilterSelected,
    required this.onRetry,
    required this.onStartPool,
    this.onPoolTap,
  });

  final List<Pool> pools;
  final PoolFilter filter;
  final PoolsRequestStatus requestStatus;
  final String? error;
  final ValueChanged<PoolFilter> onFilterSelected;
  final VoidCallback onRetry;
  final VoidCallback onStartPool;
  final ValueChanged<Pool>? onPoolTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
          child: HomeInfoBanner(),
        ),
        const SizedBox(height: AppSpacing.s16),
        PoolFilterChips(selected: filter, onSelected: onFilterSelected),
        const SizedBox(height: AppSpacing.s16),
        Expanded(child: _buildListArea(context)),
      ],
    );
  }

  Widget _buildListArea(BuildContext context) {
    switch (requestStatus) {
      case PoolsRequestStatus.initial:
      case PoolsRequestStatus.loading:
        return const Center(
          child: CircularProgressIndicator(color: AppPalette.primaryBase),
        );
      case PoolsRequestStatus.failure:
        return _FeedError(
          message: error ?? 'Something went wrong.',
          onRetry: onRetry,
        );
      case PoolsRequestStatus.success:
        if (pools.isNotEmpty) return _buildList();
        // Nothing anywhere: prompt the user to start the first pool. An
        // empty *filtered* view gets a lighter notice — pools exist, just
        // not in this status.
        return filter == PoolFilter.all
            ? Center(child: HomeEmptyState(onStartPool: onStartPool))
            : Center(
                child: Text(
                  'No ${filter.label.toLowerCase()} pools right now.',
                  style: context.styles.bodyL.copyWith(
                    color: context.colors.text.subtle,
                  ),
                ),
              );
    }
  }

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.screenH,
        0,
        AppSpacing.screenH,
        AppSpacing.s24,
      ),
      itemCount: pools.length,
      separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.s16),
      itemBuilder: (context, index) {
        final pool = pools[index];
        return PoolCard(
          pool: pool,
          onTap: onPoolTap == null ? null : () => onPoolTap!(pool),
        );
      },
    );
  }
}

class _FeedError extends StatelessWidget {
  const _FeedError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: context.styles.bodyL,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.s16),
            AppButton(
              label: 'Try again',
              variant: AppButtonVariant.outline,
              size: AppButtonSize.medium,
              expanded: false,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
