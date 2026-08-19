import '../entities/engineer.dart';
import '../entities/suit.dart';

/// Small, rule-critical game data that the roadmap engine reasons over.
///
/// Kept as code rather than as a JSON asset because the roadmap rules refer to
/// these ids directly: a typo must be a compile error, not a silent no-op. The
/// large species catalogue lives in `assets/data/` instead, since it is content
/// rather than logic.
///
/// Sources: `guide-artemis-suit.html`, `guide-exploration-exobiologie.html` and
/// `caspian-procedure-1-milliard.md`, all shipped in `sources/`.
abstract final class ExobiologyReferenceData {
  // --- Suit engineers ----------------------------------------------------
  static const String dominoGreen = 'domino_green';
  static const String wellingtonBeck = 'wellington_beck';
  static const String yardenBond = 'yarden_bond';
  static const String terraVelasquez = 'terra_velasquez';
  static const String odenGeiger = 'oden_geiger';
  static const String kitFowler = 'kit_fowler';
  static const String heroFerrari = 'hero_ferrari';
  static const String baltanos = 'baltanos';
  static const String rosaDayette = 'rosa_dayette';
  static const String eleanorBresa = 'eleanor_bresa';
  static const String yiShen = 'yi_shen';

  // --- Ship engineers ----------------------------------------------------
  static const String felicityFarseer = 'felicity_farseer';

  // --- Suit modifications ------------------------------------------------
  static const String modImprovedBattery = 'improved_battery_capacity';
  static const String modExtraBackpack = 'extra_backpack_capacity';
  static const String modReducedToolConsumption =
      'reduced_tool_battery_consumption';
  static const String modIncreasedSprint = 'increased_sprint_duration';
  static const String modImprovedJumpAssist = 'improved_jump_assist';
  static const String modNightVision = 'night_vision';

  /// Material cost of every Artemis grade step.
  ///
  /// Since Update 18 (August 2024) the costs were cut to roughly a quarter and
  /// Power Regulators are no longer required. Note that the Artemis uses
  /// **Aerogel** where the Dominator and Maverick use plating — copying a list
  /// written for another suit is the classic mistake.
  static const List<SuitGradeStep> artemisGradeSteps = <SuitGradeStep>[
    SuitGradeStep(
      fromGrade: 1,
      toGrade: 2,
      materials: <String, int>{
        'Suit Schematic': 1,
        'Health Monitor': 1,
        'Manufacturing Instructions': 1,
        'Aerogel': 2,
        'Graphene': 2,
      },
    ),
    SuitGradeStep(
      fromGrade: 2,
      toGrade: 3,
      materials: <String, int>{
        'Suit Schematic': 2,
        'Health Monitor': 2,
        'Manufacturing Instructions': 2,
        'Aerogel': 5,
        'Graphene': 5,
      },
    ),
    SuitGradeStep(
      fromGrade: 3,
      toGrade: 4,
      materials: <String, int>{
        'Suit Schematic': 4,
        'Health Monitor': 4,
        'Manufacturing Instructions': 4,
        'Aerogel': 9,
        'Graphene': 9,
      },
    ),
    SuitGradeStep(
      fromGrade: 4,
      toGrade: 5,
      materials: <String, int>{
        'Suit Schematic': 5,
        'Health Monitor': 5,
        'Manufacturing Instructions': 5,
        'Aerogel': 12,
        'Graphene': 12,
      },
    ),
  ];

  /// Grades cost materials only — never credits. Credits are for modifications.
  static const bool gradesCostCredits = false;

