import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/onboarding_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/home/presentation/pages/home_page.dart';

part 'routes.g.dart';

/// Root navigator key — routes that must cover any future shell (dialogs,
/// full-screen flows) set this as their `$parentNavigatorKey`.
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

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

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
