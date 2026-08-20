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

  /// Live journals only.
  ///
  /// EDMC accepts `JournalAlpha` and `JournalBeta` too, and copying it here
  /// would be a mistake: EDMC *follows* one file and needs to recognise
  /// whichever the running client writes, whereas this reads a folder and
  /// folds everything it finds into one history. An alpha journal never
  /// happened in the live galaxy — importing one would add its sales to the
  /// commander's career profit, its deaths to the organisms lost, and its
  /// species to those already logged. Those files stay in the folder forever,
  /// so the filter is the only thing keeping them out.
  static final RegExp journalFilePattern =
      RegExp(r'^Journal\..*\.log$', caseSensitive: false);

  /// The two shapes Frontier has used for a journal's name.
  ///
  /// Odyssey Update 11 (15 March 2022) switched from the compact stamp to an
  /// ISO one, and both still turn up in a folder that has been played in for
  /// a few years:
  ///
  /// ```
  /// Journal.220315152335.01.log          ← Horizons / Legacy
  /// Journal.2022-03-15T152503.01.log     ← Odyssey, since Update 11
  /// ```
  static final RegExp _journalNamePattern = RegExp(
    r'^Journal\.(?<stamp>[0-9T-]+)\.(?<part>\d+)\.log$',
    caseSensitive: false,
  );

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
      ..sort((File a, File b) => compareNewestFirst(a.path, b.path));

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

  /// Orders two journal paths newest first.
  ///
  /// A plain string sort is what one reaches for, and it is wrong: the two
  /// naming schemes interleave. `Journal.220315152335.01.log` sorts *after*
  /// `Journal.2022-03-15T152503.01.log` because `'2' > '0'` at the third
  /// character, so a folder holding both hands back a 2022 file as the most
  /// recent one. EDMC shipped that exact bug and fixed it twice.
  ///
  /// The name is parsed instead: the stamp is normalised to a single
  /// comparable form, and the part number is compared **numerically** so that
  /// part 10 follows part 9 rather than part 1. Files whose name cannot be
  /// read at all fall to the end, in stable string order, rather than
  /// displacing a file that could be read.
  static int compareNewestFirst(String a, String b) {
    final _JournalName? left = _JournalName.parse(_basename(a));
    final _JournalName? right = _JournalName.parse(_basename(b));

    if (left == null || right == null) {
      if (left == null && right == null) {
        return b.compareTo(a);
      }
      return left == null ? 1 : -1;
    }

    final int byStamp = right.stamp.compareTo(left.stamp);
    if (byStamp != 0) {
      return byStamp;
    }
    return right.part.compareTo(left.part);
  }

  static String _basename(String path) =>
      path.split(RegExp(r'[/\\]')).last;
}

/// A journal file name, taken apart far enough to be ordered.
class _JournalName {
  const _JournalName({required this.stamp, required this.part});

  /// The session stamp as `yyyyMMddHHmmss`, whichever shape it was written in.
  final String stamp;

  final int part;

  static _JournalName? parse(String fileName) {
    final RegExpMatch? match =
        JournalFileDataSource._journalNamePattern.firstMatch(fileName);
    if (match == null) {
      return null;
    }

    // Case-insensitive on purpose: the pattern above accepts a lower-cased
    // name, so the separator has to be stripped whichever case it arrives in.
    // A surviving `t` sorts above every digit and would crown the file.
    final String digits = match
        .namedGroup('stamp')!
        .replaceAll(RegExp(r'[T-]', caseSensitive: false), '');

    // Both shapes reduce to fourteen digits once the separators are gone,
    // except the compact one, which writes a two-digit year. Anything else is
    // not a stamp this code understands, and saying so is safer than padding
    // it into an order it does not deserve.
    final String? stamp = switch (digits.length) {
      14 => digits,
      12 => '20$digits',
      _ => null,
    };
    if (stamp == null) {
      return null;
    }

    return _JournalName(
      stamp: stamp,
      part: int.tryParse(match.namedGroup('part')!) ?? 0,
    );
  }
}
