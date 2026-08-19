part of 'species_finder_bloc.dart';

class SpeciesFinderState extends Equatable {
  const SpeciesFinderState({
    this.body = const BodyProfile(name: ''),
    this.matches = const <SpeciesMatch>[],
    this.catalog = const ExobiologyCatalog.empty(),
    this.estimatedValueCr = 0,
    this.isLoading = false,
    this.failure,
  });

  final BodyProfile body;
  final List<SpeciesMatch> matches;
  final ExobiologyCatalog catalog;

  /// Sum of the most likely candidates, capped by the number of biological
  /// signals the FSS reported.
  final int estimatedValueCr;

  final bool isLoading;
  final Failure? failure;

  List<SpeciesMatch> get probable => matches
      .where((SpeciesMatch m) => m.confidence == MatchConfidence.probable)
      .toList(growable: false);

  List<SpeciesMatch> get possible => matches
      .where((SpeciesMatch m) => m.confidence == MatchConfidence.possible)
      .toList(growable: false);

  bool get hasSurvey =>
      body.planetClass.code != 'unknown' ||
      body.atmosphere.code != 'unknown' ||
      body.surfaceTemperatureK != null ||
      body.surfaceGravityG != null;

  SpeciesFinderState copyWith({
    BodyProfile? body,
    List<SpeciesMatch>? matches,
    ExobiologyCatalog? catalog,
    int? estimatedValueCr,
    bool? isLoading,
    Failure? failure,
    bool clearFailure = false,
  }) {
    return SpeciesFinderState(
      body: body ?? this.body,
      matches: matches ?? this.matches,
      catalog: catalog ?? this.catalog,
      estimatedValueCr: estimatedValueCr ?? this.estimatedValueCr,
      isLoading: isLoading ?? this.isLoading,
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }

  @override
  List<Object?> get props => <Object?>[
        body,
        matches,
        estimatedValueCr,
        isLoading,
        failure,
      ];
}
