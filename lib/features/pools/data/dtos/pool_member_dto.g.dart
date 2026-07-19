// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool_member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoolMembersResponseDto _$PoolMembersResponseDtoFromJson(
  Map<String, dynamic> json,
) => PoolMembersResponseDto(
  success: json['success'] as bool,
  data: (json['data'] as List<dynamic>)
      .map((e) => PoolMemberDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$PoolMembersResponseDtoToJson(
  PoolMembersResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data.map((e) => e.toJson()).toList(),
  'message': instance.message,
};

PoolMemberDto _$PoolMemberDtoFromJson(Map<String, dynamic> json) =>
    PoolMemberDto(
      id: json['id'] as String,
      poolId: json['poolId'] as String,
      userId: json['userId'] as String,
      state: json['state'] as String,
      joinedAt: json['joinedAt'] as String,
      user: json['user'] == null
          ? null
          : PoolMemberUserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PoolMemberDtoToJson(PoolMemberDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poolId': instance.poolId,
      'userId': instance.userId,
      'state': instance.state,
      'joinedAt': instance.joinedAt,
      'user': instance.user?.toJson(),
    };

PoolMemberUserDto _$PoolMemberUserDtoFromJson(Map<String, dynamic> json) =>
    PoolMemberUserDto(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$PoolMemberUserDtoToJson(PoolMemberUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'avatar': instance.avatar,
    };
