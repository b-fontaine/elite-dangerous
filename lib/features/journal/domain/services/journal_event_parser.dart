import 'dart:convert';

import '../entities/journal_event.dart';
import 'micro_resource_names.dart';

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

  /// Every `event` name [parseLine] models.
  ///
  /// Declared rather than derived because a `switch` cannot be enumerated:
  /// `journal_event_parser_test.dart` asserts the two stay in step, which is
  /// what lets the diagnostics screen state honestly what the app reads and
  /// what it merely stores.
  static const Set<String> supportedEvents = <String>{
    'ScanOrganic',
    'SellOrganicData',
    'FSSBodySignals',
    'SAASignalsFound',
    'Scan',
    'Touchdown',
    'Disembark',
    'Rank',
    'Progress',
    'LoadGame',
    'SuitLoadout',
    'BuySuit',
    'UpgradeSuit',
    'Statistics',
    'Reputation',
    'EngineerProgress',
    'Loadout',
    'ShipLocker',
    'Materials',
    'Powerplay',
    'StoredShips',
    'Cargo',
    'Location',
    'FSDJump',
    'CarrierJump',
    'ApproachBody',
    'LeaveBody',
    'SupercruiseExit',
    'StartJump',
    'Docked',
    'Undocked',
    'Liftoff',
    'Embark',
  };

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
      'Statistics' => _statistics(timestamp, decoded),
      'Reputation' => _reputation(timestamp, decoded),
      'EngineerProgress' => _engineerProgress(timestamp, decoded),
      'Loadout' => _shipLoadout(timestamp, decoded),
      'ShipLocker' => _shipLocker(timestamp, decoded),
      'Materials' => _materials(timestamp, decoded),
      'Powerplay' => _powerplay(timestamp, decoded),
      'StoredShips' => _storedShips(timestamp, decoded),
      'Cargo' => _cargo(timestamp, decoded),
      'Location' ||
      'FSDJump' ||
      'CarrierJump' ||
      'ApproachBody' ||
      'LeaveBody' ||
      'SupercruiseExit' ||
      'StartJump' ||
      'Undocked' ||
      'Liftoff' ||
      'Embark' =>
        _location(timestamp, name, decoded),
      'Docked' => _docked(timestamp, decoded),
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

  // --- Session-start events ------------------------------------------------

  JournalEvent _statistics(DateTime timestamp, Map<String, dynamic> json) {
    // Every section is kept, including ones this build knows nothing about:
    // Frontier adds them with each update, and a stored line is re-parsed for
    // free once the app learns to read them.
    final Map<String, Map<String, int>> sections = <String, Map<String, int>>{};
    for (final MapEntry<String, dynamic> entry in json.entries) {
      if (entry.key == 'timestamp' || entry.key == 'event') {
        continue;
      }
      final Object? value = entry.value;
      if (value is! Map<String, dynamic>) {
        continue;
      }
      sections[entry.key] = <String, int>{
        for (final MapEntry<String, dynamic> stat in value.entries)
          if (_int(stat.value) case final int number) stat.key: number,
      };
    }
    return StatisticsEvent(timestamp: timestamp, sections: sections);
  }

  JournalEvent _reputation(DateTime timestamp, Map<String, dynamic> json) {
    return ReputationEvent(
      timestamp: timestamp,
      values: <String, double>{
        for (final MapEntry<String, dynamic> entry in json.entries)
          if (entry.key != 'timestamp' && entry.key != 'event')
            if (_double(entry.value) case final double value)
              entry.key: value,
      },
    );
  }

  JournalEvent _engineerProgress(DateTime timestamp, Map<String, dynamic> json) {
    // Two shapes: the full roster at session start under `Engineers`, and a
    // single engineer inline when one is unlocked or ranks up mid-session.
    final Object? roster = json['Engineers'];
    if (roster is List<dynamic>) {
      return EngineerProgressEvent(
        timestamp: timestamp,
        isFullRoster: true,
        engineers: <EngineerStanding>[
          for (final dynamic entry in roster)
            if (entry is Map<String, dynamic>) _engineerStanding(entry),
        ],
      );
    }
    // Neither shape present. EDMC logs this as malformed, and it is — but the
    // parser promises to model every name in [supportedEvents], so it answers
    // with an empty roster rather than demoting the line to unknown and making
    // that promise a lie.
    if (_string(json['Engineer']) == null) {
      return EngineerProgressEvent(
        timestamp: timestamp,
        isFullRoster: false,
        engineers: const <EngineerStanding>[],
      );
    }
    return EngineerProgressEvent(
      timestamp: timestamp,
      isFullRoster: false,
      engineers: <EngineerStanding>[_engineerStanding(json)],
    );
  }

  EngineerStanding _engineerStanding(Map<String, dynamic> json) =>
      EngineerStanding(
        name: _string(json['Engineer']) ?? 'Inconnu',
        stage: EngineerUnlockStage.fromJournal(_string(json['Progress'])),
        engineerId: _int(json['EngineerID']),
        rank: _int(json['Rank']),
        rankProgressPercent: _int(json['RankProgress']),
      );

  JournalEvent _shipLoadout(DateTime timestamp, Map<String, dynamic> json) {
    final Object? modules = json['Modules'];
    return ShipLoadoutEvent(
      timestamp: timestamp,
      shipSymbol: _string(json['Ship']) ?? '',
      shipId: _int(json['ShipID']),
      shipName: _string(json['ShipName']),
      shipIdent: _string(json['ShipIdent']),
      hullValueCr: _int(json['HullValue']),
      modulesValueCr: _int(json['ModulesValue']),
      rebuyCr: _int(json['Rebuy']),
      maxJumpRangeLy: _double(json['MaxJumpRange']),
      fuelCapacity: _double(_map(json['FuelCapacity'])['Main']) ??
          _double(json['FuelCapacity']),
      cargoCapacity: _int(json['CargoCapacity']),
      unladenMass: _double(json['UnladenMass']),
      hullHealth: _double(json['HullHealth']),
      isHot: json['Hot'] == true,
      moduleSymbols: <String>{
        if (modules is List<dynamic>)
          for (final dynamic module in modules)
            if (module is Map<String, dynamic>)
              if (_string(module['Item']) case final String item)
                item.toLowerCase(),
      },
    );
  }

  JournalEvent _shipLocker(DateTime timestamp, Map<String, dynamic> json) {
    const List<String> categories = <String>[
      'Items',
      'Components',
      'Consumables',
      'Data',
    ];
    final bool hasAnyList =
        categories.any((String key) => json[key] is List<dynamic>);

    return ShipLockerEvent(
      timestamp: timestamp,
      // The pointer form carries no lists: Frontier wrote the contents to
      // `ShipLocker.json` instead. Kept so the aggregator can tell "carrying
      // nothing" from "never told".
      isEmpty: !hasAnyList,
      items: _namedCounts(json['Items']),
      components: _namedCounts(json['Components']),
      consumables: _namedCounts(json['Consumables']),
      data: _namedCounts(json['Data']),
    );
  }

  JournalEvent _materials(DateTime timestamp, Map<String, dynamic> json) =>
      MaterialsEvent(
        timestamp: timestamp,
        raw: _namedCounts(json['Raw']),
        manufactured: _namedCounts(json['Manufactured']),
        encoded: _namedCounts(json['Encoded']),
      );

  JournalEvent _powerplay(DateTime timestamp, Map<String, dynamic> json) =>
      PowerplayEvent(
        timestamp: timestamp,
        power: _string(json['Power']) ?? '',
        rank: _int(json['Rank']),
        merits: _int(json['Merits']),
        timePledgedSeconds: _int(json['TimePledged']),
      );

  JournalEvent _storedShips(DateTime timestamp, Map<String, dynamic> json) =>
      StoredShipsEvent(
        timestamp: timestamp,
        here: _storedShipList(json['ShipsHere']),
        remote: _storedShipList(json['ShipsRemote']),
        stationName: _string(json['StationName']),
        starSystem: _string(json['StarSystem']),
      );

  List<StoredShipEntry> _storedShipList(Object? value) => <StoredShipEntry>[
        if (value is List<dynamic>)
          for (final dynamic entry in value)
            if (entry is Map<String, dynamic>)
              StoredShipEntry(
                shipId: _int(entry['ShipID']) ?? -1,
                shipSymbol: _string(entry['ShipType']) ?? '',
                name: _string(entry['Name']),
                starSystem: _string(entry['StarSystem']),
                valueCr: _int(entry['Value']),
                transferPriceCr: _int(entry['TransferPrice']),
                isHot: entry['Hot'] == true,
                inTransit: entry['InTransit'] == true,
              ),
      ];

  JournalEvent _cargo(DateTime timestamp, Map<String, dynamic> json) {
    final Object? inventory = json['Inventory'];
    return CargoEvent(
      timestamp: timestamp,
      vessel: _string(json['Vessel']),
      count: _int(json['Count']) ?? 0,
      inventory: <String, int>{
        if (inventory is List<dynamic>)
          for (final dynamic entry in inventory)
            if (entry is Map<String, dynamic>)
              if (_string(entry['Name']) case final String name)
                name.toLowerCase(): _int(entry['Count']) ?? 0,
      },
    );
  }

  /// Reads a `[{Name, Count}]` list, the shape every inventory event uses.
  ///
  /// Counts by canonical English name — the vocabulary the rest of the app
  /// reasons in — resolved from the journal's internal symbol rather than from
  /// `Name_Localised`, which follows the client's language.
  ///
  /// Two entries of the same item are summed: Frontier splits a stack across
  /// several lines when the pieces have different owners.
  Map<String, int> _namedCounts(Object? value) {
    final Map<String, int> counts = <String, int>{};
    if (value is! List<dynamic>) {
      return counts;
    }
    for (final dynamic entry in value) {
      if (entry is! Map<String, dynamic>) {
        continue;
      }
      final String? name = MicroResourceNames.canonical(
        _string(entry['Name']),
        _string(entry['Name_Localised']),
      );
      if (name == null) {
        continue;
      }
      counts[name] = (counts[name] ?? 0) + (_int(entry['Count']) ?? 0);
    }
    return counts;
  }

  static Map<String, dynamic> _map(Object? value) =>
      value is Map<String, dynamic> ? value : const <String, dynamic>{};

  // --- Position ------------------------------------------------------------

  JournalEvent _location(
    DateTime timestamp,
    String name,
    Map<String, dynamic> json,
  ) {
    return LocationEvent(
      timestamp: timestamp,
      name: name,
      starSystem: _string(json['StarSystem']),
      systemAddress: _int(json['SystemAddress']),
      // `Body` is the name on most events and the id on `ScanOrganic`; here it
      // is always the name, with `BodyName` used by the approach events.
      bodyName: _string(json['Body']) ?? _string(json['BodyName']),
      bodyId: _int(json['BodyID']),
      bodyType: _string(json['BodyType']),
      stationName: _string(json['StationName']),
      stationType: _string(json['StationType']),
      distanceFromStarLs: _double(json['DistFromStarLS']),
      docked: json['Docked'] == true,
      // `Liftoff` and `Undocked` say the commander left; neither carries a
      // `Landed` flag, and reading their absence as "landed" would strand the
      // display on the ground.
      landed: json['Latitude'] != null && name != 'Liftoff',
      onFoot: json['OnFoot'] == true,
    );
  }

  JournalEvent _docked(DateTime timestamp, Map<String, dynamic> json) {
    final Map<String, dynamic> pads = _map(json['LandingPads']);
    final Object? services = json['StationServices'];

    return DockedEvent(
      timestamp: timestamp,
      stationName: _string(json['StationName']) ?? 'Station inconnue',
      stationType: _string(json['StationType']),
      starSystem: _string(json['StarSystem']),
      marketId: _int(json['MarketID']),
      faction: _string(_map(json['StationFaction'])['Name']),
      government: _string(json['StationGovernment_Localised']) ??
          _string(json['StationGovernment']),
      allegiance: _string(json['StationAllegiance']),
      economy: _string(json['StationEconomy_Localised']) ??
          _string(json['StationEconomy']),
      secondEconomy: _secondEconomy(json['StationEconomies']),
      distanceFromStarLs: _double(json['DistFromStarLS']),
      // Lower-cased to match the vocabulary `/profile` uses, so one screen can
      // read either source without knowing which it got.
      services: <String>{
        if (services is List<dynamic>)
          for (final dynamic service in services)
            if (service is String) service.toLowerCase(),
      },
      largePads: _int(pads['Large']) ?? 0,
      mediumPads: _int(pads['Medium']) ?? 0,
      smallPads: _int(pads['Small']) ?? 0,
    );
  }

  /// `StationEconomies` lists every economy with its share; the second largest
  /// is the only one worth naming beside the primary.
  String? _secondEconomy(Object? value) {
    if (value is! List<dynamic> || value.length < 2) {
      return null;
    }
    final List<Map<String, dynamic>> economies = value
        .whereType<Map<String, dynamic>>()
        .toList()
      ..sort((Map<String, dynamic> a, Map<String, dynamic> b) =>
          (_double(b['Proportion']) ?? 0).compareTo(
            _double(a['Proportion']) ?? 0,
          ));
    if (economies.length < 2) {
      return null;
    }
    return _string(economies[1]['Name_Localised']) ??
        _string(economies[1]['Name']);
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
