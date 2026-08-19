import '../../../../core/format/credits.dart';
import '../entities/commander_snapshot.dart';
import '../entities/engineer.dart';
import '../entities/roadmap.dart';
import '../entities/suit.dart';
import 'exobiology_reference_data.dart';
import 'roadmap_rule.dart';
import 'roadmap_step_ids.dart';

/// The exobiology rule set.
///
/// Every rule below is a direct encoding of the shipped guides. Where the
/// guides disagree on ordering, the sequencing follows
/// `guide-exploration-exobiologie.html` § "Ce qu'il faut retenir", which puts a
/// profitable bubble loop *before* engineering: credits bought with an evening
/// of scanning are worth more than jump range you cannot yet exploit.
const List<RoadmapRule> exobiologyRoadmapRules = <RoadmapRule>[
  SellRunDisciplineRule(),
  BuyArtemisSuitRule(),
  DetailedSurfaceScannerRule(),
  ArtemisGradeTwoRule(),
  LearnSamplingLoopRule(),
  LearnStratumHeuristicRule(),
  BubbleLearningLoopRule(),
  FarmSuitMaterialsRule(),
  BuyMaverickSuitRule(),
  UnlockDominoGreenRule(),
  UnlockWellingtonBeckRule(),
  InstallImprovedBatteryRule(),
  InstallExtraBackpackRule(),
  InstallReducedToolConsumptionRule(),
  UnlockOdenGeigerRule(),
  UnlockFelicityFarseerRule(),
  EngineerFsdIncreasedRangeRule(),
  EngineerMassManagerRule(),
  UpgradeToExobiologyShipRule(),
  GuardianFsdBoosterRule(),
  DeepSpaceExpeditionRule(),
  PledgePranavAntalRule(),
  FleetCarrierRule(),
];

const RoadmapReference _artemisGuide = RoadmapReference(
  label: 'Guide Artemis Suit',
  guideId: 'artemis-suit',
);
const RoadmapReference _exobioGuide = RoadmapReference(
  label: 'Guide exploration & exobiologie',
  guideId: 'exploration-exobiologie',
);
const RoadmapReference _protocolGuide = RoadmapReference(
  label: 'Protocole 1 Md Cr',
  guideId: 'protocole-milliard',
);
const RoadmapReference _spansh = RoadmapReference(
  label: 'Spansh — Expressway to Exomastery',
  url: 'https://spansh.co.uk/exobiology',
);
const RoadmapReference _inaraNearest = RoadmapReference(
  label: 'INARA — services les plus proches',
  url: 'https://inara.cz/elite/nearest-stations/',
);

// ---------------------------------------------------------------------------
// Discipline
// ---------------------------------------------------------------------------

/// Unsold organic data is the only thing in this game you can lose in one
/// second. The guides repeat it more than any other advice, so the rule
/// outranks everything else and scales with how much is actually at stake.
class SellRunDisciplineRule extends RoadmapRule {
  const SellRunDisciplineRule();

  @override
  String get id => RoadmapStepIds.sellRun;

  @override
  RoadmapStep? evaluate(CommanderSnapshot snapshot) {
    final int atRisk = snapshot.unsoldOrganicDataCr;
    if (atRisk <= 0) {
      return null;
    }
    final bool urgent =
        atRisk >= ExobiologyReferenceData.atRiskDataThresholdCr;

    return RoadmapStep(
      id: id,
      title: 'Rentrer vendre tes données',
      summary: 'Tu transportes ${formatCredits(atRisk)} de données non vendues : '
          'une mort les efface intégralement.',
      rationale:
          'Les données cartographiques et génétiques ne sont validées qu\'à la '
          'vente. Tant qu\'elles sont en soute, la destruction du vaisseau — ou '
          'du Nomad, qui emporte toutes les données d\'exobiologie avec lui — '
          'les supprime définitivement. La discipline de vente vaut mieux que '
          'n\'importe quelle optimisation de build.',
      category: RoadmapCategory.discipline,
      phase: RoadmapPhase.apprentissage,
      status: RoadmapStatus.available,
      priority: urgent ? 1400 : 1150,
      impact: RoadmapImpact(
        creditGainCr: atRisk,
        sessions: 0.5,
        label: 'Sécurise ${formatCredits(atRisk)}',
      ),
      actions: <String>[
        'Localiser un Vista Genomics proche (concourse de station Odyssey)',
        'Vendre les données génétiques — la réputation avec la faction '
            'contrôlante monte quasi instantanément jusqu\'à Allied',
        'Vendre les données cartographiques à Universal Cartographics, '
            'ou à Felicity Farseer tant que sa réputation n\'est pas au Grade 5',
        'Ne jamais dépasser 2 sessions sans vendre pendant l\'apprentissage, '
            'ni 5 à 6 en expédition',
      ],
      references: <RoadmapReference>[_exobioGuide, _inaraNearest],
    );
  }
}

// ---------------------------------------------------------------------------
// Équipement
// ---------------------------------------------------------------------------

/// Nothing at all is possible without the Artemis: it is the only suit with a
/// Genetic Sampler.
class BuyArtemisSuitRule extends RoadmapRule {
  const BuyArtemisSuitRule();

  @override
  String get id => RoadmapStepIds.artemisSuit;

