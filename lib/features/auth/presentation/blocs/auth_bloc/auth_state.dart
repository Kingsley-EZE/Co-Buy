part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.authenticated(User user) = AuthAuthenticated;

  /// Login found an unverified account: an OTP was sent to [email] and no
  /// session starts until it's confirmed, so the page must collect the code
  /// rather than navigate.
  const factory AuthState.verificationRequired(String email) =
      AuthVerificationRequired;

  const factory AuthState.success() = AuthSuccess;

  const factory AuthState.failure(String message) = AuthFailure;

  /// Resend-OTP outcomes are distinct from [AuthSuccess]/[AuthFailure] so the
  /// OTP sheet (which pops on success and clears the code on failure) can
  /// react to a resend without disrupting the code entry in progress.
  const factory AuthState.resendOtpSuccess() = AuthResendOtpSuccess;

  const factory AuthState.resendOtpFailure(String message) =
      AuthResendOtpFailure;
}
