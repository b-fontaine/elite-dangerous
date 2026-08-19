import 'package:equatable/equatable.dart';

import 'manual_commander_overrides.dart';
import 'rank.dart';
import 'suit_info.dart';

/// Where the commander's data came from, so the UI can be honest about it.
enum CommanderDataSource {
  /// Live from the Companion API.
  companionApi('Companion API'),

  /// The last successful Companion API response, replayed offline.
  cache('Cache local'),

  /// Typed in by the commander.
  manual('Saisie manuelle'),

  /// Nothing known yet.
  none('Aucune donnée');

  const CommanderDataSource(this.label);

  final String label;
}

/// The commander, as the app knows them.
class Commander extends Equatable {
  const Commander({
    required this.name,
    required this.source,
    this.credits = 0,
    this.debt = 0,
    this.currentSystem,
    this.currentStation,
    this.shipName,
    this.shipType,
    this.docked = false,
    this.onFoot = false,
    this.ranks = const <RankType, RankProgress>{},
    this.suits = const <SuitInfo>[],
    this.currentSuit,
    this.jumpRangeLy,
    this.lastSyncedAt,
  });

  const Commander.unknown()
      : name = 'Commandant',
        source = CommanderDataSource.none,
        credits = 0,
        debt = 0,
        currentSystem = null,
        currentStation = null,
        shipName = null,
        shipType = null,
        docked = false,
        onFoot = false,
        ranks = const <RankType, RankProgress>{},
        suits = const <SuitInfo>[],
        currentSuit = null,
        jumpRangeLy = null,
        lastSyncedAt = null;

  final String name;
  final CommanderDataSource source;
  final int credits;
  final int debt;
  final String? currentSystem;
  final String? currentStation;
  final String? shipName;
  final String? shipType;
  final bool docked;
  final bool onFoot;
  final Map<RankType, RankProgress> ranks;
  final List<SuitInfo> suits;
  final SuitInfo? currentSuit;
  final double? jumpRangeLy;
  final DateTime? lastSyncedAt;

  RankProgress? rank(RankType type) => ranks[type];

  int rankLevel(RankType type) => ranks[type]?.level ?? 0;

  /// The Artemis, whichever slot it sits in — the only suit that matters to an
  /// exobiologist.
  SuitInfo? get artemis {
    final SuitInfo? current = currentSuit;
    if (current != null && current.isArtemis) {
      return current;
    }
    for (final SuitInfo suit in suits) {
      if (suit.isArtemis) {
        return suit;
      }
    }
    return null;
  }

  bool get ownsMaverick =>
      suits.any((SuitInfo suit) => suit.kind == SuitKind.maverick);

  bool get isKnown => source != CommanderDataSource.none;

  /// Overlays what the commander typed in on top of what the API returned.
  ///
  /// Manual values always win: the app can only ever see part of a save, so a
  /// commander correcting it is the more reliable source. A `null` override
  /// means "not stated", never "clear this field".
  Commander mergedWith(ManualCommanderOverrides overrides) {
    final List<SuitInfo> mergedSuits = <SuitInfo>[...suits];
    SuitInfo? mergedArtemis = artemis;

    final int? grade = overrides.artemisGrade;
    if (grade != null && grade > 0) {
      mergedArtemis = SuitInfo.fromSymbol(
        'explorationsuit_class$grade',
        modIds: <String>{
          ...?artemis?.modIds,
          ...overrides.installedModIds,
        },
      );
      mergedSuits
        ..removeWhere((SuitInfo suit) => suit.isArtemis)
        ..add(mergedArtemis);
    } else if (mergedArtemis != null && overrides.installedModIds.isNotEmpty) {
      mergedArtemis = SuitInfo(
        symbol: mergedArtemis.symbol,
        kind: mergedArtemis.kind,
        grade: mergedArtemis.grade,
        displayName: mergedArtemis.displayName,
        suitId: mergedArtemis.suitId,
        modIds: <String>{...mergedArtemis.modIds, ...overrides.installedModIds},
      );
      mergedSuits
        ..removeWhere((SuitInfo suit) => suit.isArtemis)
        ..add(mergedArtemis);
    }

    if (overrides.ownsMaverick && !ownsMaverick) {
      mergedSuits.add(SuitInfo.fromSymbol('utilitysuit_class3'));
    }

    final Map<RankType, RankProgress> mergedRanks =
        <RankType, RankProgress>{...ranks};
    final int? explorerLevel = overrides.explorerRankLevel;
    if (explorerLevel != null) {
      mergedRanks[RankType.explore] = RankProgress(
        type: RankType.explore,
        level: explorerLevel,
      );
    }

    return copyWith(
      name: overrides.commanderName,
      credits: overrides.creditBalance,
      currentSystem: overrides.currentSystem,
      shipName: overrides.shipName,
      jumpRangeLy: overrides.jumpRangeLy,
      ranks: mergedRanks,
      suits: mergedSuits,
      currentSuit: mergedArtemis ?? currentSuit,
      source: overrides.isEmpty || isKnown
          ? source
          : CommanderDataSource.manual,
    );
  }

  Commander copyWith({
    String? name,
    CommanderDataSource? source,
    int? credits,
    int? debt,
    String? currentSystem,
    String? currentStation,
    String? shipName,
    String? shipType,
    bool? docked,
    bool? onFoot,
    Map<RankType, RankProgress>? ranks,
    List<SuitInfo>? suits,
    SuitInfo? currentSuit,
    double? jumpRangeLy,
    DateTime? lastSyncedAt,
  }) {
    return Commander(
      name: name ?? this.name,
      source: source ?? this.source,
      credits: credits ?? this.credits,
      debt: debt ?? this.debt,
      currentSystem: currentSystem ?? this.currentSystem,
      currentStation: currentStation ?? this.currentStation,
      shipName: shipName ?? this.shipName,
      shipType: shipType ?? this.shipType,
      docked: docked ?? this.docked,
      onFoot: onFoot ?? this.onFoot,
      ranks: ranks ?? this.ranks,
      suits: suits ?? this.suits,
      currentSuit: currentSuit ?? this.currentSuit,
      jumpRangeLy: jumpRangeLy ?? this.jumpRangeLy,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        name,
        source,
        credits,
        currentSystem,
        shipName,
        shipType,
        ranks,
        suits,
        currentSuit,
        jumpRangeLy,
      ];
}
