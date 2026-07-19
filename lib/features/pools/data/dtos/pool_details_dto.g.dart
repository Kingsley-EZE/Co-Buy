// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoolDetailsResponseDto _$PoolDetailsResponseDtoFromJson(
  Map<String, dynamic> json,
) => PoolDetailsResponseDto(
  success: json['success'] as bool,
  data: PoolDetailsDto.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$PoolDetailsResponseDtoToJson(
  PoolDetailsResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data.toJson(),
  'message': instance.message,
};

PoolDetailsDto _$PoolDetailsDtoFromJson(Map<String, dynamic> json) =>
    PoolDetailsDto(
      id: json['id'] as String,
      leaderId: json['leaderId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      category: json['category'] == null
          ? null
          : PoolCategoryDto.fromJson(json['category'] as Map<String, dynamic>),
      targetAmount: (json['targetAmount'] as num).toDouble(),
      amountRaised: (json['amountRaised'] as num).toDouble(),
      amountPerSlot: (json['amountPerSlot'] as num).toDouble(),
      maxMembers: (json['maxMembers'] as num).toInt(),
      splitEven: json['splitEven'] as bool,
      beneficiaryAccountNumber: json['beneficiaryAccountNumber'] as String,
      beneficiaryAccountName: json['beneficiaryAccountName'] as String,
      beneficiaryBankName: json['beneficiaryBankName'] as String,
      shareLink: json['shareLink'] as String,
      deadlineAt: json['deadlineAt'] as String,
      status: json['status'] as String,
      slotsRemaining: (json['slotsRemaining'] as num).toInt(),
    );

Map<String, dynamic> _$PoolDetailsDtoToJson(PoolDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'leaderId': instance.leaderId,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category?.toJson(),
      'targetAmount': instance.targetAmount,
      'amountRaised': instance.amountRaised,
      'amountPerSlot': instance.amountPerSlot,
      'maxMembers': instance.maxMembers,
      'splitEven': instance.splitEven,
      'beneficiaryAccountNumber': instance.beneficiaryAccountNumber,
      'beneficiaryAccountName': instance.beneficiaryAccountName,
      'beneficiaryBankName': instance.beneficiaryBankName,
      'shareLink': instance.shareLink,
      'deadlineAt': instance.deadlineAt,
      'status': instance.status,
      'slotsRemaining': instance.slotsRemaining,
    };
