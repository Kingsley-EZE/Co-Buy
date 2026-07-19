part of 'signup_form_bloc.dart';

@freezed
sealed class SignupFormEvent with _$SignupFormEvent {
  const factory SignupFormEvent.firstNameChanged(String firstName) =
      SignupFirstNameChanged;

  const factory SignupFormEvent.lastNameChanged(String lastName) =
      SignupLastNameChanged;

  const factory SignupFormEvent.emailChanged(String email) = SignupEmailChanged;

  const factory SignupFormEvent.passwordChanged(String password) =
      SignupPasswordChanged;
}
