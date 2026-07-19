import '../../../../core/error/result.dart';
import '../entities/account_lookup_request.dart';
import '../entities/bank.dart';
import '../entities/bank_account.dart';
import '../entities/create_pool_request.dart';
import '../entities/pool_category.dart';

abstract class CreatePoolRepository {
  FutureResult<void> createPool(CreatePoolRequest request);

  FutureResult<List<Bank>> getBanks();

  FutureResult<List<PoolCategory>> getCategories();

  FutureResult<BankAccount> lookupAccountName(AccountLookupRequest request);
}
