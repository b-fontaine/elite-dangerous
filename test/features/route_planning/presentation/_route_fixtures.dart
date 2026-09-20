/// Fixtures and fakes shared by the follow-screen tests.
///
/// One route, one journal-less commander, and a bridge that answers on
/// command: the bloc test drives them directly, the page test drives them
/// through the real widget tree.
library;

import 'dart:async';

import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/core/stream/initial_then.dart';
import 'package:elite_dangerous/core/time/clock.dart';
import 'package:elite_dangerous/core/usecase/usecase.dart';
import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/journal/domain/usecases/journal_usecases.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_plan.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_progress.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_request.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_state_envelope.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/session_pace.dart';
import 'package:elite_dangerous/features/route_planning/domain/repositories/route_bridge.dart';
import 'package:elite_dangerous/features/route_planning/domain/usecases/route_tracking_usecases.dart';

const int solId = 10477373803;
const int borforId = 1968982460787;

RoutePlan routePlan() => RoutePlan(
      jobId: 'JOB-1',
      request: const RouteRequest(
        objective: RouteObjective.exobiology,
        fromSystem: 'Sol',
        jumpRangeLy: 50,
        radiusLy: 100,
        maxSystems: 2,
      ),
      computedAt: DateTime.utc(2026, 9, 3),
      waypoints: const <RouteWaypoint>[
        RouteWaypoint(id64: solId, name: 'Sol', x: 0, y: 0, z: 0),
        RouteWaypoint(
          id64: borforId,
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
      ],
    );

/// A route on which nothing has been done yet.
RouteProgress freshProgress(RoutePlan plan) => RouteProgress(
      plan: plan,
      waypoints: plan.waypoints
          .map(
            (RouteWaypoint waypoint) => WaypointProgress(
              waypoint: waypoint,
              bodies: waypoint.bodies
                  .map(
                    (RouteBody body) => BodyProgress(
                      body: body,
                      species: body.species
                          .map(
                            (RouteSpecies species) => SpeciesProgress(
                              species: species,
                              samplesTaken: 0,
                              attribution: SpeciesAttribution.certain,
                            ),
                          )
                          .toList(growable: false),
                    ),
                  )
                  .toList(growable: false),
            ),
          )
          .toList(growable: false),
    );

/// A bridge client that answers on command and counts what it was asked.
class FakeBridge implements RouteBridgeClient {
  BridgePairing? paired;
  Result<RouteStateEnvelope?> answer =
      const Result<RouteStateEnvelope?>.ok(null);
  int reads = 0;

  /// When set, a read hangs until the test completes it — the only way to have
  /// a slow answer land after a newer one, which is what happens when the PC is
  /// asleep and the commander unpairs while the timeout runs.
  Completer<void>? hold;

  @override
  Future<BridgePairing?> pairing() async => paired;

  @override
  Future<void> pair(BridgePairing pairing) async => paired = pairing;

  @override
  Future<void> unpair() async => paired = null;

  /// Never called: the follow screen reads decoded routes, and a fake that
  /// throws here is what proves it.
  @override
  Future<Result<Map<String, dynamic>>> fetchState() async =>
      throw UnimplementedError();

  @override
  Future<Result<RouteStateEnvelope?>> readRoute() async {
    reads++;
    if (hold case final Completer<void> pending) {
      await pending.future;
    }
    return answer;
  }
}

class FakeTrack implements TrackActiveRoute {
  FakeTrack(this.progress);

  RouteProgress? progress;
  int calls = 0;

  @override
  Future<Result<RouteProgress?>> call(NoParams input) async {
    calls++;
    return Result<RouteProgress?>.ok(progress);
  }
}

class FakePace implements MeasureSessionPace {
  const FakePace(this.pace);

  final SessionPace pace;

  @override
  Future<Result<SessionPace>> call(NoParams input) async =>
      Result<SessionPace>.ok(pace);
}

class FakeAbandon implements AbandonRoute {
  int calls = 0;

  @override
  Future<void> call() async => calls++;
}

class FixedClock implements Clock {
  FixedClock(this.instant);

  DateTime instant;

  @override
  DateTime now() => instant;
}

/// Stands in for the journal's own change stream.
///
/// Mirrors what [JournalRepositoryImpl.watchEvents] actually does — an
/// immediate catch-up value on subscription, then one emission per call to
/// [notifyNewLines] — so a test exercising the bloc's `skip(1)` sees the same
/// shape of stream the real one produces.
class FakeWatchJournalEvents implements WatchJournalEvents {
  final StreamController<List<JournalEvent>> _controller =
      StreamController<List<JournalEvent>>.broadcast();

  void notifyNewLines() => _controller.add(const <JournalEvent>[]);

  @override
  Stream<List<JournalEvent>> call(NoParams input) => initialThen(
        () async => const <JournalEvent>[],
        _controller.stream,
      );
}

