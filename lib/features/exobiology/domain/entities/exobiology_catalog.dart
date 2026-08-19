import 'package:equatable/equatable.dart';

import 'genus.dart';
import 'organic_species.dart';

/// The bundled reference database of organic life.
///
/// Ships as an asset rather than being fetched: the app has no backend, and a
/// commander in deep space with a phone hotspot still needs the tables.
class ExobiologyCatalog extends Equatable {
  const ExobiologyCatalog({
    required this.genera,
    required this.species,
    this.edition = '',
    this.sources = const <String>[],
  });

  const ExobiologyCatalog.empty()
      : genera = const <Genus>[],
        species = const <OrganicSpecies>[],
        edition = '',
        sources = const <String>[];

  final List<Genus> genera;
  final List<OrganicSpecies> species;

  /// Data edition, e.g. `2026-08`, shown next to the reliability tags.
  final String edition;

  final List<String> sources;

  bool get isEmpty => species.isEmpty;

  Genus? genusById(String id) =>
      genera.where((Genus genus) => genus.id == id).firstOrNull;

  OrganicSpecies? speciesById(String id) => species
      .where((OrganicSpecies organic) => organic.id == id)
      .firstOrNull;

  List<OrganicSpecies> speciesOfGenus(String genusId) => species
      .where((OrganicSpecies organic) => organic.genusId == genusId)
      .toList(growable: false);

  /// Species worth a detour, sorted by descending payout.
  List<OrganicSpecies> get highValueSpecies {
    final List<OrganicSpecies> filtered = species
        .where((OrganicSpecies organic) => organic.isHighValue)
        .toList();
    filtered.sort(
      (OrganicSpecies a, OrganicSpecies b) =>
          b.baseValueCr.compareTo(a.baseValueCr),
    );
    return List<OrganicSpecies>.unmodifiable(filtered);
  }

  /// Colony Range of the genus a species belongs to — the number a commander
  /// actually needs in the field.
  int? colonyRangeFor(String speciesId) {
    final OrganicSpecies? organic = speciesById(speciesId);
    if (organic == null) {
      return null;
    }
    return genusById(organic.genusId)?.colonyRangeMeters;
  }

  @override
  List<Object?> get props => <Object?>[genera, species, edition];
}

extension<T> on Iterable<T> {
  T? get firstOrNull {
    final Iterator<T> iterator = this.iterator;
    return iterator.moveNext() ? iterator.current : null;
  }
}
