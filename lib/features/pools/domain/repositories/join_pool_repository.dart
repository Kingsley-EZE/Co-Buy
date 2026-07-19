import '../../../../core/error/result.dart';
import '../entities/join_pool_request.dart';

abstract class JoinPoolRepository {
  FutureResult<void> joinPool(JoinPoolRequest request);
}
