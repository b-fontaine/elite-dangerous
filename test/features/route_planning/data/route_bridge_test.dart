import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/core/time/clock.dart';
import 'package:elite_dangerous/core/usecase/usecase.dart';
import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/route_planning/data/models/route_state_codec.dart';
import 'package:elite_dangerous/features/route_planning/data/repositories/http_route_bridge_client.dart';
import 'package:elite_dangerous/features/route_planning/data/repositories/local_route_bridge_host.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_plan.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_progress.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_request.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_state_envelope.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/session_pace.dart';
import 'package:elite_dangerous/features/route_planning/domain/repositories/route_bridge.dart';
import 'package:elite_dangerous/features/route_planning/domain/services/route_progress_calculator.dart';
import 'package:elite_dangerous/features/route_planning/domain/usecases/route_tracking_usecases.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/in_memory_stores.dart';

const int _sol = 10477373803;
const int _borfor = 1968982460787;

RoutePlan _plan() => RoutePlan(
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
        RouteWaypoint(
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

/// A journal in which the commander reached Borfor and finished its species.
List<JournalEvent> _worked() => <JournalEvent>[
      LocationEvent(
        timestamp: DateTime.utc(2026, 9, 3, 20, 1),
        name: 'FSDJump',
        starSystem: 'Borfor',
        systemAddress: _borfor,
      ),
      BodyScanEvent(
        timestamp: DateTime.utc(2026, 9, 3, 20, 2),
        bodyName: 'Borfor 1 d',
        systemAddress: _borfor,
        bodyId: 4,
      ),
      ScanOrganicEvent(
        timestamp: DateTime.utc(2026, 9, 3, 20, 5),
        scanType: OrganicScanType.analyse,
        genus: r'$Codex_Ent_Stratum_Genus_Name;',
        species: r'$Codex_Ent_Stratum_02_Name;',
        systemAddress: _borfor,
        bodyId: 4,
      ),
    ];

/// A tracker that answers from a fixed journal, standing in for the disk.
class _FakeTrack implements TrackActiveRoute {
  _FakeTrack(this.progress);

  RouteProgress? progress;
  int calls = 0;

  @override
  Future<Result<RouteProgress?>> call(NoParams input) async {
    calls++;
    return Result<RouteProgress?>.ok(progress);
  }
}

class _FakePace implements MeasureSessionPace {
  const _FakePace(this.pace);

  final SessionPace pace;

  @override
  Future<Result<SessionPace>> call(NoParams input) async =>
      Result<SessionPace>.ok(pace);
}

class _FixedClock implements Clock {
  const _FixedClock(this._now);

  final DateTime _now;

  @override
  DateTime now() => _now;
}

void main() {
  const RouteProgressCalculator calculate = RouteProgressCalculator();
  final DateTime publishedAt = DateTime.utc(2026, 9, 3, 20, 30);

  group('BridgePairing', () {
    test('round-trips through the code the commander types', () {
      const BridgePairing pairing =
          BridgePairing(host: '192.168.1.24', port: 8420, token: 'k7m2xq9p');

      expect(pairing.code, '192.168.1.24:8420/k7m2xq9p');
      final BridgePairing parsed = BridgePairing.parse(pairing.code)!;
      expect(parsed.host, '192.168.1.24');
      expect(parsed.port, 8420);
      expect(parsed.token, 'k7m2xq9p');
      expect(parsed.stateUri.queryParameters['token'], 'k7m2xq9p');
    });

    test('refuses something that is not a pairing code', () {
      expect(BridgePairing.parse('bonjour'), isNull);
      expect(BridgePairing.parse('192.168.1.24:8420'), isNull);
      expect(BridgePairing.parse('192.168.1.24/token'), isNull);
      expect(BridgePairing.parse(''), isNull);
    });
  });

  group('RouteStateCodec', () {
    test('carries the progress a second screen needs', () {
      final RouteProgress progress = calculate(_plan(), _worked());
      final RouteStateEnvelope? restored = RouteStateCodec.fromJson(
        jsonDecode(
          jsonEncode(
            RouteStateCodec.toJson(
              RouteStateEnvelope(
                progress: progress,
                pace: const SessionPace(source: PaceSource.measured),
                publishedAt: publishedAt,
              ),
            ),
          ),
        ) as Map<String, dynamic>,
      );

      expect(restored, isNotNull);
      expect(restored!.progress.speciesAnalysed, progress.speciesAnalysed);
      expect(restored.progress.jumpsDone, progress.jumpsDone);
      expect(restored.progress.valueAtRiskCr, progress.valueAtRiskCr);
      expect(restored.progress.remainingValueCr, progress.remainingValueCr);
      expect(restored.publishedAt, publishedAt);
      expect(restored.pace.source, PaceSource.measured);
    });

    test('rebuilds the plan rather than trusting a second copy of it', () {
      // The species names and values live in the plan only; the progress
      // carries what the journal added. Two copies could disagree.
      final RouteProgress progress = calculate(_plan(), _worked());
      final Map<String, dynamic> json = RouteStateCodec.toJson(
        RouteStateEnvelope(
          progress: progress,
          pace: const SessionPace(),
          publishedAt: publishedAt,
        ),
      );

      // The species name appears once, in the plan — not a second time in the
      // progress, where the two copies could drift apart.
      expect(
        'Stratum Tectonicas'.allMatches(jsonEncode(json)).length,
        1,
      );
      final RouteStateEnvelope restored = RouteStateCodec.fromJson(json)!;
      expect(
        restored.progress.waypoints[1].bodies.single.species.single.species
            .species,
        'Stratum Tectonicas',
      );
    });

    test('refuses a state whose waypoints do not match its plan', () {
      // A truncated message would render as a shorter route, which reads as
      // progress rather than as a broken transfer.
      final Map<String, dynamic> json = RouteStateCodec.toJson(
        RouteStateEnvelope(
          progress: calculate(_plan(), _worked()),
          pace: const SessionPace(),
          publishedAt: publishedAt,
        ),
      )..['waypoints'] = <dynamic>[];

      expect(RouteStateCodec.fromJson(json), isNull);
    });

    test('refuses a version it does not know', () {
      final Map<String, dynamic> json = RouteStateCodec.toJson(
        RouteStateEnvelope(
          progress: calculate(_plan(), _worked()),
          pace: const SessionPace(),
          publishedAt: publishedAt,
        ),
      )..['version'] = 99;

      expect(RouteStateCodec.fromJson(json), isNull);
    });
  });

  group('a real host and a real client', () {
    late LocalRouteBridgeHost host;
    late _FakeTrack track;
    late InMemoryKeyValueStore store;
    late HttpRouteBridgeClient client;

    setUp(() {
      track = _FakeTrack(calculate(_plan(), _worked()));
      host = LocalRouteBridgeHost(
        track,
        const _FakePace(SessionPace(source: PaceSource.measured)),
        _FixedClock(publishedAt),
      );
      store = InMemoryKeyValueStore();
      client = HttpRouteBridgeClient(store);
    });

    tearDown(() => host.stop());

    test('the second screen shows what the game machine knows', () async {
      // The proof this lot exists for, end to end: a socket really opened, a
      // request really made, and the same figures on both sides.
      final Result<BridgePairing> started = await host.start(port: 0);
      expect(started.isSuccess, isTrue, reason: started.failureOrNull?.message);

      final BridgePairing pairing = started.valueOrNull!;
      await client.pair(
        BridgePairing(
          // The host reports the address a phone would use; this test talks to
          // it over loopback, which is the same server.
          host: '127.0.0.1',
          port: pairing.port,
          token: pairing.token,
        ),
      );

      final Result<Map<String, dynamic>> fetched = await client.fetchState();
      expect(fetched.isSuccess, isTrue, reason: fetched.failureOrNull?.message);

      final RouteStateEnvelope envelope =
          RouteStateCodec.fromJson(fetched.valueOrNull!)!;
      final RouteProgress local = track.progress!;

      expect(envelope.progress.jumpsDone, local.jumpsDone);
      expect(envelope.progress.speciesAnalysed, local.speciesAnalysed);
      expect(envelope.progress.valueAtRiskCr, local.valueAtRiskCr);
      expect(envelope.publishedAt, publishedAt);
    });

    test('refuses a wrong token instead of serving the route', () async {
      final BridgePairing pairing = (await host.start(port: 0)).valueOrNull!;
      await client.pair(
        BridgePairing(host: '127.0.0.1', port: pairing.port, token: 'faux'),
      );

      final Result<Map<String, dynamic>> fetched = await client.fetchState();

      expect(fetched.isFailure, isTrue);
      expect(fetched.failureOrNull!.message, contains('Jeton refusé'));
    });

    test('answers "no route" without calling it a failure', () async {
      track.progress = null;
      final BridgePairing pairing = (await host.start(port: 0)).valueOrNull!;
      await client.pair(
        BridgePairing(
          host: '127.0.0.1',
          port: pairing.port,
          token: pairing.token,
        ),
      );

      final Result<Map<String, dynamic>> fetched = await client.fetchState();

      expect(fetched.isSuccess, isTrue);
      expect(fetched.valueOrNull, isEmpty);
    });

    test('a stopped host reads as unreachable, not as an empty route',
        () async {
      // The other half of the promise: when the game machine goes to sleep the
      // phone must say so rather than quietly show a route with nothing done.
      final BridgePairing pairing = (await host.start(port: 0)).valueOrNull!;
      await client.pair(
        BridgePairing(
          host: '127.0.0.1',
          port: pairing.port,
          token: pairing.token,
        ),
      );
      await host.stop();

      final Result<Map<String, dynamic>> fetched = await client.fetchState();

      expect(fetched.isFailure, isTrue);
      expect(host.isRunning, isFalse);
      expect(host.pairing, isNull);
    });

    test('a fresh start issues a fresh token', () async {
      final BridgePairing first = (await host.start(port: 0)).valueOrNull!;
      final BridgePairing second = (await host.start(port: 0)).valueOrNull!;

      expect(second.token, isNot(first.token));
      expect(host.isRunning, isTrue);
    });

    test('an unpaired device says so rather than reaching out', () async {
      final Result<Map<String, dynamic>> fetched = await client.fetchState();

      expect(fetched.isFailure, isTrue);
      expect(fetched.failureOrNull!.message, contains('Aucun appareil'));
    });

    test('the pairing survives being written and read back', () async {
      const BridgePairing pairing =
          BridgePairing(host: '10.0.0.5', port: 8420, token: 'abcd1234');
      await client.pair(pairing);

      final BridgePairing? read = await client.pairing();
      expect(read!.code, pairing.code);

      await client.unpair();
      expect(await client.pairing(), isNull);
    });

    test('decodes the route the follow screen will show', () async {
      final BridgePairing pairing = (await host.start(port: 0)).valueOrNull!;
      await client.pair(
        BridgePairing(
          host: '127.0.0.1',
          port: pairing.port,
          token: pairing.token,
        ),
      );

      final Result<RouteStateEnvelope?> read = await client.readRoute();

      expect(read.isSuccess, isTrue, reason: read.failureOrNull?.message);
      expect(read.valueOrNull!.publishedAt, publishedAt);
      expect(
        read.valueOrNull!.progress.speciesAnalysed,
        track.progress!.speciesAnalysed,
      );
    });

    test('decodes "no route" as no route, not as a failure', () async {
      // The screen tells these two apart, so the client must too: this one
      // reads as "the PC is on and flying nothing".
      track.progress = null;
      final BridgePairing pairing = (await host.start(port: 0)).valueOrNull!;
      await client.pair(
        BridgePairing(
          host: '127.0.0.1',
          port: pairing.port,
          token: pairing.token,
        ),
      );

      final Result<RouteStateEnvelope?> read = await client.readRoute();

      expect(read.isSuccess, isTrue);
      expect(read.valueOrNull, isNull);
    });

    test('a stopped host is a network failure, not a decoding one', () async {
      final BridgePairing pairing = (await host.start(port: 0)).valueOrNull!;
      await client.pair(
        BridgePairing(
          host: '127.0.0.1',
          port: pairing.port,
          token: pairing.token,
        ),
      );
      await host.stop();

      final Result<RouteStateEnvelope?> unreachable = await client.readRoute();

      expect(unreachable.isFailure, isTrue);
      expect(unreachable.failureOrNull, isA<NetworkFailure>());
    });

    test('a stale token is named for what it is', () async {
      // The second most likely failure after a firewall: the commander relaunched
      // the share, and the phone still holds the old code.
      final BridgePairing pairing = (await host.start(port: 0)).valueOrNull!;
      await client.pair(
        BridgePairing(host: '127.0.0.1', port: pairing.port, token: 'perime'),
      );

      final Result<RouteStateEnvelope?> read = await client.readRoute();

      expect(read.isFailure, isTrue);
      expect(read.failureOrNull, isA<UnauthorizedFailure>());
      expect(read.failureOrNull!.message, contains('Jeton refusé'));
    });

    test('a host on another version is a decoding failure, not a dead socket',
        () async {
      // Blaming the network here would send the commander to their firewall
      // for a problem that is on neither end of it. A hand-rolled server
      // rather than the real host, because the real one cannot be made to
      // publish a schema it does not have.
      final HttpServer stranger =
          await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      addTearDown(() => stranger.close(force: true));
      unawaited(
        stranger.forEach((HttpRequest request) async {
          request.response
            ..statusCode = HttpStatus.ok
            ..headers.contentType = ContentType.json
            ..write(jsonEncode(<String, dynamic>{'version': 99}));
          await request.response.close();
        }).catchError((Object _) {}),
      );
      await client.pair(
        BridgePairing(
          host: '127.0.0.1',
          port: stranger.port,
          token: 'peu-importe',
        ),
      );

      final Result<RouteStateEnvelope?> read = await client.readRoute();

      expect(read.isFailure, isTrue);
      expect(read.failureOrNull, isA<ParsingFailure>());
      expect(read.failureOrNull!.message, contains('même version'));
    });
  });
}
