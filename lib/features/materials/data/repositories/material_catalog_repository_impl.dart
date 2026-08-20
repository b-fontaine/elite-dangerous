import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/material_catalog.dart';
import '../../domain/repositories/material_catalog_repository.dart';
import '../datasources/material_catalog_asset_data_source.dart';

@LazySingleton(as: MaterialCatalogRepository)
class MaterialCatalogRepositoryImpl implements MaterialCatalogRepository {
  MaterialCatalogRepositoryImpl(this._dataSource);

  final MaterialCatalogAssetDataSource _dataSource;

  /// The assets never change at runtime, so one parse per launch is enough.
  MaterialCatalog? _cached;

  @override
  Future<Result<MaterialCatalog>> loadCatalog() async {
    final MaterialCatalog? cached = _cached;
    if (cached != null) {
      return Success<MaterialCatalog>(cached);
    }
    return guard(
      () async {
        final MaterialCatalog catalog = (await _dataSource.load()).toEntity();
        _cached = catalog;
        return catalog;
      },
      onError: (Object error, _) => ParsingFailure(
        message: 'Base de données des matériaux illisible.',
        cause: error,
      ),
    );
  }
}
