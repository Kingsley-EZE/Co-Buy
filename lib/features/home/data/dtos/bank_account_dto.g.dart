// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccountLookupResponseDto _$BankAccountLookupResponseDtoFromJson(
  Map<String, dynamic> json,
) => BankAccountLookupResponseDto(
  success: json['success'] as bool,
  data: BankAccountDto.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$BankAccountLookupResponseDtoToJson(
  BankAccountLookupResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data.toJson(),
  'message': instance.message,
};

BankAccountDto _$BankAccountDtoFromJson(Map<String, dynamic> json) =>
    BankAccountDto(
      accountNumber: json['accountNumber'] as String,
      accountName: json['accountName'] as String,
      bankCode: json['bankCode'] as String,
    );

Map<String, dynamic> _$BankAccountDtoToJson(BankAccountDto instance) =>
    <String, dynamic>{
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'bankCode': instance.bankCode,
    };
