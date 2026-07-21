import 'package:co_buy/features/pools/data/dtos/pool_transaction_dto.dart';
import 'package:co_buy/features/pools/domain/entities/pool_transaction.dart';

extension PoolTransactionDtoX on PoolTransactionDto {
  PoolTransaction toEntity() {
    final user = membership?.user;
    final name = user == null
        ? ''
        : '${user.firstName} ${user.lastName}'.trim();

    return PoolTransaction(
      id: id,
      poolId: poolId,
      membershipId: membershipId,
      paymentReference: paymentReference,
      amountExpected: amountExpected,
      amountPaid: amountPaid,
      // Anything the server doesn't explicitly call PAID renders as pending.
      state: state.toUpperCase() == 'PAID'
          ? PoolTransactionState.paid
          : PoolTransactionState.pending,
      paidAt: paidAt == null ? null : DateTime.parse(paidAt!),
      createdAt: DateTime.parse(createdAt),
      memberName: name,
      memberUserId: membership?.userId ?? '',
    );
  }
}
