import 'package:equatable/equatable.dart';

/// Base type for all domain-level failures.
///
/// Repositories catch infrastructure exceptions (e.g. [DioException]) and map
/// them to one of these so the domain and presentation layers never deal with
/// raw exceptions — only values.
sealed class Failure extends Equatable {
  const Failure(this.message, {this.statusCode});

  /// Human-readable description, safe to surface in the UI.
  final String message;

  /// HTTP status code when the failure originated from a server response.
  final int? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

/// The server responded with a non-2xx status.
class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.statusCode});
}

/// The device could not reach the network at all.
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

/// The request exceeded a connect/send/receive timeout.
class TimeoutFailure extends Failure {
  const TimeoutFailure([super.message = 'Request timed out']);
}

/// Authentication failed and could not be recovered by a token refresh.
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([
    super.message = 'Session expired, please sign in again',
  ]);
}

/// A local cache read/write failed.
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache error']);
}

/// Anything that doesn't fit a more specific category.
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Something went wrong']);
}
