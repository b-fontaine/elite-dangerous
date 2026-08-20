import 'package:equatable/equatable.dart';

import 'journal_event.dart';

/// One body of the system the commander is standing in, and what is left to do
/// on it.
class SurveyBody extends Equatable {
  const SurveyBody({
    required this.name,
    this.bodyId,
    this.scan,
    this.biologicalSignals,
    this.genusNames = const <String>[],
    this.mapped = false,
    this.firstDiscovery = false,
    this.firstMapping = false,
    this.organismsSampled = 0,
    this.organismsCompleted = 0,
    this.distanceFromArrivalLs,
  });

  /// The name the game shows, or `Corps 12` when only an id was ever seen —
  /// `ScanOrganic` carries a `BodyID` and no name at all.
  final String name;

  final int? bodyId;

  /// The `Scan` this body got, if any. Its absence is itself the finding: an
  /// unscanned body is one the FSS has not been pointed at.
  final BodyScanEvent? scan;

  /// Biological signals, from the FSS or — better — from the DSS.
  final int? biologicalSignals;

  /// The genera the DSS named. Empty until the body is mapped.
  final List<String> genusNames;

  /// Mapped with the Detailed Surface Scanner.
  final bool mapped;

  /// Nobody had scanned this body before: the sale carries the discovery
  /// bonus.
  final bool firstDiscovery;

  /// Nobody had mapped it: the mapping bonus is still on the table.
  final bool firstMapping;

  /// Organisms with at least one sample taken here.
  final int organismsSampled;

  /// Organisms whose three samples are done.
  final int organismsCompleted;

  final double? distanceFromArrivalLs;

  bool get isScanned => scan != null;

  bool get isDetailed => scan?.isDetailed ?? false;

  bool get landable => scan?.landable ?? false;

  bool get hasBiology => (biologicalSignals ?? 0) > 0;

  /// Signals with no sample started yet.
  ///
  /// A count, not a promise: the signal count is what the game reports, and
  /// three samples of one organism still leave the others untouched.
  int get biologyLeft {
    final int signals = biologicalSignals ?? 0;
    final int done = organismsCompleted;
    return (signals - done).clamp(0, signals);
  }

  /// Worth landing on: life is down there, some of it unsampled, and the ship
  /// can actually put down.
  bool get invitesLanding => landable && hasBiology && biologyLeft > 0;

  /// Worth a probe: life confirmed but the genera are still unknown.
  bool get invitesMapping => hasBiology && !mapped;

  @override
  List<Object?> get props => <Object?>[
        name,
        bodyId,
        biologicalSignals,
        genusNames,
        mapped,
        firstDiscovery,
        firstMapping,
        organismsSampled,
        organismsCompleted,
      ];
}

/// What the journal proves about the system the commander is in.
///
/// Built for one system at a time and thrown away: it is a reading of the
/// journal, not a record, so a later import simply produces a better one.
class SystemSurvey extends Equatable {
  const SystemSurvey({
    this.systemName,
    this.systemAddress,
    this.bodyCount,
    this.allBodiesFound = false,
    this.bodies = const <SurveyBody>[],
  });

  const SystemSurvey.unknown() : this();

  final String? systemName;
  final int? systemAddress;

  /// How many bodies the arrival honk announced.
  ///
  /// `null` when the commander has not honked — and that is a distinct state
  /// from zero, because it is the one case where the app genuinely cannot say
  /// whether anything is left to find.
  final int? bodyCount;

  /// `FSSAllBodiesFound`: the system is fully surveyed.
  final bool allBodiesFound;

  /// The bodies the journal has anything to say about, nearest first.
  final List<SurveyBody> bodies;

  bool get isKnown => systemAddress != null || systemName != null;

  /// Whether the honk has happened at all.
  bool get wasHonked => bodyCount != null;

  int get scannedCount =>
      bodies.where((SurveyBody body) => body.isScanned).length;

  /// Bodies the FSS has not resolved yet, when that can be known.
  int? get unscannedCount {
    final int? total = bodyCount;
    return total == null ? null : (total - scannedCount).clamp(0, total);
  }

  List<SurveyBody> get bodiesWithBiology => bodies
      .where((SurveyBody body) => body.hasBiology)
      .toList(growable: false);

  List<SurveyBody> get landingTargets => bodies
      .where((SurveyBody body) => body.invitesLanding)
      .toList(growable: false);

  List<SurveyBody> get mappingTargets => bodies
      .where((SurveyBody body) => body.invitesMapping)
      .toList(growable: false);

  /// Bodies nobody had scanned before this commander.
  List<SurveyBody> get firstDiscoveries => bodies
      .where((SurveyBody body) => body.firstDiscovery)
      .toList(growable: false);

  int get biologicalSignalsLeft => bodies.fold<int>(
        0,
        (int total, SurveyBody body) => total + body.biologyLeft,
      );

  /// Nothing here needs the commander's attention any more.
  bool get isExhausted =>
      wasHonked &&
      allBodiesFound &&
      landingTargets.isEmpty &&
      mappingTargets.isEmpty;

  @override
  List<Object?> get props => <Object?>[
        systemName,
        systemAddress,
        bodyCount,
        allBodiesFound,
        bodies,
      ];
}
