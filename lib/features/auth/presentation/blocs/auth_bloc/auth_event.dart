part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = AuthLoginRequested;

  const factory AuthEvent.signupRequested({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) = AuthSignupRequested;

  const factory AuthEvent.verifyEmailRequested({
    required String email,
    required String otp,
  }) = AuthVerifyEmailRequested;

  const factory AuthEvent.resendOtpRequested({required String email}) =
      AuthResendOtpRequested;

  const factory AuthEvent.forgotPasswordRequested({required String email}) =
      AuthForgotPasswordRequested;

  const factory AuthEvent.resetPasswordRequested({
    required String email,
    required String otp,
    required String newPassword,
  }) = AuthResetPasswordRequested;

  const factory AuthEvent.logoutRequested() = AuthLogoutRequested;
}
