import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_plan.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_request.dart';
import 'package:elite_dangerous/features/route_planning/domain/repositories/active_route_repository.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: Given une route active de deux étapes
///
/// Sol, then two stops carrying one body each. The species and their values are
/// real: Stratum Tectonicas and Bacterium Aurasus, priced as Spansh prices them
/// and as the bundled catalogue agrees.
Future<void> uneRouteActiveDeDeuxEtapes(WidgetTester tester) async {
  final RoutePlan plan = RoutePlan(
    jobId: 'BDD-1',
    request: const RouteRequest(
      objective: RouteObjective.exobiology,
      fromSystem: 'Sol',
      jumpRangeLy: 50,
      radiusLy: 100,
      maxSystems: 2,
    ),
    computedAt: DateTime.utc(2026, 9, 3),
    waypoints: const <RouteWaypoint>[
      RouteWaypoint(
        id64: bddSolAddress,
        name: 'Sol',
        x: 0,
        y: 0,
        z: 0,
        jumpsFromPrevious: 1,
      ),
      RouteWaypoint(
        id64: bddBorforAddress,
        name: 'Borfor',
        x: 10,
        y: 20,
        z: 30,
        jumpsFromPrevious: 2,
        bodies: <RouteBody>[
          RouteBody(
            id64: 900727431097225938,
            name: 'Borfor 1 d',
            landmarkValueCr: 19010800,
            species: <RouteSpecies>[
              RouteSpecies(
                genus: 'Stratum',
                species: 'Stratum Tectonicas',
                valueCr: 19010800,
              ),
            ],
          ),
        ],
      ),
      RouteWaypoint(
        id64: bddTabitAddress,
        name: 'Tabit',
        x: 40,
        y: 50,
        z: 60,
        jumpsFromPrevious: 2,
        bodies: <RouteBody>[
          RouteBody(
            id64: 123456789012345678,
            name: 'Tabit 3 a',
            landmarkValueCr: 1000000,
            species: <RouteSpecies>[
              RouteSpecies(
                genus: 'Bacterium',
                species: 'Bacterium Aurasus',
                valueCr: 1000000,
              ),
            ],
          ),
        ],
      ),
    ],
  );

  await tester.runAsync(
    () => getIt<ActiveRouteRepository>().setActive(plan),
  );
}

const int bddSolAddress = 10477373803;
const int bddBorforAddress = 1968982460787;
const int bddTabitAddress = 938190309739;
