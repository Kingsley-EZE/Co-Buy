import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/posts/data/datasources/posts_remote_data_source.dart';
import '../config/app_config.dart';
import '../config/env/env.dart';

/// Registers third-party types and Retrofit services that injectable cannot
/// construct from annotations alone.
@module
abstract class ServiceModule {
  /// The active flavor's environment, resolved by `AppConfig.init`.
  @lazySingleton
  Env env() => AppConfig.env;

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  PostsRemoteDataSource postsRemoteDataSource(@Named('appDio') Dio dio) =>
      PostsRemoteDataSource(dio);

  @lazySingleton
  AuthRemoteDataSource authRemoteDataSource(@Named('appDio') Dio dio) =>
      AuthRemoteDataSource(dio);
}
