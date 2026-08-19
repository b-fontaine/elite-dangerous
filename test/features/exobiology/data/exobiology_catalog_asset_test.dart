import 'dart:convert';
import 'dart:io';

import 'package:elite_dangerous/features/exobiology/data/models/exobiology_catalog_dto.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/atmosphere_type.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/exobiology_catalog.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/genus.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/organic_species.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/planet_class.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/volcanism_type.dart';
import 'package:flutter_test/flutter_test.dart';

/// Integrity checks on the catalogue that actually ships.
///
/// The dataset is authored content, not code, so nothing else would catch a
/// duplicated id, a payout that drifted, or a colony range typed as 50 instead
/// of 500 — and a wrong colony range costs a commander a whole landing.
void main() {
  late ExobiologyCatalog catalog;

  setUpAll(() {
    final String raw = File(
      'assets/data/exobiology_catalog.json',
    ).readAsStringSync();
    catalog = ExobiologyCatalogDto.fromJson(
      jsonDecode(raw) as Map<String, dynamic>,
    ).toEntity();
  });

  test('ships the full set of organics known in 2026', () {
    // 117 species plus Radicoida Unica, added in November 3311.
    expect(catalog.species, hasLength(118));
    expect(catalog.genera, hasLength(22));
  });

  test('every species id is unique', () {
    final List<String> ids =
        catalog.species.map((OrganicSpecies s) => s.id).toList();
    expect(ids.toSet().length, ids.length);
  });

  test('every species points at a genus that exists', () {
    for (final OrganicSpecies species in catalog.species) {
      expect(
        catalog.genusById(species.genusId),
        isNotNull,
        reason: '${species.name} references unknown genus ${species.genusId}',
      );
    }
  });

  test('every species has a payout and every genus a colony range', () {
    for (final OrganicSpecies species in catalog.species) {
      expect(species.baseValueCr, greaterThan(0), reason: species.name);
    }
    for (final Genus genus in catalog.genera) {
      expect(genus.colonyRangeMeters, greaterThan(0), reason: genus.name);
      expect(genus.sampleCount, 3, reason: genus.name);
    }
  });

  test('colony ranges match the seven documented tiers', () {
    const Set<int> tiers = <int>{100, 150, 200, 300, 500, 800, 1000};
    for (final Genus genus in catalog.genera) {
      expect(tiers, contains(genus.colonyRangeMeters), reason: genus.name);
    }
  });

  test('the reference colony ranges are exact', () {
    const Map<String, int> expected = <String, int>{
      'fumerola': 100,
      'aleoida': 150,
      'clypeus': 150,
      'concha': 150,
      'frutexa': 150,
      'recepta': 150,
      'tussock': 200,
      'cactoida': 300,
      'fungoida': 300,
      'bacterium': 500,
      'fonticulua': 500,
      'stratum': 500,
      'osseus': 800,
      'tubus': 800,
      'electricae': 1000,
    };
    expected.forEach((String genusId, int range) {
      expect(catalog.genusById(genusId)?.colonyRangeMeters, range,
          reason: genusId);
    });
  });

  test('the headline payouts match Vista Genomics', () {
    const Map<String, int> expected = <String, int>{
      'fonticulua_fluctus': 20000000,
      'stratum_tectonicas': 19010800,
      'tussock_stigmasis': 19010800,
      'fonticulua_segmentatus': 19010800,
      'concha_biconcavis': 19010800,
      'clypeus_speculumi': 16202800,
      'recepta_deltahedronix': 16202800,
      'fumerola_extremus': 16202800,
      'cactoida_vermis': 16202800,
      'stratum_cucumisis': 16202800,
      'aleoida_gravis': 12934900,
      'osseus_discus': 12934900,
    };
    expected.forEach((String id, int value) {
      expect(catalog.speciesById(id)?.baseValueCr, value, reason: id);
    });
  });

  test('no species carries the 16 777 215 data artefact', () {
    // 2^24 - 1 appears in several community tables for Concha Biconcavis and
    // Fonticulua Fluctus; it is a truncation bug, not a payout.
    for (final OrganicSpecies species in catalog.species) {
      expect(species.baseValueCr, isNot(16777215), reason: species.name);
    }
  });

  test('no condition uses an unknown enum value', () {
    for (final OrganicSpecies species in catalog.species) {
      expect(species.conditions.planetClasses,
          isNot(contains(PlanetClass.unknown)),
          reason: species.name);
      expect(species.conditions.atmospheres,
          isNot(contains(AtmosphereType.unknown)),
          reason: species.name);
      expect(species.conditions.volcanism,
          isNot(contains(VolcanismType.unknown)),
          reason: species.name);
    }
  });

  test('temperature and gravity bounds are ordered and plausible', () {
    for (final OrganicSpecies species in catalog.species) {
      final double? minT = species.conditions.minTemperatureK;
      final double? maxT = species.conditions.maxTemperatureK;
      if (minT != null && maxT != null) {
        expect(minT, lessThanOrEqualTo(maxT), reason: species.name);
      }
      final double? minG = species.conditions.minGravityG;
      final double? maxG = species.conditions.maxGravityG;
      if (minG != null && maxG != null) {
        expect(minG, lessThanOrEqualTo(maxG), reason: species.name);
      }
      if (maxG != null) {
        expect(maxG, lessThan(10), reason: species.name);
      }
    }
  });

  test('Stratum Tectonicas carries the conditions the guides rely on', () {
    final OrganicSpecies species = catalog.speciesById('stratum_tectonicas')!;

    expect(species.conditions.planetClasses,
        contains(PlanetClass.highMetalContentBody));
    expect(species.conditions.minTemperatureK, greaterThanOrEqualTo(165));
    expect(species.isHighValue, isTrue);
    expect(species.firstLoggedValueCr, 95054000);
  });

  test('French notes are properly accented', () {
    // A catalogue written in unaccented French reads as broken to the user.
    final Iterable<String> notes = catalog.species
        .map((OrganicSpecies s) => s.conditions.notes)
        .whereType<String>();
    for (final String note in notes) {
      expect(note, isNot(contains('gravite')), reason: note);
      expect(note, isNot(contains('atmosphere')), reason: note);
      expect(note, isNot(contains('temperature')), reason: note);
    }
  });

  test('declares its edition and its sources', () {
    expect(catalog.edition, isNotEmpty);
    expect(catalog.sources, isNotEmpty);
  });
}
