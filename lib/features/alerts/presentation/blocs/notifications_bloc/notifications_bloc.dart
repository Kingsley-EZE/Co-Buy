import 'dart:async';

import 'package:co_buy/core/network/sockets/socket_events.dart';
import 'package:co_buy/core/network/sockets/socket_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/app_notification.dart';
import '../../../domain/usecases/get_notifications_usecase.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';
part 'notifications_bloc.freezed.dart';

@injectable
class NotificationsBloc
    extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc(this._getNotificationsUseCase)
      : super(const NotificationsState()) {
    on<NotificationsFetchRequested>(_onFetchRequested);
    on<NotificationsSocketStarted>(_onSocketStarted);
    on<NotificationsSocketUpdateReceived>(_onSocketUpdateReceived);
  }

  final GetNotificationsUseCase _getNotificationsUseCase;
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

  @override
  Future<void> close() {
    _socketSub?.cancel();
    return super.close();
  }
}
