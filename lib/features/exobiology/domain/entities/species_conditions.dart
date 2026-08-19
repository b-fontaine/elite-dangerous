import 'package:equatable/equatable.dart';

import 'atmosphere_type.dart';
import 'planet_class.dart';
import 'volcanism_type.dart';

/// The environmental envelope in which a species can spawn.
///
/// Every field is optional: an empty collection or a `null` bound means "this
/// criterion does not constrain the species". That is deliberate — the
/// community data is incomplete for several genera, and modelling "unknown" as
/// "unconstrained" keeps the matcher honest instead of inventing limits.
class SpeciesConditions extends Equatable {
  const SpeciesConditions({
    this.planetClasses = const <PlanetClass>{},
    this.atmospheres = const <AtmosphereType>{},
    this.minTemperatureK,
    this.maxTemperatureK,
    this.maxGravityG,
    this.minGravityG,
    this.volcanism = const <VolcanismType>{},
    this.minDistanceFromArrivalLs,
    this.requiresNebula = false,
    this.notes,
  });

  final Set<PlanetClass> planetClasses;
  final Set<AtmosphereType> atmospheres;

  /// Surface temperature bounds, in Kelvin.
  final double? minTemperatureK;
  final double? maxTemperatureK;

  /// Surface gravity bounds, in g.
  final double? maxGravityG;
  final double? minGravityG;

  /// Required surface volcanism, if any.
  final Set<VolcanismType> volcanism;

  /// Minimum distance from the arrival star, in light-seconds
  /// (`Clypeus Speculumi` needs > 2500 Ls).
  final double? minDistanceFromArrivalLs;

  /// Some organics (Amphora Plant, Anemone…) only appear near a nebula.
  final bool requiresNebula;

  /// Free-form caveat shown next to the match, e.g. "terrain plat requis".
  final String? notes;

  bool get isUnconstrained =>
      planetClasses.isEmpty &&
      atmospheres.isEmpty &&
      minTemperatureK == null &&
      maxTemperatureK == null &&
      maxGravityG == null &&
      minGravityG == null &&
      volcanism.isEmpty &&
      minDistanceFromArrivalLs == null &&
      !requiresNebula;

  @override
  List<Object?> get props => <Object?>[
        planetClasses,
        atmospheres,
        minTemperatureK,
        maxTemperatureK,
        maxGravityG,
        minGravityG,
        volcanism,
        minDistanceFromArrivalLs,
        requiresNebula,
        notes,
      ];
}
