// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsResponseDto _$NotificationsResponseDtoFromJson(
  Map<String, dynamic> json,
) => NotificationsResponseDto(
  success: json['success'] as bool,
  data: (json['data'] as List<dynamic>)
      .map((e) => NotificationDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$NotificationsResponseDtoToJson(
  NotificationsResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data.map((e) => e.toJson()).toList(),
  'message': instance.message,
};

NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    NotificationDto(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      poolId: json['poolId'] as String?,
      isRead: json['isRead'] as bool,
      readAt: json['readAt'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$NotificationDtoToJson(NotificationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
      'poolId': instance.poolId,
      'isRead': instance.isRead,
      'readAt': instance.readAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
