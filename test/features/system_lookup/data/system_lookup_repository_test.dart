import 'package:dio/dio.dart';
import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/core/time/clock.dart';
import 'package:elite_dangerous/features/system_lookup/data/datasources/spansh_api.dart';
import 'package:elite_dangerous/features/system_lookup/data/datasources/system_lookup_cache.dart';
import 'package:elite_dangerous/features/system_lookup/data/repositories/system_lookup_repository_impl.dart';
import 'package:elite_dangerous/features/system_lookup/domain/entities/body_landmarks.dart';
import 'package:elite_dangerous/features/system_lookup/domain/entities/charted_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit/retrofit.dart';

import '../../../fixtures/in_memory_stores.dart';

/// An API that counts what it was asked and answers whatever it was told to.
///
/// The point of most of these tests is the *absence* of a call: caching here
/// is not a speed optimisation, it is what keeps this app from hammering a
/// service that publishes no rate limit and no terms of use. A test that only
/// checked the returned value would pass while the app made the request twice.
class _FakeSpanshApi implements SpanshApi {
  _FakeSpanshApi({this.dumpAnswer, this.bodyAnswer});

  Map<String, dynamic>? dumpAnswer;
  Map<String, dynamic>? bodyAnswer;
  DioException? throwing;

  int dumpCalls = 0;
  int bodyCalls = 0;

  @override
  Future<HttpResponse<dynamic>> dump(int id64) async {
    dumpCalls++;
    return _answer(dumpAnswer);
  }

  @override
  Future<HttpResponse<dynamic>> body(int id64) async {
    bodyCalls++;
    return _answer(bodyAnswer);
  }

  HttpResponse<dynamic> _answer(Map<String, dynamic>? payload) {
    if (throwing case final DioException error) {
      throw error;
    }
    final RequestOptions options = RequestOptions(path: '/');
    return HttpResponse<dynamic>(
      payload,
      Response<dynamic>(requestOptions: options, data: payload),
    );
  }
}

class _MovableClock implements Clock {
  _MovableClock(this._now);

  DateTime _now;

  void advance(Duration by) => _now = _now.add(by);

  @override
  DateTime now() => _now;
}

