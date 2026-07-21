import '../../domain/entities/pool_payment.dart';
import '../dtos/pool_payment_dto.dart';
import '../dtos/pool_payment_request_dto.dart';

extension PoolPaymentRequestX on PoolPaymentRequest {
  PoolPaymentRequestDto toDto() =>
      PoolPaymentRequestDto(id: poolId, amount: amount);
}

extension PoolPaymentDataDtoX on PoolPaymentDataDto {
  /// The transaction's bookkeeping fields stay in the data layer — the app
  /// only needs where to send the user for checkout.
  PoolPayment toEntity() =>
      PoolPayment(checkoutUrl: checkoutUrl, merchantName: merchantName);
}
