// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool_payment_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoolPaymentRequestDto _$PoolPaymentRequestDtoFromJson(
  Map<String, dynamic> json,
) => PoolPaymentRequestDto(
  id: json['id'] as String,
  amount: (json['amount'] as num).toDouble(),
);

Map<String, dynamic> _$PoolPaymentRequestDtoToJson(
  PoolPaymentRequestDto instance,
) => <String, dynamic>{'id': instance.id, 'amount': instance.amount};
