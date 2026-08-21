import '../../../../core/json/json_readers.dart';
import '../../domain/entities/charted_system.dart';
import '../../domain/services/codex_names.dart';

/// Maps `GET /api/dump/{id64}` onto [ChartedSystem].
///
/// Two shapes to keep in mind, both verified against the live API rather than
/// against the schema:
///
/// * the payload is wrapped in a `system` object — the schema documents the
///   inner object and says nothing about the wrapper;
/// * this endpoint is `camelCase` (`atmosphereType`, `isLandable`) while
///   `/api/body/{id64}` is `snake_case`. The same field is spelled two ways
///   depending on which one answered, which is exactly why there are two
///   mappers rather than one.
abstract final class SpanshSystemDto {
  /// Reads a full dump. Returns null when the payload is not a system at all,
  /// which is how a 200 with an `error` body is handled.
  static ChartedSystem? fromJson(
    Map<String, dynamic> json, {
    required DateTime fetchedAt,
  }) {
    final Map<String, dynamic> system =
        json['system'] is Map<String, dynamic> ? readMap(json['system']) : json;

    final int? id64 = readInt(system['id64']);
    final String? name = readString(system['name']);
    if (id64 == null || name == null) {
      return null;
    }

    final List<ChartedBody> bodies = <ChartedBody>[];
    if (system['bodies'] case final List<dynamic> raw) {
      for (final Map<String, dynamic> entry
          in raw.whereType<Map<String, dynamic>>()) {
        final ChartedBody? body = _body(entry);
        if (body != null) {
          bodies.add(body);
        }
      }
    }

    return ChartedSystem(
      id64: id64,
      name: name,
      fetchedAt: fetchedAt,
      bodyCount: readInt(system['bodyCount']),
      bodies: List<ChartedBody>.unmodifiable(bodies),
      updatedAt: parseSpanshDate(system['date']) ??
          parseSpanshDate(system['updateTime']),
    );
  }

  static ChartedBody? _body(Map<String, dynamic> json) {
    final int? id64 = readInt(json['id64']);
    final String? name = readString(json['name']);
    if (id64 == null || name == null) {
      return null;
    }

    final Map<String, dynamic> signals = readMap(json['signals']);
    final Map<String, dynamic> counts = readMap(signals['signals']);

    final List<String> genera = <String>[];
    if (signals['genuses'] case final List<dynamic> raw) {
      for (final String token in raw.whereType<String>()) {
        final String genus = CodexNames.genus(token);
        if (!genera.contains(genus)) {
          genera.add(genus);
        }
      }
    }

    return ChartedBody(
      id64: id64,
      name: name,
      bodyId: readInt(json['bodyId']),
      type: readString(json['type']),
      subType: readString(json['subType']),
      atmosphere: readString(json['atmosphereType']),
      volcanism: readString(json['volcanismType']),
      gravityG: readDouble(json['gravity']),
      surfaceTemperatureK: readDouble(json['surfaceTemperature']),
      distanceFromArrivalLs: readDouble(json['distanceToArrival']),
      landable: json['isLandable'] == true,
      terraformingState: readString(json['terraformingState']),
      biologicalSignals: readInt(counts[CodexNames.biologicalSignal]) ?? 0,
      genusNames: List<String>.unmodifiable(genera..sort()),
      signalsUpdatedAt: parseSpanshDate(signals['updateTime']),
    );
  }
}

/// Parses the two date shapes Spansh mixes.
///
/// `updateTime` reads `2026-08-19 05:09:43+00` — a space instead of the `T`,
/// and a two-digit offset — while `timestamps` use `2026-08-20T21:26:01Z`.
/// Dart's parser takes both, but it silently treats a string with no zone at
/// all as local time, which would shift a cache-invalidation comparison by
/// however many hours the commander lives from Greenwich. So an unzoned string
/// is pinned to UTC explicitly.
DateTime? parseSpanshDate(Object? value) {
  final String? raw = readString(value);
  if (raw == null) {
    return null;
  }
  final DateTime? parsed = DateTime.tryParse(raw);
  if (parsed == null || parsed.isUtc) {
    return parsed;
  }
  // Dart only produces a local `DateTime` when the string carried no zone at
  // all; any offset, `+00` included, comes back already converted to UTC. So
  // reaching here means the zone was missing, and the fields are re-read as
  // UTC rather than shifted by wherever the commander happens to live.
  return DateTime.utc(
    parsed.year,
    parsed.month,
    parsed.day,
    parsed.hour,
    parsed.minute,
    parsed.second,
    parsed.millisecond,
  );
}
