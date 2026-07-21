part of 'notifications_bloc.dart';

@freezed
sealed class NotificationsEvent with _$NotificationsEvent {
  /// Loads (or reloads) the notification list; also dispatched by the retry
  /// button.
  const factory NotificationsEvent.fetchRequested() =
      NotificationsFetchRequested;

  /// Starts real-time updates via WebSocket. Call once after fetchRequested.
  const factory NotificationsEvent.socketStarted() =
      NotificationsSocketStarted;

  /// Internal: the socket pushed a new notification — triggers a silent
  /// background refetch of the list.
  const factory NotificationsEvent.socketUpdateReceived() =
      NotificationsSocketUpdateReceived;
}
