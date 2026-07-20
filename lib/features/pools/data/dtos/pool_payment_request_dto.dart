import 'package:json_annotation/json_annotation.dart';

part 'pool_payment_request_dto.g.dart';

@JsonSerializable()
class PoolPaymentRequestDto {
  const PoolPaymentRequestDto({required this.id, required this.amount});

  final String id;
  final double amount;

  factory PoolPaymentRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PoolPaymentRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolPaymentRequestDtoToJson(this);
}
