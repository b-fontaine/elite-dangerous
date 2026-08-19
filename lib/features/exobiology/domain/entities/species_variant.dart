import 'package:equatable/equatable.dart';

import 'star_class.dart';

/// A colour variant of a species.
///
/// For most genera the colour is a pure function of the parent star's class;
/// `Bacterium` is the exception — its colour is keyed to the material the body
/// carries. Colour matters because the codex tracks variants separately.
class SpeciesVariant extends Equatable {
  const SpeciesVariant({
    required this.name,
    required this.colour,
    this.starClasses = const <StarClass>{},
    this.material,
  });

  /// Full variant name, e.g. `Stratum Tectonicas - Green`.
  final String name;

  /// Human colour label, e.g. `Vert émeraude`.
  final String colour;

  /// Parent star classes that produce this colour.
  final Set<StarClass> starClasses;

  /// Material that produces this colour (Bacterium only).
  final String? material;

  @override
  List<Object?> get props => <Object?>[name, colour, starClasses, material];
}
