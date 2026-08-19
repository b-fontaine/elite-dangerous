import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// The single service locator instance.
///
/// Only composition roots (`main`, widget tests, BDD step files) are allowed to
/// touch it: everything else receives its collaborators through constructors.
final GetIt getIt = GetIt.instance;

/// Environment name used by widget/BDD tests to swap remote data sources for
/// in-memory doubles.
const String testEnvironment = 'test';

/// Environment name used by the real app.
const String prodEnvironment = Environment.prod;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<GetIt> configureDependencies({String environment = prodEnvironment}) =>
    getIt.init(environment: environment);

/// Tears everything down. Used between tests so each scenario starts clean.
Future<void> resetDependencies() => getIt.reset();
