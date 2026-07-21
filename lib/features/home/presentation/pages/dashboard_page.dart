import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/navigation/routes.dart';
import 'package:co_buy/features/home/presentation/widgets/dashboard_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Safe areas off here — each tab page manages its own insets.
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      safeAreaTop: false,
      safeAreaBottom: false,
      body: navigationShell,
      bottomNavigationBar: DashboardNavBar(
        currentIndex: navigationShell.currentIndex,
        onTabSelected: (index) => navigationShell.goBranch(
          index,
          // Tapping the already-active tab pops it to its root.
          initialLocation: index == navigationShell.currentIndex,
        ),
        onCreatePool: () => const CreatePoolRoute().push(context),
      ),
    );
  }
}
