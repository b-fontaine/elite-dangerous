import 'package:injectable/injectable.dart';

import '../domain/services/exobiology_activity_aggregator.dart';
import '../domain/services/journal_event_parser.dart';
import '../domain/services/journal_session_aggregator.dart';

/// Registers the journal domain services, which carry no framework annotations
/// so the domain layer stays free of `injectable`.
@module
abstract class JournalModule {
  @lazySingleton
  JournalEventParser get parser => const JournalEventParser();

  @lazySingleton
  ExobiologyActivityAggregator get aggregator =>
      const ExobiologyActivityAggregator();

  @lazySingleton
  JournalSessionAggregator get sessionAggregator =>
      const JournalSessionAggregator();
}
