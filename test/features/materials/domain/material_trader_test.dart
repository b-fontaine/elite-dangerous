import 'package:elite_dangerous/features/materials/domain/entities/engineering_material.dart';
import 'package:elite_dangerous/features/materials/domain/services/material_trader.dart';
import 'package:flutter_test/flutter_test.dart';

/// The trader's rates are computed from two rules rather than tabulated, which
/// is only defensible if the rules reproduce the published table exactly. That
/// is what this file checks, row by row.
void main() {
  /// A material with no storage cap, so the table can be checked on its own
  /// terms before the caps come into it.
  EngineeringMaterial uncapped(int grade, String category) =>
      EngineeringMaterial(
        id: '$category$grade',
        name: '$category $grade',
        type: MaterialType.encoded,
        categoryId: category,
        grade: grade,
      );

  group('la table publiée, ligne par ligne', () {
    void expectRate(
      EngineeringMaterial from,
      EngineeringMaterial to,
      int spend,
      int receive,
    ) {
      expect(
        MaterialTrader.rateBetween(from, to),
        TraderRate(spend: spend, receive: receive),
        reason: '${from.name} → ${to.name}',
      );
    }

    test('monter d\'un grade coûte six, et trente-six hors catégorie', () {
      expectRate(uncapped(1, 'a'), uncapped(2, 'a'), 6, 1);
      expectRate(uncapped(1, 'a'), uncapped(2, 'b'), 36, 1);
    });

    test('deux et trois grades suivent la même puissance de six', () {
      expectRate(uncapped(1, 'a'), uncapped(3, 'a'), 36, 1);
      expectRate(uncapped(1, 'a'), uncapped(4, 'a'), 216, 1);
      expectRate(uncapped(1, 'a'), uncapped(3, 'b'), 216, 1);
    });

    test('changer de catégorie à grade égal coûte six pour un', () {
      expectRate(uncapped(3, 'a'), uncapped(3, 'b'), 6, 1);
    });

    test('descendre rend trois par grade, pas six', () {
      // L'asymétrie est le cœur du sujet : le trader prélève sa part dans les
      // deux sens, et une conversion aller-retour perd la moitié du stock.
      expectRate(uncapped(2, 'a'), uncapped(1, 'a'), 1, 3);
      expectRate(uncapped(3, 'a'), uncapped(1, 'a'), 1, 9);
      expectRate(uncapped(4, 'a'), uncapped(1, 'a'), 1, 27);
      expectRate(uncapped(5, 'a'), uncapped(1, 'a'), 1, 81);
    });

    test('descendre hors catégorie se simplifie en deux pour n', () {
      expectRate(uncapped(2, 'a'), uncapped(1, 'b'), 2, 1);
      expectRate(uncapped(3, 'a'), uncapped(1, 'b'), 2, 3);
      expectRate(uncapped(4, 'a'), uncapped(1, 'b'), 2, 9);
      expectRate(uncapped(5, 'a'), uncapped(1, 'b'), 2, 27);
    });

    test('un matériau ne s\'échange pas contre lui-même', () {
      expect(
        MaterialTrader.rateBetween(uncapped(3, 'a'), uncapped(3, 'a')),
        isNull,
      );
    });

    test('deux matériaux de même grade et même catégorie n\'ont pas de taux',
        () {
      // Le trader n'échange pas latéralement : deux G3 de la même famille ne
      // se troquent pas l'un contre l'autre.
      const EngineeringMaterial left = EngineeringMaterial(
        id: 'gauche',
        name: 'Gauche',
        type: MaterialType.encoded,
        categoryId: 'a',
        grade: 3,
      );
      const EngineeringMaterial right = EngineeringMaterial(
        id: 'droite',
        name: 'Droite',
        type: MaterialType.encoded,
        categoryId: 'a',
        grade: 3,
      );

      expect(MaterialTrader.rateBetween(left, right), isNull);
    });
  });

  group('ce qu\'aucun trader ne fera', () {
    const EngineeringMaterial encodedG1 = EngineeringMaterial(
      id: 'e1',
      name: 'Encodé 1',
      type: MaterialType.encoded,
      categoryId: 'a',
      grade: 1,
      storageCap: 300,
    );
    const EngineeringMaterial encodedG5 = EngineeringMaterial(
      id: 'e5',
      name: 'Encodé 5',
      type: MaterialType.encoded,
      categoryId: 'a',
      grade: 5,
      storageCap: 100,
    );

    test('les trois inventaires ne communiquent pas', () {
      // Aucune quantité de données n'achète un élément : ce sont trois
      // traders distincts, et c'est la limite que tout guide oublie.
      const EngineeringMaterial rawG1 = EngineeringMaterial(
        id: 'carbon',
        name: 'Carbon',
        type: MaterialType.raw,
        categoryId: 'raw_1',
        grade: 1,
        storageCap: 300,
      );

      expect(MaterialTrader.rateBetween(rawG1, encodedG5), isNull);
      expect(MaterialTrader.rateBetween(encodedG1, rawG1), isNull);
    });

    test('les composants à pied n\'ont pas de trader du tout', () {
      const EngineeringMaterial aerogel = EngineeringMaterial(
        id: 'aerogel',
        name: 'Aerogel',
        type: MaterialType.odyssey,
        categoryId: 'odyssey_component',
      );

      expect(MaterialTrader.rateBetween(aerogel, encodedG1), isNull);
      expect(MaterialTrader.rateBetween(encodedG1, aerogel), isNull);
    });

    test('quatre grades d\'écart demanderaient plus que le plafond', () {
      // 6⁴ = 1296 unités d'un G1, dont on ne peut en détenir que 300. Le taux
      // existe sur le papier et jamais dans une soute : le proposer enverrait
      // le commandant récolter pour rien.
      expect(MaterialTrader.rateBetween(encodedG1, encodedG5), isNull);
    });

    test('mais trois grades d\'écart, eux, tiennent dans la soute', () {
      const EngineeringMaterial encodedG4 = EngineeringMaterial(
        id: 'e4',
        name: 'Encodé 4',
        type: MaterialType.encoded,
        categoryId: 'a',
        grade: 4,
        storageCap: 150,
      );

      expect(
        MaterialTrader.rateBetween(encodedG1, encodedG4),
        const TraderRate(spend: 216, receive: 1),
      );
    });
  });

  group('ce que rend un stock donné', () {
    const EngineeringMaterial g5 = EngineeringMaterial(
      id: 'dataminedwake',
      name: 'Datamined Wake Exceptions',
      type: MaterialType.encoded,
      categoryId: 'encoded_wake_scans',
      grade: 5,
      storageCap: 100,
    );
    const EngineeringMaterial g1 = EngineeringMaterial(
      id: 'disruptedwakeechoes',
      name: 'Atypical Disrupted Wake Echoes',
      type: MaterialType.encoded,
      categoryId: 'encoded_wake_scans',
      grade: 1,
      storageCap: 300,
    );

    test('un G5 descendu en G1 rend bien quatre-vingt-un', () {
      // Le chiffre qui débloque la portée du FSD : plutôt que d'attendre le
      // bon grade de Wake Scan, on récolte n'importe lequel et on convertit.
      expect(MaterialTrader.yieldFrom(g5, g1, 1), 81);
      expect(MaterialTrader.yieldFrom(g5, g1, 2), 162);
    });

    test('un stock insuffisant ne rend rien plutôt qu\'une fraction', () {
      expect(MaterialTrader.yieldFrom(g1, g5, 5), 0);
      // 6 unités d'un G1 donnent bien une unité du grade au-dessus.
      const EngineeringMaterial g2 = EngineeringMaterial(
        id: 'fsdtelemetry',
        name: 'Anomalous FSD Telemetry',
        type: MaterialType.encoded,
        categoryId: 'encoded_wake_scans',
        grade: 2,
        storageCap: 250,
      );
      expect(MaterialTrader.yieldFrom(g1, g2, 5), 0);
      expect(MaterialTrader.yieldFrom(g1, g2, 6), 1);
      expect(MaterialTrader.yieldFrom(g1, g2, 13), 2);
    });
  });
}
