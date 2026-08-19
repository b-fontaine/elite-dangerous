import '../entities/commander_snapshot.dart';
import '../entities/engineer.dart';
import '../entities/suit.dart';
import 'exobiology_reference_data.dart';
import 'roadmap_step_ids.dart';

/// Folds the commander's manually ticked steps back into the snapshot.
///
/// The app can only ever see part of a commander's save: the Companion API does
/// not expose suit grades or engineer unlocks, and a journal import only covers
/// the days it was given. Ticking a step is therefore a *statement of fact*, not
/// a cosmetic checkbox — and it must unblock everything downstream, exactly as
/// if the app had observed it.
///
/// Without this, a commander who tells the app "I already own an Artemis" would
/// still see every modification step blocked on "no Artemis detected".
class RoadmapDeclarationResolver {
  const RoadmapDeclarationResolver();

  CommanderSnapshot resolve(CommanderSnapshot snapshot) {
    final Set<String> declared = snapshot.completedRoadmapStepIds;
    if (declared.isEmpty) {
      return snapshot;
    }

    SuitLoadout suit = snapshot.suit;
    final Set<SuitType> ownedSuits = <SuitType>{...snapshot.ownedSuitTypes};
    final Set<String> suitEngineers = <String>{
      ...snapshot.unlockedSuitEngineerIds,
    };
    final Set<String> shipEngineers = <String>{
      ...snapshot.unlockedShipEngineerIds,
    };
    final Set<String> mods = <String>{...suit.installedModificationIds};
    bool fsdG5 = snapshot.hasFsdIncreasedRangeG5;
    bool massManager = snapshot.hasMassManager;
    bool guardianBooster = snapshot.hasGuardianFsdBooster;
    bool dss = snapshot.hasDetailedSurfaceScanner;
    String? power = snapshot.pledgedPower;

    for (final String id in declared) {
      switch (id) {
        case RoadmapStepIds.artemisSuit:
          ownedSuits.add(SuitType.artemis);
          if (suit.type != SuitType.artemis || suit.grade < 1) {
            suit = SuitLoadout(
              type: SuitType.artemis,
              grade: suit.grade < 1 ? 1 : suit.grade,
              installedModificationIds: mods,
            );
          }
        case RoadmapStepIds.artemisGradeTwo:
          if (suit.grade < 2) {
            suit = SuitLoadout(
              type: SuitType.artemis,
              grade: 2,
              installedModificationIds: mods,
            );
          }
        case RoadmapStepIds.maverickSuit:
          ownedSuits.add(SuitType.maverick);
        case RoadmapStepIds.detailedSurfaceScanner:
          dss = true;
        case RoadmapStepIds.fsdIncreasedRange:
          fsdG5 = true;
        case RoadmapStepIds.massManager:
          massManager = true;
        case RoadmapStepIds.guardianFsdBooster:
          guardianBooster = true;
        case RoadmapStepIds.pranavAntal:
          power = 'Pranav Antal';
        default:
          _resolveDynamic(
            id,
            suitEngineers: suitEngineers,
            shipEngineers: shipEngineers,
            modifications: mods,
          );
      }
    }

    return snapshot.copyWith(
      suit: SuitLoadout(
        type: suit.type,
        grade: suit.grade,
        installedModificationIds: mods,
      ),
      ownedSuitTypes: ownedSuits,
      unlockedSuitEngineerIds: suitEngineers,
      unlockedShipEngineerIds: shipEngineers,
      hasFsdIncreasedRangeG5: fsdG5,
      hasMassManager: massManager,
      hasGuardianFsdBooster: guardianBooster,
      hasDetailedSurfaceScanner: dss,
      pledgedPower: power,
    );
  }

  /// Handles the two id families whose suffix is data rather than a constant:
  /// `unlock.<engineerId>` and `engineering.<modificationId>`.
  void _resolveDynamic(
    String id, {
    required Set<String> suitEngineers,
    required Set<String> shipEngineers,
    required Set<String> modifications,
  }) {
    if (id.startsWith(RoadmapStepIds.unlockPrefix)) {
      final String engineerId =
          id.substring(RoadmapStepIds.unlockPrefix.length);
      final Engineer? engineer = ExobiologyReferenceData.engineers
          .where((Engineer e) => e.id == engineerId)
          .firstOrNull;
      switch (engineer?.kind) {
        case EngineerKind.suit:
          suitEngineers.add(engineerId);
        case EngineerKind.ship:
          shipEngineers.add(engineerId);
        case null:
          break;
      }
      return;
    }

    if (id.startsWith(RoadmapStepIds.engineeringPrefix)) {
      final String modificationId =
          id.substring(RoadmapStepIds.engineeringPrefix.length);
      final bool isSuitModification = ExobiologyReferenceData.suitModifications
          .any((SuitModification m) => m.id == modificationId);
      if (isSuitModification) {
        modifications.add(modificationId);
      }
    }
  }
}

extension<T> on Iterable<T> {
  T? get firstOrNull {
    final Iterator<T> iterator = this.iterator;
    return iterator.moveNext() ? iterator.current : null;
  }
}
