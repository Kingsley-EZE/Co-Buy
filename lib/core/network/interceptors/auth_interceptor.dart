import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../storage/token_storage.dart';

/// Attaches the bearer token to every request and transparently refreshes it
/// on a 401, retrying the original request once.
///
/// Extends [QueuedInterceptorsWrapper] so `onError` calls are serialized:
/// parallel 401s queue up instead of each firing its own refresh. On top of
/// that, [_runRefreshOnce] holds a single-flight [Completer] lock so at most
/// one `/auth/refresh` call is ever in flight.
///
/// The refresh (and the retry of the original request) go through a separate
/// bare Dio without this interceptor — routing them through the main Dio
/// would deadlock the queue by design.
@lazySingleton
class AuthInterceptor extends QueuedInterceptorsWrapper {
  AuthInterceptor(this._tokenStorage, @Named('refreshDio') this._refreshDio);

  final TokenStorage _tokenStorage;
  final Dio _refreshDio;
  Completer<bool>? _refreshLock;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStorage.readAccessToken();
    if (token != null) options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final isAuthError = err.response?.statusCode == 401;
    final alreadyRetried = err.requestOptions.extra['retried'] == true;
    if (!isAuthError || alreadyRetried) return handler.next(err);

    try {
      final refreshed = await _runRefreshOnce();
      if (!refreshed) {
        await _tokenStorage.clear();
        return handler.next(err);
      }
      final token = await _tokenStorage.readAccessToken();
      final opts = err.requestOptions
        ..extra['retried'] = true
        ..headers['Authorization'] = 'Bearer $token';
      final response = await _refreshDio.fetch(opts);
      return handler.resolve(response);
    } catch (_) {
      // Clearing tokens signals upstream (e.g. an auth listener) to force logout.
      await _tokenStorage.clear();
      return handler.next(err);
    }
  }

  /// Single-flight refresh: concurrent callers await the same [Completer].
  Future<bool> _runRefreshOnce() {
    if (_refreshLock != null) return _refreshLock!.future;
    final lock = Completer<bool>();
    _refreshLock = lock;
    _refresh().then(lock.complete).catchError((Object e, StackTrace s) {
      lock.completeError(e, s);
    }).whenComplete(() => _refreshLock = null);
    return lock.future;
  }

  Future<bool> _refresh() async {
    final refreshToken = await _tokenStorage.readRefreshToken();
    if (refreshToken == null) return false;
    // TODO: adjust the path/payload/response shape to the real auth API.
    final res = await _refreshDio.post(
      '/auth/refresh',
      data: { 'refreshToken': refreshToken, "expiresInMins": 30 },
    );
    if (res.statusCode == 200) {
      await _tokenStorage.saveTokens(
        access: res.data['accessToken'] as String,
        refresh: res.data['refreshToken'] as String,
      );
      return true;
    }
    return false;
  }
}
