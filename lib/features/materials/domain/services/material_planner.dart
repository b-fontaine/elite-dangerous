import '../entities/blueprint.dart';
import '../entities/engineering_material.dart';
import '../entities/material_catalog.dart';
import '../entities/material_plan.dart';
import 'material_trader.dart';

/// Turns a goal into "here is what is still missing, and here is what would
/// close the gap".
///
/// Pure and synchronous on purpose: every input is already in memory, and the
/// whole point of the exercise is that it works with no connection at all.
class MaterialPlanner {
  const MaterialPlanner();

  /// What taking [blueprint] from [fromGrade] to [toGrade] costs.
  ///
  /// [fromGrade] is the grade already installed, so the plan starts at the
  /// grade above it. Rolls are counted: a grade-4 recipe is paid four times at
  /// engineer reputation 5.
  MaterialPlan planBlueprint({
    required MaterialCatalog catalog,
    required Blueprint blueprint,
    required int fromGrade,
    required int toGrade,
    required Map<String, int> owned,
  }) {
    final Map<String, int> needed = <String, int>{};
    for (final BlueprintGrade grade in blueprint.grades) {
      if (grade.grade <= fromGrade || grade.grade > toGrade) {
        continue;
      }
      grade.totalMaterials.forEach((String id, int quantity) {
        needed[id] = (needed[id] ?? 0) + quantity;
      });
    }

    // Only what this plan *works out* goes in here. `blueprint.warning` is a
    // property of the blueprint, shown from the blueprint, and copying it in
    // would print it twice on any screen that renders both.
    final List<String> warnings = <String>[];
    final int reach = blueprint.engineers.fold<int>(
      0,
      (int best, BlueprintEngineer engineer) =>
          engineer.maxGrade > best ? engineer.maxGrade : best,
    );
    if (blueprint.engineers.isNotEmpty && toGrade > reach) {
      warnings.add(
        'Aucun des ingénieurs connus de l\'application ne pose ce blueprint '
        'au-delà du grade $reach.',
      );
    }

    return _build(
      catalog: catalog,
      label: '${blueprint.name} — grade $fromGrade à $toGrade',
      needed: needed,
      owned: owned,
      warnings: warnings,
    );
  }

  /// What one experimental effect costs. Applied once, so no rolls.
  MaterialPlan planExperimental({
    required MaterialCatalog catalog,
    required ExperimentalEffect effect,
    required Map<String, int> owned,
  }) =>
      _build(
        catalog: catalog,
        label: effect.name,
        needed: effect.materials,
        owned: owned,
      );

  /// What taking [suit] from [fromGrade] to [toGrade] costs.
  MaterialPlan planSuit({
    required MaterialCatalog catalog,
    required SuitUpgradePath suit,
    required int fromGrade,
    required int toGrade,
    required Map<String, int> owned,
  }) {
    final Map<String, int> needed = <String, int>{};
    int credits = 0;
    bool anyCredits = false;

    for (final SuitGradeStep step in suit.steps) {
      if (step.fromGrade < fromGrade || step.toGrade > toGrade) {
        continue;
      }
      step.materials.forEach((String id, int quantity) {
        needed[id] = (needed[id] ?? 0) + quantity;
      });
      if (step.creditsCr case final int cost) {
        credits += cost;
        anyCredits = true;
      }
    }

    return _build(
      catalog: catalog,
      label: '${suit.name} — grade $fromGrade à $toGrade',
      needed: needed,
      owned: owned,
      creditsCr: anyCredits ? credits : null,
      creditsCaveat: anyCredits ? catalog.notes['suitCredits'] : null,
    );
  }

  MaterialPlan _build({
    required MaterialCatalog catalog,
    required String label,
    required Map<String, int> needed,
    required Map<String, int> owned,
    int? creditsCr,
    String? creditsCaveat,
    List<String> warnings = const <String>[],
  }) {
    final Map<String, int> stock = _normalise(catalog, owned);
    final List<MaterialRequirement> requirements = <MaterialRequirement>[];
    final List<String> unknown = <String>[];

    for (final MapEntry<String, int> entry in needed.entries) {
      final EngineeringMaterial? material = catalog.resolve(entry.key);
      if (material == null) {
        unknown.add(entry.key);
        continue;
      }
      requirements.add(
        MaterialRequirement(
          material: material,
          needed: entry.value,
          owned: stock[material.id] ?? 0,
        ),
      );
    }

    // Scarcest first: what is missing most is what decides the trip.
    requirements.sort((MaterialRequirement a, MaterialRequirement b) {
      final int byMissing = b.missing.compareTo(a.missing);
      if (byMissing != 0) {
        return byMissing;
      }
      return a.material.name.compareTo(b.material.name);
    });

    return MaterialPlan(
      label: label,
      requirements: requirements,
      creditsCr: creditsCr,
      creditsCaveat: creditsCaveat,
      conversions: _conversions(catalog, requirements, stock),
      warnings: warnings,
      unknownMaterialIds: unknown,
    );
  }

