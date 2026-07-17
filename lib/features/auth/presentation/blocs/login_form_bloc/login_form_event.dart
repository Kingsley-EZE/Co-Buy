part of 'login_form_bloc.dart';

@freezed
sealed class LoginFormEvent with _$LoginFormEvent {
  const factory LoginFormEvent.emailChanged(String email) = LoginEmailChanged;

  const factory LoginFormEvent.passwordChanged(String password) =
      LoginPasswordChanged;

  const factory LoginFormEvent.rememberMeToggled() = LoginRememberMeToggled;
}
