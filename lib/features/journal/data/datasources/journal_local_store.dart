import 'package:injectable/injectable.dart';

import '../../../../core/storage/key_value_store.dart';
import '../../../../core/storage/storage_keys.dart';

/// Persists the raw journal lines the app has already seen.
///
/// Lines are stored rather than parsed events: the parser will improve, and
/// re-parsing a stored line is free, whereas re-fetching a day from Frontier
/// costs one of the very few queries the commander is allowed per minute.
@lazySingleton
class JournalLocalStore {
  const JournalLocalStore(this._store);

  final KeyValueStore _store;

  /// A journal spanning years would eventually blow past what a key/value
  /// store should hold; the cap keeps the most recent lines, which are the
  /// only ones the exobiology picture depends on.
  static const int maxStoredLines = 60000;

  Future<List<String>> readLines() async {
    final List<dynamic>? stored =
        await _store.readJsonList(StorageKeys.journalEvents);
    return stored?.whereType<String>().toList(growable: false) ??
        const <String>[];
  }

  Future<void> writeLines(List<String> lines) async {
    final List<String> capped = lines.length <= maxStoredLines
        ? lines
        : lines.sublist(lines.length - maxStoredLines);
    await _store.writeJsonList(StorageKeys.journalEvents, capped);
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

  Future<String?> readJournalDirectory() =>
      _store.readString(StorageKeys.journalLocalFolder);

  Future<void> writeJournalDirectory(String path) =>
      _store.writeString(StorageKeys.journalLocalFolder, path);

  Future<void> clear() async {
    await _store.remove(StorageKeys.journalEvents);
    await _store.remove(StorageKeys.journalLastSyncedDay);
  }
}
