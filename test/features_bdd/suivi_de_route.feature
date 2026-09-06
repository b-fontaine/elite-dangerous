Feature: Suivi d'une route de session

  Background:
    Given l'application est lancée avec un commandant vierge

  Scenario: Une route fraîchement posée montre tout ce qui reste
    Given une route active de deux étapes
    When j'ouvre l'écran de route
    Then je vois {'Étape 1 sur 3'} text
    And la route annonce {'0'} sauts faits sur {'4'}
    And la route annonce {'0'} espèces analysées sur {'2'}

  Scenario: Arriver dans un système avance le curseur
    Given une route active de deux étapes
    And le journal rapporte l'arrivée à la première étape
    When j'ouvre l'écran de route
    Then la route annonce {'2'} sauts faits sur {'4'}
    And la route annonce {'0'} espèces analysées sur {'2'}

  Scenario: Analyser une espèce la retire du reste à faire
    Given une route active de deux étapes
    And le journal rapporte l'arrivée à la première étape
    And le journal rapporte l'analyse complète de la première espèce
    When j'ouvre l'écran de route
    Then la route annonce {'1'} espèces analysées sur {'2'}
    And la valeur en soute non vendue est {19010800}

  Scenario: Vendre met la soute à zéro sans défaire le travail
    Given une route active de deux étapes
    And le journal rapporte l'arrivée à la première étape
    And le journal rapporte l'analyse complète de la première espèce
    And le journal rapporte la vente de cette espèce
    When j'ouvre l'écran de route
    Then la route annonce {'1'} espèces analysées sur {'2'}
    And la valeur en soute non vendue est {0}

  Scenario: Sans route active, l'écran propose d'en composer une
    When j'ouvre l'écran de route
    Then je vois {'Le temps disponible décide de la taille'} text
