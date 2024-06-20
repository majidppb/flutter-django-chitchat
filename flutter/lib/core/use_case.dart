import 'typedefs.dart';

/// [UseCase] with Params.
abstract class UseCase<T, P> {
  ResultFuture<T> call(P params);
}

/// [UseCase] with no Params.
abstract class UseCaseNoParams<T> {
  ResultFuture<T> call();
}
