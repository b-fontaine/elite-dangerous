import '../../domain/entities/atmosphere_type.dart';
import '../../domain/entities/exobiology_catalog.dart';
import '../../domain/entities/genus.dart';
import '../../domain/entities/organic_species.dart';
import '../../domain/entities/planet_class.dart';
import '../../domain/entities/species_conditions.dart';
import '../../domain/entities/species_variant.dart';
import '../../domain/entities/star_class.dart';
import '../../domain/entities/volcanism_type.dart';

/// Wire format of `assets/data/exobiology_catalog.json`.
///
/// Hand-written rather than generated: the file is authored data whose shape
/// must degrade gracefully. An unknown enum code has to become
/// `PlanetClass.unknown` rather than throw, otherwise one typo in the dataset
/// would take the whole catalogue down in the field, offline, with no way to
/// patch it.
class ExobiologyCatalogDto {
  const ExobiologyCatalogDto({
    required this.genera,
    required this.species,
    required this.edition,
    required this.sources,
  });

  factory ExobiologyCatalogDto.fromJson(Map<String, dynamic> json) {
    return ExobiologyCatalogDto(
      edition: _string(json['edition']) ?? '',
      sources: _stringList(json['sources']),
      genera: _list(json['genera'])
          .map(GenusDto.fromJson)
          .toList(growable: false),
      species: _list(json['species'])
          .map(OrganicSpeciesDto.fromJson)
          .toList(growable: false),
    );
  }

  final List<GenusDto> genera;
  final List<OrganicSpeciesDto> species;
  final String edition;
  final List<String> sources;

  ExobiologyCatalog toEntity() {
    final List<Genus> mappedGenera =
        genera.map((GenusDto dto) => dto.toEntity()).toList(growable: false);
    final Map<String, Genus> byId = <String, Genus>{
      for (final Genus genus in mappedGenera) genus.id: genus,
    };

    return ExobiologyCatalog(
      genera: mappedGenera,
      species: species
          .map((OrganicSpeciesDto dto) =>
              dto.toEntity(byId[dto.genusId]?.name ?? ''))
          .toList(growable: false),
      edition: edition,
      sources: sources,
    );
  }
}

class GenusDto {
  const GenusDto({
    required this.id,
    required this.name,
    required this.colonyRangeMeters,
    this.frenchName,
    this.description,
    this.sampleCount = 3,
  });

  factory GenusDto.fromJson(Map<String, dynamic> json) => GenusDto(
        id: _string(json['id']) ?? '',
        name: _string(json['name']) ?? '',
        colonyRangeMeters: _int(json['colonyRangeMeters']) ?? 0,
        frenchName: _string(json['frenchName']),
        description: _string(json['description']),
        sampleCount: _int(json['sampleCount']) ?? 3,
      );

  final String id;
  final String name;
  final int colonyRangeMeters;
  final String? frenchName;
  final String? description;
  final int sampleCount;

  Genus toEntity() => Genus(
        id: id,
        name: name,
        colonyRangeMeters: colonyRangeMeters,
        frenchName: frenchName,
        description: description,
        sampleCount: sampleCount,
      );
}

class OrganicSpeciesDto {
  const OrganicSpeciesDto({
    required this.id,
    required this.genusId,
    required this.name,
    required this.baseValueCr,
    required this.reliability,
    required this.conditions,
    required this.variants,
  });

  factory OrganicSpeciesDto.fromJson(Map<String, dynamic> json) {
    return OrganicSpeciesDto(
      id: _string(json['id']) ?? '',
      genusId: _string(json['genusId']) ?? '',
      name: _string(json['name']) ?? '',
      baseValueCr: _int(json['baseValueCr']) ?? 0,
      reliability: _string(json['reliability']) ?? 'COM',
      conditions: SpeciesConditionsDto.fromJson(
        json['conditions'] is Map<String, dynamic>
            ? json['conditions'] as Map<String, dynamic>
            : const <String, dynamic>{},
      ),
      variants: _list(json['variants'])
          .map(SpeciesVariantDto.fromJson)
          .toList(growable: false),
    );
  }

