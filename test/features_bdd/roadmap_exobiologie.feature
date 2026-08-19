# Pilotage par le comportement : ce que l'exobiologiste attend de la feuille
# de route, exprimé dans les termes du jeu.

Feature: Feuille de route d'exobiologie

  Background:
    Given l'application est lancée avec un commandant vierge

  Scenario: Un commandant sans Artemis doit d'abord en acheter une
    When j'ouvre la feuille de route
    Then je vois {'Acheter l\'Artemis Suit'} text
    And l'étape {'equipment.artemis_suit'} est marquée {'À faire'}

  Scenario: Ce qui dépend de la combinaison est bloqué, pas caché
    When j'ouvre la feuille de route
    And je filtre la feuille de route sur {'Bloqué'}
    Then je vois {'Passer l\'Artemis au grade 2'} text

  Scenario: Cocher une étape débloque la suite
    When j'ouvre la feuille de route
    And je marque l'étape {'equipment.artemis_suit'} comme faite
    Then l'étape {'equipment.artemis_grade_2'} n'est plus bloquée

  Scenario: Les données non vendues passent avant tout le reste
    Given le commandant transporte {60000000} crédits de données non vendues
    When j'ouvre la feuille de route
    Then la première étape est {'discipline.sell_run'}
