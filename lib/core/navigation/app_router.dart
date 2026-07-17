import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../error/not_found_screen.dart';
import 'routes.dart';

/// Builds the app's [GoRouter].
///
/// No auth guard yet: once session-level auth state exists (e.g. a cubit that
/// reads TokenStorage on startup), add `redirect` + `refreshListenable`
/// (a GoRouterRefreshStream over its state stream) here — nothing else needs
/// to change.
GoRouter createRouter() => GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: const LoginRoute().location,
      debugLogDiagnostics: kDebugMode,
      routes: $appRoutes,
      errorBuilder: (context, state) => NotFoundScreen(error: state.error),
    );
