import 'package:equatable/equatable.dart';

import 'exobiologist_rank.dart';
import 'sample_record.dart';

/// Everything the app knows about what this commander has actually done.
///
/// Persisted locally: there is no backend, so this aggregate *is* the save.
class ExobiologyProgress extends Equatable {
  const ExobiologyProgress({
    this.records = const <SampleRecord>[],
    this.declaredProfitCr = 0,
    this.completedStepIds = const <String>{},
    this.dismissedStepIds = const <String>{},
    this.lastUpdatedAt,
  });

  const ExobiologyProgress.empty()
      : records = const <SampleRecord>[],
        declaredProfitCr = 0,
        completedStepIds = const <String>{},
        dismissedStepIds = const <String>{},
        lastUpdatedAt = null;

  final List<SampleRecord> records;

  /// Organic-data profit the commander entered by hand, for everything earned
  /// before they started using the app. Added to what the records prove.
  final int declaredProfitCr;

  final Set<String> completedStepIds;
  final Set<String> dismissedStepIds;
  final DateTime? lastUpdatedAt;

  /// Profit backed by recorded sales.
  int get recordedProfitCr => records
      .where((SampleRecord record) => record.isSold)
      .fold<int>(0, (int sum, SampleRecord r) => sum + (r.soldValueCr ?? 0));

  /// What drives the Exobiologist rank.
  int get cumulativeProfitCr => declaredProfitCr + recordedProfitCr;

  ExobiologistRankProgress get rank =>
      ExobiologistRankProgress.fromProfit(cumulativeProfitCr);

  /// Value of completed-but-unsold organisms — everything a single death, or
  /// the loss of the Nomad, wipes out.
  int get atRiskValueCr => records
      .where((SampleRecord record) => record.isAtRisk)
      .fold<int>(0, (int sum, SampleRecord r) => sum + (r.estimatedValueCr ?? 0));

  /// `"{speciesId}@{bodyName}"` keys already sold. The game refuses to sample
  /// these again on the same body, forever.
  Set<String> get soldSpeciesKeys => records
      .where((SampleRecord record) => record.isSold)
      .map((SampleRecord record) => record.key)
      .toSet();

  int get distinctSpeciesSold => records
      .where((SampleRecord record) => record.isSold)
      .map((SampleRecord record) => record.speciesId)
      .toSet()
      .length;

  List<SampleRecord> get inProgress => records
      .where((SampleRecord record) => !record.isSold && !record.isComplete)
      .toList(growable: false);

  List<SampleRecord> get readyToSell => records
      .where((SampleRecord record) => record.isAtRisk)
      .toList(growable: false);

  SampleRecord? recordFor(String speciesId, String bodyName) => records
      .where((SampleRecord record) =>
          record.speciesId == speciesId && record.bodyName == bodyName)
      .firstOrNull;

  /// Inserts or replaces [record], matching on its `(speciesId, bodyName)` key.
  ExobiologyProgress upsert(SampleRecord record, {DateTime? now}) {
    final List<SampleRecord> updated = <SampleRecord>[
      for (final SampleRecord existing in records)
        if (existing.key != record.key) existing,
      record,
    ];
    return copyWith(records: updated, lastUpdatedAt: now);
  }

  ExobiologyProgress copyWith({
    List<SampleRecord>? records,
    int? declaredProfitCr,
    Set<String>? completedStepIds,
    Set<String>? dismissedStepIds,
    DateTime? lastUpdatedAt,
  }) {
    return ExobiologyProgress(
      records: records ?? this.records,
      declaredProfitCr: declaredProfitCr ?? this.declaredProfitCr,
      completedStepIds: completedStepIds ?? this.completedStepIds,
      dismissedStepIds: dismissedStepIds ?? this.dismissedStepIds,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        records,
        declaredProfitCr,
        completedStepIds,
        dismissedStepIds,
      ];
}

extension<T> on Iterable<T> {
  T? get firstOrNull {
    final Iterator<T> iterator = this.iterator;
    return iterator.moveNext() ? iterator.current : null;
  }
}
