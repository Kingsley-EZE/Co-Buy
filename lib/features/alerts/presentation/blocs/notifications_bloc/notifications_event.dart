part of 'notifications_bloc.dart';

@freezed
sealed class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.fetchRequested() =
      NotificationsFetchRequested;

  const factory NotificationsEvent.socketStarted() =
      NotificationsSocketStarted;

  /// Silent background refetch when the socket pushes a new notification.
  const factory NotificationsEvent.socketUpdateReceived() =
      NotificationsSocketUpdateReceived;
}
