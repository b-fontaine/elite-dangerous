---
id: 10-exploration
titre: "Guide complet de l'exploration et de l'exobiologie dans Elite Dangerous"
domaine: exploration
entites: [Exobiologie, Vista Genomics, Universal Cartographics, Canonn Research, FSS, DSS,
  Combinaison Artemis, Nomad, Stratum Tectonicas, Fonticulua Fluctus, Neutron Highway, First Logged]
mots_cles_en: [exobiology, Vista Genomics, Universal Cartographics, Full Spectrum System Scanner,
  Detailed Surface Scanner, Artemis suit, first logged, first footfall, neutron highway, Road to Riches]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-09
confiance_globale: haute
volatilite: haute
sources_primaires: [Canonn Research, wiki Elite Dangerous,
  "catalogue d'exobiologie compilé du corpus (édition 2026-08)", EDCD/coriolis-data, EDCD/FDevIDs,
  Steam News Frontier, Spansh, EDSM]
zones_incertaines: ["valeur de 952 296 Cr de Radicoida Unica : observation unique en jeu, à reconfirmer",
  "distance minimale de 15 m pour Radicoida, relevée en jeu contre 100 m au catalogue compilé",
  "contrainte des 2 500 Ls de Clypeus Speculumi, non confirmée par télémétrie",
  "intitulés et ordre exacts des paliers des rangs Explorateur et Exobiologiste : reconstitution communautaire",
  "barèmes de vente Universal Cartographics et formule de valeur des ELW/WW, non reproduits dans ce guide",
  "43 des 109 espèces du catalogue 2.4 sont sans fréquence d'observation publiée",
  "fiches d'habitat de Bark Mound et Brain Tree absentes du catalogue 2.4",
  "taux de rencontre supérieurs prêtés aux secteurs Sinuefai, Sinuefe et Wredguia, non recoupés",
  "portées et temps de scan du Discovery Scanner, du FSS et du DSS, à confirmer sur une source à jour",
  "les 100 000 000 Cr d'une Fonticulua Fluctus en First Logged sont un calcul, non un montant relevé"]
guides_lies: [0, 6, 7, 13, 14, 17, 18, 19, 20, 21, 23, 24, 25, 27]
---

# Guide complet de l'exploration et de l'exobiologie dans Elite Dangerous

## En bref

L'exploration dans *Elite Dangerous* consiste à quitter la Bulle pour scanner des systèmes inconnus au Discovery
Scanner, au FSS (*Full Spectrum System Scanner*) puis au DSS (*Detailed Surface Scanner*), et à vendre ces données aux
comptoirs Universal Cartographics, avec un bonus de première découverte (*first discovered*) et de première
cartographie (*first mapped*). Les routes se tracent sur EDSM et Spansh (Galaxy Plotter, Exact Plotter, Neutron Router,
Road to Riches), la surcharge du FSD sur étoile à neutrons (*neutron highway*) démultipliant la portée de saut. Depuis
Odyssey s'y ajoute l'exobiologie : prélever à pied, en combinaison **Artemis** (*Organic Scanner*, *Composition
Scanner*), trois échantillons d'une même espèce en respectant la distance minimale du genre (15 m à 1 000 m), pour les
vendre à **Vista Genomics**. Le catalogue compte **118 espèces**, de *Radicoida Unica* (952 296 Cr) à *Fonticulua
Fluctus* (20 000 000 Cr), avec un multiplicateur **First Logged ×5** par couple espèce/corps. Depuis la mise à jour
Operations (30 juin 2026), le **Nomad** et son *Mk II Biological Scanner* complètent le SRV au sol.

## Introduction à l'exploration spatiale et à l'exobiologie

L'exploration spatiale est l'une des activités fondatrices d' *Elite Dangerous* : elle consiste à quitter la Bulle (la
région densément peuplée autour de Sol) pour cartographier des systèmes stellaires inconnus, en tirer des données
scientifiques monnayables auprès des comptoirs Universal Cartographics. Depuis l'extension **Odyssey**, cette activité
s'est enrichie d'un volet de terrain : l' **exobiologie**, qui consiste à se poser sur des planètes et lunes pour y
prélever, à pied, des échantillons d'organismes vivants et les revendre à la société Vista Genomics.

Ce guide couvre les deux disciplines de bout en bout : planification de route, scan des systèmes, exploration profonde
(Road to Riches, Neutron Highways, Distant Worlds), vente des données ; puis taxonomie complète de la vie exobiologique,
procédure de scan/échantillonnage, localisation des espèces les plus rentables, rangs de progression et builds de
vaisseau/équipement dédiés.

**Voir aussi dans ce corpus** — l'exploration recoupe plusieurs autres activités documentées séparément :
[Colonisation](./18-colonisation.md) (utiliser les données d'exploration pour choisir un système à coloniser),
[Fleet Carriers](./19-fleet-carriers.md) (base mobile pour les expéditions longue distance),
[Ingénieurs](./06-ingenieurs.md) (modifications de FSD et de combinaison citées dans ce guide),
[Équipement à pied](./07-equipement-a-pied.md) (détail des combinaisons Odyssey),
[Combat anti-Thargoïde (AX)](./25-combat-ax.md) (sites de ruines et structures inconnues croisés en exploration),
[BGS](./21-bgs.md) (influence des factions dans les systèmes ciblés pour la colonisation),
[Le Rhino et le Nomad](./14-rhino-nomad.md) (le véhicule de surface introduit en 2026 pour approcher les organiques,
présenté en 2.2), et le [Glossaire](./00-glossaire.md) pour tous les sigles.

---

## Partie 1 — Exploration spatiale : scan, routes et vente des données

### 1.1 Bref historique de la découverte de la vie extraterrestre (3302 à Odyssey)

L'exploration de surface a connu plusieurs ères successives :

- **En 3302**, les toutes premières découvertes de vie (Bark Mounds, Anémones, Brain Trees, Bernacles Thargoïdes) se
  faisaient à l'œil nu : les commandants survolaient des heures durant les surfaces planétaires à la recherche de
  minuscules points contrastant avec le terrain. Les Bernacles Thargoïdes et d'autres vestiges liés aux Thargoïdes
  restent aujourd'hui documentés plus en détail dans le guide dédié au [combat AX](./25-combat-ax.md).
- **En 3304**, l'amélioration des scanners de vaisseau a facilité la détection à distance des sites d'intérêt.
- **Avec Odyssey**, l'atterrissage à pied est devenu possible sur les planètes à atmosphère fine, donnant naissance à
  l'exobiologie de terrain moderne. La société fictive **Vista Genomics** s'est mise à verser des primes pour tout
  échantillon prélevé avec l'Organic Scanner de la combinaison **Artemis** (voir la mise au point sur les combinaisons
  Odyssey en 2.2 et dans [Équipement à pied](./07-equipement-a-pied.md)).

### 1.2 Planification de route d'exploration : EDSM et Spansh

Deux outils communautaires dominent la planification de trajet :

#### EDSM (Elite Dangerous Star Map — edsm.net) : carte galactique et route planner

- Propose une **Galactic Map** complète avec un **Route Planner** intégré.
- Tient un **flight log** personnel (historique des systèmes visités par le commandant) et un classement des **« systems
  discovered first »**.
- Publie des statistiques globales sur l'état de la découverte galactique. Le nombre de systèmes enregistrés progresse
  en continu à mesure que la communauté explore, mais il ne représente qu'une fraction infime des quelque 400 milliards
  d'étoiles que compte la galaxie du jeu — un ordre de grandeur à garder en tête plutôt qu'un chiffre figé, à consulter
  directement sur la page de statistiques d'EDSM pour une valeur à jour.

#### Spansh (spansh.co.uk) : les quatre calculateurs de route de la communauté

Spansh héberge les calculateurs de route de référence de la communauté :

| Outil Spansh                             | Fonction                                                                          |
|------------------------------------------|-----------------------------------------------------------------------------------|
| **Galaxy Plotter**                       | Route A→B optimisée en nombre de sauts                                            |
| **Exact Plotter**                        | Trajet précis avec contraintes de carburant et de portée de saut                  |
| **Road to Riches**                       | Itinéraire optimisé pour maximiser les gains d'exobiologie sur une zone donnée    |
| **Neutron Router** (Fuel Neutron Router) | Chaîne de sauts le long des étoiles à neutrons pour maximiser la portée effective |

Spansh est largement adopté par la communauté d'explorateurs, y compris par les contributeurs de Canonn Research, pour
tracer les « neutron highways » utilisées lors des grandes traversées de la galaxie.

### 1.3 Scan des systèmes en exploration : Discovery Scanner, FSS, DSS

Trois outils de scan s'utilisent en cascade, du plus grossier au plus précis :

#### Le Discovery Scanner (« honk ») — révélation passive des corps du système

Scanner passif de découverte : il révèle automatiquement l'existence de tous les corps célestes du système dès
l'arrivée, sans action fine du pilote (d'où le surnom de « honk »).

#### Le FSS (Full Spectrum System Scanner) — identification des corps à distance

Le FSS effectue un balayage détaillé des **signatures de fréquence** de chaque corps du système, permettant de les
identifier individuellement (type de planète ou d'étoile, présence de vie, anomalies) sans avoir à s'en approcher
physiquement. C'est l'outil de reconnaissance à distance par excellence, et il est utilisé par Canonn comme véritable
instrument scientifique :

- La page *« Ghost Rings »* documente une recherche sur les anneaux planétaires invisibles à partir de données FSS
  (rayon interne/externe, masse) croisées sur **plus de 4 000 observations** : les anneaux de largeur supérieure à 1,6
  million de km et de densité inférieure à 0,06 Mt/km² s'avèrent invisibles, de même que les anneaux de moins de 6 km de
  large.
- La page *« IEA Helium-Rich Gas Giant Guide »* explique comment repérer au FSS les géantes gazeuses riches en hélium
  (plus de 30 % d'hélium atmosphérique) : signature en forme de « H », nombre anormalement élevé de corps dans le
  système, et effet de **« boxel »** — les systèmes voisins partageant le même code de masse ont des propriétés
  similaires, si bien qu'une géante riche en hélium en signale souvent d'autres à proximité.

#### Le DSS (Detailed Surface Scanner) — cartographie de surface par sondes

Tiré en survol sous forme de sonde, le DSS cartographie la surface d'un corps : il révèle les ressources géologiques et
biologiques exploitables et complète le statut « mapped » qui majore la valeur de revente des données. Sur la carte DSS,
les zones favorables à la vie apparaissent en teinte **sarcelle / vert clair**.

> Les valeurs précises de portée et de temps de scan de ces trois instruments sont globalement stables depuis plusieurs
> versions du jeu. Il est recommandé de les confirmer sur le wiki Fandom ou Inara.cn en cas de doute.

### 1.4 Exploration profonde : Neutron Highways, Road to Riches, Distant Worlds

#### Neutron Highways — surcharge du FSD sur étoile à neutrons

Le terme désigne l'usage de la **surcharge (« supercharge »)** du Frame Shift Drive à proximité d'une étoile à neutrons,
qui permet de démultiplier temporairement la portée de saut. En enchaînant les sauts le long d'une chaîne de neutron
stars pré-calculée (via le Neutron Router de Spansh, notamment), un commandant peut parcourir des distances
considérables très rapidement, ramenant des trajets qui prendraient des milliers de sauts en ligne droite à une fraction
de ce nombre. Même les pulsars à rotation lente permettent ce « supercharge ». Sur le plan scientifique, Canonn
documente également les étoiles à neutrons elles-mêmes : relation masse/rayon proche de la limite de
Tolman-Oppenheimer-Volkoff, diagramme de période de rotation, et vitesse tangentielle pouvant atteindre **0,192c** à
l'équateur d'un pulsar rapide.

À l'intérieur d'un système, le module **SCO** (Supercruise Overcharge — voir le [Glossaire](./00-glossaire.md))
accélère considérablement les déplacements en survitesse et l'approche des corps planétaires ; il complète utilement
les neutron highways pour la phase de trajet intra-système d'une expédition longue distance.

#### Road to Riches — cibler les systèmes à espèces exobiologiques de valeur

Méthode consistant à cibler les systèmes contenant des espèces exobiologiques à haute valeur avant de s'y rendre, plutôt
que de se poser au hasard :

1. Recherche avancée sur **EDSM** (ou sur les listes croisées EDAstro/Canonn) pour repérer les systèmes contenant des
   espèces à haute valeur (ex. *Stratum Tectonicas*) dans un rayon donné (ex. moins de 10 000 années-lumière de Sol).
2. Filtrage des espèces au-delà d'un seuil de valeur (ex. > 400 000 Cr — seuil indicatif cité par le commandant Canonn
   *JJGoldberg* dans son parcours vers le rang Exobiology Elite V, à ajuster selon l'objectif).
3. Traçage d'une route optimisée sur la liste de systèmes obtenue, à l'aide d'un outil dédié (edtools, ou directement
   l'outil **Road to Riches** de Spansh qui automatise l'ensemble de la méthode).

#### Distant Worlds — expéditions communautaires vers les confins de la galaxie

Les expéditions **Distant Worlds** — voyages communautaires massifs et organisés vers les confins de la galaxie —
sont documentées dans les archives Canonn (« Distant Worlds 2 » citée comme community goal, « Distant Worlds 3302 » dans les
actualités Canonn). Ces expéditions relèvent de la mécanique générique des **Community Goals** (voir
[Community Goals](./24-community-goals.md)) et se déroulent le plus souvent en **Wing** organisé (voir
[Wings, Multicrew et CQC](./23-jeu-en-groupe.md)). Le détail logistique des éditions les plus récentes (dates,
itinéraire) évolue d'une édition à l'autre ; il est conseillé de consulter les canaux officiels de la communauté avant
de s'engager sur une expédition en cours.

### 1.5 Vendre ses données d'exploration aux comptoirs Universal Cartographics

Les données de scan — relevés FSS et cartographies DSS — se vendent aux comptoirs **Universal Cartographics** dans les
stations. Un bonus de **« première découverte »** (*first discovered*) et de **« première cartographie »** (*first
mapped*) — c'est-à-dire un corps jamais rapporté par un autre commandant — majore significativement la valeur de la
vente. Les barèmes exacts et la formule de calcul détaillée sont traditionnellement documentés sur Inara.cn et le wiki
Fandom ; il est recommandé de les y consulter avant une session de vente de données à fort volume.

#### Cas particulier : mondes remarquables (Earth-like Worlds et Water Worlds), les corps les mieux valorisés

Deux catégories de corps planétaires se distinguent systématiquement par la valeur de leurs données d'exploration, bien
au-delà de la moyenne des autres types de planète :

- **Earth-like World (ELW)** : planète tellurique à atmosphère respirable proche de celle de la Terre. C'est le type de
  corps le plus recherché par les explorateurs de données, et l'un des plus rares de la galaxie.
- **Water World (WW)** : planète à hydrosphère liquide en surface, sans atmosphère respirable. Moins rare qu'un ELW mais
  toujours nettement plus valorisée qu'une planète rocheuse ou une géante gazeuse classique.

Les deux types partagent des propriétés utiles à connaître :

- Ils sont détectables **avant même le scan DSS complet**, dès le passage au FSS : leur signature de fréquence présente
  une forme caractéristique différente des autres corps telluriques, ce qui permet à un explorateur entraîné de les
  repérer à l'oreille/à l'œil sur l'interface FSS sans attendre l'analyse complète.
- Leur valeur de vente aux comptoirs Universal Cartographics dépend d'une formule intégrant la masse, le rayon et la
  distance parcourue depuis la dernière station — cette formule a été ajustée par Frontier à plusieurs reprises au fil
  des années ; **ne pas se fier à un chiffre en Cr figé** dans un guide communautaire, mais vérifier la valeur courante
  sur EDSM ou Inara.cn (calculateurs de valeur d'exploration) avant une session de vente.
- Ils sont également des cibles privilégiées pour la **colonisation** (voir 1.7 ci-dessous) : un ELW ou un WW dans un
  système autrement éligible en fait une cible de choix pour un projet d'implantation à vocation agricole ou
  touristique.

### 1.6 Boîte à outils du commandant explorateur : les sites Canonn Research

En complément d'EDSM et Spansh, l'écosystème **Canonn Research** propose des outils spécialisés :

| Outil                  | Adresse                                | Fonction                                                                                                |
|------------------------|----------------------------------------|---------------------------------------------------------------------------------------------------------|
| Signals                | signals.canonn.tech                    | Affiche le contenu (biologie/géologie) détecté dans un système                                          |
| Bioforge               | bioforge.canonn.tech                   | Moteur de recherche et d'affichage des données système/corps scannables (biologie), par genre ou espèce |
| Codex-Regions          | canonn-science.github.io/Codex-Regions | Carte des éléments du Codex localisés                                                                   |
| Undiscovered-Codex     | —                                      | Éléments du Codex non encore scannés par le commandant connecté                                         |
| EDMC-Canonn            | github.com/canonn-science/EDMC-Canonn  | Plugin EDMC officiel : capture les événements de jeu et alimente les bases Canonn                       |
| Bifrost                | ruins.canonn.tech                      | Catalogue et visualise les sites de ruines Gardiennes (Guardian)                                        |
| Unknown Structures Map | map.canonn.tech                        | Carte 3D des sites de structures Thargoïdes — voir aussi [Combat AX](./25-combat-ax.md)                 |

### 1.7 Exploration et colonisation : repérer un système éligible à l'implantation

Depuis l'ajout de la **colonisation de systèmes** (mécanique introduite en bêta le 26 février 2025 avec la mise à jour
« Trailblazers », puis sortie de bêta le 11 novembre 2025 avec le « Dodec Update » — voir
[Colonisation](./18-colonisation.md) pour la mécanique complète et à jour), l'exploration a gagné un débouché
supplémentaire : **repérer, en amont, des systèmes éligibles à la colonisation** avant qu'un autre commandant ou une
autre organisation ne s'y installe.

Les outils déjà présentés dans ce guide servent directement à cet usage :

- Le **FSS** et le **DSS** permettent d'évaluer, sans se poser, si un système candidat contient des corps
  intéressants pour un projet d'implantation : présence d'un Earth-like World ou d'un Water World (voir 1.5),
  richesse en ressources minières exploitables (anneaux, hotspots — voir [Minage](./20-minage.md)), gravité et
  température des corps envisagés comme site d'atterrissage.
- **EDSM** et **Spansh** permettent de vérifier la distance du système candidat aux systèmes déjà peuplés ou déjà
  revendiqués, un critère central de l'éligibilité à la colonisation.
- L'état de contrôle et d'influence des factions locales (BGS — voir [BGS](./21-bgs.md)) conditionne également quels
  systèmes sont librement disponibles à la revendication.

Les critères précis d'éligibilité (portée maximale depuis un système déjà colonisé, quotas de revendication, étapes de
construction) ont évolué entre la version bêta et la sortie complète de la fonctionnalité ; ils ne sont donc **pas**
reproduits ici pour éviter toute donnée obsolète — se reporter systématiquement à
[Colonisation](./18-colonisation.md), qui constitue la source de référence de ce corpus sur le sujet, et à
[Fleet Carriers](./19-fleet-carriers.md) pour le rôle du porte-vaisseaux dans l'acheminement des matériaux de
construction vers un système nouvellement revendiqué.

