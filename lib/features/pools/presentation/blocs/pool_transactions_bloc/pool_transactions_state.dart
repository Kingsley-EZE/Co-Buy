part of 'pool_transactions_bloc.dart';

enum PoolTransactionsRequestStatus { initial, loading, success, failure }

@freezed
abstract class PoolTransactionsState with _$PoolTransactionsState {
  const factory PoolTransactionsState({
    @Default(PoolTransactionsRequestStatus.initial)
    PoolTransactionsRequestStatus status,
    @Default(<PoolTransaction>[]) List<PoolTransaction> transactions,
    String? error,
  }) = _PoolTransactionsState;
}
