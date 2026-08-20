import 'package:equatable/equatable.dart';

import 'game_status.dart';

/// Why the live view is showing what it is showing.
enum LiveTracking {
  /// No file system to read, or no Elite Dangerous to read it from.
  unsupported(
    'Suivi indisponible',
    'Le suivi en direct lit les fichiers que le jeu écrit sur le disque : il '
        "n'existe que sur l'ordinateur où tourne Elite Dangerous.",
  ),

  /// Nothing points at a save folder yet.
  noFolder(
    'Dossier de journal inconnu',
    'Indiquez le dossier de sauvegarde dans Journal › Importer : le suivi '
        "s'en servira ensuite tout seul.",
  ),

  /// A folder is known but is not there any more.
  folderMissing(
    'Dossier introuvable',
    'Le dossier configuré a disparu — disque externe débranché, ou partie '
        'déplacée.',
  ),

  /// The folder is being read, but the game is not writing to it: closed, or
  /// sitting in the main menu.
  idle(
    'Jeu non détecté',
    'Le dossier est lu, mais le jeu n\'y écrit rien en ce moment. Les données '
        'ci-dessous datent de la dernière session.',
  ),

  /// The game is writing, and this is what it says.
  live('En direct', 'Relu toutes les dix secondes.');

  const LiveTracking(this.label, this.detail);

  final String label;
  final String detail;

  bool get isLive => this == LiveTracking.live;

  /// Whether anything at all is being read from disk.
  bool get isReading => this == LiveTracking.live || this == LiveTracking.idle;
}

/// What the game is doing right now, as far as its own files admit.
class LiveGameState extends Equatable {
  const LiveGameState({
    this.tracking = LiveTracking.unsupported,
    this.status,
    this.directory,
    this.followedFile,
    this.lastPollAt,
    this.linesIngested = 0,
  });

  const LiveGameState.unsupported() : this();

  final LiveTracking tracking;

  /// The last readable `Status.json`.
  ///
  /// Kept across polls that could not read the file — the game truncates it
  /// constantly, and blanking the dashboard every time a read lands mid-write
  /// would make it flicker for no reason.
  final GameStatus? status;

  final String? directory;

  /// The journal file being followed, by name.
  final String? followedFile;

  final DateTime? lastPollAt;

  /// New journal lines picked up since the app started following.
  final int linesIngested;

  /// How old the game's own picture is.
  ///
  /// This is the honest measure of liveness, and the reason it is shown: the
  /// game only rewrites `Status.json` when something changes, so a commander
  /// parked at a station legitimately produces a file that has not moved in
  /// twenty minutes. An age is a fact the commander can judge; "connected"
  /// would be a guess.
  Duration? ageAt(DateTime now) {
    final DateTime? at = status?.at;
    return at == null ? null : now.difference(at);
  }

  @override
  List<Object?> get props => <Object?>[
        tracking,
        status,
        directory,
        followedFile,
        lastPollAt,
        linesIngested,
      ];
}
