import 'package:equatable/equatable.dart';

/// One organism the commander has interacted with, from first sample to sale.
///
/// The identity of a record is `(speciesId, bodyName)`: the game allows a
/// species to be sold once per body, forever. That rule drives the whole
/// "never plan a return trip" advice, so it is modelled explicitly.
class SampleRecord extends Equatable {
  const SampleRecord({
    required this.speciesId,
    required this.speciesName,
    required this.genusId,
    required this.bodyName,
    required this.systemName,
    this.samplesTaken = 0,
    this.variantName,
    this.estimatedValueCr,
    this.soldAt,
    this.soldValueCr,
    this.firstLogged = false,
    this.firstFootfall = false,
    this.scannedAt,
  });

  final String speciesId;
  final String speciesName;
  final String genusId;
  final String bodyName;
  final String systemName;

  /// 0 → 3. Three samples complete an organism.
  final int samplesTaken;

  final String? variantName;

  /// What the species is worth according to the catalogue, known as soon as it
  /// is identified. This is what a death would cost.
  final int? estimatedValueCr;

  /// Non-null once the data has been sold at Vista Genomics.
  final DateTime? soldAt;

  /// Credits actually received, bonuses included. Only known after the sale.
  final int? soldValueCr;

  /// First commander to sell this species from this body: ×5 payout.
  final bool firstLogged;

  /// First commander to set foot on the body. Cosmetic — it writes a name on
  /// the system map and pays nothing. Tracked because commanders care, and
  /// because it correlates almost perfectly with [firstLogged].
  final bool firstFootfall;
  final DateTime? scannedAt;

  /// Stable identity of "this species on this body".
  String get key => '$speciesId@$bodyName';

  bool get isComplete => samplesTaken >= 3;

  bool get isSold => soldAt != null;

  /// Complete but not yet sold — data at risk if the ship or the Nomad is lost.
  bool get isAtRisk => isComplete && !isSold;

  SampleRecord copyWith({
    int? samplesTaken,
    String? variantName,
    int? estimatedValueCr,
    DateTime? soldAt,
    int? soldValueCr,
    bool? firstLogged,
    bool? firstFootfall,
    DateTime? scannedAt,
  }) {
    return SampleRecord(
      speciesId: speciesId,
      speciesName: speciesName,
      genusId: genusId,
      bodyName: bodyName,
      systemName: systemName,
      samplesTaken: samplesTaken ?? this.samplesTaken,
      variantName: variantName ?? this.variantName,
      estimatedValueCr: estimatedValueCr ?? this.estimatedValueCr,
      soldAt: soldAt ?? this.soldAt,
      soldValueCr: soldValueCr ?? this.soldValueCr,
      firstLogged: firstLogged ?? this.firstLogged,
      firstFootfall: firstFootfall ?? this.firstFootfall,
      scannedAt: scannedAt ?? this.scannedAt,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        speciesId,
        bodyName,
        systemName,
        samplesTaken,
        variantName,
        estimatedValueCr,
        soldAt,
        soldValueCr,
        firstLogged,
        firstFootfall,
      ];
}
