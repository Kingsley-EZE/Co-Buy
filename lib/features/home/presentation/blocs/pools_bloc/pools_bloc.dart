import 'dart:async';

import 'package:co_buy/core/network/sockets/socket_events.dart';
import 'package:co_buy/core/network/sockets/socket_service.dart';
import 'package:co_buy/features/home/domain/entities/pool.dart';
import 'package:co_buy/features/home/domain/usecases/get_pools_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pools_event.dart';
part 'pools_state.dart';
part 'pools_bloc.freezed.dart';

FutureOr<void> disposePoolsBloc(PoolsBloc bloc) => bloc.close();

/// Feature bloc for the home pool feed. Singleton so external flows (e.g.
/// create-pool success) can dispatch a refetch to the same instance the home
/// tab is listening to, regardless of whether the tab is currently visible.
@LazySingleton(dispose: disposePoolsBloc)
class PoolsBloc extends Bloc<PoolsEvent, PoolsState> {
  PoolsBloc(this._getPoolsUseCase) : super(const PoolsState()) {
    on<PoolsFetchRequested>(_onFetchRequested);
    on<PoolsFilterChanged>(_onFilterChanged);
    on<PoolsSocketStarted>(_onSocketStarted);
    on<PoolsSocketUpdateReceived>(_onSocketUpdateReceived);
  }

  final GetPoolsUseCase _getPoolsUseCase;
  StreamSubscription<Map<String, dynamic>>? _socketSub;

  Future<void> _onFetchRequested(
    PoolsFetchRequested event,
    Emitter<PoolsState> emit,
  ) => _fetch(emit);

  Future<void> _onFilterChanged(
    PoolsFilterChanged event,
    Emitter<PoolsState> emit,
  ) async {
    // Re-tapping the active chip would only refetch identical data.
    if (event.filter == state.filter) return;

    emit(state.copyWith(filter: event.filter));
    await _fetch(emit);
  }

  Future<void> _fetch(Emitter<PoolsState> emit) async {
    emit(state.copyWith(status: PoolsRequestStatus.loading, error: null));

    final result = await _getPoolsUseCase(
      GetPoolsParams(status: state.filter.status),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: PoolsRequestStatus.failure,
          error: failure.message,
        ),
      ),
      (pools) => emit(
        state.copyWith(status: PoolsRequestStatus.success, pools: pools),
      ),
    );
  }

  void _onSocketStarted(PoolsSocketStarted event, Emitter<PoolsState> emit) {
    _socketSub?.cancel();
    _socketSub = SocketService.instance
        .on<Map<String, dynamic>>(SocketEvents.poolUpdate)
        .listen((_) => add(const PoolsEvent.socketUpdateReceived()));
  }

  /// Silently refreshes the feed without resetting to loading so the list
  /// stays responsive. Errors are swallowed — stale data beats a flash error.
  Future<void> _onSocketUpdateReceived(
    PoolsSocketUpdateReceived event,
    Emitter<PoolsState> emit,
  ) async {
    final result = await _getPoolsUseCase(
      GetPoolsParams(status: state.filter.status),
    );
    result.fold(
      (_) {},
      (pools) => emit(
        state.copyWith(status: PoolsRequestStatus.success, pools: pools),
      ),
    );
  }

  @override
  Future<void> close() {
    _socketSub?.cancel();
    return super.close();
  }
}
