import 'package:co_buy/core/error/failures.dart';
import 'package:co_buy/core/network/storage/token_storage.dart';
import 'package:co_buy/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:co_buy/features/auth/data/dtos/login_request_dto.dart';
import 'package:co_buy/features/auth/data/dtos/login_response_dto.dart';
import 'package:co_buy/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:co_buy/features/auth/domain/entities/login_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockTokenStorage extends Mock implements TokenStorage {}

void main() {
  late MockAuthRemoteDataSource remote;
  late MockTokenStorage tokenStorage;
  late AuthRepositoryImpl repo;

  const request = LoginRequest(username: 'kingsley', password: 'secret');

  setUpAll(() {
    registerFallbackValue(
      const LoginRequestDto(username: '', password: ''),
    );
  });

  setUp(() {
    remote = MockAuthRemoteDataSource();
    tokenStorage = MockTokenStorage();
    repo = AuthRepositoryImpl(remote, tokenStorage);
  });

  test('login persists tokens and returns Right', () async {
    when(() => remote.loginUser(body: any(named: 'body'))).thenAnswer(
      (_) async =>
          const LoginResponseDto(accessToken: 'a1', refreshToken: 'r1'),
    );
    when(() => tokenStorage.saveTokens(
        access: any(named: 'access'),
        refresh: any(named: 'refresh'))).thenAnswer((_) async {});

    final result = await repo.login(request);

    expect(result.isRight(), true);
    verify(() => tokenStorage.saveTokens(access: 'a1', refresh: 'r1'))
        .called(1);
  });

  test('login maps 401 badResponse to UnauthorizedFailure and skips saving',
      () async {
    final opts = RequestOptions(path: '/auth/login');
    when(() => remote.loginUser(body: any(named: 'body'))).thenThrow(
      DioException(
        requestOptions: opts,
        type: DioExceptionType.badResponse,
        response: Response(requestOptions: opts, statusCode: 401),
      ),
    );

    final result = await repo.login(request);

    expect(result.isLeft(), true);
    result.fold(
      (f) => expect(f, isA<UnauthorizedFailure>()),
      (_) => fail('expected Left'),
    );
    verifyNever(() => tokenStorage.saveTokens(
        access: any(named: 'access'), refresh: any(named: 'refresh')));
  });

  test('logout clears stored tokens', () async {
    when(() => tokenStorage.clear()).thenAnswer((_) async {});

    final result = await repo.logout();

    expect(result.isRight(), true);
    verify(() => tokenStorage.clear()).called(1);
  });
}
