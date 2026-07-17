part of 'login_form_bloc.dart';

@freezed
abstract class LoginFormState with _$LoginFormState {
  const LoginFormState._();

  const factory LoginFormState({
    @Default('') String email,
    @Default('') String password,
    @Default(true) bool rememberMe,
  }) = _LoginFormState;

  String? get emailError => AppValidators.email(email);

  String? get passwordError =>
      AppValidators.required(password, message: 'Password is required');

  bool get canSubmit => emailError == null && passwordError == null;
}
