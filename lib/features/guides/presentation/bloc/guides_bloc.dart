import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/guide.dart';
import '../../domain/usecases/list_guides.dart';
import '../../domain/usecases/search_guides.dart';

part 'guides_event.dart';
part 'guides_state.dart';

@injectable
class GuidesBloc extends Bloc<GuidesEvent, GuidesState> {
  GuidesBloc(this._listGuides, this._searchGuides)
      : super(const GuidesInitial()) {
    on<GuidesRequested>(_onRequested);
    on<GuidesSearchChanged>(_onSearchChanged);
  }

  final ListGuides _listGuides;
  final SearchGuides _searchGuides;

  Future<void> _onRequested(
    GuidesRequested event,
    Emitter<GuidesState> emit,
  ) async {
    emit(const GuidesLoading());
    final Result<List<GuideSummary>> result =
        await _listGuides(const NoParams());
    emit(
      result.fold(
        onSuccess: (List<GuideSummary> guides) => GuidesReady(guides: guides),
        onFailure: GuidesError.new,
      ),
    );
  }

  Future<void> _onSearchChanged(
    GuidesSearchChanged event,
    Emitter<GuidesState> emit,
  ) async {
    final Result<List<GuideSummary>> result =
        await _searchGuides(event.query);
    emit(
      result.fold(
        onSuccess: (List<GuideSummary> guides) =>
            GuidesReady(guides: guides, query: event.query),
        onFailure: GuidesError.new,
      ),
    );
  }
}