---

## Partie 2 — Exobiologie (Odyssey) : prélever et vendre le vivant à Vista Genomics

L'exobiologie est la seconde grande activité de l'explorateur : repérer, approcher à pied et échantillonner les
organismes de surface pour les revendre à Vista Genomics. Les sections qui suivent détaillent la mécanique (2.1),
l'équipement (2.2), la procédure de terrain (2.3), le catalogue complet genre par genre (2.4) et les stratégies de
rentabilité (2.5).

### Les 118 espèces d'exobiologie classées par valeur de vente Vista Genomics

Les quatre tableaux ci-dessous recensent ensemble **les 118 espèces** connues du catalogue d'exobiologie de ce
corpus, **triées par valeur décroissante** ; ils découpent un seul et même classement continu en quatre tranches de
valeur, chacune reprenant la ligne d'en-tête. C'est la réponse directe à la question « quelle espèce rapporte le
plus » ; les **conditions d'apparition détaillées** de chacune (classe de corps, atmosphère, volcanisme,
température, gravité) figurent en **2.4**, genre par genre.

Les montants indiqués sont les **valeurs de base Vista Genomics, hors bonus** : ils ne tiennent compte ni du
multiplicateur *First Logged* (×5, voir 2.5) ni d'aucune prime de rang ou de faction. Ils ne dépendent pas non plus de
la variante de couleur : une *Bacterium Aurasus* verte et une bleue se vendent le même prix.

Deux genres de ce classement — **Bark Mound** et **Brain Tree** — ne sont pas détaillés en 2.4 : ils y sont recensés
(1 espèce pour le premier, 8 pour le second, soit les 9 espèces qui séparent les 109 du catalogue 2.4 des 118
ci-dessous), mais ce guide ne dispose pas encore de leur fiche d'habitat rédigée.

Une seule ligne s'écarte du catalogue compilé : *Radicoida Unica*, portée ici à sa **valeur observée en jeu** de
952 296 Cr et non aux 119 037 Cr du catalogue. Le raisonnement est détaillé en 2.4, sous le genre Radicoida. La
correction ne déplace pas la ligne : à 952 296 Cr, l'espèce reste la dernière du classement.

#### Exobiologie — espèces à 10 M Cr et plus (18 espèces, de 20 M à 10,3 M Cr)

| Espèce                          | Genre             | Valeur (Cr) |
|---------------------------------|-------------------|-------------|
| Fonticulua Fluctus              | Fonticulua        | 20 000 000  |
| Concha Biconcavis               | Concha            | 19 010 800  |
| Fonticulua Segmentatus          | Fonticulua        | 19 010 800  |
| Stratum Tectonicas              | Stratum           | 19 010 800  |
| Tussock Stigmasis               | Tussock           | 19 010 800  |
| Cactoida Vermis                 | Cactoida          | 16 202 800  |
| Clypeus Speculumi               | Clypeus           | 16 202 800  |
| Fumerola Extremus               | Fumerola          | 16 202 800  |
| Recepta Deltahedronix           | Recepta           | 16 202 800  |
| Stratum Cucumisis               | Stratum           | 16 202 800  |
| Recepta Conditivus              | Recepta           | 14 313 700  |
| Tussock Virgam                  | Tussock           | 14 313 700  |
| Aleoida Gravis                  | Aleoida           | 12 934 900  |
| Osseus Discus                   | Osseus            | 12 934 900  |
| Recepta Umbrux                  | Recepta           | 12 934 900  |
| Clypeus Margaritus              | Clypeus           | 11 873 200  |
| Tubus Cavas                     | Tubus             | 11 873 200  |
| Frutexa Flammasis               | Frutexa           | 10 326 000  |

#### Exobiologie — espèces de 3 M à 10 M Cr (38 espèces, de 9,74 M à 3,11 M Cr)

| Espèce                          | Genre             | Valeur (Cr) |
|---------------------------------|-------------------|-------------|
| Osseus Pellebantus              | Osseus            | 9 739 000   |
| Bacterium Informem              | Bacterium         | 8 418 000   |
| Clypeus Lacrimam                | Clypeus           | 8 418 000   |
| Bacterium Volu                  | Bacterium         | 7 774 700   |
| Concha Aureolas                 | Concha            | 7 774 700   |
| Frutexa Acus                    | Frutexa           | 7 774 700   |
| Tubus Compagibus                | Tubus             | 7 774 700   |
| Tussock Triticum                | Tussock           | 7 774 700   |
| Fumerola Nitris                 | Fumerola          | 7 500 900   |
| Aleoida Arcus                   | Aleoida           | 7 252 500   |
| Tussock Capillum                | Tussock           | 7 025 800   |
| Aleoida Coronamus               | Aleoida           | 6 284 600   |
| Electricae Pluma                | Electricae        | 6 284 600   |
| Electricae Radialem             | Electricae        | 6 284 600   |
| Fumerola Aquatis                | Fumerola          | 6 284 600   |
| Fumerola Carbosis               | Fumerola          | 6 284 600   |
| Frutexa Sponsae                 | Frutexa           | 5 988 000   |
| Tussock Pennata                 | Tussock           | 5 853 800   |
| Fonticulua Upupam               | Fonticulua        | 5 727 600   |
| Tubus Sororibus                 | Tubus             | 5 727 600   |
| Bacterium Nebulus               | Bacterium         | 5 289 900   |
| Bacterium Scopulum              | Bacterium         | 4 934 500   |
| Bacterium Omentum               | Bacterium         | 4 638 900   |
| Concha Renibus                  | Concha            | 4 572 400   |
| Tussock Serrati                 | Tussock           | 4 447 100   |
| Osseus Fractus                  | Osseus            | 4 027 800   |
| Bacterium Verrata               | Bacterium         | 3 897 000   |
| Fungoida Bullarum               | Fungoida          | 3 703 200   |
| Cactoida Cortexum               | Cactoida          | 3 667 600   |
| Cactoida Pullulanta             | Cactoida          | 3 667 600   |
| Tussock Caputus                 | Tussock           | 3 472 400   |
| Aleoida Laminiae                | Aleoida           | 3 385 200   |
| Aleoida Spica                   | Aleoida           | 3 385 200   |
| Fungoida Gelata                 | Fungoida          | 3 330 300   |
| Tussock Albata                  | Tussock           | 3 252 500   |
| Tussock Ventusa                 | Tussock           | 3 227 700   |
| Osseus Pumice                   | Osseus            | 3 156 300   |
| Fonticulua Lapida               | Fonticulua        | 3 111 000   |

#### Exobiologie — espèces de 1,5 M à 3 M Cr (42 espèces, de 2,79 M à 1,51 M Cr)

| Espèce                          | Genre             | Valeur (Cr) |
|---------------------------------|-------------------|-------------|
| Stratum Laminamus               | Stratum           | 2 788 300   |
| Fungoida Stabitis               | Fungoida          | 2 680 300   |
| Stratum Frigus                  | Stratum           | 2 637 500   |
| Tubus Rosarium                  | Tubus             | 2 637 500   |
| Cactoida Lapis                  | Cactoida          | 2 483 600   |
| Cactoida Peperatis              | Cactoida          | 2 483 600   |
| Stratum Araneamus               | Stratum           | 2 448 900   |
| Stratum Excutitus               | Stratum           | 2 448 900   |
| Tubus Conifer                   | Tubus             | 2 415 500   |
| Osseus Spiralis                 | Osseus            | 2 404 700   |
| Concha Labiata                  | Concha            | 2 352 400   |
| Bacterium Tela                  | Bacterium         | 1 949 000   |
| Tussock Ignis                   | Tussock           | 1 849 000   |
| Frutexa Flabellum               | Frutexa           | 1 808 900   |
| Fonticulua Digitos              | Fonticulua        | 1 804 100   |
| Tussock Catena                  | Tussock           | 1 766 600   |
| Tussock Cultro                  | Tussock           | 1 766 600   |
| Tussock Divisa                  | Tussock           | 1 766 600   |
| Bacterium Cerbrus               | Bacterium         | 1 689 800   |
| Fungoida Setisis                | Fungoida          | 1 670 100   |
| Bacterium Alcyoneum             | Bacterium         | 1 658 500   |
| Frutexa Collum                  | Frutexa           | 1 639 800   |
| Frutexa Fera                    | Frutexa           | 1 632 500   |
| Frutexa Metallicum              | Frutexa           | 1 632 500   |
| Amphora Plant                   | Amphora Plant     | 1 628 800   |
| Crystalline Shards              | Crystalline Shard | 1 628 800   |
| Aureum Brain Tree               | Brain Tree        | 1 593 700   |
| Gypseeum Brain Tree             | Brain Tree        | 1 593 700   |
| Lindigoticum Brain Tree         | Brain Tree        | 1 593 700   |
| Lividum Brain Tree              | Brain Tree        | 1 593 700   |
| Ostrinum Brain Tree             | Brain Tree        | 1 593 700   |
| Puniceum Brain Tree             | Brain Tree        | 1 593 700   |
| Roseum Brain Tree               | Brain Tree        | 1 593 700   |
| Viride Brain Tree               | Brain Tree        | 1 593 700   |
| Albidum Sinuous Tubers          | Sinuous Tuber     | 1 514 500   |
| Blatteum Sinuous Tubers         | Sinuous Tuber     | 1 514 500   |
| Caeruleum Sinuous Tubers        | Sinuous Tuber     | 1 514 500   |
| Lindigoticum Sinuous Tubers     | Sinuous Tuber     | 1 514 500   |
| Prasinum Sinuous Tubers         | Sinuous Tuber     | 1 514 500   |
| Roseum Sinuous Tubers           | Sinuous Tuber     | 1 514 500   |
| Violaceum Sinuous Tubers        | Sinuous Tuber     | 1 514 500   |
| Viride Sinuous Tubers           | Sinuous Tuber     | 1 514 500   |

#### Exobiologie — espèces sous 1,5 M Cr (20 espèces, de 1 499 900 à 952 296 Cr)

| Espèce                          | Genre             | Valeur (Cr) |
|---------------------------------|-------------------|-------------|
| Blatteum Bioluminescent Anemone | Anemone           | 1 499 900   |
| Croceum Anemone                 | Anemone           | 1 499 900   |
| Luteolum Anemone                | Anemone           | 1 499 900   |
| Prasinum Bioluminescent Anemone | Anemone           | 1 499 900   |
| Puniceum Anemone                | Anemone           | 1 499 900   |
| Roseum Anemone                  | Anemone           | 1 499 900   |
| Roseum Bioluminescent Anemone   | Anemone           | 1 499 900   |
| Rubeum Bioluminescent Anemone   | Anemone           | 1 499 900   |
| Osseus Cornibus                 | Osseus            | 1 483 000   |
| Bark Mounds                     | Bark Mound        | 1 471 900   |
| Stratum Limaxus                 | Stratum           | 1 362 000   |
| Stratum Paleas                  | Stratum           | 1 362 000   |
| Bacterium Bullaris              | Bacterium         | 1 152 500   |
| Bacterium Acies                 | Bacterium         | 1 000 000   |
| Bacterium Aurasus               | Bacterium         | 1 000 000   |
| Bacterium Vesicula              | Bacterium         | 1 000 000   |
| Fonticulua Campestris           | Fonticulua        | 1 000 000   |
| Tussock Pennatis                | Tussock           | 1 000 000   |
| Tussock Propagito               | Tussock           | 1 000 000   |
| Radicoida Unica                 | Radicoida         | 952 296     |

> **Sourçage de ces quatre tableaux** : catalogue d'exobiologie compilé embarqué par ce corpus (édition 2026-08), qui déclare
> pour sources amont Canonn Research (*Vista Genomics price list*), le wiki *Elite Dangerous* (*Exobiologist*,
> *Vista Genomics*) et les critères biologiques du projet SrvSurvey. Ses montants coïncident au crédit près avec les
> valeurs relevées en jeu à la vente pour les espèces vérifiées (*Stratum Tectonicas* 19 010 800 Cr, *Frutexa Acus*
> 7 774 700 Cr, *Tubus Conifer* 2 415 500 Cr, *Bacterium Aurasus* 1 000 000 Cr), à la seule exception de
> *Radicoida Unica* signalée ci-dessus.

### 2.1 Mécanique générale de l'exobiologie : genres, espèces et variantes de couleur

Depuis Odyssey, la taxonomie exobiologique moderne (famille dite **« Odyssey »**) compte **15 genres** : Aleoida,
Bacterium, Cactoida, Clypeus, Concha, Electricae, Fonticulua, Frutexa, Fumerola, Fungoida, Osseus, Recepta, Stratum,
Tubus, Tussock. Chaque genre se subdivise en espèces, elles-mêmes déclinées en variantes de couleur. À ces 15 genres
s'ajoutent **5 genres supplémentaires**, hors famille Odyssey — Amphora Plant, Anemone, Crystalline Shard, Radicoida et
Sinuous Tuber — eux aussi documentés en 2.4, soit **20 genres** au total dans ce guide sur les 22 que recense le
catalogue compilé (voir la note de sourçage en 2.4).

- Le genre **Tussock** est l'un des plus diversifiés, avec **15 espèces** recensées par Canonn Research (Albata,
  Capillum, Caputus, Catena, Cultro, Divisa, Ignis, Pennata, Pennatis, Propagito, Serrati, Stigmasis, Triticum,
  Ventusa, Virgam), déclinées en de nombreuses variantes de couleur selon la classe stellaire de l'étoile hôte.
