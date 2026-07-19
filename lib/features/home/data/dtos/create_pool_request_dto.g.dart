// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_pool_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePoolRequestDto _$CreatePoolRequestDtoFromJson(
  Map<String, dynamic> json,
) => CreatePoolRequestDto(
  name: json['name'] as String,
  description: json['description'] as String?,
  categoryId: json['categoryId'] as String,
  targetAmount: (json['targetAmount'] as num).toDouble(),
  maxMembers: (json['maxMembers'] as num).toInt(),
  splitEven: json['splitEven'] as bool,
  memberShareAmount: (json['memberShareAmount'] as num).toDouble(),
  beneficiaryAccountNumber: json['beneficiaryAccountNumber'] as String,
  beneficiaryAccountName: json['beneficiaryAccountName'] as String,
  beneficiaryBankName: json['beneficiaryBankName'] as String,
  beneficiaryBankCode: json['beneficiaryBankCode'] as String,
  deadlineAt: json['deadlineAt'] as String,
);

Map<String, dynamic> _$CreatePoolRequestDtoToJson(
  CreatePoolRequestDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': ?instance.description,
  'categoryId': instance.categoryId,
  'targetAmount': instance.targetAmount,
  'maxMembers': instance.maxMembers,
  'splitEven': instance.splitEven,
  'memberShareAmount': instance.memberShareAmount,
  'beneficiaryAccountNumber': instance.beneficiaryAccountNumber,
  'beneficiaryAccountName': instance.beneficiaryAccountName,
  'beneficiaryBankName': instance.beneficiaryBankName,
  'beneficiaryBankCode': instance.beneficiaryBankCode,
  'deadlineAt': instance.deadlineAt,
};
