import '../../domain/entities/post.dart';
import '../dtos/post_dto.dart';

extension PostDtoX on PostDto {
  Post toEntity() => Post(id: id, title: title, body: body, userId: userId);
}

extension PostX on Post {
  PostDto toDto() => PostDto(id: id, title: title, body: body, userId: userId);
}
