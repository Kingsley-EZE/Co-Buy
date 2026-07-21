import 'package:co_buy/features/auth/data/dtos/forgot_password_request_dto.dart';
import 'package:co_buy/features/auth/data/dtos/login_request_dto.dart';
import 'package:co_buy/features/auth/data/dtos/login_response_dto.dart';
import 'package:co_buy/features/auth/data/dtos/reset_password_request_dto.dart';
import 'package:co_buy/features/auth/data/dtos/signup_request_dto.dart';
import 'package:co_buy/features/auth/data/dtos/verify_email_request_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote_data_source.g.dart';

@RestApi()
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String? baseUrl}) =
      _AuthRemoteDataSource;

  @POST('/auth/login')
  Future<LoginResponseDto> loginUser({@Body() required LoginRequestDto body});

  @POST('/auth/signup')
  Future<void> signupUser({@Body() required SignupRequestDto body});

  @POST('/auth/verify-email')
  Future<void> verifyEmail({@Body() required VerifyEmailRequestDto body});

  @POST('/auth/resend-otp')
  Future<void> resendOtp({@Field('email') required String email});

  @POST('/auth/forgot-password')
  Future<void> forgotPassword({@Body() required ForgotPasswordRequestDto body});

  @POST('/auth/reset-password')
  Future<void> resetPassword({@Body() required ResetPasswordRequestDto body});
}
