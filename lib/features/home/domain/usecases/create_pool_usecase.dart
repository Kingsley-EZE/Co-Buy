import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/create_pool_request.dart';
import '../repositories/create_pool_repository.dart';

@injectable
class CreatePoolUseCase implements UseCase<void, CreatePoolRequest> {
  CreatePoolUseCase(this._repo);

  final CreatePoolRepository _repo;

  @override
  FutureResult<void> call(CreatePoolRequest params) => _repo.createPool(params);
}
