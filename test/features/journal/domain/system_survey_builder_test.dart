import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/journal/domain/entities/system_survey.dart';
import 'package:elite_dangerous/features/journal/domain/services/system_survey_builder.dart';
import 'package:flutter_test/flutter_test.dart';

/// "Is there anything left to do here?" — the question the dashboard exists to
/// answer, and the one this builder has to get right from a journal that spans
/// years and thousands of systems.
void main() {
  const SystemSurveyBuilder builder = SystemSurveyBuilder();

  const int here = 2871051298721;
  const int elsewhere = 1733187048;

  DateTime at(int minute) => DateTime.utc(2026, 8, 20, 12, minute);

  SystemSurvey survey(List<JournalEvent> events) => builder.build(
        events: events,
        systemAddress: here,
        systemName: 'Hyades Sector DR-V c2-23',
      );

  group('un seul système à la fois', () {
    test('les corps d\'un autre système ne sont pas comptés', () {
      final SystemSurvey result = survey(<JournalEvent>[
        BodyScanEvent(
          timestamp: at(0),
          bodyName: 'Ici A 1',
          systemAddress: here,
          bodyId: 1,
        ),
        BodyScanEvent(
          timestamp: at(1),
          bodyName: 'Ailleurs A 1',
          systemAddress: elsewhere,
          bodyId: 1,
        ),
      ]);

      expect(result.bodies, hasLength(1));
      expect(result.bodies.single.name, 'Ici A 1');
    });

    test('un organisme échantillonné ailleurs ne compte pas ici', () {
      // Le même `BodyID` existe dans tous les systèmes de la galaxie : sans
      // filtre sur l\'id64, chaque « A 1 » de la carrière se retrouverait ici.
      final SystemSurvey result = survey(<JournalEvent>[
        BodySignalsEvent(
          timestamp: at(0),
          name: 'SAASignalsFound',
          biologicalCount: 2,
          bodyName: 'Ici A 1',
          bodyId: 1,
          systemAddress: here,
        ),
        ScanOrganicEvent(
          timestamp: at(1),
          scanType: OrganicScanType.analyse,
          genus: r'$Codex_Ent_Stratum_Genus_Name;',
          species: r'$Codex_Ent_Stratum_02_Name;',
          speciesLocalised: 'Stratum Tectonicas',
          systemAddress: elsewhere,
          bodyId: 1,
        ),
      ]);

      expect(result.bodies.single.organismsCompleted, 0);
      expect(result.bodies.single.biologyLeft, 2);
    });

    test('sans système connu, il n\'y a rien à dire', () {
      final SystemSurvey result = builder.build(
        events: <JournalEvent>[
          BodyScanEvent(timestamp: at(0), bodyName: 'A 1', bodyId: 1),
        ],
      );

      expect(result.isKnown, isFalse);
      expect(result.bodies, isEmpty);
    });

    test('un vieux Scan sans id64 est rattrapé par le nom du système', () {
      // Frontier n\'a pas toujours écrit `SystemAddress` dans `Scan`. Jeter
      // ces lignes reviendrait à effacer les relevés d\'avant 2018.
      final SystemSurvey result = survey(<JournalEvent>[
        BodyScanEvent(
          timestamp: at(0),
          bodyName: 'Hyades Sector DR-V c2-23 A 1',
          starSystem: 'Hyades Sector DR-V c2-23',
          bodyId: 1,
        ),
      ]);

      expect(result.bodies, hasLength(1));
    });
  });

  group('ce que le système contient', () {
    test('le balayage de découverte donne le dénominateur', () {
      final SystemSurvey result = survey(<JournalEvent>[
        DiscoveryScanEvent(
          timestamp: at(0),
          bodyCount: 12,
          systemAddress: here,
          systemName: 'Hyades Sector DR-V c2-23',
        ),
        BodyScanEvent(
          timestamp: at(1),
          bodyName: 'A 1',
          systemAddress: here,
          bodyId: 1,
        ),
      ]);

      expect(result.wasHonked, isTrue);
      expect(result.bodyCount, 12);
      expect(result.scannedCount, 1);
      expect(result.unscannedCount, 11);
    });

    test('sans balayage, le nombre de corps restants est inconnu', () {
      final SystemSurvey result = survey(<JournalEvent>[
        BodyScanEvent(
          timestamp: at(0),
          bodyName: 'A 1',
          systemAddress: here,
          bodyId: 1,
        ),
      ]);

      expect(result.wasHonked, isFalse);
      expect(result.unscannedCount, isNull);
    });

    test('FSSAllBodiesFound clôt le système', () {
      final SystemSurvey result = survey(<JournalEvent>[
        DiscoveryScanEvent(timestamp: at(0), bodyCount: 2, systemAddress: here),
        AllBodiesFoundEvent(timestamp: at(1), count: 2, systemAddress: here),
      ]);

      expect(result.allBodiesFound, isTrue);
      expect(result.isExhausted, isTrue);
    });
  });

  group('un corps, plusieurs relevés', () {
    test('le scan détaillé l\'emporte sur le balayage d\'arrivée', () {
      // L\'`AutoScan` du saut ne nomme pas la classe de la planète ; le
      // `Detailed` du FSS oui. Garder simplement le plus récent perdrait le
      // bon des deux quand le commandant repasse par le système.
      final SystemSurvey result = survey(<JournalEvent>[
        BodyScanEvent(
          timestamp: at(0),
          bodyName: 'A 1',
          systemAddress: here,
          bodyId: 1,
          scanType: 'Detailed',
          planetClass: 'High metal content body',
          landable: true,
        ),
        BodyScanEvent(
          timestamp: at(5),
          bodyName: 'A 1',
          systemAddress: here,
          bodyId: 1,
          scanType: 'AutoScan',
        ),
      ]);

      final SurveyBody body = result.bodies.single;
      expect(body.isDetailed, isTrue);
      expect(body.scan!.planetClass, 'High metal content body');
      expect(body.landable, isTrue);
    });

    test('le DSS corrige le compte du FSS et nomme les genres', () {
      final SystemSurvey result = survey(<JournalEvent>[
        BodySignalsEvent(
          timestamp: at(0),
          name: 'FSSBodySignals',
          biologicalCount: 3,
          bodyName: 'A 1',
          bodyId: 1,
          systemAddress: here,
        ),
        BodySignalsEvent(
          timestamp: at(1),
          name: 'SAASignalsFound',
          biologicalCount: 2,
          bodyName: 'A 1',
          bodyId: 1,
          systemAddress: here,
          genuses: const <DetectedGenus>[
            DetectedGenus(
              symbol: r'$Codex_Ent_Stratum_Genus_Name;',
              localised: 'Stratum',
            ),
            DetectedGenus(
              symbol: r'$Codex_Ent_Bacterial_Genus_Name;',
              localised: 'Bacterium',
            ),
          ],
        ),
      ]);

      final SurveyBody body = result.bodies.single;
      expect(body.biologicalSignals, 2);
      expect(body.genusNames, <String>['Stratum', 'Bacterium']);
    });

    test('cartographier un corps le retire de la liste des cibles', () {
      List<JournalEvent> events({required bool mapped}) => <JournalEvent>[
            BodySignalsEvent(
              timestamp: at(0),
              name: 'FSSBodySignals',
              biologicalCount: 2,
              bodyName: 'A 1',
              bodyId: 1,
              systemAddress: here,
            ),
            if (mapped)
              SurfaceMappedEvent(
                timestamp: at(1),
                bodyName: 'A 1',
                bodyId: 1,
                systemAddress: here,
                probesUsed: 4,
                efficiencyTarget: 6,
              ),
          ];

      expect(survey(events(mapped: false)).mappingTargets, hasLength(1));
      expect(survey(events(mapped: true)).mappingTargets, isEmpty);
    });
  });

  group('ce qui reste à échantillonner', () {
    /// A body with [signals] biological signals, sampled [analysed] times.
    SystemSurvey withSamples({required int signals, required int analysed}) =>
        survey(<JournalEvent>[
          BodyScanEvent(
            timestamp: at(0),
            bodyName: 'A 1',
            systemAddress: here,
            bodyId: 1,
            scanType: 'Detailed',
            landable: true,
          ),
          BodySignalsEvent(
            timestamp: at(1),
            name: 'SAASignalsFound',
            biologicalCount: signals,
            bodyName: 'A 1',
            bodyId: 1,
            systemAddress: here,
          ),
          for (int i = 0; i < analysed; i++)
            ScanOrganicEvent(
              timestamp: at(2 + i),
              scanType: OrganicScanType.analyse,
              genus: r'$Codex_Ent_Stratum_Genus_Name;',
              species: 'espece_$i',
              speciesLocalised: 'Espèce $i',
              systemAddress: here,
              bodyId: 1,
            ),
        ]);

    test('trois signaux, un analysé, il en reste deux', () {
      final SurveyBody body = withSamples(
        signals: 3,
        analysed: 1,
      ).bodies.single;

      expect(body.organismsCompleted, 1);
      expect(body.biologyLeft, 2);
      expect(body.invitesLanding, isTrue);
    });

    test('tout analysé : le corps ne figure plus dans les cibles', () {
      final SystemSurvey result = withSamples(signals: 2, analysed: 2);

      expect(result.bodies.single.biologyLeft, 0);
      expect(result.landingTargets, isEmpty);
      expect(result.biologicalSignalsLeft, 0);
    });

    test('deux échantillons du même organisme ne comptent qu\'une fois', () {
      // Trois `ScanOrganic` font un organisme, pas trois.
      final SystemSurvey result = survey(<JournalEvent>[
        BodySignalsEvent(
          timestamp: at(0),
          name: 'SAASignalsFound',
          biologicalCount: 2,
          bodyName: 'A 1',
          bodyId: 1,
          systemAddress: here,
        ),
        for (final OrganicScanType type in <OrganicScanType>[
          OrganicScanType.log,
          OrganicScanType.sample,
          OrganicScanType.analyse,
        ])
          ScanOrganicEvent(
            timestamp: at(1 + type.index),
            scanType: type,
            genus: r'$Codex_Ent_Stratum_Genus_Name;',
            species: r'$Codex_Ent_Stratum_02_Name;',
            speciesLocalised: 'Stratum Tectonicas',
            systemAddress: here,
            bodyId: 1,
          ),
      ]);

      final SurveyBody body = result.bodies.single;
      expect(body.organismsSampled, 1);
      expect(body.organismsCompleted, 1);
      expect(body.biologyLeft, 1);
    });

    test('un organisme non posable n\'invite pas à l\'atterrissage', () {
      final SystemSurvey result = survey(<JournalEvent>[
        BodyScanEvent(
          timestamp: at(0),
          bodyName: 'A 1',
          systemAddress: here,
          bodyId: 1,
          scanType: 'Detailed',
        ),
        BodySignalsEvent(
          timestamp: at(1),
          name: 'FSSBodySignals',
          biologicalCount: 1,
          bodyName: 'A 1',
          bodyId: 1,
          systemAddress: here,
        ),
      ]);

      expect(result.bodies.single.hasBiology, isTrue);
      expect(result.landingTargets, isEmpty);
    });
  });

  group('les détails qui évitent une fausse joie', () {
    test('un ScanOrganic sans nom de corps garde son identifiant', () {
      // `ScanOrganic` ne porte qu\'un `BodyID`. Sans jointure sur cet id, un
      // organisme échantillonné n\'aurait jamais de corps.
      final SystemSurvey result = survey(<JournalEvent>[
        ScanOrganicEvent(
          timestamp: at(0),
          scanType: OrganicScanType.log,
          genus: r'$Codex_Ent_Stratum_Genus_Name;',
          species: r'$Codex_Ent_Stratum_02_Name;',
          speciesLocalised: 'Stratum Tectonicas',
          systemAddress: here,
          bodyId: 12,
        ),
      ]);

      expect(result.bodies.single.name, 'Corps 12');
      expect(result.bodies.single.bodyId, 12);
    });

    test('une première découverte est signalée', () {
      final SystemSurvey result = survey(<JournalEvent>[
        BodyScanEvent(
          timestamp: at(0),
          bodyName: 'A 1',
          systemAddress: here,
          bodyId: 1,
          scanType: 'Detailed',
          wasDiscovered: false,
          wasMapped: false,
        ),
      ]);

      expect(result.firstDiscoveries, hasLength(1));
      expect(result.bodies.single.firstMapping, isTrue);
    });

    test('les corps sont rendus du plus proche au plus lointain', () {
      final SystemSurvey result = survey(<JournalEvent>[
        BodyScanEvent(
          timestamp: at(0),
          bodyName: 'A 3',
          systemAddress: here,
          bodyId: 3,
          distanceFromArrivalLs: 2400,
        ),
        BodyScanEvent(
          timestamp: at(1),
          bodyName: 'A 1',
          systemAddress: here,
          bodyId: 1,
          distanceFromArrivalLs: 120,
        ),
      ]);

      expect(result.bodies.map((SurveyBody body) => body.name), <String>[
        'A 1',
        'A 3',
      ]);
    });
  });
}
