import 'package:elite_dangerous/features/exobiology/domain/entities/engineer.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/suit.dart';
import 'package:elite_dangerous/features/exobiology/domain/services/exobiology_reference_data.dart';
import 'package:flutter_test/flutter_test.dart';

/// Five of the six suit modifications were listed one engineer short, which
/// sends a commander across the bubble for something on offer next door.
void main() {
  SuitModification modification(String id) => ExobiologyReferenceData
      .suitModifications
      .firstWhere((SuitModification m) => m.id == id);

  group('qui offre quoi', () {
    test('Rosa Dayette offre les trois mods d\'énergie et de sac', () {
      for (final String id in <String>[
        ExobiologyReferenceData.modImprovedBattery,
        ExobiologyReferenceData.modExtraBackpack,
        ExobiologyReferenceData.modReducedToolConsumption,
      ]) {
        expect(
          modification(id).engineerIds,
          contains(ExobiologyReferenceData.rosaDayette),
          reason: id,
        );
      }
    });

    test('Hero Ferrari offre aussi le saut et le sprint', () {
      for (final String id in <String>[
        ExobiologyReferenceData.modImprovedJumpAssist,
        ExobiologyReferenceData.modIncreasedSprint,
      ]) {
        expect(
          modification(id).engineerIds,
          contains(ExobiologyReferenceData.heroFerrari),
          reason: id,
        );
      }
    });

    test('Night Vision reste à deux, et c\'est exact', () {
      // La seule des six qui était déjà juste : l'élargir serait une
      // régression, pas une correction.
      expect(
        modification(ExobiologyReferenceData.modNightVision).engineerIds,
        <String>[
          ExobiologyReferenceData.odenGeiger,
          ExobiologyReferenceData.yiShen,
        ],
      );
    });
  });

  group('un ingénieur sans fiche ne casse rien', () {
    test('engineerById rend null plutôt que de lever', () {
      // Rosa Dayette est le cas réel : ce qu'elle offre est vérifié, son
      // système et son déblocage ne le sont pas, et la fiche manque donc
      // volontairement.
      expect(
        ExobiologyReferenceData.engineerById(
            ExobiologyReferenceData.rosaDayette),
        isNull,
      );
      expect(ExobiologyReferenceData.engineerById('personne'), isNull);
    });

    test('engineerNames saute les inconnus au lieu de tout perdre', () {
      final List<String> names = ExobiologyReferenceData.engineerNames(
        modification(ExobiologyReferenceData.modImprovedBattery).engineerIds,
      );

      expect(names, <String>['Wellington Beck', 'Oden Geiger']);
    });

    test('chaque fiche existante reste atteignable par son identifiant', () {
      for (final Engineer engineer in ExobiologyReferenceData.engineers) {
        expect(ExobiologyReferenceData.engineerById(engineer.id), engineer,
            reason: engineer.id);
      }
    });
  });
}
