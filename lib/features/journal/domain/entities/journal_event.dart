import 'package:equatable/equatable.dart';

/// The three stages of sampling one organism.
enum OrganicScanType {
  log('Log', 'Premier échantillon'),
  sample('Sample', 'Deuxième échantillon'),
  analyse('Analyse', 'Analyse — organisme complet'),
  unknown('', 'Inconnu');

  const OrganicScanType(this.journalValue, this.label);

  final String journalValue;
  final String label;

  static OrganicScanType fromJournal(String? raw) {
    switch (raw?.toLowerCase()) {
      case 'log':
        return OrganicScanType.log;
      case 'sample':
        return OrganicScanType.sample;
      case 'analyse':
      case 'analyze':
        return OrganicScanType.analyse;
      default:
        return OrganicScanType.unknown;
    }
  }
}

/// One line of the commander's journal.
///
/// Modelled as a sealed hierarchy so that consumers switch exhaustively, and
/// with an [UnknownJournalEvent] catch-all so an unrecognised line is *kept*
/// rather than dropped: the journal is the commander's history, and Frontier
/// adds events with every update.
sealed class JournalEvent extends Equatable {
  const JournalEvent({required this.timestamp, required this.name});

  final DateTime timestamp;

  /// The raw `event` field, e.g. `ScanOrganic`.
  final String name;

  /// Stable identity used to deduplicate across overlapping imports: the same
  /// line fetched twice from the CAPI and from a local file must collapse.
  String get dedupeKey => '${timestamp.toIso8601String()}|$name|$discriminator';

  /// Extra detail that distinguishes two events of the same type at the same
  /// instant. Empty when the timestamp alone is enough.
  String get discriminator => '';

  @override
  List<Object?> get props => <Object?>[timestamp, name, discriminator];
}

/// `ScanOrganic` — one of the three samples of an organism.
final class ScanOrganicEvent extends JournalEvent {
  const ScanOrganicEvent({
    required super.timestamp,
    required this.scanType,
    required this.genus,
    required this.species,
    this.genusLocalised,
    this.speciesLocalised,
    this.variant,
    this.variantLocalised,
    this.systemAddress,
    this.bodyId,
  }) : super(name: 'ScanOrganic');

  final OrganicScanType scanType;
  final String genus;
  final String species;
  final String? genusLocalised;
  final String? speciesLocalised;
  final String? variant;
  final String? variantLocalised;
  final int? systemAddress;
  final int? bodyId;

  String get displayName => speciesLocalised ?? species;

  /// True on the third sample, when the organism becomes sellable.
  bool get completesOrganism => scanType == OrganicScanType.analyse;

  @override
  String get discriminator => '$species|$scanType';
}

/// One line of a `SellOrganicData` payload.
class SoldBioData extends Equatable {
  const SoldBioData({
    required this.genus,
    required this.species,
    required this.valueCr,
    required this.bonusCr,
    this.speciesLocalised,
    this.variant,
  });

  final String genus;
  final String species;

  /// Base Vista Genomics payout.
  final int valueCr;

  /// First Logged bonus. Four times the base when claimed, zero otherwise.
  final int bonusCr;

  final String? speciesLocalised;
  final String? variant;

  int get totalCr => valueCr + bonusCr;

  /// The commander was the first to sell this species from this body.
  bool get isFirstLogged => bonusCr > 0;

  String get displayName => speciesLocalised ?? species;

  @override
  List<Object?> get props => <Object?>[species, valueCr, bonusCr, variant];
}

/// `SellOrganicData` — the moment the credits and the rank actually move.
final class SellOrganicDataEvent extends JournalEvent {
  const SellOrganicDataEvent({
    required super.timestamp,
    required this.entries,
    this.marketId,
  }) : super(name: 'SellOrganicData');

  final List<SoldBioData> entries;
  final int? marketId;

  int get totalCr =>
      entries.fold<int>(0, (int sum, SoldBioData e) => sum + e.totalCr);

  int get firstLoggedCount =>
      entries.where((SoldBioData e) => e.isFirstLogged).length;

  @override
  String get discriminator => entries.map((SoldBioData e) => e.species).join(',');

  @override
  List<Object?> get props => <Object?>[timestamp, entries, marketId];
}

