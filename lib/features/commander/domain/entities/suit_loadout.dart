import 'package:equatable/equatable.dart';

import 'suit_info.dart';

/// A weapon in an on-foot loadout.
///
/// Carries no grade, and that is not an omission here. A real `/profile` was
/// checked: eleven equipped weapons across five loadouts, and not one carried
/// the `class` field the CAPI is reputed to expose. Frontier does send a
/// `modifications` list — containing the single string `NYI`, its own marker
/// for "not yet implemented". Modelling a grade would mean inventing one.
class WeaponInfo extends Equatable {
  const WeaponInfo({
    required this.slot,
    required this.symbol,
    this.localisedName,
    this.weaponRackId,
    this.valueCr,
  });

  /// `PrimaryWeapon1`, `PrimaryWeapon2` or `SecondaryWeapon`.
  final String slot;

  /// FDev symbol, e.g. `Wpn_M_Sniper_Plasma_Charged`.
  final String symbol;

  /// Frontier localises these properly, unlike suit names.
  final String? localisedName;

  final int? weaponRackId;

  /// Only present on the equipped loadout, which Frontier details further.
  final int? valueCr;

  String get displayName =>
      localisedName == null || localisedName!.isEmpty ? symbol : localisedName!;

  /// Where it sits in the reading order the game uses.
  int get slotOrder => switch (slot) {
        'PrimaryWeapon1' => 0,
        'PrimaryWeapon2' => 1,
        'SecondaryWeapon' => 2,
        _ => 3,
      };

  @override
  List<Object?> get props => <Object?>[slot, symbol, weaponRackId];
}

/// A saved on-foot loadout: a suit and the weapons on it.
class SuitLoadout extends Equatable {
  const SuitLoadout({
    required this.slotId,
    required this.name,
    required this.suit,
    this.weapons = const <WeaponInfo>[],
    this.isEquipped = false,
  });

  final int slotId;

  /// What the commander called it, e.g. `EXPLORATEUR`.
  final String name;

  final SuitInfo suit;

  final List<WeaponInfo> weapons;
  final bool isEquipped;

  /// Weapons in the game's own slot order.
  List<WeaponInfo> get orderedWeapons =>
      <WeaponInfo>[...weapons]..sort(
          (WeaponInfo a, WeaponInfo b) => a.slotOrder.compareTo(b.slotOrder),
        );

  bool get isForExobiology => suit.isArtemis;

  @override
  List<Object?> get props => <Object?>[slotId, name, suit, weapons, isEquipped];
}
