import '../../../../core/lifecycle/disposable.dart';
import '../entities/live_game_state.dart';

/// Follows the running game.
///
/// Deliberately narrow: it exposes a stream and a way to ask for one extra
/// look. It does not expose the journal events it picks up, because those go
/// where every other journal event goes — into the store behind
/// `JournalRepository`, so that one import path feeds the whole app and the
/// live view is not a second, disagreeing source of truth.
abstract interface class LiveJournalRepository implements Disposable {
  /// Whether this build can read the game's files at all.
  bool get isSupported;

  /// The game's state, re-read on a timer for as long as anyone listens.
  Stream<LiveGameState> watch();

  /// Reads once, now, without waiting for the next tick.
  Future<LiveGameState> refreshNow();
}
