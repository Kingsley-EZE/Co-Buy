/// Contract for environment-specific values.
///
/// Each flavor provides a concrete implementation ([EnvDev], [EnvProd]) whose
/// values are generated at build time by `envied` from the matching `.env.*`
/// file. Consumers should depend on this interface (via `AppConfig.env`) rather
/// than a concrete class so the active flavor stays the single source of truth.
abstract interface class Env {
  /// Base URL for the REST API (used by the Dio/Retrofit client).
  String get baseUrl;
  String get socketBaseUrl;
}
