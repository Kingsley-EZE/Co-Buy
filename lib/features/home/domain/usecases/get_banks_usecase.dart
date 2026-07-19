import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/bank.dart';
import '../repositories/create_pool_repository.dart';

@injectable
class GetBanksUseCase implements UseCase<List<Bank>, NoParams> {
  GetBanksUseCase(this._repo);

  final CreatePoolRepository _repo;

  @override
  FutureResult<List<Bank>> call(NoParams params) => _repo.getBanks();
}
