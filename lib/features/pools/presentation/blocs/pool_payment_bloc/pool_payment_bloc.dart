import 'dart:async';

import 'package:co_buy/core/network/sockets/socket_events.dart';
import 'package:co_buy/core/network/sockets/socket_service.dart';
import 'package:co_buy/features/pools/domain/entities/pool_payment.dart';
import 'package:co_buy/features/pools/domain/usecases/pay_for_pool_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pool_payment_event.dart';
part 'pool_payment_state.dart';
part 'pool_payment_bloc.freezed.dart';

/// Page-scoped — stale checkout URLs must not leak across visits.
@injectable
class PoolPaymentBloc extends Bloc<PoolPaymentEvent, PoolPaymentState> {
  PoolPaymentBloc(this._payForPoolUseCase) : super(const PoolPaymentState()) {
    on<PoolPaymentPayRequested>(_onPayRequested);
    on<PoolPaymentStateCleared>(_onStateCleared);
    on<PoolPaymentSocketConfirmed>(_onSocketConfirmed);
  }

  final PayForPoolUseCase _payForPoolUseCase;
  StreamSubscription<Map<String, dynamic>>? _socketSub;

  Future<void> _onPayRequested(
    PoolPaymentPayRequested event,
    Emitter<PoolPaymentState> emit,
  ) async {
    if (state.status == PoolPaymentRequestStatus.loading) return;

    emit(
      state.copyWith(
        status: PoolPaymentRequestStatus.loading,
        payment: null,
        error: null,
      ),
    );

    final result = await _payForPoolUseCase(event.request);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: PoolPaymentRequestStatus.failure,
          error: failure.message,
        ),
      ),
      (payment) {
        emit(state.copyWith(
          status: PoolPaymentRequestStatus.success,
          payment: payment,
        ));
        // Socket confirmation dismisses checkout if the gateway redirect never fires.
        _socketSub?.cancel();
        _socketSub = SocketService.instance
            .on<Map<String, dynamic>>(SocketEvents.paymentSuccess)
            .where((data) => data['poolId'] == event.request.poolId)
            .listen((_) => add(const PoolPaymentEvent.socketConfirmed()));
      },
    );
  }

  void _onSocketConfirmed(
    PoolPaymentSocketConfirmed event,
    Emitter<PoolPaymentState> emit,
  ) {
    _socketSub?.cancel();
    _socketSub = null;
    emit(state.copyWith(status: PoolPaymentRequestStatus.confirmed));
  }

  void _onStateCleared(
    PoolPaymentStateCleared event,
    Emitter<PoolPaymentState> emit,
  ) {
    if (state == const PoolPaymentState()) return;

    emit(const PoolPaymentState());
  }

  @override
  Future<void> close() {
    _socketSub?.cancel();
    return super.close();
  }
}
