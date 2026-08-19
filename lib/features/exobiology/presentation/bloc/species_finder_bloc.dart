import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/body_profile.dart';
import '../../domain/entities/exobiology_catalog.dart';
import '../../domain/entities/species_match.dart';
import '../../domain/services/species_matcher.dart';
import '../../domain/usecases/exobiology_usecases.dart';

part 'species_finder_event.dart';
part 'species_finder_state.dart';

/// Drives the "what grows here?" screen.
///
/// Every edit re-runs the matcher: the commander is typing what the FSS shows
/// them, field by field, and needs to watch the candidate list narrow as the
/// survey fills in.
@injectable
class SpeciesFinderBloc extends Bloc<SpeciesFinderEvent, SpeciesFinderState> {
  SpeciesFinderBloc(this._identify, this._catalog, this._matcher)
      : super(const SpeciesFinderState()) {
    on<SpeciesFinderStarted>(_onStarted);
    on<SpeciesFinderBodyChanged>(_onBodyChanged);
    on<SpeciesFinderReset>(_onReset);
  }

  final IdentifySpeciesForBody _identify;
  final GetExobiologyCatalog _catalog;
  final SpeciesMatcher _matcher;

  Future<void> _onStarted(
    SpeciesFinderStarted event,
    Emitter<SpeciesFinderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final Result<ExobiologyCatalog> catalog =
        await _catalog(const NoParams());
    emit(
      catalog.fold(
        onSuccess: (ExobiologyCatalog value) =>
            state.copyWith(isLoading: false, catalog: value),
        onFailure: (Failure failure) =>
            state.copyWith(isLoading: false, failure: failure),
      ),
    );
    add(SpeciesFinderBodyChanged(state.body));
  }

  Future<void> _onBodyChanged(
    SpeciesFinderBodyChanged event,
    Emitter<SpeciesFinderState> emit,
  ) async {
    final Result<List<SpeciesMatch>> matches = await _identify(event.body);
    emit(
      matches.fold(
        onSuccess: (List<SpeciesMatch> value) => state.copyWith(
          body: event.body,
          matches: value,
          estimatedValueCr: _matcher.estimatedBodyValueCr(
            value,
            signalCount: event.body.biologicalSignalCount,
          ),
          clearFailure: true,
        ),
        onFailure: (Failure failure) =>
            state.copyWith(body: event.body, failure: failure),
      ),
    );
  }

  Future<void> _onReset(
    SpeciesFinderReset event,
    Emitter<SpeciesFinderState> emit,
  ) async {
    emit(state.copyWith(body: const BodyProfile(name: ''), clearFailure: true));
    add(SpeciesFinderBodyChanged(state.body));
  }
}
