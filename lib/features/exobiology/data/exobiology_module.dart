import 'package:injectable/injectable.dart';

import '../domain/services/exobiology_roadmap_engine.dart';
import '../domain/services/roadmap_declaration_resolver.dart';
import '../domain/services/species_matcher.dart';

/// Registers the exobiology domain services.
///
/// They live in a module rather than carrying `@injectable` annotations so the
/// domain layer stays free of framework imports: it depends on nothing but
/// `equatable` and the project's own `Result`.
@module
abstract class ExobiologyModule {
  @lazySingleton
  SpeciesMatcher get speciesMatcher => const SpeciesMatcher();

  @lazySingleton
  RoadmapDeclarationResolver get declarationResolver =>
      const RoadmapDeclarationResolver();

  @lazySingleton
  ExobiologyRoadmapEngine roadmapEngine(RoadmapDeclarationResolver resolver) =>
      ExobiologyRoadmapEngine(declarationResolver: resolver);
}
