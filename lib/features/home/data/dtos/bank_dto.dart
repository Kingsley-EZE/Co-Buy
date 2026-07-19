import 'package:json_annotation/json_annotation.dart';

part 'bank_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class BanksResponseDto {
  const BanksResponseDto({
    required this.success,
    required this.data,
    this.message,
  });

  final bool success;
  final List<BankDto> data;
  final String? message;

  factory BanksResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BanksResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BanksResponseDtoToJson(this);
}

@JsonSerializable()
class BankDto {
  const BankDto({required this.name, required this.code});

  final String name;
  final String code;

  factory BankDto.fromJson(Map<String, dynamic> json) =>
      _$BankDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BankDtoToJson(this);
}
