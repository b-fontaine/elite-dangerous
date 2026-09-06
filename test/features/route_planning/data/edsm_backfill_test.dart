import 'package:elite_dangerous/core/network/edsm_endpoints.dart';
import 'package:elite_dangerous/features/route_planning/data/models/edsm_flight_log_dto.dart';
import 'package:flutter_test/flutter_test.dart';

/// One log entry as EDSM returns it with `showId=1`.
Map<String, dynamic> entry({
  required String system,
  int? systemId64,
  String date = '2026-08-14 21:03:11',
  bool firstDiscover = false,
}) =>
    <String, dynamic>{
      'shipId': 12,
      'system': system,
      'systemId': 27,
      'systemId64': ?systemId64,
      'firstDiscover': firstDiscover,
      'date': date,
    };

Map<String, dynamic> page(List<Map<String, dynamic>> logs, {int msgnum = 100}) =>
    <String, dynamic>{
      'msgnum': msgnum,
      'msg': msgnum == 100 ? 'OK' : 'Erreur',
      'logs': logs,
    };

void main() {
  group('EdsmEndpoints.formatDate', () {
    test('uses EDSM\'s format, not ISO 8601', () {
      // EDSM wants `YYYY-MM-DD HH:MM:SS`: a space where ISO puts a T, and no
      // zone suffix. Sending toIso8601String() is silently accepted and
      // silently misread.
      expect(
        EdsmEndpoints.formatDate(DateTime.utc(2026, 8, 14, 21, 3, 11)),
        '2026-08-14 21:03:11',
      );
      expect(
        EdsmEndpoints.formatDate(DateTime.utc(2026, 1, 5, 4, 6, 7)),
        '2026-01-05 04:06:07',
      );
      expect(
        EdsmEndpoints.formatDate(DateTime.utc(2026, 8, 14)),
        isNot(contains('T')),
      );
    });
  });

  group('reading a window', () {
    test('takes the id64 EDSM only sends with showId=1', () {
      // Without showId, EDSM returns a name and its own internal `systemId`,
      // which joins onto nothing. With it, `systemId64` is the game's
      // SystemAddress — the same key a route uses.
      final EdsmFlightLogPage result = EdsmFlightLogPage.fromJson(
        page(<Map<String, dynamic>>[
          entry(system: 'Sol', systemId64: 10477373803),
          entry(system: 'Borfor', systemId64: 1968982460787),
        ]),
      );

      expect(result.isSuccess, isTrue);
      expect(result.systemIds, <int>{10477373803, 1968982460787});
      expect(result.systemNames, <String>{'sol', 'borfor'});
      expect(result.entryCount, 2);
    });

    test('never mistakes EDSM\'s internal systemId for an id64', () {
      // `systemId` is EDSM's own primary key. Reading it as a SystemAddress
      // would fill the index with systems that do not exist.
      final EdsmFlightLogPage result = EdsmFlightLogPage.fromJson(
        page(<Map<String, dynamic>>[entry(system: 'Sol')]),
      );

      expect(result.systemIds, isEmpty);
      expect(result.systemNames, <String>{'sol'});
    });

    test('falls back to names when only some entries carry an id64', () {
      final EdsmFlightLogPage result = EdsmFlightLogPage.fromJson(
        page(<Map<String, dynamic>>[
          entry(system: 'Sol', systemId64: 10477373803),
          entry(system: 'Ailleurs'),
        ]),
      );

      expect(result.systemIds, hasLength(1));
      expect(result.systemNames, hasLength(2));
      expect(result.asIndex.hasVisited(name: 'Ailleurs'), isTrue);
      expect(result.asIndex.hasVisited(id64: 10477373803), isTrue);
    });

    test('reads EDSM dates, which are not ISO either', () {
      final EdsmFlightLogPage result = EdsmFlightLogPage.fromJson(
        page(<Map<String, dynamic>>[
          entry(system: 'Sol', date: '2026-08-14 21:03:11'),
          entry(system: 'Borfor', date: '2026-08-10 06:00:00'),
        ]),
      );

      expect(result.earliest, DateTime.utc(2026, 8, 10, 6));
    });

    test('treats a quiet week as a quiet week, not a failure', () {
      final EdsmFlightLogPage result =
          EdsmFlightLogPage.fromJson(page(<Map<String, dynamic>>[]));

      expect(result.isSuccess, isTrue);
      expect(result.entryCount, 0);
      expect(result.systemNames, isEmpty);
    });
  });

  group('failures EDSM hides behind HTTP 200', () {
    test('a missing key is a failure, not an empty history', () {
      // This is the trap the whole DTO exists for: EDSM answers 200 OK with
      // `msgnum: 202`. A client reading the status code would conclude the
      // commander had never been anywhere, and record that as fact.
      final EdsmFlightLogPage result = EdsmFlightLogPage.fromJson(
        <String, dynamic>{'msgnum': 202, 'msg': 'Missing API key'},
      );

      expect(result.isSuccess, isFalse);
      expect(result.isCredentialFailure, isTrue);
      expect(result.systemNames, isEmpty);
    });

    test('an unknown commander or key is told apart from a network problem',
        () {
      final EdsmFlightLogPage result = EdsmFlightLogPage.fromJson(
        <String, dynamic>{
          'msgnum': 203,
          'msg': 'Commander name/API Key not found',
        },
      );

      expect(result.isCredentialFailure, isTrue,
          reason: 'fixed in the settings screen, not by waiting');
    });

    test('a rate limit is a failure but not a credential one', () {
      final EdsmFlightLogPage result = EdsmFlightLogPage.fromJson(
        <String, dynamic>{'msgnum': 429, 'msg': 'Rate limit exceeded'},
      );

      expect(result.isSuccess, isFalse);
      expect(result.isCredentialFailure, isFalse);
    });

    test('a payload with no msgnum at all is not a success', () {
      expect(
        EdsmFlightLogPage.fromJson(const <String, dynamic>{}).isSuccess,
        isFalse,
      );
    });
  });
}
