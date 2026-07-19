import 'package:co_buy/features/home/data/dtos/bank_account_dto.dart';
import 'package:co_buy/features/home/domain/entities/bank_account.dart';

extension BankAccountDtoX on BankAccountDto {
  BankAccount toEntity() => BankAccount(
    accountNumber: accountNumber,
    accountName: accountName,
    bankCode: bankCode,
  );
}
