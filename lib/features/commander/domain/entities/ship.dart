import 'package:equatable/equatable.dart';

import 'ship_module.dart';
import 'vehicle_names.dart';

/// Condition of a ship, as `/profile` reports it.
class ShipHealth extends Equatable {
  const ShipHealth({
    this.hull = 1,
    this.shield = 1,
    this.shieldUp = true,
    this.integrity = 0,
  });

  /// All 0.0 to 1.0; Frontier scales them out of 1 000 000.
  final double hull;
  final double shield;
  final bool shieldUp;
  final double integrity;

  @override
  List<Object?> get props => <Object?>[hull, shield, shieldUp, integrity];
}

/// A vehicle in a launch bay: an SRV, or a ship-launched fighter.
class LaunchBayVehicle extends Equatable {
  const LaunchBayVehicle({
    required this.symbol,
    this.localisedName,
    this.rebuilds = 0,
    this.loadoutName,
  });

  final String symbol;
  final String? localisedName;

  /// Spares left in the bay.
  final int rebuilds;

  final String? loadoutName;

  /// A planetary vehicle rather than a hangar-launched one. The Nomad is
  /// neither: it flies from a Vessel Hangar, so it does not answer here.
  bool get isSrv => symbol == 'testbuggy' || symbol.contains('srv');

  String get displayName =>
      VehicleNames.resolve(symbol, locName: localisedName);

  @override
  List<Object?> get props => <Object?>[symbol, rebuilds, loadoutName];
}

/// What a ship is worth, split the way the insurance is computed.
class ShipValue extends Equatable {
  const ShipValue({
    this.hullCr = 0,
    this.modulesCr = 0,
    this.cargoCr = 0,
    this.totalCr = 0,
    this.unloanedCr = 0,
  });

  final int hullCr;
  final int modulesCr;
  final int cargoCr;
  final int totalCr;
  final int unloanedCr;

  /// The rebuy is 5 % of hull plus modules; cargo is not insured.
  static const double rebuyRate = 0.05;

  /// Estimated rebuy, or `null` when it cannot be trusted.
  ///
  /// Frontier reports `hull: 0` for the hulls it has no purchase price for —
  /// observed on every recent ship. Deriving a rebuy from that returns a
  /// figure an order of magnitude under the truth, and a wrong number about
  /// the cost of dying is worse than no number: the exact one is in the
  /// journal's `Loadout` event, as `Rebuy`.
  int? get estimatedRebuyCr => hullCr <= 0
      ? null
      : ((hullCr + modulesCr) * rebuyRate).round();

  bool get isHullPriceMissing => hullCr <= 0 && modulesCr > 0;

  @override
  List<Object?> get props =>
      <Object?>[hullCr, modulesCr, cargoCr, totalCr, unloanedCr];
}

/// A ship the commander owns.
///
/// Only the ship being flown carries [modules], [health] and [launchBays]:
/// verified against a real `/profile`, where none of the seven stored ships
/// had a `modules` block. The community CAPI reference claims otherwise, and
/// building a fleet screen on that claim would have produced empty panels.
class Ship extends Equatable {
  const Ship({
    required this.id,
    required this.symbol,
    this.name,
    this.ident,
    this.value = const ShipValue(),
    this.stationName,
    this.systemName,
    this.systemAddress,
    this.isCurrent = false,
    this.alive = true,
    this.health,
    this.modules = const <ShipModule>[],
    this.launchBays = const <LaunchBayVehicle>[],
  });

  final int id;

  /// FDev symbol, e.g. `Explorer_NX` — the Mandalay.
  final String symbol;

  /// The name the commander gave it.
  final String? name;

  /// The registration, e.g. `TAI-CE`.
  final String? ident;

  final ShipValue value;

  /// Where it is parked. Absent for the ship in flight.
  final String? stationName;
  final String? systemName;
  final int? systemAddress;

  final bool isCurrent;
  final bool alive;

  /// Only ever present on the ship being flown.
  final ShipHealth? health;
  final List<ShipModule> modules;
  final List<LaunchBayVehicle> launchBays;

  /// Modules minus the paint and the decals.
  List<ShipModule> get functionalModules => modules
      .where((ShipModule module) => !module.isCosmetic)
      .toList(growable: false);

  List<ShipModule> get engineeredModules => modules
      .where((ShipModule module) => module.isEngineered)
      .toList(growable: false);

  /// `true` when the payload told us nothing about the fitting — which is the
  /// normal case for every ship except the one being flown.
  bool get hasFitting => modules.isNotEmpty;

  bool get hasSrv => launchBays.any((LaunchBayVehicle bay) => bay.isSrv);

  String get displayName => name == null || name!.isEmpty ? symbol : name!;

  @override
  List<Object?> get props =>
      <Object?>[id, symbol, name, value, stationName, systemName, isCurrent];
}
