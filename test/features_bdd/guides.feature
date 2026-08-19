Feature: Bibliothèque de guides

  Scenario: La bibliothèque liste les guides embarqués
    Given l'application est lancée
    When j'ouvre la bibliothèque de guides
    Then je vois {'Explorer la galaxie'} text
    And je vois {'Faire évoluer son Artemis Suit sans jamais combattre'} text

  Scenario: La recherche porte sur le texte complet des guides
    Given l'application est lancée
    When j'ouvre la bibliothèque de guides
    And je cherche {'arc cutter'} dans les guides
    Then je vois {'Faire évoluer son Artemis Suit sans jamais combattre'} text
    And je ne vois pas {'Ta boîte à outils'} text
