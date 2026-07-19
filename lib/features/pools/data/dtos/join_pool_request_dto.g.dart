// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_pool_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinPoolRequestDto _$JoinPoolRequestDtoFromJson(Map<String, dynamic> json) =>
    JoinPoolRequestDto(
      id: json['id'] as String,
      bankName: json['bankName'] as String,
      bankCode: json['bankCode'] as String,
      accountNumber: json['accountNumber'] as String,
      accountName: json['accountName'] as String,
      memberShareAmount: (json['memberShareAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$JoinPoolRequestDtoToJson(JoinPoolRequestDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bankName': instance.bankName,
      'bankCode': instance.bankCode,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'memberShareAmount': instance.memberShareAmount,
    };
