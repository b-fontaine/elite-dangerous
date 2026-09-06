import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_plan.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/route_request.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/session_pace.dart';
import 'package:elite_dangerous/features/route_planning/domain/services/route_duration_estimator.dart';
import 'package:elite_dangerous/features/route_planning/domain/services/session_pace_calibrator.dart';
import 'package:flutter_test/flutter_test.dart';

const int _sol = 10477373803;
const int _borfor = 1968982460787;

final DateTime _start = DateTime.utc(2026, 9, 3, 20);
DateTime _at(int seconds) => _start.add(Duration(seconds: seconds));

LocationEvent _jump(int seconds, {int system = _borfor}) => LocationEvent(
      timestamp: _at(seconds),
      name: 'FSDJump',
      starSystem: 'Quelque part',
      systemAddress: system,
    );

SurfaceContactEvent _contact(int seconds, {required bool down}) =>
    SurfaceContactEvent(
      timestamp: _at(seconds),
      name: down ? 'Touchdown' : 'Liftoff',
      onPlanet: true,
      playerControlled: true,
    );

ScanOrganicEvent _scan(int seconds, {int bodyId = 4}) => ScanOrganicEvent(
      timestamp: _at(seconds),
      scanType: OrganicScanType.sample,
      genus: r'$Codex_Ent_Stratum_Genus_Name;',
      species: r'$Codex_Ent_Stratum_02_Name;',
      systemAddress: _borfor,
      bodyId: bodyId,
    );

RoutePlan _plan({
  int stops = 2,
  int bodiesPerStop = 1,
  int speciesPerBody = 2,
  int jumpsPerStop = 2,
}) =>
    RoutePlan(
      jobId: 'JOB-1',
      request: const RouteRequest(
        objective: RouteObjective.exobiology,
        fromSystem: 'Sol',
        jumpRangeLy: 50,
        radiusLy: 100,
        maxSystems: 4,
      ),
      computedAt: _start,
      waypoints: <RouteWaypoint>[
        const RouteWaypoint(
          id64: _sol,
          name: 'Sol',
          x: 0,
          y: 0,
          z: 0,
          jumpsFromPrevious: 1,
        ),
        for (int s = 0; s < stops; s++)
          RouteWaypoint(
            id64: 1000 + s,
            name: 'Étape $s',
            x: 0,
            y: 0,
            z: 0,
            jumpsFromPrevious: jumpsPerStop,
            bodies: <RouteBody>[
              for (int b = 0; b < bodiesPerStop; b++)
                RouteBody(
                  id64: 2000 + s * 10 + b,
                  name: 'Corps $s-$b',
                  species: <RouteSpecies>[
                    for (int e = 0; e < speciesPerBody; e++)
                      RouteSpecies(
                        genus: 'Stratum',
                        species: 'Stratum $e',
                        valueCr: 1000000,
                      ),
                  ],
                ),
            ],
          ),
      ],
    );

