import 'package:equatable/equatable.dart';

/// The engineering applied to one module.
///
/// Frontier reports the blueprint and its grade, and separately the effect on
/// each attribute under `WorkInProgress_modifications` — a name that is
/// misleading: the block describes the modification *in place*, not one being
/// worked on.
class ModuleEngineering extends Equatable {
  const ModuleEngineering({
    required this.engineerName,
    required this.blueprintName,
    required this.grade,
    this.engineerId,
    this.blueprintLabel,
    this.modifiers = const <ModuleModifier>[],
    this.experimentalEffects = const <String>[],
  });

  final String engineerName;

  /// Non-localised blueprint symbol, e.g. `FSD_LongRange`.
  final String blueprintName;

  /// 1 to 5.
  final int grade;

  final int? engineerId;

  /// Localised blueprint name, when Frontier sent one.
  final String? blueprintLabel;

  final List<ModuleModifier> modifiers;

  /// Experimental effects, `specialModifications` in the payload.
  final List<String> experimentalEffects;

  String get displayName => blueprintLabel ?? blueprintName;

  @override
  List<Object?> get props =>
      <Object?>[engineerName, blueprintName, grade, modifiers];
}

/// One attribute changed by a blueprint.
class ModuleModifier extends Equatable {
  const ModuleModifier({
    required this.label,
    required this.displayValue,
    this.isImprovement,
  });

  /// Localised attribute name, e.g. `Optimised mass`.
  final String label;

  /// Already formatted by Frontier, e.g. `+5.00%`.
  final String displayValue;

  /// `null` when the payload does not say whether the change is good.
  final bool? isImprovement;

  @override
  List<Object?> get props => <Object?>[label, displayValue, isImprovement];
}

/// One fitted module of a ship.
class ShipModule extends Equatable {
  const ShipModule({
    required this.slot,
    required this.symbol,
    this.localisedName,
    this.valueCr = 0,
    this.health = 1,
    this.isPowered = true,
    this.powerPriority,
    this.engineering,
  });

  /// The slot it occupies, e.g. `FrameShiftDrive`, `Slot01_Size7`.
  final String slot;

  /// FDev symbol, e.g. `Int_Hyperdrive_Overcharge_Size8_Class5`.
  final String symbol;

  final String? localisedName;
  final int valueCr;

  /// 0.0 to 1.0. Frontier reports it out of 1 000 000.
  final double health;

  final bool isPowered;
  final int? powerPriority;
  final ModuleEngineering? engineering;

  bool get isEngineered => engineering != null;

  /// Paint, decals, nameplates, ship kits and the COVAS voice pack.
  ///
  /// Frontier files them under `modules` like any other fitting, and they are
  /// a third of the list on a decorated ship — a fitting screen that does not
  /// filter them buries the hardware under cosmetics.
  bool get isCosmetic => isCosmeticSlot(slot);

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

  static bool isCosmeticSlot(String slot) =>
      cosmeticSlotPrefixes.any((String prefix) => slot.startsWith(prefix));

  /// A readable name, falling back to the symbol when Frontier sent a raw
  /// localisation key instead of a translation.
  String get displayName {
    final String? localised = localisedName;
    if (localised == null || localised.isEmpty) {
      return symbol;
    }
    // `PaintJob_Explorer_NX_02_10_Name` is a key, not a name.
    return localised.endsWith('_Name') || localised.endsWith('_Info')
        ? symbol
        : localised;
  }

  @override
  List<Object?> get props => <Object?>[slot, symbol, health, engineering];
}
