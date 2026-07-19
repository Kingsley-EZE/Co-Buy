import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/pool_details.dart';
import '../repositories/pool_details_repository.dart';

@injectable
class GetPoolDetailsUseCase implements UseCase<PoolDetails, String> {
  GetPoolDetailsUseCase(this._repo);

  final PoolDetailsRepository _repo;

  @override
  FutureResult<PoolDetails> call(String params) => _repo.getPoolDetails(params);
}
