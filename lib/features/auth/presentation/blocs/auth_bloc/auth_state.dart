part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;

  /// A signed-in session with the [user] the login response returned.
  const factory AuthState.authenticated(User user) = AuthAuthenticated;

  /// Terminal state for the user-less flows (signup, verify email,
  /// forgot/reset password).
  const factory AuthState.success() = AuthSuccess;

  const factory AuthState.failure(String message) = AuthFailure;
}
