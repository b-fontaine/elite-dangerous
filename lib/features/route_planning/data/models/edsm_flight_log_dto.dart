import '../../../../core/json/json_readers.dart';
import '../../../../core/network/edsm_endpoints.dart';
import '../../domain/entities/done_index.dart';

/// One window of EDSM flight log, read into the shape the index wants.
///
/// EDSM answers `200 OK` for every outcome — a missing key, an unknown
/// commander and a real history all arrive the same way — so [message] is the
/// only place failure is visible. Reading the status code alone would turn
/// "your key is wrong" into "you have never been anywhere", and a backfill
/// would then confidently record an empty past.
class EdsmFlightLogPage {
  const EdsmFlightLogPage({
    required this.message,
    this.systemIds = const <int>{},
    this.systemNames = const <String>{},
    this.entryCount = 0,
    this.earliest,
  });

  /// EDSM's `msgnum`. 100 is the only success.
  final int message;

  /// `systemId64` where EDSM supplied it — which it does only with `showId=1`,
  /// and which its own documentation, frozen since 2019, does not mention.
  final Set<int> systemIds;

  /// Every system by name, always. The fallback for entries EDSM returns
  /// without an id64, and the reason [DoneIndex] carries two keys.
  final Set<String> systemNames;

  /// How many log entries the window held, before deduplication. Zero on a
  /// quiet week, which is ordinary and not an error.
  final int entryCount;

  /// Oldest timestamp seen in this window, which is how a backfill walks
  /// backwards without trusting its own arithmetic.
  final DateTime? earliest;

  bool get isSuccess => EdsmMessage.isSuccess(message);

  /// True when credentials are the problem, which is worth saying differently
  /// from a network failure: one is fixed in the settings screen, the other by
  /// waiting.
  bool get isCredentialFailure =>
      message == EdsmMessage.missingApiKey ||
      message == EdsmMessage.unknownCommanderOrKey;

  DoneIndex get asIndex => DoneIndex(
        systemIds: Set<int>.unmodifiable(systemIds),
        systemNames: Set<String>.unmodifiable(systemNames),
      );

  static EdsmFlightLogPage fromJson(Map<String, dynamic> json) {
    final int message = readInt(json['msgnum']) ?? -1;
    final Set<int> ids = <int>{};
    final Set<String> names = <String>{};
    DateTime? earliest;
    int count = 0;

    if (json['logs'] case final List<dynamic> logs) {
      for (final Map<String, dynamic> entry
          in logs.whereType<Map<String, dynamic>>()) {
        count++;
        if (readString(entry['system']) case final String name) {
          names.add(DoneIndex.normalise(name));
        }
        // Never `systemId`: that one is EDSM's own primary key and joins onto
        // nothing else this app holds.
        if (readInt(entry['systemId64']) case final int id64 when id64 > 0) {
          ids.add(id64);
        }
        final DateTime? at = _parseDate(readString(entry['date']));
        if (at != null) {
          final DateTime? current = earliest;
          if (current == null || at.isBefore(current)) {
            earliest = at;
          }
        }
      }
    }

    return EdsmFlightLogPage(
      message: message,
      systemIds: ids,
      systemNames: names,
      entryCount: count,
      earliest: earliest,
    );
  }

  /// EDSM dates are `YYYY-MM-DD HH:MM:SS` in UTC — a space where ISO wants a
  /// `T`, and no zone suffix at all.
  static DateTime? _parseDate(String? raw) {
    if (raw == null) {
      return null;
    }
    return DateTime.tryParse('${raw.replaceFirst(' ', 'T')}Z');
  }
}
