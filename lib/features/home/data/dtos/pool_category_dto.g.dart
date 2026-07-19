// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoolCategoriesResponseDto _$PoolCategoriesResponseDtoFromJson(
  Map<String, dynamic> json,
) => PoolCategoriesResponseDto(
  success: json['success'] as bool,
  data: (json['data'] as List<dynamic>)
      .map((e) => PoolCategoryDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$PoolCategoriesResponseDtoToJson(
  PoolCategoriesResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data.map((e) => e.toJson()).toList(),
  'message': instance.message,
};

PoolCategoryDto _$PoolCategoryDtoFromJson(Map<String, dynamic> json) =>
    PoolCategoryDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$PoolCategoryDtoToJson(PoolCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isActive': instance.isActive,
    };
