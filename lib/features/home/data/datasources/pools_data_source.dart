import 'package:co_buy/features/home/data/dtos/pool_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'pools_data_source.g.dart';

@RestApi()
abstract class PoolsDataSource {
  factory PoolsDataSource(Dio dio, {String? baseUrl}) = _PoolsDataSource;

  /// [status] is the server's wire name (e.g. 'OPEN', 'CLOSED'); null fetches
  /// all pools — Retrofit drops null query parameters.
  @GET('/pools')
  Future<PoolsResponseDto> getPools({@Query('status') String? status});
}
