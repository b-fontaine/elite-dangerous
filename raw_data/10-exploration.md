# Guide complet de l'exploration et de l'exobiologie dans Elite Dangerous

## Introduction

L'exploration spatiale est l'une des activités fondatrices d' *Elite Dangerous* : elle consiste à quitter la Bulle (la
région densément peuplée autour de Sol) pour cartographier des systèmes stellaires inconnus, en tirer des données
scientifiques monnayables auprès des comptoirs Universal Cartographics. Depuis l'extension **Odyssey**, cette activité
s'est enrichie d'un volet de terrain : l' **exobiologie**, qui consiste à se poser sur des planètes et lunes pour y
prélever, à pied, des échantillons d'organismes vivants et les revendre à la société Vista Genomics.

Ce guide couvre les deux disciplines de bout en bout : planification de route, scan des systèmes, exploration profonde
(Road to Riches, Neutron Highways, Distant Worlds), vente des données ; puis taxonomie complète de la vie exobiologique,
procédure de scan/échantillonnage, localisation des espèces les plus rentables, rangs de progression et builds de
vaisseau/équipement dédiés.

> **Note sur la fiabilité des données** : les valeurs chiffrées d'exobiologie (Vista Genomics) et les statistiques de
> fréquence citées dans ce guide proviennent des relevés communautaires de **Canonn Research**, arrêtés à la date du
> 30/09/3311. Ces valeurs peuvent évoluer avec les mises à jour du jeu ; il est recommandé de les recouper sur Inara.cn ou
> le wiki Fandom avant une session de farming intensif.

**Voir aussi dans ce corpus** — l'exploration recoupe plusieurs autres activités documentées séparément :
[Colonisation](./18-colonisation.md) (utiliser les données d'exploration pour choisir un système à coloniser),
[Fleet Carriers](./19-fleet-carriers.md) (base mobile pour les expéditions longue distance),
[Ingénieurs](./06-ingenieurs.md) (modifications de FSD et de combinaison citées dans ce guide),
[Équipement à pied](./07-equipement-a-pied.md) (détail des combinaisons Odyssey),
[Combat anti-Thargoïde (AX)](./25-combat-ax.md) (sites de ruines et structures inconnues croisés en exploration),
[BGS](./21-bgs.md) (influence des factions dans les systèmes ciblés pour la colonisation), et le
[Glossaire](./00-glossaire.md) pour tous les sigles.

---

## Partie 1 — Exploration spatiale

### 1.1 Bref historique de la découverte de la vie extraterrestre

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

### 1.2 Planification de route

Deux outils communautaires dominent la planification de trajet :

#### EDSM (Elite Dangerous Star Map — edsm.net)

- Propose une **Galactic Map** complète avec un **Route Planner** intégré.
- Tient un **flight log** personnel (historique des systèmes visités par le commandant) et un classement des **« systems
  discovered first »**.
- Publie des statistiques globales sur l'état de la découverte galactique. Le nombre de systèmes enregistrés progresse
  en continu à mesure que la communauté explore, mais il ne représente qu'une fraction infime des quelque 400 milliards
  d'étoiles que compte la galaxie du jeu — un ordre de grandeur à garder en tête plutôt qu'un chiffre figé, à consulter
  directement sur la page de statistiques d'EDSM pour une valeur à jour.

#### Spansh (spansh.co.uk)

Spansh héberge les calculateurs de route de référence de la communauté :

| Outil Spansh                             | Fonction                                                                          |
|------------------------------------------|-----------------------------------------------------------------------------------|
| **Galaxy Plotter**                       | Route A→B optimisée en nombre de sauts                                            |
| **Exact Plotter**                        | Trajet précis avec contraintes de carburant et de portée de saut                  |
| **Road to Riches**                       | Itinéraire optimisé pour maximiser les gains d'exobiologie sur une zone donnée    |
| **Neutron Router** (Fuel Neutron Router) | Chaîne de sauts le long des étoiles à neutrons pour maximiser la portée effective |

Spansh est largement adopté par la communauté d'explorateurs, y compris par les contributeurs de Canonn Research, pour
tracer les « neutron highways » utilisées lors des grandes traversées de la galaxie.

### 1.3 Scan des systèmes : Discovery Scanner, FSS, DSS

Trois outils de scan s'utilisent en cascade, du plus grossier au plus précis :

#### Le Discovery Scanner (« honk »)

Scanner passif de découverte : il révèle automatiquement l'existence de tous les corps célestes du système dès
l'arrivée, sans action fine du pilote (d'où le surnom de « honk »).

