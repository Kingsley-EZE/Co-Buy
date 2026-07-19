import 'package:json_annotation/json_annotation.dart';

import 'pool_category_dto.dart';

part 'pool_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PoolsResponseDto {
  const PoolsResponseDto({
    required this.success,
    required this.data,
    this.message,
  });

  final bool success;
  final List<PoolDto> data;
  final String? message;

  factory PoolsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PoolsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolsResponseDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PoolDto {
  const PoolDto({
    required this.id,
    required this.name,
    this.description,
    this.leader,
    this.category,
    required this.targetAmount,
    required this.amountRaised,
    required this.amountPerSlot,
    required this.maxMembers,
    required this.splitEven,
    required this.beneficiaryAccountName,
    required this.beneficiaryBankName,
    required this.shareLink,
    required this.deadlineAt,
    required this.status,
    required this.slotsRemaining,
  });

  final String id;
  final String name;
  final String? description;
  final PoolLeaderDto? leader;
  final PoolCategoryDto? category;
  final double targetAmount;
  final double amountRaised;

  /// Zero when the pool doesn't split the target evenly across members
  /// (`splitEven` false).
  final double amountPerSlot;

  final int maxMembers;
  final bool splitEven;
  final String beneficiaryAccountName;
  final String beneficiaryBankName;
  final String shareLink;
  final String deadlineAt;
  final String status;
  final int slotsRemaining;

  factory PoolDto.fromJson(Map<String, dynamic> json) =>
      _$PoolDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolDtoToJson(this);
}

@JsonSerializable()
class PoolLeaderDto {
  const PoolLeaderDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;

  factory PoolLeaderDto.fromJson(Map<String, dynamic> json) =>
      _$PoolLeaderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolLeaderDtoToJson(this);
}
