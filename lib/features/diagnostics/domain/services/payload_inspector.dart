import 'dart:convert';

import '../../../../core/format/credits.dart';
import '../entities/payload_inspection.dart';

/// Reads a raw capture and answers what Frontier's documentation cannot.
///
/// Two gaps decide whether the planned fleet and on-foot screens are buildable,
/// and neither can be settled by reading:
///
/// * the community CAPI reference says `ships` carries "the same format as
///   `ship`" — modules included — yet every tool that imports a build only ever
///   imports the ship being flown;
/// * `suit`, `suits`, `loadout` and `loadouts` appear in no Frontier document
///   at all. They exist only in EDMC's source.
///
/// So they are counted against a real account instead of being argued about.
/// Everything here is a pure function of the capture: no I/O, no framework.
class PayloadInspector {
  const PayloadInspector({
    this.parsedJournalEvents = const <String>{},
    this.plannedJournalEvents = defaultPlannedJournalEvents,
    this.modelledRankKeys = const <String>{},
  });

  /// Event names the app already turns into domain objects.
  final Set<String> parsedJournalEvents;

  /// Event names the cockpit plan needs something out of.
  final Set<String> plannedJournalEvents;

  /// CAPI rank keys the app already has a ladder for. Injected rather than
  /// imported so the inspector stays independent of the commander feature.
  final Set<String> modelledRankKeys;

  /// The events the extended cockpit depends on, in the order they matter.
  static const Set<String> defaultPlannedJournalEvents = <String>{
    'Statistics',
    'Reputation',
    'EngineerProgress',
    'Loadout',
    'ShipLocker',
    'Materials',
    'Powerplay',
    'StoredShips',
    'SuitLoadout',
    'Cargo',
  };

  /// Rebuy is 5 % of hull plus modules. Frontier exposes the parts, never the
  /// product, so the current ship's exact `Rebuy` still has to come from the
  /// journal's `Loadout` event.
  static const double rebuyRate = 0.05;

  // --- /profile ------------------------------------------------------------

  ProfileInspection inspectProfile(Map<String, dynamic> json) {
    final List<Map<String, dynamic>> ships = _collection(json['ships']);
    final Map<String, dynamic> ship = _map(json['ship']);
    final Map<String, dynamic> shipModules = _map(ship['modules']);
    final List<Map<String, dynamic>> suits = _collection(json['suits']);
    final List<Map<String, dynamic>> loadouts = _collection(json['loadouts']);

    return ProfileInspection(
      topLevelKeys: json.keys.toList(growable: false)..sort(),
      findings: <InspectionFinding>[
        _fleetFinding(ships, json['ships']),
        _storedShipModulesFinding(ships, json['commander']),
        _currentShipModulesFinding(shipModules),
        _shipValueFinding(ship),
        _suitsFinding(suits, json['suit']),
        _loadoutsFinding(loadouts, json['loadout']),
        _ranksFinding(json['commander']),
        _capabilitiesFinding(json['commander'], suits, _map(ship['launchBays'])),
        _starportFinding(json['lastStarport']),
      ],
    );
  }

  InspectionFinding _fleetFinding(
    List<Map<String, dynamic>> ships,
    Object? raw,
  ) {
    final String shape = switch (raw) {
      List<dynamic>() => 'tableau',
      Map<String, dynamic>() => 'objet indexé par identifiant',
      _ => 'absente',
    };
    return InspectionFinding(
      subject: 'Flotte',
      verdict:
          ships.isEmpty ? InspectionVerdict.absent : InspectionVerdict.present,
      detail: ships.isEmpty
          ? 'Aucune clé `ships` exploitable (forme : $shape).'
          : '${ships.length} vaisseau(x) sous `ships`, forme $shape.',
    );
  }

