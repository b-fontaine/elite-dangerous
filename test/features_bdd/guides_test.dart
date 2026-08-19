// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/lapplication_est_lancee.dart';
import './step/jouvre_la_bibliotheque_de_guides.dart';
import './step/je_vois_text.dart';
import './step/je_cherche_dans_les_guides.dart';
import './step/je_ne_vois_pas_text.dart';

void main() {
  group('''Bibliothèque de guides''', () {
    testWidgets('''La bibliothèque liste les guides embarqués''',
        (tester) async {
      await lapplicationEstLancee(tester);
      await jouvreLaBibliothequeDeGuides(tester);
      await jeVoisText(tester, 'Explorer la galaxie');
      await jeVoisText(
          tester, 'Faire évoluer son Artemis Suit sans jamais combattre');
    });
    testWidgets('''La recherche porte sur le texte complet des guides''',
        (tester) async {
      await lapplicationEstLancee(tester);
      await jouvreLaBibliothequeDeGuides(tester);
      await jeChercheDansLesGuides(tester, 'arc cutter');
      await jeVoisText(
          tester, 'Faire évoluer son Artemis Suit sans jamais combattre');
      await jeNeVoisPasText(tester, 'Ta boîte à outils');
    });
  });
}
