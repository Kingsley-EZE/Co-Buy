import '../../../../core/error/result.dart';
import '../entities/pool_details.dart';
import '../entities/pool_member.dart';

abstract class PoolDetailsRepository {
  FutureResult<PoolDetails> getPoolDetails(String poolId);

  FutureResult<List<PoolMember>> getPoolMembers(String poolId);
}
