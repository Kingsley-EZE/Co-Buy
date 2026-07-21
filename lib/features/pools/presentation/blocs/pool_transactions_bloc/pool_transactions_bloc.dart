import 'package:co_buy/features/pools/domain/entities/pool_transaction.dart';
import 'package:co_buy/features/pools/domain/usecases/get_pool_transactions_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pool_transactions_event.dart';
part 'pool_transactions_state.dart';
part 'pool_transactions_bloc.freezed.dart';

/// Page-scoped fetch of one pool's payment history. Created per visit so a
/// previous pool's list never leaks into a newly opened transactions screen.
@injectable
class PoolTransactionsBloc
    extends Bloc<PoolTransactionsEvent, PoolTransactionsState> {
  PoolTransactionsBloc(this._getPoolTransactionsUseCase)
    : super(const PoolTransactionsState()) {
    on<PoolTransactionsFetchRequested>(_onFetchRequested);
  }

  final GetPoolTransactionsUseCase _getPoolTransactionsUseCase;

  Future<void> _onFetchRequested(
    PoolTransactionsFetchRequested event,
    Emitter<PoolTransactionsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: PoolTransactionsRequestStatus.loading,
        error: null,
      ),
    );

    final result = await _getPoolTransactionsUseCase(event.poolId);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: PoolTransactionsRequestStatus.failure,
          error: failure.message,
        ),
      ),
      (transactions) => emit(
        state.copyWith(
          status: PoolTransactionsRequestStatus.success,
          transactions: transactions,
        ),
      ),
    );
  }
}
