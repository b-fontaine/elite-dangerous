import 'package:injectable/injectable.dart';

import '../../commander/domain/entities/rank.dart';
import '../../journal/domain/services/journal_event_parser.dart';
import '../domain/services/payload_inspector.dart';

/// Registers the diagnostics domain service, which carries no framework
/// annotation so the domain layer stays free of `injectable`.
@module
abstract class DiagnosticsModule {
  /// Wired with the parser's own list and the real rank ladders, so the screen
  /// can never claim the app reads something it does not.
  @lazySingleton
  PayloadInspector get payloadInspector => PayloadInspector(
        parsedJournalEvents: JournalEventParser.supportedEvents,
        modelledRankKeys: <String>{
          for (final RankType type in RankType.values) type.capiKey,
        },
      );
}
