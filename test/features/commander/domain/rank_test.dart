import 'package:elite_dangerous/features/commander/domain/entities/rank.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('échelles sans paliers publiés', () {
    // Frontier a ajouté `builder` et `learner` avec Trailblazers sans jamais
    // publier de noms de paliers. Les inventer serait pire que de compter.
    const List<RankType> unnamed = <RankType>[
      RankType.power,
      RankType.builder,
      RankType.learner,
    ];

    test('sont modélisées plutôt qu\'ignorées', () {
      for (final RankType type in unnamed) {
        expect(RankType.fromCapiKey(type.capiKey), type);
      }
    });

    test('affichent un numéro, jamais un nom inventé', () {
      for (final RankType type in unnamed) {
        expect(type.hasNamedTiers, isFalse);
        expect(type.nameFor(0), 'Aucun');
        expect(type.nameFor(3), 'Rang 3');
      }
    });

    test('ne calculent pas une barre de progression sur une longueur de -1', () {
      for (final RankType type in unnamed) {
        expect(type.maxLevel, 0);
        expect(
          RankProgress(type: type, level: 2).fraction,
          0,
          reason: 'sans palier connu, aucune fraction n\'est défendable',
        );
      }
    });

    test('ne sont jamais annoncées Elite', () {
      for (final RankType type in unnamed) {
        expect(RankProgress(type: type, level: 5).isElite, isFalse);
      }
    });
  });

  group('échelles nommées', () {
    test('conservent leurs paliers et leurs rangs Elite', () {
      expect(RankType.explore.hasNamedTiers, isTrue);
      expect(RankType.explore.nameFor(5), 'Pathfinder');
      expect(RankType.explore.nameFor(8), 'Elite');
      expect(RankType.explore.nameFor(9), 'Elite I');
      expect(const RankProgress(type: RankType.explore, level: 8).isElite, isTrue);
    });

    test('les échelles de superpuissance s\'arrêtent avant Elite', () {
      expect(RankType.empire.hasEliteTiers, isFalse);
      expect(RankType.empire.nameFor(12), 'Duke');
      expect(RankType.empire.maxLevel, 14);
    });

    test('un palier inconnu dégrade sans lever', () {
      expect(RankType.combat.nameFor(99), 'Rang 99');
    });

    test('un pourcentage du journal prime sur la position dans l\'échelle', () {
      const RankProgress progress = RankProgress(
        type: RankType.explore,
        level: 5,
        progressPercent: 42,
      );

      expect(progress.fraction, closeTo(0.42, 0.001));
    });
  });

  test('les treize clés CAPI observées sont toutes reconnues', () {
    // Relevées sur une vraie réponse `/profile`.
    const List<String> observed = <String>[
      'builder', 'combat', 'cqc', 'crime', 'empire', 'exobiologist', 'explore',
      'federation', 'learner', 'power', 'service', 'soldier', 'trade',
    ];

    final List<String> unmodelled = observed
        .where((String key) => RankType.fromCapiKey(key) == null)
        .toList(growable: false);

    // `crime` (notoriété) et `service` ne sont pas des échelles de rang :
    // Frontier les met dans le même objet sans qu'elles en soient.
    expect(unmodelled, orderedEquals(<String>['crime', 'service']));
  });
}
