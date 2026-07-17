import 'package:co_buy/features/auth/data/dtos/reset_password_request_dto.dart';
import 'package:co_buy/features/auth/domain/entities/reset_password_request.dart';

extension ResetPasswordRequestX on ResetPasswordRequest {
  ResetPasswordRequestDto toDto() {
    return ResetPasswordRequestDto(
      email: email,
      otp: otp,
      newPassword: newPassword,
    );
  }
}
