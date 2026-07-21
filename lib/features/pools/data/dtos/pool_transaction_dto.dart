import 'package:json_annotation/json_annotation.dart';

import 'pool_member_dto.dart';

part 'pool_transaction_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PoolTransactionsResponseDto {
  const PoolTransactionsResponseDto({
    required this.success,
    required this.data,
    this.message,
  });

  final bool success;
  final PoolTransactionsDataDto data;
  final String? message;

  factory PoolTransactionsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PoolTransactionsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolTransactionsResponseDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PoolTransactionsDataDto {
  const PoolTransactionsDataDto({required this.transactions});

  final List<PoolTransactionDto> transactions;

  factory PoolTransactionsDataDto.fromJson(Map<String, dynamic> json) =>
      _$PoolTransactionsDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolTransactionsDataDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PoolTransactionDto {
  const PoolTransactionDto({
    required this.id,
    required this.poolId,
    required this.membershipId,
    required this.paymentReference,
    this.monnifyTransactionReference,
    required this.amountExpected,
    this.amountPaid,
    required this.state,
    this.paidAt,
    required this.createdAt,
    required this.updatedAt,
    this.membership,
  });

  final String id;
  final String poolId;
  final String membershipId;
  final String paymentReference;
  final String? monnifyTransactionReference;
  final double amountExpected;

  /// Null while the payment is still pending.
  final double? amountPaid;
  final String state;

  /// Null until the payment settles.
  final String? paidAt;
  final String createdAt;
  final String updatedAt;
  final PoolTransactionMembershipDto? membership;

  factory PoolTransactionDto.fromJson(Map<String, dynamic> json) =>
      _$PoolTransactionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolTransactionDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PoolTransactionMembershipDto {
  const PoolTransactionMembershipDto({
    required this.id,
    required this.userId,
    required this.state,
    this.user,
  });

  final String id;
  final String userId;
  final String state;
  final PoolMemberUserDto? user;

  factory PoolTransactionMembershipDto.fromJson(Map<String, dynamic> json) =>
      _$PoolTransactionMembershipDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolTransactionMembershipDtoToJson(this);
}
