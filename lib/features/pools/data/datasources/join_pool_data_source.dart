import 'package:co_buy/features/pools/data/dtos/join_pool_request_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'join_pool_data_source.g.dart';

@RestApi()
abstract class JoinPoolDataSource {
  factory JoinPoolDataSource(Dio dio, {String? baseUrl}) = _JoinPoolDataSource;

  /// The pool is identified by the `id` in the body, not a path param.
  @POST('/pools/join')
  Future<void> joinPool({@Body() required JoinPoolRequestDto body});
}
