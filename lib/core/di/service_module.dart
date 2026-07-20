import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/home/data/datasources/create_pool_data_source.dart';
import '../../features/home/data/datasources/pools_data_source.dart';
import '../../features/pools/data/datasources/join_pool_data_source.dart';
import '../../features/pools/data/datasources/pool_details_data_source.dart';
import '../../features/pools/data/datasources/pool_payment_data_source.dart';
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
  AuthRemoteDataSource authRemoteDataSource(@Named('appDio') Dio dio) =>
      AuthRemoteDataSource(dio);

  @lazySingleton
  CreatePoolDataSource createPoolDataSource(@Named('appDio') Dio dio) =>
      CreatePoolDataSource(dio);

  @lazySingleton
  PoolsDataSource poolsDataSource(@Named('appDio') Dio dio) =>
      PoolsDataSource(dio);

  @lazySingleton
  PoolDetailsDataSource poolDetailsDataSource(@Named('appDio') Dio dio) =>
      PoolDetailsDataSource(dio);

  @lazySingleton
  JoinPoolDataSource joinPoolDataSource(@Named('appDio') Dio dio) =>
      JoinPoolDataSource(dio);

  @lazySingleton
  PoolPaymentDataSource poolPaymentDataSource(@Named('appDio') Dio dio) =>
      PoolPaymentDataSource(dio);
}
