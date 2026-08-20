import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../domain/entities/game_status.dart';

/// Reads the state files the game keeps beside its journal.
///
/// The journal is a log: it is appended to once something has happened. These
/// files are the opposite — the game overwrites them in place as the situation
/// changes, and they carry what a log cannot express, starting with the
/// commander's latitude on a planet.
///
/// Four of them are read. `Status.json` is its own thing and becomes a
/// [GameStatus]. The other three are, quite literally, single journal events
/// saved to a file: `ShipLocker.json` holds exactly the `ShipLocker` line the
/// journal would have written, and the journal writes the *empty* version of
/// that event whenever the payload got too big — which is most of the time.
/// Reading them and feeding the lines back into the ordinary journal pipeline
/// is what keeps a live inventory from going stale mid-session.
@lazySingleton
class GameStateDataSource {
  const GameStateDataSource();

  /// The live inventory files, in the order they matter.
  ///
  /// `NavRoute.json` and `ModulesInfo.json` are deliberately left out: nothing
  /// in this app reads a plotted route or a module list, and reading a file
  /// nobody consumes is just an I/O cost every ten seconds.
  static const List<String> sidecarFiles = <String>[
    'ShipLocker.json',
    'Backpack.json',
    'Cargo.json',
  ];

  static const String statusFile = 'Status.json';

  /// Reads `Status.json`, or `null` when it cannot be read *right now*.
  ///
  /// Returning `null` rather than throwing is the whole point. The game
  /// truncates this file and rewrites it several times a second, so a reader
  /// that happens to arrive mid-write sees an empty file, half a JSON object,
  /// or — on Windows — a sharing violation. None of those mean anything is
  /// wrong; they mean "ask again in ten seconds", and the caller keeps the
  /// last good value in the meantime.
  Future<GameStatus?> readStatus(String directory) async {
    final Map<String, dynamic>? json = await _readJsonObject(
      '$directory/$statusFile',
    );
    return json == null ? null : statusFromJson(json);
  }

  /// The sidecar files as raw journal lines, ready to merge.
  ///
  /// A file that is absent, empty or being rewritten contributes nothing and
  /// does not stop the others.
  Future<List<String>> readSidecarLines(String directory) async {
    final List<String> lines = <String>[];
    for (final String name in sidecarFiles) {
      final File file = File('$directory/$name');
      try {
        if (!file.existsSync()) {
          continue;
        }
        final String raw = (await file.readAsString()).trim();
        if (raw.isEmpty) {
          continue;
        }
        // Parsed and re-encoded rather than passed through: it proves the read
        // caught a whole object, and it collapses the pretty-printing the game
        // sometimes uses into the one-line shape the store holds.
        final Object? decoded = jsonDecode(raw);
        if (decoded is Map<String, dynamic> && decoded['event'] != null) {
          lines.add(jsonEncode(decoded));
        }
      } on Object {
        continue;
      }
    }
    return lines;
  }

  /// Turns a decoded `Status.json` into a [GameStatus].
  ///
  /// Static and public so the mapping can be tested against the manual's own
  /// examples without going near a file system.
  static GameStatus statusFromJson(Map<String, dynamic> json) {
    final Object? fuel = json['Fuel'];
    final Object? destination = json['Destination'];

    return GameStatus(
      at: DateTime.tryParse('${json['timestamp']}')?.toUtc() ??
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
      flags: _int(json['Flags']) ?? 0,
      flags2: _int(json['Flags2']) ?? 0,
      bodyName: _string(json['BodyName']),
      latitude: _double(json['Latitude']),
      longitude: _double(json['Longitude']),
      headingDegrees: _double(json['Heading']),
      altitudeM: _double(json['Altitude']),
      planetRadiusM: _double(json['PlanetRadius']),
      fuelMainT:
          fuel is Map<String, dynamic> ? _double(fuel['FuelMain']) : null,
      fuelReservoirT:
          fuel is Map<String, dynamic> ? _double(fuel['FuelReservoir']) : null,
      cargoT: _double(json['Cargo'])?.round(),
      balanceCr: _int(json['Balance']),
      legalState: _string(json['LegalState']),
      destination: destination is Map<String, dynamic>
          ? StatusDestination(
              systemAddress: _int(destination['System']),
              bodyId: _int(destination['Body']),
              name: _string(destination['Name']),
            )
          : null,
      temperatureK: _double(json['Temperature']),
      gravityG: _double(json['Gravity']),
      oxygen: _double(json['Oxygen']),
      health: _double(json['Health']),
    );
  }

  Future<Map<String, dynamic>?> _readJsonObject(String path) async {
    final File file = File(path);
    try {
      if (!file.existsSync()) {
        return null;
      }
      final String raw = (await file.readAsString()).trim();
      if (raw.isEmpty) {
        return null;
      }
      final Object? decoded = jsonDecode(raw);
      return decoded is Map<String, dynamic> ? decoded : null;
    } on Object {
      return null;
    }
  }

  static String? _string(Object? value) =>
      value is String && value.isNotEmpty ? value : null;

  static int? _int(Object? value) => switch (value) {
        final int value => value,
        final double value => value.round(),
        final String value => int.tryParse(value),
        _ => null,
      };

  static double? _double(Object? value) => switch (value) {
        final num value => value.toDouble(),
        final String value => double.tryParse(value),
        _ => null,
      };
}
