import 'env/env.dart';
import 'env/env_dev.dart';
import 'env/env_prod.dart';
import 'flavor.dart';

/// Global, flavor-aware configuration for the app.
///
/// Initialised exactly once during `bootstrap()` via [AppConfig.init]. After
/// that, any layer (networking, UI, logging) can read the active [flavor], the
/// resolved [env] values, and derived display settings without threading the
/// flavor through constructors.
abstract final class AppConfig {
  static late final Flavor _flavor;
  static late final Env _env;

  /// Wire up the active flavor and its environment. Call once at startup.
  static void init(Flavor flavor) {
    _flavor = flavor;
    _env = switch (flavor) {
      .dev => EnvDev(),
      .prod => EnvProd(),
    };
  }

  /// The flavor the app was launched with.
  static Flavor get flavor => _flavor;

  /// Environment values (base URL, keys) for the active flavor.
  static Env get env => _env;

  /// User-facing app name for the active flavor.
  static String get appName => switch (_flavor) {
    Flavor.dev => 'Co Buy Dev',
    Flavor.prod => 'Co Buy',
  };

  /// Whether the app is running the development flavor.
  static bool get isDev => _flavor == Flavor.dev;
}
