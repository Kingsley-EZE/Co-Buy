import 'package:envied/envied.dart';

import 'env.dart';

part 'env_prod.g.dart';

/// Production environment values, generated from `.env.prod` at build time.
@Envied(path: '.env.prod', obfuscate: true)
final class EnvProd implements Env {
  @override
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  final String baseUrl = _EnvProd.baseUrl;

  @override
  @EnviedField(varName: 'API_KEY', obfuscate: true)
  final String apiKey = _EnvProd.apiKey;
}
