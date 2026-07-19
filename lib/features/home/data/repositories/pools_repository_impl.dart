import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/dio_error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/pool.dart';
import '../../domain/repositories/pools_repository.dart';
import '../datasources/pools_data_source.dart';
import '../mappers/pool_mapper.dart';

@LazySingleton(as: PoolsRepository)
class PoolsRepositoryImpl implements PoolsRepository {
  PoolsRepositoryImpl(this._remote);

  final PoolsDataSource _remote;

  @override
  FutureResult<List<Pool>> getPools({PoolStatus? status}) async {
    try {
      final dto = await _remote.getPools(status: status?.toApi());
      return Right(dto.data.map((pool) => pool.toEntity()).toList());
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }
}
