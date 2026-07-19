import 'package:json_annotation/json_annotation.dart';

part 'bank_account_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class BankAccountLookupResponseDto {
  const BankAccountLookupResponseDto({
    required this.success,
    required this.data,
    this.message,
  });

  final bool success;
  final BankAccountDto data;
  final String? message;

  factory BankAccountLookupResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BankAccountLookupResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountLookupResponseDtoToJson(this);
}

@JsonSerializable()
class BankAccountDto {
  const BankAccountDto({
    required this.accountNumber,
    required this.accountName,
    required this.bankCode,
  });

  final String accountNumber;
  final String accountName;
  final String bankCode;

  factory BankAccountDto.fromJson(Map<String, dynamic> json) =>
      _$BankAccountDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountDtoToJson(this);
}
