import '../../../../core/error/result.dart';
import '../entities/account_lookup_request.dart';
import '../entities/bank.dart';
import '../entities/bank_account.dart';

abstract class CreatePoolRepository {
  FutureResult<List<Bank>> getBanks();

  FutureResult<BankAccount> lookupAccountName(AccountLookupRequest request);
}
