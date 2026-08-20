import 'dart:convert';

import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart' show AssetBundle, rootBundle;
import 'package:injectable/injectable.dart';

import '../models/material_catalog_dto.dart';

/// Loads the bundled materials database.
///
/// Two files rather than one: what a material *is* changes on Frontier's
/// schedule, while what a blueprint *costs* changes on the engineers' — and
/// keeping them apart means a correction to one never risks the other.
@lazySingleton
class MaterialCatalogAssetDataSource {
  const MaterialCatalogAssetDataSource() : bundle = null;

  /// Lets a test serve the catalogue from an in-memory bundle.
  @visibleForTesting
  const MaterialCatalogAssetDataSource.withBundle(this.bundle);

  static const String materialsAssetPath = 'assets/data/materials.json';
  static const String blueprintsAssetPath = 'assets/data/blueprints.json';

  final AssetBundle? bundle;

  AssetBundle get _assets => bundle ?? rootBundle;

  Future<MaterialCatalogDto> load() async {
    final Map<String, dynamic> materials = await _object(materialsAssetPath);
    final Map<String, dynamic> blueprints = await _object(blueprintsAssetPath);
    return MaterialCatalogDto.fromJson(materials, blueprints);
  }

  Future<Map<String, dynamic>> _object(String path) async {
    final Object? decoded = jsonDecode(await _assets.loadString(path));
    if (decoded is! Map<String, dynamic>) {
      throw FormatException('$path n\'est pas un objet JSON.');
    }
    return decoded;
  }
}
