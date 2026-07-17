part of 'reset_password_form_bloc.dart';

@freezed
abstract class ResetPasswordFormState with _$ResetPasswordFormState {
  const ResetPasswordFormState._();

  const factory ResetPasswordFormState({
    @Default('') String otp,
    @Default('') String newPassword,
  }) = _ResetPasswordFormState;

  String? get otpError => AppValidators.otp(otp);

  String? get newPasswordError =>
      AppValidators.required(newPassword, message: 'New password is required');

  bool get canSubmit => otpError == null && newPasswordError == null;
}
