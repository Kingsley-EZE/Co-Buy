import 'package:json_annotation/json_annotation.dart';

part 'notification_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class NotificationsResponseDto {
  const NotificationsResponseDto({
    required this.success,
    required this.data,
    this.message,
  });

  final bool success;
  final List<NotificationDto> data;
  final String? message;

  factory NotificationsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsResponseDtoToJson(this);
}

@JsonSerializable()
class NotificationDto {
  const NotificationDto({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.message,
    this.poolId,
    required this.isRead,
    this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String userId;
  final String type;
  final String title;
  final String message;
  final String? poolId;
  final bool isRead;
  final String? readAt;
  final String createdAt;
  final String updatedAt;

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDtoToJson(this);
}
