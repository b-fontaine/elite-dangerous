import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart' show AssetBundle, rootBundle;
import 'package:injectable/injectable.dart';

/// Reads the bundled guide library from the asset bundle.
@lazySingleton
class GuideAssetDataSource {
  const GuideAssetDataSource() : bundle = null;

  /// Lets a test serve guides from an in-memory bundle. Kept as a separate
  /// constructor so the injectable one takes no arguments.
  @visibleForTesting
  const GuideAssetDataSource.withBundle(this.bundle);

  static const String indexPath = 'assets/guides/index.json';

  final AssetBundle? bundle;

  AssetBundle get _assets => bundle ?? rootBundle;

  Future<String> loadIndex() => _assets.loadString(indexPath);

  Future<String> loadGuide(String id) =>
      _assets.loadString('assets/guides/$id.json');
}