- Le genre **Bacterium** est également très diversifié, avec **13 espèces** recensées (voir tableau complet en 2.4).
- Le genre **Electricae** est l'un des plus restreints : seulement **2 espèces** (Pluma et Radialem).
- L'apparition d'un genre/espèce dépend du **type de corps planétaire**, de l' **atmosphère** et de la **température de
  surface** — la combinaison la plus fréquente étant : corps rocheux + atmosphère de CO2 + température de 150-200 K.
- La **couleur de la variante** dépend le plus souvent (~70 % des espèces) de la **classe stellaire de l'étoile hôte**
  (ex. jaune chez les étoiles de type O, gris pâle chez les naines blanches pour *Aleoida*), ou plus rarement de la
  présence de **matériaux rares spécifiques** dans la croûte planétaire (ex. l'yttrium donne une couleur « Mulberry »
  chez *Electricae Pluma* mais « Green » chez *Radialem*).

**Tolérances physiologiques extrêmes relevées par genre** (Canonn, *Odyssey Family: Appendices*, données au
30/09/2025) :

| Paramètre              | Extrême observé                                                                                                                                       |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| Température            | *Aleoida* : plage très restreinte (152-196 K) — à l'opposé, *Bacterium* tolère 20-631 K, avec *Bacterium Tela* seule capable de survivre à 500-650 K  |
| Pression atmosphérique | *Fonticulua* et *Bacterium* tolèrent jusqu'à 1 492 atm dans certains cas ; la plupart des autres genres restent limités à des atmosphères très ténues |
| Gravité                | La majorité des genres tolèrent 0,03-0,28 G ; *Bacterium* jusqu'à 1,18 G ; *Stratum* jusqu'à 0,61 G                                                   |
| Répartition            | *Bacterium* représente à lui seul **94,23 %** de tous les organismes enregistrés dans la bande de température 0-50 K                                  |

### 2.2 Équipement nécessaire à l'exobiologie : combinaison Artemis, scanners, BioScan

Pour pratiquer l'exobiologie de terrain, le commandant doit s'équiper de :

- Une **combinaison Artemis** (Exploration Suit) équipée de l' **Organic Scanner** (« Genetic Sampler »), l'outil qui
  permet le prélèvement effectif d'échantillons.
  > **Correction** : la combinaison Artemis et la combinaison **Maverick** sont deux tenues Odyssey **distinctes**, et
  > non deux noms pour la même chose. L'Artemis est la combinaison d'exploration (Genetic Sampler, Composition
  > Scanner) ; le Maverick est une combinaison tactique/légère orientée combat à pied, sans rapport avec
  > l'exobiologie. Voir [Équipement à pied](./07-equipement-a-pied.md) pour le comparatif complet des combinaisons
  > Odyssey (Artemis, Dominator, Maverick) et de leurs emplacements de modules.
- Un **Composition Scanner** : outil complémentaire crucial pour affiner l'identification de l'espèce et de la variante
  précise *avant* le prélèvement complet.
- Le **FSS** puis le **DSS** du vaisseau, utilisés en amont pour repérer à distance les zones à forte probabilité de vie
  sur un corps (teinte sarcelle sur la carte DSS).
- Le **SRV**, dont le mode tourelle/scan peut servir à repérer des colonies de bactéries invisibles à l'œil nu dans
  l'obscurité.
- Le plugin communautaire **BioScan** (github.com/Silarn/EDMC-BioScan, extension d'EDMC), largement recommandé : il
  prédit les genres/espèces possibles à partir du type de corps, de la position galactique et des étoiles proches
  (biologie « Horizons » et « Odyssey »), affiche en temps réel la distance minimale requise et la distance actuelle au
  dernier échantillon, place des repères de navigation (cap, distance) pour les échantillons restants, et alerte sur les
  planètes à gravité **≥ 1 G** (marche pénible) ou **≥ 2,7 G** (exploration à pied impossible).

#### Le Nomad, véhicule de surface dédié à l'exobiologie (Operations, 30 juin 2026)

Depuis la mise à jour **Operations**, sortie le 30 juin 2026, le SRV n'est plus le seul véhicule de terrain de
l'explorateur : le **Nomad** vient s'y ajouter. Frontier le décrit comme « a small and compact ship-launched vessel
which is built to explore planetary surfaces », dont « rugged shape and design is perfect for getting up close with
organics » (billet officiel *Discover the Nomad*, 02/06/2026 13:03 UTC). Le même billet en explicite l'intérêt pour
l'exobiologie : plutôt que de poser un gros vaisseau d'exploration, le commandant peut le **laisser en orbite** et
descendre au Nomad pour atteindre les organiques les plus difficiles d'accès. Ses patins d'atterrissage étroits,
d'inspiration hélicoptère, et ses moteurs qui pivotent à l'atterrissage lui donnent une empreinte au sol réduite et lui
permettent de se percher sur des terrains accidentés où un vaisseau classique ne peut se poser.

Trois points concernent directement la procédure décrite en 2.3 :

- **Un scanner biologique embarqué.** Le Nomad « comes equipped with a specialised MK II Biological Scanner for the
  detection of biological signals directly from the cockpit », et les notes de version ajoutent le module à
  l'équipement sous la description « a pulse scanner that detects biological signatures » (billet officiel
  *Operations Update*, 01/07/2026 14:01 UTC). La détection des signaux biologiques ne dépend donc plus uniquement du
  DSS du vaisseau et du repérage à pied.
- **Un module porteur dédié, distinct du hangar SRV.** « The Nomad can be deployed from a compatible vessel bay,
  including MK I and MK II modules » (même billet). Les notes de version détaillent un **Mk I Vessel Bay** et un
  **Mk II Vessel Bay** ; le référentiel ouvert EDCD/FDevIDs les publie sous les libellés *Vessel Hangar* et *Mk II
  Vessel Hangar*. Le Mk I est disponible sur treize châssis, parmi lesquels l'**Anaconda** (classes 5 à 7), seul
  vaisseau du comparatif de 2.7 à pouvoir emporter un Nomad ; le Mk II est réservé à trois châssis seulement. Le
  détail des disponibilités figure dans [Le Rhino et le Nomad](./14-rhino-nomad.md).
- **Ce n'est pas un vaisseau de chantier naval.** Le Nomad est un *ship-launched vessel*, au même titre qu'un SRV ou
  qu'un chasseur SLF : il ne s'achète pas au shipyard et n'entre pas dans le décompte des vaisseaux pilotables du
  corpus. Il est sorti en accès anticipé ARX le 30 juin 2026, « in ARX Early Access alongside Operations »
  (*Discover the Nomad*, 02/06/2026).

Voir [Operations](./13-operations.md) pour la mise à jour qui l'introduit et
[Le Rhino et le Nomad](./14-rhino-nomad.md) pour la fiche complète du véhicule.

### 2.3 Procédure de scan et d'échantillonnage exobiologique (3 prélèvements par espèce)

1. **Repérer** les patches de vie à distance grâce au DSS avant l'atterrissage, en privilégiant la face diurne de la
   planète pour une meilleure visibilité.
2. **Prélever 3 échantillons complets** d'une même espèce : c'est le nombre requis pour pouvoir la vendre ensuite à
   Vista Genomics.
3. Respecter une **distance minimale entre chaque prélèvement** (variable selon le genre — voir tableau ci-dessous) afin
   de garantir une diversité génétique suffisante ; un échantillon trop proche du précédent est refusé par le jeu.
4. Un seul jeu d'échantillons partiels peut être conservé en mémoire à la fois : impossible de collecter deux espèces en
   parallèle sans finaliser l'une des deux au préalable.
5. Attendre la **confirmation du 3ᵉ échantillon** avant de redécoller.

**Distances minimales de séparation entre échantillons, par genre** (« Minimum Colonial Separation », Canonn Research —
tableau complet pour les 15 genres de la famille Odyssey, complété par les 5 genres supplémentaires documentés en 2.4,
soit les 20 genres de ce guide) :

| Genre             | Distance minimale |
|-------------------|-------------------|
| Aleoida           | 150 m             |
| Amphora Plant     | 100 m             |
| Anemone           | 100 m             |
| Bacterium         | 500 m             |
| Cactoida          | 300 m             |
| Clypeus           | 150 m             |
| Concha            | 150 m             |
| Crystalline Shard | 100 m             |
| Electricae        | 1 000 m           |
| Fonticulua        | 500 m             |
| Frutexa           | 150 m             |
| Fumerola          | 100 m             |
| Fungoida          | 300 m             |
| Osseus            | 800 m             |
| Radicoida         | 15 m              |
| Recepta           | 150 m             |
| Sinuous Tuber     | 100 m             |
| Stratum           | 500 m             |
| Tubus             | 800 m             |
| Tussock           | 200 m             |

*Ces valeurs correspondent à la distance minimale documentée par genre sur le Codex Canonn ; celles des cinq genres
hors famille Odyssey (Amphora Plant, Anemone, Crystalline Shard, Radicoida, Sinuous Tuber) sont celles du catalogue
compilé cité en note de sourçage à la fin de 2.4 — à l'exception de **Radicoida**, dont les 15 m sont une valeur
relevée en jeu, retenue contre les 100 m du catalogue (voir le détail sous le genre Radicoida en 2.4). Certaines
espèces individuelles peuvent avoir une distance légèrement différente de celle de leur genre — le plugin BioScan
affiche dans tous les cas la valeur exacte en temps réel pour l'espèce identifiée.*

Un défi communautaire Canonn, le **« Speed Scanning Challenge »**, illustre les marges de progression possibles pour un
commandant entraîné et bien équipé. Les enseignements clés de ce défi :

- Cartographier au préalable le **chevauchement des zones** entre espèces pour minimiser les déplacements.
- Repérer les emplacements sans déclencher le chronomètre du scanner avant d'être réellement prêt.
- Le plugin BioScan (v2.7 et suivantes) peut afficher ces informations directement en surimpression (overlay) à l'écran
  de jeu.

### 2.4 Catalogue d'exobiologie : 20 genres, 109 espèces, habitats et valeurs de vente

Valeurs en crédits (Cr) et fréquences d'observation (% de la population enregistrée par la communauté Canonn), données
Canonn Research au 30/09/2025.

Ce catalogue documente **20 genres**, soit **109 espèces**, présentés par ordre alphabétique de genre. Cinq d'entre eux
— Amphora Plant, Anemone, Crystalline Shard, Radicoida et Sinuous Tuber — n'appartiennent pas à la famille Odyssey
décrite en 2.1 ; leurs conditions d'apparition sont reprises du catalogue d'exobiologie compilé cité en note de
sourçage à la fin de cette section, qui recense 22 genres au total.

**Lecture des tableaux.** Les vingt genres partagent désormais un même jeu de colonnes : **Espèce**, **Valeur (Cr)**,
**Fréquence**, **Corps**, **Atmosphère**, **Volcanisme**, **Température (K)** et **Gravité (G)**. Les cinq dernières
colonnes sont renseignées espèce par espèce, et non au niveau du genre : ce sont elles qui permettent de répondre à
« puis-je trouver telle espèce sur ce corps ? ». Conventions :

- **Corps** emploie les abréviations du jeu : Rocky, HMC (High Metal Content), Metal-Rich, Icy, Rocky Ice.
- **Atmosphère** : « Aucune » signifie corps sans atmosphère, et non donnée manquante.
- **Volcanisme** : « Aucun » signifie corps sans volcanisme, et non donnée manquante.
- **Température (K)** et **Gravité (G)** rendent les bornes publiées : `175-180` pour un intervalle, `≥ 160` ou
  `≤ 143` quand une seule borne est connue.
- Un tiret « — » signale une donnée **absente des sources**, jamais une valeur nulle.
- La colonne **Gravité (G)** donne le plafond toutes classes de corps confondues. Quand ce plafond varie selon la
  classe du corps, le détail figure soit dans une colonne dédiée (Sinuous Tuber), soit dans les précisions par espèce
  sous le tableau.
- Les colonnes propres à certains genres sont conservées telles quelles à la suite du tronc commun : *Étoile primaire*
  (Anemone), *Corrélation* (Electricae), *Type de volcanisme* et *Terrain* (Fumerola), *Gravité max (Rocky / HMC)* et
  *Régions Canonn* (Sinuous Tuber). Pour Bacterium, le déterminant de la variante de couleur fait l'objet d'un second
  tableau sous le tableau d'habitat.

**Où la colonne Fréquence est vide, et pourquoi.** Les pourcentages d'observation proviennent exclusivement des relevés
de population de Canonn Research ; le catalogue compilé qui fournit les conditions d'apparition ne les reprend pas.
Sur les 109 espèces de cette section, **43 sont donc sans fréquence publiée**, réparties en deux cas distincts :

| Cas                                                  | Genres et espèces concernés                                                                                                           | Espèces |
|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|---------|
| Genre entier sans relevé de fréquence                | Amphora Plant (1), Anemone (8), Bacterium (13), Crystalline Shard (1), Radicoida (1), Sinuous Tuber (8)                               | 32      |
| Espèces isolées dans un genre par ailleurs documenté | Fonticulua — Digitos, Lapida, Segmentatus, Upupam ; Frutexa — Collum, Fera, Sponsae ; Stratum — Araneamus, Frigus, Laminamus, Limaxus | 11      |

La seconde ligne est le point de vigilance : voir une fréquence chez *Fonticulua Campestris* mais un tiret chez
*Fonticulua Segmentatus* ne signifie pas que la seconde est absente des relevés, seulement que sa part de population
n'y est pas chiffrée dans la même colonne. Deux d'entre elles portent malgré tout une part de population dans leurs
précisions par espèce (*Fonticulua Segmentatus*, 1,17 % du genre ; *Stratum Araneamus*, 0,3 %).

La ligne d'habitat en italique qui ouvre chaque genre reste un **résumé au niveau du genre** (données Canonn) : quand
elle diverge du tableau — par exemple sur la liste des atmosphères ou des classes de corps acceptées — c'est la ligne
de l'espèce qui fait foi, parce qu'elle est plus fine.

Sous chaque tableau, la liste **« Précisions par espèce »** détaille terrain, pression minimale, régions galactiques,
plafonds de gravité par classe de corps et branches thermiques. Aucune de ces conditions n'est confirmée par Frontier :
toutes sont des relevés communautaires, au même niveau de fiabilité.

> **Sourçage de cette section** : valeurs Vista Genomics et fréquences d'observation issues de **Canonn Research**
> (relevés arrêtés au 30/09/2025) ; conditions d'apparition par espèce issues du catalogue d'exobiologie compilé
> embarqué par ce corpus (édition 2026-08), qui déclare pour sources amont Canonn Research, le wiki *Elite Dangerous*
> et les critères biologiques du projet SrvSurvey.

#### Aleoida — genre d'exobiologie Odyssey (5 espèces, 3,4 M à 12,9 M Cr)

*Habitat : corps rocheux ou à haute teneur métallique, atmosphère ammoniac ou CO2 ; feuillage cireux, hiberne en
conditions défavorables.*

| Espèce            | Valeur (Cr) | Fréquence | Corps      | Atmosphère | Volcanisme                          | Température (K) | Gravité (G) |
|-------------------|-------------|-----------|------------|------------|-------------------------------------|-----------------|-------------|
| Aleoida Coronamus | 6 284 600   | 28,9 %    | Rocky, HMC | CO2        | Aucun                               | 180-190         | ≤ 0,276     |
| Aleoida Laminiae  | 3 385 200   | 24,2 %    | Rocky, HMC | Ammoniac   | Aucun, Eau                          | —               | ≤ 0,276     |
| Aleoida Arcus     | 7 252 500   | 21,5 %    | Rocky, HMC | CO2        | Aucun                               | 175-180         | ≤ 0,276     |
| Aleoida Spica     | 3 385 200   | 13,6 %    | Rocky, HMC | Ammoniac   | Aucun, Magma ferreux, Eau, Silicaté | ≥ 170           | ≤ 0,276     |
| Aleoida Gravis    | 12 934 900  | 11,8 %    | Rocky, HMC | CO2        | Aucun                               | 190-197         | ≤ 0,276     |

*Précisions par espèce :*

- **Aleoida Coronamus** — Terrain vallonné, pression >= 0,0244 atm, plafond de gravité 0,238 G sur Rocky et 0,276 G
  sur HMC.
