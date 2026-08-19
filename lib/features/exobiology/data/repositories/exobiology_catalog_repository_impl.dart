import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/exobiology_catalog.dart';
import '../../domain/repositories/exobiology_catalog_repository.dart';
import '../datasources/exobiology_catalog_asset_data_source.dart';

@LazySingleton(as: ExobiologyCatalogRepository)
class ExobiologyCatalogRepositoryImpl implements ExobiologyCatalogRepository {
  ExobiologyCatalogRepositoryImpl(this._dataSource);

  final ExobiologyCatalogAssetDataSource _dataSource;

  /// The asset never changes at runtime, so one parse per launch is enough —
  /// and the species finder queries it on every keystroke.
  ExobiologyCatalog? _cached;

  @override
  Future<Result<ExobiologyCatalog>> loadCatalog() async {
    final ExobiologyCatalog? cached = _cached;
    if (cached != null) {
      return Success<ExobiologyCatalog>(cached);
    }
    return guard(
      () async {
        final ExobiologyCatalog catalog = (await _dataSource.load()).toEntity();
        _cached = catalog;
        return catalog;
      },
      onError: (Object error, _) => ParsingFailure(
        message: 'Catalogue d\'exobiologie illisible.',
        cause: error,
      ),
    );
  }
}
