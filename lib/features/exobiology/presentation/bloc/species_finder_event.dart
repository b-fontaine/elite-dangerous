part of 'species_finder_bloc.dart';

sealed class SpeciesFinderEvent extends Equatable {
  const SpeciesFinderEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

final class SpeciesFinderStarted extends SpeciesFinderEvent {
  const SpeciesFinderStarted();
}

/// One field of the survey changed.
final class SpeciesFinderBodyChanged extends SpeciesFinderEvent {
  const SpeciesFinderBodyChanged(this.body);

  final BodyProfile body;

  @override
  List<Object?> get props => <Object?>[body];
}

final class SpeciesFinderReset extends SpeciesFinderEvent {
  const SpeciesFinderReset();
}
