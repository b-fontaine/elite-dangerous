import '../../domain/entities/commander.dart';
import '../../domain/entities/rank.dart';
import '../../domain/entities/ship.dart';
import '../../domain/entities/station_services.dart';
import '../../domain/entities/suit_info.dart';
import '../../domain/entities/suit_loadout.dart';
import 'json_readers.dart';
import 'ship_dto.dart';
import 'station_services_dto.dart';
import 'suit_loadout_dto.dart';

/// Wire format of `GET /profile`.
///
/// Written by hand rather than generated because the payload is not a stable
/// schema: `ships`, `suits` and `loadouts` arrive as a JSON array when their
/// indices are contiguous and as an object keyed by index when they are not,
/// and `suit` is simply absent on an account without Odyssey. Anything read
/// here must degrade rather than throw — a commander should never lose their
/// whole profile screen because Frontier added a field.
class CommanderProfileDto {
  const CommanderProfileDto({
    required this.name,
    required this.credits,
    required this.debt,
    required this.docked,
    required this.onFoot,
    required this.rankLevels,
    required this.suits,
    required this.currentSuit,
    this.currentSystem,
    this.currentStation,
    this.shipName,
    this.shipType,
    this.fleet = const <Ship>[],
    this.suitLoadouts = const <SuitLoadout>[],
    this.station = const StationServices.none(),
  });

  factory CommanderProfileDto.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> commander = _map(json['commander']);
    final Map<String, dynamic> rank = _map(commander['rank']);
    final Map<String, dynamic> ship = _map(json['ship']);
    final Map<String, dynamic> currentSuit = _map(json['suit']);

    return CommanderProfileDto(
      name: _string(commander['name']) ?? 'Commandant',
      credits: _int(commander['credits']) ?? 0,
      debt: _int(commander['debt']) ?? 0,
      docked: commander['docked'] == true,
      onFoot: commander['onfoot'] == true,
      rankLevels: <String, int>{
        for (final MapEntry<String, dynamic> entry in rank.entries)
          if (_int(entry.value) case final int level) entry.key: level,
      },
      suits: normaliseCollection(json['suits'])
          .map(SuitInfoDto.fromJson)
          .toList(growable: false),
      currentSuit:
          currentSuit.isEmpty ? null : SuitInfoDto.fromJson(currentSuit),
      currentSystem: _string(_map(json['lastSystem'])['name']),
      currentStation: _string(_map(json['lastStarport'])['name']),
      shipName: _string(ship['shipName']),
      shipType: _string(ship['name']),
      fleet: ShipDto.fleetFromJson(
        json['ships'],
        currentShip: ship,
        currentShipId: _int(commander['currentShipId']),
      ),
      suitLoadouts: SuitLoadoutDto.loadoutsFromJson(
        json['loadouts'],
        equipped: json['loadout'],
      ),
      station: StationServicesDto.fromJson(
        json['lastStarport'],
        lastSystem: json['lastSystem'],
      ),
    );
  }

  final String name;
  final int credits;
  final int debt;
  final bool docked;
  final bool onFoot;

  /// Raw CAPI rank map, lowercase keys.
  final Map<String, int> rankLevels;

  final List<SuitInfoDto> suits;
  final SuitInfoDto? currentSuit;
  final String? currentSystem;
  final String? currentStation;
  final String? shipName;
  final String? shipType;

  /// Every ship owned, the flown one detailed and the rest summarised — which
  /// is all Frontier sends for them.
  final List<Ship> fleet;

  final List<SuitLoadout> suitLoadouts;
  final StationServices station;

  Commander toEntity({
    required CommanderDataSource source,
    DateTime? syncedAt,
  }) {
    return Commander(
      name: name,
      source: source,
      credits: credits,
      debt: debt,
      currentSystem: currentSystem,
      currentStation: currentStation,
      shipName: shipName,
      shipType: shipType,
      docked: docked,
      onFoot: onFoot,
      ranks: <RankType, RankProgress>{
        for (final RankType type in RankType.values)
          type: RankProgress(
            type: type,
            level: rankLevels[type.capiKey] ?? 0,
          ),
      },
      suits: suits.map((SuitInfoDto dto) => dto.toEntity()).toList(),
      currentSuit: currentSuit?.toEntity(),
      lastSyncedAt: syncedAt,
      fleet: fleet,
      suitLoadouts: suitLoadouts,
      station: station,
    );
  }

  /// Flattens the two shapes Frontier alternates between.
  ///
  /// Not handling the object form is the single most common way third-party
  /// clients crash on a real account: the map appears as soon as the commander
  /// sells a ship or a suit and leaves a gap in the indices.
  static List<Map<String, dynamic>> normaliseCollection(Object? value) =>
      normaliseJsonCollection(value);

  static Map<String, dynamic> _map(Object? value) => readMap(value);

  static String? _string(Object? value) => readString(value);

  static int? _int(Object? value) => readInt(value);
}

/// One entry of `suit` / `suits`.
class SuitInfoDto {
  const SuitInfoDto({
    required this.symbol,
    this.locName,
    this.suitId,
    this.mods = const <String>[],
  });

  factory SuitInfoDto.fromJson(Map<String, dynamic> json) => SuitInfoDto(
        symbol: json['name'] as String? ?? '',
        locName: json['locName'] as String?,
        suitId: CommanderProfileDto._int(json['suitId'] ?? json['id']),
        mods: (json['mods'] is List<dynamic>
                ? (json['mods']! as List<dynamic>).whereType<String>()
                : const Iterable<String>.empty())
            .toList(growable: false),
      );

  final String symbol;
  final String? locName;
  final int? suitId;
  final List<String> mods;

  SuitInfo toEntity() => SuitInfo.fromSymbol(
        symbol,
        locName: locName,
        suitId: suitId,
        modIds: mods.toSet(),
      );
}
