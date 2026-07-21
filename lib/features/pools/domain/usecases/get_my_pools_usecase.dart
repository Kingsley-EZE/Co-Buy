import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../home/domain/entities/pool.dart';
import '../repositories/my_pools_repository.dart';

@injectable
class GetMyPoolsUseCase implements UseCase<List<Pool>, NoParams> {
  GetMyPoolsUseCase(this._repo);

  final MyPoolsRepository _repo;

  @override
  FutureResult<List<Pool>> call(NoParams params) => _repo.getMyPools();
}
