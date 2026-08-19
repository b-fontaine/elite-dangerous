import '../../../../core/result/result.dart';
import '../entities/exobiology_catalog.dart';

/// Read-only access to the bundled organic-life database.
abstract interface class ExobiologyCatalogRepository {
  Future<Result<ExobiologyCatalog>> loadCatalog();
}
