---
id: 08-combat-spatial
titre: "Guide complet du combat spatial dans Elite Dangerous"
domaine: combat
entites: [Power Distributor, pips SYS/ENG/WEP, Flight Assist Off, Shield Cell Bank, Hull Reinforcement Package, Module Reinforcement Package, interdiction, mass lock, Resource Extraction Site, Combat Zone, notoriety, CQC, pénétration de blindage, dureté de coque, Corrosive shell, Phasing sequence, Thermal vent, Feedback Cascade, blueprint Focused, blueprint Sturdy, Cytoscrambler Burst Laser, Guardian Gauss Cannon, Plasma Accelerator, Rail Gun, Torpedo Pylon, bulkheads]
mots_cles_en: [power distributor, pips, flight assist off, shield cell bank, hull reinforcement package, module reinforcement package, interdiction, mass lock, hazres, combat zone, bounty voucher, notoriety, armour piercing, hull hardness, damage distribution, thermal damage, kinetic damage, explosive damage, absolute damage, corrosive shell, phasing sequence, thermal vent, feedback cascade, weapon focused, weapon sturdy, bulkheads, hull boost, combat rank]
version_jeu_couverte: "mécaniques stables non rattachées à une version précise ; caractéristiques de vaisseaux, d'armes et de blindages relevées le 10 septembre 2026 dans EDCD/coriolis-data et EDCD/FDevIDs"
branche: live
date_verification: 2026-09-12
confiance_globale: haute
volatilite: moyenne
sources_primaires: [Wikipedia Elite Dangerous, Canonn Research, EDSM, Spansh, Inara, EDCD/coriolis-data, EDCD/FDevIDs]
zones_incertaines:
  - "Coefficient exact de réduction des dégâts lorsque la pénétration de blindage d'une arme est inférieure à la dureté de coque de la cible : les deux champs sont publiés par EDCD/coriolis-data, la formule qui les combine ne l'est pas."
  - "Règle de calcul appliquée aux dégâts de type absolu et aux dégâts anti-xéno : le jeu de données porte l'étiquette de type, pas la règle."
  - "Dégâts par seconde comparés entre familles d'armes : dégâts par tir et cadences sont publiés, l'agrégat DPS et l'équilibrage courant ne le sont pas."
  - "Seuils de score nécessaires pour passer d'un rang de combat au suivant, jamais publiés par Frontier ; seule l'échelle nominale est confirmée par EDCD/FDevIDs."
  - "Montant moyen des bounty vouchers, non vérifié en direct."
  - "État courant du front thargoïde (systèmes en alerte, invasion, reconquête), non vérifiable dans un guide statique."
  - "Effet chiffré des Hull Reinforcement Packages et des Module Reinforcement Packages, non couvert par ce guide."
  - "Choix de modules des trois builds de la section 8.5, issus de la méta communautaire ; seules les caractéristiques de châssis sont recalées sur EDCD/coriolis-data."
guides_lies: [0, 3, 4, 6, 16, 21, 23, 25, 30]
---

# Guide complet du combat spatial dans Elite Dangerous

## En bref

Le combat spatial d'*Elite Dangerous* combine quatre systèmes interdépendants. La répartition des **4 pips** du
distributeur d'énergie entre **SYS**, **ENG** et **WEP** commande le bouclier, le boost et la cadence de tir. La
chaleur endommage les modules au-delà de 100 % et détruit le vaisseau vers 150 %, d'où *heat sinks* et *silent
running*. L'inertie s'exploite en **Flight Assist Off**, dont découle le *flick* à 180°. Chaque impact franchit
trois filtres : les résistances du bouclier, puis la **pénétration de blindage** de l'arme (*piercing*, de 1 à 140 — l'Advanced Torpedo Pylon faisant exception à 10 000, valeur qui lui fait ignorer toute dureté de coque)
confrontée à la **dureté de coque** de la cible (*hardness*, de 20 à 75), puis les résistances de coque au type de
dégâts — **thermique**, **cinétique**, **explosif** ou **absolu**. Les armes se montent en **fixe**, **gimbal** ou
**tourelle** ; la coque se renforce par **bulkheads**, **HRP** et **MRP**. L'**interdiction** et le **mass lock**
contraignent la fuite. Les terrains PvE sont les **RES/HazRES**, les **Compromised Nav Beacons** et les **Combat
Zones** ; le rang va de *Harmless* à **Elite V**, et détruire une cible « clean » génère prime et **notoriety**.

## Introduction au combat spatial d'Elite Dangerous

Le combat spatial est l'un des piliers de l'expérience Elite Dangerous, que ce soit pour chasser des primes en solo,
tenir une ligne de front dans une Combat Zone, ou s'affronter en duel PvP. Contrairement à un simple jeu de tir, la
maîtrise du combat repose sur la gestion simultanée de plusieurs systèmes interdépendants : l'énergie du vaisseau, sa
température, son inertie, et le choix de son armement. Ce guide couvre l'ensemble de ces mécaniques, les principaux
terrains de jeu PvE et PvP, l'évasion et la gestion du crime, ainsi que des configurations de vaisseaux (builds) par
catégorie de rôle.

---

## 1. Mécaniques de pilotage en combat spatial

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

### 1.2 Le boost — accélération soudaine puisée dans le condensateur ENG

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

### 1.5 Boucliers et absorption des dégâts : shield tank, SCB, bi-weave et prismatique

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

