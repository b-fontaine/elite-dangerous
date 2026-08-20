import 'package:injectable/injectable.dart';

import '../../../../core/storage/key_value_store.dart';
import '../../../../core/storage/line_store.dart';
import '../../../../core/storage/storage_keys.dart';

/// Persists the raw journal lines the app has already seen.
///
/// Lines are stored rather than parsed events: the parser will improve, and
/// re-parsing a stored line is free, whereas re-fetching a day from Frontier
/// costs one of the very few queries the commander is allowed.
///
/// The lines live in a [LineStore]; only the bookkeeping around them stays in
/// the [KeyValueStore]. They used to share the latter, which meant one JSON
/// array — re-encoded and rewritten whole on every sync, and resident in
/// memory for the life of the process. At [maxStoredLines] that array measured
/// 27 MiB, and raising the sync window to ninety days made reaching it likely.
@lazySingleton
class JournalLocalStore {
  const JournalLocalStore(this._store, this._lines);

  final KeyValueStore _store;
  final LineStore _lines;

  /// A journal spanning years has to stop somewhere; the cap keeps the most
  /// recent lines, which are the only ones the exobiology picture depends on.
  static const int maxStoredLines = 60000;

  Future<List<String>> readLines() async {
    await _migrateFromKeyValueStore();
    return _lines.readLines();
  }

  Future<void> writeLines(List<String> lines) async {
    await _migrateFromKeyValueStore();
    await _lines.writeLines(_capped(lines));
  }

  /// Adds [lines] without rewriting what is already stored.
  ///
  /// Falls back to a full rewrite only when the cap is reached, which is the
  /// one case where the oldest lines have to go.
  ///
  /// Returns whether that fallback happened, i.e. whether lines were dropped
  /// from the front. Callers that keep their own picture of the journal in
  /// memory need to know: an append leaves that picture valid, a trim does
  /// not.
  Future<bool> appendLines(List<String> lines) async {
    await _migrateFromKeyValueStore();
    if (lines.isEmpty) {
      return false;
    }
    if (await _lines.countLines() + lines.length <= maxStoredLines) {
      await _lines.appendLines(lines);
      return false;
    }
    await _lines.writeLines(
      _capped(<String>[...await _lines.readLines(), ...lines]),
    );
    return true;
  }

  Future<DateTime?> readLastSyncedDay() async {
    final String? raw =
        await _store.readString(StorageKeys.journalLastSyncedDay);
    return raw == null ? null : DateTime.tryParse(raw);
  }

  Future<void> writeLastSyncedDay(DateTime day) => _store.writeString(
        StorageKeys.journalLastSyncedDay,
        day.toIso8601String(),
      );

  /// UTC days already settled with Frontier, as `YYYY-MM-DD`.
  ///
  /// A *past* day that answered `200` or `204` can never change: the commander
  /// cannot retroactively play it, and Frontier will not gain entries for it.
  /// Remembering them is what lets a wide sync spend its queries on the days
  /// it has not seen instead of re-downloading the same fortnight. Today is
  /// never settled — the session may still be running — and neither is a `206`,
  /// which Frontier explicitly asks to be retried.
  Future<Set<String>> readSettledDays() async {
    final List<dynamic>? stored =
        await _store.readJsonList(StorageKeys.journalSettledDays);
    return stored?.whereType<String>().toSet() ?? <String>{};
  }

  Future<void> writeSettledDays(Set<String> days) => _store.writeJsonList(
        StorageKeys.journalSettledDays,
        days.toList(growable: false)..sort(),
      );

  Future<String?> readJournalDirectory() =>
      _store.readString(StorageKeys.journalLocalFolder);

  Future<void> writeJournalDirectory(String path) =>
      _store.writeString(StorageKeys.journalLocalFolder, path);

  Future<void> clear() async {
    await _lines.clear();
    await _store.remove(StorageKeys.journalEvents);
    await _store.remove(StorageKeys.journalLastSyncedDay);
    await _store.remove(StorageKeys.journalSettledDays);
  }

  static List<String> _capped(List<String> lines) =>
      lines.length <= maxStoredLines
          ? lines
          : lines.sublist(lines.length - maxStoredLines);

  /// Moves a journal written by an older build out of the preferences.
  ///
  /// One-shot and idempotent: the key is dropped only once the lines are in
  /// the line store, so a commander upgrading keeps the history they imported
  /// instead of silently starting from an empty journal.
  Future<void> _migrateFromKeyValueStore() async {
    if (!await _store.containsKey(StorageKeys.journalEvents)) {
      return;
    }
    final List<dynamic>? legacy =
        await _store.readJsonList(StorageKeys.journalEvents);
    final List<String> lines =
        legacy?.whereType<String>().toList(growable: false) ?? const <String>[];
    if (lines.isNotEmpty) {
      await _lines.writeLines(_capped(lines));
    }
    await _store.remove(StorageKeys.journalEvents);
  }
}
