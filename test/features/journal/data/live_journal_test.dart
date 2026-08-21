import 'dart:convert';
import 'dart:io';

import 'package:elite_dangerous/core/storage/storage_keys.dart';
import 'package:elite_dangerous/core/time/clock.dart';
import 'package:elite_dangerous/features/journal/data/datasources/game_state_data_source.dart';
import 'package:elite_dangerous/features/journal/data/datasources/journal_api.dart';
import 'package:elite_dangerous/features/journal/data/datasources/journal_file_data_source.dart';
import 'package:elite_dangerous/features/journal/data/datasources/journal_local_store.dart';
import 'package:elite_dangerous/features/journal/data/datasources/journal_tail_data_source.dart';
import 'package:elite_dangerous/features/journal/data/repositories/journal_repository_impl.dart';
import 'package:elite_dangerous/features/journal/data/repositories/live_journal_repository_impl.dart';
import 'package:elite_dangerous/features/journal/domain/entities/game_status.dart';
import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/journal/domain/entities/live_game_state.dart';
import 'package:elite_dangerous/features/journal/domain/services/journal_event_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit/retrofit.dart';

import '../../../fixtures/in_memory_stores.dart';

/// The Companion API has no business in a live session; calling it would be
/// the bug.
class _UnusedJournalApi implements JournalApi {
  @override
  Future<HttpResponse<String>> journalForDay(
    String year,
    String month,
    String day,
  ) async =>
      throw StateError('le suivi en direct ne doit pas interroger Frontier');
}

/// A file data source that suggests nothing.
///
/// The real one looks in the standard save locations, which on the machine of
/// someone who actually plays Elite Dangerous do exist — and a test that reads
/// a commander's real journal is a test whose result depends on who runs it.
class _NoSuggestions extends JournalFileDataSource {
  const _NoSuggestions();

  @override
  List<String> suggestedDirectories() => const <String>[];
}

class _FixedClock implements Clock {
  const _FixedClock();

  @override
  DateTime now() => DateTime.utc(2026, 8, 20, 12, 30);
}

