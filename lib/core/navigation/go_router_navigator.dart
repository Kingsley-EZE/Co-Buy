import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import 'app_navigator.dart';

/// [AppNavigator] backed by the app's [GoRouter] instance.
///
/// Holding the router directly is valid — `context.go(...)` is only shorthand
/// for `GoRouter.of(context).go(...)`.
@LazySingleton(as: AppNavigator)
class GoRouterNavigator implements AppNavigator {
  GoRouterNavigator(this._router);

  final GoRouter _router;

  @override
  void goTo(String location, {Object? extra}) =>
      _router.go(location, extra: extra);

  @override
  Future<T?> push<T>(String location, {Object? extra}) =>
      _router.push<T>(location, extra: extra);

  @override
  void pop<T>([T? result]) => _router.pop<T>(result);

  @override
  bool canPop() => _router.canPop();
}