#### Le FSS (Full Spectrum System Scanner)

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

#### Le DSS (Detailed Surface Scanner)

Tiré en survol sous forme de sonde, le DSS cartographie la surface d'un corps : il révèle les ressources géologiques et
biologiques exploitables et complète le statut « mapped » qui majore la valeur de revente des données. Sur la carte DSS,
les zones favorables à la vie apparaissent en teinte **sarcelle / vert clair**.

> Les valeurs précises de portée et de temps de scan de ces trois instruments sont globalement stables depuis plusieurs
> versions du jeu. Il est recommandé de les confirmer sur le wiki Fandom ou Inara.cn en cas de doute.

### 1.4 Exploration profonde : Neutron Highways, Road to Riches, Distant Worlds

#### Neutron Highways

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

#### Road to Riches

Méthode consistant à cibler les systèmes contenant des espèces exobiologiques à haute valeur avant de s'y rendre, plutôt
que de se poser au hasard :

1. Recherche avancée sur **EDSM** (ou sur les listes croisées EDAstro/Canonn) pour repérer les systèmes contenant des
   espèces à haute valeur (ex. *Stratum Tectonicas*) dans un rayon donné (ex. moins de 10 000 années-lumière de Sol).
2. Filtrage des espèces au-delà d'un seuil de valeur (ex. > 400 000 Cr — seuil indicatif cité par le commandant Canonn
   *JJGoldberg* dans son parcours vers le rang Exobiology Elite V, à ajuster selon l'objectif).
3. Traçage d'une route optimisée sur la liste de systèmes obtenue, à l'aide d'un outil dédié (edtools, ou directement
   l'outil **Road to Riches** de Spansh qui automatise l'ensemble de la méthode).

#### Distant Worlds

Les expéditions communautaires de ce type — voyages massifs et organisés vers les confins de la galaxie — sont
documentées dans les archives Canonn (« Distant Worlds 2 » citée comme community goal, « Distant Worlds 3302 » dans les
actualités Canonn). Ces expéditions relèvent de la mécanique générique des **Community Goals** (voir
[Community Goals](./24-community-goals.md)) et se déroulent le plus souvent en **Wing** organisé (voir
[Wings, Multicrew et CQC](./23-jeu-en-groupe.md)). Le détail logistique des éditions les plus récentes (dates,
itinéraire) évolue d'une édition à l'autre ; il est conseillé de consulter les canaux officiels de la communauté avant
de s'engager sur une expédition en cours.

### 1.5 Vendre ses données d'exploration

Les données de scan — relevés FSS et cartographies DSS — se vendent aux comptoirs **Universal Cartographics** dans les
stations. Un bonus de **« première découverte »** (*first discovered*) et de **« première cartographie »** (*first
mapped*) — c'est-à-dire un corps jamais rapporté par un autre commandant — majore significativement la valeur de la
vente. Les barèmes exacts et la formule de calcul détaillée sont traditionnellement documentés sur Inara.cn et le wiki
Fandom ; il est recommandé de les y consulter avant une session de vente de données à fort volume.

#### Cas particulier : mondes remarquables (Earth-like Worlds et Water Worlds)

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

### 1.6 Boîte à outils du commandant explorateur

En complément d'EDSM et Spansh, l'écosystème **Canonn Research** propose des outils spécialisés :

| Outil                  | Adresse                                | Fonction                                                                                                |
|------------------------|-----------------------------------------|-----------------------------------------------------------------------------------------------------------|
| Signals                | signals.canonn.tech                    | Affiche le contenu (biologie/géologie) détecté dans un système                                          |
| Bioforge               | bioforge.canonn.tech                   | Moteur de recherche et d'affichage des données système/corps scannables (biologie), par genre ou espèce |
| Codex-Regions          | canonn-science.github.io/Codex-Regions | Carte des éléments du Codex localisés                                                                   |
| Undiscovered-Codex     | —                                      | Éléments du Codex non encore scannés par le commandant connecté                                         |
| EDMC-Canonn            | github.com/canonn-science/EDMC-Canonn  | Plugin EDMC officiel : capture les événements de jeu et alimente les bases Canonn                       |
| Bifrost                | ruins.canonn.tech                      | Catalogue et visualise les sites de ruines Gardiennes (Guardian)                                        |
| Unknown Structures Map | map.canonn.tech                        | Carte 3D des sites de structures Thargoïdes — voir aussi [Combat AX](./25-combat-ax.md)                 |

