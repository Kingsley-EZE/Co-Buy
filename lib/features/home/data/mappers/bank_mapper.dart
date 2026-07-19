import 'package:co_buy/features/home/data/dtos/bank_dto.dart';
import 'package:co_buy/features/home/domain/entities/bank.dart';

extension BankDtoX on BankDto {
  Bank toEntity() => Bank(name: name, code: code);
}
