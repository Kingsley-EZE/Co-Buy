import '../error/result.dart';

/// Base contract for a single unit of domain logic.
///
/// Presentation calls use cases (never repositories directly), keeping
/// business rules out of blocs/widgets.
abstract class UseCase<T, Params> {
  FutureResult<T> call(Params params);
}

/// Marker for use cases that take no input.
class NoParams {
  const NoParams();
}
