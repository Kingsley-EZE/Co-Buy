part of 'forgot_password_form_bloc.dart';

@freezed
sealed class ForgotPasswordFormEvent with _$ForgotPasswordFormEvent {
  const factory ForgotPasswordFormEvent.emailChanged(String email) =
      ForgotPasswordEmailChanged;
}
