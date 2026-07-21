import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/dio_error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../../home/data/mappers/pool_mapper.dart';
import '../../../home/domain/entities/pool.dart';
import '../../domain/repositories/my_pools_repository.dart';
import '../datasources/my_pools_data_source.dart';

@LazySingleton(as: MyPoolsRepository)
class MyPoolsRepositoryImpl implements MyPoolsRepository {
  MyPoolsRepositoryImpl(this._remote);

  final MyPoolsDataSource _remote;

  @override
  FutureResult<List<Pool>> getMyPools() async {
    try {
      final dto = await _remote.getMyPools();
      return Right(dto.data.map((pool) => pool.toEntity()).toList());
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }
}
