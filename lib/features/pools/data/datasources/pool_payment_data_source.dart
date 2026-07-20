import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/pool_payment_dto.dart';
import '../dtos/pool_payment_request_dto.dart';

part 'pool_payment_data_source.g.dart';

@RestApi()
abstract class PoolPaymentDataSource {
  factory PoolPaymentDataSource(Dio dio, {String? baseUrl}) =
      _PoolPaymentDataSource;

  /// The pool is identified by the `id` in the body, not a path param.
  @POST('/pools/pay')
  Future<PoolPaymentResponseDto> payForPool({
    @Body() required PoolPaymentRequestDto body,
  });
}