  @override
  RoadmapStep evaluate(CommanderSnapshot snapshot) {
    final bool owned = snapshot.canSampleOrganics;
    return RoadmapStep(
      id: id,
      title: 'Acheter l\'Artemis Suit',
      summary:
          'Sans Artemis, aucun prélèvement n\'est possible : c\'est le point '
          'de départ obligatoire.',
      rationale:
          'L\'Artemis est la seule combinaison du jeu à embarquer le Genetic '
          'Sampler. Elle s\'achète à n\'importe quel comptoir Pioneer Supplies, '
          'dans le concourse d\'une station Odyssey.',
      category: RoadmapCategory.equipment,
      phase: RoadmapPhase.equipement,
      status: owned ? RoadmapStatus.done : RoadmapStatus.available,
      priority: 1000,
      impact: const RoadmapImpact(
        sessions: 0.25,
        label: 'Débloque toute l\'activité',
      ),
      actions: const <String>[
        'Repérer un Pioneer Supplies via INARA (Nearest → Stations)',
        'Acheter l\'Artemis Suit',
        'Inspecter la vitrine : Pioneer Supplies vend parfois des '
            'combinaisons pré-améliorées jusqu\'au grade 3, parfois déjà '
            'moddées. Le stock est réattribué le jeudi après maintenance, '
            'premier arrivé premier servi',
        'Chercher de préférence dans les stations peu fréquentées, loin de '
            'l\'étoile principale : elles sont mieux garnies',
      ],
      references: const <RoadmapReference>[_artemisGuide, _inaraNearest],
    );
  }
}

/// The DSS roughly triples a body's value and is what reveals where the
/// biological zones actually are.
class DetailedSurfaceScannerRule extends RoadmapRule {
  const DetailedSurfaceScannerRule();

  @override
  String get id => RoadmapStepIds.detailedSurfaceScanner;

  @override
  RoadmapStep evaluate(CommanderSnapshot snapshot) {
    return RoadmapStep(
      id: id,
      title: 'Monter un Detailed Surface Scanner',
      summary:
          'Le DSS multiplie par ~3 la valeur d\'un corps et révèle les zones '
          'biologiques au sol.',
      rationale:
          'C\'est le module le plus rentable de la soute. Sans lui, tu '
          'atterris à l\'aveugle et tu laisses les deux tiers de la valeur de '
          'chaque corps sur la table. Un seul suffit : le bonus de +40 % de '
          'rayon de sonde ne se cumule pas.',
      category: RoadmapCategory.equipment,
      phase: RoadmapPhase.equipement,
      status: snapshot.hasDetailedSurfaceScanner
          ? RoadmapStatus.done
          : RoadmapStatus.available,
      priority: 950,
      impact: const RoadmapImpact(
        label: '×3 sur la valeur des corps cartographiés',
        sessions: 0.25,
      ),
      actions: const <String>[
        'Acheter un Detailed Surface Scanner en Outfitting (slot utilitaire)',
        'En orbite, throttle à zéro, tirer les sondes jusqu\'à 100 %',
        'Technique du limbe : viser au-delà du bord visible, la sonde '
            's\'incurve et frappe la face cachée',
        'Ne cartographier que : Earth-Like, Water World, Ammonia World, '
            'terraformables, et tout corps à signaux biologiques',
      ],
      references: const <RoadmapReference>[_exobioGuide],
    );
  }
}

/// A grade-1 suit has no modification slot at all.
class ArtemisGradeTwoRule extends RoadmapRule {
  const ArtemisGradeTwoRule();

  @override
  String get id => RoadmapStepIds.artemisGradeTwo;

  @override
  RoadmapStep evaluate(CommanderSnapshot snapshot) {
    final bool done = snapshot.canSampleOrganics && snapshot.suit.canBeModified;
    return RoadmapStep(
      id: id,
      title: 'Passer l\'Artemis au grade 2',
      summary:
          'Une combinaison grade 1 ne possède aucun emplacement de mod : le '
          'grade 2 est le vrai déblocage.',
      rationale:
          'Le grade se monte à Pioneer Supplies et ne coûte que des matériaux, '
          'jamais de crédits. Chaque grade ouvre un emplacement : 1 au grade 2, '
          '4 au grade 5. Pour un exobiologiste, viser le grade 3 avec deux bons '
          'mods suffit largement — les grades supérieurs n\'améliorent que les '
          'résistances, c\'est-à-dire un combat que tu ne comptes pas livrer.',
      category: RoadmapCategory.equipment,
      phase: RoadmapPhase.equipement,
      status: done ? RoadmapStatus.done : RoadmapStatus.available,
      priority: 900,
      prerequisiteStepIds: const <String>[RoadmapStepIds.artemisSuit],
      impact: const RoadmapImpact(
        sessions: 0.5,
        label: 'Ouvre 1 emplacement de modification',
      ),
      progress: (snapshot.suit.grade / 3).clamp(0.0, 1.0),
      progressLabel: 'Grade ${snapshot.suit.grade} / 3 visé',
      actions: <String>[
        'Réunir ${_materialList(ExobiologyReferenceData.materialsBetween(1, 2))}',
        'Monter le grade à Pioneer Supplies (aucun crédit demandé)',
        'Attention : l\'Artemis consomme de l\'Aerogel là où la Dominator et '
            'la Maverick réclament du plating — ne recopie pas une liste '
            'écrite pour une autre combinaison',
        'Un mod installé est définitif et écrase le précédent : réfléchis '
            'avant de valider',
      ],
      references: const <RoadmapReference>[_artemisGuide],
    );
  }

}

/// The Maverick's Arc Cutter is what actually opens the containers holding the
/// Artemis' own upgrade materials — a genuinely counter-intuitive step.
class BuyMaverickSuitRule extends RoadmapRule {
  const BuyMaverickSuitRule();

  @override
  String get id => RoadmapStepIds.maverickSuit;

  @override
  RoadmapStep? evaluate(CommanderSnapshot snapshot) {
    if (snapshot.suit.grade >= 3) {
      return null;
    }
    return RoadmapStep(
      id: id,
      title: 'Acheter une Maverick grade 3',
      summary:
          'L\'Artemis n\'est pas la bonne combinaison pour récolter les '
          'matériaux de l\'Artemis.',
      rationale:
          'L\'Arc Cutter — l\'outil qui découpe panneaux et conteneurs — est '
          'exclusif à la Maverick. Sans lui, la moitié du butin d\'une colonie '
          'reste inaccessible. Le grade 3 suffit largement pour du farming '
          'pacifique : tu n\'auras jamais besoin d\'y investir davantage.',
      category: RoadmapCategory.equipment,
      phase: RoadmapPhase.equipement,
      status: snapshot.ownsMaverick
          ? RoadmapStatus.done
          : RoadmapStatus.available,
      priority: 740,
      impact: const RoadmapImpact(
        sessions: 0.5,
        label: 'Divise le temps de farm des matériaux',
      ),
      actions: const <String>[
        'Guetter une Maverick pré-améliorée à Pioneer Supplies',
        'Emporter aussi E-Breach / Energylink et Profile Analyser '
            '(disponibles sur toutes les combinaisons)',
        'Garer le SRV au milieu de la colonie pour servir de dépôt '
            'intermédiaire',
      ],
      references: const <RoadmapReference>[_artemisGuide],
    );
  }
}

