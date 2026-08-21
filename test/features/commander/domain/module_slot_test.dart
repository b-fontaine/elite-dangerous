import 'dart:convert';

import 'package:elite_dangerous/features/commander/data/models/commander_profile_dto.dart';
import 'package:elite_dangerous/features/commander/domain/entities/commander.dart';
import 'package:elite_dangerous/features/commander/domain/entities/module_slot.dart';
import 'package:elite_dangerous/features/commander/domain/entities/ship.dart';
import 'package:elite_dangerous/features/commander/domain/entities/vehicle_names.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/capi_profile_capture.dart';

void main() {
  final Commander commander = CommanderProfileDto.fromJson(
    jsonDecode(capiProfileCapture) as Map<String, dynamic>,
  ).toEntity(source: CommanderDataSource.cache);
  final Ship ship = commander.currentShip!;

  List<ModuleSlot> slotsOf(ModuleSlotCategory category) =>
      ModuleSlotLayout.slotsFor(category, ship.functionalModules);

  group('classement par catégorie', () {
    test('sépare armes, utilitaires, internes principaux et optionnels', () {
      expect(
        ModuleSlotLayout.categoryOf('LargeHardpoint1'),
        ModuleSlotCategory.hardpoint,
      );
      // L'ordre du test compte : `TinyHardpoint` contient aussi « Hardpoint ».
      expect(
        ModuleSlotLayout.categoryOf('TinyHardpoint1'),
        ModuleSlotCategory.utility,
      );
      expect(
        ModuleSlotLayout.categoryOf('FrameShiftDrive'),
        ModuleSlotCategory.coreInternal,
      );
      expect(
        ModuleSlotLayout.categoryOf('Slot01_Size7'),
        ModuleSlotCategory.optionalInternal,
      );
    });

    test('les internes principaux suivent l\'ordre du jeu', () {
      final List<String> names = slotsOf(ModuleSlotCategory.coreInternal)
          .map((ModuleSlot slot) => slot.name)
          .toList(growable: false);

      expect(names.first, 'PowerPlant');
      expect(names, contains('FrameShiftDrive'));
      // Un emplacement principal ne peut pas être vide : aucun trou à combler.
      expect(
        slotsOf(ModuleSlotCategory.coreInternal)
            .every((ModuleSlot slot) => !slot.isEmpty),
        isTrue,
      );
    });

    test('toutes les catégories réunies rendent les modules fonctionnels', () {
      final int filled = <ModuleSlotCategory>[
        ...ModuleSlotCategory.values,
      ]
          .expand(slotsOf)
          .where((ModuleSlot slot) => !slot.isEmpty)
          .length;

      expect(filled, ship.functionalModules.length);
    });
  });

  group('emplacements vides', () {
    test('repère les trous de numérotation des internes optionnels', () {
      final List<ModuleSlot> slots = slotsOf(
        ModuleSlotCategory.optionalInternal,
      );
      final List<String> empty = slots
          .where((ModuleSlot slot) => slot.isEmpty)
          .map((ModuleSlot slot) => slot.name)
          .toList(growable: false);

      // La capture porte Slot01, 02, 03, 05, 08, 09, 11, 12, 13, 14.
      expect(empty, orderedEquals(<String>['Slot04', 'Slot06', 'Slot07',
          'Slot10']));
    });

    test('repère les points utilitaires vides', () {
      final List<String> empty = slotsOf(ModuleSlotCategory.utility)
          .where((ModuleSlot slot) => slot.isEmpty)
          .map((ModuleSlot slot) => slot.name)
          .toList(growable: false);

      // TinyHardpoint1, 2 et 5 sont occupés ; 3 et 4 ne le sont pas.
      expect(empty, orderedEquals(<String>['TinyHardpoint3', 'TinyHardpoint4']));
    });

    test('borne la taille d\'un emplacement vide au lieu de l\'affirmer', () {
      final ModuleSlot slot4 = slotsOf(ModuleSlotCategory.optionalInternal)
          .firstWhere((ModuleSlot slot) => slot.name == 'Slot04');

      // Slot03 fait 6 et Slot05 fait 5 : Slot04 vaut au plus 6, et rien dans
      // la charge utile ne dit lequel.
      expect(slot4.size, 6);
      expect(slot4.sizeIsBounded, isTrue);
    });

    test('un emplacement occupé connaît sa taille exactement', () {
      final ModuleSlot slot1 = slotsOf(ModuleSlotCategory.optionalInternal)
          .firstWhere((ModuleSlot slot) => slot.name == 'Slot01_Size7');

      expect(slot1.size, 7);
      expect(slot1.sizeIsBounded, isFalse);
    });

    test('ne prétend rien au-delà du dernier emplacement occupé', () {
      final List<ModuleSlot> slots = slotsOf(
        ModuleSlotCategory.optionalInternal,
      );

      // Un Slot15 vide ne laisse aucune trace dans la charge utile : le
      // deviner demanderait une table des plans de vaisseaux.
      expect(slots.last.name, 'Slot14_Size1');
      expect(slots.last.isEmpty, isFalse);
    });
  });

  group('noms de véhicules', () {
    test('lander01 s\'affiche Nomad', () {
      // Frontier renvoie `lander01_name`, une clé de localisation non résolue.
      expect(VehicleNames.resolve('lander01', locName: 'lander01_name'),
          'Nomad');
    });

    test('une vraie traduction de Frontier l\'emporte sur la table', () {
      expect(
        VehicleNames.resolve('testbuggy', locName: 'Scarabée VRS'),
        'Scarabée VRS',
      );
    });

    test('un véhicule inconnu garde son symbole plutôt qu\'une clé', () {
      expect(
        VehicleNames.resolve('quelquechose', locName: 'quelquechose_name'),
        'quelquechose',
      );
    });

    test('les loadouts sont traduits eux aussi', () {
      expect(
        VehicleNames.resolveLoadout('advanced',
            locName: 'lander01_loadout_advanced_name'),
        'Avancé',
      );
      expect(VehicleNames.resolveLoadout('starter', locName: 'Basique'),
          'Basique');
    });

    test('la capture affiche deux Nomad et deux VRS', () {
      final List<String> names = ship.launchBays
          .map((LaunchBayVehicle bay) => bay.displayName)
          .toList(growable: false);

      expect(names.where((String name) => name == 'Nomad'), hasLength(2));
      expect(names, contains('Scarabée VRS'));
      expect(names, contains('Scorpion VRS'));
      expect(names.any(VehicleNames.isLocalisationKey), isFalse);
    });

    test('le Nomad n\'est pas un VRS : il part d\'un hangar à vaisseaux', () {
      final LaunchBayVehicle nomad = ship.launchBays
          .firstWhere((LaunchBayVehicle bay) => bay.symbol == 'lander01');

      expect(nomad.isSrv, isFalse);
      expect(nomad.loadoutName, 'Avancé');
      expect(nomad.rebuilds, 8);
    });
  });
}
