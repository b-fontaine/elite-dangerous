import 'package:equatable/equatable.dart';

import '../result/result.dart';

/// A single application-level operation.
///
/// Use cases are the only entry point the presentation layer may call: BLoCs
/// never touch a repository directly.
abstract class UseCase<Output, Input> {
  const UseCase();

  Future<Result<Output>> call(Input input);
}

/// A use case exposing a continuous stream instead of a one-shot answer.
abstract class StreamUseCase<Output, Input> {
  const StreamUseCase();

  Stream<Output> call(Input input);
}

/// Marker for use cases that take no argument.
final class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => const <Object?>[];
}
