import 'package:co_buy/features/auth/data/dtos/forgot_password_request_dto.dart';
import 'package:co_buy/features/auth/domain/entities/forgot_password_request.dart';

extension ForgotPasswordRequestX on ForgotPasswordRequest {
  ForgotPasswordRequestDto toDto() {
    return ForgotPasswordRequestDto(email: email);
  }
}
