import 'dart:convert';

import 'package:elite_dangerous/core/storage/storage_keys.dart';
import 'package:elite_dangerous/features/route_planning/data/models/route_plan_codec.dart';
import 'package:elite_dangerous/features/route_planning/data/models/spansh_route_dto.dart';
import 'package:elite_dangerous/features/route_planning/data/repositories/active_route_repository_impl.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_plan.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_request.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/in_memory_stores.dart';
import '../../../fixtures/spansh_route_capture.dart';

const RouteRequest _request = RouteRequest(
  objective: RouteObjective.exobiology,
  fromSystem: 'Sol',
  jumpRangeLy: 50,
  radiusLy: 100,
  maxSystems: 4,
  maxDistanceToArrivalLs: 5000,
  minValueCr: 3000000,
  avoidThargoids: true,
  loop: true,
);

/// A plan built from the real captured Spansh answer, so the round trip is
/// exercised on the shape the app will actually store.
RoutePlan _capturedPlan({String jobId = 'JOB-1'}) => SpanshRouteDto.fromJson(
      jsonDecode(spanshExobiologyRouteCapture) as Map<String, dynamic>,
      jobId: jobId,
      request: _request,
      computedAt: DateTime.utc(2026, 9, 3, 13),
    )!;

void main() {
  late InMemoryKeyValueStore store;
  late ActiveRouteRepositoryImpl repository;

  setUp(() {
    store = InMemoryKeyValueStore();
    repository = ActiveRouteRepositoryImpl(store);
  });

  group('RoutePlanCodec', () {
    test('survives a round trip without losing anything', () {
      final RoutePlan original = _capturedPlan();
      final RoutePlan? restored =
          RoutePlanCodec.fromJson(RoutePlanCodec.toJson(original));

      expect(restored, isNotNull);
      expect(restored, original);
      expect(restored!.totalJumps, original.totalJumps);
      expect(restored.totalLandmarkValueCr, original.totalLandmarkValueCr);
      expect(restored.distinctSpecies, original.distinctSpecies);
    });

    test('keeps id64 exact through JSON', () {
      // A body id64 exceeds what a JavaScript number holds exactly, and the web
      // build reads this same document — hence the string on the wire.
      final RoutePlan original = _capturedPlan();
      final String encoded = jsonEncode(RoutePlanCodec.toJson(original));
      final RoutePlan restored = RoutePlanCodec.fromJson(
        jsonDecode(encoded) as Map<String, dynamic>,
      )!;

      expect(restored.waypoints.first.id64, original.waypoints.first.id64);
      final RouteBody body = restored.waypoints[1].bodies.first;
      expect(body.id64, original.waypoints[1].bodies.first.id64);
      expect(body.id64.toString().length, greaterThan(15));
    });

    test('keeps the request, so a stored route can be recomputed', () {
      final RoutePlan restored =
          RoutePlanCodec.fromJson(RoutePlanCodec.toJson(_capturedPlan()))!;

      expect(restored.request, _request);
      expect(restored.request.minValueCr, 3000000);
      expect(restored.request.loop, isTrue);
    });

    test('refuses a document written by another version', () {
      final Map<String, dynamic> json = RoutePlanCodec.toJson(_capturedPlan())
        ..['version'] = RoutePlanCodec.version + 1;

      // Half-reading a route the app does not understand would show the
      // commander a plausible but wrong plan.
      expect(RoutePlanCodec.fromJson(json), isNull);
    });

    test('refuses a document with no usable waypoint', () {
      final Map<String, dynamic> json = RoutePlanCodec.toJson(_capturedPlan())
        ..['waypoints'] = <dynamic>[];
      expect(RoutePlanCodec.fromJson(json), isNull);
    });
  });

  group('the active route', () {
    test('is absent until one is started', () async {
      expect(await repository.readActive(), isNull);
      expect(await repository.archived(), isEmpty);
    });

    test('survives being written and read back', () async {
      final RoutePlan plan = _capturedPlan();
      await repository.setActive(plan);

      expect(await repository.readActive(), plan);
      expect(await store.containsKey(StorageKeys.routeActive), isTrue);
    });

    test('archives the previous route when a new one starts', () async {
      await repository.setActive(_capturedPlan(jobId: 'JOB-1'));
      await repository.setActive(_capturedPlan(jobId: 'JOB-2'));

      expect((await repository.readActive())!.jobId, 'JOB-2');
      final List<RoutePlan> archived = await repository.archived();
      expect(archived.map((RoutePlan p) => p.jobId), <String>['JOB-1']);
    });

    test('re-saving the same route does not archive a copy of itself',
        () async {
      // Saving the active route again is ordinary — a screen refresh, a
      // recomputation. It must not fill the archive with duplicates.
      await repository.setActive(_capturedPlan(jobId: 'JOB-1'));
      await repository.setActive(_capturedPlan(jobId: 'JOB-1'));

      expect(await repository.archived(), isEmpty);
    });

    test('abandoning keeps the route in the archive', () async {
      await repository.setActive(_capturedPlan(jobId: 'JOB-1'));
      await repository.clearActive();

      expect(await repository.readActive(), isNull);
      expect((await repository.archived()).single.jobId, 'JOB-1');
    });

    test('archiving the same job twice keeps one copy, most recent first',
        () async {
      await repository.setActive(_capturedPlan(jobId: 'JOB-1'));
      await repository.clearActive();
      await repository.setActive(_capturedPlan(jobId: 'JOB-2'));
      await repository.clearActive();
      await repository.setActive(_capturedPlan(jobId: 'JOB-1'));
      await repository.clearActive();

      final List<RoutePlan> archived = await repository.archived();
      expect(archived.map((RoutePlan p) => p.jobId), <String>['JOB-1', 'JOB-2']);
    });

    test('caps the archive rather than growing without end', () async {
      for (int i = 0; i < ActiveRouteRepositoryImpl.archiveLimit + 5; i++) {
        await repository.setActive(_capturedPlan(jobId: 'JOB-$i'));
      }
      await repository.clearActive();

      final List<RoutePlan> archived = await repository.archived();
      expect(archived, hasLength(ActiveRouteRepositoryImpl.archiveLimit));
      // Newest kept, oldest dropped.
      expect(archived.first.jobId, 'JOB-${ActiveRouteRepositoryImpl.archiveLimit + 4}');
    });

    test('ignores a stored route it cannot read instead of crashing',
        () async {
      await store.writeJson(
        StorageKeys.routeActive,
        <String, dynamic>{'version': 999, 'jobId': 'JOB-X'},
      );

      expect(await repository.readActive(), isNull);
    });

    test('clear forgets the active route and the archive', () async {
      await repository.setActive(_capturedPlan(jobId: 'JOB-1'));
      await repository.setActive(_capturedPlan(jobId: 'JOB-2'));
      await repository.clear();

      expect(await repository.readActive(), isNull);
      expect(await repository.archived(), isEmpty);
    });
  });
}
