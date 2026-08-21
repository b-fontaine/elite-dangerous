import 'package:elite_dangerous/features/journal/data/datasources/journal_api.dart';
import 'package:elite_dangerous/features/journal/data/datasources/journal_file_data_source.dart';
import 'package:elite_dangerous/features/journal/data/datasources/journal_local_store.dart';
import 'package:elite_dangerous/features/journal/data/datasources/journal_tail_data_source.dart';
import 'package:elite_dangerous/features/journal/data/repositories/journal_repository_impl.dart';
import 'package:elite_dangerous/features/journal/domain/entities/journal_event.dart';
import 'package:elite_dangerous/features/journal/domain/repositories/journal_repository.dart';
import 'package:elite_dangerous/features/journal/domain/services/journal_event_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit/retrofit.dart';

import '../../../fixtures/in_memory_stores.dart';

class _UnusedJournalApi implements JournalApi {
  @override
  Future<HttpResponse<String>> journalForDay(
    String year,
    String month,
    String day,
  ) async =>
      throw StateError('non utilisé');
}

/// The repository keeps the parsed journal in memory so that a live merge
/// costs what arrived rather than what is stored. That cache is only safe if
/// it is dropped the one time the store stops matching it — when the oldest
/// lines are trimmed to stay under the cap.
void main() {
  late InMemoryLineStore lines;
  late JournalRepositoryImpl repository;

  JournalRepositoryImpl build(JournalLocalStore store) => JournalRepositoryImpl(
        _UnusedJournalApi(),
        const JournalFileDataSource(),
        store,
        const JournalEventParser(),
        JournalTailDataSource(const JournalFileDataSource()),
      );

  String line(int minute) =>
      '{"timestamp":"2026-08-20T${(minute ~/ 3600).toString().padLeft(2, '0')}:'
      '${(minute ~/ 60 % 60).toString().padLeft(2, '0')}:'
      '${(minute % 60).toString().padLeft(2, '0')}Z","event":"Scan",'
      '"BodyName":"corps $minute"}';

  Future<List<JournalEvent>> read() async =>
      (await repository.events()).getOrElse((_) => const <JournalEvent>[]);

  tearDown(() => repository.dispose());

  test('deux lectures de suite ne relisent pas le magasin', () async {
    lines = InMemoryLineStore(<String>[line(1), line(2)]);
    repository = build(JournalLocalStore(InMemoryKeyValueStore(), lines));

    expect(await read(), hasLength(2));
    expect(await read(), hasLength(2));

    // Une seule descente jusqu'au magasin : c'est tout l'intérêt.
    expect(lines.reads, 1);
  });

  test('une importation ajoute au cache sans tout réanalyser', () async {
    lines = InMemoryLineStore(<String>[line(1)]);
    repository = build(JournalLocalStore(InMemoryKeyValueStore(), lines));

    await read();
    await repository.importFiles(<JournalFileSource>[
      JournalFileSource(
        name: 'live',
        readLines: () => Stream<String>.fromIterable(<String>[line(2)]),
      ),
    ]);

    expect(await read(), hasLength(2));
    // Ajouté en fin de fichier, jamais réécrit ni relu en entier.
    expect(lines.fullRewrites, 0);
    expect(lines.appends, 1);
    expect(lines.reads, 1);
  });

  test('effacer vide le cache autant que le magasin', () async {
    lines = InMemoryLineStore(<String>[line(1), line(2)]);
    repository = build(JournalLocalStore(InMemoryKeyValueStore(), lines));

    await read();
    await repository.clear();

    expect(await read(), isEmpty);
  });

  test('franchir le plafond reconstruit le cache au lieu de mentir', () async {
    // Le seul cas où le magasin cesse de correspondre au cache : les lignes
    // les plus anciennes partent. Sans reconstruction, le journal continuerait
    // de contenir des événements qui ne sont plus stockés — et la mémoire ne
    // redescendrait jamais.
    const int cap = JournalLocalStore.maxStoredLines;
    lines = InMemoryLineStore(<String>[for (int i = 0; i < cap; i++) line(i)]);
    repository = build(JournalLocalStore(InMemoryKeyValueStore(), lines));

    expect(await read(), hasLength(cap));

    await repository.importFiles(<JournalFileSource>[
      JournalFileSource(
        name: 'live',
        readLines: () =>
            Stream<String>.fromIterable(<String>[line(cap), line(cap + 1)]),
      ),
    ]);

    final List<JournalEvent> after = await read();
    expect(after, hasLength(cap));
    expect(lines.fullRewrites, 1);
    expect(
      after.whereType<BodyScanEvent>().map((BodyScanEvent e) => e.bodyName),
      isNot(contains('corps 0')),
    );
    expect(
      after.whereType<BodyScanEvent>().map((BodyScanEvent e) => e.bodyName),
      contains('corps ${cap + 1}'),
    );
  });
}
