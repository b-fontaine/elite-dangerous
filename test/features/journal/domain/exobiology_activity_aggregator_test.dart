import 'package:elite_dangerous/features/journal/domain/entities/exobiology_activity.dart';
import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/journal/domain/services/exobiology_activity_aggregator.dart';
import 'package:flutter_test/flutter_test.dart';

DateTime _at(int minute) => DateTime.utc(2026, 8, 17, 20, minute);

ScanOrganicEvent _scan(
  int minute,
  OrganicScanType type, {
  String species = 'Stratum Tectonicas',
  int bodyId = 24,
}) =>
    ScanOrganicEvent(
      timestamp: _at(minute),
      scanType: type,
      genus: 'Stratum',
      species: species,
      speciesLocalised: species,
      systemAddress: 1,
      bodyId: bodyId,
    );

SellOrganicDataEvent _sale(
  int minute, {
  String species = 'Stratum Tectonicas',
  int value = 19010800,
  int bonus = 0,
}) =>
    SellOrganicDataEvent(
      timestamp: _at(minute),
      entries: <SoldBioData>[
        SoldBioData(
          genus: 'Stratum',
          species: species,
          speciesLocalised: species,
          valueCr: value,
          bonusCr: bonus,
        ),
      ],
    );

void main() {
  const ExobiologyActivityAggregator aggregator =
      ExobiologyActivityAggregator();

  test('an empty journal produces an empty picture', () {
    final ExobiologyActivity activity =
        aggregator.aggregate(const <JournalEvent>[]);

    expect(activity.totalSoldCr, 0);
    expect(activity.hasDataAtRisk, isFalse);
    expect(activity.samplesInProgress, isEmpty);
  });

  test('one sample leaves the organism in progress', () {
    final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
      _scan(0, OrganicScanType.log),
    ]);

    expect(activity.samplesInProgress, hasLength(1));
    expect(activity.samplesInProgress.single.samplesTaken, 1);
    expect(activity.samplesInProgress.single.remainingSamples, 2);
    expect(activity.completedNotSold, isEmpty);
  });

  test('three samples complete the organism and put it at risk', () {
    final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
      _scan(0, OrganicScanType.log),
      _scan(2, OrganicScanType.sample),
      _scan(4, OrganicScanType.analyse),
    ]);

    expect(activity.samplesInProgress, isEmpty);
    expect(activity.completedNotSold, hasLength(1));
    expect(activity.hasDataAtRisk, isTrue);
  });

  test('an Analyse seen alone still completes the organism', () {
    // An import can start mid-organism; the third scan is authoritative.
    final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
      _scan(4, OrganicScanType.analyse),
    ]);

    expect(activity.completedNotSold.single.samplesTaken, 3);
  });

  test('selling clears the completed organism and banks the credits', () {
    final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
      _scan(0, OrganicScanType.analyse),
      _sale(10),
    ]);

    expect(activity.completedNotSold, isEmpty);
    expect(activity.hasDataAtRisk, isFalse);
    expect(activity.totalSoldCr, 19010800);
    expect(activity.distinctSpeciesSold, 1);
    expect(activity.saleCount, 1);
    expect(activity.lastSaleAt, _at(10));
  });

  test('the First Logged bonus is counted in the profit', () {
    final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
      _scan(0, OrganicScanType.analyse),
      _sale(10, bonus: 76043200),
    ]);

    expect(activity.totalSoldCr, 19010800 + 76043200);
    expect(activity.firstLoggedCount, 1);
  });

  test('selling one species leaves another species untouched', () {
    final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
      _scan(0, OrganicScanType.analyse),
      _scan(1, OrganicScanType.analyse,
          species: 'Bacterium Aurasus', bodyId: 25),
      _sale(10),
    ]);

    expect(activity.completedNotSold, hasLength(1));
    expect(activity.completedNotSold.single.species, 'Bacterium Aurasus');
  });

  test('an in-progress organism is not cleared by a sale of its species', () {
    final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
      _scan(0, OrganicScanType.analyse),
      _scan(1, OrganicScanType.log, bodyId: 99),
      _sale(10),
    ]);

    expect(activity.samplesInProgress, hasLength(1));
    expect(activity.samplesInProgress.single.bodyId, 99);
  });

  test('the same species on two bodies is tracked separately', () {
    final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
      _scan(0, OrganicScanType.analyse),
      _scan(1, OrganicScanType.analyse, bodyId: 25),
    ]);

    expect(activity.completedNotSold, hasLength(2));
  });

  test('events arriving out of order are sorted before folding', () {
    final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
      _sale(10),
      _scan(0, OrganicScanType.analyse),
    ]);

    expect(activity.completedNotSold, isEmpty);
    expect(activity.totalSoldCr, 19010800);
  });

  test('unrelated events are ignored without disturbing the fold', () {
    final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
      UnknownJournalEvent(timestamp: _at(0), name: 'Music'),
      _scan(1, OrganicScanType.analyse),
      LoadGameEvent(timestamp: _at(2), commander: 'Caspian'),
    ]);

    expect(activity.completedNotSold, hasLength(1));
  });
}
