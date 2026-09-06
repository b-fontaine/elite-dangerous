import 'package:flutter_test/flutter_test.dart';

import '_journal_lines.dart';
import 'une_route_active_de_deux_etapes.dart';

/// Usage: Given le journal rapporte l'arrivée à la première étape
///
/// An `FSDJump` into Borfor, then the `Scan` that teaches the app which
/// `BodyID` "Borfor 1 d" is — without it no sampling could be attributed, which
/// is the join the whole feature turns on.
Future<void> leJournalRapporteLarriveeALaPremiereEtape(
  WidgetTester tester,
) async {
  await importJournalLines(tester, <Map<String, dynamic>>[
    <String, dynamic>{
      'timestamp': bddTimestamp(1),
      'event': 'FSDJump',
      'StarSystem': 'Borfor',
      'SystemAddress': bddBorforAddress,
    },
    <String, dynamic>{
      'timestamp': bddTimestamp(2),
      'event': 'Scan',
      'ScanType': 'Detailed',
      'BodyName': 'Borfor 1 d',
      'BodyID': 4,
      'StarSystem': 'Borfor',
      'SystemAddress': bddBorforAddress,
      'Landable': true,
    },
  ]);
}
