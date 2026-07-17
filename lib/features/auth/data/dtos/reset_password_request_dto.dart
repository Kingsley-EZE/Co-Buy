import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_dto.g.dart';

@JsonSerializable()
class ResetPasswordRequestDto {
  const ResetPasswordRequestDto({
    required this.email,
    required this.otp,
    required this.newPassword,
  });

  final String email, otp, newPassword;

  factory ResetPasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordRequestDtoToJson(this);
}
