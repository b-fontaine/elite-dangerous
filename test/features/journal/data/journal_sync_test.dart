import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elite_dangerous/core/error/failure.dart';
import 'package:elite_dangerous/core/result/result.dart';
import 'package:elite_dangerous/features/journal/data/datasources/journal_api.dart';
import 'package:elite_dangerous/features/journal/data/datasources/journal_file_data_source.dart';
import 'package:elite_dangerous/features/journal/data/datasources/journal_local_store.dart';
import 'package:elite_dangerous/features/journal/data/repositories/journal_repository_impl.dart';
import 'package:elite_dangerous/features/journal/domain/entities/journal_sync_policy.dart';
import 'package:elite_dangerous/features/journal/domain/repositories/journal_repository.dart';
import 'package:elite_dangerous/features/journal/domain/services/journal_event_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit/retrofit.dart';

import '../../../fixtures/in_memory_stores.dart';

/// Answers `/journal/{day}` from a script, and records the order days were
/// asked for — which is the behaviour under test.
class _ScriptedJournalApi implements JournalApi {
  _ScriptedJournalApi(this.script);

  /// `YYYY-MM-DD` to the response for that day. Anything absent answers `204`.
  final Map<String, ({int status, String body})> script;

  final List<String> requested = <String>[];

  @override
  Future<HttpResponse<String>> journalForDay(
    String year,
    String month,
    String day,
  ) async {
    final String key = '$year-$month-$day';
    requested.add(key);

    final ({int status, String body})? scripted = script[key];
    if (scripted == null) {
      return _response('', HttpStatus.noContent);
    }
    if (scripted.status == HttpStatus.unauthorized) {
      throw DioException(
        requestOptions: RequestOptions(path: '/journal/$year/$month/$day'),
        type: DioExceptionType.badResponse,
        response: Response<String>(
          requestOptions: RequestOptions(path: '/journal/$year/$month/$day'),
          statusCode: HttpStatus.unauthorized,
        ),
      );
    }
    return _response(scripted.body, scripted.status);
  }

  static HttpResponse<String> _response(String body, int status) =>
      HttpResponse<String>(
        body,
        Response<String>(
          requestOptions: RequestOptions(path: '/journal'),
          statusCode: status,
          data: body,
        ),
      );
}

String _line(String day, String event) =>
    '{"timestamp":"${day}T20:00:00Z","event":"$event"}';

