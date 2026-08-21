import 'package:equatable/equatable.dart';

import '../services/material_trader.dart';
import 'engineering_material.dart';

/// One line of a plan: what is needed, and what the commander already holds.
class MaterialRequirement extends Equatable {
  const MaterialRequirement({
    required this.material,
    required this.needed,
    required this.owned,
  });

  final EngineeringMaterial material;
  final int needed;
  final int owned;

  int get missing => needed - owned < 0 ? 0 : needed - owned;

  bool get satisfied => missing == 0;

  @override
  List<Object?> get props => <Object?>[material, needed, owned];
}

/// A trade that would cover part of a shortfall.
class TraderConversion extends Equatable {
  const TraderConversion({
    required this.from,
    required this.to,
    required this.rate,
    required this.spend,
    required this.receive,
  });

  final EngineeringMaterial from;
  final EngineeringMaterial to;
  final TraderRate rate;

  /// Units of [from] to hand over, and units of [to] that come back — already
  /// rounded down to whole exchanges and capped at what is actually missing.
  final int spend;
  final int receive;

  @override
  List<Object?> get props => <Object?>[from, to, rate, spend, receive];
}

/// What a goal costs, measured against what the commander has.
class MaterialPlan extends Equatable {
  const MaterialPlan({
    required this.label,
    required this.requirements,
    this.creditsCr,
    this.creditsCaveat,
    this.conversions = const <TraderConversion>[],
    this.warnings = const <String>[],
    this.unknownMaterialIds = const <String>[],
  });

  const MaterialPlan.empty()
      : label = '',
        requirements = const <MaterialRequirement>[],
        creditsCr = null,
        creditsCaveat = null,
        conversions = const <TraderConversion>[],
        warnings = const <String>[],
        unknownMaterialIds = const <String>[];

  /// What this plan is for, e.g. `Portée accrue — grade 1 à 5`.
  final String label;

  final List<MaterialRequirement> requirements;

  final int? creditsCr;

  /// Why the credit figure should not be trusted blindly, when that applies.
  final String? creditsCaveat;

  /// Trades that would close part of the gap. Empty when nothing helps.
  final List<TraderConversion> conversions;

  /// What would stop the commander from finishing this at all.
  final List<String> warnings;

  /// Material ids the recipe names and the catalogue does not know.
  ///
  /// Surfaced rather than dropped: a plan silently missing a line would read
  /// as cheaper than it is, which is the one error worth never making here.
  final List<String> unknownMaterialIds;

  Iterable<MaterialRequirement> get missing =>
      requirements.where((MaterialRequirement r) => !r.satisfied);

  int get missingTotal => missing.fold<int>(
        0,
        (int sum, MaterialRequirement r) => sum + r.missing,
      );

  bool get isComplete => missingTotal == 0 && unknownMaterialIds.isEmpty;

  bool get isEmpty => requirements.isEmpty;

  @override
  List<Object?> get props => <Object?>[
        label,
        requirements,
        creditsCr,
        creditsCaveat,
        conversions,
        warnings,
        unknownMaterialIds,
      ];
}
