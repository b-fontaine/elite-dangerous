import 'package:equatable/equatable.dart';

/// The Exobiologist rank ladder.
///
/// Progress is driven by the *"Profit from Organic Data"* line of every Vista
/// Genomics transaction — First Logged bonuses included — accumulated over the
/// whole career. That is why the app tracks credits sold rather than samples
/// taken.
///
/// **These are the post-Update 14.01 (December 2022) thresholds.** Several
/// community guides still quote the launch ladder (1.5 M / 5.3 M / 12.8 M /
/// 32 M / 65 M / 130 M / 260 M / 520 M), which was rebalanced upwards when the
/// payouts themselves were multiplied. Showing the old numbers would tell a
/// commander they are four ranks further along than they really are.
///
/// Source: elite-dangerous.fandom.com/wiki/Exobiologist, table established by
/// CMDR Aunty Sledge after Update 14.01. Elite I to V are community estimates.
enum ExobiologistRank {
  directionless(0, 'Directionless', 'Sans direction'),
  mostlyDirectionless(22500000, 'Mostly Directionless', 'Plutôt sans direction'),
  compiler(83475000, 'Compiler', 'Compilateur'),
  collector(210560000, 'Collector', 'Collectionneur'),
  cataloguer(532800000, 'Cataloguer', 'Catalogueur'),
  taxonomist(1144000000, 'Taxonomist', 'Taxonomiste'),
  ecologist(2262600000, 'Ecologist', 'Écologiste'),
  geneticist(3996000000, 'Geneticist', 'Généticien'),
  elite(8425000000, 'Elite', 'Elite'),
  eliteI(12969000000, 'Elite I', 'Elite I'),
  eliteII(17425000000, 'Elite II', 'Elite II'),
  eliteIII(21925000000, 'Elite III', 'Elite III'),
  eliteIV(26320000000, 'Elite IV', 'Elite IV'),
  eliteV(30553600000, 'Elite V', 'Elite V');

  const ExobiologistRank(this.thresholdCr, this.name, this.frenchLabel);

  /// Cumulative organic-data profit required to reach this rank.
  final int thresholdCr;

  /// Ranks beyond Elite are community estimates rather than confirmed values.
  bool get isEstimatedThreshold => index > ExobiologistRank.elite.index;

  final String name;
  final String frenchLabel;

  /// Highest rank reached with [cumulativeProfitCr] credits of organic sales.
  static ExobiologistRank forProfit(int cumulativeProfitCr) {
    ExobiologistRank current = ExobiologistRank.directionless;
    for (final ExobiologistRank rank in values) {
      if (cumulativeProfitCr >= rank.thresholdCr) {
        current = rank;
      }
    }
    return current;
  }

  ExobiologistRank? get next {
    final int i = index + 1;
    return i < values.length ? values[i] : null;
  }
}

/// Rank plus the distance to the next tier, ready for a progress bar.
class ExobiologistRankProgress extends Equatable {
  const ExobiologistRankProgress({
    required this.rank,
    required this.cumulativeProfitCr,
  });

  factory ExobiologistRankProgress.fromProfit(int cumulativeProfitCr) =>
      ExobiologistRankProgress(
        rank: ExobiologistRank.forProfit(cumulativeProfitCr),
        cumulativeProfitCr: cumulativeProfitCr,
      );

  final ExobiologistRank rank;
  final int cumulativeProfitCr;

  ExobiologistRank? get nextRank => rank.next;

  int get creditsToNextRank {
    final ExobiologistRank? next = nextRank;
    if (next == null) {
      return 0;
    }
    return (next.thresholdCr - cumulativeProfitCr).clamp(0, next.thresholdCr);
  }

  /// 0.0 → 1.0 within the current tier. Returns 1.0 at the top of the ladder.
  double get progressToNextRank {
    final ExobiologistRank? next = nextRank;
    if (next == null) {
      return 1;
    }
    final int span = next.thresholdCr - rank.thresholdCr;
    if (span <= 0) {
      return 1;
    }
    final int done = cumulativeProfitCr - rank.thresholdCr;
    return (done / span).clamp(0.0, 1.0);
  }

  @override
  List<Object?> get props => <Object?>[rank, cumulativeProfitCr];
}
