import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

@injectable
class TriggerOtpUseCase implements UseCase<void, String> {
  TriggerOtpUseCase(this._repo);

  final AuthRepository _repo;

  @override
  FutureResult<void> call(String params) => _repo.triggerOtp(params);
}
