import 'dart:convert';

import 'package:elite_dangerous/features/commander/domain/entities/rank.dart';
import 'package:elite_dangerous/features/diagnostics/domain/entities/payload_inspection.dart';
import 'package:elite_dangerous/features/diagnostics/domain/services/payload_inspector.dart';
import 'package:elite_dangerous/features/journal/domain/services/journal_event_parser.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/capi_profile_capture.dart';

/// Pins what a real `/profile` proved, so a later refactor cannot quietly
/// reintroduce an assumption the capture disproved.
void main() {
  final PayloadInspector inspector = PayloadInspector(
    parsedJournalEvents: JournalEventParser.supportedEvents,
    modelledRankKeys: <String>{
      for (final RankType type in RankType.values) type.capiKey,
    },
  );

  final ProfileInspection inspection = inspector.inspectProfile(
    jsonDecode(capiProfileCapture) as Map<String, dynamic>,
  );

  InspectionFinding findingFor(String subject) => inspection.findings
      .firstWhere((InspectionFinding finding) => finding.subject == subject);

  group('la capture réelle', () {
    test('porte les neuf clés de premier niveau attendues', () {
      expect(
        inspection.topLevelKeys,
        orderedEquals(<String>[
          'commander',
          'lastStarport',
          'lastSystem',
          'loadout',
          'loadouts',
          'ship',
          'ships',
          'suit',
          'suits',
        ]),
      );
    });

    test(
      'aucun vaisseau stocké ne porte ses modules — la doc communautaire a tort',
      () {
        final InspectionFinding finding =
            findingFor('Équipement des vaisseaux stockés');

        expect(finding.verdict, InspectionVerdict.absent);
        expect(finding.detail, contains('0 / 7'));
      },
    );

    test('les armes sont là, leur grade ne l\'est pas', () {
      final InspectionFinding finding =
          findingFor('Loadouts à pied (armes et grades)');

      // Five loadouts because the equipped one is counted alongside the four
      // saved ones, and eleven weapon slots between them.
      expect(finding.verdict, InspectionVerdict.partial);
      expect(finding.detail, contains('5 loadout'));
      expect(finding.detail, contains('11 arme'));
      expect(finding.detail, contains('grade `class` sur 0'));
      expect(finding.detail, contains('`mods` sur 0'));
      // Frontier's own "not yet implemented" marker, on the two weapons of the
      // equipped loadout — the only ones the payload details. It must never be
      // read as one modification per weapon.
      expect(finding.detail, contains('2 arme(s) portent'));
      expect(finding.detail, contains('NYI'));
    });

    test('un tiers des modules du vaisseau piloté est de la décoration', () {
      final InspectionFinding finding =
          findingFor('Modules du vaisseau piloté');

      expect(finding.detail, contains('41 emplacement'));
      expect(finding.detail, contains('29 fonctionnel'));
      expect(finding.detail, contains('12 cosmétique'));
      expect(finding.detail, contains('1 porte(nt) un bloc `engineer`'));
    });

    test('un hull à zéro rend le rebuy calculé mensonger', () {
      final InspectionFinding finding = findingFor('Valeur et rebuy');

      expect(finding.verdict, InspectionVerdict.partial);
      expect(finding.detail, contains('`hull` vaut 0'));
      expect(finding.detail, contains('Loadout'));
    });

    test('capabilities contredit la charge utile qui le contient', () {
      final InspectionFinding finding = findingFor('Extensions du compte');

      // Odyssey à false sur un compte qui possède Artemis, Maverick et
      // Dominator ; Horizons à false sur un vaisseau qui embarque deux SRV.
      expect(finding.verdict, InspectionVerdict.absent);
      expect(finding.detail, contains('Odyssey est à false'));
      expect(finding.detail, contains('Horizons est à false'));
    });

    test('deux échelles de rang ne sont pas modélisées', () {
      final InspectionFinding finding = findingFor('Rangs');

      expect(finding.verdict, InspectionVerdict.partial);
      expect(finding.detail, contains('13 échelle'));
      expect(finding.detail, contains('builder'));
      expect(finding.detail, contains('learner'));
    });

    test('la station courante achète les données organiques', () {
      final InspectionFinding finding = findingFor('Dernière station');

      expect(finding.verdict, InspectionVerdict.present);
      expect(finding.detail, contains('vistagenomics'));
    });

    test('les combinaisons sont listées, leurs modifications non', () {
      final InspectionFinding finding = findingFor('Combinaisons');

      expect(finding.verdict, InspectionVerdict.present);
      expect(finding.detail, contains('4 possédée'));
      expect(finding.detail, contains('ExplorationSuit_Class1'));
    });
  });
}
