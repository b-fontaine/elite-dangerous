Feature: Identification des espèces sur un corps

  Background:
    Given le catalogue d'exobiologie est chargé

  Scenario: Un monde HMC chaud à faible gravité annonce du Stratum Tectonicas
    Given un corps de type {'hmc'} avec une atmosphère {'carbon_dioxide'}
    And une température de {190} K et une gravité de {0.21} g
    When je demande les espèces possibles
    Then la première candidate est {'Stratum Tectonicas'}
    And elle est annoncée comme {'Probable'}

  Scenario: Une donnée manquante n'est jamais présentée comme certaine
    Given un corps de type {'hmc'} avec une atmosphère {'carbon_dioxide'}
    And une gravité de {0.21} g
    When je demande les espèces possibles
    Then la candidate {'Stratum Tectonicas'} est annoncée comme {'Possible'}

  Scenario: Une espèce déjà vendue sur ce corps est signalée
    Given un corps de type {'hmc'} avec une atmosphère {'carbon_dioxide'}
    And une température de {190} K et une gravité de {0.21} g
    And l'espèce {'stratum_tectonicas'} a déjà été vendue depuis ce corps
    When je demande les espèces possibles
    Then la candidate {'Stratum Tectonicas'} est signalée comme déjà vendue
