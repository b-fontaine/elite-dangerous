import '../entities/journal_event.dart';
import '../entities/system_survey.dart';

/// Folds the journal into the picture of one system.
///
/// A sibling of `ExobiologyActivityAggregator`, split from it for the same
/// reason that one is split from the session aggregator: they read the same
/// lines to answer different questions. That one measures a career; this one
/// answers "is there anything left to do *here*", which means everything it
/// reads has to be attributed to a single system and everything else dropped.
///
/// Attribution is by `SystemAddress` — the `id64` — and never by name. Two
/// systems can share a name, a system can be renamed, and a body called
/// `A 1` exists in most of the galaxy. The one concession is a `Scan` written
/// before Frontier added `SystemAddress` to it: those carry `StarSystem`, and
/// matching on the name is better than discarding the only survey the
/// commander has.
class SystemSurveyBuilder {
  const SystemSurveyBuilder();

  SystemSurvey build({
    required Iterable<JournalEvent> events,
    int? systemAddress,
    String? systemName,
  }) {
    if (systemAddress == null && systemName == null) {
      return const SystemSurvey.unknown();
    }

    final Map<String, _BodyDraft> drafts = <String, _BodyDraft>{};
    int? bodyCount;
    bool allFound = false;
    String? name = systemName;

    final List<JournalEvent> ordered = events.toList()
      ..sort(
        (JournalEvent a, JournalEvent b) => a.timestamp.compareTo(b.timestamp),
      );

    for (final JournalEvent event in ordered) {
      switch (event) {
        case final DiscoveryScanEvent honk:
          if (!_isHere(
            honk.systemAddress,
            honk.systemName,
            systemAddress,
            systemName,
          )) {
            continue;
          }
          bodyCount = honk.bodyCount;
          name ??= honk.systemName;

        case final AllBodiesFoundEvent found:
          if (!_isHere(
            found.systemAddress,
            found.systemName,
            systemAddress,
            systemName,
          )) {
            continue;
          }
          allFound = true;
          bodyCount ??= found.count;
          name ??= found.systemName;

        case final BodyScanEvent scan:
          if (!_isHere(
            scan.systemAddress,
            scan.starSystem,
            systemAddress,
            systemName,
          )) {
            continue;
          }
          name ??= scan.starSystem;
          final _BodyDraft draft = _draftFor(
            drafts,
            id: scan.bodyId,
            name: scan.bodyName,
          );
          // A later `Detailed` supersedes the arrival `AutoScan`; the reverse
          // never happens, so the richer scan wins rather than the newer one.
          if (draft.scan == null ||
              (scan.isDetailed && !draft.scan!.isDetailed)) {
            draft.scan = scan;
          }
          draft.name ??= scan.bodyName;
          draft.firstDiscovery |= !scan.wasDiscovered;
          draft.firstMapping |= !scan.wasMapped;

        case final BodySignalsEvent signals:
          if (!_isHereById(signals.systemAddress, systemAddress)) {
            continue;
          }
          final _BodyDraft draft = _draftFor(
            drafts,
            id: signals.bodyId,
            name: signals.bodyName,
          );
          // The DSS overrules the FSS: probes count what the honk estimated.
          if (signals.fromDetailedScan || draft.signals == null) {
            draft.signals = signals.biologicalCount;
          }
          if (signals.identifiesGenuses) {
            draft.genusNames = <String>[
              for (final DetectedGenus genus in signals.genuses)
                genus.displayName,
            ];
          }

        case final SurfaceMappedEvent mapped:
          if (!_isHereById(mapped.systemAddress, systemAddress)) {
            continue;
          }
          _draftFor(drafts, id: mapped.bodyId, name: mapped.bodyName).mapped =
              true;

        case final ScanOrganicEvent organic:
          if (!_isHereById(organic.systemAddress, systemAddress)) {
            continue;
          }
          final _BodyDraft draft = _draftFor(drafts, id: organic.bodyId);
          final String species = organic.displayName;
          draft.sampled.add(species);
          if (organic.completesOrganism) {
            draft.completed.add(species);
          }

        case _:
          break;
      }
    }

    final List<SurveyBody> bodies = drafts.values
        .map((_BodyDraft draft) => draft.build())
        .toList()
      ..sort(_nearestFirst);

    return SystemSurvey(
      systemName: name,
      systemAddress: systemAddress,
      bodyCount: bodyCount,
      allBodiesFound: allFound,
      bodies: List<SurveyBody>.unmodifiable(bodies),
    );
  }

  /// Whether an event that names only an `id64` belongs here.
  ///
  /// Strict on purpose: every event routed through this — `SAASignalsFound`,
  /// `SAAScanComplete`, `ScanOrganic` — has carried a `SystemAddress` since
  /// the day Frontier shipped it, so one that arrives without an address is
  /// not an old journal to be rescued, it is a line that cannot be placed.
  /// Guessing would attribute another system's organisms to this one.
  static bool _isHereById(int? eventAddress, int? systemAddress) =>
      eventAddress == systemAddress;

  /// Whether an event belongs to the system being surveyed.
  ///
  /// The `id64` decides whenever both sides have one. Falling back to the name
  /// only when the event has no address is what keeps a pre-2018 `Scan` in the
  /// picture without letting a namesake system in.
  static bool _isHere(
    int? eventAddress,
    String? eventName,
    int? systemAddress,
    String? systemName,
  ) {
    if (eventAddress != null && systemAddress != null) {
      return eventAddress == systemAddress;
    }
    if (eventName != null && systemName != null) {
      return eventName == systemName;
    }
    return false;
  }

  /// The draft for a body, joined on `BodyID` when there is one.
  ///
  /// `ScanOrganic` names no body at all — it carries only the id — so the id
  /// has to be the primary key or a sampled organism would never line up with
  /// the planet it was sampled on.
  static _BodyDraft _draftFor(
    Map<String, _BodyDraft> drafts, {
    int? id,
    String? name,
  }) {
    final String key = id?.toString() ?? name ?? '?';
    final _BodyDraft draft = drafts.putIfAbsent(
      key,
      () => _BodyDraft(bodyId: id),
    );
    draft.name ??= name;
    return draft;
  }

  static int _nearestFirst(SurveyBody a, SurveyBody b) {
    final double? left = a.distanceFromArrivalLs;
    final double? right = b.distanceFromArrivalLs;
    if (left == null || right == null) {
      if (left == null && right == null) {
        return a.name.compareTo(b.name);
      }
      return left == null ? 1 : -1;
    }
    final int byDistance = left.compareTo(right);
    return byDistance != 0 ? byDistance : a.name.compareTo(b.name);
  }
}

/// A body under construction while the journal is being read.
class _BodyDraft {
  _BodyDraft({this.bodyId});

  final int? bodyId;

  String? name;
  BodyScanEvent? scan;
  int? signals;
  List<String> genusNames = const <String>[];
  bool mapped = false;
  bool firstDiscovery = false;
  bool firstMapping = false;

  /// By species, so two samples of the same organism count once.
  final Set<String> sampled = <String>{};
  final Set<String> completed = <String>{};

  SurveyBody build() => SurveyBody(
        name: name ?? (bodyId == null ? 'Corps inconnu' : 'Corps $bodyId'),
        bodyId: bodyId,
        scan: scan,
        biologicalSignals: signals,
        genusNames: List<String>.unmodifiable(genusNames),
        mapped: mapped,
        firstDiscovery: firstDiscovery,
        firstMapping: firstMapping,
        organismsSampled: sampled.length,
        organismsCompleted: completed.length,
        distanceFromArrivalLs: scan?.distanceFromArrivalLs,
      );
}
