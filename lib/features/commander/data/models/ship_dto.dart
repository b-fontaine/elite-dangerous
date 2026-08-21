import '../../domain/entities/ship.dart';
import '../../domain/entities/ship_module.dart';
import '../../domain/entities/vehicle_names.dart';
import 'json_readers.dart';

/// Reads the `ship` and `ships` blocks of `GET /profile`.
///
/// Defensive throughout, for the same reason the profile DTO is: a commander
/// must not lose their fleet screen because Frontier added a field.
abstract final class ShipDto {
  /// Frontier scales health out of a million.
  static const double healthScale = 1000000;

  static List<Ship> fleetFromJson(
    Object? ships, {
    Map<String, dynamic> currentShip = const <String, dynamic>{},
    int? currentShipId,
  }) {
    final List<Map<String, dynamic>> entries = normaliseJsonCollection(ships);
    final List<Ship> fleet = <Ship>[
      for (final Map<String, dynamic> entry in entries)
        fromJson(
          entry,
          isCurrent: readInt(entry['id']) == currentShipId,
          // `ships` carries a reduced form of the flown ship; the top-level
          // `ship` block is the detailed one. Verified on a real payload:
          // there, and only there, are the modules.
          detail: readInt(entry['id']) == currentShipId
              ? currentShip
              : const <String, dynamic>{},
        ),
    ];

    // A commander in a ship that somehow never made the list still has one.
    if (currentShip.isNotEmpty &&
        !fleet.any((Ship ship) => ship.isCurrent)) {
      fleet.add(fromJson(currentShip, isCurrent: true));
    }
    return fleet;
  }

  static Ship fromJson(
    Map<String, dynamic> json, {
    bool isCurrent = false,
    Map<String, dynamic> detail = const <String, dynamic>{},
  }) {
    final Map<String, dynamic> source = detail.isEmpty ? json : detail;
    final Map<String, dynamic> station = readMap(source['station']);
    final Map<String, dynamic> system = readMap(source['starsystem']);
    final Map<String, dynamic> health = readMap(source['health']);

    return Ship(
      id: readInt(json['id']) ?? readInt(source['id']) ?? -1,
      symbol: readString(source['name']) ?? readString(json['name']) ?? '',
      name: readString(source['shipName']) ?? readString(json['shipName']),
      ident: readString(source['shipID']) ?? readString(json['shipID']),
      value: valueFromJson(source['value'] ?? json['value']),
      stationName: readString(station['name']),
      systemName: readString(system['name']),
      systemAddress: readInt(system['systemaddress']),
      isCurrent: isCurrent,
      alive: source['alive'] != false,
      health: health.isEmpty ? null : healthFromJson(health),
      modules: modulesFromJson(source['modules']),
      launchBays: launchBaysFromJson(source['launchBays']),
    );
  }

  static ShipValue valueFromJson(Object? value) {
    final Map<String, dynamic> map = readMap(value);
    return ShipValue(
      hullCr: readInt(map['hull']) ?? 0,
      modulesCr: readInt(map['modules']) ?? 0,
      cargoCr: readInt(map['cargo']) ?? 0,
      totalCr: readInt(map['total']) ?? 0,
      unloanedCr: readInt(map['unloaned']) ?? 0,
    );
  }

  static ShipHealth healthFromJson(Map<String, dynamic> json) => ShipHealth(
        hull: _scaled(json['hull']),
        shield: _scaled(json['shield']),
        shieldUp: json['shieldup'] != false,
        integrity: _scaled(json['integrity']),
      );

  /// `modules` is keyed by slot: the key carries the position and the size,
  /// and is the only place either is stated.
  static List<ShipModule> modulesFromJson(Object? modules) {
    final Map<String, dynamic> map = readMap(modules);
    return <ShipModule>[
      for (final MapEntry<String, dynamic> entry in map.entries)
        if (readMap(entry.value) case final Map<String, dynamic> slot)
          if (slot.isNotEmpty) moduleFromJson(entry.key, slot),
    ];
  }

  static ShipModule moduleFromJson(String slot, Map<String, dynamic> json) {
    final Map<String, dynamic> module = readMap(json['module']);
    return ShipModule(
      slot: slot,
      symbol: readString(module['name']) ?? '',
      localisedName: readString(module['locName']),
      valueCr: readInt(module['value']) ?? 0,
      health: _scaled(module['health']),
      isPowered: module['on'] != false,
      powerPriority: readInt(module['priority']),
      engineering: engineeringFromJson(json),
    );
  }

  static ModuleEngineering? engineeringFromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> engineer = readMap(json['engineer']);
    if (engineer.isEmpty) {
      return null;
    }
    return ModuleEngineering(
      engineerName: readString(engineer['engineerName']) ?? 'Inconnu',
      blueprintName: readString(engineer['recipeName']) ?? '',
      grade: readInt(engineer['recipeLevel']) ?? 0,
      engineerId: readInt(engineer['engineerId']),
      blueprintLabel: readString(engineer['recipeLocName']),
      modifiers: modifiersFromJson(json['WorkInProgress_modifications']),
      experimentalEffects: <String>[
        if (json['specialModifications'] is List<dynamic>)
          ...(json['specialModifications']! as List<dynamic>)
              .whereType<String>(),
      ],
    );
  }

  /// Despite the name, `WorkInProgress_modifications` describes the blueprint
  /// already applied, one entry per affected attribute.
  static List<ModuleModifier> modifiersFromJson(Object? value) {
    final Map<String, dynamic> map = readMap(value);
    return <ModuleModifier>[
      for (final MapEntry<String, dynamic> entry in map.entries)
        if (readMap(entry.value) case final Map<String, dynamic> modifier)
          if (modifier.isNotEmpty)
            ModuleModifier(
              label: readString(modifier['locName']) ?? entry.key,
              displayValue: readString(modifier['displayValue']) ?? '',
              isImprovement: modifier['LessIsGood'] is bool
                  ? !(modifier['LessIsGood']! as bool)
                  : null,
            ),
    ];
  }

  /// Two levels deep: bay slot, then sub-slot, because a bay holds two.
  static List<LaunchBayVehicle> launchBaysFromJson(Object? value) {
    final Map<String, dynamic> bays = readMap(value);
    return <LaunchBayVehicle>[
      for (final dynamic bay in bays.values)
        for (final dynamic vehicle in readMap(bay).values)
          if (readMap(vehicle) case final Map<String, dynamic> entry)
            if (entry.isNotEmpty)
              LaunchBayVehicle(
                symbol: readString(entry['name']) ?? '',
                localisedName: readString(entry['locName']),
                rebuilds: readInt(entry['rebuilds']) ?? 0,
                loadoutName: VehicleNames.resolveLoadout(
                  readString(entry['loadout']),
                  locName: readString(entry['loadoutName']),
                ),
              ),
    ];
  }

  static double _scaled(Object? value) {
    final int? raw = readInt(value);
    return raw == null ? 0 : (raw / healthScale).clamp(0.0, 1.0);
  }
}
