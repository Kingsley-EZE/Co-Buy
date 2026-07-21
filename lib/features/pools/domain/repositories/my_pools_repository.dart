import '../../../../core/error/result.dart';
import '../../../home/domain/entities/pool.dart';

abstract class MyPoolsRepository {
  /// Fetches the pools created by the signed-in user.
  FutureResult<List<Pool>> getMyPools();
}
