import 'dart:convert';

import '../entities/journal_event.dart';

/// Turns raw journal lines into [JournalEvent]s.
///
/// Pure and I/O free, because the same parser serves both sources: the
/// Companion API returns the day's journal as JSON-lines, and the local
/// `Journal.*.log` files use the identical format.
///
/// It never throws. A journal spanning months will contain lines truncated by a
/// crash, events from a future game update, and localisation keys the app has
/// never seen; refusing to import the whole file over one of them would be the
/// worse failure.
class JournalEventParser {
  const JournalEventParser();

  /// Parses one line, or returns `null` when it is blank, unreadable, or
  /// missing the two fields every journal event must have.
  JournalEvent? parseLine(String line) {
    final String trimmed = line.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    final Object? decoded;
    try {
      decoded = jsonDecode(trimmed);
    } on FormatException {
      return null;
    }
    if (decoded is! Map<String, dynamic>) {
      return null;
    }

    final DateTime? timestamp = _dateTime(decoded['timestamp']);
    final String? name = _string(decoded['event']);
    if (timestamp == null || name == null) {
      return null;
    }

    return switch (name) {
      'ScanOrganic' => _scanOrganic(timestamp, decoded),
      'SellOrganicData' => _sellOrganicData(timestamp, decoded),
      'FSSBodySignals' || 'SAASignalsFound' =>
        _bodySignals(timestamp, name, decoded),
      'Scan' => _bodyScan(timestamp, decoded),
      'Touchdown' || 'Disembark' => _surfaceContact(timestamp, name, decoded),
      'Rank' || 'Progress' => _rank(timestamp, name, decoded),
      'LoadGame' => _loadGame(timestamp, decoded),
      'SuitLoadout' || 'BuySuit' || 'UpgradeSuit' =>
        _suit(timestamp, name, decoded),
      _ => UnknownJournalEvent(timestamp: timestamp, name: name),
    };
  }

  /// Parses a whole file, dropping only what cannot be read.
  List<JournalEvent> parseLines(Iterable<String> lines) => <JournalEvent>[
        for (final String line in lines)
          if (parseLine(line) case final JournalEvent event) event,
      ];

  // --- Per-event readers ---------------------------------------------------

  JournalEvent _scanOrganic(DateTime timestamp, Map<String, dynamic> json) {
    return ScanOrganicEvent(
      timestamp: timestamp,
      scanType: OrganicScanType.fromJournal(_string(json['ScanType'])),
      genus: _string(json['Genus']) ?? '',
      species: _string(json['Species']) ?? '',
      genusLocalised: _string(json['Genus_Localised']),
      speciesLocalised: _string(json['Species_Localised']),
      variant: _string(json['Variant']),
      variantLocalised: _string(json['Variant_Localised']),
      systemAddress: _int(json['SystemAddress']),
      bodyId: _int(json['Body']) ?? _int(json['BodyID']),
    );
  }

  JournalEvent _sellOrganicData(
    DateTime timestamp,
    Map<String, dynamic> json,
  ) {
    final Object? bioData = json['BioData'];
    return SellOrganicDataEvent(
      timestamp: timestamp,
      marketId: _int(json['MarketID']),
      entries: <SoldBioData>[
        if (bioData is List<dynamic>)
          for (final Object? entry in bioData)
            if (entry is Map<String, dynamic>)
              SoldBioData(
                genus: _string(entry['Genus']) ?? '',
                species: _string(entry['Species']) ?? '',
                speciesLocalised: _string(entry['Species_Localised']),
                variant: _string(entry['Variant_Localised']) ??
                    _string(entry['Variant']),
                valueCr: _int(entry['Value']) ?? 0,
                bonusCr: _int(entry['Bonus']) ?? 0,
              ),
      ],
    );
  }

  JournalEvent _bodySignals(
    DateTime timestamp,
    String name,
    Map<String, dynamic> json,
  ) {
    int biological = 0;
    final Object? signals = json['Signals'];
    if (signals is List<dynamic>) {
      for (final Object? signal in signals) {
        if (signal is! Map<String, dynamic>) {
          continue;
        }
        final String type = _string(signal['Type'])?.toLowerCase() ?? '';
        if (type.contains('biological')) {
          biological += _int(signal['Count']) ?? 0;
        }
      }
    }
    return BodySignalsEvent(
      timestamp: timestamp,
      name: name,
      biologicalCount: biological,
      bodyName: _string(json['BodyName']),
      bodyId: _int(json['BodyID']),
      systemAddress: _int(json['SystemAddress']),
    );
  }

