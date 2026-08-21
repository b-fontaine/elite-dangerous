import 'package:equatable/equatable.dart';

/// What the last station the commander docked at offers.
///
/// Read because of one entry: `vistagenomics` says whether organic data can be
/// sold here, which is the single question an exobiologist asks of a station.
/// The rest comes along for free and answers the next ones — where to engineer,
/// where to trade materials, where to restock.
class StationServices extends Equatable {
  const StationServices({
    required this.stationName,
    this.services = const <String>{},
    this.systemName,
    this.minorFaction,
  });

  const StationServices.none()
      : stationName = null,
        services = const <String>{},
        systemName = null,
        minorFaction = null;

  final String? stationName;

  /// Service keys Frontier reported as available. Only the ones it marked
  /// usable are kept — it also lists `unavailable` and `private` ones.
  final Set<String> services;

  final String? systemName;
  final String? minorFaction;

  bool get isKnown => stationName != null;

  bool has(String service) => services.contains(service);

  /// Vista Genomics: the counter that buys organic data.
  bool get sellsOrganicData => has('vistagenomics');

  /// The bartender trades the on-foot materials an Artemis upgrade needs.
  bool get hasBartender => has('bartender');

  bool get hasEngineer => has('engineer');
  bool get hasMaterialTrader => has('materialtrader');
  bool get hasOutfitting => has('outfitting');
  bool get hasShipyard => has('shipyard');

  /// Where an Artemis and its weapons are bought.
  bool get hasPioneerSupplies => has('pioneersupplies');

  /// Services grouped by what a commander goes there to do, most relevant to
  /// this app first. A flat list of twenty-six keys answers no question.
  List<StationServiceGroup> get grouped => <StationServiceGroup>[
        for (final StationServiceGroup group in StationServiceGroup.catalogue)
          group.restrictedTo(services),
      ].where((StationServiceGroup group) => group.isNotEmpty).toList();

  /// Services Frontier reported that this build does not know how to file.
  Set<String> get ungrouped => services.difference(<String>{
        for (final StationServiceGroup group
            in StationServiceGroup.catalogue)
          ...group.keys,
      });

  @override
  List<Object?> get props =>
      <Object?>[stationName, services, systemName, minorFaction];
}

/// One themed set of station services.
class StationServiceGroup {
  const StationServiceGroup({
    required this.label,
    required this.keys,
    this.note,
  });

  final String label;

  /// Service keys, in the order they are worth reading.
  final List<String> keys;

  final String? note;

  bool get isNotEmpty => keys.isNotEmpty;

  StationServiceGroup restrictedTo(Set<String> available) =>
      StationServiceGroup(
        label: label,
        note: note,
        keys: keys.where(available.contains).toList(growable: false),
      );

  /// French labels for the keys Frontier uses.
  static const Map<String, String> labels = <String, String>{
    'vistagenomics': 'Vista Genomics',
    'bartender': 'Barman',
    'pioneersupplies': 'Pioneer Supplies',
    'frontlinesolutions': 'Frontline Solutions',
    'apexinterstellar': 'Apex Interstellar',
    'socialspace': 'Concourse',
    'engineer': 'Ingénieur',
    'materialtrader': 'Négociant en matériaux',
    'techbroker': 'Courtier technologique',
    'outfitting': 'Équipement',
    'shipyard': 'Chantier naval',
    'repair': 'Réparation',
    'refuel': 'Ravitaillement',
    'rearm': 'Réarmement',
    'livery': 'Livrée',
    'commodities': 'Marché',
    'blackmarket': 'Marché noir',
    'searchrescue': 'Recherche et sauvetage',
    'exploration': 'Cartographie universelle',
    'contacts': 'Contacts',
    'crewlounge': 'Salon d\'équipage',
    'powerplay': 'Powerplay',
    'registeringcolonisation': 'Colonisation',
    'shop': 'Boutique',
    'stationmenu': 'Menu de station',
    'dock': 'Appontage',
  };

  static String labelFor(String key) => labels[key] ?? key;

  /// The five groups, ordered by what this app is for.
  static const List<StationServiceGroup> catalogue = <StationServiceGroup>[
    StationServiceGroup(
      label: 'Exobiologie',
      keys: <String>['vistagenomics', 'exploration'],
      note: 'Vista Genomics achète les données organiques. La cartographie '
          'universelle achète les données d\'exploration, qui sont une autre '
          'monnaie.',
    ),
    StationServiceGroup(
      label: 'À pied',
      keys: <String>[
        'bartender',
        'pioneersupplies',
        'frontlinesolutions',
        'apexinterstellar',
        'socialspace',
      ],
      note: 'Le barman échange les matériaux de combinaison ; Pioneer Supplies '
          'vend les combinaisons et les armes.',
    ),
    StationServiceGroup(
      label: 'Ingénierie et échange',
      keys: <String>['engineer', 'materialtrader', 'techbroker'],
    ),
    StationServiceGroup(
      label: 'Vaisseau',
      keys: <String>[
        'outfitting',
        'shipyard',
        'repair',
        'refuel',
        'rearm',
        'livery',
      ],
    ),
    StationServiceGroup(
      label: 'Autres',
      keys: <String>[
        'commodities',
        'blackmarket',
        'searchrescue',
        'contacts',
        'crewlounge',
        'powerplay',
        'registeringcolonisation',
        'shop',
        'stationmenu',
        'dock',
      ],
    ),
  ];
}
