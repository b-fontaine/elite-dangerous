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

/// One genus the DSS reported on a body.
///
/// Carries the raw codex token alongside the localised name because the two
/// serve different purposes: the token is stable across languages and is what
/// the catalogue can be matched on, the localised name is what the commander
/// reads. Frontier omits `Genus_Localised` when it would repeat the token, and
/// genus names being Latin, that happens in more languages than one might
/// expect.
class DetectedGenus extends Equatable {
  const DetectedGenus({required this.symbol, this.localised});

  /// `$Codex_Ent_Stratum_Genus_Name;`
  final String symbol;

  /// `Stratum`
  final String? localised;

  String get displayName => localised ?? symbol;

  /// The token as a stable lookup key: trimmed and lower-cased, nothing more.
  ///
  /// Deliberately *not* reduced to a genus name. The token stem and the genus
  /// the commander reads are different words far more often than not —
  /// `Shrubs` is *Frutexa*, `Cone` is *Bark Mound*, `Sphere` is *Anemone* —
  /// so anything that looks like a derived identifier would be a trap. The
  /// translation belongs to whoever owns the catalogue; see
  /// `ExobiologyReferenceData.genusIdFromCodex`.
  String get lookupKey => symbol.trim().toLowerCase();

  @override
  List<Object?> get props => <Object?>[symbol, localised];
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
    this.genuses = const <DetectedGenus>[],
  });

  final int biologicalCount;
  final String? bodyName;
  final int? bodyId;
  final int? systemAddress;

  /// Which genera are actually down there.
  ///
  /// Only `SAASignalsFound` carries this, and only since Odyssey Update 13
  /// (July 2022): the FSS tells you *how many* biological signals a body has,
  /// the DSS tells you *which* genera. Before mapping, this is empty and the
  /// species have to be predicted from the body's physical properties.
  final List<DetectedGenus> genuses;

  /// `SAASignalsFound` comes from the DSS and is the reliable one; the FSS
  /// count can be revised once probes land.
  bool get fromDetailedScan => name == 'SAASignalsFound';

  /// The genera are known, so the guesswork can stop.
  bool get identifiesGenuses => genuses.isNotEmpty;

  @override
  String get discriminator => '${bodyName ?? bodyId}';

  @override
  List<Object?> get props =>
      <Object?>[timestamp, name, biologicalCount, bodyName, bodyId, genuses];
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
    this.systemAddress,
    this.onPlanet = true,
  });

  final String? bodyName;
  final String? systemName;
  final int? systemAddress;
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

/// `Statistics` — the career totals, rewritten at every session start.
///
/// The most valuable event in the journal for this app: `Exobiology`'s
/// `Organic_Data_Profits` is exactly the figure the Exobiologist ladder counts,
/// stated by the game rather than inferred from the sales the app happens to
/// have imported.
final class StatisticsEvent extends JournalEvent {
  const StatisticsEvent({
    required super.timestamp,
    required this.sections,
  }) : super(name: 'Statistics');

  /// Section name (`Exobiology`, `Exploration`, `Bank_Account`…) to its
  /// integer entries. Kept raw: Frontier adds keys with every update, and
  /// dropping the unknown ones would mean re-parsing to get them back.
  final Map<String, Map<String, int>> sections;

  int? value(String section, String key) => sections[section]?[key];

  /// Cumulative profit from organic data, First Logged bonuses included.
  int? get organicDataProfitCr => value('Exobiology', 'Organic_Data_Profits');

  int? get firstLoggedProfitCr => value('Exobiology', 'First_Logged_Profits');
  int? get firstLoggedCount => value('Exobiology', 'First_Logged');
  int? get organicSpeciesEncountered =>
      value('Exobiology', 'Organic_Species_Encountered');
  int? get organicVariantsEncountered =>
      value('Exobiology', 'Organic_Variant_Encountered');
  int? get organicSystems => value('Exobiology', 'Organic_Systems');
  int? get organicPlanets => value('Exobiology', 'Organic_Planets');

