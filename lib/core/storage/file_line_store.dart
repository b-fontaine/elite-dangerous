import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'line_store.dart';

/// [LineStore] backed by one file per name, in the app's support directory.
///
/// Support rather than documents: this is the app's own bookkeeping, not
/// something the commander should meet while looking for their screenshots.
class FileLineStore implements LineStore {
  FileLineStore({this.name = 'journal.jsonl'});

  final String name;

  File? _resolved;

  Future<File> _file() async {
    final File? cached = _resolved;
    if (cached != null) {
      return cached;
    }
    final Directory root = await getApplicationSupportDirectory();
    await root.create(recursive: true);
    return _resolved = File('${root.path}/$name');
  }

  @override
  Future<List<String>> readLines() async {
    final File file = await _file();
    if (!file.existsSync()) {
      return const <String>[];
    }
    return file
        .openRead()
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .where((String line) => line.trim().isNotEmpty)
        .toList();
  }

  @override
  Future<int> countLines() async {
    final File file = await _file();
    if (!file.existsSync()) {
      return 0;
    }
    int count = 0;
    await for (final String line in file
        .openRead()
        .transform(utf8.decoder)
        .transform(const LineSplitter())) {
      if (line.trim().isNotEmpty) {
        count++;
      }
    }
    return count;
  }

  @override
  Future<void> writeLines(List<String> lines) async {
    final File file = await _file();
    // Written through a temporary file and renamed: a process killed halfway
    // through a rewrite would otherwise leave a truncated journal, and the
    // journal is the only copy of what the commander imported.
    final File staging = File('${file.path}.tmp');
    final IOSink sink = staging.openWrite();
    try {
      for (final String line in lines) {
        sink.writeln(line);
      }
      await sink.flush();
    } finally {
      await sink.close();
    }
    await staging.rename(file.path);
  }

  @override
  Future<void> appendLines(List<String> lines) async {
    if (lines.isEmpty) {
      return;
    }
    final File file = await _file();
    final IOSink sink = file.openWrite(mode: FileMode.append);
    try {
      for (final String line in lines) {
        sink.writeln(line);
      }
      await sink.flush();
    } finally {
      await sink.close();
    }
  }

  @override
  Future<void> clear() async {
    final File file = await _file();
    if (file.existsSync()) {
      await file.delete();
    }
  }
}