/// `FSSBodySignals` and `SAASignalsFound` — how many organisms are down there.
final class BodySignalsEvent extends JournalEvent {
  const BodySignalsEvent({
    required super.timestamp,
    required super.name,
    required this.biologicalCount,
    this.bodyName,
    this.bodyId,
    this.systemAddress,
  });

  final int biologicalCount;
  final String? bodyName;
  final int? bodyId;
  final int? systemAddress;

  /// `SAASignalsFound` comes from the DSS and is the reliable one; the FSS
  /// count can be revised once probes land.
  bool get fromDetailedScan => name == 'SAASignalsFound';

  @override
  String get discriminator => '${bodyName ?? bodyId}';

  @override
  List<Object?> get props =>
      <Object?>[timestamp, name, biologicalCount, bodyName, bodyId];
}

/// `Scan` — the body survey the species matcher consumes.
final class BodyScanEvent extends JournalEvent {
  const BodyScanEvent({
    required super.timestamp,
    required this.bodyName,
    this.starSystem,
    this.bodyId,
    this.planetClass,
    this.atmosphere,
    this.volcanism,
    this.surfaceGravityG,
    this.surfaceTemperatureK,
    this.surfacePressure,
    this.distanceFromArrivalLs,
    this.landable = false,
    this.parentStarClass,
  }) : super(name: 'Scan');

  final String bodyName;
  final String? starSystem;
  final int? bodyId;
  final String? planetClass;
  final String? atmosphere;
  final String? volcanism;

  /// Already converted from the Journal's m/s² to g.
  final double? surfaceGravityG;

  final double? surfaceTemperatureK;
  final double? surfacePressure;
  final double? distanceFromArrivalLs;
  final bool landable;
  final String? parentStarClass;

  /// The Journal reports `SurfaceGravity` in m/s²; every exobiology table is
  /// written in g, and 0.27 g is the threshold that decides a landing.
  static const double standardGravity = 9.80665;

  @override
  String get discriminator => bodyName;

  @override
  List<Object?> get props => <Object?>[timestamp, bodyName, planetClass];
}

/// `Touchdown` and `Disembark` — landing and stepping out.
final class SurfaceContactEvent extends JournalEvent {
  const SurfaceContactEvent({
    required super.timestamp,
    required super.name,
    this.bodyName,
    this.systemName,
    this.onPlanet = true,
  });

  final String? bodyName;
  final String? systemName;
  final bool onPlanet;

  bool get isDisembark => name == 'Disembark';

  @override
  String get discriminator => bodyName ?? '';
}

/// `Rank` and `Progress` — CamelCase keys, unlike the Companion API.
final class RankEvent extends JournalEvent {
  const RankEvent({
    required super.timestamp,
    required super.name,
    required this.values,
  });

  /// Ladder name (`Explore`, `Exobiologist`…) to level, or to percentage for
  /// `Progress`.
  final Map<String, int> values;

  bool get isProgress => name == 'Progress';

  @override
  List<Object?> get props => <Object?>[timestamp, name, values];
}

/// `LoadGame` — the session header, and the most reliable credit balance.
final class LoadGameEvent extends JournalEvent {
  const LoadGameEvent({
    required super.timestamp,
    required this.commander,
    this.fid,
    this.ship,
    this.shipName,
    this.creditsCr = 0,
    this.horizons = false,
    this.odyssey = false,
  }) : super(name: 'LoadGame');

  final String commander;
  final String? fid;
  final String? ship;
  final String? shipName;
  final int creditsCr;
  final bool horizons;
  final bool odyssey;

  @override
  List<Object?> get props => <Object?>[timestamp, commander, creditsCr];
}

/// `SuitLoadout`, `BuySuit`, `UpgradeSuit`.
final class SuitEvent extends JournalEvent {
  const SuitEvent({
    required super.timestamp,
    required super.name,
    required this.suitSymbol,
    this.suitName,
    this.suitId,
    this.grade,
    this.modIds = const <String>{},
  });

  final String suitSymbol;
  final String? suitName;
  final int? suitId;

  /// Present on `UpgradeSuit`; otherwise derived from the symbol suffix.
  final int? grade;

  final Set<String> modIds;

  @override
  String get discriminator => suitSymbol;

  @override
  List<Object?> get props =>
      <Object?>[timestamp, name, suitSymbol, grade, modIds];
}

/// Any event the app does not model. Kept so nothing is silently lost.
final class UnknownJournalEvent extends JournalEvent {
  const UnknownJournalEvent({required super.timestamp, required super.name});
}
