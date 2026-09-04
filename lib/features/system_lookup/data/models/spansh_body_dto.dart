import '../../../../core/json/json_readers.dart';
import '../../../../core/network/spansh_landmarks.dart';
import '../../domain/entities/body_landmarks.dart';
import 'spansh_system_dto.dart';

/// Maps `GET /api/body/{id64}` onto [BodyLandmarks].
///
/// This is the endpoint that makes the whole feature worth building: it is the
/// only public source that names the *species* rather than the genus, and it
/// gives the coordinates to walk to. The dumps do not carry it — "Stratum
/// Tectonicas" appears zero times in 272 MB of `galaxy_1day.json`.
///
/// It answers under a `record` root, in `snake_case`, and mixes organics with
/// surface stations and geology in the same `landmarks` array.
abstract final class SpanshBodyDto {
  static BodyLandmarks? fromJson(
    Map<String, dynamic> json, {
    required DateTime fetchedAt,
  }) {
    final Map<String, dynamic> record =
        json['record'] is Map<String, dynamic> ? readMap(json['record']) : json;

    final int? id64 = readInt(record['id64']);
    final String? name = readString(record['name']);
    if (id64 == null || name == null) {
      return null;
    }

    final Map<String, _Sighting> byKey = <String, _Sighting>{};
    int others = 0;

    if (record['landmarks'] case final List<dynamic> raw) {
      for (final Map<String, dynamic> entry
          in raw.whereType<Map<String, dynamic>>()) {
        final String? type = readString(entry['type']);
        final String? subtype = readString(entry['subtype']);
        final String? genus = SpanshLandmarks.genusFor(type);
        if (genus == null || subtype == null) {
          others++;
          continue;
        }

        final String? variant = readString(entry['variant']);
        final String key = '$subtype|${variant ?? ''}';
        final _Sighting sighting = byKey.putIfAbsent(
          key,
          () => _Sighting(
            genus: genus,
            species: subtype,
            variant: variant,
            valueCr: readInt(entry['value']) ?? 0,
          ),
        );

        final double? latitude = readDouble(entry['latitude']);
        final double? longitude = readDouble(entry['longitude']);
        if (latitude != null && longitude != null) {
          sighting.locations.add(
            SurfaceLocation(latitude: latitude, longitude: longitude),
          );
        }
      }
    }

    final List<SpeciesSighting> species = byKey.values
        .map(
          (_Sighting sighting) => SpeciesSighting(
            genus: sighting.genus,
            species: sighting.species,
            variant: sighting.variant,
            valueCr: sighting.valueCr,
            locations: List<SurfaceLocation>.unmodifiable(sighting.locations),
          ),
        )
        .toList()
      // Most valuable first: on a body with a Stratum and a Bacterium, the
      // Stratum is the reason to land and the other is what you pick up on the
      // way back.
      ..sort((SpeciesSighting a, SpeciesSighting b) {
        final int byValue = b.valueCr.compareTo(a.valueCr);
        return byValue != 0 ? byValue : a.species.compareTo(b.species);
      });

    return BodyLandmarks(
      bodyId64: id64,
      bodyName: name,
      fetchedAt: fetchedAt,
      species: List<SpeciesSighting>.unmodifiable(species),
      otherLandmarks: others,
      signalsUpdatedAt: parseSpanshDate(record['signals_updated_at']),
    );
  }
}

/// Mutable accumulator, folded into an immutable [SpeciesSighting] at the end.
class _Sighting {
  _Sighting({
    required this.genus,
    required this.species,
    required this.variant,
    required this.valueCr,
  });

  final String genus;
  final String species;
  final String? variant;
  final int valueCr;
  final List<SurfaceLocation> locations = <SurfaceLocation>[];
}
