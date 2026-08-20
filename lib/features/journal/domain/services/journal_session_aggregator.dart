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
    final bool undocking = event.name == 'Undocked';

    return CommanderPosition(
      starSystem: event.starSystem ?? previous.starSystem,
      systemAddress: event.systemAddress ?? previous.systemAddress,
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

  /// Applies a `Touchdown` or `Liftoff` on top of the last known position.
  ///
  /// Merged rather than replaced, for the reason [_movedTo] is: the pair says
  /// where the ship is and nothing about the station it may still be sitting
  /// at, so taking the event whole drops the station, its type and its
  /// distance from the star on every landing.
  static CommanderPosition _shipTouched(
    CommanderPosition previous,
    SurfaceContactEvent event,
  ) {
    // A ship the commander is not aboard went somewhere without them — the
    // Remote Flight Assist bringing it down to a surface they are standing on,
    // or taking it away from there. Their own position did not change, and
    // saying `landed` here would sit them back in a cockpit they left.
    final bool moved = event.carriesCommander;

    return CommanderPosition(
      starSystem: event.systemName ?? previous.starSystem,
      systemAddress: event.systemAddress ?? previous.systemAddress,
      bodyName:
          event.onPlanet ? event.bodyName ?? previous.bodyName : previous.bodyName,
      bodyType: event.onPlanet ? 'Planet' : previous.bodyType,
      stationName: previous.stationName,
      stationType: previous.stationType,
      distanceFromStarLs: previous.distanceFromStarLs,
      // Only `Docked` and `Undocked` decide this. A ship lifting off a
      // planetary port has already been undocked by the time it does.
      docked: previous.docked,
      landed: moved ? event.isTouchdown : previous.landed,
      onFoot: moved ? false : previous.onFoot,
      at: event.timestamp,
    );
  }

  /// Applies a `Disembark` or `Embark`.
  ///
  /// The event name says whether the commander is on foot; it says nothing
  /// about where, and the journal's `OnPlanet` and `OnStation` are the only
  /// answer to that.
  static CommanderPosition _steppedOut(
    CommanderPosition previous,
    EmbarkEvent event,
  ) {
    return CommanderPosition(
      starSystem: event.systemName ?? previous.starSystem,
      systemAddress: event.systemAddress ?? previous.systemAddress,
      // `Body` names the station itself when the commander is not on a world,
      // so it is a body name only when the journal claims a planet.
      bodyName:
          event.onPlanet ? event.bodyName ?? previous.bodyName : previous.bodyName,
      bodyType: event.onPlanet ? 'Planet' : previous.bodyType,
      stationName: event.stationName ?? previous.stationName,
      stationType: event.stationType ?? previous.stationType,
      distanceFromStarLs: previous.distanceFromStarLs,
      // Stepping into a concourse does not undock the ship waiting on the pad.
      docked: previous.docked || event.onStation,
      // Nothing is landed while on foot. Boarding puts the commander back into
      // whatever the vehicle is doing: sitting on the ground, unless it is
      // parked at a station.
      landed: event.isDisembark ? false : event.onPlanet && !event.onStation,
      onFoot: event.isDisembark,
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
            systemAddress: e.systemAddress ?? position.systemAddress,
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
          position = _shipTouched(position, e);
        case final EmbarkEvent e:
          position = _steppedOut(position, e);
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
