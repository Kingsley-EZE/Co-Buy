import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/join_pool_request.dart';
import '../repositories/join_pool_repository.dart';

@injectable
class JoinPoolUseCase implements UseCase<void, JoinPoolRequest> {
  JoinPoolUseCase(this._repo);

  final JoinPoolRepository _repo;

  @override
  FutureResult<void> call(JoinPoolRequest params) => _repo.joinPool(params);
}
