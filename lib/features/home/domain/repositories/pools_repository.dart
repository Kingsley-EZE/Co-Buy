import '../../../../core/error/result.dart';
import '../entities/pool.dart';

abstract class PoolsRepository {
  /// Fetches the pool feed, optionally narrowed to one [status] server-side;
  /// null returns every pool.
  FutureResult<List<Pool>> getPools({PoolStatus? status});
}