### 1.7 Exploration et Colonisation

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

## Partie 2 — Exobiologie (Odyssey)

### 2.1 Mécanique générale

Depuis Odyssey, la taxonomie exobiologique moderne (famille dite **« Odyssey »**) compte **15 genres** : Aleoida,
Bacterium, Cactoida, Clypeus, Concha, Electricae, Fonticulua, Frutexa, Fumerola, Fungoida, Osseus, Recepta, Stratum,
Tubus, Tussock. Chaque genre se subdivise en espèces, elles-mêmes déclinées en variantes de couleur.

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
30/09/3311) :

| Paramètre              | Extrême observé                                                                                                                                       |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| Température            | *Aleoida* : plage très restreinte (152-196 K) — à l'opposé, *Bacterium* tolère 20-631 K, avec *Bacterium Tela* seule capable de survivre à 500-650 K  |
| Pression atmosphérique | *Fonticulua* et *Bacterium* tolèrent jusqu'à 1 492 atm dans certains cas ; la plupart des autres genres restent limités à des atmosphères très ténues |
| Gravité                | La majorité des genres tolèrent 0,03-0,28 G ; *Bacterium* jusqu'à 1,18 G ; *Stratum* jusqu'à 0,61 G                                                   |
| Répartition            | *Bacterium* représente à lui seul **94,23 %** de tous les organismes enregistrés dans la bande de température 0-50 K                                  |

### 2.2 Équipement nécessaire

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

### 2.3 Procédure de scan et d'échantillonnage

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
tableau désormais complet pour les 15 genres de la famille Odyssey) :

| Genre      | Distance minimale |
|------------|-------------------|
| Aleoida    | 150 m             |
| Bacterium  | 500 m             |
| Cactoida   | 300 m             |
| Clypeus    | 150 m             |
| Concha     | 150 m             |
| Electricae | 1 000 m           |
| Fonticulua | 500 m             |
| Frutexa    | 150 m             |
| Fumerola   | 100 m             |
| Fungoida   | 300 m             |
| Osseus     | 800 m             |
| Recepta    | 150 m             |
| Stratum    | 500 m             |
| Tubus      | 800 m             |
| Tussock    | 200 m             |

*Ces valeurs correspondent à la distance minimale documentée par genre sur le Codex Canonn ; certaines espèces
individuelles peuvent avoir une distance légèrement différente de celle de leur genre — le plugin BioScan affiche dans
tous les cas la valeur exacte en temps réel pour l'espèce identifiée.*

Un défi communautaire Canonn, le **« Speed Scanning Challenge »**, illustre les marges de progression possibles pour un
commandant entraîné et bien équipé. Les enseignements clés de ce défi :

- Cartographier au préalable le **chevauchement des zones** entre espèces pour minimiser les déplacements.
- Repérer les emplacements sans déclencher le chronomètre du scanner avant d'être réellement prêt.
- Le plugin BioScan (v2.7 et suivantes) peut afficher ces informations directement en surimpression (overlay) à l'écran
  de jeu.

### 2.4 Catalogue des genres, espèces, habitats et valeurs de vente

Valeurs en crédits (Cr) et fréquences d'observation (% de la population enregistrée par la communauté Canonn), données
Canonn Research au 30/09/3311.

#### Aleoida

*Habitat : corps rocheux ou à haute teneur métallique, atmosphère ammoniac ou CO2 ; feuillage cireux, hiberne en
conditions défavorables.*

| Espèce    | Valeur (Cr) | Fréquence |
|-----------|-------------|-----------|
| Coronamus | 6 284 600   | 28,9 %    |
| Laminiae  | 3 385 200   | 24,2 %    |
| Arcus     | 7 252 500   | 21,5 %    |
| Spica     | 3 385 200   | 13,6 %    |
| Gravis    | 12 934 900  | 11,8 %    |

#### Bacterium

*Habitat : corps glacés, rocheux ou à haute teneur métallique, atmosphère ammoniac/CO2/SO2, gravité < 0,62 G, terrain
plat ; extrêmophiles quasi omniprésents. Genre le plus répandu de la galaxie (voir tolérances extrêmes en 2.1).*

