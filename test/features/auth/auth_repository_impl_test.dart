import 'package:co_buy/core/error/failures.dart';
import 'package:co_buy/core/network/sockets/socket_service.dart';
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

class MockSocketService extends Mock implements SocketService {}

void main() {
  late MockAuthRemoteDataSource remote;
  late MockTokenStorage tokenStorage;
  late MockSocketService socketService;
  late AuthRepositoryImpl repo;

  const request = LoginRequest(
    email: 'kingsley@example.com',
    password: 'secret',
  );

  const user = UserDto(
    id: 'u1',
    firstName: 'Kingsley',
    lastName: 'Eze',
    email: 'kingsley@example.com',
    name: 'Kingsley Eze',
    isVerified: true,
    role: 'User',
  );

  const response = LoginResponseDto(
    success: true,
    data: LoginDataDto(user: user, accessToken: 'a1', refreshToken: 'r1'),
    message: 'Login successful',
  );

  setUpAll(() {
    registerFallbackValue(const LoginRequestDto(email: '', password: ''));
  });

  setUp(() {
    remote = MockAuthRemoteDataSource();
    tokenStorage = MockTokenStorage();
    socketService = MockSocketService();
    repo = AuthRepositoryImpl(remote, tokenStorage, socketService);
  });

  test(
    'login persists the access token and returns the signed-in user',
    () async {
      when(
        () => remote.loginUser(body: any(named: 'body')),
      ).thenAnswer((_) async => response);
      when(
        () => tokenStorage.saveTokens(
          access: any(named: 'access'),
          refresh: any(named: 'refresh'),
        ),
      ).thenAnswer((_) async {});
      when(() => socketService.connect(any())).thenReturn(null);

      final result = await repo.login(request);

      result.fold((f) => fail('expected Right, got $f'), (u) {
        expect(u.id, 'u1');
        expect(u.email, 'kingsley@example.com');
        expect(u.name, 'Kingsley Eze');
      });
      // Both tokens from the response are persisted so AuthInterceptor can
      // refresh the session on a 401 instead of forcing a re-login.
      verify(
        () => tokenStorage.saveTokens(access: 'a1', refresh: 'r1'),
      ).called(1);
      // The socket is opened with the fresh access token after login.
      verify(() => socketService.connect('a1')).called(1);
    },
  );

  test(
    'login maps 401 badResponse to UnauthorizedFailure and skips saving',
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
      verifyNever(
        () => tokenStorage.saveTokens(
          access: any(named: 'access'),
          refresh: any(named: 'refresh'),
        ),
      );
      verifyNever(() => socketService.connect(any()));
    },
  );

  test('logout clears stored tokens', () async {
    when(() => tokenStorage.clear()).thenAnswer((_) async {});

    final result = await repo.logout();

    expect(result.isRight(), true);
    verify(() => tokenStorage.clear()).called(1);
  });
}