/// Quantified material shopping list, recomputed from what the commander
/// actually holds.
class FarmSuitMaterialsRule extends RoadmapRule {
  const FarmSuitMaterialsRule();

  /// The guide's recommendation for an exobiologist: grade 3, not grade 5.
  static const int targetGrade = 3;

  @override
  String get id => RoadmapStepIds.artemisMaterials;

  @override
  RoadmapStep? evaluate(CommanderSnapshot snapshot) {
    if (!snapshot.canSampleOrganics) {
      return null;
    }
    final int from = snapshot.suit.grade.clamp(1, targetGrade);
    if (from >= targetGrade) {
      return null;
    }

    final Map<String, int> required =
        ExobiologyReferenceData.materialsBetween(from, targetGrade);
    final Map<String, int> missing = <String, int>{};
    int held = 0;
    int total = 0;
    required.forEach((String material, int quantity) {
      final int owned = snapshot.suitMaterials[material] ?? 0;
      total += quantity;
      held += owned.clamp(0, quantity);
      final int lack = quantity - owned;
      if (lack > 0) {
        missing[material] = lack;
      }
    });

    final bool complete = missing.isEmpty;
    return RoadmapStep(
      id: id,
      title: 'Récolter les matériaux jusqu\'au grade $targetGrade',
      summary: complete
          ? 'Tu as tout ce qu\'il faut : direction Pioneer Supplies.'
          : 'Il te manque ${_materialList(missing)}.',
      rationale:
          'Depuis Update 18 (août 2024) les coûts ont été divisés par quatre et '
          'les Power Regulators ne sont plus nécessaires. Il ne reste que cinq '
          'matériaux, dont deux (Aerogel et Graphene) s\'échangent librement au '
          'comptoir du Bartender. Le goulot d\'étranglement, ce sont les '
          'Manufacturing Instructions et les Suit Schematics.',
      category: RoadmapCategory.materials,
      phase: RoadmapPhase.equipement,
      status: complete ? RoadmapStatus.available : RoadmapStatus.inProgress,
      priority: 780,
      prerequisiteStepIds: const <String>[RoadmapStepIds.artemisSuit],
      progress: total == 0 ? 1 : (held / total).clamp(0.0, 1.0),
      progressLabel: '$held / $total unités réunies',
      impact: const RoadmapImpact(sessions: 2, label: 'Ouvre 2 mods'),
      actions: const <String>[
        'Missions de réactivation : chercher un système en '
            '« infrastructure failure » sur INARA ou EDSM. La colonie est hors '
            'tension et déserte, et l\'habilitation 3 fournie autorise à tout '
            'piller légalement',
        'Rallumer le bâtiment PWR en priorité absolue : les pillards ne '
            'peuvent plus apparaître une fois le courant rétabli',
        'Se poser à une centaine de mètres en dehors de la colonie, pas sur '
            'la plateforme',
        'Ne jamais se déconnecter en cours de mission : un relog fait '
            'disparaître tout le butin ramassé',
        'Suit Schematics : bâtiments CMD et PWR des colonies militaires. '
            'Graphene : bâtiments Research. Manufacturing Instructions : '
            'data ports des sections Power et Command',
        'Compléter les manques au Bartender, qui échange les Assets entre eux '
            '(surplus de Graphene → Aerogel manquant)',
      ],
      references: const <RoadmapReference>[_artemisGuide],
    );
  }
}

// ---------------------------------------------------------------------------
// Déblocages d'ingénieurs à pied
// ---------------------------------------------------------------------------

abstract class _SuitEngineerRule extends RoadmapRule {
  const _SuitEngineerRule();

  String get engineerId;

  int get rulePriority;

  String get why;

  @override
  String get id => RoadmapStepIds.unlock(engineerId);

  @override
  RoadmapStep? evaluate(CommanderSnapshot snapshot) {
    if (!snapshot.canSampleOrganics) {
      return null;
    }
    final Engineer engineer =
        ExobiologyReferenceData.engineerById(engineerId);
    final bool unlocked =
        snapshot.unlockedSuitEngineerIds.contains(engineerId);
    return RoadmapStep(
      id: id,
      title: 'Débloquer ${engineer.name}',
      summary: why,
      rationale:
          '${engineer.name} se trouve à ${engineer.system}. '
          'Déblocage sans le moindre combat. '
          '${engineer.notes ?? ''}'.trim(),
      category: RoadmapCategory.unlock,
      phase: RoadmapPhase.equipement,
      status: unlocked ? RoadmapStatus.done : RoadmapStatus.available,
      priority: rulePriority,
      prerequisiteStepIds: const <String>[RoadmapStepIds.artemisGradeTwo],
      impact: RoadmapImpact(
        sessions: 1,
        label: 'Ouvre ${engineer.grants.length} mod(s)',
      ),
      actions: <String>[
        ...engineer.unlockRequirements,
        'Localiser les matériaux via INARA → Engineers → « Find Trade '
            'Offer », qui liste les stations et Fleet Carriers vendeurs',
      ],
      references: const <RoadmapReference>[_artemisGuide],
    );
  }
}

class UnlockDominoGreenRule extends _SuitEngineerRule {
  const UnlockDominoGreenRule();

  @override
  String get engineerId => ExobiologyReferenceData.dominoGreen;

  @override
  int get rulePriority => 760;

  @override
  String get why =>
      'La porte d\'entrée de l\'arbre des ingénieurs à pied : 100 al en '
      'navettes Apex et 5 unités de Push, aucun combat.';
}

