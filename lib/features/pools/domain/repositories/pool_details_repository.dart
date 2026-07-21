import '../../../../core/error/result.dart';
import '../entities/pool_details.dart';
import '../entities/pool_member.dart';
import '../entities/pool_transaction.dart';

abstract class PoolDetailsRepository {
  FutureResult<PoolDetails> getPoolDetails(String poolId);

  FutureResult<List<PoolMember>> getPoolMembers(String poolId);

  FutureResult<List<PoolTransaction>> getPoolTransactions(String poolId);
}
