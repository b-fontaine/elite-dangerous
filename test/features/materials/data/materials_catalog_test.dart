import 'package:elite_dangerous/features/journal/domain/services/micro_resource_names.dart';
import 'package:elite_dangerous/features/materials/data/datasources/material_catalog_asset_data_source.dart';
import 'package:elite_dangerous/features/materials/domain/entities/blueprint.dart';
import 'package:elite_dangerous/features/materials/domain/entities/engineering_material.dart';
import 'package:elite_dangerous/features/materials/domain/entities/material_catalog.dart';
import 'package:elite_dangerous/features/materials/domain/entities/material_plan.dart';
import 'package:elite_dangerous/features/materials/domain/services/material_planner.dart';
import 'package:flutter_test/flutter_test.dart';

/// The shipped data, checked against itself and against the parser that has to
/// meet it halfway. Authored files drift; the point of this file is that they
/// cannot drift silently.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MaterialCatalog catalog;

  setUpAll(() async {
    catalog = (await const MaterialCatalogAssetDataSource().load()).toEntity();
  });

  group('les deux assets se chargent et se tiennent', () {
    test('les 108 matériaux échangeables sont là, et rien de plus', () {
      // 28 Raw, 50 Manufactured, 30 Encoded. Les matériaux Guardian et
      // Thargoid n'en sont pas : aucun trader ne les touche.
      final Map<MaterialType, int> counts = <MaterialType, int>{};
      for (final EngineeringMaterial material in catalog.materials) {
        counts[material.type] = (counts[material.type] ?? 0) + 1;
      }

      expect(counts[MaterialType.raw], 28);
      expect(counts[MaterialType.manufactured], 50);
      expect(counts[MaterialType.encoded], 30);
      expect(counts[MaterialType.odyssey], greaterThanOrEqualTo(5));
    });

    test('aucun matériau brut de grade 5 : les Raw s\'arrêtent à 4', () {
      expect(
        catalog.materials
            .where((EngineeringMaterial m) => m.type == MaterialType.raw)
            .map((EngineeringMaterial m) => m.grade)
            .toSet(),
        <int>{1, 2, 3, 4},
      );
    });

    test('chaque matériau pointe une catégorie qui existe', () {
      final List<String> orphans = <String>[
        for (final EngineeringMaterial material in catalog.materials)
          if (catalog.categoryOf(material) == null) material.id,
      ];

      expect(orphans, isEmpty);
    });

    test('chaque matériau sait dire comment on l\'obtient', () {
      // Une ligne sans la moindre source est une ligne qui ne répond pas à la
      // question posée.
      final List<String> silent = <String>[
        for (final EngineeringMaterial material in catalog.materials)
          if (catalog.sourcesFor(material).isEmpty) material.id,
      ];

      expect(silent, isEmpty);
    });

    test('les plafonds suivent le grade', () {
      expect(catalog.storageCapsByGrade,
          <int, int>{1: 300, 2: 250, 3: 200, 4: 150, 5: 100});
      for (final EngineeringMaterial material in catalog.materials) {
        if (material.grade case final int grade) {
          expect(material.storageCap, catalog.storageCapsByGrade[grade],
              reason: material.id);
        }
      }
    });
  });

  group('les recettes ne nomment que du connu', () {
    test('chaque ingrédient de blueprint se résout', () {
      final List<String> unknown = <String>[
        for (final Blueprint blueprint in catalog.blueprints) ...<String>[
          for (final BlueprintGrade grade in blueprint.grades)
            for (final String id in grade.materials.keys)
              if (catalog.resolve(id) == null) '${blueprint.id}/$id',
          for (final ExperimentalEffect effect in blueprint.experimentals)
            for (final String id in effect.materials.keys)
              if (catalog.resolve(id) == null) '${effect.id}/$id',
        ],
      ];

      expect(unknown, isEmpty);
    });

    test('chaque ingrédient de combinaison se résout', () {
      final List<String> unknown = <String>[
        for (final SuitUpgradePath suit in catalog.suits)
          for (final SuitGradeStep step in suit.steps)
            for (final String id in step.materials.keys)
              if (catalog.resolve(id) == null) '${suit.id}/$id',
      ];

      expect(unknown, isEmpty);
    });

    test('les trois combinaisons ne diffèrent que par leur plating', () {
      // Copier une liste écrite pour une autre combinaison est l'erreur
      // classique : ce test la rendrait visible.
      final List<SuitUpgradePath> suits = catalog.suits;
      expect(suits, hasLength(3));

      Set<String> withoutPlating(SuitUpgradePath suit) => <String>{
            for (final SuitGradeStep step in suit.steps)
              for (final String id in step.materials.keys)
                if (id != suit.platingMaterialId) id,
          };

      final Set<String> reference = withoutPlating(suits.first);
      for (final SuitUpgradePath suit in suits.skip(1)) {
        expect(withoutPlating(suit), reference, reason: suit.id);
      }
      expect(
        suits.map((SuitUpgradePath s) => s.platingMaterialId).toSet(),
        <String>{'aerogel', 'carbonfibreplating', 'titaniumplating'},
      );
    });
  });

  group('le catalogue et le parser parlent la même langue', () {
    test('chaque matériau du catalogue est nommé par MicroResourceNames', () {
      // Sans cela l'inventaire plié — indexé par nom canonique — ne
      // rejoindrait aucune recette, et tout apparaîtrait à zéro.
      final List<String> broken = <String>[
        for (final EngineeringMaterial material in catalog.materials)
          if (MicroResourceNames.canonical(material.id, null) != material.name)
            '${material.id} → '
                '${MicroResourceNames.canonical(material.id, null)} '
                '≠ ${material.name}',
      ];

      expect(broken, isEmpty);
    });

    test('la table ne connaît rien que le catalogue ignore, hors referrals',
        () {
      // Les huit objets de referral d'ingénieur ne sont pas des matériaux de
      // fabrication : ils sont nommés pour l'affichage et n'entrent dans
      // aucune recette embarquée.
      const Set<String> referralOnly = <String>{
        'settlementdefenceplans',
        'geneticrepairmeds',
        'financialprojections',
        'surveillanceequipment',
        'opinionpolls',
        'smearcampaignplans',
        'insightentertainmentsuite',
        'push',
      };

      final List<String> extra = <String>[
        for (final String symbol in MicroResourceNames.knownSymbols)
          if (catalog.resolve(symbol) == null && !referralOnly.contains(symbol))
            symbol,
      ];

      expect(extra, isEmpty);
    });

    test('un nom localisé ne l\'emporte jamais sur le nom du jeu', () {
      // Le défaut d'origine : sur un client français l'inventaire arrivait en
      // français et ne rejoignait plus rien.
      expect(
        MicroResourceNames.canonical('dataminedwake', 'Sillage exploité'),
        'Datamined Wake Exceptions',
      );
      expect(
        MicroResourceNames.canonical('manganese', 'Manganèse'),
        'Manganese',
      );
    });
  });

  group('le cas qui a motivé tout ceci', () {
    const MaterialPlanner planner = MaterialPlanner();

    test('la portée du FSD, de zéro, coûte 41 unités', () {
      final Blueprint fsd = catalog.blueprint('fsd_increased_range')!;
      final MaterialPlan plan = planner.planBlueprint(
        catalog: catalog,
        blueprint: fsd,
        fromGrade: 0,
        toGrade: 5,
        owned: const <String, int>{},
      );

      expect(plan.missingTotal, 41);
      expect(
        plan.requirements
            .firstWhere((MaterialRequirement r) =>
                r.material.id == 'dataminedwake')
            .needed,
        5,
      );
    });

    test('et dit ce qui bloque : les quatre encodés sont des Wake Scans', () {
      final Blueprint fsd = catalog.blueprint('fsd_increased_range')!;
      final Set<String> encodedCategories = <String>{
        for (final BlueprintGrade grade in fsd.grades)
          for (final String id in grade.materials.keys)
            if (catalog.resolve(id) case final EngineeringMaterial material)
              if (material.type == MaterialType.encoded) material.categoryId,
      };

      expect(encodedCategories, <String>{'encoded_wake_scans'});
      expect(fsd.warning, contains('Wake Scanner'));
    });

    test('un seul Datamined Wake Exceptions couvre les grades bas', () {
      // Le raccourci que le document a mis au jour : récolter n'importe quel
      // Wake Scan puis descendre chez le trader.
      final Blueprint fsd = catalog.blueprint('fsd_increased_range')!;
      final MaterialPlan plan = planner.planBlueprint(
        catalog: catalog,
        blueprint: fsd,
        fromGrade: 0,
        toGrade: 3,
        owned: const <String, int>{'Datamined Wake Exceptions': 1},
      );

      final Iterable<TraderConversion> trades = plan.conversions.where(
        (TraderConversion t) => t.from.id == 'dataminedwake',
      );
      expect(trades, isNotEmpty);
      expect(trades.first.spend, 1);
    });

    test('les cinq composants de l\'Artemis disent où les trouver', () {
      final SuitUpgradePath artemis = catalog.suit('artemis')!;
      final SuitGradeStep first = artemis.steps.first;

      for (final String id in first.materials.keys) {
        final EngineeringMaterial material = catalog.resolve(id)!;
        expect(catalog.sourcesFor(material), isNotEmpty, reason: id);
      }
      expect(first.materials.keys, contains('aerogel'));
      expect(first.materials.keys, contains('manufacturinginstructions'));
    });
  });

  test('Dav\'s Hope porte les coordonnées Live, pas celles de Legacy', () {
    // Tous les vieux guides citent 44.8180, -31.3893 et font atterrir au
    // mauvais endroit.
    final FarmingSite davs =
        catalog.sites.firstWhere((FarmingSite s) => s.id == 'davs_hope');

    expect(davs.latitude, closeTo(50.5426, 0.001));
    expect(davs.longitude, closeTo(137.4150, 0.001));
    expect(davs.note, contains('Legacy'));
  });
}
