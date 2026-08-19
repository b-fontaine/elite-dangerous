import 'package:elite_dangerous/features/exobiology/domain/entities/atmosphere_type.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/body_profile.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/commander_snapshot.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/organic_species.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/planet_class.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/species_conditions.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/suit.dart';
import 'package:elite_dangerous/features/exobiology/domain/services/exobiology_reference_data.dart';

/// A commander who has just installed the game: no suit, no engineers, no
/// credits worth mentioning.
const CommanderSnapshot rookieCommander = CommanderSnapshot(
  commanderName: 'CMDR Test',
  creditBalance: 2000000,
  currentSystem: 'Cubeo',
);

/// The profile described in `caspian-procedure-1-milliard.md`: 45 M Cr, no
/// engineer unlocked, Artemis still to buy, Explorer rank Pathfinder.
const CommanderSnapshot caspianCommander = CommanderSnapshot(
  commanderName: 'CMDR Caspian',
  creditBalance: 45480912,
  currentSystem: 'Cubeo',
  explorerRank: 4,
  shipName: 'Caspian Explorer',
  hasDetailedSurfaceScanner: true,
);

/// Artemis owned, grade 2, Wellington Beck unlocked, ready to install mods.
CommanderSnapshot equippedCommander({
  int exobiologyProfitCr = 0,
  int creditBalance = 60000000,
  Set<String> installedMods = const <String>{},
  int suitGrade = 2,
}) {
  return CommanderSnapshot(
    commanderName: 'CMDR Equipped',
    creditBalance: creditBalance,
    explorerRank: 4,
    shipName: 'Mandalay',
    hasDetailedSurfaceScanner: true,
    exobiologyProfitCr: exobiologyProfitCr,
    suit: SuitLoadout(
      type: SuitType.artemis,
      grade: suitGrade,
      installedModificationIds: installedMods,
    ),
    ownedSuitTypes: const <SuitType>{SuitType.artemis, SuitType.maverick},
    unlockedSuitEngineerIds: const <String>{
      ExobiologyReferenceData.dominoGreen,
      ExobiologyReferenceData.wellingtonBeck,
    },
    suitMaterials: const <String, int>{
      'Suit Schematic': 12,
      'Health Monitor': 12,
      'Manufacturing Instructions': 12,
      'Aerogel': 28,
      'Graphene': 28,
    },
  );
}

/// A hot, low-gravity high-metal-content world with a thin CO2 atmosphere and a
/// single biological signal — the textbook Stratum Tectonicas candidate.
const BodyProfile stratumCandidateBody = BodyProfile(
  name: 'Cubeo A 3 c',
  systemName: 'Cubeo',
  planetClass: PlanetClass.highMetalContentBody,
  atmosphere: AtmosphereType.carbonDioxide,
  surfaceTemperatureK: 190,
  surfaceGravityG: 0.21,
  distanceFromArrivalLs: 640,
  biologicalSignalCount: 1,
);

/// A tiny, deterministic catalogue used by the matcher tests. Real values are
/// loaded from `assets/data/exobiology_catalog.json` at runtime.
const List<OrganicSpecies> testCatalog = <OrganicSpecies>[
  OrganicSpecies(
    id: 'stratum_tectonicas',
    genusId: 'stratum',
    genusName: 'Stratum',
    name: 'Stratum Tectonicas',
    baseValueCr: 19010800,
    conditions: SpeciesConditions(
      planetClasses: <PlanetClass>{PlanetClass.highMetalContentBody},
      minTemperatureK: 165,
      maxGravityG: 0.27,
    ),
  ),
  OrganicSpecies(
    id: 'bacterium_aurasus',
    genusId: 'bacterium',
    genusName: 'Bacterium',
    name: 'Bacterium Aurasus',
    baseValueCr: 1000000,
    conditions: SpeciesConditions(
      atmospheres: <AtmosphereType>{AtmosphereType.carbonDioxide},
      maxGravityG: 0.27,
    ),
  ),
  OrganicSpecies(
    id: 'tussock_stigmasis',
    genusId: 'tussock',
    genusName: 'Tussock',
    name: 'Tussock Stigmasis',
    baseValueCr: 19010800,
    conditions: SpeciesConditions(
      planetClasses: <PlanetClass>{PlanetClass.rockyBody},
      atmospheres: <AtmosphereType>{AtmosphereType.sulphurDioxide},
      maxGravityG: 0.27,
    ),
  ),
  OrganicSpecies(
    id: 'clypeus_speculumi',
    genusId: 'clypeus',
    genusName: 'Clypeus',
    name: 'Clypeus Speculumi',
    baseValueCr: 16202800,
    conditions: SpeciesConditions(
      planetClasses: <PlanetClass>{
        PlanetClass.rockyBody,
        PlanetClass.highMetalContentBody,
      },
      minDistanceFromArrivalLs: 2500,
      maxGravityG: 0.27,
    ),
  ),
];
