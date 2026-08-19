import 'dart:convert';

import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart' show AssetBundle, rootBundle;
import 'package:injectable/injectable.dart';

import '../models/exobiology_catalog_dto.dart';

/// Loads the bundled organic-life database.
///
/// The catalogue ships as an asset rather than being fetched: a commander
/// 20 000 ly from the bubble, on a phone with no connection, still needs the
/// colony ranges and the payout table.
@lazySingleton
class ExobiologyCatalogAssetDataSource {
  const ExobiologyCatalogAssetDataSource() : bundle = null;

  /// Lets a test serve the catalogue from an in-memory bundle. Kept as a
  /// separate constructor so the injectable one takes no arguments.
  @visibleForTesting
  const ExobiologyCatalogAssetDataSource.withBundle(this.bundle);

  static const String assetPath = 'assets/data/exobiology_catalog.json';

  final AssetBundle? bundle;

  AssetBundle get _assets => bundle ?? rootBundle;

  Future<ExobiologyCatalogDto> load() async {
    final String raw = await _assets.loadString(assetPath);
    final Object? decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException(
        'Le catalogue d\'exobiologie n\'est pas un objet JSON.',
      );
    }
    return ExobiologyCatalogDto.fromJson(decoded);
  }
}
