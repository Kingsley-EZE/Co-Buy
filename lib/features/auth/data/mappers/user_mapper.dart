import 'package:co_buy/features/auth/data/dtos/login_response_dto.dart';
import 'package:co_buy/features/auth/domain/entities/user.dart';

extension UserDtoX on UserDto {
  User toEntity() {
    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      name: name,
      isVerified: isVerified,
      role: role,
      avatar: avatar,
      phone: phone,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
    );
  }
}
