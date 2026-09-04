import 'package:equatable/equatable.dart';

/// How much of the pace was measured rather than assumed.
enum PaceSource {
  /// Every constant came from this commander's own journal.
  measured('Mesuré sur vos sessions'),

  /// Some constants were measured, the rest fell back to defaults.
  partial('Partiellement mesuré'),

  /// Nothing usable in the journal yet: every figure is a default.
  defaults('Estimation par défaut');

  const PaceSource(this.label);

  /// Shown next to any duration built from this pace. The app already
  /// distinguishes what the game said from what it worked out; a time estimate
  /// is squarely in the second category and must say so.
  final String label;
}

/// How fast this commander actually plays.
///
/// Four constants, and every one of them is measured from the commander's own
/// journal rather than assumed. That matters more than it sounds: someone
/// flying a laden Krait on a gamepad and someone in a stripped Diamondback do
/// not share a single one of these figures, and a model built on a stranger's
/// averages would be wrong in both directions at once.
///
/// The defaults below are only what fills the gaps before there is history to
/// learn from. They are conservative — a little slow rather than a little fast,
/// because a route that overruns a session is worse than one that ends early.
class SessionPace extends Equatable {
  const SessionPace({
    this.perJump = defaultPerJump,
    this.perLanding = defaultPerLanding,
    this.perSample = defaultPerSample,
    this.source = PaceSource.defaults,
    this.jumpObservations = 0,
    this.landingObservations = 0,
    this.sampleObservations = 0,
  });

  /// Honk, scoop, align, jump. A minute is a fair unhurried pace.
  static const Duration defaultPerJump = Duration(seconds: 60);

  /// Orbital cruise down, land, and get back up afterwards — the whole cost of
  /// touching one body, excluding what happens on foot.
  static const Duration defaultPerLanding = Duration(minutes: 4);

  /// One of the three samples of an organism: drive or walk far enough to clear
  /// the colony range, then scan.
  static const Duration defaultPerSample = Duration(seconds: 75);

  final Duration perJump;
  final Duration perLanding;
  final Duration perSample;

  final PaceSource source;

  /// How many observations each constant rests on. Surfaced so a screen can
  /// say "measured on four landings" rather than implying a solid average.
  final int jumpObservations;
  final int landingObservations;
  final int sampleObservations;

  bool get isMeasured => source != PaceSource.defaults;

  /// Cost of one body: getting down, sampling three times per species, and
  /// getting back up.
  Duration bodyCost(int speciesCount) =>
      perLanding + perSample * (speciesCount * 3);

  SessionPace copyWith({
    Duration? perJump,
    Duration? perLanding,
    Duration? perSample,
    PaceSource? source,
    int? jumpObservations,
    int? landingObservations,
    int? sampleObservations,
  }) =>
      SessionPace(
        perJump: perJump ?? this.perJump,
        perLanding: perLanding ?? this.perLanding,
        perSample: perSample ?? this.perSample,
        source: source ?? this.source,
        jumpObservations: jumpObservations ?? this.jumpObservations,
        landingObservations: landingObservations ?? this.landingObservations,
        sampleObservations: sampleObservations ?? this.sampleObservations,
      );

  @override
  List<Object?> get props => <Object?>[
        perJump,
        perLanding,
        perSample,
        source,
        jumpObservations,
        landingObservations,
        sampleObservations,
      ];
}

/// What a route is expected to cost, broken down so the figure can be argued
/// with rather than just believed.
class RouteEstimate extends Equatable {
  const RouteEstimate({
    required this.pace,
    this.jumps = Duration.zero,
    this.landings = Duration.zero,
    this.sampling = Duration.zero,
    this.jumpCount = 0,
    this.bodyCount = 0,
    this.sampleCount = 0,
  });

  final SessionPace pace;

  final Duration jumps;
  final Duration landings;
  final Duration sampling;

  final int jumpCount;
  final int bodyCount;
  final int sampleCount;

  Duration get total => jumps + landings + sampling;

  /// Where the time actually goes. Almost always sampling, which is the
  /// argument for a route with fewer, richer bodies rather than more stops.
  double get samplingShare =>
      total == Duration.zero ? 0 : sampling.inSeconds / total.inSeconds;

  @override
  List<Object?> get props => <Object?>[
        pace,
        jumps,
        landings,
        sampling,
        jumpCount,
        bodyCount,
        sampleCount,
      ];
}
