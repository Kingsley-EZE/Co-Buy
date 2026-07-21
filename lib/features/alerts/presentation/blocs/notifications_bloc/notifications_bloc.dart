import 'dart:async';

import 'package:co_buy/core/network/sockets/socket_events.dart';
import 'package:co_buy/core/network/sockets/socket_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/app_notification.dart';
import '../../../domain/usecases/get_notifications_usecase.dart';
import '../../../domain/usecases/mark_notification_read_usecase.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';
part 'notifications_bloc.freezed.dart';

/// Dispose hook so get_it closes the bloc if the container is ever reset
/// (e.g. in tests) — in the running app it lives for the app's lifetime.
FutureOr<void> disposeNotificationsBloc(NotificationsBloc bloc) => bloc.close();

/// App-wide singleton: the unread count feeds the home bell and the Alerts
/// nav-bar badge, both of which live outside the alerts page, so the list and
/// its count must survive tab switches rather than being page-scoped.
@LazySingleton(dispose: disposeNotificationsBloc)
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc(
    this._getNotificationsUseCase,
    this._markNotificationReadUseCase,
  ) : super(const NotificationsState()) {
    on<NotificationsFetchRequested>(_onFetchRequested);
    on<NotificationsSocketStarted>(_onSocketStarted);
    on<NotificationsSocketUpdateReceived>(_onSocketUpdateReceived);
    on<NotificationsAllMarkedRead>(_onAllMarkedRead);
  }

  final GetNotificationsUseCase _getNotificationsUseCase;
  final MarkNotificationReadUseCase _markNotificationReadUseCase;
  StreamSubscription<Map<String, dynamic>>? _socketSub;

  Future<void> _onFetchRequested(
    NotificationsFetchRequested event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(state.copyWith(status: NotificationsStatus.loading, error: null));

    final result = await _getNotificationsUseCase(const NoParams());

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: NotificationsStatus.failure,
          error: failure.message,
        ),
      ),
      (notifications) => emit(
        state.copyWith(
          status: NotificationsStatus.success,
          notifications: notifications,
        ),
      ),
    );
  }

  void _onSocketStarted(
    NotificationsSocketStarted event,
    Emitter<NotificationsState> emit,
  ) {
    _socketSub?.cancel();
    _socketSub = SocketService.instance
        .on<Map<String, dynamic>>(SocketEvents.notifications)
        .listen((_) => add(const NotificationsEvent.socketUpdateReceived()));
  }

  /// Silently refreshes the list without resetting to loading so existing
  /// items stay visible. Errors are swallowed — stale data beats a flash error.
  Future<void> _onSocketUpdateReceived(
    NotificationsSocketUpdateReceived event,
    Emitter<NotificationsState> emit,
  ) async {
    final result = await _getNotificationsUseCase(const NoParams());
    result.fold(
      (_) {},
      (notifications) => emit(
        state.copyWith(
          status: NotificationsStatus.success,
          notifications: notifications,
        ),
      ),
    );
  }

  /// Clears the unread count the moment the user opens Alerts, then persists
  /// each read via `PATCH /notifications/{id}/read`. The list is updated
  /// optimistically so the badge clears instantly; the endpoint is per-id, so
  /// we fire one call per previously-unread notification. Failures are
  /// swallowed — a later fetch/socket refetch reconciles with the server.
  Future<void> _onAllMarkedRead(
    NotificationsAllMarkedRead event,
    Emitter<NotificationsState> emit,
  ) async {
    final unread = state.notifications.where((n) => !n.isRead).toList();
    if (unread.isEmpty) return;

    final now = DateTime.now();
    emit(
      state.copyWith(
        notifications: [
          for (final n in state.notifications)
            n.isRead ? n : n.copyWith(isRead: true, readAt: now),
        ],
      ),
    );

    await Future.wait(
      unread.map((n) => _markNotificationReadUseCase(n.id)),
    );
  }

  @override
  Future<void> close() {
    _socketSub?.cancel();
    return super.close();
  }
}
