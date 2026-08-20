import 'package:equatable/equatable.dart';

import 'journal_event.dart';

/// Where the commander is, folded from the journal's position events.
class CommanderPosition extends Equatable {
  const CommanderPosition({
    this.starSystem,
    this.systemAddress,
    this.bodyName,
    this.bodyType,
    this.stationName,
    this.stationType,
    this.distanceFromStarLs,
    this.docked = false,
    this.landed = false,
    this.onFoot = false,
    this.at,
  });

  const CommanderPosition.unknown() : this();

  final String? starSystem;

  /// The system's `SystemAddress`, which is also its `id64` everywhere else in
  /// the ecosystem — Spansh, EDSM and EDDN all key on this exact number. It is
  /// the only identifier that survives a system being renamed, and the only
  /// one an external lookup accepts.
  final int? systemAddress;

  /// The body in focus — a star on arrival, a planet once approached. Cleared
  /// on leaving its sphere of influence, because "still orbiting" would be a
  /// lie the moment the commander jumps away.
  final String? bodyName;

  final String? bodyType;
  final String? stationName;
  final String? stationType;
  final double? distanceFromStarLs;

  final bool docked;
  final bool landed;
  final bool onFoot;

  final DateTime? at;

  bool get isUnknown => starSystem == null && stationName == null;

  bool get isOnPlanet => bodyType == 'Planet' && (landed || onFoot);

  /// What the commander is doing, in one word.
  String get activity {
    if (onFoot) {
      return 'à pied';
    }
    if (docked) {
      return 'amarré';
    }
    if (landed) {
      return 'posé';
    }
    return 'en vol';
  }

  @override
  List<Object?> get props => <Object?>[
        starSystem,
        systemAddress,
        bodyName,
        bodyType,
        stationName,
        stationType,
        distanceFromStarLs,
        docked,
        landed,
        onFoot,
        at,
      ];
}

/// What the journal proves about the commander's present state.
///
/// Derived, never stored — the same discipline [ExobiologyActivity] follows,
/// and for the same reason: re-importing a day must correct the picture rather
/// than double it.
///
/// Every field comes from the most recent event of its kind. Frontier rewrites
/// `Statistics`, `EngineerProgress`, `ShipLocker`, `Loadout`, `Reputation`,
/// `Materials` and `Powerplay` at every session start, so the latest one is
/// the current truth and the earlier ones are history.
class JournalSessionState extends Equatable {
  const JournalSessionState({
    this.statistics,
    this.reputations = const <String, double>{},
    this.engineers = const <EngineerStanding>[],
    this.shipLoadout,
    this.onFootInventory = const <String, int>{},
    this.shipMaterials = const <String, int>{},
    this.pledgedPower,
    this.powerplayRank,
    this.powerplayMerits,
    this.hasMetaAlloy = false,
    this.storedShips = const <StoredShipEntry>[],
    this.position = const CommanderPosition.unknown(),
    this.dockedAt,
    this.observedAt,
  });

  const JournalSessionState.empty() : this();

  /// Career totals. `Organic_Data_Profits` is the figure the Exobiologist
  /// ladder actually counts.
  final StatisticsEvent? statistics;

  /// `Empire`, `Federation`, `Alliance`, `Independent`, each -100 to +100.
  final Map<String, double> reputations;

  final List<EngineerStanding> engineers;

  /// The flown ship, carrying the exact rebuy and the laden jump range —
  /// neither of which `/profile` can give.
  final ShipLoadoutEvent? shipLoadout;

  /// On-foot materials by their in-game name, from `ShipLocker`.
  final Map<String, int> onFootInventory;

  final Map<String, int> shipMaterials;

  final String? pledgedPower;
  final int? powerplayRank;
  final int? powerplayMerits;

  /// A Meta-Alloy in the hold is the one item Felicity Farseer asks for.
  final bool hasMetaAlloy;

  final List<StoredShipEntry> storedShips;

  /// Where the commander is. The journal is the only source that names the
  /// body, and the only one that updates before docking.
  final CommanderPosition position;

  /// The last station docked at, in the detail `Docked` carries and
  /// `/profile` does not.
  final DockedEvent? dockedAt;

  /// Timestamp of the most recent event folded in, so the UI can say how old
  /// this picture is.
  final DateTime? observedAt;

  bool get isEmpty =>
      statistics == null &&
      reputations.isEmpty &&
      engineers.isEmpty &&
      shipLoadout == null &&
      onFootInventory.isEmpty &&
      shipMaterials.isEmpty &&
      pledgedPower == null &&
      storedShips.isEmpty &&
      position.isUnknown &&
      dockedAt == null;

  /// Career profit from organic data, when the game stated it.
  int? get exobiologyProfitCr => statistics?.organicDataProfitCr;

  List<EngineerStanding> get unlockedEngineers => engineers
      .where((EngineerStanding engineer) => engineer.stage.isUnlocked)
      .toList(growable: false);

  Set<String> get unlockedEngineerNames => <String>{
        for (final EngineerStanding engineer in unlockedEngineers)
          engineer.name,
      };

  /// Laden jump range, in light-years.
  double? get jumpRangeLy => shipLoadout?.maxJumpRangeLy;

  /// The exact insurance cost, which `/profile` cannot supply because it
  /// reports `hull: 0` on recent ships.
  int? get rebuyCr => shipLoadout?.rebuyCr;

  bool get hasDetailedSurfaceScanner =>
      shipLoadout?.hasDetailedSurfaceScanner ?? false;

  bool get hasGuardianFsdBooster =>
      shipLoadout?.hasGuardianFsdBooster ?? false;

  /// Pledged to Pranav Antal, worth up to +30 % on organic sales.
  bool get boostsOrganicSales => pledgedPower == 'Pranav Antal';

  @override
  List<Object?> get props => <Object?>[
        statistics,
        reputations,
        engineers,
        shipLoadout,
        onFootInventory,
        shipMaterials,
        pledgedPower,
        powerplayRank,
        powerplayMerits,
        hasMetaAlloy,
        storedShips,
        position,
        dockedAt,
        observedAt,
      ];
}
