import 'package:elite_dangerous/features/exobiology/domain/entities/exobiologist_rank.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExobiologistRank.forProfit', () {
    test('a commander who never sold anything is Directionless', () {
      expect(ExobiologistRank.forProfit(0), ExobiologistRank.directionless);
    });

    test('lands exactly on a threshold', () {
      expect(
        ExobiologistRank.forProfit(22500000),
        ExobiologistRank.mostlyDirectionless,
      );
      expect(ExobiologistRank.forProfit(8425000000), ExobiologistRank.elite);
    });

    test('stays on the lower rank one credit short of a threshold', () {
      expect(
        ExobiologistRank.forProfit(22499999),
        ExobiologistRank.directionless,
      );
    });

    test('uses the post-Update 14.01 ladder, not the launch one', () {
      // The launch ladder put Mostly Directionless at 1.5 M Cr. Several
      // community guides still quote it; using it would overstate the rank.
      expect(
        ExobiologistRank.forProfit(1500000),
        ExobiologistRank.directionless,
      );
      expect(ExobiologistRank.mostlyDirectionless.thresholdCr, 22500000);
      expect(ExobiologistRank.elite.thresholdCr, 8425000000);
    });

    test('thresholds increase monotonically', () {
      for (int i = 1; i < ExobiologistRank.values.length; i++) {
        expect(
          ExobiologistRank.values[i].thresholdCr,
          greaterThan(ExobiologistRank.values[i - 1].thresholdCr),
        );
      }
    });

    test('only the Elite I+ tiers are flagged as estimated', () {
      expect(ExobiologistRank.elite.isEstimatedThreshold, isFalse);
      expect(ExobiologistRank.eliteI.isEstimatedThreshold, isTrue);
      expect(ExobiologistRank.eliteV.isEstimatedThreshold, isTrue);
    });

    test('caps at Elite V', () {
      expect(
        ExobiologistRank.forProfit(99999999999),
        ExobiologistRank.eliteV,
      );
    });
  });

  group('ExobiologistRankProgress', () {
    test('reports the gap to the next rank', () {
      final ExobiologistRankProgress progress =
          ExobiologistRankProgress.fromProfit(30000000);

      expect(progress.rank, ExobiologistRank.mostlyDirectionless);
      expect(progress.nextRank, ExobiologistRank.compiler);
      expect(progress.creditsToNextRank, 83475000 - 30000000);
    });

    test('progress is 0 at the bottom of a tier and near 1 at the top', () {
      expect(
        ExobiologistRankProgress.fromProfit(22500000).progressToNextRank,
        0,
      );
      expect(
        ExobiologistRankProgress.fromProfit(83474999).progressToNextRank,
        closeTo(1, 0.001),
      );
    });

    test('the top of the ladder reports a full bar and no remaining credits',
        () {
      final ExobiologistRankProgress progress =
          ExobiologistRankProgress.fromProfit(40000000000);

      expect(progress.rank, ExobiologistRank.eliteV);
      expect(progress.nextRank, isNull);
      expect(progress.progressToNextRank, 1);
      expect(progress.creditsToNextRank, 0);
    });
  });
}
