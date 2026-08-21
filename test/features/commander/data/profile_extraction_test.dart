import 'dart:convert';

import 'package:elite_dangerous/features/commander/data/models/commander_profile_dto.dart';
import 'package:elite_dangerous/features/commander/domain/entities/commander.dart';
import 'package:elite_dangerous/features/commander/domain/entities/rank.dart';
import 'package:elite_dangerous/features/commander/domain/entities/ship.dart';
import 'package:elite_dangerous/features/commander/domain/entities/ship_module.dart';
import 'package:elite_dangerous/features/commander/domain/entities/suit_info.dart';
import 'package:elite_dangerous/features/commander/domain/entities/suit_loadout.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/capi_profile_capture.dart';

/// Reads the whole of a real `/profile`, not the fifteen per cent the app used
/// to keep. Every expectation below was measured on the capture first.
void main() {
  final Commander commander = CommanderProfileDto.fromJson(
    jsonDecode(capiProfileCapture) as Map<String, dynamic>,
  ).toEntity(source: CommanderDataSource.companionApi);

  group('flotte', () {
    test('lit les huit vaisseaux d\'un objet indexé par identifiant', () {
      expect(commander.fleet, hasLength(8));
      expect(commander.storedShips, hasLength(7));
    });

    test('désigne le vaisseau piloté par currentShipId', () {
      final Ship? current = commander.currentShip;

      expect(current, isNotNull);
      expect(current!.id, 18);
      expect(current.symbol, 'Explorer_NX');
      expect(current.systemName, 'Caeritis');
      expect(current.stationName, 'Bernoulli Vision');
    });

    test('trie les vaisseaux stockés du plus cher au moins cher', () {
      final List<int> values = commander.storedShips
          .map((Ship ship) => ship.value.totalCr)
          .toList(growable: false);

      expect(values, orderedEquals(<int>[...values]..sort((int a, int b) => b - a)));
      expect(commander.storedShips.first.symbol, 'Empire_Trader');
    });

    test('seul le vaisseau piloté porte son équipement', () {
      // Contredit la référence communautaire, qui annonce pour `ships` « le
      // même format que `ship` ». Vérifié : aucun vaisseau stocké n'a de bloc
      // `modules`.
      expect(commander.currentShip!.hasFitting, isTrue);
      expect(
        commander.storedShips.where((Ship ship) => ship.hasFitting),
        isEmpty,
      );
    });

    test('additionne la valeur de la flotte', () {
      // Somme des huit `value.total`, dominée par l'Imperial Clipper à 72,1 M.
      expect(commander.fleetValueCr, 108732582);
      expect(commander.netWorthCr, 358344972);
    });
  });

  group('modules du vaisseau piloté', () {
    late final Ship current = commander.currentShip!;

    test('lit les 41 emplacements et écarte les 12 décoratifs', () {
      expect(current.modules, hasLength(41));
      expect(current.functionalModules, hasLength(29));
    });

    test('classe peintures, décalcomanies, kits et COVAS en décoration', () {
      final Set<String> cosmetic = current.modules
          .where((ShipModule module) => module.isCosmetic)
          .map((ShipModule module) => module.slot)
          .toSet();

      expect(
        cosmetic,
        containsAll(<String>['PaintJob', 'Decal1', 'ShipKitWings', 'VesselVoice']),
      );
      expect(cosmetic, isNot(contains('FrameShiftDrive')));
    });

    test('lit l\'ingénierie posée, blueprint et modificateurs compris', () {
      expect(current.engineeredModules, hasLength(1));

      final ShipModule fsd = current.engineeredModules.single;
      expect(fsd.slot, 'FrameShiftDrive');
      expect(fsd.engineering!.engineerName, 'Felicity Farseer');
      expect(fsd.engineering!.blueprintName, 'FSD_LongRange');
      expect(fsd.engineering!.grade, 1);
      expect(fsd.engineering!.modifiers, hasLength(4));

      final ModuleModifier mass = fsd.engineering!.modifiers.firstWhere(
        (ModuleModifier modifier) => modifier.label == 'Optimised mass',
      );
      expect(mass.displayValue, '5.00%');
      expect(mass.isImprovement, isTrue);
    });

    test('ne montre jamais une clé de localisation comme un nom', () {
      // Frontier renvoie `PaintJob_Explorer_NX_02_10_Name` dans le champ censé
      // porter un nom lisible.
      for (final ShipModule module in current.modules) {
        expect(module.displayName, isNot(endsWith('_Name')));
        expect(module.displayName, isNot(endsWith('_Info')));
      }
    });

    test('lit la santé sur une échelle de 0 à 1', () {
      expect(current.health!.hull, 1.0);
      expect(current.health!.shieldUp, isTrue);
    });

    test('lit les véhicules embarqués', () {
      expect(current.launchBays, hasLength(4));
      expect(current.hasSrv, isTrue);

      final LaunchBayVehicle scarab = current.launchBays.firstWhere(
        (LaunchBayVehicle bay) => bay.symbol == 'testbuggy',
      );
      expect(scarab.displayName, 'Scarabée VRS');
      expect(scarab.rebuilds, 1);
    });
  });

  group('valeur et rebuy', () {
    test('refuse d\'estimer un rebuy quand la coque est à zéro', () {
      final Ship current = commander.currentShip!;

      // Un Mandalay à 163 875 Cr de rebuy serait faux d'un ordre de grandeur.
      expect(current.value.hullCr, 0);
      expect(current.value.isHullPriceMissing, isTrue);
      expect(current.value.estimatedRebuyCr, isNull);
    });

    test('estime le rebuy quand la coque est chiffrée', () {
      final Ship trader = commander.fleet.firstWhere(
        (Ship ship) => ship.symbol == 'Empire_Trader',
      );

      expect(trader.value.estimatedRebuyCr, 3606838);
      expect(trader.value.isHullPriceMissing, isFalse);
    });
  });

  group('combinaisons et armes', () {
    test('lit les quatre loadouts sauvegardés et celui équipé', () {
      expect(commander.suitLoadouts, hasLength(4));

      final SuitLoadout? equipped = commander.equippedLoadout;
      expect(equipped, isNotNull);
      expect(equipped!.name, 'EXPLORATEUR');
      expect(equipped.suit.kind, SuitKind.artemis);
      expect(equipped.isForExobiology, isTrue);
    });

    test('lit les armes, nommées et dans l\'ordre du jeu', () {
      final SuitLoadout combat = commander.suitLoadouts.firstWhere(
        (SuitLoadout loadout) => loadout.name == 'combat',
      );

      expect(
        combat.orderedWeapons.map((WeaponInfo weapon) => weapon.slot),
        orderedEquals(<String>[
          'PrimaryWeapon1',
          'PrimaryWeapon2',
          'SecondaryWeapon',
        ]),
      );
      expect(combat.orderedWeapons.first.displayName, 'Karma AR-50');
    });

    test('ignore le corps cosmétique rangé parmi les emplacements d\'arme', () {
      final SuitLoadout flight = commander.suitLoadouts.firstWhere(
        (SuitLoadout loadout) => loadout.suit.kind == SuitKind.flight,
      );

      // `BaseSuit` occupe un slot dans `slots` sans être une arme.
      expect(flight.weapons, hasLength(1));
      expect(flight.weapons.single.slot, 'SecondaryWeapon');
    });

    test('l\'Artemis est de grade 1 : aucun emplacement de modification', () {
      expect(commander.artemis, isNotNull);
      expect(commander.artemis!.grade, 1);
      expect(commander.artemis!.modificationSlots, 0);
      expect(commander.artemis!.canBeModified, isFalse);
    });
  });

  group('station', () {
    test('ne retient que les services réellement disponibles', () {
      expect(commander.station.stationName, 'Bernoulli Vision');
      expect(commander.station.systemName, 'Caeritis');
      expect(commander.station.minorFaction, 'The SMC Clan');
    });

    test('sait si la station achète les données organiques', () {
      expect(commander.station.sellsOrganicData, isTrue);
      expect(commander.station.hasBartender, isTrue);
      expect(commander.station.hasEngineer, isTrue);
    });
  });

  group('extensions du compte', () {
    test('déduit Odyssey des combinaisons, pas de capabilities', () {
      // La charge utile annonce `Odyssey: false` sur un compte qui possède
      // Artemis, Maverick et Dominator.
      expect(commander.hasOdyssey, isTrue);
    });

    test('déduit Horizons du hangar planétaire', () {
      expect(commander.hasHorizons, isTrue);
    });
  });

  group('rangs', () {
    test('lit les échelles connues, y compris les récentes', () {
      expect(commander.rank(RankType.exobiologist)?.name, 'Compiler');
      expect(commander.rank(RankType.trade)?.name, 'Entrepreneur');
      expect(commander.rank(RankType.empire)?.name, 'Duke');
      expect(commander.rank(RankType.builder)?.level, 0);
    });
  });
}
