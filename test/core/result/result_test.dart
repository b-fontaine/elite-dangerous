import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result', () {
    const Failure failure = NetworkFailure();

    test('Success exposes its value and no failure', () {
      const Result<int> result = Success<int>(42);

      expect(result.isSuccess, isTrue);
      expect(result.isFailure, isFalse);
      expect(result.valueOrNull, 42);
      expect(result.failureOrNull, isNull);
    });

    test('ResultFailure exposes its failure and no value', () {
      const Result<int> result = ResultFailure<int>(failure);

      expect(result.isFailure, isTrue);
      expect(result.valueOrNull, isNull);
      expect(result.failureOrNull, failure);
    });

    test('fold collapses both branches', () {
      const Result<int> ok = Result<int>.ok(2);
      const Result<int> err = Result<int>.err(failure);

      expect(ok.fold(onSuccess: (int v) => v * 2, onFailure: (_) => -1), 4);
      expect(err.fold(onSuccess: (int v) => v * 2, onFailure: (_) => -1), -1);
    });

    test('map transforms success and passes failure through untouched', () {
      expect(const Success<int>(3).map((int v) => v + 1).valueOrNull, 4);
      expect(
        const ResultFailure<int>(failure).map((int v) => v + 1).failureOrNull,
        failure,
      );
    });

    test('flatMap chains fallible computations', () {
      Result<int> half(int v) =>
          v.isEven ? Success<int>(v ~/ 2) : const ResultFailure<int>(failure);

      expect(const Success<int>(8).flatMap(half).valueOrNull, 4);
      expect(const Success<int>(7).flatMap(half).failureOrNull, failure);
    });

    test('getOrElse falls back using the failure', () {
      expect(const Success<int>(1).getOrElse((_) => 99), 1);
      expect(const ResultFailure<int>(failure).getOrElse((_) => 99), 99);
    });

    test('equality is structural', () {
      expect(const Success<int>(1), const Success<int>(1));
      expect(
        const ResultFailure<int>(NetworkFailure()),
        const ResultFailure<int>(NetworkFailure()),
      );
      expect(const Success<int>(1), isNot(const Success<int>(2)));
    });
  });

  group('guard', () {
    test('wraps a returned value in Success', () async {
      final Result<int> result = await guard(() async => 7);

      expect(result.valueOrNull, 7);
    });

    test('converts a thrown object into an UnexpectedFailure by default',
        () async {
      final Result<int> result =
          await guard<int>(() async => throw StateError('boom'));

      expect(result.failureOrNull, isA<UnexpectedFailure>());
    });

    test('uses onError to map a domain-specific failure', () async {
      final Result<int> result = await guard<int>(
        () async => throw StateError('boom'),
        onError: (_, _) => const CacheFailure(),
      );

      expect(result.failureOrNull, isA<CacheFailure>());
    });
  });

  group('guardSync', () {
    test('wraps synchronous throws', () {
      final Result<int> result =
          guardSync<int>(() => throw const FormatException());

      expect(result.isFailure, isTrue);
    });
  });
}
