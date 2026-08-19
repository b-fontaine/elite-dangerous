import 'package:equatable/equatable.dart';

/// An organism the commander has started but not finished, or finished but not
/// sold.
class InProgressOrganism extends Equatable {
  const InProgressOrganism({
    required this.genus,
    required this.species,
    required this.samplesTaken,
    this.bodyId,
    this.systemAddress,
    this.lastScanAt,
  });

  final String genus;
  final String species;

  /// 1 to 3. Three completes the organism.
  final int samplesTaken;

  final int? bodyId;
  final int? systemAddress;
  final DateTime? lastScanAt;

  bool get isComplete => samplesTaken >= 3;

  int get remainingSamples => (3 - samplesTaken).clamp(0, 3);

  String get key => '$species@${systemAddress ?? '?'}:${bodyId ?? '?'}';

  @override
  List<Object?> get props => <Object?>[species, systemAddress, bodyId, samplesTaken];
}

/// What the journal says about the commander's exobiology career.
///
/// Derived, never stored: recomputing from the events is cheap and means an
/// extra journal import automatically corrects the totals instead of
/// double-counting them.
class ExobiologyActivity extends Equatable {
  const ExobiologyActivity({
    this.totalSoldCr = 0,
    this.firstLoggedCount = 0,
    this.samplesInProgress = const <InProgressOrganism>[],
    this.completedNotSold = const <InProgressOrganism>[],
    this.soldSpeciesKeys = const <String>{},
    this.distinctSpeciesSold = 0,
    this.saleCount = 0,
    this.lastSaleAt,
  });

  /// Everything Vista Genomics has paid, First Logged bonuses included — this
  /// is exactly the "Profit from Organic Data" the rank ladder counts.
  final int totalSoldCr;

  final int firstLoggedCount;

  /// Organisms with one or two samples taken.
  final List<InProgressOrganism> samplesInProgress;

  /// Organisms complete but not yet sold: the value a single death would erase.
  final List<InProgressOrganism> completedNotSold;

  final Set<String> soldSpeciesKeys;
  final int distinctSpeciesSold;
  final int saleCount;
  final DateTime? lastSaleAt;

  bool get hasDataAtRisk => completedNotSold.isNotEmpty;

  @override
  List<Object?> get props => <Object?>[
        totalSoldCr,
        firstLoggedCount,
        samplesInProgress,
        completedNotSold,
        distinctSpeciesSold,
        saleCount,
        lastSaleAt,
      ];
}
