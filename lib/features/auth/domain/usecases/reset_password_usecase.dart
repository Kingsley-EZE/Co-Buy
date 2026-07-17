import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/reset_password_request.dart';
import '../repositories/auth_repository.dart';

@injectable
class ResetPasswordUseCase implements UseCase<void, ResetPasswordRequest> {
  ResetPasswordUseCase(this._repo);

  final AuthRepository _repo;

  @override
  FutureResult<void> call(ResetPasswordRequest params) =>
      _repo.resetPassword(params);
}
