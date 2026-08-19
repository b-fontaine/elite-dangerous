import 'package:equatable/equatable.dart';

import 'atmosphere_type.dart';
import 'planet_class.dart';
import 'star_class.dart';
import 'volcanism_type.dart';

/// Everything the FSS/DSS tells you about a body, in the shape the species
/// matcher needs.
///
/// Built either from a Journal `Scan` event or typed in by hand from the
/// system map, so every field beyond the name is nullable: the matcher degrades
/// gracefully instead of demanding a complete survey.
class BodyProfile extends Equatable {
  const BodyProfile({
    required this.name,
    this.systemName,
    this.planetClass = PlanetClass.unknown,
    this.atmosphere = AtmosphereType.unknown,
    this.surfaceTemperatureK,
    this.surfaceGravityG,
    this.volcanism = VolcanismType.unknown,
    this.distanceFromArrivalLs,
    this.parentStarClass = StarClass.unknown,
    this.biologicalSignalCount,
    this.landable = true,
    this.nearNebula = false,
  });

  final String name;
  final String? systemName;
  final PlanetClass planetClass;
  final AtmosphereType atmosphere;

  /// Surface temperature in Kelvin.
  final double? surfaceTemperatureK;

  /// Surface gravity in g (the Journal reports m/s²; convert on the way in).
  final double? surfaceGravityG;

  final VolcanismType volcanism;

  /// Distance from the arrival star, in light-seconds.
  final double? distanceFromArrivalLs;

  final StarClass parentStarClass;

  /// Number of biological signals reported by the FSS. `1` on a hot HMC world
  /// is the classic Stratum Tectonicas tell.
  final int? biologicalSignalCount;

  final bool landable;
  final bool nearNebula;

  /// The heuristic every guide repeats: high metal content + exactly one
  /// biological signal + above 165 K very likely means Stratum Tectonicas.
  bool get matchesStratumTectonicasHeuristic =>
      planetClass == PlanetClass.highMetalContentBody &&
      biologicalSignalCount == 1 &&
      (surfaceTemperatureK ?? 0) > 165;

  /// Supercruise cost warning threshold used by the guides.
  bool get isFarFromStar => (distanceFromArrivalLs ?? 0) > 1500;

  BodyProfile copyWith({
    String? name,
    String? systemName,
    PlanetClass? planetClass,
    AtmosphereType? atmosphere,
    double? surfaceTemperatureK,
    double? surfaceGravityG,
    VolcanismType? volcanism,
    double? distanceFromArrivalLs,
    StarClass? parentStarClass,
    int? biologicalSignalCount,
    bool? landable,
    bool? nearNebula,
  }) {
    return BodyProfile(
      name: name ?? this.name,
      systemName: systemName ?? this.systemName,
      planetClass: planetClass ?? this.planetClass,
      atmosphere: atmosphere ?? this.atmosphere,
      surfaceTemperatureK: surfaceTemperatureK ?? this.surfaceTemperatureK,
      surfaceGravityG: surfaceGravityG ?? this.surfaceGravityG,
      volcanism: volcanism ?? this.volcanism,
      distanceFromArrivalLs:
          distanceFromArrivalLs ?? this.distanceFromArrivalLs,
      parentStarClass: parentStarClass ?? this.parentStarClass,
      biologicalSignalCount:
          biologicalSignalCount ?? this.biologicalSignalCount,
      landable: landable ?? this.landable,
      nearNebula: nearNebula ?? this.nearNebula,
    );
  }

  /// Surface gravity in g from the Journal's m/s² value.
  static double gravityFromMetersPerSecondSquared(double value) =>
      value / 9.80665;

  @override
  List<Object?> get props => <Object?>[
        name,
        systemName,
        planetClass,
        atmosphere,
        surfaceTemperatureK,
        surfaceGravityG,
        volcanism,
        distanceFromArrivalLs,
        parentStarClass,
        biologicalSignalCount,
        landable,
        nearNebula,
      ];
}
