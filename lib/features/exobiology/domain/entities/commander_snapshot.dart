import 'package:equatable/equatable.dart';

import 'exobiologist_rank.dart';
import 'suit.dart';

/// Everything the roadmap engine needs to know about the commander.
///
/// It is an anti-corruption layer: the engine never reaches into the auth,
/// commander or journal contexts, it receives this flat snapshot instead. That
/// keeps the engine a pure function and trivially testable.
class CommanderSnapshot extends Equatable {
  const CommanderSnapshot({
    this.commanderName,
    this.creditBalance = 0,
    this.currentSystem,
    this.exobiologyProfitCr = 0,
    this.suit = const SuitLoadout.none(),
    this.ownedSuitTypes = const <SuitType>{},
    this.suitMaterials = const <String, int>{},
    this.hasMetaAlloy = false,
    this.pledgedPower,
    this.unlockedShipEngineerIds = const <String>{},
    this.unlockedSuitEngineerIds = const <String>{},
    this.explorerRank = 0,
    this.hasFsdIncreasedRangeG5 = false,
    this.hasMassManager = false,
    this.hasGuardianFsdBooster = false,
    this.jumpRangeLy,
    this.shipName,
    this.hasDetailedSurfaceScanner = false,
    this.unsoldOrganicDataCr = 0,
    this.completedRoadmapStepIds = const <String>{},
    this.dismissedRoadmapStepIds = const <String>{},
    this.distinctSpeciesSold = 0,
    this.lastSaleAt,
  });

  final String? commanderName;

  /// Liquid credits.
  final int creditBalance;

  final String? currentSystem;

  /// Cumulative profit from organic data — the Exobiologist rank driver.
  final int exobiologyProfitCr;

  /// The Artemis, or [SuitLoadout.none] when the commander does not own one.
  final SuitLoadout suit;

  /// Every suit the commander owns. The Maverick matters because its Arc
  /// Cutter is what makes farming the Artemis' own materials bearable.
  final Set<SuitType> ownedSuitTypes;

  /// On-foot material counts, keyed by the exact in-game name
  /// (`Suit Schematic`, `Health Monitor`, `Manufacturing Instructions`,
  /// `Aerogel`, `Graphene`).
  final Map<String, int> suitMaterials;

  /// Meta-Alloy in the hold — the single item Felicity Farseer asks for.
  final bool hasMetaAlloy;

  /// Powerplay pledge, e.g. `Pranav Antal` (+30 % on exobiology sales).
  final String? pledgedPower;

  final Set<String> unlockedShipEngineerIds;
  final Set<String> unlockedSuitEngineerIds;

  /// Explorer rank index (0 = Aimless … 3 = Scout, the Farseer prerequisite).
  final int explorerRank;

  final bool hasFsdIncreasedRangeG5;
  final bool hasMassManager;
  final bool hasGuardianFsdBooster;

  /// Laden jump range, in light-years.
  final double? jumpRangeLy;

  final String? shipName;
  final bool hasDetailedSurfaceScanner;

  /// Value of scanned-but-unsold organic data. Everything here is lost on
  /// death — the roadmap escalates hard past a threshold.
  final int unsoldOrganicDataCr;

  final Set<String> completedRoadmapStepIds;
  final Set<String> dismissedRoadmapStepIds;

  /// Number of distinct species already sold, a proxy for field experience.
  final int distinctSpeciesSold;

  final DateTime? lastSaleAt;

  ExobiologistRankProgress get exobiologistRank =>
      ExobiologistRankProgress.fromProfit(exobiologyProfitCr);

  /// Explorer rank 3 is `Scout`, the minimum Felicity Farseer accepts.
  bool get meetsFarseerRankRequirement => explorerRank >= 3;

  bool get canSampleOrganics => suit.type == SuitType.artemis && suit.isOwned;

  bool get ownsMaverick => ownedSuitTypes.contains(SuitType.maverick);

  /// How many units of [material] are still missing to reach [target].
  int missingMaterial(String material, int target) =>
      (target - (suitMaterials[material] ?? 0)).clamp(0, target);

