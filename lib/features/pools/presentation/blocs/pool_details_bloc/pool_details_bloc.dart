import 'dart:async';

import 'package:co_buy/core/network/sockets/socket_events.dart';
import 'package:co_buy/core/network/sockets/socket_service.dart';
import 'package:co_buy/features/home/domain/entities/pool.dart';
import 'package:co_buy/features/pools/domain/entities/pool_details.dart';
import 'package:co_buy/features/pools/domain/entities/pool_member.dart';
import 'package:co_buy/features/pools/domain/usecases/get_pool_details_usecase.dart';
import 'package:co_buy/features/pools/domain/usecases/get_pool_members_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pool_details_event.dart';
part 'pool_details_state.dart';
part 'pool_details_bloc.freezed.dart';

/// Page-scoped — fresh fetch per visit.
@injectable
class PoolDetailsBloc extends Bloc<PoolDetailsEvent, PoolDetailsState> {
  PoolDetailsBloc(this._getPoolDetailsUseCase, this._getPoolMembersUseCase)
    : super(const PoolDetailsState()) {
    on<PoolDetailsFetchRequested>(_onFetchRequested);
    on<PoolDetailsSocketStarted>(_onSocketStarted);
    on<PoolDetailsSocketUpdateReceived>(_onSocketUpdateReceived);
  }

  final GetPoolDetailsUseCase _getPoolDetailsUseCase;
  final GetPoolMembersUseCase _getPoolMembersUseCase;
  StreamSubscription<Map<String, dynamic>>? _socketSub;
  String? _subscribedPoolId;

  Future<void> _onFetchRequested(
    PoolDetailsFetchRequested event,
    Emitter<PoolDetailsState> emit,
  ) async {
    emit(
      state.copyWith(
        detailsStatus: PoolDetailsRequestStatus.loading,
        detailsError: null,
        membersStatus: PoolDetailsRequestStatus.loading,
        membersError: null,
      ),
    );

    final (detailsResult, membersResult) = await (
      _getPoolDetailsUseCase(event.poolId),
      _getPoolMembersUseCase(event.poolId),
    ).wait;

    detailsResult.fold(
      (failure) => emit(
        state.copyWith(
          detailsStatus: PoolDetailsRequestStatus.failure,
          detailsError: failure.message,
        ),
      ),
      (details) => emit(
        state.copyWith(
          detailsStatus: PoolDetailsRequestStatus.success,
          details: details,
        ),
      ),
    );

    membersResult.fold(
      (failure) => emit(
        state.copyWith(
          membersStatus: PoolDetailsRequestStatus.failure,
          membersError: failure.message,
        ),
      ),
      (members) => emit(
        state.copyWith(
          membersStatus: PoolDetailsRequestStatus.success,
          members: members,
        ),
      ),
    );
  }

  void _onSocketStarted(
    PoolDetailsSocketStarted event,
    Emitter<PoolDetailsState> emit,
  ) {
    _socketSub?.cancel();
    _subscribedPoolId = event.poolId;
    SocketService.instance.joinPool(event.poolId);

    _socketSub = SocketService.instance
        .on<Map<String, dynamic>>(SocketEvents.poolUpdate)
        .where((data) => data['id'] == event.poolId)
        .listen((_) => add(const PoolDetailsEvent.socketUpdateReceived()));
  }

  /// Silently refetches both slices without resetting to loading so the screen
  /// stays responsive. Errors are swallowed — stale data beats a flash error.
  Future<void> _onSocketUpdateReceived(
    PoolDetailsSocketUpdateReceived event,
    Emitter<PoolDetailsState> emit,
  ) async {
    final poolId = _subscribedPoolId;
    if (poolId == null) return;

    final (detailsResult, membersResult) = await (
      _getPoolDetailsUseCase(poolId),
      _getPoolMembersUseCase(poolId),
    ).wait;

    detailsResult.fold(
      (_) {},
      (details) => emit(
        state.copyWith(
          detailsStatus: PoolDetailsRequestStatus.success,
          details: details,
        ),
      ),
    );

    membersResult.fold(
      (_) {},
      (members) => emit(
        state.copyWith(
          membersStatus: PoolDetailsRequestStatus.success,
          members: members,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _socketSub?.cancel();
    if (_subscribedPoolId != null) {
      SocketService.instance.leavePool(_subscribedPoolId!);
    }
    return super.close();
  }
}
