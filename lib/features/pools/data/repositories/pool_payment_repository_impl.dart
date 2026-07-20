import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/dio_error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/pool_payment.dart';
import '../../domain/repositories/pool_payment_repository.dart';
import '../datasources/pool_payment_data_source.dart';
import '../mappers/pool_payment_mapper.dart';

@LazySingleton(as: PoolPaymentRepository)
class PoolPaymentRepositoryImpl implements PoolPaymentRepository {
  PoolPaymentRepositoryImpl(this._remote);

  final PoolPaymentDataSource _remote;

  @override
  FutureResult<PoolPayment> payForPool(PoolPaymentRequest request) async {
    try {
      final dto = await _remote.payForPool(body: request.toDto());
      return Right(dto.data.toEntity());
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }
}
