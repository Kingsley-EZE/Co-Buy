import 'package:co_buy/features/home/data/dtos/bank_account_dto.dart';
import 'package:co_buy/features/home/data/dtos/bank_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'create_pool_data_source.g.dart';

@RestApi()
abstract class CreatePoolDataSource {
  factory CreatePoolDataSource(Dio dio, {String? baseUrl}) =
      _CreatePoolDataSource;

  @GET('/banks')
  Future<BanksResponseDto> getBanks();

  @GET('/banks/name-lookup')
  Future<BankAccountLookupResponseDto> lookupAccountName({
    @Query('accountNumber') required String accountNumber,
    @Query('bankCode') required String bankCode,
  });
}
