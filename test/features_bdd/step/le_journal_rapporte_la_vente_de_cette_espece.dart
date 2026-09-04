import 'package:flutter_test/flutter_test.dart';

import '_journal_lines.dart';

/// Usage: Given le journal rapporte la vente de cette espèce
Future<void> leJournalRapporteLaVenteDeCetteEspece(WidgetTester tester) async {
  await importJournalLines(tester, <Map<String, dynamic>>[
    <String, dynamic>{
      'timestamp': bddTimestamp(9),
      'event': 'SellOrganicData',
      'MarketID': 128666762,
      'BioData': <Map<String, dynamic>>[
        <String, dynamic>{
          'Genus': r'$Codex_Ent_Stratum_Genus_Name;',
          'Species': r'$Codex_Ent_Stratum_02_Name;',
          'Species_Localised': 'Stratum Tectonicas',
          'Value': 19010800,
          'Bonus': 0,
        },
      ],
    },
  ]);
}
