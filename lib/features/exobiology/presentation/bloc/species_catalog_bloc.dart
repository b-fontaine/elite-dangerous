import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/exobiology_catalog.dart';
import '../../domain/entities/genus.dart';
import '../../domain/entities/organic_species.dart';
import '../../domain/usecases/exobiology_usecases.dart';

part 'species_catalog_event.dart';
part 'species_catalog_state.dart';

/// Browses the 118 organics: the reference table an exobiologist keeps open.
@injectable
class SpeciesCatalogBloc
    extends Bloc<SpeciesCatalogEvent, SpeciesCatalogState> {
  SpeciesCatalogBloc(this._getCatalog) : super(const SpeciesCatalogInitial()) {
    on<SpeciesCatalogRequested>(_onRequested);
    on<SpeciesCatalogQueryChanged>(_onQueryChanged);
    on<SpeciesCatalogSortChanged>(_onSortChanged);
    on<SpeciesCatalogHighValueToggled>(_onHighValueToggled);
  }

  final GetExobiologyCatalog _getCatalog;

  Future<void> _onRequested(
    SpeciesCatalogRequested event,
    Emitter<SpeciesCatalogState> emit,
  ) async {
    emit(const SpeciesCatalogLoading());
    final Result<ExobiologyCatalog> result = await _getCatalog(const NoParams());
    emit(
      result.fold(
        onSuccess: (ExobiologyCatalog catalog) =>
            SpeciesCatalogReady(catalog: catalog),
        onFailure: SpeciesCatalogError.new,
      ),
    );
  }

  void _onQueryChanged(
    SpeciesCatalogQueryChanged event,
    Emitter<SpeciesCatalogState> emit,
  ) {
    if (state case final SpeciesCatalogReady ready) {
      emit(ready.copyWith(query: event.query));
    }
  }

  void _onSortChanged(
    SpeciesCatalogSortChanged event,
    Emitter<SpeciesCatalogState> emit,
  ) {
    if (state case final SpeciesCatalogReady ready) {
      emit(ready.copyWith(sort: event.sort));
    }
  }

  void _onHighValueToggled(
    SpeciesCatalogHighValueToggled event,
    Emitter<SpeciesCatalogState> emit,
  ) {
    if (state case final SpeciesCatalogReady ready) {
      emit(ready.copyWith(highValueOnly: event.enabled));
    }
  }
}
