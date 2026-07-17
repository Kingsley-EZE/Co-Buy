import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/dio_error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/posts_repository.dart';
import '../datasources/posts_remote_data_source.dart';
import '../mappers/post_mapper.dart';

/// Bridges the Retrofit data source and the domain: maps DTOs to entities and
/// every [DioException] to a [Failure] so exceptions never cross this layer.
@LazySingleton(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  PostsRepositoryImpl(this._remote);

  final PostsRemoteDataSource _remote;

  @override
  FutureResult<List<Post>> getPosts({int page = 1, int limit = 20}) async {
    try {
      final dtos = await _remote.getPosts(page, limit);
      return Right(dtos.map((d) => d.toEntity()).toList());
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureResult<Post> getPost(int id) async {
    try {
      return Right((await _remote.getPost(id)).toEntity());
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureResult<Post> createPost(Post post) async {
    try {
      return Right((await _remote.createPost(post.toDto())).toEntity());
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }
}
