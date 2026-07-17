import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/signup_request.dart';
import '../repositories/auth_repository.dart';

@injectable
class SignupUseCase implements UseCase<void, SignupRequest> {
  SignupUseCase(this._repo);

  final AuthRepository _repo;

  @override
  FutureResult<void> call(SignupRequest params) => _repo.signup(params);
}