- **Aleoida Laminiae** — Terrain vallonné, uniquement dans Sagittarius-Carina Arm, Orion-Cygnus Arm et Galactic
  Centre-Left, avec pression <= 0,008 atm sur HMC.
- **Aleoida Arcus** — Plaines plates de mondes Rocky (97 %) ou HMC à CO2, pression >= 0,0161 atm, avec un plafond de
  gravité plus bas (0,238 G) sur les corps Rocky.
- **Aleoida Spica** — Terrain quasi-montagneux, absente de Sagittarius-Carina et d'Orion-Cygnus (contrairement à
  Laminiae, sa jumelle de prix).
- **Aleoida Gravis** — Terrain plat, pression >= 0,0544 atm, forte proportion de HMC (35 %) ou le plafond de gravité
  monte à 0,276 G contre 0,238 G sur Rocky.

#### Amphora Plant — genre d'exobiologie hors famille Odyssey (1 espèce, 1,63 M Cr)

*Habitat : mondes à haute teneur métallique (Metal-Rich) sans atmosphère, volcanisme de magma ferreux, rocheux ou
silicaté, 1 000-1 800 K, gravité ≥ 0,04 G ; étoile primaire de classe A et système comportant au moins un monde
Earth-like, un monde à ammoniac, une géante gazeuse à vie ou une géante d'eau. Observé dans les bras Scutum-Centaurus
et Sagittarius-Carina. Séparation minimale 100 m (voir 2.3).*

| Espèce        | Valeur (Cr) | Fréquence | Corps      | Atmosphère | Volcanisme                       | Température (K) | Gravité (G) |
|---------------|-------------|-----------|------------|------------|----------------------------------|-----------------|-------------|
| Amphora Plant | 1 628 800   | —         | Metal-Rich | Aucune     | Magma ferreux, Rocheux, Silicaté | 1 000-1 800     | ≥ 0,04      |

*Précisions par espèce :*

- **Amphora Plant** — Étoile primaire de classe A et système contenant au moins un ELW, Ammonia World, Gas Giant à vie
  ou Water Giant ; régions Scutum-Centaurus / Sagittarius-Carina.

*Fréquences d'observation Canonn non disponibles pour ce genre.*

#### Anemone — genre d'exobiologie hors famille Odyssey (8 espèces, 1,50 M Cr chacune)

*Habitat : corps sans atmosphère — rocheux, à haute teneur métallique (HMC), Metal-Rich ou glacés selon l'espèce — le
plus souvent à volcanisme silicaté, rocheux ou de magma ferreux. L'espèce présente dépend avant tout de la **classe de
l'étoile primaire** du système. Séparation minimale 100 m (voir 2.3).*

| Espèce                          | Valeur (Cr) | Fréquence | Corps                  | Atmosphère | Volcanisme                       | Température (K) | Gravité (G) | Étoile primaire                   |
|---------------------------------|-------------|-----------|------------------------|------------|----------------------------------|-----------------|-------------|-----------------------------------|
| Blatteum Bioluminescent Anemone | 1 499 900   | —         | HMC, Metal-Rich        | Aucune     | Rocheux, Silicaté, Magma ferreux | 220-6 000       | —           | O, B, K, à neutrons, trou noir    |
| Croceum Anemone                 | 1 499 900   | —         | Rocky                  | Aucune     | Silicaté, Magma ferreux          | 200-440         | ≤ 0,42      | B ou A                            |
| Luteolum Anemone                | 1 499 900   | —         | Rocky                  | Aucune     | Silicaté, Magma ferreux, Rocheux | 200-440         | ≤ 1,6       | B ou A                            |
| Prasinum Bioluminescent Anemone | 1 499 900   | —         | Rocky, HMC, Metal-Rich | Aucune     | —                                | 110-4 000       | ≤ 1,9       | O, B, A, Herbig Ae/Be, Wolf-Rayet |
| Puniceum Anemone                | 1 499 900   | —         | Icy                    | Aucune     | Aucun                            | 75-800          | 0,1-2,6     | O ou Wolf-Rayet                   |
| Roseum Anemone                  | 1 499 900   | —         | Rocky                  | Aucune     | Silicaté, Magma ferreux          | 200-440         | ≤ 0,386     | B (luminosité I à III)            |
| Roseum Bioluminescent Anemone   | 1 499 900   | —         | HMC, Metal-Rich        | Aucune     | Rocheux, Silicaté, Magma ferreux | 400-5 000       | ≥ 0,24      | B, A, trou noir                   |
| Rubeum Bioluminescent Anemone   | 1 499 900   | —         | HMC, Metal-Rich        | Aucune     | Rocheux, Silicaté, Magma ferreux | 164-1 800       | —           | O, B, A, F, à neutrons, trou noir |

*Précisions par espèce :*

- **Blatteum Bioluminescent Anemone** — Étoile primaire O, B, K, étoile à neutrons ou trou noir ; 220–999 K sur HMC et
  800–6000 K sur Metal-Rich.
- **Croceum Anemone** — Étoile primaire de classe B ou A (typiquement B VI / A III) sur corps rocheux.
- **Luteolum Anemone** — Étoile primaire de classe B ou A (typiquement B IV–B V) sur corps rocheux.
- **Prasinum Bioluminescent Anemone** — Étoile primaire O, B, A, Herbig Ae/Be ou Wolf-Rayet ; le plafond de 1,9 G
  n'est connu que sur Rocky (110–999 K), 250–2400 K sur HMC et 1000–4000 K sur Metal-Rich.
- **Puniceum Anemone** — Étoile primaire de classe O ou Wolf-Rayet, sur corps glacé sans volcanisme.
- **Roseum Anemone** — Étoile primaire de classe B (luminosité I à III) sur corps rocheux.
- **Roseum Bioluminescent Anemone** — Étoile primaire B, A ou trou noir ; sur HMC 400–999 K avec g ≥ 0,24, sur
  Metal-Rich 1000–5000 K.
- **Rubeum Bioluminescent Anemone** — Étoile primaire O, B, A, F, étoile à neutrons ou trou noir ; 164–999 K sur HMC
  et 1000–1800 K sur Metal-Rich.

*Les plages de température couvrent plusieurs types de corps : pour les espèces bioluminescentes, la borne haute
correspond aux corps Metal-Rich (au-delà de 1 000 K), la borne basse aux corps HMC ou rocheux. Fréquences d'observation
Canonn non disponibles pour ce genre.*

#### Bacterium — genre d'exobiologie Odyssey (13 espèces, 1 M à 8,4 M Cr)

*Habitat : corps glacés, rocheux ou à haute teneur métallique, atmosphère ammoniac/CO2/SO2, gravité < 0,62 G, terrain
plat ; extrêmophiles quasi omniprésents. Genre le plus répandu de la galaxie (voir tolérances extrêmes en 2.1).*

Les 3 premières espèces ci-dessous doivent leur variante de couleur à la **classe stellaire** de l'étoile hôte ; les 10
suivantes la doivent à un **matériau spécifique** présent dans la croûte de la planète.

| Espèce              | Valeur (Cr) | Fréquence | Corps                      | Atmosphère                    | Volcanisme      | Température (K) | Gravité (G) |
|---------------------|-------------|-----------|----------------------------|-------------------------------|-----------------|-----------------|-------------|
| Bacterium Alcyoneum | 1 658 500   | —         | Rocky, HMC, Rocky Ice      | Ammoniac                      | —               | ≥ 160,7         | —           |
| Bacterium Aurasus   | 1 000 000   | —         | Rocky, HMC                 | CO2                           | —               | 145-400         | —           |
| Bacterium Cerbrus   | 1 689 800   | —         | HMC, Rocky, Rocky Ice      | SO2, Eau                      | —               | ≥ 132           | —           |
| Bacterium Acies     | 1 000 000   | —         | Icy, Rocky Ice             | Néon                          | —               | —               | —           |
| Bacterium Bullaris  | 1 152 500   | —         | Icy, Rocky, HMC, Rocky Ice | Méthane                       | —               | ≤ 143           | —           |
| Bacterium Informem  | 8 418 000   | —         | Icy, HMC, Rocky, Rocky Ice | Azote                         | —               | ≤ 151           | —           |
| Bacterium Nebulus   | 5 289 900   | —         | Icy                        | Hélium                        | —               | —               | —           |
| Bacterium Omentum   | 4 638 900   | —         | Icy                        | Néon, Argon, Méthane, Hélium  | Azote, Ammoniac | ≤ 197           | —           |
| Bacterium Scopulum  | 4 934 500   | —         | Icy, Rocky Ice             | Néon, Méthane, Argon, Hélium  | CO2, Méthane    | 35-146          | —           |
| Bacterium Tela      | 1 949 000   | —         | HMC, Icy, Rocky            | —                             | —               | —               | —           |
| Bacterium Verrata   | 3 897 000   | —         | Icy, Rocky Ice, Rocky      | Néon, Argon, Hélium, Ammoniac | Eau             | —               | —           |
| Bacterium Vesicula  | 1 000 000   | —         | Icy, Rocky Ice, HMC, Rocky | Argon                         | —               | ≤ 267           | —           |
| Bacterium Volu      | 7 774 700   | —         | Icy, Rocky Ice, HMC, Rocky | Oxygène                       | —               | —               | —           |

##### Bacterium — précisions d'habitat, espèce par espèce (13 espèces)

*Précisions par espèce :*

- **Bacterium Alcyoneum** — Plaines de mondes Rocky ou HMC à ammoniac ; couleur donnée par la classe de l'étoile
  parente.
- **Bacterium Aurasus** — Plaines de mondes Rocky ou HMC à CO2, très large fenêtre thermique ; couleur donnée par la
  classe stellaire.
- **Bacterium Cerbrus** — Principalement HMC à SO2 (T >= 132 K), la branche eau/water-rich exigeant des mondes bien
  plus chauds (T >= 390 K).
- **Bacterium Acies** — Mondes glacés à atmosphère néon, sur plaines près des cratères ; aucune contrainte de gravité
  (invisible en night vision, chercher les flaques sombres depuis 200 m).
- **Bacterium Bullaris** — Surtout sur mondes glacés à méthane ; le plafond descend à 129 K en atmosphère Méthane-rich
  contre 143 K en Méthane.
- **Bacterium Informem** — Mondes à atmosphère d'azote, surtout glacés ; la limite thermique tombe à 83 K sur les
  corps Rocky.
- **Bacterium Nebulus** — Exclusivement mondes glacés à atmosphère d'hélium, extrêmement froids (observé 20,0 - 20,8
  K).
- **Bacterium Omentum** — Uniquement mondes glacés (surtout néon) avec magma mineur d'azote ou d'ammoniac obligatoire,
  branche froide 20 - 61 K.
- **Bacterium Scopulum** — Mondes glacés exigeant des geysers de dioxyde de carbone ou un magma de méthane mineur ;
  fenêtres thermiques par branche (35-50, 56-146, 61-71 K).
- **Bacterium Tela** — Espèce passe-partout, toutes atmosphères et presque tous les corps, souvent près des sites
  géologiques mais aussi trouvée sans volcanisme.
- **Bacterium Verrata** — Mondes glacés avec volcanisme exclusivement aqueux (magma ou geysers d'eau, majeur ou
  mineur), atmosphère néon dans 74 % des cas.
- **Bacterium Vesicula** — Surtout mondes glacés à argon ; le plafond thermique varie selon le type de corps (148,
  149, 245 ou 267 K).
- **Bacterium Volu** — Rare atmosphère d'oxygène, majoritairement sur mondes glacés (observé entre 143,8 et 245,8 K).

##### Bacterium — déterminant de la variante de couleur (classe stellaire ou matériau de croûte)

**Déterminant de la variante de couleur, par espèce** (données Canonn Research, 30/09/2025). Les noms de couleur sont
rendus en français ; « Vert citron » correspond à la teinte *Lime* du Codex, à ne pas confondre avec le *Green* rendu
ici par « Vert ». Un tiret « — » marque une cellule **sans objet**, jamais une donnée manquante : chez *Bacterium
Alcyoneum*, *Bacterium Aurasus* et *Bacterium Cerbrus*, la couleur suit la classe de l'étoile hôte et non un matériau
de la croûte (voir 2.1), si bien qu'il n'y a pas de palette par matériau à énumérer pour elles.

| Espèce              | Déterminant de couleur | Variantes de couleur                                    |
|---------------------|------------------------|---------------------------------------------------------|
| Bacterium Alcyoneum | Classe stellaire       | —                                                       |
| Bacterium Aurasus   | Classe stellaire       | —                                                       |
| Bacterium Cerbrus   | Classe stellaire       | —                                                       |
| Bacterium Acies     | Matériau               | Cyan, Magenta, Cobalt, Vert citron, Blanc, Aigue-marine |
| Bacterium Bullaris  | Matériau               | Cobalt, Jaune, Aigue-marine, Or, Vert citron, Rouge     |
| Bacterium Informem  | Matériau               | Rouge, Vert citron, Or, Aigue-marine, Jaune, Cobalt     |
| Bacterium Nebulus   | Matériau               | Magenta, Or, Orange, Cyan, Vert, Cobalt                 |
| Bacterium Omentum   | Matériau               | Vert citron, Blanc, Aigue-marine, Pêche, Rouge, Bleu    |
| Bacterium Scopulum  | Matériau               | Blanc, Pêche, Vert citron, Rouge, Mûre, Aigue-marine    |
| Bacterium Tela      | Matériau               | Or, Orange, Jaune, Magenta, Cobalt, Vert                |
| Bacterium Verrata   | Matériau               | Pêche, Rouge, Blanc, Mûre, Bleu, Vert citron            |
| Bacterium Vesicula  | Matériau               | Cyan, Orange, Mûre, Or, Rouge, Vert citron              |
| Bacterium Volu      | Matériau               | Rouge, Aigue-marine, Cobalt, Vert citron, Cyan, Or      |

*Informem est l'espèce la plus chère du genre.*

#### Cactoida — genre d'exobiologie Odyssey (5 espèces, 2,5 M à 16,2 M Cr)

*Habitat : corps rocheux, atmosphères diverses. Séparation minimale 300 m (voir 2.3).*

| Espèce              | Valeur (Cr) | Fréquence | Corps      | Atmosphère | Volcanisme                                   | Température (K) | Gravité (G) |
|---------------------|-------------|-----------|------------|------------|----------------------------------------------|-----------------|-------------|
| Cactoida Cortexum   | 3 667 600   | 24,3 %    | Rocky, HMC | CO2        | Aucun                                        | 180-197         | ≤ 0,276     |
| Cactoida Lapis      | 2 483 600   | 34,8 %    | Rocky, HMC | Ammoniac   | Aucun, Silicaté, Magma ferreux, Rocheux, Eau | ≥ 160           | ≤ 0,276     |
| Cactoida Peperatis  | 2 483 600   | 13,3 %    | Rocky, HMC | Ammoniac   | Aucun                                        | ≥ 160           | ≤ 0,276     |
| Cactoida Pullulanta | 3 667 600   | 10,2 %    | Rocky, HMC | CO2        | Aucun                                        | 180-195,41      | ≤ 0,276     |
| Cactoida Vermis     | 16 202 800  | 17,3 %    | Rocky, HMC | Eau, SO2   | Aucun, Eau, Silicaté, Magma ferreux          | ≥ 160           | ≤ 0,276     |

*Précisions par espèce :*

- **Cactoida Cortexum** — Bras Orion-Cygnus et Centre-Left ; terrain plat à légèrement ondulé ; gravité limitée à
  0,238 G sur corps Rocky.
- **Cactoida Lapis** — Bras Sagittarius-Carina et Centre-Left ; terrain plat à légèrement ondulé.
- **Cactoida Peperatis** — Bras Scutum-Centaurus et Centre-Left ; pousse sur les collines et flancs de montagne
  (magmas mineurs tolérés sur Rocky).
- **Cactoida Pullulanta** — Bras de Persée et Centre-Top ; terrain plat à légèrement ondulé ; gravité limitée à 0,238
  G sur corps Rocky.
- **Cactoida Vermis** — Branche Water (T >= 390 K, gravité très basse <= 0,064 G) ou branche rare SO2 (160-207 K, g >=
  0,26).

*Vermis est à la fois l'espèce la plus chère et la plus tolérante à la chaleur du genre.*

