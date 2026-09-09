# Guide complet du combat spatial dans Elite Dangerous

## Introduction

Le combat spatial est l'un des piliers de l'expérience Elite Dangerous, que ce soit pour chasser des primes en solo,
tenir une ligne de front dans une Combat Zone, ou s'affronter en duel PvP. Contrairement à un simple jeu de tir, la
maîtrise du combat repose sur la gestion simultanée de plusieurs systèmes interdépendants : l'énergie du vaisseau, sa
température, son inertie, et le choix de son armement. Ce guide couvre l'ensemble de ces mécaniques, les principaux
terrains de jeu PvE et PvP, l'évasion et la gestion du crime, ainsi que des configurations de vaisseaux (builds) par
catégorie de rôle.

> **Note sur la fraîcheur des données** : les mécaniques décrites ici (pips, FA off, chaleur, types d'affûts, sites PvE,
> interdiction, mass lock) forment le socle du système de combat depuis de nombreuses années. Les valeurs chiffrées
> précises (dégâts par seconde, capacités de bouclier, résistances aux dégâts, prix des vaisseaux, seuils de rang de
> combat) évoluent en revanche au gré des correctifs d'équilibrage de Frontier Developments et des extensions
> successives. **Limite méthodologique de cette révision** : les tentatives de vérification en direct via recherche web
> (elitedangerous.com/update-notes, forums Frontier, wikis communautaires) ont échoué lors de la rédaction de cette
> version (erreurs HTTP 402/403 et quota de recherche épuisé) ; les chiffres marqués « indicatif » ou « à revérifier »
> ci-dessous n'ont donc pas pu être confirmés en direct et reposent sur la connaissance générale et stable du système de
> jeu. Avant de finaliser un build compétitif, croisez toujours les informations de ce guide avec les notes de version
> les plus récentes et un outil de configuration à jour (type Coriolis ou EDSY, voir [16-outils.md](./16-outils.md)),
> ainsi qu'avec les threads communautaires actuels (forums Frontier, wiki communautaire, r/EliteDangerous).

---

## 1. Mécaniques de pilotage en combat

### 1.1 Le distributeur d'énergie (Power Distributor) et la gestion des pips

Le vaisseau répartit son énergie entre trois banques :

- **SYS** (Systems) : alimente le bouclier — vitesse de régénération et résistance aux dégâts.
- **ENG** (Engines) : alimente les moteurs — vitesse de pointe, accélération, maniabilité, disponibilité du boost.
- **WEP** (Weapons) : alimente le condensateur d'armes — vitesse de recharge entre les tirs, critique pour les armes
  énergétiques (lasers, accélérateurs à plasma).

Le joueur dispose d'un total de **4 pips** à répartir librement entre les trois banques, jusqu'à 4 pips sur une seule
banque à la fois. La gestion dynamique des pips, via des raccourcis clavier dédiés à des configurations préréglées
(4-0-0, 0-4-0, 0-0-4, 2-2-0, etc.), est considérée comme la compétence la plus fondamentale du combat : elle permet de
réagir instantanément aux changements de phase d'un engagement plutôt que de cliquer un par un en plein combat.

Cycle type d'un engagement :

1. **Approche** : privilégier SYS pour encaisser les premiers tirs et laisser le bouclier se stabiliser.
2. **Fenêtre de tir** : basculer sur WEP pour maximiser la cadence de tir soutenue.
3. **Repositionnement / fuite** : basculer sur ENG pour la vitesse, l'accélération et la disponibilité du boost.

### 1.2 Le boost

Le boost consomme le condensateur ENG jusqu'à un seuil minimal requis et délivre une accélération soudaine en ligne
droite, dans la direction de la trajectoire courante (et non du nez du vaisseau si le Flight Assist est coupé). Il
génère de la chaleur et ne peut être réutilisé qu'après un temps de recharge du condensateur ENG, raccourci par un
nombre plus élevé de pips sur cette banque. Il sert à fermer rapidement la distance, à s'échapper d'une position
défavorable, ou à générer la vitesse nécessaire à une manœuvre serrée.

### 1.3 Flight Assist Off (FA off) et le flick

Le Flight Assist (FA) est le système de stabilisation automatique qui freine le vaisseau dès que les commandes sont
relâchées et aligne son nez sur son vecteur de déplacement réel. Le désactiver (**FA off**) fait perdre cette
stabilisation : le vaisseau conserve son inertie et dérive librement, ce qui permet d'orienter le nez indépendamment de
la trajectoire réelle.

C'est la technique reine du dogfight avancé. Elle permet notamment de garder un adversaire dans le viseur pendant une
dérive latérale, ou d'exécuter un demi-tour serré sans réduire sa vitesse — contrairement au virage classique en FA on,
limité par la vitesse de rotation angulaire du vaisseau.

La manœuvre emblématique qui en découle est le **flick** (ou « 180 flick ») :

1. Couper le FA en pleine vitesse.
2. Appliquer un fort mouvement de lacet/tangage (yaw/pitch) pour retourner le nez du vaisseau de 180°.
3. Tirer sur la cible qu'on vient de dépasser.
4. Rallumer le FA ou continuer en dérive pour se repositionner.

Cette technique est essentielle contre des adversaires plus maniables ou en combat rapproché 1 contre 1, et constitue
l'une des bases qui distinguent un pilote intermédiaire d'un pilote expérimenté en PvP. Elle demande de l'entraînement
en zone de simulation de combat, car une mauvaise gestion de l'inertie en FA off peut désorienter le pilote ou provoquer
une collision.

### 1.4 Gestion de la chaleur (heat management)

La température du vaisseau augmente avec l'usage du boost, le tir d'armes énergétiques (les lasers en particulier, moins
les armes cinétiques comme les multi-canons ou les canons), et la proximité d'une étoile. Une jauge de chaleur excessive
(au-delà de 100 %) commence à endommager les modules internes, et une surchauffe prolongée (au-delà d'environ 150 %)
peut provoquer la destruction du vaisseau.

Outils de gestion de la chaleur :

- **Heat sinks** (largables) : évacuent instantanément une grande quantité de chaleur et brouillent temporairement le
  verrouillage des missiles et des armes gimbal adverses — usage à la fois défensif et offensif (contre-mesure).
- **Silent running** : coupe la dissipation thermique normale et masque la signature du vaisseau aux capteurs adverses,
  au prix d'une montée en chaleur continue et rapide. Utilisé pour une approche furtive ou pour échapper à un
  verrouillage de missile ; non tenable longtemps.
- **Effets spéciaux « thermal vent »** : certaines modifications d'armes déclenchent une décharge thermique sur une
  cible déjà en surchauffe, ou évacuent une partie de la chaleur du tireur à l'impact.

La maîtrise de la chaleur est cruciale en combat prolongé (RES, Combat Zones) : un vaisseau en surchauffe devient
vulnérable aux dégâts sur les modules et peut être contraint de cesser le feu pour refroidir, perdant ainsi le tempo du
combat.

### 1.5 Boucliers et absorption des dégâts

Deux philosophies de survie coexistent : le **shield tank** (miser sur le bouclier) et le **hull tank** (miser sur la
coque).

- **Shield Cell Banks (SCB)** : rechargent instantanément une partie du bouclier au prix d'une forte consommation de
  condensateur et d'un temps de rechargement du module lui-même. Ressource clé en combat long ([RES](./00-glossaire.md),
  [CZ](./00-glossaire.md)) pour tenir sans devoir retourner se réparer en station, mais limitée par le nombre
  d'emplacements internes disponibles.
