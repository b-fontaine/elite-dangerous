import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/route_planning/domain/entities/done_index.dart';
import 'package:elite_dangerous/features/route_planning/domain/services/done_index_builder.dart';
import 'package:flutter_test/flutter_test.dart';

const int _borfor = 1968982460787;

DateTime _at(int minute) => DateTime.utc(2026, 9, 3, 12, minute);

void main() {
  const DoneIndexBuilder build = DoneIndexBuilder();

  group('the two keys', () {
    // The next lot pours two remote sources in, and they disagree on which key
    // they publish: the Frontier visited-stars cache carries `id64`, EDSM's
    // flight logs carry a system *name* and an EDSM-internal id that maps to
    // nothing else. Carrying both from the start is what avoids a reshape.
    test('a journal populates both the id and the name', () {
      final DoneIndex index = build(<JournalEvent>[
        LocationEvent(
          timestamp: _at(1),
          name: 'FSDJump',
          starSystem: 'Borfor',
          systemAddress: _borfor,
        ),
      ]);

      expect(index.hasVisitedSystemId(_borfor), isTrue);
      expect(index.hasVisitedSystemName('Borfor'), isTrue);
      expect(index.hasVisitedSystemName('  bOrFoR '), isTrue,
          reason: 'names are normalised, since sources differ in casing');
      expect(index.hasVisited(id64: _borfor), isTrue);
      expect(index.hasVisited(name: 'Borfor'), isTrue);
      expect(index.hasVisited(id64: 42, name: 'Ailleurs'), isFalse);
    });

    test('a name-only source still answers, without an id', () {
      // Exactly the shape EDSM will arrive in.
      const DoneIndex fromEdsm = DoneIndex(systemNames: <String>{'shinrarta dezhra'});

      expect(fromEdsm.hasVisited(name: 'Shinrarta Dezhra'), isTrue);
      expect(fromEdsm.hasVisited(id64: 3932277478106), isFalse);
    });
  });

  group('merging', () {
    test('keeps everything either side knows', () {
      final DoneIndex journal = build(<JournalEvent>[
        BodyScanEvent(
          timestamp: _at(1),
          bodyName: 'Borfor 1 d',
          starSystem: 'Borfor',
          systemAddress: _borfor,
          bodyId: 4,
          wasDiscovered: false,
          wasMapped: false,
        ),
      ]);
      const DoneIndex remote = DoneIndex(
        systemIds: <int>{999},
        systemNames: <String>{'ailleurs'},
      );

      final DoneIndex merged = journal.mergedWith(remote);

      expect(merged.hasVisitedSystemId(_borfor), isTrue);
      expect(merged.hasVisitedSystemId(999), isTrue);
      expect(merged.hasVisitedSystemName('Ailleurs'), isTrue);
      expect(merged.recordFor(_borfor, 4)!.scanned, isTrue);
    });

    test('folds two records of one body instead of replacing it', () {
      // A body scanned in one source and mapped in another is both, not the
      // last one written.
      final DoneIndex scanned = build(<JournalEvent>[
        BodyScanEvent(
          timestamp: _at(1),
          bodyName: 'Borfor 1 d',
          systemAddress: _borfor,
          bodyId: 4,
        ),
      ]);
      final DoneIndex mapped = build(<JournalEvent>[
        SurfaceMappedEvent(
          timestamp: _at(2),
          bodyName: 'Borfor 1 d',
          systemAddress: _borfor,
          bodyId: 4,
          probesUsed: 5,
          efficiencyTarget: 7,
        ),
      ]);

      final BodyRecord record = scanned.mergedWith(mapped).recordFor(_borfor, 4)!;

      expect(record.scanned, isTrue);
      expect(record.mapped, isTrue);
      expect(record.name, 'Borfor 1 d');
    });
  });

  group('the body join', () {
    test('resolves a route body name to the number the journal uses', () {
      final DoneIndex index = build(<JournalEvent>[
        BodyScanEvent(
          timestamp: _at(1),
          bodyName: 'Borfor 1 d',
          systemAddress: _borfor,
          bodyId: 4,
          wasDiscovered: true,
          wasMapped: false,
        ),
      ]);

      expect(index.recordForName(_borfor, 'Borfor 1 d')!.bodyId, 4);
      expect(index.recordForName(_borfor, 'borfor 1 d')!.bodyId, 4);
      expect(index.recordForName(_borfor, 'Jamais vu'), isNull);
    });

    test('learns a body from ApproachBody, which carries no BodyType', () {
      // Filtering on `isPlanet` here would drop the event: the journal does not
      // always carry `BodyType`, and a name plus a number is the requirement.
      final DoneIndex index = build(<JournalEvent>[
        LocationEvent(
          timestamp: _at(1),
          name: 'ApproachBody',
          starSystem: 'Borfor',
          systemAddress: _borfor,
          bodyName: 'Borfor 1 d',
          bodyId: 4,
        ),
      ]);

      expect(index.recordForName(_borfor, 'Borfor 1 d')!.bodyId, 4);
    });

    test('carries the discovery flags that decide if a bonus is still open',
        () {
      final DoneIndex index = build(<JournalEvent>[
        BodyScanEvent(
          timestamp: _at(1),
          bodyName: 'Borfor 1 d',
          systemAddress: _borfor,
          bodyId: 4,
          wasDiscovered: false,
          wasMapped: false,
        ),
      ]);

      final BodyRecord record = index.recordFor(_borfor, 4)!;
      expect(record.wasDiscoveredBefore, isFalse);
      expect(record.wasMappedBefore, isFalse);
      expect(record.mapped, isFalse, reason: 'scanning is not mapping');
    });
  });

  group('what it deliberately ignores', () {
    test('sampling, which belongs to a route rather than to the galaxy', () {
      final DoneIndex index = build(<JournalEvent>[
        ScanOrganicEvent(
          timestamp: _at(1),
          scanType: OrganicScanType.analyse,
          genus: r'$Codex_Ent_Stratum_Genus_Name;',
          species: r'$Codex_Ent_Stratum_02_Name;',
          systemAddress: _borfor,
          bodyId: 4,
        ),
      ]);

      expect(index.bodies, isEmpty);
      expect(index.systemIds, isEmpty);
    });
  });
}