  int? get systemsVisited => value('Exploration', 'Systems_Visited');
  int? get explorationProfitCr => value('Exploration', 'Exploration_Profits');
  int? get bodiesScannedDetailed =>
      value('Exploration', 'Planets_Scanned_To_Level_3');
  int? get firstFootfalls => value('Exploration', 'First_Footfalls');
  int? get hyperspaceJumps => value('Exploration', 'Total_Hyperspace_Jumps');
  int? get greatestDistanceLy =>
      value('Exploration', 'Greatest_Distance_From_Start');

  /// Seconds. Frontier reports play time here and nowhere else.
  int? get timePlayedSeconds => value('Exploration', 'Time_Played');

  int? get currentWealthCr => value('Bank_Account', 'Current_Wealth');
  int? get ownedShipCount => value('Bank_Account', 'Owned_Ship_Count');
  int? get suitsOwned => value('Bank_Account', 'Suits_Owned');
  int? get weaponsOwned => value('Bank_Account', 'Weapons_Owned');
  int? get engineersUsed => value('Crafting', 'Count_Of_Used_Engineers');
  int? get suitModsApplied => value('Crafting', 'Suit_Mods_Applied');

  @override
  List<Object?> get props => <Object?>[timestamp, sections];
}

/// `Reputation` — standing with the four powers, -100 to +100.
final class ReputationEvent extends JournalEvent {
  const ReputationEvent({
    required super.timestamp,
    required this.values,
  }) : super(name: 'Reputation');

  /// `Empire`, `Federation`, `Alliance`, `Independent`.
  final Map<String, double> values;

  double? operator [](String power) => values[power];

  @override
  List<Object?> get props => <Object?>[timestamp, values];
}

/// How far the commander has got with one engineer.
enum EngineerUnlockStage {
  unknown('Unknown', 'Inconnu'),
  known('Known', 'Connu'),
  invited('Invited', 'Invité'),
  unlocked('Unlocked', 'Débloqué');

  const EngineerUnlockStage(this.journalValue, this.label);

  final String journalValue;
  final String label;

  bool get isUnlocked => this == EngineerUnlockStage.unlocked;

  static EngineerUnlockStage fromJournal(String? raw) {
    for (final EngineerUnlockStage stage in values) {
      if (stage.journalValue.toLowerCase() == raw?.toLowerCase()) {
        return stage;
      }
    }
    return EngineerUnlockStage.unknown;
  }
}

/// One engineer's standing.
class EngineerStanding extends Equatable {
  const EngineerStanding({
    required this.name,
    required this.stage,
    this.engineerId,
    this.rank,
    this.rankProgressPercent,
  });

  final String name;
  final EngineerUnlockStage stage;
  final int? engineerId;

  /// 1 to 5, once unlocked.
  final int? rank;

  final int? rankProgressPercent;

  @override
  List<Object?> get props => <Object?>[name, engineerId, stage, rank];
}

/// `EngineerProgress` — who is unlocked, and to what rank.
///
/// Frontier writes it two ways: a full `Engineers` array at session start, and
/// a single-engineer update mid-session. Both are kept.
final class EngineerProgressEvent extends JournalEvent {
  const EngineerProgressEvent({
    required super.timestamp,
    required this.engineers,
    required this.isFullRoster,
  }) : super(name: 'EngineerProgress');

  final List<EngineerStanding> engineers;

  /// `true` for the session-start roster, `false` for a single update.
  final bool isFullRoster;

  List<EngineerStanding> get unlocked => engineers
      .where((EngineerStanding engineer) => engineer.stage.isUnlocked)
      .toList(growable: false);

  @override
  String get discriminator =>
      engineers.map((EngineerStanding e) => e.name).join(',');

  @override
  List<Object?> get props => <Object?>[timestamp, engineers, isFullRoster];
}

/// `Loadout` — the flown ship, with the two figures the CAPI cannot give.
///
/// `Rebuy` is the real insurance cost, which `/profile` cannot yield because it
/// reports `hull: 0` on recent ships. `MaxJumpRange` is the laden jump range,
/// which the app otherwise has to ask the commander for.
final class ShipLoadoutEvent extends JournalEvent {
  const ShipLoadoutEvent({
    required super.timestamp,
    required this.shipSymbol,
    this.shipId,
    this.shipName,
    this.shipIdent,
    this.hullValueCr,
    this.modulesValueCr,
    this.rebuyCr,
    this.maxJumpRangeLy,
    this.fuelCapacity,
    this.cargoCapacity,
    this.unladenMass,
    this.hullHealth,
    this.isHot = false,
    this.moduleSymbols = const <String>{},
  }) : super(name: 'Loadout');

