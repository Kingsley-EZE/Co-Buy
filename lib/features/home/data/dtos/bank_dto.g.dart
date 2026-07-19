// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanksResponseDto _$BanksResponseDtoFromJson(Map<String, dynamic> json) =>
    BanksResponseDto(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => BankDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BanksResponseDtoToJson(BanksResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'message': instance.message,
    };

BankDto _$BankDtoFromJson(Map<String, dynamic> json) =>
    BankDto(name: json['name'] as String, code: json['code'] as String);

Map<String, dynamic> _$BankDtoToJson(BankDto instance) => <String, dynamic>{
  'name': instance.name,
  'code': instance.code,
};
