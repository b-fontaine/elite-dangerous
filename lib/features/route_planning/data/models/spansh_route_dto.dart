import '../../../../core/json/json_readers.dart';
import '../../../../core/network/spansh_landmarks.dart';
import '../../domain/entities/route_plan.dart';
import '../../domain/entities/route_request.dart';

/// Where a plotting job stands.
///
/// Spansh reports two overlapping fields — `status` (`queued`, `ok`) and
/// `state` (`queued`, `started`, `completed`) — and neither alone covers every
/// answer observed. This collapses both into the only question the repository
/// actually asks: is the route there yet?
enum RouteJobStatus {
  /// Accepted, not started.
  queued,

  /// Being computed.
  started,

  /// `result` is present and final.
  completed,

  /// Spansh answered something this app does not recognise. Treated as fatal
  /// rather than retried forever: an unknown state on an undocumented endpoint
  /// is exactly the change this contract is expected to suffer one day.
  unknown,
}

/// One job envelope: what `POST …/route` returns, and what `GET /api/results`
/// returns while the work is still going.
class SpanshRouteJob {
  const SpanshRouteJob({required this.jobId, required this.status});

  final String? jobId;
  final RouteJobStatus status;

  static SpanshRouteJob fromJson(Map<String, dynamic> json) => SpanshRouteJob(
        jobId: readString(json['job']),
        status: _statusOf(json),
      );

  /// `status` wins when it is conclusive, `state` fills the gaps.
  ///
  /// The completed answer observed on the live service carries
  /// `{"state": "completed", "status": "ok"}`, so either field would do there;
  /// the queued answer carries only `{"status": "queued"}`, so `state` alone
  /// would not.
  static RouteJobStatus _statusOf(Map<String, dynamic> json) {
    final String? status = readString(json['status'])?.toLowerCase();
    final String? state = readString(json['state'])?.toLowerCase();

    if (status == 'ok' || state == 'completed') {
      return RouteJobStatus.completed;
    }
    if (status == 'queued' || state == 'queued') {
      return RouteJobStatus.queued;
    }
    if (state == 'started' || status == 'started') {
      return RouteJobStatus.started;
    }
    return RouteJobStatus.unknown;
  }
}

/// Turns a [RouteRequest] into the form Spansh's plotters accept.
///
/// **The wire names live here and nowhere else.** Spansh drops parameters it
/// does not recognise without an error — they simply vanish from the
/// `parameters` echo — so a misspelt key yields a plausible route computed
/// with Spansh's defaults instead of a failure. That is the worst possible
/// failure mode, and the reason a test pins every name in this map.
///
/// Values are pre-rendered as strings: the body is form-encoded, booleans must
/// travel as `0`/`1` rather than `true`/`false`, and a jump range of 50 must
/// not reach the wire as `50.0`.
abstract final class RouteRequestForm {
  static Map<String, dynamic> encode(RouteRequest request) {
    final Map<String, dynamic> form = <String, dynamic>{
      'from': request.fromSystem,
      'range': _number(request.jumpRangeLy),
      'radius': _number(request.radiusLy),
      'max_results': '${request.maxSystems}',
      'avoid_thargoids': request.avoidThargoids ? '1' : '0',
      'loop': request.loop ? '1' : '0',
    };

    // `destination`, not `to`, and `min_value`, not `minimum_value`: both were
    // settled by asking the live service which names it echoes back in
    // `parameters`. Reading their web client is not enough — its own code
    // assigns `t.to = this.destination`, yet the server ignores `to` outright.
    if (request.toSystem case final String destination
        when destination.isNotEmpty) {
      form['destination'] = destination;
    }
    if (request.maxDistanceToArrivalLs case final double distance) {
      form['max_distance'] = _number(distance);
    }
    if (request.minValueCr case final int value) {
      form['min_value'] = '$value';
    }
    // Only the Road-to-Riches plotter reads this one; sending it to the
    // exobiology plotter would be dropped anyway, but sending exactly what an
    // endpoint understands keeps the echo readable when something goes wrong.
    if (request.objective == RouteObjective.riches) {
      form['use_mapping_value'] = request.useMappingValue ? '1' : '0';
    }
    return form;
  }

  /// `50.0` → `"50"`, `12.5` → `"12.5"`.
  static String _number(double value) =>
      value == value.roundToDouble() ? '${value.round()}' : '$value';
}