  final String id;
  final String genusId;
  final String name;
  final int baseValueCr;
  final String reliability;
  final SpeciesConditionsDto conditions;
  final List<SpeciesVariantDto> variants;

  OrganicSpecies toEntity(String genusName) => OrganicSpecies(
        id: id,
        genusId: genusId,
        genusName: genusName,
        name: name,
        baseValueCr: baseValueCr,
        reliability: reliability,
        conditions: conditions.toEntity(),
        variants: variants
            .map((SpeciesVariantDto dto) => dto.toEntity())
            .toList(growable: false),
      );
}

class SpeciesConditionsDto {
  const SpeciesConditionsDto({
    required this.planetClasses,
    required this.atmospheres,
    required this.volcanism,
    required this.requiresNebula,
    this.minTemperatureK,
    this.maxTemperatureK,
    this.maxGravityG,
    this.minGravityG,
    this.minDistanceFromArrivalLs,
    this.notes,
  });

  factory SpeciesConditionsDto.fromJson(Map<String, dynamic> json) {
    return SpeciesConditionsDto(
      planetClasses: _stringList(json['planetClasses']),
      atmospheres: _stringList(json['atmospheres']),
      volcanism: _stringList(json['volcanism']),
      requiresNebula: json['requiresNebula'] == true,
      minTemperatureK: _double(json['minTemperatureK']),
      maxTemperatureK: _double(json['maxTemperatureK']),
      maxGravityG: _double(json['maxGravityG']),
      minGravityG: _double(json['minGravityG']),
      minDistanceFromArrivalLs: _double(json['minDistanceFromArrivalLs']),
      notes: _string(json['notes']),
    );
  }

  final List<String> planetClasses;
  final List<String> atmospheres;
  final List<String> volcanism;
  final bool requiresNebula;
  final double? minTemperatureK;
  final double? maxTemperatureK;
  final double? maxGravityG;
  final double? minGravityG;
  final double? minDistanceFromArrivalLs;
  final String? notes;

  SpeciesConditions toEntity() => SpeciesConditions(
        planetClasses: planetClasses.map(PlanetClass.fromCode).toSet(),
        atmospheres: atmospheres.map(AtmosphereType.fromCode).toSet(),
        volcanism: volcanism.map(VolcanismType.fromCode).toSet(),
        requiresNebula: requiresNebula,
        minTemperatureK: minTemperatureK,
        maxTemperatureK: maxTemperatureK,
        maxGravityG: maxGravityG,
        minGravityG: minGravityG,
        minDistanceFromArrivalLs: minDistanceFromArrivalLs,
        notes: notes,
      );
}

class SpeciesVariantDto {
  const SpeciesVariantDto({
    required this.name,
    required this.colour,
    required this.starClasses,
    this.material,
  });

  factory SpeciesVariantDto.fromJson(Map<String, dynamic> json) =>
      SpeciesVariantDto(
        name: _string(json['name']) ?? '',
        colour: _string(json['colour']) ?? '',
        starClasses: _stringList(json['starClasses']),
        material: _string(json['material']),
      );

  final String name;
  final String colour;
  final List<String> starClasses;
  final String? material;

  SpeciesVariant toEntity() => SpeciesVariant(
        name: name,
        colour: colour,
        starClasses: starClasses.map(StarClass.fromCode).toSet(),
        material: material,
      );
}

// --- Lenient scalar readers -------------------------------------------------

String? _string(Object? value) =>
    value is String ? (value.isEmpty ? null : value) : value?.toString();

int? _int(Object? value) => switch (value) {
      final int v => v,
      final double v => v.round(),
      final String v => int.tryParse(v),
      _ => null,
    };

double? _double(Object? value) => switch (value) {
      final double v => v,
      final int v => v.toDouble(),
      final String v => double.tryParse(v),
      _ => null,
    };

List<Map<String, dynamic>> _list(Object? value) => value is List<dynamic>
    ? value.whereType<Map<String, dynamic>>().toList(growable: false)
    : const <Map<String, dynamic>>[];

List<String> _stringList(Object? value) => value is List<dynamic>
    ? value.whereType<String>().toList(growable: false)
    : const <String>[];