#### Clypeus — genre d'exobiologie Odyssey (3 espèces, 8,4 M à 16,2 M Cr)

*Habitat : corps à haute teneur métallique ou rocheux, atmosphère CO2 ou eau, gravité < 0,28 G, plaines rocailleuses.
Séparation minimale 150 m (voir 2.3).*

| Espèce             | Valeur (Cr) | Fréquence | Corps | Atmosphère | Volcanisme | Température (K) | Gravité (G) |
|--------------------|-------------|-----------|-------|------------|------------|-----------------|-------------|
| Clypeus Lacrimam   | 8 418 000   | 54,2 %    | Rocky | CO2, Eau   | Aucun, Eau | ≥ 190           | ≤ 0,276     |
| Clypeus Margaritus | 11 873 200  | 28,1 %    | HMC   | CO2, Eau   | Aucun      | ≥ 190           | ≤ 0,276     |
| Clypeus Speculumi  | 16 202 800  | 17,7 %    | Rocky | CO2, Eau   | Aucun, Eau | ≥ 190           | ≤ 0,238     |

*Précisions par espèce :*

- **Clypeus Lacrimam** — Uniquement sur Rocky : branche CO2 190-199 K (g <= 0,238) ou branche Water T >= 390 K, sur
  plaines caillouteuses.
- **Clypeus Margaritus** — Uniquement sur HMC : branche CO2 190-195 K ou branche Water T >= 390 K, sur plaines
  caillouteuses et bas de collines.
- **Clypeus Speculumi** — Uniquement sur Rocky à plus de 2 500 Ls de l'étoile parente (contrainte communautaire non
  confirmée par télémétrie) ; branche Water limitée à 0,056 G.

#### Concha — genre d'exobiologie Odyssey (4 espèces, 2,4 M à 19,0 M Cr)

*Habitat : corps à haute teneur métallique ou rocheux, atmosphère ammoniac/CO2/azote/eau, gravité < 0,28 G, séparation
minimale 150 m.*

| Espèce            | Valeur (Cr) | Fréquence | Corps      | Atmosphère                  | Volcanisme | Température (K) | Gravité (G) |
|-------------------|-------------|-----------|------------|-----------------------------|------------|-----------------|-------------|
| Concha Labiata    | 2 352 400   | 47,4 %    | Rocky, HMC | CO2                         | Aucun      | 150-195,41      | ≤ 0,276     |
| Concha Aureolas   | 7 774 700   | 15,0 %    | Rocky, HMC | Ammoniac                    | —          | —               | ≤ 0,276     |
| Concha Renibus    | 4 572 400   | 36,9 %    | Rocky, HMC | CO2, Eau, Ammoniac, Méthane | —          | ≥ 79            | ≤ 0,276     |
| Concha Biconcavis | 19 010 800  | 0,74 %    | Rocky, HMC | Azote                       | Aucun      | ≤ 52            | ≤ 0,276     |

*Précisions par espèce :*

- **Concha Labiata** — Vallées et zones ondulées ; gravité limitée à 0,238 G sur corps Rocky.
- **Concha Aureolas** — Vallées et zones ondulées au pied des collines ; température seulement observée 152-177 K,
  sans borne dure.
- **Concha Renibus** — Branches CO2 180-195 K, Water T >= 390 K, Méthane 79-104 K et Ammonia T >= 174 K, avec une
  gravité de 0,05 à 0,238 G selon la branche. Le résumé d'habitat de Canonn se contente ici de la mention « sources de
  chaleur » ; le tableau ci-dessus est plus fin, avec ses quatre branches atmosphériques.
- **Concha Biconcavis** — Plafond thermique de 50 K sur corps Rocky (52 K sur HMC) ; vallées et zones ondulées au pied
  des reliefs.

*Biconcavis est très rare et particulièrement recherchée.*

#### Crystalline Shard — genre d'exobiologie hors famille Odyssey (1 espèce, 1,63 M Cr)

*Habitat : corps glacés, rocheux, rocheux-glacés ou à haute teneur métallique (HMC) sans atmosphère, volcanisme mineur
obligatoire (ammoniac, CO2, méthane, azote, eau, magma ferreux, rocheux ou silicaté), 20-250 K, à plus de 10 000 ls de
l'étoile d'arrivée ; étoile primaire de classe A, F, G, K ou M et système comportant un monde Earth-like, un Water
World, un Ammonia World ou une géante gazeuse à vie. Séparation minimale 100 m (voir 2.3).*

| Espèce             | Valeur (Cr) | Fréquence | Corps                      | Atmosphère | Volcanisme                                                           | Température (K) | Gravité (G) |
|--------------------|-------------|-----------|----------------------------|------------|----------------------------------------------------------------------|-----------------|-------------|
| Crystalline Shards | 1 628 800   | —         | Icy, Rocky, Rocky Ice, HMC | Aucune     | Ammoniac, CO2, Méthane, Azote, Eau, Magma ferreux, Rocheux, Silicaté | 20-250          | ≤ 1,45      |

*Précisions par espèce :*

- **Crystalline Shards** — Étoile primaire A, F, G, K ou M et système contenant un ELW, Water World, Ammonia World ou
  Gas Giant à vie ; volcanisme mineur obligatoire et plafond 1,45 G réservé aux HMC (0,19–0,24 G sur Icy/Rocky/Rocky
  Ice). Corps situé à plus de 10 000 ls de l'étoile d'arrivée.

*Le plafond de 1,45 G ne vaut que sur les corps HMC ; sur les corps glacés, rocheux ou rocheux-glacés, la fourchette
observée est de 0,19 à 0,24 G. Fréquences d'observation Canonn non disponibles pour ce genre.*

#### Electricae — genre d'exobiologie Odyssey (2 espèces, 6,28 M Cr chacune)

*Habitat : mondes de glace extrêmes exclusivement, atmosphère argon, séparation minimale 1 000 m, gravité 0,03-0,28 G,
environ 20-150 K.*

| Espèce              | Valeur (Cr) | Fréquence | Corps | Atmosphère           | Volcanisme | Température (K) | Gravité (G) | Corrélation                                    |
|---------------------|-------------|-----------|-------|----------------------|------------|-----------------|-------------|------------------------------------------------|
| Electricae Pluma    | 6 284 600   | 27,3 %    | Icy   | Argon, Néon          | —          | ≤ 150           | ≤ 0,276     | Étoiles A, naines blanches, étoiles à neutrons |
| Electricae Radialem | 6 284 600   | 72,7 %    | Icy   | Argon, Néon, Méthane | —          | ≤ 150           | ≤ 0,276     | Proximité de nébuleuses                        |

*Précisions par espèce :*

- **Electricae Pluma** — Exige une étoile parente de classe O, B, A, Ae/Be, Wolf-Rayet, naine blanche, étoile à
  neutrons ou trou noir ; plaines glacées près des lacs gelés.
- **Electricae Radialem** — À moins de 150 ly du centre d'une nébuleuse ; plaines glacées près des lacs gelés et des
  fissures.

#### Fonticulua — genre d'exobiologie Odyssey (6 espèces, 1 M à 20 M Cr)

*Habitat : mondes de glace exclusivement, gravité < 0,29 G, séparation minimale 500 m.*

| Espèce                 | Valeur (Cr)    | Fréquence | Corps          | Atmosphère   | Volcanisme | Température (K) | Gravité (G) |
|------------------------|----------------|-----------|----------------|--------------|------------|-----------------|-------------|
| Fonticulua Campestris  | 1 000 000      | 59,1 %    | Icy, Rocky Ice | Argon        | —          | ≤ 151           | ≤ 0,276     |
| Fonticulua Digitos     | 1 804 100      | —         | Icy, Rocky Ice | Méthane      | —          | —               | ≤ 0,276     |
| Fonticulua Fluctus     | **20 000 000** | très rare | Icy            | Oxygène, CO2 | —          | 143-200         | ≤ 0,276     |
| Fonticulua Lapida      | 3 111 000      | —         | Icy, Rocky Ice | Azote        | —          | ≤ 81            | ≤ 0,276     |
| Fonticulua Segmentatus | 19 010 800     | —         | Icy            | Néon         | —          | 50-75           | ≤ 0,276     |
| Fonticulua Upupam      | 5 727 600      | —         | Icy, Rocky Ice | Argon        | —          | ≤ 124           | ≤ 0,276     |

*Précisions par espèce :*

- **Fonticulua Campestris** — Plaines glacées doucement ondulées ; plafond de température 132 K sur Icy et 151 K sur
  Rocky Ice, et 59 % de la population du genre.
- **Fonticulua Digitos** — Seule Fonticulua qui tolère un terrain plus rugueux que les plaines ondulées, avec une
  gravité observée très basse (0,06 G).
- **Fonticulua Fluctus** — Espèce la plus chère du jeu (0,42 % de la population), exclusivement sur corps Icy en
  oxygène, avec une branche secondaire CO₂-rich à 170–180 K.
- **Fonticulua Lapida** — Plaines glacées très froides, avec un plafond de température de 70 K sur Icy et 81 K sur
  Rocky Ice.
- **Fonticulua Segmentatus** — Uniquement sur corps Icy : Néon entre 50 et 56,1 K, Néon-rich entre 56,2 et 75 K, pour
  1,17 % de la population du genre.
- **Fonticulua Upupam** — Exige une atmosphère Argon-rich (et non Argon simple), avec un plafond de 80 K sur Icy et
  124 K sur Rocky Ice.

*Fluctus est l'espèce la plus chère recensée dans l'ensemble de ce catalogue ; elle n'existe que sur des mondes de glace
à atmosphère riche en oxygène, une combinaison peu répandue, ce qui explique sa rareté.*

#### Frutexa — genre d'exobiologie Odyssey (7 espèces, 1,6 M à 10,3 M Cr)

*Habitat : corps à haute teneur métallique ou rocheux, gravité < 0,29 G, séparation minimale 150 m.*

| Espèce             | Valeur (Cr) | Fréquence | Corps      | Atmosphère                  | Volcanisme | Température (K) | Gravité (G) |
|--------------------|-------------|-----------|------------|-----------------------------|------------|-----------------|-------------|
| Frutexa Acus       | 7 774 700   | 33,2 %    | Rocky      | CO2                         | —          | 146-195,41      | ≤ 0,238     |
| Frutexa Collum     | 1 639 800   | —         | Rocky, HMC | SO2                         | —          | ≤ 211           | ≤ 0,276     |
| Frutexa Fera       | 1 632 500   | —         | Rocky      | CO2                         | —          | 146-195,41      | ≤ 0,238     |
| Frutexa Flabellum  | 1 808 900   | 21,8 %    | Rocky, HMC | Ammoniac, CO2               | —          | 152-195,41      | ≤ 0,276     |
| Frutexa Flammasis  | 10 326 000  | 8,7 %     | Rocky      | Ammoniac                    | —          | —               | ≤ 0,276     |
| Frutexa Metallicum | 1 632 500   | 22,5 %    | HMC        | Ammoniac, CO2, Méthane, Eau | Aucun      | —               | ≤ 0,276     |
| Frutexa Sponsae    | 5 988 000   | —         | Rocky      | Eau                         | —          | ≥ 390           | ≤ 0,276     |

*Précisions par espèce :*

- **Frutexa Acus** — Plaines et flancs rocheux, uniquement dans le bras Orion-Cygnus et la région Galactic Centre-Left
  (jumelle de Frutexa Fera).
- **Frutexa Collum** — Sans contrainte régionale, avec une plage de 132–211 K sur HMC contre un simple plafond de 151
  K sur Rocky.
- **Frutexa Fera** — Plaines et flancs rocheux, uniquement dans l'Outer Arm et la région Galactic Centre-Right
  (jumelle de Frutexa Acus).
- **Frutexa Flabellum** — Absente du bras Scutum-Centaurus et de la région Galactic Centre-Left, principalement en
  ammoniac avec une branche secondaire CO₂.
- **Frutexa Flammasis** — Restreinte au bras Scutum-Centaurus et à la région Galactic Centre-Left, sur flancs rocheux.
- **Frutexa Metallicum** — Uniquement sur HMC sans volcanisme, avec des branches CO₂ 146–195,41 K, Water T ≥ 390 K (g
  ≤ 0,052) et Méthane 100–102 K.
- **Frutexa Sponsae** — Corps rocheux très chauds (T ≥ 390 K) en atmosphère d'eau, à gravité observée très faible
  (0,04–0,06 G).

#### Fumerola — genre d'exobiologie Odyssey (4 espèces, 6,3 M à 16,2 M Cr)

*Habitat : zones volcaniques actives (environ 4 espèces). Séparation minimale 100 m (voir 2.3) — la plus courte de
toutes, cohérente avec la nécessité de rester à proximité immédiate des évents actifs.*

| Espèce            | Valeur (Cr) | Fréquence | Corps                 | Atmosphère                                | Volcanisme                       | Température (K) | Gravité (G) | Type de volcanisme | Terrain        |
|-------------------|-------------|-----------|-----------------------|-------------------------------------------|----------------------------------|-----------------|-------------|--------------------|----------------|
| Fumerola Aquatis  | 6 284 600   | 30,4 %    | Icy, Rocky, Rocky Ice | Argon, SO2, Ammoniac, Azote, Eau, Oxygène | Eau                              | —               | 0,03-0,276  | Aquatique          | Mondes glacés  |
| Fumerola Carbosis | 6 284 600   | 23,9 %    | Icy, Rocky Ice        | Méthane, Argon, SO2, Azote                | CO2, Méthane                     | —               | 0,03-0,276  | Carboné            | Mondes glacés  |
| Fumerola Extremus | 16 202 800  | 13,8 %    | Rocky, Rocky Ice, HMC | Méthane, Ammoniac, SO2, Argon             | Silicaté, Rocheux, Magma ferreux | —               | 0,04-0,276  | Vapeur de silicate | Mondes rocheux |
| Fumerola Nitris   | 7 500 900   | 31,9 %    | Icy                   | Argon, Méthane                            | Ammoniac, Azote                  | —               | 0,03-0,276  | Azoté              | Mondes glacés  |

*Précisions par espèce :*

- **Fumerola Aquatis** — Pousse exclusivement sur les fumerolles à geysers ou magma d'eau, sur les rochers des zones
  plates repérées au DSS géologique.
- **Fumerola Carbosis** — Fumerolles à geysers de dioxyde de carbone ou magma de méthane mineur, surtout sur corps
  Icy.
- **Fumerola Extremus** — Fumerolles à geysers de vapeur de silicate ou magma rocheux/métallique, majoritairement sur
  corps Rocky.
- **Fumerola Nitris** — Fumerolles à magma mineur d'ammoniac ou d'azote sur corps Icy, avec 2 % des relevés sur
  d'autres atmosphères qu'Argon ou Methane.

#### Fungoida — genre d'exobiologie Odyssey (4 espèces, 1,7 M à 3,7 M Cr)

*Habitat : organismes souterrains chimio/thermosynthétiques, terrain montagneux, séparation minimale 300 m.*

| Espèce            | Valeur (Cr) | Fréquence | Corps                 | Atmosphère                         | Volcanisme | Température (K) | Gravité (G) |
|-------------------|-------------|-----------|-----------------------|------------------------------------|------------|-----------------|-------------|
| Fungoida Setisis  | 1 670 100   | 50,2 %    | Rocky, HMC, Rocky Ice | Ammoniac, Méthane, CO2             | —          | —               | ≤ 0,276     |
| Fungoida Gelata   | 3 330 300   | 22,9 %    | Rocky, HMC            | CO2, Eau, Ammoniac, Argon, Méthane | —          | —               | ≤ 0,276     |
| Fungoida Stabitis | 2 680 300   | 18,1 %    | Rocky, HMC            | CO2, Eau, Ammoniac, Argon, Méthane | —          | —               | ≤ 0,276     |
| Fungoida Bullarum | 3 703 200   | 8,9 %     | Rocky Ice, Rocky, HMC | Argon, Azote                       | Aucun      | ≤ 133           | ≤ 0,276     |

*Précisions par espèce :*

- **Fungoida Setisis** — Sans contrainte régionale, sur flancs et sommets de montagnes, avec une branche Ammonia
  160–195,41 K, une branche Methane 67–108 K et une branche CO₂.
