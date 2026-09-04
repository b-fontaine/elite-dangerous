import 'package:equatable/equatable.dart';

import 'route_plan.dart';

/// How confidently one species line can be tied to what the journal recorded.
///
/// The journal names an organism by codex token — `$Codex_Ent_Tussock_05_Name;`
/// — and nothing this app holds translates a *species* token into the name
/// Spansh uses. The **genus** token does translate, reliably and independently
/// of the game's display language, so that is what the reconciliation keys on.
///
/// Which is exact right up until a body carries two species of one genus. That
/// is not hypothetical: `59 Virginis 7 g a` carries both Tussock Pennata and
/// Tussock Ignis, one body in the forty-six captured while building this.
enum SpeciesAttribution {
  /// The only species of its genus on this body: the genus count *is* this
  /// species' count.
  certain,

  /// Shares its genus with another species on the same body. The samples are
  /// real, which of the two they belong to is not knowable from the journal.
  sharedGenus,
}

/// One species of one body, and what the commander has done about it.
class SpeciesProgress extends Equatable {
  const SpeciesProgress({
    required this.species,
    required this.samplesTaken,
    required this.attribution,
    this.genusSamplesTaken = 0,
    this.genusSpeciesCount = 1,
    this.sold = false,
  });

  final RouteSpecies species;

  /// 0 to 3. Three completes the organism and makes it sellable.
  ///
  /// On a [SpeciesAttribution.sharedGenus] line this is the count for the
  /// *genus*, not for this species: the journal cannot say which of the two it
  /// belongs to. Read it as "this many samples were taken of this genus here",
  /// and use [isComplete], which knows the difference.
  final int samplesTaken;

  final SpeciesAttribution attribution;

  /// Every sample taken of this species' genus on this body.
  final int genusSamplesTaken;

  /// How many species of this genus the body carries. One, normally.
  final int genusSpeciesCount;

  /// Whether a `SellOrganicData` has named this species since it was sampled.
  ///
  /// Necessarily coarser than the sample count: the sale event carries genus,
  /// species and value but **no body**, and the game sells the whole hold
  /// rather than a selection. A species sold from one body therefore reads as
  /// sold everywhere it appears on the route.
  final bool sold;

  /// Whether this species' data is certainly in hand.
  ///
  /// On a shared genus, three samples prove that *one* of the two species is
  /// done — not which. Declaring both complete would erase a species nobody has
  /// touched from the to-do list, and inflate the value carried home. So a
  /// shared line only closes once the genus has been sampled enough times for
  /// every one of its species to be accounted for.
  ///
  /// The conservative direction, deliberately: a line wrongly left open costs a
  /// second look, one wrongly closed costs the whole payout.
  bool get isComplete => switch (attribution) {
        SpeciesAttribution.certain => samplesTaken >= 3,
        SpeciesAttribution.sharedGenus =>
          genusSamplesTaken >= 3 * genusSpeciesCount,
      };

  bool get isStarted => samplesTaken > 0;

  int get remainingSamples => (3 - samplesTaken).clamp(0, 3);

  /// Whether this line is still worth walking to.
  bool get isOutstanding => !isComplete;

  /// Base value still to be earned here, in credits.
  int get remainingValueCr => isComplete ? 0 : species.valueCr;

  @override
  List<Object?> get props => <Object?>[
        species,
        samplesTaken,
        attribution,
        genusSamplesTaken,
        genusSpeciesCount,
        sold,
      ];
}

/// One body of the route, and its sampling state.
class BodyProgress extends Equatable {
  const BodyProgress({
    required this.body,
    required this.species,
    this.journalBodyId,
  });

  final RouteBody body;

  final List<SpeciesProgress> species;

  /// The in-system `BodyID` the journal uses, once this body's name has been
  /// seen in a `Scan`, `SAASignalsFound` or `ApproachBody`.
  ///
  /// Null means the commander has never scanned this body — in which case they
  /// cannot have sampled it either, so the absence is itself the answer rather
  /// than a gap. See [RouteProgress.unattributedSamples] for the one case where
  /// that reasoning does not hold.
  final int? journalBodyId;

  bool get isKnownToJournal => journalBodyId != null;

  bool get isComplete =>
      species.isNotEmpty && species.every((SpeciesProgress s) => s.isComplete);

  bool get isStarted => species.any((SpeciesProgress s) => s.isStarted);

  int get remainingValueCr => species.fold<int>(
        0,
        (int sum, SpeciesProgress s) => sum + s.remainingValueCr,
      );

  int get outstandingSpecies =>
      species.where((SpeciesProgress s) => s.isOutstanding).length;

  @override
  List<Object?> get props => <Object?>[body, species, journalBodyId];
}

/// One stop of the route, and whether the commander has been there.
class WaypointProgress extends Equatable {
  const WaypointProgress({
    required this.waypoint,
    required this.bodies,
    this.visited = false,
  });

