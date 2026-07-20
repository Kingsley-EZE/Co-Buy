import 'package:json_annotation/json_annotation.dart';

part 'pool_payment_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PoolPaymentResponseDto {
  const PoolPaymentResponseDto({
    required this.success,
    required this.data,
    this.message,
  });

  final bool success;
  final PoolPaymentDataDto data;
  final String? message;

  factory PoolPaymentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PoolPaymentResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolPaymentResponseDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PoolPaymentDataDto {
  const PoolPaymentDataDto({
    required this.transaction,
    required this.merchantName,
    required this.checkoutUrl,
  });

  final PoolPaymentTransactionDto transaction;
  final String merchantName;
  final String checkoutUrl;

  factory PoolPaymentDataDto.fromJson(Map<String, dynamic> json) =>
      _$PoolPaymentDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolPaymentDataDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PoolPaymentTransactionDto {
  const PoolPaymentTransactionDto({
    required this.id,
    required this.poolId,
    required this.membershipId,
    required this.paymentReference,
    this.redirectUrl,
    this.monnifyTransactionReference,
    required this.state,
  });

  final String id;
  final String poolId;
  final String membershipId;
  final String paymentReference;
  final String? redirectUrl;

  /// Null until the gateway assigns one — the transaction has only just been
  /// initiated when this response comes back.
  final String? monnifyTransactionReference;

  final String state;

  factory PoolPaymentTransactionDto.fromJson(Map<String, dynamic> json) =>
      _$PoolPaymentTransactionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolPaymentTransactionDtoToJson(this);
}