- **Shield boosters** (modules utilitaires) : augmentent la capacité brute du bouclier ; quasi obligatoires sur toute
  configuration de combat sérieuse.
- **Générateurs de bouclier bi-weave** : recharge plus rapide, capacité de base plus faible — adaptés au PvP où l'on
  cherche à régénérer le bouclier entre les passes.
- **Générateurs de bouclier standard / prismatique** : capacité brute maximale, régénération plus lente — orientés vers
  le tank pur en PvE et en Combat Zone.

### 1.6 Renforts et blindage (HRP/MRP, bulkheads)

Le shield tank n'est qu'une moitié de l'équation défensive : la coque elle-même se renforce via trois familles de
modules complémentaires.

- **Bulkheads** (remplacement de coque, un par vaisseau, sans coût d'emplacement interne) : cinq niveaux — Lightweight
  Alloy, Reinforced Alloy, Military Grade Composite, Mirrored Surface Composite, Reactive Surface Composite. Chaque
  niveau augmente les points de vie de la coque au prix d'une masse supplémentaire (impact sur maniabilité, vitesse et
  portée de saut). Les deux derniers niveaux offrent en plus un **profil de résistance orienté** : le Mirrored Surface
  renforce la résistance thermique (efficace contre les lasers) au prix d'une résistance cinétique dégradée, tandis que
  le Reactive Surface fait l'inverse (renforce cinétique/explosif, fragilise contre le thermique).
- **HRP** ([Hull Reinforcement Package](./00-glossaire.md)) : modules internes optionnels qui ajoutent des points de
  coque bruts et un bonus de résistance modéré, réparti sur les trois types de dégâts ; l'effet est cumulable sur
  plusieurs HRP mais avec un rendement décroissant.
- **MRP** ([Module Reinforcement Package](./00-glossaire.md)) : modules internes optionnels qui ne protègent pas la
  coque mais l'intégrité des **modules internes** eux-mêmes (distributeur, FSD, bouclier…) contre les dégâts qui
  traversent bouclier et coque — précieux pour éviter une perte de module critique en plein combat prolongé.

> Ces valeurs sont données en configuration stock ; l'ingénierie (voir [06-ingenieurs.md](./06-ingenieurs.md)) peut les
> modifier significativement.

**Tableau de résistances aux dégâts (ordres de grandeur indicatifs, non revérifiés en direct — à confirmer via
Coriolis/EDSY avant tout calcul de build)** :

| Renfort                                  | Effet principal                                             | Résistance cinétique | Résistance thermique | Résistance explosive | Coût principal                                    |
|-------------------------------------------|---------------------------------------------------------------|-----------------------|-----------------------|-----------------------|----------------------------------------------------|
| Bulkheads Lightweight Alloy               | Bonus de coque minimal, masse quasi nulle                     | Profil de base (~0 %) | Profil de base (~0 %) | Profil de base (~0 %) | Aucun (le plus léger, préserve saut et maniabilité) |
| Bulkheads Reinforced Alloy                | Bonus de coque moyen                                          | Profil de base        | Profil de base        | Profil de base        | Masse modérée                                       |
| Bulkheads Military Grade Composite        | Bonus de coque maximal (hors profil orienté)                  | Profil de base        | Profil de base        | Profil de base        | Masse élevée, impact sensible sur saut/maniabilité  |
| Bulkheads Mirrored Surface Composite      | Résistance ciblée anti-énergie (lasers)                       | Dégradée              | Nettement renforcée   | Profil de base        | Masse élevée ; vulnérabilité accrue au cinétique    |
| Bulkheads Reactive Surface Composite      | Résistance ciblée anti-cinétique/explosif                     | Nettement renforcée   | Dégradée              | Renforcée             | Masse élevée ; vulnérabilité accrue au thermique    |
| HRP (par module, cumulable, rendement décroissant) | + points de coque et petit bonus de résistance sur les 3 types | Faible bonus (quelques %) | Faible bonus (quelques %) | Faible bonus (quelques %) | 1 emplacement interne consommé par module           |
| MRP (par module)                          | Protège l'intégrité des modules internes, pas la coque         | Sans objet            | Sans objet            | Sans objet            | 1 emplacement interne consommé par module           |

En pratique, un **hull tank** compétitif combine des bulkheads Military Grade (ou un profil orienté selon la menace
anticipée), plusieurs HRP en emplacements internes et militaires, et au moins un MRP pour sécuriser le distributeur
et/ou le FSD — au prix d'une masse totale qui pénalise la maniabilité et la portée de saut, d'où l'archétype « brawler
tanky » détaillé en section 8.

---

## 2. Interdiction et évasion

### 2.1 Le mini-jeu d'interdiction

En supercroisière, un vaisseau (NPC ou joueur) qui se rapproche suffisamment derrière une cible peut déclencher une
**interdiction**. Un mini-jeu de type « tir à la corde » s'engage alors : un réticule d'échappement (le tunnel bleu vers
lequel il faut orienter le nez du vaisseau) s'oppose au point de soumission imposé par l'interdicteur. La cible peut :

- **Résister** : tenter de garder le nez du vaisseau dans la zone d'échappement en jouant sur sa maniabilité (taux de
  lacet/tangage/roulis) et la puissance de ses propulseurs par rapport à l'interdicteur. Un vaisseau plus maniable ou
  mieux motorisé a statistiquement l'avantage.
- **Se soumettre** immédiatement (touche dédiée) : plutôt que de prolonger le duel, la cible accepte de sortir de
  supercroisière tout de suite. C'est souvent l'option la plus sûre, car un échec en pleine résistance peut laisser le
  vaisseau dans une position et une orientation défavorables face à l'interdicteur.

