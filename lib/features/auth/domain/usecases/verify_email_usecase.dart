import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/verify_email_request.dart';
import '../repositories/auth_repository.dart';

@injectable
class VerifyEmailUseCase implements UseCase<void, VerifyEmailRequest> {
  VerifyEmailUseCase(this._repo);

  final AuthRepository _repo;

  @override
  FutureResult<void> call(VerifyEmailRequest params) =>
      _repo.verifyEmail(params);
}
