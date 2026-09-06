// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/lapplication_est_lancee_avec_un_commandant_vierge.dart';
import './step/une_route_active_de_deux_etapes.dart';
import './step/jouvre_lecran_de_route.dart';
import './step/je_vois_text.dart';
import './step/la_route_annonce_sauts_faits_sur.dart';
import './step/la_route_annonce_especes_analysees_sur.dart';
import './step/le_journal_rapporte_larrivee_a_la_premiere_etape.dart';
import './step/le_journal_rapporte_lanalyse_complete_de_la_premiere_espece.dart';
import './step/la_valeur_en_soute_non_vendue_est.dart';
import './step/le_journal_rapporte_la_vente_de_cette_espece.dart';

void main() {
  group('''Suivi d'une route de session''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await lapplicationEstLanceeAvecUnCommandantVierge(tester);
    }

    testWidgets('''Une route fraîchement posée montre tout ce qui reste''',
        (tester) async {
      await bddSetUp(tester);
      await uneRouteActiveDeDeuxEtapes(tester);
      await jouvreLecranDeRoute(tester);
      await jeVoisText(tester, 'Étape 1 sur 3');
      await laRouteAnnonceSautsFaitsSur(tester, '0', '4');
      await laRouteAnnonceEspecesAnalyseesSur(tester, '0', '2');
    });
    testWidgets('''Arriver dans un système avance le curseur''',
        (tester) async {
      await bddSetUp(tester);
      await uneRouteActiveDeDeuxEtapes(tester);
      await leJournalRapporteLarriveeALaPremiereEtape(tester);
      await jouvreLecranDeRoute(tester);
      await laRouteAnnonceSautsFaitsSur(tester, '2', '4');
      await laRouteAnnonceEspecesAnalyseesSur(tester, '0', '2');
    });
    testWidgets('''Analyser une espèce la retire du reste à faire''',
        (tester) async {
      await bddSetUp(tester);
      await uneRouteActiveDeDeuxEtapes(tester);
      await leJournalRapporteLarriveeALaPremiereEtape(tester);
      await leJournalRapporteLanalyseCompleteDeLaPremiereEspece(tester);
      await jouvreLecranDeRoute(tester);
      await laRouteAnnonceEspecesAnalyseesSur(tester, '1', '2');
      await laValeurEnSouteNonVendueEst(tester, 19010800);
    });
    testWidgets('''Vendre met la soute à zéro sans défaire le travail''',
        (tester) async {
      await bddSetUp(tester);
      await uneRouteActiveDeDeuxEtapes(tester);
      await leJournalRapporteLarriveeALaPremiereEtape(tester);
      await leJournalRapporteLanalyseCompleteDeLaPremiereEspece(tester);
      await leJournalRapporteLaVenteDeCetteEspece(tester);
      await jouvreLecranDeRoute(tester);
      await laRouteAnnonceEspecesAnalyseesSur(tester, '1', '2');
      await laValeurEnSouteNonVendueEst(tester, 0);
    });
    testWidgets('''Sans route active, l'écran propose d'en composer une''',
        (tester) async {
      await bddSetUp(tester);
      await jouvreLecranDeRoute(tester);
      await jeVoisText(tester, 'Le temps disponible décide de la taille');
    });
  });
}
