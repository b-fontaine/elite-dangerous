import '../../../journal/domain/entities/journal_event.dart';
import '../entities/session_pace.dart';

/// Learns how fast this commander plays, from their own journal.
///
/// A pure fold, like the rest of the feature. Three measurements, each read off
/// the gaps between events rather than from anything the game states:
///
/// * **A jump** — between two consecutive `FSDJump`s.
/// * **A body** — the whole cycle of working one: from the previous `Liftoff`
///   when there was one, otherwise from `ApproachBody`, otherwise from
///   `Touchdown`, through to this body's `Liftoff` — minus the sampling
///   actually done during it.
///
///   Where that window starts is the difference between a model that works and
///   one that is half right. Measuring only the time wheels-down leaves out the
///   supercruise to a body 1 300 Ls away *and* the flight from the last body to
///   this one; a first attempt at this lot did exactly that and came out 48 %
///   under a replayed session.
/// * **A sample** — between two `ScanOrganic`s on one body.
///
/// **The median, never the mean.** A commander goes to make coffee between two
/// jumps, and a single forty-minute gap would drag an average past anything
/// they have ever done. The median ignores it; an outlier filter then removes
/// the rest, because a session that resumes the next morning leaves a gap of
/// hours that is not a jump at all.
class SessionPaceCalibrator {
  const SessionPaceCalibrator();

  /// Gaps longer than this are somebody living their life, not playing.
  ///
  /// Fifteen minutes is generous for a jump and still far under the shortest
  /// plausible break. It is a filter against interruptions, not a claim about
  /// how long anything takes.
  static const Duration maximumPlausibleGap = Duration(minutes: 15);

  /// Below this many observations a measurement is noise, and the default is
  /// the more honest answer.
  static const int minimumObservations = 3;

  /// A stay longer than this is a commander who stopped playing on a planet,
  /// not a body being worked. Landings are slower than jumps, so this bound is
  /// looser than [maximumPlausibleGap].
  static const Duration maximumStayGap = Duration(minutes: 45);

  SessionPace call(Iterable<JournalEvent> events) {
    final List<JournalEvent> ordered = events.toList()
      ..sort((JournalEvent a, JournalEvent b) =>
          a.timestamp.compareTo(b.timestamp));

    final List<Duration> jumps = <Duration>[];
    // Stay duration paired with how many samples were taken during it, so the
    // sampling the model charges separately can be subtracted exactly rather
    // than assumed to be three.
    final List<(Duration, int)> stays = <(Duration, int)>[];
    final List<Duration> samples = <Duration>[];

    DateTime? lastJump;
    DateTime? approach;
    DateTime? landingStart;
    DateTime? previousLiftoff;
    int samplesDuringStay = 0;
    // Sampling is keyed per body: two organisms scanned on different bodies
    // are not two consecutive samples of one.
    final Map<String, DateTime> lastSampleOnBody = <String, DateTime>{};

    for (final JournalEvent event in ordered) {
      switch (event) {
        case final LocationEvent location when location.name == 'FSDJump':
          _record(jumps, lastJump, location.timestamp);
          lastJump = location.timestamp;
          approach = null;
          // Leaving the system ends the run of bodies: the next one is reached
          // by jumping, which the model charges separately.
          previousLiftoff = null;

        case final LocationEvent location
            when location.name == 'ApproachBody':
          approach = location.timestamp;

        case final LocationEvent location when location.clearsBody:
          approach = null;

        case final SurfaceContactEvent contact
            when contact.carriesCommander && contact.onPlanet:
          if (contact.isTouchdown) {
            // The descent counts when the journal recorded one.
            // The cycle starts where the commander left the previous body:
            // the flight between two bodies of a system is part of what a stop
            // costs, and nothing else in the model charges for it.
            landingStart = previousLiftoff ?? approach ?? contact.timestamp;
            samplesDuringStay = 0;
          } else {
            if (landingStart case final DateTime began) {
              final Duration stay = contact.timestamp.difference(began);
              if (stay > Duration.zero && stay <= maximumStayGap) {
                stays.add((stay, samplesDuringStay));
              }
            }
            landingStart = null;
            approach = null;
            samplesDuringStay = 0;
            previousLiftoff = contact.timestamp;
          }

        case final ScanOrganicEvent scan:
          final String key =
              '${scan.systemAddress ?? '?'}:${scan.bodyId ?? '?'}';
          _record(samples, lastSampleOnBody[key], scan.timestamp);
          lastSampleOnBody[key] = scan.timestamp;
          if (landingStart != null) {
            samplesDuringStay++;
          }

        default:
          break;
      }
    }

    final Duration? perJump = _median(jumps);
    final Duration? perSample = _median(samples);
    // A landing measured from Touchdown to Liftoff includes the sampling done
    // while down there, which the model counts separately. Subtracting it
    // leaves the manoeuvring cost — the part a landing actually contributes.
    final Duration? perLanding = _landingCost(stays, perSample);

    final int measured = <Duration?>[perJump, perLanding, perSample]
        .where((Duration? d) => d != null)
        .length;

    return SessionPace(
      perJump: perJump ?? SessionPace.defaultPerJump,
      perLanding: perLanding ?? SessionPace.defaultPerLanding,
      perSample: perSample ?? SessionPace.defaultPerSample,
      source: switch (measured) {
        3 => PaceSource.measured,
        0 => PaceSource.defaults,
        _ => PaceSource.partial,
      },
      jumpObservations: jumps.length,
      landingObservations: stays.length,
      sampleObservations: samples.length,
    );
  }

  /// Adds the gap between [previous] and [now], unless it is an interruption.
  static void _record(List<Duration> into, DateTime? previous, DateTime now) {
    if (previous == null) {
      return;
    }
    final Duration gap = now.difference(previous);
    if (gap > Duration.zero && gap <= maximumPlausibleGap) {
      into.add(gap);
    }
  }

  /// What a landing costs once the sampling done during it is taken out.
  ///
  /// The subtraction uses the samples actually observed during each stay, not
  /// an assumed three: a body carrying four species is sampled twelve times,
  /// and charging three would leave nine sampling intervals inside the landing
  /// constant — which the estimator would then bill a second time on every
  /// body of the route.
  ///
  /// Floored rather than allowed to go negative: a commander who lands, samples
  /// quickly and leaves has a stay shorter than the model's own sampling cost,
  /// and a negative landing would buy time back on every stop.
  static Duration? _landingCost(List<(Duration, int)> stays, Duration? perSample) {
    if (stays.length < minimumObservations) {
      return null;
    }
    final Duration unit = perSample ?? SessionPace.defaultPerSample;
    final List<Duration> net = <Duration>[
      for (final (Duration stay, int count) in stays)
        stay - unit * count,
    ];
    final Duration? median = _median(net, minimum: 1);
    if (median == null || median <= Duration.zero) {
      return const Duration(seconds: 30);
    }
    return median;
  }

  /// The middle value, or null when there is not enough to be worth trusting.
  static Duration? _median(List<Duration> values, {int? minimum}) {
    if (values.length < (minimum ?? minimumObservations)) {
      return null;
    }
    final List<Duration> sorted = List<Duration>.of(values)
      ..sort((Duration a, Duration b) => a.compareTo(b));
    final int middle = sorted.length ~/ 2;
    if (sorted.length.isOdd) {
      return sorted[middle];
    }
    return Duration(
      microseconds:
          (sorted[middle - 1].inMicroseconds + sorted[middle].inMicroseconds) ~/
              2,
    );
  }
}
