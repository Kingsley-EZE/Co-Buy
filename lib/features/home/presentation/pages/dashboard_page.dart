import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/core/navigation/routes.dart';
import 'package:co_buy/features/alerts/presentation/blocs/notifications_bloc/notifications_bloc.dart';
import 'package:co_buy/features/home/presentation/widgets/dashboard_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Safe areas off here — each tab page manages its own insets.
///
/// Hosts the shared [NotificationsBloc] above every tab so the home bell and
/// the Alerts nav badge read the same unread count. Stateful so the fetch and
/// socket start exactly once, and so we can clear the count the moment the
/// Alerts branch becomes active (whether reached via the tab or the bell).
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  static const _alertsIndex = 2;

  final NotificationsBloc _notificationsBloc = getIt<NotificationsBloc>();
  int _lastIndex = -1;

  @override
  void initState() {
    super.initState();
    _notificationsBloc
      ..add(const NotificationsEvent.fetchRequested())
      ..add(const NotificationsEvent.socketStarted());
    _maybeMarkAlertsRead(widget.navigationShell.currentIndex);
  }

  /// Clears the unread badge whenever the user lands on Alerts. Guarded on a
  /// real index change so it fires per visit, not on every rebuild.
  void _maybeMarkAlertsRead(int index) {
    if (index == _lastIndex) return;
    _lastIndex = index;
    if (index == _alertsIndex) {
      _notificationsBloc.add(const NotificationsEvent.allMarkedRead());
    }
  }

  @override
  Widget build(BuildContext context) {
    _maybeMarkAlertsRead(widget.navigationShell.currentIndex);

    return BlocProvider.value(
      value: _notificationsBloc,
      child: AppScaffold(
        safeAreaTop: false,
        safeAreaBottom: false,
        body: widget.navigationShell,
        bottomNavigationBar:
            BlocSelector<NotificationsBloc, NotificationsState, int>(
              selector: (state) => state.unreadCount,
              builder: (context, unreadCount) => DashboardNavBar(
                currentIndex: widget.navigationShell.currentIndex,
                alertsBadgeCount: unreadCount,
                onTabSelected: (index) => widget.navigationShell.goBranch(
                  index,
                  // Tapping the already-active tab pops it to its root.
                  initialLocation: index == widget.navigationShell.currentIndex,
                ),
                onCreatePool: () => const CreatePoolRoute().push(context),
              ),
            ),
      ),
    );
  }
}
