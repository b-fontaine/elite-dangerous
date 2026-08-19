import '../entities/atmosphere_type.dart';
import '../entities/body_profile.dart';
import '../entities/organic_species.dart';
import '../entities/planet_class.dart';
import '../entities/species_conditions.dart';
import '../entities/species_match.dart';
import '../entities/volcanism_type.dart';

/// Predicts which organics can grow on a body, the way BioScan or
/// Observatory's BioInsights do — but from data the commander already has in
/// the FSS, and with the reasoning shown rather than hidden.
///
/// The matcher is deliberately conservative: a criterion the survey cannot
/// answer downgrades a candidate to [MatchConfidence.possible] instead of
/// silently assuming it passes. Telling a commander "probable" when the app
/// simply does not know the temperature would cost them a landing.
class SpeciesMatcher {
  const SpeciesMatcher();

  /// Ranks [catalog] against [body].
  ///
  /// [soldSpeciesKeys] holds `"{speciesId}@{bodyName}"` entries already sold;
  /// those species are flagged, because the game refuses to sample them again
  /// on the same body — forever.
  List<SpeciesMatch> match({
    required BodyProfile body,
    required List<OrganicSpecies> catalog,
    Set<String> soldSpeciesKeys = const <String>{},
    bool includeExcluded = false,
  }) {
    final List<SpeciesMatch> matches = <SpeciesMatch>[];

    for (final OrganicSpecies species in catalog) {
      final List<MatchCriterion> criteria = _evaluate(species, body);
      final MatchConfidence confidence = _confidence(criteria);
      if (confidence == MatchConfidence.excluded && !includeExcluded) {
        continue;
      }
      matches.add(
        SpeciesMatch(
          species: species,
          confidence: confidence,
          criteria: criteria,
          score: _score(criteria),
          alreadySoldHere:
              soldSpeciesKeys.contains('${species.id}@${body.name}'),
        ),
      );
    }

    matches.sort(_compare);
    return List<SpeciesMatch>.unmodifiable(matches);
  }

  /// Sum of the base values of the most likely species, i.e. the payoff the
  /// commander can reasonably expect from landing here.
  int estimatedBodyValueCr(List<SpeciesMatch> matches, {int? signalCount}) {
    final List<SpeciesMatch> probable = matches
        .where((SpeciesMatch match) =>
            match.confidence == MatchConfidence.probable &&
            !match.alreadySoldHere)
        .toList();
    final List<SpeciesMatch> considered =
        probable.isNotEmpty ? probable : matches;
    if (considered.isEmpty) {
      return 0;
    }
    // The FSS tells us how many distinct organisms are down there; take the
    // best `signalCount` candidates rather than summing the whole catalogue.
    final int take = (signalCount ?? 1).clamp(1, considered.length);
    return considered
        .take(take)
        .fold<int>(0, (int sum, SpeciesMatch m) => sum + m.species.baseValueCr);
  }

