import 'package:equatable/equatable.dart';

import 'ship_module.dart';

/// The four groups the outfitting screen uses.
enum ModuleSlotCategory {
  hardpoint('Points d\'emport', 'Armes'),
  utility('Points utilitaires', 'Modules de faible encombrement'),
  coreInternal('Modules internes principaux', 'Obligatoires, jamais vides'),
  optionalInternal('Modules internes optionnels', 'Soute, scanners, hangars');

  const ModuleSlotCategory(this.label, this.description);

  final String label;
  final String description;
}

/// One position on a ship, filled or not.
///
/// Frontier only ever sends the slots that hold something. An empty slot is
/// therefore an *absence* in the payload, and the only way to notice one is to
/// see a gap in the numbering — `Slot05` and `Slot08` present, `Slot06` and
/// `Slot07` missing. That works between two filled slots and nowhere else:
/// slots past the last filled one leave no trace at all, and without a table
/// of every ship's layout there is nothing to compare against.
class ModuleSlot extends Equatable {
  const ModuleSlot({
    required this.name,
    required this.category,
    this.module,
    this.size,
    this.sizeIsBounded = false,
  });

  final String name;
  final ModuleSlotCategory category;

  /// `null` for an empty slot.
  final ShipModule? module;

  /// Slot size, when it can be known.
  ///
  /// For a filled optional internal it is stated in the slot name
  /// (`Slot01_Size7`). For an empty one it is interpolated from its neighbours
  /// and [sizeIsBounded] is set — the app knows the slot is *at most* this
  /// size, never exactly.
  final int? size;

  final bool sizeIsBounded;

  bool get isEmpty => module == null;

  /// Position within its category, from the trailing digits of the name.
  int get index => int.tryParse(
        RegExp(r'([0-9]+)$').firstMatch(_indexPart) ?.group(1) ?? '',
      ) ??
      0;

  String get _indexPart =>
      name.contains('_') ? name.split('_').first : name;

  @override
  List<Object?> get props => <Object?>[name, category, module, size];
}

/// Sorts a ship's modules into categories and finds the gaps between them.
abstract final class ModuleSlotLayout {
  /// Core slots, in the order the outfitting screen lists them. They are
  /// always present and can never be empty, so they need no gap detection.
  static const List<String> coreSlots = <String>[
    'PowerPlant',
    'MainEngines',
    'FrameShiftDrive',
    'LifeSupport',
    'PowerDistributor',
    'Radar',
    'FuelTank',
    'Armour',
    'PlanetaryApproachSuite',
  ];

  static ModuleSlotCategory categoryOf(String slot) {
    // Order matters: `TinyHardpoint` also contains "Hardpoint".
    if (slot.startsWith('TinyHardpoint')) {
      return ModuleSlotCategory.utility;
    }
    if (slot.contains('Hardpoint')) {
      return ModuleSlotCategory.hardpoint;
    }
    if (coreSlots.contains(slot)) {
      return ModuleSlotCategory.coreInternal;
    }
    return ModuleSlotCategory.optionalInternal;
  }

  /// Size declared in an optional internal's name, e.g. `Slot01_Size7` → 7.
  static int? declaredSize(String slot) {
    final RegExpMatch? match =
        RegExp(r'_Size([0-9]+)$', caseSensitive: false).firstMatch(slot);
    return match == null ? null : int.tryParse(match.group(1)!);
  }

  /// Every slot of [category], filled ones from [modules] and empty ones
  /// inferred from the gaps between them.
  static List<ModuleSlot> slotsFor(
    ModuleSlotCategory category,
    List<ShipModule> modules,
  ) {
    final List<ShipModule> mine = modules
        .where((ShipModule module) => categoryOf(module.slot) == category)
        .toList(growable: false);

    if (category == ModuleSlotCategory.coreInternal) {
      // Listed in the game's own order rather than alphabetically, and never
      // padded: a core slot cannot be empty.
      final Map<String, ShipModule> bySlot = <String, ShipModule>{
        for (final ShipModule module in mine) module.slot: module,
      };
      return <ModuleSlot>[
        for (final String slot in coreSlots)
          if (bySlot[slot] case final ShipModule module)
            ModuleSlot(
              name: slot,
              category: category,
              module: module,
            ),
      ];
    }

    final List<ModuleSlot> filled = <ModuleSlot>[
      for (final ShipModule module in mine)
        ModuleSlot(
          name: module.slot,
          category: category,
          module: module,
          size: declaredSize(module.slot),
        ),
    ]..sort((ModuleSlot a, ModuleSlot b) => a.index.compareTo(b.index));

    return _withGaps(filled, category);
  }

  /// Inserts an empty slot for every missing index between two filled ones.
  static List<ModuleSlot> _withGaps(
    List<ModuleSlot> filled,
    ModuleSlotCategory category,
  ) {
    if (filled.length < 2) {
      return filled;
    }

    final List<ModuleSlot> result = <ModuleSlot>[];
    for (int i = 0; i < filled.length; i++) {
      result.add(filled[i]);
      if (i == filled.length - 1) {
        break;
      }
      final int from = filled[i].index;
      final int to = filled[i + 1].index;
      // The next slot down is no larger than the one above it: Frontier lists
      // optional internals in descending size, so the upper neighbour bounds
      // the gap. Nothing states the exact size, hence `sizeIsBounded`.
      final int? bound = filled[i].size;

      for (int missing = from + 1; missing < to; missing++) {
        result.add(
          ModuleSlot(
            name: _nameFor(category, missing),
            category: category,
            size: bound,
            sizeIsBounded: bound != null,
          ),
        );
      }
    }
    return result;
  }

  static String _nameFor(ModuleSlotCategory category, int index) =>
      switch (category) {
        ModuleSlotCategory.utility => 'TinyHardpoint$index',
        ModuleSlotCategory.optionalInternal =>
          'Slot${index.toString().padLeft(2, '0')}',
        _ => 'Hardpoint$index',
      };
}
