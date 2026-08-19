import 'package:equatable/equatable.dart';

import 'species_conditions.dart';
import 'species_variant.dart';

/// One sellable organism.
///
/// [baseValueCr] is what Vista Genomics pays for a completed 3-sample set.
class OrganicSpecies extends Equatable {
  const OrganicSpecies({
    required this.id,
    required this.genusId,
    required this.genusName,
    required this.name,
    required this.baseValueCr,
    this.conditions = const SpeciesConditions(),
    this.variants = const <SpeciesVariant>[],
    this.reliability = 'COM',
  });

  /// Stable snake_case identifier, e.g. `stratum_tectonicas`.
  final String id;

  final String genusId;

  /// Genus name, denormalised so a species can be rendered standalone.
  final String genusName;

  /// Full species name, e.g. `Stratum Tectonicas`.
  final String name;

  /// Vista Genomics base payout, in credits.
  final int baseValueCr;

  final SpeciesConditions conditions;
  final List<SpeciesVariant> variants;

  /// Confidence tag of the underlying data: `OFF`, `COM` or `EST`, matching
  /// the labelling convention of the source guides.
  final String reliability;

  /// Payout with the First Logged bonus: `base + 400 %`, i.e. five times the
  /// base value.
  ///
  /// The bonus is granted per `(species, body)` pair, once in the history of
  /// the game, and is claimed **at the sale**, not at the scan — another
  /// commander can still take it while the data sits unsold in your hold.
  int get firstLoggedValueCr => baseValueCr * firstLoggedMultiplier;

  /// The First Logged bonus multiplier.
  ///
  /// Note that "First Footfall" — being the first to set foot on a body — pays
  /// nothing at all: it only writes the commander's name on the system map.
  /// The two are constantly conflated, including in community guides, because
  /// an unfootfallen body is in practice a guaranteed First Logged.
  static const int firstLoggedMultiplier = 5;

  /// A species is "high value" when a single sale changes the session's
  /// outcome. The source guides use 16 M Cr as the Expressway cut-off.
  bool get isHighValue => baseValueCr >= highValueThresholdCr;

  static const int highValueThresholdCr = 16000000;

  @override
  List<Object?> get props => <Object?>[id, name, baseValueCr];
}
