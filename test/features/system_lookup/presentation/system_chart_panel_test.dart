import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/exobiology_catalog.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/genus.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/organic_species.dart';
import 'package:elite_dangerous/features/exobiology/domain/entities/species_conditions.dart';
import 'package:elite_dangerous/features/exobiology/presentation/widgets/system_chart_panel.dart';
import 'package:elite_dangerous/features/journal/domain/entities/system_survey.dart';
import 'package:elite_dangerous/features/system_lookup/domain/entities/body_landmarks.dart';
import 'package:elite_dangerous/features/system_lookup/domain/entities/charted_system.dart';
import 'package:elite_dangerous/features/system_lookup/domain/repositories/system_lookup_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/path_provider_stub.dart';

/// A repository under the test's control, standing in for Spansh.
class _FakeRepository implements SystemLookupRepository {
  _FakeRepository({this.isSupported = true});

  @override
  final bool isSupported;

  ChartedSystem? cached;
  Result<ChartedSystem>? systemAnswer;
  Result<BodyLandmarks>? landmarksAnswer;

  int systemCalls = 0;

  @override
  Future<Result<ChartedSystem>> system(int id64, {bool refresh = false}) async {
    systemCalls++;
    return systemAnswer ?? const ResultFailure<ChartedSystem>(NetworkFailure());
  }

  @override
  Future<Result<BodyLandmarks>> landmarks(
    int bodyId64, {
    DateTime? signalsUpdatedAt,
    bool refresh = false,
  }) async =>
      landmarksAnswer ?? const ResultFailure<BodyLandmarks>(NetworkFailure());

  @override
  Future<ChartedSystem?> cachedSystem(int id64) async => cached;

  @override
  Future<void> clearCache() async => cached = null;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  usePathProviderStub();

  late _FakeRepository repository;

  /// Two species and their genus, enough to price a sighting and to give the
  /// distance a commander has to walk between two samples.
  const ExobiologyCatalog catalog = ExobiologyCatalog(
    edition: '2026-08',
    sources: <String>[],
    genera: <Genus>[
      Genus(id: 'stratum', name: 'Stratum', colonyRangeMeters: 500),
    ],
    species: <OrganicSpecies>[
      OrganicSpecies(
        id: 'stratum_tectonicas',
        genusId: 'stratum',
        genusName: 'Stratum',
        name: 'Stratum Tectonicas',
        baseValueCr: 19010800,
        conditions: SpeciesConditions(),
      ),
    ],
  );

  final ChartedSystem charted = ChartedSystem(
    id64: 1865903245675,
    name: '36 Ophiuchi',
    fetchedAt: DateTime.utc(2026, 8, 20, 12),
    bodyCount: 41,
    bodies: <ChartedBody>[
      ChartedBody(
        id64: 1188952167529056619,
        name: '36 Ophiuchi C 4',
        bodyId: 26,
        subType: 'High metal content world',
        landable: true,
        gravityG: 0.47,
        surfaceTemperatureK: 314.9,
        distanceFromArrivalLs: 40000,
        biologicalSignals: 2,
        genusNames: const <String>['Bacterium', 'Stratum'],
        signalsUpdatedAt: DateTime.utc(2026, 8, 2, 22, 54, 28),
      ),
    ],
  );

  final BodyLandmarks landmarks = BodyLandmarks(
    bodyId64: 1188952167529056619,
    bodyName: '36 Ophiuchi C 4',
    fetchedAt: DateTime.utc(2026, 8, 20, 12),
    otherLandmarks: 2,
    species: const <SpeciesSighting>[
      SpeciesSighting(
        genus: 'Stratum',
        species: 'Stratum Tectonicas',
        variant: 'Lime',
        valueCr: 19010800,
        locations: <SurfaceLocation>[
          SurfaceLocation(latitude: -36.704754, longitude: -99.003242),
        ],
      ),
    ],
  );

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    await resetDependencies();
    await configureDependencies();

