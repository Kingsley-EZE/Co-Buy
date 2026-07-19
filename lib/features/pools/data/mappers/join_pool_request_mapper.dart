import 'package:co_buy/features/pools/data/dtos/join_pool_request_dto.dart';
import 'package:co_buy/features/pools/domain/entities/join_pool_request.dart';

extension JoinPoolRequestX on JoinPoolRequest {
  JoinPoolRequestDto toDto() => JoinPoolRequestDto(
    id: id,
    bankName: bankName,
    bankCode: bankCode,
    accountNumber: accountNumber,
    accountName: accountName,
    memberShareAmount: memberShareAmount,
  );
}