  /// Pledged to Pranav Antal, who grants up to +30 % on exobiology sales in
  /// the systems he controls.
  bool get hasExobiologySalesBonus => pledgedPower == 'Pranav Antal';

  CommanderSnapshot copyWith({
    String? commanderName,
    int? creditBalance,
    String? currentSystem,
    int? exobiologyProfitCr,
    SuitLoadout? suit,
    Set<SuitType>? ownedSuitTypes,
    Map<String, int>? suitMaterials,
    bool? hasMetaAlloy,
    String? pledgedPower,
    Set<String>? unlockedShipEngineerIds,
    Set<String>? unlockedSuitEngineerIds,
    int? explorerRank,
    bool? hasFsdIncreasedRangeG5,
    bool? hasMassManager,
    bool? hasGuardianFsdBooster,
    double? jumpRangeLy,
    String? shipName,
    bool? hasDetailedSurfaceScanner,
    int? unsoldOrganicDataCr,
    Set<String>? completedRoadmapStepIds,
    Set<String>? dismissedRoadmapStepIds,
    int? distinctSpeciesSold,
    DateTime? lastSaleAt,
  }) {
    return CommanderSnapshot(
      commanderName: commanderName ?? this.commanderName,
      creditBalance: creditBalance ?? this.creditBalance,
      currentSystem: currentSystem ?? this.currentSystem,
      exobiologyProfitCr: exobiologyProfitCr ?? this.exobiologyProfitCr,
      suit: suit ?? this.suit,
      ownedSuitTypes: ownedSuitTypes ?? this.ownedSuitTypes,
      suitMaterials: suitMaterials ?? this.suitMaterials,
      hasMetaAlloy: hasMetaAlloy ?? this.hasMetaAlloy,
      pledgedPower: pledgedPower ?? this.pledgedPower,
      unlockedShipEngineerIds:
          unlockedShipEngineerIds ?? this.unlockedShipEngineerIds,
      unlockedSuitEngineerIds:
          unlockedSuitEngineerIds ?? this.unlockedSuitEngineerIds,
      explorerRank: explorerRank ?? this.explorerRank,
      hasFsdIncreasedRangeG5:
          hasFsdIncreasedRangeG5 ?? this.hasFsdIncreasedRangeG5,
      hasMassManager: hasMassManager ?? this.hasMassManager,
      hasGuardianFsdBooster:
          hasGuardianFsdBooster ?? this.hasGuardianFsdBooster,
      jumpRangeLy: jumpRangeLy ?? this.jumpRangeLy,
      shipName: shipName ?? this.shipName,
      hasDetailedSurfaceScanner:
          hasDetailedSurfaceScanner ?? this.hasDetailedSurfaceScanner,
      unsoldOrganicDataCr: unsoldOrganicDataCr ?? this.unsoldOrganicDataCr,
      completedRoadmapStepIds:
          completedRoadmapStepIds ?? this.completedRoadmapStepIds,
      dismissedRoadmapStepIds:
          dismissedRoadmapStepIds ?? this.dismissedRoadmapStepIds,
      distinctSpeciesSold: distinctSpeciesSold ?? this.distinctSpeciesSold,
      lastSaleAt: lastSaleAt ?? this.lastSaleAt,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        commanderName,
        creditBalance,
        currentSystem,
        exobiologyProfitCr,
        suit,
        ownedSuitTypes,
        suitMaterials,
        hasMetaAlloy,
        pledgedPower,
        unlockedShipEngineerIds,
        unlockedSuitEngineerIds,
        explorerRank,
        hasFsdIncreasedRangeG5,
        hasMassManager,
        hasGuardianFsdBooster,
        jumpRangeLy,
        shipName,
        hasDetailedSurfaceScanner,
        unsoldOrganicDataCr,
        completedRoadmapStepIds,
        dismissedRoadmapStepIds,
        distinctSpeciesSold,
        lastSaleAt,
      ];
}
