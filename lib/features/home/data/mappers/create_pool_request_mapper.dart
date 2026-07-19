import 'package:co_buy/features/home/data/dtos/create_pool_request_dto.dart';
import 'package:co_buy/features/home/domain/entities/create_pool_request.dart';

extension CreatePoolRequestX on CreatePoolRequest {
  CreatePoolRequestDto toDto() => CreatePoolRequestDto(
    name: name,
    description: description,
    categoryId: categoryId,
    targetAmount: targetAmount,
    maxMembers: maxMembers,
    splitEven: splitEven,
    memberShareAmount: memberShareAmount,
    beneficiaryAccountNumber: beneficiaryAccountNumber,
    beneficiaryAccountName: beneficiaryAccountName,
    beneficiaryBankName: beneficiaryBankName,
    beneficiaryBankCode: beneficiaryBankCode,
    deadlineAt: deadlineAt.toUtc().toIso8601String(),
  );
}
