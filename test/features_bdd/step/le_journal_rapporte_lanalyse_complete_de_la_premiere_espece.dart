import 'package:flutter_test/flutter_test.dart';

import '_journal_lines.dart';
import 'une_route_active_de_deux_etapes.dart';

/// Usage: Given le journal rapporte l'analyse complète de la première espèce
///
/// `Analyse` is the third sample whatever came before, so one line is enough to
/// complete the organism — which is what an import starting mid-organism looks
/// like in real life.
Future<void> leJournalRapporteLanalyseCompleteDeLaPremiereEspece(
  WidgetTester tester,
) async {
  await importJournalLines(tester, <Map<String, dynamic>>[
    <String, dynamic>{
      'timestamp': bddTimestamp(5),
      'event': 'ScanOrganic',
      'ScanType': 'Analyse',
      'Genus': r'$Codex_Ent_Stratum_Genus_Name;',
      'Species': r'$Codex_Ent_Stratum_02_Name;',
      'SystemAddress': bddBorforAddress,
      'Body': 4,
    },
  ]);
}
