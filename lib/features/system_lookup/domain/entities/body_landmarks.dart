import 'package:equatable/equatable.dart';

/// One recorded position on a surface.
class SurfaceLocation extends Equatable {
  const SurfaceLocation({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => <Object?>[latitude, longitude];
}

/// One species found on a body, with every place it has been seen.
///
/// Spansh returns one landmark per sighting — 23 separate entries for the same
/// Bacterium Tela on 36 Ophiuchi C 4 — so they are folded by species here.
/// What the commander needs is "this species is down there, worth this much,
/// and here is where to look", not a list of 45 pins.
class SpeciesSighting extends Equatable {
  const SpeciesSighting({
    required this.genus,
    required this.species,
    this.variant,
    this.valueCr = 0,
    this.locations = const <SurfaceLocation>[],
  });

  /// `Bacterium`, `Stratum`… Spansh's `landmarks[].type`.
  final String genus;

  /// The full species name, e.g. `Stratum Tectonicas`. This is the name the
  /// bundled catalogue uses, so it joins straight onto it.
  final String species;

  /// The colour variant, e.g. `Lime` — which tells the commander which parent
  /// star class is involved, and nothing else.
  final String? variant;

  /// Base value in credits for one full sample, as Spansh prices it.
  final int valueCr;

  final List<SurfaceLocation> locations;

  /// How many times this species has been reported here. A high count means
  /// the body is well covered, not that there is more to sell.
  int get sightings => locations.length;

  /// The catalogue's name for the coloured variant, e.g.
  /// `Stratum Tectonicas - Lime`.
  String? get variantName => variant == null ? null : '$species - $variant';

  @override
  List<Object?> get props => <Object?>[genus, species, variant, valueCr, locations];
}

/// Everything the community has recorded on the surface of one body.
class BodyLandmarks extends Equatable {
  const BodyLandmarks({
    required this.bodyId64,
    required this.bodyName,
    required this.fetchedAt,
    this.species = const <SpeciesSighting>[],
    this.otherLandmarks = 0,
    this.signalsUpdatedAt,
    this.fromCache = false,
  });

  final int bodyId64;
  final String bodyName;

  /// When this app fetched it.
  final DateTime fetchedAt;

  /// The species found here, most valuable first.
  final List<SpeciesSighting> species;

  /// Landmarks that are not organics — surface stations, crash sites, geology.
  /// Counted rather than listed: they are not what this screen is about, but
  /// silently dropping them would make "45 landmarks" look like a wrong number
  /// next to Spansh's own page.
  final int otherLandmarks;

  /// The `signals_updated_at` observed when this was fetched. A cached entry
  /// stays good for exactly as long as this value matches what the system dump
  /// reports — that is the whole cache invalidation rule.
  final DateTime? signalsUpdatedAt;

  final bool fromCache;

  bool get isEmpty => species.isEmpty;

  /// What sampling everything down there would be worth at base rate.
  ///
  /// Base rate, First Logged excluded — the same rule the rest of the app
  /// applies, because the ×5 bonus is claimed at the sale and another
  /// commander can still take it first.
  int get totalValueCr => species.fold<int>(
        0,
        (int total, SpeciesSighting sighting) => total + sighting.valueCr,
      );

  @override
  List<Object?> get props => <Object?>[
        bodyId64,
        bodyName,
        fetchedAt,
        species,
        otherLandmarks,
        signalsUpdatedAt,
        fromCache,
      ];
}