En cas d'échec (résistance perdue ou soumission), le vaisseau est éjecté de la supercroisière vers l'espace normal,
généralement à proximité immédiate de l'interdicteur et sans pouvoir choisir précisément son orientation. En cas de
réussite, la cible poursuit sa route, au prix d'un délai et d'une génération de chaleur liés à la manœuvre.

Un vaisseau **signalé** (wanted, notoriety élevée — voir section 7) ou volant dans un système de sécurité faible/Anarchy
subit statistiquement davantage de tentatives d'interdiction opportunistes de la part des PNJ pirates.

### 2.2 Mass lock

Chaque vaisseau, station et installation possède un **Mass Lock Factor (MLF)** qui détermine son rayon d'influence sur
la capacité des autres vaisseaux à charger leur FSD (saut vers la supercroisière ou l'hyperespace) à proximité. Être «
**mass locké** » (indicateur dédié à l'écran) empêche tout saut tant qu'on reste dans le rayon d'un vaisseau, d'une
station ou d'une installation suffisamment massive.

C'est une tactique offensive classique en PvP et en piraterie : immobiliser une cible à portée d'un ou plusieurs gros
vaisseaux (ou près d'une mégastructure) pour l'empêcher de fuir vers la supercroisière pendant qu'on l'engage. Pour s'en
sortir, il faut s'éloigner de toutes les sources de mass lock à portée (ou les détruire/neutraliser) jusqu'à la
disparition de l'indicateur.

### 2.3 Low wake et high wake

Tout déplacement laisse une trace exploitable par un **Frame Shift Wake Scanner** (module utilitaire) :

- **Low wake** : signature laissée lors d'une transition entre l'espace normal et la supercroisière **au sein du même
  système**. La scanner permet de suivre le cap pris par une cible qui vient d'entrer en supercroisière.
- **High wake** : signature laissée par un **saut hyperespace** vers un autre système. La scanner révèle alors le
  système de destination de la cible.

C'est l'outil de traque privilégié des chasseurs de primes et des pirates en PvP : une cible qui croit avoir semé son
poursuivant en sautant peut être retrouvée en scannant son high wake avant qu'il ne se dissipe. À l'inverse, enchaîner
plusieurs sauts courts en supercroisière (sans laisser le temps de scanner chaque low wake) est une technique d'évasion
efficace contre un poursuivant non équipé de ce module.

---

## 3. Armes et affûts

### 3.1 Modes de montage

| Mode de montage        | Précision requise                                                                                      | Dégâts / DPS                | Contre-mesure efficace                                                     | Usage recommandé                                                                                                               |
|------------------------|--------------------------------------------------------------------------------------------------------|-----------------------------|-----------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| **Fixe**               | Totale (visée manuelle, aucune correction)                                                             | Les plus élevés             | Esquive du pilote adverse (aucune contre-mesure automatique ne le dégrade) | PvP expérimenté, builds sniper, pilotes maîtrisant le FA off                                                                   |
| **Gimbal (à berceau)** | Modérée (suit automatiquement la cible dans un cône limité)                                            | Réduits par rapport au fixe | **Chaff** (brouilleur) : dégrade fortement la précision pendant sa durée   | PvE, pilotes moins expérimentés en PvP                                                                                         |
| **Tourelle**           | Faible (suit la cible sur une large plage d'angles, quasi indépendamment de l'orientation du vaisseau) | Les plus faibles des trois  | Chaff (efficacité réduite mais présente)                                   | Gros vaisseaux peu maniables (Anaconda, Cutter, Corvette, Type-10) devant garder une cible agile en visée pendant une manœuvre |

### 3.2 Grandes familles d'armes

| Famille                                                              | Type de dégâts               | Munitions                                  | Chaleur générée                                                                                                        | Points forts                                              | Usage typique                                                                                      |
|----------------------------------------------------------------------|------------------------------|--------------------------------------------|------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| Multi-canons                                                         | Cinétique                    | Limitées (rechargement nécessaire)         | Faible                                                                                                                 | DPS soutenu, efficace contre la coque                     | Farming, PvE prolongé                                                                               |
| Lasers à impulsion / rafale / faisceau                               | Énergétique (thermique)      | Illimitées (condensateur)                  | Variable selon le type : le laser à faisceau tire en continu et sollicite le plus fortement énergie et refroidissement | Efficaces contre les boucliers                            | Retrait de bouclier avant de passer aux armes cinétiques                                           |
| Canons                                                               | Cinétique, haute pénétration | Limitées                                   | Modérée                                                                                                                | Gros dégâts par coup, cadence lente                       | Sniping                                                                                             |
| Accélérateurs à plasma (PA)                                          | Énergétique/explosif         | Condensateur WEP fortement sollicité       | Élevée                                                                                                                 | Dégâts très élevés par coup en fixe                       | Duels PvP en configuration full fixe                                                               |
| Rail guns                                                            | Cinétique, précision extrême | Limitées                                   | Élevée                                                                                                                 | Portée extrême, dégâts élevés par coup, temps de charge   | Sniping                                                                                             |
| Missiles / torpilles                                                 | Explosif                     | Limitées                                   | Faible à modérée                                                                                                       | Dégâts potentiellement énormes contre la coque en un coup | Contrées par le point defence et les chaffs/leurres ; torpilles nécessitant un accrochage prolongé |
| Canons à fragmentation                                               | Cinétique, dégâts de zone    | Limitées, courte portée                    | Faible                                                                                                                 | Efficaces en combat rapproché (brawl)                     | Corps-à-corps                                                                                       |
| Armes Guardian (Gauss Cannon, Guardian Plasma Charger, Shard Cannon) | Variable, propriétés xéno    | Variable, mécaniques de charge spécifiques | Variable                                                                                                               | Bonus contre technologie Guardian/Thargoïde               | Combat anti-xéno ([AX](./00-glossaire.md)), occasionnellement PvP pour leurs effets spéciaux        |

Les valeurs exactes de dégâts par seconde entre familles d'armes évoluent au fil des correctifs d'équilibrage : ce
tableau donne des tendances générales, à confirmer avec un outil de configuration à jour avant de bâtir un build
compétitif.

### 3.3 Effets spéciaux d'ingénierie sur les armes

Ajoutés via modification (grades G1 à G5) chez les Engineers (voir [06-ingenieurs.md](./06-ingenieurs.md)) :

- **Incendiaire** : dégâts sur la durée.
- **Corrosif** : réduit la résistance de la cible aux dégâts suivants ; très utilisé en stacking d'escadre (plusieurs
  joueurs appliquent l'effet pour amplifier les dégâts du groupe).
- **Thermal vent** : évacue de la chaleur du tireur et en inflige à la cible.
- **Phasing sequence** : une partie des dégâts traverse directement le bouclier vers la coque.
- **Screening shell** : brouille temporairement les capteurs de la cible touchée.
- **High yield / dégâts bruts accrus** : augmente les dégâts par coup.

Types de modifications de base fréquemment recherchés (les intitulés précis peuvent varier légèrement selon les mises à
jour ; vérifiez la liste actuelle chez un Engineer ou dans un outil comme Coriolis/EDSY) :

- une modification orientée **dégâts et consommation accrus** (type « Overcharged ») ;
- une modification orientée **efficacité énergétique**, réduisant dégâts et consommation au profit de l'endurance en
  combat long (type « Efficient ») ;
- une modification orientée **portée**, augmentant la distance efficace et réduisant la chute de dégâts (type « Long
  range »), indispensable pour un build sniper.

### 3.4 Modules utilitaires indispensables selon le rôle

| Module                          | Fonction                                                            | Contexte d'usage                                  |
|---------------------------------|-----------------------------------------------------------------------|----------------------------------------------------|
| Shield boosters                 | Augmentent la capacité brute du bouclier                            | Survie, quasi systématique                         |
| Point defence                   | Interception automatique des missiles, torpilles et mines entrantes | Quasi obligatoire en PvP et contre les Thargoïdes |
| Chaff launcher                  | Contre-mesure anti-gimbal / anti-tourelle                           | Essentiel en dogfight                              |
| Heat sink launcher              | Évacuation de chaleur + contre-verrouillage                         | Fuite, gestion thermique, anti-missile             |
| Kill warrant scanner            | Révèle les primes émises par d'autres systèmes/factions sur la cible visée | Chasse aux primes (PvE), voir section 7            |
| Electronic countermeasure (ECM) | Contre les missiles à tête chercheuse                               | Défense anti-missile                               |
| Shutdown field neutraliser      | Contre les interdicteurs de champ                                   | Combat Zones, contre certains NPC/joueurs          |
| Frame Shift Wake Scanner        | Lit les low/high wakes laissés par une cible (voir section 2.3)     | Traque, chasse aux primes, PvP                     |
| Xeno scanner + armes AX dédiées | Détection et dégâts bonus contre les Thargoïdes                     | Combat anti-Thargoïdes uniquement                  |

### 3.5 Ingénierie des modules clés

Le passage en **grade 5 (G5)** des modules essentiels — distributeur d'énergie, générateur de bouclier, propulseurs,
coque, armes — est ce qui distingue un vaisseau « stock » d'un vaisseau de combat compétitif :

- Une modification du distributeur orientée **recharge accélérée** des banques SYS/ENG/WEP.
- Une modification de la coque orientée **capacité brute accrue** au prix d'une masse supplémentaire (impact sur
  maniabilité et vitesse).
- Des modifications des propulseurs orientées **vitesse et accélération**, certaines variantes générant davantage de
  chaleur en contrepartie.

L'ingénierie complète des modules clés est considérée comme un prérequis, non une option, pour tout PvP sérieux ou tout
PvE de haut niveau (Combat Zones haute intensité, missions d'assassinat contre des cibles de rang « Elite »). Les
intitulés exacts des blueprints disponibles chez chaque Engineer doivent être vérifiés en jeu ou via un outil de
configuration à jour (voir [06-ingenieurs.md](./06-ingenieurs.md)), ces catalogues ayant pu évoluer au fil des
extensions.

---

## 4. Tactiques PvE

### 4.1 Resource Extraction Sites ([RES](./00-glossaire.md)) et Hazardous RES (HazRES)

Zones minières où pirates NPC et forces de sécurité s'affrontent en continu. Le joueur peut cibler les pirates portant
une prime pour accumuler primes et kills sans provoquer l'hostilité de la sécurité locale, tant qu'il évite de tirer sur
des vaisseaux « clean » (sans prime).

Les **HazRES** proposent des adversaires bien plus dangereux, y compris des vaisseaux de rang « Deadly » ou « Elite »
avec des configurations engineerées. Ils offrent un bon compromis risque/récompense pour l'entraînement au combat et le
farming de primes/matériaux, mais nécessitent un vaisseau robuste et bien équipé (SCB, boucliers renforcés) sous peine
de destruction rapide face à des meutes de plusieurs adversaires.

### 4.2 Compromised Nav Beacons (CNB)

Balises de navigation autour desquelles apparaissent des rencontres aléatoires de vaisseaux pirates, souvent en groupe.
Généralement plus accessibles qu'un HazRES pour un pilote intermédiaire, elles constituent un bon terrain pour la chasse
aux primes et le repérage de cibles isolées.

### 4.3 Combat Zones ([CZ](./00-glossaire.md))

Zones de guerre entre factions en conflit (guerre de puissance ou [Background Simulation](./21-bgs.md)), déclinées en
trois niveaux d'intensité : **basse**, **moyenne** et **haute**.

- Le joueur choisit un camp et gagne une réputation de combat croissante en accumulant des éliminations.
- Des objectifs tactiques sont disponibles (capture de points de contrôle, escorte ou attaque de vaisseaux capitaux dans
  les CZ de haute intensité).
- Les CZ haute intensité rassemblent des vagues nombreuses de vaisseaux souvent engineerés, exigeant une gestion
  irréprochable de la chaleur et des pips, ainsi qu'une capacité de sortie rapide (boost puis supercruise) en cas de
  perte du bouclier.
- Ce sont un terrain d'entraînement privilégié pour la coordination en escadre (wing) et la gestion simultanée de
  multiples menaces — voir [23-jeu-en-groupe.md](./23-jeu-en-groupe.md) pour la mécanique des Wings, et
  [22-squadrons.md](./22-squadrons.md) pour l'organisation à plus grande échelle.
- Les CZ liées à une faction en conflit s'inscrivent dans la dynamique du [BGS](./21-bgs.md) : le camp qui domine une CZ
  influence l'état du conflit dans le système, et certains [Community Goals](./24-community-goals.md) portent
  spécifiquement sur des objectifs de combat en CZ.

### 4.4 Missions d'assassinat et de massacre

- **Missions d'assassinat** : ciblent un NPC nommé unique, souvent escorté, avec un niveau de menace corrélé à la
  récompense. Les cibles de rang « Elite » ou « Deadly » nécessitent un vaisseau optimisé et, idéalement, un coéquipier
  (wingman) pour diviser l'attention de l'escorte.
- **Missions de massacre** (à ne pas confondre avec l'assassinat) : demandent d'éliminer un nombre donné de vaisseaux
  d'un type ou d'une faction, généralement en RES ou en CNB. Elles constituent une source de revenu combat répétitive et
  fiable.

### 4.5 Combat anti-Thargoïdes ([AX](./00-glossaire.md))

Branche de gameplay séparée, avec sa propre méta généralement organisée par des communautés PvE dédiées — voir le guide
approfondi [25-combat-ax.md](./25-combat-ax.md) pour un traitement complet des builds, escadrons AX et procédures de
défense de système ; le contexte narratif de l'invasion thargoïde est couvert dans [01-lore.md](./01-lore.md). Les
vaisseaux Thargoïdes rencontrés en combat direct sont principalement les **Interceptors** — dont la menace croît
globalement des classes Cyclops et Basilisk vers Medusa et Hydra (des variantes supplémentaires ayant été introduites au
fil des mises à jour) — les **Scouts** constituant une unité de reconnaissance plus légère et distincte des
Interceptors. Ce combat culmine, dans l'end-game anti-Thargoïde, avec des engagements liés aux **Titans**.

**Anatomie d'un Interceptor.** Un Interceptor thargoïde n'est pas un simple sac à points de vie : il dispose d'un
bouclier organique propre qui doit être fait tomber (généralement via des armes AX dédiées ou un Thargoid Pulse
Neutraliser) avant que ses **hearts** (points faibles lumineux visibles sous la coque, une fois le bouclier abaissé) ne
deviennent vulnérables aux dégâts. Beaucoup d'Interceptors déploient également un **essaim** de petites unités
autonomes qui interceptent une partie des tirs destinés au vaisseau principal ; un Flak Cannon ou un Remote Release Flak
Launcher est généralement recommandé pour nettoyer l'essaim avant de se concentrer sur les hearts.

**Nuages caustiques.** Les Interceptors peuvent libérer des **nuages caustiques** (à leur mort, ou comme mécanisme
défensif/offensif) qui infligent des dégâts continus contournant directement le bouclier et laissent une contamination
persistante sur la coque, active même après avoir quitté le nuage tant qu'elle n'est pas neutralisée par un module dédié
(Caustic Sink Launcher) ou une décontamination en station/installation adaptée. À proximité des Titans, des zones
caustiques à plus grande échelle affectent aussi les opérations de surface.

**État de la guerre thargoïde.** La progression du conflit (systèmes en alerte, en invasion, sous contrôle thargoïde, en
reconquête) évolue au fil des campagnes et des Community Goals communautaires, et ne peut pas être figée dans un guide
statique. Cette révision n'a pas pu vérifier l'état courant du front en direct (accès web indisponible au moment de la
rédaction) : consultez le fil GalNet en jeu, [25-combat-ax.md](./25-combat-ax.md) et
[24-community-goals.md](./24-community-goals.md) pour un état à jour, plutôt que de se fier à un instantané figé ici.

Le combat AX nécessite par ailleurs :

- des builds dédiés avec armes AX spécialisées (multi-canons ou canons à fragmentation « Enhanced AX ») ;
- un xeno scanner ;
- une résistance thermique renforcée, les vaisseaux Thargoïdes infligeant des dégâts thermiques et pouvant provoquer une
  surchauffe rapide ;
- une coordination d'escadre stricte face aux Interceptors Thargoïdes ou aux menaces liées aux Titans.

---

## 5. Tactiques PvP

Le PvP se pratique principalement en mode **Open Play** (voir section 6.2) : interdiction en supercruise (section 2),
embuscade en système ou en station, duels organisés en zone neutre. Il se distingue nettement du PvE par l'exigence de
maîtrise du FA off, de la gestion fine des pips en temps réel, et de la lecture du build adverse (arme fixe ou gimbal,
présence de chaff ou de heat sink, capacité de fuite).

Points clés de la méta PvP :

- Privilégier les **armes fixes à haut DPS par coup** (accélérateurs à plasma, canons, rail guns) pour punir un
  adversaire qui manque ses corrections en gimbal.
- Le **chaff** reste la contre-mesure numéro un contre un adversaire équipé d'armes gimbal ou tourelle.
- Les duels s'arbitrent souvent sur la gestion du condensateur WEP (ne pas « vider » son arme énergétique au mauvais
  moment) et sur le timing du boost pour fermer ou casser la distance.
- En combat de groupe (**wing PvP**), la coordination du focus-fire et la synchronisation des contre-mesures (chaff,
  heat sink, SCB) déterminent l'issue plus que la puissance individuelle d'un seul vaisseau — voir
  [23-jeu-en-groupe.md](./23-jeu-en-groupe.md) pour la mécanique de Wing.
- Le **hull-tank pur** (miser sur une coque massive plutôt que sur le bouclier, voir section 1.6) est une philosophie
  PvP alternative utilisée par certains pilotes expérimentés pour absorber les dégâts après la chute du bouclier, tout
  en conservant un profil de masse permettant encore l'esquive active.
- Un adversaire vaincu en PvP dans un système où il est « clean » vous rend potentiellement redevable d'une prime locale
  — voir section 7 sur le crime et la notoriety avant de s'engager en Open Play dans un système à sécurité élevée.

Le niveau le plus élevé de jeu compétitif repose sur des centaines d'heures d'entraînement au flick, la connaissance des
temps de recharge adverses selon le vaisseau identifié à vue, et des builds ultra-spécialisés poussés à l'extrême de
l'ingénierie G5 avec effets spéciaux ciblés (corrosif en stacking d'escadre, phasing sequence pour percer les boucliers
lourds, etc.).

---

## 6. Rang de combat et modes de jeu

### 6.1 L'échelle de rang de combat

Comme les autres activités du jeu, le combat suit une échelle de rang à neuf paliers :

**Harmless → Mostly Harmless → Novice → Competent → Expert → Master → Dangerous → Deadly → Elite**

La progression n'est pas un simple compteur de kills : elle repose sur un score de combat pondéré, où éliminer un
adversaire de rang élevé (Deadly, Elite) rapporte bien plus qu'un adversaire Harmless. Frontier Developments n'a jamais
publié les seuils exacts de progression ; les estimations communautaires (calculateurs de rang sur des bases comme
Inara) restent des approximations, à prendre comme ordre de grandeur plutôt que comme référence chiffrée exacte — cette
révision n'a pas pu vérifier de seuils précis en direct (recherche web indisponible) et n'en invente donc aucun.

Une fois le rang **Elite** atteint, des paliers de prestige supplémentaires ont été ajoutés lors d'une mise à jour
ultérieure pour prolonger la progression au-delà du rang de base, sur un principe similaire de score pondéré non détaillé
officiellement.

### 6.2 Modes de jeu : Open, Groupe privé et Solo

Le choix du mode ne change ni l'économie ni le [BGS](./21-bgs.md) (partagés entre tous les modes), mais change
radicalement l'exposition au risque en combat :

- **Open Play** : instance partagée où n'importe quel autre joueur peut apparaître à proximité. C'est le seul mode où le
  PvP non consenti (embuscade, interdiction par un joueur, ganking) est possible — voir section 5.
- **Groupe privé** (Private Group) : instance restreinte à une liste fermée de joueurs (groupes communautaires
  thématiques PvE ou PvP). Le Wing et les duels organisés y restent possibles, mais uniquement entre membres du groupe.
- **Solo** : seuls les PNJ partagent l'instance du joueur, aucun autre commandant humain n'y apparaît jamais.

Le choix dépend donc essentiellement du niveau de risque PvP recherché : Solo ou Groupe privé pour du farming PvE
tranquille (RES, CZ, missions), Open pour la chasse aux primes en PvP, les embuscades organisées ou la participation aux
[Community Goals](./24-community-goals.md) et [Fleet Carriers](./19-fleet-carriers.md) en contexte communautaire vivant.

### 6.3 CQC (Close Quarters Combat)

Le CQC est un mode d'arène PvP arcade totalement séparé du jeu principal : vaisseaux et modules préconfigurés,
matchmaking dédié, et progression de rang indépendante du rang de combat de la galaxie principale décrit en 6.1. Il ne
demande ni vaisseau possédé ni crédits, ce qui en fait un bon terrain d'entraînement au dogfight pur (visée, esquive)
sans les enjeux économiques du monde persistant. Le détail des règles, files d'attente et cartes du CQC est traité dans
[23-jeu-en-groupe.md](./23-jeu-en-groupe.md), aux côtés des Wings et du Multicrew.

---

## 7. Crime, primes et notoriety

### 7.1 Bounty vouchers

Éliminer (porter le coup de grâce sur) un vaisseau déjà recherché — PNJ ou joueur « wanted » selon la faction locale —
génère un ou plusieurs **bounty vouchers**, un par faction ayant émis une prime sur la cible. Ces vouchers ne sont pas
crédités automatiquement : ils doivent être encaissés au contact « Redeem Vouchers » d'une station. Scanner la cible au
préalable avec un **Kill warrant scanner** (voir section 3.4) révèle des primes émises par d'autres systèmes/factions,
augmentant le montant total récupérable sur un même kill.

Le montant des vouchers dépend du vaisseau, du rang et du contexte (bonus d'événements, Community Goals de sécurité) et
fluctue avec les correctifs d'équilibrage : aucune moyenne chiffrée fiable n'a pu être vérifiée en direct pour cette
révision — consultez les valeurs affichées en jeu ou un tracker communautaire à jour plutôt qu'un chiffre figé ici.

### 7.2 Devenir « wanted » et Interstellar Factors

Attaquer ou détruire un vaisseau « clean » (sans prime), ou commettre d'autres infractions (cargaison illégale détectée,
accostage sans permission, tir en zone protégée), génère une **prime** contre le joueur dans le système concerné,
enregistrée par la faction qui contrôle ce système.

- Les infractions mineures (cargaison illégale scannée, excès de vitesse en zone sans-tir) génèrent une **amende**
  (fine), payable directement à n'importe quelle station de son propre camp.
- Les infractions graves (agression, destruction de vaisseau clean) génèrent une **prime** (bounty), plus coûteuse et
  susceptible de déclencher une réponse active de la sécurité locale (vaisseaux d'autorité système).
- La **notoriety** augmente avec la répétition d'infractions graves, en particulier contre des cibles clean. Tant
  qu'elle reste élevée, la sécurité refuse l'autorisation d'accostage dans les stations légitimes du système concerné,
  même après paiement de la prime — elle ne se réduit qu'avec le temps (décroissance réelle, sans raccourci de
  paiement).
- Les **Interstellar Factors Contacts**, présents dans la plupart des stations (particulièrement fréquents en systèmes
  Anarchy ou à sécurité faible), permettent de payer les primes émises dans **d'autres systèmes** sans avoir à s'y
  déplacer — généralement moyennant une commission par rapport à un paiement local direct. Ils ne suppriment en revanche
  pas la notoriety, qui suit son propre délai de décroissance.

### 7.3 Niveaux de sécurité des systèmes

| Niveau de sécurité | Réponse de la sécurité locale                       | Contexte typique                                                                 |
|---------------------|------------------------------------------------------|-----------------------------------------------------------------------------------|
| Haute                | Vaisseaux d'autorité nombreux, réponse rapide         | Crimes risqués à commettre ; RES/CZ bien protégés pour la chasse aux primes PvE   |
| Moyenne              | Réponse modérée                                       | Compromis risque/liberté d'action                                                 |
| Basse                | Réponse faible ou lente                               | Activité pirate plus fréquente (CNB, HazRES à proximité) ; crime moins risqué     |
| Anarchy              | Aucune réponse de sécurité locale organisée           | Zone lawless : PvP et piraterie libres localement, hébergement fréquent d'Interstellar Factors pour « blanchir » des primes émises ailleurs |

Ces niveaux structurent fortement où choisir de chasser les primes en PvE (sécurité haute pour un farming assisté) et où
se replier après un coup de main PvP ou de piraterie (Anarchy pour régler ses primes hors juridiction).

---

## 8. Builds spécialisés par catégorie

Le tableau suivant présente des **archétypes indicatifs** de configurations de combat par rôle, et non une
classification officielle ou figée : la méta évolue avec les correctifs d'équilibrage et l'ingénierie disponible, et de
nombreux vaisseaux peuvent être adaptés à plusieurs rôles selon la configuration choisie.

| Catégorie                    | Exemples d'archétypes de vaisseaux                                           | Priorité de pips                                                  | Bouclier recommandé                             | Armement typique                                                                | Rôle                                                                                                                                       |
|------------------------------|--------------------------------------------------------------------------------|-----------------------------------------------------------------------|--------------------------------------------------|-----------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| **Interceptor léger/rapide** | Viper, Vulture, Fer-de-Lance, Mamba, Imperial Courier/Eagle modifiés         | ENG (boost, esquive active)                                       | Bi-weave (régénération rapide entre les passes) | Fixe ou mixte fixe/gimbal léger                                                 | Interception rapide de cibles isolées, harcèlement en essaim                                                                               |
| **Brawler tanky**            | Federal Corvette, Imperial Cutter, Type-10 Defender, Anaconda (config. tank) | SYS (survie sur la durée)                                         | Standard/prismatique + nombreux boosters et SCB | Mixte avec tourelles pour compenser la faible maniabilité                       | Absorber un feu soutenu en CZ haute intensité ou HazRES prolongé                                                                           |
| **Sniper longue portée**     | Fer-de-Lance, Mamba (version sniper), gros vaisseaux en kiting (Anaconda)    | WEP (soutenir la consommation d'armes à forte puissance par coup) | Selon châssis                                     | Full fixe : rail guns, canons ou accélérateurs à plasma modifiés « long range » | Engager à distance maximale sans exposition au corps-à-corps                                                                               |
| **Multi-rôle de combat**     | Krait Mk II, Python/Python Mk II, Alliance Chieftain/Crusader/Challenger     | Équilibré selon la phase                                          | Équilibre bouclier/coque                          | Mixte fixe + gimbal                                                                | RES, CNB, missions d'assassinat et CZ sans reconfiguration lourde, au prix d'un plafond de performance plus bas que les builds spécialisés |

### 8.1 Interceptor léger/rapide

Vaisseaux petits à moyens, haute maniabilité et vitesse de pointe. Priorité aux pips ENG pour maximiser le boost et
l'esquive active ; bouclier bi-weave pour une régénération rapide entre les passes. Rôle d'interception rapide de cibles
isolées et de harcèlement en essaim au sein d'une escadre.

### 8.2 Brawler tanky

Vaisseaux lourds à forte capacité de coque et de bouclier. Nombreux SCB et boosters de bouclier ; armement mixte avec
tourelles pour compenser la faible maniabilité. Conçus pour absorber un feu soutenu en Combat Zone haute intensité ou en
HazRES prolongé ; priorité aux pips SYS pour la survie sur la durée plutôt que le burst.

### 8.3 Sniper longue portée

Configuration full fixe avec rail guns, canons ou accélérateurs à plasma modifiés « long range », pour engager à
distance maximale et punir sans exposition au corps-à-corps. Exige une précision manuelle irréprochable et une bonne
gestion du condensateur WEP, les armes à forte puissance par coup vidant vite la réserve d'énergie.

### 8.4 Multi-rôle de combat

Châssis polyvalents combinant un bon équilibre bouclier/coque/maniabilité, avec un armement mixte fixe et gimbal. Ils
permettent d'enchaîner RES, CNB, missions d'assassinat et CZ sans reconfiguration lourde — un choix recommandé pour un
pilote qui ne veut pas multiplier les vaisseaux dédiés, au prix d'un plafond de performance plus bas que les builds
spécialisés dans leur créneau respectif.

### 8.5 Exemples de builds chiffrés

Les trois builds ci-dessous illustrent concrètement les archétypes 8.1 à 8.3 avec des choix de modules précis. Ce sont
des configurations de référence issues de la méta communautaire (forums, Coriolis, EDSY), **non revérifiées en direct
lors de cette révision** (recherche web indisponible) : à valider par un import dans un outil de configuration à jour
(voir [16-outils.md](./16-outils.md)) avant tout usage compétitif.

**Build A — Vulture « Faucon HazRES » (Interceptor léger/rapide)**

| Emplacement          | Choix                                                                 |
|-----------------------|------------------------------------------------------------------------|
| Hardpoints (2× Large) | 2× Multi-canons gimbal, G5 « Overcharged », effet « Incendiaire »      |
| Bouclier              | Générateur bi-weave, G5 « Blindé » + 2 Shield Boosters G5 résistance thermique |
| Distributeur          | G5 « Recharge prioritaire » orienté WEP                                |
| Renfort               | 1 HRP en emplacement militaire (classe 2)                              |
| Pips typiques         | 2-2-0 en approche → 0-4-0 en fenêtre de tir → 0-0-4 en repositionnement |
| Prix du châssis nu    | ≈ 4,9 M CR (Core Dynamics) — instantané au 9 septembre 2026, à revérifier sur le shipyard en jeu ou Coriolis/EDSY |
| Portée de saut stock  | Faible (l'un des points faibles reconnus du châssis) — priorité d'ingénierie FSD, voir [06-ingenieurs.md](./06-ingenieurs.md) |
| Source                | Archétype de méta communautaire pour le farming HazRES/CZ basse-moyenne intensité (forums Frontier, Coriolis, EDSY) |

**Build B — Federal Corvette « Rempart CZ haute intensité » (Brawler tanky)**

| Emplacement                  | Choix                                                                 |
|--------------------------------|--------------------------------------------------------------------------|
| Hardpoints (≥ 4× Large utilisés) | 3× Multi-canons Large gimbal (soutenu) + 1× Canon à fragmentation Large fixe (brawl) |
| Bouclier                      | Générateur standard le plus gros disponible, G5 « Blindé » + 4 Shield Boosters mixtes résistance/capacité |
| SCB                           | 2× Shield Cell Bank en emplacements internes lourds                     |
| Renforts                      | 2× HRP en emplacements militaires + Bulkheads Military Grade Composite |
| Pips typiques                 | SYS dominant (4-0-0 ou 3-1-0) la majorité du combat, bascule ponctuelle sur WEP pour les salves |
| Prix du châssis nu             | ≈ 18-20 M CR (Federal Navy) + rang fédéral « Post Captain » requis — instantané au 9 septembre 2026, à revérifier sur le shipyard en jeu ou Coriolis/EDSY |
| Source                        | Configuration « tank » de référence pour CZ haute intensité relayée par la communauté PvE (forums, Coriolis, EDSY) |

**Build C — Fer-de-Lance « Longue Portée » (Sniper longue portée)**

| Emplacement                        | Choix                                                                 |
|---------------------------------------|--------------------------------------------------------------------------|
| Hardpoints (3× Large + 2× Medium)     | 2× Rail guns Large fixes, G5 « Long range », effet « Phasing sequence » + 1× Canon Large fixe + 2× Multi-canons Medium gimbal |
| Distributeur                          | G5 « Recharge prioritaire » orienté WEP (consommation élevée des rail guns/canons) |
| Bouclier                              | Bi-weave, G5 « Blindé » + boosters — survie par la distance plutôt que le tank pur |
| Pips typiques                         | WEP dominant (0-1-3 ou 0-0-4 hors boost), bascule ENG au repositionnement |
| Prix du châssis nu                    | ≈ 51-55 M CR (Zorgon Peterson, l'un des vaisseaux moyens les plus chers du jeu) — instantané au 9 septembre 2026, à revérifier sur le shipyard en jeu ou Coriolis/EDSY |
| Source                                | Configuration sniper de référence reprise dans la plupart des guides communautaires de PvP Fer-de-Lance |

---

## 9. Conseils avancés pour dominer en combat spatial

- **Automatiser la gestion des pips** via des raccourcis clavier dédiés à chaque configuration (4-0-0, 0-4-0, 0-0-4,
  2-2-0…) plutôt que de cliquer un par un en combat, pour réagir instantanément aux changements de phase (approche /
  burst / fuite).
- **S'entraîner au FA off et au flick** en zone de simulation de combat avant tout engagement réel — c'est la compétence
  qui différencie le plus nettement les niveaux de jeu.
- **Lire le type d'arme adverse** à l'oreille ou à l'œil (son, effets visuels) pour décider d'utiliser le chaff (contre
  gimbal/tourelle) ou le heat sink/l'esquive pure (contre fixe) au bon moment plutôt que par réflexe.
- **Ne jamais engager un combat sérieux** (CZ haute intensité, cible de rang Elite, duel PvP) sans ingénierie G5
  complète sur au moins le distributeur, le bouclier et l'arme principale : l'écart de performance entre un module stock
  et un module G5 est considérable (temps de recharge, capacités, dégâts).
- **Garder toujours une option d'échappement** : FSD chargée dès que possible hors zone de mass lock (section 2.2),
  boost disponible, heat sink en réserve, et si possible se soumettre proprement plutôt que de perdre une résistance
  à l'interdiction (section 2.1). La survie prime sur l'élimination, aussi bien en PvP qu'en PvE profond.
- **En combat d'escadre**, désigner une cible de focus-fire et synchroniser les contre-mesures (chaff, heat sink) au
  niveau du groupe plutôt qu'individuellement ; répartir les rôles entre un tank qui absorbe l'agressivité adverse, un
  ou deux DPS burst, et éventuellement un support appliquant des effets corrosifs pour amplifier les dégâts du groupe.
- **Choisir son mode de jeu (Open/Groupe privé/Solo, section 6.2) en fonction du risque recherché**, et garder à l'esprit
  l'impact d'un crime en Open Play sur la prime et la notoriety locales (section 7) avant d'engager une cible clean.
- **Vérifier régulièrement les notes de version officielles** de Frontier Developments et les discussions communautaires
  (forums Frontier, wiki communautaire, r/EliteDangerous) avant de finaliser un build compétitif, afin de tenir compte
  de tout changement d'équilibrage récent des armes ou des modules.

---

## Synthèse

| Élément         | À retenir                                                                                                                             |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| Pips              | 4 pips à répartir entre SYS/ENG/WEP ; adapter dynamiquement selon la phase du combat                                                  |
| FA off            | Compétence clé du dogfight avancé ; base de la manœuvre du flick                                                                      |
| Chaleur           | Gérer via heat sinks et silent running ; éviter la surchauffe des modules                                                             |
| Renforts          | Bulkheads/HRP pour la coque, MRP pour les modules internes ; complète le shield tank pour un profil hull tank                          |
| Armes             | Fixe = DPS max mais précision manuelle ; gimbal = confort mais contré par le chaff ; tourelle = pour les gros vaisseaux peu maniables |
| Interdiction      | Résister (mini-jeu) ou se soumettre ; mass lock immobilise ; low/high wake trahissent la destination d'une cible en fuite             |
| PvE               | RES/HazRES et CNB pour la chasse aux primes ; CZ pour le combat de masse et la réputation de faction                                  |
| PvP               | Maîtrise du FA off, lecture du build adverse, coordination d'escadre                                                                  |
| Rang & modes      | Harmless → Elite (score pondéré, pas un simple compteur de kills) ; Open/Groupe privé/Solo selon le risque PvP recherché ; CQC séparé |
| Crime             | Bounty vouchers à encaisser en station ; Interstellar Factors pour les primes hors système ; notoriety qui ne se paie pas             |
| Builds            | Interceptor (vitesse), brawler (tank), sniper (portée), multi-rôle (polyvalence) — voir builds chiffrés en 8.5                        |
| Ingénierie        | G5 sur distributeur, bouclier et arme principale : prérequis pour le combat de haut niveau                                            |
| AX                | Interceptors à hearts + essaim, nuages caustiques ; état du front à vérifier en direct, pas figé dans ce guide                         |

---

## Voir aussi

- [Lore et chronologie](./01-lore.md) — contexte narratif de l'invasion thargoïde et des Titans.
- [Ingénieurs](./06-ingenieurs.md) — modifications G1-G5 des modules et armes évoquées tout au long de ce guide.
- [Équipements](./04-equipements.md) — détail des modules (boucliers, armes, utilitaires) au-delà de leur usage combat.
- [Vaisseaux](./03-vaisseaux.md) — fiches techniques complètes des châssis cités dans les builds.
- [Combat anti-Thargoïde (AX) approfondi](./25-combat-ax.md) — builds AX dédiés, escadrons et procédures de défense de système.
- [Wings, Multicrew et CQC](./23-jeu-en-groupe.md) — coordination d'escadre en combat et détail du mode CQC.
- [Escadrons de joueurs (Squadrons)](./22-squadrons.md) — organisation de groupes de combat à grande échelle.
- [Le Background Simulation (BGS)](./21-bgs.md) — impact des Combat Zones et du crime sur l'état des factions.
- [Community Goals](./24-community-goals.md) — objectifs communautaires de combat et de sécurité.
- [Porte-vaisseaux de joueur (Fleet Carriers)](./19-fleet-carriers.md) — logistique de combat en flotte, ravitaillement avancé.
- [Outils](./16-outils.md) — Coriolis, EDSY et autres outils de configuration pour valider tout build chiffré ci-dessus.
- [Glossaire](./00-glossaire.md) — sigles courants (HRP, MRP, AX, CZ, RES…) utilisés dans ce guide.

---

## Sources

- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://canonn.science/
- https://www.edsm.net/en/
- https://www.spansh.co.uk/

> **Note de transparence** : lors de la préparation de cette révision (interdiction/évasion, renforts et blindage, rang
> de combat, crime/notoriety, approfondissement AX), les recherches web complémentaires (WebSearch/WebFetch) ont échoué
> (quota de recherche épuisé pour la session, réponses HTTP 402/403 sur les wikis communautaires interrogés). Les ajouts
> reposent donc sur la connaissance générale, stable depuis plusieurs années, des mécaniques citées ; les chiffres les
> plus volatils (résistances précises, prix exacts, seuils de rang, montants de primes, état courant du front
> thargoïde) sont explicitement signalés comme indicatifs et à revérifier plutôt que présentés comme des faits figés.
