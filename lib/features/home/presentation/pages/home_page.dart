import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/navigation/routes.dart';
import 'package:co_buy/features/auth/domain/entities/user.dart';
import 'package:co_buy/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:co_buy/features/home/presentation/widgets/home_empty_state.dart';
import 'package:co_buy/features/home/presentation/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Home tab: greeting header plus — until nearby pools are wired up — the
/// empty state prompting the user to start the first pool.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSpacing.s16),
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
            Expanded(
              child: Center(
                child: HomeEmptyState(
                  onStartPool: () => const CreatePoolRoute().push(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
