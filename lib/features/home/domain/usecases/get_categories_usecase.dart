import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/pool_category.dart';
import '../repositories/create_pool_repository.dart';

@injectable
class GetCategoriesUseCase implements UseCase<List<PoolCategory>, NoParams> {
  GetCategoriesUseCase(this._repo);

  final CreatePoolRepository _repo;

  @override
  FutureResult<List<PoolCategory>> call(NoParams params) =>
      _repo.getCategories();
}
