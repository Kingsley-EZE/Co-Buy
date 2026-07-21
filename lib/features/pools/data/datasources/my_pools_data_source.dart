import 'package:co_buy/features/home/data/dtos/pool_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'my_pools_data_source.g.dart';

/// Pools created by the signed-in user. Its own slice (not folded into
/// [PoolsDataSource]) because "my pools" is a distinct concern from the public
/// feed, even though both return [PoolsResponseDto].
@RestApi()
abstract class MyPoolsDataSource {
  factory MyPoolsDataSource(Dio dio, {String? baseUrl}) = _MyPoolsDataSource;

  @GET('/pools/mine')
  Future<PoolsResponseDto> getMyPools();
}
