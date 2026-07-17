import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';
import '../config/env/env.dart';
import 'interceptors/app_dio_logger.dart';
import 'interceptors/auth_interceptor.dart';

/// Builds the Dio instances used across the app.
///
/// Two instances exist on purpose:
///  * `appDio` — the one every Retrofit service uses; carries auth, retry and
///    logging interceptors.
///  * `refreshDio` — a bare client used only by [AuthInterceptor] to call the
///    token-refresh endpoint and replay failed requests, avoiding the queued
///    interceptor deadlock.
@module
abstract class NetworkModule {
  /// Primary Dio used by all API services.
  @Named('appDio')
  @lazySingleton
  Dio appDio(Env env, AuthInterceptor auth) {
    final dio = Dio(_baseOptions(env));
    dio.interceptors.addAll([
      auth,
      RetryInterceptor(
        dio: dio,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
        // Retries only retryable statuses by default (408, 500-504, etc.).
      ),
      if (AppConfig.isDev) AppDioLogger(tag: 'APP', useColors: false),
    ]);
    return dio;
  }

  /// Bare Dio WITHOUT [AuthInterceptor] — used only to refresh tokens.
  ///
  /// Carries only a dev logger; note it prints the refresh/access tokens.
  @Named('refreshDio')
  @lazySingleton
  Dio refreshDio(Env env) {
    final dio = Dio(_baseOptions(env));
    if (AppConfig.isDev) {
      dio.interceptors.add(AppDioLogger(tag: 'REFRESH', useColors: false));
    }
    return dio;
  }

  static BaseOptions _baseOptions(Env env) => BaseOptions(
        baseUrl: env.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        responseType: ResponseType.json,
      );
}
