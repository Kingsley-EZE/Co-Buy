part of 'notifications_bloc.dart';

enum NotificationsStatus { initial, loading, success, failure }

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(NotificationsStatus.initial) NotificationsStatus status,
    @Default(<AppNotification>[]) List<AppNotification> notifications,
    String? error,
  }) = _NotificationsState;
}
