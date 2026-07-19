// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $onboardingRoute,
  $loginRoute,
  $createPoolRoute,
  $dashboardShellRoute,
];

RouteBase get $onboardingRoute => GoRouteData.$route(
  path: '/onboarding',
  factory: $OnboardingRoute._fromState,
);

mixin $OnboardingRoute on GoRouteData {
  static OnboardingRoute _fromState(GoRouterState state) =>
      const OnboardingRoute();

  @override
  String get location => GoRouteData.$location('/onboarding');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',
  factory: $LoginRoute._fromState,
  routes: [
    GoRouteData.$route(path: 'signup', factory: $SignupRoute._fromState),
    GoRouteData.$route(
      path: 'forgot-password',
      factory: $ForgotPasswordRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'reset-password',
          factory: $ResetPasswordRoute._fromState,
        ),
      ],
    ),
  ],
);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SignupRoute on GoRouteData {
  static SignupRoute _fromState(GoRouterState state) => const SignupRoute();

  @override
  String get location => GoRouteData.$location('/login/signup');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ForgotPasswordRoute on GoRouteData {
  static ForgotPasswordRoute _fromState(GoRouterState state) =>
      const ForgotPasswordRoute();

  @override
  String get location => GoRouteData.$location('/login/forgot-password');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ResetPasswordRoute on GoRouteData {
  static ResetPasswordRoute _fromState(GoRouterState state) =>
      ResetPasswordRoute(email: state.uri.queryParameters['email']!);

  ResetPasswordRoute get _self => this as ResetPasswordRoute;

  @override
  String get location => GoRouteData.$location(
    '/login/forgot-password/reset-password',
    queryParams: {'email': _self.email},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $createPoolRoute => GoRouteData.$route(
  path: '/create-pool',
  parentNavigatorKey: CreatePoolRoute.$parentNavigatorKey,
  factory: $CreatePoolRoute._fromState,
);

mixin $CreatePoolRoute on GoRouteData {
  static CreatePoolRoute _fromState(GoRouterState state) =>
      const CreatePoolRoute();

  @override
  String get location => GoRouteData.$location('/create-pool');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $dashboardShellRoute => StatefulShellRouteData.$route(
  factory: $DashboardShellRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      navigatorKey: HomeBranch.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/home',
          factory: $HomeRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'pool/:poolId',
              parentNavigatorKey: PoolDetailsRoute.$parentNavigatorKey,
              factory: $PoolDetailsRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: MyPoolsBranch.$navigatorKey,
      routes: [
        GoRouteData.$route(path: '/pools', factory: $MyPoolsRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: AlertsBranch.$navigatorKey,
      routes: [
        GoRouteData.$route(path: '/alerts', factory: $AlertsRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: ProfileBranch.$navigatorKey,
      routes: [
        GoRouteData.$route(path: '/profile', factory: $ProfileRoute._fromState),
      ],
    ),
  ],
);

extension $DashboardShellRouteExtension on DashboardShellRoute {
  static DashboardShellRoute _fromState(GoRouterState state) =>
      const DashboardShellRoute();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PoolDetailsRoute on GoRouteData {
  static PoolDetailsRoute _fromState(GoRouterState state) =>
      PoolDetailsRoute(poolId: state.pathParameters['poolId']!);

  PoolDetailsRoute get _self => this as PoolDetailsRoute;

  @override
  String get location =>
      GoRouteData.$location('/home/pool/${Uri.encodeComponent(_self.poolId)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MyPoolsRoute on GoRouteData {
  static MyPoolsRoute _fromState(GoRouterState state) => const MyPoolsRoute();

  @override
  String get location => GoRouteData.$location('/pools');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AlertsRoute on GoRouteData {
  static AlertsRoute _fromState(GoRouterState state) => const AlertsRoute();

  @override
  String get location => GoRouteData.$location('/alerts');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  @override
  String get location => GoRouteData.$location('/profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
