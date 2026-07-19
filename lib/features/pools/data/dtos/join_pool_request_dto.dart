import 'package:json_annotation/json_annotation.dart';

part 'join_pool_request_dto.g.dart';

@JsonSerializable()
class JoinPoolRequestDto {
  const JoinPoolRequestDto({
    required this.id,
    required this.bankName,
    required this.bankCode,
    required this.accountNumber,
    required this.accountName,
    required this.memberShareAmount,
  });

  final String id;
  final String bankName;
  final String bankCode;
  final String accountNumber;
  final String accountName;
  final double memberShareAmount;

  factory JoinPoolRequestDto.fromJson(Map<String, dynamic> json) =>
      _$JoinPoolRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JoinPoolRequestDtoToJson(this);
}