class UnlockWellingtonBeckRule extends _SuitEngineerRule {
  const UnlockWellingtonBeckRule();

  @override
  String get engineerId => ExobiologyReferenceData.wellingtonBeck;

  @override
  int get rulePriority => 750;

  @override
  String get why =>
      'Il fournit à lui seul trois des quatre mods utiles à l\'exobiologie.';
}

class UnlockOdenGeigerRule extends _SuitEngineerRule {
  const UnlockOdenGeigerRule();

  @override
  String get engineerId => ExobiologyReferenceData.odenGeiger;

  @override
  int get rulePriority => 650;

  @override
  String get why =>
      'Il se débloque en vendant 20 échantillons biologiques : tu y arrives '
      'sans rien faire de spécial.';
}

// ---------------------------------------------------------------------------
// Modifications de combinaison
// ---------------------------------------------------------------------------

abstract class _SuitModificationRule extends RoadmapRule {
  const _SuitModificationRule();

  String get modificationId;

  int get rulePriority;

  @override
  String get id => RoadmapStepIds.engineering(modificationId);

  @override
  RoadmapStep? evaluate(CommanderSnapshot snapshot) {
    if (!snapshot.canSampleOrganics) {
      return null;
    }
    final SuitModification modification =
        ExobiologyReferenceData.modificationById(modificationId);

    if (snapshot.suit.installedModificationIds.contains(modificationId)) {
      return _step(
        modification,
        snapshot,
        status: RoadmapStatus.done,
        blockedReasons: const <String>[],
      );
    }

    final List<String> reasons = <String>[];
    if (!snapshot.suit.canBeModified) {
      reasons.add('L\'Artemis doit être au moins grade 2');
    } else if (snapshot.suit.freeModificationSlots == 0) {
      reasons.add(
        'Aucun emplacement libre : monte l\'Artemis d\'un grade '
        '(grade ${snapshot.suit.grade} → ${snapshot.suit.grade + 1})',
      );
    }
    final bool hasEngineer = modification.engineerIds
        .any(snapshot.unlockedSuitEngineerIds.contains);
    if (!hasEngineer) {
      final String names = modification.engineerIds
          .map((String id) => ExobiologyReferenceData.engineerById(id).name)
          .join(' ou ');
      reasons.add('Aucun ingénieur débloqué pour ce mod ($names)');
    }
    if (snapshot.creditBalance < modification.creditCost) {
      reasons.add('${formatCredits(modification.creditCost)} requis');
    }

    return _step(
      modification,
      snapshot,
      status:
          reasons.isEmpty ? RoadmapStatus.available : RoadmapStatus.blocked,
      blockedReasons: reasons,
    );
  }

  RoadmapStep _step(
    SuitModification modification,
    CommanderSnapshot snapshot, {
    required RoadmapStatus status,
    required List<String> blockedReasons,
  }) {
    final String engineers = modification.engineerIds
        .map((String id) => ExobiologyReferenceData.engineerById(id).name)
        .join(', ');
    return RoadmapStep(
      id: id,
      title: 'Installer ${modification.name}',
      summary: modification.effect,
      rationale:
          'Coût : ${formatCredits(modification.creditCost)} plus des matériaux, '
          'chez $engineers. Un mod installé ne peut jamais être retiré ni '
          'remplacé sans racheter une combinaison entière.',
      category: RoadmapCategory.engineering,
      phase: RoadmapPhase.equipement,
      status: status,
      priority: rulePriority,
      blockedReasons: blockedReasons,
      prerequisiteStepIds: const <String>[RoadmapStepIds.artemisGradeTwo],
      impact: RoadmapImpact(
        creditGainCr: -modification.creditCost,
        sessions: 0.5,
        label: modification.effect,
      ),
      actions: <String>[
        'Se rendre chez $engineers',
        'Vérifier qu\'un emplacement est libre '
            '(${snapshot.suit.freeModificationSlots} disponible(s))',
        'Installer ${modification.name}',
      ],
      references: const <RoadmapReference>[_artemisGuide],
    );
  }
}

class InstallImprovedBatteryRule extends _SuitModificationRule {
  const InstallImprovedBatteryRule();

  @override
  String get modificationId => ExobiologyReferenceData.modImprovedBattery;

  @override
  int get rulePriority => 730;
}

class InstallExtraBackpackRule extends _SuitModificationRule {
  const InstallExtraBackpackRule();

  @override
  String get modificationId => ExobiologyReferenceData.modExtraBackpack;

  @override
  int get rulePriority => 700;
}

class InstallReducedToolConsumptionRule extends _SuitModificationRule {
  const InstallReducedToolConsumptionRule();

  @override
  String get modificationId =>
      ExobiologyReferenceData.modReducedToolConsumption;

  @override
  int get rulePriority => 670;
}

// ---------------------------------------------------------------------------
// Technique de terrain
// ---------------------------------------------------------------------------

/// The sampling loop itself: cheap to learn, and it gates everything downstream.
class LearnSamplingLoopRule extends RoadmapRule {
  const LearnSamplingLoopRule();

  @override
  String get id => RoadmapStepIds.samplingLoop;

