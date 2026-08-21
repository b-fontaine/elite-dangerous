import 'package:elite_dangerous/features/materials/domain/entities/blueprint.dart';
import 'package:elite_dangerous/features/materials/domain/entities/engineering_material.dart';
import 'package:elite_dangerous/features/materials/domain/entities/material_catalog.dart';
import 'package:elite_dangerous/features/materials/domain/entities/material_plan.dart';
import 'package:elite_dangerous/features/materials/domain/services/material_planner.dart';
import 'package:flutter_test/flutter_test.dart';

/// The planner answers the question the app could not: *what is still missing,
/// and what would close the gap*. Everything here is synthetic so the rules
/// are checked on their own, without the bundled data moving underneath.
void main() {
  const MaterialPlanner planner = MaterialPlanner();

  EngineeringMaterial encoded(String id, String name, int grade,
          {String category = 'wake'}) =>
      EngineeringMaterial(
        id: id,
        name: name,
        type: MaterialType.encoded,
        categoryId: category,
        grade: grade,
        storageCap: const <int, int>{1: 300, 2: 250, 3: 200, 4: 150, 5: 100}[
            grade],
      );

  final EngineeringMaterial echoes =
      encoded('disruptedwakeechoes', 'Atypical Disrupted Wake Echoes', 1);
  final EngineeringMaterial telemetry =
      encoded('fsdtelemetry', 'Anomalous FSD Telemetry', 2);
  final EngineeringMaterial solutions =
      encoded('wakesolutions', 'Strange Wake Solutions', 3);
  final EngineeringMaterial datamined =
      encoded('dataminedwake', 'Datamined Wake Exceptions', 5);
  const EngineeringMaterial aerogel = EngineeringMaterial(
    id: 'aerogel',
    name: 'Aerogel',
    type: MaterialType.odyssey,
    categoryId: 'odyssey_component',
  );
  const EngineeringMaterial schematic = EngineeringMaterial(
    id: 'suitschematic',
    name: 'Suit Schematic',
    type: MaterialType.odyssey,
    categoryId: 'odyssey_component',
  );

  final Blueprint range = Blueprint(
    id: 'fsd_increased_range',
    fdName: 'FSD_LongRange',
    name: 'Portée accrue',
    module: 'Frame Shift Drive',
    warning: 'Il faut un scanner de sillage.',
    engineers: const <BlueprintEngineer>[
      BlueprintEngineer(id: 'felicity_farseer', name: 'Felicity Farseer',
          maxGrade: 5),
    ],
    grades: <BlueprintGrade>[
      BlueprintGrade(
        grade: 1,
        rollsAtReputation5: 1,
        materials: <String, int>{echoes.id: 1},
      ),
      BlueprintGrade(
        grade: 2,
        rollsAtReputation5: 2,
        materials: <String, int>{echoes.id: 1},
      ),
      BlueprintGrade(
        grade: 3,
        rollsAtReputation5: 3,
        materials: <String, int>{solutions.id: 1},
      ),
      BlueprintGrade(
        grade: 5,
        rollsAtReputation5: 5,
        materials: <String, int>{datamined.id: 1},
      ),
    ],
  );

  final MaterialCatalog catalog = MaterialCatalog(
    edition: 'test',
    sources: const <String>[],
    storageCapsByGrade: const <int, int>{1: 300, 2: 250, 3: 200, 4: 150, 5: 100},
    categories: const <MaterialCategory>[],
    materials: <EngineeringMaterial>[
      echoes,
      telemetry,
      solutions,
      datamined,
      aerogel,
      schematic,
    ],
    sites: const <FarmingSite>[],
    blueprints: <Blueprint>[range],
    suits: <SuitUpgradePath>[
      const SuitUpgradePath(
        id: 'artemis',
        name: 'Artemis Suit',
        platingMaterialId: 'aerogel',
        steps: <SuitGradeStep>[
          SuitGradeStep(
            fromGrade: 1,
            toGrade: 2,
            materials: <String, int>{'aerogel': 2, 'suitschematic': 1},
            creditsCr: 600000,
          ),
          SuitGradeStep(
            fromGrade: 2,
            toGrade: 3,
            materials: <String, int>{'aerogel': 5, 'suitschematic': 2},
            creditsCr: 2250000,
          ),
        ],
      ),
    ],
    notes: const <String, String>{'suitCredits': 'À confirmer en jeu.'},
  );

  int neededOf(MaterialPlan plan, String id) => plan.requirements
      .firstWhere((MaterialRequirement r) => r.material.id == id)
      .needed;

  group('le coût d\'un blueprint', () {
    test('compte les rolls, pas les recettes', () {
      // C'est là que tout guide se trompe : le grade 5 se paie cinq fois, pas
      // une. Un plan qui lit la recette telle quelle annonce le cinquième du
      // vrai prix.
      final MaterialPlan plan = planner.planBlueprint(
        catalog: catalog,
        blueprint: range,
        fromGrade: 0,
        toGrade: 5,
        owned: const <String, int>{},
      );

      expect(neededOf(plan, 'disruptedwakeechoes'), 3); // 1×1 + 1×2
      expect(neededOf(plan, 'wakesolutions'), 3); // 1×3
      expect(neededOf(plan, 'dataminedwake'), 5); // 1×5
    });

    test('un grade déjà posé ne se repaie pas', () {
      final MaterialPlan plan = planner.planBlueprint(
        catalog: catalog,
        blueprint: range,
        fromGrade: 3,
        toGrade: 5,
        owned: const <String, int>{},
      );

      expect(
        plan.requirements.map((MaterialRequirement r) => r.material.id),
        <String>['dataminedwake'],
      );
      expect(plan.label, contains('grade 3 à 5'));
    });

    test('la mise en garde du blueprint reste sur le blueprint', () {
      // Elle est statique et déjà affichée à partir du blueprint : la recopier
      // dans le plan la ferait imprimer deux fois sur le même écran.
      final MaterialPlan plan = planner.planBlueprint(
        catalog: catalog,
        blueprint: range,
        fromGrade: 0,
        toGrade: 5,
        owned: const <String, int>{},
      );

      expect(plan.warnings, isEmpty);
      expect(range.warning, 'Il faut un scanner de sillage.');
    });

    test('viser plus haut que l\'ingénieur connu le dit', () {
      final Blueprint capped = Blueprint(
        id: range.id,
        fdName: range.fdName,
        name: range.name,
        module: range.module,
        engineers: const <BlueprintEngineer>[
          BlueprintEngineer(id: 'x', name: 'Quelqu\'un', maxGrade: 3),
        ],
        grades: range.grades,
      );

      final MaterialPlan plan = planner.planBlueprint(
        catalog: catalog,
        blueprint: capped,
        fromGrade: 0,
        toGrade: 5,
        owned: const <String, int>{},
      );

      expect(
        plan.warnings.any((String w) => w.contains('au-delà du grade 3')),
        isTrue,
      );
    });
  });

  group('le pont entre les deux vocabulaires', () {
    test('un inventaire nommé en anglais est reconnu', () {
      // Le journal plié indexe par nom, les recettes par symbole interne : si
      // les deux ne se rejoignaient pas, tout apparaîtrait à zéro.
      final MaterialPlan plan = planner.planBlueprint(
        catalog: catalog,
        blueprint: range,
        fromGrade: 4,
        toGrade: 5,
        owned: const <String, int>{'Datamined Wake Exceptions': 5},
      );

      expect(plan.isComplete, isTrue);
      expect(plan.missingTotal, 0);
    });

    test('un inventaire indexé par symbole l\'est tout autant', () {
      final MaterialPlan plan = planner.planBlueprint(
        catalog: catalog,
        blueprint: range,
        fromGrade: 4,
        toGrade: 5,
        owned: const <String, int>{'dataminedwake': 5},
      );

      expect(plan.isComplete, isTrue);
    });

    test('un matériau que le catalogue ignore est signalé, pas oublié', () {
      // Le laisser tomber ferait paraître le blueprint moins cher qu'il n'est
      // — la seule erreur qu'un plan ne doit jamais commettre.
      const Blueprint exotic = Blueprint(
        id: 'exotique',
        fdName: 'X',
        name: 'X',
        module: 'X',
        grades: <BlueprintGrade>[
          BlueprintGrade(
            grade: 1,
            rollsAtReputation5: 1,
            materials: <String, int>{'inconnuattendu': 4},
          ),
        ],
      );

      final MaterialPlan plan = planner.planBlueprint(
        catalog: catalog,
        blueprint: exotic,
        fromGrade: 0,
        toGrade: 1,
        owned: const <String, int>{},
      );

      expect(plan.unknownMaterialIds, <String>['inconnuattendu']);
      expect(plan.isComplete, isFalse);
    });
  });

  group('ce que le trader peut combler', () {
    test('un surplus de grade supérieur descend vers ce qui manque', () {
      final MaterialPlan plan = planner.planBlueprint(
        catalog: catalog,
        blueprint: range,
        fromGrade: 2,
        toGrade: 3,
        owned: const <String, int>{'Datamined Wake Exceptions': 1},
      );

      expect(plan.conversions, hasLength(1));
      final TraderConversion trade = plan.conversions.single;
      expect(trade.from.id, 'dataminedwake');
      expect(trade.to.id, 'wakesolutions');
      // 1 → 9 en descendant de deux grades, borné aux 3 unités manquantes.
      expect(trade.spend, 1);
      expect(trade.receive, 9);
    });

    test('rien de ce que le plan demande n\'est mis à l\'échange', () {
      // Le piège : proposer de troquer les Datamined Wake Exceptions que le
      // grade 5 réclame justement, et laisser le commandant les dépenser.
      final MaterialPlan plan = planner.planBlueprint(
        catalog: catalog,
        blueprint: range,
        fromGrade: 2,
        toGrade: 5,
        owned: const <String, int>{'Datamined Wake Exceptions': 5},
      );

      expect(
        plan.conversions.where(
          (TraderConversion trade) => trade.from.id == 'dataminedwake',
        ),
        isEmpty,
      );
    });

    test('seul le surplus au-delà du besoin est proposé', () {
      final MaterialPlan plan = planner.planBlueprint(
        catalog: catalog,
        blueprint: range,
        fromGrade: 2,
        toGrade: 5,
        owned: const <String, int>{'Datamined Wake Exceptions': 6},
      );

      final Iterable<TraderConversion> fromDatamined = plan.conversions.where(
        (TraderConversion trade) => trade.from.id == 'dataminedwake',
      );
      expect(fromDatamined, hasLength(1));
      expect(fromDatamined.single.spend, 1);
    });

    test('aucun échange n\'est proposé quand rien ne manque', () {
      final MaterialPlan plan = planner.planBlueprint(
        catalog: catalog,
        blueprint: range,
        fromGrade: 4,
        toGrade: 5,
        owned: const <String, int>{'Datamined Wake Exceptions': 5},
      );

      expect(plan.conversions, isEmpty);
    });

    test('un composant à pied ne se troque contre rien', () {
      final MaterialPlan plan = planner.planSuit(
        catalog: catalog,
        suit: catalog.suit('artemis')!,
        fromGrade: 1,
        toGrade: 2,
        owned: const <String, int>{'Aerogel': 40},
      );

      expect(plan.conversions, isEmpty);
      expect(plan.missingTotal, 1); // le Suit Schematic
    });
  });

  group('la montée en grade d\'une combinaison', () {
    test('additionne les paliers traversés, crédits compris', () {
      final MaterialPlan plan = planner.planSuit(
        catalog: catalog,
        suit: catalog.suit('artemis')!,
        fromGrade: 1,
        toGrade: 3,
        owned: const <String, int>{},
      );

      expect(neededOf(plan, 'aerogel'), 7); // 2 + 5
      expect(neededOf(plan, 'suitschematic'), 3); // 1 + 2
      expect(plan.creditsCr, 2850000);
    });

    test('la réserve sur les crédits voyage avec le chiffre', () {
      // Le montant vient du wiki seul : l'afficher sans le dire serait le
      // présenter comme vérifié.
      final MaterialPlan plan = planner.planSuit(
        catalog: catalog,
        suit: catalog.suit('artemis')!,
        fromGrade: 1,
        toGrade: 2,
        owned: const <String, int>{},
      );

      expect(plan.creditsCaveat, 'À confirmer en jeu.');
    });
  });

  test('les lignes les plus manquantes passent devant', () {
    final MaterialPlan plan = planner.planBlueprint(
      catalog: catalog,
      blueprint: range,
      fromGrade: 0,
      toGrade: 5,
      owned: const <String, int>{'Atypical Disrupted Wake Echoes': 3},
    );

    expect(plan.requirements.first.material.id, 'dataminedwake');
    expect(plan.requirements.last.material.id, 'disruptedwakeechoes');
    expect(plan.requirements.last.satisfied, isTrue);
  });
}