  final RouteWaypoint waypoint;
  final List<BodyProgress> bodies;

  /// Whether the journal shows the commander in this system at any point.
  ///
  /// Keyed on `SystemAddress`, never on the name: it is the same identifier on
  /// both sides, and two systems can share a name.
  final bool visited;

  bool get isComplete =>
      visited && bodies.every((BodyProgress b) => b.isComplete);

  int get remainingValueCr => bodies.fold<int>(
        0,
        (int sum, BodyProgress b) => sum + b.remainingValueCr,
      );

  int get outstandingSpecies => bodies.fold<int>(
        0,
        (int sum, BodyProgress b) => sum + b.outstandingSpecies,
      );

  @override
  List<Object?> get props => <Object?>[waypoint, bodies, visited];
}

/// What is left of a route, derived from the journal.
///
/// **Derived, never stored.** Only the plan is persisted; this is recomputed
/// from the events every time it is needed. That is the same rule
/// `ExobiologyActivity` follows, and it is what makes re-importing a journal
/// harmless: there is no counter to increment twice, because there is no
/// counter at all — just a fold over the events that happens to produce the
/// same answer whether they arrive once or three times.
class RouteProgress extends Equatable {
  const RouteProgress({
    required this.plan,
    required this.waypoints,
    this.unattributedSamples = 0,
  });

  final RoutePlan plan;
  final List<WaypointProgress> waypoints;

  /// Organisms sampled somewhere this route does not account for.
  ///
  /// Almost always zero. It rises when the journal holds a `ScanOrganic` for a
  /// body of this route whose name was never seen — which happens when the
  /// import starts *after* the body was scanned. Surfaced rather than
  /// discarded, because silently dropping a commander's work is the one
  /// failure they would notice and could not explain.
  final int unattributedSamples;

  /// Index of the furthest waypoint the journal shows as visited.
  ///
  /// Zero on a route not yet started — the departure system, where the
  /// commander already is.
  int get currentIndex {
    int last = 0;
    for (int i = 0; i < waypoints.length; i++) {
      if (waypoints[i].visited) {
        last = i;
      }
    }
    return last;
  }

  /// Jumps already flown, counted the same way [RoutePlan.totalJumps] counts
  /// the whole route: the departure system is not a jump.
  int get jumpsDone => waypoints
      .take(currentIndex + 1)
      .skip(1)
      .fold<int>(0, (int sum, WaypointProgress w) => sum + w.waypoint.jumpsFromPrevious);

  int get jumpsRemaining => plan.totalJumps - jumpsDone;

  int get speciesTotal => waypoints.fold<int>(
        0,
        (int sum, WaypointProgress w) => sum +
            w.bodies.fold<int>(
              0,
              (int bodySum, BodyProgress b) => bodySum + b.species.length,
            ),
      );

  int get speciesAnalysed => waypoints.fold<int>(
        0,
        (int sum, WaypointProgress w) => sum +
            w.bodies.fold<int>(
              0,
              (int bodySum, BodyProgress b) =>
                  bodySum +
                  b.species.where((SpeciesProgress s) => s.isComplete).length,
            ),
      );

  int get speciesRemaining => speciesTotal - speciesAnalysed;

  /// Base value still on the route, in credits.
  int get remainingValueCr => waypoints.fold<int>(
        0,
        (int sum, WaypointProgress w) => sum + w.remainingValueCr,
      );

  /// Value sampled but not yet sold — what a rebuy screen would erase.
  ///
  /// Counts complete organisms the journal has not seen sold. This is the
  /// figure that should push a commander towards Vista Genomics.
  int get valueAtRiskCr => waypoints.fold<int>(
        0,
        (int sum, WaypointProgress w) => sum +
            w.bodies.fold<int>(
              0,
              (int bodySum, BodyProgress b) =>
                  bodySum +
                  b.species
                      .where((SpeciesProgress s) => s.isComplete && !s.sold)
                      .fold<int>(
                        0,
                        (int v, SpeciesProgress s) => v + s.species.valueCr,
                      ),
            ),
      );

  /// Species lines whose genus is shared on their body, so the sample count
  /// could belong to either. Shown so a screen can qualify them instead of
  /// quietly presenting a guess as fact.
  int get ambiguousSpecies => waypoints.fold<int>(
        0,
        (int sum, WaypointProgress w) => sum +
            w.bodies.fold<int>(
              0,
              (int bodySum, BodyProgress b) =>
                  bodySum +
                  b.species
                      .where((SpeciesProgress s) =>
                          s.attribution == SpeciesAttribution.sharedGenus)
                      .length,
            ),
      );

  bool get isComplete =>
      waypoints.isNotEmpty && waypoints.every((WaypointProgress w) => w.isComplete);

  @override
  List<Object?> get props => <Object?>[plan, waypoints, unattributedSamples];
}
