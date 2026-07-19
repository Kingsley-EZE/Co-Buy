// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoolsResponseDto _$PoolsResponseDtoFromJson(Map<String, dynamic> json) =>
    PoolsResponseDto(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => PoolDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PoolsResponseDtoToJson(PoolsResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'message': instance.message,
    };

PoolDto _$PoolDtoFromJson(Map<String, dynamic> json) => PoolDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  leader: json['leader'] == null
      ? null
      : PoolLeaderDto.fromJson(json['leader'] as Map<String, dynamic>),
  category: json['category'] == null
      ? null
      : PoolCategoryDto.fromJson(json['category'] as Map<String, dynamic>),
  targetAmount: (json['targetAmount'] as num).toDouble(),
  amountRaised: (json['amountRaised'] as num).toDouble(),
  amountPerSlot: (json['amountPerSlot'] as num).toDouble(),
  maxMembers: (json['maxMembers'] as num).toInt(),
  splitEven: json['splitEven'] as bool,
  beneficiaryAccountName: json['beneficiaryAccountName'] as String,
  beneficiaryBankName: json['beneficiaryBankName'] as String,
  shareLink: json['shareLink'] as String,
  deadlineAt: json['deadlineAt'] as String,
  status: json['status'] as String,
  slotsRemaining: (json['slotsRemaining'] as num).toInt(),
);

Map<String, dynamic> _$PoolDtoToJson(PoolDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'leader': instance.leader?.toJson(),
  'category': instance.category?.toJson(),
  'targetAmount': instance.targetAmount,
  'amountRaised': instance.amountRaised,
  'amountPerSlot': instance.amountPerSlot,
  'maxMembers': instance.maxMembers,
  'splitEven': instance.splitEven,
  'beneficiaryAccountName': instance.beneficiaryAccountName,
  'beneficiaryBankName': instance.beneficiaryBankName,
  'shareLink': instance.shareLink,
  'deadlineAt': instance.deadlineAt,
  'status': instance.status,
  'slotsRemaining': instance.slotsRemaining,
};

PoolLeaderDto _$PoolLeaderDtoFromJson(Map<String, dynamic> json) =>
    PoolLeaderDto(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$PoolLeaderDtoToJson(PoolLeaderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };
