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

  group('perte du vaisseau', () {
    test('le chemin de mort le plus courant efface bien la soute', () {
      // Mourir dans son vaisseau puis payer le rachat : `Option` vaut alors
      // `rebuy`. C'est le cas ordinaire, et c'est celui qu'un filtre bâti sur
      // les seules options de repli laisse passer.
      final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
        _scan(0, OrganicScanType.log),
        _scan(1, OrganicScanType.sample),
        _scan(2, OrganicScanType.analyse),
        DiedEvent(timestamp: _at(3), killerName: 'Cmdr Hostile'),
        ResurrectEvent(timestamp: _at(4), option: 'rebuy', costCr: 36479),
      ]);

      expect(activity.completedNotSold, isEmpty);
      expect(activity.samplesInProgress, isEmpty);
      expect(activity.hasDataAtRisk, isFalse);
      expect(activity.organismsLostToDeath, 1);
      // La mort, pas le retour : c'est l'instant où la soute a disparu.
      expect(activity.lastLossAt, _at(3));
    });

    test('la mort seule suffit, sans attendre le retour au jeu', () {
      // Une session qui s'arrête sur l'écran de rachat n'écrit jamais de
      // `Resurrect` ; la perte a pourtant bien eu lieu.
      final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
        _scan(0, OrganicScanType.analyse),
        DiedEvent(timestamp: _at(1)),
      ]);

      expect(activity.completedNotSold, isEmpty);
      expect(activity.organismsLostToDeath, 1);
    });

    test('un Resurrect orphelin rattrape une mort absente de l\'import', () {
      // Un import qui commence au milieu d'une session n'a pas la ligne
      // `Died` ; l'option du rachat reste alors le seul indice.
      final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
        _scan(0, OrganicScanType.analyse),
        ResurrectEvent(timestamp: _at(1), option: 'recover'),
      ]);

      expect(activity.completedNotSold, isEmpty);
      expect(activity.organismsLostToDeath, 1);
    });

    test('mort et retour ne comptent qu\'une seule perte', () {
      final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
        _scan(0, OrganicScanType.analyse),
        DiedEvent(timestamp: _at(1)),
        ResurrectEvent(timestamp: _at(2), option: 'rebuy'),
      ]);

      expect(activity.organismsLostToDeath, 1);
    });

    test('les échantillons partiels partent avec le reste', () {
      final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
        _scan(0, OrganicScanType.log),
        _scan(1, OrganicScanType.sample),
        DiedEvent(timestamp: _at(2)),
      ]);

      expect(activity.samplesInProgress, isEmpty);
      expect(activity.organismsLostToDeath, 1);
    });

    test('un Resurrect inconnu, sans mort, ne détruit rien', () {
      // Le filet de secours ne se déclenche pas sur une option dont le sens
      // est inconnu : sans `Died`, rien ne prouve une destruction.
      final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
        _scan(0, OrganicScanType.log),
        _scan(1, OrganicScanType.sample),
        _scan(2, OrganicScanType.analyse),
        ResurrectEvent(timestamp: _at(4), option: 'handin'),
      ]);

      expect(activity.completedNotSold, hasLength(1));
      expect(activity.organismsLostToDeath, isZero);
      expect(activity.hasLostData, isFalse);
    });

    test('ce qui a été vendu avant la mort reste acquis', () {
      final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
        _scan(0, OrganicScanType.log),
        _scan(1, OrganicScanType.sample),
        _scan(2, OrganicScanType.analyse),
        SellOrganicDataEvent(
          timestamp: _at(3),
          entries: const <SoldBioData>[
            SoldBioData(
              genus: 'Stratum',
              species: 'Stratum Tectonicas',
              speciesLocalised: 'Stratum Tectonicas',
              valueCr: 19010800,
              bonusCr: 0,
            ),
          ],
        ),
        DiedEvent(timestamp: _at(4)),
      ]);

      expect(activity.totalSoldCr, 19010800);
      expect(activity.organismsLostToDeath, isZero);
    });

    test('échantillonner de nouveau après la perte repart de zéro', () {
      final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
        _scan(0, OrganicScanType.analyse),
        DiedEvent(timestamp: _at(1)),
        _scan(2, OrganicScanType.analyse, species: 'Bacterium Aurasus'),
      ]);

      expect(activity.organismsLostToDeath, 1);
      expect(activity.completedNotSold, hasLength(1));
      expect(activity.completedNotSold.single.species, 'Bacterium Aurasus');
    });

    test('deux morts successives comptent deux pertes', () {
      final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
        _scan(0, OrganicScanType.analyse),
        DiedEvent(timestamp: _at(1)),
        _scan(2, OrganicScanType.analyse, species: 'Bacterium Aurasus'),
        DiedEvent(timestamp: _at(3)),
      ]);

      expect(activity.organismsLostToDeath, 2);
      expect(activity.completedNotSold, isEmpty);
      expect(activity.lastLossAt, _at(3));
    });

    test('mourir les mains vides ne compte aucune perte', () {
      final ExobiologyActivity activity = aggregator.aggregate(<JournalEvent>[
        DiedEvent(timestamp: _at(1)),
        ResurrectEvent(timestamp: _at(2), option: 'rebuy'),
      ]);

      expect(activity.organismsLostToDeath, isZero);
      expect(activity.lastLossAt, isNull);
    });
  });
}