  /// Suit modifications worth installing for an exobiologist, in the order the
  /// Artemis guide recommends.
  static const List<SuitModification> suitModifications = <SuitModification>[
    SuitModification(
      id: modImprovedBattery,
      name: 'Improved Battery Capacity',
      effect: '+50 % d\'énergie — compense la consommation du Genetic Sampler',
      creditCost: 750000,
      engineerIds: <String>[wellingtonBeck, odenGeiger],
      exobiologyPriority: 1,
    ),
    SuitModification(
      id: modExtraBackpack,
      name: 'Extra Backpack Capacity',
      effect: 'Double la capacité du sac à dos',
      creditCost: 750000,
      engineerIds: <String>[dominoGreen, wellingtonBeck],
      exobiologyPriority: 2,
    ),
    SuitModification(
      id: modReducedToolConsumption,
      name: 'Reduced Tool Battery Consumption',
      effect: 'Outils moins gourmands en énergie',
      creditCost: 500000,
      engineerIds: <String>[dominoGreen, wellingtonBeck],
      exobiologyPriority: 3,
    ),
    SuitModification(
      id: modImprovedJumpAssist,
      name: 'Improved Jump Assist',
      effect: 'Jetpack prolongé — utile sur les grandes Colony Range',
      creditCost: 750000,
      engineerIds: <String>[yardenBond, baltanos],
      exobiologyPriority: 4,
    ),
    SuitModification(
      id: modIncreasedSprint,
      name: 'Increased Sprint Duration',
      effect: 'Sprint prolongé entre deux prélèvements',
      creditCost: 750000,
      engineerIds: <String>[terraVelasquez, baltanos],
      exobiologyPriority: 5,
    ),
    SuitModification(
      id: modNightVision,
      name: 'Night Vision',
      effect: 'Vision nocturne — échantillonnage côté nuit',
      creditCost: 1000000,
      engineerIds: <String>[odenGeiger, yiShen],
      exobiologyPriority: 6,
    ),
  ];

  /// Engineers relevant to an exobiologist, with an explicit combat flag so a
  /// pacifist commander is never routed into a dead end.
  static const List<Engineer> engineers = <Engineer>[
    Engineer(
      id: dominoGreen,
      name: 'Domino Green',
      system: 'Orishis',
      kind: EngineerKind.suit,
      unlockRequirements: <String>[
        'Parcourir 100 al en navettes Apex',
        'Livrer 5 unités de Push',
      ],
      requiresCombat: false,
      grants: <String>[modExtraBackpack, modReducedToolConsumption],
      notes: 'Porte d\'entrée de l\'arbre des ingénieurs à pied ; '
          'il réfère ensuite vers Kit Fowler.',
    ),
    Engineer(
      id: wellingtonBeck,
      name: 'Wellington Beck',
      system: 'Jolapa',
      kind: EngineerKind.suit,
      unlockRequirements: <String>[
        'Vendre 25 médias aux barmen (Multimedia / Classic Entertainment)',
        'Livrer 5 Insight Entertainment Suites',
      ],
      requiresCombat: false,
      grants: <String>[
        modImprovedBattery,
        modExtraBackpack,
        modReducedToolConsumption,
      ],
      notes: 'Fournit à lui seul trois des quatre mods utiles à l\'exobiologie.',
    ),
    Engineer(
      id: yardenBond,
      name: 'Yarden Bond',
      system: 'Bayan',
      kind: EngineerKind.suit,
      unlockRequirements: <String>['Vendre 8 Smear Campaign Plans aux barmen'],
      requiresCombat: false,
      grants: <String>[modImprovedJumpAssist],
      notes: 'Permet d\'obtenir Improved Jump Assist sans passer par '
          'Hero Ferrari.',
    ),
    Engineer(
      id: terraVelasquez,
      name: 'Terra Velasquez',
      system: 'Shou Xing',
      kind: EngineerKind.suit,
      unlockRequirements: <String>[
        '6 missions Covert Theft ou Covert Heist (infiltration furtive)',
      ],
      requiresCombat: false,
      grants: <String>[modIncreasedSprint],
    ),
    Engineer(
      id: odenGeiger,
      name: 'Oden Geiger',
      system: 'Candiaei',
      kind: EngineerKind.suit,
      unlockRequirements: <String>[
        'Vendre 20 échantillons biologiques ou données génétiques',
      ],
      requiresCombat: false,
      grants: <String>[modImprovedBattery, modNightVision],
      notes: 'Se débloque naturellement en faisant de l\'exobiologie.',
    ),
    Engineer(
      id: kitFowler,
      name: 'Kit Fowler',
      system: 'Capova',
      kind: EngineerKind.suit,
      unlockRequirements: <String>['Vendre des Opinion Polls aux barmen'],
      requiresCombat: false,
    ),
    Engineer(
      id: heroFerrari,
      name: 'Hero Ferrari',
      system: 'Siris',
      kind: EngineerKind.suit,
      unlockRequirements: <String>[
        '10 zones de conflit au sol',
        '15 Settlement Defence Plans',
      ],
      requiresCombat: true,
      grants: <String>[modImprovedJumpAssist, modIncreasedSprint],
      notes: 'Le seul ingénieur à pied exigeant du combat. '
          'Tous ses mods existent ailleurs : ignorable.',
    ),
    Engineer(
      id: baltanos,
      name: 'Baltanos',
      system: 'Deriso',
      kind: EngineerKind.suit,
      unlockRequirements: <String>['Réputation Colonia'],
      requiresCombat: false,
      grants: <String>[modImprovedJumpAssist, modIncreasedSprint],
      region: 'Colonia',
      notes: 'Plus facile à débloquer, mais à 22 000 al.',
    ),
    Engineer(
      id: yiShen,
      name: 'Yi Shen',
      system: 'Einheriar',
      kind: EngineerKind.suit,
      unlockRequirements: <String>['Réputation Colonia'],
      requiresCombat: false,
      grants: <String>[modNightVision],
      region: 'Colonia',
    ),
    Engineer(
      id: felicityFarseer,
      name: 'Felicity Farseer',
      system: 'Deciat',
      kind: EngineerKind.ship,
      unlockRequirements: <String>[
        'Rang Explorer « Scout » minimum',
        'Fournir 1 Meta-Alloy',
      ],
      requiresCombat: false,
      grants: <String>['fsd_increased_range', 'mass_manager', 'lightweight'],
      notes: 'Sa réputation monte en lui vendant des données d\'exploration : '
          'les tournées de scan servent donc double.',
    ),
  ];