Les 3 premières espèces ci-dessous doivent leur variante de couleur à la **classe stellaire** de l'étoile hôte ; les 10
suivantes la doivent à un **matériau spécifique** présent dans la croûte de la planète.

| Espèce     | Valeur (Cr) | Déterminant de couleur | Variantes de couleur (si matériau)                         |
|------------|-------------|-------------------------|--------------------------------------------------------------|
| Alcyoneum  | 1 658 500   | Classe stellaire        | Jaune                                                         |
| Aurasus    | 1 000 000   | Classe stellaire        | Rouge                                                         |
| Cerbrus    | 1 689 800   | Classe stellaire        | Ocre                                                          |
| Acies      | 1 000 000   | Matériau                | Cyan, Magenta, Cobalt, Lime, Blanc, Aigue-marine               |
| Bullaris   | 1 152 500   | Matériau                | Cobalt, Jaune, Aigue-marine, Or, Lime, Rouge                   |
| Informem   | 8 418 000   | Matériau                | Rouge, Lime, Or, Aigue-marine, Jaune, Cobalt                   |
| Nebulus    | 5 289 900   | Matériau                | Magenta, Or, Orange, Cyan, Vert, Cobalt                        |
| Omentum    | 4 638 900   | Matériau                | Lime, Blanc, Aigue-marine, Pêche, Rouge, Bleu                  |
| Scopulum   | 4 934 500   | Matériau                | Blanc, Pêche, Lime, Rouge, Mûre, Aigue-marine                  |
| Tela       | 1 949 000   | Matériau                | Or, Orange, Jaune, Magenta, Cobalt, Vert                       |
| Verrata    | 3 897 000   | Matériau                | Pêche, Rouge, Blanc, Mûre, Bleu, Lime                          |
| Vesicula   | 1 000 000   | Matériau                | Cyan, Orange, Mûre, Or, Rouge, Lime                            |
| Volu       | 7 774 700   | Matériau                | Rouge, Aigue-marine, Cobalt, Lime, Cyan, Or                    |

*Informem est l'espèce la plus chère du genre.*

#### Cactoida

*Habitat : corps rocheux, atmosphères diverses. Séparation minimale 300 m (voir 2.3).*

| Espèce     | Valeur (Cr) | Atmosphère | Fréquence |
|------------|-------------|------------|-----------|
| Cortexum   | 3 667 600   | CO2        | 24,3 %    |
| Lapis      | 2 483 600   | Ammoniac   | 34,8 %    |
| Peperatis  | 2 483 600   | Ammoniac   | 13,3 %    |
| Pullulanta | 3 667 600   | CO2        | 10,2 %    |
| Vermis     | 16 202 800  | Eau        | 17,3 %    |

*Vermis est à la fois l'espèce la plus chère et la plus tolérante à la chaleur du genre.*

#### Clypeus

*Habitat : corps à haute teneur métallique ou rocheux, atmosphère CO2 ou eau, gravité < 0,28 G, plaines rocailleuses.
Séparation minimale 150 m (voir 2.3).*

| Espèce     | Valeur (Cr) | Fréquence |
|------------|-------------|-----------|
| Lacrimam   | 8 418 000   | 54,2 %    |
| Margaritus | 11 873 200  | 28,1 %    |
| Speculumi  | 16 202 800  | 17,7 %    |

#### Concha

*Habitat : corps à haute teneur métallique ou rocheux, atmosphère ammoniac/CO2/azote/eau, gravité < 0,28 G, séparation
minimale 150 m.*

| Espèce     | Valeur (Cr) | Atmosphère         | Fréquence |
|------------|-------------|--------------------|-----------|
| Labiata    | 2 352 400   | CO2                | 47,4 %    |
| Aureolas   | 7 774 700   | Azote              | 15,0 %    |
| Renibus    | 4 572 400   | Sources de chaleur | 36,9 %    |
| Biconcavis | 19 010 800  | Azote              | 0,74 %    |

*Biconcavis est très rare et particulièrement recherchée.*

#### Electricae

*Habitat : mondes de glace extrêmes exclusivement, atmosphère argon, séparation minimale 1 000 m, gravité 0,03-0,28 G,
environ 20-150 K.*

| Espèce   | Valeur (Cr) | Fréquence | Corrélation                                    |
|----------|-------------|-----------|--------------------------------------------------|
| Pluma    | 6 284 600   | 27,3 %    | Étoiles A, naines blanches, étoiles à neutrons |
| Radialem | 6 284 600   | 72,7 %    | Proximité de nébuleuses                        |