  @override
  RoadmapStep? evaluate(CommanderSnapshot snapshot) {
    if (!snapshot.canSampleOrganics) {
      return null;
    }
    final bool done = snapshot.distinctSpeciesSold >= 3;
    return RoadmapStep(
      id: id,
      title: 'Maîtriser la boucle de prélèvement',
      summary:
          'Trois échantillons par espèce, en respectant la Colony Range du '
          'genre.',
      rationale:
          '« Insufficient genetic diversity » signifie que tu es trop près du '
          'prélèvement précédent. Et scanner une autre espèce en cours de '
          'route réinitialise l\'échantillon partiel : termine toujours une '
          'espèce avant d\'en commencer une autre.',
      category: RoadmapCategory.technique,
      phase: RoadmapPhase.apprentissage,
      status: done ? RoadmapStatus.done : RoadmapStatus.available,
      priority: 850,
      progress: (snapshot.distinctSpeciesSold / 3).clamp(0.0, 1.0),
      progressLabel: '${snapshot.distinctSpeciesSold} / 3 espèces vendues',
      prerequisiteStepIds: const <String>[RoadmapStepIds.artemisSuit],
      impact: const RoadmapImpact(sessions: 1),
      actions: const <String>[
        'Se poser sur du terrain plat, près d\'une zone repérée au DSS',
        'Sortir à pied et activer le Scan Pulse',
        'Lire les couleurs : vert = à scanner ou en cours, bleu = déjà fait '
            'ou trop proche génétiquement, violet = autre espèce',
        'Prélever 3 échantillons de la même espèce en s\'éloignant au-delà de '
            'la Colony Range entre chacun',
        'Finir proprement chaque planète : une espèce vendue ne peut plus '
            'jamais être re-scannée sur ce corps',
      ],
      references: const <RoadmapReference>[_exobioGuide],
    );
  }
}

/// The single most valuable pattern-recognition skill in the activity.
class LearnStratumHeuristicRule extends RoadmapRule {
  const LearnStratumHeuristicRule();

  @override
  String get id => RoadmapStepIds.stratumHeuristic;

  @override
  RoadmapStep? evaluate(CommanderSnapshot snapshot) {
    if (!snapshot.canSampleOrganics) {
      return null;
    }
    final bool done = snapshot.distinctSpeciesSold >= 8;
    return RoadmapStep(
      id: id,
      title: 'Apprendre à repérer le Stratum Tectonicas',
      summary:
          'HMC + un seul signal biologique + plus de 165 K = très probablement '
          '${formatCredits(ExobiologyReferenceData.stratumTectonicasBaseCr)}.',
      rationale:
          'C\'est l\'espèce la plus rentable du jeu. Ignorer les bios à faible '
          'valeur pour ne viser que les espèces au-dessus de '
          '${formatCredits(ExobiologyReferenceData.expresswayMinimumValueCr)} est '
          'le facteur numéro un de vitesse de gain.',
      category: RoadmapCategory.technique,
      phase: RoadmapPhase.apprentissage,
      status: done ? RoadmapStatus.done : RoadmapStatus.available,
      priority: 800,
      progress: (snapshot.distinctSpeciesSold / 8).clamp(0.0, 1.0),
      progressLabel: '${snapshot.distinctSpeciesSold} / 8 espèces vendues',
      prerequisiteStepIds: const <String>[RoadmapStepIds.samplingLoop],
      impact: const RoadmapImpact(
        creditGainPerSessionCr: 20000000,
        sessions: 1,
      ),
      actions: <String>[
        'Utiliser l\'onglet Identification de l\'app : saisir le type de '
            'corps, l\'atmosphère, la gravité et la température pour obtenir '
            'les espèces candidates et leur valeur',
        'Filtrer sur Spansh Body Search : High metal content world, '
            'gravité < 0,27 g, atmosphère ténue, température > 165 K',
        'Privilégier les corps à moins de 1500 sl de leur étoile : le '
            'supercruise coûte souvent plus cher que la récolte',
      ],
      references: const <RoadmapReference>[_exobioGuide, _spansh],
    );
  }
}

// ---------------------------------------------------------------------------
// Boucle rentable
// ---------------------------------------------------------------------------

/// The money-maker: repeatable, low-risk, near the bubble.
class BubbleLearningLoopRule extends RoadmapRule {
  const BubbleLearningLoopRule();

  /// The guides' checkpoint before considering a deep-space expedition.
  static const int targetProfitCr = 100000000;

  @override
  String get id => RoadmapStepIds.bubbleLoop;

  @override
  RoadmapStep? evaluate(CommanderSnapshot snapshot) {
    if (!snapshot.canSampleOrganics) {
      return null;
    }
    final bool done = snapshot.exobiologyProfitCr >= targetProfitCr;
    return RoadmapStep(
      id: id,
      title: 'Enchaîner les tournées près de la Bulle',
      summary:
          'Objectif ${formatCredits(targetProfitCr)} de profit exobio : apprendre '
          'les gestes sans risque avant de partir loin.',
      rationale:
          'Près de la Bulle tu perds le multiplicateur First Footfall — les '
          'colons NPC ont foulé ces planètes il y a des siècles — mais tu '
          'gagnes un volume élevé de spécimens, des retours rapides et un '
          'risque quasi nul. C\'est la stratégie du « Bubble Billionaire », et '
          'elle fonctionne très bien. Un débutant réalise 30 à 50 % des '
          'chiffres annoncés sur YouTube : c\'est normal, la courbe monte vite.',
      category: RoadmapCategory.expedition,
      phase: RoadmapPhase.apprentissage,
      status: done ? RoadmapStatus.done : RoadmapStatus.inProgress,
      priority: 810,
      prerequisiteStepIds: const <String>[RoadmapStepIds.artemisGradeTwo],
      progress:
          (snapshot.exobiologyProfitCr / targetProfitCr).clamp(0.0, 1.0),
      progressLabel:
          '${formatCredits(snapshot.exobiologyProfitCr)} / ${formatCredits(targetProfitCr)}',
      impact: const RoadmapImpact(
        creditGainPerSessionCr: 40000000,
        sessions: 6,
      ),
      actions: <String>[
        'Générer une route « Expressway to Exomastery » sur Spansh depuis ton '
            'système, valeur minimale '
            '${formatCredits(ExobiologyReferenceData.expresswayMinimumValueCr)}, '
            'rayon 50 à 100 al, case « Avoid Thargoids » cochée',
        'À chaque système : honk → scoop si l\'étoile est KGBFOAM → FSS → '
            'repérer les corps à « Biological Signals »',
        'DSS uniquement les corps à signaux bio et les corps à haute valeur',
        'Vendre à Vista Genomics toutes les 2 sessions maximum',
      ],
      references: const <RoadmapReference>[_exobioGuide, _spansh],
    );
  }
}

