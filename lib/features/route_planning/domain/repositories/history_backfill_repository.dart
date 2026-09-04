import '../../../../core/result/result.dart';
import '../entities/done_index.dart';

/// Why a backfill stopped.
enum BackfillStop {
  reachedStart('Toute la période demandée a été parcourue'),
  quiet('Plus rien de plus ancien à récupérer'),
  budgetSpent('Nombre de fenêtres atteint pour cette passe'),
  credentialsRefused('EDSM a refusé le nom de commandant ou la clé'),
  failed('La récupération a échoué');

  const BackfillStop(this.label);

  final String label;
}

/// What one backfill pass did.
class BackfillReport {
  const BackfillReport({
    required this.stoppedBecause,
    this.windowsFetched = 0,
    this.systemsAdded = 0,
    this.entriesSeen = 0,
    this.oldestReached,
  });

  final BackfillStop stoppedBecause;

  /// Requests actually spent. The number that matters against a budget of 360
  /// an hour.
  final int windowsFetched;

  /// Systems this pass added that the index did not already hold.
  final int systemsAdded;

  final int entriesSeen;

  /// How far back the pass got, which is the only way to know whether running
  /// it again would find anything.
  final DateTime? oldestReached;

  bool get canResume =>
      stoppedBecause == BackfillStop.budgetSpent && oldestReached != null;
}

/// Fetches the history the journal never saw.
///
/// The journal knows what this device imported. Two remote sources know more:
/// Frontier's own visited-stars cache, and EDSM for a commander who has been
/// feeding it for years. Both answer the same question — *where have I already
/// been* — and neither descends to bodies or species, so this is deliberately a
/// system-level index and nothing more.
///
/// **This is the one thing in the feature that is stored rather than derived.**
/// Everything else is recomputed from the journal because the journal is on
/// disk; this is not, and re-deriving it would mean spending an hour of EDSM's
/// budget again. The trade is stated rather than hidden: a stored index can go
/// stale, so [merged] always folds the stored history *under* what the journal
/// says today.
abstract interface class HistoryBackfillRepository {
  /// Pulls Frontier's visited-stars cache in one request.
  ///
  /// The cheap source: one call, no key beyond the Frontier session the app
  /// already holds, and it answers with `id64` — the same key the route uses.
  Future<Result<int>> importVisitedStars();

  /// Walks EDSM's flight log backwards, one week per request.
  ///
  /// [maxWindows] bounds the pass so a screen never waits on an hour of
  /// requests: five years of history is 260 windows, and at the published
  /// budget of 360 an hour that is roughly forty-five minutes. Each window is
  /// persisted as it lands, so a pass killed halfway is resumed rather than
  /// restarted.
  Future<Result<BackfillReport>> backfillFromEdsm({int maxWindows = 20});

  /// Whether EDSM credentials have been entered at all.
  Future<bool> hasEdsmCredentials();

  /// Stores the commander's own EDSM key. Kept beside the Frontier tokens,
  /// never in preferences: it authenticates a person, not this app.
  Future<void> setEdsmCredentials({
    required String commanderName,
    required String apiKey,
  });

  Future<void> clearEdsmCredentials();

  /// Everything fetched so far, from both sources.
  Future<DoneIndex> stored();

  Future<void> clear();
}