#### Fonticulua

*Habitat : mondes de glace exclusivement, gravité < 0,29 G, séparation minimale 500 m.*

| Espèce      | Valeur (Cr)    | Atmosphère | Fréquence |
|-------------|----------------|------------|-----------|
| Campestris  | 1 000 000      | Argon      | 59,1 %    |
| Digitos     | 1 804 100      | Méthane    | —         |
| Fluctus     | **20 000 000** | Oxygène    | très rare |
| Lapida      | 3 111 000      | Azote      | —         |
| Segmentatus | 19 010 800     | Néon       | —         |
| Upupam      | 5 727 600      | Argon      | —         |

*Fluctus est l'espèce la plus chère recensée dans l'ensemble de ce catalogue ; elle n'existe que sur des mondes de glace
à atmosphère riche en oxygène, une combinaison peu répandue, ce qui explique sa rareté.*

#### Frutexa

*Habitat : corps à haute teneur métallique ou rocheux, gravité < 0,29 G, séparation minimale 150 m.*

| Espèce     | Valeur (Cr) | Fréquence |
|------------|-------------|-----------|
| Acus       | 7 774 700   | 33,2 %    |
| Collum     | 1 639 800   | —         |
| Fera       | 1 632 500   | —         |
| Flabellum  | 1 808 900   | 21,8 %    |
| Flammasis  | 10 326 000  | 8,7 %     |
| Metallicum | 1 632 500   | 22,5 %    |
| Sponsae    | 5 988 000   | —         |

#### Fumerola

*Habitat : zones volcaniques actives (environ 4 espèces). Séparation minimale 100 m (voir 2.3) — la plus courte de
toutes, cohérente avec la nécessité de rester à proximité immédiate des évents actifs.*

| Espèce   | Valeur (Cr) | Type de volcanisme | Terrain        | Fréquence |
|----------|-------------|--------------------|----------------|-----------|
| Aquatis  | 6 284 600   | Aquatique          | Mondes glacés  | 30,4 %    |
| Carbosis | 6 284 600   | Carboné            | Mondes glacés  | 23,9 %    |
| Extremus | 16 202 800  | Vapeur de silicate | Mondes rocheux | 13,8 %    |
| Nitris   | 7 500 900   | Azoté              | Mondes glacés  | 31,9 %    |

#### Fungoida

*Habitat : organismes souterrains chimio/thermosynthétiques, terrain montagneux, séparation minimale 300 m.*

| Espèce   | Valeur (Cr) | Atmosphère | Plage de température | Fréquence |
|----------|-------------|------------|-----------------------|-----------|
| Setisis  | 1 670 100   | Ammoniac   | 67-187 K              | 50,2 %    |
| Gelata   | 3 330 300   | CO2/eau    | 78-452 K              | 22,9 %    |
| Stabitis | 2 680 300   | —          | 65-452 K              | 18,1 %    |
| Bullarum | 3 703 200   | Argon      | 50-133 K              | 8,9 %     |

#### Osseus

*Habitat : corps rocheux ou à haute teneur métallique, séparation minimale 800 m.*

| Espèce      | Valeur (Cr) | Fréquence |
|-------------|-------------|-----------|
| Cornibus    | 1 483 000   | 5,6 %     |
| Fractus     | 4 027 800   | 16,2 %    |
| Pellebantus | 9 739 000   | 4,7 %     |
| Spiralis    | 2 404 700   | 48,1 %    |
| Discus      | 12 934 900  | 8,3 %     |
| Pumice      | 3 156 300   | 16,9 %    |

#### Recepta

*Habitat : extrêmophiles SO2, mondes glacés ou rocheux, gravité < 0,29 G, séparation minimale 150 m.*

| Espèce        | Valeur (Cr) | Fréquence |
|---------------|-------------|-----------|
| Umbrux        | 12 934 900  | 51,6 %    |
| Conditivus    | 14 313 700  | 30,0 %    |
| Deltahedronix | 16 202 800  | 18,4 %    |

#### Stratum

*Habitat : corps rocheux ou à haute teneur métallique. Séparation minimale 500 m (voir 2.3).*

