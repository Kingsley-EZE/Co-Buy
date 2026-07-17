import 'package:json_annotation/json_annotation.dart';

part 'signup_request_dto.g.dart';

@JsonSerializable()
class SignupRequestDto {
  const SignupRequestDto({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  final String firstName, lastName, email, password;

  factory SignupRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SignupRequestDtoToJson(this);
}
