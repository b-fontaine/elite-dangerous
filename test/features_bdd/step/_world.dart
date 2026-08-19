import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/body_profile.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/species_match.dart';
import 'package:elite_dangerous/features/exobiology/domain/repositories/commander_snapshot_source.dart';
import 'package:elite_dangerous/features/exobiology/domain/repositories/exobiology_catalog_repository.dart';
import 'package:elite_dangerous/features/exobiology/presentation/bloc/roadmap_bloc.dart';
import 'package:elite_dangerous/features/guides/domain/repositories/guide_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Shared context between the Gherkin steps of one scenario.
///
/// `bdd_widget_test` hands each step only the `WidgetTester`, so the state a
/// scenario builds up lives here and is reset by the `Given` that starts it.
class BddWorld {
  BodyProfile body = const BodyProfile(name: 'Corps de test');
  List<SpeciesMatch> matches = const <SpeciesMatch>[];
  Set<String> soldSpeciesKeys = <String>{};
}

BddWorld world = BddWorld();

/// Boots a clean dependency graph backed by in-memory storage.
///
/// This is a real graph, not a stack of mocks: the scenarios below are only
/// meaningful if the roadmap engine, the repositories and the widgets are the
/// ones that ship.
Future<void> bootApplication(WidgetTester tester) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues(<String, Object>{});
  FlutterSecureStorage.setMockInitialValues(<String, String>{});
  world = BddWorld();
  await resetDependencies();
  await configureDependencies();

  // Warm the asset-backed repositories outside the fake async zone. Bundled
  // assets travel over a platform channel, which a widget test's simulated
  // clock cannot pump; loading them here means the widgets under test only
  // ever read from the in-memory cache.
  await tester.runAsync(() async {
    await getIt<GuideRepository>().listGuides();
    await getIt<ExobiologyCatalogRepository>().loadCatalog();
    // Same reason: the commander snapshot reads secure storage and shared
    // preferences, both of which are platform channels.
    await getIt<CommanderSnapshotSource>().current();
  });
}

/// Wraps a page in the real theme so text and colours match production.
Widget wrapPage(Widget page) => MaterialApp(
      theme: EdTheme.build(),
      home: Scaffold(body: page),
    );

/// Advances the tree until it settles.
///
/// `pumpAndSettle` would time out on the broadcast streams the blocs keep open,
/// and a plain `pump` loop is not enough either: loading a bundled asset goes
/// through a platform channel, which only completes outside the fake async
/// zone. Interleaving `runAsync` is what lets the guides and the species
/// catalogue actually load.
Future<void> settle(WidgetTester tester, {int frames = 12}) async {
  for (int i = 0; i < frames; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 10)),
    );
    await tester.pump(const Duration(milliseconds: 20));
  }
}

/// Pumps until [condition] holds, or fails the scenario after [attempts].
///
/// Loading the guide library parses a quarter of a megabyte of JSON through a
/// platform channel; a fixed frame count either flakes or wastes time.
Future<void> pumpUntil(
  WidgetTester tester,
  bool Function() condition, {
  int attempts = 60,
  String? reason,
}) async {
  for (int i = 0; i < attempts; i++) {
    if (condition()) {
      return;
    }
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 10)),
    );
    await tester.pump(const Duration(milliseconds: 20));
  }
  fail(reason ?? 'La condition attendue ne s\'est jamais réalisée.');
}

/// Reads the roadmap bloc from inside the page's own provider.
RoadmapBloc roadmapBlocOf(WidgetTester tester) {
  final Finder finder = find.byType(CustomScrollView);
  expect(
    finder,
    findsWidgets,
    reason: 'La feuille de route doit être ouverte avant cette étape.',
  );
  return BlocProvider.of<RoadmapBloc>(tester.element(finder.first));
}

RoadmapReady roadmapStateOf(WidgetTester tester) {
  final RoadmapState state = roadmapBlocOf(tester).state;
  expect(state, isA<RoadmapReady>());
  return state as RoadmapReady;
}
