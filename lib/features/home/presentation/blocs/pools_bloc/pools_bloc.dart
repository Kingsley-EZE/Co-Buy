import 'dart:async';

import 'package:co_buy/features/home/domain/entities/pool.dart';
import 'package:co_buy/features/home/domain/usecases/get_pools_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pools_event.dart';
part 'pools_state.dart';
part 'pools_bloc.freezed.dart';

FutureOr<void> disposePoolsBloc(PoolsBloc bloc) => bloc.close();

/// App-wide singleton so external flows can refetch the feed instance.
@LazySingleton(dispose: disposePoolsBloc)
class PoolsBloc extends Bloc<PoolsEvent, PoolsState> {
  PoolsBloc(this._getPoolsUseCase) : super(const PoolsState()) {
    on<PoolsFetchRequested>(_onFetchRequested);
    on<PoolsFilterChanged>(_onFilterChanged);
  }

  final GetPoolsUseCase _getPoolsUseCase;

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
}
