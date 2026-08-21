import 'package:equatable/equatable.dart';

/// How a capture answered one question.
enum InspectionVerdict {
  present('Présent'),
  partial('Partiel'),
  absent('Absent'),
  unknown('Indéterminé');

  const InspectionVerdict(this.label);

  final String label;
}

/// One question asked of a capture, and the answer it gave.
class InspectionFinding extends Equatable {
  const InspectionFinding({
    required this.subject,
    required this.verdict,
    required this.detail,
    this.isOpenQuestion = false,
  });

  final String subject;
  final InspectionVerdict verdict;

  /// What was actually counted, so the verdict can be audited.
  final String detail;

  /// Marks the two findings that decide whether a planned screen is
  /// buildable at all: the equipment of stored ships, and the on-foot
  /// loadouts. Neither is documented by Frontier.
  final bool isOpenQuestion;

  @override
  List<Object?> get props =>
      <Object?>[subject, verdict, detail, isOpenQuestion];
}

/// What a `/profile` capture holds.
class ProfileInspection extends Equatable {
  const ProfileInspection({
    required this.topLevelKeys,
    required this.findings,
  });

  const ProfileInspection.empty()
      : topLevelKeys = const <String>[],
        findings = const <InspectionFinding>[];

  final List<String> topLevelKeys;
  final List<InspectionFinding> findings;

  List<InspectionFinding> get openQuestions => findings
      .where((InspectionFinding finding) => finding.isOpenQuestion)
      .toList(growable: false);

  @override
  List<Object?> get props => <Object?>[topLevelKeys, findings];
}

/// One journal event type, and how the app currently treats it.
class JournalEventTally extends Equatable {
  const JournalEventTally({
    required this.name,
    required this.count,
    required this.isParsed,
    required this.isPlanned,
  });

  final String name;

  /// Occurrences in the capture. Zero for a planned event that never showed
  /// up — an absence is a result too.
  final int count;

  /// The app already turns this event into a domain object.
  final bool isParsed;

  /// The cockpit plan needs something from this event.
  final bool isPlanned;

  bool get isPresent => count > 0;

  /// Parsed *and* planned means the app reads the event but not everything it
  /// carries — `SuitLoadout` is read for the suit and ignored for the weapons.
  bool get isPartiallyRead => isParsed && isPlanned;

  @override
  List<Object?> get props => <Object?>[name, count, isParsed, isPlanned];
}

/// What a journal capture holds.
class JournalInspection extends Equatable {
  const JournalInspection({
    required this.lineCount,
    required this.unreadableLines,
    required this.tallies,
    this.firstAt,
    this.lastAt,
  });

  const JournalInspection.empty()
      : lineCount = 0,
        unreadableLines = 0,
        tallies = const <JournalEventTally>[],
        firstAt = null,
        lastAt = null;

  final int lineCount;

  /// Lines that are not a JSON object carrying `timestamp` and `event`.
  final int unreadableLines;

  /// Every event type met, most frequent first, followed by the planned ones
  /// that never appeared.
  final List<JournalEventTally> tallies;

  final DateTime? firstAt;
  final DateTime? lastAt;

  List<JournalEventTally> get planned => tallies
      .where((JournalEventTally tally) => tally.isPlanned)
      .toList(growable: false);

  /// Planned events the capture does not contain — what a wider sync would
  /// still have to go and find.
  List<JournalEventTally> get missing => tallies
      .where((JournalEventTally tally) => tally.isPlanned && !tally.isPresent)
      .toList(growable: false);

  int get eventTypeCount =>
      tallies.where((JournalEventTally tally) => tally.isPresent).length;

  @override
  List<Object?> get props =>
      <Object?>[lineCount, unreadableLines, tallies, firstAt, lastAt];
}
