import 'dart:convert';

import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/features/journal/domain/repositories/journal_repository.dart';
import 'package:flutter_test/flutter_test.dart';

/// Feeds raw journal lines into the real repository, the way an import does.
///
/// `Stream.fromIterable` rather than an `async*` generator, deliberately: a
/// generated stream keeps a subscription alive that a widget test's teardown
/// then waits on, and the suite hangs at `close()` rather than failing.
Future<void> importJournalLines(
  WidgetTester tester,
  List<Map<String, dynamic>> events,
) async {
  final List<String> lines =
      events.map(jsonEncode).toList();

  await tester.runAsync(
    () => getIt<JournalRepository>().importFiles(<JournalFileSource>[
      JournalFileSource(
        name: 'Journal.bdd.log',
        readLines: () => Stream<String>.fromIterable(lines),
      ),
    ]),
  );
}

String bddTimestamp(int minute) =>
    DateTime.utc(2026, 9, 3, 20, minute).toIso8601String();
