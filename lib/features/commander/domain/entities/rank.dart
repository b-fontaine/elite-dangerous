import 'package:equatable/equatable.dart';

/// The eight commander rank ladders the app cares about.
///
/// Each ladder carries three names for itself: the lowercase key the Companion
/// API uses, the CamelCase key the local Journal uses, and a French label.
/// Mixing the first two up is a classic and silent source of empty ranks.
enum RankType {
  combat(
    capiKey: 'combat',
    journalKey: 'Combat',
    label: 'Combat',
    names: <String>[
      'Harmless',
      'Mostly Harmless',
      'Novice',
      'Competent',
      'Expert',
      'Master',
      'Dangerous',
      'Deadly',
      'Elite',
    ],
  ),
  trade(
    capiKey: 'trade',
    journalKey: 'Trade',
    label: 'Commerce',
    names: <String>[
      'Penniless',
      'Mostly Penniless',
      'Peddler',
      'Dealer',
      'Merchant',
      'Broker',
      'Entrepreneur',
      'Tycoon',
      'Elite',
    ],
  ),
  explore(
    capiKey: 'explore',
    journalKey: 'Explore',
    label: 'Exploration',
    names: <String>[
      'Aimless',
      'Mostly Aimless',
      'Scout',
      'Surveyor',
      'Explorer',
      'Pathfinder',
      'Ranger',
      'Pioneer',
      'Elite',
    ],
  ),
  soldier(
    capiKey: 'soldier',
    journalKey: 'Soldier',
    label: 'Mercenaire',
    names: <String>[
      'Defenceless',
      'Mostly Defenceless',
      'Rookie',
      'Soldier',
      'Gunslinger',
      'Warrior',
      'Gladiator',
      'Deadeye',
      'Elite',
    ],
  ),
  exobiologist(
    capiKey: 'exobiologist',
    journalKey: 'Exobiologist',
    label: 'Exobiologie',
    names: <String>[
      'Directionless',
      'Mostly Directionless',
      'Compiler',
      'Collector',
      'Cataloguer',
      'Taxonomist',
      'Ecologist',
      'Geneticist',
      'Elite',
    ],
  ),
  cqc(
    capiKey: 'cqc',
    journalKey: 'CQC',
    label: 'CQC',
    names: <String>[
      'Helpless',
      'Mostly Helpless',
      'Amateur',
      'Semi Professional',
      'Professional',
      'Champion',
      'Hero',
      'Legend',
      'Elite',
    ],
  ),
  federation(
    capiKey: 'federation',
    journalKey: 'Federation',
    label: 'Fédération',
    names: <String>[
      'None',
      'Recruit',
      'Cadet',
      'Midshipman',
      'Petty Officer',
      'Chief Petty Officer',
      'Warrant Officer',
      'Ensign',
      'Lieutenant',
      'Lt. Commander',
      'Post Commander',
      'Post Captain',
      'Rear Admiral',
      'Vice Admiral',
      'Admiral',
    ],
    hasEliteTiers: false,
  ),
  /// Powerplay rating, 0 to 5. Frontier exposes the number and no name for it.
  power(
    capiKey: 'power',
    journalKey: 'Power',
    label: 'Powerplay',
    names: <String>[],
    hasEliteTiers: false,
  ),

  /// Added by Trailblazers with system colonisation. Frontier publishes no
  /// tier names for it, so the level is shown as a number rather than invented.
  builder(
    capiKey: 'builder',
    journalKey: 'Builder',
    label: 'Colonisation',
    names: <String>[],
    hasEliteTiers: false,
  ),

  /// Present in `/profile` since the same update, undocumented and always
  /// observed at zero. Modelled so it stops showing up as an unknown key.
  learner(
    capiKey: 'learner',
    journalKey: 'Learner',
    label: 'Apprentissage',
    names: <String>[],
    hasEliteTiers: false,
  ),

  empire(
    capiKey: 'empire',
    journalKey: 'Empire',
    label: 'Empire',
    names: <String>[
      'None',
      'Outsider',
      'Serf',
      'Master',
      'Squire',
      'Knight',
      'Lord',
      'Baron',
      'Viscount',
      'Count',
      'Earl',
      'Marquis',
      'Duke',
      'Prince',
      'King',
    ],
    hasEliteTiers: false,
  );

  const RankType({
    required this.capiKey,
    required this.journalKey,
    required this.label,
    required this.names,
    this.hasEliteTiers = true,
  });

  /// Key in `/profile`'s `commander.rank` object — always lowercase.
  final String capiKey;

  /// Key in the Journal's `Rank` / `Progress` events — always CamelCase.
  final String journalKey;

  final String label;
  final List<String> names;

  /// The pilot ladders continue past Elite with Elite I to Elite V; the
  /// superpower ladders stop at Admiral and King.
  final bool hasEliteTiers;

  /// Ranks beyond the base ladder, as the game and EDMC expose them.
  static const List<String> eliteTiers = <String>[
    'Elite I',
    'Elite II',
    'Elite III',
    'Elite IV',
    'Elite V',
  ];

  /// Highest level the ladder can report. Zero when Frontier publishes no
  /// tier names, which also makes [RankProgress.fraction] fall back to nothing
  /// rather than to a bar computed from a length of `-1`.
  int get maxLevel => names.isEmpty
      ? 0
      : names.length - 1 + (hasEliteTiers ? eliteTiers.length : 0);

  /// Whether the app knows what to call each tier of this ladder.
  bool get hasNamedTiers => names.isNotEmpty;

  /// Never throws: an unknown level degrades to `Rang N` rather than crashing
  /// the profile screen when Frontier adds a tier.
  String nameFor(int level) {
    if (names.isEmpty) {
      return level <= 0 ? 'Aucun' : 'Rang $level';
    }
    if (level < 0) {
      return names.first;
    }
    if (level < names.length) {
      return names[level];
    }
    if (hasEliteTiers) {
      final int eliteIndex = level - names.length;
      if (eliteIndex < eliteTiers.length) {
        return eliteTiers[eliteIndex];
      }
    }
    return 'Rang $level';
  }

  static RankType? fromCapiKey(String key) {
    for (final RankType type in values) {
      if (type.capiKey == key) {
        return type;
      }
    }
    return null;
  }

  static RankType? fromJournalKey(String key) {
    for (final RankType type in values) {
      if (type.journalKey == key) {
        return type;
      }
    }
    return null;
  }
}

/// One rank ladder's position, plus the progress towards the next tier when
/// the game tells us (the `Progress` journal event does; the CAPI does not).
class RankProgress extends Equatable {
  const RankProgress({
    required this.type,
    required this.level,
    this.progressPercent,
  });

  final RankType type;
  final int level;

  /// 0 to 100, or `null` when unknown.
  final int? progressPercent;

  String get name => type.nameFor(level);

  /// 0.0 to 1.0 for a progress bar, falling back to the share of the ladder
  /// already climbed when the game does not report a percentage.
  double get fraction {
    final int? percent = progressPercent;
    if (percent != null) {
      return (percent / 100).clamp(0.0, 1.0);
    }
    final int max = type.maxLevel;
    return max == 0 ? 0 : (level / max).clamp(0.0, 1.0);
  }

  bool get isElite =>
      type.hasNamedTiers && level >= type.names.length - 1;

  @override
  List<Object?> get props => <Object?>[type, level, progressPercent];
}
