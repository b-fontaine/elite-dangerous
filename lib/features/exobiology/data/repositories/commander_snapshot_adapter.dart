import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../commander/domain/entities/commander.dart';
import '../../../commander/domain/entities/manual_commander_overrides.dart';
import '../../../commander/domain/entities/rank.dart';
import '../../../commander/domain/entities/suit_info.dart';
import '../../../commander/domain/repositories/commander_repository.dart';
import '../../../journal/domain/entities/exobiology_activity.dart';
import '../../../journal/domain/usecases/journal_usecases.dart';
import '../../domain/entities/commander_snapshot.dart';
import '../../domain/entities/exobiology_catalog.dart';
import '../../domain/entities/exobiology_progress.dart';
import '../../domain/entities/organic_species.dart';
import '../../domain/entities/suit.dart';
import '../../domain/repositories/commander_snapshot_source.dart';
import '../../domain/repositories/exobiology_catalog_repository.dart';
import '../../domain/repositories/exobiology_progress_repository.dart';

/// Anti-corruption layer between the commander context and the exobiology one.
///
/// The roadmap engine is a pure function of [CommanderSnapshot]; this is the
/// only place that knows how to assemble one out of four very different
/// sources — the Companion API profile, what the commander typed in, what the
/// app recorded, and what the imported flight log proves.
///
/// The journal is folded in as a *derivation*, never copied into the progress
/// store: importing the same day twice would otherwise double the career
/// profit, and the aggregation is cheap enough to redo.
@LazySingleton(as: CommanderSnapshotSource)
class CommanderSnapshotAdapter implements CommanderSnapshotSource {
  const CommanderSnapshotAdapter(
    this._commanders,
    this._progress,
    this._activity,
    this._catalog,
    this._journalEvents,
  );

  final CommanderRepository _commanders;
  final ExobiologyProgressRepository _progress;
  final GetExobiologyActivity _activity;
  final ExobiologyCatalogRepository _catalog;
  final WatchJournalEvents _journalEvents;

  @override
  Future<Result<CommanderSnapshot>> current() async {
    final Result<Commander> commander = await _commanders.getProfile();
    final Result<ManualCommanderOverrides> overrides =
        await _commanders.getOverrides();
    final Result<ExobiologyProgress> progress = await _progress.load();
    final Result<ExobiologyActivity> activity =
        await _activity(const NoParams());
    final Result<ExobiologyCatalog> catalog = await _catalog.loadCatalog();

    return Success<CommanderSnapshot>(
      _build(
        commander.valueOrNull ?? const Commander.unknown(),
        overrides.valueOrNull ?? const ManualCommanderOverrides.empty(),
        progress.valueOrNull ?? const ExobiologyProgress.empty(),
        activity.valueOrNull ?? const ExobiologyActivity(),
        catalog.valueOrNull ?? const ExobiologyCatalog.empty(),
      ),
    );
  }

  @override
  Stream<CommanderSnapshot> watch() {
    // Either side can change independently: the commander refreshes their
    // profile, or the app records a sale. Both must recompute the roadmap.
    late final StreamController<CommanderSnapshot> controller;
    final List<StreamSubscription<void>> subscriptions =
        <StreamSubscription<void>>[];

    Future<void> emit() async {
      final Result<CommanderSnapshot> snapshot = await current();
      final CommanderSnapshot? value = snapshot.valueOrNull;
      if (value != null && !controller.isClosed) {
        controller.add(value);
      }
    }

    controller = StreamController<CommanderSnapshot>(
      onListen: () {
        subscriptions
          ..add(_commanders.watchProfile().listen((_) => unawaited(emit())))
          ..add(_progress.watch().listen((_) => unawaited(emit())))
          ..add(
            _journalEvents(const NoParams()).listen((_) => unawaited(emit())),
          );
      },
      onCancel: () async {
        for (final StreamSubscription<void> subscription in subscriptions) {
          await subscription.cancel();
        }
        subscriptions.clear();
        await controller.close();
      },
    );

    return controller.stream.distinct();
  }

