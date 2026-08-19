import 'package:elite_dangerous/features/exobiology/domain/entities/suit.dart';
import 'package:elite_dangerous/features/exobiology/domain/services/exobiology_reference_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SuitLoadout', () {
    test('a grade 1 suit cannot be modified — it has no slot at all', () {
      const SuitLoadout suit =
          SuitLoadout(type: SuitType.artemis, grade: 1);

      expect(suit.isOwned, isTrue);
      expect(suit.canBeModified, isFalse);
      expect(suit.modificationSlots, 0);
    });

    test('each grade above 1 unlocks one slot, up to four at grade 5', () {
      for (final (int grade, int slots) in const <(int, int)>[
        (2, 1),
        (3, 2),
        (4, 3),
        (5, 4),
      ]) {
        expect(
          SuitLoadout(type: SuitType.artemis, grade: grade).modificationSlots,
          slots,
          reason: 'grade $grade should expose $slots slot(s)',
        );
      }
    });

    test('free slots account for already installed modifications', () {
      const SuitLoadout suit = SuitLoadout(
        type: SuitType.artemis,
        grade: 3,
        installedModificationIds: <String>{
          ExobiologyReferenceData.modImprovedBattery,
        },
      );

      expect(suit.freeModificationSlots, 1);
    });

    test('SuitLoadout.none is not owned', () {
      expect(const SuitLoadout.none().isOwned, isFalse);
    });
  });

  group('ExobiologyReferenceData.materialsBetween', () {
    test('grade 1 to 2 matches the Artemis table', () {
      expect(
        ExobiologyReferenceData.materialsBetween(1, 2),
        <String, int>{
          'Suit Schematic': 1,
          'Health Monitor': 1,
          'Manufacturing Instructions': 1,
          'Aerogel': 2,
          'Graphene': 2,
        },
      );
    });

    test('the full grade 1 to 5 run totals 12/12/12/28/28', () {
      expect(
        ExobiologyReferenceData.materialsBetween(1, 5),
        <String, int>{
          'Suit Schematic': 12,
          'Health Monitor': 12,
          'Manufacturing Instructions': 12,
          'Aerogel': 28,
          'Graphene': 28,
        },
      );
    });

    test('grades never cost credits', () {
      expect(ExobiologyReferenceData.gradesCostCredits, isFalse);
    });
  });

  group('peaceful engineers', () {
    test('Hero Ferrari is the only suit engineer requiring combat', () {
      final List<String> combatOnly = ExobiologyReferenceData.engineers
          .where((e) => e.requiresCombat)
          .map((e) => e.id)
          .toList();

      expect(combatOnly, <String>[ExobiologyReferenceData.heroFerrari]);
    });

    test('every modification an exobiologist needs has a peaceful engineer',
        () {
      final Set<String> peaceful = ExobiologyReferenceData.peacefulSuitEngineers
          .map((e) => e.id)
          .toSet();

      for (final SuitModification mod
          in ExobiologyReferenceData.suitModifications) {
        expect(
          mod.engineerIds.any(peaceful.contains),
          isTrue,
          reason: '${mod.name} has no peaceful engineer',
        );
      }
    });
  });
}