  /// The inventory, keyed by material id.
  ///
  /// The folded inventory comes in keyed by English name, while recipes are
  /// written in journal symbols; [MaterialCatalog.resolve] accepts either, so
  /// this is where the two vocabularies meet. Anything the catalogue does not
  /// know is dropped, because it cannot take part in a plan either way.
  Map<String, int> _normalise(MaterialCatalog catalog, Map<String, int> owned) {
    final Map<String, int> stock = <String, int>{};
    owned.forEach((String key, int count) {
      final EngineeringMaterial? material = catalog.resolve(key);
      if (material != null) {
        stock[material.id] = (stock[material.id] ?? 0) + count;
      }
    });
    return stock;
  }

  /// Trades that would cover part of what is missing.
  ///
  /// Only surplus is ever spent: a material the plan itself needs is not
  /// offered up, and the working stock is decremented as trades are proposed,
  /// so the same units are never promised to two different shortfalls.
  List<TraderConversion> _conversions(
    MaterialCatalog catalog,
    List<MaterialRequirement> requirements,
    Map<String, int> stock,
  ) {
    // Everything the plan needs is off limits, down to the last unit.
    final Map<String, int> reserved = <String, int>{
      for (final MaterialRequirement requirement in requirements)
        requirement.material.id: requirement.needed,
    };
    final Map<String, int> spare = <String, int>{
      for (final MapEntry<String, int> entry in stock.entries)
        if (entry.value - (reserved[entry.key] ?? 0) > 0)
          entry.key: entry.value - (reserved[entry.key] ?? 0),
    };

    final List<TraderConversion> conversions = <TraderConversion>[];
    for (final MaterialRequirement requirement in requirements) {
      int stillMissing = requirement.missing;
      if (stillMissing == 0) {
        continue;
      }

      for (final EngineeringMaterial candidate
          in _cheapestFirst(catalog, requirement.material, spare)) {
        if (stillMissing == 0) {
          break;
        }
        final TraderRate? rate =
            MaterialTrader.rateBetween(candidate, requirement.material);
        final int available = spare[candidate.id] ?? 0;
        if (rate == null || available < rate.spend) {
          continue;
        }

        // Whole exchanges only, and never more than the shortfall.
        final int wanted = (stillMissing + rate.receive - 1) ~/ rate.receive;
        final int affordable = available ~/ rate.spend;
        final int exchanges = wanted < affordable ? wanted : affordable;
        if (exchanges == 0) {
          continue;
        }

        conversions.add(
          TraderConversion(
            from: candidate,
            to: requirement.material,
            rate: rate,
            spend: exchanges * rate.spend,
            receive: exchanges * rate.receive,
          ),
        );
        spare[candidate.id] = available - exchanges * rate.spend;
        stillMissing -= exchanges * rate.receive;
        if (stillMissing < 0) {
          stillMissing = 0;
        }
      }
    }
    return conversions;
  }

  /// Candidates the commander actually holds, cheapest exchange first.
  List<EngineeringMaterial> _cheapestFirst(
    MaterialCatalog catalog,
    EngineeringMaterial target,
    Map<String, int> spare,
  ) {
    final List<EngineeringMaterial> candidates = <EngineeringMaterial>[
      for (final EngineeringMaterial other in catalog.siblingsOf(target))
        if ((spare[other.id] ?? 0) > 0) other,
    ];
    candidates.sort((EngineeringMaterial a, EngineeringMaterial b) {
      final TraderRate? left = MaterialTrader.rateBetween(a, target);
      final TraderRate? right = MaterialTrader.rateBetween(b, target);
      if (left == null || right == null) {
        if (left == null && right == null) {
          return a.name.compareTo(b.name);
        }
        return left == null ? 1 : -1;
      }
      // Units spent for one unit received, lowest first.
      final double byCost =
          left.spend / left.receive - right.spend / right.receive;
      if (byCost != 0) {
        return byCost < 0 ? -1 : 1;
      }
      return a.name.compareTo(b.name);
    });
    return candidates;
  }
}
