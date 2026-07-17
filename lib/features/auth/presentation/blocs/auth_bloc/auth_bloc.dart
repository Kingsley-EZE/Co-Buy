import 'package:co_buy/features/auth/domain/entities/forgot_password_request.dart';
import 'package:co_buy/features/auth/domain/entities/login_request.dart';
import 'package:co_buy/features/auth/domain/entities/reset_password_request.dart';
import 'package:co_buy/features/auth/domain/entities/signup_request.dart';
import 'package:co_buy/features/auth/domain/entities/verify_email_request.dart';
import 'package:co_buy/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/login_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/signup_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/verify_email_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._loginUseCase,
    this._signupUseCase,
    this._verifyEmailUseCase,
    this._forgotPasswordUseCase,
    this._resetPasswordUseCase,
  ) : super(const AuthState.initial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthSignupRequested>(_onSignupRequested);
    on<AuthVerifyEmailRequested>(_onVerifyEmailRequested);
    on<AuthForgotPasswordRequested>(_onForgotPasswordRequested);
    on<AuthResetPasswordRequested>(_onResetPasswordRequested);
  }

  final LoginUseCase _loginUseCase;
  final SignupUseCase _signupUseCase;
  final VerifyEmailUseCase _verifyEmailUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _loginUseCase(
      LoginRequest(username: event.username, password: event.password, expiresInMins: 30),
    );

    result.fold(
      (failure) => emit(AuthState.failure(failure.message)),
      (_) => emit(const AuthState.success()),
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
}