    repository = _FakeRepository();
    // The rest of the graph is the real one; only the door to the network is
    // replaced, so the bloc, the use cases and the widget under test are the
    // production ones.
    await getIt.unregister<SystemLookupRepository>();
    getIt.registerLazySingleton<SystemLookupRepository>(() => repository);
  });

  tearDown(resetDependencies);

  Future<void> open(
    WidgetTester tester, {
    int? id64 = 1865903245675,
    SystemSurvey survey = const SystemSurvey.unknown(),
    Size size = const Size(1200, 2400),
  }) async {
    tester.view
      ..physicalSize = size
      ..devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SystemChartPanel(
              id64: id64,
              systemName: '36 Ophiuchi',
              survey: survey,
              catalog: catalog,
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('rien n\'est demandé tant que le commandant n\'a rien demandé', (
    WidgetTester tester,
  ) async {
    await open(tester);

    expect(find.text('Interroger Spansh'), findsOneWidget);
    expect(repository.systemCalls, 0);
  });

  testWidgets('sans identifiant, le bouton n\'est pas proposé', (
    WidgetTester tester,
  ) async {
    await open(tester, id64: null);

    expect(find.text('Interroger Spansh'), findsNothing);
    expect(find.textContaining('jamais à un nom'), findsOneWidget);
  });

  testWidgets('interroger montre les corps, puis les espèces', (
    WidgetTester tester,
  ) async {
    repository.systemAnswer = Result<ChartedSystem>.ok(charted);
    repository.landmarksAnswer = Result<BodyLandmarks>.ok(landmarks);
    await open(tester);

    await tester.tap(find.text('Interroger Spansh'));
    await tester.pumpAndSettle();

    expect(repository.systemCalls, 1);
    expect(find.text('36 Ophiuchi C 4'), findsOneWidget);
    expect(find.textContaining('Bacterium, Stratum'), findsWidgets);
    // Le corps n'est pas dans le journal de ce commandant : c'est toute la
    // raison d'avoir demandé.
    expect(find.text('ABSENT DE VOTRE JOURNAL'), findsOneWidget);

    await tester.tap(find.text('Espèces exactes'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Stratum Tectonicas'), findsOneWidget);
    expect(find.textContaining('500 m entre échantillons'), findsOneWidget);
    expect(find.textContaining('-36.7048'), findsOneWidget);
  });

  testWidgets('un corps déjà travaillé est signalé comme tel', (
    WidgetTester tester,
  ) async {
    repository.systemAnswer = Result<ChartedSystem>.ok(charted);
    await open(
      tester,
      survey: const SystemSurvey(
        systemName: '36 Ophiuchi',
        systemAddress: 1865903245675,
        bodies: <SurveyBody>[
          SurveyBody(
            name: '36 Ophiuchi C 4',
            bodyId: 26,
            biologicalSignals: 2,
            organismsCompleted: 1,
          ),
        ],
      ),
    );

    await tester.tap(find.text('Interroger Spansh'));
    await tester.pumpAndSettle();

    expect(find.text('ABSENT DE VOTRE JOURNAL'), findsNothing);
    expect(find.text('1 DÉJÀ ANALYSÉ(S)'), findsOneWidget);
  });

  testWidgets('un échec le dit sans vider l\'écran', (
    WidgetTester tester,
  ) async {
    repository.cached = ChartedSystem(
      id64: 1865903245675,
      name: '36 Ophiuchi',
      fetchedAt: DateTime.utc(2026, 8, 6, 12),
      fromCache: true,
      bodies: charted.bodies,
    );
    await open(tester);

    await tester.tap(find.text('Redemander à Spansh'));
    await tester.pumpAndSettle();

    expect(find.text('SPANSH INJOIGNABLE'), findsOneWidget);
    // Ce qui était affiché reste affiché : le journal, lui, n'a pas bougé.
    expect(find.text('36 Ophiuchi C 4'), findsOneWidget);
    expect(find.textContaining('en cache'), findsOneWidget);
  });

  testWidgets('tout affiché, cela tient sur un téléphone', (
    WidgetTester tester,
  ) async {
    // Le lot précédent avait laissé passer un débordement de 106 pixels sur
    // cette largeur exacte : une ligne « libellé + valeur » qui ne tenait pas.
    // Les lignes d'espèce d'ici sont au moins aussi longues.
    repository.systemAnswer = Result<ChartedSystem>.ok(charted);
    repository.landmarksAnswer = Result<BodyLandmarks>.ok(landmarks);
    await open(tester, size: const Size(360, 1400));

    await tester.tap(find.text('Interroger Spansh'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Espèces exactes'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.textContaining('Stratum Tectonicas'), findsOneWidget);
  });

  testWidgets('sur une cible non supportée, le panneau disparaît', (
    WidgetTester tester,
  ) async {
    await getIt.unregister<SystemLookupRepository>();
    getIt.registerLazySingleton<SystemLookupRepository>(
      () => _FakeRepository(isSupported: false),
    );

    await open(tester);

    expect(find.text('Interroger Spansh'), findsNothing);
    expect(find.textContaining('Relevé'), findsNothing);
  });
}
