import 'package:co_buy/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:co_buy/features/posts/data/dtos/post_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late PostsRemoteDataSource service;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://test.com'));
    adapter = DioAdapter(dio: dio);
    service = PostsRemoteDataSource(dio);
  });

  test('getPosts deserializes list', () async {
    adapter.onGet(
      '/posts',
      (s) => s.reply(200, [
        {'id': 1, 'title': 't', 'body': 'b', 'user_id': 9},
      ]),
      queryParameters: {'page': 1, 'limit': 20},
    );

    final result = await service.getPosts(1, 20);

    expect(result, isA<List<PostDto>>());
    expect(result.first.title, 't');
    expect(result.first.userId, 9);
  });
}
