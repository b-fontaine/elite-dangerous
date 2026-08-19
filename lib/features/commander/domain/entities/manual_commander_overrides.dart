import 'package:equatable/equatable.dart';

/// What the commander tells the app about themselves.
///
/// The Companion API is silent on almost everything the exobiology roadmap
/// needs: suit grade is only inferable, engineer unlocks are not exposed at
/// all, and nothing reports whether a Meta-Alloy is in the hold. Those facts
/// have to come from the commander — and this is also what makes the app fully
/// usable by someone who never connects a Frontier account.
///
/// Every field is nullable or empty-by-default: absent means "not stated, do
/// not overwrite what the API said".
class ManualCommanderOverrides extends Equatable {
  const ManualCommanderOverrides({
    this.commanderName,
    this.creditBalance,
    this.currentSystem,
    this.shipName,
    this.jumpRangeLy,
    this.explorerRankLevel,
    this.artemisGrade,
    this.ownsMaverick = false,
    this.installedModIds = const <String>{},
    this.unlockedSuitEngineerIds = const <String>{},
    this.unlockedShipEngineerIds = const <String>{},
    this.suitMaterials = const <String, int>{},
    this.hasMetaAlloy = false,
    this.hasFsdIncreasedRangeG5 = false,
    this.hasMassManager = false,
    this.hasGuardianFsdBooster = false,
    this.hasDetailedSurfaceScanner = false,
    this.pledgedPower,
    this.declaredExobiologyProfitCr,
  });

  const ManualCommanderOverrides.empty() : this();

  final String? commanderName;
  final int? creditBalance;
  final String? currentSystem;
  final String? shipName;
  final double? jumpRangeLy;

  /// Explorer ladder index. Felicity Farseer requires Scout, which is index 2.
  final int? explorerRankLevel;

  /// 0 = not owned, 1 to 5 otherwise.
  final int? artemisGrade;

  final bool ownsMaverick;
  final Set<String> installedModIds;
  final Set<String> unlockedSuitEngineerIds;
  final Set<String> unlockedShipEngineerIds;

  /// On-foot materials, keyed by their exact in-game name.
  final Map<String, int> suitMaterials;

  final bool hasMetaAlloy;
  final bool hasFsdIncreasedRangeG5;
  final bool hasMassManager;
  final bool hasGuardianFsdBooster;
  final bool hasDetailedSurfaceScanner;

  final String? pledgedPower;

  /// Organic-data profit earned before the commander started using the app.
  final int? declaredExobiologyProfitCr;

  bool get isEmpty => this == const ManualCommanderOverrides.empty();

  ManualCommanderOverrides copyWith({
    String? commanderName,
    int? creditBalance,
    String? currentSystem,
    String? shipName,
    double? jumpRangeLy,
    int? explorerRankLevel,
    int? artemisGrade,
    bool? ownsMaverick,
    Set<String>? installedModIds,
    Set<String>? unlockedSuitEngineerIds,
    Set<String>? unlockedShipEngineerIds,
    Map<String, int>? suitMaterials,
    bool? hasMetaAlloy,
    bool? hasFsdIncreasedRangeG5,
    bool? hasMassManager,
    bool? hasGuardianFsdBooster,
    bool? hasDetailedSurfaceScanner,
    String? pledgedPower,
    int? declaredExobiologyProfitCr,
    bool clearPledgedPower = false,
  }) {
    return ManualCommanderOverrides(
      commanderName: commanderName ?? this.commanderName,
      creditBalance: creditBalance ?? this.creditBalance,
      currentSystem: currentSystem ?? this.currentSystem,
      shipName: shipName ?? this.shipName,
      jumpRangeLy: jumpRangeLy ?? this.jumpRangeLy,
      explorerRankLevel: explorerRankLevel ?? this.explorerRankLevel,
      artemisGrade: artemisGrade ?? this.artemisGrade,
      ownsMaverick: ownsMaverick ?? this.ownsMaverick,
      installedModIds: installedModIds ?? this.installedModIds,
      unlockedSuitEngineerIds:
          unlockedSuitEngineerIds ?? this.unlockedSuitEngineerIds,
      unlockedShipEngineerIds:
          unlockedShipEngineerIds ?? this.unlockedShipEngineerIds,
      suitMaterials: suitMaterials ?? this.suitMaterials,
      hasMetaAlloy: hasMetaAlloy ?? this.hasMetaAlloy,
      hasFsdIncreasedRangeG5:
          hasFsdIncreasedRangeG5 ?? this.hasFsdIncreasedRangeG5,
      hasMassManager: hasMassManager ?? this.hasMassManager,
      hasGuardianFsdBooster:
          hasGuardianFsdBooster ?? this.hasGuardianFsdBooster,
      hasDetailedSurfaceScanner:
          hasDetailedSurfaceScanner ?? this.hasDetailedSurfaceScanner,
      pledgedPower:
          clearPledgedPower ? null : (pledgedPower ?? this.pledgedPower),
      declaredExobiologyProfitCr:
          declaredExobiologyProfitCr ?? this.declaredExobiologyProfitCr,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        commanderName,
        creditBalance,
        currentSystem,
        shipName,
        jumpRangeLy,
        explorerRankLevel,
        artemisGrade,
        ownsMaverick,
        installedModIds,
        unlockedSuitEngineerIds,
        unlockedShipEngineerIds,
        suitMaterials,
        hasMetaAlloy,
        hasFsdIncreasedRangeG5,
        hasMassManager,
        hasGuardianFsdBooster,
        hasDetailedSurfaceScanner,
        pledgedPower,
        declaredExobiologyProfitCr,
      ];
}
