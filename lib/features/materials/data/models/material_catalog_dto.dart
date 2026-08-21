import '../../domain/entities/blueprint.dart';
import '../../domain/entities/engineering_material.dart';
import '../../domain/entities/material_catalog.dart';

/// Wire format of `assets/data/materials.json` and `assets/data/blueprints.json`.
///
/// Hand-written rather than generated, and forgiving by design — the same
/// discipline the exobiology catalogue follows. An unknown source kind becomes
/// [MaterialSourceKind.unknown] instead of throwing, because one typo in an
/// authored file must not take the whole screen down in the field, offline,
/// with no way to patch it.
class MaterialCatalogDto {
  const MaterialCatalogDto({
    required this.edition,
    required this.sources,
    required this.storageCapsByGrade,
    required this.categories,
    required this.materials,
    required this.sites,
    required this.blueprints,
    required this.suits,
    required this.notes,
  });

  /// Folds the two assets into one catalogue. [blueprints] may be empty when
  /// only the material half is available.
  factory MaterialCatalogDto.fromJson(
    Map<String, dynamic> materials,
    Map<String, dynamic> blueprints,
  ) {
    return MaterialCatalogDto(
      edition: _string(materials['edition']) ?? '',
      sources: <String>[
        ..._stringList(materials['sources']),
        ..._stringList(blueprints['sources']),
      ],
      storageCapsByGrade: _intMap(materials['storageCapsByGrade']),
      categories: _list(materials['categories'])
          .map(_category)
          .toList(growable: false),
      materials:
          _list(materials['materials']).map(_material).toList(growable: false),
      sites: _list(materials['sites']).map(_site).toList(growable: false),
      blueprints:
          _list(blueprints['blueprints']).map(_blueprint).toList(growable: false),
      suits: _list(blueprints['suits']).map(_suit).toList(growable: false),
      notes: <String, String>{
        for (final MapEntry<String, dynamic> entry
            in _map(blueprints['notes']).entries)
          if (_string(entry.value) case final String value) entry.key: value,
      },
    );
  }

  final String edition;
  final List<String> sources;
  final Map<int, int> storageCapsByGrade;
  final List<MaterialCategory> categories;
  final List<EngineeringMaterial> materials;
  final List<FarmingSite> sites;
  final List<Blueprint> blueprints;
  final List<SuitUpgradePath> suits;
  final Map<String, String> notes;

  MaterialCatalog toEntity() => MaterialCatalog(
        edition: edition,
        sources: sources,
        storageCapsByGrade: storageCapsByGrade,
        categories: categories,
        materials: materials,
        sites: sites,
        blueprints: blueprints,
        suits: suits,
        notes: notes,
      );

  // --- materials -----------------------------------------------------------

  static MaterialCategory _category(Map<String, dynamic> json) =>
      MaterialCategory(
        id: _string(json['id']) ?? '',
        type: MaterialType.fromCode(_string(json['type'])),
        name: _string(json['name']) ?? '',
        sources: _sources(json['sources']),
      );

  static EngineeringMaterial _material(Map<String, dynamic> json) =>
      EngineeringMaterial(
        id: _string(json['id'])?.toLowerCase() ?? '',
        name: _string(json['name']) ?? '',
        type: MaterialType.fromCode(_string(json['type'])),
        categoryId: _string(json['categoryId']) ?? '',
        grade: _int(json['grade']),
        storageCap: _int(json['storageCap']),
        odysseyCategory: _string(json['odysseyCategory']),
        valueCr: _int(json['valueCr']),
        sources: _sources(json['sources']),
      );

  static List<MaterialSource> _sources(Object? raw) => <MaterialSource>[
        for (final Map<String, dynamic> entry in _list(raw))
          MaterialSource(
            kind: MaterialSourceKind.fromCode(_string(entry['kind'])),
            detail: _string(entry['detail']) ?? '',
            conditions: _string(entry['conditions']),
          ),
      ];