// ---------------------------------------------------------------------------
// Ingénierie de vaisseau
// ---------------------------------------------------------------------------

class UnlockFelicityFarseerRule extends RoadmapRule {
  const UnlockFelicityFarseerRule();

  @override
  String get id => RoadmapStepIds.unlockPrefix + ExobiologyReferenceData.felicityFarseer;

  @override
  RoadmapStep evaluate(CommanderSnapshot snapshot) {
    final bool unlocked = snapshot.unlockedShipEngineerIds
        .contains(ExobiologyReferenceData.felicityFarseer);
    final List<String> reasons = <String>[];
    if (!snapshot.meetsFarseerRankRequirement) {
      reasons.add('Rang Explorer « Scout » requis');
    }

    return RoadmapStep(
      id: id,
      title: 'Débloquer Felicity Farseer',
      summary:
          'Le seul ingénieur qui compte vraiment : 1 Meta-Alloy suffit, et '
          'aucun combat.',
      rationale:
          'Farseer est installée à Deciat. Sa réputation se monte en lui '
          'vendant des données d\'exploration — ce qui tombe bien, tes '
          'tournées de scan servent donc double. C\'est le plus gros gain de '
          'portée de ta carrière.',
      category: RoadmapCategory.unlock,
      phase: RoadmapPhase.ingenierie,
      status: unlocked
          ? RoadmapStatus.done
          : (reasons.isEmpty
              ? RoadmapStatus.available
              : RoadmapStatus.blocked),
      priority: 640,
      blockedReasons: reasons,
      impact: const RoadmapImpact(sessions: 2, label: 'Ouvre le FSD G5'),
      actions: <String>[
        if (!snapshot.hasMetaAlloy)
          'Acheter 1 Meta-Alloy — INARA → « Meta-Alloys » → Find Trade Offer '
              '(région de Maia historiquement, souvent des Fleet Carriers)',
        'Se rendre à Deciat, base Farseer Inc (Deciat 6 A)',
        'Lui vendre toutes tes données d\'exploration jusqu\'au Grade 5 '
            '(~24 M Cr de données au total)',
        'Ne pas vendre ailleurs tant que le Grade 5 n\'est pas atteint',
      ],
      references: const <RoadmapReference>[_exobioGuide, _protocolGuide],
    );
  }
}

class EngineerFsdIncreasedRangeRule extends RoadmapRule {
  const EngineerFsdIncreasedRangeRule();

  @override
  String get id => RoadmapStepIds.fsdIncreasedRange;

  @override
  RoadmapStep evaluate(CommanderSnapshot snapshot) {
    return RoadmapStep(
      id: id,
      title: 'FSD Increased Range G1 → G5',
      summary:
          'Le plus gros gain de portée disponible sans combat ni Guardian.',
      rationale:
          'Les matériaux se farment sans combat : Raw en SRV à la surface, '
          'Encoded au Jameson Crash Site (HIP 12099, planète 1 B), '
          'Manufactured via les High Grade Emissions des systèmes en Boom ou '
          'War. Les Material Traders comblent le reste, à un taux défavorable '
          'mais avec un gain de temps énorme.',
      category: RoadmapCategory.engineering,
      phase: RoadmapPhase.ingenierie,
      status: snapshot.hasFsdIncreasedRangeG5
          ? RoadmapStatus.done
          : RoadmapStatus.available,
      priority: 620,
      prerequisiteStepIds: const <String>[RoadmapStepIds.unlockPrefix + ExobiologyReferenceData.felicityFarseer],
      impact: const RoadmapImpact(sessions: 3, label: '+10 à 15 LY'),
      actions: const <String>[
        'Farmer les matériaux en une session dédiée plutôt qu\'en '
            'allers-retours',
        'Fabriquer des Fast Boot FSD de grade 3 pour monter les grades vite : '
            'le composant nécessaire s\'achète au lieu de se farmer',
        'Poser Increased Range G1 → G5 chez Farseer',
        'En profiter pour passer les Sensors en Lightweight',
      ],
      references: const <RoadmapReference>[_exobioGuide, _protocolGuide],
    );
  }
}

class EngineerMassManagerRule extends RoadmapRule {
  const EngineerMassManagerRule();

  @override
  String get id => RoadmapStepIds.massManager;

  @override
  RoadmapStep evaluate(CommanderSnapshot snapshot) {
    return RoadmapStep(
      id: id,
      title: 'Poser l\'effet expérimental Mass Manager',
      summary: 'Débloqué au Grade 5, il ajoute quelques années-lumière gratuites.',
      rationale:
          'Mass Manager n\'est proposé qu\'une fois le blueprint au Grade 5. '
          'C\'est la dernière marche de l\'optimisation FSD sans Guardian.',
      category: RoadmapCategory.engineering,
      phase: RoadmapPhase.ingenierie,
      status:
          snapshot.hasMassManager ? RoadmapStatus.done : RoadmapStatus.available,
      priority: 600,
      prerequisiteStepIds: const <String>[RoadmapStepIds.fsdIncreasedRange],
      impact: const RoadmapImpact(sessions: 0.5, label: '+2 à 4 LY'),
      actions: const <String>[
        'Chez Farseer, appliquer l\'effet expérimental Mass Manager sur le FSD',
        'Recalculer les routes sur Spansh avec le nouveau build (export SLEF '
            'depuis EDSY)',
      ],
      references: const <RoadmapReference>[_protocolGuide],
    );
  }
}

class GuardianFsdBoosterRule extends RoadmapRule {
  const GuardianFsdBoosterRule();

  @override
  String get id => RoadmapStepIds.guardianFsdBooster;