/// Maps a completed job onto a [RoutePlan].
abstract final class SpanshRouteDto {
  /// Reads the `result` array of a finished job.
  ///
  /// Returns null when the payload carries no usable route at all, which the
  /// repository turns into a displayed failure rather than an empty screen
  /// that looks like "there is nothing out there".
  static RoutePlan? fromJson(
    Map<String, dynamic> json, {
    required String jobId,
    required RouteRequest request,
    required DateTime computedAt,
  }) {
    if (json['result'] is! List<dynamic>) {
      return null;
    }
    final List<dynamic> raw = json['result'] as List<dynamic>;

    final List<RouteWaypoint> waypoints = <RouteWaypoint>[];
    for (final Map<String, dynamic> entry
        in raw.whereType<Map<String, dynamic>>()) {
      final RouteWaypoint? waypoint = _waypoint(entry);
      if (waypoint != null) {
        waypoints.add(waypoint);
      }
    }
    if (waypoints.isEmpty) {
      return null;
    }

    return RoutePlan(
      jobId: jobId,
      request: request,
      waypoints: List<RouteWaypoint>.unmodifiable(waypoints),
      computedAt: computedAt,
    );
  }

  static RouteWaypoint? _waypoint(Map<String, dynamic> json) {
    // `id64` arrives as a *string* here, while the same number appears as an
    // int under `id` on bodies. `readInt` absorbs both; parsing it as an int
    // directly would fail at runtime and only on real payloads.
    final int? id64 = readInt(json['id64']);
    final String? name = readString(json['name']);
    if (id64 == null || name == null) {
      return null;
    }

    final List<RouteBody> bodies = <RouteBody>[];
    if (json['bodies'] case final List<dynamic> raw) {
      for (final Map<String, dynamic> entry
          in raw.whereType<Map<String, dynamic>>()) {
        final RouteBody? body = _body(entry);
        if (body != null) {
          bodies.add(body);
        }
      }
    }

    return RouteWaypoint(
      id64: id64,
      name: name,
      x: readDouble(json['x']) ?? 0,
      y: readDouble(json['y']) ?? 0,
      z: readDouble(json['z']) ?? 0,
      jumpsFromPrevious: readInt(json['jumps']) ?? 0,
      bodies: List<RouteBody>.unmodifiable(bodies),
    );
  }

  static RouteBody? _body(Map<String, dynamic> json) {
    // `id` (int) and `id64` (string) carry the same number; prefer whichever
    // reads, rather than depending on Spansh keeping both.
    final int? id64 = readInt(json['id64']) ?? readInt(json['id']);
    final String? name = readString(json['name']);
    if (id64 == null || name == null) {
      return null;
    }

    final List<RouteSpecies> species = <RouteSpecies>[];
    if (json['landmarks'] case final List<dynamic> raw) {
      for (final Map<String, dynamic> entry
          in raw.whereType<Map<String, dynamic>>()) {
        final RouteSpecies? one = _species(entry);
        if (one != null) {
          species.add(one);
        }
      }
    }

    return RouteBody(
      id64: id64,
      name: name,
      type: readString(json['type']),
      subType: readString(json['subtype']),
      distanceFromArrivalLs: readDouble(json['distance_to_arrival']),
      estimatedScanValueCr: readInt(json['estimated_scan_value']) ?? 0,
      estimatedMappingValueCr: readInt(json['estimated_mapping_value']) ?? 0,
      landmarkValueCr: readInt(json['landmark_value']) ?? 0,
      species: List<RouteSpecies>.unmodifiable(species),
    );
  }

  /// One landmark, kept only when it is something a Genetic Sampler can touch.
  ///
  /// The same whitelist the body lookup uses: Molluscs, geysers and Lagrange
  /// clouds all arrive in this array and none of them can be sampled.
  static RouteSpecies? _species(Map<String, dynamic> json) {
    final String? genus = SpanshLandmarks.genusFor(readString(json['type']));
    final String? species = readString(json['subtype']);
    if (genus == null || species == null) {
      return null;
    }
    return RouteSpecies(
      genus: genus,
      species: species,
      valueCr: readInt(json['value']) ?? 0,
      count: readInt(json['count']) ?? 0,
    );
  }
}
