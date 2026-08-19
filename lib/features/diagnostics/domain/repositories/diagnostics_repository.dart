import '../../../../core/result/result.dart';
import '../entities/raw_payload.dart';

/// Access to what Frontier actually sent, before the app made sense of it.
///
/// Deliberately parallel to — and not built on — `CommanderRepository` and
/// `JournalRepository`: those return entities, and an entity is exactly what
/// throws away the fields this feature exists to find.
abstract interface class DiagnosticsRepository {
  /// The last `/profile` the app stored, or `null` when it never synced.
  Future<Result<RawPayload?>> cachedProfile();

  /// Calls `/profile` now. Costs one of the ~1 query per minute Frontier
  /// allows, so the UI must ask before spending it.
  Future<Result<RawPayload>> fetchProfile();

  /// The journal lines already on this device, whichever way they got here.
  Future<Result<RawPayload?>> storedJournal();

  /// Calls `/journal/{year}/{month}/{day}` now, for a UTC day.
  Future<Result<RawPayload>> fetchJournalDay(DateTime dayUtc);

  /// Writes a capture next to the app's data and returns the full path.
  Future<Result<String>> export(RawPayload payload);
}
