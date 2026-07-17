part of 'reset_password_form_bloc.dart';

@freezed
sealed class ResetPasswordFormEvent with _$ResetPasswordFormEvent {
  const factory ResetPasswordFormEvent.otpChanged(String otp) =
      ResetPasswordOtpChanged;

  const factory ResetPasswordFormEvent.newPasswordChanged(String newPassword) =
      ResetPasswordNewPasswordChanged;
}
