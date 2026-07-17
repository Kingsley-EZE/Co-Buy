import 'package:dartz/dartz.dart';

import 'failures.dart';

/// A computation that either failed with a [Failure] or produced a [T].
typedef Result<T> = Either<Failure, T>;

/// The async variant — what every repository/use-case method returns.
typedef FutureResult<T> = Future<Either<Failure, T>>;
