// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailRequestDto _$VerifyEmailRequestDtoFromJson(
  Map<String, dynamic> json,
) => VerifyEmailRequestDto(
  email: json['email'] as String,
  otp: json['otp'] as String,
);

Map<String, dynamic> _$VerifyEmailRequestDtoToJson(
  VerifyEmailRequestDto instance,
) => <String, dynamic>{'email': instance.email, 'otp': instance.otp};
