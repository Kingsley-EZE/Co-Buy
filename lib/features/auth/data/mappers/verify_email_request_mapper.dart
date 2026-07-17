import 'package:co_buy/features/auth/data/dtos/verify_email_request_dto.dart';
import 'package:co_buy/features/auth/domain/entities/verify_email_request.dart';

extension VerifyEmailRequestX on VerifyEmailRequest {
  VerifyEmailRequestDto toDto() {
    return VerifyEmailRequestDto(
      email: email,
      otp: otp,
    );
  }
}