| Espèce     | Valeur (Cr) | Atmosphère              | Fréquence |
|------------|-------------|--------------------------|-----------|
| Araneamus  | 2 448 900   | —                       | —         |
| Cucumisis  | 16 202 800  | CO2/SO2                 | 4,2 %     |
| Excutitus  | 2 448 900   | —                       | 10,0 %    |
| Frigus     | 2 637 500   | —                       | —         |
| Laminamus  | 2 788 300   | Ammoniac                | —         |
| Limaxus    | 1 362 000   | —                       | —         |
| Paleas     | 1 362 000   | —                       | 36,9 %    |
| Tectonicas | 19 010 800  | Haute teneur métallique | 37,5 % *  |

*\* Canonn note que ce pourcentage est probablement surreprésenté, la forte valeur de Tectonicas attirant davantage de
chasseurs d'échantillons que les autres espèces du genre.*

#### Tubus

*Habitat : gravité < 0,17 G, plaines ouvertes, atmosphère ammoniac ou CO2. Séparation minimale 800 m (voir 2.3).*

| Espèce     | Valeur (Cr) | Fréquence |
|------------|-------------|-----------|
| Compagibus | 7 774 700   | 44,2 %    |
| Cavas      | 11 873 200  | 18,0 %    |
| Rosarium   | 2 637 500   | 14,2 %    |
| Conifer    | 2 415 500   | 14,1 %    |
| Sororibus  | 5 727 600   | 9,7 %     |

#### Tussock

*Habitat : surface solide requise, gravité < 0,29 G, majoritairement CO2 mais aussi ammoniac/méthane/SO2/eau. Genre le
plus diversifié de la famille Odyssey avec Bacterium : 15 espèces recensées, désormais toutes listées ci-dessous.
Séparation minimale 200 m (voir 2.3).*

| Espèce     | Valeur (Cr) | Atmosphère       | Fréquence |
|------------|-------------|-------------------|-----------|
| Albata     | 3 252 500   | CO2               | 7,18 %    |
| Capillum   | 7 025 800   | Argon/Méthane     | 3,36 %    |
| Caputus    | 3 472 400   | CO2               | 8,03 %    |
| Catena     | 1 766 600   | Ammoniac          | 4,89 %    |
| Cultro     | 1 766 600   | Ammoniac          | 16,78 %   |
| Divisa     | 1 766 600   | Ammoniac          | 6,28 %    |
| Ignis      | 1 849 000   | CO2               | 13,22 %   |
| Pennata    | 5 853 800   | CO2               | 2,31 %    |
| Pennatis   | 1 000 000   | CO2               | 7,95 %    |
| Propagito  | 1 000 000   | CO2               | 12,81 %   |
| Serrati    | 4 447 100   | CO2               | 5,14 %    |
| Stigmasis  | 19 010 800  | SO2               | 0,88 %    |
| Triticum   | 7 774 700   | CO2               | 2,61 %    |
| Ventusa    | 3 227 700   | CO2               | 4,33 %    |
| Virgam     | 14 313 700  | Eau               | 4,23 %    |

*Stigmasis est l'espèce la plus chère du genre, Virgam la deuxième.*

### 2.5 Où trouver les espèces les plus rentables

En recoupant l'ensemble des valeurs du tableau 2.4, le classement des espèces exobiologiques les plus rentables se
présente ainsi :

| Rang | Espèce                 | Valeur (Cr) | Atmosphère / habitat         | Fréquence |
|------|------------------------|-------------|-------------------------------|-----------|
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
| 13   | Osseus Discus          | 12 934 900  | —                             | 8,3 %     |
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

### 2.6 Rangs Explorateur et Exobiologiste

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

### 2.7 Builds spécialisés

> **Disclaimer** : les valeurs de masse et de portée de saut présentées ci-dessous correspondent à des modules en
> **configuration stock** (achetés tels quels en boutique). L'ingénierie (voir [Ingénieurs](./06-ingenieurs.md)) peut
> les modifier significativement, dans un sens comme dans l'autre selon le blueprint choisi.

#### Comparatif des vaisseaux d'exploration/exobiologie

Un vaisseau dédié privilégie la portée de saut, l'autonomie et la visibilité du cockpit plutôt que l'armement. Les
châssis suivants sont les plus communément recommandés par la communauté pour ce rôle :

