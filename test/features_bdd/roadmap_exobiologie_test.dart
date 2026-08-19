// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/lapplication_est_lancee_avec_un_commandant_vierge.dart';
import './step/jouvre_la_feuille_de_route.dart';
import './step/je_vois_text.dart';
import './step/letape_est_marquee.dart';
import './step/je_filtre_la_feuille_de_route_sur.dart';
import './step/je_marque_letape_comme_faite.dart';
import './step/letape_nest_plus_bloquee.dart';
import './step/le_commandant_transporte_credits_de_donnees_non_vendues.dart';
import './step/la_premiere_etape_est.dart';

void main() {
  group('''Feuille de route d'exobiologie''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await lapplicationEstLanceeAvecUnCommandantVierge(tester);
    }

    testWidgets('''Un commandant sans Artemis doit d'abord en acheter une''',
        (tester) async {
      await bddSetUp(tester);
      await jouvreLaFeuilleDeRoute(tester);
      await jeVoisText(tester, 'Acheter l\'Artemis Suit');
      await letapeEstMarquee(tester, 'equipment.artemis_suit', 'À faire');
    });
    testWidgets('''Ce qui dépend de la combinaison est bloqué, pas caché''',
        (tester) async {
      await bddSetUp(tester);
      await jouvreLaFeuilleDeRoute(tester);
      await jeFiltreLaFeuilleDeRouteSur(tester, 'Bloqué');
      await jeVoisText(tester, 'Passer l\'Artemis au grade 2');
    });
    testWidgets('''Cocher une étape débloque la suite''', (tester) async {
      await bddSetUp(tester);
      await jouvreLaFeuilleDeRoute(tester);
      await jeMarqueLetapeCommeFaite(tester, 'equipment.artemis_suit');
      await letapeNestPlusBloquee(tester, 'equipment.artemis_grade_2');
    });
    testWidgets('''Les données non vendues passent avant tout le reste''',
        (tester) async {
      await bddSetUp(tester);
      await leCommandantTransporteCreditsDeDonneesNonVendues(tester, 60000000);
      await jouvreLaFeuilleDeRoute(tester);
      await laPremiereEtapeEst(tester, 'discipline.sell_run');
    });
  });
}
