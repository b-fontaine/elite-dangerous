import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/features/auth/domain/repositories/auth_repository.dart';
import 'package:elite_dangerous/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:elite_dangerous/features/commander/domain/repositories/commander_repository.dart';
import 'package:elite_dangerous/features/commander/presentation/bloc/commander_bloc.dart';
import 'package:elite_dangerous/features/exobiology/domain/repositories/exobiology_catalog_repository.dart';
import 'package:elite_dangerous/features/exobiology/domain/repositories/exobiology_progress_repository.dart';
import 'package:elite_dangerous/features/exobiology/presentation/bloc/roadmap_bloc.dart';
import 'package:elite_dangerous/features/exobiology/presentation/bloc/species_catalog_bloc.dart';
import 'package:elite_dangerous/features/exobiology/presentation/bloc/species_finder_bloc.dart';
import 'package:elite_dangerous/features/guides/domain/repositories/guide_repository.dart';
import 'package:elite_dangerous/features/guides/presentation/bloc/guide_detail_bloc.dart';
import 'package:elite_dangerous/features/guides/presentation/bloc/guides_bloc.dart';
import 'package:elite_dangerous/features/journal/domain/repositories/journal_repository.dart';
import 'package:elite_dangerous/features/journal/presentation/bloc/journal_bloc.dart';
import 'package:elite_dangerous/features/settings/domain/repositories/settings_repository.dart';
import 'package:elite_dangerous/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The generated `injection.config.dart` is excluded from static analysis, so
/// a broken registration only shows up at runtime. Resolving every graph root
/// here is what turns that into a test failure instead of a crash on launch.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    await configureDependencies();
  });

  tearDown(resetDependencies);

  test('every repository resolves', () {
    expect(getIt<AuthRepository>(), isNotNull);
    expect(getIt<CommanderRepository>(), isNotNull);
    expect(getIt<JournalRepository>(), isNotNull);
    expect(getIt<GuideRepository>(), isNotNull);
    expect(getIt<SettingsRepository>(), isNotNull);
    expect(getIt<ExobiologyCatalogRepository>(), isNotNull);
    expect(getIt<ExobiologyProgressRepository>(), isNotNull);
  });

  test('every bloc resolves with its full dependency graph', () {
    final List<Object> blocs = <Object>[
      getIt<AuthBloc>(),
      getIt<CommanderBloc>(),
      getIt<JournalBloc>(),
      getIt<GuidesBloc>(),
      getIt<GuideDetailBloc>(),
      getIt<SettingsBloc>(),
      getIt<RoadmapBloc>(),
      getIt<SpeciesFinderBloc>(),
      getIt<SpeciesCatalogBloc>(),
    ];

    expect(blocs, everyElement(isNotNull));
  });

  test('repositories are singletons, blocs are not', () {
    expect(
      identical(getIt<CommanderRepository>(), getIt<CommanderRepository>()),
      isTrue,
    );
    expect(identical(getIt<RoadmapBloc>(), getIt<RoadmapBloc>()), isFalse);
  });

  test('the graph tears down cleanly', () async {
    getIt<RoadmapBloc>();
    await expectLater(resetDependencies(), completes);
  });
}
