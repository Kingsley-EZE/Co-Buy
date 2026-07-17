import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/login_request.dart';
import '../repositories/auth_repository.dart';

@injectable
class LoginUseCase implements UseCase<void, LoginRequest> {
  LoginUseCase(this._repo);

  final AuthRepository _repo;

  @override
  FutureResult<void> call(LoginRequest params) => _repo.login(params);
}
