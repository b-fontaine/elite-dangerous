import '../../domain/entities/suit_info.dart';
import '../../domain/entities/suit_loadout.dart';
import 'json_readers.dart';

/// Reads the `loadout`, `loadouts` and `suits` blocks of `GET /profile`.
///
/// None of the three appears in any Frontier document; they are known only
/// from EDMC's source and from reading a real payload.
abstract final class SuitLoadoutDto {
  /// Slots that hold a weapon. `BaseSuit` also appears there and is a cosmetic
  /// body, not a weapon.
  static const List<String> weaponSlots = <String>[
    'PrimaryWeapon1',
    'PrimaryWeapon2',
    'SecondaryWeapon',
  ];

  static List<SuitLoadout> loadoutsFromJson(
    Object? loadouts, {
    Object? equipped,
  }) {
    final Map<String, dynamic> current = readMap(equipped);
    final int? equippedSlot = readInt(current['loadoutSlotId']);

    final List<SuitLoadout> parsed = <SuitLoadout>[
      for (final Map<String, dynamic> entry in normaliseJsonCollection(loadouts))
        fromJson(entry, isEquipped: readInt(entry['loadoutSlotId']) ==
            equippedSlot),
    ];

    // The equipped loadout is repeated at the top level in a more detailed
    // form. If it is somehow not among the saved ones, it still exists.
    if (current.isNotEmpty &&
        !parsed.any((SuitLoadout loadout) => loadout.isEquipped)) {
      parsed.add(fromJson(current, isEquipped: true));
    }
    return parsed;
  }

  static SuitLoadout fromJson(
    Map<String, dynamic> json, {
    bool isEquipped = false,
  }) {
    final Map<String, dynamic> suit = readMap(json['suit']);
    return SuitLoadout(
      slotId: readInt(json['loadoutSlotId']) ?? -1,
      name: readString(json['name']) ?? 'Sans nom',
      suit: suitFromJson(suit),
      weapons: weaponsFromJson(json['slots']),
      isEquipped: isEquipped,
    );
  }

  static SuitInfo suitFromJson(Map<String, dynamic> json) => SuitInfo.fromSymbol(
        readString(json['name']) ?? '',
        locName: readString(json['locName']),
        suitId: readInt(json['suitId']) ?? readInt(json['id']),
        modIds: <String>{
          if (json['mods'] is List<dynamic>)
            ...(json['mods']! as List<dynamic>).whereType<String>(),
        },
      );

  static List<SuitInfo> suitsFromJson(Object? suits) => <SuitInfo>[
        for (final Map<String, dynamic> entry in normaliseJsonCollection(suits))
          suitFromJson(entry),
      ];

  static List<WeaponInfo> weaponsFromJson(Object? slots) {
    final Map<String, dynamic> map = readMap(slots);
    return <WeaponInfo>[
      for (final String slot in weaponSlots)
        if (readMap(map[slot]) case final Map<String, dynamic> weapon)
          if (weapon.isNotEmpty)
            WeaponInfo(
              slot: slot,
              symbol: readString(weapon['name']) ?? '',
              localisedName: prettyLocalised(readString(weapon['locName'])),
              weaponRackId: readInt(weapon['weaponrackId']),
              valueCr: readInt(weapon['value']),
            ),
    ];
  }
}
