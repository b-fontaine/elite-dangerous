import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/journal_repository.dart';

/// Reads `Journal.*.log` files straight from the game's save folder.
///
/// This is the path that needs no Frontier account at all, and it is also the
/// only complete one: the Companion API's `/journal` lags a session behind and
/// only goes back so far.
@lazySingleton
class JournalFileDataSource {
  const JournalFileDataSource();

  static final RegExp journalFilePattern =
      RegExp(r'^Journal\..*\.log$', caseSensitive: false);

  bool get isSupported => !kIsWeb;

  /// Where the game writes its journal, per platform.
  List<String> suggestedDirectories() {
    if (kIsWeb) {
      return const <String>[];
    }
    final Map<String, String> env = Platform.environment;
    final String? home = env['HOME'] ?? env['USERPROFILE'];
    if (home == null) {
      return const <String>[];
    }
    const String frontier = 'Frontier Developments/Elite Dangerous';
    return switch (defaultTargetPlatform) {
      TargetPlatform.windows => <String>['$home\\Saved Games\\$frontier'],
      TargetPlatform.macOS => <String>[
          '$home/Library/Application Support/$frontier',
        ],
      _ => <String>[
          // Steam Proton keeps a Windows-shaped tree inside its prefix.
          '$home/.local/share/Steam/steamapps/compatdata/359320/pfx/'
              'drive_c/users/steamuser/Saved Games/$frontier',
          '$home/.steam/steam/steamapps/compatdata/359320/pfx/'
              'drive_c/users/steamuser/Saved Games/$frontier',
          '$home/Saved Games/$frontier',
        ],
    };
  }

  /// Journal files of [directory], newest first.
  Future<List<JournalFileSource>> listJournalFiles(String directory) async {
    final Directory dir = Directory(directory);
    if (!dir.existsSync()) {
      throw FileSystemException('Dossier introuvable', directory);
    }
    final List<File> files = dir
        .listSync()
        .whereType<File>()
        .where((File file) => journalFilePattern.hasMatch(_basename(file.path)))
        .toList()
      ..sort((File a, File b) => b.path.compareTo(a.path));

    return <JournalFileSource>[
      for (final File file in files)
        JournalFileSource(
          name: _basename(file.path),
          readLines: () => file
              .openRead()
              .transform(utf8.decoder)
              .transform(const LineSplitter()),
        ),
    ];
  }

  static String _basename(String path) =>
      path.split(RegExp(r'[/\\]')).last;
}
