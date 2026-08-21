import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';

import 'journal_file_data_source.dart';

/// What one pass over the live journal turned up.
class JournalTailBatch {
  const JournalTailBatch({
    this.lines = const <String>[],
    this.fileName,
    this.startedNewFile = false,
  });

  /// Complete journal lines, oldest first.
  final List<String> lines;

  /// The file being followed after this pass.
  final String? fileName;

  /// The game rolled over to a new journal — a new session started, or the
  /// current one crossed the size at which Frontier splits the file.
  final bool startedNewFile;

  bool get isEmpty => lines.isEmpty;
}

/// Follows the journal the game is writing, and hands back what is new.
///
/// Polled rather than watched, on purpose. A file-system watcher is the
/// obvious design and the wrong one here: the game keeps the journal open and
/// flushes it in bursts, so on Windows the directory notification fires
/// without the size having changed yet, and under Proton the inotify events
/// come from a translated file system that coalesces them. Every third-party
/// tool that tried a watcher ended up polling underneath it. Ten seconds is
/// slower than the game and faster than a commander walking to an organism.
///
/// The state kept between passes is one byte offset. Everything else — which
/// file, whether it rolled over, whether the last line was complete — is
/// re-derived each time, so a pass that fails changes nothing and the next one
/// simply tries again.
@lazySingleton
class JournalTailDataSource {
  JournalTailDataSource(this._files);

  final JournalFileDataSource _files;

  String? _path;
  int _offset = 0;

  /// The file currently followed, by name.
  String? get followedFile => _path?.split(RegExp(r'[/\\]')).last;

  /// Forgets where it had got to, so the next pass re-reads from the top.
  void reset() {
    _path = null;
    _offset = 0;
  }

  /// Reads whatever the game has written since the last call.
  ///
  /// The first call on a folder returns the whole current journal: a session
  /// that started before the app did still has to be accounted for, and the
  /// merge downstream drops what it already knows.
  Future<JournalTailBatch> readNewLines(String directory) async {
    final String? latest = _files.mostRecentJournalPath(directory);
    if (latest == null) {
      return const JournalTailBatch();
    }

    final List<String> lines = <String>[];
    bool rolledOver = false;

    if (_path != null && _path != latest) {
      // Drain the file being left behind before switching. Between two passes
      // the game can close one session and open the next, and the tail of the
      // old file is where `SellOrganicData` and `Shutdown` live.
      lines.addAll(await _readFrom(_path!, _offset));
      rolledOver = true;
      _offset = 0;
    }

    if (_path != latest) {
      _path = latest;
      _offset = 0;
    }

    lines.addAll(await _readFrom(latest, _offset, advance: true));

    return JournalTailBatch(
      lines: lines,
      fileName: latest.split(RegExp(r'[/\\]')).last,
      startedNewFile: rolledOver,
    );
  }

  /// Complete lines of [path] starting at [from].
  ///
  /// Only whole lines are consumed. The game writes a journal entry as one
  /// `write`, but nothing guarantees this reader will not arrive between the
  /// call and the flush, and half a JSON object parses as nothing at all. So
  /// the read stops at the last newline and leaves the remainder for the next
  /// pass, which is also what keeps a multi-byte character from being split
  /// down the middle: `0x0A` cannot occur inside a UTF-8 continuation byte, so
  /// cutting at a newline always cuts at a character boundary.
  Future<List<String>> _readFrom(
    String path,
    int from, {
    bool advance = false,
  }) async {
    final File file = File(path);
    if (!file.existsSync()) {
      return const <String>[];
    }

    RandomAccessFile? handle;
    try {
      final int length = await file.length();
      int start = from;
      if (length < start) {
        // The file shrank: it was replaced, or truncated by a crash. Whatever
        // happened, the offset means nothing any more.
        start = 0;
      }
      if (length == start) {
        return const <String>[];
      }

      handle = await file.open();
      await handle.setPosition(start);
      final Uint8List bytes = await handle.read(length - start);

      final int lastBreak = bytes.lastIndexOf(0x0A);
      if (lastBreak < 0) {
        // Not one complete line yet. Leave the offset where it is; the next
        // pass will see the same bytes plus whatever finishes them.
        if (advance) {
          _offset = start;
        }
        return const <String>[];
      }

      final Uint8List complete = bytes.sublist(0, lastBreak + 1);
      if (advance) {
        _offset = start + complete.length;
      }

      return const LineSplitter()
          .convert(utf8.decode(complete, allowMalformed: true))
          .where((String line) => line.trim().isNotEmpty)
          .toList(growable: false);
    } on Object {
      // A locked or vanished file is a normal event while a game is running.
      return const <String>[];
    } finally {
      await handle?.close();
    }
  }
}
