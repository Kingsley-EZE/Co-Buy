import 'dart:async';

import 'package:co_buy/core/usecase/usecase.dart';
import 'package:co_buy/features/auth/domain/entities/forgot_password_request.dart';
import 'package:co_buy/features/auth/domain/entities/login_request.dart';
import 'package:co_buy/features/auth/domain/entities/reset_password_request.dart';
import 'package:co_buy/features/auth/domain/entities/signup_request.dart';
import 'package:co_buy/features/auth/domain/entities/user.dart';
import 'package:co_buy/features/auth/domain/entities/verify_email_request.dart';
import 'package:co_buy/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/login_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/logout_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/signup_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/verify_email_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

/// Dispose hook so get_it closes the bloc if the container is ever reset
/// (e.g. in tests) — in the running app it lives for the app's lifetime.
FutureOr<void> disposeAuthBloc(AuthBloc bloc) => bloc.close();

/// App-wide singleton for session, logout, and router redirects.
@LazySingleton(dispose: disposeAuthBloc)
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._loginUseCase,
    this._signupUseCase,
    this._verifyEmailUseCase,
    this._forgotPasswordUseCase,
    this._resetPasswordUseCase,
    this._logoutUseCase,
  ) : super(const AuthState.initial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthSignupRequested>(_onSignupRequested);
    on<AuthVerifyEmailRequested>(_onVerifyEmailRequested);
    on<AuthForgotPasswordRequested>(_onForgotPasswordRequested);
    on<AuthResetPasswordRequested>(_onResetPasswordRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  final LoginUseCase _loginUseCase;
  final SignupUseCase _signupUseCase;
  final VerifyEmailUseCase _verifyEmailUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final LogoutUseCase _logoutUseCase;

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _loginUseCase(
      LoginRequest(email: event.email, password: event.password),
    );

    /*
    Anything that needs the current user can now pattern-match it from the app-wide bloc,
     e.g. if (state case AuthAuthenticated(:final user)) Text('Welcome, ${user.firstName}').
     When profile/home features start consuming it in earnest,
    that's the cue for the session-holder step we discussed,
    so the user survives transient bloc states like a failed forgot-password submission.
    */
    result.fold(
      (failure) => emit(AuthState.failure(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onSignupRequested(
    AuthSignupRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _signupUseCase(
      SignupRequest(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
      ),
    );

    result.fold(
      (failure) => emit(AuthState.failure(failure.message)),
      (_) => emit(const AuthState.success()),
    );
  }

  Future<void> _onVerifyEmailRequested(
    AuthVerifyEmailRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _verifyEmailUseCase(
      VerifyEmailRequest(email: event.email, otp: event.otp),
    );

    result.fold(
      (failure) => emit(AuthState.failure(failure.message)),
      (_) => emit(const AuthState.success()),
    );
  }

  Future<void> _onForgotPasswordRequested(
    AuthForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _forgotPasswordUseCase(
      ForgotPasswordRequest(email: event.email),
    );

    result.fold(
      (failure) => emit(AuthState.failure(failure.message)),
      (_) => emit(const AuthState.success()),
    );
  }

  Future<void> _onResetPasswordRequested(
    AuthResetPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _resetPasswordUseCase(
      ResetPasswordRequest(
        email: event.email,
        otp: event.otp,
        newPassword: event.newPassword,
      ),
    );

    result.fold(
      (failure) => emit(AuthState.failure(failure.message)),
      (_) => emit(const AuthState.success()),
    );
  }

  /// Resets to [AuthInitial] so stale [AuthSuccess] can't linger after sign-out.
  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _logoutUseCase(const NoParams());

    result.fold(
      (failure) => emit(AuthState.failure(failure.message)),
      (_) => emit(const AuthState.initial()),
    );
  }
}
