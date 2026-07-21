// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool_transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoolTransactionsResponseDto _$PoolTransactionsResponseDtoFromJson(
  Map<String, dynamic> json,
) => PoolTransactionsResponseDto(
  success: json['success'] as bool,
  data: PoolTransactionsDataDto.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$PoolTransactionsResponseDtoToJson(
  PoolTransactionsResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data.toJson(),
  'message': instance.message,
};

PoolTransactionsDataDto _$PoolTransactionsDataDtoFromJson(
  Map<String, dynamic> json,
) => PoolTransactionsDataDto(
  transactions: (json['transactions'] as List<dynamic>)
      .map((e) => PoolTransactionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PoolTransactionsDataDtoToJson(
  PoolTransactionsDataDto instance,
) => <String, dynamic>{
  'transactions': instance.transactions.map((e) => e.toJson()).toList(),
};

PoolTransactionDto _$PoolTransactionDtoFromJson(Map<String, dynamic> json) =>
    PoolTransactionDto(
      id: json['id'] as String,
      poolId: json['poolId'] as String,
      membershipId: json['membershipId'] as String,
      paymentReference: json['paymentReference'] as String,
      monnifyTransactionReference:
          json['monnifyTransactionReference'] as String?,
      amountExpected: (json['amountExpected'] as num).toDouble(),
      amountPaid: (json['amountPaid'] as num?)?.toDouble(),
      state: json['state'] as String,
      paidAt: json['paidAt'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      membership: json['membership'] == null
          ? null
          : PoolTransactionMembershipDto.fromJson(
              json['membership'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PoolTransactionDtoToJson(PoolTransactionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poolId': instance.poolId,
      'membershipId': instance.membershipId,
      'paymentReference': instance.paymentReference,
      'monnifyTransactionReference': instance.monnifyTransactionReference,
      'amountExpected': instance.amountExpected,
      'amountPaid': instance.amountPaid,
      'state': instance.state,
      'paidAt': instance.paidAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'membership': instance.membership?.toJson(),
    };

PoolTransactionMembershipDto _$PoolTransactionMembershipDtoFromJson(
  Map<String, dynamic> json,
) => PoolTransactionMembershipDto(
  id: json['id'] as String,
  userId: json['userId'] as String,
  state: json['state'] as String,
  user: json['user'] == null
      ? null
      : PoolMemberUserDto.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PoolTransactionMembershipDtoToJson(
  PoolTransactionMembershipDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'state': instance.state,
  'user': instance.user?.toJson(),
};
