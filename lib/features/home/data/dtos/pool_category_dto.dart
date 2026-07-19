import 'package:json_annotation/json_annotation.dart';

part 'pool_category_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PoolCategoriesResponseDto {
  const PoolCategoriesResponseDto({
    required this.success,
    required this.data,
    this.message,
  });

  final bool success;
  final List<PoolCategoryDto> data;
  final String? message;

  factory PoolCategoriesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PoolCategoriesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolCategoriesResponseDtoToJson(this);
}

@JsonSerializable()
class PoolCategoryDto {
  const PoolCategoryDto({
    required this.id,
    required this.name,
    required this.description,
    required this.isActive,
  });

  final String id;
  final String name;
  final String description;
  final bool isActive;

  factory PoolCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$PoolCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolCategoryDtoToJson(this);
}