| Nom                    | Fabricant       | Prix (Cr)   | Portée de saut (stock, FSD classe A, sans cargo)* | Hardpoints    | Emplacements internes | Source                     | Date       |
|------------------------|-----------------|-------------|-----------------------------------------------------|---------------|-------------------------|-----------------------------|------------|
| Diamondback Explorer   | Lakon           | 1 894 760   | ≈ 40,8 al                                            | 3 (1×3, 2×2)  | 8                       | EDCD/coriolis-data (GitHub) | 09/09/2026 |
| Asp Explorer           | Lakon           | 6 661 154   | ≈ 36,5 al                                            | 6 (2×2, 4×1)  | 8                       | EDCD/coriolis-data (GitHub) | 09/09/2026 |
| Anaconda               | Faulcon DeLacy  | 146 969 451 | ≈ 32,2 al                                            | 8 (jusqu'à 4×4)| 12 (+1 militaire)      | EDCD/coriolis-data (GitHub) | 09/09/2026 |
| Krait Phantom          | Faulcon DeLacy  | 37 472 252  | ≈ 31,1 al                                            | 4 (2×3, 2×2)  | 9                       | EDCD/coriolis-data (GitHub) | 09/09/2026 |
| Type-8 Transporter     | Lakon           | 38 453 970  | ≈ 27,4 al                                            | 6 (1×2, 5×1)  | 9                       | EDCD/coriolis-data (GitHub) | 09/09/2026 |

*\* Portée calculée à partir des masses de coque et de modules publiées par le projet communautaire open-source
EDCD/coriolis-data (référentiel utilisé par les outils Coriolis et EDSY), avec FSD de la classe native du vaisseau en
qualité A, propulseurs/générateur/support de vie/distributeur/capteurs en qualité D (allègement standard d'un fit
exploration), sans soute ni armement. Ce sont des ordres de grandeur reproductibles avec la formule ci-dessous — pas
des valeurs figées : le fit exact (cargo, hangar SRV, AFMU, etc.) fait varier le résultat. Toujours revérifier un build
précis sur Coriolis ou EDSY avant de l'adopter tel quel.*

En complément du châssis, un vaisseau d'exploration/exobiologie privilégie :

| Priorité modules | Recommandation                                                                          |
|-------------------|------------------------------------------------------------------------------------------|
| FSD               | Classe A, complété par un **Guardian FSD Booster** pour maximiser la portée de saut     |
| Blindage           | Léger, pour ne pas pénaliser la masse et donc la portée                                 |
| Carburant          | Fuel Scoop classe A pour un ravitaillement en vol illimité                              |
| Maintenance        | **AFMU** (Auto Field-Maintenance Unit) pour réparer les modules à distance sans support |
| Véhicule           | Hangar SRV pour les sites nécessitant un déplacement au sol rapide                      |
| Habitabilité       | Compartiment de vie suffisant pour de longues expéditions                               |

#### Build chiffré : portée de saut stock vs ingénierée (Diamondback Explorer)

Pour illustrer concrètement l'apport de l'ingénierie sur la portée de saut — le levier le plus déterminant pour un
build d'exploration — voici un calcul détaillé sur le châssis Diamondback Explorer (coque 260 t, emplacement FSD de
classe 5), en utilisant la formule de portée de saut publiée dans le code source ouvert de Coriolis
(`jumpRange = (min(carburant, carburant_max_par_saut) / fuelmul)^(1/fuelpower) × masse_optimale ÷ masse_totale + bonus
Guardian`) :

| Configuration                                                                                          | Masse totale | Portée de saut max (1 saut, réservoir plein hors ce saut) |
|----------------------------------------------------------------------------------------------------------|--------------|---------------------------------------------------------------|
| **Stock brut** (FSD 5E de série, aucune modification, sans arme ni cargo)                                | ≈ 324 t      | **≈ 17,7 al**                                                  |
| **Stock optimisé** (FSD 5A acheté en boutique, autres modules standards en qualité D, sans arme ni cargo) | ≈ 302 t      | **≈ 40,8 al**                                                  |
| **Ingénierée** (FSD 5A + blueprint *Increased Range* grade 5 à rouleau moyen + effet expérimental *Mass Manager* + Guardian FSD Booster classe 4) | ≈ 308 t      | **≈ 71-74 al**                                                 |

Soit, entre la configuration stock brute et la configuration pleinement ingénierée, un **gain d'environ ×4** sur la
portée de saut maximale — l'écart typique que la communauté d'explorateurs cite pour justifier l'investissement en
matériaux d'ingénierie avant une expédition longue distance. Un rouleau d'ingénierie optimal (grade 5 au maximum de sa
plage) et une surcharge ponctuelle au FSD (« jumponium », consommables synthétisés) peuvent encore pousser ce chiffre
au-delà de 75-80 al pour ce châssis, au prix d'un temps de synthèse/farming plus important.

