import 'package:equatable/equatable.dart';

import 'route_request.dart';

/// One species recorded on a body, as the community reported it.
///
/// [valueCr] is Spansh's figure, and it is the **base** Vista Genomics price:
/// checked species by species against the catalogue this app already embeds,
/// five of five agreed to the credit. It therefore excludes the ×5 "First
/// Logged" bonus — which nobody can predict, since it depends on whether some
/// other commander has already sold this species from this body — and excludes
/// the Powerplay modifier, which the journal alone can supply.
class RouteSpecies extends Equatable {
  const RouteSpecies({
    required this.genus,
    required this.species,
    required this.valueCr,
    this.count = 0,
  });

  /// `Stratum`. Spansh calls this `type`.
  final String genus;

  /// `Stratum Tectonicas` — the full binomial, not just the epithet. Spansh
  /// calls this `subtype`.
  final String species;

  /// Base value in credits, before any bonus.
  final int valueCr;

  /// How many specimens the community has recorded on this body. Useful as a
  /// hint that a species is easy to find, not as a promise.
  final int count;

  @override
  List<Object?> get props => <Object?>[genus, species, valueCr, count];
}

/// One body worth stopping at, on a planned route.
class RouteBody extends Equatable {
  const RouteBody({
    required this.id64,
    required this.name,
    this.type,
    this.subType,
    this.distanceFromArrivalLs,
    this.estimatedScanValueCr = 0,
    this.estimatedMappingValueCr = 0,
    this.landmarkValueCr = 0,
    this.species = const <RouteSpecies>[],
  });

  /// The body's own `id64` — the key of `/api/body/{id64}`, and the join back
  /// to the system-lookup feature.
  ///
  /// Spansh sends this as a **string** in route results while sending the same
  /// number as an int under `id`. Parsing it as an int is a decoding bug that
  /// only shows up at runtime, so the DTO accepts both.
  final int id64;

  final String name;

  /// `Planet` or `Star`.
  final String? type;

  /// `Rocky body`, `High metal content world`…
  final String? subType;

  final double? distanceFromArrivalLs;

  final int estimatedScanValueCr;

  final int estimatedMappingValueCr;

  /// The total biological value of this body, as Spansh scores it. Not
  /// necessarily the sum of [species] values: a body can carry recorded
  /// landmarks this app filters out.
  final int landmarkValueCr;

  /// Only the sampleable organisms. Spansh's `landmarks` array also carries
  /// geysers, wrecks, Thargoid sites, Molluscs and Lagrange clouds, none of
  /// which a Genetic Sampler can touch — the DTO keeps a whitelist.
  final List<RouteSpecies> species;

  /// Whether this body is worth landing on for exobiology at all.
  bool get hasSpecies => species.isNotEmpty;

  @override
  List<Object?> get props => <Object?>[
        id64,
        name,
        type,
        subType,
        distanceFromArrivalLs,
        estimatedScanValueCr,
        estimatedMappingValueCr,
        landmarkValueCr,
        species,
      ];
}

/// One stop on a planned route.
class RouteWaypoint extends Equatable {
  const RouteWaypoint({
    required this.id64,
    required this.name,
    required this.x,
    required this.y,
    required this.z,
    this.jumpsFromPrevious = 0,
    this.bodies = const <RouteBody>[],
  });

  /// The system's `SystemAddress` — the same key the journal writes in
  /// `FSDJump`, which is what lets a route be reconciled against a journal
  /// without matching on names.
  final int id64;

  final String name;

  final double x;
  final double y;
  final double z;

  /// Jumps needed to reach this waypoint from the one before it.
  ///
  /// Verified against the geometry rather than assumed: on a route from Sol at
  /// a 50 ly range, Spansh reported 2 / 2 / 2 / 3 for legs measuring 87.9 /
  /// 76.1 / 50.2 / 107.6 ly, which is exactly `ceil(distance / range)` in all
  /// four cases.
  ///
  /// The **first** waypoint is the departure system and Spansh sends `1` for
  /// it, which is an artefact — the commander is already there. [RoutePlan]
  /// drops it from the total; see [RoutePlan.totalJumps].
  final int jumpsFromPrevious;

  final List<RouteBody> bodies;

  /// The biological value of this whole system, in credits.
  int get landmarkValueCr => bodies.fold<int>(
        0,
        (int sum, RouteBody body) => sum + body.landmarkValueCr,
      );

  @override
  List<Object?> get props => <Object?>[
        id64,
        name,
        x,
        y,
        z,
        jumpsFromPrevious,
        bodies,
      ];
}

/// A route as Spansh computed it, before this app subtracts anything.
///
/// Deliberately a *plan*, not a *progress*: nothing here knows what the
/// commander has already done. Filtering against the journal, and tracking a
/// route in flight, are the next two lots and belong to other entities — a
/// plan that mutated as the session went would have no stable thing to compare
/// against.
class RoutePlan extends Equatable {
  const RoutePlan({
    required this.jobId,
    required this.request,
    required this.waypoints,
    required this.computedAt,
  });

  /// Spansh's job identifier. Kept because `/api/results/{job}` stays
  /// readable afterwards: a route can be re-opened without recomputing it.
  final String jobId;

  /// What was asked. Stored with the answer so a saved route can say what
  /// produced it, and be recomputed with one field changed.
  final RouteRequest request;

  final List<RouteWaypoint> waypoints;

  final DateTime computedAt;

  /// Stops after the departure system.
  int get systemCount => waypoints.isEmpty ? 0 : waypoints.length - 1;

  /// Total jumps the commander still has to fly.
  ///
  /// Excludes the first waypoint: it is where the route starts, and the `1`
  /// Spansh reports there would otherwise inflate every route by one jump.
  int get totalJumps => waypoints
      .skip(1)
      .fold<int>(0, (int sum, RouteWaypoint w) => sum + w.jumpsFromPrevious);

  int get totalBodies => waypoints.fold<int>(
        0,
        (int sum, RouteWaypoint w) => sum + w.bodies.length,
      );

  /// Total biological value on the route, in credits, at base price.
  int get totalLandmarkValueCr => waypoints.fold<int>(
        0,
        (int sum, RouteWaypoint w) => sum + w.landmarkValueCr,
      );

  /// Total scan + mapping value on the route, in credits.
  int get totalExplorationValueCr => waypoints.fold<int>(
        0,
        (int sum, RouteWaypoint w) => sum +
            w.bodies.fold<int>(
              0,
              (int bodySum, RouteBody b) =>
                  bodySum + b.estimatedScanValueCr + b.estimatedMappingValueCr,
            ),
      );

  /// Every distinct species on the route, most valuable first.
  List<RouteSpecies> get distinctSpecies {
    final Map<String, RouteSpecies> byName = <String, RouteSpecies>{};
    for (final RouteWaypoint waypoint in waypoints) {
      for (final RouteBody body in waypoint.bodies) {
        for (final RouteSpecies species in body.species) {
          byName.putIfAbsent(species.species, () => species);
        }
      }
    }
    final List<RouteSpecies> all = byName.values.toList(growable: false);
    return all..sort((RouteSpecies a, RouteSpecies b) =>
        b.valueCr.compareTo(a.valueCr));
  }

  @override
  List<Object?> get props => <Object?>[jobId, request, waypoints, computedAt];
}
