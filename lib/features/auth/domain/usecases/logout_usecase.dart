import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

@injectable
class LogoutUseCase implements UseCase<void, NoParams> {
  LogoutUseCase(this._repo);

  final AuthRepository _repo;

  @override
  FutureResult<void> call(NoParams params) => _repo.logout();
}
