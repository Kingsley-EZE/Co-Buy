import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/alerts/presentation/pages/alerts_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/onboarding_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/home/presentation/pages/dashboard_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/pools/presentation/pages/my_pools_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';

part 'routes.g.dart';

/// Root navigator key — routes that must cover the dashboard shell (dialogs,
/// full-screen flows) set this as their `$parentNavigatorKey`.
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// One navigator per dashboard branch so each tab keeps its own back stack
/// and scroll state when the user switches away and back.
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _poolsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'pools');
final _alertsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'alerts');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

@TypedGoRoute<OnboardingRoute>(path: '/onboarding')
class OnboardingRoute extends GoRouteData with $OnboardingRoute {
  const OnboardingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingPage();
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SignupRoute>(path: 'signup'),
    TypedGoRoute<ForgotPasswordRoute>(
      path: 'forgot-password',
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ResetPasswordRoute>(path: 'reset-password'),
      ],
    ),
  ],
)
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}

/// Nested under login so `/login/signup` keeps the login screen in the back
/// stack — deep-link-ready without refactoring.
class SignupRoute extends GoRouteData with $SignupRoute {
  const SignupRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SignupPage();
}

class ForgotPasswordRoute extends GoRouteData with $ForgotPasswordRoute {
  const ForgotPasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ForgotPasswordPage();
}

/// Nested under forgot-password so login and the email step stay in the back
/// stack while the user resets. [email] rides along as a query parameter —
/// the reset request needs it and the page shouldn't re-ask.
class ResetPasswordRoute extends GoRouteData with $ResetPasswordRoute {
  const ResetPasswordRoute({required this.email});

  final String email;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ResetPasswordPage(email: email);
}

/// Dashboard shell: an indexed stack of the four bottom-nav tabs. The shell
/// renders [DashboardPage], which owns the bottom bar and swaps branches via
/// `navigationShell.goBranch`.
@TypedStatefulShellRoute<DashboardShellRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeBranch>(
      routes: <TypedRoute<RouteData>>[TypedGoRoute<HomeRoute>(path: '/home')],
    ),
    TypedStatefulShellBranch<MyPoolsBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<MyPoolsRoute>(path: '/pools'),
      ],
    ),
    TypedStatefulShellBranch<AlertsBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AlertsRoute>(path: '/alerts'),
      ],
    ),
    TypedStatefulShellBranch<ProfileBranch>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ProfileRoute>(path: '/profile'),
      ],
    ),
  ],
)
class DashboardShellRoute extends StatefulShellRouteData {
  const DashboardShellRoute();

  /// Entry point for the dashboard. The shell has no path of its own — only
  /// its branches do — so entering it means landing on the Home branch.
  static void go(BuildContext context) => const HomeRoute().go(context);

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) => DashboardPage(navigationShell: navigationShell);
}

class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = _homeNavigatorKey;
}

class MyPoolsBranch extends StatefulShellBranchData {
  const MyPoolsBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = _poolsNavigatorKey;
}

class AlertsBranch extends StatefulShellBranchData {
  const AlertsBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = _alertsNavigatorKey;
}

class ProfileBranch extends StatefulShellBranchData {
  const ProfileBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = _profileNavigatorKey;
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

class MyPoolsRoute extends GoRouteData with $MyPoolsRoute {
  const MyPoolsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MyPoolsPage();
}

class AlertsRoute extends GoRouteData with $AlertsRoute {
  const AlertsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AlertsPage();
}

class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfilePage();
}
