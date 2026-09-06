import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_plan.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_progress.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_request.dart';
import 'package:elite_dangerous/features/route_planning/domain/services/route_progress_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

const int _sol = 10477373803;
const int _borfor = 1968982460787;

const RouteRequest _request = RouteRequest(
  objective: RouteObjective.exobiology,
  fromSystem: 'Sol',
  jumpRangeLy: 50,
  radiusLy: 100,
  maxSystems: 2,
);

RouteSpecies _species(String genus, String species, int value) =>
    RouteSpecies(genus: genus, species: species, valueCr: value);

/// Two stops: Sol with nothing on it, Borfor with one body carrying Stratum
/// Tectonicas and Bacterium Aurasus.
RoutePlan _plan({List<RouteSpecies>? borforSpecies}) => RoutePlan(
      jobId: 'JOB-1',
      request: _request,
      computedAt: DateTime.utc(2026, 9, 3),
      waypoints: <RouteWaypoint>[
        const RouteWaypoint(
          id64: _sol,
          name: 'Sol',
          x: 0,
          y: 0,
          z: 0,
          jumpsFromPrevious: 1,
        ),
        RouteWaypoint(
          id64: _borfor,
          name: 'Borfor',
          x: 10,
          y: 20,
          z: 30,
          jumpsFromPrevious: 2,
          bodies: <RouteBody>[
            RouteBody(
              id64: 900727431097225938,
              name: 'Borfor 1 d',
              landmarkValueCr: 20010800,
              species: borforSpecies ??
                  <RouteSpecies>[
                    _species('Stratum', 'Stratum Tectonicas', 19010800),
                    _species('Bacterium', 'Bacterium Aurasus', 1000000),
                  ],
            ),
          ],
        ),
      ],
    );

DateTime _at(int minute) => DateTime.utc(2026, 9, 3, 12, minute);

/// Arriving in Borfor and scanning the body, which is what teaches the
/// calculator that "Borfor 1 d" is BodyID 4.
List<JournalEvent> _arriveAndScanBody() => <JournalEvent>[
      LocationEvent(
        timestamp: _at(1),
        name: 'FSDJump',
        starSystem: 'Borfor',
        systemAddress: _borfor,
      ),
      BodyScanEvent(
        timestamp: _at(2),
        bodyName: 'Borfor 1 d',
        starSystem: 'Borfor',
        systemAddress: _borfor,
        bodyId: 4,
      ),
    ];

ScanOrganicEvent _sample(
  OrganicScanType type, {
  String genus = r'$Codex_Ent_Stratum_Genus_Name;',
  String species = r'$Codex_Ent_Stratum_02_Name;',
  int bodyId = 4,
  int systemAddress = _borfor,
  required int minute,
}) =>
    ScanOrganicEvent(
      timestamp: _at(minute),
      scanType: type,
      genus: genus,
      species: species,
      systemAddress: systemAddress,
      bodyId: bodyId,
    );

