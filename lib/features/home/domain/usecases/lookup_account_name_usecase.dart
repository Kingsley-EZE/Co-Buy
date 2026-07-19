import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/account_lookup_request.dart';
import '../entities/bank_account.dart';
import '../repositories/create_pool_repository.dart';

@injectable
class LookupAccountNameUseCase
    implements UseCase<BankAccount, AccountLookupRequest> {
  LookupAccountNameUseCase(this._repo);

  final CreatePoolRepository _repo;

  @override
  FutureResult<BankAccount> call(AccountLookupRequest params) =>
      _repo.lookupAccountName(params);
}
