import 'package:json_annotation/json_annotation.dart';

part 'create_pool_request_dto.g.dart';

/// [description] is optional server-side, so nulls are omitted from the
/// payload rather than sent explicitly.
@JsonSerializable(includeIfNull: false)
class CreatePoolRequestDto {
  const CreatePoolRequestDto({
    required this.name,
    this.description,
    required this.categoryId,
    required this.targetAmount,
    required this.maxMembers,
    required this.splitEven,
    required this.memberShareAmount,
    required this.beneficiaryAccountNumber,
    required this.beneficiaryAccountName,
    required this.beneficiaryBankName,
    required this.beneficiaryBankCode,
    required this.deadlineAt,
  });

  final String name;
  final String? description;
  final String categoryId;
  final double targetAmount;
  final int maxMembers;
  final bool splitEven;
  final double memberShareAmount;
  final String beneficiaryAccountNumber;
  final String beneficiaryAccountName;
  final String beneficiaryBankName;
  final String beneficiaryBankCode;

  /// ISO-8601 UTC timestamp, e.g. `2026-07-19T12:16:43.239Z`.
  final String deadlineAt;

  factory CreatePoolRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePoolRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePoolRequestDtoToJson(this);
}
