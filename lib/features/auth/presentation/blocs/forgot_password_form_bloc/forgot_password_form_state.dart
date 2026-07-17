part of 'forgot_password_form_bloc.dart';

@freezed
abstract class ForgotPasswordFormState with _$ForgotPasswordFormState {
  const ForgotPasswordFormState._();

  const factory ForgotPasswordFormState({@Default('') String email}) =
      _ForgotPasswordFormState;

  String? get emailError => AppValidators.email(email);

  bool get canSubmit => emailError == null;
}
