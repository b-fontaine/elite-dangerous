import 'package:equatable/equatable.dart';

import 'manual_commander_overrides.dart';
import 'rank.dart';
import 'ship.dart';
import 'station_services.dart';
import 'suit_info.dart';
import 'suit_loadout.dart';

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
    this.fleet = const <Ship>[],
    this.suitLoadouts = const <SuitLoadout>[],
    this.station = const StationServices.none(),
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
        lastSyncedAt = null,
        fleet = const <Ship>[],
        suitLoadouts = const <SuitLoadout>[],
        station = const StationServices.none();

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

  /// Every ship owned. Only [currentShip] carries its fitting: verified on a
  /// real payload, where none of the seven stored ships had one.
  final List<Ship> fleet;

  /// Saved on-foot loadouts, weapons included — but never their grade, which
  /// Frontier does not send.
  final List<SuitLoadout> suitLoadouts;

  /// The last station docked at, and what it offers. `vistagenomics` is the
  /// entry that matters: it says whether organic data can be sold here.
  final StationServices station;

  Ship? get currentShip {
    for (final Ship ship in fleet) {
      if (ship.isCurrent) {
        return ship;
      }
    }
    return null;
  }

  /// Ships parked elsewhere, most valuable first.
  List<Ship> get storedShips => <Ship>[
        for (final Ship ship in fleet)
          if (!ship.isCurrent) ship,
      ]..sort((Ship a, Ship b) => b.value.totalCr.compareTo(a.value.totalCr));

  int get fleetValueCr => fleet.fold<int>(
        0,
        (int sum, Ship ship) => sum + ship.value.totalCr,
      );

  /// Liquid credits plus what the fleet is worth.
  int get netWorthCr => credits + fleetValueCr - debt;

  SuitLoadout? get equippedLoadout {
    for (final SuitLoadout loadout in suitLoadouts) {
      if (loadout.isEquipped) {
        return loadout;
      }
    }
    return null;
  }

  /// Whether the account has Odyssey, deduced rather than read.
  ///
  /// `commander.capabilities` reports it, and lies: a real payload had
  /// `Odyssey: false` on an account owning an Artemis, a Maverick and a
  /// Dominator. Owning a suit that is not the Flight Suit is the fact.
  bool get hasOdyssey =>
      suits.any((SuitInfo suit) => suit.kind != SuitKind.flight) ||
      currentSuit?.kind == SuitKind.artemis;

  /// Likewise for Horizons: `capabilities` had it at `false` on a ship
  /// carrying two SRVs. A planetary vehicle bay is the fact.
  bool get hasHorizons =>
      fleet.any((Ship ship) => ship.hasSrv) || hasOdyssey;

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
    List<Ship>? fleet,
    List<SuitLoadout>? suitLoadouts,
    StationServices? station,
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
      fleet: fleet ?? this.fleet,
      suitLoadouts: suitLoadouts ?? this.suitLoadouts,
      station: station ?? this.station,
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
        fleet,
        suitLoadouts,
        station,
      ];
}