- **Fungoida Gelata** — Absente du bras Orion-Cygnus ; branche CO₂ à 180–195,41 K plafonnée à 0,238 G et branche Water
  à T ≥ 390 K, sur flancs de montagnes.
- **Fungoida Stabitis** — Restreinte au bras Orion-Cygnus et à la région Galactic Centre-Left ; branche CO₂ 180–195,41
  K plafonnée à 0,238 G et branche Water T ≥ 390 K.
- **Fungoida Bullarum** — Surtout sur Rocky Ice, sur flancs et sommets de montagnes, avec un plafond de température
  variable selon la branche (77, 90, 93 ou 133 K).

#### Osseus — genre d'exobiologie Odyssey (6 espèces, 1,5 M à 12,9 M Cr)

*Habitat : corps rocheux ou à haute teneur métallique, séparation minimale 800 m.*

| Espèce             | Valeur (Cr) | Fréquence | Corps                 | Atmosphère                    | Volcanisme | Température (K) | Gravité (G) |
|--------------------|-------------|-----------|-----------------------|-------------------------------|------------|-----------------|-------------|
| Osseus Cornibus    | 1 483 000   | 5,6 %     | Rocky, HMC            | CO2                           | Aucun      | 180-195,41      | ≤ 0,276     |
| Osseus Fractus     | 4 027 800   | 16,2 %    | Rocky, HMC            | CO2                           | Aucun      | 180-190         | ≤ 0,276     |
| Osseus Pellebantus | 9 739 000   | 4,7 %     | Rocky, HMC            | CO2                           | Aucun      | 191-195,41      | ≤ 0,276     |
| Osseus Spiralis    | 2 404 700   | 48,1 %    | Rocky, HMC, Rocky Ice | Ammoniac                      | —          | ≥ 160           | ≤ 0,276     |
| Osseus Discus      | 12 934 900  | 8,3 %     | Rocky, HMC, Rocky Ice | Eau, Méthane, Ammoniac, Argon | —          | —               | 0,05-0,276  |
| Osseus Pumice      | 3 156 300   | 16,9 %    | Rocky Ice, Rocky, HMC | Argon, Méthane, Azote         | —          | ≤ 134           | ≤ 0,276     |

*Précisions par espèce :*

- **Osseus Cornibus** — Pousse uniquement sur les zones rocheuses ; bras de Persée et région Centre-Top ; plafond réel
  0,238 G sur corps Rocky, 0,276 G sur HMC.
- **Osseus Fractus** — Pousse uniquement sur les zones rocheuses ; partout SAUF le bras de Persée et la région
  Centre-Top.
- **Osseus Pellebantus** — Pousse uniquement sur les zones rocheuses ; partout SAUF le bras de Persée et la région
  Centre-Top.
- **Osseus Spiralis** — Pousse uniquement sur les zones rocheuses ; aucune contrainte de région galactique.
- **Osseus Discus** — Pousse uniquement sur les zones rocheuses ; la branche Water exige T >= 390 K et la branche
  Méthane 78-109 K.
- **Osseus Pumice** — Pousse uniquement sur les zones rocheuses, surtout sur Rocky Ice ; le plafond de température
  varie de 51 K à 134 K selon l'atmosphère.

#### Radicoida — genre d'exobiologie hors famille Odyssey (1 espèce, 952 296 Cr, système HIP 87621)

*Habitat : corps à haute teneur métallique (HMC) ou rocheux, atmosphère CO2, sans volcanisme ou à volcanisme silicaté,
467-699 K, gravité 0,05-0,38 G. Genre à espèce unique, connu du seul système **HIP 87621** (accès sous permis) : le
signal est classé « Other » et n'apparaît pas dans la surimpression exobiologie du DSS, et seuls les arbres de taille
moyenne (environ 30 m) sont scannables. Séparation minimale 15 m (voir 2.3).*

| Espèce          | Valeur (Cr) | Fréquence | Corps      | Atmosphère | Volcanisme      | Température (K) | Gravité (G) |
|-----------------|-------------|-----------|------------|------------|-----------------|-----------------|-------------|
| Radicoida Unica | 952 296     | —         | HMC, Rocky | CO2        | Aucun, Silicaté | 467-699         | 0,05-0,38   |

*Précisions par espèce :*

- **Radicoida Unica** — Uniquement dans HIP 87621 (système permit-locked), signal classé « Other » sans overlay
  exobiologie au DSS, et seuls les arbres de taille moyenne (~30 m) sont scannables.

> **Divergence de valeur assumée.** Le catalogue compilé cité en 2.4 porte **119 037 Cr** pour cette espèce. Ce guide
> retient **952 296 Cr**, valeur **relevée en jeu à la vente** et consignée dans l'étude de faisabilité du 19/08/2026
> de ce corpus, qui note qu'elle « sort du schéma des valeurs rondes ». Une valeur observée en jeu prime sur une valeur
> de catalogue compilé : c'est le montant que le comptoir Vista Genomics verse réellement. Deux indices renforcent la
> correction. D'une part, sur les 118 espèces du catalogue compilé, *Radicoida Unica* est la **seule** dont la valeur
> ne soit pas un multiple de 100, ce qui la désigne comme l'anomalie plutôt que comme la règle. D'autre part, 119 037
> est exactement le huitième de 952 296, un rapport entier qui ressemble à une erreur de report plutôt qu'à un barème.
> Le montant observé reste néanmoins **une observation unique** : il mérite d'être reconfirmé sur une seconde vente.
> La même étude corrige au passage la **distance d'échantillonnage**, relevée à **15 m** en jeu là où le catalogue
> compilé porte 100 m ; c'est la valeur de 15 m qui figure dans le tableau de 2.3. Les deux divergences sont
> également consignées dans [Sources de données](./17-sources-donnees.md).

*Même corrigée, c'est l'espèce la moins rémunératrice du catalogue — la seule à passer sous les 1 000 000 Cr, valeur
plancher que partagent six autres espèces (Bacterium Acies, Bacterium Aurasus, Bacterium Vesicula, Fonticulua
Campestris, Tussock Pennatis, Tussock Propagito). Fréquences d'observation Canonn non disponibles pour ce genre.*

#### Recepta — genre d'exobiologie Odyssey (3 espèces, 12,9 M à 16,2 M Cr)

*Habitat : extrêmophiles SO2, mondes glacés ou rocheux, gravité < 0,29 G, séparation minimale 150 m.*

| Espèce                | Valeur (Cr) | Fréquence | Corps                      | Atmosphère         | Volcanisme | Température (K) | Gravité (G) |
|-----------------------|-------------|-----------|----------------------------|--------------------|------------|-----------------|-------------|
| Recepta Umbrux        | 12 934 900  | 51,6 %    | Icy, Rocky, Rocky Ice, HMC | SO2, CO2, Ammoniac | —          | ≤ 273           | ≤ 0,276     |
| Recepta Conditivus    | 14 313 700  | 30,0 %    | Icy, Rocky, Rocky Ice, HMC | SO2, CO2, Oxygène  | —          | ≤ 273           | ≤ 0,276     |
| Recepta Deltahedronix | 16 202 800  | 18,4 %    | Rocky, Icy, HMC, Rocky Ice | SO2, CO2, Oxygène  | —          | ≤ 272           | ≤ 0,276     |

*Précisions par espèce :*

- **Recepta Umbrux** — Terrain plat, légèrement ondulé ou en pente douce ; surtout sur corps Icy en atmosphère SO2.
- **Recepta Conditivus** — Terrain plat, légèrement ondulé ; très majoritairement sur corps Icy en atmosphère SO2.
- **Recepta Deltahedronix** — Terrain plat, légèrement ondulé ; majoritairement sur corps Rocky, certaines branches
  plafonnent à 0,238 G.

#### Sinuous Tuber — genre d'exobiologie hors famille Odyssey (8 espèces, 1,51 M Cr chacune)

*Habitat : corps rocheux ou à haute teneur métallique (HMC) sans atmosphère, volcanisme de magma ferreux, silicaté ou
rocheux, 200-500 K. Genre restreint à certaines régions Canonn du cœur galactique, chaque couleur correspondant à un
ensemble de régions distinct. Séparation minimale 100 m (voir 2.3).*

| Espèce                      | Valeur (Cr) | Fréquence | Corps      | Atmosphère | Volcanisme                       | Température (K) | Gravité (G) | Gravité max (Rocky / HMC) | Régions Canonn |
|-----------------------------|-------------|-----------|------------|------------|----------------------------------|-----------------|-------------|---------------------------|----------------|
| Albidum Sinuous Tubers      | 1 514 500   | —         | Rocky, HMC | Aucune     | Magma ferreux, Silicaté, Rocheux | 200-500         | ≤ 3         | 3 G / 0,3 G               | 9 à 11         |
| Blatteum Sinuous Tubers     | 1 514 500   | —         | Rocky, HMC | Aucune     | Magma ferreux, Silicaté, Rocheux | 200-500         | ≤ 3         | 3 G / 0,5 G               | 6 à 10, 18, 19 |
| Caeruleum Sinuous Tubers    | 1 514 500   | —         | Rocky, HMC | Aucune     | Rocheux, Silicaté                | 200-500         | ≤ 3         | 3 G / 0,7 G               | 1 à 5, 8 à 11  |
| Lindigoticum Sinuous Tubers | 1 514 500   | —         | Rocky, HMC | Aucune     | Magma ferreux, Silicaté, Rocheux | 200-500         | ≤ 2         | 2 G / 0,5 G               | 4 à 10, 18, 19 |
| Prasinum Sinuous Tubers     | 1 514 500   | —         | Rocky, HMC | Aucune     | Magma ferreux, Silicaté, Rocheux | 200-500         | ≤ 3         | 3 G / 0,3 G               | 1 à 5, 8 à 11  |
| Roseum Sinuous Tubers       | 1 514 500   | —         | Rocky, HMC | Aucune     | Rocheux, Silicaté, Magma ferreux | 200-500         | ≤ 4         | 4 G / 0,3 G               | 1 à 11, 18, 19 |
| Violaceum Sinuous Tubers    | 1 514 500   | —         | Rocky, HMC | Aucune     | Magma ferreux, Silicaté, Rocheux | 200-500         | ≤ 3         | 3 G / 0,5 G               | 2 à 10, 18, 19 |
| Viride Sinuous Tubers       | 1 514 500   | —         | Rocky, HMC | Aucune     | Rocheux, Magma ferreux, Silicaté | 200-500         | ≤ 2         | 2 G / 0,3 G               | 3 à 10, 18, 19 |

*Précisions par espèce :*

- **Albidum Sinuous Tubers** — Régions Canonn 9, 10 et 11 près du cœur galactique ; plafond 3 G sur Rocky mais
  seulement 0,3 G sur HMC.
- **Blatteum Sinuous Tubers** — Régions Canonn 6 à 10, 18 et 19 ; plafond 3 G sur Rocky mais seulement 0,5 G sur HMC.
- **Caeruleum Sinuous Tubers** — Régions Canonn 1 à 5 et 8 à 11, geysers majeurs Rocky/Silicate ; plafond 3 G sur
  Rocky mais 0,7 G sur HMC.
- **Lindigoticum Sinuous Tubers** — Régions Canonn 4 à 10, 18 et 19 ; plafond 2 G sur Rocky mais seulement 0,5 G sur
  HMC.
- **Prasinum Sinuous Tubers** — Régions Canonn 1 à 5 et 8 à 11 ; plafond 3 G sur Rocky mais seulement 0,3 G sur HMC.
- **Roseum Sinuous Tubers** — Présent dans tout le TubersBatch (régions 1 à 11, 18 et 19) ; plafond 4 G sur Rocky mais
  seulement 0,3 G sur HMC.
- **Violaceum Sinuous Tubers** — Régions Canonn 2 à 10, 18 et 19 ; plafond 3 G sur Rocky mais seulement 0,5 G sur HMC.
- **Viride Sinuous Tubers** — Régions Canonn 3 à 10, 18 et 19 ; plafond 2 G sur Rocky mais seulement 0,3 G sur HMC.

*Caeruleum et Prasinum exigent un volcanisme rocheux ou silicaté (geysers majeurs pour Caeruleum) ; les autres espèces
acceptent aussi le magma ferreux. Fréquences d'observation Canonn non disponibles pour ce genre.*

#### Stratum — genre d'exobiologie Odyssey (8 espèces, 1,4 M à 19,0 M Cr)

*Habitat : corps rocheux ou à haute teneur métallique. Séparation minimale 500 m (voir 2.3).*

| Espèce             | Valeur (Cr) | Fréquence | Corps | Atmosphère                       | Volcanisme | Température (K) | Gravité (G) |
|--------------------|-------------|-----------|-------|----------------------------------|------------|-----------------|-------------|
| Stratum Araneamus  | 2 448 900   | —         | Rocky | SO2                              | —          | 165-373         | 0,26-0,57   |
| Stratum Cucumisis  | 16 202 800  | 4,2 %     | Rocky | SO2, CO2, Oxygène                | —          | 191-373         | ≤ 0,59      |
| Stratum Excutitus  | 2 448 900   | 10,0 %    | Rocky | CO2, SO2, Oxygène                | —          | 165-190         | ≤ 0,49      |
| Stratum Frigus     | 2 637 500   | —         | Rocky | SO2, CO2, Oxygène                | —          | 191-372         | ≤ 0,56      |
| Stratum Laminamus  | 2 788 300   | —         | Rocky | Ammoniac                         | —          | ≥ 161           | ≤ 0,62      |
| Stratum Limaxus    | 1 362 000   | —         | Rocky | CO2, SO2, Oxygène                | —          | 165-190         | ≤ 0,48      |
| Stratum Paleas     | 1 362 000   | 36,9 %    | Rocky | Ammoniac, CO2, Eau, Oxygène      | —          | 165-447         | ≤ 0,6       |
| Stratum Tectonicas | 19 010 800  | 37,5 % *  | HMC   | SO2, CO2, Ammoniac, Eau, Oxygène | —          | 165-450         | ≤ 0,62      |

*Précisions par espèce :*

- **Stratum Araneamus** — Terrain plat ouvert, aucune contrainte de région ; espèce très rare (0,3 % de la population),
  seule la variante Emerald a été observée.
- **Stratum Cucumisis** — Terrain plat ouvert ; uniquement dans le bras Sagittarius-Carina et la région Centre-Left.
- **Stratum Excutitus** — Terrain plat ouvert ; uniquement dans le bras Orion-Cygnus et la région Centre-Left.
- **Stratum Frigus** — Terrain plat ouvert ; bras de Persée et régions 3 et 7.
- **Stratum Laminamus** — Terrain plat ouvert ; probablement bras Sagittarius-Carina et région Izanami.
- **Stratum Limaxus** — Terrain plat ouvert ; bras Scutum-Centaurus, hors Odin's Hold et Galactic Centre.
- **Stratum Paleas** — Terrain plat ouvert, aucune contrainte de région ; la branche Water exige T >= 390 K.
- **Stratum Tectonicas** — Terrain plat ouvert sur HMC uniquement, aucune contrainte de région ; la branche Water exige
  T >= 390 K.

*\* Canonn note que ce pourcentage est probablement surreprésenté, la forte valeur de Tectonicas attirant davantage de
chasseurs d'échantillons que les autres espèces du genre.*

#### Tubus — genre d'exobiologie Odyssey (5 espèces, 2,4 M à 11,9 M Cr)

*Habitat : gravité < 0,17 G, plaines ouvertes, atmosphère ammoniac ou CO2. Séparation minimale 800 m (voir 2.3).*

| Espèce           | Valeur (Cr) | Fréquence | Corps | Atmosphère    | Volcanisme | Température (K) | Gravité (G) |
|------------------|-------------|-----------|-------|---------------|------------|-----------------|-------------|
| Tubus Compagibus | 7 774 700   | 44,2 %    | Rocky | CO2           | Aucun      | 160-197         | ≤ 0,16      |
| Tubus Cavas      | 11 873 200  | 18,0 %    | Rocky | CO2           | Aucun      | 160-197         | ≤ 0,153     |
| Tubus Rosarium   | 2 637 500   | 14,2 %    | Rocky | Ammoniac      | —          | ≥ 160           | ≤ 0,164     |
| Tubus Conifer    | 2 415 500   | 14,1 %    | Rocky | CO2           | Aucun      | 160-195,41      | ≤ 0,152     |
| Tubus Sororibus  | 5 727 600   | 9,7 %     | HMC   | CO2, Ammoniac | Aucun      | 160-195,41      | ≤ 0,153     |

