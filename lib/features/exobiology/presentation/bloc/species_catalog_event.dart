part of 'species_catalog_bloc.dart';

sealed class SpeciesCatalogEvent extends Equatable {
  const SpeciesCatalogEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

final class SpeciesCatalogRequested extends SpeciesCatalogEvent {
  const SpeciesCatalogRequested();
}

final class SpeciesCatalogQueryChanged extends SpeciesCatalogEvent {
  const SpeciesCatalogQueryChanged(this.query);

  final String query;

  @override
  List<Object?> get props => <Object?>[query];
}

final class SpeciesCatalogSortChanged extends SpeciesCatalogEvent {
  const SpeciesCatalogSortChanged(this.sort);

  final SpeciesSort sort;

  @override
  List<Object?> get props => <Object?>[sort];
}

/// Hides everything below the 16 M Cr Expressway cut-off.
final class SpeciesCatalogHighValueToggled extends SpeciesCatalogEvent {
  const SpeciesCatalogHighValueToggled(this.enabled);

  final bool enabled;

  @override
  List<Object?> get props => <Object?>[enabled];
}
