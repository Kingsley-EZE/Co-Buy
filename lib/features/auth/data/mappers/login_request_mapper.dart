import 'package:co_buy/features/auth/data/dtos/login_request_dto.dart';
import 'package:co_buy/features/auth/domain/entities/login_request.dart';

extension LoginRequestDtoX on LoginRequestDto {
  LoginRequest toEntity() {
    return LoginRequest(email: email, password: password);
  }
}

extension LoginRequestX on LoginRequest {
  LoginRequestDto toDto() {
    return LoginRequestDto(email: email, password: password);
  }
}
