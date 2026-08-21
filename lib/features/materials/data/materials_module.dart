import 'package:injectable/injectable.dart';

import '../domain/services/material_planner.dart';

/// Registers the materials domain services.
///
/// In a module rather than annotated, so the domain layer keeps depending on
/// nothing but `equatable` and the project's own `Result`.
@module
abstract class MaterialsModule {
  @lazySingleton
  MaterialPlanner get materialPlanner => const MaterialPlanner();
}
