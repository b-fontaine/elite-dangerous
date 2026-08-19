// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/le_catalogue_dexobiologie_est_charge.dart';
import './step/un_corps_de_type_avec_une_atmosphere.dart';
import './step/une_temperature_de_k_et_une_gravite_de_g.dart';
import './step/je_demande_les_especes_possibles.dart';
import './step/la_premiere_candidate_est.dart';
import './step/elle_est_annoncee_comme.dart';
import './step/une_gravite_de_g.dart';
import './step/la_candidate_est_annoncee_comme.dart';
import './step/lespece_a_deja_ete_vendue_depuis_ce_corps.dart';
import './step/la_candidate_est_signalee_comme_deja_vendue.dart';

void main() {
  group('''Identification des espèces sur un corps''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await leCatalogueDexobiologieEstCharge(tester);
    }

    testWidgets(
        '''Un monde HMC chaud à faible gravité annonce du Stratum Tectonicas''',
        (tester) async {
      await bddSetUp(tester);
      await unCorpsDeTypeAvecUneAtmosphere(tester, 'hmc', 'carbon_dioxide');
      await uneTemperatureDeKEtUneGraviteDeG(tester, 190, 0.21);
      await jeDemandeLesEspecesPossibles(tester);
      await laPremiereCandidateEst(tester, 'Stratum Tectonicas');
      await elleEstAnnonceeComme(tester, 'Probable');
    });
    testWidgets(
        '''Une donnée manquante n'est jamais présentée comme certaine''',
        (tester) async {
      await bddSetUp(tester);
      await unCorpsDeTypeAvecUneAtmosphere(tester, 'hmc', 'carbon_dioxide');
      await uneGraviteDeG(tester, 0.21);
      await jeDemandeLesEspecesPossibles(tester);
      await laCandidateEstAnnonceeComme(
          tester, 'Stratum Tectonicas', 'Possible');
    });
    testWidgets('''Une espèce déjà vendue sur ce corps est signalée''',
        (tester) async {
      await bddSetUp(tester);
      await unCorpsDeTypeAvecUneAtmosphere(tester, 'hmc', 'carbon_dioxide');
      await uneTemperatureDeKEtUneGraviteDeG(tester, 190, 0.21);
      await lespeceADejaEteVendueDepuisCeCorps(tester, 'stratum_tectonicas');
      await jeDemandeLesEspecesPossibles(tester);
      await laCandidateEstSignaleeCommeDejaVendue(tester, 'Stratum Tectonicas');
    });
  });
}