  static FarmingSite _site(Map<String, dynamic> json) => FarmingSite(
        id: _string(json['id']) ?? '',
        name: _string(json['name']) ?? '',
        system: _string(json['system']) ?? '',
        body: _string(json['body']) ?? '',
        latitude: _double(json['latitude']) ?? 0,
        longitude: _double(json['longitude']) ?? 0,
        yields: _string(json['yields']),
        note: _string(json['note']),
      );

  // --- blueprints ----------------------------------------------------------

  static Blueprint _blueprint(Map<String, dynamic> json) => Blueprint(
        id: _string(json['id']) ?? '',
        fdName: _string(json['fdName']) ?? '',
        name: _string(json['name']) ?? '',
        module: _string(json['module']) ?? '',
        purpose: _string(json['purpose']),
        warning: _string(json['warning']),
        engineersNote: _string(json['engineersNote']),
        engineers: <BlueprintEngineer>[
          for (final Map<String, dynamic> entry in _list(json['engineers']))
            BlueprintEngineer(
              id: _string(entry['id']) ?? '',
              name: _string(entry['name']) ?? '',
              maxGrade: _int(entry['maxGrade']) ?? 0,
            ),
        ],
        grades: <BlueprintGrade>[
          for (final Map<String, dynamic> entry in _list(json['grades']))
            BlueprintGrade(
              grade: _int(entry['grade']) ?? 0,
              // A recipe with no roll count still costs one application.
              rollsAtReputation5: _int(entry['rollsAtReputation5']) ?? 1,
              materials: _intMapByName(entry['materials']),
              effect: _string(entry['effect']),
            ),
        ],
        experimentals: <ExperimentalEffect>[
          for (final Map<String, dynamic> entry in _list(json['experimentals']))
            ExperimentalEffect(
              id: _string(entry['id']) ?? '',
              name: _string(entry['name']) ?? '',
              description: _string(entry['description']),
              materials: _intMapByName(entry['materials']),
            ),
        ],
      );

  static SuitUpgradePath _suit(Map<String, dynamic> json) => SuitUpgradePath(
        id: _string(json['id']) ?? '',
        name: _string(json['name']) ?? '',
        platingMaterialId: _string(json['platingMaterialId']) ?? '',
        steps: <SuitGradeStep>[
          for (final Map<String, dynamic> entry in _list(json['steps']))
            SuitGradeStep(
              fromGrade: _int(entry['fromGrade']) ?? 0,
              toGrade: _int(entry['toGrade']) ?? 0,
              materials: _intMapByName(entry['materials']),
              creditsCr: _int(entry['creditsCr']),
              modificationSlots: _int(entry['modificationSlots']),
            ),
        ],
      );

  // --- primitives ----------------------------------------------------------

  static List<Map<String, dynamic>> _list(Object? value) =>
      <Map<String, dynamic>>[
        if (value is List<dynamic>)
          for (final Object? entry in value)
            if (entry is Map<String, dynamic>) entry,
      ];

  static Map<String, dynamic> _map(Object? value) =>
      value is Map<String, dynamic> ? value : const <String, dynamic>{};

  static List<String> _stringList(Object? value) => <String>[
        if (value is List<dynamic>)
          for (final Object? entry in value)
            if (_string(entry) case final String text) text,
      ];

  static Map<String, int> _intMapByName(Object? value) => <String, int>{
        for (final MapEntry<String, dynamic> entry in _map(value).entries)
          if (_int(entry.value) case final int count)
            entry.key.toLowerCase(): count,
      };

  /// Grade to cap. The keys arrive as strings, JSON having no integer keys.
  static Map<int, int> _intMap(Object? value) => <int, int>{
        for (final MapEntry<String, dynamic> entry in _map(value).entries)
          if (int.tryParse(entry.key) case final int grade)
            if (_int(entry.value) case final int cap) grade: cap,
      };

  static String? _string(Object? value) {
    if (value is! String) {
      return null;
    }
    final String trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  static int? _int(Object? value) => switch (value) {
        final int value => value,
        final double value => value.round(),
        final String value => int.tryParse(value),
        _ => null,
      };

  static double? _double(Object? value) => switch (value) {
        final double value => value,
        final int value => value.toDouble(),
        final String value => double.tryParse(value),
        _ => null,
      };
}
