import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../config/app_config.dart';

part 'routes.g.dart';

/// Root navigator key — routes that must cover any future shell (dialogs,
/// full-screen flows) set this as their `$parentNavigatorKey`.
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@TypedGoRoute<LoginRoute>(
  path: '/login',
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SignupRoute>(path: 'signup'),
  ],
)
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LoginPage(title: AppConfig.appName);
}

/// Nested under login so `/login/signup` keeps the login screen in the back
/// stack — deep-link-ready without refactoring.
class SignupRoute extends GoRouteData with $SignupRoute {
  const SignupRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SignupPage();
}

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
