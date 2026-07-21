part of 'notifications_bloc.dart';

@freezed
sealed class NotificationsEvent with _$NotificationsEvent {
  /// Loads (or reloads) the notification list; also dispatched by the retry
  /// button.
  const factory NotificationsEvent.fetchRequested() =
      NotificationsFetchRequested;
}
