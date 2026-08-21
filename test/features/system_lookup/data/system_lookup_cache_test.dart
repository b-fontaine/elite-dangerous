import 'package:elite_dangerous/core/storage/storage_keys.dart';
import 'package:elite_dangerous/features/system_lookup/data/datasources/system_lookup_cache.dart';
import 'package:elite_dangerous/features/system_lookup/domain/entities/body_landmarks.dart';
import 'package:elite_dangerous/features/system_lookup/domain/entities/charted_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/in_memory_stores.dart';

/// The cache is what makes this feature defensible, and it lives in shared
/// preferences — a store read whole into memory at every launch. So it is
/// tested for two things: that what comes out is what went in, and that it
/// never grows without end.
void main() {
  late InMemoryKeyValueStore store;
  late SystemLookupCache cache;

  setUp(() {
    store = InMemoryKeyValueStore();
    cache = SystemLookupCache(store);
  });

  ChartedSystem system(int id64, {DateTime? fetchedAt}) => ChartedSystem(
        id64: id64,
        name: 'Système $id64',
        fetchedAt: fetchedAt ?? DateTime.utc(2026, 8, 20, 12),
        bodyCount: 3,
        updatedAt: DateTime.utc(2026, 8, 19),
        bodies: <ChartedBody>[
          ChartedBody(
            id64: id64 * 10,
            name: 'Système $id64 A 1',
            bodyId: 1,
            type: 'Planet',
            subType: 'High metal content world',
            atmosphere: 'Thin Sulphur dioxide',
            volcanism: 'Major Rocky Magma',
            gravityG: 0.47,
            surfaceTemperatureK: 314.8,
            distanceFromArrivalLs: 900,
            landable: true,
            terraformingState: 'Not terraformable',
            biologicalSignals: 2,
            genusNames: const <String>['Bacterium', 'Stratum'],
            signalsUpdatedAt: DateTime.utc(2026, 8, 2, 22, 54, 28),
          ),
        ],
      );

  group('un système', () {
    test('ressort tel qu\'il est entré', () async {
      await cache.writeSystem(system(42));

      final ChartedSystem stored = (await cache.readSystem(42))!;

      expect(stored.name, 'Système 42');
      expect(stored.bodyCount, 3);
      expect(stored.updatedAt, DateTime.utc(2026, 8, 19));
      // Marqué comme venant du cache : c'est la différence entre « personne
      // n'est venu ici » et « personne n'était venu il y a deux semaines ».
      expect(stored.fromCache, isTrue);

      final ChartedBody body = stored.bodies.single;
      expect(body.id64, 420);
      expect(body.genusNames, <String>['Bacterium', 'Stratum']);
      expect(body.gravityG, 0.47);
      expect(body.landable, isTrue);
      expect(body.signalsUpdatedAt, DateTime.utc(2026, 8, 2, 22, 54, 28));
    });

    test('un système jamais vu rend null', () async {
      expect(await cache.readSystem(7), isNull);
    });

    test('le même système écrit deux fois n\'en fait pas deux', () async {
      await cache.writeSystem(system(42));
      await cache.writeSystem(system(42));

      final Map<String, dynamic> raw =
          (await store.readJson(StorageKeys.systemLookupSystems))!;

      expect(raw.keys, hasLength(1));
    });

    test('au-delà du plafond, les plus anciens partent', () async {
      for (int i = 0; i < SystemLookupCache.maxSystems + 5; i++) {
        await cache.writeSystem(
          system(i, fetchedAt: DateTime.utc(2026, 8, 20).add(Duration(minutes: i))),
        );
      }

      final Map<String, dynamic> raw =
          (await store.readJson(StorageKeys.systemLookupSystems))!;

      expect(raw.keys, hasLength(SystemLookupCache.maxSystems));
      // Les cinq premiers sont ceux que le commandant a quittés le plus tôt.
      expect(await cache.readSystem(0), isNull);
      expect(await cache.readSystem(SystemLookupCache.maxSystems + 4), isNotNull);
    });

    test('une entrée écrite par une version antérieure est ignorée', () async {
      await store.writeJson(
        StorageKeys.systemLookupSystems,
        <String, dynamic>{'42': <String, dynamic>{'nom': 'autre chose'}},
      );

      expect(await cache.readSystem(42), isNull);
    });
  });

  group('les espèces d\'un corps', () {
    BodyLandmarks landmarks(int id64) => BodyLandmarks(
          bodyId64: id64,
          bodyName: 'A 1',
          fetchedAt: DateTime.utc(2026, 8, 20, 12),
          otherLandmarks: 2,
          signalsUpdatedAt: DateTime.utc(2026, 8, 2, 22, 54, 28),
          species: const <SpeciesSighting>[
            SpeciesSighting(
              genus: 'Stratum',
              species: 'Stratum Tectonicas',
              variant: 'Lime',
              valueCr: 19010800,
              locations: <SurfaceLocation>[
                SurfaceLocation(latitude: -36.704754, longitude: -99.003242),
              ],
            ),
          ],
        );

    test('ressortent telles qu\'elles sont entrées', () async {
      await cache.writeLandmarks(landmarks(420));

      final BodyLandmarks stored = (await cache.readLandmarks(420))!;

      expect(stored.bodyName, 'A 1');
      expect(stored.otherLandmarks, 2);
      expect(stored.fromCache, isTrue);
      expect(stored.signalsUpdatedAt, DateTime.utc(2026, 8, 2, 22, 54, 28));

      final SpeciesSighting sighting = stored.species.single;
      expect(sighting.species, 'Stratum Tectonicas');
      expect(sighting.variant, 'Lime');
      expect(sighting.valueCr, 19010800);
      expect(sighting.locations.single.latitude, closeTo(-36.7048, 0.0001));
    });

    test('le plafond s\'applique aussi aux corps', () async {
      for (int i = 0; i < SystemLookupCache.maxBodies + 3; i++) {
        await cache.writeLandmarks(landmarks(i));
      }

      final Map<String, dynamic> raw =
          (await store.readJson(StorageKeys.systemLookupBodies))!;

      expect(raw.keys, hasLength(SystemLookupCache.maxBodies));
    });
  });

  test('tout vider efface les deux magasins', () async {
    await cache.writeSystem(system(42));
    await cache.writeLandmarks(
      BodyLandmarks(
        bodyId64: 420,
        bodyName: 'A 1',
        fetchedAt: DateTime.utc(2026, 8, 20),
      ),
    );

    await cache.clear();

    expect(await cache.readSystem(42), isNull);
    expect(await cache.readLandmarks(420), isNull);
  });

  test('les deux clés sont dans la liste de remise à zéro', () async {
    // Sans cela, « effacer mes données locales » laisserait derrière lui un
    // cache que le commandant croit supprimé.
    expect(
      StorageKeys.resettable,
      containsAll(<String>[
        StorageKeys.systemLookupSystems,
        StorageKeys.systemLookupBodies,
      ]),
    );
  });
}
