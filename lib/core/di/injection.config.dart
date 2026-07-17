// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/forgot_password_usecase.dart'
    as _i560;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/domain/usecases/reset_password_usecase.dart'
    as _i474;
import '../../features/auth/domain/usecases/signup_usecase.dart' as _i57;
import '../../features/auth/domain/usecases/verify_email_usecase.dart' as _i30;
import '../../features/auth/presentation/blocs/auth_bloc/auth_bloc.dart'
    as _i661;
import '../../features/auth/presentation/blocs/login_form_bloc/login_form_bloc.dart'
    as _i182;
import '../../features/posts/data/datasources/posts_remote_data_source.dart'
    as _i538;
import '../../features/posts/data/repositories/posts_repository_impl.dart'
    as _i675;
import '../../features/posts/domain/repositories/posts_repository.dart'
    as _i245;
import '../../features/posts/domain/usecases/get_posts_usecase.dart' as _i158;
import '../config/env/env.dart' as _i513;
import '../navigation/app_navigator.dart' as _i397;
import '../navigation/go_router_navigator.dart' as _i489;
import '../network/dio_factory.dart' as _i798;
import '../network/interceptors/auth_interceptor.dart' as _i745;
import '../network/storage/token_storage.dart' as _i483;
import 'router_module.dart' as _i393;
import 'service_module.dart' as _i180;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final routerModule = _$RouterModule();
    final serviceModule = _$ServiceModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i182.LoginFormBloc>(() => _i182.LoginFormBloc());
    gh.singleton<_i583.GoRouter>(() => routerModule.goRouter);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => serviceModule.secureStorage,
    );
    gh.lazySingleton<_i513.Env>(() => serviceModule.env());
    gh.lazySingleton<_i483.TokenStorage>(
      () => _i483.TokenStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i397.AppNavigator>(
      () => _i489.GoRouterNavigator(gh<_i583.GoRouter>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.refreshDio(gh<_i513.Env>()),
      instanceName: 'refreshDio',
    );
    gh.lazySingleton<_i745.AuthInterceptor>(
      () => _i745.AuthInterceptor(
        gh<_i483.TokenStorage>(),
        gh<_i361.Dio>(instanceName: 'refreshDio'),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.appDio(gh<_i513.Env>(), gh<_i745.AuthInterceptor>()),
      instanceName: 'appDio',
    );
    gh.lazySingleton<_i538.PostsRemoteDataSource>(
      () => serviceModule.postsRemoteDataSource(
        gh<_i361.Dio>(instanceName: 'appDio'),
      ),
    );
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
      () => serviceModule.authRemoteDataSource(
        gh<_i361.Dio>(instanceName: 'appDio'),
      ),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i107.AuthRemoteDataSource>(),
        gh<_i483.TokenStorage>(),
      ),
    );
    gh.lazySingleton<_i245.PostsRepository>(
      () => _i675.PostsRepositoryImpl(gh<_i538.PostsRemoteDataSource>()),
    );
    gh.factory<_i560.ForgotPasswordUseCase>(
      () => _i560.ForgotPasswordUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i48.LogoutUseCase>(
      () => _i48.LogoutUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i474.ResetPasswordUseCase>(
      () => _i474.ResetPasswordUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i57.SignupUseCase>(
      () => _i57.SignupUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i30.VerifyEmailUseCase>(
      () => _i30.VerifyEmailUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i158.GetPostsUseCase>(
      () => _i158.GetPostsUseCase(gh<_i245.PostsRepository>()),
    );
    gh.lazySingleton<_i661.AuthBloc>(
      () => _i661.AuthBloc(
        gh<_i188.LoginUseCase>(),
        gh<_i57.SignupUseCase>(),
        gh<_i30.VerifyEmailUseCase>(),
        gh<_i560.ForgotPasswordUseCase>(),
        gh<_i474.ResetPasswordUseCase>(),
        gh<_i48.LogoutUseCase>(),
      ),
      dispose: _i661.disposeAuthBloc,
    );
    return this;
  }
}

class _$RouterModule extends _i393.RouterModule {}

class _$ServiceModule extends _i180.ServiceModule {}

class _$NetworkModule extends _i798.NetworkModule {}