  @override
  RoadmapStep evaluate(CommanderSnapshot snapshot) {
    return RoadmapStep(
      id: id,
      title: 'Débloquer le Guardian FSD Booster 5H',
      summary:
          '+${ExobiologyReferenceData.guardianBooster5hRangeLy} LY pour 1,3 t : '
          'le meilleur rapport gain/poids du jeu.',
      rationale:
          'Le déblocage est définitif : une fois obtenu, tu en achètes autant '
          'que tu veux, pour n\'importe quel vaisseau, à vie. Bonne nouvelle '
          'pour un profil non combattant : les Sentinels se combattent en SRV, '
          'ton rang de combat n\'a aucune importance, et c\'est le plasma du '
          'SRV qui fait le travail — les lasers de vaisseau sont inefficaces '
          'contre eux.',
      category: RoadmapCategory.unlock,
      phase: RoadmapPhase.ingenierie,
      status: snapshot.hasGuardianFsdBooster
          ? RoadmapStatus.done
          : RoadmapStatus.available,
      priority: 480,
      impact: const RoadmapImpact(
        creditGainCr: -ExobiologyReferenceData.guardianBooster5hPriceCr,
        sessions: 2,
        label: '+${ExobiologyReferenceData.guardianBooster5hRangeLy} LY '
            'définitifs',
      ),
      actions: const <String>[
        'Se rendre sur un site Guardian : Synuefe NL-N C23-4 B 3 ou '
            'HD 63154 B 3 A',
        'Récolter 1 Guardian Module Blueprint Fragment, 21 Guardian Power '
            'Cells, 21 Guardian Technology Components, 24 Focus Crystals et '
            '8 HN Shock Mounts',
        'Affronter les Sentinels un par un en SRV, frein à main pour encaisser '
            'les explosions, ruines en couverture',
        'Débloquer au Guardian Technology Broker puis acheter le 5H',
      ],
      references: const <RoadmapReference>[_exobioGuide],
    );
  }
}

/// The Mandalay is the consensus exobiology ship and costs a fraction of what
/// most commanders assume.
class UpgradeToExobiologyShipRule extends RoadmapRule {
  const UpgradeToExobiologyShipRule();

  static const int mandalayPriceCr = 17639220;

  static const Set<String> _capableShips = <String>{
    'mandalay',
    'caspian',
    'caspian explorer',
    'diamondback explorer',
    'asp explorer',
    'krait phantom',
    'anaconda',
    'dolphin',
  };

  @override
  String get id => RoadmapStepIds.exobiologyShip;

  @override
  RoadmapStep? evaluate(CommanderSnapshot snapshot) {
    final String ship = (snapshot.shipName ?? '').toLowerCase();
    final bool capable =
        _capableShips.any(ship.contains);
    if (capable) {
      return null;
    }
    final bool affordable = snapshot.creditBalance >= mandalayPriceCr * 1.4;
    return RoadmapStep(
      id: id,
      title: 'Passer au Mandalay',
      summary:
          'Dix-sept millions pour le meilleur outil d\'exobiologie du jeu.',
      rationale:
          'Sa rampe d\'embarquement se trouve sous le cockpit, ce qui permet '
          'd\'aligner visuellement l\'atterrissage sur le spécimen visé, et le '
          'plancher du cockpit est transparent. Ajoute une signature thermique '
          'très basse, une maniabilité comparable au Diamondback Explorer et '
          'un scoop de taille 6. Un vaisseau qui saute à 90 al mais se pose '
          'mal fait perdre plus de temps qu\'il n\'en fait gagner, quand on '
          'atterrit trente fois par soirée.',
      category: RoadmapCategory.equipment,
      phase: RoadmapPhase.apprentissage,
      status: affordable ? RoadmapStatus.available : RoadmapStatus.blocked,
      priority: 520,
      blockedReasons: affordable
          ? const <String>[]
          : <String>[
              'Prévoir ${formatCredits((mandalayPriceCr * 1.4).round())} '
                  '(coque + équipement + rebuy)',
            ],
      impact: const RoadmapImpact(
        creditGainCr: -mandalayPriceCr,
        sessions: 1,
        label: 'Atterrissages nettement plus rapides',
      ),
      actions: const <String>[
        'Acheter le Mandalay (~17,6 M Cr de coque)',
        'Build type : plus gros FSD SCO A-raté, Fuel Scoop A maximal, DSS, '
            'Planetary Vehicle Hangar taille 2, 1 AFMU D-ratée éteinte, '
            '1 Heat Sink, bouclier léger 3D ou 4D, aucune arme',
        'Descendre en classe D tout ce qui n\'est pas critique, puis alléger '
            'en Lightweight G5',
        'Vérifier la portée réelle sur EDSY avant d\'acheter',
      ],
      references: const <RoadmapReference>[_exobioGuide],
    );
  }
}

// ---------------------------------------------------------------------------
// Expédition et économie
// ---------------------------------------------------------------------------

class DeepSpaceExpeditionRule extends RoadmapRule {
  const DeepSpaceExpeditionRule();

  @override
  String get id => RoadmapStepIds.deepSpaceExpedition;