void main() {
  const SessionPaceCalibrator calibrate = SessionPaceCalibrator();
  const RouteDurationEstimator estimator = RouteDurationEstimator();

  group('calibration', () {
    test('falls back to defaults, and says so, on an empty journal', () {
      final SessionPace pace = calibrate(const <JournalEvent>[]);

      expect(pace.source, PaceSource.defaults);
      expect(pace.perJump, SessionPace.defaultPerJump);
      expect(pace.isMeasured, isFalse);
    });

    test('measures the time between jumps', () {
      final SessionPace pace = calibrate(<JournalEvent>[
        _jump(0),
        _jump(40),
        _jump(80),
        _jump(120),
      ]);

      expect(pace.perJump, const Duration(seconds: 40));
      expect(pace.jumpObservations, 3);
    });

    test('takes the median, so one coffee break does not set the pace', () {
      // The whole reason this is not a mean: a single interruption would drag
      // an average past anything the commander has ever actually done.
      final SessionPace pace = calibrate(<JournalEvent>[
        _jump(0),
        _jump(40),
        _jump(80),
        _jump(120),
        _jump(120 + 600), // ten minutes away from the desk
      ]);

      expect(pace.perJump, const Duration(seconds: 40));
    });

    test('discards a gap that is somebody living their life', () {
      // Resuming the next morning is not a slow jump.
      final SessionPace pace = calibrate(<JournalEvent>[
        _jump(0),
        _jump(40),
        _jump(80),
        _jump(80 + 36000), // ten hours
        _jump(80 + 36040),
      ]);

      expect(pace.jumpObservations, 3, reason: 'the overnight gap is dropped');
      expect(pace.perJump, const Duration(seconds: 40));
    });

    test('refuses to measure on too few observations', () {
      final SessionPace pace = calibrate(<JournalEvent>[_jump(0), _jump(40)]);

      expect(pace.source, PaceSource.defaults);
      expect(pace.perJump, SessionPace.defaultPerJump);
    });

    test('measures sampling per body, not across bodies', () {
      // Two organisms scanned on different bodies are not two consecutive
      // samples of one; counting the flight between them as a sample would
      // wildly inflate the constant.
      final SessionPace pace = calibrate(<JournalEvent>[
        _scan(0, bodyId: 4),
        _scan(60, bodyId: 4),
        _scan(120, bodyId: 4),
        _scan(500, bodyId: 9), // another body entirely
        _scan(560, bodyId: 9),
      ]);

      expect(pace.perSample, const Duration(seconds: 60));
      expect(pace.sampleObservations, 3);
    });

    test('takes the sampling out of a landing, so it is not counted twice', () {
      // A stay contains the sampling the model already charges separately.
      // Three identical stays: 5 minutes down, three samples of 60 s each.
      final List<JournalEvent> events = <JournalEvent>[];
      for (int stay = 0; stay < 3; stay++) {
        final int base = stay * 1000;
        events
          // A jump between stays: leaving the system ends the run of bodies,
          // so each stay is measured on its own rather than including the
          // flight from the last one.
          ..add(_jump(base - 10))
          ..add(_contact(base, down: true))
          ..add(_scan(base + 60))
          ..add(_scan(base + 120))
          ..add(_scan(base + 180))
          ..add(_contact(base + 300, down: false));
      }

      final SessionPace pace = calibrate(events);

      expect(pace.perSample, const Duration(seconds: 60));
      // 300 s of stay minus 3 × 60 s of sampling = 120 s of manoeuvring.
      expect(pace.perLanding, const Duration(seconds: 120));
    });

    test('subtracts the samples actually taken, not an assumed three', () {
      // A body carrying four species is sampled twelve times. Charging three
      // would leave nine sampling intervals inside the landing constant, which
      // the estimator would then bill a second time on every body.
      final List<JournalEvent> events = <JournalEvent>[];
      for (int stay = 0; stay < 3; stay++) {
        final int base = stay * 2000;
        events.add(_jump(base - 10));
        events.add(_contact(base, down: true));
        for (int sample = 1; sample <= 6; sample++) {
          events.add(_scan(base + sample * 60));
        }
        events.add(_contact(base + 480, down: false));
      }

      final SessionPace pace = calibrate(events);

      // 480 s of stay minus 6 × 60 s of sampling = 120 s.
      expect(pace.perLanding, const Duration(seconds: 120));
    });

    test('counts the descent, not just the time wheels-down', () {
      // A body 1 300 Ls out costs minutes of supercruise before the landing
      // gear touches anything. Measuring from Touchdown would leave that out
      // of every estimate.
      final List<JournalEvent> events = <JournalEvent>[];
      for (int stay = 0; stay < 3; stay++) {
        final int base = stay * 2000;
        events
          ..add(_jump(base - 10))
          ..add(LocationEvent(
            timestamp: _at(base),
            name: 'ApproachBody',
            starSystem: 'Quelque part',
            systemAddress: _borfor,
            bodyName: 'Corps 1',
            bodyId: 4,
          ))
          ..add(_contact(base + 240, down: true))
          ..add(_contact(base + 360, down: false));
      }

      final SessionPace pace = calibrate(events);

      // 360 s from approach to liftoff, no sampling: the whole cycle counts.
      expect(pace.perLanding, const Duration(seconds: 360));
    });

    test('never lets a landing buy time back', () {
      // A commander who lands, samples fast and leaves has a stay shorter than
      // the model's own sampling cost. A negative landing would subtract time
      // from every body of the route.
      final List<JournalEvent> events = <JournalEvent>[];
      for (int stay = 0; stay < 3; stay++) {
        final int base = stay * 1000;
        events
          ..add(_jump(base - 10))
          ..add(_contact(base, down: true))
          ..add(_scan(base + 10))
          ..add(_scan(base + 130))
          ..add(_scan(base + 250))
          ..add(_contact(base + 260, down: false));
      }

      final SessionPace pace = calibrate(events);

      expect(pace.perLanding, greaterThan(Duration.zero));
    });

    test('reports partial measurement rather than pretending', () {
      final SessionPace pace =
          calibrate(<JournalEvent>[_jump(0), _jump(40), _jump(80), _jump(120)]);

      expect(pace.source, PaceSource.partial);
      expect(pace.perLanding, SessionPace.defaultPerLanding,
          reason: 'nothing was landed, so the default stands');
    });
  });

  group('estimating a route', () {
    const SessionPace pace = SessionPace(
      perJump: Duration(seconds: 60),
      perLanding: Duration(minutes: 3),
      perSample: Duration(seconds: 60),
      source: PaceSource.measured,
    );

    test('charges jumps, landings and sampling separately', () {
      final RouteEstimate estimate = estimator.estimate(_plan(), pace);

      // 2 stops × 2 jumps = 4 jumps; 2 bodies; 2 species × 3 samples × 2 bodies
      expect(estimate.jumpCount, 4);
      expect(estimate.bodyCount, 2);
      expect(estimate.sampleCount, 12);
      expect(estimate.jumps, const Duration(minutes: 4));
      expect(estimate.landings, const Duration(minutes: 6));
      expect(estimate.sampling, const Duration(minutes: 12));
      expect(estimate.total, const Duration(minutes: 22));
    });

    test('does not charge for the departure system', () {
      // Spansh reports jumps: 1 on the first waypoint, where the commander
      // already stands. Charging it would add a jump to every route.
      final RouteEstimate estimate = estimator.estimate(_plan(stops: 0), pace);

      expect(estimate.jumpCount, 0);
      expect(estimate.total, Duration.zero);
    });

    test('shows where the time actually goes', () {
      final RouteEstimate estimate = estimator.estimate(_plan(), pace);

      expect(estimate.samplingShare, greaterThan(0.5),
          reason: 'sampling dominates — the argument for fewer, richer bodies');
    });
  });

  group('fitting a session', () {
    const SessionPace pace = SessionPace(
      perJump: Duration(seconds: 60),
      perLanding: Duration(minutes: 3),
      perSample: Duration(seconds: 60),
    );

    test('marks how far the evening gets, without cutting the route', () {
      // Each stop costs 2 min of jumps + 3 min landing + 6 min sampling = 11.
      final SessionReach reach =
          estimator.reach(_plan(stops: 4), pace, const Duration(minutes: 25));

      expect(reach.lastWaypointIndex, 2, reason: 'two stops fit in 22 minutes');
      expect(reach.coversWholeRoute, isFalse);
      expect(reach.estimate.total, lessThanOrEqualTo(const Duration(minutes: 25)));
    });

    test('says so when the whole route fits', () {
      final SessionReach reach =
          estimator.reach(_plan(stops: 2), pace, const Duration(hours: 3));

      expect(reach.coversWholeRoute, isTrue);
      expect(reach.lastWaypointIndex, 2);
    });

    test('leaves the commander somewhere when the budget is absurd', () {
      final SessionReach reach =
          estimator.reach(_plan(stops: 3), pace, const Duration(seconds: 1));

      expect(reach.lastWaypointIndex, 0);
      expect(reach.coversWholeRoute, isFalse);
    });

    test('suggests a system count to start the form with', () {
      final int few = estimator.suggestedSystemCount(pace, const Duration(hours: 1));
      final int more = estimator.suggestedSystemCount(pace, const Duration(hours: 4));

      expect(few, greaterThanOrEqualTo(1));
      expect(more, greaterThan(few));
      expect(more, lessThanOrEqualTo(50));
    });
  });

  group('the accuracy this lot promised', () {
    test('a replayed session lands within 20 % of its real duration', () {
      // A session built the way one really goes: four jumps, two landings, and
      // three samples on each of two species per body. The model is calibrated
      // on that same journal and then asked to price the identical work — it
      // must come back close, or the estimate is decoration.
      LocationEvent approach(int seconds, int bodyId) => LocationEvent(
            timestamp: _at(seconds),
            name: 'ApproachBody',
            starSystem: 'Quelque part',
            systemAddress: _borfor,
            bodyName: 'Corps $bodyId',
            bodyId: bodyId,
          );

      // Three stops. Each: two jumps in, then four bodies worked in turn —
      // approach, land, six samples, lift off, fly to the next.
      final List<JournalEvent> session = <JournalEvent>[];
      int t = 0;
      for (int stop = 0; stop < 3; stop++) {
        session.add(_jump(t));
        t += 70;
        session.add(_jump(t));
        for (int body = 0; body < 4; body++) {
          t += 140; // supercruise to the body
          session.add(approach(t, 4 + body));
          t += 120; // descent
          session.add(_contact(t, down: true));
          for (int sample = 1; sample <= 6; sample++) {
            t += 70;
            session.add(_scan(t, bodyId: 4 + body));
          }
          t += 60; // back to orbit
          session.add(_contact(t, down: false));
        }
        t += 70; // align for the next leg
      }
      final int realSeconds = t - 70;

      final SessionPace pace = calibrate(session);
      expect(pace.source, PaceSource.measured,
          reason: 'all three constants were observable in this session');

      // The same shape as the session: three stops of two jumps, four bodies
      // each, two species per body — six samples a body, as played.
      final RouteEstimate estimate = estimator.estimate(
        _plan(stops: 3, bodiesPerStop: 4, speciesPerBody: 2, jumpsPerStop: 2),
        pace,
      );

      final double error =
          (estimate.total.inSeconds - realSeconds).abs() / realSeconds;
      expect(error, lessThan(0.20),
          reason: 'estimated ${estimate.total.inSeconds}s '
              'against $realSeconds s actually played');
    });
  });
}
