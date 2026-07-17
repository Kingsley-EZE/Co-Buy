import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/forgot_password_request.dart';
import '../repositories/auth_repository.dart';

@injectable
class ForgotPasswordUseCase implements UseCase<void, ForgotPasswordRequest> {
  ForgotPasswordUseCase(this._repo);

  final AuthRepository _repo;

  @override
  FutureResult<void> call(ForgotPasswordRequest params) =>
      _repo.forgotPassword(params);
}
