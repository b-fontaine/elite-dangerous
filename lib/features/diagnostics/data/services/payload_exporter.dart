import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/entities/raw_payload.dart';

/// Writes a capture to a file the commander can open, attach or send.
///
/// A `/profile` runs to hundreds of kilobytes and a journal day to several
/// megabytes; the clipboard technically holds them, but nothing downstream
/// wants them pasted. A path does.
@lazySingleton
class PayloadExporter {
  const PayloadExporter();

  /// Folder created under the app's data directory.
  static const String folderName = 'diagnostic';

  /// The web build has no file system to write to, and `path_provider` has no
  /// implementation there — guarded the same way the journal importer is.
  bool get isSupported => !kIsWeb;

  Future<String> write(RawPayload payload) async {
    if (!isSupported) {
      throw UnsupportedError(
        'L\'export en fichier n\'existe pas sur le web : utilise « Copier ».',
      );
    }
    final Directory root = await getApplicationDocumentsDirectory();
    final Directory folder = Directory('${root.path}/$folderName');
    await folder.create(recursive: true);
    final File file = File('${folder.path}/${fileNameFor(payload)}');
    await file.writeAsString(payload.body);
    return file.path;
  }

  /// `profile-20260819T101233Z.json`. Colons are illegal in a Windows path and
  /// awkward everywhere else, so the timestamp is stripped of them.
  static String fileNameFor(RawPayload payload) {
    final String slug = payload.title
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
        .replaceAll(RegExp(r'^-+|-+$'), '');
    final String stamp = payload.capturedAt
        .toUtc()
        .toIso8601String()
        .replaceAll(RegExp(r'[:\-]'), '')
        .split('.')
        .first;
    return '$slug-${stamp}Z.${payload.format.extension}';
  }
}
