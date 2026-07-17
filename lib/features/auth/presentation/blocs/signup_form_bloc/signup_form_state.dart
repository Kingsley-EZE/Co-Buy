part of 'signup_form_bloc.dart';

@freezed
abstract class SignupFormState with _$SignupFormState {
  const SignupFormState._();

  const factory SignupFormState({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String email,
    @Default('') String password,
  }) = _SignupFormState;

  String? get firstNameError =>
      AppValidators.required(firstName, message: 'First name is required');

  String? get lastNameError =>
      AppValidators.required(lastName, message: 'Last name is required');

  String? get emailError => AppValidators.email(email);

  String? get passwordError =>
      AppValidators.required(password, message: 'Password is required');

  bool get canSubmit =>
      firstNameError == null &&
      lastNameError == null &&
      emailError == null &&
      passwordError == null;
}
