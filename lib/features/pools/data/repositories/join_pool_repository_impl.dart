import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/dio_error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/join_pool_request.dart';
import '../../domain/repositories/join_pool_repository.dart';
import '../datasources/join_pool_data_source.dart';
import '../mappers/join_pool_request_mapper.dart';

@LazySingleton(as: JoinPoolRepository)
class JoinPoolRepositoryImpl implements JoinPoolRepository {
  JoinPoolRepositoryImpl(this._remote);

  final JoinPoolDataSource _remote;

  @override
  FutureResult<void> joinPool(JoinPoolRequest request) async {
    try {
      await _remote.joinPool(body: request.toDto());
      return const Right(null);
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }
}