  final String shipSymbol;
  final int? shipId;
  final String? shipName;
  final String? shipIdent;
  final int? hullValueCr;
  final int? modulesValueCr;

  /// The exact rebuy, stated by the game.
  final int? rebuyCr;

  /// Laden jump range, in light-years.
  final double? maxJumpRangeLy;

  final double? fuelCapacity;
  final int? cargoCapacity;
  final double? unladenMass;
  final double? hullHealth;

  /// Wanted: the ship cannot dock at most stations.
  final bool isHot;

  /// Fitted module symbols, lowercased — enough to answer "does this ship
  /// carry a Detailed Surface Scanner?" without modelling every module.
  final Set<String> moduleSymbols;

  bool get hasDetailedSurfaceScanner =>
      moduleSymbols.any((String s) => s.contains('detailedsurfacescanner'));

  bool get hasGuardianFsdBooster =>
      moduleSymbols.any((String s) => s.contains('guardianfsdbooster'));

  bool get hasFuelScoop =>
      moduleSymbols.any((String s) => s.contains('fuelscoop'));

  @override
  String get discriminator => '$shipSymbol|$shipId';

  @override
  List<Object?> get props =>
      <Object?>[timestamp, shipSymbol, shipId, rebuyCr, maxJumpRangeLy];
}

/// `ShipLocker` — the on-foot inventory.
///
/// Frontier writes the full lists at session start and on boarding, and an
/// empty event otherwise, pointing at `ShipLocker.json`. An empty one is kept
/// rather than dropped so the aggregator can tell "nothing carried" from
/// "never reported".
final class ShipLockerEvent extends JournalEvent {
  const ShipLockerEvent({
    required super.timestamp,
    this.items = const <String, int>{},
    this.components = const <String, int>{},
    this.consumables = const <String, int>{},
    this.data = const <String, int>{},
    this.isEmpty = false,
  }) : super(name: 'ShipLocker');

  /// Keyed by the canonical English name, resolved from the journal's internal
  /// symbol — see `MicroResourceNames`. Not by `Name_Localised`, which follows
  /// the language the client runs in and so cannot be matched against
  /// anything.
  final Map<String, int> items;
  final Map<String, int> components;
  final Map<String, int> consumables;
  final Map<String, int> data;

  /// The pointer form, with no lists at all.
  final bool isEmpty;

  /// Everything in one map, which is how the roadmap asks for materials.
  Map<String, int> get everything => <String, int>{
        ...items,
        ...components,
        ...consumables,
        ...data,
      };

  @override
  List<Object?> get props =>
      <Object?>[timestamp, items, components, consumables, data, isEmpty];
}

/// `Materials` — the ship-side raw, manufactured and encoded materials.
final class MaterialsEvent extends JournalEvent {
  const MaterialsEvent({
    required super.timestamp,
    this.raw = const <String, int>{},
    this.manufactured = const <String, int>{},
    this.encoded = const <String, int>{},
  }) : super(name: 'Materials');

  final Map<String, int> raw;
  final Map<String, int> manufactured;
  final Map<String, int> encoded;

  Map<String, int> get everything => <String, int>{
        ...raw,
        ...manufactured,
        ...encoded,
      };

  @override
  List<Object?> get props => <Object?>[timestamp, raw, manufactured, encoded];
}

/// `Powerplay` — the pledge, which decides a 30 % bonus on organic sales.
final class PowerplayEvent extends JournalEvent {
  const PowerplayEvent({
    required super.timestamp,
    required this.power,
    this.rank,
    this.merits,
    this.timePledgedSeconds,
  }) : super(name: 'Powerplay');

  final String power;
  final int? rank;
  final int? merits;
  final int? timePledgedSeconds;

