import 'package:equatable/equatable.dart';

import 'organic_species.dart';

/// How much the observed body supports a candidate species.
enum MatchConfidence {
  /// Every known criterion is satisfied and at least one is discriminating.
  probable('Probable'),

  /// All *known* criteria are satisfied, but the survey is missing data the
  /// species depends on.
  possible('Possible'),

  /// At least one criterion is contradicted.
  excluded('Exclue');

  const MatchConfidence(this.label);

  final String label;
}

/// A single criterion evaluated against a body.
class MatchCriterion extends Equatable {
  const MatchCriterion({
    required this.label,
    required this.satisfied,
    required this.expected,
    this.observed,
  });

  /// Criterion name, e.g. `Atmosphère`.
  final String label;

  /// `true` = supported, `false` = contradicted, `null` = unknown on this body.
  final bool? satisfied;

  final String expected;
  final String? observed;

  bool get isUnknown => satisfied == null;

  bool get isContradicted => satisfied == false;

  @override
  List<Object?> get props => <Object?>[label, satisfied, expected, observed];
}

/// The matcher's verdict for one species on one body.
class SpeciesMatch extends Equatable {
  const SpeciesMatch({
    required this.species,
    required this.confidence,
    required this.criteria,
    required this.score,
    this.alreadySoldHere = false,
  });

  final OrganicSpecies species;
  final MatchConfidence confidence;
  final List<MatchCriterion> criteria;

  /// 0.0 → 1.0. Ratio of satisfied criteria over evaluable criteria, used to
  /// rank candidates of equal confidence.
  final double score;

  /// True when this species was already sold on this body: the game will
  /// refuse the sample, so the UI greys it out.
  final bool alreadySoldHere;

  List<MatchCriterion> get unknownCriteria =>
      criteria.where((MatchCriterion c) => c.isUnknown).toList();

  List<MatchCriterion> get contradictedCriteria =>
      criteria.where((MatchCriterion c) => c.isContradicted).toList();

  int get estimatedValueCr => species.baseValueCr;

  @override
  List<Object?> get props =>
      <Object?>[species, confidence, criteria, score, alreadySoldHere];
}