**Où trouver les chiffres.** Le coût, la masse et les résistances de chaque grade de blindage, vaisseau par vaisseau,
sont rassemblés dans
[04-equipements.md](./04-equipements.md#blindage-de-coque-bulkheads--résistances-et-masse-chiffrées-par-vaisseau),
section « Blindage de coque (bulkheads) — résistances et masse chiffrées par vaisseau ». Ce guide n'en reproduit pas
les valeurs et se limite à la lecture tactique : quel blindage pour quel rôle de combat.

**Ce que le profil de résistance change en combat.** Trois faits structurent le choix, vérifiés sur les fiches des 47
vaisseaux du jeu de données. Le profil de résistance d'un grade donné est **identique sur tous les châssis** : seuls le coût et la masse varient d'un vaisseau à l'autre, jamais les pourcentages. Les trois premiers
grades — Lightweight Alloy, Reinforced Alloy, Military Grade Composite — partagent **exactement le même profil** et ne
se distinguent que par le nombre de points de coque et la masse : monter en gamme dans ces trois-là n'améliore aucune
résistance, cela ajoute seulement de la matière. Enfin, une coque est nativement **déficitaire face au cinétique et à
l'explosif**, et neutre face au thermique ; seuls les deux derniers grades réorientent ce profil, et toujours en
échangeant une résistance contre une autre, jamais en ajoutant gratuitement.

| Menace dominante attendue                                      | Blindage à monter          | Ce que fait son profil                                                                      | Ce qu'il coûte tactiquement                                    |
|----------------------------------------------------------------|----------------------------|----------------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| Aucune (interceptor léger, priorité vitesse et portée de saut) | Lightweight Alloy          | Profil de base ; le multiplicateur de points de coque le plus faible des cinq grades          | Coque minimale : toute perte de bouclier devient critique       |
| Menace mixte, farming PvE prolongé                             | Military Grade Composite   | Même profil de base, multiplicateur de points de coque maximal                                | Masse la plus élevée à profil constant : maniabilité et saut    |
| Lasers adverses (escortes PNJ, PvP orienté laser)              | Mirrored Surface Composite | Renforce le thermique, dégrade lourdement le cinétique et sensiblement l'explosif             | Un adversaire qui bascule sur multi-canons vous punit aussitôt  |
| Multi-canons, canons, missiles (HazRES, CZ, brawl PvP)         | Reactive Surface Composite | Renforce le cinétique et l'explosif, dégrade le thermique                                     | Vulnérabilité accrue aux lasers, très courants en escorte PNJ   |
| Bouclier délibérément absent (hull tank pur)                   | Reactive ou Military Grade | Choix dicté par l'arme adverse la plus probable, pas par le chiffre brut de points de coque   | Aucun filet : la moindre erreur de lecture de menace se paie    |

Un seul châssis du jeu de données, le **Caspian Explorer**, expose ses cinq grades sous l'appellation « Mk II
Ablative » ; leurs profils de résistance et leurs multiplicateurs de points de coque sont identiques à ceux des cinq
grades classiques, seuls les intitulés diffèrent.

*Source : EDCD/coriolis-data, champ `bulkheads` des 47 fichiers du répertoire `ships/`, commit 0db9234b5b9c.*

En pratique, un **hull tank** compétitif combine des bulkheads Military Grade (ou un profil orienté selon la menace
anticipée), plusieurs HRP en emplacements internes et militaires, et au moins un MRP pour sécuriser le distributeur
et/ou le FSD — au prix d'une masse totale qui pénalise la maniabilité et la portée de saut, d'où l'archétype « brawler
tanky » détaillé en section 8.

---

## 2. Interdiction en supercroisière et évasion

### 2.1 Le mini-jeu d'interdiction : résister ou se soumettre

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

### 2.2 Le mass lock (Mass Lock Factor) : empêcher une cible de sauter

Chaque vaisseau, station et installation possède un **Mass Lock Factor (MLF)** qui détermine son rayon d'influence sur
la capacité des autres vaisseaux à charger leur FSD (saut vers la supercroisière ou l'hyperespace) à proximité. Être «
**mass locké** » (indicateur dédié à l'écran) empêche tout saut tant qu'on reste dans le rayon d'un vaisseau, d'une
station ou d'une installation suffisamment massive.

C'est une tactique offensive classique en PvP et en piraterie : immobiliser une cible à portée d'un ou plusieurs gros
vaisseaux (ou près d'une mégastructure) pour l'empêcher de fuir vers la supercroisière pendant qu'on l'engage. Pour s'en
sortir, il faut s'éloigner de toutes les sources de mass lock à portée (ou les détruire/neutraliser) jusqu'à la
disparition de l'indicateur.

### 2.3 Low wake et high wake : traquer une cible au Frame Shift Wake Scanner

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

## 3. Armes et affûts des vaisseaux de combat

### 3.1 Modes de montage des armes : fixe, gimbal et tourelle

| Mode de montage        | Précision requise                                                                                      | Dégâts / DPS                | Contre-mesure efficace                                                     | Usage recommandé                                                                                                               |
|------------------------|--------------------------------------------------------------------------------------------------------|-----------------------------|-----------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| **Fixe**               | Totale (visée manuelle, aucune correction)                                                             | Les plus élevés             | Esquive du pilote adverse (aucune contre-mesure automatique ne le dégrade) | PvP expérimenté, builds sniper, pilotes maîtrisant le FA off                                                                   |
| **Gimbal (à berceau)** | Modérée (suit automatiquement la cible dans un cône limité)                                            | Réduits par rapport au fixe | **Chaff** (brouilleur) : dégrade fortement la précision pendant sa durée   | PvE, pilotes moins expérimentés en PvP                                                                                         |
| **Tourelle**           | Faible (suit la cible sur une large plage d'angles, quasi indépendamment de l'orientation du vaisseau) | Les plus faibles des trois  | Chaff (efficacité réduite mais présente)                                   | Gros vaisseaux peu maniables (Anaconda, Cutter, Corvette, Type-10) devant garder une cible agile en visée pendant une manœuvre |

### 3.2 Grandes familles d'armes de vaisseau (multi-canons, lasers, canons, plasma, rail guns)

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

**Où trouver la matrice complète.** La liste exhaustive des effets expérimentaux, leur compatibilité arme par arme,
leurs valeurs chiffrées et leur coût en matériaux sont rassemblés dans
[06-ingenieurs.md](./06-ingenieurs.md#effets-expérimentaux--matrice-de-compatibilité-effets-chiffrés-et-coûts),
section « Effets expérimentaux — matrice de compatibilité, effets chiffrés et coûts ». Ce guide n'en reproduit aucune
colonne : il retient seulement lesquels valent l'investissement selon le style de combat pratiqué. **La liste des
armes qui acceptent un effet donné, ses valeurs chiffrées et son coût en matériaux se lisent dans cette matrice, et
nulle part ailleurs dans le corpus** — y compris pour les variantes que le tableau ci-dessous ne nomme pas, comme
l'Advanced Multi-Cannon ou les racks de missiles Seeker.

| Style de combat                               | Effet expérimental à viser | Pourquoi il change l'issue du combat                                                                                                                                                                                                         |
|-----------------------------------------------|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Escadre organisée, focus-fire sur une cible   | **Corrosive shell**        | Affaiblit temporairement la dureté de coque de la cible et augmente tous les dégâts qu'elle encaisse : c'est le seul effet qui agit sur le deuxième filtre décrit en 3.6, donc le seul qui amplifie les tirs de tous les équipiers à la fois |
| Duel PvP contre un shield tank lourd          | **Phasing sequence**       | Fait passer une fraction des dégâts à travers le bouclier directement sur la coque, au prix d'une légère baisse de dégâts bruts                                                                                                              |
| Combat long, gestion thermique tendue         | **Thermal vent**           | Évacue de la chaleur du tireur à chaque tir qui touche, et en génère davantage à chaque tir manqué : récompense directement la précision                                                                                                     |
| Casser un adversaire qui se recharge au SCB   | **Feedback Cascade**       | Un tir qui frappe une cible en train de déployer une Shield Cell endommage la banque et réduit la recharge obtenue                                                                                                                           |
| Rupture de contact, désengagement             | **Target lock breaker**    | Brise le verrouillage de la cible touchée : ses gimbals et ses missiles redeviennent inutiles le temps qu'elle re-verrouille                                                                                                                 |
| Chasse aux primes contre une cible qui fuit   | **Drag munitions**         | Empêche temporairement la cible de convertir ses pips ENG en poussée : elle ne peut plus distancer son poursuivant                                                                                                                           |
| Combat en zone surveillée (RES sous sécurité) | **Smart rounds**           | Les projectiles s'auto-détruisent avant de toucher un vaisseau non ciblé : évite de générer une prime sur un tir perdu                                                                                                                       |

*Source : EDCD/coriolis-data, `modifications/specials.json` (description de chaque effet), commit 0db9234b5b9c ; la
compatibilité arme par arme n'est pas reprise ici, elle est tenue à jour dans la matrice de
[06-ingenieurs.md](./06-ingenieurs.md#effets-expérimentaux--matrice-de-compatibilité-effets-chiffrés-et-coûts).
Le paragraphe ci-dessous s'appuie en outre sur `modifications/modules.json` (champ `specials` de chaque famille
d'armes), même commit.*

Trois pièges de lecture, relevés dans le même jeu de données. **Incendiary rounds n'est pas un effet de dégâts sur la
durée** : il convertit une large part des dégâts en thermique tout en augmentant les dégâts bruts — c'est un effet
anti-bouclier monté sur une arme cinétique, donc utile surtout aux builds dépourvus de laser. **Screening shell ne
brouille pas les capteurs** : il réduit le temps de rechargement et améliore l'efficacité contre les munitions
entrantes, autrement dit c'est un effet défensif anti-missile ; celui qui dégrade les capteurs adverses s'appelle
**Dazzle shell**. Enfin, les trois armes **Guardian** (Gauss Cannon, Plasma Charger, Shard Cannon) n'acceptent
**aucun** blueprint ni aucun effet expérimental dans le jeu de données : elles se jouent telles quelles.

Types de modifications de base fréquemment recherchés sur les armes de combat :

- une modification orientée **dégâts et consommation accrus** (« Overcharged ») ;
- une modification orientée **efficacité énergétique**, réduisant dégâts et consommation au profit de l'endurance en
  combat long (« Efficient ») ;
- une modification orientée **portée**, augmentant la distance efficace et réduisant la chute de dégâts (« Long
  range »), indispensable pour un build sniper ;
- deux modifications qui relèvent la **pénétration de blindage** — « Focused » et « Sturdy » — détaillées en 3.7.

### 3.4 Modules utilitaires de combat indispensables selon le rôle (chaff, heat sink, point defence)

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

### 3.5 Ingénierie G5 des modules clés de combat (distributeur, bouclier, propulseurs)

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

### 3.6 Comment un tir est encaissé : bouclier, puis dureté de coque contre pénétration de blindage, puis résistances

Trois filtres s'appliquent successivement à chaque impact, et les confondre conduit à monter la mauvaise arme.

**Premier filtre — le bouclier.** Tant que le bouclier tient, la coque n'est pas touchée et la pénétration de blindage
de l'arme n'intervient pas du tout : seules comptent les résistances du générateur et des shield boosters au type de
dégâts reçu. C'est la raison pour laquelle un engagement s'ouvre au laser et se termine au multi-canon, et non
l'inverse.

**Deuxième filtre — la dureté de coque confrontée à la pénétration de l'arme.** Une fois le bouclier tombé, chaque
châssis oppose sa **dureté de coque** (champ `hardness` de sa fiche) à la **pénétration de blindage** de l'arme
(champ `piercing` de la fiche du module). Lorsque la pénétration égale ou dépasse la dureté, le tir porte à pleine
valeur. Lorsqu'elle lui est inférieure, les dégâts sont réduits proportionnellement à l'écart : plus l'arme est faible
devant la coque visée, plus la part de dégâts perdue est grande. C'est ce filtre qui explique qu'un même multi-canon
Small soit correct contre un Sidewinder et presque inoffensif contre un Type-10 Defender.

**Le coefficient exact de cette réduction n'est pas porté par le jeu de données.** EDCD/coriolis-data définit les deux
champs et impose leur présence dans ses propres tests — `spec/data-spec.js` déclare `hardness` parmi les propriétés
obligatoires d'un vaisseau et vérifie que chaque arme porte bien un `piercing` — mais aucun fichier du dépôt ne décrit
la formule qui les combine. Le **sens** de la relation est en revanche confirmé par le jeu de données lui-même : dans
`modifications/specials.json`, la description de l'effet expérimental *Corrosive shell* indique qu'il affaiblit
temporairement la dureté de coque de la cible et augmente en conséquence tous les dégâts qu'elle encaisse. Abaisser la
dureté augmente donc bien les dégâts reçus. L'ampleur chiffrée de cette réduction n'est pas re-vérifiable sur ces
sources : elle n'est pas donnée ici plutôt que d'être devinée.

**Troisième filtre — les résistances de coque par type de dégâts.** Les dégâts qui ont franchi le filtre de dureté
sont enfin modulés par le profil de résistance du blindage et des renforts, type par type (voir 1.6).

**Ce que cela change pour choisir une arme.** Le jeu compte **48 châssis** ; c'est le fait 14 de
[00-chronologie-canonique.md](./00-chronologie-canonique.md) qui fait autorité sur ce décompte. EDCD/coriolis-data,
la source chiffrée de cette section, n'en publie que **47** : le Lynx Highliner y est absent, et sa dureté de coque
n'est donc connue d'aucun des dépôts cités ici. Ces 47 châssis mesurés se répartissent sur 15 paliers de dureté, de
20 (Sidewinder, Hauler) à 75 (Type-10 Defender), les vaisseaux de combat lourds occupant le haut de l'échelle. La
valeur exacte de chaque vaisseau figure dans la colonne de dureté de coque (*hardness*) de
[03-vaisseaux.md](./03-vaisseaux.md#mobilité-et-survie-des-47-vaisseaux--masse-vitesse-boost-agilité-blindage-bouclier-et-dureté-de-coque),
section « Mobilité et survie des 47 vaisseaux — masse, vitesse, boost, agilité, blindage, bouclier et dureté de
coque » ; elle n'est pas reproduite ici. Deux conséquences pratiques en découlent. D'une part, une arme de petite
taille perd l'essentiel de son intérêt contre un gros châssis, indépendamment de son DPS affiché : c'est la
pénétration, pas le DPS, qui décide si le tir compte vraiment. D'autre part, quelques familles d'armes franchissent
toutes les duretés mesurables du jeu sans exception et se comportent donc de façon identique quelle que soit la
cible — le tableau de la section 3.7 les identifie.

*Source : EDCD/coriolis-data, répertoire `ships/` (champ `properties.hardness`), répertoire `modules/hardpoints/`
(champ `piercing`), `spec/data-spec.js` et `modifications/specials.json`, commit 0db9234b5b9c.*

### 3.7 Pénétration de blindage (piercing) de chaque arme, taille d'affût par taille d'affût

Le tableau ci-dessous donne, pour chacune des 25 familles d'armes offensives du jeu de données, la pénétration de
blindage de son modèle standard dans chaque taille d'affût. Ces valeurs se comparent directement à la
dureté de coque de la cible décrite en 3.6 : à pénétration égale ou supérieure à la dureté, le tir porte à plein. En
règle générale, les affûts fixe, gimbal et tourelle d'un même modèle et d'une même taille partagent **la même
pénétration** — le mode de montage change la précision et les dégâts, jamais la capacité à percer la coque. Un
balayage exhaustif des 43 fichiers de `modules/hardpoints/` ne relève qu'**une seule exception dans tout le jeu de
données** : le **Remote Release Flechette Launcher** en taille Medium, dont l'affût fixe
(`Hpt_FlechetteLauncher_Fixed_Medium`) perce à **80** et l'affût tourelle (`Hpt_FlechetteLauncher_Turret_Medium`) à
**70**. Sa cellule du tableau porte donc les deux valeurs, dans l'ordre fixe puis tourelle ; partout ailleurs, une
seule valeur vaut pour les trois affûts. Les outils miniers (Abrasion Blaster, Mining Laser, Mining Volley Repeater,
Seismic Charge Launcher) sont exclus du tableau : ils portent bien un champ `piercing` mais ne sont pas des armes de
combat.

| Arme (nom en jeu)                 | Small | Medium  | Large | Huge | Fichier source (modules/hardpoints/)   |
|-----------------------------------|-------|---------|-------|------|----------------------------------------|
| Pulse Laser                       | 20    | 35      | 52    | 65   | pulse_laser.json                       |
| Burst Laser                       | 20    | 35      | 52    | 65   | burst_laser.json                       |
| Beam Laser                        | 18    | 35      | 50    | 60   | beam_laser.json                        |
| Multi-Cannon                      | 22    | 37      | 54    | 68   | multi_cannon.json                      |
| Advanced Multi-Cannon             | 22    | 37      | —     | —    | multi_cannon_advanced.json             |
| Cannon                            | 35    | 50      | 70    | 90   | cannon.json                            |
| Fragment Cannon                   | 20    | 30      | 45    | —    | fragment_cannon.json                   |
| Plasma Accelerator                | —     | 100     | 100   | 100  | plasma_accelerator.json                |
| Rail Gun                          | 100   | 100     | —     | —    | rail_gun.json                          |
| Shock Cannon                      | 25    | 40      | 60    | —    | shock_cannon.json                      |
| Missile Rack                      | 60    | 60      | 60    | —    | missile_rack.json                      |
| Advanced Missile Rack             | 60    | 60      | —     | —    | missile_rack_advanced.json             |
| Torpedo Pylon                     | 10000 | 10000   | 10000 | —    | torpedo_pylon.json                     |
| Mine Launcher                     | 60    | 60      | —     | —    | mine_launcher.json                     |
| Remote Release Flak Launcher      | —     | 60      | —     | —    | remote_release_flak_launcher.json      |
| Remote Release Flechette Launcher | —     | 80 / 70 | —     | —    | remote_release_flechette_launcher.json |
| Guardian Gauss Cannon             | 140   | 140     | —     | —    | guardian_gauss_cannon.json             |
| Guardian Plasma Charger           | 65    | 80      | 95    | —    | guardian_plasma_charger.json           |
| Guardian Shard Cannon             | 30    | 45      | 60    | —    | guardian_shard_cannon.json             |
| AX Multi-Cannon                   | —     | 17      | 33    | —    | ax_multi_cannon.json                   |
| Enhanced AX Multi-Cannon          | —     | 17      | 33    | —    | ax_multi_cannon_enhanced.json          |
| AX Missile Rack                   | —     | 60      | 60    | —    | ax_missile_rack.json                   |
| Enhanced AX Missile Rack          | —     | 60      | 60    | —    | ax_missile_rack_enhanced.json          |
| Enzyme Missile Rack               | —     | 60      | —     | —    | enzyme_missile_rack.json               |
| Sub-surface Displacement Missile  | 25    | 25      | —     | —    | sub_surface_displacement_missile.json  |

*Source : EDCD/coriolis-data, répertoire `modules/hardpoints/` — un fichier par famille, nommé dans la colonne de
droite —, commit 0db9234b5b9c. Noms d'affichage recoupés sur EDCD/FDevIDs, `outfitting.csv`, commit c35612952dd6.*

Trois valeurs se lisent à part. Le **Torpedo Pylon** porte une pénétration de 10 000, très au-delà de toute dureté de
coque existante : une torpille qui touche porte toujours à pleine valeur, ce qui explique son statut d'arme de
finition. Le **Guardian Gauss Cannon**, à 140, dépasse lui aussi la coque la plus dure du jeu. À l'inverse, l'**AX
Multi-Cannon** en taille Medium plafonne à 17, soit moins que la dureté du châssis le plus tendre : c'est une arme
conçue contre les cibles thargoïdes, pas contre les coques humaines, et l'employer en PvP ou en RES revient à tirer
presque à blanc.

**Quatre variantes s'écartent de la pénétration de leur famille.** Le recalcul porte sur toutes les entrées nommées
(champ `name`) des 43 fichiers de `modules/hardpoints/`, comparées au modèle sans nom de la même famille et de la
même taille : quatre seulement affichent un `piercing` différent. Ce sont pour l'essentiel des armes Powerplay et
des variantes récentes ; le tableau suivant les isole pour éviter de les confondre avec le modèle standard de même
taille. Le
Remote Release Flechette Launcher n'en fait pas partie : ses deux valeurs relèvent du mode de montage, pas d'une
variante d'arme, et son fichier ne porte d'ailleurs aucun champ `name` (voir l'exception signalée plus haut).

| Variante (nom en jeu)          | Taille | Pénétration | Pénétration du modèle de base | Identifiant interne                       |
|--------------------------------|--------|-------------|-------------------------------|-------------------------------------------|
| Concord Cannon                 | Medium | 42          | 50                            | Hpt_Cannon_Gimbal_Medium_Burst            |
| Cytoscrambler Burst Laser      | Small  | 1           | 20                            | Hpt_PulseLaserBurst_Fixed_Small_Scatter   |
| Enforcer Cannon                | Small  | 30          | 22                            | Hpt_MultiCannon_Fixed_Small_Strong        |
| Mk II Plasma Shock Accelerator | Large  | 60          | 100                           | Hpt_MkIIPlasmaShockAutocannon_Fixed_Large |

*Source : EDCD/coriolis-data, répertoire `modules/hardpoints/` (champs `piercing` et `symbol`), commit 0db9234b5b9c ;
noms d'affichage issus de EDCD/FDevIDs, `outfitting.csv`, commit c35612952dd6.*

Le **Cytoscrambler Burst Laser** est le cas extrême du corpus : avec une pénétration de 1 contre 20 pour un Burst
Laser Small ordinaire, il est délibérément inoffensif contre la coque et ne sert qu'à raser des boucliers — un choix
d'arme qui n'a de sens qu'en escadre, avec un équipier chargé des dégâts de coque.

**Combien de châssis résistent à quelle arme.** Le tableau suivant est dérivé des deux précédents : pour chaque arme
et chaque taille, il compte les vaisseaux, sur les 47 châssis que publie EDCD/coriolis-data (le jeu en compte 48, le
Lynx Highliner étant absent de la source), dont la dureté de coque **dépasse** la pénétration de l'arme, c'est-à-dire
ceux contre lesquels cette arme subit la réduction décrite en 3.6. Un zéro signifie que l'arme perce toutes les
coques mesurées, sans exception.

| Arme (nom en jeu)     | Small   | Medium  | Large   | Huge    |
|-----------------------|---------|---------|---------|---------|
| Pulse Laser           | 45 / 47 | 35 / 47 | 29 / 47 | 7 / 47  |
| Burst Laser           | 45 / 47 | 35 / 47 | 29 / 47 | 7 / 47  |
| Beam Laser            | 47 / 47 | 35 / 47 | 31 / 47 | 14 / 47 |
| Multi-Cannon          | 45 / 47 | 35 / 47 | 28 / 47 | 7 / 47  |
| Cannon                | 35 / 47 | 31 / 47 | 1 / 47  | 0 / 47  |
| Fragment Cannon       | 45 / 47 | 42 / 47 | 31 / 47 | —       |
| Plasma Accelerator    | —       | 0 / 47  | 0 / 47  | 0 / 47  |
| Rail Gun              | 0 / 47  | 0 / 47  | —       | —       |
| Missile Rack          | 14 / 47 | 14 / 47 | 14 / 47 | —       |
| Guardian Gauss Cannon | 0 / 47  | 0 / 47  | —       | —       |
| AX Multi-Cannon       | —       | 47 / 47 | 42 / 47 | —       |

*Dérivé par script des champs `piercing` (répertoire `modules/hardpoints/`) et `properties.hardness` (répertoire
`ships/`) de EDCD/coriolis-data, commit 0db9234b5b9c.*

La lecture est nette. **Plasma Accelerator, Rail Gun et Guardian Gauss Cannon percent tout**, quelle que soit la
cible : d'où leur place dans les builds sniper et anti-gros châssis. Le **Cannon** en taille Large ne laisse qu'un
seul vaisseau au-dessus de lui. Les lasers et les multi-canons, eux, subissent la réduction contre la majorité de la
flotte dans leurs petites tailles et ne s'en affranchissent réellement qu'en taille Huge — ce qui explique pourquoi un
petit châssis peine tant à entamer un vaisseau lourd, même en tirant longtemps.

**Relever la pénétration par l'ingénierie.** Deux blueprints modifient directement ce champ, de façon multiplicative
et croissante avec le grade.

| Blueprint (nom en jeu) | Effet sur la pénétration au grade 5 | Armes de combat qui l'acceptent                                                                                         |
|------------------------|-------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| Focused                | +100 % à +120 %                     | Burst Laser, Plasma Accelerator, Pulse Laser                                                                            |
| Sturdy                 | +50 % à +60 %                       | Beam Laser, Burst Laser, Cannon, Fragment Cannon, Missile Rack, Multi-Cannon, Plasma Accelerator, Pulse Laser, Rail Gun |

*Source : EDCD/coriolis-data, `modifications/blueprints.json` (grade 5 des blueprints `Weapon_Focused` et
`Weapon_Sturdy`), `modifications/modifications.json` — où le champ `piercing` est déclaré multiplicatif et « plus haut
est meilleur » — et `modifications/modules.json` pour la compatibilité par famille, commit 0db9234b5b9c.*

Conséquence de build : « Focused » double presque la pénétration au grade 5, mais **seules trois armes l'acceptent** —
Pulse Laser, Burst Laser et Plasma Accelerator. Un multi-canon ne peut pas être « Focused » : sa seule voie
d'amélioration de la pénétration est « Sturdy », qui monte moins haut et alourdit l'arme. C'est un argument concret en
faveur du Plasma Accelerator sur un châssis destiné à percer des coques lourdes, et une raison de compter sur le
*Corrosive shell* d'un équipier plutôt que sur l'ingénierie lorsque l'armement principal est cinétique.

### 3.8 Ce que chaque arme inflige réellement : thermique, cinétique, explosif ou absolu

Chaque arme répartit ses dégâts entre quatre types, et cette répartition est publiée arme par arme. Elle décide contre
quel filtre l'arme est efficace : le **thermique** est la monnaie des boucliers, le **cinétique** celle des coques,
l'**explosif** celle des modules internes, et l'**absolu** échappe par construction aux profils de résistance. Le
tableau donne la répartition exacte des 25 familles offensives.

| Arme (nom en jeu)                 | Thermique | Cinétique | Explosif | Absolu | Marqueur X |
|-----------------------------------|-----------|-----------|----------|--------|------------|
| Pulse Laser                       | 100 %     | —         | —        | —      | —          |
| Burst Laser                       | 100 %     | —         | —        | —      | —          |
| Beam Laser                        | 100 %     | —         | —        | —      | —          |
| Multi-Cannon                      | —         | 100 %     | —        | —      | —          |
| Advanced Multi-Cannon             | —         | 100 %     | —        | —      | —          |
| Cannon                            | —         | 100 %     | —        | —      | —          |
| Fragment Cannon                   | —         | 100 %     | —        | —      | —          |
| Plasma Accelerator                | 20 %      | 20 %      | —        | 60 %   | —          |
| Rail Gun                          | 67 %      | 33 %      | —        | —      | —          |
| Shock Cannon                      | —         | 100 %     | —        | —      | —          |
| Missile Rack                      | —         | —         | 100 %    | —      | —          |
| Advanced Missile Rack             | —         | —         | 100 %    | —      | —          |
| Torpedo Pylon                     | —         | —         | 100 %    | —      | —          |
| Mine Launcher                     | 50 %      | —         | 50 %     | —      | —          |
| Remote Release Flak Launcher      | —         | —         | 100 %    | —      | —          |
| Remote Release Flechette Launcher | —         | 100 %     | —        | —      | —          |
| Guardian Gauss Cannon             | 100 %     | —         | —        | —      | —          |
| Guardian Plasma Charger           | —         | —         | —        | 100 %  | —          |
| Guardian Shard Cannon             | 100 %     | —         | —        | —      | —          |
| AX Multi-Cannon                   | —         | 100 %     | —        | —      | oui        |
| Enhanced AX Multi-Cannon          | —         | 100 %     | —        | —      | oui        |
| AX Missile Rack                   | —         | —         | 100 %    | —      | oui        |
| Enhanced AX Missile Rack          | —         | —         | 100 %    | —      | oui        |
| Enzyme Missile Rack               | —         | —         | 100 %    | —      | —          |
| Sub-surface Displacement Missile  | —         | —         | 100 %    | —      | —          |

*Source : EDCD/coriolis-data, répertoire `modules/hardpoints/` (champ `damagedist`), commit 0db9234b5b9c.*

Quatre enseignements se dégagent de ces chiffres. **Aucune arme laser n'inflige autre chose que du thermique** : les
trois lasers sont thermiques à 100 %, ce qui confirme leur rôle exclusif de retrait de bouclier. **Les armes de coque
sont pures elles aussi** : multi-canons, canons et canons à fragmentation sont cinétiques à 100 %. Le **Plasma
Accelerator est la seule arme humaine à panacher les trois types**, avec une majorité de dégâts absolus complétée à
parts égales de cinétique et de thermique — d'où sa réputation d'arme qui « marche partout », puisque la fraction
absolue ne se laisse pas atténuer par un profil de résistance. Le **Rail Gun**, enfin, est majoritairement thermique
et minoritairement cinétique : c'est autant une arme de bouclier qu'une arme de coque, contrairement à ce que son
allure de projectile laisse croire. Seul le **Mine Launcher** répartit ses dégâts à parts strictement égales entre
explosif et thermique.

Deux réserves de lecture. Le fait que les dégâts **absolus** ignorent les résistances est une règle de jeu établie que
ce jeu de données **ne documente pas** : il porte l'étiquette du type, pas la règle de calcul qui s'y applique — au
même titre que le coefficient de dureté évoqué en 3.6. Par ailleurs, les armes anti-xéno portent, en plus de leur type
conventionnel, un **marqueur X** propre au registre anti-thargoïde ; leurs pondérations ne totalisent pas 100 % dans
la source et le détail de leur combinaison n'y est pas explicité. Le traitement complet du combat anti-thargoïde est
dans [25-combat-ax.md](./25-combat-ax.md).

---

## 4. Tactiques PvE en combat spatial

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

### 4.3 Combat Zones spatiales ([CZ](./00-glossaire.md)) : basse, moyenne et haute intensité

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

### 4.4 Missions d'assassinat et de massacre en vaisseau

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

## 5. Tactiques PvP en combat spatial (Open Play, duels, wing PvP)

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

### 6.1 L'échelle de rang de combat, de Harmless à Elite

Comme les autres activités du jeu, le combat suit une échelle de rang à neuf paliers :

**Harmless → Mostly Harmless → Novice → Competent → Expert → Master → Dangerous → Deadly → Elite**

La progression n'est pas un simple compteur de kills : elle repose sur un score de combat pondéré, où éliminer un
adversaire de rang élevé (Deadly, Elite) rapporte bien plus qu'un adversaire Harmless. Frontier Developments n'a jamais
publié les seuils exacts de progression ; les estimations communautaires (calculateurs de rang sur des bases comme
Inara) restent des approximations, à prendre comme ordre de grandeur plutôt que comme référence chiffrée exacte. Les
jeux de données extraits du jeu publient l'échelle des rangs, jamais le barème qui y donne accès : aucun seuil chiffré
n'est donc avancé ici.

Une fois le rang **Elite** atteint, des paliers de prestige supplémentaires prolongent la progression. La table
d'identifiants extraite du jeu par EDCD/FDevIDs en donne l'échelle nominale complète, qui compte 14 paliers :

| Valeur interne | Rang de combat |
|----------------|----------------|
| 0              | Harmless       |
| 1              | MostlyHarmless |
| 2              | Novice         |
| 3              | Competent      |
| 4              | Expert         |
| 5              | Master         |
| 6              | Dangerous      |
| 7              | Deadly         |
| 8              | Elite          |
| 9              | Elite I        |
| 10             | Elite II       |
| 11             | Elite III      |
| 12             | Elite IV       |
| 13             | Elite V        |

*Source : EDCD/FDevIDs, `combatrank.csv`, commit c35612952dd6.*

Cette table confirme les intitulés et leur ordre, y compris les cinq paliers de prestige **Elite I** à **Elite V**.
Elle ne dit rien, en revanche, du score nécessaire pour passer d'un palier au suivant : ces seuils n'ont jamais été
publiés par Frontier Developments, et les calculateurs communautaires n'en proposent que des estimations.

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
Pour la piraterie en tant que boucle de jeu complète, les lieux à risque documentés par la communauté (Deciat,
Shinrarta Dezhra, stations de CG), les groupes privés PvE comme Mobius, le blocage, le signalement et le combat
logging, voir [30-piraterie-et-pvp.md](./30-piraterie-et-pvp.md). Pour l'architecture réseau qui explique pourquoi
deux joueurs du même système ne se voient pas toujours, voir
[23-jeu-en-groupe.md](./23-jeu-en-groupe.md#6-comment-fonctionne-le-réseau--instanciation-p2p-et-simulation-persistante).

### 6.3 CQC (Close Quarters Combat)

Le CQC est un mode d'arène PvP arcade totalement séparé du jeu principal : vaisseaux et modules préconfigurés,
matchmaking dédié, et progression de rang indépendante du rang de combat de la galaxie principale décrit en 6.1. Il ne
demande ni vaisseau possédé ni crédits, ce qui en fait un bon terrain d'entraînement au dogfight pur (visée, esquive)
sans les enjeux économiques du monde persistant. Le détail des règles, files d'attente et cartes du CQC est traité dans
[23-jeu-en-groupe.md](./23-jeu-en-groupe.md), aux côtés des Wings et du Multicrew.

---

## 7. Crime, primes et notoriety

### 7.1 Bounty vouchers : encaisser en station les primes d'une cible recherchée

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

### 7.3 Niveaux de sécurité des systèmes (haute, moyenne, basse, Anarchy)

| Niveau de sécurité | Réponse de la sécurité locale                       | Contexte typique                                                                 |
|---------------------|------------------------------------------------------|-----------------------------------------------------------------------------------|
| Haute                | Vaisseaux d'autorité nombreux, réponse rapide         | Crimes risqués à commettre ; RES/CZ bien protégés pour la chasse aux primes PvE   |
| Moyenne              | Réponse modérée                                       | Compromis risque/liberté d'action                                                 |
| Basse                | Réponse faible ou lente                               | Activité pirate plus fréquente (CNB, HazRES à proximité) ; crime moins risqué     |
| Anarchy              | Aucune réponse de sécurité locale organisée           | Zone lawless : PvP et piraterie libres localement, hébergement fréquent d'Interstellar Factors pour « blanchir » des primes émises ailleurs |

Ces niveaux structurent fortement où choisir de chasser les primes en PvE (sécurité haute pour un farming assisté) et où
se replier après un coup de main PvP ou de piraterie (Anarchy pour régler ses primes hors juridiction).

---

## 8. Builds de combat spatial spécialisés par catégorie

Le tableau suivant présente des **archétypes indicatifs** de configurations de combat par rôle, et non une
classification officielle ou figée : la méta évolue avec les correctifs d'équilibrage et l'ingénierie disponible, et de
nombreux vaisseaux peuvent être adaptés à plusieurs rôles selon la configuration choisie.

| Catégorie                    | Exemples d'archétypes de vaisseaux                                           | Priorité de pips                                                  | Bouclier recommandé                             | Armement typique                                                                | Rôle                                                                                                                                       |
|------------------------------|--------------------------------------------------------------------------------|-----------------------------------------------------------------------|--------------------------------------------------|-----------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| **Interceptor léger/rapide** | Viper, Vulture, Fer-de-Lance, Mamba, Imperial Courier/Eagle modifiés         | ENG (boost, esquive active)                                       | Bi-weave (régénération rapide entre les passes) | Fixe ou mixte fixe/gimbal léger                                                 | Interception rapide de cibles isolées, harcèlement en essaim                                                                               |
| **Brawler tanky**            | Federal Corvette, Imperial Cutter, Type-10 Defender, Anaconda (config. tank) | SYS (survie sur la durée)                                         | Standard/prismatique + nombreux boosters et SCB | Mixte avec tourelles pour compenser la faible maniabilité                       | Absorber un feu soutenu en CZ haute intensité ou HazRES prolongé                                                                           |
| **Sniper longue portée**     | Fer-de-Lance, Mamba (version sniper), gros vaisseaux en kiting (Anaconda)    | WEP (soutenir la consommation d'armes à forte puissance par coup) | Selon châssis                                     | Full fixe : rail guns, canons ou accélérateurs à plasma modifiés « long range » | Engager à distance maximale sans exposition au corps-à-corps                                                                               |
| **Multi-rôle de combat**     | Krait Mk II, Python/Python Mk II, Alliance Chieftain/Crusader/Challenger     | Équilibré selon la phase                                          | Équilibre bouclier/coque                          | Mixte fixe + gimbal                                                                | RES, CNB, missions d'assassinat et CZ sans reconfiguration lourde, au prix d'un plafond de performance plus bas que les builds spécialisés |

### 8.1 Interceptor léger/rapide (Viper, Vulture, Fer-de-Lance, Mamba)

L'archétype **interceptor léger/rapide** rassemble des vaisseaux petits à moyens, à haute maniabilité et forte vitesse
de pointe. Priorité aux pips ENG pour maximiser le boost et l'esquive active ; bouclier bi-weave pour une régénération
rapide entre les passes. Rôle d'interception rapide de cibles isolées et de harcèlement en essaim au sein d'une
escadre.

### 8.2 Brawler tanky (Federal Corvette, Imperial Cutter, Type-10 Defender)

L'archétype **brawler tanky** rassemble des vaisseaux lourds à forte capacité de coque et de bouclier. Nombreux SCB et
boosters de bouclier ; armement mixte avec tourelles pour compenser la faible maniabilité. Conçus pour absorber un feu
soutenu en Combat Zone haute intensité ou en HazRES prolongé ; priorité aux pips SYS pour la survie sur la durée plutôt
que le burst.

### 8.3 Sniper longue portée (rail guns, canons et plasma « long range »)

L'archétype **sniper longue portée** se joue en configuration full fixe avec rail guns, canons ou accélérateurs à plasma
modifiés « long range », pour engager à distance maximale et punir sans exposition au corps-à-corps. Il exige une
précision manuelle irréprochable et une bonne gestion du condensateur WEP, les armes à forte puissance par coup vidant
vite la réserve d'énergie.

### 8.4 Multi-rôle de combat (Krait Mk II, Python, Alliance Chieftain)

L'archétype **multi-rôle de combat** rassemble des châssis polyvalents combinant un bon équilibre
bouclier/coque/maniabilité, avec un armement mixte fixe et gimbal. Ils permettent d'enchaîner RES, CNB, missions
d'assassinat et CZ sans reconfiguration lourde — un choix recommandé pour un pilote qui ne veut pas multiplier les
vaisseaux dédiés, au prix d'un plafond de performance plus bas que les builds spécialisés dans leur créneau
respectif.

### 8.5 Trois builds de combat chiffrés : Vulture, Federal Corvette, Fer-de-Lance

Les trois builds ci-dessous illustrent concrètement les archétypes 8.1 à 8.3. Les **choix de modules** restent des
configurations de référence issues de la méta communautaire (forums, Coriolis, EDSY), à valider par un import dans un
outil de configuration à jour (voir [16-outils.md](./16-outils.md)) avant tout usage compétitif. En revanche, les
**caractéristiques de châssis** — prix, nombre et taille des affûts, emplacements militaires, dureté de coque — ont
été recalées le 10 septembre 2026 sur EDCD/coriolis-data (`ships/vulture.json`, `ships/federal_corvette.json`,
`ships/fer_de_lance.json`), commit 0db9234b5b9c. Ce recalage a corrigé trois erreurs de la révision précédente,
signalées en note sous les fiches concernées. Le détail module par module est dans [04-equipements.md](./04-equipements.md), le
détail châssis par châssis dans [03-vaisseaux.md](./03-vaisseaux.md) : ce guide n'en reproduit pas les valeurs.

**Build A — Vulture « Faucon HazRES » (Interceptor léger/rapide)**

| Emplacement          | Choix                                                                 |
|-----------------------|------------------------------------------------------------------------|
| Hardpoints (2× Large) | 2× Multi-canons gimbal, G5 « Overcharged », effet « Incendiaire »      |
| Bouclier              | Générateur bi-weave, G5 « Blindé » + 2 Shield Boosters G5 résistance thermique |
| Distributeur          | G5 « Recharge prioritaire » orienté WEP                                |
| Renfort               | 1 HRP dans l'unique emplacement militaire du châssis, de classe 5      |
| Pips typiques         | 2-2-0 en approche → 0-4-0 en fenêtre de tir → 0-0-4 en repositionnement |
| Affûts du châssis     | 2× Large — EDCD/coriolis-data, `ships/vulture.json`, commit 0db9234b5b9c |
| Dureté de coque       | 55 : un multi-canon Small adverse (pénétration 22) subit une forte réduction contre cette coque, un canon Large (70) porte à plein — voir 3.6 |
| Prix du châssis nu    | 4 925 615 Cr (Core Dynamics) — EDCD/coriolis-data, `ships/vulture.json`, champ `retailCost`, commit 0db9234b5b9c |
| Portée de saut stock  | Faible (l'un des points faibles reconnus du châssis) — priorité d'ingénierie FSD, voir [06-ingenieurs.md](./06-ingenieurs.md) |
| Source                | Archétype de méta communautaire pour le farming HazRES/CZ basse-moyenne intensité (forums Frontier, Coriolis, EDSY) |

> **Correction apportée le 10 septembre 2026.** La révision précédente donnait un prix de châssis de 4 925 620 Cr et
> un emplacement militaire « de classe 2 ». Le jeu de données donne 4 925 615 Cr et un emplacement militaire unique
> de classe 5.

**Build B — Federal Corvette « Rempart CZ haute intensité » (Brawler tanky)**

| Emplacement                  | Choix                                                                 |
|--------------------------------|--------------------------------------------------------------------------|
| Hardpoints (2× Huge + 1× Large + 2× Medium + 2× Small) | Multi-canons gimbal sur les deux affûts Huge (dégâts soutenus) + canon à fragmentation fixe sur l'affût Large (brawl) ; affûts Medium et Small en utilitaires de soutien |
| Bouclier                      | Générateur standard le plus gros disponible, G5 « Blindé » + 4 Shield Boosters mixtes résistance/capacité |
| SCB                           | 2× Shield Cell Bank en emplacements internes lourds                     |
| Renforts                      | 2× HRP en emplacements militaires + Bulkheads Military Grade Composite |
| Pips typiques                 | SYS dominant (4-0-0 ou 3-1-0) la majorité du combat, bascule ponctuelle sur WEP pour les salves |
| Dureté de coque                | 70, parmi les plus élevées du jeu (le maximum est 75) : seules les armes à forte pénétration (section 3.7) y portent à plein |
| Prix du châssis nu             | 187 969 450 Cr (Core Dynamics) + rang Fédération « Rear Admiral » requis — EDCD/coriolis-data, `ships/federal_corvette.json`, champ `retailCost`, commit 0db9234b5b9c |
| Source                        | Configuration « tank » de référence pour CZ haute intensité relayée par la communauté PvE (forums, Coriolis, EDSY) |

> **Correction apportée le 10 septembre 2026.** La révision précédente décrivait « au moins quatre affûts Large
> utilisés » et trois multi-canons Large. Le châssis ne porte qu'**un seul** affût Large ; ses deux plus gros affûts
> sont de taille **Huge**. La répartition réelle est : 2× Huge + 1× Large + 2× Medium + 2× Small.

**Build C — Fer-de-Lance « Longue Portée » (Sniper longue portée)**

| Emplacement                        | Choix                                                                 |
|---------------------------------------|--------------------------------------------------------------------------|
| Hardpoints (1× Huge + 4× Medium)       | 1× Plasma Accelerator Huge fixe, G5 « Long range » (le seul affût Huge du châssis) + 2× Rail guns Medium fixes + 2× Multi-canons Medium gimbal |
| Distributeur                          | G5 « Recharge prioritaire » orienté WEP (consommation élevée des rail guns/canons) |
| Bouclier                              | Bi-weave, G5 « Blindé » + boosters — survie par la distance plutôt que le tank pur |
| Pips typiques                         | WEP dominant (0-1-3 ou 0-0-4 hors boost), bascule ENG au repositionnement |
| Renforts                              | Aucun emplacement militaire sur ce châssis : les HRP consomment des emplacements internes ordinaires |
| Dureté de coque                       | 70, identique à celle du Federal Corvette malgré un châssis bien plus léger |
| Prix du châssis nu                    | 51 567 040 Cr (Zorgon Peterson, l'un des vaisseaux moyens les plus chers du jeu) — EDCD/coriolis-data, `ships/fer_de_lance.json`, champ `retailCost`, commit 0db9234b5b9c |
| Source                                | Configuration sniper de référence reprise dans la plupart des guides communautaires de PvP Fer-de-Lance |

> **Correction apportée le 10 septembre 2026.** La révision précédente annonçait « 3× Large + 2× Medium » et des rail
> guns en taille Large. Le châssis porte en réalité 1× Huge + 4× Medium, et le Rail Gun n'existe qu'en tailles Small
> et Medium dans le jeu de données (section 3.7) : un rail gun Large est impossible à monter.

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

## Synthèse du combat spatial : pips, FA off, chaleur, armes, crime et builds

| Élément         | À retenir                                                                                                                             |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| Pips              | 4 pips à répartir entre SYS/ENG/WEP ; adapter dynamiquement selon la phase du combat                                                  |
| FA off            | Compétence clé du dogfight avancé ; base de la manœuvre du flick                                                                      |
| Chaleur           | Gérer via heat sinks et silent running ; éviter la surchauffe des modules                                                             |
| Renforts          | Bulkheads/HRP pour la coque, MRP pour les modules internes ; complète le shield tank pour un profil hull tank                          |
| Armes             | Fixe = DPS max mais précision manuelle ; gimbal = confort mais contré par le chaff ; tourelle = pour les gros vaisseaux peu maniables |
| Calcul des dégâts | Trois filtres : bouclier, puis pénétration de blindage contre dureté de coque, puis résistances de coque — voir 3.6 |
| Pénétration       | De 1 (Cytoscrambler) à 10 000 (Torpedo Pylon) ; plasma, rail gun et Gauss percent les 47 coques publiées par la source — voir 3.7 |
| Types de dégâts   | Thermique contre les boucliers, cinétique contre la coque, explosif contre les modules, absolu insensible aux résistances — voir 3.8 |
| Interdiction      | Résister (mini-jeu) ou se soumettre ; mass lock immobilise ; low/high wake trahissent la destination d'une cible en fuite             |
| PvE               | RES/HazRES et CNB pour la chasse aux primes ; CZ pour le combat de masse et la réputation de faction                                  |
| PvP               | Maîtrise du FA off, lecture du build adverse, coordination d'escadre                                                                  |
| Rang & modes      | Harmless → Elite puis Elite I à Elite V (score pondéré, pas un compteur de kills) ; Open/Groupe privé/Solo selon le risque PvP ; CQC séparé |
| Crime             | Bounty vouchers à encaisser en station ; Interstellar Factors pour les primes hors système ; notoriety qui ne se paie pas             |
| Builds            | Interceptor (vitesse), brawler (tank), sniper (portée), multi-rôle (polyvalence) — voir builds chiffrés en 8.5                        |
| Ingénierie        | G5 sur distributeur, bouclier et arme principale : prérequis pour le combat de haut niveau                                            |
| AX                | Interceptors à hearts + essaim, nuages caustiques ; état du front à vérifier en direct, pas figé dans ce guide                         |

---

## Voir aussi

- [Lore et chronologie](./01-lore.md) — contexte narratif de l'invasion thargoïde et des Titans.
- [Ingénieurs](./06-ingenieurs.md) — modifications G1-G5 et matrice complète des effets expérimentaux résumés en 3.3.
- [Équipements](./04-equipements.md) — prix, masses et consommations des modules, et résistances chiffrées des bulkheads par vaisseau.
- [Vaisseaux](./03-vaisseaux.md) — fiches techniques des 48 châssis du jeu, dont la dureté de coque des 47 que publie
  EDCD/coriolis-data, référence de la section 3.6.
- [Combat anti-Thargoïde (AX) approfondi](./25-combat-ax.md) — builds AX dédiés, escadrons et procédures de défense de système.
- [Wings, Multicrew et CQC](./23-jeu-en-groupe.md) — coordination d'escadre en combat et détail du mode CQC.
- [Escadrons de joueurs (Squadrons)](./22-squadrons.md) — organisation de groupes de combat à grande échelle.
- [Le Background Simulation (BGS)](./21-bgs.md) — impact des Combat Zones et du crime sur l'état des factions.
- [Community Goals](./24-community-goals.md) — objectifs communautaires de combat et de sécurité.
- [Porte-vaisseaux de joueur (Fleet Carriers)](./19-fleet-carriers.md) — logistique de combat en flotte, ravitaillement avancé.
- [Outils](./16-outils.md) — Coriolis, EDSY et autres outils de configuration pour valider tout build chiffré ci-dessus.
- [Glossaire](./00-glossaire.md) — sigles courants (HRP, MRP, AX, CZ, RES…) utilisés dans ce guide.
- [Débuter et progresser](./27-debuter-et-progresser.md) — monter le rang de combat (Harmless → Elite) efficacement :
  zones de conflit haute intensité contre missions d'assassinat de cibles élevées, et ce qui reste non publié par
  Frontier sur les seuils exacts.

---

## Sources

- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://canonn.science/
- https://www.edsm.net/en/
- https://www.spansh.co.uk/
- EDCD/coriolis-data, commit `0db9234b5b9ce8c939ea84133d7ce336eea88e27` — `ships/` (47 fiches de vaisseau, dont
  `properties.hardness` et `bulkheads`), `modules/hardpoints/` (`piercing`, `damagedist`), `modifications/`
  (`blueprints.json`, `specials.json`, `modules.json`, `modifications.json`) et `spec/data-spec.js`.
- EDCD/FDevIDs, commit `c35612952dd6a547d1a7ac4cffab9c7051e86579` — `outfitting.csv` (noms d'affichage des armes) et
  `combatrank.csv` (échelle nominale du rang de combat).

> **Ce que cette révision a pu vérifier, et ce qu'elle n'a pas pu vérifier.** Les chiffres ajoutés le 10 septembre 2026
> — pénétration de blindage arme par arme, répartition des types de dégâts, dureté de coque des châssis, profils de
> résistance des blindages, prix de châssis, échelle des rangs de combat, compatibilité des blueprints et des effets
> expérimentaux — proviennent des deux dépôts de données ci-dessus, clonés en local et cités avec leur commit : ils
> sont re-vérifiables ligne à ligne dans dix ans, indépendamment de la disponibilité d'un site web. Trois choses
> restent hors de portée de ces sources et sont signalées comme telles dans le corps du guide : le **coefficient exact**
> de réduction des dégâts entre pénétration et dureté (section 3.6), la **règle de calcul** appliquée aux dégâts
> absolus et au marqueur anti-xéno (section 3.8), et les **seuils de progression** du rang de combat (section 6.1).
> Aucune valeur n'a été inventée pour combler ces trois lacunes.

> **Ce qui reste volatile.** Les mécaniques décrites ici (pips, FA off, chaleur, types d'affûts, sites PvE,
> interdiction, mass lock) forment le socle du système de combat depuis de nombreuses années. En revanche, les valeurs
> d'équilibrage (dégâts par seconde comparés, montants de bounty vouchers, état courant du front thargoïde) évoluent au
> gré des correctifs de Frontier Developments et des extensions successives, et un jeu de données communautaire suit
> ces changements avec un décalage. Avant de finaliser un build compétitif, croisez toujours ce guide avec les notes de
> version les plus récentes et un outil de configuration à jour (type Coriolis ou EDSY, voir
> [16-outils.md](./16-outils.md)), ainsi qu'avec les discussions communautaires actuelles (forums Frontier, wiki
> communautaire, r/EliteDangerous).
