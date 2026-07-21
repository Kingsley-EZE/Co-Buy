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

/// Feature bloc for initiating a pool payment. Page-scoped (not a
/// singleton): a payment attempt is per-visit state, and a stale checkout
/// URL from an earlier visit must never leak into a new one.
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
    // Each call creates a new transaction server-side — ignore re-taps while
    // one is already in flight.
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
        // Subscribe for the server-side confirmation so the checkout page can
        // be dismissed even if the gateway redirect never fires (e.g. the user
        // closes the webview before the redirect completes).
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

    // Back to initial so a second attempt produces a fresh initial→loading→
    // success transition for listeners keyed on status changes.
    emit(const PoolPaymentState());
  }

  @override
  Future<void> close() {
    _socketSub?.cancel();
    return super.close();
  }
}