  JournalEvent _bodyScan(DateTime timestamp, Map<String, dynamic> json) {
    final double? gravity = _double(json['SurfaceGravity']);
    return BodyScanEvent(
      timestamp: timestamp,
      bodyName: _string(json['BodyName']) ?? '',
      starSystem: _string(json['StarSystem']),
      bodyId: _int(json['BodyID']),
      planetClass: _string(json['PlanetClass']),
      atmosphere: _string(json['Atmosphere']) ?? _string(json['AtmosphereType']),
      volcanism: _string(json['Volcanism']),
      surfaceGravityG:
          gravity == null ? null : gravity / BodyScanEvent.standardGravity,
      surfaceTemperatureK: _double(json['SurfaceTemperature']),
      surfacePressure: _double(json['SurfacePressure']),
      distanceFromArrivalLs: _double(json['DistanceFromArrivalLS']),
      landable: json['Landable'] == true,
      parentStarClass: _string(json['StarType']),
    );
  }

  JournalEvent _surfaceContact(
    DateTime timestamp,
    String name,
    Map<String, dynamic> json,
  ) {
    return SurfaceContactEvent(
      timestamp: timestamp,
      name: name,
      bodyName: _string(json['Body']) ?? _string(json['NearestDestination']),
      systemName: _string(json['StarSystem']),
      onPlanet: json['OnPlanet'] != false,
    );
  }

  JournalEvent _rank(
    DateTime timestamp,
    String name,
    Map<String, dynamic> json,
  ) {
    const Set<String> ladders = <String>{
      'Combat',
      'Trade',
      'Explore',
      'Soldier',
      'Exobiologist',
      'CQC',
      'Empire',
      'Federation',
    };
    return RankEvent(
      timestamp: timestamp,
      name: name,
      values: <String, int>{
        for (final String ladder in ladders)
          if (_int(json[ladder]) case final int value) ladder: value,
      },
    );
  }

  JournalEvent _loadGame(DateTime timestamp, Map<String, dynamic> json) {
    return LoadGameEvent(
      timestamp: timestamp,
      commander: _string(json['Commander']) ?? '',
      fid: _string(json['FID']),
      ship: _string(json['Ship']),
      shipName: _string(json['ShipName']),
      creditsCr: _int(json['Credits']) ?? 0,
      horizons: json['Horizons'] == true,
      odyssey: json['Odyssey'] == true,
    );
  }

  JournalEvent _suit(
    DateTime timestamp,
    String name,
    Map<String, dynamic> json,
  ) {
    final String symbol =
        _string(json['SuitName']) ?? _string(json['Name']) ?? '';
    return SuitEvent(
      timestamp: timestamp,
      name: name,
      suitSymbol: symbol,
      suitName: _string(json['SuitName_Localised']) ??
          _string(json['Name_Localised']),
      suitId: _int(json['SuitID']),
      grade: _int(json['Class']) ?? _gradeFromSymbol(symbol),
      modIds: <String>{
        if (json['SuitMods'] is List<dynamic>)
          ...(json['SuitMods']! as List<dynamic>).whereType<String>(),
        if (json['Mods'] is List<dynamic>)
          ...(json['Mods']! as List<dynamic>).whereType<String>(),
      },
    );
  }

  /// `explorationsuit_class3` → 3. Frontier exposes no dedicated grade field
  /// on `SuitLoadout`.
  static int? _gradeFromSymbol(String symbol) {
    final RegExpMatch? match =
        RegExp(r'_class([0-9]+)$', caseSensitive: false).firstMatch(symbol);
    return match == null ? null : int.tryParse(match.group(1)!);
  }

  // --- Lenient scalar readers ---------------------------------------------

  static String? _string(Object? value) =>
      value is String && value.isNotEmpty ? value : null;

  static int? _int(Object? value) => switch (value) {
        final int v => v,
        final double v => v.round(),
        final String v => int.tryParse(v),
        _ => null,
      };

  static double? _double(Object? value) => switch (value) {
        final double v => v,
        final int v => v.toDouble(),
        final String v => double.tryParse(v),
        _ => null,
      };

  static DateTime? _dateTime(Object? value) =>
      value is String ? DateTime.tryParse(value) : null;
}
