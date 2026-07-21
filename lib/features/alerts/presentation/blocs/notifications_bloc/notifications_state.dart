part of 'notifications_bloc.dart';

enum NotificationsStatus { initial, loading, success, failure }

@freezed
abstract class NotificationsState with _$NotificationsState {
  const NotificationsState._();

  const factory NotificationsState({
    @Default(NotificationsStatus.initial) NotificationsStatus status,
    @Default(<AppNotification>[]) List<AppNotification> notifications,
    String? error,
  }) = _NotificationsState;

  int get unreadCount => notifications.where((n) => !n.isRead).length;
}
