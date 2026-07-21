import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/core/navigation/routes.dart';
import 'package:co_buy/features/auth/domain/entities/user.dart';
import 'package:co_buy/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:co_buy/features/home/presentation/blocs/pools_bloc/pools_bloc.dart';
import 'package:co_buy/features/home/presentation/widgets/home_pools_feed.dart';
import 'package:co_buy/features/home/presentation/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Home tab: greeting header plus the pool feed (banner, status filters and
/// the pool list, with its empty/error states).
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<PoolsBloc>()
        ..add(const PoolsEvent.fetchRequested())
        ..add(const PoolsEvent.socketStarted()),
      child: AppScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSpacing.s16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenH,
              ),
              child:
                  // Rebuilds only when the signed-in user changes, not on every
                  // transient auth transition (loading, failure, ...).
                  BlocSelector<AuthBloc, AuthState, User?>(
                    selector: (state) =>
                        state is AuthAuthenticated ? state.user : null,
                    builder: (context, user) => HomeTopBar(
                      user: user,
                      onNotificationTap: () => const AlertsRoute().go(context),
                    ),
                  ),
            ),
            const SizedBox(height: AppSpacing.s24),
            Expanded(
              child: BlocBuilder<PoolsBloc, PoolsState>(
                builder: (context, state) => HomePoolsFeed(
                  pools: state.pools,
                  filter: state.filter,
                  requestStatus: state.status,
                  error: state.error,
                  onFilterSelected: (filter) => context.read<PoolsBloc>().add(
                    PoolsEvent.filterChanged(filter),
                  ),
                  onRetry: () => context.read<PoolsBloc>().add(
                    const PoolsEvent.fetchRequested(),
                  ),
                  onStartPool: () => const CreatePoolRoute().push(context),
                  onPoolTap: (pool) =>
                      PoolDetailsRoute(poolId: pool.id).push(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
