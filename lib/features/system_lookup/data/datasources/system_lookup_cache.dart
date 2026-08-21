import 'package:injectable/injectable.dart';

import '../../../../core/json/json_readers.dart';
import '../../../../core/storage/key_value_store.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../domain/entities/body_landmarks.dart';
import '../../domain/entities/charted_system.dart';

/// Remembers what Spansh answered, so it is asked once.
///
/// Caching here is not an optimisation, it is the terms of use. Spansh
/// publishes no rate limit and no terms of service, which means the only
/// defensible volume is the smallest one that still works. A system's bodies —
/// their class, gravity, temperature — do not change from one week to the
/// next; asking again would be asking for nothing.
///
/// Two stores, because they expire differently. A system entry ages out on the
/// clock. A body's species list does not: it stays good until the *signals* of
/// that body are updated, which is a fact the system dump reports and a timer
/// cannot guess.
@lazySingleton
class SystemLookupCache {
  const SystemLookupCache(this._store);

  final KeyValueStore _store;

  /// How long a system record is served without asking again.
  ///
  /// Two weeks. Long enough that revisiting a system costs nothing, short
  /// enough that a body someone charted last month eventually shows up.
  static const Duration systemLifetime = Duration(days: 14);

  /// How many systems and bodies are kept before the oldest are dropped.
  ///
  /// The cache lives in shared preferences, which is read whole into memory at
  /// startup; letting it grow without limit would put a slow, silent cost on
  /// every launch of the app for the rest of its life.
  static const int maxSystems = 40;
  static const int maxBodies = 200;

  Future<ChartedSystem?> readSystem(int id64) async {
    final Map<String, dynamic> all =
        await _store.readJson(StorageKeys.systemLookupSystems) ??
            <String, dynamic>{};
    final Map<String, dynamic> entry = readMap(all['$id64']);
    return entry.isEmpty ? null : _systemFromCache(entry);
  }

  Future<void> writeSystem(ChartedSystem system) async {
    final Map<String, dynamic> all =
        await _store.readJson(StorageKeys.systemLookupSystems) ??
            <String, dynamic>{};
    all['${system.id64}'] = _systemToCache(system);
    await _store.writeJson(
      StorageKeys.systemLookupSystems,
      _trim(all, maxSystems),
    );
  }

  Future<BodyLandmarks?> readLandmarks(int bodyId64) async {
    final Map<String, dynamic> all =
        await _store.readJson(StorageKeys.systemLookupBodies) ??
            <String, dynamic>{};
    final Map<String, dynamic> entry = readMap(all['$bodyId64']);
    return entry.isEmpty ? null : _landmarksFromCache(entry);
  }

  Future<void> writeLandmarks(BodyLandmarks landmarks) async {
    final Map<String, dynamic> all =
        await _store.readJson(StorageKeys.systemLookupBodies) ??
            <String, dynamic>{};
    all['${landmarks.bodyId64}'] = _landmarksToCache(landmarks);
    await _store.writeJson(
      StorageKeys.systemLookupBodies,
      _trim(all, maxBodies),
    );
  }

  Future<void> clear() async {
    await _store.remove(StorageKeys.systemLookupSystems);
    await _store.remove(StorageKeys.systemLookupBodies);
  }

  /// Keeps the [limit] most recently fetched entries.
  ///
  /// An entry the cache cannot date sorts last and is dropped first: it comes
  /// from a version of this code that wrote a different shape, and there is
  /// nothing to lose by re-fetching it.
  static Map<String, dynamic> _trim(Map<String, dynamic> all, int limit) {
    if (all.length <= limit) {
      return all;
    }
    final List<MapEntry<String, dynamic>> entries = all.entries.toList()
      ..sort((MapEntry<String, dynamic> a, MapEntry<String, dynamic> b) {
        final DateTime left = _fetchedAt(a.value);
        final DateTime right = _fetchedAt(b.value);
        return right.compareTo(left);
      });
    return Map<String, dynamic>.fromEntries(entries.take(limit));
  }

  static DateTime _fetchedAt(Object? value) =>
      DateTime.tryParse(readString(readMap(value)['fetchedAt']) ?? '')?.toUtc() ??
      DateTime.utc(1970);

  // --- system ---

  static Map<String, dynamic> _systemToCache(ChartedSystem system) =>
      <String, dynamic>{
        'id64': system.id64,
        'name': system.name,
        'fetchedAt': system.fetchedAt.toIso8601String(),
        if (system.bodyCount case final int count) 'bodyCount': count,
        if (system.updatedAt case final DateTime at)
          'updatedAt': at.toIso8601String(),
        'bodies': system.bodies.map(_bodyToCache).toList(growable: false),
      };

  static ChartedSystem? _systemFromCache(Map<String, dynamic> json) {
    final int? id64 = readInt(json['id64']);
    final String? name = readString(json['name']);
    final DateTime? fetchedAt =
        DateTime.tryParse(readString(json['fetchedAt']) ?? '')?.toUtc();
    if (id64 == null || name == null || fetchedAt == null) {
      return null;
    }

    final List<ChartedBody> bodies = <ChartedBody>[];
    if (json['bodies'] case final List<dynamic> raw) {
      for (final Map<String, dynamic> entry
          in raw.whereType<Map<String, dynamic>>()) {
        final ChartedBody? body = _bodyFromCache(entry);
        if (body != null) {
          bodies.add(body);
        }
      }
    }

    return ChartedSystem(
      id64: id64,
      name: name,
      fetchedAt: fetchedAt,
      bodyCount: readInt(json['bodyCount']),
      bodies: List<ChartedBody>.unmodifiable(bodies),
      updatedAt: DateTime.tryParse(readString(json['updatedAt']) ?? '')?.toUtc(),
      fromCache: true,
    );
  }

