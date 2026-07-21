import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/pool_transaction.dart';
import '../repositories/pool_details_repository.dart';

@injectable
class GetPoolTransactionsUseCase
    implements UseCase<List<PoolTransaction>, String> {
  GetPoolTransactionsUseCase(this._repo);

  final PoolDetailsRepository _repo;

  @override
  FutureResult<List<PoolTransaction>> call(String params) =>
      _repo.getPoolTransactions(params);
}
