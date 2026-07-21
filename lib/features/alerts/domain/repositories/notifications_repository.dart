import '../../../../core/error/result.dart';
import '../entities/app_notification.dart';

abstract class NotificationsRepository {
  FutureResult<List<AppNotification>> getNotifications();

  FutureResult<void> markAsRead(String id);
}