void main() {
  const JournalEventParser parser = JournalEventParser();
  late InMemoryKeyValueStore store;
  late InMemoryLineStore lines;
  late JournalLocalStore local;

  /// Today, in the tests. Frontier answers in UTC game time.
  final DateTime today = DateTime.utc(2026, 8, 19);

  JournalRepositoryImpl build(_ScriptedJournalApi api) => JournalRepositoryImpl(
        api,
        const JournalFileDataSource(),
        local,
        parser,
      );

  setUp(() {
    store = InMemoryKeyValueStore();
    lines = InMemoryLineStore();
    local = JournalLocalStore(store, lines);
  });

  group('syncFromCompanionApi', () {
    test('walks backwards from today, newest day first', () async {
      final _ScriptedJournalApi api = _ScriptedJournalApi(<String,
          ({int status, String body})>{
        '2026-08-19': (status: 200, body: _line('2026-08-19', 'Statistics')),
      });
      final JournalRepositoryImpl repository = build(api);

      await repository.syncFromCompanionApi(
        from: today.subtract(const Duration(days: 4)),
        to: today,
      );

      // Newest first is what makes one request enough: the session-start
      // events describing the current state are on the most recent played day.
      expect(api.requested.first, '2026-08-19');
      expect(
        api.requested,
        orderedEquals(<String>[
          '2026-08-19',
          '2026-08-18',
          '2026-08-17',
          '2026-08-16',
          '2026-08-15',
        ]),
      );

      await repository.dispose();
    });

    test('stops after a long enough run of days without a session', () async {
      final _ScriptedJournalApi api =
          _ScriptedJournalApi(const <String, ({int status, String body})>{});
      final JournalRepositoryImpl repository = build(api);

      final Result<JournalSyncReport> result =
          await repository.syncFromCompanionApi(
        from: today.subtract(const Duration(days: 80)),
        to: today,
      );

      final JournalSyncReport report = result.valueOrNull!;
      expect(report.stoppedBecause, JournalSyncStop.quietRun);
      expect(api.requested, hasLength(JournalSyncPolicy.quietDaysBeforeStopping));
      expect(report.daysWithoutPlay, JournalSyncPolicy.quietDaysBeforeStopping);

      await repository.dispose();
    });

    test('a played day resets the quiet run', () async {
      // Ten empty days, one played, then enough silence to stop.
      final _ScriptedJournalApi api = _ScriptedJournalApi(<String,
          ({int status, String body})>{
        '2026-08-09': (status: 200, body: _line('2026-08-09', 'Statistics')),
      });
      final JournalRepositoryImpl repository = build(api);

      final Result<JournalSyncReport> result =
          await repository.syncFromCompanionApi(
        from: today.subtract(const Duration(days: 80)),
        to: today,
      );

      final JournalSyncReport report = result.valueOrNull!;
      expect(report.daysFetched, 1);
      expect(report.stoppedBecause, JournalSyncStop.quietRun);
      // 10 quiet, 1 played, then 21 quiet.
      expect(api.requested, hasLength(32));

      await repository.dispose();
    });

    test('never walks past the ceiling', () async {
      // Every day played, so the quiet-run brake never engages.
      final Map<String, ({int status, String body})> everyDay =
          <String, ({int status, String body})>{};
      for (int i = 0; i < 200; i++) {
        final DateTime day = today.subtract(Duration(days: i));
        final String key = '${day.year}-${day.month.toString().padLeft(2, '0')}'
            '-${day.day.toString().padLeft(2, '0')}';
        everyDay[key] = (status: 200, body: _line(key, 'Statistics'));
      }
      final _ScriptedJournalApi api = _ScriptedJournalApi(everyDay);
      final JournalRepositoryImpl repository = build(api);

      final Result<JournalSyncReport> result =
          await repository.syncFromCompanionApi(
        from: today.subtract(const Duration(days: 500)),
        to: today,
      );

      expect(api.requested, hasLength(JournalSyncPolicy.maxSyncDays));
      expect(result.valueOrNull!.stoppedBecause, JournalSyncStop.budgetSpent);

      await repository.dispose();
    });

    test('does not re-download a past day it already settled', () async {
      final _ScriptedJournalApi first = _ScriptedJournalApi(<String,
          ({int status, String body})>{
        '2026-08-19': (status: 200, body: _line('2026-08-19', 'Statistics')),
        '2026-08-18': (status: 200, body: _line('2026-08-18', 'Loadout')),
      });
      final JournalRepositoryImpl repository = build(first);
      await repository.syncFromCompanionApi(
        from: today.subtract(const Duration(days: 2)),
        to: today,
      );
      await repository.dispose();

      final _ScriptedJournalApi second = _ScriptedJournalApi(<String,
          ({int status, String body})>{
        '2026-08-19': (status: 200, body: _line('2026-08-19', 'Statistics')),
      });
      final JournalRepositoryImpl again = build(second);
      final Result<JournalSyncReport> result =
          await again.syncFromCompanionApi(
        from: today.subtract(const Duration(days: 2)),
        to: today,
      );

      // Today is never settled — the session may still be running — but the
      // two past days are, so only today goes back to Frontier.
      expect(second.requested, orderedEquals(<String>['2026-08-19']));
      expect(result.valueOrNull!.daysAlreadyKnown, 2);

      await again.dispose();
    });

    test('a day Frontier could not gather stays unsettled', () async {
      final _ScriptedJournalApi first = _ScriptedJournalApi(<String,
          ({int status, String body})>{
        '2026-08-18': (
          status: HttpStatus.partialContent,
          body: _line('2026-08-18', 'Statistics'),
        ),
      });
      final JournalRepositoryImpl repository = build(first);
      final Result<JournalSyncReport> result =
          await repository.syncFromCompanionApi(
        from: today.subtract(const Duration(days: 1)),
        to: today,
      );
      expect(result.valueOrNull!.partialDays, contains('2026-08-18'));
      await repository.dispose();

      final _ScriptedJournalApi second = _ScriptedJournalApi(<String,
          ({int status, String body})>{
        '2026-08-18': (status: 200, body: _line('2026-08-18', 'Statistics')),
      });
      final JournalRepositoryImpl again = build(second);
      await again.syncFromCompanionApi(
        from: today.subtract(const Duration(days: 1)),
        to: today,
      );

      // Frontier asks for a 206 to be retried, so it must be asked again.
      expect(second.requested, contains('2026-08-18'));
      await again.dispose();
    });

    test('one refusal does not become ninety', () async {
      final _ScriptedJournalApi api = _ScriptedJournalApi(<String,
          ({int status, String body})>{
        '2026-08-19': (status: HttpStatus.unauthorized, body: ''),
      });
      final JournalRepositoryImpl repository = build(api);

      final Result<JournalSyncReport> result =
          await repository.syncFromCompanionApi(
        from: today.subtract(const Duration(days: 80)),
        to: today,
      );

      // An expired session greets every remaining day identically.
      expect(api.requested, hasLength(1));
      expect(result.failureOrNull, isA<UnauthorizedFailure>());

      await repository.dispose();
    });

    test('reports the furthest day it reached', () async {
      final _ScriptedJournalApi api = _ScriptedJournalApi(<String,
          ({int status, String body})>{
        '2026-08-19': (status: 200, body: _line('2026-08-19', 'Statistics')),
      });
      final JournalRepositoryImpl repository = build(api);

      final Result<JournalSyncReport> result =
          await repository.syncFromCompanionApi(
        from: today.subtract(const Duration(days: 3)),
        to: today,
      );

      final JournalSyncReport report = result.valueOrNull!;
      expect(report.oldestDayReached, '2026-08-16');
      expect(report.stoppedBecause, JournalSyncStop.rangeExhausted);
      expect(report.daysFetched, 1);
      expect(report.daysWithoutPlay, 3);

      await repository.dispose();
    });

    test('refuses a range that runs backwards', () async {
      final JournalRepositoryImpl repository = build(
        _ScriptedJournalApi(const <String, ({int status, String body})>{}),
      );

      final Result<JournalSyncReport> result =
          await repository.syncFromCompanionApi(
        from: today,
        to: today.subtract(const Duration(days: 3)),
      );

      expect(result.failureOrNull, isA<ValidationFailure>());
      await repository.dispose();
    });
  });
}