  CommanderSnapshot _build(
    Commander commander,
    ManualCommanderOverrides overrides,
    ExobiologyProgress progress,
    ExobiologyActivity activity,
    ExobiologyCatalog catalog,
  ) {
    final SuitInfo? artemis = commander.artemis;
    final int artemisGrade = overrides.artemisGrade ?? artemis?.grade ?? 0;

    return CommanderSnapshot(
      commanderName: commander.isKnown ? commander.name : null,
      creditBalance: commander.credits,
      currentSystem: commander.currentSystem,
      // Records entered in the app and sales proven by the journal describe
      // the same career; taking the larger keeps an import from inflating it.
      exobiologyProfitCr: (overrides.declaredExobiologyProfitCr ?? 0) +
          _max(progress.cumulativeProfitCr, activity.totalSoldCr),
      suit: artemisGrade > 0
          ? SuitLoadout(
              type: SuitType.artemis,
              grade: artemisGrade,
              installedModificationIds: <String>{
                ...?artemis?.modIds.map(_normaliseModId),
                ...overrides.installedModIds,
              },
            )
          : const SuitLoadout.none(),
      ownedSuitTypes: <SuitType>{
        if (artemisGrade > 0) SuitType.artemis,
        if (commander.ownsMaverick || overrides.ownsMaverick)
          SuitType.maverick,
      },
      suitMaterials: overrides.suitMaterials,
      hasMetaAlloy: overrides.hasMetaAlloy,
      pledgedPower: overrides.pledgedPower,
      unlockedShipEngineerIds: overrides.unlockedShipEngineerIds,
      unlockedSuitEngineerIds: overrides.unlockedSuitEngineerIds,
      explorerRank:
          overrides.explorerRankLevel ?? commander.rankLevel(RankType.explore),
      hasFsdIncreasedRangeG5: overrides.hasFsdIncreasedRangeG5,
      hasMassManager: overrides.hasMassManager,
      hasGuardianFsdBooster: overrides.hasGuardianFsdBooster,
      jumpRangeLy: overrides.jumpRangeLy ?? commander.jumpRangeLy,
      shipName: overrides.shipName ?? commander.shipType ?? commander.shipName,
      hasDetailedSurfaceScanner: overrides.hasDetailedSurfaceScanner,
      unsoldOrganicDataCr: _max(
        progress.atRiskValueCr,
        _atRiskFromJournal(activity, catalog),
      ),
      completedRoadmapStepIds: progress.completedStepIds,
      dismissedRoadmapStepIds: progress.dismissedStepIds,
      distinctSpeciesSold:
          _max(progress.distinctSpeciesSold, activity.distinctSpeciesSold),
      lastSaleAt: activity.lastSaleAt ?? _lastSaleAt(progress),
    );
  }

  /// Value of the organisms the journal shows as complete but unsold.
  ///
  /// Priced from the catalogue: the journal only names the species, and the
  /// payout is exactly what the commander stands to lose.
  int _atRiskFromJournal(
    ExobiologyActivity activity,
    ExobiologyCatalog catalog,
  ) {
    if (activity.completedNotSold.isEmpty || catalog.isEmpty) {
      return 0;
    }
    final Map<String, int> valueByName = <String, int>{
      for (final OrganicSpecies species in catalog.species)
        species.name.toLowerCase(): species.baseValueCr,
    };
    return activity.completedNotSold.fold<int>(
      0,
      (int sum, InProgressOrganism organism) =>
          sum + (valueByName[organism.species.toLowerCase()] ?? 0),
    );
  }

  static int _max(int a, int b) => a > b ? a : b;

  DateTime? _lastSaleAt(ExobiologyProgress progress) {
    DateTime? latest;
    for (final DateTime soldAt
        in progress.records.map((r) => r.soldAt).whereType<DateTime>()) {
      if (latest == null || soldAt.isAfter(latest)) {
        latest = soldAt;
      }
    }
    return latest;
  }

  /// Frontier prefixes suit modification symbols with `suit_` and drops the
  /// underscores the roadmap ids use, e.g. `suit_improvedbatterycapacity`
  /// against `improved_battery_capacity`.
  static String _normaliseModId(String symbol) {
    const Map<String, String> known = <String, String>{
      'suit_improvedbatterycapacity': 'improved_battery_capacity',
      'suit_increasedbackpackcapacity': 'extra_backpack_capacity',
      'suit_extrabackpackcapacity': 'extra_backpack_capacity',
      'suit_reducedtoolbatteryconsumption':
          'reduced_tool_battery_consumption',
      'suit_increasedsprintduration': 'increased_sprint_duration',
      'suit_improvedjumpassist': 'improved_jump_assist',
      'suit_nightvision': 'night_vision',
    };
    return known[symbol.toLowerCase()] ?? symbol;
  }
}
