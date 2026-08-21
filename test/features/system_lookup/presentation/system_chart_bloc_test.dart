import 'dart:async';

import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/features/system_lookup/domain/entities/body_landmarks.dart';
import 'package:elite_dangerous/features/system_lookup/domain/entities/charted_system.dart';
import 'package:elite_dangerous/features/system_lookup/domain/repositories/system_lookup_repository.dart';
import 'package:elite_dangerous/features/system_lookup/domain/usecases/system_lookup_usecases.dart';
import 'package:elite_dangerous/features/system_lookup/presentation/bloc/system_chart_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

/// A repository that answers on command and records what it was asked.
class _FakeRepository implements SystemLookupRepository {
  _FakeRepository({this.isSupported = true});

  @override
  final bool isSupported;

  ChartedSystem? cached;
  Result<ChartedSystem>? systemAnswer;
  Result<BodyLandmarks>? landmarksAnswer;

  int systemCalls = 0;
  int landmarkCalls = 0;
  DateTime? lastSignalsUpdatedAt;

  /// When set, a landmark request hangs until it is completed by the test —
  /// the only way to have two taps land while one request is genuinely in
  /// flight.
  Completer<void>? hold;

  @override
  Future<Result<ChartedSystem>> system(int id64, {bool refresh = false}) async {
    systemCalls++;
    return systemAnswer ??
        const ResultFailure<ChartedSystem>(NetworkFailure());
  }

  @override
  Future<Result<BodyLandmarks>> landmarks(
    int bodyId64, {
    DateTime? signalsUpdatedAt,
    bool refresh = false,
  }) async {
    landmarkCalls++;
    lastSignalsUpdatedAt = signalsUpdatedAt;
    if (hold case final Completer<void> pending) {
      await pending.future;
    }
    return landmarksAnswer ??
        const ResultFailure<BodyLandmarks>(NetworkFailure());
  }

  @override
  Future<ChartedSystem?> cachedSystem(int id64) async => cached;

  @override
  Future<void> clearCache() async => cached = null;
}

