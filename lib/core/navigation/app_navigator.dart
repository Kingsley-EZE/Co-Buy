/// Context-less navigation boundary for blocs, cubits, and use cases.
///
/// Deliberately has zero Flutter/go_router imports so domain and presentation
/// logic can trigger navigation without depending on the router package.
/// Call sites stay string-free by passing typed locations:
/// `navigator.goTo(const HomeRoute().location)`.
abstract interface class AppNavigator {
  /// Replace the current stack with [location].
  void goTo(String location, {Object? extra});

  /// Push [location] on top of the current stack.
  Future<T?> push<T>(String location, {Object? extra});

  /// Pop the top-most route, optionally returning [result].
  void pop<T>([T? result]);

  /// Whether there is a route to pop.
  bool canPop();
}
