import 'package:json_annotation/json_annotation.dart';

part 'post_dto.g.dart';

/// Wire representation of a post — stays in the data layer; the domain only
/// sees the mapped [Post] entity.
@JsonSerializable()
class PostDto {
  const PostDto({
    required this.id,
    required this.title,
    required this.body,
    this.userId,
  });

  final int id;
  final String title;
  final String body;
  @JsonKey(name: 'user_id')
  final int? userId;

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PostDtoToJson(this);
}

/// Generic paginated wrapper for list endpoints.
@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class PaginatedDto<T> {
  const PaginatedDto({required this.items, required this.total, this.nextCursor});

  final List<T> items;
  final int total;
  @JsonKey(name: 'next_cursor')
  final String? nextCursor;

  factory PaginatedDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedDtoFromJson(json, fromJsonT);
}
