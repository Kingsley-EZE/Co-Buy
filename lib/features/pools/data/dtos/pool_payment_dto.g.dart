// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool_payment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoolPaymentResponseDto _$PoolPaymentResponseDtoFromJson(
  Map<String, dynamic> json,
) => PoolPaymentResponseDto(
  success: json['success'] as bool,
  data: PoolPaymentDataDto.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$PoolPaymentResponseDtoToJson(
  PoolPaymentResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data.toJson(),
  'message': instance.message,
};

PoolPaymentDataDto _$PoolPaymentDataDtoFromJson(Map<String, dynamic> json) =>
    PoolPaymentDataDto(
      transaction: PoolPaymentTransactionDto.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
      merchantName: json['merchantName'] as String,
      checkoutUrl: json['checkoutUrl'] as String,
    );

Map<String, dynamic> _$PoolPaymentDataDtoToJson(PoolPaymentDataDto instance) =>
    <String, dynamic>{
      'transaction': instance.transaction.toJson(),
      'merchantName': instance.merchantName,
      'checkoutUrl': instance.checkoutUrl,
    };

PoolPaymentTransactionDto _$PoolPaymentTransactionDtoFromJson(
  Map<String, dynamic> json,
) => PoolPaymentTransactionDto(
  id: json['id'] as String,
  poolId: json['poolId'] as String,
  membershipId: json['membershipId'] as String,
  paymentReference: json['paymentReference'] as String,
  redirectUrl: json['redirectUrl'] as String?,
  monnifyTransactionReference: json['monnifyTransactionReference'] as String?,
  state: json['state'] as String,
);

Map<String, dynamic> _$PoolPaymentTransactionDtoToJson(
  PoolPaymentTransactionDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'poolId': instance.poolId,
  'membershipId': instance.membershipId,
  'paymentReference': instance.paymentReference,
  'redirectUrl': instance.redirectUrl,
  'monnifyTransactionReference': instance.monnifyTransactionReference,
  'state': instance.state,
};
