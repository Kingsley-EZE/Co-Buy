import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/core/navigation/routes.dart';
import 'package:co_buy/features/home/domain/entities/pool.dart';
import 'package:co_buy/features/home/presentation/widgets/pool_card.dart';
import 'package:co_buy/features/pools/presentation/blocs/my_pools_bloc/my_pools_bloc.dart';
import 'package:co_buy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPoolsPage extends StatelessWidget {
  const MyPoolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<MyPoolsBloc>()..add(const MyPoolsEvent.fetchRequested()),
      child: AppScaffold(
        appBar: AppBar(title: const Text('My pools')),
        body: BlocBuilder<MyPoolsBloc, MyPoolsState>(
          builder: (context, state) => switch (state.status) {
            MyPoolsRequestStatus.initial ||
            MyPoolsRequestStatus.loading => const Center(
              child: CircularProgressIndicator(color: AppPalette.primaryBase),
            ),
            MyPoolsRequestStatus.failure => _MyPoolsError(
              message: state.error ?? 'Something went wrong.',
              onRetry: () => context.read<MyPoolsBloc>().add(
                const MyPoolsEvent.fetchRequested(),
              ),
            ),
            MyPoolsRequestStatus.success => state.pools.isEmpty
                ? const _MyPoolsEmpty()
                : _MyPoolsList(pools: state.pools),
          },
        ),
      ),
    );
  }
}

class _MyPoolsList extends StatelessWidget {
  const _MyPoolsList({required this.pools});

  final List<Pool> pools;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<MyPoolsBloc>().add(
        const MyPoolsEvent.fetchRequested(),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.screenH,
          AppSpacing.s16,
          AppSpacing.screenH,
          AppSpacing.s24,
        ),
        itemCount: pools.length,
        separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.s16),
        itemBuilder: (context, index) {
          final pool = pools[index];
          return PoolCard(
            pool: pool,
            onTap: () => PoolDetailsRoute(poolId: pool.id).push(context),
          );
        },
      ),
    );
  }
}

class _MyPoolsEmpty extends StatelessWidget {
  const _MyPoolsEmpty();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.imgEmptyPool.image(width: 120),
            const SizedBox(height: AppSpacing.s24),
            Text(
              "You haven't created any pools yet",
              style: context.styles.h5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.s8),
            Text(
              'Start a pool and invite others to contribute towards a goal.',
              style: context.styles.bodyL,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.s24),
            AppButton(
              label: 'Start a pool',
              variant: AppButtonVariant.outline,
              size: AppButtonSize.medium,
              expanded: false,
              onPressed: () => const CreatePoolRoute().push(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyPoolsError extends StatelessWidget {
  const _MyPoolsError({required this.message, required this.onRetry});

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
