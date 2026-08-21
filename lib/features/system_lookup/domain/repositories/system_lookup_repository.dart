import '../../../../core/result/result.dart';
import '../entities/body_landmarks.dart';
import '../entities/charted_system.dart';

/// Looks a system up in the community's records.
///
/// Three rules shape this port, and all three are deliberate:
///
/// * **Nothing here happens on its own.** There is no watcher, no prefetch and
///   no background refresh. A request leaves this device because the commander
///   asked a question, and for no other reason.
/// * **The answer is cached and the cache is honest.** [ChartedSystem.fetchedAt]
///   and [ChartedSystem.fromCache] travel with the data so the screen can say
///   how old its answer is instead of implying it is live.
/// * **Failure is a value.** Spansh being unreachable is an ordinary state of
///   this app, not an exception: the journal still knows what it knows, and
///   the screen keeps showing it.
abstract interface class SystemLookupRepository {
  /// Whether this build can reach Spansh at all.
  ///
  /// False on the web: Spansh sends no CORS headers, so the browser refuses
  /// the request before it is made. Every other target is fine — including
  /// phones, where the journal comes from Frontier's API rather than from a
  /// file, and where this is therefore the only live source of body data.
  bool get isSupported;

  /// The system with this `id64`, from cache when a fresh copy is held.
  ///
  /// Set [refresh] to bypass the cache for a system the commander believes has
  /// changed.
  Future<Result<ChartedSystem>> system(int id64, {bool refresh = false});

  /// The species recorded on the surface of one body.
  ///
  /// [signalsUpdatedAt] is the value the system dump reported for this body.
  /// When it differs from the one stored with the cached answer, the cached
  /// answer is stale and is refetched — that, and not a timer, is what
  /// invalidates a species list.
  Future<Result<BodyLandmarks>> landmarks(
    int bodyId64, {
    DateTime? signalsUpdatedAt,
    bool refresh = false,
  });

  /// The cached copy, however old, without touching the network. Used to keep
  /// a screen populated when a refresh fails.
  Future<ChartedSystem?> cachedSystem(int id64);

  /// Forgets everything fetched. Wired to the "reset local data" action.
  Future<void> clearCache();
}