  /// The first open question: can the fleet page show what each stored ship is
  /// fitted with, or only what it is worth?
  InspectionFinding _storedShipModulesFinding(
    List<Map<String, dynamic>> ships,
    Object? commander,
  ) {
    if (ships.isEmpty) {
      return const InspectionFinding(
        subject: 'Équipement des vaisseaux stockés',
        verdict: InspectionVerdict.unknown,
        detail: 'Pas de flotte dans cette capture : rien à conclure.',
        isOpenQuestion: true,
      );
    }

    final int currentId = _int(_map(commander)['currentShipId']) ?? -1;
    final int withModules = ships
        .where((Map<String, dynamic> ship) => _map(ship['modules']).isNotEmpty)
        .length;
    final int storedWithModules = ships
        .where(
          (Map<String, dynamic> ship) =>
              _int(ship['id']) != currentId &&
              _map(ship['modules']).isNotEmpty,
        )
        .length;
    final int stored = ships
        .where((Map<String, dynamic> ship) => _int(ship['id']) != currentId)
        .length;

    final InspectionVerdict verdict;
    if (stored == 0) {
      verdict = InspectionVerdict.unknown;
    } else if (storedWithModules == 0) {
      verdict = InspectionVerdict.absent;
    } else if (storedWithModules < stored) {
      verdict = InspectionVerdict.partial;
    } else {
      verdict = InspectionVerdict.present;
    }

    return InspectionFinding(
      subject: 'Équipement des vaisseaux stockés',
      verdict: verdict,
      detail: stored == 0
          ? 'Un seul vaisseau, celui piloté : impossible de trancher '
              '($withModules avec `modules`).'
          : '$storedWithModules / $stored vaisseau(x) stocké(s) portent un '
              'bloc `modules`. Sans lui, la page Flotte ne peut afficher que '
              'type, nom, position, valeur et rebuy estimé.',
      isOpenQuestion: true,
    );
  }

  /// Slots that hold paint, decals, nameplates and a voice pack — cosmetics
  /// Frontier files under `modules` like any other. A fitting list that shows
  /// them is a third noise.
  static const List<String> cosmeticSlotPrefixes = <String>[
    'PaintJob',
    'Decal',
    'ShipName',
    'ShipID',
    'ShipKit',
    'VesselVoice',
    'Bobble',
    'WeaponColour',
    'EngineColour',
  ];

  static bool isCosmeticSlot(String slot) => cosmeticSlotPrefixes
      .any((String prefix) => slot.startsWith(prefix));

  InspectionFinding _currentShipModulesFinding(
    Map<String, dynamic> shipModules,
  ) {
    if (shipModules.isEmpty) {
      return const InspectionFinding(
        subject: 'Modules du vaisseau piloté',
        verdict: InspectionVerdict.absent,
        detail: 'Aucun `ship.modules` — la fiche du vaisseau courant serait '
            'vide.',
      );
    }

    final int cosmetic =
        shipModules.keys.where(isCosmeticSlot).length;
    final int engineered = shipModules.values
        .whereType<Map<String, dynamic>>()
        .where(
          (Map<String, dynamic> slot) => _map(slot['engineer']).isNotEmpty,
        )
        .length;

    return InspectionFinding(
      subject: 'Modules du vaisseau piloté',
      verdict: InspectionVerdict.present,
      detail: '${shipModules.length} emplacement(s) : '
          '${shipModules.length - cosmetic} fonctionnel(s) et $cosmetic '
          'cosmétique(s) (peinture, décalcomanies, COVAS) à filtrer. '
          '$engineered porte(nt) un bloc `engineer` avec son blueprint, son '
          'grade et ses modificateurs.',
    );
  }

  InspectionFinding _shipValueFinding(Map<String, dynamic> ship) {
    final Map<String, dynamic> value = _map(ship['value']);
    if (value.isEmpty) {
      return const InspectionFinding(
        subject: 'Valeur et rebuy',
        verdict: InspectionVerdict.absent,
        detail: 'Aucun `ship.value` : le rebuy ne peut pas être estimé.',
      );
    }
    final int hull = _int(value['hull']) ?? 0;
    final int modules = _int(value['modules']) ?? 0;
    final int rebuy = ((hull + modules) * rebuyRate).round();

    // A hull worth nothing is not a free hull: Frontier reports `0` for ships
    // it has no purchase price for — the recent hulls, and anything bought
    // before it started recording. The rebuy derived from it is then far under
    // the truth, and a figure that is quietly wrong is worse than none.
    if (hull == 0) {
      return InspectionFinding(
        subject: 'Valeur et rebuy',
        verdict: InspectionVerdict.partial,
        detail: 'Clés : ${_sortedKeys(value)}. Mais `hull` vaut 0 alors que '
            'les modules valent ${formatCreditsExact(modules)} : le rebuy '
            'calculé (${formatCreditsExact(rebuy)}) est très en dessous du '
            'vrai. Le montant exact vient de `Rebuy` dans l\'événement '
            '`Loadout` du journal.',
      );
    }

    return InspectionFinding(
      subject: 'Valeur et rebuy',
      verdict: InspectionVerdict.present,
      detail: 'Clés : ${_sortedKeys(value)}. Coque + modules = '
          '${formatCreditsExact(hull + modules)} → rebuy estimé à 5 % = '
          '${formatCreditsExact(rebuy)}.',
    );
  }