  /// Pranav Antal grants up to +30 % on exobiology sales in his space.
  bool get boostsOrganicSales => power == 'Pranav Antal';

  @override
  String get discriminator => power;

  @override
  List<Object?> get props => <Object?>[timestamp, power, rank, merits];
}

/// One ship in `StoredShips`.
class StoredShipEntry extends Equatable {
  const StoredShipEntry({
    required this.shipId,
    required this.shipSymbol,
    this.name,
    this.starSystem,
    this.valueCr,
    this.transferPriceCr,
    this.isHot = false,
    this.inTransit = false,
  });

  final int shipId;
  final String shipSymbol;
  final String? name;
  final String? starSystem;
  final int? valueCr;
  final int? transferPriceCr;
  final bool isHot;
  final bool inTransit;

  @override
  List<Object?> get props => <Object?>[shipId, shipSymbol, starSystem, valueCr];
}

/// `StoredShips` — the fleet, including where each one sleeps.
///
/// Overlaps `/profile`'s `ships`, and is worth reading anyway: it works with
/// no Frontier account at all, and it states the transfer price.
final class StoredShipsEvent extends JournalEvent {
  const StoredShipsEvent({
    required super.timestamp,
    required this.here,
    required this.remote,
    this.stationName,
    this.starSystem,
  }) : super(name: 'StoredShips');

  final List<StoredShipEntry> here;
  final List<StoredShipEntry> remote;

  final String? stationName;
  final String? starSystem;

  List<StoredShipEntry> get all => <StoredShipEntry>[...here, ...remote];

  @override
  List<Object?> get props => <Object?>[timestamp, here, remote, stationName];
}

/// `Cargo` — the hold. Read for one commodity: the Meta-Alloy that unlocks
/// Felicity Farseer, which the app otherwise asks the commander to confirm.
final class CargoEvent extends JournalEvent {
  const CargoEvent({
    required super.timestamp,
    required this.inventory,
    this.vessel,
    this.count = 0,
  }) : super(name: 'Cargo');

  /// Commodity name, lowercased, to the number carried.
  final Map<String, int> inventory;

  /// `Ship` or `SRV`.
  final String? vessel;

  final int count;

  bool get hasMetaAlloy => (inventory['metaalloys'] ?? 0) > 0;

  @override
  String get discriminator => vessel ?? '';

  @override
  List<Object?> get props => <Object?>[timestamp, inventory, vessel];
}

/// Where the commander is, as the journal reports it.
///
/// `/profile` names the system and the last station and stops there — it has
/// no notion of which body you are orbiting, and it only refreshes when you
/// dock. The journal names the body, and does so the moment you arrive.
final class LocationEvent extends JournalEvent {
  const LocationEvent({
    required super.timestamp,
    required super.name,
    this.starSystem,
    this.systemAddress,
    this.bodyName,
    this.bodyId,
    this.bodyType,
    this.stationName,
    this.stationType,
    this.distanceFromStarLs,
    this.docked = false,
    this.landed = false,
    this.onFoot = false,
  });

  final String? starSystem;
  final int? systemAddress;

  /// The body in focus: the star on arrival, a planet once approached.
  final String? bodyName;

  final int? bodyId;

  /// `Star`, `Planet`, `Station`, `PlanetaryRing`…
  final String? bodyType;

  final String? stationName;
  final String? stationType;
  final double? distanceFromStarLs;

  final bool docked;
  final bool landed;
  final bool onFoot;

  /// Events that clear the body rather than set one: leaving a body's sphere
  /// of influence, or jumping out of the system entirely.
  bool get clearsBody => name == 'LeaveBody' || name == 'StartJump';

  bool get isPlanet => bodyType == 'Planet';

  @override
  String get discriminator => '${starSystem ?? ''}|${bodyName ?? ''}';

  @override
  List<Object?> get props =>
      <Object?>[timestamp, name, starSystem, bodyName, stationName, docked];
}

