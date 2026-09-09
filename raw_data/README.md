# Base de connaissances Elite Dangerous

Cette base de connaissances rassemble une collection de guides de référence en français sur Elite Dangerous, pensés pour
alimenter un système de RAG (Retrieval-Augmented Generation). Chaque guide couvre un domaine du jeu en profondeur, avec
des informations à jour incluant les évolutions les plus récentes (2025-2026).

Cette édition fait suite à un cycle d'enrichissement majeur : les 17 guides existants ont été révisés en profondeur
(corrections factuelles croisées, données chiffrées vérifiées auprès de sources primaires, comblement de zones
d'ombre) et 8 nouveaux guides ont été créés pour couvrir des pans du jeu jusque-là absents (Colonisation, Fleet
Carriers, Minage, BGS, Squadrons, jeu en groupe, Community Goals, combat anti-Thargoïde approfondi). Deux documents
transversaux assurent la cohérence de l'ensemble du corpus.

Un second cycle d'enrichissement ciblé a depuis complété trois guides existants avec des méthodes actionnables et
chiffrées (farming des matériaux d'Engineering et de la boucle Guardian, logistique de transport pour la
Colonisation), et ajouté deux nouveaux guides : l'ingénierie avancée de l'équipement à pied (farming, échange,
optimisation) et un guide transversal sur les premiers pas et la progression de rang du nouveau Commandant.

## Documents de référence transversaux

- [Chronologie canonique](./00-chronologie-canonique.md) — Document de référence qui tranche les incohérences de dates
  relevées entre les guides (Powerplay 2.0/Ascendancy, Trailblazers/Colonisation, Rhino/Nomad, Operations...) et fait
  autorité pour tout fait daté cité ailleurs dans le corpus.
- [Glossaire](./00-glossaire.md) — Sigles et termes techniques du jargon Elite Dangerous (BGS, SCO, CG, CZ, RES, AX, HRP,
  MRP, NMLA, INRA, GalCop...) référencés par liaison depuis les guides thématiques à leur première occurrence.

Les 27 guides thématiques sont regroupés ci-dessous par domaine.

## Débuter et progresser

- [Débuter et progresser dans Elite Dangerous : premiers pas et rangs](./27-debuter-et-progresser.md) — Guide
  transversal sur le parcours du nouveau Commandant (choix de vaisseau, premières activités, priorisation des
  Ingénieurs) et la progression dans les cinq échelles de rang d'Elite Dangerous ; les affirmations signalées
  douteuses par la vérification adversariale ont été corrigées (retrait de l'exigence de Meta-Alloys pour Farseer, non
  corroborée par 06-ingenieurs.md) ou explicitement requalifiées en données non confirmables (portée de saut du
  Hauler, roster exact des vaisseaux CQC, conditions de déblocage de The Dweller/McQuinn/Cheung), faute d'accès à une
  nouvelle recherche web cette session.

## Lore & Politique

