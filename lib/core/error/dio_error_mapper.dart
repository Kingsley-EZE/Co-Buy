import 'package:dio/dio.dart';

import 'failures.dart';

/// Central mapping of [DioException] to a domain [Failure].
///
/// Call this from repository `catch` blocks so status-code interpretation
/// lives in exactly one place. Note that Dio surfaces every non-2xx response
/// as [DioExceptionType.badResponse], not as a successful [Response].
Failure mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return const TimeoutFailure();
    case DioExceptionType.connectionError:
      return const NetworkFailure();
    case DioExceptionType.badCertificate:
      return const ServerFailure('Bad SSL certificate');
    case DioExceptionType.cancel:
      return const UnknownFailure('Request cancelled');
    case DioExceptionType.badResponse:
      return _mapStatus(e.response?.statusCode, e.response?.data);
    case DioExceptionType.unknown:
      return const UnknownFailure();
  }
}

Failure _mapStatus(int? code, dynamic data) {
  final msg = (data is Map && data['message'] is String)
      ? data['message'] as String
      : 'Server error';
  switch (code) {
    case 400:
      return ServerFailure('Bad request: $msg', statusCode: 400);
    case 401:
      return const UnauthorizedFailure();
    case 403:
      return ServerFailure('Forbidden: $msg', statusCode: 403);
    case 404:
      return ServerFailure('Not found: $msg', statusCode: 404);
    case 409:
      return ServerFailure('Conflict: $msg', statusCode: 409);
    case 422:
      return ServerFailure('Validation error: $msg', statusCode: 422);
    case 429:
      return ServerFailure('Too many requests', statusCode: 429);
    case 500:
      return const ServerFailure('Internal server error', statusCode: 500);
    default:
      return ServerFailure(msg, statusCode: code);
  }
}