*Précisions par espèce :*

- **Tubus Compagibus** — Plaines ouvertes du bras Sagittarius-Carina et du Centre-Gauche galactique, pression >= 0,003
  atm.
- **Tubus Cavas** — Plaines ouvertes du bras Scutum-Centaurus et du Centre-Gauche galactique, pression >= 0,003 atm.
- **Tubus Rosarium** — Plaines ouvertes sans contrainte de région, toléré un volcanisme particulaire mineur.
- **Tubus Conifer** — Plaines ouvertes du bras Perseus et du Centre-Haut galactique, pression >= 0,003 atm.
- **Tubus Sororibus** — HMC uniquement, branche CO2 dominante (97 %) bornée à 195,41 K alors que la branche Ammoniac
  (3 %) n'a pas de plafond, pression >= 0,002 atm.

#### Tussock — genre d'exobiologie Odyssey (15 espèces, 1 M à 19,0 M Cr)

*Habitat : surface solide requise, gravité < 0,29 G, majoritairement CO2 mais aussi ammoniac/méthane/SO2/eau. Genre le
plus diversifié de la famille Odyssey avec Bacterium : 15 espèces recensées, désormais toutes listées ci-dessous.
Séparation minimale 200 m (voir 2.3).*

| Espèce            | Valeur (Cr) | Fréquence | Corps            | Atmosphère     | Volcanisme | Température (K) | Gravité (G) |
|-------------------|-------------|-----------|------------------|----------------|------------|-----------------|-------------|
| Tussock Albata    | 3 252 500   | 7,18 %    | Rocky, HMC       | CO2            | Aucun      | 175-180         | ≤ 0,276     |
| Tussock Capillum  | 7 025 800   | 3,36 %    | Rocky Ice, Rocky | Argon, Méthane | Aucun      | 80-129          | 0,22-0,276  |
| Tussock Caputus   | 3 472 400   | 8,03 %    | Rocky, HMC       | CO2            | Aucun      | 181-190         | ≤ 0,276     |
| Tussock Catena    | 1 766 600   | 4,89 %    | Rocky, HMC       | Ammoniac       | —          | —               | ≤ 0,276     |
| Tussock Cultro    | 1 766 600   | 16,78 %   | Rocky, HMC       | Ammoniac       | —          | —               | ≤ 0,276     |
| Tussock Divisa    | 1 766 600   | 6,28 %    | Rocky, HMC       | Ammoniac       | —          | —               | ≤ 0,276     |
| Tussock Ignis     | 1 849 000   | 13,22 %   | Rocky, HMC       | CO2            | Aucun      | 161-170         | ≤ 0,196     |
| Tussock Pennata   | 5 853 800   | 2,31 %    | Rocky, HMC       | CO2            | Aucun      | 145-154         | ≤ 0,79      |
| Tussock Pennatis  | 1 000 000   | 7,95 %    | Rocky, HMC       | CO2            | Aucun      | 146-195,41      | ≤ 0,276     |
| Tussock Propagito | 1 000 000   | 12,81 %   | Rocky, HMC       | CO2            | Aucun      | 145-195,41      | ≤ 0,276     |
| Tussock Serrati   | 4 447 100   | 5,14 %    | Rocky, HMC       | CO2            | Aucun      | 171-174         | ≤ 0,227     |
| Tussock Stigmasis | 19 010 800  | 0,88 %    | Rocky, HMC       | SO2            | Aucun      | 132-168         | ≤ 0,276     |
| Tussock Triticum  | 7 774 700   | 2,61 %    | Rocky, HMC       | CO2            | Aucun      | 191-195,41      | ≤ 0,276     |
| Tussock Ventusa   | 3 227 700   | 4,33 %    | Rocky, HMC       | CO2            | —          | 155-160         | ≤ 0,16      |
| Tussock Virgam    | 14 313 700  | 4,23 %    | Rocky, HMC       | Eau            | —          | ≥ 390           | ≤ 0,276     |

##### Tussock — précisions d'habitat, espèce par espèce (15 espèces)

*Précisions par espèce :*

- **Tussock Albata** — Plaines plates entre les montagnes, bras Sagittarius-Carina et Perseus, plafond ramené à 0,238
  G sur corps Rocky.
- **Tussock Capillum** — Quasi exclusivement sur Rocky Ice, seule Tussock à exiger une gravité minimale (0,22 G, voire
  0,269 G selon la branche), aucune contrainte de région.
- **Tussock Caputus** — Plaines plates des bras Sagittarius-Carina et Perseus, plafond ramené à 0,238 G sur corps
  Rocky.
