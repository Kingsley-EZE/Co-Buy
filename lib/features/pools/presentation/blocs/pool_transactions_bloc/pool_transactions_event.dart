part of 'pool_transactions_bloc.dart';

@freezed
sealed class PoolTransactionsEvent with _$PoolTransactionsEvent {
  const factory PoolTransactionsEvent.fetchRequested(String poolId) =
      PoolTransactionsFetchRequested;
}
