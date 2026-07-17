import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponseDto {
  const LoginResponseDto({
    required this.success,
    required this.data,
    this.message,
  });

  final bool success;
  final LoginDataDto data;
  final String? message;

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginDataDto {
  // TODO: add refreshToken once the backend ships it.
  const LoginDataDto({required this.user, required this.accessToken});

  final UserDto user;
  final String accessToken;

  factory LoginDataDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataDtoToJson(this);
}

@JsonSerializable()
class UserDto {
  const UserDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.name,
    required this.isVerified,
    required this.role,
    this.avatar,
    this.phone,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String? avatar;
  final String firstName;
  final String lastName;
  final String? phone;
  final String email;
  final String name;
  final bool isVerified;
  final String role;
  final String? createdAt;
  final String? updatedAt;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