void main() {
  const RouteProgressCalculator calculate = RouteProgressCalculator();

  SpeciesProgress speciesOf(RouteProgress progress, String name) => progress
      .waypoints[1].bodies.single.species
      .firstWhere((SpeciesProgress s) => s.species.species == name);

  group('the route cursor', () {
    test('starts at the departure system with nothing done', () {
      final RouteProgress progress = calculate(_plan(), const <JournalEvent>[]);

      expect(progress.currentIndex, 0);
      expect(progress.jumpsDone, 0);
      expect(progress.jumpsRemaining, 2);
      expect(progress.speciesRemaining, 2);
      expect(progress.remainingValueCr, 20010800);
    });

    test('advances on an FSDJump into a system of the route', () {
      final RouteProgress progress = calculate(_plan(), _arriveAndScanBody());

      expect(progress.waypoints[1].visited, isTrue);
      expect(progress.currentIndex, 1);
      expect(progress.jumpsDone, 2);
      expect(progress.jumpsRemaining, 0);
    });

    test('does not treat a looping route as finished before it starts', () {
      // Spansh loops back to the departure system by default, so the first and
      // last waypoints carry the same id64. Asking "has this system been
      // visited" would mark the last waypoint reached the moment the commander
      // stands in the first — reporting nine jumps as zero remaining.
      final RoutePlan looped = RoutePlan(
        jobId: 'JOB-LOOP',
        request: _request.copyWith(loop: true),
        computedAt: DateTime.utc(2026, 9, 3),
        waypoints: <RouteWaypoint>[
          ..._plan().waypoints,
          const RouteWaypoint(
            id64: _sol,
            name: 'Sol',
            x: 0,
            y: 0,
            z: 0,
            jumpsFromPrevious: 2,
          ),
        ],
      );

      final RouteProgress atDeparture = calculate(
        looped,
        <JournalEvent>[
          LocationEvent(
            timestamp: _at(0),
            name: 'Location',
            starSystem: 'Sol',
            systemAddress: _sol,
          ),
        ],
      );

      expect(atDeparture.currentIndex, 0);
      expect(atDeparture.jumpsRemaining, 4);

      // And it does close once the commander has actually been round.
      final RouteProgress afterLoop = calculate(
        looped,
        <JournalEvent>[
          ..._arriveAndScanBody(),
          LocationEvent(
            timestamp: _at(8),
            name: 'FSDJump',
            starSystem: 'Sol',
            systemAddress: _sol,
          ),
        ],
      );

      expect(afterLoop.currentIndex, 2);
      expect(afterLoop.jumpsRemaining, 0);
    });

    test('never walks backwards when the commander doubles back', () {
      final RouteProgress progress = calculate(
        _plan(),
        <JournalEvent>[
          ..._arriveAndScanBody(),
          LocationEvent(
            timestamp: _at(7),
            name: 'FSDJump',
            starSystem: 'Sol',
            systemAddress: _sol,
          ),
        ],
      );

      expect(progress.currentIndex, 1);
    });

    test('ignores jumps into systems the route does not contain', () {
      final RouteProgress progress = calculate(
        _plan(),
        <JournalEvent>[
          LocationEvent(
            timestamp: _at(1),
            name: 'FSDJump',
            starSystem: 'Ailleurs',
            systemAddress: 999999,
          ),
        ],
      );

      expect(progress.currentIndex, 0);
      expect(progress.jumpsDone, 0);
    });
  });

  group('sampling', () {
    test('counts Log, Sample and Analyse as one, two and three', () {
      RouteProgress after(List<JournalEvent> extra) =>
          calculate(_plan(), <JournalEvent>[..._arriveAndScanBody(), ...extra]);

      expect(
        after(<JournalEvent>[_sample(OrganicScanType.log, minute: 3)])
            .waypoints[1]
            .bodies
            .single
            .species
            .first
            .samplesTaken,
        1,
      );
      expect(
        after(<JournalEvent>[
          _sample(OrganicScanType.log, minute: 3),
          _sample(OrganicScanType.sample, minute: 4),
        ]).waypoints[1].bodies.single.species.first.samplesTaken,
        2,
      );
    });

    test('treats Analyse as the third sample even when the first two are '
        'missing from the import', () {
      // An import that begins mid-organism is ordinary, not exceptional.
      final RouteProgress progress = calculate(
        _plan(),
        <JournalEvent>[
          ..._arriveAndScanBody(),
          _sample(OrganicScanType.analyse, minute: 5),
        ],
      );

      final SpeciesProgress stratum =
          speciesOf(progress, 'Stratum Tectonicas');
      expect(stratum.samplesTaken, 3);
      expect(stratum.isComplete, isTrue);
      expect(progress.speciesAnalysed, 1);
      expect(progress.speciesRemaining, 1);
      expect(progress.remainingValueCr, 1000000);
    });

    test('leaves a body alone when the journal has never named it', () {
      // No Scan event means no name→BodyID mapping — and a body the commander
      // never scanned is a body they cannot have sampled.
      final RouteProgress progress = calculate(
        _plan(),
        <JournalEvent>[
          LocationEvent(
            timestamp: _at(1),
            name: 'FSDJump',
            starSystem: 'Borfor',
            systemAddress: _borfor,
          ),
        ],
      );

      final BodyProgress body = progress.waypoints[1].bodies.single;
      expect(body.isKnownToJournal, isFalse);
      expect(body.species.every((SpeciesProgress s) => s.samplesTaken == 0),
          isTrue);
    });

    test('learns the body number from ApproachBody as well as Scan', () {
      final RouteProgress progress = calculate(
        _plan(),
        <JournalEvent>[
          LocationEvent(
            timestamp: _at(1),
            name: 'ApproachBody',
            starSystem: 'Borfor',
            systemAddress: _borfor,
            bodyName: 'Borfor 1 d',
            bodyId: 4,
          ),
          _sample(OrganicScanType.analyse, minute: 5),
        ],
      );

      expect(progress.waypoints[1].bodies.single.journalBodyId, 4);
      expect(speciesOf(progress, 'Stratum Tectonicas').isComplete, isTrue);
    });

    test('counts sampling it cannot hang on a line rather than dropping it',
        () {
      // Sampling on a body of this route whose name was never seen: the import
      // began after the scan. Silently losing a commander's work is the one
      // error they would notice and could not explain.
      final RouteProgress progress = calculate(
        _plan(),
        <JournalEvent>[
          LocationEvent(
            timestamp: _at(1),
            name: 'FSDJump',
            starSystem: 'Borfor',
            systemAddress: _borfor,
          ),
          _sample(OrganicScanType.analyse, bodyId: 99, minute: 5),
        ],
      );

      expect(progress.unattributedSamples, 1);
      expect(progress.speciesAnalysed, 0);
    });
  });

  group('species attribution', () {
    test('is certain when the genus appears once on the body', () {
      final RouteProgress progress = calculate(_plan(), _arriveAndScanBody());

      expect(
        speciesOf(progress, 'Stratum Tectonicas').attribution,
        SpeciesAttribution.certain,
      );
      expect(progress.ambiguousSpecies, 0);
    });

    test('is flagged when one body carries two species of one genus', () {
      // Real: 59 Virginis 7 g a carries both Tussock Pennata and Tussock Ignis.
      // The journal names organisms by a species token this app cannot
      // translate, so a genus count cannot say which of the two it belongs to.
      final RoutePlan plan = _plan(
        borforSpecies: <RouteSpecies>[
          _species('Tussock', 'Tussock Pennata', 1000000),
          _species('Tussock', 'Tussock Ignis', 1849000),
        ],
      );

      final RouteProgress progress = calculate(
        plan,
        <JournalEvent>[
          ..._arriveAndScanBody(),
          _sample(
            OrganicScanType.analyse,
            genus: r'$Codex_Ent_Tussocks_Genus_Name;',
            species: r'$Codex_Ent_Tussocks_05_Name;',
            minute: 5,
          ),
        ],
      );

      expect(progress.ambiguousSpecies, 2);
      for (final SpeciesProgress species
          in progress.waypoints[1].bodies.single.species) {
        expect(species.attribution, SpeciesAttribution.sharedGenus);
        expect(species.samplesTaken, 3,
            reason: 'three samples of this genus were taken here');
        // But three samples prove one of the two is done, not which — so
        // neither line may close. Declaring both complete would erase a
        // species nobody has touched and inflate the value carried home.
        expect(species.isComplete, isFalse);
      }

      expect(progress.speciesAnalysed, 0);
      expect(progress.speciesRemaining, 2);
      expect(progress.remainingValueCr, 2849000);
      expect(progress.valueAtRiskCr, 0);
    });

    test('closes both lines once the genus has been sampled for both', () {
      final RoutePlan plan = _plan(
        borforSpecies: <RouteSpecies>[
          _species('Tussock', 'Tussock Pennata', 1000000),
          _species('Tussock', 'Tussock Ignis', 1849000),
        ],
      );

      ScanOrganicEvent tussock(OrganicScanType type, int minute) => _sample(
            type,
            genus: r'$Codex_Ent_Tussocks_Genus_Name;',
            species: r'$Codex_Ent_Tussocks_05_Name;',
            minute: minute,
          );

      final RouteProgress progress = calculate(
        plan,
        <JournalEvent>[
          ..._arriveAndScanBody(),
          // Six samples: two complete organisms of the one genus.
          tussock(OrganicScanType.log, 3),
          tussock(OrganicScanType.sample, 4),
          tussock(OrganicScanType.analyse, 5),
          tussock(OrganicScanType.log, 6),
          tussock(OrganicScanType.sample, 7),
          tussock(OrganicScanType.analyse, 8),
        ],
      );

      for (final SpeciesProgress species
          in progress.waypoints[1].bodies.single.species) {
        expect(species.genusSamplesTaken, 6);
        expect(species.isComplete, isTrue);
      }
      expect(progress.speciesAnalysed, 2);
      expect(progress.remainingValueCr, 0);
      expect(progress.valueAtRiskCr, 2849000);
    });
  });

  group('selling', () {
    test('marks a species sold, and stops counting it as at risk', () {
      final List<JournalEvent> events = <JournalEvent>[
        ..._arriveAndScanBody(),
        _sample(OrganicScanType.analyse, minute: 5),
      ];

      final RouteProgress before = calculate(_plan(), events);
      expect(before.valueAtRiskCr, 19010800);
      expect(speciesOf(before, 'Stratum Tectonicas').sold, isFalse);

      final RouteProgress after = calculate(
        _plan(),
        <JournalEvent>[
          ...events,
          SellOrganicDataEvent(
            timestamp: _at(9),
            entries: <SoldBioData>[
              const SoldBioData(
                genus: r'$Codex_Ent_Stratum_Genus_Name;',
                species: 'Stratum Tectonicas',
                valueCr: 19010800,
                bonusCr: 0,
              ),
            ],
          ),
        ],
      );

      expect(speciesOf(after, 'Stratum Tectonicas').sold, isTrue);
      expect(after.valueAtRiskCr, 0);
      // Sold does not mean un-analysed: the work stays done.
      expect(after.speciesAnalysed, 1);
    });
  });

  group('death', () {
    test('does not undo work already paid for', () {
      // Selling banks the credits and the rank. A rebuy screen afterwards
      // cannot put that species back on the to-do list — the commander would
      // be sent to re-sample something they were already paid for.
      final RouteProgress progress = calculate(
        _plan(),
        <JournalEvent>[
          ..._arriveAndScanBody(),
          _sample(OrganicScanType.analyse, minute: 5),
          SellOrganicDataEvent(
            timestamp: _at(6),
            entries: <SoldBioData>[
              const SoldBioData(
                genus: r'$Codex_Ent_Stratum_Genus_Name;',
                species: 'Stratum Tectonicas',
                valueCr: 19010800,
                bonusCr: 0,
              ),
            ],
          ),
          DiedEvent(timestamp: _at(7)),
        ],
      );

      expect(speciesOf(progress, 'Stratum Tectonicas').isComplete, isTrue);
      expect(progress.speciesAnalysed, 1);
      expect(progress.remainingValueCr, 1000000);
      // Sold, so nothing of it is riding on the next rebuy.
      expect(progress.valueAtRiskCr, 0);
    });

    test('wipes sampling that was never sold', () {
      final RouteProgress progress = calculate(
        _plan(),
        <JournalEvent>[
          ..._arriveAndScanBody(),
          _sample(OrganicScanType.analyse, minute: 5),
          DiedEvent(timestamp: _at(6)),
        ],
      );

      expect(progress.speciesAnalysed, 0);
      expect(progress.valueAtRiskCr, 0);
      expect(progress.remainingValueCr, 20010800);
    });
  });

  group('idempotence — the point of deriving instead of storing', () {
    test('importing the same journal twice does not advance the route twice',
        () {
      final List<JournalEvent> once = <JournalEvent>[
        ..._arriveAndScanBody(),
        _sample(OrganicScanType.log, minute: 3),
        _sample(OrganicScanType.sample, minute: 4),
        _sample(OrganicScanType.analyse, minute: 5),
      ];

      final RouteProgress first = calculate(_plan(), once);
      final RouteProgress twice =
          calculate(_plan(), <JournalEvent>[...once, ...once]);

      expect(twice, first);
      expect(twice.speciesAnalysed, 1);
      expect(twice.jumpsDone, 2);
      expect(twice.valueAtRiskCr, 19010800);
    });

    test('the order events arrive in does not change the answer', () {
      final List<JournalEvent> events = <JournalEvent>[
        ..._arriveAndScanBody(),
        _sample(OrganicScanType.log, minute: 3),
        _sample(OrganicScanType.analyse, minute: 5),
      ];

      expect(
        calculate(_plan(), events.reversed.toList()),
        calculate(_plan(), events),
      );
    });
  });
}
