import '../../../../core/json/json_readers.dart';
import '../../domain/entities/route_plan.dart';
import '../../domain/entities/route_progress.dart';
import '../../domain/entities/session_pace.dart';
import 'route_plan_codec.dart';

/// What one device publishes about the route being flown, and another reads.
///
/// **The computed state travels, not the raw material.** The phone has no
/// journal and no game files; sending it events to fold would mean shipping the
/// whole domain and megabytes of journal across the network so both ends could
/// arrive at the same answer. One end computes, the other displays.
///
/// The timestamp is not decoration. Nothing on the wire says whether the game
/// is still running — the game only rewrites its files when something changes,
/// so twenty quiet minutes at a station are normal. The client shows the *age*
/// of what it holds rather than a "connected" light that would lie.
class RouteStateEnvelope {
  const RouteStateEnvelope({
    required this.progress,
    required this.pace,
    required this.publishedAt,
    this.commanderSystem,
  });

  final RouteProgress progress;
  final SessionPace pace;

  /// When the host computed this, in UTC. The client reports its age.
  final DateTime publishedAt;

  /// Where the journal last put the commander, when known.
  final String? commanderSystem;

  static const int version = 1;
}

/// Reads and writes [RouteStateEnvelope] as the app's own JSON.
abstract final class RouteStateCodec {
  static Map<String, dynamic> toJson(RouteStateEnvelope envelope) =>
      <String, dynamic>{
        'version': RouteStateEnvelope.version,
        'publishedAt': envelope.publishedAt.toIso8601String(),
        if (envelope.commanderSystem != null)
          'commanderSystem': envelope.commanderSystem,
        'pace': _paceToJson(envelope.pace),
        // The plan travels in its stored shape, so one schema serves both disk
        // and wire — a route saved yesterday and a route pushed to a phone are
        // read by the same code.
        'plan': RoutePlanCodec.toJson(envelope.progress.plan),
        'unattributedSamples': envelope.progress.unattributedSamples,
        'waypoints': envelope.progress.waypoints
            .map(_waypointToJson)
            .toList(growable: false),
      };

  static RouteStateEnvelope? fromJson(Map<String, dynamic> json) {
    if (readInt(json['version']) != RouteStateEnvelope.version) {
      return null;
    }
    final RoutePlan? plan = RoutePlanCodec.fromJson(readMap(json['plan']));
    final DateTime? publishedAt =
        DateTime.tryParse(readString(json['publishedAt']) ?? '');
    if (plan == null || publishedAt == null) {
      return null;
    }

    final List<WaypointProgress> waypoints = <WaypointProgress>[];
    if (json['waypoints'] case final List<dynamic> raw) {
      final List<Map<String, dynamic>> entries =
          raw.whereType<Map<String, dynamic>>().toList(growable: false);
      for (int i = 0; i < entries.length && i < plan.waypoints.length; i++) {
        waypoints.add(_waypointFromJson(entries[i], plan.waypoints[i]));
      }
    }
    if (waypoints.length != plan.waypoints.length) {
      // A partial state would render as a shorter route, which reads as
      // progress rather than as a truncated message.
      return null;
    }

    return RouteStateEnvelope(
      progress: RouteProgress(
        plan: plan,
        waypoints: List<WaypointProgress>.unmodifiable(waypoints),
        unattributedSamples: readInt(json['unattributedSamples']) ?? 0,
      ),
      pace: _paceFromJson(readMap(json['pace'])),
      publishedAt: publishedAt,
      commanderSystem: readString(json['commanderSystem']),
    );
  }

  // --- waypoints ---------------------------------------------------------

  static Map<String, dynamic> _waypointToJson(WaypointProgress w) =>
      <String, dynamic>{
        'visited': w.visited,
        'bodies': w.bodies.map(_bodyToJson).toList(growable: false),
      };

