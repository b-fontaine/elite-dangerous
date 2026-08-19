import 'dart:convert';

import 'package:elite_dangerous/core/storage/storage_keys.dart';
import 'package:elite_dangerous/features/journal/data/datasources/journal_local_store.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/in_memory_stores.dart';

String _line(int i) =>
    '{"timestamp":"2026-08-19T20:00:${i.toString().padLeft(2, '0')}Z",'
    '"event":"ScanOrganic"}';

void main() {
  late InMemoryKeyValueStore store;
  late InMemoryLineStore lines;
  late JournalLocalStore local;

  setUp(() {
    store = InMemoryKeyValueStore();
    lines = InMemoryLineStore();
    local = JournalLocalStore(store, lines);
  });

  group('stockage des lignes', () {
    test('ajouter n\'entraîne pas la réécriture de tout le journal', () async {
      await local.writeLines(<String>[_line(1), _line(2)]);
      final int rewritesAfterSeed = lines.fullRewrites;

      await local.appendLines(<String>[_line(3)]);

      // C'est toute la raison d'être du LineStore : le coût d'une synchro doit
      // suivre la taille de l'import, pas celle de l'historique.
      expect(lines.appends, 1);
      expect(lines.fullRewrites, rewritesAfterSeed);
      expect(await local.readLines(), hasLength(3));
    });

    test('ajouter ne rien faire ne touche pas le stockage', () async {
      await local.appendLines(const <String>[]);

      expect(lines.appends, 0);
      expect(lines.fullRewrites, 0);
    });

    test('le plafond ne garde que les lignes les plus récentes', () async {
      final List<String> seed = <String>[
        for (int i = 0; i < JournalLocalStore.maxStoredLines; i++) 'ligne $i',
      ];
      await local.writeLines(seed);

      await local.appendLines(<String>['la plus récente']);

      final List<String> stored = await local.readLines();
      expect(stored, hasLength(JournalLocalStore.maxStoredLines));
      expect(stored.last, 'la plus récente');
      expect(stored.first, 'ligne 1');
      // Franchir le plafond est le seul cas qui justifie une réécriture.
      expect(lines.fullRewrites, 2);
    });
  });

  group('migration depuis les préférences', () {
    test('récupère un journal écrit par une version antérieure', () async {
      await store.writeJsonList(
        StorageKeys.journalEvents,
        <String>[_line(1), _line(2)],
      );

      final List<String> read = await local.readLines();

      expect(read, hasLength(2));
      // La clé disparaît : sans ça les 27 Mio resteraient chargés à chaque
      // démarrage, en plus du fichier.
      expect(await store.containsKey(StorageKeys.journalEvents), isFalse);
    });

    test('ne se déclenche qu\'une fois', () async {
      await store.writeJsonList(StorageKeys.journalEvents, <String>[_line(1)]);

      await local.readLines();
      await local.appendLines(<String>[_line(2)]);
      await local.readLines();

      expect(await local.readLines(), hasLength(2));
      expect(lines.fullRewrites, 1);
    });

    test('une clé présente mais vide est simplement retirée', () async {
      await store.writeString(StorageKeys.journalEvents, jsonEncode(<String>[]));

      expect(await local.readLines(), isEmpty);
      expect(await store.containsKey(StorageKeys.journalEvents), isFalse);
      expect(lines.fullRewrites, 0);
    });

    test('effacer vide le fichier et les clés', () async {
      await local.writeLines(<String>[_line(1)]);
      await local.writeSettledDays(<String>{'2026-08-19'});
      await local.writeLastSyncedDay(DateTime.utc(2026, 8, 19));

      await local.clear();

      expect(await local.readLines(), isEmpty);
      expect(await local.readSettledDays(), isEmpty);
      expect(await local.readLastSyncedDay(), isNull);
    });
  });
}
