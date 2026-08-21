import 'package:equatable/equatable.dart';

import 'blueprint.dart';
import 'engineering_material.dart';

/// The bundled materials database: what exists, where it comes from, and what
/// the blueprints ask for.
///
/// Shipped as an asset rather than fetched, for the same reason the exobiology
/// catalogue is: a commander deep in the black has no connection, and this is
/// exactly when they are deciding what to bring home.
class MaterialCatalog extends Equatable {
  MaterialCatalog({
    required this.edition,
    required this.sources,
    required this.storageCapsByGrade,
    required this.categories,
    required this.materials,
    required this.sites,
    required this.blueprints,
    required this.suits,
    this.notes = const <String, String>{},
  })  : _byId = <String, EngineeringMaterial>{
          for (final EngineeringMaterial material in materials)
            material.id: material,
        },
        _byName = <String, EngineeringMaterial>{
          for (final EngineeringMaterial material in materials)
            material.name.toLowerCase(): material,
        },
        _categoriesById = <String, MaterialCategory>{
          for (final MaterialCategory category in categories)
            category.id: category,
        };

  final String edition;
  final List<String> sources;

  /// Grade to how many units may be held: 300, 250, 200, 150, 100.
  final Map<int, int> storageCapsByGrade;

  final List<MaterialCategory> categories;
  final List<EngineeringMaterial> materials;
  final List<FarmingSite> sites;
  final List<Blueprint> blueprints;
  final List<SuitUpgradePath> suits;

  /// Free-form caveats the data itself carries, keyed by subject.
  final Map<String, String> notes;

  final Map<String, EngineeringMaterial> _byId;
  final Map<String, EngineeringMaterial> _byName;
  final Map<String, MaterialCategory> _categoriesById;

  /// Finds a material by its journal symbol *or* by its English name.
  ///
  /// Both are needed because the two vocabularies meet here: blueprints are
  /// written in symbols, while the folded inventory is keyed by name. Matching
  /// either way costs one extra map and removes a whole class of silent
  /// mismatches.
  EngineeringMaterial? resolve(String? idOrName) {
    final String key = idOrName?.trim().toLowerCase() ?? '';
    if (key.isEmpty) {
      return null;
    }
    return _byId[key] ?? _byName[key];
  }

  MaterialCategory? categoryOf(EngineeringMaterial material) =>
      _categoriesById[material.categoryId];

  /// Everything known about getting [material]: what is specific to it first,
  /// then what its category shares.
  List<MaterialSource> sourcesFor(EngineeringMaterial material) =>
      <MaterialSource>[
        ...material.sources,
        ...?categoryOf(material)?.sources,
      ];

  /// The other materials a trader can convert to or from — same store, and for
  /// the cheap rate, the same category.
  List<EngineeringMaterial> siblingsOf(EngineeringMaterial material) =>
      <EngineeringMaterial>[
        for (final EngineeringMaterial other in materials)
          if (other.type == material.type && other.id != material.id) other,
      ];

  Blueprint? blueprint(String id) {
    for (final Blueprint candidate in blueprints) {
      if (candidate.id == id) {
        return candidate;
      }
    }
    return null;
  }

  SuitUpgradePath? suit(String id) {
    for (final SuitUpgradePath candidate in suits) {
      if (candidate.id == id) {
        return candidate;
      }
    }
    return null;
  }

  @override
  List<Object?> get props => <Object?>[
        edition,
        sources,
        storageCapsByGrade,
        categories,
        materials,
        sites,
        blueprints,
        suits,
        notes,
      ];
}
