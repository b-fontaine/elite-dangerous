import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:elite_dangerous/features/diagnostics/domain/entities/raw_payload.dart';
import 'package:elite_dangerous/features/diagnostics/domain/repositories/diagnostics_repository.dart';
import 'package:elite_dangerous/features/diagnostics/presentation/pages/diagnostics_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/path_provider_stub.dart';

/// Fakes only the outermost port: the real use cases, the real inspector and
/// the real bloc all run, so what the screen claims about a payload is what
/// the inspector actually concluded.
class _FakeDiagnosticsRepository implements DiagnosticsRepository {
  _FakeDiagnosticsRepository({this.cached, this.stored});

  RawPayload? cached;
  RawPayload? stored;

  int profileFetches = 0;
  int journalFetches = 0;

  Result<RawPayload> profileResult = const ResultFailure<RawPayload>(
    RateLimitFailure(message: 'Trop de requêtes vers Frontier.'),
  );
  Result<RawPayload> journalResult = const ResultFailure<RawPayload>(
    UnauthorizedFailure(message: 'Aucune session Frontier.'),
  );
  Result<String> exportResult = const Success<String>('/tmp/diagnostic.json');

  @override
  Future<Result<RawPayload?>> cachedProfile() async =>
      Success<RawPayload?>(cached);

  @override
  Future<Result<RawPayload?>> storedJournal() async =>
      Success<RawPayload?>(stored);

  @override
  Future<Result<RawPayload>> fetchProfile() async {
    profileFetches++;
    return profileResult;
  }

  @override
  Future<Result<RawPayload>> fetchJournalDay(DateTime dayUtc) async {
    journalFetches++;
    return journalResult;
  }

  @override
  Future<Result<String>> export(RawPayload payload) async => exportResult;
}

RawPayload _profilePayload(String body) => RawPayload(
      title: 'GET /profile',
      body: body,
      origin: RawPayloadOrigin.localCache,
      format: RawPayloadFormat.json,
      capturedAt: DateTime.utc(2026, 8, 19, 10),
    );

RawPayload _journalPayload(List<String> lines) => RawPayload(
      title: 'Journal local',
      body: lines.join('\n'),
      origin: RawPayloadOrigin.localCache,
      format: RawPayloadFormat.jsonLines,
      capturedAt: DateTime.utc(2026, 8, 19, 10),
    );

/// A fleet of two with modules on the flown ship only — the shape that settles
/// the stored-ship question.
const String _profileBody = '''
{
  "commander": { "name": "Caspian", "currentShipId": 12,
                 "rank": { "explore": 5, "exobiologist": 1, "soldier": 0 } },
  "ship": { "id": 12, "name": "krait_light",
            "value": { "hull": 40000000, "modules": 60000000, "total": 100000000 },
            "modules": { "PowerPlant": { "module": { "name": "x" } } } },
  "ships": {
    "12": { "id": 12, "name": "krait_light", "modules": { "PowerPlant": {} } },
    "31": { "id": 31, "name": "anaconda" }
  },
  "suits": { "0": { "name": "explorationsuit_class3" } }
}
''';

const List<String> _journalLines = <String>[
  '{"timestamp":"2026-08-18T20:00:00Z","event":"Statistics"}',
  '{"timestamp":"2026-08-18T20:00:01Z","event":"ScanOrganic","ScanType":"Log"}',
];

Future<void> _pump(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: EdTheme.build(),
      home: const Scaffold(body: DiagnosticsPage()),
    ),
  );
  await tester.pumpAndSettle();
}

/// The actions sit at the bottom of a page taller than the test surface.
Future<void> _tap(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pumpAndSettle();
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  usePathProviderStub();

  late _FakeDiagnosticsRepository repository;

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    await configureDependencies();
    repository = _FakeDiagnosticsRepository(
      cached: _profilePayload(_profileBody),
      stored: _journalPayload(_journalLines),
    );
    await getIt.unregister<DiagnosticsRepository>();
    getIt.registerLazySingleton<DiagnosticsRepository>(() => repository);
  });

  tearDown(resetDependencies);

  testWidgets('opens on what is already stored, without spending a query',
      (WidgetTester tester) async {
    await _pump(tester);

    expect(repository.profileFetches, 0);
    expect(repository.journalFetches, 0);
    expect(find.text('GET /profile'), findsOneWidget);
    expect(find.text('Journal local'), findsOneWidget);
  });

  testWidgets('marks the two undocumented questions as open',
      (WidgetTester tester) async {
    await _pump(tester);

    expect(find.text('Équipement des vaisseaux stockés'), findsOneWidget);
    expect(find.text('Loadouts à pied (armes et grades)'), findsOneWidget);
    expect(find.text('QUESTION OUVERTE'), findsNWidgets(2));
  });

  testWidgets('answers the stored-ship question from the payload itself',
      (WidgetTester tester) async {
    await _pump(tester);

    // One stored ship, no `modules` on it: the fleet page cannot show a build.
    expect(find.textContaining('0 / 1 vaisseau(x) stocké(s)'), findsOneWidget);
  });

  testWidgets('names the planned journal events the capture lacks',
      (WidgetTester tester) async {
    await _pump(tester);

    expect(find.text('EngineerProgress'), findsOneWidget);
    expect(find.text('ShipLocker'), findsOneWidget);
    expect(find.text('absent de la capture'), findsWidgets);
  });

  testWidgets('a refusal from Frontier is shown and keeps the capture',
      (WidgetTester tester) async {
    await _pump(tester);

    await _tap(tester, find.text('Récupérer maintenant'));

    expect(repository.profileFetches, 1);
    expect(find.text('Trop de requêtes vers Frontier.'), findsOneWidget);
    expect(find.text('GET /profile'), findsOneWidget);
  });

  testWidgets('an export reports where the capture landed',
      (WidgetTester tester) async {
    await _pump(tester);

    await _tap(tester, find.text('Exporter').first);

    expect(find.text('Écrit : /tmp/diagnostic.json'), findsOneWidget);
  });
}
