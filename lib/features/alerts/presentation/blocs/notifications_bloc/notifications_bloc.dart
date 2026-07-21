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
  }

  final GetNotificationsUseCase _getNotificationsUseCase;

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
}