  InspectionFinding _suitsFinding(
    List<Map<String, dynamic>> suits,
    Object? current,
  ) {
    if (suits.isEmpty && _map(current).isEmpty) {
      return const InspectionFinding(
        subject: 'Combinaisons',
        verdict: InspectionVerdict.absent,
        detail: 'Ni `suit` ni `suits` : compte sans Odyssey, ou payload '
            'tronqué.',
      );
    }
    final List<String> symbols = suits
        .map((Map<String, dynamic> suit) => _string(suit['name']) ?? '?')
        .toList(growable: false);
    return InspectionFinding(
      subject: 'Combinaisons',
      verdict: InspectionVerdict.present,
      detail: '${suits.length} possédée(s) : ${symbols.join(', ')}. '
          'Le grade se lit dans le suffixe `_classN`.',
    );
  }

  /// The second open question: are the on-foot weapons and their grade in the
  /// payload at all?
  InspectionFinding _loadoutsFinding(
    List<Map<String, dynamic>> loadouts,
    Object? current,
  ) {
    final List<Map<String, dynamic>> all = <Map<String, dynamic>>[
      ...loadouts,
      if (_map(current).isNotEmpty) _map(current),
    ];
    if (all.isEmpty) {
      return const InspectionFinding(
        subject: 'Loadouts à pied (armes et grades)',
        verdict: InspectionVerdict.absent,
        detail: 'Ni `loadout` ni `loadouts`. Les armes devraient alors venir '
            'des événements `SuitLoadout` du journal.',
        isOpenQuestion: true,
      );
    }

    final List<Map<String, dynamic>> weapons = <Map<String, dynamic>>[
      for (final Map<String, dynamic> loadout in all)
        ..._map(loadout['slots'])
            .values
            .whereType<Map<String, dynamic>>(),
    ];
    final int withClass = weapons
        .where((Map<String, dynamic> weapon) => weapon['class'] != null)
        .length;
    final int withMods = weapons
        .where((Map<String, dynamic> weapon) => weapon['mods'] is List<dynamic>)
        .length;

    // Frontier ships `"modifications": ["NYI"]` — its own marker for "not yet
    // implemented". The field exists, will never be filled, and reading it as
    // a mod list would put one fictional modification on every weapon.
    final int notYetImplemented = weapons
        .where(
          (Map<String, dynamic> weapon) =>
              weapon['modifications'] is List<dynamic> &&
              (weapon['modifications']! as List<dynamic>).contains('NYI'),
        )
        .length;

    if (weapons.isEmpty) {
      return InspectionFinding(
        subject: 'Loadouts à pied (armes et grades)',
        verdict: InspectionVerdict.absent,
        detail: '${all.length} loadout(s) mais aucun emplacement d\'arme '
            'rempli.',
        isOpenQuestion: true,
      );
    }

    // The weapons themselves are there; what is missing is what would let the
    // screen rank them. Calling that "absent" would read as "no loadouts".
    final InspectionVerdict verdict = withClass == weapons.length
        ? InspectionVerdict.present
        : InspectionVerdict.partial;

    final String census = '${all.length} loadout(s), ${weapons.length} '
        'arme(s) équipée(s), nommées et localisées.';
    final String nyi = notYetImplemented == 0
        ? ''
        : ' $notYetImplemented arme(s) portent `modifications: ["NYI"]`, le '
            'marqueur « non implémenté » de Frontier.';

    return InspectionFinding(
      subject: 'Loadouts à pied (armes et grades)',
      verdict: verdict,
      detail: verdict == InspectionVerdict.present
          ? '$census Grade `class` et modifications `mods` présents sur '
              'toutes.$nyi'
          : '$census Mais grade `class` sur $withClass seulement, et '
              'modifications `mods` sur $withMods.$nyi Une liste d\'armes est '
              'affichable, un grade ne l\'est pas.',
      isOpenQuestion: true,
    );
  }

