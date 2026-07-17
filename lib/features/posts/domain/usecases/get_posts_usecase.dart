import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/post.dart';
import '../repositories/posts_repository.dart';

@injectable
class GetPostsUseCase implements UseCase<List<Post>, GetPostsParams> {
  GetPostsUseCase(this._repo);

  final PostsRepository _repo;

  @override
  FutureResult<List<Post>> call(GetPostsParams params) =>
      _repo.getPosts(page: params.page, limit: params.limit);
}

class GetPostsParams {
  const GetPostsParams({this.page = 1, this.limit = 20});

  final int page;
  final int limit;
}
