import 'dart:convert';

import 'package:elite_dangerous/features/route_planning/data/models/spansh_route_dto.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_plan.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_request.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/spansh_route_capture.dart';

/// The request that produced the captured answer.
const RouteRequest _captured = RouteRequest(
  objective: RouteObjective.exobiology,
  fromSystem: 'Sol',
  jumpRangeLy: 50,
  radiusLy: 100,
  maxSystems: 4,
  maxDistanceToArrivalLs: 5000,
  avoidThargoids: true,
);

void main() {
  final DateTime computedAt = DateTime.utc(2026, 9, 3, 13);

  group('RouteRequestForm', () {
    // Spansh drops parameters it does not recognise *without an error*: they
    // simply vanish from the `parameters` echo. A misspelt key therefore
    // yields a plausible route computed with Spansh's defaults — a wrong
    // answer that looks right. These names were read out of Spansh's own web
    // client and confirmed against the live service; this test is what keeps
    // them from drifting.
    test('pins every wire name Spansh actually reads', () {
      final Map<String, dynamic> form = RouteRequestForm.encode(_captured);

      expect(form['from'], 'Sol');
      expect(form['range'], '50');
      expect(form['radius'], '100');
      expect(form['max_results'], '4');
      expect(form['max_distance'], '5000');
      expect(form['avoid_thargoids'], '1');
      expect(form['loop'], '0');
    });

    test('renders whole numbers without a decimal point', () {
      // `range=50.0` is not what their form sends, and this endpoint has no
      // specification to fall back on when it disagrees.
      final Map<String, dynamic> form = RouteRequestForm.encode(_captured);
      expect(form['range'], '50');
      expect(form['range'], isNot(contains('.')));

      final Map<String, dynamic> fractional = RouteRequestForm.encode(
        _captured.copyWith(jumpRangeLy: 62.5),
      );
      expect(fractional['range'], '62.5');
    });

    test('sends booleans as 0 and 1, never true and false', () {
      final Map<String, dynamic> form = RouteRequestForm.encode(
        _captured.copyWith(avoidThargoids: false, loop: true),
      );
      expect(form['avoid_thargoids'], '0');
      expect(form['loop'], '1');
    });

    test('names the destination and the value floor the way the server does',
        () {
      // The two names no test pinned at first, and the gap was not academic:
      // a review pass "corrected" both, and only one of the corrections was
      // right. Settled by asking the live service which names come back in its
      // `parameters` echo — `destination` and `min_value` do, `to` and
      // `minimum_value` are dropped in silence. Reading Spansh's own web
      // client is not enough: it assigns `t.to = this.destination`.
      final Map<String, dynamic> form = RouteRequestForm.encode(
        _captured.copyWith(toSystem: 'Borfor', minValueCr: 3000000),
      );

      expect(form['destination'], 'Borfor');
      expect(form['min_value'], '3000000');
      expect(form.containsKey('to'), isFalse);
      expect(form.containsKey('minimum_value'), isFalse);
    });

    test('omits the optional bounds rather than sending empty values', () {
      const RouteRequest bare = RouteRequest(
        objective: RouteObjective.exobiology,
        fromSystem: 'Sol',
        jumpRangeLy: 50,
        radiusLy: 50,
        maxSystems: 5,
      );
      final Map<String, dynamic> form = RouteRequestForm.encode(bare);

      expect(form.containsKey('to'), isFalse);
      expect(form.containsKey('max_distance'), isFalse);
      expect(form.containsKey('min_value'), isFalse);
    });

    test('sends use_mapping_value only for the riches plotter', () {
      final Map<String, dynamic> exobiology =
          RouteRequestForm.encode(_captured);
      expect(exobiology.containsKey('use_mapping_value'), isFalse);

      final Map<String, dynamic> riches = RouteRequestForm.encode(
        _captured.copyWith(objective: RouteObjective.riches),
      );
      expect(riches['use_mapping_value'], '1');
    });
  });

  group('SpanshRouteJob', () {
    test('reads the queued envelope a POST answers with', () {
      final SpanshRouteJob job = SpanshRouteJob.fromJson(
        <String, dynamic>{'job': 'ABC-123', 'status': 'queued'},
      );
      expect(job.jobId, 'ABC-123');
      expect(job.status, RouteJobStatus.queued);
    });

    test('treats status ok and state completed as the same answer', () {
      expect(
        SpanshRouteJob.fromJson(
          <String, dynamic>{'status': 'ok', 'state': 'completed'},
        ).status,
        RouteJobStatus.completed,
      );
      expect(
        SpanshRouteJob.fromJson(<String, dynamic>{'state': 'completed'}).status,
        RouteJobStatus.completed,
      );
    });

    test('reports an unrecognised answer rather than polling forever', () {
      // An undocumented contract will change one day. Waiting out the full
      // timeout on a state we cannot read is the wrong way to find out.
      expect(
        SpanshRouteJob.fromJson(<String, dynamic>{'status': 'exploded'}).status,
        RouteJobStatus.unknown,
      );
    });
  });

  group('SpanshRouteDto, against a real captured answer', () {
    late RoutePlan plan;

    setUp(() {
      final Map<String, dynamic> payload =
          jsonDecode(spanshExobiologyRouteCapture) as Map<String, dynamic>;
      final RoutePlan? parsed = SpanshRouteDto.fromJson(
        payload,
        jobId: 'job-1',
        request: _captured,
        computedAt: computedAt,
      );
      expect(parsed, isNotNull);
      plan = parsed!;
    });

    test('decodes id64 even though Spansh sends it as a string', () {
      // The single most likely decoding bug on this endpoint, and one that
      // only shows up against a real payload.
      expect(plan.waypoints.first.id64, 10477373803);
      expect(plan.waypoints[1].bodies.first.id64, isPositive);
    });

    test('keeps the waypoints in the order the route flies them', () {
      expect(
        plan.waypoints.map((RouteWaypoint w) => w.name),
        <String>['Sol', 'Borfor', 'Domoirene'],
      );
    });

    test('excludes the departure system from the jump total', () {
      // Spansh reports jumps: 1 for the first waypoint, but the commander is
      // already standing in it. Counting it inflates every route by one jump.
      expect(plan.waypoints.first.jumpsFromPrevious, 1);
      expect(plan.totalJumps, 4); // 2 + 2, not 1 + 2 + 2
      expect(plan.systemCount, 2);
    });

    test('names the species, which is the whole point of this endpoint', () {
      final RouteBody body = plan.waypoints[1].bodies.first;
      expect(body.hasSpecies, isTrue);
      expect(
        body.species.map((RouteSpecies s) => s.species),
        contains('Cactoida Vermis'),
      );

      final RouteSpecies first = body.species.first;
      expect(first.genus, isNotEmpty);
      expect(first.species, startsWith(first.genus));
      expect(first.valueCr, isPositive);
    });

    test('carries the per-body values the screens will total', () {
      final RouteBody body = plan.waypoints[1].bodies.first;
      expect(body.landmarkValueCr, isPositive);
      expect(body.distanceFromArrivalLs, isNotNull);
      expect(plan.totalLandmarkValueCr, greaterThan(0));
      expect(plan.totalBodies, greaterThan(0));
    });

    test('ranks distinct species by value, without repeating any', () {
      final List<RouteSpecies> distinct = plan.distinctSpecies;
      final Set<String> names =
          distinct.map((RouteSpecies s) => s.species).toSet();
      expect(names.length, distinct.length);
      for (int i = 1; i < distinct.length; i++) {
        expect(distinct[i - 1].valueCr,
            greaterThanOrEqualTo(distinct[i].valueCr));
      }
    });

    test('remembers what was asked, so a saved route can explain itself', () {
      expect(plan.request, _captured);
      expect(plan.jobId, 'job-1');
      expect(plan.computedAt, computedAt);
    });
  });

  group('SpanshRouteDto, on payloads that are not routes', () {
    RoutePlan? parse(Map<String, dynamic> json) => SpanshRouteDto.fromJson(
          json,
          jobId: 'job-1',
          request: _captured,
          computedAt: computedAt,
        );

    test('returns null when there is no result array at all', () {
      expect(parse(<String, dynamic>{'status': 'queued'}), isNull);
    });

    test('returns null for an empty route rather than an empty screen', () {
      // "No route" and "a route with nothing on it" must not look alike: one
      // is a failure to display, the other would read as "the galaxy is empty".
      expect(parse(<String, dynamic>{'result': <dynamic>[]}), isNull);
    });

    test('skips a waypoint missing its identity, keeping the rest', () {
      final RoutePlan? plan = parse(<String, dynamic>{
        'result': <dynamic>[
          <String, dynamic>{'name': 'Nameless'}, // no id64
          <String, dynamic>{'id64': '42', 'name': 'Real', 'jumps': 2},
        ],
      });
      expect(plan!.waypoints, hasLength(1));
      expect(plan.waypoints.single.name, 'Real');
    });

    test('drops landmarks a Genetic Sampler cannot touch', () {
      // Spansh mixes life with geysers, wrecks and Lagrange clouds in the same
      // array; a blacklist would let Molluscs through and quote the commander
      // a payout for something they cannot sample.
      final RoutePlan? plan = parse(<String, dynamic>{
        'result': <dynamic>[
          <String, dynamic>{
            'id64': '42',
            'name': 'Test',
            'jumps': 1,
            'bodies': <dynamic>[
              <String, dynamic>{
                'id64': '7',
                'name': 'Test 1 a',
                'landmarks': <dynamic>[
                  <String, dynamic>{
                    'type': 'Stratum',
                    'subtype': 'Stratum Tectonicas',
                    'value': 19010800,
                    'count': 3,
                  },
                  <String, dynamic>{
                    'type': 'Mollusc',
                    'subtype': 'Bulbous Mollusc',
                    'value': 0,
                  },
                  <String, dynamic>{
                    'type': 'Geysers',
                    'subtype': 'Water Geysers',
                    'value': 0,
                  },
                ],
              },
            ],
          },
        ],
      });

      final RouteBody body = plan!.waypoints.single.bodies.single;
      expect(body.species, hasLength(1));
      expect(body.species.single.species, 'Stratum Tectonicas');
      expect(body.species.single.valueCr, 19010800);
    });

    test('translates the genus names that do not match the catalogue', () {
      // `Tubers` is Sinuous Tuber, `Bark Mounds` is Bark Mound, `Shards` is
      // Crystalline Shard. Passing Spansh's spelling straight through would
      // fail to join onto the bundled catalogue.
      final RoutePlan? plan = parse(<String, dynamic>{
        'result': <dynamic>[
          <String, dynamic>{
            'id64': '42',
            'name': 'Test',
            'bodies': <dynamic>[
              <String, dynamic>{
                'id64': '7',
                'name': 'Test 1 a',
                'landmarks': <dynamic>[
                  <String, dynamic>{
                    'type': 'Tubers',
                    'subtype': 'Sinuous Tubers Albidum',
                    'value': 1514500,
                  },
                ],
              },
            ],
          },
        ],
      });

      expect(
        plan!.waypoints.single.bodies.single.species.single.genus,
        'Sinuous Tuber',
      );
    });
  });
}
