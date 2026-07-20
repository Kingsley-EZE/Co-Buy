import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/pool_payment.dart';
import '../repositories/pool_payment_repository.dart';

@injectable
class PayForPoolUseCase implements UseCase<PoolPayment, PoolPaymentRequest> {
  PayForPoolUseCase(this._repo);

  final PoolPaymentRepository _repo;

  @override
  FutureResult<PoolPayment> call(PoolPaymentRequest params) =>
      _repo.payForPool(params);
}