void main() {
  late _FakeRepository repository;

  SystemChartBloc build() => SystemChartBloc(
        LookupSystem(repository),
        LookupBodyLandmarks(repository),
        ReadCachedSystem(repository),
        CanLookUpSystems(repository),
      );

  ChartedSystem system({String name = '36 Ophiuchi', bool fromCache = false}) =>
      ChartedSystem(
        id64: 1865903245675,
        name: name,
        fetchedAt: DateTime.utc(2026, 8, 20, 12),
        fromCache: fromCache,
        bodies: <ChartedBody>[
          ChartedBody(
            id64: 1188952167529056619,
            name: '36 Ophiuchi C 4',
            bodyId: 26,
            landable: true,
            biologicalSignals: 2,
            signalsUpdatedAt: DateTime.utc(2026, 8, 2, 22, 54, 28),
          ),
        ],
      );

  setUp(() => repository = _FakeRepository());

  group('arriver quelque part', () {
    test('ne déclenche aucune requête', () async {
      final SystemChartBloc bloc = build();

      bloc.add(const SystemChartTargetChanged(
        id64: 1865903245675,
        systemName: '36 Ophiuchi',
      ));
      await pumpEventQueue();

      // Le cœur de la feature : traverser vingt systèmes vers une nébuleuse
      // n'envoie rien du tout.
      expect(repository.systemCalls, 0);
      expect(bloc.state.canAsk, isTrue);
      expect(bloc.state.hasAnswer, isFalse);
      await bloc.close();
    });

    test('montre ce qui est déjà en cache', () async {
      repository.cached = system(fromCache: true);
      final SystemChartBloc bloc = build();

      bloc.add(const SystemChartTargetChanged(id64: 1865903245675));
      await pumpEventQueue();

      expect(repository.systemCalls, 0);
      expect(bloc.state.system!.name, '36 Ophiuchi');
      expect(bloc.state.isFromCache, isTrue);
      await bloc.close();
    });

    test('sans identifiant, il n\'y a rien à demander', () async {
      final SystemChartBloc bloc = build();

      bloc.add(const SystemChartTargetChanged(systemName: 'Inconnu'));
      await pumpEventQueue();

      expect(bloc.state.canAsk, isFalse);
      expect(repository.systemCalls, 0);
      await bloc.close();
    });

    test('changer de système jette ce qui concernait le précédent', () async {
      repository.systemAnswer = Result<ChartedSystem>.ok(system());
      repository.landmarksAnswer = Result<BodyLandmarks>.ok(
        BodyLandmarks(
          bodyId64: 1188952167529056619,
          bodyName: '36 Ophiuchi C 4',
          fetchedAt: DateTime.utc(2026, 8, 20),
        ),
      );
      final SystemChartBloc bloc = build();

      bloc.add(const SystemChartTargetChanged(id64: 1865903245675));
      bloc.add(const SystemChartRequested());
      await pumpEventQueue();
      bloc.add(SystemChartBodyRequested(bloc.state.system!.bodies.single));
      await pumpEventQueue();
      expect(bloc.state.landmarks, isNotEmpty);

      bloc.add(const SystemChartTargetChanged(id64: 10477373803));
      await pumpEventQueue();

      // Garder les corps montrerait à un commandant qui vient de sauter les
      // espèces du système qu'il a quitté.
      expect(bloc.state.system, isNull);
      expect(bloc.state.landmarks, isEmpty);
      await bloc.close();
    });
  });

  group('demander', () {
    test('interroge et rend le système', () async {
      repository.systemAnswer = Result<ChartedSystem>.ok(system());
      final SystemChartBloc bloc = build();

      bloc.add(const SystemChartTargetChanged(id64: 1865903245675));
      await pumpEventQueue();
      bloc.add(const SystemChartRequested());
      await pumpEventQueue();

      expect(repository.systemCalls, 1);
      expect(bloc.state.system!.bodiesWithBiology, hasLength(1));
      expect(bloc.state.isLoading, isFalse);
      await bloc.close();
    });

    test('un échec laisse en place ce qui était affiché', () async {
      repository.cached = system(name: 'depuis le cache', fromCache: true);
      final SystemChartBloc bloc = build();

      bloc.add(const SystemChartTargetChanged(id64: 1865903245675));
      await pumpEventQueue();
      repository.systemAnswer =
          const ResultFailure<ChartedSystem>(NetworkFailure());
      bloc.add(const SystemChartRequested());
      await pumpEventQueue();

      expect(bloc.state.failure, isA<NetworkFailure>());
      // Vider le panneau parce que le réseau a échoué punirait le commandant
      // deux fois.
      expect(bloc.state.system!.name, 'depuis le cache');
      await bloc.close();
    });

    test('sans identifiant, la demande ne part pas', () async {
      final SystemChartBloc bloc = build();

      bloc.add(const SystemChartRequested());
      await pumpEventQueue();

      expect(repository.systemCalls, 0);
      await bloc.close();
    });
  });

  group('les espèces d\'un corps', () {
    test('sont demandées avec la date de signaux du dump', () async {
      repository.systemAnswer = Result<ChartedSystem>.ok(system());
      repository.landmarksAnswer = Result<BodyLandmarks>.ok(
        BodyLandmarks(
          bodyId64: 1188952167529056619,
          bodyName: '36 Ophiuchi C 4',
          fetchedAt: DateTime.utc(2026, 8, 20),
          species: const <SpeciesSighting>[
            SpeciesSighting(
              genus: 'Stratum',
              species: 'Stratum Tectonicas',
              valueCr: 19010800,
            ),
          ],
        ),
      );
      final SystemChartBloc bloc = build();

      bloc.add(const SystemChartTargetChanged(id64: 1865903245675));
      await pumpEventQueue();
      bloc.add(const SystemChartRequested());
      await pumpEventQueue();

      final ChartedBody body = bloc.state.system!.bodies.single;
      bloc.add(SystemChartBodyRequested(body));
      await pumpEventQueue();

      expect(repository.landmarkCalls, 1);
      // C'est cette date qui décide si un relevé en cache est encore vrai.
      expect(
        repository.lastSignalsUpdatedAt,
        DateTime.utc(2026, 8, 2, 22, 54, 28),
      );
      expect(bloc.state.landmarksFor(body)!.totalValueCr, 19010800);
      expect(bloc.state.isPending(body), isFalse);
      await bloc.close();
    });

    test('un second appui pendant la requête ne la double pas', () async {
      // Le garde ne peut pas vivre dans l'état émis : bloc lance les gestion-
      // naires en parallèle, et le second appui entre avant que le premier
      // n'ait émis quoi que ce soit.
      repository.hold = Completer<void>();
      repository.landmarksAnswer = Result<BodyLandmarks>.ok(
        BodyLandmarks(
          bodyId64: 1188952167529056619,
          bodyName: 'A 1',
          fetchedAt: DateTime.utc(2026, 8, 20),
        ),
      );
      final SystemChartBloc bloc = build();
      const ChartedBody body = ChartedBody(
        id64: 1188952167529056619,
        name: 'A 1',
        biologicalSignals: 1,
      );

      bloc.add(const SystemChartBodyRequested(body));
      await pumpEventQueue();
      expect(bloc.state.isPending(body), isTrue);

      bloc.add(const SystemChartBodyRequested(body));
      await pumpEventQueue();

      expect(repository.landmarkCalls, 1);

      repository.hold!.complete();
      await pumpEventQueue();

      expect(bloc.state.isPending(body), isFalse);
      expect(bloc.state.landmarksFor(body), isNotNull);
      await bloc.close();
    });

    test('deux appuis dans la même image ne font qu\'une requête', () async {
      repository.hold = Completer<void>();
      final SystemChartBloc bloc = build();
      const ChartedBody body = ChartedBody(
        id64: 1188952167529056619,
        name: 'A 1',
        biologicalSignals: 1,
      );

      // Sans pompage entre les deux : c'est le double-clic, et le cas où un
      // garde lu dans l'état émis arrive trop tard.
      bloc.add(const SystemChartBodyRequested(body));
      bloc.add(const SystemChartBodyRequested(body));
      await pumpEventQueue();

      expect(repository.landmarkCalls, 1);
      repository.hold!.complete();
      await pumpEventQueue();
      await bloc.close();
    });

    test('un échec sur un corps n\'efface pas le système', () async {
      repository.systemAnswer = Result<ChartedSystem>.ok(system());
      final SystemChartBloc bloc = build();

      bloc.add(const SystemChartTargetChanged(id64: 1865903245675));
      await pumpEventQueue();
      bloc.add(const SystemChartRequested());
      await pumpEventQueue();

      bloc.add(SystemChartBodyRequested(bloc.state.system!.bodies.single));
      await pumpEventQueue();

      expect(bloc.state.failure, isA<NetworkFailure>());
      expect(bloc.state.system, isNotNull);
      expect(bloc.state.pendingBodies, isEmpty);
      await bloc.close();
    });
  });

  test('sur une cible non supportée, rien n\'est proposé', () async {
    repository = _FakeRepository(isSupported: false);
    final SystemChartBloc bloc = build();

    bloc.add(const SystemChartTargetChanged(id64: 1865903245675));
    await pumpEventQueue();

    expect(bloc.state.isSupported, isFalse);
    expect(bloc.state.canAsk, isFalse);
    // Le navigateur refuse la requête avant qu'elle parte : proposer le bouton
    // serait promettre une réponse qui ne viendra jamais.
    expect(repository.systemCalls, 0);
    await bloc.close();
  });
}
