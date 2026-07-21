import 'package:envied/envied.dart';

import 'env.dart';

part 'env_dev.g.dart';

/// Development environment values, generated from `.env.dev` at build time.
@Envied(path: '.env.dev', obfuscate: true)
final class EnvDev implements Env {
  @override
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  final String baseUrl = _EnvDev.baseUrl;

  @override
  @EnviedField(varName: 'API_KEY', obfuscate: true)
  final String apiKey = _EnvDev.apiKey;

  @override
  @EnviedField(varName: 'SOCKET_BASE_URL', obfuscate: true)
  final String socketBaseUrl = _EnvDev.socketBaseUrl;
}
