import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/stream/initial_then.dart';
import '../../../../core/time/clock.dart';
import '../../domain/entities/exobiology_progress.dart';
import '../../domain/entities/sample_record.dart';
import '../../domain/repositories/exobiology_progress_repository.dart';
import '../datasources/exobiology_progress_local_data_source.dart';

@LazySingleton(as: ExobiologyProgressRepository)
class ExobiologyProgressRepositoryImpl implements ExobiologyProgressRepository {
  ExobiologyProgressRepositoryImpl(this._local, this._clock);

  final ExobiologyProgressLocalDataSource _local;
  final Clock _clock;

  final StreamController<ExobiologyProgress> _controller =
      StreamController<ExobiologyProgress>.broadcast();

  ExobiologyProgress? _cached;

  @override
  Future<Result<ExobiologyProgress>> load() => guard(
        () async => _cached ??= await _local.read(),
        onError: (Object error, _) => CacheFailure(
          message: 'Progression d\'exobiologie illisible.',
          cause: error,
        ),
      );

  @override
  Stream<ExobiologyProgress> watch() => initialThen<ExobiologyProgress>(
        () async =>
            (await load()).getOrElse((_) => const ExobiologyProgress.empty()),
        _controller.stream,
      );

  @override
  Future<Result<ExobiologyProgress>> save(ExobiologyProgress progress) =>
      _persist(progress);

  @override
  Future<Result<ExobiologyProgress>> upsertRecord(SampleRecord record) =>
      _mutate((ExobiologyProgress progress) => progress.upsert(record));

  @override
  Future<Result<ExobiologyProgress>> removeRecord(String recordKey) =>
      _mutate(
        (ExobiologyProgress progress) => progress.copyWith(
          records: progress.records
              .where((SampleRecord record) => record.key != recordKey)
              .toList(),
        ),
      );

  @override
  Future<Result<ExobiologyProgress>> setStepCompleted(
    String stepId, {
    required bool completed,
  }) =>
      _mutate((ExobiologyProgress progress) {
        final Set<String> completedIds = <String>{...progress.completedStepIds};
        final Set<String> dismissedIds = <String>{...progress.dismissedStepIds};
        if (completed) {
          completedIds.add(stepId);
          // Ticking a step off contradicts having skipped it.
          dismissedIds.remove(stepId);
        } else {
          completedIds.remove(stepId);
        }
        return progress.copyWith(
          completedStepIds: completedIds,
          dismissedStepIds: dismissedIds,
        );
      });

  @override
  Future<Result<ExobiologyProgress>> setStepDismissed(
    String stepId, {
    required bool dismissed,
  }) =>
      _mutate((ExobiologyProgress progress) {
        final Set<String> dismissedIds = <String>{...progress.dismissedStepIds};
        final Set<String> completedIds = <String>{...progress.completedStepIds};
        if (dismissed) {
          dismissedIds.add(stepId);
          completedIds.remove(stepId);
        } else {
          dismissedIds.remove(stepId);
        }
        return progress.copyWith(
          completedStepIds: completedIds,
          dismissedStepIds: dismissedIds,
        );
      });

  @override
  Future<Result<ExobiologyProgress>> setDeclaredProfit(int creditsCr) {
    if (creditsCr < 0) {
      return Future<Result<ExobiologyProgress>>.value(
        const ResultFailure<ExobiologyProgress>(
          ValidationFailure(
            message: 'Le profit déclaré ne peut pas être négatif.',
            field: 'declaredProfitCr',
          ),
        ),
      );
    }
    return _mutate(
      (ExobiologyProgress progress) =>
          progress.copyWith(declaredProfitCr: creditsCr),
    );
  }

  @override
  Future<Result<void>> clear() => guard(() async {
        await _local.clear();
        const ExobiologyProgress empty = ExobiologyProgress.empty();
        _cached = empty;
        _controller.add(empty);
      });

  Future<Result<ExobiologyProgress>> _mutate(
    ExobiologyProgress Function(ExobiologyProgress progress) transform,
  ) async {
    final Result<ExobiologyProgress> current = await load();
    return switch (current) {
      Success<ExobiologyProgress>(:final ExobiologyProgress value) =>
        _persist(transform(value).copyWith(lastUpdatedAt: _clock.now())),
      ResultFailure<ExobiologyProgress>() => current,
    };
  }

  Future<Result<ExobiologyProgress>> _persist(ExobiologyProgress progress) =>
      guard(
        () async {
          await _local.write(progress);
          _cached = progress;
          _controller.add(progress);
          return progress;
        },
        onError: (Object error, _) => CacheFailure(
          message: 'Impossible d\'enregistrer la progression.',
          cause: error,
        ),
      );

  @disposeMethod
  @override
  Future<void> dispose() => _controller.close();
}
