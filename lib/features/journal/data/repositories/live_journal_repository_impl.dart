import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/time/clock.dart';
import '../../domain/entities/game_status.dart';
import '../../domain/entities/live_game_state.dart';
import '../../domain/repositories/journal_repository.dart';
import '../../domain/repositories/live_journal_repository.dart';
import '../datasources/game_state_data_source.dart';
import '../datasources/journal_file_data_source.dart';
import '../datasources/journal_local_store.dart';
import '../datasources/journal_tail_data_source.dart';

@LazySingleton(as: LiveJournalRepository)
class LiveJournalRepositoryImpl implements LiveJournalRepository {
  LiveJournalRepositoryImpl(
    this._tail,
    this._gameState,
    this._files,
    this._store,
    this._journal,
    this._clock,
  );

  final JournalTailDataSource _tail;
  final GameStateDataSource _gameState;
  final JournalFileDataSource _files;
  final JournalLocalStore _store;
  final JournalRepository _journal;
  final Clock _clock;

  /// How often the game's files are re-read.
  ///
  /// Ten seconds, and not less. The files are read from the disk the game is
  /// itself writing to, and the thing being watched — a commander flying to a
  /// planet, walking to an organism — moves in minutes. Polling faster would
  /// buy nothing and would compete with the game for I/O on the one machine
  /// where that matters most.
  static const Duration interval = Duration(seconds: 10);

  late final StreamController<LiveGameState> _controller =
      StreamController<LiveGameState>.broadcast(onCancel: _stopPolling);

  Timer? _timer;
  LiveGameState _last = const LiveGameState.unsupported();
  int _ingested = 0;

  /// A poll in flight, so a slow disk cannot pile ticks on top of each other.
  bool _busy = false;

  @override
  bool get isSupported {
    if (kIsWeb) {
      return false;
    }
    return switch (defaultTargetPlatform) {
      TargetPlatform.windows ||
      TargetPlatform.macOS ||
      TargetPlatform.linux =>
        true,
      _ => false,
    };
  }

  @override
  Stream<LiveGameState> watch() {
    late final StreamController<LiveGameState> out;
    StreamSubscription<LiveGameState>? subscription;

    // Hand-rolled rather than `initialThen`, because the first value here is
    // produced by the same poll that starts the timer: the caller must get it
    // once, not once from the return value and again from the broadcast.
    out = StreamController<LiveGameState>(
      onListen: () async {
        subscription = _controller.stream.listen(
          out.add,
          onError: out.addError,
        );
        final LiveGameState first = await _poll(broadcast: false);
        if (!out.isClosed) {
          out.add(first);
        }
        _startPolling();
      },
      onCancel: () async {
        await subscription?.cancel();
        subscription = null;
        await out.close();
      },
    );

    return out.stream;
  }

  @override
  Future<LiveGameState> refreshNow() => _poll();

  void _startPolling() {
    if (!isSupported || _timer != null) {
      return;
    }
    _timer = Timer.periodic(interval, (_) => unawaited(_poll()));
  }

  void _stopPolling() {
    _timer?.cancel();
    _timer = null;
  }

  /// One look at the game's files.
  ///
  /// Never throws: a poll that fails is a poll that changed nothing, and the
  /// next one is ten seconds away.
  Future<LiveGameState> _poll({bool broadcast = true}) async {
    if (_busy) {
      return _last;
    }
    _busy = true;
    try {
      _last = await _read();
    } on Object {
      // Keep the previous picture rather than replacing it with an error the
      // commander can do nothing about.
    } finally {
      _busy = false;
    }
    if (broadcast && !_controller.isClosed) {
      _controller.add(_last);
    }
    return _last;
  }

  Future<LiveGameState> _read() async {
    if (!isSupported) {
      return const LiveGameState.unsupported();
    }

    final String? directory = await _resolveDirectory();
    if (directory == null) {
      return LiveGameState(
        tracking: LiveTracking.noFolder,
        lastPollAt: _clock.now(),
      );
    }
    if (!Directory(directory).existsSync()) {
      return LiveGameState(
        tracking: LiveTracking.folderMissing,
        directory: directory,
        lastPollAt: _clock.now(),
      );
    }

    final JournalTailBatch batch = await _tail.readNewLines(directory);
    final List<String> sidecars = await _gameState.readSidecarLines(directory);

    final List<String> lines = <String>[...batch.lines, ...sidecars];
    if (lines.isNotEmpty) {
      // Straight into the ordinary import path: one store, one stream, and
      // every screen already watching it updates without knowing the lines
      // came from a tail rather than from a folder the commander picked.
      await _journal.importFiles(<JournalFileSource>[
        JournalFileSource(
          name: batch.fileName ?? 'live',
          readLines: () => Stream<String>.fromIterable(lines),
        ),
      ]);
      _ingested += batch.lines.length;
    }

    final GameStatus? status =
        await _gameState.readStatus(directory) ?? _last.status;

    return LiveGameState(
      tracking: status == null || status.isInMainMenu
          ? LiveTracking.idle
          : LiveTracking.live,
      status: status,
      directory: directory,
      followedFile: batch.fileName ?? _tail.followedFile,
      lastPollAt: _clock.now(),
      linesIngested: _ingested,
    );
  }

  /// The folder to watch: the one the commander imported from, else the first
  /// standard location that actually exists.
  ///
  /// The guess is used but never written back. A commander who has not chosen
  /// a folder still gets a working dashboard, and one who has chosen an
  /// unusual one does not silently have their choice replaced by a guess.
  Future<String?> _resolveDirectory() async {
    final String? configured = await _store.readJournalDirectory();
    if (configured != null && configured.isNotEmpty) {
      return configured;
    }
    for (final String candidate in _files.suggestedDirectories()) {
      if (Directory(candidate).existsSync()) {
        return candidate;
      }
    }
    return null;
  }

  @disposeMethod
  @override
  Future<void> dispose() async {
    _stopPolling();
    await _controller.close();
  }
}
