import '../entities/journal_event.dart';
import '../entities/journal_session_state.dart';

/// Folds a journal into the commander's present state.
///
/// Pure and I/O free, like every other domain service here, and last-writer-
/// wins by design: these events are snapshots, not increments. Frontier
/// rewrites each of them at session start, so folding two months of journal
/// must yield the newest one, never a sum.
///
/// The one exception is `EngineerProgress`, which Frontier writes both as a
/// full roster and as single-engineer updates. There, the roster is a baseline
/// and each later update overrides one entry.
class JournalSessionAggregator {
  const JournalSessionAggregator();

  /// Applies one position event on top of the last known position.
  ///
  /// Merged rather than replaced: `ApproachBody` names a body and says nothing
  /// about the system, `FSDJump` names a system and clears the body. Taking
  /// each event whole would blank half the position on every second line.
  static CommanderPosition _movedTo(
    CommanderPosition previous,
    LocationEvent event,
  ) {
    final bool leaving = event.clearsBody;
    final bool undocking =
        event.name == 'Undocked' || event.name == 'Liftoff';

    return CommanderPosition(
      starSystem: event.starSystem ?? previous.starSystem,
      bodyName: leaving ? null : (event.bodyName ?? previous.bodyName),
      bodyType: leaving ? null : (event.bodyType ?? previous.bodyType),
      stationName: undocking ? null : event.stationName ?? previous.stationName,
      stationType: undocking ? null : event.stationType ?? previous.stationType,
      distanceFromStarLs:
          event.distanceFromStarLs ?? previous.distanceFromStarLs,
      docked: undocking ? false : (event.docked || previous.docked && !leaving),
      landed: event.landed,
      onFoot: event.onFoot,
      at: event.timestamp,
    );
  }

  JournalSessionState aggregate(List<JournalEvent> events) {
    if (events.isEmpty) {
      return const JournalSessionState.empty();
    }

    // Oldest first, so "the last one wins" is simply the last assignment.
    final List<JournalEvent> ordered = <JournalEvent>[...events]
      ..sort((JournalEvent a, JournalEvent b) =>
          a.timestamp.compareTo(b.timestamp));

    StatisticsEvent? statistics;
    Map<String, double> reputations = const <String, double>{};
    ShipLoadoutEvent? loadout;
    Map<String, int> onFoot = const <String, int>{};
    Map<String, int> materials = const <String, int>{};
    String? power;
    int? powerRank;
    int? powerMerits;
    bool? metaAlloy;
    List<StoredShipEntry> stored = const <StoredShipEntry>[];
    CommanderPosition position = const CommanderPosition.unknown();
    DockedEvent? docked;
    DateTime? observedAt;

    // Keyed by engineer name: a mid-session update replaces that engineer's
    // entry without disturbing the rest of the roster.
    final Map<String, EngineerStanding> engineers =
        <String, EngineerStanding>{};

    for (final JournalEvent event in ordered) {
      switch (event) {
        case final StatisticsEvent e:
          statistics = e;
        case final ReputationEvent e:
          reputations = e.values;
        case final EngineerProgressEvent e:
          if (e.isFullRoster) {
            engineers.clear();
          }
          for (final EngineerStanding standing in e.engineers) {
            engineers[standing.name] = standing;
          }
        case final ShipLoadoutEvent e:
          loadout = e;
        case final ShipLockerEvent e:
          // The pointer form carries no lists; it announces that the contents
          // changed and live in `ShipLocker.json`. Overwriting the inventory
          // with nothing would erase a known-good one.
          if (!e.isEmpty) {
            onFoot = e.everything;
          }
        case final MaterialsEvent e:
          materials = e.everything;
        case final PowerplayEvent e:
          power = e.power.isEmpty ? null : e.power;
          powerRank = e.rank;
          powerMerits = e.merits;
        case final CargoEvent e:
          // Only the ship's hold counts: an SRV cannot carry a Meta-Alloy to
          // an engineer.
          if (e.vessel == null || e.vessel!.toLowerCase() == 'ship') {
            metaAlloy = e.hasMetaAlloy;
          }
        case final StoredShipsEvent e:
          stored = e.all;
        case final LocationEvent e:
          position = _movedTo(position, e);
        case final DockedEvent e:
          docked = e;
          position = CommanderPosition(
            starSystem: e.starSystem ?? position.starSystem,
            // Docking leaves the body behind: a station is not a planet, even
            // a planetary one, and keeping the last body would read as still
            // being on the surface.
            bodyName: null,
            bodyType: null,
            stationName: e.stationName,
            stationType: e.stationType,
            distanceFromStarLs: e.distanceFromStarLs,
            docked: true,
            at: e.timestamp,
          );
        case final SurfaceContactEvent e:
          position = CommanderPosition(
            starSystem: e.systemName ?? position.starSystem,
            bodyName: e.bodyName ?? position.bodyName,
            bodyType: 'Planet',
            landed: !e.isDisembark,
            onFoot: e.isDisembark,
            at: e.timestamp,
          );
        default:
          continue;
      }
      observedAt = event.timestamp;
    }

    return JournalSessionState(
      statistics: statistics,
      reputations: reputations,
      engineers: engineers.values.toList(growable: false),
      shipLoadout: loadout,
      onFootInventory: onFoot,
      shipMaterials: materials,
      pledgedPower: power,
      powerplayRank: powerRank,
      powerplayMerits: powerMerits,
      hasMetaAlloy: metaAlloy ?? false,
      storedShips: stored,
      position: position,
      dockedAt: docked,
      observedAt: observedAt,
    );
  }
}