  @override
  RoadmapStep evaluate(CommanderSnapshot snapshot) {
    final List<String> reasons = <String>[];
    if (snapshot.exobiologyProfitCr <
        BubbleLearningLoopRule.targetProfitCr) {
      reasons.add(
        'Finir d\'abord la boucle près de la Bulle '
        '(${formatCredits(snapshot.exobiologyProfitCr)} / '
        '${formatCredits(BubbleLearningLoopRule.targetProfitCr)})',
      );
    }
    if (!snapshot.hasFsdIncreasedRangeG5) {
      reasons.add('FSD Increased Range G5 fortement recommandé');
    }

    return RoadmapStep(
      id: id,
      title: 'Partir en expédition en espace vierge',
      summary:
          'Le multiplicateur ×5 du First Logged : un Stratum Tectonicas passe à '
          '${formatCredits(ExobiologyReferenceData.stratumTectonicasFirstLoggedCr)}.',
      rationale:
          'Précision que la plupart des guides escamotent : le bonus qui paie '
          's\'appelle First Logged — premier commandant à VENDRE cette espèce '
          'depuis ce corps — et il vaut cinq fois la valeur de base. Le First '
          'Footfall, lui, ne rapporte pas un crédit : il inscrit seulement ton '
          'nom sur la carte du système. Les deux sont confondus parce qu\'un '
          'corps jamais foulé est en pratique un First Logged garanti sur '
          'toutes ses espèces. Concrètement : vise 500 à 2000 al hors des '
          'routes fréquentées, en évitant l\'axe Sol–Colonia–Sagittarius A* et '
          'les zones balisées par les expéditions Distant Worlds, déjà '
          'ratissées. Aucun outil ne garantit un système jamais visité — 95 % '
          'des joueurs n\'uploadent pas leurs données — mais au-delà de '
          '~1000 al de Sol les corps vierges deviennent fréquents.',
      category: RoadmapCategory.expedition,
      phase: RoadmapPhase.expedition,
      status:
          reasons.isEmpty ? RoadmapStatus.available : RoadmapStatus.blocked,
      priority: 420,
      blockedReasons: reasons,
      prerequisiteStepIds: const <String>[RoadmapStepIds.bubbleLoop],
      impact: const RoadmapImpact(
        creditGainPerSessionCr: 100000000,
        sessions: 7,
      ),
      actions: const <String>[
        'Tracer la route sur le Neutron Router de Spansh',
        'Découper en sessions : 1 trajet aller, 4 à 5 d\'exploitation, '
            '1 retour et vente',
        'Ne jamais dépasser 5 à 6 sessions sans vendre : le risque cumulé '
            'devient inacceptable',
        'Se déconnecter uniquement en position sûre — posé ou en orbite '
            'haute, jamais en descente',
        'Vérifier sur la carte du système qu\'aucun nom de commandant n\'est '
            'déjà associé à l\'espèce : s\'il y en a un, le ×5 est perdu',
        'Sur Spansh Body Search, filtrer « Last Updated At » avant le '
            '19 mai 2021 (sortie d\'Odyssey) pour cibler des corps jamais '
            'foulés',
      ],
      references: const <RoadmapReference>[_exobioGuide, _spansh],
    );
  }
}

class PledgePranavAntalRule extends RoadmapRule {
  const PledgePranavAntalRule();

  @override
  String get id => RoadmapStepIds.pranavAntal;

  @override
  RoadmapStep? evaluate(CommanderSnapshot snapshot) {
    if (snapshot.exobiologyProfitCr < 50000000) {
      return null;
    }
    return RoadmapStep(
      id: id,
      title: 'S\'engager auprès de Pranav Antal',
      summary:
          'Jusqu\'à +30 % sur les ventes d\'exobiologie dans les systèmes '
          'qu\'il contrôle.',
      rationale:
          'Sur un objectif à un milliard, cela représente environ 230 millions '
          'de crédits gratuits. Deux réserves : l\'engagement Powerplay demande '
          'du temps consacré aux mérites, et une défection fait perdre les '
          'bonus. Ne vends pas dans le système capitale : il ne donne ni bonus '
          'ni mérites.',
      category: RoadmapCategory.economy,
      phase: RoadmapPhase.expedition,
      status: snapshot.hasExobiologySalesBonus
          ? RoadmapStatus.done
          : RoadmapStatus.available,
      priority: 380,
      impact: const RoadmapImpact(label: '+30 % sur chaque vente exobio'),
      actions: const <String>[
        'S\'engager auprès de Pranav Antal depuis le panneau Powerplay',
        'Vendre à Vista Genomics dans un système contrôlé, hors capitale',
      ],
      references: const <RoadmapReference>[_exobioGuide],
    );
  }
}

class FleetCarrierRule extends RoadmapRule {
  const FleetCarrierRule();

  @override
  String get id => RoadmapStepIds.fleetCarrier;

  @override
  RoadmapStep? evaluate(CommanderSnapshot snapshot) {
    if (snapshot.creditBalance < 1000000000) {
      return null;
    }
    final bool ready = snapshot.creditBalance >=
        ExobiologyReferenceData.fleetCarrierRecommendedTotalCr;
    return RoadmapStep(
      id: id,
      title: 'Acheter un Fleet Carrier — mais pas à 5 milliards',
      summary:
          'Viser ${formatCredits(ExobiologyReferenceData.fleetCarrierRecommendedTotalCr)} '
          'au total : coque, services et environ un an d\'entretien.',
      rationale:
          'Le seuil de faillite se déclenche à 250 M de dette, soit environ '
          'dix semaines d\'impayés tous services activés. Son intérêt réel '
          'n\'est pas financier mais logistique : Universal Cartographics et '
          'Vista Genomics à bord, le carrier posé en espace profond, et tu '
          'vends sur place sans jamais rentrer dans la Bulle.',
      category: RoadmapCategory.economy,
      phase: RoadmapPhase.industrialisation,
      status: ready ? RoadmapStatus.available : RoadmapStatus.blocked,
      priority: 200,
      blockedReasons: ready
          ? const <String>[]
          : <String>[
              'Réserve insuffisante : '
                  '${formatCredits(snapshot.creditBalance)} / '
                  '${formatCredits(ExobiologyReferenceData.fleetCarrierRecommendedTotalCr)}',
            ],
      progress: (snapshot.creditBalance /
              ExobiologyReferenceData.fleetCarrierRecommendedTotalCr)
          .clamp(0.0, 1.0),
      progressLabel: formatCredits(snapshot.creditBalance),
      impact: const RoadmapImpact(sessions: 1),
      actions: const <String>[
        'Acheter la coque (5 000 000 000 Cr)',
        'Installer Universal Cartographics et Vista Genomics à bord',
        'Garder une réserve : entretien hebdomadaire ~30 M Cr tous services',
      ],
      references: const <RoadmapReference>[_exobioGuide],
    );
  }
}

// ---------------------------------------------------------------------------
// Formatting helpers
// ---------------------------------------------------------------------------

String _materialList(Map<String, int> materials) {
  if (materials.isEmpty) {
    return 'aucun matériau';
  }
  return materials.entries
      .map((MapEntry<String, int> entry) => '${entry.value} ${entry.key}')
      .join(', ');
}