Pour la liste des matériaux requis par le blueprint *Increased Range* (Arsenic, Chemical Manipulators, Datamined Wake
Exceptions au grade 5) et par l'effet expérimental *Mass Manager*, ainsi que leurs grades de rareté et leurs sources
d'obtention détaillées, voir [Ingénieurs](./06-ingenieurs.md) — ce guide n'a pas vocation à dupliquer cette
information.

#### Équipement pilote et combinaison Artemis (exobiologie)

- **Combinaison Artemis** (Exploration Suit) équipée en priorité de l' **Organic Scanner** (Genetic Sampler) et du
  **Composition Scanner** — à ne pas confondre avec la combinaison **Maverick** (voir la correction en 2.2 et
  [Équipement à pied](./07-equipement-a-pied.md)).
- Un fusil de secours léger ou une arme non létale pour la faune hostile, parfois recommandé sur certaines lunes.
- Modules de mobilité de la combinaison (jetpack amélioré, réserve d'oxygène étendue) pour couvrir rapidement de larges
  zones de recherche entre les patches de vie.
- Le plugin **BioScan** en overlay pour guider le déplacement entre échantillons et éviter les allers-retours inutiles
  (voir 2.2 et 2.3).

---

## Ressources complémentaires

| Ressource       | Adresse                               | Usage principal                                               |
|-----------------|-----------------------------------------|-----------------------------------------------------------------|
| EDSM            | edsm.net                              | Route planner, flight log, recherche avancée de systèmes      |
| Spansh          | spansh.co.uk                          | Galaxy Plotter, Exact Plotter, Road to Riches, Neutron Router |
| Canonn Research | canonn.science                        | Codex scientifique, données Vista Genomics par genre/espèce   |
| Bioforge        | bioforge.canonn.tech                  | Recherche de données biologiques par genre/espèce             |
| BioScan (EDMC)  | github.com/Silarn/EDMC-BioScan        | Prédiction et guidage en temps réel pendant l'échantillonnage |
| EDMC-Canonn     | github.com/canonn-science/EDMC-Canonn | Plugin de capture d'événements pour les bases Canonn          |
| EDCD/coriolis-data | github.com/EDCD/coriolis-data      | Données ouvertes des modules/vaisseaux (masses, FSD, prix)    |

## Voir aussi

Guides du corpus en lien direct avec l'exploration et l'exobiologie :

- [Colonisation](./18-colonisation.md) — utiliser les données d'exploration pour repérer un système éligible (voir 1.7)
- [Fleet Carriers](./19-fleet-carriers.md) — base mobile pour les expéditions longue distance et l'acheminement de
  matériaux vers un système en cours de colonisation
- [Minage](./20-minage.md) — anneaux et hotspots repérés lors des scans FSS/DSS
- [BGS](./21-bgs.md) — contrôle des factions dans les systèmes ciblés pour la colonisation
- [Wings, Multicrew et CQC](./23-jeu-en-groupe.md) — organisation en Wing pour les expéditions type Distant Worlds
- [Community Goals](./24-community-goals.md) — mécanique générique des expéditions/événements communautaires
- [Combat anti-Thargoïde (AX)](./25-combat-ax.md) — sites de ruines et structures inconnues croisés en exploration
- [Ingénieurs](./06-ingenieurs.md) — matériaux, grades et blueprints cités dans les builds de ce guide
- [Équipement à pied](./07-equipement-a-pied.md) — comparatif complet des combinaisons Odyssey (Artemis, Dominator,
  Maverick)
- [Glossaire](./00-glossaire.md) — sigles utilisés dans ce guide (SCO, etc.)

## Sources

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

> **Note sur l'accès aux sources pendant la rédaction** : elitedangerous.com, forums.frontier.co.uk et le wiki Fandom
> (elite-dangerous.fandom.com) ont renvoyé des erreurs HTTP 402/403 (blocage anti-bot) lors des tentatives d'accès
> direct effectuées pour cette mise à jour du guide, en particulier pour la section 2.6 (rangs). Les données de
> modules/vaisseaux ont en revanche pu être vérifiées directement via le dépôt ouvert EDCD/coriolis-data, qui alimente
> les calculateurs de la communauté (Coriolis, EDSY) et fait autorité sur ces valeurs.