- [Elite Dangerous : lore et histoire de l'univers](./01-lore.md) — Guide de référence sur le lore d'Elite Dangerous,
  désormais enrichi d'une chronologie consolidée, de la Pilots Federation, de l'arc AEGIS/Salvation et de portraits
  politiques complets, avec la contradiction de date Ascendancy/Trailblazers tranchée selon la chronologie canonique du
  corpus.

## Systèmes de jeu structurants (Powerplay, BGS, Colonisation, Community Goals)

- [Politique et Powerplay dans Elite Dangerous](./02-powerplay.md) — Guide de référence sur le paysage politique
  galactique et Powerplay 2.0 d'Elite Dangerous, désormais sourcé officiellement sur la chronologie Ascendancy, enrichi
  d'une matrice d'éthos par Power, d'un barème de progression de rang, d'une section sur l'articulation avec la
  Colonisation, et d'une section sur le changement/départ de Power.
- [Le Background Simulation (BGS)](./21-bgs.md) — Guide de référence sur le Background Simulation d'Elite Dangerous
  (factions mineures, influence, états, expansion/retrait, leviers joueurs) avec les dates de Powerplay 2.0 et de la
  Colonisation vérifiées contre la chronologie canonique du corpus plutôt que retirées à tort.
- [La Colonisation de systèmes](./18-colonisation.md) — Guide de référence complet sur la Colonisation de systèmes dans
  Elite Dangerous (revendication, construction, points de construction, orientation économique, interface,
  récompenses, impact Powerplay/BGS) ; les affirmations signalées comme douteuses ont été revérifiées (4 confirmées via
  Wikipédia et le mega-guide communautaire CC BY-SA converti en texte, 1 tableau de pourcentages non confirmable a été
  retiré et documenté comme tel), désormais complété par une section logistique chiffrée (capacité de fret réelle du
  Type-9 Heavy, du Type-8 et de l'Imperial Cutter, méthode de calcul du nombre de rotations) et par la technique
  communautaire du Fleet Carrier comme dépôt avancé (relais en deux temps, mutualisation entre commandants).
- [Community Goals (mécanique générique)](./24-community-goals.md) — Guide de référence sur la mécanique générique des
  Community Goals d'Elite Dangerous (paliers, double suivi de contribution, cycles, récompenses) avec un échantillon
  vérifié de CG marquantes 2015-2026 ; les affirmations signalées comme douteuses ont été recoupées avec la chronologie
  canonique interne du corpus et corrigées ou reformulées avec prudence faute de budget de recherche web disponible.

## Vaisseaux & Équipements

- [Liste complète des vaisseaux d'Elite Dangerous](./03-vaisseaux.md) — Guide de référence sur les 48 vaisseaux d'Elite
  Dangerous (prix, rôles, fiches des 10 vaisseaux récents), enrichi avec des données de hardpoints/emplacements/portée
  de saut calculées directement depuis EDCD/coriolis-data, un tableau des rangs de réputation requis, la liste des
  vaisseaux à chasseur embarqué, et un exemple chiffré du coût réel d'un vaisseau équipé ; toute mention du vaisseau
  « Nomad », dont l'existence n'a pu être confirmée par aucune source fiable, en a été retirée.
- [Liste complète des équipements dans Elite Dangerous](./04-equipements.md) — Guide de référence enrichi sur
  l'équipement d'Elite Dangerous : couvre désormais aussi les contrôleurs de limpets, le blindage de coque (bulkheads)
  et les renforts HRP/MRP, la priorité d'alimentation des modules, les données chiffrées de portée FSD et de
  résistances de bouclier (avec le mécanisme réel de rendement décroissant), et les chasseurs embarqués — toutes les
  nouvelles valeurs étant sourcées sur le jeu de données communautaire EDCD/coriolis-data.

## Guardians & Ingénieurs

- [Guide complet des Guardians dans Elite Dangerous](./05-guardians.md) — Guide de référence sur la civilisation
  Guardian d'Elite Dangerous, enrichi de données chiffrées vérifiées (sites, FSD Booster, armes), de nouvelles
  sous-sections (obélisques, ingénierie des armes, volet à pied Odyssey) et de dates de colonisation corrigées selon la
  chronologie canonique, désormais complété par une boucle de session chiffrée et sourcée (fragments/matériaux par
  plan, mécanique exacte des pylônes/sentinelles/relog, méthode pour enchaîner plusieurs sites rapprochés) avec un
  renvoi structuré vers Canonn Bifrost, Inara et Spansh.
- [Guide complet des Ingénieurs (Engineers) dans Elite Dangerous](./06-ingenieurs.md) — Guide de référence sur le
  système d'Engineering (Ingénieurs, matériaux, blueprints, Technology Brokers) d'Elite Dangerous, enrichi d'une
  section dédiée à l'ingénierie Odyssey, de plafonds de stockage sourcés, d'une scission Guardian/Human Technology
  Broker avec unlocks détaillés, de builds FSD chiffrés et de corrections de blueprints vérifiées face à des sources
  primaires, désormais complété par une méthode de farming actionnable et hiérarchisée des matériaux (Raw /
  Manufactured via High Grade Emissions et sites de crash / Encoded via USS et wakes) avec un usage précis des outils
  communautaires (Inara, EDEngineer, Coriolis/EDSY).

## Combat spatial & AX

- [Guide complet du combat spatial](./08-combat-spatial.md) — Guide de référence sur le combat spatial dans Elite
  Dangerous, désormais enrichi de l'évasion (interdiction, mass lock, wakes), du hull tank chiffré, de builds PvP/PvE
  complets, du système de rang/modes de jeu, du crime et notoriety, et d'un approfondissement du combat anti-Thargoïde
  (AX) avec liens croisés vers le reste du corpus.
- [Combat anti-Thargoïde (AX) approfondi](./25-combat-ax.md) — Guide de référence approfondi sur le combat
  anti-Thargoïde (AX) dans Elite Dangerous : taxonomie des vaisseaux, anatomie des Interceptors, nuages caustiques,
  builds AX et organisations Aegis/AXI, avec une chronologie de fin de guerre (déc. 2024) vérifiée cette session via le
  flux Steam News officiel de Frontier.

## Combat et équipement à pied

- [Guide complet de l'équipement à pied dans Elite Dangerous (Odyssey)](./07-equipement-a-pied.md) — Guide de
  référence francophone sur l'équipement à pied d'Elite Dangerous : Odyssey (combinaisons, armes, outils, ingénierie),
  désormais enrichi d'un catalogue d'armes par fabricant, d'une table de modifications d'outils, d'une section
  mort/rebuy à pied, et harmonisé avec la chronologie canonique du corpus sur les dates disputées (Operations, Caspian
  Explorer, Kestrel Mk II, Trailblazers).
- [Guide complet du combat à pied dans Elite Dangerous](./09-combat-a-pied.md) — Guide de combat à pied enrichi :
  chronologie entièrement recoupée avec 07/13/14/00 (Powerplay 2.0, Colonisation, Caspian Explorer, Kestrel Mk II,
  Rhino), avec retrait des mentions non confirmées du vaisseau « Nomad » et du mode multijoueur « Operations »
  (2026), plus tableaux d'armes par fabricant, ingénierie condensée par Engineer nommé, et nouvelles sous-sections
  détection/infiltration et combat à mains nues.
- [Elite Dangerous : Guide complet des Opérations (Odyssey)](./13-operations.md) — Guide enrichi sur le gameplay à pied
  Odyssey (settlements, missions, infiltration, CZ, équipement, ingénierie), débarrassé de toute mention du mode
  multijoueur « Operations » (2026), dont l'existence n'a pu être confirmée par aucune source fiable, avec des
  tableaux chiffrés (Engineers par archétype, récompenses par menace) et des renvois croisés vers le reste du corpus
  (07, 09, 02, 06, 18, 15, 00).
- [Ingénierie avancée de l'équipement à pied : farming, échange et optimisation](./26-ingenierie-a-pied-avancee.md) —
  Guide de référence avancé sur le farming, l'échange (bartender) et l'optimisation des matériaux d'ingénierie à pied
  dans Elite Dangerous Odyssey, avec une passe de vérification adversariale ayant confirmé les catégories officielles
  du journal (4, pas 6), l'existence et les blueprints de l'Engineer Hero Ferrari, et signalé une divergence non
  résolue sur le nombre d'unités requises pour débloquer Wellington Beck (15 vs 25).

## Exploration

- [Guide complet de l'exploration et de l'exobiologie](./10-exploration.md) — Guide francophone couvrant l'exploration
  spatiale (planification de route, scan FSS/DSS, Neutron Highways, Road to Riches, Distant Worlds, ELW/WW) et
  l'exobiologie Odyssey (taxonomie complète des 15 genres, procédure de scan, rangs de progression et builds chiffrés
  de portée de saut), désormais enrichi de renvois croisés vers le reste du corpus et de données de module vérifiées.

## Économie (Commerce, Transport, Minage, Fleet Carriers)

- [Guide complet du commerce dans Elite Dangerous](./11-commerce.md) — Guide de commerce enrichi couvrant la mécanique
  des prix (offre/demande, économies de station, états de BGS), le rang de commerce, un exemple chiffré complet de
  route en vrac, les vaisseaux de fret (dont Panther Clipper Mk II, Type-8 Transporter et Keelback avec données EDCD
  vérifiées), le rôle des Porte-Vaisseaux et des Community Goals, avec liens croisés vers le reste du corpus.
- [Guide complet du transport dans Elite Dangerous](./12-transport.md) — Guide de référence sur le transport
  (passagers, fret Powerplay, colonisation, matériaux rares) enrichi d'une section Search & Rescue, d'un renvoi vers
  les Fleet Carriers, de tableaux chiffrés (cabines, tonnage de colonisation) et corrigé sur le fabricant du Lynx
  Highliner, avec liens croisés vers le reste du corpus.
- [Le Minage (Mining) dans Elite Dangerous](./20-minage.md) — Guide de référence sur le minage dans Elite Dangerous
  (techniques laser/subsurface/core, équipement, Type-11 Prospector, Rhino, hotspots, rendements, Powerplay), dont les
  affirmations signalées douteuses par la revue adversariale ont été revérifiées via des sources primaires (Steam News
  API, EDCD/FDevIDs, sites communautaires) : la plupart se sont révélées exactes et ont été confirmées avec des
  détails supplémentaires, tandis que les points restés invérifiables (taux Powerplay Torval/Kaine, numéro de patch
  exact du correctif Rhino) ont été corrigés ou nuancés.
- [Porte-vaisseaux de joueur (Fleet Carriers)](./19-fleet-carriers.md) — Guide de référence sur les Porte-Vaisseaux de
  joueur (Fleet Carriers) dans Elite Dangerous : achat, entretien, soute, carburant Tritium, services,
  décommissionnement et usages spécialisés, avec chiffres clés reconfirmés par accès direct aux sources
  (roguey.co.uk, PTN, elite-journal.readthedocs.io, Wikipédia, GitHub) et niveaux de confiance explicites pour les
  points restés incertains.

## Jeu social (Squadrons, Wings, Multicrew, CQC)

- [Escadrons de joueurs (Squadrons)](./22-squadrons.md) — Guide de référence sur le système des Squadrons dans Elite
  Dangerous après la refonte « Vanguards » (août-septembre 2025) : création, rôles/permissions, succession
  automatique, lien avec le BGS et la colonisation, Squadron Carrier, Bank, Browser et classements ; toutes les
  affirmations précédemment jugées douteuses ont été re-vérifiées et confirmées verbatim via le flux JSON brut Steam
  News de Frontier et Inara.cz.
- [Wings, Multicrew et CQC : jouer à plusieurs dans Elite Dangerous](./23-jeu-en-groupe.md) — Guide de référence en
  français couvrant les trois mécaniques multijoueur d'Elite Dangerous (Wing, Multicrew, CQC), avec leurs différences,
  mécaniques de partage des gains, vaisseaux compatibles et chronologie, corrigé et vérifié via Wikipédia et Steam
  après relecture adversariale.

## Nouveautés récentes

- [Guide complet du SRV Rhino](./14-rhino-nomad.md) — Guide révisé sur le SRV Rhino d'Elite Dangerous, confirmé et
  documenté ; le vaisseau « Nomad » et le mode multijoueur « Operations » (2026) qu'il décrivait auparavant ont été
  retirés, aucune source fiable ne confirmant leur existence.

## Roadmap

- [Elite Dangerous : la roadmap des développeurs (fin 2024 – septembre 2026)](./15-roadmap.md) — Synthèse enrichie de
  la feuille de route Frontier (fin 2024 – septembre 2026), désormais recentrée sur les faits propres à la roadmap
  (dates, versions, cadence) avec renvois systématiques vers les guides détaillés du corpus (13-operations,
  14-rhino-nomad, 18-colonisation, 24-community-goals), plusieurs corrections chronologiques vérifiées via
  00-chronologie-canonique.md (dont le retrait des mentions non confirmées du vaisseau « Nomad » et du mode
  multijoueur « Operations », 2026), et de nouveaux tableaux (suivi de la Colonisation, Community Goals, contenu
  annoncé, conversion ARX).

## Outils & Données

- [Elite Dangerous : le guide des outils communautaires](./16-outils.md) — Guide de référence sur l'écosystème
  d'outils tiers d'Elite Dangerous (EDDN, CAPI, bases de données, applications compagnons, assistants vocaux, science,
  commerce, engineering, Powerplay/colonisation et entraide), enrichi et vérifié via recherche factuelle (dépôts
  GitHub, sites officiels) pour cette révision du 8-9 septembre 2026.
- [Sources de données disponibles pour Elite Dangerous](./17-sources-donnees.md) — Guide de référence sur l'écosystème
  de données tiers d'Elite Dangerous (journal local, EDDN, CAPI, EDSM, Inara, Spansh, EDDB, EDCD/coriolis-data, Canonn
  et agrégateurs de niche), enrichi d'exemples copiables, de tables de bitfields et de tableaux d'endpoints vérifiés en
  direct.
