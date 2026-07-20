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
import '../../features/auth/presentation/blocs/forgot_password_form_bloc/forgot_password_form_bloc.dart'
    as _i876;
import '../../features/auth/presentation/blocs/login_form_bloc/login_form_bloc.dart'
    as _i182;
import '../../features/auth/presentation/blocs/reset_password_form_bloc/reset_password_form_bloc.dart'
    as _i910;
import '../../features/auth/presentation/blocs/signup_form_bloc/signup_form_bloc.dart'
    as _i353;
import '../../features/home/data/datasources/create_pool_data_source.dart'
    as _i736;
import '../../features/home/data/datasources/pools_data_source.dart' as _i694;
import '../../features/home/data/repositories/create_pool_repository_impl.dart'
    as _i866;
import '../../features/home/data/repositories/pools_repository_impl.dart'
    as _i590;
import '../../features/home/domain/repositories/create_pool_repository.dart'
    as _i742;
import '../../features/home/domain/repositories/pools_repository.dart'
    as _i1062;
import '../../features/home/domain/usecases/create_pool_usecase.dart' as _i971;
import '../../features/home/domain/usecases/get_banks_usecase.dart' as _i813;
import '../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i967;
import '../../features/home/domain/usecases/get_pools_usecase.dart' as _i162;
import '../../features/home/domain/usecases/lookup_account_name_usecase.dart'
    as _i922;
import '../../features/home/presentation/blocs/create_pool_bloc/create_pool_bloc.dart'
    as _i350;
import '../../features/home/presentation/blocs/create_pool_form_bloc/create_pool_form_bloc.dart'
    as _i832;
import '../../features/home/presentation/blocs/pools_bloc/pools_bloc.dart'
    as _i148;
import '../../features/pools/data/datasources/join_pool_data_source.dart'
    as _i1065;
import '../../features/pools/data/datasources/pool_details_data_source.dart'
    as _i313;
import '../../features/pools/data/datasources/pool_payment_data_source.dart'
    as _i255;
import '../../features/pools/data/repositories/join_pool_repository_impl.dart'
    as _i283;
import '../../features/pools/data/repositories/pool_details_repository_impl.dart'
    as _i1035;
import '../../features/pools/data/repositories/pool_payment_repository_impl.dart'
    as _i975;
import '../../features/pools/domain/repositories/join_pool_repository.dart'
    as _i274;
import '../../features/pools/domain/repositories/pool_details_repository.dart'
    as _i402;
import '../../features/pools/domain/repositories/pool_payment_repository.dart'
    as _i343;
import '../../features/pools/domain/usecases/get_pool_details_usecase.dart'
    as _i547;
import '../../features/pools/domain/usecases/get_pool_members_usecase.dart'
    as _i410;
import '../../features/pools/domain/usecases/join_pool_usecase.dart' as _i370;
import '../../features/pools/domain/usecases/pay_for_pool_usecase.dart'
    as _i717;
import '../../features/pools/presentation/blocs/join_pool_bloc/join_pool_bloc.dart'
    as _i778;
import '../../features/pools/presentation/blocs/join_pool_form_bloc/join_pool_form_bloc.dart'
    as _i575;
import '../../features/pools/presentation/blocs/pool_details_bloc/pool_details_bloc.dart'
    as _i1015;
