import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/pool_member.dart';
import '../repositories/pool_details_repository.dart';

@injectable
class GetPoolMembersUseCase implements UseCase<List<PoolMember>, String> {
  GetPoolMembersUseCase(this._repo);

  final PoolDetailsRepository _repo;

  @override
  FutureResult<List<PoolMember>> call(String params) =>
      _repo.getPoolMembers(params);
}