void main() {
  late _FakeSpanshApi api;
  late InMemoryKeyValueStore store;
  late SystemLookupCache cache;
  late _MovableClock clock;
  late SystemLookupRepositoryImpl repository;

  Map<String, dynamic> dump({String name = '36 Ophiuchi'}) =>
      <String, dynamic>{
        'system': <String, dynamic>{
          'id64': 1865903245675,
          'name': name,
          'bodyCount': 41,
          'bodies': <Map<String, dynamic>>[
            <String, dynamic>{
              'id64': 1188952167529056619,
              'bodyId': 26,
              'name': '36 Ophiuchi C 4',
              'isLandable': true,
              'signals': <String, dynamic>{
                'signals': <String, dynamic>{r'$SAA_SignalType_Biological;': 2},
                'updateTime': '2026-08-02 22:54:28+00',
              },
            },
          ],
        },
      };

  Map<String, dynamic> bodyRecord({String updatedAt = '2026-08-02 22:54:28+00'}) =>
      <String, dynamic>{
        'record': <String, dynamic>{
          'id64': 1188952167529056619,
          'name': '36 Ophiuchi C 4',
          'signals_updated_at': updatedAt,
          'landmarks': <Map<String, dynamic>>[
            <String, dynamic>{
              'type': 'Stratum',
              'subtype': 'Stratum Tectonicas',
              'variant': 'Lime',
              'value': 19010800,
              'latitude': -36.704754,
              'longitude': -99.003242,
            },
          ],
        },
      };

  setUp(() {
    api = _FakeSpanshApi(dumpAnswer: dump(), bodyAnswer: bodyRecord());
    store = InMemoryKeyValueStore();
    cache = SystemLookupCache(store);
    clock = _MovableClock(DateTime.utc(2026, 8, 20, 12));
    repository = SystemLookupRepositoryImpl(api, cache, clock);
  });

  group('un système', () {
    test('la première demande interroge Spansh', () async {
      final Result<ChartedSystem> result =
          await repository.system(1865903245675);

      expect(api.dumpCalls, 1);
      expect(result.valueOrNull!.name, '36 Ophiuchi');
      expect(result.valueOrNull!.fromCache, isFalse);
    });

    test('la seconde ne l\'interroge pas', () async {
      await repository.system(1865903245675);
      final Result<ChartedSystem> result =
          await repository.system(1865903245675);

      expect(api.dumpCalls, 1);
      expect(result.valueOrNull!.fromCache, isTrue);
      expect(result.valueOrNull!.bodies.single.bodyId, 26);
    });

    test('une entrée de plus de deux semaines est redemandée', () async {
      await repository.system(1865903245675);
      clock.advance(const Duration(days: 15));

      await repository.system(1865903245675);

      expect(api.dumpCalls, 2);
    });

    test('un rafraîchissement explicite passe outre le cache', () async {
      await repository.system(1865903245675);
      api.dumpAnswer = dump(name: '36 Ophiuchi renommé');

      final Result<ChartedSystem> result =
          await repository.system(1865903245675, refresh: true);

      expect(api.dumpCalls, 2);
      expect(result.valueOrNull!.name, '36 Ophiuchi renommé');
    });

    test('un système absent donne un échec nommant Spansh', () async {
      api.throwing = DioException(
        requestOptions: RequestOptions(path: '/'),
        type: DioExceptionType.receiveTimeout,
      );

      final Result<ChartedSystem> result =
          await repository.system(1865903245675);

      final Failure failure = result.failureOrNull!;
      expect(failure, isA<NetworkFailure>());
      // Dire « Frontier ne répond pas » enverrait le commandant vérifier sa
      // session de jeu pour un problème qui n'a rien à voir.
      expect(failure.message, contains('Spansh'));
    });

    test('une réponse illisible est un échec, pas un système vide', () async {
      api.dumpAnswer = <String, dynamic>{'error': 'Could not find record'};

      final Result<ChartedSystem> result =
          await repository.system(1865903245675);

      expect(result.failureOrNull, isA<ParsingFailure>());
    });

    test('le cache reste lisible après un échec', () async {
      await repository.system(1865903245675);
      api.throwing = DioException(
        requestOptions: RequestOptions(path: '/'),
        type: DioExceptionType.connectionError,
      );

      final ChartedSystem? kept = await repository.cachedSystem(1865903245675);

      expect(kept, isNotNull);
      expect(kept!.name, '36 Ophiuchi');
    });

    test('vider le cache fait tout redemander', () async {
      await repository.system(1865903245675);
      await repository.clearCache();

      await repository.system(1865903245675);

      expect(api.dumpCalls, 2);
      expect(await repository.cachedSystem(1865903245675), isNotNull);
    });
  });

  group('les espèces d\'un corps', () {
    test('la première demande interroge Spansh', () async {
      final Result<BodyLandmarks> result =
          await repository.landmarks(1188952167529056619);

      expect(api.bodyCalls, 1);
      expect(result.valueOrNull!.species.single.species, 'Stratum Tectonicas');
      expect(result.valueOrNull!.totalValueCr, 19010800);
    });

    test('un relevé en cache est servi tant que les signaux n\'ont pas bougé',
        () async {
      await repository.landmarks(
        1188952167529056619,
        signalsUpdatedAt: DateTime.utc(2026, 8, 2, 22, 54, 28),
      );

      final Result<BodyLandmarks> result = await repository.landmarks(
        1188952167529056619,
        signalsUpdatedAt: DateTime.utc(2026, 8, 2, 22, 54, 28),
      );

      expect(api.bodyCalls, 1);
      expect(result.valueOrNull!.fromCache, isTrue);
    });

    test('des signaux mis à jour invalident le relevé', () async {
      // C'est la règle du document : c'est `signals.updateTime` qui périme une
      // liste d'espèces, pas l'horloge — neuf jours d'écart ont été mesurés
      // entre lui et la date de mise à jour du corps.
      await repository.landmarks(
        1188952167529056619,
        signalsUpdatedAt: DateTime.utc(2026, 8, 2, 22, 54, 28),
      );

      await repository.landmarks(
        1188952167529056619,
        signalsUpdatedAt: DateTime.utc(2026, 8, 19),
      );

      expect(api.bodyCalls, 2);
    });

    test('le temps qui passe seul ne périme pas un relevé', () async {
      await repository.landmarks(
        1188952167529056619,
        signalsUpdatedAt: DateTime.utc(2026, 8, 2, 22, 54, 28),
      );
      clock.advance(const Duration(days: 400));

      await repository.landmarks(
        1188952167529056619,
        signalsUpdatedAt: DateTime.utc(2026, 8, 2, 22, 54, 28),
      );

      expect(api.bodyCalls, 1);
    });

    test('sans date de signaux connue, le cache est conservé', () async {
      await repository.landmarks(1188952167529056619);

      await repository.landmarks(1188952167529056619);

      expect(api.bodyCalls, 1);
    });
  });
}
