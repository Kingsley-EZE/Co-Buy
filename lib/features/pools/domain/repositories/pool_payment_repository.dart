import '../../../../core/error/result.dart';
import '../entities/pool_payment.dart';

abstract class PoolPaymentRepository {
  FutureResult<PoolPayment> payForPool(PoolPaymentRequest request);
}
