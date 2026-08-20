import '../../../../core/result/result.dart';
import '../entities/material_catalog.dart';

/// Read-only access to the bundled materials database.
abstract interface class MaterialCatalogRepository {
  Future<Result<MaterialCatalog>> loadCatalog();
}