  InspectionFinding _ranksFinding(Object? commander) {
    final Map<String, dynamic> ranks = _map(_map(commander)['rank']);
    if (ranks.isEmpty) {
      return const InspectionFinding(
        subject: 'Rangs',
        verdict: InspectionVerdict.absent,
        detail: 'Aucun `commander.rank`.',
      );
    }

    const List<String> odyssey = <String>['exobiologist', 'soldier'];
    final List<String> missing = odyssey
        .where((String key) => !ranks.containsKey(key))
        .toList(growable: false);

    // Frontier adds ladders with expansions and never announces them. Naming
    // the ones the app does not model turns a silent omission into a to-do.
    final List<String> unmodelled = ranks.keys
        .where((String key) => !modelledRankKeys.contains(key))
        .toList(growable: false)
      ..sort();

    return InspectionFinding(
      subject: 'Rangs',
      verdict: missing.isEmpty && unmodelled.isEmpty
          ? InspectionVerdict.present
          : InspectionVerdict.partial,
      detail: '${ranks.length} échelle(s) : ${_sortedKeys(ranks)}.'
          '${missing.isEmpty ? '' : ' Manque : ${missing.join(', ')}.'}'
          '${unmodelled.isEmpty ? '' : ' Non modélisée(s) par l\'application : '
              '${unmodelled.join(', ')}.'}'
          ' Le pourcentage vers le rang suivant n\'est pas ici : il vient de '
          '`Progress` dans le journal.',
    );
  }

  /// Reports [capabilities] against the rest of the payload rather than on its
  /// own: the flags are known to contradict it, and a screen that trusted them
  /// would hide the Odyssey half of the app from a commander who owns it.
  InspectionFinding _capabilitiesFinding(
    Object? commander,
    List<Map<String, dynamic>> suits,
    Map<String, dynamic> launchBays,
  ) {
    final Map<String, dynamic> capabilities =
        _map(_map(commander)['capabilities']);
    if (capabilities.isEmpty) {
      return const InspectionFinding(
        subject: 'Extensions du compte',
        verdict: InspectionVerdict.absent,
        detail: 'Aucun `commander.capabilities` : Horizons et Odyssey '
            'resteront déduits du journal (`LoadGame`).',
      );
    }

    final bool claimsOdyssey = capabilities['Odyssey'] == true;
    final bool claimsHorizons = capabilities['Horizons'] == true;
    final bool ownsOdysseySuits = suits.any(
      (Map<String, dynamic> suit) =>
          !(_string(suit['name']) ?? '').toLowerCase().startsWith('flightsuit'),
    );
    final bool ownsPlanetaryVehicle = launchBays.isNotEmpty;

    final List<String> contradictions = <String>[
      if (!claimsOdyssey && ownsOdysseySuits)
        'Odyssey est à false alors que le compte possède des combinaisons '
            'Odyssey',
      if (!claimsHorizons && ownsPlanetaryVehicle)
        'Horizons est à false alors que le vaisseau embarque un hangar '
            'planétaire',
    ];

    return InspectionFinding(
      subject: 'Extensions du compte',
      verdict: contradictions.isEmpty
          ? InspectionVerdict.present
          : InspectionVerdict.absent,
      detail: contradictions.isEmpty
          ? '${capabilities.length} indicateur(s) : ${_sortedKeys(capabilities)}.'
          : 'Indicateurs contredits par le reste de la charge utile : '
              '${contradictions.join(' ; ')}. Inutilisables — déduire Odyssey '
              'des combinaisons possédées et Horizons de `launchBays`.',
    );
  }

  InspectionFinding _starportFinding(Object? starport) {
    final Map<String, dynamic> port = _map(starport);
    final Map<String, dynamic> services = _map(port['services']);
    return InspectionFinding(
      subject: 'Dernière station',
      verdict: port.isEmpty
          ? InspectionVerdict.absent
          : services.isEmpty
              ? InspectionVerdict.partial
              : InspectionVerdict.present,
      detail: port.isEmpty
          ? 'Aucun `lastStarport` : le commandant n\'est pas amarré, ou la '
              'CAPI n\'a rien de récent.'
          : '${_string(port['name']) ?? 'sans nom'} — '
              '${services.length} service(s) listé(s), dont '
              '${services.containsKey('vistagenomics') ? 'vistagenomics '
                  '(la station achète les données organiques)' : 'pas de '
                  'vistagenomics'}.',
    );
  }

  // --- /journal ------------------------------------------------------------

  JournalInspection inspectJournal(List<String> lines) {
    final Map<String, int> counts = <String, int>{};
    DateTime? first;
    DateTime? last;
    int unreadable = 0;
    int total = 0;

    for (final String line in lines) {
      final String trimmed = line.trim();
      if (trimmed.isEmpty) {
        continue;
      }
      total++;

      final Object? decoded;
      try {
        decoded = jsonDecode(trimmed);
      } on FormatException {
        unreadable++;
        continue;
      }
      if (decoded is! Map<String, dynamic>) {
        unreadable++;
        continue;
      }
      final String? name = _string(decoded['event']);
      final DateTime? at = DateTime.tryParse(_string(decoded['timestamp']) ?? '');
      if (name == null || at == null) {
        unreadable++;
        continue;
      }

      counts[name] = (counts[name] ?? 0) + 1;
      if (first == null || at.isBefore(first)) {
        first = at;
      }
      if (last == null || at.isAfter(last)) {
        last = at;
      }
    }

    final List<JournalEventTally> tallies = <JournalEventTally>[
      for (final MapEntry<String, int> entry in counts.entries)
        JournalEventTally(
          name: entry.key,
          count: entry.value,
          isParsed: parsedJournalEvents.contains(entry.key),
          isPlanned: plannedJournalEvents.contains(entry.key),
        ),
    ]..sort((JournalEventTally a, JournalEventTally b) {
        final int byCount = b.count.compareTo(a.count);
        return byCount != 0 ? byCount : a.name.compareTo(b.name);
      });

    // An absent planned event is a result, not a blank: it says the sync has
    // to reach further back before the cockpit can be fed.
    final List<JournalEventTally> absent = <JournalEventTally>[
      for (final String name in plannedJournalEvents)
        if (!counts.containsKey(name))
          JournalEventTally(
            name: name,
            count: 0,
            isParsed: parsedJournalEvents.contains(name),
            isPlanned: true,
          ),
    ];

    return JournalInspection(
      lineCount: total,
      unreadableLines: unreadable,
      tallies: <JournalEventTally>[...tallies, ...absent],
      firstAt: first,
      lastAt: last,
    );
  }

  // --- Readers -------------------------------------------------------------

  /// Flattens the two shapes Frontier alternates between for `ships`, `suits`
  /// and `loadouts`: an array while the indices are contiguous, an object
  /// keyed by index as soon as one is sold and leaves a gap.
  static List<Map<String, dynamic>> _collection(Object? value) {
    if (value is List<dynamic>) {
      return value.whereType<Map<String, dynamic>>().toList(growable: false);
    }
    if (value is Map<String, dynamic>) {
      return value.values
          .whereType<Map<String, dynamic>>()
          .toList(growable: false);
    }
    return const <Map<String, dynamic>>[];
  }

  static Map<String, dynamic> _map(Object? value) =>
      value is Map<String, dynamic> ? value : const <String, dynamic>{};

  static String? _string(Object? value) =>
      value is String && value.isNotEmpty ? value : null;

  static int? _int(Object? value) => switch (value) {
        final int v => v,
        final double v => v.round(),
        final String v => int.tryParse(v),
        _ => null,
      };

  static String _sortedKeys(Map<String, dynamic> map) =>
      (map.keys.toList(growable: false)..sort()).join(', ');
}
