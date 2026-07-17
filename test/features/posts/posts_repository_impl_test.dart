import 'package:co_buy/core/error/failures.dart';
import 'package:co_buy/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:co_buy/features/posts/data/dtos/post_dto.dart';
import 'package:co_buy/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostsRemoteDataSource extends Mock implements PostsRemoteDataSource {}

void main() {
  late MockPostsRemoteDataSource remote;
  late PostsRepositoryImpl repo;

  setUp(() {
    remote = MockPostsRemoteDataSource();
    repo = PostsRepositoryImpl(remote);
  });

  test('maps success to Right<List<Post>>', () async {
    when(() => remote.getPosts(any(), any())).thenAnswer(
      (_) async => const [PostDto(id: 1, title: 't', body: 'b')],
    );

    final result = await repo.getPosts();

    expect(result.isRight(), true);
    result.fold(
      (_) => fail('expected Right'),
      (posts) => expect(posts.length, 1),
    );
  });

  test('maps timeout DioException to TimeoutFailure', () async {
    when(() => remote.getPosts(any(), any())).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: '/posts'),
        type: DioExceptionType.receiveTimeout,
      ),
    );

    final result = await repo.getPosts();

    expect(result.isLeft(), true);
    result.fold(
      (f) => expect(f, isA<TimeoutFailure>()),
      (_) => fail('expected Left'),
    );
  });

  test('maps 401 badResponse to UnauthorizedFailure', () async {
    final opts = RequestOptions(path: '/posts');
    when(() => remote.getPosts(any(), any())).thenThrow(
      DioException(
        requestOptions: opts,
        type: DioExceptionType.badResponse,
        response: Response(requestOptions: opts, statusCode: 401),
      ),
    );

    final result = await repo.getPosts();

    result.fold(
      (f) => expect(f, isA<UnauthorizedFailure>()),
      (_) => fail('expected Left'),
    );
  });
}