  static Map<String, dynamic> _bodyToCache(ChartedBody body) =>
      <String, dynamic>{
        'id64': body.id64,
        'name': body.name,
        if (body.bodyId case final int id) 'bodyId': id,
        if (body.type case final String type) 'type': type,
        if (body.subType case final String subType) 'subType': subType,
        if (body.atmosphere case final String atmosphere)
          'atmosphere': atmosphere,
        if (body.volcanism case final String volcanism) 'volcanism': volcanism,
        if (body.gravityG case final double gravity) 'gravityG': gravity,
        if (body.surfaceTemperatureK case final double temperature)
          'surfaceTemperatureK': temperature,
        if (body.distanceFromArrivalLs case final double distance)
          'distanceLs': distance,
        'landable': body.landable,
        if (body.terraformingState case final String state)
          'terraformingState': state,
        'biologicalSignals': body.biologicalSignals,
        'genusNames': body.genusNames,
        if (body.signalsUpdatedAt case final DateTime at)
          'signalsUpdatedAt': at.toIso8601String(),
      };

  static ChartedBody? _bodyFromCache(Map<String, dynamic> json) {
    final int? id64 = readInt(json['id64']);
    final String? name = readString(json['name']);
    if (id64 == null || name == null) {
      return null;
    }
    return ChartedBody(
      id64: id64,
      name: name,
      bodyId: readInt(json['bodyId']),
      type: readString(json['type']),
      subType: readString(json['subType']),
      atmosphere: readString(json['atmosphere']),
      volcanism: readString(json['volcanism']),
      gravityG: readDouble(json['gravityG']),
      surfaceTemperatureK: readDouble(json['surfaceTemperatureK']),
      distanceFromArrivalLs: readDouble(json['distanceLs']),
      landable: json['landable'] == true,
      terraformingState: readString(json['terraformingState']),
      biologicalSignals: readInt(json['biologicalSignals']) ?? 0,
      genusNames: _strings(json['genusNames']),
      signalsUpdatedAt:
          DateTime.tryParse(readString(json['signalsUpdatedAt']) ?? '')?.toUtc(),
    );
  }

  // --- landmarks ---

  static Map<String, dynamic> _landmarksToCache(BodyLandmarks landmarks) =>
      <String, dynamic>{
        'bodyId64': landmarks.bodyId64,
        'bodyName': landmarks.bodyName,
        'fetchedAt': landmarks.fetchedAt.toIso8601String(),
        'otherLandmarks': landmarks.otherLandmarks,
        if (landmarks.signalsUpdatedAt case final DateTime at)
          'signalsUpdatedAt': at.toIso8601String(),
        'species': landmarks.species
            .map(
              (SpeciesSighting sighting) => <String, dynamic>{
                'genus': sighting.genus,
                'species': sighting.species,
                if (sighting.variant case final String variant)
                  'variant': variant,
                'valueCr': sighting.valueCr,
                'locations': sighting.locations
                    .map(
                      (SurfaceLocation location) => <String, dynamic>{
                        'lat': location.latitude,
                        'lon': location.longitude,
                      },
                    )
                    .toList(growable: false),
              },
            )
            .toList(growable: false),
      };

  static BodyLandmarks? _landmarksFromCache(Map<String, dynamic> json) {
    final int? id64 = readInt(json['bodyId64']);
    final String? name = readString(json['bodyName']);
    final DateTime? fetchedAt =
        DateTime.tryParse(readString(json['fetchedAt']) ?? '')?.toUtc();
    if (id64 == null || name == null || fetchedAt == null) {
      return null;
    }

    final List<SpeciesSighting> species = <SpeciesSighting>[];
    if (json['species'] case final List<dynamic> raw) {
      for (final Map<String, dynamic> entry
          in raw.whereType<Map<String, dynamic>>()) {
        final String? speciesName = readString(entry['species']);
        if (speciesName == null) {
          continue;
        }
        final List<SurfaceLocation> locations = <SurfaceLocation>[];
        if (entry['locations'] case final List<dynamic> rawLocations) {
          for (final Map<String, dynamic> location
              in rawLocations.whereType<Map<String, dynamic>>()) {
            final double? latitude = readDouble(location['lat']);
            final double? longitude = readDouble(location['lon']);
            if (latitude != null && longitude != null) {
              locations.add(
                SurfaceLocation(latitude: latitude, longitude: longitude),
              );
            }
          }
        }
        species.add(
          SpeciesSighting(
            genus: readString(entry['genus']) ?? '',
            species: speciesName,
            variant: readString(entry['variant']),
            valueCr: readInt(entry['valueCr']) ?? 0,
            locations: List<SurfaceLocation>.unmodifiable(locations),
          ),
        );
      }
    }

    return BodyLandmarks(
      bodyId64: id64,
      bodyName: name,
      fetchedAt: fetchedAt,
      species: List<SpeciesSighting>.unmodifiable(species),
      otherLandmarks: readInt(json['otherLandmarks']) ?? 0,
      signalsUpdatedAt:
          DateTime.tryParse(readString(json['signalsUpdatedAt']) ?? '')?.toUtc(),
      fromCache: true,
    );
  }

  static List<String> _strings(Object? value) => value is List<dynamic>
      ? List<String>.unmodifiable(value.whereType<String>())
      : const <String>[];
}
