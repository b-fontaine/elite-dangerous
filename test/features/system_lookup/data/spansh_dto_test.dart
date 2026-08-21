import 'dart:convert';

import 'package:elite_dangerous/features/system_lookup/data/models/spansh_body_dto.dart';
import 'package:elite_dangerous/features/system_lookup/data/models/spansh_system_dto.dart';
import 'package:elite_dangerous/features/system_lookup/domain/entities/body_landmarks.dart';
import 'package:elite_dangerous/features/system_lookup/domain/entities/charted_system.dart';
import 'package:flutter_test/flutter_test.dart';

/// Every payload below is trimmed from a real answer taken on 20 August 2026 —
/// Sol, 36 Ophiuchi, and the body 36 Ophiuchi C 4 the study cites. The shapes
/// matter more than the values: the two endpoints disagree about their root
/// key, their case convention and their date format, and a mapper written from
/// the schema alone would be wrong about all three.
void main() {
  final DateTime fetchedAt = DateTime.utc(2026, 8, 20, 21);

  group('le dump d\'un système', () {
    Map<String, dynamic> dump({
      List<Map<String, dynamic>> bodies = const <Map<String, dynamic>>[],
    }) =>
        <String, dynamic>{
          'system': <String, dynamic>{
            'id64': 1865903245675,
            'name': '36 Ophiuchi',
            'bodyCount': 41,
            'date': '2026-08-20 21:28:58+00',
            'bodies': bodies,
          },
        };

    test('la charge utile est enveloppée dans un objet `system`', () {
      // Le schéma décrit l'objet intérieur et ne dit rien de l'enveloppe : lue
      // sur la vraie API, pas dans la documentation.
      final ChartedSystem system =
          SpanshSystemDto.fromJson(dump(), fetchedAt: fetchedAt)!;

      expect(system.id64, 1865903245675);
      expect(system.name, '36 Ophiuchi');
      expect(system.bodyCount, 41);
      expect(system.updatedAt, DateTime.utc(2026, 8, 20, 21, 28, 58));
    });

    test('un corps porte son propre id64, différent de celui du système', () {
      final ChartedSystem system = SpanshSystemDto.fromJson(
        dump(
          bodies: <Map<String, dynamic>>[
            <String, dynamic>{
              'id64': 1188952167529056619,
              'bodyId': 26,
              'name': '36 Ophiuchi C 4',
              'type': 'Planet',
              'subType': 'High metal content world',
              'atmosphereType': 'Thin Sulphur dioxide',
              'gravity': 0.472201998572448,
              'surfaceTemperature': 314.857697,
              'distanceToArrival': 40000.5,
              'isLandable': true,
            },
          ],
        ),
        fetchedAt: fetchedAt,
      )!;

      final ChartedBody body = system.bodies.single;
      // C'est cet id64-là que `/api/body/{id64}` attend. Passer celui du
      // système rend un 404 poli et une liste d'espèces vide.
      expect(body.id64, 1188952167529056619);
      expect(body.bodyId, 26);
      expect(body.landable, isTrue);
      expect(body.gravityG, closeTo(0.4722, 0.0001));
      expect(body.surfaceTemperatureK, closeTo(314.86, 0.01));
    });

    test('la gravité est déjà en g, contrairement au journal', () {
      // Terre = 0,999 chez Spansh, 9,81 dans le journal. Convertir deux fois
      // donnerait un corps à 0,1 g qu'aucune combinaison ne justifie.
      final ChartedSystem system = SpanshSystemDto.fromJson(
        dump(
          bodies: <Map<String, dynamic>>[
            <String, dynamic>{
              'id64': 1,
              'name': 'Earth',
              'gravity': 0.999057713877842,
            },
          ],
        ),
        fetchedAt: fetchedAt,
      )!;

      expect(system.bodies.single.gravityG, closeTo(1.0, 0.001));
    });

    test('les tokens de genre sont traduits en noms du catalogue', () {
      final ChartedSystem system = SpanshSystemDto.fromJson(
        dump(
          bodies: <Map<String, dynamic>>[
            <String, dynamic>{
              'id64': 2,
              'name': 'A 3',
              'signals': <String, dynamic>{
                'genuses': <String>[
                  r'$Codex_Ent_Stratum_Genus_Name;',
                  r'$Codex_Ent_Shrubs_Genus_Name;',
                  r'$Codex_Ent_Cone_Name;',
                ],
                'signals': <String, dynamic>{
                  r'$SAA_SignalType_Biological;': 3,
                  r'$SAA_SignalType_Geological;': 5,
                },
                'updateTime': '2026-08-02 22:54:28+00',
              },
            },
          ],
        ),
        fetchedAt: fetchedAt,
      )!;

      final ChartedBody body = system.bodies.single;
      // `Shrubs` est Frutexa et `Cone` est Bark Mound : deux correspondances
      // que rien dans le token ne laisse deviner.
      expect(body.genusNames, <String>['Bark Mound', 'Frutexa', 'Stratum']);
      // Seuls les signaux biologiques sont comptés, pas les cinq géologiques.
      expect(body.biologicalSignals, 3);
      expect(body.signalsUpdatedAt, DateTime.utc(2026, 8, 2, 22, 54, 28));
    });

    test('un genre inconnu de la table reste lisible', () {
      // Radicoida est en jeu et absent de l'enum Spansh : le jour où il y
      // entrera, mieux vaut « Ingensradices » qu'un symbole brut.
      final ChartedSystem system = SpanshSystemDto.fromJson(
        dump(
          bodies: <Map<String, dynamic>>[
            <String, dynamic>{
              'id64': 3,
              'name': 'B 1',
              'signals': <String, dynamic>{
                'genuses': <String>[r'$Codex_Ent_Nouveau_Genus_Name;'],
              },
            },
          ],
        ),
        fetchedAt: fetchedAt,
      )!;

      expect(system.bodies.single.genusNames, <String>['Nouveau']);
    });

    test('un corps sans signaux n\'en invente pas', () {
      final ChartedSystem system = SpanshSystemDto.fromJson(
        dump(
          bodies: <Map<String, dynamic>>[
            <String, dynamic>{'id64': 4, 'name': 'Venus'},
          ],
        ),
        fetchedAt: fetchedAt,
      )!;

      final ChartedBody body = system.bodies.single;
      expect(body.biologicalSignals, 0);
      expect(body.genusNames, isEmpty);
      expect(body.hasBiology, isFalse);
      expect(body.signalsUpdatedAt, isNull);
    });

    test('un corps sans nom ni id64 est écarté sans faire tomber le reste', () {
      final ChartedSystem system = SpanshSystemDto.fromJson(
        dump(
          bodies: <Map<String, dynamic>>[
            <String, dynamic>{'bodyId': 7},
            <String, dynamic>{'id64': 5, 'name': 'A 1'},
          ],
        ),
        fetchedAt: fetchedAt,
      )!;

      expect(system.bodies, hasLength(1));
      expect(system.bodies.single.name, 'A 1');
    });

    test('une réponse d\'erreur rend null plutôt que de lever', () {
      // `{"error":"Could not find record with id64 1"}` est ce que rend
      // vraiment l'API pour un id64 inexistant.
      expect(
        SpanshSystemDto.fromJson(
          jsonDecode('{"error":"Could not find record with id64 1"}')
              as Map<String, dynamic>,
          fetchedAt: fetchedAt,
        ),
        isNull,
      );
    });

    test('les corps intéressants ressortent du plus proche au plus loin', () {
      final ChartedSystem system = SpanshSystemDto.fromJson(
        dump(
          bodies: <Map<String, dynamic>>[
            <String, dynamic>{
              'id64': 10,
              'name': 'loin',
              'isLandable': true,
              'distanceToArrival': 40000.0,
              'signals': <String, dynamic>{
                'signals': <String, dynamic>{r'$SAA_SignalType_Biological;': 1},
              },
            },
            <String, dynamic>{
              'id64': 11,
              'name': 'près',
              'isLandable': true,
              'distanceToArrival': 900.0,
              'signals': <String, dynamic>{
                'signals': <String, dynamic>{r'$SAA_SignalType_Biological;': 4},
              },
            },
          ],
        ),
        fetchedAt: fetchedAt,
      )!;

      expect(
        system.landingTargets.map((ChartedBody body) => body.name),
        <String>['près', 'loin'],
      );
      expect(system.biologicalSignalCount, 5);
    });
  });

  group('les dates de Spansh', () {
    test('le format à espace et à décalage court est lu', () {
      expect(
        parseSpanshDate('2026-08-19 05:09:43+00'),
        DateTime.utc(2026, 8, 19, 5, 9, 43),
      );
    });

    test('le format ISO des `timestamps` aussi', () {
      expect(
        parseSpanshDate('2026-08-20T21:26:01Z'),
        DateTime.utc(2026, 8, 20, 21, 26, 1),
      );
    });

    test('une date sans fuseau est lue en UTC, pas en heure locale', () {
      // Dart rend un DateTime local dans ce cas. Sans ce garde-fou, comparer
      // deux `signals.updateTime` déciderait de la validité d'un cache à
      // quelques heures près, selon l'endroit où vit le commandant.
      final DateTime? parsed = parseSpanshDate('2026-08-02 22:54:28');

      expect(parsed!.isUtc, isTrue);
      expect(parsed, DateTime.utc(2026, 8, 2, 22, 54, 28));
    });

    test('ce qui n\'est pas une date rend null', () {
      expect(parseSpanshDate('bientôt'), isNull);
      expect(parseSpanshDate(null), isNull);
      expect(parseSpanshDate(42), isNull);
    });
  });

  group('le relevé d\'un corps', () {
    Map<String, dynamic> record(List<Map<String, dynamic>> landmarks) =>
        <String, dynamic>{
          'record': <String, dynamic>{
            'id64': 1188952167529056619,
            'name': '36 Ophiuchi C 4',
            'system_name': '36 Ophiuchi',
            'signals_updated_at': '2026-08-02 22:54:28+00',
            'landmarks': landmarks,
          },
        };

    Map<String, dynamic> landmark({
      required String type,
      required String subtype,
      String? variant,
      int value = 0,
      double latitude = 0,
      double longitude = 0,
    }) =>
        <String, dynamic>{
          'type': type,
          'subtype': subtype,
          // La forme `?variant` déclencherait le même lint résolu, et le
          // formateur figé du projet ne sait pas la lire.
          if (variant case final String colour) 'variant': colour,
          'value': value,
          'latitude': latitude,
          'longitude': longitude,
        };

    test('la charge utile est enveloppée dans un objet `record`', () {
      final BodyLandmarks body = SpanshBodyDto.fromJson(
        record(const <Map<String, dynamic>>[]),
        fetchedAt: fetchedAt,
      )!;

      expect(body.bodyId64, 1188952167529056619);
      expect(body.bodyName, '36 Ophiuchi C 4');
      expect(body.signalsUpdatedAt, DateTime.utc(2026, 8, 2, 22, 54, 28));
    });

    test('les relevés d\'une même espèce sont regroupés', () {
      // Le vrai corps porte 23 entrées pour une seule Bacterium Tela. Les
      // afficher une par une serait une liste de punaises, pas une réponse.
      final BodyLandmarks body = SpanshBodyDto.fromJson(
        record(<Map<String, dynamic>>[
          landmark(
            type: 'Bacterium',
            subtype: 'Bacterium Tela',
            variant: 'Yellow',
            value: 1949000,
            latitude: 12.5,
            longitude: -30.25,
          ),
          landmark(
            type: 'Bacterium',
            subtype: 'Bacterium Tela',
            variant: 'Yellow',
            value: 1949000,
            latitude: 44.0,
            longitude: 5.0,
          ),
        ]),
        fetchedAt: fetchedAt,
      )!;

      final SpeciesSighting sighting = body.species.single;
      expect(sighting.species, 'Bacterium Tela');
      expect(sighting.variant, 'Yellow');
      expect(sighting.valueCr, 1949000);
      expect(sighting.sightings, 2);
      expect(sighting.locations.first.latitude, 12.5);
      expect(sighting.variantName, 'Bacterium Tela - Yellow');
    });

    test('la plus chère passe devant', () {
      final BodyLandmarks body = SpanshBodyDto.fromJson(
        record(<Map<String, dynamic>>[
          landmark(
            type: 'Bacterium',
            subtype: 'Bacterium Tela',
            variant: 'Yellow',
            value: 1949000,
          ),
          landmark(
            type: 'Stratum',
            subtype: 'Stratum Tectonicas',
            variant: 'Lime',
            value: 19010800,
          ),
        ]),
        fetchedAt: fetchedAt,
      )!;

      expect(
        body.species.map((SpeciesSighting s) => s.species),
        <String>['Stratum Tectonicas', 'Bacterium Tela'],
      );
      expect(body.totalValueCr, 20959800);
    });

    test('les stations et la géologie sont comptées, pas listées', () {
      final BodyLandmarks body = SpanshBodyDto.fromJson(
        record(<Map<String, dynamic>>[
          landmark(type: 'Surface Station', subtype: 'Crater Outpost'),
          landmark(type: 'Geyser', subtype: 'Water Ice Geyser'),
          landmark(type: 'Lava Spout', subtype: 'Iron Magma Lava Spout'),
          landmark(
            type: 'Stratum',
            subtype: 'Stratum Tectonicas',
            value: 19010800,
          ),
        ]),
        fetchedAt: fetchedAt,
      )!;

      expect(body.species, hasLength(1));
      expect(body.otherLandmarks, 3);
    });

    test('un organisme non échantillonnable ne compte pas comme une espèce',
        () {
      // Un Mollusc a l'air d'un être vivant et ne se récolte pas au Genetic
      // Sampler. Une liste noire l'aurait laissé passer avec un prix.
      final BodyLandmarks body = SpanshBodyDto.fromJson(
        record(<Map<String, dynamic>>[
          landmark(type: 'Mollusc', subtype: 'Viride Bullet Mollusc'),
          landmark(type: 'Lagrange Cloud', subtype: 'Viride Lagrange Cloud'),
          landmark(type: 'Thargoid', subtype: 'Thargoid Structure'),
        ]),
        fetchedAt: fetchedAt,
      )!;

      expect(body.species, isEmpty);
      expect(body.isEmpty, isTrue);
      expect(body.otherLandmarks, 3);
    });

    test('les genres écrits autrement que dans le catalogue sont traduits', () {
      final BodyLandmarks body = SpanshBodyDto.fromJson(
        record(<Map<String, dynamic>>[
          landmark(type: 'Bark Mounds', subtype: 'Bark Mounds', value: 1471900),
          landmark(
            type: 'Tubers',
            subtype: 'Prasinum Sinuous Tubers',
            value: 1514500,
          ),
          landmark(
            type: 'Shards',
            subtype: 'Crystalline Shards',
            value: 1628800,
          ),
        ]),
        fetchedAt: fetchedAt,
      )!;

      expect(
        body.species.map((SpeciesSighting s) => s.genus).toSet(),
        <String>{'Bark Mound', 'Sinuous Tuber', 'Crystalline Shard'},
      );
    });

    test('un relevé sans coordonnées reste une espèce trouvée', () {
      final BodyLandmarks body = SpanshBodyDto.fromJson(
        <String, dynamic>{
          'record': <String, dynamic>{
            'id64': 7,
            'name': 'A 1',
            'landmarks': <Map<String, dynamic>>[
              <String, dynamic>{
                'type': 'Osseus',
                'subtype': 'Osseus Pumice',
                'value': 3156500,
              },
            ],
          },
        },
        fetchedAt: fetchedAt,
      )!;

      expect(body.species.single.species, 'Osseus Pumice');
      expect(body.species.single.locations, isEmpty);
      expect(body.signalsUpdatedAt, isNull);
    });

    test('une réponse d\'erreur rend null', () {
      expect(
        SpanshBodyDto.fromJson(
          <String, dynamic>{'error': 'Could not find record with id64 1'},
          fetchedAt: fetchedAt,
        ),
        isNull,
      );
    });
  });
}
