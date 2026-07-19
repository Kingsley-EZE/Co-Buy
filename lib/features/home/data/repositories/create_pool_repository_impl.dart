import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/dio_error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/account_lookup_request.dart';
import '../../domain/entities/bank.dart';
import '../../domain/entities/bank_account.dart';
import '../../domain/repositories/create_pool_repository.dart';
import '../datasources/create_pool_data_source.dart';
import '../mappers/bank_account_mapper.dart';
import '../mappers/bank_mapper.dart';

@LazySingleton(as: CreatePoolRepository)
class CreatePoolRepositoryImpl implements CreatePoolRepository {
  CreatePoolRepositoryImpl(this._remote);

  final CreatePoolDataSource _remote;

  @override
  FutureResult<List<Bank>> getBanks() async {
    try {
      final dto = await _remote.getBanks();
      return Right(dto.data.map((bank) => bank.toEntity()).toList());
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureResult<BankAccount> lookupAccountName(
    AccountLookupRequest request,
  ) async {
    try {
      final dto = await _remote.lookupAccountName(
        accountNumber: request.accountNumber,
        bankCode: request.bankCode,
      );
      return Right(dto.data.toEntity());
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }
}