- **Tussock Catena** — Bras Scutum-Centaurus hors région du Centre Galactique, magmas mineurs tolérés.
- **Tussock Cultro** — Bras Orion-Cygnus et Centre-Gauche (Odin's Hold, Izanami, Inner Orion Spur), geysers de
  silicate majeurs et magma métallique mineur tolérés.
- **Tussock Divisa** — Bras Perseus (et région 3), géologie mineure tolérée.
- **Tussock Ignis** — Bras Sagittarius-Carina et Perseus, gravité très limitée (0,171 G sur Rocky, 0,196 G sur HMC).
- **Tussock Pennata** — Bras Sagittarius-Carina et Perseus, plafond de 0,09 G sur Rocky contre 0,79 G sur la branche
  HMC.
- **Tussock Pennatis** — Outer Arm et Centre-Droit galactique, plafond ramené à 0,238 G sur corps Rocky.
- **Tussock Propagito** — Bras Scutum-Centaurus et Centre-Gauche, plafond ramené à 0,238 G sur corps Rocky.
- **Tussock Serrati** — Bras Sagittarius-Carina et Perseus, fenêtre thermique très étroite, plafond 0,198 G sur Rocky
  et 0,227 G sur HMC.
- **Tussock Stigmasis** — Aucune contrainte de région, fenêtre 132-168 K sur HMC mais seulement <= 152 K sur corps
  Rocky.
- **Tussock Triticum** — Bras Sagittarius-Carina et Perseus, corps CO2 très chauds, plafond ramené à 0,238 G sur
  Rocky.
- **Tussock Ventusa** — Bras Sagittarius-Carina et Perseus, gravité très basse (0,13 G sur Rocky, 0,16 G sur HMC),
  geysers de CO2 mineurs tolérés.
- **Tussock Virgam** — Mondes brûlants à atmosphère d'eau sans contrainte de région, gravité réelle observée très
  basse (0,04-0,06 G), magma d'eau mineur toléré.

*Stigmasis est l'espèce la plus chère du genre, Virgam la deuxième.*

### 2.5 Où trouver les espèces d'exobiologie les plus rentables

En recoupant l'ensemble des valeurs du tableau 2.4, le classement des espèces exobiologiques les plus rentables se
présente ainsi :

| Rang | Espèce                 | Valeur (Cr) | Atmosphère / habitat         | Fréquence |
|------|------------------------|-------------|------------------------------|-----------|
| 1    | Fonticulua Fluctus     | 20 000 000  | Oxygène, mondes de glace     | très rare |
| 2    | Concha Biconcavis      | 19 010 800  | Azote                        | 0,74 %    |
| 2    | Fonticulua Segmentatus | 19 010 800  | Néon, mondes de glace        | —         |
| 2    | Stratum Tectonicas     | 19 010 800  | Haute teneur métallique      | 37,5 % *  |
| 2    | Tussock Stigmasis      | 19 010 800  | SO2                          | 0,88 %    |
| 6    | Cactoida Vermis        | 16 202 800  | Eau                          | 17,3 %    |
| 6    | Clypeus Speculumi      | 16 202 800  | CO2/eau                      | 17,7 %    |
| 6    | Fumerola Extremus      | 16 202 800  | Volcans à vapeur de silicate | 13,8 %    |
| 6    | Recepta Deltahedronix  | 16 202 800  | SO2                          | 18,4 %    |
| 6    | Stratum Cucumisis      | 16 202 800  | CO2/SO2                      | 4,2 %     |
| 11   | Recepta Conditivus     | 14 313 700  | SO2                          | 30,0 %    |
| 11   | Tussock Virgam         | 14 313 700  | Eau                          | 4,2 %     |
| 13   | Aleoida Gravis         | 12 934 900  | Ammoniac/CO2                 | 11,8 %    |
| 13   | Osseus Discus          | 12 934 900  | —                            | 8,3 %     |
| 13   | Recepta Umbrux         | 12 934 900  | SO2                          | 51,6 %    |

**Stratégie pratique** (méthode décrite par le commandant Canonn *JJGoldberg*, premier commandant à atteindre le rang
Exobiology Elite V, article *« The Road to Exobiology Elite V »*) :

- Combiner les bases **EDAstro**, **EDSM** et **Canonn** (recherche par espèce, valeur et distance) avec un traceur de
  route pour visiter en chaîne les systèmes contenant les espèces à plus forte valeur.
- Certains secteurs galactiques (**Sinuefai, Sinuefe, Wredguia**) offriraient, selon l'expérience de JJGoldberg, des
  taux de rencontre supérieurs pour les espèces à haute valeur — information à recouper avant de planifier un itinéraire
  sur cette seule base.
- Les genres **Fonticulua** et **Electricae** n'existent que sur les mondes de glace ; **Recepta** et
  **Cactoida/Concha** nécessitent des atmosphères spécifiques et plus rares (SO2, eau), ce qui explique leur rareté et
  donc leur valeur élevée.
- **Repérer précisément la composition atmosphérique via le FSS avant de se poser** est la clé pour cibler directement
  les espèces payantes plutôt que d'atterrir au hasard.
- L'outil **Road to Riches** de Spansh automatise l'essentiel de cette méthode en générant directement un itinéraire
  optimisé sur une zone donnée.

#### Le bonus de première empreinte (First Footfall) et le First Logged (×5) en exobiologie

Deux bonus distincts sont attachés au fait d'arriver le premier sur un corps, et **ils sont constamment confondus**, y
compris dans les guides communautaires — la distinction change pourtant la manière de planifier un itinéraire.

| Bonus              | Ce qu'il récompense                                                         | Ce qu'il rapporte                                                       |
|--------------------|-----------------------------------------------------------------------------|-------------------------------------------------------------------------|
| **First Logged**   | Premier commandant à faire enregistrer une espèce donnée sur un corps donné | Valeur de base **+ 400 %**, soit **×5**                                 |
| **First Footfall** | Premier être humain à poser le pied sur le corps                            | Aucun crédit : le nom du commandant est inscrit sur la carte du système |

Le multiplicateur du First Logged est de **×5** (base + 400 %). Le wiki *Elite Dangerous* l'énonce sans ambiguïté dans
*Exobiology Sample Values* : *« samples that qualify as "First Logged" will reward five times the amount listed
below »*, et trois sources internes concordantes de ce corpus le reprennent (voir la note de sourçage en fin de
sous-section). Concrètement, un *Stratum Tectonicas* passe de **19 010 800 Cr** à **95 054 000 Cr** — chiffre donné tel
quel par ces sources. Par le même calcul, une *Fonticulua Fluctus*, espèce la plus chère du catalogue à 20 000 000 Cr
de base, atteindrait 100 000 000 Cr ; cette seconde valeur est une application de la règle, non un montant relevé dans
une source.

**Le First Footfall lui-même ne verse rien.** C'est une inscription sur la carte du système, pas une prime. S'il pèse
malgré tout sur la planification, c'est par un raccourci logique : un corps que personne n'a jamais foulé est en
pratique un First Logged garanti sur **toutes** ses espèces. D'où la confusion, que reproduisent d'ailleurs plusieurs
guides communautaires en parlant de « prime First Footfall ×5 » là où le ×5 est celui du First Logged.

##### Condition exacte d'obtention du ×5 First Logged (couple espèce/corps, réclamé à la vente)

Le bonus du First Logged se joue par couple **(espèce, corps)**, une seule fois dans l'histoire du jeu, et il est
**réclamé à la vente, pas au scan**. Un autre commandant peut donc encore le prendre pendant que les données dorment,
non vendues, dans la soute. Corollaire déjà rappelé en 2.3 : une fois l'espèce vendue depuis un corps,
le jeu refuse tout nouveau prélèvement de cette espèce sur ce corps — il faut aller de l'avant, jamais planifier un
retour.

##### Vérifier qu'un corps d'exobiologie est vierge avant d'atterrir (quatre contrôles)

Aucun outil ne garantit qu'un corps est vierge — la grande majorité des joueurs n'uploadent pas leurs journaux, si
bien que les bases sous-estiment systématiquement ce qui a déjà été exploré. Les vérifications utiles, par ordre de
coût croissant :

1. **Carte galactique**, avant même de sauter : le système est-il marqué comme non découvert ?
2. **Carte du système**, une fois sur place : un nom de commandant associé à un corps ou à une espèce signifie que le
   ×5 est perdu pour ce couple.
3. **Spansh Body Search**, en amont : filtrer sur *Last Updated At* antérieur au **19 mai 2021** (sortie d'Odyssey)
   pour cibler des corps dont aucune donnée biologique n'a jamais été remontée.
4. **Règle de distance** : les planètes de la Bulle n'offrent aucune première empreinte — les colons NPC les ont
   foulées depuis des siècles. Au-delà d'environ **1 000 al de Sol**, les corps vierges redeviennent fréquents.

##### Incidence du First Logged sur le choix d'itinéraire : boucle près de la Bulle ou espace vierge

Deux stratégies d'itinéraire d'exobiologie s'opposent face au bonus First Logged, et ce corpus les documente toutes
les deux :

- **Boucle près de la Bulle** (« Bubble Billionaire ») : pas de ×5, mais un volume élevé de spécimens, des retours
  rapides et un risque quasi nul. C'est la stratégie d'apprentissage, celle qu'un itinéraire *Road to Riches* ou
  *Expressway to Exomastery* de Spansh (voir 1.4) sert directement.
- **Expédition en espace vierge** : viser **500 à 2 000 al** hors des routes fréquentées, en évitant l'axe
  Sol-Colonia-Sagittarius A\* et les corridors balisés par les expéditions type Distant Worlds, déjà ratissés. Le gain
  attendu est d'un ordre de grandeur, au prix du risque : découper l'expédition en sessions (trajet aller, quatre à
  cinq sessions d'exploitation, trajet retour et vente) et **ne jamais enchaîner plus de cinq à six sessions sans
  vendre**, le risque cumulé de perdre le vaisseau — et avec lui la totalité des données non vendues — devenant
  inacceptable.

##### Cumul du ×5 avec la vente chez Vista Genomics et effet sur la réputation de faction

Le ×5 s'applique ligne par ligne, au couple (espèce, corps) : une même vente groupée peut donc mêler des lignes à
valeur de base et des lignes à ×5, et la vente en gros n'ouvre droit à **aucun bonus de volume supplémentaire** : aucune des sources internes consultées n'en documente. Ce que la vente
groupée apporte est d'un autre ordre : elle fait grimper la réputation auprès de la faction contrôlant la station,
presque instantanément jusqu'au statut *Allied*, ce qui rend le **choix du lieu de vente** significatif. Sur une longue
expédition, installer un module **Vista Genomics** à bord d'un Fleet Carrier (voir
[Fleet Carriers](./19-fleet-carriers.md)) permet d'encaisser sur place et de mettre les données à l'abri sans rentrer
dans la Bulle.

> **Sources de cette sous-section** : quatre guides applicatifs internes à ce corpus (*exploration-exobiologie*,
> *protocole-milliard*, *outils* et *débuter sans combat*, édition 2026-08), consultés le 09/09/2026, qui citent
> eux-mêmes le wiki *Elite Dangerous* (*Exobiology Sample Values*), Frontier Developments, Spansh et Canonn Research.
> Le chiffre de ×5 est concordant entre ces sources ; en revanche, **aucune d'elles ne chiffre un gain propre au
> First Footfall**, ce qui est cohérent avec l'idée qu'il n'en verse aucun.

### 2.6 Rangs Explorateur et Exobiologiste : les paliers jusqu'à Elite V

Comme les autres activités du jeu (combat, commerce, CQC…), l'exploration et l'exobiologie disposent chacune d'une
échelle de progression propre, visible dans le panneau des rangs du commandant. Chaque échelle comporte huit paliers
avant le rang **Elite**, lui-même subdivisé depuis la mise à jour Odyssey en cinq niveaux supplémentaires (**Elite I**
à **Elite V**) au fur et à mesure de l'accumulation de mérites au-delà du seuil Elite.

**Rang Explorateur** (progression basée sur la valeur cumulée des données d'exploration vendues) :

1. Aimless
2. Mostly Aimless
3. Scout
4. Surveyor
5. Trailblazer
6. Pathfinder
7. Ranger
8. Pioneer
9. Elite (puis Elite I → Elite V)

**Rang Exobiologiste** (progression basée sur la valeur cumulée des échantillons vendus à Vista Genomics) :

1. Directionless
2. Mostly Directionless
3. Taxonomist
4. Collector
5. Cataloguer
6. Surveyor
7. Ecologist
8. Elite (puis Elite I → Elite V)

> **Limite méthodologique** : les intitulés ci-dessus reposent sur la reconstitution communautaire la plus répandue
> (recoupée notamment avec l'article Canonn *« The Road to Exobiology Elite V »*, qui confirme explicitement les
> paliers Taxonomist, Ecologist, Elite puis Elite V dans cet ordre de progression). L'accès direct au wiki Fandom et
> aux forums officiels Frontier a cependant été bloqué (erreurs HTTP 402/403, anti-bot) pendant la rédaction de cette
> section, empêchant une vérification littérale de l'ordre exact des paliers intermédiaires sur une source primaire.
> **Avant de s'y fier pour un objectif de progression précis, vérifier l'intitulé exact et l'ordre des paliers
> directement dans le panneau des rangs en jeu ou sur le profil Inara du commandant.**

Atteindre Elite V dans l'une ou l'autre échelle est un objectif de très long terme : le commandant *JJGoldberg*, cité à
plusieurs reprises dans ce guide, est le premier commandant documenté par Canonn à avoir atteint le rang Exobiology
Elite V, au terme d'une progression méthodique combinant Road to Riches (1.4) et repérage ciblé des espèces à haute
valeur (2.5).

### 2.7 Builds spécialisés d'exploration et d'exobiologie (vaisseau et combinaison)

> **Disclaimer** : les valeurs de masse et de portée de saut présentées ci-dessous correspondent à des modules en
> **configuration stock** (achetés tels quels en boutique). L'ingénierie (voir [Ingénieurs](./06-ingenieurs.md)) peut
> les modifier significativement, dans un sens comme dans l'autre selon le blueprint choisi.

#### Comparatif des vaisseaux d'exploration/exobiologie (portée de saut stock, prix, emplacements)

Un vaisseau dédié à l'exploration et à l'exobiologie privilégie la portée de saut, l'autonomie et la visibilité du
cockpit plutôt que l'armement. Les châssis suivants sont les plus communément recommandés par la communauté pour ce rôle :

| Nom                  | Fabricant      | Prix (Cr)   | Portée de saut (stock, FSD classe A, sans cargo)* | Hardpoints      | Emplacements internes | Source                      | Date       |
|----------------------|----------------|-------------|---------------------------------------------------|-----------------|-----------------------|-----------------------------|------------|
| Diamondback Explorer | Lakon          | 1 894 760   | ≈ 40,8 al                                         | 3 (1×3, 2×2)    | 8                     | EDCD/coriolis-data (GitHub) | 09/09/2026 |
| Asp Explorer         | Lakon          | 6 661 154   | ≈ 36,5 al                                         | 6 (2×2, 4×1)    | 8                     | EDCD/coriolis-data (GitHub) | 09/09/2026 |
| Anaconda             | Faulcon DeLacy | 146 969 451 | ≈ 32,2 al                                         | 8 (jusqu'à 4×4) | 12 (+1 militaire)     | EDCD/coriolis-data (GitHub) | 09/09/2026 |
| Krait Phantom        | Faulcon DeLacy | 37 472 252  | ≈ 31,1 al                                         | 4 (2×3, 2×2)    | 9                     | EDCD/coriolis-data (GitHub) | 09/09/2026 |
| Type-8 Transporter   | Lakon          | 38 453 970  | ≈ 27,4 al                                         | 6 (1×2, 5×1)    | 9                     | EDCD/coriolis-data (GitHub) | 09/09/2026 |

*\* Portée calculée à partir des masses de coque et de modules publiées par le projet communautaire open-source
EDCD/coriolis-data (référentiel utilisé par les outils Coriolis et EDSY), avec FSD de la classe native du vaisseau en
qualité A, propulseurs/générateur/support de vie/distributeur/capteurs en qualité D (allègement standard d'un fit
exploration), sans soute ni armement. Ce sont des ordres de grandeur reproductibles avec la formule ci-dessous — pas
des valeurs figées : le fit exact (cargo, hangar SRV, AFMU, etc.) fait varier le résultat. Toujours revérifier un build
précis sur Coriolis ou EDSY avant de l'adopter tel quel.*

En complément du châssis, un vaisseau d'exploration/exobiologie privilégie :

| Priorité modules | Recommandation                                                                                       |
|------------------|------------------------------------------------------------------------------------------------------|
| FSD              | Classe A, complété par un **Guardian FSD Booster** pour maximiser la portée de saut                  |
| Blindage         | Léger, pour ne pas pénaliser la masse et donc la portée                                              |
| Carburant        | Fuel Scoop classe A pour un ravitaillement en vol illimité                                           |
| Maintenance      | **AFMU** (Auto Field-Maintenance Unit) pour réparer les modules à distance sans support              |
| Véhicule         | Hangar SRV pour les sites nécessitant un déplacement au sol rapide                                   |
| Véhicule (2)     | **Vessel Bay** Mk I ou Mk II pour emporter un **Nomad** (voir 2.2) — ici, seule l'Anaconda l'accepte |
| Habitabilité     | Compartiment de vie suffisant pour de longues expéditions                                            |

#### Build chiffré : portée de saut stock vs ingénierée du Diamondback Explorer (17,7 à 74 al)

Pour illustrer concrètement l'apport de l'ingénierie sur la portée de saut — le levier le plus déterminant pour un
build d'exploration — voici un calcul détaillé sur le châssis Diamondback Explorer (coque 260 t, emplacement FSD de
classe 5), en utilisant la formule de portée de saut publiée dans le code source ouvert de Coriolis
(`jumpRange = (min(carburant, carburant_max_par_saut) / fuelmul)^(1/fuelpower) × masse_optimale ÷ masse_totale + bonus
Guardian`) :

| Configuration                                                                                                                                     | Masse totale | Portée de saut max (1 saut, réservoir plein hors ce saut) |
|---------------------------------------------------------------------------------------------------------------------------------------------------|--------------|-----------------------------------------------------------|
| **Stock brut** (FSD 5E de série, aucune modification, sans arme ni cargo)                                                                         | ≈ 324 t      | **≈ 17,7 al**                                             |
| **Stock optimisé** (FSD 5A acheté en boutique, autres modules standards en qualité D, sans arme ni cargo)                                         | ≈ 302 t      | **≈ 40,8 al**                                             |
| **Ingénierée** (FSD 5A + blueprint *Increased Range* grade 5 à rouleau moyen + effet expérimental *Mass Manager* + Guardian FSD Booster classe 4) | ≈ 308 t      | **≈ 71-74 al**                                            |

Soit, entre la configuration stock brute et la configuration pleinement ingénierée, un **gain d'environ ×4** sur la
portée de saut maximale — l'écart typique que la communauté d'explorateurs cite pour justifier l'investissement en
matériaux d'ingénierie avant une expédition longue distance. Un rouleau d'ingénierie optimal (grade 5 au maximum de sa
plage) et une surcharge ponctuelle au FSD (« jumponium », consommables synthétisés) peuvent encore pousser ce chiffre
au-delà de 75-80 al pour ce châssis, au prix d'un temps de synthèse/farming plus important.

Pour la liste des matériaux requis par le blueprint *Increased Range* (Arsenic, Chemical Manipulators, Datamined Wake
Exceptions au grade 5) et par l'effet expérimental *Mass Manager*, ainsi que leurs grades de rareté et leurs sources
d'obtention détaillées, voir [Ingénieurs](./06-ingenieurs.md) — ce guide n'a pas vocation à dupliquer cette
information.

#### Équipement pilote et combinaison Artemis pour l'exobiologie à pied

- **Combinaison Artemis** (Exploration Suit) équipée en priorité de l' **Organic Scanner** (Genetic Sampler) et du
  **Composition Scanner** — à ne pas confondre avec la combinaison **Maverick** (voir la correction en 2.2 et
  [Équipement à pied](./07-equipement-a-pied.md)).
- Un fusil de secours léger ou une arme non létale pour la faune hostile, parfois recommandé sur certaines lunes.
- Modules de mobilité de la combinaison (jetpack amélioré, réserve d'oxygène étendue) pour couvrir rapidement de larges
  zones de recherche entre les patches de vie.
- Le plugin **BioScan** en overlay pour guider le déplacement entre échantillons et éviter les allers-retours inutiles
  (voir 2.2 et 2.3).

---

## Ressources complémentaires : sites et outils d'exploration et d'exobiologie

| Ressource          | Adresse                               | Usage principal                                               |
|--------------------|---------------------------------------|---------------------------------------------------------------|
| EDSM               | edsm.net                              | Route planner, flight log, recherche avancée de systèmes      |
| Spansh             | spansh.co.uk                          | Galaxy Plotter, Exact Plotter, Road to Riches, Neutron Router |
| Canonn Research    | canonn.science                        | Codex scientifique, données Vista Genomics par genre/espèce   |
| Bioforge           | bioforge.canonn.tech                  | Recherche de données biologiques par genre/espèce             |
| BioScan (EDMC)     | github.com/Silarn/EDMC-BioScan        | Prédiction et guidage en temps réel pendant l'échantillonnage |
| EDMC-Canonn        | github.com/canonn-science/EDMC-Canonn | Plugin de capture d'événements pour les bases Canonn          |
| EDCD/coriolis-data | github.com/EDCD/coriolis-data         | Données ouvertes des modules/vaisseaux (masses, FSD, prix)    |

## Voir aussi : autres guides du corpus liés à l'exploration

Guides du corpus en lien direct avec l'exploration et l'exobiologie :

- [Colonisation](./18-colonisation.md) — utiliser les données d'exploration pour repérer un système éligible (voir 1.7)
- [Fleet Carriers](./19-fleet-carriers.md) — base mobile pour les expéditions longue distance et l'acheminement de
  matériaux vers un système en cours de colonisation
- [Minage](./20-minage.md) — anneaux et hotspots repérés lors des scans FSS/DSS
- [BGS](./21-bgs.md) — contrôle des factions dans les systèmes ciblés pour la colonisation
- [Wings, Multicrew et CQC](./23-jeu-en-groupe.md) — organisation en Wing pour les expéditions type Distant Worlds
- [Community Goals](./24-community-goals.md) — mécanique générique des expéditions/événements communautaires
- [Combat anti-Thargoïde (AX)](./25-combat-ax.md) — sites de ruines et structures inconnues croisés en exploration
- [Le Rhino et le Nomad](./14-rhino-nomad.md) — fiche complète du Nomad, du Mk II Biological Scanner et des modules
  Vessel Bay évoqués en 2.2
- [Operations](./13-operations.md) — la mise à jour du 30 juin 2026 qui introduit le Nomad
- [Ingénieurs](./06-ingenieurs.md) — matériaux, grades et blueprints cités dans les builds de ce guide
- [Équipement à pied](./07-equipement-a-pied.md) — comparatif complet des combinaisons Odyssey (Artemis, Dominator,
  Maverick)
- [Glossaire](./00-glossaire.md) — sigles utilisés dans ce guide (SCO, etc.)
- [Débuter et progresser](./27-debuter-et-progresser.md) — exploiter la Road to Riches pour monter les rangs
  d'exploration et d'exobiologie quand on débute, et situer l'exploration parmi les premières activités rentables

## Sources de ce guide (exploration et exobiologie)

- https://canonn.science/
- https://canonn.science/codex/
- https://canonn.science/codex/geology-organics/
- https://canonn.science/category/codex/geology/
- https://canonn.science/category/codex/geology/page/2/
- https://canonn.science/codex/odyssey-family-familia-odysseae/
- https://canonn.science/codex/appendices/
- https://canonn.science/codex/concha/
- https://canonn.science/codex/bacteria-2/
- https://canonn.science/codex/tussock/
- https://canonn.science/codex/electricae/
- https://canonn.science/codex/fonticulua/
- https://canonn.science/codex/osseus/
- https://canonn.science/codex/stratum/
- https://canonn.science/codex/tubus/
- https://canonn.science/codex/recepta/
- https://canonn.science/codex/fumerola/
- https://canonn.science/codex/aleoida-2/
- https://canonn.science/codex/cactoida/
- https://canonn.science/codex/clypeus/
- https://canonn.science/codex/frutexa/
- https://canonn.science/codex/fungoida/
- https://canonn.science/codex/surface-biology/
- https://canonn.science/codex/organic-scanning-guide/
- https://canonn.science/codex/speed-scanning-challenge/
- https://canonn.science/codex/a-secret-to-be-uncovered-a-trail-to-be-followed/
- https://canonn.science/codex/the-road-to-exobiology-elite-v/
- https://canonn.science/codex/neutron-stars/
- https://canonn.science/codex/cmdr-panpiper-a-brief-history-of-brain-trees/
- https://canonn.science/codex/the-guardians/
- https://canonn.science/codex/iea-helium-rich-gas-giant-guide/
- https://canonn.science/codex/cartographics/ghost-rings/
- https://canonn.science/resources/
- https://bioforge.canonn.tech/
- https://github.com/Silarn/EDMC-BioScan
- https://github.com/Spansh
- https://www.edsm.net/en/
- https://spansh.co.uk/
- https://github.com/EDCD/coriolis-data (données de modules/vaisseaux : masses, FSD, prix, blueprints — consultées le
  09/09/2026)
- https://github.com/EDCD/coriolis (formule de calcul de portée de saut, `src/app/shipyard/Calculations.js`)
- Annonces officielles Frontier republiées sur le flux Steam News d'*Elite Dangerous* (appid 359320), relevées via
  `api.steampowered.com/ISteamNews/GetNewsForApp/v2/` le 09/09/2026 — billets *Discover the Nomad* (02/06/2026
  13:03 UTC) et *Operations Update* (01/07/2026 14:01 UTC), cités en 2.2
- https://github.com/EDCD/FDevIDs (libellés des modules *Vessel Hangar* et *Mk II Vessel Hangar*)

> **Note sur l'accès aux sources pendant la rédaction** : elitedangerous.com, forums.frontier.co.uk et le wiki Fandom
> (elite-dangerous.fandom.com) ont renvoyé des erreurs HTTP 402/403 (blocage anti-bot) lors des tentatives d'accès
> direct effectuées pour cette mise à jour du guide, en particulier pour la section 2.6 (rangs). Les données de
> modules/vaisseaux ont en revanche pu être vérifiées directement via le dépôt ouvert EDCD/coriolis-data, qui alimente
> les calculateurs de la communauté (Coriolis, EDSY) et fait autorité sur ces valeurs. Les annonces officielles de
> Frontier restent, elles, accessibles sans blocage via le flux Steam News du jeu, qui les republie mot pour mot : ce
> canal a servi de source primaire pour tout ce qui touche au Nomad en 2.2.

> **Avertissement méthodologique** : l'absence d'un véhicule dans un catalogue de chantier naval (liste des vaisseaux
> d'Inara, `shipyard.csv` d'EDCD) ne prouve rien à son sujet. Ces listes ne contiennent que les vaisseaux pilotables
> achetables au shipyard, et donc ni les SRV, ni les chasseurs SLF, ni les *ship-launched vessels* comme le Nomad. Y
> chercher un véhicule de cette catégorie ne peut produire qu'un faux négatif.

> **Note sur la fiabilité des données chiffrées d'exobiologie** : les valeurs chiffrées d'exobiologie (Vista Genomics)
> et les statistiques de fréquence citées dans ce guide proviennent des relevés communautaires de **Canonn Research**,
> arrêtés à la date du 30/09/2025. Ces valeurs peuvent évoluer avec les mises à jour du jeu ; il est recommandé de les
> recouper sur Inara.cn ou le wiki Fandom avant une session de farming intensif.