/// `Docked` — everything the station offers, at the moment of docking.
///
/// Richer than `/profile`'s `lastStarport`, and available without a Frontier
/// account: it carries the station's type, its distance from the star, its
/// economies and its landing pads alongside the service list.
final class DockedEvent extends JournalEvent {
  const DockedEvent({
    required super.timestamp,
    required this.stationName,
    this.stationType,
    this.starSystem,
    this.systemAddress,
    this.marketId,
    this.faction,
    this.government,
    this.allegiance,
    this.economy,
    this.secondEconomy,
    this.distanceFromStarLs,
    this.services = const <String>{},
    this.largePads = 0,
    this.mediumPads = 0,
    this.smallPads = 0,
  }) : super(name: 'Docked');

  final String stationName;

  /// `Coriolis`, `Orbis`, `Outpost`, `FleetCarrier`, `PlanetaryPort`…
  final String? stationType;

  final String? starSystem;
  final int? systemAddress;
  final int? marketId;
  final String? faction;
  final String? government;
  final String? allegiance;

  /// Localised economy names.
  final String? economy;
  final String? secondEconomy;

  final double? distanceFromStarLs;

  /// Lower-cased service keys, the same vocabulary `/profile` uses.
  final Set<String> services;

  final int largePads;
  final int mediumPads;
  final int smallPads;

  bool get sellsOrganicData => services.contains('vistagenomics');

  bool get isFleetCarrier => stationType == 'FleetCarrier';

  @override
  String get discriminator => stationName;

  @override
  List<Object?> get props =>
      <Object?>[timestamp, stationName, stationType, services, marketId];
}

/// `Died` — the moment unsold exobiology data is at risk.
///
/// Recorded for both kinds of death: a destroyed ship and a body on a
/// planet's surface. Which one it was cannot be read from this event, which is
/// why [ResurrectEvent] is what actually decides whether anything was lost.
final class DiedEvent extends JournalEvent {
  const DiedEvent({
    required super.timestamp,
    this.killerName,
    this.killerShip,
  }) : super(name: 'Died');

  final String? killerName;
  final String? killerShip;

  @override
  List<Object?> get props => <Object?>[timestamp, killerName, killerShip];
}

/// `Resurrect` — how the commander came back, and therefore what they lost.
///
/// The `Option` field is the one that matters, and it is the only signal the
/// journal offers: no event ever states that organic data was lost.
///
/// Frontier documents the field as "the option selected on the insurance
/// rebuy screen" and stops there — the set of values it can take is written
/// down nowhere. What follows is therefore taken from BioScan, the reference
/// exobiology plugin, which is the closest thing to an authority that exists.
final class ResurrectEvent extends JournalEvent {
  const ResurrectEvent({
    required super.timestamp,
    required this.option,
    this.costCr = 0,
    this.bankrupt = false,
  }) : super(name: 'Resurrect');

  /// `rebuy`, `escape`, `recover`, `rejoin`, `handin`…
  final String option;

  final int costCr;
  final bool bankrupt;

  /// Options that follow the loss of the ship, and with it the unsold organic
  /// data it carried.
  ///
  /// The full set of values is `free`, `rebuy`, `recover`, `handIn`, `rejoin`
  /// and `escape` — EDDiscovery enumerates exactly those
  /// (`JournalDiedResurrect.cs`, `enum ResurrectTypes`). Five of the six are
  /// outcomes of the insurance rebuy screen, which only ever appears once the
  /// ship is gone: `rebuy` pays for it, `free` declines and takes the
  /// complimentary Sidewinder. Paying rebuy rebuilds the hull, never the hold.
  ///
  /// Taking BioScan's three-value filter at face value was a mistake worth
  /// recording: those three are its *fallback*, for a loss whose `Died` line
  /// is missing. Its primary cut is the `Died` event itself, with no filter at
  /// all — which is why [DiedEvent] is what the aggregator keys on, and why
  /// this set only has to catch what a missing `Died` would let through.
  static const Set<String> shipLostOptions = <String>{
    'free',
    'rebuy',
    'escape',
    'recover',
    'rejoin',
  };

  bool get losesUnsoldData =>
      shipLostOptions.contains(option.toLowerCase());

  @override
  String get discriminator => option;

  @override
  List<Object?> get props => <Object?>[timestamp, option, costCr, bankrupt];
}
