import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/dio_error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../../../core/network/storage/token_storage.dart';
import '../../domain/entities/login_request.dart';
import '../../domain/entities/signup_request.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/forgot_password_request.dart';
import '../../domain/entities/reset_password_request.dart';
import '../../domain/entities/verify_email_request.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../mappers/forgot_password_request_mapper.dart';
import '../mappers/login_request_mapper.dart';
import '../mappers/reset_password_request_mapper.dart';
import '../mappers/signup_request_mapper.dart';
import '../mappers/user_mapper.dart';
import '../mappers/verify_email_request_mapper.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote, this._tokenStorage);

  final AuthRemoteDataSource _remote;
  final TokenStorage _tokenStorage;

  @override
  FutureResult<User> login(LoginRequest request) async {
    try {
      final dto = await _remote.loginUser(body: request.toDto());
      // Persist so AuthInterceptor attaches the token to every subsequent
      // request — the tokens never leave this layer.
      // TODO: pass refresh once the backend adds refreshToken to the response.
      await _tokenStorage.saveTokens(access: dto.data.accessToken);
      return Right(dto.data.user.toEntity());
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureResult<void> signup(SignupRequest request) async {
    try {
      await _remote.signupUser(body: request.toDto());
      return const Right(null);
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureResult<void> verifyEmail(VerifyEmailRequest request) async {
    try {
      await _remote.verifyEmail(body: request.toDto());
      return const Right(null);
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureResult<void> forgotPassword(ForgotPasswordRequest request) async {
    try {
      await _remote.forgotPassword(body: request.toDto());
      return const Right(null);
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureResult<void> resetPassword(ResetPasswordRequest request) async {
    try {
      await _remote.resetPassword(body: request.toDto());
      return const Right(null);
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureResult<void> logout() async {
    try {
      await _tokenStorage.clear();
      return const Right(null);
    } catch (_) {
      return const Left(CacheFailure('Failed to clear session'));
    }
  }
}