  /// Rebuilt against the plan rather than carried twice.
  ///
  /// The plan already names every waypoint, body and species; repeating them in
  /// the progress would double the payload and open the door to the two halves
  /// disagreeing. Only what the journal *added* travels here.
  static WaypointProgress _waypointFromJson(
    Map<String, dynamic> json,
    RouteWaypoint waypoint,
  ) {
    final List<BodyProgress> bodies = <BodyProgress>[];
    if (json['bodies'] case final List<dynamic> raw) {
      final List<Map<String, dynamic>> entries =
          raw.whereType<Map<String, dynamic>>().toList(growable: false);
      for (int i = 0; i < entries.length && i < waypoint.bodies.length; i++) {
        bodies.add(_bodyFromJson(entries[i], waypoint.bodies[i]));
      }
    }
    return WaypointProgress(
      waypoint: waypoint,
      bodies: List<BodyProgress>.unmodifiable(bodies),
      visited: json['visited'] == true,
    );
  }

  static Map<String, dynamic> _bodyToJson(BodyProgress b) => <String, dynamic>{
        if (b.journalBodyId != null) 'bodyId': b.journalBodyId,
        'species': b.species.map(_speciesToJson).toList(growable: false),
      };

  static BodyProgress _bodyFromJson(
    Map<String, dynamic> json,
    RouteBody body,
  ) {
    final List<SpeciesProgress> species = <SpeciesProgress>[];
    if (json['species'] case final List<dynamic> raw) {
      final List<Map<String, dynamic>> entries =
          raw.whereType<Map<String, dynamic>>().toList(growable: false);
      for (int i = 0; i < entries.length && i < body.species.length; i++) {
        species.add(_speciesFromJson(entries[i], body.species[i]));
      }
    }
    return BodyProgress(
      body: body,
      species: List<SpeciesProgress>.unmodifiable(species),
      journalBodyId: readInt(json['bodyId']),
    );
  }

  static Map<String, dynamic> _speciesToJson(SpeciesProgress s) =>
      <String, dynamic>{
        'samples': s.samplesTaken,
        'genusSamples': s.genusSamplesTaken,
        'genusSpecies': s.genusSpeciesCount,
        'shared': s.attribution == SpeciesAttribution.sharedGenus,
        'sold': s.sold,
      };

  static SpeciesProgress _speciesFromJson(
    Map<String, dynamic> json,
    RouteSpecies species,
  ) =>
      SpeciesProgress(
        species: species,
        samplesTaken: readInt(json['samples']) ?? 0,
        attribution: json['shared'] == true
            ? SpeciesAttribution.sharedGenus
            : SpeciesAttribution.certain,
        genusSamplesTaken: readInt(json['genusSamples']) ?? 0,
        genusSpeciesCount: readInt(json['genusSpecies']) ?? 1,
        sold: json['sold'] == true,
      );

  // --- pace --------------------------------------------------------------

  static Map<String, dynamic> _paceToJson(SessionPace pace) =>
      <String, dynamic>{
        'perJump': pace.perJump.inSeconds,
        'perLanding': pace.perLanding.inSeconds,
        'perSample': pace.perSample.inSeconds,
        'source': pace.source.name,
        'jumps': pace.jumpObservations,
        'landings': pace.landingObservations,
        'samples': pace.sampleObservations,
      };

  static SessionPace _paceFromJson(Map<String, dynamic> json) => SessionPace(
        perJump: Duration(seconds: readInt(json['perJump']) ?? 60),
        perLanding: Duration(seconds: readInt(json['perLanding']) ?? 240),
        perSample: Duration(seconds: readInt(json['perSample']) ?? 75),
        source: PaceSource.values.firstWhere(
          (PaceSource s) => s.name == readString(json['source']),
          orElse: () => PaceSource.defaults,
        ),
        jumpObservations: readInt(json['jumps']) ?? 0,
        landingObservations: readInt(json['landings']) ?? 0,
        sampleObservations: readInt(json['samples']) ?? 0,
      );
}
