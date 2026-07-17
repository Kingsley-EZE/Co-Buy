import '../../../../core/error/result.dart';
import '../entities/forgot_password_request.dart';
import '../entities/login_request.dart';
import '../entities/reset_password_request.dart';
import '../entities/signup_request.dart';
import '../entities/verify_email_request.dart';

/// Domain contract for authentication.
///
/// Tokens are an infrastructure detail: [login] persists them to secure
/// storage (where `AuthInterceptor` picks them up) rather than returning them,
/// so callers only see success or a [Failure].
abstract class AuthRepository {
  /// Signs the user in and persists the session tokens on success.
  FutureResult<void> login(LoginRequest request);

  /// Registers a new account. Callers only see success or a [Failure].
  FutureResult<void> signup(SignupRequest request);

  /// Verifies the user's email with an OTP. Callers only see success or a
  /// [Failure].
  FutureResult<void> verifyEmail(VerifyEmailRequest request);

  /// Requests a password-reset OTP to be sent to the given email.
  FutureResult<void> forgotPassword(ForgotPasswordRequest request);

  /// Resets the password using the OTP sent to the user's email.
  FutureResult<void> resetPassword(ResetPasswordRequest request);

  /// Clears the persisted session tokens.
  FutureResult<void> logout();
}
