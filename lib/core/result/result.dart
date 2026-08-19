import 'package:equatable/equatable.dart';

import '../error/failure.dart';

/// A total, exhaustively-matchable alternative to throwing across layers.
///
/// Dart 3 sealed classes give us the same guarantees as `Either` without
/// pulling a functional-programming dependency into the domain layer.
sealed class Result<T> {
  const Result();

  /// Wraps a successful [value].
  const factory Result.ok(T value) = Success<T>;

  /// Wraps a [failure].
  const factory Result.err(Failure failure) = ResultFailure<T>;

  bool get isSuccess => this is Success<T>;

  bool get isFailure => this is ResultFailure<T>;

  T? get valueOrNull => switch (this) {
        Success<T>(:final T value) => value,
        ResultFailure<T>() => null,
      };

  Failure? get failureOrNull => switch (this) {
        Success<T>() => null,
        ResultFailure<T>(:final Failure failure) => failure,
      };

  /// Collapses both branches into a single [R].
  R fold<R>({
    required R Function(T value) onSuccess,
    required R Function(Failure failure) onFailure,
  }) =>
      switch (this) {
        Success<T>(:final T value) => onSuccess(value),
        ResultFailure<T>(:final Failure failure) => onFailure(failure),
      };

  /// Transforms the success value, propagating the failure untouched.
  Result<R> map<R>(R Function(T value) transform) => switch (this) {
        Success<T>(:final T value) => Success<R>(transform(value)),
        ResultFailure<T>(:final Failure failure) => ResultFailure<R>(failure),
      };

  /// Monadic bind: chains another fallible computation.
  Result<R> flatMap<R>(Result<R> Function(T value) transform) => switch (this) {
        Success<T>(:final T value) => transform(value),
        ResultFailure<T>(:final Failure failure) => ResultFailure<R>(failure),
      };

  /// Returns the value, or [fallback] when this is a failure.
  T getOrElse(T Function(Failure failure) fallback) => switch (this) {
        Success<T>(:final T value) => value,
        ResultFailure<T>(:final Failure failure) => fallback(failure),
      };
}

final class Success<T> extends Result<T> with Equatable {
  const Success(this.value);

  final T value;

  @override
  List<Object?> get props => <Object?>[value];
}

final class ResultFailure<T> extends Result<T> with Equatable {
  const ResultFailure(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => <Object?>[failure];
}

/// Runs [body] and converts any thrown object into a [Result].
///
/// [onError] lets a data source map its own exception taxonomy to a [Failure];
/// anything left unmapped becomes an [UnexpectedFailure].
Future<Result<T>> guard<T>(
  Future<T> Function() body, {
  Failure Function(Object error, StackTrace stackTrace)? onError,
}) async {
  try {
    return Success<T>(await body());
  } catch (error, stackTrace) {
    return ResultFailure<T>(
      onError?.call(error, stackTrace) ??
          UnexpectedFailure(message: error.toString(), cause: error),
    );
  }
}

/// Synchronous counterpart of [guard].
Result<T> guardSync<T>(
  T Function() body, {
  Failure Function(Object error, StackTrace stackTrace)? onError,
}) {
  try {
    return Success<T>(body());
  } catch (error, stackTrace) {
    return ResultFailure<T>(
      onError?.call(error, stackTrace) ??
          UnexpectedFailure(message: error.toString(), cause: error),
    );
  }
}