void main() {
  late Directory folder;
  late InMemoryKeyValueStore keyValues;
  late InMemoryLineStore lines;
  late JournalLocalStore store;
  late JournalTailDataSource tail;
  late JournalRepositoryImpl journal;
  late LiveJournalRepositoryImpl live;

  setUp(() async {
    // The live view is a desktop feature; without this the test runs as
    // Android and every read is skipped before it starts.
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;

    folder = await Directory.systemTemp.createTemp('live_journal_test');
    keyValues = InMemoryKeyValueStore();
    lines = InMemoryLineStore();
    store = JournalLocalStore(keyValues, lines);
    tail = JournalTailDataSource(const _NoSuggestions());
    journal = JournalRepositoryImpl(
      _UnusedJournalApi(),
      const _NoSuggestions(),
      store,
      const JournalEventParser(),
      tail,
    );
    live = LiveJournalRepositoryImpl(
      tail,
      const GameStateDataSource(),
      const _NoSuggestions(),
      store,
      journal,
      const _FixedClock(),
    );
  });

  tearDown(() async {
    await live.dispose();
    await journal.dispose();
    debugDefaultTargetPlatformOverride = null;
    if (folder.existsSync()) {
      await folder.delete(recursive: true);
    }
  });

  Future<void> useFolder() =>
      keyValues.writeString(StorageKeys.journalLocalFolder, folder.path);

  void write(String name, String content) =>
      File('${folder.path}/$name').writeAsStringSync(content);

  void writeStatus(int flags, {int flags2 = 0, String? bodyName}) => write(
    'Status.json',
    jsonEncode(<String, dynamic>{
      'timestamp': '2026-08-20T12:29:00Z',
      'event': 'Status',
      'Flags': flags,
      'Flags2': flags2,
      'BodyName': ?bodyName,
    }),
  );

  String line(String event, {String stamp = '2026-08-20T12:00:00Z'}) =>
      jsonEncode(<String, dynamic>{'timestamp': stamp, 'event': event});

  group('ce que le suivi sait faire, et où', () {
    test('hors bureau, il ne lit rien et le dit', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      expect(live.isSupported, isFalse);
      expect((await live.refreshNow()).tracking, LiveTracking.unsupported);
    });

    test('sans dossier connu, il demande lequel', () async {
      expect((await live.refreshNow()).tracking, LiveTracking.noFolder);
    });

    test('un dossier disparu est signalé comme tel', () async {
      await keyValues.writeString(
        StorageKeys.journalLocalFolder,
        '${folder.path}/disque-debranche',
      );

      final LiveGameState state = await live.refreshNow();

      expect(state.tracking, LiveTracking.folderMissing);
      expect(state.directory, contains('disque-debranche'));
    });

    test('le menu principal compte comme jeu non détecté', () async {
      await useFolder();
      writeStatus(0);

      expect((await live.refreshNow()).tracking, LiveTracking.idle);
    });

    test('un vaisseau en vol, c\'est du direct', () async {
      await useFolder();
      writeStatus(
        StatusFlag.supercruise | StatusFlag.inMainShip,
        bodyName: 'Hyades Sector DR-V c2-23 A 5',
      );

      final LiveGameState state = await live.refreshNow();

      expect(state.tracking, LiveTracking.live);
      expect(state.status!.bodyName, 'Hyades Sector DR-V c2-23 A 5');
      expect(state.status!.supercruise, isTrue);
    });
  });

  group('ce que le suivi verse dans le journal', () {
    test('les lignes écrites par le jeu rejoignent le journal ordinaire', () async {
      await useFolder();
      writeStatus(StatusFlag.docked);
      write(
        'Journal.2026-08-20T120000.01.log',
        '${line('LoadGame')}\n${line('FSDJump', stamp: '2026-08-20T12:01:00Z')}\n',
      );

      await live.refreshNow();

      final List<JournalEvent> events = (await journal.events()).getOrElse(
        (_) => const <JournalEvent>[],
      );
      expect(
        events.map((JournalEvent e) => e.name),
        containsAll(<String>['LoadGame', 'FSDJump']),
      );
    });

    test('deux passages n\'écrivent pas la même ligne deux fois', () async {
      await useFolder();
      writeStatus(StatusFlag.docked);
      write('Journal.2026-08-20T120000.01.log', '${line('LoadGame')}\n');

      await live.refreshNow();
      await live.refreshNow();

      expect(await lines.countLines(), 1);
    });

    test('ShipLocker.json est versé comme un événement de journal', () async {
      // Le point qui rend l'inventaire utilisable en session : le journal
      // écrit un `ShipLocker` vide et renvoie au fichier.
      await useFolder();
      writeStatus(StatusFlag.docked);
      write(
        'ShipLocker.json',
        jsonEncode(<String, dynamic>{
          'timestamp': '2026-08-20T12:05:00Z',
          'event': 'ShipLocker',
          'Components': <Map<String, dynamic>>[
            <String, dynamic>{
              'Name': 'graphene',
              'Name_Localised': 'Graphène',
              'Count': 12,
            },
          ],
        }),
      );

      await live.refreshNow();

      final List<JournalEvent> events = (await journal.events()).getOrElse(
        (_) => const <JournalEvent>[],
      );
      final ShipLockerEvent locker = events.whereType<ShipLockerEvent>().single;
      // Le nom canonique du jeu, pas le nom localisé du client — et rangé
      // dans la bonne catégorie : le Graphène est un composant.
      expect(locker.components, containsPair('Graphene', 12));
      expect(locker.everything, containsPair('Graphene', 12));
    });

    test('effacer le journal fait tout relire au passage suivant', () async {
      // Sans cela le suivi resterait positionné à la fin du fichier que le jeu
      // écrit, et le journal effacé ne se remplirait qu'à la session
      // suivante — c'est-à-dire au prochain lancement du jeu.
      await useFolder();
      writeStatus(StatusFlag.docked);
      write('Journal.2026-08-20T120000.01.log', '${line('LoadGame')}\n');
      await live.refreshNow();
      expect(await lines.countLines(), 1);

      await journal.clear();
      expect(await lines.countLines(), 0);

      await live.refreshNow();

      expect(await lines.countLines(), 1);
    });

    test(
      'la ligne comptée est celle du journal, pas celle des annexes',
      () async {
        await useFolder();
        writeStatus(StatusFlag.docked);
        write('Journal.2026-08-20T120000.01.log', '${line('LoadGame')}\n');
        write(
          'Cargo.json',
          jsonEncode(<String, dynamic>{
            'timestamp': '2026-08-20T12:05:00Z',
            'event': 'Cargo',
            'Count': 0,
          }),
        );

        final LiveGameState state = await live.refreshNow();

        expect(state.linesIngested, 1);
      },
    );
  });

  group('quand la lecture tombe mal', () {
    test('un Status.json illisible garde le dernier état connu', () async {
      await useFolder();
      writeStatus(StatusFlag.docked, bodyName: 'Shinrarta Dezhra A 1');
      await live.refreshNow();

      // Le jeu tronque le fichier avant de le réécrire.
      write('Status.json', '');
      final LiveGameState state = await live.refreshNow();

      expect(state.status!.bodyName, 'Shinrarta Dezhra A 1');
      expect(state.tracking, LiveTracking.live);
    });
  });

  test('watch() sert un premier état sans attendre le tick suivant', () async {
    await useFolder();
    writeStatus(StatusFlag.docked);

    final LiveGameState first = await live.watch().first;

    expect(first.tracking, LiveTracking.live);
  });
}
