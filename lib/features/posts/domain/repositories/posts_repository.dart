import '../../../../core/error/result.dart';
import '../entities/post.dart';

/// Domain contract for posts. Implemented in the data layer; presentation
/// depends only on this abstraction.
abstract class PostsRepository {
  FutureResult<List<Post>> getPosts({int page = 1, int limit = 20});
  FutureResult<Post> getPost(int id);
  FutureResult<Post> createPost(Post post);
}
