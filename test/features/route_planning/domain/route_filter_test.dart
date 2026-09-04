import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/done_index.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/filtered_route.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_plan.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_request.dart';
import 'package:elite_dangerous/features/route_planning/domain/services/done_index_builder.dart';
import 'package:elite_dangerous/features/route_planning/domain/services/route_filter.dart';
import 'package:elite_dangerous/features/route_planning/domain/services/route_progress_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

const int _sol = 10477373803;
const int _borfor = 1968982460787;
const int _tabit = 938190309739;

RouteSpecies _species(String genus, String species, int value) =>
    RouteSpecies(genus: genus, species: species, valueCr: value);

/// Sol (departure, empty) → Borfor (one body, two species) → Tabit (one body).
RoutePlan _plan({RouteObjective objective = RouteObjective.exobiology}) =>
    RoutePlan(
      jobId: 'JOB-1',
      request: RouteRequest(
        objective: objective,
        fromSystem: 'Sol',
        jumpRangeLy: 50,
        radiusLy: 100,
        maxSystems: 3,
      ),
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
              estimatedScanValueCr: 500,
              estimatedMappingValueCr: 2221,
              species: <RouteSpecies>[
                _species('Stratum', 'Stratum Tectonicas', 19010800),
                _species('Bacterium', 'Bacterium Aurasus', 1000000),
              ],
            ),
          ],
        ),
        RouteWaypoint(
          id64: _tabit,
          name: 'Tabit',
          x: 40,
          y: 50,
          z: 60,
          jumpsFromPrevious: 2,
          bodies: <RouteBody>[
            RouteBody(
              id64: 123456789012345678,
              name: 'Tabit 3 a',
              landmarkValueCr: 7774700,
              estimatedScanValueCr: 900,
              estimatedMappingValueCr: 3300,
              species: <RouteSpecies>[
                _species('Frutexa', 'Frutexa Acus', 7774700),
              ],
            ),
          ],
        ),
      ],
    );

DateTime _at(int minute) => DateTime.utc(2026, 9, 3, 12, minute);

/// Arrive at Borfor, scan the body, and analyse both of its species.
List<JournalEvent> _finishBorfor() => <JournalEvent>[
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
      ScanOrganicEvent(
        timestamp: _at(3),
        scanType: OrganicScanType.analyse,
        genus: r'$Codex_Ent_Stratum_Genus_Name;',
        species: r'$Codex_Ent_Stratum_02_Name;',
        systemAddress: _borfor,
        bodyId: 4,
      ),
      ScanOrganicEvent(
        timestamp: _at(4),
        scanType: OrganicScanType.analyse,
        genus: r'$Codex_Ent_Bacterial_Genus_Name;',
        species: r'$Codex_Ent_Bacterial_01_Name;',
        systemAddress: _borfor,
        bodyId: 4,
      ),
    ];

