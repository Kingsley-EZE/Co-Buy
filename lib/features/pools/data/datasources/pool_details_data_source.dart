import 'package:co_buy/features/pools/data/dtos/pool_details_dto.dart';
import 'package:co_buy/features/pools/data/dtos/pool_member_dto.dart';
import 'package:co_buy/features/pools/data/dtos/pool_transaction_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'pool_details_data_source.g.dart';

@RestApi()
abstract class PoolDetailsDataSource {
  factory PoolDetailsDataSource(Dio dio, {String? baseUrl}) =
      _PoolDetailsDataSource;

  @GET('/pools/{id}')
  Future<PoolDetailsResponseDto> getPoolDetails(@Path('id') String id);

  @GET('/pools/{id}/members')
  Future<PoolMembersResponseDto> getPoolMembers(@Path('id') String id);

  @GET('/pools/{id}/transactions')
  Future<PoolTransactionsResponseDto> getPoolTransactions(
    @Path('id') String id,
  );
}