  List<MatchCriterion> _evaluate(OrganicSpecies species, BodyProfile body) {
    final SpeciesConditions conditions = species.conditions;
    final List<MatchCriterion> criteria = <MatchCriterion>[];

    if (conditions.planetClasses.isNotEmpty) {
      final bool unknown = body.planetClass == PlanetClass.unknown;
      criteria.add(
        MatchCriterion(
          label: 'Type de corps',
          satisfied:
              unknown ? null : conditions.planetClasses.contains(body.planetClass),
          expected: conditions.planetClasses
              .map((PlanetClass value) => value.label)
              .join(' / '),
          observed: unknown ? null : body.planetClass.label,
        ),
      );
    }

    if (conditions.atmospheres.isNotEmpty) {
      final bool unknown = body.atmosphere == AtmosphereType.unknown;
      criteria.add(
        MatchCriterion(
          label: 'Atmosphère',
          satisfied:
              unknown ? null : conditions.atmospheres.contains(body.atmosphere),
          expected: conditions.atmospheres
              .map((AtmosphereType value) => value.label)
              .join(' / '),
          observed: unknown ? null : body.atmosphere.label,
        ),
      );
    }

    if (conditions.minTemperatureK != null ||
        conditions.maxTemperatureK != null) {
      final double? observed = body.surfaceTemperatureK;
      criteria.add(
        MatchCriterion(
          label: 'Température',
          satisfied: observed == null
              ? null
              : observed >= (conditions.minTemperatureK ?? double.negativeInfinity) &&
                  observed <= (conditions.maxTemperatureK ?? double.infinity),
          expected: _range(
            conditions.minTemperatureK,
            conditions.maxTemperatureK,
            'K',
          ),
          observed: observed == null ? null : '${observed.toStringAsFixed(0)} K',
        ),
      );
    }

    if (conditions.maxGravityG != null || conditions.minGravityG != null) {
      final double? observed = body.surfaceGravityG;
      criteria.add(
        MatchCriterion(
          label: 'Gravité',
          satisfied: observed == null
              ? null
              : observed <= (conditions.maxGravityG ?? double.infinity) &&
                  observed >= (conditions.minGravityG ?? 0),
          expected:
              _range(conditions.minGravityG, conditions.maxGravityG, 'g'),
          observed: observed == null ? null : '${observed.toStringAsFixed(2)} g',
        ),
      );
    }

    if (conditions.volcanism.isNotEmpty) {
      final bool unknown = body.volcanism == VolcanismType.unknown;
      final bool acceptsAny = conditions.volcanism.contains(VolcanismType.any);
      criteria.add(
        MatchCriterion(
          label: 'Volcanisme',
          satisfied: unknown
              ? null
              : (acceptsAny
                  ? body.volcanism.isActive
                  : conditions.volcanism.contains(body.volcanism)),
          expected: conditions.volcanism
              .map((VolcanismType value) => value.label)
              .join(' / '),
          observed: unknown ? null : body.volcanism.label,
        ),
      );
    }

    if (conditions.minDistanceFromArrivalLs != null) {
      final double? observed = body.distanceFromArrivalLs;
      criteria.add(
        MatchCriterion(
          label: 'Distance à l\'étoile',
          satisfied: observed == null
              ? null
              : observed >= conditions.minDistanceFromArrivalLs!,
          expected:
              '> ${conditions.minDistanceFromArrivalLs!.toStringAsFixed(0)} sl',
          observed: observed == null ? null : '${observed.toStringAsFixed(0)} sl',
        ),
      );
    }

    if (conditions.requiresNebula) {
      criteria.add(
        MatchCriterion(
          label: 'Nébuleuse',
          satisfied: body.nearNebula ? true : null,
          expected: 'À proximité d\'une nébuleuse',
          observed: body.nearNebula ? 'Oui' : null,
        ),
      );
    }

    return criteria;
  }

  MatchConfidence _confidence(List<MatchCriterion> criteria) {
    if (criteria.any((MatchCriterion c) => c.isContradicted)) {
      return MatchConfidence.excluded;
    }
    if (criteria.isEmpty || criteria.any((MatchCriterion c) => c.isUnknown)) {
      return MatchConfidence.possible;
    }
    return MatchConfidence.probable;
  }

  double _score(List<MatchCriterion> criteria) {
    final Iterable<MatchCriterion> evaluable =
        criteria.where((MatchCriterion c) => !c.isUnknown);
    if (evaluable.isEmpty) {
      return 0;
    }
    final int satisfied =
        evaluable.where((MatchCriterion c) => c.satisfied == true).length;
    return satisfied / evaluable.length;
  }

  int _compare(SpeciesMatch a, SpeciesMatch b) {
    final int byConfidence = a.confidence.index.compareTo(b.confidence.index);
    if (byConfidence != 0) {
      return byConfidence;
    }
    final int byValue = b.species.baseValueCr.compareTo(a.species.baseValueCr);
    if (byValue != 0) {
      return byValue;
    }
    final int byScore = b.score.compareTo(a.score);
    return byScore != 0 ? byScore : a.species.name.compareTo(b.species.name);
  }

  static String _range(double? min, double? max, String unit) {
    if (min != null && max != null) {
      return '${min.toStringAsFixed(0)} – ${max.toStringAsFixed(0)} $unit';
    }
    if (min != null) {
      return '> ${min.toStringAsFixed(min == min.roundToDouble() ? 0 : 2)} $unit';
    }
    if (max != null) {
      return '< ${max.toStringAsFixed(max == max.roundToDouble() ? 0 : 2)} $unit';
    }
    return '—';
  }
}