void main() {
  const RouteProgressCalculator calculate = RouteProgressCalculator();
  const DoneIndexBuilder buildIndex = DoneIndexBuilder();
  const RouteFilter filter = RouteFilter();

  FilteredRoute run(
    List<JournalEvent> events, {
    RouteObjective objective = RouteObjective.exobiology,
  }) {
    final RoutePlan plan = _plan(objective: objective);
    return filter(plan, calculate(plan, events), buildIndex(events));
  }

  group('an untouched route', () {
    test('is returned whole, with nothing removed', () {
      final FilteredRoute result = run(const <JournalEvent>[]);

      expect(result.changedAnything, isFalse);
      expect(result.filtered.waypoints, hasLength(3));
      expect(result.filtered.totalLandmarkValueCr, 27785500);
      expect(result.isExhausted, isFalse);
    });
  });

  group('exobiology', () {
    test('drops a body whose every species is analysed, and says so', () {
      // The proof this lot was written for.
      final FilteredRoute result = run(_finishBorfor());

      expect(result.removedBodies, 1);
      final RouteRemoval removal = result.removals
          .firstWhere((RouteRemoval r) => r.bodyName == 'Borfor 1 d');
      expect(removal.reason, RemovalReason.allSpeciesAnalysed);
      expect(removal.valueCr, 20010800);
      expect(removal.systemName, 'Borfor');

      // Borfor had only that body, so the stop goes too — and Tabit stays.
      expect(
        result.filtered.waypoints.map((RouteWaypoint w) => w.name),
        <String>['Sol', 'Tabit'],
      );
      expect(result.filtered.totalLandmarkValueCr, 7774700);
    });

    test('keeps a body whose species are only half done', () {
      final FilteredRoute result = run(<JournalEvent>[
        ..._finishBorfor().take(3), // Stratum analysed, Bacterium untouched
      ]);

      expect(result.changedAnything, isFalse);
      expect(result.filtered.waypoints, hasLength(3));
    });

    test('does not drop a shared genus on partial evidence', () {
      // Three samples prove one of two same-genus species is done, not which.
      // Dropping the body here would erase a species nobody has touched.
      final RoutePlan plan = RoutePlan(
        jobId: 'JOB-2',
        request: _plan().request,
        computedAt: DateTime.utc(2026, 9, 3),
        waypoints: <RouteWaypoint>[
          _plan().waypoints.first,
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
                landmarkValueCr: 2849000,
                species: <RouteSpecies>[
                  _species('Tussock', 'Tussock Pennata', 1000000),
                  _species('Tussock', 'Tussock Ignis', 1849000),
                ],
              ),
            ],
          ),
        ],
      );

      final List<JournalEvent> events = <JournalEvent>[
        ..._finishBorfor().take(2),
        ScanOrganicEvent(
          timestamp: _at(3),
          scanType: OrganicScanType.analyse,
          genus: r'$Codex_Ent_Tussocks_Genus_Name;',
          species: r'$Codex_Ent_Tussocks_05_Name;',
          systemAddress: _borfor,
          bodyId: 4,
        ),
      ];

      final FilteredRoute result =
          filter(plan, calculate(plan, events), buildIndex(events));

      expect(result.changedAnything, isFalse);
      expect(result.filtered.waypoints.last.bodies, hasLength(1));
    });

    test('drops a body Spansh listed with no sampleable species', () {
      final RoutePlan plan = RoutePlan(
        jobId: 'JOB-3',
        request: _plan().request,
        computedAt: DateTime.utc(2026, 9, 3),
        waypoints: <RouteWaypoint>[
          _plan().waypoints.first,
          const RouteWaypoint(
            id64: _borfor,
            name: 'Borfor',
            x: 10,
            y: 20,
            z: 30,
            jumpsFromPrevious: 2,
            bodies: <RouteBody>[
              RouteBody(id64: 7, name: 'Borfor 2', landmarkValueCr: 0),
            ],
          ),
        ],
      );

      final FilteredRoute result =
          filter(plan, calculate(plan, const <JournalEvent>[]), DoneIndex.empty);

      expect(result.removals.single.reason, RemovalReason.nothingToDo);
    });
  });

  group('exploration', () {
    test('drops a body already mapped, which exobiology would have kept', () {
      final List<JournalEvent> events = <JournalEvent>[
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
        SurfaceMappedEvent(
          timestamp: _at(3),
          bodyName: 'Borfor 1 d',
          systemAddress: _borfor,
          bodyId: 4,
          probesUsed: 5,
          efficiencyTarget: 7,
        ),
      ];

      final FilteredRoute riches =
          run(events, objective: RouteObjective.riches);
      final RouteRemoval removal = riches.removals
          .firstWhere((RouteRemoval r) => r.bodyName == 'Borfor 1 d');
      expect(removal.reason, RemovalReason.bodyAlreadyMapped);
      // Value reported is the scan+mapping one, not the biological one.
      expect(removal.valueCr, 2721);

      // The same journal leaves an exobiology route untouched: mapping a
      // surface says nothing about having sampled what grows on it.
      expect(run(events).changedAnything, isFalse);
    });
  });

  group('systems already visited', () {
    test('are reported but never removed', () {
      // Having flown through a system says nothing about having sampled it.
      // Dropping a stop on that basis would delete the best body of the route
      // because the commander once refuelled there.
      final FilteredRoute result = run(<JournalEvent>[
        LocationEvent(
          timestamp: _at(1),
          name: 'FSDJump',
          starSystem: 'Tabit',
          systemAddress: _tabit,
        ),
      ]);

      expect(result.revisitedSystems, contains('Tabit'));
      expect(result.changedAnything, isFalse);
      expect(result.filtered.waypoints, hasLength(3));
    });
  });

  group('the endpoints of a route', () {
    test('survive even when nothing is left to do there', () {
      // The departure waypoint is where the commander stands, and the last one
      // is home on a loop. Removing either leaves a route that starts nowhere
      // or never comes back.
      final FilteredRoute result = run(_finishBorfor());

      expect(result.filtered.waypoints.first.name, 'Sol');
      expect(result.filtered.waypoints.first.bodies, isEmpty);
    });

    test('leave a fully-done route readable rather than blank', () {
      final List<JournalEvent> events = <JournalEvent>[
        ..._finishBorfor(),
        LocationEvent(
          timestamp: _at(5),
          name: 'FSDJump',
          starSystem: 'Tabit',
          systemAddress: _tabit,
        ),
        BodyScanEvent(
          timestamp: _at(6),
          bodyName: 'Tabit 3 a',
          starSystem: 'Tabit',
          systemAddress: _tabit,
          bodyId: 9,
        ),
        ScanOrganicEvent(
          timestamp: _at(7),
          scanType: OrganicScanType.analyse,
          genus: r'$Codex_Ent_Shrubs_Genus_Name;',
          species: r'$Codex_Ent_Shrubs_01_Name;',
          systemAddress: _tabit,
          bodyId: 9,
        ),
      ];

      final FilteredRoute result = run(events);

      expect(result.isExhausted, isTrue);
      expect(result.removedBodies, 2);
      expect(result.removedValueCr, 27785500);
      expect(result.filtered.waypoints, isNotEmpty);
    });
  });

  group('idempotence', () {
    test('filtering twice gives the same route', () {
      final List<JournalEvent> events = _finishBorfor();
      expect(run(events), run(<JournalEvent>[...events, ...events]));
    });
  });
}
