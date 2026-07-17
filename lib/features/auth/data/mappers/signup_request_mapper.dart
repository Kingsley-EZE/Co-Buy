import 'package:co_buy/features/auth/data/dtos/signup_request_dto.dart';
import 'package:co_buy/features/auth/domain/entities/signup_request.dart';

extension SignupRequestX on SignupRequest {
  SignupRequestDto toDto() {
    return SignupRequestDto(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }
}