import '../../features/pools/presentation/blocs/pool_payment_bloc/pool_payment_bloc.dart'
    as _i851;
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
    gh.factory<_i876.ForgotPasswordFormBloc>(
      () => _i876.ForgotPasswordFormBloc(),
    );
    gh.factory<_i182.LoginFormBloc>(() => _i182.LoginFormBloc());
    gh.factory<_i910.ResetPasswordFormBloc>(
      () => _i910.ResetPasswordFormBloc(),
    );
    gh.factory<_i353.SignupFormBloc>(() => _i353.SignupFormBloc());
    gh.factory<_i832.CreatePoolFormBloc>(() => _i832.CreatePoolFormBloc());
    gh.factory<_i575.JoinPoolFormBloc>(() => _i575.JoinPoolFormBloc());
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
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
      () => serviceModule.authRemoteDataSource(
        gh<_i361.Dio>(instanceName: 'appDio'),
      ),
    );
    gh.lazySingleton<_i736.CreatePoolDataSource>(
      () => serviceModule.createPoolDataSource(
        gh<_i361.Dio>(instanceName: 'appDio'),
      ),
    );
    gh.lazySingleton<_i694.PoolsDataSource>(
      () =>
          serviceModule.poolsDataSource(gh<_i361.Dio>(instanceName: 'appDio')),
    );
    gh.lazySingleton<_i313.PoolDetailsDataSource>(
      () => serviceModule.poolDetailsDataSource(
        gh<_i361.Dio>(instanceName: 'appDio'),
      ),
    );
    gh.lazySingleton<_i1065.JoinPoolDataSource>(
      () => serviceModule.joinPoolDataSource(
        gh<_i361.Dio>(instanceName: 'appDio'),
      ),
    );
    gh.lazySingleton<_i255.PoolPaymentDataSource>(
      () => serviceModule.poolPaymentDataSource(
        gh<_i361.Dio>(instanceName: 'appDio'),
      ),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i107.AuthRemoteDataSource>(),
        gh<_i483.TokenStorage>(),
      ),
    );
    gh.lazySingleton<_i1062.PoolsRepository>(
      () => _i590.PoolsRepositoryImpl(gh<_i694.PoolsDataSource>()),
    );
    gh.lazySingleton<_i343.PoolPaymentRepository>(
      () => _i975.PoolPaymentRepositoryImpl(gh<_i255.PoolPaymentDataSource>()),
    );
    gh.lazySingleton<_i274.JoinPoolRepository>(
      () => _i283.JoinPoolRepositoryImpl(gh<_i1065.JoinPoolDataSource>()),
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
    gh.factory<_i717.PayForPoolUseCase>(
      () => _i717.PayForPoolUseCase(gh<_i343.PoolPaymentRepository>()),
    );
    gh.factory<_i162.GetPoolsUseCase>(
      () => _i162.GetPoolsUseCase(gh<_i1062.PoolsRepository>()),
    );
    gh.factory<_i370.JoinPoolUseCase>(
      () => _i370.JoinPoolUseCase(gh<_i274.JoinPoolRepository>()),
    );
    gh.lazySingleton<_i742.CreatePoolRepository>(
      () => _i866.CreatePoolRepositoryImpl(gh<_i736.CreatePoolDataSource>()),
    );
    gh.lazySingleton<_i402.PoolDetailsRepository>(
      () => _i1035.PoolDetailsRepositoryImpl(gh<_i313.PoolDetailsDataSource>()),
    );
    gh.factory<_i851.PoolPaymentBloc>(
      () => _i851.PoolPaymentBloc(gh<_i717.PayForPoolUseCase>()),
    );
    gh.factory<_i148.PoolsBloc>(
      () => _i148.PoolsBloc(gh<_i162.GetPoolsUseCase>()),
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
    gh.factory<_i971.CreatePoolUseCase>(
      () => _i971.CreatePoolUseCase(gh<_i742.CreatePoolRepository>()),
    );
    gh.factory<_i813.GetBanksUseCase>(
      () => _i813.GetBanksUseCase(gh<_i742.CreatePoolRepository>()),
    );
    gh.factory<_i967.GetCategoriesUseCase>(
      () => _i967.GetCategoriesUseCase(gh<_i742.CreatePoolRepository>()),
    );
    gh.factory<_i922.LookupAccountNameUseCase>(
      () => _i922.LookupAccountNameUseCase(gh<_i742.CreatePoolRepository>()),
    );
    gh.factory<_i547.GetPoolDetailsUseCase>(
      () => _i547.GetPoolDetailsUseCase(gh<_i402.PoolDetailsRepository>()),
    );
    gh.factory<_i410.GetPoolMembersUseCase>(
      () => _i410.GetPoolMembersUseCase(gh<_i402.PoolDetailsRepository>()),
    );
    gh.factory<_i1015.PoolDetailsBloc>(
      () => _i1015.PoolDetailsBloc(
        gh<_i547.GetPoolDetailsUseCase>(),
        gh<_i410.GetPoolMembersUseCase>(),
      ),
    );
    gh.lazySingleton<_i350.CreatePoolBloc>(
      () => _i350.CreatePoolBloc(
        gh<_i813.GetBanksUseCase>(),
        gh<_i967.GetCategoriesUseCase>(),
        gh<_i922.LookupAccountNameUseCase>(),
        gh<_i971.CreatePoolUseCase>(),
      ),
      dispose: _i350.disposeCreatePoolBloc,
    );
    gh.lazySingleton<_i778.JoinPoolBloc>(
      () => _i778.JoinPoolBloc(
        gh<_i813.GetBanksUseCase>(),
        gh<_i922.LookupAccountNameUseCase>(),
        gh<_i370.JoinPoolUseCase>(),
      ),
      dispose: _i778.disposeJoinPoolBloc,
    );
    return this;
  }
}

class _$RouterModule extends _i393.RouterModule {}

class _$ServiceModule extends _i180.ServiceModule {}

class _$NetworkModule extends _i798.NetworkModule {}
