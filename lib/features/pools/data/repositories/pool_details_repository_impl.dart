import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/dio_error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/pool_details.dart';
import '../../domain/entities/pool_member.dart';
import '../../domain/repositories/pool_details_repository.dart';
import '../datasources/pool_details_data_source.dart';
import '../mappers/pool_details_mapper.dart';
import '../mappers/pool_member_mapper.dart';

@LazySingleton(as: PoolDetailsRepository)
class PoolDetailsRepositoryImpl implements PoolDetailsRepository {
  PoolDetailsRepositoryImpl(this._remote);

  final PoolDetailsDataSource _remote;

  @override
  FutureResult<PoolDetails> getPoolDetails(String poolId) async {
    try {
      final dto = await _remote.getPoolDetails(poolId);
      return Right(dto.data.toEntity());
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureResult<List<PoolMember>> getPoolMembers(String poolId) async {
    try {
      final dto = await _remote.getPoolMembers(poolId);
      return Right(dto.data.map((member) => member.toEntity()).toList());
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }
}
