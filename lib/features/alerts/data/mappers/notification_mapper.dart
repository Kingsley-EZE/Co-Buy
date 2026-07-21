import 'package:co_buy/features/alerts/data/dtos/notification_dto.dart';
import 'package:co_buy/features/alerts/domain/entities/app_notification.dart';

extension NotificationDtoX on NotificationDto {
  AppNotification toEntity() => AppNotification(
    id: id,
    userId: userId,
    type: _typeFromApi(type),
    title: title,
    message: message,
    poolId: poolId,
    isRead: isRead,
    readAt: readAt != null ? DateTime.parse(readAt!) : null,
    createdAt: DateTime.parse(createdAt),
    updatedAt: DateTime.parse(updatedAt),
  );

  /// Unknown type values fall back to [NotificationType.unknown] so new
  /// server notification categories don't crash the app.
  static NotificationType _typeFromApi(String raw) =>
      switch (raw.toUpperCase()) {
        'ADDED_TO_POOL' => NotificationType.addedToPool,
        _ => NotificationType.unknown,
      };
}
