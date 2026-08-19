import 'dart:convert';

import 'package:elite_dangerous/features/exobiology/data/models/exobiology_catalog_dto.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/atmosphere_type.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/exobiology_catalog.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/organic_species.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/planet_class.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/star_class.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/volcanism_type.dart';
import 'package:flutter_test/flutter_test.dart';

const String _json = '''
{
  "edition": "2026-08",
  "sources": ["Canonn Research", "Fandom"],
  "genera": [
    {
      "id": "stratum",
      "name": "Stratum",
      "colonyRangeMeters": 500,
      "description": "Tapis au ras du sol."
    },
    {
      "id": "fumerola",
      "name": "Fumerola",
      "colonyRangeMeters": 100
    }
  ],
  "species": [
    {
      "id": "stratum_tectonicas",
      "genusId": "stratum",
      "name": "Stratum Tectonicas",
      "baseValueCr": 19010800,
      "reliability": "COM",
      "conditions": {
        "planetClasses": ["hmc"],
        "atmospheres": ["carbon_dioxide", "sulphur_dioxide"],
        "minTemperatureK": 165,
        "maxGravityG": 0.62,
        "notes": "terrain plat"
      },
      "variants": [
        {"name": "Stratum Tectonicas - Green", "colour": "Vert", "starClasses": ["A"]}
      ]
    },
    {
      "id": "fumerola_extremus",
      "genusId": "fumerola",
      "name": "Fumerola Extremus",
      "baseValueCr": 16202800,
      "conditions": {
        "planetClasses": ["rocky", "icy"],
        "volcanism": ["silicate", "iron_magma"],
        "minDistanceFromArrivalLs": 2500,
        "requiresNebula": true
      }
    }
  ]
}
''';

void main() {
  group('ExobiologyCatalogDto', () {
    late ExobiologyCatalog catalog;

    setUp(() {
      catalog = ExobiologyCatalogDto.fromJson(
        jsonDecode(_json) as Map<String, dynamic>,
      ).toEntity();
    });

    test('reads the edition and the source list', () {
      expect(catalog.edition, '2026-08');
      expect(catalog.sources, <String>['Canonn Research', 'Fandom']);
    });

    test('maps genera with their colony range', () {
      expect(catalog.genera, hasLength(2));
      expect(catalog.genusById('stratum')?.colonyRangeMeters, 500);
      expect(catalog.genusById('fumerola')?.colonyRangeMeters, 100);
    });

    test('denormalises the genus name onto each species', () {
      expect(catalog.speciesById('stratum_tectonicas')?.genusName, 'Stratum');
    });

    test('maps planet classes and atmospheres from their codes', () {
      final OrganicSpecies species = catalog.speciesById('stratum_tectonicas')!;

      expect(
        species.conditions.planetClasses,
        <PlanetClass>{PlanetClass.highMetalContentBody},
      );
      expect(
        species.conditions.atmospheres,
        <AtmosphereType>{
          AtmosphereType.carbonDioxide,
          AtmosphereType.sulphurDioxide,
        },
      );
    });

    test('maps numeric bounds, leaving absent ones null', () {
      final OrganicSpecies species = catalog.speciesById('stratum_tectonicas')!;

      expect(species.conditions.minTemperatureK, 165);
      expect(species.conditions.maxTemperatureK, isNull);
      expect(species.conditions.maxGravityG, 0.62);
      expect(species.conditions.minGravityG, isNull);
      expect(species.conditions.notes, 'terrain plat');
    });

    test('maps volcanism, distance and nebula requirements', () {
      final OrganicSpecies species = catalog.speciesById('fumerola_extremus')!;

      expect(
        species.conditions.volcanism,
        <VolcanismType>{VolcanismType.silicate, VolcanismType.ironMagma},
      );
      expect(species.conditions.minDistanceFromArrivalLs, 2500);
      expect(species.conditions.requiresNebula, isTrue);
    });

    test('maps colour variants and their star classes', () {
      final OrganicSpecies species = catalog.speciesById('stratum_tectonicas')!;

      expect(species.variants, hasLength(1));
      expect(species.variants.first.colour, 'Vert');
      expect(species.variants.first.starClasses, <StarClass>{StarClass.a});
    });

    test('defaults reliability to COM when absent', () {
      expect(catalog.speciesById('fumerola_extremus')?.reliability, 'COM');
    });

    test('computes the First Logged payout as five times the base', () {
      expect(
        catalog.speciesById('stratum_tectonicas')?.firstLoggedValueCr,
        19010800 * 5,
      );
    });

    test('exposes the colony range of a species through its genus', () {
      expect(catalog.colonyRangeFor('stratum_tectonicas'), 500);
      expect(catalog.colonyRangeFor('fumerola_extremus'), 100);
      expect(catalog.colonyRangeFor('unknown_species'), isNull);
    });

    test('an unknown planet class code degrades to unknown instead of throwing',
        () {
      final ExobiologyCatalog result = ExobiologyCatalogDto.fromJson(
        <String, dynamic>{
          'genera': <dynamic>[
            <String, dynamic>{
              'id': 'x',
              'name': 'X',
              'colonyRangeMeters': 100,
            },
          ],
          'species': <dynamic>[
            <String, dynamic>{
              'id': 'x_y',
              'genusId': 'x',
              'name': 'X Y',
              'baseValueCr': 1,
              'conditions': <String, dynamic>{
                'planetClasses': <dynamic>['martian'],
              },
            },
          ],
        },
      ).toEntity();

      expect(
        result.speciesById('x_y')?.conditions.planetClasses,
        <PlanetClass>{PlanetClass.unknown},
      );
    });

    test('a species pointing at a missing genus still maps, without a name',
        () {
      final ExobiologyCatalog result = ExobiologyCatalogDto.fromJson(
        <String, dynamic>{
          'genera': const <dynamic>[],
          'species': <dynamic>[
            <String, dynamic>{
              'id': 'orphan',
              'genusId': 'nope',
              'name': 'Orphan',
              'baseValueCr': 1,
            },
          ],
        },
      ).toEntity();

      expect(result.speciesById('orphan')?.genusName, '');
      expect(result.colonyRangeFor('orphan'), isNull);
    });
  });
}
