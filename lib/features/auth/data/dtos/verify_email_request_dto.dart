import 'package:json_annotation/json_annotation.dart';

part 'verify_email_request_dto.g.dart';

@JsonSerializable()
class VerifyEmailRequestDto {
  const VerifyEmailRequestDto({
    required this.email,
    required this.otp,
  });

  final String email, otp;

  factory VerifyEmailRequestDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyEmailRequestDtoToJson(this);
}
