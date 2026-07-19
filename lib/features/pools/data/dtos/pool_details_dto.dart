import 'package:json_annotation/json_annotation.dart';

import '../../../home/data/dtos/pool_category_dto.dart';

part 'pool_details_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PoolDetailsResponseDto {
  const PoolDetailsResponseDto({
    required this.success,
    required this.data,
    this.message,
  });

  final bool success;
  final PoolDetailsDto data;
  final String? message;

  factory PoolDetailsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PoolDetailsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolDetailsResponseDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PoolDetailsDto {
  const PoolDetailsDto({
    required this.id,
    required this.leaderId,
    required this.name,
    this.description,
    this.category,
    required this.targetAmount,
    required this.amountRaised,
    required this.amountPerSlot,
    required this.maxMembers,
    required this.splitEven,
    required this.beneficiaryAccountNumber,
    required this.beneficiaryAccountName,
    required this.beneficiaryBankName,
    required this.shareLink,
    required this.deadlineAt,
    required this.status,
    required this.slotsRemaining,
  });

  final String id;
  final String leaderId;
  final String name;
  final String? description;
  final PoolCategoryDto? category;
  final double targetAmount;
  final double amountRaised;
  final double amountPerSlot;
  final int maxMembers;
  final bool splitEven;
  final String beneficiaryAccountNumber;
  final String beneficiaryAccountName;
  final String beneficiaryBankName;
  final String shareLink;
  final String deadlineAt;
  final String status;
  final int slotsRemaining;

  factory PoolDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PoolDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolDetailsDtoToJson(this);
}
