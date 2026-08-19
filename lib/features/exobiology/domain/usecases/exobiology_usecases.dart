import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/body_profile.dart';
import '../entities/commander_snapshot.dart';
import '../entities/exobiology_catalog.dart';
import '../entities/exobiology_progress.dart';
import '../entities/roadmap.dart';
import '../entities/sample_record.dart';
import '../entities/species_match.dart';
import '../repositories/commander_snapshot_source.dart';
import '../repositories/exobiology_catalog_repository.dart';
import '../repositories/exobiology_progress_repository.dart';
import '../services/exobiology_roadmap_engine.dart';
import '../services/species_matcher.dart';

/// Builds the prioritised roadmap for the commander as they stand right now.
@injectable
class GetExobiologyRoadmap extends UseCase<Roadmap, NoParams> {
  const GetExobiologyRoadmap(this._snapshots, this._engine);

  final CommanderSnapshotSource _snapshots;
  final ExobiologyRoadmapEngine _engine;

  @override
  Future<Result<Roadmap>> call(NoParams input) async {
    final Result<CommanderSnapshot> snapshot = await _snapshots.current();
    return snapshot.map(_engine.build);
  }
}

/// Recomputes the roadmap whenever the commander's state changes.
@injectable
class WatchExobiologyRoadmap extends StreamUseCase<Roadmap, NoParams> {
  const WatchExobiologyRoadmap(this._snapshots, this._engine);

  final CommanderSnapshotSource _snapshots;
  final ExobiologyRoadmapEngine _engine;

  @override
  Stream<Roadmap> call(NoParams input) =>
      _snapshots.watch().map(_engine.build);
}

/// Argument of [SetRoadmapStepState].
class RoadmapStepStateInput extends Equatable {
  const RoadmapStepStateInput({
    required this.stepId,
    this.completed,
    this.dismissed,
  });

  final String stepId;
  final bool? completed;
  final bool? dismissed;

  @override
  List<Object?> get props => <Object?>[stepId, completed, dismissed];
}

/// Ticks a step off, or skips it.
///
/// This is a statement about the save, not a cosmetic checkbox: the roadmap
/// engine folds it back into the commander's state, so completing a step
/// unblocks everything that depended on it.
@injectable
class SetRoadmapStepState
    extends UseCase<ExobiologyProgress, RoadmapStepStateInput> {
  const SetRoadmapStepState(this._progress);

  final ExobiologyProgressRepository _progress;

  @override
  Future<Result<ExobiologyProgress>> call(RoadmapStepStateInput input) async {
    if (input.dismissed case final bool dismissed) {
      return _progress.setStepDismissed(input.stepId, dismissed: dismissed);
    }
    return _progress.setStepCompleted(
      input.stepId,
      completed: input.completed ?? false,
    );
  }
}

/// The bundled organic-life database.
@injectable
class GetExobiologyCatalog extends UseCase<ExobiologyCatalog, NoParams> {
  const GetExobiologyCatalog(this._catalog);

  final ExobiologyCatalogRepository _catalog;

  @override
  Future<Result<ExobiologyCatalog>> call(NoParams input) =>
      _catalog.loadCatalog();
}

/// The species a body can carry, with the reasoning shown.
@injectable
class IdentifySpeciesForBody extends UseCase<List<SpeciesMatch>, BodyProfile> {
  const IdentifySpeciesForBody(this._catalog, this._progress, this._matcher);

  final ExobiologyCatalogRepository _catalog;
  final ExobiologyProgressRepository _progress;
  final SpeciesMatcher _matcher;

  @override
  Future<Result<List<SpeciesMatch>>> call(BodyProfile input) async {
    final Result<ExobiologyCatalog> catalog = await _catalog.loadCatalog();
    final Result<ExobiologyProgress> progress = await _progress.load();

    return catalog.map(
      (ExobiologyCatalog value) => _matcher.match(
        body: input,
        catalog: value.species,
        soldSpeciesKeys:
            progress.valueOrNull?.soldSpeciesKeys ?? const <String>{},
      ),
    );
  }
}

@injectable
class WatchExobiologyProgress
    extends StreamUseCase<ExobiologyProgress, NoParams> {
  const WatchExobiologyProgress(this._progress);

  final ExobiologyProgressRepository _progress;

  @override
  Stream<ExobiologyProgress> call(NoParams input) => _progress.watch();
}

@injectable
class RecordSampleProgress extends UseCase<ExobiologyProgress, SampleRecord> {
  const RecordSampleProgress(this._progress);

  final ExobiologyProgressRepository _progress;

  @override
  Future<Result<ExobiologyProgress>> call(SampleRecord input) =>
      _progress.upsertRecord(input);
}

@injectable
class RemoveSampleRecord extends UseCase<ExobiologyProgress, String> {
  const RemoveSampleRecord(this._progress);

  final ExobiologyProgressRepository _progress;

  @override
  Future<Result<ExobiologyProgress>> call(String input) =>
      _progress.removeRecord(input);
}

/// Records what the commander earned before they started using the app, so the
/// Exobiologist rank bar is not wrong on day one.
@injectable
class SetDeclaredExobiologyProfit extends UseCase<ExobiologyProgress, int> {
  const SetDeclaredExobiologyProfit(this._progress);

  final ExobiologyProgressRepository _progress;

  @override
  Future<Result<ExobiologyProgress>> call(int input) =>
      _progress.setDeclaredProfit(input);
}
