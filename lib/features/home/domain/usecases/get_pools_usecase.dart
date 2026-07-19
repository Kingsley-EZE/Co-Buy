import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/pool.dart';
import '../repositories/pools_repository.dart';

class GetPoolsParams extends Equatable {
  const GetPoolsParams({this.status});

  /// Server-side status filter; null fetches every pool ("All").
  final PoolStatus? status;

  @override
  List<Object?> get props => [status];
}

@injectable
class GetPoolsUseCase implements UseCase<List<Pool>, GetPoolsParams> {
  GetPoolsUseCase(this._repo);

  final PoolsRepository _repo;

  @override
  FutureResult<List<Pool>> call(GetPoolsParams params) =>
      _repo.getPools(status: params.status);
}
