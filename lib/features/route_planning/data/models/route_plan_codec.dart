import '../../../../core/json/json_readers.dart';
import '../../domain/entities/route_plan.dart';
import '../../domain/entities/route_request.dart';

/// Reads and writes a [RoutePlan] as the app's own JSON.
///
/// Deliberately **not** Spansh's shape. Storing the raw answer would tie the
/// commander's saved routes to an undocumented third-party contract that is
/// expected to change; a route saved today must still open after Spansh renames
/// a field. This is also why the plan is the only thing persisted — progress is
/// derived from the journal, so it never needs a schema at all.
abstract final class RoutePlanCodec {
  /// Bumped whenever this shape changes incompatibly. A stored route carrying
  /// an unknown version is ignored rather than half-read.
  static const int version = 1;

  static Map<String, dynamic> toJson(RoutePlan plan) => <String, dynamic>{
        'version': version,
        'jobId': plan.jobId,
        'computedAt': plan.computedAt.toIso8601String(),
        'request': _requestToJson(plan.request),
        'waypoints': plan.waypoints
            .map(_waypointToJson)
            .toList(growable: false),
      };

  static RoutePlan? fromJson(Map<String, dynamic> json) {
    if (readInt(json['version']) != version) {
      return null;
    }
    final String? jobId = readString(json['jobId']);
    final RouteRequest? request = _requestFromJson(readMap(json['request']));
    final DateTime? computedAt =
        DateTime.tryParse(readString(json['computedAt']) ?? '');
    if (jobId == null || request == null || computedAt == null) {
      return null;
    }

    final List<RouteWaypoint> waypoints = <RouteWaypoint>[];
    if (json['waypoints'] case final List<dynamic> raw) {
      for (final Map<String, dynamic> entry
          in raw.whereType<Map<String, dynamic>>()) {
        final RouteWaypoint? waypoint = _waypointFromJson(entry);
        if (waypoint != null) {
          waypoints.add(waypoint);
        }
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

  // --- request -----------------------------------------------------------

  static Map<String, dynamic> _requestToJson(RouteRequest r) =>
      <String, dynamic>{
        'objective': r.objective.name,
        'fromSystem': r.fromSystem,
        if (r.toSystem != null) 'toSystem': r.toSystem,
        'jumpRangeLy': r.jumpRangeLy,
        'radiusLy': r.radiusLy,
        'maxSystems': r.maxSystems,
        if (r.maxDistanceToArrivalLs != null)
          'maxDistanceToArrivalLs': r.maxDistanceToArrivalLs,
        if (r.minValueCr != null) 'minValueCr': r.minValueCr,
        'avoidThargoids': r.avoidThargoids,
        'loop': r.loop,
        'useMappingValue': r.useMappingValue,
      };

  static RouteRequest? _requestFromJson(Map<String, dynamic> json) {
    final String? from = readString(json['fromSystem']);
    final double? range = readDouble(json['jumpRangeLy']);
    final double? radius = readDouble(json['radiusLy']);
    final int? maxSystems = readInt(json['maxSystems']);
    if (from == null || range == null || radius == null || maxSystems == null) {
      return null;
    }
    return RouteRequest(
      objective: RouteObjective.values.firstWhere(
        (RouteObjective o) => o.name == readString(json['objective']),
        orElse: () => RouteObjective.exobiology,
      ),
      fromSystem: from,
      toSystem: readString(json['toSystem']),
      jumpRangeLy: range,
      radiusLy: radius,
      maxSystems: maxSystems,
      maxDistanceToArrivalLs: readDouble(json['maxDistanceToArrivalLs']),
      minValueCr: readInt(json['minValueCr']),
      avoidThargoids: json['avoidThargoids'] == true,
      loop: json['loop'] == true,
      useMappingValue: json['useMappingValue'] != false,
    );
  }

  // --- waypoints ---------------------------------------------------------

  static Map<String, dynamic> _waypointToJson(RouteWaypoint w) =>
      <String, dynamic>{
        // Written as a string for the same reason Spansh does: an id64 exceeds
        // what a JavaScript number holds exactly, and this file is read by the
        // web build too.
        'id64': '${w.id64}',
        'name': w.name,
        'x': w.x,
        'y': w.y,
        'z': w.z,
        'jumps': w.jumpsFromPrevious,
        'bodies': w.bodies.map(_bodyToJson).toList(growable: false),
      };

  static RouteWaypoint? _waypointFromJson(Map<String, dynamic> json) {
    final int? id64 = readInt(json['id64']);
    final String? name = readString(json['name']);
    if (id64 == null || name == null) {
      return null;
    }
    final List<RouteBody> bodies = <RouteBody>[];
    if (json['bodies'] case final List<dynamic> raw) {
      for (final Map<String, dynamic> entry
          in raw.whereType<Map<String, dynamic>>()) {
        final RouteBody? body = _bodyFromJson(entry);
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

  static Map<String, dynamic> _bodyToJson(RouteBody b) => <String, dynamic>{
        'id64': '${b.id64}',
        'name': b.name,
        if (b.type != null) 'type': b.type,
        if (b.subType != null) 'subType': b.subType,
        if (b.distanceFromArrivalLs != null)
          'distanceLs': b.distanceFromArrivalLs,
        'scanValue': b.estimatedScanValueCr,
        'mappingValue': b.estimatedMappingValueCr,
        'landmarkValue': b.landmarkValueCr,
        'species': b.species.map(_speciesToJson).toList(growable: false),
      };

  static RouteBody? _bodyFromJson(Map<String, dynamic> json) {
    final int? id64 = readInt(json['id64']);
    final String? name = readString(json['name']);
    if (id64 == null || name == null) {
      return null;
    }
    final List<RouteSpecies> species = <RouteSpecies>[];
    if (json['species'] case final List<dynamic> raw) {
      for (final Map<String, dynamic> entry
          in raw.whereType<Map<String, dynamic>>()) {
        final RouteSpecies? one = _speciesFromJson(entry);
        if (one != null) {
          species.add(one);
        }
      }
    }
    return RouteBody(
      id64: id64,
      name: name,
      type: readString(json['type']),
      subType: readString(json['subType']),
      distanceFromArrivalLs: readDouble(json['distanceLs']),
      estimatedScanValueCr: readInt(json['scanValue']) ?? 0,
      estimatedMappingValueCr: readInt(json['mappingValue']) ?? 0,
      landmarkValueCr: readInt(json['landmarkValue']) ?? 0,
      species: List<RouteSpecies>.unmodifiable(species),
    );
  }

  static Map<String, dynamic> _speciesToJson(RouteSpecies s) =>
      <String, dynamic>{
        'genus': s.genus,
        'species': s.species,
        'value': s.valueCr,
        'count': s.count,
      };

  static RouteSpecies? _speciesFromJson(Map<String, dynamic> json) {
    final String? genus = readString(json['genus']);
    final String? species = readString(json['species']);
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
