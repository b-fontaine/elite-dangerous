part of 'species_catalog_bloc.dart';

enum SpeciesSort {
  value('Valeur'),
  name('Nom'),
  genus('Genre');

  const SpeciesSort(this.label);

  final String label;
}

sealed class SpeciesCatalogState extends Equatable {
  const SpeciesCatalogState();

  @override
  List<Object?> get props => const <Object?>[];
}

final class SpeciesCatalogInitial extends SpeciesCatalogState {
  const SpeciesCatalogInitial();
}

final class SpeciesCatalogLoading extends SpeciesCatalogState {
  const SpeciesCatalogLoading();
}

final class SpeciesCatalogReady extends SpeciesCatalogState {
  const SpeciesCatalogReady({
    required this.catalog,
    this.query = '',
    this.sort = SpeciesSort.value,
    this.highValueOnly = false,
  });

  final ExobiologyCatalog catalog;
  final String query;
  final SpeciesSort sort;
  final bool highValueOnly;

  /// The filtered, sorted list the page renders.
  List<OrganicSpecies> get species {
    final String needle = query.trim().toLowerCase();
    final List<OrganicSpecies> filtered = catalog.species.where(
      (OrganicSpecies species) {
        if (highValueOnly && !species.isHighValue) {
          return false;
        }
        if (needle.isEmpty) {
          return true;
        }
        return species.name.toLowerCase().contains(needle) ||
            species.genusName.toLowerCase().contains(needle);
      },
    ).toList();

    filtered.sort(
      (OrganicSpecies a, OrganicSpecies b) => switch (sort) {
        SpeciesSort.value => b.baseValueCr.compareTo(a.baseValueCr),
        SpeciesSort.name => a.name.compareTo(b.name),
        SpeciesSort.genus => a.genusName == b.genusName
            ? b.baseValueCr.compareTo(a.baseValueCr)
            : a.genusName.compareTo(b.genusName),
      },
    );
    return List<OrganicSpecies>.unmodifiable(filtered);
  }

  Genus? genusOf(OrganicSpecies species) => catalog.genusById(species.genusId);

  SpeciesCatalogReady copyWith({
    String? query,
    SpeciesSort? sort,
    bool? highValueOnly,
  }) =>
      SpeciesCatalogReady(
        catalog: catalog,
        query: query ?? this.query,
        sort: sort ?? this.sort,
        highValueOnly: highValueOnly ?? this.highValueOnly,
      );

  @override
  List<Object?> get props => <Object?>[catalog, query, sort, highValueOnly];
}

final class SpeciesCatalogError extends SpeciesCatalogState {
  const SpeciesCatalogError(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => <Object?>[failure];
}
