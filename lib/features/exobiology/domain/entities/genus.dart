import 'package:equatable/equatable.dart';

/// A genus of organic life.
///
/// The genus — not the species — carries the **Colony Range**: the minimum
/// distance the commander must walk between two samples of the same organism.
/// Getting it wrong is the single most common time sink in the field
/// ("insufficient genetic diversity").
class Genus extends Equatable {
  const Genus({
    required this.id,
    required this.name,
    required this.colonyRangeMeters,
    this.frenchName,
    this.description,
    this.sampleCount = 3,
  });

  /// Stable snake_case identifier used by the bundled catalogue.
  final String id;

  /// Canonical in-game name, e.g. `Stratum`.
  final String name;

  /// Minimum distance between two samples, in metres.
  final int colonyRangeMeters;

  final String? frenchName;
  final String? description;

  /// Number of samples needed to complete an organism. Always 3 today, but
  /// modelled explicitly so a future change is data, not code.
  final int sampleCount;

  @override
  List<Object?> get props => <Object?>[id, name, colonyRangeMeters, sampleCount];
}