  static Engineer engineerById(String id) =>
      engineers.firstWhere((Engineer engineer) => engineer.id == id);

  static SuitModification modificationById(String id) => suitModifications
      .firstWhere((SuitModification modification) => modification.id == id);

  /// Engineers reachable without ever firing a shot.
  static List<Engineer> get peacefulSuitEngineers => engineers
      .where((Engineer e) => e.kind == EngineerKind.suit && !e.requiresCombat)
      .toList(growable: false);

  /// Total materials needed to take an Artemis from [fromGrade] to [toGrade].
  static Map<String, int> materialsBetween(int fromGrade, int toGrade) {
    final Map<String, int> total = <String, int>{};
    for (final SuitGradeStep step in artemisGradeSteps) {
      if (step.fromGrade >= fromGrade && step.toGrade <= toGrade) {
        step.materials.forEach((String name, int quantity) {
          total[name] = (total[name] ?? 0) + quantity;
        });
      }
    }
    return total;
  }

  // --- Economic landmarks quoted by the guides ---------------------------

  /// Vista Genomics payout for the most valuable species, before bonuses.
  static const int stratumTectonicasBaseCr = 19010800;

  /// Same species with the First Logged bonus.
  ///
  /// The bonus is `base + 400 %`, i.e. exactly five times the base value. It is
  /// granted per `(species, body)` pair and only at the moment of sale — not on
  /// scan, and not on landing.
  static const int stratumTectonicasFirstLoggedCr = 95054000;

  /// The most valuable organism in the game, ahead of Stratum Tectonicas.
  static const int fonticuluaFluctusBaseCr = 20000000;

  /// Spansh "Expressway to Exomastery" recommended minimum system value.
  static const int expresswayMinimumValueCr = 16000000;

  /// Guardian FSD Booster 5H: +10.5 LY for 1.3 t.
  static const int guardianBooster5hPriceCr = 6000000;
  static const double guardianBooster5hRangeLy = 10.5;

  /// Fleet Carrier hull price, and the total the community recommends having
  /// before buying one (hull + services + about a year of upkeep).
  static const int fleetCarrierPriceCr = 5000000000;
  static const int fleetCarrierRecommendedTotalCr = 6000000000;

  /// Pranav Antal's Powerplay pledge bonus on exobiology sales.
  static const double pranavAntalExobiologyBonus = 0.30;

  /// Value of unsold organic data above which the roadmap starts insisting on
  /// a sale run: losing the ship or the Nomad wipes everything.
  static const int atRiskDataThresholdCr = 50000000;
}
