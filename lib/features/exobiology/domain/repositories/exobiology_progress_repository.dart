import '../../../../core/lifecycle/disposable.dart';
import '../../../../core/result/result.dart';
import '../entities/exobiology_progress.dart';
import '../entities/sample_record.dart';

/// Persists what the commander has scanned, sold and ticked off.
abstract interface class ExobiologyProgressRepository implements Disposable {
  Future<Result<ExobiologyProgress>> load();

  /// Emits the current progress, then every subsequent change.
  Stream<ExobiologyProgress> watch();

  Future<Result<ExobiologyProgress>> save(ExobiologyProgress progress);

  /// Inserts or updates one organism's record.
  Future<Result<ExobiologyProgress>> upsertRecord(SampleRecord record);

  Future<Result<ExobiologyProgress>> removeRecord(String recordKey);

  /// Marks a roadmap step as done, or clears that mark.
  Future<Result<ExobiologyProgress>> setStepCompleted(
    String stepId, {
    required bool completed,
  });

  /// Marks a roadmap step as deliberately skipped, or clears that mark.
  Future<Result<ExobiologyProgress>> setStepDismissed(
    String stepId, {
    required bool dismissed,
  });

  /// Records profit earned before the commander started using the app.
  Future<Result<ExobiologyProgress>> setDeclaredProfit(int creditsCr);

  Future<Result<void>> clear();
}
