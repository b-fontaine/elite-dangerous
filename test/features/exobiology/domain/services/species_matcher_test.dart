import 'package:elite_dangerous/features/exobiology/domain/entities/atmosphere_type.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/body_profile.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/planet_class.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/species_match.dart';
import 'package:elite_dangerous/features/exobiology/domain/services/species_matcher.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/exobiology_fixtures.dart';

void main() {
  const SpeciesMatcherHarness harness = SpeciesMatcherHarness();

  group('SpeciesMatcher', () {
    test('ranks Stratum Tectonicas first on a hot low-gravity HMC world', () {
      final List<SpeciesMatch> matches = harness.match(stratumCandidateBody);

      expect(matches.first.species.id, 'stratum_tectonicas');
      expect(matches.first.confidence, MatchConfidence.probable);
    });

    test('excludes a species whose planet class is contradicted', () {
      final List<SpeciesMatch> matches = harness.match(stratumCandidateBody);

      expect(
        matches.map((SpeciesMatch m) => m.species.id),
        isNot(contains('tussock_stigmasis')),
      );
    });

    test('excludes a species whose distance requirement is not met', () {
      // Clypeus Speculumi needs more than 2500 Ls; the fixture body is at 640.
      final List<SpeciesMatch> matches = harness.match(stratumCandidateBody);

      expect(
        matches.map((SpeciesMatch m) => m.species.id),
        isNot(contains('clypeus_speculumi')),
      );
    });

    test('keeps an excluded species when explicitly asked, flagged as such',
        () {
      final List<SpeciesMatch> matches =
          harness.match(stratumCandidateBody, includeExcluded: true);

      final SpeciesMatch tussock = matches
          .firstWhere((SpeciesMatch m) => m.species.id == 'tussock_stigmasis');
      expect(tussock.confidence, MatchConfidence.excluded);
      expect(tussock.contradictedCriteria, isNotEmpty);
    });

    test('an unknown measurement downgrades to possible instead of probable',
        () {
      const BodyProfile partiallySurveyed = BodyProfile(
        name: 'Unknown 1 a',
        planetClass: PlanetClass.highMetalContentBody,
        atmosphere: AtmosphereType.carbonDioxide,
        surfaceGravityG: 0.2,
        // temperature deliberately missing
      );

      final SpeciesMatch stratum = harness
          .match(partiallySurveyed)
          .firstWhere((SpeciesMatch m) => m.species.id == 'stratum_tectonicas');

      expect(stratum.confidence, MatchConfidence.possible);
      expect(
        stratum.unknownCriteria.map((MatchCriterion c) => c.label),
        contains('Température'),
      );
    });

    test('a species already sold on this body is flagged, not hidden', () {
      final List<SpeciesMatch> matches = harness.match(
        stratumCandidateBody,
        soldSpeciesKeys: <String>{'stratum_tectonicas@Cubeo A 3 c'},
      );

      expect(
        matches
            .firstWhere((SpeciesMatch m) => m.species.id == 'stratum_tectonicas')
            .alreadySoldHere,
        isTrue,
      );
    });

    test('the same species sold on another body does not flag this one', () {
      final List<SpeciesMatch> matches = harness.match(
        stratumCandidateBody,
        soldSpeciesKeys: <String>{'stratum_tectonicas@Sol 4 a'},
      );

      expect(
        matches
            .firstWhere((SpeciesMatch m) => m.species.id == 'stratum_tectonicas')
            .alreadySoldHere,
        isFalse,
      );
    });

    test('estimated body value takes the best candidates, one per signal', () {
      final List<SpeciesMatch> matches = harness.match(stratumCandidateBody);

      expect(
        harness.matcher.estimatedBodyValueCr(matches, signalCount: 1),
        19010800,
      );
      expect(
        harness.matcher.estimatedBodyValueCr(matches, signalCount: 2),
        greaterThan(19010800),
      );
    });

    test('an empty catalogue yields no matches and a zero estimate', () {
      final List<SpeciesMatch> matches = harness.matcher.match(
        body: stratumCandidateBody,
        catalog: const [],
      );

      expect(matches, isEmpty);
      expect(harness.matcher.estimatedBodyValueCr(matches), 0);
    });
  });

  group('BodyProfile heuristics', () {
    test('HMC + one signal + above 165 K is the Stratum Tectonicas tell', () {
      expect(stratumCandidateBody.matchesStratumTectonicasHeuristic, isTrue);
    });

    test('two biological signals break the heuristic', () {
      expect(
        stratumCandidateBody
            .copyWith(biologicalSignalCount: 2)
            .matchesStratumTectonicasHeuristic,
        isFalse,
      );
    });

    test('bodies beyond 1500 Ls are flagged as supercruise sinks', () {
      expect(stratumCandidateBody.isFarFromStar, isFalse);
      expect(
        stratumCandidateBody
            .copyWith(distanceFromArrivalLs: 4200)
            .isFarFromStar,
        isTrue,
      );
    });

    test('converts the Journal gravity from m/s² to g', () {
      expect(
        BodyProfile.gravityFromMetersPerSecondSquared(9.80665),
        closeTo(1, 0.0001),
      );
    });
  });
}

/// Small wrapper that keeps the tests focused on behaviour rather than on
/// wiring the catalogue into every call.
class SpeciesMatcherHarness {
  const SpeciesMatcherHarness();

  SpeciesMatcher get matcher => const SpeciesMatcher();

  List<SpeciesMatch> match(
    BodyProfile body, {
    Set<String> soldSpeciesKeys = const <String>{},
    bool includeExcluded = false,
  }) =>
      matcher.match(
        body: body,
        catalog: testCatalog,
        soldSpeciesKeys: soldSpeciesKeys,
        includeExcluded: includeExcluded,
      );
}
