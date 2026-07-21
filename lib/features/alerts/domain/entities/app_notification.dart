import 'package:equatable/equatable.dart';

/// The server-reported notification types. Unknown values from new server
/// releases degrade to [NotificationType.unknown] so the app doesn't crash.
enum NotificationType { addedToPool, unknown }

/// A single notification belonging to the authenticated user.
class AppNotification extends Equatable {
  const AppNotification({
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
  final NotificationType type;
  final String title;
  final String message;

  /// Present only when the notification relates to a pool.
  final String? poolId;

  final bool isRead;

  /// Null when the notification has not been read yet.
  final DateTime? readAt;

  final DateTime createdAt;
  final DateTime updatedAt;

  AppNotification copyWith({bool? isRead, DateTime? readAt}) => AppNotification(
    id: id,
    userId: userId,
    type: type,
    title: title,
    message: message,
    poolId: poolId,
    isRead: isRead ?? this.isRead,
    readAt: readAt ?? this.readAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  @override
  List<Object?> get props => [
    id,
    userId,
    type,
    title,
    message,
    poolId,
    isRead,
    readAt,
    createdAt,
    updatedAt,
  ];
}
