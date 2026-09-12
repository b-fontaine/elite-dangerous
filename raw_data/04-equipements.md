---
id: 04-equipements
titre: "Liste complète des équipements dans Elite Dangerous"
domaine: vaisseaux-equipement
entites: [Bulkheads, Hull Reinforcement Package, Module Reinforcement Package, Shield Booster,
  Frame Shift Drive (SCO), Guardian FSD Booster, Frame Shift Wake Scanner, Manifest Scanner, Vessel Hangar,
  Mk II Biological Scanner, MercGear, Guardian Technology Broker, Prismatic Shield Generator,
  Power Plant, Thrusters, Power Distributor, Life Support, Sensors, Fuel Tank, Fuel Scoop,
  Shield Cell Bank, Bi-Weave Shield Generator, Auto Field-Maintenance Unit, Refinery,
  Frame Shift Drive Interdictor, Cargo Rack, Meta Alloy Hull Reinforcement, Pulse Laser,
  Burst Laser, Beam Laser, Multi-Cannon, Fragment Cannon, Rail Gun, Plasma Accelerator,
  Plasma Shock Cannon, Guardian Gauss Cannon, Guardian Plasma Charger, Guardian Shard Cannon,
  Mirrored Surface Composite, Reactive Surface Composite, Military Grade Composite]
mots_cles_en: [outfitting, hardpoint, hull reinforcement package, module reinforcement package, shield booster,
  frame shift drive SCO, guardian fsd booster, frame shift wake scanner, vessel bay, limpet controller,
  increased range, merc coin, power plant, thrusters, power distributor, life support, sensors,
  fuel tank, fuel scoop, shield cell bank, bi-weave, prismatic, auto field maintenance unit, refinery,
  fsd interdictor, cargo rack, meta alloy, pulse laser, burst laser, beam laser, multi-cannon,
  fragment cannon, rail gun, plasma accelerator, shock cannon, gauss cannon, shard cannon,
  damage per second, distributor draw, armour hardness, bulkhead cost, module price, power draw]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-12
confiance_globale: haute
volatilite: moyenne
sources_primaires:
  - "EDCD/coriolis-data — ships/*.json, modules/standard/*.json, modules/internal/*.json et
    modules/hardpoints/*.json, commit 0db9234b5b9ce8c939ea84133d7ce336eea88e27"
  - "EDCD/FDevIDs — outfitting.csv, shipyard.csv et material.csv, commit c35612952dd6a547d1a7ac4cffab9c7051e86579"
  - "EDCD/coriolis — Calculations.js"
  - "Steam News Frontier (appid 359320) — annonces officielles 2026"
  - "Catalogues d'ingénierie et de matériaux hors ligne, édition 2026-08"
  - "Étude interne du 19 août 2026"
  - "Wikipedia EN"
  - "Inara.cz"
zones_incertaines: ["table des masses optimales de FSD au grade 5 dérivée par calcul (×1,55), non relevée en jeu",
  "non-modifiabilité par l'ingénierie des attributs propres au SCO, établie via un mappage EDSY portant un TODO verify",
  "fabricants du Taipan Fighter et du Gu-97, association communautaire non revérifiée sur source primaire",
  "statistiques précises (PV, vitesse, DPS) des quatre chasseurs embarqués, non sourçables",
  "compromis chiffrés des modules MercGear, non publiés dans les notes de version",
  "colonnes Cadence et DPS brut du référentiel des armes, dérivées par calcul depuis fireint et damage,
    aucun champ rof ni dps n'existant dans la source",
  "masse du Mirrored Surface Composite du Diamondback Explorer (26 t contre 47 t pour ses autres grades
    lourds), anomalie présente telle quelle dans EDCD/coriolis-data",
  "emplacements des stations hébergeant les Brokers Guardian et Human, évolutifs",
  "appariement des deux variantes pré-ingénierées de Hpt_BasicMissileRack_Fixed_Medium avec les trois noms
    MercGear que outfitting.csv porte pour cet identifiant (Drag, Lightweight Thermal et Lockdown Seeker
    Missile Rack) : indécidable sur source reproductible"]
guides_lies: [3, 5, 6, 8, 10, 13, 14, 17, 20, 25, 30]
---

# Liste complète des équipements dans Elite Dangerous

## En bref

Un vaisseau d'Elite Dangerous se personnalise en installant des **modules** (*outfitting*) dans quatre familles
d'emplacements : standards, internes optionnels, points d'ancrage d'armes (*hardpoints*) et utilitaires. Les modules
internes vont de la **classe 1 à 8** et de la **notation A à E**, complétées par les notations F à I des modules
restreints ; les hardpoints existent en Small, Medium, Large et Huge, sur montage fixe (*fixed*), gyrostabilisé
(*gimballed*) ou tourelle (*turreted*). Ce guide porte le référentiel chiffré du corpus : **vingt et une tables de
modules** donnant masse, intégrité, consommation en **MW**, statistique propre à la famille et prix en **crédits**, de
la centrale aux limpets, et **huit tables d'armes** donnant dégâts par tir, cadence, DPS dérivé, charge thermique,
portée, pénétration et prix — près de mille lignes tirées d'EDCD/coriolis-data. Le blindage de coque (*bulkheads*)
compte cinq grades, les trois plus lourds apportant tous **+250 %** d'intégrité ; résistances, masse et prix sont
chiffrés pour les **47 châssis** du jeu. Un bouclier applique nativement **+40 %** de résistance cinétique, **+50 %**
explosive et **−20 %** thermique.

## Introduction — familles de modules et circuits d'acquisition

Dans *Elite Dangerous*, chaque vaisseau se personnalise en installant des **modules** dans des emplacements dédiés :
emplacements standards (senseurs, coque, propulseurs, centrale électrique, distributeur d'énergie, FSD, réservoir de
carburant), emplacements internes optionnels, points d'ancrage d'armes (hardpoints) et emplacements utilitaires. Ce
guide recense l'ensemble des familles de modules disponibles, leurs classes et notations, ainsi que les circuits
d'acquisition : chantiers navals classiques, ingénieurs, Guardian Technology Broker, Human Technology Broker et
récompenses Powerplay.

> **Note sur les statistiques.** Sauf mention contraire, les valeurs chiffrées de ce guide (résistances, portée de
> saut, bonus de coque, capacités de bouclier, etc.) sont données en **configuration stock** (modules non modifiés).
> L'ingénierie (voir [06-ingenieurs.md](./06-ingenieurs.md)) peut modifier ces valeurs de façon significative, à la
> hausse comme à la baisse selon le blueprint et l'effet expérimental choisis.

## 1. Comprendre les classes, notations et montages

### 1.1 Classe et taille des modules (classes 1 à 8, hardpoints Small à Huge)

- **Modules internes et standards** (boucliers, centrales électriques, FSD, senseurs, soutes, distributeurs,
  propulseurs, etc.) : classés de **Class 1 à Class 8**, la classe la plus élevée correspondant à la plus grande
  capacité mais aussi au poids et au coût les plus importants.
- **Points d'ancrage d'armes (hardpoints)** : quatre tailles — **Small (1)**, **Medium (2)**, **Large (3)**, **Huge (
  4)** — qui déterminent les armes pouvant y être montées.
- **Emplacements utilitaires** : taille **0**, dédiés aux modules légers (contre-mesures, boosters de bouclier, scanners
  passifs).

### 1.2 Notation des modules (rating A à E, et les cas F, G, H, I)

Les modules portent une lettre de **A** (meilleures performances, généralement plus lourd et plus cher) à **E**
(performances les plus faibles, léger et bon marché). Des notations spéciales existent pour des modules à disponibilité
restreinte ou technologiquement particuliers :

| Notation | Signification typique                                                                                          |
|----------|----------------------------------------------------------------------------------------------------------------|
| A – E    | Échelle standard de performance (magasins/chantiers navals et ingénieurs)                                      |
| F, G     | Modules à disponibilité restreinte ou de rareté intermédiaire (ex. certaines armes Powerplay)                  |
| H        | Modules uniques à exemplaire limité par vaisseau (ex. Guardian FSD Booster)                                    |
| I        | Modules utilitaires ou d'exploration spécialisés (ex. Detailed Surface Scanner, lance-chaff, point de défense) |

Certains modules dérogent à la hiérarchie standard A > B > C > D > E : le **Hull Reinforcement Package**, le
**Module Reinforcement Package** et la **baie de vaisseau** (ex-Fighter Hangar, voir sections 3.2, 3.3 et 13)
n'existent par exemple qu'en notations D et/ou E, D étant alors la meilleure des deux — ne pas présumer qu'une
notation D ou E est automatiquement inférieure sans vérifier la fiche du module concerné.

### 1.3 Types de montage des armes : fixe, gyrostabilisé, tourelle

| Montage                       | Fonctionnement                                           | Avantage                                             | Inconvénient                               |
|-------------------------------|----------------------------------------------------------|------------------------------------------------------|--------------------------------------------|
| **Fixe (Fixed)**              | Tire dans l'axe du vaisseau, visée manuelle              | Dégâts maximaux, meilleure précision théorique       | Exige un alignement précis avec la cible   |
| **Gyrostabilisé (Gimballed)** | Verrouille automatiquement une cible dans un cône limité | Bon compromis précision/facilité d'usage             | Dégâts réduits par rapport au fixe         |
| **Tourelle (Turreted)**       | Tir automatique omnidirectionnel                         | Ne nécessite aucun alignement, utile en multi-cibles | Dégâts les plus faibles des trois montages |

### 1.4 Priorité d'alimentation des modules (Power Priority)

Chaque module installé se voit assigner, dans le panneau des modules du vaisseau, une **priorité d'alimentation**
allant de **1** (priorité la plus haute) à **5** (priorité la plus basse). Cette priorité détermine l'ordre dans
lequel les modules sont coupés lorsque la centrale électrique ne peut plus fournir assez d'énergie pour alimenter
l'ensemble du vaisseau — par exemple après un endommagement sévère de la centrale électrique, lors d'une panne
provoquée par une arme adverse, ou en cas de surcharge du distributeur d'énergie.

- Le jeu coupe l'alimentation en partant de la **priorité 5** (coupée en premier) vers la **priorité 1** (coupée en
  dernier), jusqu'à ce que la charge redevienne soutenable.
- **Life Support** et **Power Distributor** sont fixés par défaut en **priorité 1** et ne peuvent pas être désactivés
  manuellement — avec la centrale électrique elle-même, ce sont les modules garantis de rester actifs le plus
  longtemps possible.
- En pratique, beaucoup de pilotes placent en priorité haute (1–2) le distributeur d'énergie, le générateur de
  bouclier et le FSD ; et en priorité basse (4–5) la baie de chasseur, l'écope à carburant ou d'autres modules non
  vitaux au combat — afin que ces derniers soient les premiers sacrifiés en cas de sous-alimentation.

La priorité se règle module par module dans l'écran « Modules » du vaisseau, indépendamment de l'activation/désactivation
manuelle d'un module (fonction distincte, accessible séparément).

## 2. Armes (Hardpoints)

Cette section décrit ce que chaque famille d'armes fait et où l'obtenir ; les valeurs chiffrées arme par arme —
dégâts par tir, cadence, DPS, type de dégâts, charge thermique, portée, pénétration, masse et prix — sont réunies plus
bas dans le [Référentiel chiffré des armes](#référentiel-chiffré-des-armes--dégâts-cadence-portée-et-consommation).

### 2.1 Armes à énergie (laser)

| Arme                          | Montages               | Tailles      | Particularité / obtention                                                         |
|-------------------------------|------------------------|--------------|-------------------------------------------------------------------------------------|
| **Pulse Laser**               | Fixe / Gyro / Tourelle | 1–4          | Arme de base, bon marché, disponible dans toute station avec chantier naval       |
| **Burst Laser**               | Fixe / Gyro / Tourelle | 1–4          | Tirs en rafale, DPS supérieur au Pulse Laser, portée/précision réduites           |
| **Beam Laser**                | Fixe / Gyro / Tourelle | 1–4          | Faisceau continu, DPS élevé, forte consommation d'énergie/chaleur, sans munitions |
| **Mining Laser**              | Fixe / Tourelle        | 1–2          | Extraction de minerai en surface, pas d'usage offensif                            |
| **Cytoscrambler Burst Laser** | Fixe                   | 1 (rating F) | Burst Laser très courte portée, DPS extrême — récompense **Powerplay**            |
| **Retributor Beam Laser**     | Fixe                   | 1 (rating E) | Effet thermique renforcé — récompense **Powerplay**                               |
| **Pulse Disruptor Laser**     | Fixe                   | 2 (rating E) | Effet de perturbation de bouclier/décharge — récompense **Powerplay**             |
| **Mining Lance**              | —                      | 1 (rating D) | Variante avancée du Mining Laser — récompense **Powerplay**                       |

### 2.2 Armes cinétiques (balistiques)

| Arme                                  | Montages               | Tailles      | Particularité / obtention                                                 |
|---------------------------------------|------------------------|--------------|-----------------------------------------------------------------------------|
| **Cannon**                            | Fixe / Gyro / Tourelle | 1–4          | Gros dégâts par tir, cadence lente, forte pénétration                     |
| **Multi-Cannon**                      | Fixe / Gyro / Tourelle | 1–4          | Cadence élevée, DPS soutenu, efficace contre boucliers moyens et coque    |
| **Advanced Multi-Cannon**             | Fixe                   | 1–2          | Munitions améliorées                                                      |
| **Fragment Cannon (« Frag Cannon »)** | Fixe / Gyro / Tourelle | 1–3          | Dégâts de zone à courte portée, redoutable contre la coque à bout portant |
| **Rail Gun**                          | Fixe uniquement        | 1–2          | Tir chargé, très haute pénétration modulaire                              |
| **Abrasion Blaster**                  | Fixe / Tourelle        | 1            | Arme minière dédiée à l'extraction de surface                             |
| **Concord Cannon**                    | Gyro                   | 2 (rating D) | Variante Cannon en rafale — récompense **Powerplay**                      |
| **Enforcer Cannon**                   | Fixe                   | 1 (rating F) | Multi-Cannon renforcé — récompense **Powerplay**                          |
| **Pacifier Frag-Cannon**              | Fixe                   | 3 (rating C) | Portée accrue — récompense **Powerplay**                                  |
| **Imperial Hammer Rail Gun**          | Fixe                   | 2 (rating B) | Tir en rafale — récompense **Powerplay**                                  |

### 2.3 Armes à plasma (Plasma Accelerator, Plasma Shock Cannon)

| Arme                             | Montages               | Tailles      | Particularité / obtention                                                                      |
|----------------------------------|------------------------|--------------|--------------------------------------------------------------------------------------------------|
| **Plasma Accelerator**           | Fixe uniquement        | 2–4          | Dégâts très élevés par tir, forte consommation énergétique, efficace contre les gros vaisseaux |
| **Plasma Shock Cannon**          | Fixe / Gyro / Tourelle | 1–3          | Arme plasma « légère » à tir rapide                                                            |
| **Advanced Plasma Accelerator**  | Fixe                   | 3 (rating B) | Récompense **Powerplay**                                                                       |

### 2.4 Missiles, torpilles et mines

- **Seeker Missile Rack** (Fixe, guidage à tête chercheuse, tailles 1–3).
- **Dumbfire Missile Rack** (Fixe, non guidé, tailles 1–3) et sa variante **Advanced Missile Rack** (tailles 1–2).
- **Enzyme Missile Rack** (Fixe, taille 2, rating B) — dégâts caustiques, efficace contre les coques Thargoïdes.
- **Torpedo Pylon** (Fixe, guidage seeker, tailles 1–3) — très gros dégâts, ignore une partie du bouclier, munitions
  limitées et coûteuses.
- **Mine Launcher** (Fixe, tailles 1–2) et **Shock Mine Launcher** (variante à impulsion).
- **Remote Release Flak Launcher** et **Remote Release Flechette Launcher** (Fixe/Tourelle, taille 2) — armes
  anti-canons de mine/anti-interceptes liées au contenu de la guerre Thargoïde.
- **Pack-Hound Missile Rack** (Fixe, taille 2, essaim de missiles) — récompense **Powerplay**.
- **Rocket Propelled FSD Disruptor** (« Lasso », Fixe, taille 2) — désactive temporairement le FSD de la cible —
  récompense **Powerplay**.

### 2.5 Armes minières spécialisées (charges sismiques et missiles de sous-surface)

- **Sub-Surface Displacement Missile** (Fixe/Tourelle, tailles 1–2)
- **Seismic Charge Launcher** (Fixe/Tourelle, taille 2)
- **Sub-Surface Extraction Missile** (Fixe, taille 2)

Cette famille est dédiée au minage de surface et de sous-surface (astéroïdes et corps planétaires), en complément du
Mining Laser et de l'Abrasion Blaster. Pour la stratégie de minage complète (gisements, rendement, contrôleurs de
limpets associés), voir [20-minage.md](./20-minage.md).

### 2.6 Armes anti-xéno ([AX](./00-glossaire.md)) — Human Technology Broker

| Arme                                  | Montages               | Tailles        | Obtention                                                                                                                                |
|----------------------------------------|------------------------|----------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| **AX Multi-Cannon**                   | Fixe / Tourelle        | 2–3            | Chantiers navals liés à Aegis                                                                                                            |
| **Enhanced AX Multi-Cannon (« V2 »)** | Fixe / Gyro / Tourelle | 2–3            | **Human Technology Broker**                                                                                                              |
| **AX Missile Rack**                   | —                      | —              | Chantiers navals liés à Aegis                                                                                                            |
| **Enhanced AX Missile Rack (« V2 »)** | —                      | —              | **Human Technology Broker**                                                                                                              |
| **Guardian Nanite Torpedo Pylon**     | Fixe                   | 2–3 (rating I) | Arme hybride Guardian/Thargoïde débloquée auprès du **Guardian Technology Broker**, combinant matériaux Guardian et matériaux Thargoïdes |

Les variantes « Enhanced » (V2) se débloquent auprès du Human Technology Broker, installations liées à l'organisation
**Aegis** dédiée à la défense anti-Thargoïde. Le déblocage combine généralement un rang de combat AX suffisant et la
fourniture de matériaux et commodités spécifiques issus de l'affrontement des Thargoïdes (composants et échantillons
récupérés en combat ou sur des sites Thargoïdes), plutôt que les matériaux d'ingénieur classiques utilisés par les
ingénieurs traditionnels. Pour l'anatomie des Interceptors et les stratégies de combat AX approfondies, voir
[25-combat-ax.md](./25-combat-ax.md).

### 2.7 Armes Guardian (technologie Précurseur)

| Arme                        | Montages        | Tailles                  | Particularité                                               |
|-----------------------------|-----------------|--------------------------|-----------------------------------------------------------------|
| **Guardian Gauss Cannon**   | Fixe            | 1–2 (D/B)                | Tir chargé à haute précision, forte pénétration de bouclier |
| **Guardian Plasma Charger** | Fixe / Tourelle | 1–3                      | Arme plasma à charge progressive                            |
| **Guardian Shard Cannon**   | Fixe / Tourelle | 1–3 (A pour la taille 2) | Nuée de fragments à courte portée                           |

Ces trois familles se débloquent auprès du **Guardian Technology Broker** (NPC dédié, présent dans certaines stations,
distinct des ingénieurs classiques), contre des matériaux et données récupérés sur les ruines et structures Guardian —
notamment Guardian Power Cell, Guardian Wreckage Components, Guardian Sentinel Wreckage Components, Guardian Obelisk
Data, ainsi que des artefacts (Casket, Orb, Urn, Tablet, Totem, Vessel) — plus un paiement en crédits. Pour les stats
de combat détaillées (DPS, dégâts alpha, charge thermique) et les sites Guardian où récupérer ces matériaux, voir
[05-guardians.md](./05-guardians.md).

### 2.8 Effets expérimentaux d'ingénierie applicables aux armes

Les **effets expérimentaux** ne sont pas des armes distinctes mais une modification de dernier niveau appliquée par un
ingénieur sur une arme existante, en complément d'un blueprint de modification classique (Overcharged, Efficient, Long
Range, Rapid Fire, etc.). Chaque arme n'accepte qu'un sous-ensemble d'effets compatibles, et chacun se paie en
matériaux.

La liste complète — quel effet s'applique à quel module, ce qu'il change et ce qu'il coûte — est tenue en un seul
endroit du corpus : [Effets expérimentaux — matrice de compatibilité, effets chiffrés et
coûts](./06-ingenieurs.md#effets-expérimentaux--matrice-de-compatibilité-effets-chiffrés-et-coûts). Ce guide-ci reste
la référence pour les caractéristiques de l'arme **avant** toute ingénierie, chiffrées dans le [Référentiel chiffré
des armes](#référentiel-chiffré-des-armes--dégâts-cadence-portée-et-consommation).

## 3. Coque et blindage (Bulkheads, HRP, MRP)

Le blindage de coque (**Bulkheads**) occupe l'unique emplacement standard dédié à l'armure (pas de « classe » au sens
habituel : un seul emplacement par vaisseau, avec 5 grades disponibles) et détermine à la fois l'intégrité totale de
la coque et sa résistance aux dégâts cinétiques, thermiques et explosifs. Il se complète, en emplacements internes
optionnels, par les **Hull Reinforcement Package ([HRP](./00-glossaire.md))** et **Module Reinforcement Package
([MRP](./00-glossaire.md))**.

### 3.1 Bulkheads — les 5 grades

Les cinq grades se distinguent par leur multiplicateur d'intégrité de coque et par leur profil de résistance. Les
trois plus lourds (**Military Grade**, **Mirrored Surface**, **Reactive Surface**) apportent tous le **même** bonus
brut d'intégrité, **+250 %** ; seul leur profil de résistance les sépare. Attention au sens de lecture : la coque nue
est nativement **vulnérable** au cinétique et à l'explosif. Le **Mirrored Surface Composite** est le blindage
anti-laser du jeu — il résiste au thermique et devient très fragile face au cinétique — et le **Reactive Surface
Composite** son exact inverse, à réserver aux coques exposées aux canons et aux missiles.

Les valeurs chiffrées — résistances par type de dégâts, bonus d'intégrité, formule de calcul de l'armure obtenue,
puis masse ajoutée et prix pour les 47 châssis du jeu — sont réunies plus bas dans [Blindage de coque (bulkheads) —
résistances et masse chiffrées par
vaisseau](#blindage-de-coque-bulkheads--résistances-et-masse-chiffrées-par-vaisseau).

### 3.2 Hull Reinforcement Package (HRP)

Module interne (classes 1 à 5, **notations D et E uniquement**) qui ajoute un bonus fixe de points de vie de coque et
une petite résistance additionnelle aux trois types de dégâts physiques.

Les dix entrées du HRP, ainsi que celles du Meta Alloy Hull Reinforcement, du MRP et des trois renforts Guardian,
sont chiffrées — PV apportés, résistances, masse, intégrité, consommation et prix — dans la table « Renforts de coque,
de module et de bouclier » du [Référentiel chiffré des modules](#référentiel-chiffré-des-modules--classe-notation-masse-consommation-et-prix).

*(Aucun bonus de résistance aux dégâts caustiques sur le HRP standard.)* Comme pour plusieurs modules
« spéciaux » du jeu, la notation **D est ici supérieure à E** (plus de PV, plus de résistance, coût environ triplé) —
l'échelle A–E habituelle (A meilleur) ne s'applique pas puisque seules D et E existent pour ce module.

### 3.3 Module Reinforcement Package (MRP)

Module interne (classes 1 à 5, **notations D et E uniquement**) qui réduit les dégâts subis par les *autres modules
internes* une fois le bouclier tombé et la coque touchée.

Ses dix entrées sont chiffrées, aux côtés des cinq autres familles de renforts, dans la table « Renforts de coque, de
module et de bouclier » du [Référentiel chiffré des modules](#référentiel-chiffré-des-modules--classe-notation-masse-consommation-et-prix).

Compromis à noter : le MRP en notation D protège deux fois mieux les autres modules,
mais possède lui-même une intégrité (PV) **plus faible** que le E de même classe — il encaisse donc moins bien un
coup direct sur son propre emplacement.

### 3.4 Renforts de coque et de module d'origine Guardian

Les renforts de coque et de module d'origine Guardian (**Guardian Hull Reinforcement**, **Guardian Module
Reinforcement**) suivent une logique de protection similaire mais se débloquent exclusivement auprès du Guardian
Technology Broker — voir section 14 « Modules Guardian » pour leur détail et leurs conditions de déblocage.

## 4. Boucliers et générateurs de bouclier

Masse optimale, multiplicateurs, régénération, consommation et prix des générateurs, des Shield Cell Banks et des
Shield Boosters : voir les tables correspondantes du [Référentiel chiffré des modules](#référentiel-chiffré-des-modules--classe-notation-masse-consommation-et-prix) et du [Référentiel chiffré des
armes](#référentiel-chiffré-des-armes--dégâts-cadence-portée-et-consommation) pour le Shield Booster, monté en
emplacement utilitaire.

| Module                            | Tailles        | Notation | Caractéristique                                                           | Obtention                      |
|-------------------------------------|----------------|----------|-----------------------------------------------------------------------------|------------------------------------|
| **Shield Generator**              | 1–8            | A–E      | Bouclier standard, régénération normale                                   | Chantier naval                 |
| **Bi-Weave Shield Generator**     | 1–8            | C (fixe) | Régénération plus rapide, capacité totale plus faible                     | Chantier naval                 |
| **Prismatic Shield Generator**    | 1–8            | A        | Capacité maximale, régénération plus lente, consommation d'énergie élevée | **Powerplay** (rang élevé)     |
| **Shield Cell Bank**              | 1–8            | A–E      | Recharge d'urgence via des cellules consommables                          | Chantier naval                 |
| **Shield Booster**                | 0 (utilitaire) | A–E      | Augmente la capacité totale du bouclier ; plusieurs cumulables            | Chantier naval / ingénieur     |
| **Guardian Shield Reinforcement** | 1–5            | D/E      | Ajoute de la capacité de bouclier brute                                   | **Guardian Technology Broker** |

### 4.1 Résistances de base d'un bouclier (cinétique, thermique, explosif)

Quel que soit son type (Shield Generator, Bi-Weave, Prismatic), sa classe ou sa notation, un bouclier standard
applique toujours le **même profil de résistance de base** aux trois types de dégâts physiques :

| Résistance Cinétique | Résistance Thermique | Résistance Explosive |
|-----------------------|-----------------------|------------------------|
| +40 %                  | −20 %                  | +50 %                   |

Autrement dit, un bouclier encaisse nativement très bien le cinétique et l'explosif, mais est **plus vulnérable aux
dégâts thermiques** (lasers) — il subit 20 % de dégâts thermiques *en plus*, avant application des résistances
supplémentaires apportées par l'ingénierie ou certains Shield Boosters. *(Source : EDCD/coriolis-data — valeurs
identiques sur Shield Generator, Bi-Weave Shield Generator et Prismatic Shield Generator, sur toutes classes et
notations.)*

### 4.2 Cumul des Shield Boosters et rendement décroissant

Chaque Shield Booster ajoute un bonus de capacité selon sa notation :

| Notation | Bonus de capacité |
|----------|------------------------|
| E        | +4 %                    |
| D        | +8 %                    |
| C        | +12 %                   |
| B        | +16 %                   |
| A        | +20 %                   |

- **Capacité brute (PV de bouclier) :** ce bonus s'additionne intégralement pour chaque booster installé (jusqu'à 8
  emplacements utilitaires selon le vaisseau). *Capture le 9 septembre 2026, d'après le code source du calculateur
  communautaire open source Coriolis (dépôt `EDCD/coriolis`, fichier `Calculations.js`) : le cumul de capacité brute
  n'est actuellement soumis à **aucun rendement décroissant** en jeu — un commentaire explicite du code source
  indique "Diminishing returns not currently in-game" ; à revérifier en jeu ou sur les notes de mise à jour Frontier
  en cas de changement futur.*
- **Résistances aux dégâts (via ingénierie) :** en revanche, lorsque des Shield Boosters *ingénierés* (avec un effet
  expérimental de résistance) sont combinés entre eux et avec le générateur de bouclier, le moteur du jeu applique un
  **rendement décroissant** sur le multiplicateur de dégâts combiné : passé un certain seuil de résistance cumulée
  (au-delà d'environ 30 % de réduction supplémentaire par rapport au générateur seul), chaque point de résistance
  additionnel rapporte proportionnellement de moins en moins. Ce comportement, répliqué fidèlement dans le
  calculateur Coriolis (fonction `diminishingReturnsShields`), explique pourquoi empiler de nombreux boosters
  identiques porteurs d'un effet de résistance rapporte de moins en moins passé les tout premiers exemplaires.

Pour construire un build de bouclier chiffré (« tankiness » réelle en situation de combat), voir la section builds de
[08-combat-spatial.md](./08-combat-spatial.md).

## 5. Propulseurs (Thrusters)

Masse optimale, masse maximale, consommation et prix classe par classe : voir la table « Propulseurs (Thrusters) » du
[Référentiel chiffré des modules](#référentiel-chiffré-des-modules--classe-notation-masse-consommation-et-prix).

- **Thrusters standards** (tailles 2–8, notations A–E) : déterminent vitesse et maniabilité en vol normal ; disponibles
  en chantier naval.
- **Enhanced Performance Thrusters** (tailles 2–3, notation A) : variante plus rapide, obtenue par ingénierie (Felicity
  Farseer) plutôt qu'en magasin.

Les propulseurs bénéficient fortement des modifications d'ingénieur **Dirty Drive Tuning** et **Clean Drive Tuning**
(proposées par Felicity Farseer), qui augmentent respectivement la vitesse brute ou l'efficacité énergétique/thermique.

## 6. Centrales électriques (Power Plants)

Production en MW, efficacité thermique et prix classe par classe : voir la table « Centrale électrique (Power
Plant) » du [Référentiel chiffré des modules](#référentiel-chiffré-des-modules--classe-notation-masse-consommation-et-prix).

| Module                          | Tailles | Notation | Caractéristique                                                                                                   | Obtention                      |
|-----------------------------------|---------|----------|-----------------------------------------------------------------------------------------------------------------------|-------------------------------------|
| **Power Plant** standard        | 2–8     | A–E      | Alimente l'ensemble des modules ; le rating impacte fortement signature thermique et masse                        | Chantier naval                 |
| **Guardian Hybrid Power Plant** | 2–8     | A        | Combine technologie humaine et Guardian ; faible signature thermique, s'intègre bien avec le Guardian FSD Booster | **Guardian Technology Broker** |

## 7. Distributeurs d'énergie (Power Distributors)

Capacités et taux de recharge SYS, ENG et WEP, classe par classe, avec prix : voir la table « Distributeur d'énergie
(Power Distributor) » du [Référentiel chiffré des modules](#référentiel-chiffré-des-modules--classe-notation-masse-consommation-et-prix).

| Module                                | Tailles | Notation | Caractéristique                      | Obtention                      |
|------------------------------------------|---------|----------|------------------------------------------|-------------------------------------|
| **Power Distributor** standard        | 1–8     | A–E      | Gère la répartition SYS/ENG/WEP      | Chantier naval                 |
| **Guardian Hybrid Power Distributor** | 1–8     | A        | Capacité de distributeur plus élevée | **Guardian Technology Broker** |

## 8. Senseurs et modules de détection

- **Sensors** (module interne standard, tailles 1–8, notations A–E) — détermine la portée de détection des autres
  vaisseaux et l'affichage radar/HUD.
- **Kill Warrant Scanner** (utilitaire) — révèle les primes actives sur une cible dans d'autres juridictions.
- **Manifest Scanner**, anciennement **Cargo Scanner** (utilitaire) — analyse le contenu de soute (et, depuis Odyssey,
  des cabines passagers) d'un vaisseau cible ; ce n'est pas un module distinct du Cargo Scanner mais son nom actuel en
  jeu — voir [30-piraterie-et-pvp.md §2](./30-piraterie-et-pvp.md#2-les-scanners-de-piraterie--un-seul-module-renommé-pas-quatre).
- **Frame Shift Wake Scanner** (utilitaire) — détecte la destination d'un vaisseau ayant sauté récemment.
- **Pulse Wave Analyser** (utilitaire) — détection de sites de minage sur les astéroïdes.
- **Xeno Scanner**, **Enhanced Xeno Scanner**, **Pulse Wave Xeno Scanner** (utilitaires) — analyse et diagnostic des
  structures et vaisseaux Thargoïdes.

## 9. Soutes (Cargo) et réservoirs

Capacités en tonnes et prix classe par classe : voir les tables « Soutes (Cargo Rack) » et « Réservoirs de carburant
(Fuel Tank) » du [Référentiel chiffré des modules](#référentiel-chiffré-des-modules--classe-notation-masse-consommation-et-prix).

| Module                             | Tailles | Notation | Caractéristique                                                               |
|---------------------------------------|---------|----------|-----------------------------------------------------------------------------------|
| **Cargo Rack**                     | 1–8     | E        | Capacité de fret standard                                                     |
| **Corrosion Resistant Cargo Rack** | 1 et 4  | E/F      | Protège certaines marchandises corrosives (matériaux Thargoïdes, exobiologie) |
| **Fuel Tank** additionnel          | 1–8     | C        | Réservoir de carburant supplémentaire                                         |

## 10. Contrôleurs de limpets

Les limpets sont des drones jetables lancés depuis un vaisseau pour automatiser diverses tâches (minage, collecte,
piratage, ravitaillement, réparation, etc.). Chaque fonction nécessite un **contrôleur de limpets** dédié, installé
en emplacement interne de **classe impaire uniquement (1, 3, 5 ou 7)**, et consomme des munitions de limpets stockées
dans une soute de cargo dédiée. Masse, consommation, nombre de limpets simultanés, portée, durée de vie et prix pour
les 120 contrôleurs du jeu : voir les tables « Contrôleurs de limpets » du [Référentiel chiffré des modules](#référentiel-chiffré-des-modules--classe-notation-masse-consommation-et-prix).

| Contrôleur          | Tailles       | Notations      | Limpets actifs simultanés (classe 7, meilleure notation) | Fonction                                                                    |
|-----------------------|---------------|------------------|----------------------------------------------------------------|-----------------------------------------------------------------------------|
| **Collector**         | 1, 3, 5, 7    | A–E              | 4                                                                | Collecte automatiquement canisters et fragments d'astéroïdes éjectés       |
| **Prospector**        | 1, 3, 5, 7    | A–E              | 8                                                                | Analyse la composition d'un astéroïde avant extraction (minage)            |
| **Hatch Breaker**     | 1, 3, 5, 7    | A–E              | jusqu'à 18 (notations B et E)                                    | Force l'éjection de cargo depuis la soute d'un vaisseau ciblé (piraterie)   |
| **Fuel Transfer**     | 1, 3, 5, 7    | A–E              | 8                                                                | Transfère 1 tonne de carburant vers un vaisseau ciblé                       |
| **Repair**            | 1, 3, 5, 7    | A–E              | 4                                                                | Répare une partie des dégâts de coque d'un vaisseau ciblé                   |
| **Recon**             | 1, 3, 5, 7    | E uniquement     | 1                                                                 | Pirate à distance des points de données (data points)                      |
| **Decontamination**   | 1, 3, 5, 7    | E uniquement     | 4                                                                 | Retire les dégâts caustiques (Thargoïdes) et répare légèrement la coque    |

*(Source : EDCD/coriolis-data.)* Sur le **Hatch Breaker**, le nombre de limpets actifs ne suit pas l'ordre habituel
des notations : les notations **B et E** permettent d'en déployer davantage que **A, C ou D** à classe égale — une
notation plus chère n'y augmente pas la quantité de limpets, seulement la portée et le temps de charge.

Il existe également un **Mining Multi Limpet Controller** (classes 3/5/7, notations A–E, jusqu'à 14 limpets actifs en
classe 7) qui combine les fonctions Collector et Prospector dans un seul emplacement — pratique pour des
configurations de minage compactes. Pour les stratégies de minage complètes (types de gisements, lasers vs Abrasion
Blaster, rendement horaire), voir [20-minage.md](./20-minage.md) ; pour l'usage en soutien logistique de flotte
(Fuel Transfer, Repair), voir aussi [19-fleet-carriers.md](./19-fleet-carriers.md).

## 11. Modules d'exploration : FSD, scanners et modules associés

| Module                                                           | Tailles | Notation                            | Fonction / obtention                                                                                                                                                                      |
|---------------------------------------------------------------------|---------|------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Frame Shift Drive (FSD)** standard                             | 2–8     | A–E                                 | Moteur de saut hyperspatial ; classe et notation déterminent la portée de saut — voir §11.1 pour les valeurs                                                                            |
| **Frame Shift Drive ([SCO](./00-glossaire.md))**                 | 2–8     | A–E                                 | Variante « Supercruise Overcharge » : vitesse de supercroisière très supérieure en accumulant de l'énergie de saut ; voir §11.1 pour les valeurs de masse optimale                    |
| **Guardian FSD Booster**                                         | 1–5     | H (un seul exemplaire par vaisseau) | Ajoute un bonus fixe de portée de saut — **Guardian Technology Broker**                                                                                                                   |
| **Frame Shift Drive Interdictor**                                | 1–4     | A–E                                 | Permet d'intercepter un vaisseau en supercroisière (PvP/piraterie)                                                                                                                        |
| **Discovery Scanner**                                            | —       | —                                   | Historiquement en 3 niveaux (Basique/Intermédiaire/Avancé) ; le scanner Basique est aujourd'hui intégré gratuitement, le module payant ayant été retiré après la refonte de l'exploration |
| **Detailed Surface Scanner (DSS)**                               | 1       | I                                   | Sonde de cartographie des corps planétaires, révèle les points d'intérêt en surface et permet le bonus de première cartographie ; détecte en outre les **emplacements de minage planétaire** depuis la mise à jour Rhino SRV (2 septembre 2026) |
| **Planetary Approach Suite / Advanced Planetary Approach Suite** | 1       | I                                   | Requis pour l'atterrissage planétaire (Horizons)                                                                                                                                          |
| **Fuel Scoop**                                                   | 1–8     | A–E                                 | Récupération de carburant depuis une étoile en vol                                                                                                                                        |
| **Auto Field-Maintenance Unit (AFMU)**                           | 1–8     | A–E                                 | Réparation autonome des modules endommagés en vol                                                                                                                                         |

**Partage des rôles avec le guide d'exploration.** Ce guide-ci est la référence sur les **caractéristiques** de ces
modules : tailles, notations, masse, consommation, prix et effet principal, chiffrés dans le « Référentiel chiffré des
modules » plus bas — et, pour le FSD, aux §11.1 et §11.2. Leur **usage sur le terrain** relève de
[10-exploration.md](./10-exploration.md), qui traite ce que révèle une cartographie au **Detailed Surface Scanner**
(ressources de surface révélées, statut « mapped », bonus de première cartographie) et recense les classes
stellaires qui se laissent écoper au **Fuel Scoop**. Les deux fiches détaillées de ces modules, plus bas, y renvoient
sur ces points.

### 11.1 Portée de saut du FSD : masse optimale par classe et notation

Le paramètre déterminant pour la portée de saut d'un FSD est sa **masse optimale (optimised mass)** : plus la masse
du vaisseau chargé (coque + modules + cargo + carburant) reste proche de cette valeur ou en-dessous, plus la portée
de saut effective est élevée. Masse optimale (en tonnes) par classe et notation :

**FSD standard**

| Classe | A     | B      | C    | D    | E   |
|--------|-------|--------|------|------|-----|
| 2      | 90    | 75     | 60   | 54   | 48  |
| 3      | 150   | 125    | 100  | 90   | 80  |
| 4      | 525   | 437,5  | 350  | 315  | 280 |
| 5      | 1 050 | 875    | 700  | 630  | 560 |
| 6      | 1 800 | 1 500  | 1 200| 1 080| 960 |
| 7      | 2 700 | 2 250  | 1 800| 1 620| 1 440|

*(Il n'existe pas de FSD standard de classe 8 : au-delà de la classe 7, seule la variante SCO est disponible. Source :
EDCD/coriolis-data.)*

**FSD (SCO)**

| Classe | A     | B     | C     | D     | E    |
|--------|-------|-------|-------|-------|------|
| 2      | 100   | 90    | 90    | 90    | 60   |
| 3      | 167   | 150   | 150   | 150   | 100  |
| 4      | 585   | 525   | 525   | 525   | 350  |
| 5      | 1 175 | 1 050 | 1 050 | 1 050 | 700  |
| 6      | 2 000 | 1 800 | 1 800 | 1 800 | 1 200|
| 7      | 3 000 | 2 700 | 2 700 | 2 700 | 1 800|
| 8      | 4 670 | 4 200 | 4 200 | 4 200 | 2 800|

*(Source : EDCD/coriolis-data. Le FSD (SCO) offre une masse optimale légèrement supérieure au FSD standard à
classe/notation égale, en plus de sa fonction principale de survitesse en supercroisière, mais consomme davantage de
carburant par saut.)*

La **notation A** offre systématiquement la masse optimale la plus élevée (donc la meilleure portée), mais aussi le
coût, la masse et la consommation d'énergie les plus importants — c'est le choix quasi systématique des builds
d'exploration longue distance. Pour la méthodologie complète d'optimisation de la portée de saut (masse du vaisseau,
carburant embarqué, Guardian FSD Booster, engineering « Increased Range »), voir [10-exploration.md](./10-exploration.md) ;
l'effet chiffré du blueprint « Increased Range » sur ces mêmes masses optimales est détaillé au §11.2 ci-dessous.

### 11.2 Ce que l'ingénierie fait à la masse optimale — et pourquoi la portée y est linéaire

La masse optimale du §11.1 est la valeur *d'origine* du module. C'est aussi la seule grandeur sur laquelle agit le
blueprint **« Increased Range »** (`FSD_LongRange`), le plus demandé du jeu. La portée de saut est **linéaire** en
masse optimale, selon la formule employée par les calculateurs de build :

```
saut (AL) = (carburant / fuelmul) ^ (1 / fuelpower) × masse_optimale / (masse du vaisseau + carburant) + bonus
```

`fuelmul` et `fuelpower` sont deux paramètres du FSD ; `bonus` est le terme additif constant du calcul, auquel
contribue le **Guardian FSD Booster** décrit au §11. La formule elle-même est reproduite telle quelle depuis la source
interne, qui n'en détaille pas les paramètres. Ce qu'elle établit et qui compte ici : à masse de vaisseau constante,
un pourcentage gagné sur la masse optimale se retrouve **tel quel** en pourcentage de portée.

| Grade du blueprint | Gain sur la masse optimale | Rolls nécessaires à réputation 5 chez l'ingénieur |
|---|---:|---:|
| **G1** | +15 % | 1 |
| **G2** | +25 % | 2 |
| **G3** | +35 % | 3 |
| **G4** | +45 % | 4 |
| **G5** | +55 % | 5 |

#### 11.2.1 Masses optimales de notation A une fois « Increased Range » monté au grade 5 (table dérivée)

Appliqué aux valeurs du §11.1, cela donne pour la **notation A** — la seule qui intéresse un build de portée — les
masses optimales suivantes une fois le blueprint monté au grade 5. **Cette table est dérivée par calcul, et non
relevée** : aucune source ne publie ces valeurs, elles sont obtenues en multipliant par 1,55 les masses optimales de
référence du §11.1, conformément au +55 % annoncé par le blueprint au grade 5. Elles sont donc exactes dans la mesure
où le +55 % s'applique bien de façon strictement multiplicative, ce que la formule de portée ci-dessus suppose mais
qu'aucun relevé en jeu ne vient ici confirmer — à traiter comme un ordre de grandeur de travail, pas comme une mesure.

| Classe | FSD standard A, d'origine | FSD standard A, en G5 (calculé) | FSD (SCO) A, d'origine | FSD (SCO) A, en G5 (calculé) |
|---|---:|---:|---:|---:|
| 2 | 90 | 139,5 | 100 | 155 |
| 3 | 150 | 232,5 | 167 | 258,9 |
| 4 | 525 | 813,8 | 585 | 906,8 |
| 5 | 1 050 | 1 627,5 | 1 175 | 1 821,3 |
| 6 | 1 800 | 2 790 | 2 000 | 3 100 |
| 7 | 2 700 | 4 185 | 3 000 | 4 650 |
| 8 | — | — | 4 670 | 7 238,5 |

*(Colonnes « en G5 » : produit de la colonne « d'origine » par 1,55, arrondi au dixième de tonne. Les valeurs
d'origine proviennent des tables du §11.1 — EDCD/coriolis-data ; le coefficient de +55 % au grade 5 provient du
catalogue de blueprints hors ligne, édition 2026-08, lui-même dérivé d'EDCD/coriolis-data.)*

#### 11.2.2 Pourquoi le gain net de portée reste inférieur au +55 % annoncé

**Le gain net est inférieur au gain brut.** Le blueprint ajoute **+30 % de masse au module lui-même**. Cette masse
supplémentaire entre au dénominateur de la formule : le gain réel de portée est donc de « quelques points de
pourcentage » en dessous des +55 %, l'écart dépendant du rapport entre la masse du FSD et celle du vaisseau — il est
négligeable sur un gros vaisseau, sensible sur un petit. Formuler le gain en années-lumière absolues n'a pas de sens
hors d'un build donné : l'ordre de grandeur souvent avancé de « +10 à 15 AL » est plausible pour un vaisseau moyen,
mais reste un ordre de grandeur, pas une valeur.

#### 11.2.3 Mass Manager ou Deep Charge : les deux effets expérimentaux du FSD

**Effets expérimentaux applicables au FSD, et le choix qu'ils imposent.** Deux effets seulement se posent sur un
Frame Shift Drive, et ils s'excluent l'un l'autre. Ce qui relève du **module** — donc de ce guide — tient en deux
grandeurs : *Mass Manager* agit sur la **masse optimale**, la valeur qui pilote la portée de saut au §11.1, en la
relevant de **+4 %** contre **−8 % d'intégrité** du module ; *Deep Charge* ne touche pas à la masse optimale et agit
sur le **carburant maximal injecté à la charge**, **+10 %**, au prix d'une consommation électrique accrue.

Le second n'augmente pas la portée d'un saut isolé de la même façon que le premier, mais sur un long trajet il peut
valoir davantage. Les deux coûtant exactement les mêmes matériaux, le choix mérite d'être posé plutôt que tranché
d'office. Tout ce qui relève de l'**ingénierie** — coût en matériaux par effet, ingénieurs qui les posent, matrice
complète des effets expérimentaux par module — est porté par [06-ingenieurs.md](./06-ingenieurs.md), source unique du
corpus sur ce point ; les chiffres ci-dessus en sont repris et ne sont pas redonnés sous forme de table ici. Retenez
seulement que **trois ingénieurs seulement montent « Increased Range » aux grades 4 et 5**, et que depuis
l'Update 18.08 (7 août 2024) un roll donne un résultat **fixe**, plus aléatoire — d'où la colonne « rolls
nécessaires » du tableau ci-dessus.

#### 11.2.4 Ingénierie d'un FSD (SCO) : la portée de saut oui, la survitesse non

**Le FSD (SCO) et le blueprint.** « Increased Range » s'applique aux **deux familles de modules** avec les mêmes
matériaux et les mêmes pourcentages. En revanche, les attributs propres au SCO — vitesse et accélération en
supercroisière, chaleur, consommation de carburant en overcharge — **ne sont pas modifiables par l'ingénierie** :
ingénier un SCO améliore sa portée de saut, pas sa survitesse. Deux réserves accompagnent ce point. D'abord, il est
établi via le mappage module → blueprints d'EDSY, qui porte lui-même un commentaire `// TODO verify` dans son code
source. Ensuite, la note interne dont provient cette information indique que **Coriolis ne dispose d'aucune donnée
SCO** et recommande EDSY pour planifier un build SCO ingénié — alors que la table de masse optimale SCO du §11.1
provient du jeu de données `EDCD/coriolis-data`. Les deux constats ne sont pas nécessairement contradictoires
(données de module d'un côté, mappage des blueprints de l'autre), mais ce point demande un contrôle en jeu avant
d'être considéré comme acquis.

*Source de cette sous-section : catalogue de blueprints hors ligne, édition 2026-08 (blueprint
`fsd_increased_range` : effets par grade, rolls à réputation 5, effets expérimentaux et leurs matériaux) et
l'étude interne du 19 août 2026, § 3.3 « Portée du FSD : pourquoi ça bloque, et la table exacte »
(formule de portée, +30 % de masse du module, réserves SCO et EDSY). Sources amont déclarées par le catalogue :
EDCD/coriolis-data (`modifications/blueprints.json` et `specials.json`).*

## 12. Modules utilitaires (emplacements de classe 0)

| Module                              | Notation | Fonction                                                                                                  |
|----------------------------------------|----------|------------------------------------------------------------------------------------------------------------|
| **Chaff Launcher**                  | I        | Brouille temporairement le verrouillage gyrostabilisé/tourelle adverse                                    |
| **Heat Sink Launcher**              | I        | Dissipe instantanément la chaleur du vaisseau (camouflage thermique, refroidissement après un Beam Laser) |
| **Point Defence**                   | I        | Tourelle automatique de très courte portée qui abat missiles, torpilles et mines entrants                 |
| **Electronic Countermeasure (ECM)** | F        | Désactive les mines à proximité                                                                           |
| **Shutdown Field Neutraliser**      | F        | Contre les effets d'Interdictor et les armes de désactivation Thargoïdes                                  |
| **Caustic Sink Launcher**           | —        | Protège contre les nuages caustiques Thargoïdes                                                           |
| **Thargoid Pulse Neutraliser**      | E        | Contre-mesure anti-Thargoïde                                                                              |
| **Frame Shift Wake Scanner**        | A–E      | Scanne un sillage hyperspatial (*high energy wake*) ; **seule source des matériaux encodés de la catégorie « Wake Scans »** — voir ci-dessous |
| **Shield Booster**                  | A–E      | Voir section 4 (Boucliers), notamment §4.2 pour le cumul et le rendement décroissant                       |

Ces modules varient en notation (A à I selon le module) mais restent tous de classe 0.

**Le Frame Shift Wake Scanner mérite un paragraphe à lui seul.** Utility mount de classe 0 décliné de la notation **E**
à la notation **A**, il coûte de **13 544 Cr** à **1 097 095 Cr** selon la notation, porte à **2 à 4 km** et demande
**10 secondes** de scan sur une cible tenue. Détail d'usage qui fait perdre du temps à beaucoup de commandants : comme
les autres scanners, **il doit être assigné à un groupe de tir** pour être activable.

Son intérêt dépasse largement son usage tactique. C'est la **seule source** des cinq matériaux encodés de la catégorie
**« Wake Scans »**, obtenus en braquant le module sur un sillage d'**hyperespace** (*high energy wake*) :

| Matériau encodé (catégorie Wake Scans) | Grade | Plafond de stockage |
|---|---:|---:|
| Atypical Disrupted Wake Echoes | 1 | 300 |
| Anomalous FSD Telemetry | 2 | 250 |
| Strange Wake Solutions | 3 | 200 |
| Eccentric Hyperspace Trajectories | 4 | 150 |
| Datamined Wake Exceptions | 5 | 100 |

**Quatre de ces cinq** — Atypical Disrupted Wake Echoes, Strange Wake Solutions, Eccentric Hyperspace Trajectories et
Datamined Wake Exceptions — sont exigés par le blueprint FSD « Increased Range » décrit au §11.2. Sans ce module, ce
blueprint est **impossible à compléter**, quel que soit le temps passé à prospecter des matériaux bruts en SRV — c'est
la raison, rarement explicitée, pour laquelle une montée en portée de saut peut rester bloquée indéfiniment. La méthode
consiste à camper les sillages près d'une station fréquentée et à récolter n'importe quel Wake Scan, quitte à convertir
ensuite chez un material trader Encoded — les modalités de cette conversion relèvent de
[06-ingenieurs.md](./06-ingenieurs.md).

*Source : catalogue de matériaux hors ligne, édition 2026-08 (catégorie « Wake Scans » :
module source, notations, prix, portée, durée de scan, grades et plafonds de stockage) et
l'étude interne du 19 août 2026, § 3.3. Sources amont déclarées par le catalogue : EDCD/FDevIDs
`material.csv` pour les identifiants, grades et catégories.*

## 13. Baies de vaisseau : chasseurs embarqués et Nomad

Le module historiquement appelé **Fighter Hangar** est un module interne qui permet de stocker, réparer et lancer un ou
plusieurs chasseurs monoplaces, pilotables soit par un membre d'équipage (Multicrew), soit par un PNJ recruté. Depuis
la mise à jour Operations, il n'embarque plus seulement des chasseurs et son libellé a changé : voir le §13.2.
Contrairement à la plupart des modules internes, il n'existe **qu'en notation D**, en classes 5, 6 et 7 :

| Classe | Notation | Baies | Reconstructions par baie |
|--------|----------|-------|-------------------------------|
| 5      | D        | 1     | 6                              |
| 6      | D        | 2     | 8                              |
| 7      | D        | 2     | 15                             |

*(Source : EDCD/coriolis-data.)* Un chasseur détruit en combat peut être reconstruit un nombre limité de fois par
baie et par sortie (« reconstructions par baie » ci-dessus) avant que la baie ne devienne indisponible jusqu'au
retour à une station.

### 13.1 Les 4 modèles de chasseurs embarqués (Ship-Launched Fighters)

Quatre modèles de chasseurs standards sont disponibles au choix dans l'interface de la baie, indépendamment du
vaisseau porteur :

| Chasseur                    | Fabricant                                                                                     |
|---------------------------------|----------------------------------------------------------------------------------------------------|
| **Federal Assault Fighter** | Core Dynamics                                                                                       |
| **Imperial Fighter**        | Gutamaya                                                                                            |
| **Taipan Fighter**          | Faulcon DeLacy *(association communautaire courante — non revérifiée sur une source primaire dans cette session ; à confirmer sur Inara.cz)* |
| **Gu-97**                   | Zorgon Peterson *(association communautaire courante — non revérifiée sur une source primaire dans cette session ; à confirmer sur Inara.cz)* |

*(Manufacturers de Federal Assault Fighter et Imperial Fighter confirmés via l'article Wikipédia anglais « Elite
Dangerous », consulté le 9 septembre 2026.)*

Ces quatre chasseurs ne figurent pas comme des « vaisseaux » achetables dans les jeux de données de référence
(EDCD/FDevIDs, EDCD/coriolis-data) utilisés pour ce guide : ils s'équipent et se configurent uniquement via
l'interface de la baie de vaisseau (choix du modèle, armement fixe limité propre à chaque appareil), et non via un
chantier naval classique — leurs statistiques précises (PV, vitesse, DPS) ne peuvent donc pas être sourcées de la
même façon que le reste de ce guide ; se référer à un calculateur communautaire (Coriolis, EDSY) ou à Inara.cz pour
des valeurs exactes. Pour la liste des vaisseaux capables d'embarquer une baie de vaisseau (Anaconda, Federal Corvette,
Imperial Cutter, Type-10 Defender, etc.), voir [03-vaisseaux.md](./03-vaisseaux.md) et le §13.2 ci-dessous.

### 13.2 De la baie de chasseur à la baie de vaisseau — Mk I, Mk II et le Nomad

La mise à jour **Operations** (notes officielles « Elite Dangerous | Operations Update », 1er juillet 2026, 14:01 UTC)
élargit la fonction de ce module : il ne lance plus seulement des chasseurs. Les notes de version le désignent
désormais comme **Mk I Vessel Bay** et introduisent un second module, le **Mk II Vessel Bay** ; le référentiel
`EDCD/FDevIDs` (`outfitting.csv`) libelle en conséquence les entrées `Int_FighterBay_Size5/6/7_Class1` « Vessel
Hangar » et les nouvelles entrées `Int_FighterBayMk2_Size5/6/7_Class1` « Mk II Vessel Hangar ». Le nom interne des
modules n'a pas changé : un parseur qui filtre sur `Int_FighterBay*` continue de fonctionner, mais le libellé qu'il
affiche doit suivre.

| Module            | Classes disponibles | Vaisseaux porteurs (notes officielles du 1er juillet 2026)                                                                                                                                                        |
|-------------------|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Mk I Vessel Bay**  | 5 à 7 selon le vaisseau | Alliance Crusader (5–6), Anaconda (5–7), Beluga Liner (5–6), Caspian Explorer (5–7), Federal Corvette (5–7), Federal Gunship (5–6), Imperial Cutter (5–7), Keelback (5), Krait Mk II (5–6), Panther Clipper Mk II (5–7), Type-9 Heavy (5–7), Type-10 Defender (5–7), Type-11 Prospector (5–6) |
| **Mk II Vessel Bay** | 5 à 7 selon le vaisseau | Caspian Explorer (5–7), Panther Clipper Mk II (5–7), Type-11 Prospector (5–6)                                                                                                                                    |

**Le Nomad.** Dévoilé le 2 juin 2026 (« Discover the Nomad », 13:03 UTC) et sorti le 30 juin 2026 en accès anticipé
ARX aux côtés d'Operations, le Nomad est décrit par Frontier comme « un vaisseau lancé depuis un vaisseau, petit et
compact, conçu pour explorer les surfaces planétaires ». Ce n'est donc **ni un SRV ni un chasseur**, mais une
troisième catégorie de véhicule embarqué (*ship-launched vessel*, SLV) : il ne s'achète pas au chantier naval et
n'entre pas dans le décompte des vaisseaux pilotables du [guide des vaisseaux](./03-vaisseaux.md). Le véhicule
lui-même est traité en détail dans [14-rhino-nomad.md](./14-rhino-nomad.md) ; ne figurent ici que ses interactions
avec l'équipement. Ses caractéristiques annoncées par Frontier :

- **Déploiement** — « le Nomad peut être déployé depuis une baie de vaisseau compatible, y compris les modules MK I et
  MK II » (notes du 1er juillet 2026). Le Mk II n'est donc pas une condition d'emport : c'est le Mk II *Vessel Bay*
  qui est réservé à trois vaisseaux, pas le Nomad lui-même.
- **Train d'atterrissage** — des patins étroits d'inspiration hélicoptère qui réduisent l'empreinte au sol et
  permettent de se poser sur un terrain irrégulier ; les moteurs **pivotent à l'atterrissage** et viennent se placer
  juste au-dessus du sol (« Discover the Nomad », 2 juin 2026).
- **Usage** — laisser le vaisseau d'exploration en orbite et descendre au plus près des organiques difficiles d'accès,
  plutôt que poser le gros porteur (*ibid.*).
- **Intérieur accessible**, avec des points d'entrée facilitant le débarquement et le rembarquement rapides (notes du
  1er juillet 2026).

**Le Rhino également.** Le Rhino, plus gros SRV qu'un commandant puisse déployer, ne passe pas par la trappe à cargo
comme le Scarab et le Scorpion : il est largué depuis cette même baie (« Beneath the Surface: Your First Look at the
Rhino », 6 août 2026, 14:19 UTC), et il est arrivé en jeu le 2 septembre 2026. La baie de vaisseau porte donc
aujourd'hui trois familles de véhicules embarqués : chasseurs, Nomad et Rhino.

**Modules propres au Nomad, ajoutés à l'équipement par la même mise à jour** (notes du 1er juillet 2026, rubrique
« Nomad added to outfitting ») :

| Module                       | Fonction                                                                                                              |
|------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| **Mk II Biological Scanner** | Scanner à impulsions qui détecte les signatures biologiques — détection des signaux biologiques **depuis le cockpit** |
| **Pulse Lasers**             | Laser à impulsions sur montage **fixe**, armement du Nomad                                                            |

Le nom officiel de ce scanner est bien **Mk II Biological Scanner** ; il ne s'agit ni d'un Discovery Scanner ni d'un
Detailed Surface Scanner, et il ne remplace ni l'un ni l'autre (voir §11 et [10-exploration.md](./10-exploration.md)).

**Note d'usage pour les outils tiers.** Le Nomad renseigne dans `Status.json` le bit « In SRV » et non le bit « In
Fighter » ; son identifiant interne est `Lander01`. Ce point, corroboré par des outils communautaires et non par
Frontier, est détaillé dans [17-sources-donnees.md](./17-sources-donnees.md).

## 14. Modules Guardian — récapitulatif et déblocage

Famille complète des modules issus de la technologie précurseure Guardian :

- **Armes** : Guardian Gauss Cannon, Guardian Plasma Charger, Guardian Shard Cannon
- **Renforts** (tailles 1–5) : Guardian Hull Reinforcement, Guardian Module Reinforcement, Guardian Shield Reinforcement
- **Exploration** : Guardian FSD Booster (tailles 1–5, un seul exemplaire par vaisseau)
- **Alimentation** : Guardian Hybrid Power Distributor, Guardian Hybrid Power Plant (tailles jusqu'à 8)
- **Hybride anti-Thargoïde** : Guardian Nanite Torpedo Pylon

Tous se débloquent auprès d'un **Guardian Technology Broker** — un PNJ dédié présent dans quelques stations spécifiques,
distinct des ingénieurs classiques — contre des matériaux et données Guardian récoltés sur les sites de ruines et
structures Guardian, plus un coût en crédits. *(Les emplacements précis des stations hébergeant ce Broker évoluent avec
les mises à jour ; vérifier sur Inara.cz, section Engineering, pour la liste courante.)* Pour la liste des sites
Guardian de référence et le détail du déblocage, voir [05-guardians.md](./05-guardians.md).

## 15. Human Technology Broker

Ce Broker débloque les variantes AX améliorées (**Enhanced AX Multi-Cannon**, **Enhanced AX Missile Rack**) ainsi que
d'autres technologies dérivées de la lutte anti-Thargoïde développées par **Aegis**, l'organisation humaine de défense
anti-xéno. L'accès combine typiquement un rang de combat AX suffisant et la fourniture de matériaux/commodités liés au
combat Thargoïde, via des installations liées à Aegis. *(Comme pour le Guardian Broker, vérifier les emplacements et
seuils exacts sur Inara.cz avant toute planification précise.)*

## 16. Ingénieurs de vaisseau — panorama des spécialités

Le jeu recense un grand nombre d'ingénieurs « vaisseaux » (identifiants dédiés dans les données du jeu), spécialisés
chacun dans certaines familles de modules :

| Ingénieur                   | Spécialité principale                                      |
|----------------------------------|------------------------------------------------------------------|
| Felicity Farseer            | Propulseurs, FSD                                           |
| Elvira Martuuk              | FSD, propulseurs                                           |
| The Dweller                 | Armes énergie et cinétiques                                |
| Zacariah Nemo                | Armes / effets multi-cannon                                |
| Liz Ryder                   | Armes cinétiques, AFMU                                     |
| Hera Tani                   | Centrale électrique, distributeur                          |
| Lei Cheung                  | Armes énergie                                              |
| Petra Olmanova               | Boucliers, senseurs                                        |
| Marco Qwent                  | Centrale électrique                                        |
| Selene Jean                  | Boucliers                                                  |
| Professor Palin              | FSD, propulseurs avancés                                   |
| Juri Ishmaak                 | Senseurs, scanner                                          |
| Tod « The Blaster » McQuinn | Armes                                                      |
| Ram Tah                      | Débloque également des schémas liés à des données Guardian |

D'autres ingénieurs « vaisseaux » complètent cette liste (Marsha Hicks, Bill Turner, Broo Tarquin, The Sarge, Didi
Vatermann, Colonel Bris Dekker, Lori Jameson, Tiana Fortune, Mel Brandon, Etienne Dorn, Chloe Sedesi, entre autres).

Depuis l'extension **Odyssey**, des ingénieurs « sur pied » distincts (Domino Green, Hero Ferrari, Kit Fowler,
Wellington Beck, Terra Velasquez, Uma Laszlo, Oden Geiger, Yarden Bond, Baltanos, Eleanor Bresa, Rosa Dayette, Yi Shen,
Jude Navarro) modifient l'équipement des personnages à pied (armes et combinaisons), et non les modules de vaisseau —
voir [07-equipement-a-pied.md](./07-equipement-a-pied.md). Pour le détail complet des blueprints, effets
expérimentaux et matériaux de tous les ingénieurs, voir [06-ingenieurs.md](./06-ingenieurs.md).

## 17. Powerplay — équipements exclusifs

Liste des armes et modules exclusifs liés au système Powerplay :

| Équipement                     | Type                |
|-------------------------------------|---------------------|
| Advanced Plasma Accelerator    | Arme plasma         |
| Mining Lance                   | Arme laser (minage) |
| Imperial Hammer Rail Gun       | Arme cinétique      |
| Pulse Disruptor Laser          | Arme énergie        |
| Pacifier Frag-Cannon            | Arme cinétique      |
| Pack-Hound Missile Rack        | Arme à missiles     |
| Enforcer Cannon                | Arme cinétique      |
| Retributor Beam Laser          | Arme énergie        |
| Cytoscrambler Burst Laser      | Arme énergie        |
| Rocket Propelled FSD Disruptor | Arme spéciale       |
| Concord Cannon                  | Arme cinétique      |
| Prismatic Shield Generator     | Bouclier            |

Ces équipements restent historiquement liés au rang atteint auprès d'une Power. Le système Powerplay a connu une
refonte majeure (« **Powerplay 2.0** », déployée le **31 octobre 2024** avec l'extension *Elite Dangerous:
Ascendancy*, qui introduit aussi le vaisseau Mandalay), remplaçant l'ancien système de pledge/rang hebdomadaire par un
système de mérites et de contrôle territorial dynamique par système. La liste ci-dessus reste la base des récompenses
matérielles du système, mais le détail actuel de la mécanique d'acquisition (mérites, paliers, classement des
Powers) est couvert par [02-powerplay.md](./02-powerplay.md) — s'y référer plutôt que de le répéter ici, le
classement des Powers étant une donnée volatile à revérifier régulièrement sur Inara.cz.

## 18. Où obtenir chaque famille d'équipement — synthèse

| Source                              | Types d'équipements concernés                                                                                                                                                          |
|------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Chantier naval standard**         | Armes énergie/cinétiques/plasma de base, boucliers standards, propulseurs, centrales électriques, distributeurs, senseurs, soutes, FSD (standard et SCO), Fuel Scoop, AFMU, bulkheads, HRP/MRP, contrôleurs de limpets, baies de vaisseau Mk I et Mk II, Mk II Biological Scanner, modules utilitaires courants |
| **Ingénieurs (systèmes dédiés)**    | Modifications (blueprints) et effets expérimentaux sur presque tous les modules ; certains modules exclusifs comme l'Enhanced Performance Thrusters                                    |
| **Guardian Technology Broker**      | Armes Guardian, renforts Guardian, Guardian FSD Booster, centrale/distributeur Hybrid Guardian, Guardian Nanite Torpedo Pylon (avec matériaux Thargoïdes)                              |
| **Human Technology Broker (Aegis)** | Variantes AX améliorées (Enhanced AX Multi-Cannon, Enhanced AX Missile Rack)                                                                                                           |
| **Powerplay**                       | Armes et modules exclusifs listés en section 17, dont le Prismatic Shield Generator                                                                                                    |
| **Merc Coin (Operations)**          | **MercGear** : blueprints et modules pré-ingénierés achetés avec la monnaie gagnée en Opérations — voir ci-dessous                                                                               |

**MercGear.** La mise à jour Operations introduit une monnaie dédiée, le **Merc Coin**, obtenue en terminant des
Operations et **non achetable en ARX**, qui donne accès à un catalogue d'équipement propre (notes officielles
« Elite Dangerous | Operations Update », 1er juillet 2026, 14:01 UTC) :

- **Blueprints** — *Thermal Plasma Conversion* (surcoût en énergie pour convertir une part des dégâts en plasma sur
  les lasers à impulsions, à rafale et à faisceau) et *Scoop Rate Enhanced* (surcoût en énergie pour améliorer la
  cadence du Fuel Scoop).
- **Hardpoints pré-ingénierés** — Enduring Feedback Rail Gun (avec effet Feedback Cascade), Far-Reaching Abrasion
  Blaster, Double Screaming Fragment Cannon, Long Range Mining Laser, Rapid Phase Multi-Cannon, Drag Seeker Missile
  Rack, Lightweight Thermal Seeker Missile Rack, Lockdown Seeker Missile Rack.
- **Modules standards pré-ingénierés** — Support Focused Power Distributor, Balanced Power Distributor.
- **Modules internes pré-ingénierés** — Extended Cargo Rack, Long Range Detailed Surface Scanner, Heavy Duty Module
  Reinforcement Package.

Ces modules sont livrés **déjà modifiés** : ils s'obtiennent contre du Merc Coin et non chez un ingénieur, ce qui en
fait un quatrième circuit d'acquisition à côté du chantier naval, des ingénieurs et des Brokers. Le détail des
compromis chiffrés de chaque variante n'est pas publié dans les notes de version et n'est donc pas repris ici. Pour la
mécanique des Opérations elles-mêmes et l'acquisition du Merc Coin, voir [13-operations.md](./13-operations.md).

## 19. Contexte récent pertinent pour l'équipement (2023–2026)

- **2023** : invasion Thargoïde majeure dans la Bulle, apparition des vaisseaux-mères Titans et intensification du
  contenu anti-xéno (armes AX, Human Technology Broker).
- **20 octobre 2024** : annonce de la fonctionnalité de **colonisation de systèmes** lors du livestream Frontier
  Unlocked.
- **31 octobre 2024** : déploiement de **Powerplay 2.0** dans le cadre de l'extension **Elite Dangerous: Ascendancy**.
  Voir [02-powerplay.md](./02-powerplay.md) pour le détail des paliers actuels.
- **26 février 2025** : lancement en **bêta** de la colonisation de systèmes, avec la mise à jour **Trailblazers**
  (le guide explicatif officiel de Frontier, publié 2 jours plus tard le 28 février 2025, est parfois confondu avec
  la date de lancement elle-même — c'est bien le 26, et non le 28, qui marque la sortie de la bêta).
- **11 novembre 2025** : sortie complète de la colonisation via la mise à jour **Dodec Update** (v4.2.2.0), permettant
  de revendiquer des systèmes inhabités et d'y construire des installations orbitales/planétaires — mécanique qui
  s'appuie sur l'équipement de transport de fret existant plutôt que sur de nouveaux modules de combat. Voir
  [18-colonisation.md](./18-colonisation.md) pour le détail de la mécanique.
- **24 février 2026** : mise à jour **Kestrel Mk II** — arrivée du Core Dynamics Kestrel Mk II et, avec lui, de deux
  modules propres au vaisseau : les **Mk II Agile Boost Thrusters** (manœuvrabilité accrue pendant le boost, avec un
  gain marqué en poussée latérale et verticale) et le **Mk II Plasma Shock Accelerator** (canon à choc en tir par
  rafales, dégâts de type plasma, fonction *plasma slug* intégrée). *(« Elite Dangerous | Kestrel Mk. II Update »,
  24 février 2026, 12:21 UTC.)*
- **22 avril 2026** : Frontier annonce le **report d'Operations**, désormais attendu en juin. *(« Elite Dangerous |
  An Update on Operations », 22 avril 2026, 14:02 UTC.)*
- **28 avril 2026** : mise à jour **Lynx Highliner** — ajout des **cabines passagers Mk II** (économique et affaires),
  dont la capacité est multipliée par 1,5 par rapport aux cabines existantes. *(« Elite Dangerous | Lynx Highliner
  Update Notes », 28 avril 2026, 13:11 UTC.)*
- **2 juin 2026** : premier dévoilement du **Nomad**, « vaisseau lancé depuis un vaisseau » conçu pour l'exploration
  des surfaces planétaires. *(« Discover the Nomad », 2 juin 2026, 13:03 UTC — voir §13.2.)*
- **30 juin – 1er juillet 2026** : sortie de la mise à jour **Operations** — le Nomad était annoncé pour le 30 juin en
  accès anticipé ARX, les notes de version ont été publiées le 1er juillet. Côté équipement, elle apporte : les
  **baies de vaisseau Mk I et Mk II** en
  remplacement de la baie de chasseur, le **Nomad** et ses modules propres (**Mk II Biological Scanner**, **Pulse
  Lasers**), et le catalogue **MercGear** acheté en Merc Coin (voir sections 13 et 18). *(« Elite Dangerous |
  Operations Update », 1er juillet 2026, 14:01 UTC.)*
- **9 juillet 2026** : **Update 3** d'Operations, correctifs. *(« Elite Dangerous | Operations Update | Update 3 »,
  9 juillet 2026, 10:24 UTC. La version de jeu correspondante, 4.4.0.3, est relevée dans des journaux de commandants
  cités par la communauté et non dans les notes officielles.)*
- **2 septembre 2026** : mise à jour **Rhino SRV** — arrivée du Rhino de Vodel, plus gros SRV déployable, qui se largue
  depuis la baie de vaisseau et non par la trappe à cargo, et de la boucle de **minage de surface**. Trois modules
  l'accompagnent (**Planetary Mining Deposit Scanner**, **Refinery**, **Mining Rig Deployment Module**), et le
  **Detailed Surface Scanner** est mis à jour pour détecter les emplacements de minage planétaire — un changement de
  périmètre du DSS listé au §11. *(« Elite Dangerous | Rhino SRV Update », 2 septembre 2026, 11:20 UTC, et « Beneath
  the Surface: Your First Look at the Rhino », 6 août 2026, 14:19 UTC.)*
- Au 17 juin 2026, environ **195,5 millions de systèmes stellaires** avaient été catalogués par les joueurs (dont
  environ 97,7 millions explorés directement), soit environ 0,0489 % de la galaxie — signe d'une activité d'exploration
  toujours soutenue (pertinent pour l'usage des FSD, DSS et Discovery Scanner). *Capture au 17 juin 2026 ; à
  revérifier sur les outils de suivi communautaires (EDAstro, Canonn, Inara) pour un chiffre à jour.*

## Référentiel chiffré des modules — classe, notation, masse, consommation et prix

Cette section donne, famille par famille, les valeurs de référence de chaque module vendu en chantier naval : masse embarquée, intégrité, consommation électrique, statistique propre à la famille et prix d'achat. Elle est produite mécaniquement à partir du jeu de données ouvert **EDCD/coriolis-data** (commit `0db9234b5b9c`), croisé avec **EDCD/FDevIDs** (`outfitting.csv`, commit `c35612952dd6`) pour les noms officiels affichés en jeu. Les modules sont désignés par leur nom anglais, puisque c'est celui de l'interface d'*outfitting*.

### Conventions de lecture des tables chiffrées

**Classe** est la taille de l'emplacement (1 à 8 ; 0 pour les emplacements utilitaires). **Notation** est le grade A à E, A étant en règle générale le plus performant et le plus cher ; les notations F à I désignent des modules qui n'existent que dans une seule variante ou dont l'échelle A–E ne s'applique pas. La **consommation** est le tirage sur la centrale électrique, en mégawatts (MW) ; pour la centrale elle-même, la colonne indique au contraire la **production**. Les **prix** sont les prix d'achat au chantier naval, hors remise de station et hors revente ; un prix de **0** signale un module qui n'est pas vendu en chantier naval — variante pré-ingénierée, récompense de courtier ou de Powerplay — ou dont la source ne porte pas de tarif. Un tiret « — » signale que le champ correspondant est absent du jeu de données amont : la valeur est alors nulle ou non couverte par le jeu de données, jamais estimée ici. Les modules marqués « Unrecognised » dans la source (entrées de repli des outils tiers) sont exclus.

**Noms MercGear et modules de chantier naval.** `outfitting.csv` porte **deux lignes pour un même identifiant de module** lorsqu'une variante pré-ingénierée du catalogue MercGear réutilise un module déjà vendu en chantier naval : l'une en catégorie `hardpoint`, `standard` ou `internal` — le module de base — l'autre en catégorie `mercgear`. **Vingt-deux identifiants** sont dans ce cas, soit la totalité du catalogue MercGear recensé par le fichier. Les tables de ce guide donnent au module de base **son nom de chantier naval** (Multi-Cannon, Cannon, Rail Gun, Fragment Cannon, Cargo Rack, Detailed Surface Scanner…) ; le nom MercGear est réservé aux lignes suffixées **« (pré-ingénieré) »**, qui correspondent aux entrées distinctes que `EDCD/coriolis-data` porte pour la variante. Un cas reste indécidable et est signalé comme tel : l'identifiant `Hpt_BasicMissileRack_Fixed_Medium` porte **trois** noms MercGear dans `outfitting.csv` (Drag Seeker, Lightweight Thermal Seeker et Lockdown Seeker Missile Rack) pour **deux** variantes distinctes dans coriolis-data ; les deux lignes concernées portent donc le libellé « Lockdown Seeker Missile Rack (pré-ingénieré) » sans qu'aucune source reproductible ne permette de dire laquelle des trois est laquelle.

Convention de signe des résistances, valable dans tout ce guide : une valeur **positive** est une réduction des dégâts reçus, une valeur **négative** une vulnérabilité accrue. Un bouclier standard porte ainsi +40 % cinétique, +50 % explosif et −20 % thermique.

### Centrale électrique (Power Plant) — production en MW, efficacité thermique et prix

La centrale alimente tous les autres modules : sa **production** doit couvrir la somme des consommations installées. La notation augmente la production et, surtout, améliore le coefficient d'**efficacité thermique** (`eff` dans la source) : plus il est bas, moins la centrale chauffe le vaisseau à charge égale. Les sept entrées « Guardian Hybrid » sont les centrales hybrides débloquées au Guardian Technology Broker.

| Classe | Notation | Variante        | Masse (t) | Intégrité | Production (MW) | Efficacité thermique (coef.) | Prix (Cr)   |
|--------|----------|-----------------|-----------|-----------|-----------------|------------------------------|-------------|
| 2      | A        | Guardian Hybrid | 1,5       | 56        | 12,7            | 0,5                          | 192 165     |
| 2      | A        | standard        | 1,3       | 56        | 9,6             | 0,4                          | 160 137     |
| 2      | B        | standard        | 2         | 61        | 8,8             | 0,45                         | 53 379      |
| 2      | C        | standard        | 1,3       | 51        | 8               | 0,5                          | 17 793      |
| 2      | D        | standard        | 1         | 41        | 7,2             | 0,75                         | 5 931       |
| 2      | E        | standard        | 2,5       | 46        | 6,4             | 1                            | 1 977       |
| 3      | A        | Guardian Hybrid | 2,9       | 70        | 15,8            | 0,5                          | 576 493     |
| 3      | A        | standard        | 2,5       | 70        | 12              | 0,4                          | 480 411     |
| 3      | B        | standard        | 4         | 77        | 11              | 0,45                         | 160 137     |
| 3      | C        | standard        | 2,5       | 64        | 10              | 0,5                          | 53 379      |
| 3      | D        | standard        | 2         | 51        | 9               | 0,75                         | 17 793      |
| 3      | E        | standard        | 5         | 58        | 8               | 1                            | 5 931       |
| 4      | A        | Guardian Hybrid | 5,9       | 88        | 20,6            | 0,5                          | 1 729 480   |
| 4      | A        | standard        | 5         | 88        | 15,6            | 0,4                          | 1 441 233   |
| 4      | B        | standard        | 8         | 96        | 14,3            | 0,45                         | 480 411     |
| 4      | C        | standard        | 5         | 80        | 13              | 0,5                          | 160 137     |
| 4      | D        | standard        | 4         | 64        | 11,7            | 0,75                         | 53 379      |
| 4      | E        | standard        | 10        | 72        | 10,4            | 1                            | 17 793      |
| 5      | A        | Guardian Hybrid | 11,7      | 106       | 26,9            | 0,5                          | 5 188 441   |
| 5      | A        | standard        | 10        | 106       | 20,4            | 0,4                          | 4 323 699   |
| 5      | B        | standard        | 16        | 114       | 18,7            | 0,45                         | 1 441 233   |
| 5      | C        | standard        | 10        | 96        | 17              | 0,5                          | 480 411     |
| 5      | D        | standard        | 8         | 77        | 15,3            | 0,75                         | 160 137     |
| 5      | E        | standard        | 20        | 86        | 13,6            | 1                            | 53 379      |
| 6      | A        | Guardian Hybrid | 23,4      | 124       | 33,3            | 0,5                          | 15 565 317  |
| 6      | A        | standard        | 20        | 124       | 25,2            | 0,4                          | 12 971 097  |
| 6      | B        | standard        | 32        | 136       | 23,1            | 0,45                         | 4 323 699   |
| 6      | C        | standard        | 20        | 113       | 21              | 0,5                          | 1 441 233   |
| 6      | D        | standard        | 16        | 90        | 18,9            | 0,75                         | 480 411     |
| 6      | E        | standard        | 40        | 102       | 16,8            | 1                            | 160 137     |
| 7      | A        | Guardian Hybrid | 46,8      | 144       | 39,6            | 0,5                          | 46 695 951  |
| 7      | A        | standard        | 40        | 144       | 30              | 0,4                          | 38 913 291  |
| 7      | B        | standard        | 64        | 157       | 27,5            | 0,45                         | 12 971 097  |
| 7      | C        | standard        | 40        | 131       | 25              | 0,5                          | 4 323 699   |
| 7      | D        | standard        | 32        | 105       | 22,5            | 0,75                         | 1 441 233   |
| 7      | E        | standard        | 80        | 118       | 20              | 1                            | 480 411     |
| 8      | A        | Guardian Hybrid | 93,6      | 165       | 47,5            | 0,5                          | 140 087 850 |
| 8      | A        | standard        | 80        | 165       | 36              | 0,4                          | 116 739 873 |
| 8      | B        | standard        | 128       | 180       | 33              | 0,45                         | 38 913 291  |
| 8      | C        | standard        | 80        | 150       | 30              | 0,5                          | 12 971 097  |
| 8      | D        | standard        | 64        | 120       | 27              | 0,75                         | 4 323 699   |
| 8      | E        | standard        | 160       | 135       | 24              | 1                            | 1 441 233   |

*(Source : EDCD/coriolis-data, modules/standard/power_plant.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Propulseurs (Thrusters) — masse optimale, masse maximale et consommation

Les propulseurs déterminent la vitesse en espace normal. Deux masses comptent : la **masse optimale**, à laquelle le vaisseau atteint sa vitesse nominale, et la **masse maximale** au-delà de laquelle les performances s'effondrent. Monter en notation relève ces deux seuils et augmente la consommation. Les variantes « Enhanced Performance » et les propulseurs propres au Caspian Explorer et au Kestrel Mk II figurent dans la colonne Variante.

| Classe | Notation | Variante                                       | Masse (t) | Intégrité | Consommation (MW) | Masse optimale (t) | Masse maximale (t) | Prix (Cr)   |
|--------|----------|------------------------------------------------|-----------|-----------|-------------------|--------------------|--------------------|-------------|
| 2      | A        | standard                                       | 2,5       | 56        | 3                 | 72                 | 108                | 160 224     |
| 2      | A        | Enhanced Performance                           | 2,5       | 40        | 4                 | 60                 | 120                | 1 610 080   |
| 2      | B        | standard                                       | 4         | 61        | 2,75              | 66                 | 99                 | 53 408      |
| 2      | C        | standard                                       | 2,5       | 51        | 2,5               | 60                 | 90                 | 17 803      |
| 2      | D        | standard                                       | 1         | 41        | 2,25              | 54                 | 81                 | 5 934       |
| 2      | E        | standard                                       | 2,5       | 46        | 2                 | 48                 | 72                 | 1 978       |
| 3      | A        | standard                                       | 5         | 72        | 3,72              | 120                | 180                | 507 912     |
| 3      | A        | Enhanced Performance                           | 5         | 55        | 5                 | 90                 | 200                | 5 103 950   |
| 3      | B        | standard                                       | 8         | 77        | 3,41              | 110                | 165                | 169 304     |
| 3      | C        | standard                                       | 5         | 64        | 3,1               | 100                | 150                | 56 435      |
| 3      | D        | standard                                       | 2         | 51        | 2,79              | 90                 | 135                | 18 812      |
| 3      | E        | standard                                       | 5         | 58        | 2,48              | 80                 | 120                | 6 271       |
| 4      | A        | standard                                       | 10        | 88        | 4,92              | 420                | 630                | 1 610 080   |
| 4      | B        | standard                                       | 16        | 96        | 4,51              | 385                | 577,5              | 536 693     |
| 4      | C        | standard                                       | 10        | 80        | 4,1               | 350                | 525                | 178 898     |
| 4      | D        | standard                                       | 4         | 64        | 3,69              | 315                | 472,5              | 59 633      |
| 4      | E        | standard                                       | 10        | 72        | 3,28              | 280                | 420                | 19 878      |
| 5      | A        | standard                                       | 20        | 106       | 6,12              | 840                | 1 260              | 5 103 953   |
| 5      | A        | MkII Agile Boost Thrusters (kestrel)           | 20        | 106       | 6,29              | 840                | 1 260              | 6 637 629   |
| 5      | B        | standard                                       | 32        | 115       | 5,61              | 770                | 1 155              | 1 701 318   |
| 5      | C        | standard                                       | 20        | 96        | 5,1               | 700                | 1 050              | 567 106     |
| 5      | D        | standard                                       | 8         | 77        | 4,59              | 630                | 945                | 189 035     |
| 5      | E        | standard                                       | 20        | 86        | 4,08              | 560                | 840                | 63 012      |
| 6      | A        | standard                                       | 40        | 124       | 7,56              | 1 440              | 2 160              | 16 179 531  |
| 6      | B        | standard                                       | 64        | 136       | 6,93              | 1 320              | 1 980              | 5 393 177   |
| 6      | C        | standard                                       | 40        | 113       | 6,3               | 1 200              | 1 800              | 1 797 726   |
| 6      | D        | standard                                       | 16        | 90        | 5,67              | 1 080              | 1 620              | 599 242     |
| 6      | E        | standard                                       | 40        | 102       | 5,04              | 960                | 1 440              | 199 747     |
| 7      | A        | standard                                       | 80        | 144       | 9,12              | 2 160              | 3 240              | 51 289 112  |
| 7      | A        | MkII Gravity Optimised Thrusters (explorer nx) | 80        | 144       | 9,12              | 2 160              | 3 240              | 68 368 390  |
| 7      | B        | standard                                       | 128       | 157       | 8,36              | 1 980              | 2 970              | 17 096 371  |
| 7      | C        | standard                                       | 80        | 131       | 7,6               | 1 800              | 2 700              | 5 698 790   |
| 7      | D        | standard                                       | 32        | 105       | 6,84              | 1 620              | 2 430              | 1 899 597   |
| 7      | E        | standard                                       | 80        | 118       | 6,08              | 1 440              | 2 160              | 633 199     |
| 8      | A        | standard                                       | 160       | 165       | 10,8              | 3 360              | 5 040              | 162 586 486 |
| 8      | B        | standard                                       | 256       | 180       | 9,9               | 3 080              | 4 620              | 54 195 495  |
| 8      | C        | standard                                       | 160       | 150       | 9                 | 2 800              | 4 200              | 18 065 165  |
| 8      | D        | standard                                       | 64        | 120       | 8,1               | 2 520              | 3 780              | 6 021 722   |
| 8      | E        | standard                                       | 160       | 135       | 7,2               | 2 240              | 3 360              | 2 007 241   |

*(Source : EDCD/coriolis-data, modules/standard/thrusters.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Frame Shift Drive standard — masse optimale, carburant maximal par saut et prix

Le FSD commande la portée de saut. Deux chiffres la gouvernent : la **masse optimale**, à laquelle le vaisseau saute à pleine portée, et le **carburant maximal consommable en un saut**. La notation relève les deux. Le FSD standard couvre les classes 2 à 7.

| Classe | Notation | Masse (t) | Intégrité | Consommation (MW) | Masse optimale (t) | Carburant max/saut (t) | Prix (Cr)  |
|--------|----------|-----------|-----------|-------------------|--------------------|------------------------|------------|
| 2      | A        | 2,5       | 64        | 0,3               | 90                 | 0,9                    | 160 224    |
| 2      | B        | 4         | 77        | 0,25              | 75                 | 0,8                    | 53 408     |
| 2      | C        | 2,5       | 51        | 0,2               | 60                 | 0,6                    | 17 803     |
| 2      | D        | 1         | 41        | 0,18              | 54                 | 0,6                    | 5 934      |
| 2      | E        | 2,5       | 46        | 0,16              | 48                 | 0,6                    | 1 978      |
| 3      | A        | 5         | 80        | 0,45              | 150                | 1,8                    | 507 912    |
| 3      | B        | 8         | 96        | 0,38              | 125                | 1,5                    | 169 304    |
| 3      | C        | 5         | 64        | 0,3               | 100                | 1,2                    | 56 435     |
| 3      | D        | 2         | 51        | 0,27              | 90                 | 1,2                    | 18 812     |
| 3      | E        | 5         | 58        | 0,24              | 80                 | 1,2                    | 6 271      |
| 4      | A        | 10        | 100       | 0,45              | 525                | 3                      | 1 610 080  |
| 4      | B        | 16        | 120       | 0,38              | 437,5              | 2,5                    | 536 693    |
| 4      | C        | 10        | 80        | 0,3               | 350                | 2                      | 178 898    |
| 4      | D        | 4         | 64        | 0,27              | 315                | 2                      | 59 633     |
| 4      | E        | 10        | 72        | 0,24              | 280                | 2                      | 19 878     |
| 5      | A        | 20        | 120       | 0,6               | 1 050              | 5                      | 5 103 953  |
| 5      | B        | 32        | 144       | 0,5               | 875                | 4,1                    | 1 701 318  |
| 5      | C        | 20        | 96        | 0,4               | 700                | 3,3                    | 567 106    |
| 5      | D        | 8         | 77        | 0,36              | 630                | 3,3                    | 189 035    |
| 5      | E        | 20        | 86        | 0,32              | 560                | 3,3                    | 63 012     |
| 6      | A        | 40        | 141       | 0,75              | 1 800              | 8                      | 16 179 531 |
| 6      | B        | 64        | 170       | 0,63              | 1 500              | 6,6                    | 5 393 177  |
| 6      | C        | 40        | 113       | 0,5               | 1 200              | 5,3                    | 1 797 726  |
| 6      | D        | 16        | 90        | 0,45              | 1 080              | 5,3                    | 599 242    |
| 6      | E        | 40        | 102       | 0,4               | 960                | 5,3                    | 199 747    |
| 7      | A        | 80        | 164       | 0,9               | 2 700              | 12,8                   | 51 289 112 |
| 7      | B        | 128       | 197       | 0,75              | 2 250              | 10,6                   | 17 096 371 |
| 7      | C        | 80        | 131       | 0,6               | 1 800              | 8,5                    | 5 698 790  |
| 7      | D        | 32        | 105       | 0,54              | 1 620              | 8,5                    | 1 899 597  |
| 7      | E        | 80        | 118       | 0,48              | 1 440              | 8,5                    | 633 199    |

*(Source : EDCD/coriolis-data, modules/standard/frame_shift_drive.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Frame Shift Drive (SCO) et FSD pré-ingénierés — la gamme étendue à la classe 8

Le Frame Shift Drive (SCO) ajoute la survitesse en supercruise et étend la gamme à la classe 8. Une variante **Mk II** existe en classe 8 A. Les entrées dites *pré-ingénierées* sortent d'usine avec les blueprints *Increased Range* et *Faster Boot Sequence* au grade 5 : le jeu de données ne leur associe pas de prix d'achat en chantier naval, d'où le tiret dans la colonne Prix.

| Classe | Notation | Variante                      | Masse (t) | Intégrité | Consommation (MW) | Masse optimale (t) | Carburant max/saut (t) | Prix (Cr)  |
|--------|----------|-------------------------------|-----------|-----------|-------------------|--------------------|------------------------|------------|
| 2      | A        | Frame Shift Drive (SCO)       | 2,5       | 64        | 0,3               | 100                | 1                      | 192 269    |
| 2      | B        | Frame Shift Drive (SCO)       | 2,5       | 57        | 0,25              | 90                 | 0,9                    | 64 090     |
| 2      | C        | Frame Shift Drive (SCO)       | 2,5       | 57        | 0,25              | 90                 | 0,9                    | 64 090     |
| 2      | D        | Frame Shift Drive (SCO)       | 2,5       | 57        | 0,25              | 90                 | 0,9                    | 64 090     |
| 2      | E        | Frame Shift Drive (SCO)       | 2,5       | 51        | 0,2               | 60                 | 0,6                    | 21 363     |
| 3      | A        | Frame Shift Drive (SCO)       | 5         | 80        | 0,45              | 167                | 1,9                    | 609 494    |
| 3      | B        | Frame Shift Drive (SCO)       | 5         | 70        | 0,38              | 150                | 1,8                    | 203 165    |
| 3      | C        | Frame Shift Drive (SCO)       | 5         | 70        | 0,38              | 150                | 1,8                    | 203 165    |
| 3      | D        | Frame Shift Drive (SCO)       | 2         | 70        | 0,38              | 150                | 1,8                    | 203 165    |
| 3      | E        | Frame Shift Drive (SCO)       | 5         | 64        | 0,3               | 100                | 1,2                    | 67 722     |
| 4      | A        | Frame Shift Drive (SCO)       | 10        | 100       | 0,45              | 585                | 3,2                    | 1 932 096  |
| 4      | B        | Frame Shift Drive (SCO)       | 10        | 90        | 0,38              | 525                | 3                      | 644 032    |
| 4      | C        | Frame Shift Drive (SCO)       | 10        | 90        | 0,38              | 525                | 3                      | 644 032    |
| 4      | D        | Frame Shift Drive (SCO)       | 4         | 90        | 0,38              | 525                | 3                      | 644 032    |
| 4      | E        | Frame Shift Drive (SCO)       | 10        | 80        | 0,3               | 350                | 2                      | 214 677    |
| 5      | A        | Frame Shift Drive (SCO)       | 20        | 120       | 0,6               | 1 175              | 5,2                    | 6 124 743  |
| 5      | B        | Frame Shift Drive (SCO)       | 20        | 110       | 0,5               | 1 050              | 5                      | 2 041 581  |
| 5      | C        | Frame Shift Drive (SCO)       | 20        | 110       | 0,5               | 1 050              | 5                      | 2 041 581  |
| 5      | D        | Frame Shift Drive (SCO)       | 8         | 110       | 0,5               | 1 050              | 5                      | 2 041 581  |
| 5      | E        | Frame Shift Drive (SCO)       | 20        | 95        | 0,45              | 700                | 3,3                    | 623 816    |
| 6      | A        | Frame Shift Drive (SCO)       | 40        | 141       | 0,75              | 2 000              | 8,3                    | 19 415 437 |
| 6      | B        | Frame Shift Drive (SCO)       | 40        | 130       | 0,63              | 1 800              | 8                      | 6 471 812  |
| 6      | C        | Frame Shift Drive (SCO)       | 40        | 130       | 0,63              | 1 800              | 8                      | 6 471 812  |
| 6      | D        | Frame Shift Drive (SCO)       | 16        | 130       | 0,63              | 1 800              | 8                      | 6 471 812  |
| 6      | E        | Frame Shift Drive (SCO)       | 40        | 113       | 0,5               | 1 200              | 5,3                    | 2 157 271  |
| 7      | A        | Frame Shift Drive (SCO)       | 80        | 164       | 0,9               | 3 000              | 13,1                   | 61 546 935 |
| 7      | B        | Frame Shift Drive (SCO)       | 80        | 150       | 0,75              | 2 700              | 12,8                   | 20 515 645 |
| 7      | C        | Frame Shift Drive (SCO)       | 80        | 150       | 0,75              | 2 700              | 12,8                   | 20 515 645 |
| 7      | D        | Frame Shift Drive (SCO)       | 32        | 2 700     | 0,75              | 2 700              | 12,8                   | 20 515 645 |
| 7      | E        | Frame Shift Drive (SCO)       | 80        | 131       | 0,6               | 1 800              | 8,5                    | 6 838 548  |
| 8      | A        | Frame Shift Drive (SCO)       | 160       | 188       | 1,05              | 4 670              | 20,7                   | 61 546 940 |
| 8      | A        | Frame Shift Drive Mk II (SCO) | 160       | 188       | 1,05              | 4 670              | 6,8                    | 82 042 060 |
| 8      | B        | Frame Shift Drive (SCO)       | 160       | 169       | 0,88              | 4 200              | 20,4                   | 20 515 650 |
| 8      | C        | Frame Shift Drive (SCO)       | 160       | 169       | 0,88              | 4 200              | 20,4                   | 20 515 650 |
| 8      | D        | Frame Shift Drive (SCO)       | 64        | 169       | 0,88              | 4 200              | 20,4                   | 20 515 650 |
| 8      | E        | Frame Shift Drive (SCO)       | 160       | 150       | 0,7               | 2 800              | 13,6                   | 6 838 550  |
| 2      | A        | FSD (SCO) PreEng (V1)         | 2,5       | 64        | 0,3               | 100                | 1                      | —          |
| 3      | A        | FSD (SCO) PreEng (V1)         | 5         | 80        | 0,45              | 167                | 1,9                    | —          |
| 4      | A        | FSD (SCO) PreEng (V1)         | 10        | 100       | 0,45              | 585                | 3,2                    | —          |
| 5      | A        | FSD (SCO) PreEng (V1)         | 20        | 120       | 0,6               | 1 175              | 5,2                    | —          |
| 5      | A        | FSD PreEng (V1)               | 20        | 120       | 0,6               | 1 050              | 5                      | 0          |
| 6      | A        | FSD (SCO) PreEng (V1)         | 40        | 141       | 0,75              | 2 000              | 8,3                    | —          |
| 7      | A        | V1 Frame Shift Drive (SCO)    | 80        | 164       | 0,9               | 3 000              | 13,1                   | —          |

*(Source : EDCD/coriolis-data, modules/standard/frame_shift_drive.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Support de vie (Life Support) — autonomie en oxygène et prix

Le support de vie fixe la durée pendant laquelle le pilote survit canopée brisée. L'autonomie va de 300 secondes en E à 1 500 secondes en A, identique à toutes les classes ; la notation fait aussi varier la masse, la consommation et l'intégrité du module — en classe 4 par exemple, de 4 t et 0,56 MW en D à 10 t et 0,74 MW en A.

| Classe | Notation | Masse (t) | Intégrité | Consommation (MW) | Autonomie en oxygène (s) | Amorçage (s) | Prix (Cr)  |
|--------|----------|-----------|-----------|-------------------|--------------------------|--------------|------------|
| 1      | A        | 1,3       | 48        | 0,48              | 1 500                    | 1            | 20 195     |
| 1      | B        | 2         | 44        | 0,44              | 900                      | 1            | 8 078      |
| 1      | C        | 1,3       | 40        | 0,4               | 600                      | 1            | 3 231      |
| 1      | D        | 0,5       | 36        | 0,36              | 450                      | 1            | 1 293      |
| 1      | E        | 1,3       | 32        | 0,32              | 300                      | 1            | 517        |
| 2      | A        | 2,5       | 61        | 0,55              | 1 500                    | 1            | 56 547     |
| 2      | B        | 4         | 56        | 0,51              | 900                      | 1            | 22 619     |
| 2      | C        | 2,5       | 51        | 0,46              | 600                      | 1            | 9 048      |
| 2      | D        | 1         | 46        | 0,41              | 450                      | 1            | 3 619      |
| 2      | E        | 2,5       | 41        | 0,37              | 300                      | 1            | 1 448      |
| 3      | A        | 5         | 77        | 0,64              | 1 500                    | 1            | 158 331    |
| 3      | B        | 8         | 70        | 0,58              | 900                      | 1            | 63 333     |
| 3      | C        | 5         | 64        | 0,53              | 600                      | 1            | 25 333     |
| 3      | D        | 2         | 58        | 0,48              | 450                      | 1            | 10 133     |
| 3      | E        | 5         | 51        | 0,42              | 300                      | 1            | 4 053      |
| 4      | A        | 10        | 96        | 0,74              | 1 500                    | 1            | 443 328    |
| 4      | B        | 16        | 88        | 0,68              | 900                      | 1            | 177 331    |
| 4      | C        | 10        | 80        | 0,62              | 600                      | 1            | 70 932     |
| 4      | D        | 4         | 72        | 0,56              | 450                      | 1            | 28 373     |
| 4      | E        | 10        | 64        | 0,5               | 300                      | 1            | 11 349     |
| 5      | A        | 20        | 115       | 0,85              | 1 500                    | 1            | 1 241 317  |
| 5      | B        | 32        | 106       | 0,78              | 900                      | 1            | 496 527    |
| 5      | C        | 20        | 96        | 0,71              | 600                      | 1            | 198 611    |
| 5      | D        | 8         | 86        | 0,64              | 450                      | 1            | 79 444     |
| 5      | E        | 20        | 77        | 0,57              | 300                      | 1            | 31 778     |
| 6      | A        | 40        | 136       | 0,96              | 1 500                    | 1            | 3 475 688  |
| 6      | B        | 64        | 124       | 0,88              | 900                      | 1            | 1 390 275  |
| 6      | C        | 40        | 113       | 0,8               | 600                      | 1            | 556 110    |
| 6      | D        | 16        | 102       | 0,72              | 450                      | 1            | 222 444    |
| 6      | E        | 40        | 90        | 0,64              | 300                      | 1            | 88 978     |
| 7      | A        | 80        | 157       | 1,08              | 1 500                    | 1            | 9 731 925  |
| 7      | B        | 128       | 144       | 0,99              | 900                      | 1            | 3 892 770  |
| 7      | C        | 80        | 131       | 0,9               | 600                      | 1            | 1 557 108  |
| 7      | D        | 32        | 118       | 0,81              | 450                      | 1            | 622 843    |
| 7      | E        | 80        | 105       | 0,72              | 300                      | 1            | 249 137    |
| 8      | A        | 160       | 180       | 1,2               | 1 500                    | 1            | 27 249 391 |
| 8      | B        | 256       | 165       | 1,1               | 900                      | 1            | 10 899 756 |
| 8      | C        | 160       | 150       | 1                 | 600                      | 1            | 4 359 903  |
| 8      | D        | 64        | 135       | 0,9               | 450                      | 1            | 1 743 961  |
| 8      | E        | 160       | 120       | 0,8               | 300                      | 1            | 697 584    |

*(Source : EDCD/coriolis-data, modules/standard/life_support.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Distributeur d'énergie (Power Distributor) — capacités et taux de recharge SYS, ENG et WEP

Le distributeur répartit l'énergie entre trois condensateurs : **SYS** (boucliers et modules défensifs), **ENG** (propulseurs et boost) et **WEP** (armes). Chaque condensateur a une **capacité** en MJ et un **taux de recharge** en MJ/s ; les deux chiffres sont donnés « capacité / recharge » dans les trois colonnes correspondantes. La notation augmente les six valeurs à la fois à partir de la classe 3 ; aux classes 1 et 2, les taux de recharge SYS et ENG stagnent sur certains paliers (0,6 MJ/s de E à B en classe 1, par exemple), seules la capacité et la recharge WEP progressant à chaque cran. Les huit entrées Guardian sont les distributeurs hybrides du Guardian Technology Broker.

| Classe | Notation | Variante | Masse (t) | Intégrité | Consommation (MW) | SYS cap. / recharge | ENG cap. / recharge | WEP cap. / recharge | Prix (Cr)  |
|--------|----------|----------|-----------|-----------|-------------------|---------------------|---------------------|---------------------|------------|
| 1      | A        | Guardian | 1,4       | 56        | 0,62              | 10 / 0,8            | 9 / 0,8             | 10 / 2,5            | 40 957     |
| 1      | A        | standard | 1,3       | 56        | 0,48              | 12 / 0,6            | 12 / 0,6            | 14 / 1,8            | 20 195     |
| 1      | B        | standard | 2         | 61        | 0,44              | 11 / 0,6            | 11 / 0,6            | 13 / 1,7            | 8 078      |
| 1      | C        | standard | 1,3       | 51        | 0,4               | 10 / 0,5            | 10 / 0,5            | 12 / 1,5            | 3 231      |
| 1      | D        | standard | 0,5       | 41        | 0,36              | 9 / 0,5             | 9 / 0,5             | 11 / 1,4            | 1 293      |
| 1      | E        | standard | 1,3       | 46        | 0,32              | 8 / 0,4             | 8 / 0,4             | 10 / 1,2            | 517        |
| 2      | A        | Guardian | 2,6       | 45        | 0,73              | 11 / 1              | 11 / 1              | 13 / 3,1            | 111 600    |
| 2      | A        | standard | 2,5       | 56        | 0,54              | 14 / 0,8            | 14 / 0,8            | 18 / 2,2            | 56 547     |
| 2      | B        | standard | 4         | 61        | 0,5               | 13 / 0,8            | 13 / 0,8            | 17 / 2              | 22 619     |
| 2      | C        | standard | 2,5       | 51        | 0,45              | 12 / 0,7            | 12 / 0,7            | 15 / 1,8            | 9 048      |
| 2      | D        | standard | 1         | 41        | 0,41              | 11 / 0,6            | 11 / 0,6            | 14 / 1,6            | 3 619      |
| 2      | E        | standard | 2,5       | 46        | 0,36              | 10 / 0,6            | 10 / 0,6            | 12 / 1,4            | 1 448      |
| 3      | A        | Guardian | 5,25      | 56        | 0,78              | 14 / 1,7            | 14 / 1,7            | 13 / 3,1            | 311 365    |
| 3      | A        | standard | 5         | 70        | 0,6               | 18 / 1,3            | 18 / 1,3            | 24 / 2,8            | 158 331    |
| 3      | B        | standard | 8         | 77        | 0,55              | 17 / 1,2            | 17 / 1,2            | 22 / 2,5            | 63 333     |
| 3      | C        | standard | 5         | 64        | 0,5               | 15 / 1,1            | 15 / 1,1            | 20 / 2,3            | 25 333     |
| 3      | D        | standard | 2         | 51        | 0,45              | 14 / 1              | 14 / 1              | 18 / 2,1            | 10 133     |
| 3      | E        | standard | 5         | 58        | 0,4               | 12 / 0,9            | 12 / 0,9            | 16 / 1,8            | 4 053      |
| 4      | A        | Guardian | 10,5      | 56        | 0,87              | 14 / 1,7            | 17 / 2,5            | 22 / 4,9            | 868 708    |
| 4      | A        | standard | 10        | 88        | 0,67              | 23 / 1,9            | 23 / 1,9            | 32 / 3,5            | 443 328    |
| 4      | B        | standard | 16        | 96        | 0,62              | 21 / 1,8            | 21 / 1,8            | 30 / 3,2            | 177 331    |
| 4      | C        | standard | 10        | 80        | 0,56              | 19 / 1,6            | 19 / 1,6            | 27 / 2,9            | 70 932     |
| 4      | D        | standard | 4         | 64        | 0,5               | 17 / 1,4            | 17 / 1,4            | 24 / 2,6            | 28 373     |
| 4      | E        | standard | 10        | 72        | 0,45              | 15 / 1,3            | 15 / 1,3            | 22 / 2,3            | 11 349     |
| 5      | A        | Guardian | 21        | 56        | 0,96              | 22 / 3,3            | 22 / 3,3            | 29 / 6              | 2 423 690  |
| 5      | A        | standard | 20        | 106       | 0,74              | 29 / 2,5            | 29 / 2,5            | 41 / 4,3            | 1 241 317  |
| 5      | B        | standard | 32        | 115       | 0,68              | 26 / 2,3            | 26 / 2,3            | 37 / 4              | 496 527    |
| 5      | C        | standard | 20        | 96        | 0,62              | 24 / 2,1            | 24 / 2,1            | 34 / 3,6            | 198 611    |
| 5      | D        | standard | 8         | 77        | 0,56              | 22 / 1,9            | 22 / 1,9            | 31 / 3,2            | 79 444     |
| 5      | E        | standard | 20        | 86        | 0,5               | 19 / 1,7            | 19 / 1,7            | 27 / 2,9            | 31 778     |
| 6      | A        | Guardian | 42        | 56        | 1,07              | 26 / 4,2            | 26 / 4,2            | 35 / 7,3            | 6 762 091  |
| 6      | A        | standard | 40        | 124       | 0,82              | 35 / 3,2            | 35 / 3,2            | 50 / 5,2            | 3 475 688  |
| 6      | B        | standard | 64        | 136       | 0,75              | 32 / 3              | 32 / 3              | 46 / 4,7            | 1 390 275  |
| 6      | C        | standard | 40        | 113       | 0,68              | 29 / 2,7            | 29 / 2,7            | 42 / 4,3            | 556 110    |
| 6      | D        | standard | 16        | 90        | 0,61              | 26 / 2,4            | 26 / 2,4            | 38 / 3,9            | 222 444    |
| 6      | E        | standard | 40        | 102       | 0,54              | 23 / 2,2            | 23 / 2,2            | 34 / 3,4            | 88 978     |
| 7      | A        | Guardian | 84        | 56        | 1,16              | 31 / 5,2            | 31 / 5,2            | 43 / 8,5            | 18 866 235 |
| 7      | A        | standard | 80        | 144       | 0,89              | 41 / 4              | 41 / 4              | 61 / 6,1            | 9 731 925  |
| 7      | B        | standard | 128       | 157       | 0,81              | 37 / 3,6            | 37 / 3,6            | 56 / 5,6            | 3 892 770  |
| 7      | C        | standard | 80        | 131       | 0,74              | 34 / 3,3            | 34 / 3,3            | 51 / 5,1            | 1 557 108  |
| 7      | D        | standard | 32        | 105       | 0,67              | 31 / 3              | 31 / 3              | 46 / 4,6            | 622 843    |
| 7      | E        | standard | 80        | 118       | 0,59              | 27 / 2,6            | 27 / 2,6            | 41 / 4,1            | 249 137    |
| 8      | A        | Guardian | 168       | 56        | 1,25              | 36 / 6,2            | 36 / 6,2            | 50 / 10,1           | 52 636 793 |
| 8      | A        | standard | 160       | 165       | 0,96              | 48 / 4,8            | 48 / 4,8            | 72 / 7,2            | 27 249 391 |
| 8      | B        | standard | 256       | 180       | 0,88              | 44 / 4,4            | 44 / 4,4            | 66 / 6,6            | 10 899 756 |
| 8      | C        | standard | 160       | 150       | 0,8               | 40 / 4              | 40 / 4              | 60 / 6              | 4 359 903  |
| 8      | D        | standard | 64        | 120       | 0,72              | 36 / 3,6            | 36 / 3,6            | 54 / 5,4            | 1 743 961  |
| 8      | E        | standard | 160       | 135       | 0,64              | 32 / 3,2            | 32 / 3,2            | 48 / 4,8            | 697 584    |

*(Source : EDCD/coriolis-data, modules/standard/power_distributor.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Senseurs (Sensors) — portée de détection typique et angle de balayage

Les senseurs fixent la distance à laquelle les contacts apparaissent au radar et l'angle du cône de détection. La portée est exprimée en kilomètres dans la source ; l'angle, en degrés de demi-ouverture, ne change ni avec la classe ni avec la notation.

| Classe | Notation | Masse (t) | Intégrité | Consommation (MW) | Portée de détection (km) | Angle de balayage (°) | Prix (Cr)  |
|--------|----------|-----------|-----------|-------------------|--------------------------|-----------------------|------------|
| 1      | A        | 1,3       | 56        | 0,6               | 6                        | 30                    | 20 195     |
| 1      | B        | 2         | 61        | 0,33              | 5,5                      | 30                    | 8 078      |
| 1      | C        | 1,3       | 51        | 0,2               | 5                        | 30                    | 3 231      |
| 1      | D        | 0,5       | 41        | 0,18              | 4,5                      | 30                    | 1 293      |
| 1      | E        | 1,3       | 46        | 0,16              | 4                        | 30                    | 517        |
| 2      | A        | 2,5       | 56        | 0,69              | 6,24                     | 30                    | 56 547     |
| 2      | B        | 4         | 61        | 0,38              | 5,72                     | 30                    | 22 619     |
| 2      | C        | 2,5       | 51        | 0,23              | 5,2                      | 30                    | 9 048      |
| 2      | D        | 1         | 41        | 0,21              | 4,68                     | 30                    | 3 619      |
| 2      | E        | 2,5       | 46        | 0,18              | 4,16                     | 30                    | 1 448      |
| 3      | A        | 5         | 70        | 0,84              | 6,48                     | 30                    | 158 331    |
| 3      | B        | 8         | 77        | 0,46              | 5,94                     | 30                    | 63 333     |
| 3      | C        | 5         | 64        | 0,28              | 5,4                      | 30                    | 25 333     |
| 3      | D        | 2         | 51        | 0,25              | 4,86                     | 30                    | 10 133     |
| 3      | E        | 5         | 58        | 0,22              | 4,32                     | 30                    | 4 053      |
| 4      | A        | 10        | 88        | 1,02              | 6,72                     | 30                    | 443 328    |
| 4      | B        | 16        | 96        | 0,56              | 6,16                     | 30                    | 177 331    |
| 4      | C        | 10        | 80        | 0,34              | 5,6                      | 30                    | 70 932     |
| 4      | D        | 4         | 64        | 0,31              | 5,04                     | 30                    | 28 373     |
| 4      | E        | 10        | 72        | 0,27              | 4,48                     | 30                    | 11 349     |
| 5      | A        | 20        | 106       | 1,23              | 6,96                     | 30                    | 1 241 317  |
| 5      | B        | 32        | 115       | 0,68              | 6,38                     | 30                    | 496 527    |
| 5      | C        | 20        | 96        | 0,41              | 5,8                      | 30                    | 198 611    |
| 5      | D        | 8         | 77        | 0,37              | 5,22                     | 30                    | 79 444     |
| 5      | E        | 20        | 86        | 0,33              | 4,64                     | 30                    | 31 778     |
| 6      | A        | 40        | 124       | 1,5               | 7,2                      | 30                    | 3 475 688  |
| 6      | B        | 64        | 136       | 0,83              | 6,6                      | 30                    | 1 390 275  |
| 6      | C        | 40        | 113       | 0,5               | 6                        | 30                    | 556 110    |
| 6      | D        | 16        | 90        | 0,45              | 5,4                      | 30                    | 222 444    |
| 6      | E        | 40        | 102       | 0,4               | 4,8                      | 30                    | 88 978     |
| 7      | A        | 80        | 144       | 1,77              | 7,44                     | 30                    | 9 731 925  |
| 7      | B        | 128       | 157       | 0,97              | 6,82                     | 30                    | 3 892 770  |
| 7      | C        | 80        | 131       | 0,59              | 6,2                      | 30                    | 1 557 108  |
| 7      | D        | 32        | 105       | 0,53              | 5,58                     | 30                    | 622 843    |
| 7      | E        | 80        | 118       | 0,47              | 4,96                     | 30                    | 249 137    |
| 8      | A        | 160       | 165       | 2,07              | 7,68                     | 30                    | 27 249 391 |
| 8      | B        | 256       | 180       | 1,14              | 7,04                     | 30                    | 10 899 756 |
| 8      | C        | 160       | 150       | 0,69              | 6,4                      | 30                    | 4 359 903  |
| 8      | D        | 64        | 120       | 0,62              | 5,76                     | 30                    | 1 743 961  |
| 8      | E        | 160       | 135       | 0,55              | 5,12                     | 30                    | 697 584    |

*(Source : EDCD/coriolis-data, modules/standard/sensors.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Réservoirs de carburant (Fuel Tank) — capacité en tonnes et prix

Le réservoir principal occupe un emplacement standard ; des réservoirs supplémentaires se montent en emplacements internes. Il n'existe qu'une notation, C : seule la classe fait varier la capacité, qui double à chaque classe. Le jeu de données ne porte pas de masse propre pour ce module — c'est le carburant embarqué qui pèse. Le dépôt amont répète ces mêmes huit entrées dans un second fichier, `modules/internal/internal_fuel_tank.json` ; elles ne sont pas dupliquées ici.

| Classe | Notation | Masse (t) | Capacité (t de carburant) | Prix (Cr) |
|--------|----------|-----------|---------------------------|-----------|
| 1      | C        | 0         | 2                         | 1 000     |
| 2      | C        | 0         | 4                         | 3 750     |
| 3      | C        | 0         | 8                         | 7 063     |
| 4      | C        | 0         | 16                        | 24 734    |
| 5      | C        | 0         | 32                        | 97 754    |
| 6      | C        | 0         | 64                        | 341 577   |
| 7      | C        | 0         | 128                       | 1 780 914 |
| 8      | C        | 0         | 256                       | 5 428 429 |

*(Source : EDCD/coriolis-data, modules/standard/fuel_tank.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Générateurs de bouclier standard (Shield Generator) — masse optimale et multiplicateurs

La force du bouclier vaut la force de bouclier de base du vaisseau multipliée par le **multiplicateur** du générateur, lui-même interpolé entre la masse minimale et la masse maximale supportées : à la **masse optimale**, le multiplicateur optimal s'applique tel quel ; au-delà, il descend vers le multiplicateur minimal. La notation A donne le multiplicateur le plus élevé, la notation D la masse la plus faible. Les résistances natives sont identiques sur toute la gamme : +40 % cinétique, +50 % explosif, −20 % thermique.

| Classe | Notation | Masse (t) | Intégrité | Consommation (MW) | Masse optimale (t) | Multiplicateur optimal | Multiplicateur min – max | Régénération (MJ/s) | Régén. bouclier tombé (MJ/s) | Ponction distributeur (MJ/s) | Prix (Cr)   |
|--------|----------|-----------|-----------|-------------------|--------------------|------------------------|--------------------------|---------------------|------------------------------|------------------------------|-------------|
| 1      | A        | 1,3       | 48        | 1,68              | 25                 | 1,2                    | 0,7 – 1,7                | 1                   | 1,6                          | 0,6                          | 88 075      |
| 1      | C        | 1,3       | 40        | 1,2               | 25                 | 1                      | 0,5 – 1,5                | 1                   | 1,6                          | 0,6                          | 5 140       |
| 1      | D        | 0,5       | 24        | 0,96              | 25                 | 0,9                    | 0,4 – 1,4                | 1                   | 1,6                          | 0,6                          | 1 240       |
| 1      | E        | 1,3       | 32        | 0,72              | 25                 | 0,8                    | 0,3 – 1,3                | 1                   | 1,6                          | 0,6                          | 300         |
| 2      | A        | 2,5       | 61        | 2,1               | 55                 | 1,2                    | 0,7 – 1,7                | 1                   | 1,6                          | 0,6                          | 160 224     |
| 2      | B        | 4         | 71        | 1,8               | 55                 | 1,1                    | 0,6 – 1,6                | 1                   | 1,6                          | 0,6                          | 53 408      |
| 2      | C        | 2,5       | 51        | 1,5               | 55                 | 1                      | 0,5 – 1,5                | 1                   | 1,6                          | 0,6                          | 17 803      |
| 2      | D        | 1         | 31        | 1,2               | 55                 | 0,9                    | 0,4 – 1,4                | 1                   | 1,6                          | 0,6                          | 5 934       |
| 2      | E        | 2,5       | 41        | 0,9               | 55                 | 0,8                    | 0,3 – 1,3                | 1                   | 1,6                          | 0,6                          | 1 978       |
| 3      | A        | 5         | 77        | 2,52              | 165                | 1,2                    | 0,7 – 1,7                | 1                   | 1,87                         | 0,6                          | 507 912     |
| 3      | B        | 8         | 90        | 2,16              | 165                | 1,1                    | 0,6 – 1,6                | 1                   | 1,87                         | 0,6                          | 169 304     |
| 3      | C        | 5         | 64        | 1,8               | 165                | 1                      | 0,5 – 1,5                | 1                   | 1,87                         | 0,6                          | 56 435      |
| 3      | D        | 2         | 38        | 1,44              | 165                | 0,9                    | 0,4 – 1,4                | 1                   | 1,87                         | 0,6                          | 18 812      |
| 3      | E        | 5         | 51        | 1,08              | 165                | 0,8                    | 0,3 – 1,3                | 1                   | 1,87                         | 0,6                          | 6 271       |
| 4      | A        | 10        | 96        | 3,08              | 285                | 1,2                    | 0,7 – 1,7                | 1                   | 2,53                         | 0,6                          | 1 610 080   |
| 4      | B        | 16        | 112       | 2,64              | 285                | 1,1                    | 0,6 – 1,6                | 1                   | 2,53                         | 0,6                          | 536 693     |
| 4      | C        | 10        | 80        | 2,2               | 285                | 1                      | 0,5 – 1,5                | 1                   | 2,53                         | 0,6                          | 178 898     |
| 4      | D        | 4         | 48        | 1,76              | 285                | 0,9                    | 0,4 – 1,4                | 1                   | 2,53                         | 0,6                          | 59 633      |
| 4      | E        | 10        | 64        | 1,32              | 285                | 0,8                    | 0,3 – 1,3                | 1                   | 2,53                         | 0,6                          | 19 878      |
| 5      | A        | 20        | 115       | 3,64              | 405                | 1,2                    | 0,7 – 1,7                | 1                   | 3,75                         | 0,6                          | 5 103 953   |
| 5      | B        | 32        | 134       | 3,12              | 405                | 1,1                    | 0,6 – 1,6                | 1                   | 3,75                         | 0,6                          | 1 701 318   |
| 5      | C        | 20        | 96        | 2,6               | 405                | 1                      | 0,5 – 1,5                | 1                   | 3,75                         | 0,6                          | 567 106     |
| 5      | D        | 8         | 58        | 2,08              | 405                | 0,9                    | 0,4 – 1,4                | 1                   | 3,75                         | 0,6                          | 189 035     |
| 5      | E        | 20        | 77        | 1,56              | 405                | 0,8                    | 0,3 – 1,3                | 1                   | 3,75                         | 0,6                          | 63 012      |
| 6      | A        | 40        | 136       | 4,34              | 540                | 1,2                    | 0,7 – 1,7                | 1,3                 | 5,33                         | 0,6                          | 16 179 531  |
| 6      | B        | 64        | 158       | 3,72              | 540                | 1,1                    | 0,6 – 1,6                | 1,3                 | 5,33                         | 0,6                          | 5 393 177   |
| 6      | C        | 40        | 113       | 3,1               | 540                | 1                      | 0,5 – 1,5                | 1,3                 | 5,33                         | 0,6                          | 1 797 726   |
| 6      | D        | 16        | 68        | 2,48              | 540                | 0,9                    | 0,4 – 1,4                | 1,3                 | 5,33                         | 0,6                          | 599 242     |
| 6      | E        | 40        | 90        | 1,86              | 540                | 0,8                    | 0,3 – 1,3                | 1,3                 | 5,33                         | 0,6                          | 199 747     |
| 7      | A        | 80        | 157       | 4,9               | 1 060              | 1,2                    | 0,7 – 1,7                | 1,8                 | 7,33                         | 0,6                          | 51 289 112  |
| 7      | B        | 128       | 183       | 4,2               | 1 060              | 1,1                    | 0,6 – 1,6                | 1,8                 | 7,33                         | 0,6                          | 17 096 371  |
| 7      | C        | 80        | 131       | 3,5               | 1 060              | 1                      | 0,5 – 1,5                | 1,8                 | 7,33                         | 0,6                          | 5 698 790   |
| 7      | D        | 32        | 79        | 2,8               | 1 060              | 0,9                    | 0,4 – 1,4                | 1,8                 | 7,33                         | 0,6                          | 1 899 597   |
| 7      | E        | 80        | 105       | 2,1               | 1 060              | 0,8                    | 0,3 – 1,3                | 1,8                 | 7,33                         | 0,6                          | 633 199     |
| 8      | A        | 160       | 180       | 5,6               | 1 800              | 1,2                    | 0,7 – 1,7                | 2,4                 | 9,6                          | 0,6                          | 162 586 486 |
| 8      | B        | 256       | 210       | 4,8               | 1 800              | 1,1                    | 0,6 – 1,6                | 2,4                 | 9,6                          | 0,6                          | 54 195 495  |
| 8      | C        | 160       | 150       | 4                 | 1 800              | 1                      | 0,5 – 1,5                | 2,4                 | 9,6                          | 0,6                          | 18 065 165  |
| 8      | D        | 64        | 90        | 3,2               | 1 800              | 0,9                    | 0,4 – 1,4                | 2,4                 | 9,6                          | 0,6                          | 6 021 722   |
| 8      | E        | 160       | 120       | 2,4               | 1 800              | 0,8                    | 0,3 – 1,3                | 2,4                 | 9,6                          | 0,6                          | 2 007 241   |

*(Source : EDCD/coriolis-data, modules/internal/shield_generator.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Bi-Weave et Prismatic Shield Generator — les deux variantes de générateur

Le **Bi-Weave**, vendu en notation C seulement, régénère nettement plus vite qu'un générateur standard pour une capacité moindre. Le **Prismatic**, récompense Powerplay en notation A, fait l'inverse : capacité maximale, régénération lente et consommation élevée. Mêmes colonnes que la table précédente, avec une colonne Type en tête.

| Classe | Notation | Type      | Masse (t) | Intégrité | Consommation (MW) | Masse optimale (t) | Multiplicateur optimal | Multiplicateur min – max | Régénération (MJ/s) | Régén. bouclier tombé (MJ/s) | Ponction distributeur (MJ/s) | Prix (Cr)   |
|--------|----------|-----------|-----------|-----------|-------------------|--------------------|------------------------|--------------------------|---------------------|------------------------------|------------------------------|-------------|
| 1      | C        | Bi-Weave  | 1,3       | 40        | 1,2               | 25                 | 0,9                    | 0,4 – 1,4                | 1,8                 | 2,4                          | 0,6                          | 7 713       |
| 2      | C        | Bi-Weave  | 2,5       | 51        | 1,5               | 55                 | 0,9                    | 0,4 – 1,4                | 1,8                 | 2,4                          | 0,6                          | 26 705      |
| 3      | C        | Bi-Weave  | 5         | 64        | 1,8               | 165                | 0,9                    | 0,4 – 1,4                | 1,8                 | 2,8                          | 0,6                          | 84 653      |
| 4      | C        | Bi-Weave  | 10        | 80        | 2,2               | 285                | 0,9                    | 0,4 – 1,4                | 1,8                 | 3,8                          | 0,6                          | 268 347     |
| 5      | C        | Bi-Weave  | 20        | 96        | 2,6               | 405                | 0,9                    | 0,4 – 1,4                | 2,2                 | 5,6                          | 0,6                          | 850 659     |
| 6      | C        | Bi-Weave  | 40        | 113       | 3,1               | 540                | 0,9                    | 0,4 – 1,4                | 3,2                 | 8                            | 0,6                          | 2 696 589   |
| 7      | C        | Bi-Weave  | 80        | 131       | 3,5               | 1 060              | 0,9                    | 0,4 – 1,4                | 4,4                 | 11                           | 0,6                          | 8 548 185   |
| 8      | C        | Bi-Weave  | 160       | 150       | 4                 | 1 800              | 0,9                    | 0,4 – 1,4                | 5,8                 | 14,4                         | 0,6                          | 27 097 748  |
| 1      | A        | Prismatic | 2,5       | 48        | 2,52              | 25                 | 1,5                    | 1 – 2                    | 1                   | 1,2                          | 0,6                          | 132 200     |
| 2      | A        | Prismatic | 5         | 61        | 3,15              | 55                 | 1,5                    | 1 – 2                    | 1                   | 1,2                          | 0,6                          | 240 340     |
| 3      | A        | Prismatic | 10        | 77        | 3,78              | 165                | 1,5                    | 1 – 2                    | 1                   | 1,3                          | 0,6                          | 761 870     |
| 4      | A        | Prismatic | 20        | 96        | 4,62              | 285                | 1,5                    | 1 – 2                    | 1                   | 1,7                          | 0,6                          | 2 415 120   |
| 5      | A        | Prismatic | 40        | 115       | 5,46              | 405                | 1,5                    | 1 – 2                    | 1                   | 2,3                          | 0,6                          | 7 655 930   |
| 6      | A        | Prismatic | 80        | 136       | 6,51              | 540                | 1,5                    | 1 – 2                    | 1                   | 3,2                          | 0,6                          | 24 269 300  |
| 7      | A        | Prismatic | 160       | 157       | 7,35              | 1 060              | 1,5                    | 1 – 2                    | 1,1                 | 4,2                          | 0,6                          | 76 933 670  |
| 8      | A        | Prismatic | 320       | 180       | 8,4               | 1 800              | 1,5                    | 1 – 2                    | 1,4                 | 5,4                          | 0,6                          | 243 879 730 |

*(Source : EDCD/coriolis-data, modules/internal/bi_weave_shield_generator.json, modules/internal/pristmatic_shield_generator.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Shield Cell Bank — recharge par cellule, réserve et charge thermique

La Shield Cell Bank recharge un bouclier encore debout au prix d'un pic de chaleur. La colonne **Recharge par cellule** est le champ `shieldreinforcement` de la source, exprimé en MJ rendus par seconde d'activation ; **Durée** est la durée d'une activation, **Amorçage** le délai avant effet. La colonne Munitions donne « cellules chargées / réserve embarquée ». La charge thermique est celle d'une activation complète.

| Classe | Notation | Masse (t) | Intégrité | Consommation (MW) | Recharge par cellule (MJ/s) | Durée (s) | Amorçage (s) | Cellules / réserve | Charge thermique | Prix d'une recharge (Cr) | Prix (Cr)  |
|--------|----------|-----------|-----------|-------------------|-----------------------------|-----------|--------------|--------------------|------------------|--------------------------|------------|
| 1      | A        | 1,3       | 48        | 0,97              | 28                          | 1         | 5            | 1 / 2              | 170              | 300                      | 20 195     |
| 1      | B        | 2         | 56        | 0,83              | 24                          | 1         | 5            | 1 / 3              | 170              | 300                      | 8 078      |
| 1      | C        | 1,3       | 40        | 0,69              | 20                          | 1         | 5            | 1 / 2              | 170              | 300                      | 3 231      |
| 1      | D        | 0,5       | 24        | 0,55              | 12,5                        | 1         | 5            | 1 / 0              | 170              | 300                      | 1 293      |
| 1      | E        | 1,3       | 32        | 0,41              | 12                          | 1         | 5            | 1 / 3              | 170              | 300                      | 517        |
| 2      | A        | 2,5       | 61        | 1,18              | 32                          | 2         | 5            | 1 / 3              | 240              | 300                      | 56 547     |
| 2      | B        | 4         | 71        | 1,01              | 28                          | 2         | 5            | 1 / 4              | 240              | 300                      | 22 619     |
| 2      | C        | 2,5       | 51        | 0,84              | 23                          | 2         | 5            | 1 / 3              | 240              | 300                      | 9 048      |
| 2      | D        | 1         | 31        | 0,67              | 18                          | 2         | 5            | 1 / 2              | 240              | 300                      | 3 619      |
| 2      | E        | 2,5       | 41        | 0,5               | 14                          | 2         | 5            | 1 / 4              | 240              | 300                      | 1 448      |
| 3      | A        | 5         | 77        | 1,43              | 41                          | 2         | 5            | 1 / 3              | 340              | 300                      | 158 331    |
| 3      | B        | 8         | 90        | 1,22              | 35                          | 2         | 5            | 1 / 4              | 340              | 300                      | 63 333     |
| 3      | C        | 5         | 64        | 1,02              | 29                          | 2         | 5            | 1 / 3              | 340              | 300                      | 25 333     |
| 3      | D        | 2         | 38        | 0,82              | 23                          | 2         | 5            | 1 / 2              | 340              | 300                      | 10 133     |
| 3      | E        | 5         | 51        | 0,61              | 17                          | 2         | 5            | 1 / 4              | 340              | 300                      | 4 053      |
| 4      | A        | 10        | 96        | 1,72              | 46                          | 3         | 5            | 1 / 3              | 410              | 300                      | 443 328    |
| 4      | B        | 16        | 112       | 1,48              | 39                          | 3         | 5            | 1 / 4              | 410              | 300                      | 177 331    |
| 4      | C        | 10        | 80        | 1,23              | 33                          | 3         | 5            | 1 / 3              | 410              | 300                      | 70 932     |
| 4      | D        | 4         | 48        | 0,98              | 26                          | 3         | 5            | 1 / 2              | 410              | 300                      | 28 373     |
| 4      | E        | 10        | 64        | 0,74              | 20                          | 3         | 5            | 1 / 4              | 410              | 300                      | 11 349     |
| 5      | A        | 20        | 115       | 2,1               | 48                          | 5         | 5            | 1 / 3              | 540              | 300                      | 1 241 317  |
| 5      | B        | 32        | 134       | 1,8               | 41                          | 5         | 5            | 1 / 4              | 540              | 300                      | 496 527    |
| 5      | C        | 20        | 96        | 1,5               | 35                          | 5         | 5            | 1 / 3              | 540              | 300                      | 198 611    |
| 5      | D        | 8         | 58        | 1,2               | 28                          | 5         | 5            | 1 / 2              | 540              | 300                      | 79 444     |
| 5      | E        | 20        | 77        | 0,9               | 21                          | 5         | 5            | 1 / 4              | 540              | 300                      | 31 778     |
| 6      | A        | 40        | 136       | 2,48              | 46                          | 8         | 5            | 1 / 4              | 640              | 300                      | 3 475 688  |
| 6      | B        | 64        | 158       | 2,12              | 39                          | 8         | 5            | 1 / 5              | 640              | 300                      | 1 390 275  |
| 6      | C        | 40        | 113       | 1,77              | 33                          | 8         | 5            | 1 / 4              | 640              | 300                      | 556 110    |
| 6      | D        | 16        | 68        | 1,42              | 26                          | 8         | 5            | 1 / 3              | 640              | 300                      | 222 444    |
| 6      | E        | 40        | 90        | 1,06              | 20                          | 8         | 5            | 1 / 5              | 640              | 300                      | 88 978     |
| 7      | A        | 80        | 157       | 2,9               | 57                          | 11        | 5            | 1 / 4              | 720              | 300                      | 9 731 925  |
| 7      | B        | 128       | 183       | 2,48              | 49                          | 11        | 5            | 1 / 5              | 720              | 300                      | 3 892 770  |
| 7      | C        | 80        | 131       | 2,07              | 41                          | 11        | 5            | 1 / 4              | 720              | 300                      | 1 557 108  |
| 7      | D        | 32        | 79        | 1,66              | 32                          | 11        | 5            | 1 / 3              | 720              | 300                      | 622 843    |
| 7      | E        | 80        | 105       | 1,24              | 24                          | 11        | 5            | 1 / 5              | 720              | 300                      | 249 137    |
| 8      | A        | 160       | 180       | 3,36              | 65                          | 17        | 5            | 1 / 4              | 800              | 300                      | 27 249 391 |
| 8      | B        | 256       | 210       | 2,88              | 56                          | 17        | 5            | 1 / 5              | 800              | 300                      | 10 899 756 |
| 8      | C        | 160       | 150       | 2,4               | 47                          | 17        | 5            | 1 / 4              | 800              | 300                      | 4 359 903  |
| 8      | D        | 64        | 90        | 1,92              | 37                          | 17        | 5            | 1 / 3              | 800              | 300                      | 1 743 961  |
| 8      | E        | 160       | 120       | 1,44              | 28                          | 17        | 5            | 1 / 5              | 800              | 300                      | 697 584    |

*(Source : EDCD/coriolis-data, modules/internal/shield_cell_bank.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Soutes (Cargo Rack) — capacité en tonnes et prix

La soute est le module le plus simple du jeu : une capacité qui double à chaque classe, aucune consommation électrique et aucune masse propre. Deux variantes s'ajoutent à la soute standard : les soutes **Corrosion Resistant** de classes 5 et 6, qui seules acceptent les cargaisons corrosives, et les **Mk II Cargo Rack** de classes 7 et 8, réservées au Panther Clipper Mk II.

| Module                              | Classe | Notation | Masse (t) | Capacité (t) | Prix (Cr) |
|-------------------------------------|--------|----------|-----------|--------------|-----------|
| Cargo Rack                          | 1      | E        | 0         | 2            | 1 000     |
| Corrosion Resistant Cargo Rack      | 1      | E        | 0         | 1            | 6 250     |
| Corrosion Resistant Cargo Rack      | 1      | F        | 0         | 2            | 0         |
| Cargo Rack                          | 2      | E        | 0         | 4            | 3 250     |
| Cargo Rack                          | 3      | E        | 0         | 8            | 10 563    |
| Cargo Rack                          | 4      | E        | 0         | 16           | 34 328    |
| Corrosion Resistant Cargo Rack      | 4      | E        | 0         | 16           | 94 330    |
| Cargo Rack                          | 5      | E        | 0         | 32           | 111 566   |
| Extended Cargo Rack (pré-ingénieré) | 5      | E        | 0         | 32           | 0         |
| Corrosion Resistant                 | 5      | E        | 0         | 32           | 0         |
| Cargo Rack                          | 6      | E        | 0         | 64           | 362 591   |
| Extended Cargo Rack (pré-ingénieré) | 6      | E        | 0         | 64           | 0         |
| Corrosion Resistant                 | 6      | E        | 0         | 64           | 0         |
| Cargo Rack                          | 7      | E        | 0         | 128          | 1 178 420 |
| Cargo Rack                          | 8      | E        | 0         | 256          | 3 829 866 |
| Mk II Cargo Rack                    | 7      | D        | 0         | 192          | 1 958 680 |
| Mk II Cargo Rack                    | 8      | D        | 0         | 384          | 4 929 317 |

*(Source : EDCD/coriolis-data, modules/internal/cargo_rack.json, modules/internal/cargo_rack_large.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Collecteur de carburant (Fuel Scoop) — débit en kg/s et prix

Le collecteur remplit les réservoirs en frôlant une étoile de classe KGBFOAM (K, G, B, F, O, A, M). Sa statistique déterminante est le **débit**, en kilogrammes de carburant par seconde, tel que le déclare le jeu de données ; le module n'y a pas de masse propre. **Ce débit caractérise le module, pas l'étoile.** Savoir quelles classes stellaires se laissent écoper relève de l'usage, traité dans [10-exploration.md](./10-exploration.md), qui reprend le mnémonique KGBFOAM classe par classe sur l'énumération du jeu — et qui signale que cette donnée-là est **binaire** : aucune source accessible ne publie de débit ni de coefficient de collecte par classe d'étoile, et ce guide-ci n'en avance donc aucun. La table ci-dessous reste la référence sur la caractéristique du module.

| Classe | Notation | Masse (t) | Consommation (MW) | Débit (kg/s) | Prix (Cr)   |
|--------|----------|-----------|-------------------|--------------|-------------|
| 1      | A        | —         | 0,32              | 42           | 82 270      |
| 1      | B        | —         | 0,28              | 36           | 20 568      |
| 1      | C        | —         | 0,23              | 30           | 5 142       |
| 1      | D        | —         | 0,18              | 24           | 1 285       |
| 1      | E        | —         | 0,14              | 18           | 309         |
| 2      | A        | —         | 0,39              | 75           | 284 844     |
| 2      | B        | —         | 0,34              | 65           | 71 211      |
| 2      | C        | —         | 0,28              | 54           | 17 803      |
| 2      | D        | —         | 0,22              | 43           | 4 451       |
| 2      | E        | —         | 0,17              | 32           | 1 068       |
| 3      | A        | —         | 0,48              | 176          | 902 954     |
| 3      | B        | —         | 0,41              | 151          | 225 738     |
| 3      | C        | —         | 0,34              | 126          | 56 435      |
| 3      | D        | —         | 0,27              | 100          | 14 109      |
| 3      | E        | —         | 0,2               | 75           | 3 386       |
| 4      | A        | —         | 0,57              | 342          | 2 862 364   |
| 4      | B        | —         | 0,49              | 294          | 715 591     |
| 4      | C        | —         | 0,41              | 245          | 178 898     |
| 4      | D        | —         | 0,33              | 196          | 44 724      |
| 4      | E        | —         | 0,25              | 147          | 10 734      |
| 5      | A        | —         | 0,7               | 577          | 9 073 694   |
| 5      | B        | —         | 0,6               | 494          | 2 268 424   |
| 5      | C        | —         | 0,5               | 412          | 567 106     |
| 5      | D        | —         | 0,4               | 330          | 141 776     |
| 5      | E        | —         | 0,3               | 247          | 34 026      |
| 6      | A        | —         | 0,83              | 878          | 28 763 610  |
| 6      | B        | —         | 0,71              | 752          | 7 190 903   |
| 6      | C        | —         | 0,59              | 627          | 1 797 726   |
| 6      | D        | —         | 0,47              | 502          | 449 431     |
| 6      | E        | —         | 0,35              | 376          | 107 864     |
| 7      | A        | —         | 0,97              | 1 245        | 91 180 644  |
| 7      | B        | —         | 0,83              | 1 068        | 22 795 161  |
| 7      | C        | —         | 0,69              | 890          | 5 698 790   |
| 7      | D        | —         | 0,55              | 712          | 1 424 698   |
| 7      | E        | —         | 0,41              | 534          | 341 927     |
| 8      | A        | —         | 1,12              | 1 680        | 289 042 641 |
| 8      | B        | —         | 0,96              | 1 440        | 72 260 660  |
| 8      | C        | —         | 0,8               | 1 200        | 18 065 165  |
| 8      | D        | —         | 0,64              | 960          | 4 516 291   |
| 8      | E        | —         | 0,48              | 720          | 1 083 910   |

*(Source : EDCD/coriolis-data, modules/internal/fuel_scoop.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Unité de maintenance automatique (AFMU) — capacité de réparation et munitions

L'AFMU répare en vol les modules endommagés, y compris détruits, mais jamais la coque ni elle-même. Elle consomme des **munitions** — une réserve de nanomatériaux rechargée en station — et le champ `repair` mesure la quantité d'intégrité rendue par unité consommée : c'est le rendement de l'unité. La notation A répare le plus vite, la notation E emporte le plus de munitions.

| Classe | Notation | Masse (t) | Consommation (MW) | Rendement de réparation | Munitions | Prix unitaire des munitions (Cr) | Prix (Cr)  |
|--------|----------|-----------|-------------------|-------------------------|-----------|----------------------------------|------------|
| 1      | A        | —         | 1,26              | 30,8                    | 1 100     | 1                                | 810 000    |
| 1      | B        | —         | 1,04              | 27,6                    | 1 200     | 1                                | 270 000    |
| 1      | C        | —         | 0,9               | 20                      | 1 000     | 1                                | 90 000     |
| 1      | D        | —         | 0,72              | 14,4                    | 900       | 1                                | 30 000     |
| 1      | E        | —         | 0,54              | 12                      | 1 000     | 1                                | 10 000     |
| 2      | A        | —         | 1,58              | 70                      | 2 500     | 1                                | 1 458 000  |
| 2      | B        | —         | 1,29              | 64,4                    | 2 800     | 1                                | 486 000    |
| 2      | C        | —         | 1,13              | 46                      | 2 300     | 1                                | 162 000    |
| 2      | D        | —         | 0,9               | 33,6                    | 2 100     | 1                                | 54 000     |
| 2      | E        | —         | 0,68              | 27,6                    | 2 300     | 1                                | 18 000     |
| 3      | A        | —         | 1,89              | 112                     | 4 000     | 1                                | 2 624 400  |
| 3      | B        | —         | 1,55              | 98,9                    | 4 300     | 1                                | 874 800    |
| 3      | C        | —         | 1,35              | 72                      | 3 600     | 1                                | 291 600    |
| 3      | D        | —         | 1,08              | 51,2                    | 3 200     | 1                                | 97 200     |
| 3      | E        | —         | 0,81              | 43,2                    | 3 600     | 1                                | 32 400     |
| 4      | A        | —         | 2,31              | 151,2                   | 5 400     | 1                                | 4 723 920  |
| 4      | B        | —         | 1,9               | 135,7                   | 5 900     | 1                                | 1 574 640  |
| 4      | C        | —         | 1,65              | 98                      | 4 900     | 1                                | 524 880    |
| 4      | D        | —         | 1,32              | 70,4                    | 4 400     | 1                                | 174 960    |
| 4      | E        | —         | 0,99              | 58,8                    | 4 900     | 1                                | 58 320     |
| 5      | A        | —         | 2,73              | 187,6                   | 6 700     | 1                                | 8 503 056  |
| 5      | B        | —         | 2,24              | 167,9                   | 7 300     | 1                                | 2 834 352  |
| 5      | C        | —         | 1,95              | 122                     | 6 100     | 1                                | 944 784    |
| 5      | D        | —         | 1,56              | 88                      | 5 500     | 1                                | 314 928    |
| 5      | E        | —         | 1,17              | 73,2                    | 6 100     | 1                                | 104 976    |
| 6      | A        | —         | 3,26              | 226,8                   | 8 100     | 1                                | 15 305 501 |
| 6      | B        | —         | 2,67              | 204,7                   | 8 900     | 1                                | 5 101 834  |
| 6      | C        | —         | 2,33              | 148                     | 7 400     | 1                                | 1 700 611  |
| 6      | D        | —         | 1,86              | 107,2                   | 6 700     | 1                                | 566 870    |
| 6      | E        | —         | 1,4               | 88,8                    | 7 400     | 1                                | 188 957    |
| 7      | A        | —         | 3,68              | 268,8                   | 9 600     | 1                                | 27 549 901 |
| 7      | B        | —         | 3,02              | 239,2                   | 10 400    | 1                                | 9 183 300  |
| 7      | C        | —         | 2,63              | 174                     | 8 700     | 1                                | 3 061 100  |
| 7      | D        | —         | 2,1               | 124,8                   | 7 800     | 1                                | 1 020 367  |
| 7      | E        | —         | 1,58              | 104,4                   | 8 700     | 1                                | 340 122    |
| 8      | A        | —         | 4,2               | 308                     | 11 000    | 1                                | 49 589 823 |
| 8      | B        | —         | 3,45              | 276                     | 12 000    | 1                                | 16 529 941 |
| 8      | C        | —         | 3                 | 200                     | 10 000    | 1                                | 5 509 980  |
| 8      | D        | —         | 2,4               | 144                     | 9 000     | 1                                | 1 836 660  |
| 8      | E        | —         | 1,8               | 120                     | 10 000    | 1                                | 612 220    |

*(Source : EDCD/coriolis-data, modules/internal/auto_field_maintenance_unit.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Raffinerie (Refinery) — nombre de bacs de traitement et prix

La raffinerie transforme les fragments miniers en tonnes vendables. Son unique statistique est le nombre de **bacs** traités simultanément : chaque bac accueille un minerai différent, et un bac supplémentaire évite de devoir vider un minerai à demi raffiné pour en commencer un autre. Elle n'existe qu'en classes 1 à 4.

| Classe | Notation | Masse (t) | Consommation (MW) | Bacs de traitement | Prix (Cr) |
|--------|----------|-----------|-------------------|--------------------|-----------|
| 1      | A        | —         | 0,32              | 4                  | 486 000   |
| 1      | B        | —         | 0,28              | 3                  | 162 000   |
| 1      | C        | —         | 0,23              | 2                  | 54 000    |
| 1      | D        | —         | 0,18              | 1                  | 18 000    |
| 1      | E        | —         | 0,14              | 1                  | 6 000     |
| 2      | A        | —         | 0,39              | 6                  | 1 020 600 |
| 2      | B        | —         | 0,34              | 5                  | 340 200   |
| 2      | C        | —         | 0,28              | 4                  | 113 400   |
| 2      | D        | —         | 0,22              | 3                  | 37 800    |
| 2      | E        | —         | 0,17              | 2                  | 12 600    |
| 3      | A        | —         | 0,48              | 8                  | 2 143 260 |
| 3      | B        | —         | 0,41              | 7                  | 714 420   |
| 3      | C        | —         | 0,34              | 6                  | 238 140   |
| 3      | D        | —         | 0,27              | 4                  | 79 380    |
| 3      | E        | —         | 0,2               | 3                  | 26 460    |
| 4      | A        | —         | 0,57              | 10                 | 4 500 846 |
| 4      | B        | —         | 0,49              | 9                  | 1 500 282 |
| 4      | C        | —         | 0,41              | 7                  | 500 094   |
| 4      | D        | —         | 0,33              | 5                  | 166 698   |
| 4      | E        | —         | 0,25              | 4                  | 55 566    |

*(Source : EDCD/coriolis-data, modules/internal/refinery.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Frame Shift Drive Interdictor — durée de verrouillage et angle de capture

L'interdicteur arrache une cible du supercruise. Le champ `ranget` est la **durée de verrouillage** en secondes avant déclenchement, et `facinglimit` l'**angle de capture** : au-delà de cet écart angulaire, la cible échappe au verrouillage. La notation A verrouille le plus vite et tolère l'angle le plus large.

| Classe | Notation | Masse (t) | Intégrité | Consommation (MW) | Durée de verrouillage (s) | Angle de capture (°) | Amorçage (s) | Prix (Cr)  |
|--------|----------|-----------|-----------|-------------------|---------------------------|----------------------|--------------|------------|
| 1      | A        | 1,3       | 48        | 0,32              | 7                         | 50                   | 15           | 972 000    |
| 1      | B        | 2         | 56        | 0,28              | 6                         | 50                   | 15           | 324 000    |
| 1      | C        | 1,3       | 40        | 0,23              | 5                         | 50                   | 15           | 108 000    |
| 1      | D        | 0,5       | 24        | 0,18              | 4                         | 50                   | 15           | 36 000     |
| 1      | E        | 1,3       | 32        | 0,14              | 3                         | 50                   | 15           | 12 000     |
| 2      | A        | 2,5       | 61        | 0,39              | 10                        | 50                   | 15           | 2 721 600  |
| 2      | B        | 4         | 71        | 0,34              | 9                         | 50                   | 15           | 907 200    |
| 2      | C        | 2,5       | 51        | 0,28              | 8                         | 50                   | 15           | 302 400    |
| 2      | D        | 1         | 51        | 0,22              | 7                         | 50                   | 15           | 100 800    |
| 2      | E        | 2,5       | 41        | 0,17              | 6                         | 50                   | 15           | 33 600     |
| 3      | A        | 5         | 77        | 0,48              | 13                        | 50                   | 15           | 7 620 480  |
| 3      | B        | 8         | 90        | 0,41              | 12                        | 50                   | 15           | 2 540 160  |
| 3      | C        | 5         | 64        | 0,34              | 11                        | 50                   | 15           | 846 720    |
| 3      | D        | 2         | 38        | 0,27              | 10                        | 50                   | 15           | 282 240    |
| 3      | E        | 5         | 51        | 0,2               | 9                         | 50                   | 15           | 94 080     |
| 4      | A        | 10        | 96        | 0,57              | 16                        | 50                   | 15           | 21 337 344 |
| 4      | B        | 16        | 112       | 0,49              | 15                        | 50                   | 15           | 7 112 448  |
| 4      | C        | 10        | 80        | 0,41              | 14                        | 50                   | 15           | 2 370 816  |
| 4      | D        | 4         | 48        | 0,33              | 13                        | 50                   | 15           | 790 272    |
| 4      | E        | 10        | 64        | 0,25              | 12                        | 50                   | 15           | 263 424    |

*(Source : EDCD/coriolis-data, modules/internal/frame_shift_drive_interdictor.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Renforts de coque, de module et de bouclier — les six familles chiffrées

Six familles de renforts se montent en emplacements internes optionnels. Les trois premières ajoutent des points de vie de coque, la quatrième et la cinquième réduisent les dégâts encaissés par les autres modules, la sixième ajoute une capacité fixe de bouclier. Toutes n'existent qu'en notations D et E, où **D est la variante haut de gamme** — l'échelle A–E habituelle ne s'applique pas. Les familles Guardian se débloquent au Guardian Technology Broker et consomment de l'énergie, contrairement à leurs équivalents humains. La colonne Résistances se lit « cinétique / thermique / explosif / caustique ».

| Famille                       | Classe | Notation | Masse (t) | Intégrité | Consommation (MW) | Effet principal             | Résistances (K / T / E / C)    | Prix (Cr) |
|-------------------------------|--------|----------|-----------|-----------|-------------------|-----------------------------|--------------------------------|-----------|
| Hull Reinforcement Package    | 1      | D        | 1         | —         | —                 | +110 PV de coque            | +0,5 % / +0,5 % / +0,5 % / 0 % | 15 000    |
| Hull Reinforcement Package    | 1      | E        | 2         | —         | —                 | +80 PV de coque             | +0,5 % / +0,5 % / +0,5 % / 0 % | 5 000     |
| Hull Reinforcement Package    | 2      | D        | 2         | —         | —                 | +190 PV de coque            | +1 % / +1 % / +1 % / 0 %       | 36 000    |
| Hull Reinforcement Package    | 2      | E        | 4         | —         | —                 | +150 PV de coque            | +1 % / +1 % / +1 % / 0 %       | 12 000    |
| Hull Reinforcement Package    | 3      | D        | 4         | —         | —                 | +260 PV de coque            | +1,5 % / +1,5 % / +1,5 % / 0 % | 84 000    |
| Hull Reinforcement Package    | 3      | E        | 8         | —         | —                 | +230 PV de coque            | +1,5 % / +1,5 % / +1,5 % / 0 % | 28 000    |
| Hull Reinforcement Package    | 4      | D        | 8         | —         | —                 | +330 PV de coque            | +2 % / +2 % / +2 % / 0 %       | 195 000   |
| Hull Reinforcement Package    | 4      | E        | 16        | —         | —                 | +300 PV de coque            | +2 % / +2 % / +2 % / 0 %       | 65 000    |
| Hull Reinforcement Package    | 5      | D        | 16        | —         | —                 | +390 PV de coque            | +2,5 % / +2,5 % / +2,5 % / 0 % | 450 000   |
| Hull Reinforcement Package    | 5      | E        | 32        | —         | —                 | +360 PV de coque            | +2,5 % / +2,5 % / +2,5 % / 0 % | 150 000   |
| Meta Alloy Hull Reinforcement | 1      | D        | 2         | —         | —                 | +99 PV de coque             | 0 % / 0 % / 0 % / +3 %         | 22 501    |
| Meta Alloy Hull Reinforcement | 1      | E        | 2         | —         | —                 | +72 PV de coque             | 0 % / 0 % / 0 % / +3 %         | 7 501     |
| Meta Alloy Hull Reinforcement | 2      | D        | 2         | —         | —                 | +171 PV de coque            | 0 % / 0 % / 0 % / +3 %         | 54 000    |
| Meta Alloy Hull Reinforcement | 2      | E        | 4         | —         | —                 | +135 PV de coque            | 0 % / 0 % / 0 % / +3 %         | 18 000    |
| Meta Alloy Hull Reinforcement | 3      | D        | 4         | —         | —                 | +234 PV de coque            | 0 % / 0 % / 0 % / +3 %         | 126 000   |
| Meta Alloy Hull Reinforcement | 3      | E        | 8         | —         | —                 | +207 PV de coque            | 0 % / 0 % / 0 % / +3 %         | 42 000    |
| Meta Alloy Hull Reinforcement | 4      | D        | 8         | —         | —                 | +297 PV de coque            | 0 % / 0 % / 0 % / +3 %         | 292 501   |
| Meta Alloy Hull Reinforcement | 4      | E        | 16        | —         | —                 | +270 PV de coque            | 0 % / 0 % / 0 % / +3 %         | 97 501    |
| Meta Alloy Hull Reinforcement | 5      | D        | 16        | —         | —                 | +351 PV de coque            | 0 % / 0 % / 0 % / +3 %         | 675 001   |
| Meta Alloy Hull Reinforcement | 5      | E        | 32        | —         | —                 | +324 PV de coque            | 0 % / 0 % / 0 % / +3 %         | 225 001   |
| Guardian Hull Reinforcement   | 1      | D        | 1         | —         | 0,56              | +138 PV de coque            | 0 % / +2 % / 0 % / +5 %        | 30 000    |
| Guardian Hull Reinforcement   | 1      | E        | 2         | —         | 0,45              | +100 PV de coque            | 0 % / +2 % / 0 % / +5 %        | 10 000    |
| Guardian Hull Reinforcement   | 2      | D        | 2         | —         | 0,79              | +238 PV de coque            | 0 % / +2 % / 0 % / +5 %        | 72 000    |
| Guardian Hull Reinforcement   | 2      | E        | 4         | —         | 0,68              | +188 PV de coque            | 0 % / +2 % / 0 % / +5 %        | 24 000    |
| Guardian Hull Reinforcement   | 3      | D        | 4         | —         | 1,01              | +325 PV de coque            | 0 % / +2 % / 0 % / +5 %        | 172 800   |
| Guardian Hull Reinforcement   | 3      | E        | 8         | —         | 0,9               | +288 PV de coque            | 0 % / +2 % / 0 % / +5 %        | 57 600    |
| Guardian Hull Reinforcement   | 4      | D        | 8         | —         | 1,24              | +413 PV de coque            | 0 % / +2 % / 0 % / +5 %        | 414 720   |
| Guardian Hull Reinforcement   | 4      | E        | 16        | —         | 1,13              | +375 PV de coque            | 0 % / +2 % / 0 % / +5 %        | 138 240   |
| Guardian Hull Reinforcement   | 5      | D        | 16        | —         | 1,46              | +488 PV de coque            | 0 % / +2 % / 0 % / +5 %        | 995 330   |
| Guardian Hull Reinforcement   | 5      | E        | 32        | —         | 1,35              | +450 PV de coque            | 0 % / +2 % / 0 % / +5 %        | 331 778   |
| Module Reinforcement Package  | 1      | D        | 1         | 70        | —                 | −60 % de dégâts aux modules | — / — / — / —                  | 15 000    |
| Module Reinforcement Package  | 1      | E        | 2         | 77        | —                 | −30 % de dégâts aux modules | — / — / — / —                  | 5 000     |
| Module Reinforcement Package  | 2      | D        | 2         | 105       | —                 | −60 % de dégâts aux modules | — / — / — / —                  | 36 000    |
| Module Reinforcement Package  | 2      | E        | 4         | 115       | —                 | −30 % de dégâts aux modules | — / — / — / —                  | 12 000    |
| Module Reinforcement Package  | 3      | D        | 4         | 155       | —                 | −60 % de dégâts aux modules | — / — / — / —                  | 84 000    |
| Module Reinforcement Package  | 3      | E        | 8         | 170       | —                 | −30 % de dégâts aux modules | — / — / — / —                  | 28 000    |
| Module Reinforcement Package  | 4      | D        | 8         | 235       | —                 | −60 % de dégâts aux modules | — / — / — / —                  | 195 000   |
| Module Reinforcement Package  | 4      | E        | 16        | 260       | —                 | −30 % de dégâts aux modules | — / — / — / —                  | 65 000    |
| Module Reinforcement Package  | 5      | D        | 16        | 350       | —                 | −60 % de dégâts aux modules | — / — / — / —                  | 450 000   |
| Module Reinforcement Package  | 5      | E        | 32        | 385       | —                 | −30 % de dégâts aux modules | — / — / — / —                  | 150 000   |
| Guardian Module Reinforcement | 1      | D        | 1         | 77        | 0,34              | −60 % de dégâts aux modules | — / — / — / —                  | 30 000    |
| Guardian Module Reinforcement | 1      | E        | 2         | 85        | 0,27              | −30 % de dégâts aux modules | — / — / — / —                  | 10 000    |
| Guardian Module Reinforcement | 2      | D        | 2         | 116       | 0,47              | −60 % de dégâts aux modules | — / — / — / —                  | 72 000    |
| Guardian Module Reinforcement | 2      | E        | 4         | 127       | 0,41              | −30 % de dégâts aux modules | — / — / — / —                  | 24 000    |
| Guardian Module Reinforcement | 3      | D        | 4         | 171       | 0,61              | −60 % de dégâts aux modules | — / — / — / —                  | 172 800   |
| Guardian Module Reinforcement | 3      | E        | 8         | 187       | 0,54              | −30 % de dégâts aux modules | — / — / — / —                  | 57 600    |
| Guardian Module Reinforcement | 4      | D        | 8         | 259       | 0,74              | −60 % de dégâts aux modules | — / — / — / —                  | 414 720   |
| Guardian Module Reinforcement | 4      | E        | 16        | 286       | 0,68              | −30 % de dégâts aux modules | — / — / — / —                  | 138 240   |
| Guardian Module Reinforcement | 5      | D        | 16        | 385       | 0,88              | −60 % de dégâts aux modules | — / — / — / —                  | 995 330   |
| Guardian Module Reinforcement | 5      | E        | 32        | 424       | 0,81              | −30 % de dégâts aux modules | — / — / — / —                  | 331 778   |
| Guardian Shield Reinforcement | 1      | D        | 1         | 36        | 0,46              | +61 MJ de bouclier          | — / — / — / —                  | 30 000    |
| Guardian Shield Reinforcement | 1      | E        | 2         | 36        | 0,35              | +44 MJ de bouclier          | — / — / — / —                  | 10 000    |
| Guardian Shield Reinforcement | 2      | D        | 2         | 36        | 0,67              | +105 MJ de bouclier         | — / — / — / —                  | 72 000    |
| Guardian Shield Reinforcement | 2      | E        | 4         | 36        | 0,56              | +83 MJ de bouclier          | — / — / — / —                  | 24 000    |
| Guardian Shield Reinforcement | 3      | D        | 4         | 36        | 0,84              | +143 MJ de bouclier         | — / — / — / —                  | 172 800   |
| Guardian Shield Reinforcement | 3      | E        | 8         | 36        | 0,74              | +127 MJ de bouclier         | — / — / — / —                  | 57 600    |
| Guardian Shield Reinforcement | 4      | D        | 8         | 36        | 1,05              | +182 MJ de bouclier         | — / — / — / —                  | 414 720   |
| Guardian Shield Reinforcement | 4      | E        | 16        | 36        | 0,95              | +165 MJ de bouclier         | — / — / — / —                  | 138 240   |
| Guardian Shield Reinforcement | 5      | D        | 16        | 36        | 1,26              | +215 MJ de bouclier         | — / — / — / —                  | 995 330   |
| Guardian Shield Reinforcement | 5      | E        | 32        | 36        | 1,16              | +198 MJ de bouclier         | — / — / — / —                  | 331 778   |

*(Source : EDCD/coriolis-data, modules/internal/hull_reinforcement_package.json, modules/internal/meta_alloy_hull_reinforcement_package.json, modules/internal/guardian_hull_reinforcement_package.json, modules/internal/module_reinforcement_package.json, modules/internal/guardian_module_reinforcement_package.json, modules/internal/guardian_shield_reinforcement_package.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Cabines passagers — places offertes par classe de confort

Les quatre classes de confort sont regroupées ici en une seule table, chacune ne comptant que deux à cinq entrées. Plus la classe de confort monte, moins la cabine accueille de passagers pour un emplacement de même taille — et plus les contrats accessibles rapportent. Les cabines Luxury n'existent qu'en classes 5 et 6.

| Classe de confort              | Classe | Notation | Masse (t) | Places | Prix (Cr) |
|--------------------------------|--------|----------|-----------|--------|-----------|
| Economy Class Passenger Cabin  | 2      | E        | 2,5       | 2      | 4 312     |
| Economy Class Passenger Cabin  | 3      | E        | 5         | 4      | 8 657     |
| Economy Class Passenger Cabin  | 4      | E        | 10        | 8      | 18 954    |
| Economy Class Passenger Cabin  | 5      | E        | 20        | 16     | 34 954    |
| Economy Class Passenger Cabin  | 6      | E        | 40        | 32     | 61 410    |
| Business Class Passenger Cabin | 3      | D        | 5         | 3      | 26 705    |
| Business Class Passenger Cabin | 4      | D        | 10        | 6      | 56 862    |
| Business Class Passenger Cabin | 5      | D        | 20        | 10     | 92 362    |
| Business Class Passenger Cabin | 6      | D        | 40        | 16     | 184 232   |
| First Class Passenger Cabin    | 4      | C        | 10        | 3      | 170 586   |
| First Class Passenger Cabin    | 5      | C        | 20        | 6      | 340 526   |
| First Class Passenger Cabin    | 6      | C        | 40        | 12     | 552 698   |
| Luxury Class Passenger Cabin   | 5      | B        | 20        | 4      | 1 658 095 |
| Luxury Class Passenger Cabin   | 6      | B        | 40        | 8      | 4 974 287 |

*(Source : EDCD/coriolis-data, modules/internal/economy_passenger_cabin.json, modules/internal/business_passenger_cabin.json, modules/internal/first_passenger_cabin.json, modules/internal/luxury_passenger_cabin.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Contrôleurs de limpets — limpets simultanés, portée et durée de vie

Les huit familles de contrôleurs de limpets à fonction unique sont regroupées en une seule table : elles partagent exactement les mêmes colonnes et n'auraient donné que de très petites tables prises séparément. **Limpets simultanés** est le nombre de drones actifs en même temps, **Portée** la distance de travail en kilomètres, **Durée de vie** le temps avant auto-destruction du limpet. Les familles qui ne portent pas de durée de vie dans la source affichent un tiret.

| Famille         | Classe | Notation | Masse (t) | Consommation (MW) | Limpets simultanés | Portée (km) | Durée de vie (s) | Prix (Cr) |
|-----------------|--------|----------|-----------|-------------------|--------------------|-------------|------------------|-----------|
| Collector       | 1      | A        | 2         | 0,32              | 1                  | 1,2         | 720              | 9 600     |
| Collector       | 1      | B        | 2         | 0,28              | 1                  | 1,4         | 420              | 4 800     |
| Collector       | 1      | C        | 1,3       | 0,23              | 1                  | 1           | 510              | 2 400     |
| Collector       | 1      | D        | 0,5       | 0,18              | 1                  | 0,6         | 600              | 1 200     |
| Collector       | 1      | E        | 0,5       | 0,14              | 1                  | 0,8         | 300              | 600       |
| Collector       | 3      | A        | 8         | 0,48              | 2                  | 1,32        | 720              | 86 400    |
| Collector       | 3      | B        | 8         | 0,41              | 2                  | 1,54        | 420              | 43 200    |
| Collector       | 3      | C        | 5         | 0,34              | 2                  | 1,1         | 510              | 21 600    |
| Collector       | 3      | D        | 2         | 0,27              | 2                  | 0,66        | 600              | 10 800    |
| Collector       | 3      | E        | 2         | 0,2               | 2                  | 0,88        | 300              | 5 400     |
| Collector       | 5      | A        | 32        | 0,7               | 3                  | 1,56        | 720              | 777 600   |
| Collector       | 5      | B        | 32        | 0,6               | 3                  | 1,82        | 420              | 388 800   |
| Collector       | 5      | C        | 20        | 0,5               | 3                  | 1,3         | 510              | 194 400   |
| Collector       | 5      | D        | 8         | 0,4               | 3                  | 0,78        | 600              | 97 200    |
| Collector       | 5      | E        | 8         | 0,3               | 3                  | 1,04        | 300              | 48 600    |
| Collector       | 7      | A        | 128       | 0,97              | 4                  | 2,04        | 720              | 6 998 400 |
| Collector       | 7      | B        | 128       | 0,83              | 4                  | 2,38        | 420              | 3 499 200 |
| Collector       | 7      | C        | 80        | 0,69              | 4                  | 1,7         | 510              | 1 749 600 |
| Collector       | 7      | D        | 32        | 0,55              | 4                  | 1,02        | 600              | 874 800   |
| Collector       | 7      | E        | 32        | 0,41              | 4                  | 1,36        | 300              | 437 400   |
| Prospector      | 1      | A        | 1,3       | 0,28              | 1                  | 7           | —                | 9 600     |
| Prospector      | 1      | B        | 2         | 0,32              | 1                  | 6           | —                | 4 800     |
| Prospector      | 1      | C        | 1,3       | 0,23              | 1                  | 5           | —                | 2 400     |
| Prospector      | 1      | D        | 0,5       | 0,14              | 1                  | 4           | —                | 1 200     |
| Prospector      | 1      | E        | 1,3       | 0,18              | 1                  | 3           | —                | 600       |
| Prospector      | 3      | A        | 5         | 0,41              | 2                  | 7,7         | —                | 86 400    |
| Prospector      | 3      | B        | 8         | 0,48              | 2                  | 6,6         | —                | 43 200    |
| Prospector      | 3      | C        | 5         | 0,34              | 2                  | 5,5         | —                | 21 600    |
| Prospector      | 3      | D        | 2         | 0,2               | 2                  | 4,4         | —                | 10 800    |
| Prospector      | 3      | E        | 5         | 0,27              | 2                  | 3,3         | —                | 5 400     |
| Prospector      | 5      | A        | 20        | 0,6               | 4                  | 9,1         | —                | 777 600   |
| Prospector      | 5      | B        | 32        | 0,97              | 4                  | 7,8         | —                | 388 800   |
| Prospector      | 5      | C        | 20        | 0,5               | 4                  | 6,5         | —                | 194 400   |
| Prospector      | 5      | D        | 8         | 0,3               | 4                  | 5,2         | —                | 97 200    |
| Prospector      | 5      | E        | 20        | 0,4               | 4                  | 3,9         | —                | 48 600    |
| Prospector      | 7      | A        | 80        | 0,83              | 8                  | 11,9        | —                | 6 998 400 |
| Prospector      | 7      | B        | 128       | 0,97              | 8                  | 10,2        | —                | 3 499 200 |
| Prospector      | 7      | C        | 80        | 0,69              | 8                  | 8,5         | —                | 1 749 600 |
| Prospector      | 7      | D        | 32        | 0,41              | 8                  | 6,8         | —                | 874 800   |
| Prospector      | 7      | E        | 80        | 0,55              | 8                  | 5,1         | —                | 437 400   |
| Fuel Transfer   | 1      | A        | 1,3       | 0,28              | 1                  | 1,4         | —                | 9 600     |
| Fuel Transfer   | 1      | B        | 2         | 0,32              | 1                  | 1,2         | —                | 4 800     |
| Fuel Transfer   | 1      | C        | 1,3       | 0,23              | 1                  | 1           | —                | 2 400     |
| Fuel Transfer   | 1      | D        | 0,5       | 0,14              | 1                  | 0,8         | —                | 1 200     |
| Fuel Transfer   | 1      | E        | 1,3       | 0,18              | 1                  | 0,6         | —                | 600       |
| Fuel Transfer   | 3      | A        | 5         | 0,41              | 2                  | 1,54        | —                | 86 400    |
| Fuel Transfer   | 3      | B        | 8         | 0,48              | 2                  | 1,32        | —                | 43 200    |
| Fuel Transfer   | 3      | C        | 5         | 0,34              | 2                  | 1,1         | —                | 21 600    |
| Fuel Transfer   | 3      | D        | 2         | 0,2               | 2                  | 0,88        | —                | 10 800    |
| Fuel Transfer   | 3      | E        | 5         | 0,27              | 2                  | 0,66        | —                | 5 400     |
| Fuel Transfer   | 5      | A        | 20        | 0,6               | 4                  | 1,82        | —                | 777 600   |
| Fuel Transfer   | 5      | B        | 32        | 0,97              | 4                  | 1,56        | —                | 388 800   |
| Fuel Transfer   | 5      | C        | 20        | 0,5               | 4                  | 1,3         | —                | 194 400   |
| Fuel Transfer   | 5      | D        | 8         | 0,3               | 4                  | 1,04        | —                | 97 200    |
| Fuel Transfer   | 5      | E        | 20        | 0,4               | 4                  | 0,78        | —                | 48 600    |
| Fuel Transfer   | 7      | A        | 80        | 0,83              | 8                  | 2,38        | —                | 6 998 400 |
| Fuel Transfer   | 7      | B        | 128       | 0,97              | 8                  | 2,04        | —                | 3 499 200 |
| Fuel Transfer   | 7      | C        | 80        | 0,69              | 8                  | 1,7         | —                | 1 749 600 |
| Fuel Transfer   | 7      | D        | 32        | 0,41              | 8                  | 1,36        | —                | 874 800   |
| Fuel Transfer   | 7      | E        | 80        | 0,55              | 8                  | 1,02        | —                | 437 400   |
| Hatch Breaker   | 1      | A        | 1,3       | 0,28              | 1                  | 3,5         | 18               | 9 600     |
| Hatch Breaker   | 1      | B        | 2         | 0,24              | 2                  | 3           | 24               | 4 800     |
| Hatch Breaker   | 1      | C        | 1,3       | 0,2               | 1                  | 2,5         | 30               | 2 400     |
| Hatch Breaker   | 1      | D        | 0,5       | 0,16              | 1                  | 2           | 36               | 1 200     |
| Hatch Breaker   | 1      | E        | 1,3       | 0,12              | 2                  | 1,5         | 42               | 600       |
| Hatch Breaker   | 3      | A        | 5         | 0,42              | 3                  | 3,78        | 16               | 86 400    |
| Hatch Breaker   | 3      | B        | 8         | 0,36              | 4                  | 3,24        | 21               | 43 200    |
| Hatch Breaker   | 3      | C        | 5         | 0,3               | 3                  | 2,7         | 26               | 21 600    |
| Hatch Breaker   | 3      | D        | 2         | 0,24              | 3                  | 2,16        | 31               | 10 800    |
| Hatch Breaker   | 3      | E        | 5         | 0,18              | 4                  | 1,62        | 36               | 5 400     |
| Hatch Breaker   | 5      | A        | 20        | 0,7               | 6                  | 4,62        | 13               | 777 600   |
| Hatch Breaker   | 5      | B        | 32        | 0,6               | 9                  | 3,96        | 18               | 388 800   |
| Hatch Breaker   | 5      | C        | 20        | 0,5               | 7                  | 3,3         | 22               | 194 400   |
| Hatch Breaker   | 5      | D        | 8         | 0,4               | 6                  | 2,64        | 26               | 97 200    |
| Hatch Breaker   | 5      | E        | 20        | 0,3               | 9                  | 1,98        | 31               | 48 600    |
| Hatch Breaker   | 7      | A        | 80        | 0,98              | 12                 | 6,02        | 11               | 6 998 400 |
| Hatch Breaker   | 7      | B        | 128       | 0,84              | 18                 | 5,16        | 14               | 3 499 200 |
| Hatch Breaker   | 7      | C        | 80        | 0,7               | 15                 | 4,3         | 18               | 1 749 600 |
| Hatch Breaker   | 7      | D        | 32        | 0,56              | 12                 | 3,44        | 22               | 874 800   |
| Hatch Breaker   | 7      | E        | 80        | 0,42              | 18                 | 2,58        | 25               | 437 400   |
| Repair          | 1      | A        | 1,3       | 0,28              | 1                  | 1,4         | —                | 9 600     |
| Repair          | 1      | B        | 2         | 0,32              | 1                  | 1,2         | —                | 4 800     |
| Repair          | 1      | C        | 1,3       | 0,23              | 1                  | 1           | —                | 2 400     |
| Repair          | 1      | D        | 0,5       | 0,14              | 1                  | 0,8         | —                | 1 200     |
| Repair          | 1      | E        | 1,3       | 0,18              | 1                  | 0,6         | —                | 600       |
| Repair          | 3      | A        | 5         | 0,41              | 2                  | 1,54        | —                | 86 400    |
| Repair          | 3      | B        | 8         | 0,48              | 2                  | 1,32        | —                | 43 200    |
| Repair          | 3      | C        | 5         | 0,34              | 2                  | 1,1         | —                | 21 600    |
| Repair          | 3      | D        | 2         | 0,2               | 2                  | 0,88        | —                | 10 800    |
| Repair          | 3      | E        | 5         | 0,27              | 2                  | 0,66        | —                | 5 400     |
| Repair          | 5      | A        | 20        | 0,6               | 3                  | 1,82        | —                | 777 600   |
| Repair          | 5      | B        | 32        | 0,97              | 3                  | 1,56        | —                | 388 800   |
| Repair          | 5      | C        | 20        | 0,5               | 3                  | 1,3         | —                | 194 400   |
| Repair          | 5      | D        | 8         | 0,3               | 3                  | 1,04        | —                | 97 200    |
| Repair          | 5      | E        | 20        | 0,4               | 3                  | 0,78        | —                | 48 600    |
| Repair          | 7      | A        | 80        | 0,83              | 4                  | 2,38        | —                | 6 998 400 |
| Repair          | 7      | B        | 128       | 0,97              | 4                  | 2,04        | —                | 3 499 200 |
| Repair          | 7      | C        | 80        | 0,69              | 4                  | 1,7         | —                | 1 749 600 |
| Repair          | 7      | D        | 32        | 0,41              | 4                  | 1,36        | —                | 874 800   |
| Repair          | 7      | E        | 80        | 0,55              | 4                  | 1,02        | —                | 437 400   |
| Decontamination | 1      | E        | 1,3       | 0,18              | 1                  | 0,6         | —                | 3 600     |
| Decontamination | 3      | E        | 2         | 0,2               | 2                  | 0,88        | —                | 16 200    |
| Decontamination | 5      | E        | 20        | 0,5               | 3                  | 1,3         | —                | 145 800   |
| Decontamination | 7      | E        | 128       | 0,97              | 4                  | 2,04        | —                | 1 312 200 |
| Recon           | 1      | E        | 1,3       | 0,18              | 1                  | 1,2         | —                | 2 600     |
| Recon           | 3      | E        | 2         | 0,2               | 1                  | 1,4         | —                | 8 200     |
| Recon           | 5      | E        | 20        | 0,5               | 1                  | 1,7         | —                | 75 800    |
| Recon           | 7      | E        | 128       | 0,97              | 1                  | 2           | —                | 612 200   |
| Research        | 1      | E        | 1,3       | 0,4               | 1                  | 2           | 300              | 1 749 600 |

*(Source : EDCD/coriolis-data, modules/internal/collector_limpet_controllers.json, modules/internal/prospector_limpet_controllers.json, modules/internal/fuel_transfer_limpet_controllers.json, modules/internal/hatch_breaker_limpet_controller.json, modules/internal/repair_limpet_controller.json, modules/internal/decontamination_limpet_controller.json, modules/internal/recon_limpet_controllers.json, modules/internal/research_limpet_controller.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Contrôleurs de limpets multi-fonctions — un module pour plusieurs métiers

Les *Multi Limpet Controllers* réunissent plusieurs fonctions de limpet dans un seul emplacement, au prix d'une portée et d'un nombre de drones réduits. Ils n'existent qu'en quelques classes et notations, listées ici exhaustivement.

| Contrôleur                           | Classe | Notation | Masse (t) | Consommation (MW) | Limpets simultanés | Portée (km) | Durée de vie (s) | Durée de piratage (s) | Prix (Cr) |
|--------------------------------------|--------|----------|-----------|-------------------|--------------------|-------------|------------------|-----------------------|-----------|
| Operations Multi Limpet Controller   | 3      | B        | 15        | 0,3               | 4                  | 3,1         | —                | 22                    | 80 000    |
| Xeno Multi Limpet Controller         | 3      | B        | 15        | 0,3               | 4                  | 5           | 300              | —                     | 80 000    |
| Mining Multi Limpet Controller       | 3      | C        | 10        | 0,35              | 4                  | 5           | —                | —                     | 50 000    |
| Operations Multi Limpet Controller   | 3      | C        | 10        | 0,35              | 4                  | 2,6         | —                | 16                    | 50 000    |
| Rescue Multi Limpet Controller       | 3      | C        | 10        | 0,35              | 4                  | 2,6         | —                | 16                    | 50 000    |
| Xeno Multi Limpet Controller         | 3      | C        | 10        | 0,35              | 4                  | 5           | 300              | —                     | 50 000    |
| Rescue Multi Limpet Controller       | 3      | D        | 8         | 0,4               | 4                  | 2,1         | —                | 19                    | 30 000    |
| Mining Multi Limpet Controller       | 3      | E        | 12        | 0,5               | 4                  | 3,3         | —                | —                     | 15 000    |
| Mk II Mining Multi-Limpet Controller | 5      | A        | 64        | 1,4               | 14                 | 9,1         | —                | —                     | 2 332 800 |
| Universal Multi Limpet Controller    | 7      | A        | 140       | 1,1               | 8                  | 9,1         | —                | 5                     | 8 000 000 |
| Universal Multi Limpet Controller    | 7      | C        | 125       | 0,8               | 8                  | 6,5         | —                | 8                     | 4 000 000 |

*(Source : EDCD/coriolis-data, modules/internal/multi_limpet_controllers.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Modules internes divers — appontage, baies, sondes et booster de saut

Huit familles marginales sont regroupées ici, chacune ne comptant qu'une à six entrées : ordinateur d'appontage, assistance au supercruise, suite d'approche planétaire, scanner de surface détaillé, baie de chasseur, baie de véhicule planétaire, Guardian FSD Booster et stabilisateur d'armes expérimentales. La colonne Effet principal donne, pour chacune, la statistique qui la définit. Pour le **Detailed Surface Scanner**, cette statistique est le coefficient de rayon des sondes : c'est une caractéristique du module, et non l'inventaire de ce qu'une cartographie révèle au sol : ce volet-là, comme le statut « mapped » et le bonus de première cartographie, est traité dans [10-exploration.md](./10-exploration.md).

| Module                                              | Classe | Notation | Masse (t) | Intégrité | Consommation (MW) | Effet principal                       | Prix (Cr) |
|-----------------------------------------------------|--------|----------|-----------|-----------|-------------------|---------------------------------------|-----------|
| Advanced Docking Computer                           | 1      | E        | —         | 10        | 0,45              | appontage automatique                 | 13 507    |
| Standard Docking Computer                           | 1      | E        | —         | 10        | 0,39              | appontage automatique                 | 4 500     |
| Supercruise Assist                                  | 1      | E        | 0         | —         | 0,3               | pilotage assisté en supercruise       | 9 121     |
| Planetary Approach Suite                            | 1      | I        | 0         | —         | 0                 | approche planétaire                   | 500       |
| Advanced Planetary Approach Suite                   | 1      | I        | 0         | —         | 0                 | approche planétaire                   | 500       |
| Detailed Surface Scanner                            | 1      | I        | 0         | —         | 0                 | coefficient de rayon des sondes : 0,2 | 250 000   |
| Long Range Detailed Surface Scanner (pré-ingénieré) | 1      | I        | 0         | —         | 0                 | coefficient de rayon des sondes : 0,2 | 0         |
| Vessel Hangar                                       | 5      | D        | 20        | 60        | 0,25              | 1 baie, 6 reconstructions par baie    | 575 643   |
| Vessel Hangar                                       | 6      | D        | 40        | 80        | 0,35              | 2 baies, 8 reconstructions par baie   | 1 869 340 |
| Vessel Hangar                                       | 7      | D        | 60        | 120       | 0,35              | 2 baies, 15 reconstructions par baie  | 2 369 320 |
| Planetary Vehicle Hangar                            | 2      | G        | 6         | 30        | 0,75              | 1 baie de véhicule                    | 21 600    |
| Planetary Vehicle Hangar                            | 2      | H        | 12        | 30        | 0,25              | 1 baie de véhicule                    | 18 000    |
| Planetary Vehicle Hangar                            | 4      | G        | 10        | 30        | 1,2               | 2 baies de véhicule                   | 86 400    |
| Planetary Vehicle Hangar                            | 4      | H        | 20        | 30        | 0,4               | 2 baies de véhicule                   | 72 000    |
| Planetary Vehicle Hangar                            | 6      | G        | 17        | 30        | 1,8               | 4 baies de véhicule                   | 691 200   |
| Planetary Vehicle Hangar                            | 6      | H        | 34        | 30        | 0,6               | 4 baies de véhicule                   | 576 000   |
| Guardian FSD Booster                                | 1      | H        | 1,3       | 32        | 0,75              | +4 AL de portée de saut               | 405 022   |
| Guardian FSD Booster                                | 2      | H        | 1,3       | 32        | 0,98              | +6 AL de portée de saut               | 810 521   |
| Guardian FSD Booster                                | 3      | H        | 1,3       | 32        | 1,27              | +7,75 AL de portée de saut            | 1 620 431 |
| Guardian FSD Booster                                | 4      | H        | 1,3       | 32        | 1,65              | +9,25 AL de portée de saut            | 3 245 013 |
| Guardian FSD Booster                                | 5      | H        | 1,3       | 32        | 2,14              | +10,5 AL de portée de saut            | 6 483 101 |
| Experimental Weapon Stabiliser                      | 3      | F        | 8         | —         | 0                 | stabilisation d'armes expérimentales  | 2 000 000 |
| Experimental Weapon Stabiliser                      | 5      | F        | 20        | —         | 0                 | stabilisation d'armes expérimentales  | 4 000 000 |

*(Source : EDCD/coriolis-data, modules/internal/docking_computer.json, modules/internal/supercruise_assist.json, modules/internal/planetary_approach_suite.json, modules/internal/surface_scanner.json, modules/internal/fighter_hangar.json, modules/internal/planetary_vehicle_hanger.json, modules/internal/guardian_fsd_booster.json, modules/internal/experemental_weapon_stabilizer.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

## Référentiel chiffré des armes — dégâts, cadence, portée et consommation

Les 213 armes et utilitaires de hardpoint du jeu sont répartis ci-dessous en huit tables, par famille de fonctionnement. Ce regroupement est éditorial : il suit les fichiers du dépôt amont et vise la lisibilité. Toutes les valeurs sont celles du module **non modifié**, sorti de chantier naval ; l'ingénierie les déplace largement.

### Comment sont calculées la cadence et le DPS de ces tables

Deux colonnes de ces tables sont **dérivées par calcul** et non relevées dans la source : **Cadence** et **DPS brut**. Le jeu de données ne porte ni champ `rof` ni champ `dps` ; il donne l'intervalle entre deux cycles de tir (`fireint`, en secondes) et les dégâts d'un tir (`damage`). Les formules appliquées sont les suivantes :

- arme à tir simple : `cadence = 1 / fireint` et `DPS = damage × roundspershot / fireint` ;
- arme à rafale (champs `burst` et `burstrof` présents) : la durée d'un cycle vaut `fireint + (burst − 1) / burstrof`, d'où `cadence = 1 / cycle` et `DPS = damage × roundspershot × burst / cycle` ;
- laser à faisceau continu (aucun champ `fireint`) : le champ `damage` est déjà exprimé en dégâts par seconde, le DPS lui est donc égal et la colonne Cadence porte la mention « continu ».

`roundspershot` vaut 1 quand le champ est absent ; il vaut 12 pour un fragment cannon, dont la colonne Dégâts par tir se lit alors « dégâts d'un plomb × nombre de plombs ». **Ce DPS ignore le temps de rechargement** : il décrit le débit pendant que le chargeur dure, pas sur la durée d'un engagement. La colonne **Ponction distributeur** est le champ `distdraw`, l'énergie tirée du condensateur WEP à chaque cycle ; la colonne **Consommation (MW)** est le champ `power`, le tirage permanent sur la centrale électrique. **Portée opt. / max** donne d'abord la distance au-delà de laquelle les dégâts commencent à décroître (`falloff`), puis la portée maximale (`range`). Les deux champs sont indépendants dans la source et l'un peut exister sans l'autre : neuf entrées portent un `falloff` sans `range` — le Pulse Disruptor Laser, les deux Remote Release Flak Launcher et les six AX Missile Rack — et leur cellule se lit alors « 500 / — », le tiret ne portant que sur le champ absent. Une cellule réduite à un seul tiret signale que ni `falloff` ni `range` ne figure dans la source, ce qui est le cas de la plupart des lanceurs à projectile guidé.

Le champ `damagedist` est traduit en clair dans la colonne Type de dégâts. Sa clé `X` n'est pas une fraction de dégâts mais un marqueur : elle vaut 1 en plus du type réel et signale une arme anti-xéno.

### Lasers à énergie (Pulse, Burst, Beam) — la famille sans munitions

Les trois lasers de combat ne consomment aucune munition mais vident le condensateur WEP et chauffent le vaisseau. Le **Pulse** est le plus économe, le **Burst** tire par rafales de trois, le **Beam** délivre un faisceau continu au prix d'une charge thermique nettement plus lourde. Tous font 100 % de dégâts thermiques, donc efficaces contre les boucliers et médiocres contre la coque nue.

| Arme                      | Montage       | Classe | Notation | Dégâts par tir | Cadence (cycles/s) | DPS brut (dérivé) | Type de dégâts  | Charge thermique | Ponction distributeur | Consommation (MW) | Chargeur / réserve | Portée opt. / max (m) | Pénétration | Masse (t) | Prix (Cr)  |
|---------------------------|---------------|--------|----------|----------------|--------------------|-------------------|-----------------|------------------|-----------------------|-------------------|--------------------|-----------------------|-------------|-----------|------------|
| Pulse Laser               | fixe          | 1      | F        | 2,05           | 3,85               | 7,9               | 100 % thermique | 0,33             | 0,3                   | 0,39              | —                  | 500 / 3 000           | 20          | 2         | 2 200      |
| Pulse Laser               | gyrostabilisé | 1      | G        | 1,56           | 4                  | 6,2               | 100 % thermique | 0,31             | 0,31                  | 0,39              | —                  | 500 / 3 000           | 20          | 2         | 6 600      |
| Pulse Laser               | tourelle      | 1      | G        | 1,19           | 3,33               | 4                 | 100 % thermique | 0,19             | 0,19                  | 0,38              | —                  | 500 / 3 000           | 20          | 2         | 26 000     |
| Pulse Laser               | fixe          | 2      | E        | 3,5            | 3,45               | 12,1              | 100 % thermique | 0,56             | 0,5                   | 0,6               | —                  | 500 / 3 000           | 35          | 4         | 17 600     |
| Pulse Disruptor Laser     | fixe          | 2      | E        | 2,8            | 1,67               | 4,7               | 100 % thermique | 1                | 0,9                   | 0,7               | —                  | 500 / —               | 35          | 4         | 26 400     |
| Pulse Laser               | gyrostabilisé | 2      | F        | 2,68           | 3,57               | 9,6               | 100 % thermique | 0,54             | 0,54                  | 0,6               | —                  | 500 / 3 000           | 35          | 4         | 35 400     |
| Pulse Laser               | tourelle      | 2      | F        | 2,05           | 3,03               | 6,2               | 100 % thermique | 0,33             | 0,33                  | 0,58              | —                  | 500 / 3 000           | 35          | 4         | 132 800    |
| Pulse Laser               | fixe          | 3      | D        | 5,98           | 3,03               | 18,1              | 100 % thermique | 0,96             | 0,86                  | 0,9               | —                  | 500 / 3 000           | 52          | 8         | 70 400     |
| Pulse Laser               | gyrostabilisé | 3      | E        | 4,58           | 3,23               | 14,8              | 100 % thermique | 0,92             | 0,92                  | 0,92              | —                  | 500 / 3 000           | 52          | 8         | 140 600    |
| Pulse Laser               | tourelle      | 3      | F        | 3,5            | 2,7                | 9,5               | 100 % thermique | 0,56             | 0,56                  | 0,89              | —                  | 500 / 3 000           | 52          | 8         | 400 400    |
| Pulse Laser               | fixe          | 4      | A        | 10,24          | 2,63               | 26,9              | 100 % thermique | 1,64             | 1,48                  | 1,33              | —                  | 500 / 3 000           | 65          | 16        | 177 600    |
| Pulse Laser               | gyrostabilisé | 4      | A        | 7,82           | 2,78               | 21,7              | 100 % thermique | 1,56             | 1,56                  | 1,37              | —                  | 500 / 3 000           | 65          | 16        | 877 600    |
| Burst Laser               | fixe          | 1      | F        | 1,72           | 1,58               | 8,1               | 100 % thermique | 0,38             | 0,25                  | 0,65              | —                  | 500 / 3 000           | 20          | 2         | 4 400      |
| Cytoscrambler Burst Laser | fixe          | 1      | F        | 3,6            | 0,95               | 27,4              | 100 % thermique | 0,3              | 0,31                  | 0,8               | —                  | 600 / 1 000           | 1           | 2         | 8 800      |
| Burst Laser               | gyrostabilisé | 1      | G        | 1,22           | 1,76               | 6,4               | 100 % thermique | 0,34             | 0,24                  | 0,64              | —                  | 500 / 3 000           | 20          | 2         | 8 600      |
| Burst Laser               | tourelle      | 1      | G        | 0,87           | 1,6                | 4,2               | 100 % thermique | 0,19             | 0,14                  | 0,6               | —                  | 500 / 3 000           | 20          | 2         | 52 800     |
| Burst Laser               | fixe          | 2      | E        | 3,53           | 1,23               | 13                | 100 % thermique | 0,78             | 0,5                   | 1,05              | —                  | 500 / 3 000           | 35          | 4         | 23 000     |
| Burst Laser               | gyrostabilisé | 2      | F        | 2,45           | 1,4                | 10,3              | 100 % thermique | 0,67             | 0,49                  | 1,04              | —                  | 500 / 3 000           | 35          | 4         | 48 500     |
| Burst Laser               | tourelle      | 2      | F        | 1,72           | 1,31               | 6,8               | 100 % thermique | 0,38             | 0,28                  | 0,98              | —                  | 500 / 3 000           | 35          | 4         | 162 800    |
| Burst Laser               | fixe          | 3      | D        | 7,73           | 0,9                | 20,8              | 100 % thermique | 1,7              | 1,11                  | 1,66              | —                  | 500 / 3 000           | 52          | 8         | 140 400    |
| Burst Laser               | gyrostabilisé | 3      | E        | 5,16           | 1,07               | 16,6              | 100 % thermique | 1,42             | 1,03                  | 1,65              | —                  | 500 / 3 000           | 52          | 8         | 281 600    |
| Burst Laser               | tourelle      | 3      | E        | 3,53           | 1,04               | 11                | 100 % thermique | 0,78             | 0,56                  | 1,57              | —                  | 500 / 3 000           | 52          | 8         | 800 400    |
| Burst Laser               | fixe          | 4      | E        | 20,61          | 0,52               | 32,3              | 100 % thermique | 4,53             | 2,98                  | 2,58              | —                  | 500 / 3 000           | 65          | 16        | 281 600    |
| Burst Laser               | gyrostabilisé | 4      | E        | 12,09          | 0,71               | 25,9              | 100 % thermique | 3,33             | 2,41                  | 2,59              | —                  | 500 / 3 000           | 65          | 16        | 1 245 600  |
| Beam Laser                | fixe          | 1      | E        | 9,8            | continu            | 9,8               | 100 % thermique | 3,5              | 1,94                  | 0,62              | —                  | 600 / 3 000           | 18          | 2         | 37 430     |
| Retributor Beam Laser     | fixe          | 1      | E        | 4,9            | continu            | 4,9               | 100 % thermique | 2,7              | 2,52                  | 0,62              | —                  | 600 / 3 000           | 18          | 2         | 56 150     |
| Beam Laser                | gyrostabilisé | 1      | E        | 7,66           | continu            | 7,7               | 100 % thermique | 3,6              | 2,11                  | 0,6               | —                  | 600 / 3 000           | 18          | 2         | 74 650     |
| Beam Laser                | tourelle      | 1      | F        | 5,4            | continu            | 5,4               | 100 % thermique | 2,4              | 1,32                  | 0,57              | —                  | 600 / 3 000           | 18          | 2         | 500 000    |
| Beam Laser                | fixe          | 2      | D        | 15,96          | continu            | 16                | 100 % thermique | 5,1              | 3,16                  | 1,01              | —                  | 600 / 3 000           | 35          | 4         | 299 520    |
| Beam Laser                | gyrostabilisé | 2      | D        | 12,52          | continu            | 12,5              | 100 % thermique | 5,3              | 3,44                  | 1                 | —                  | 600 / 3 000           | 35          | 4         | 500 600    |
| Beam Laser                | tourelle      | 2      | E        | 8,82           | continu            | 8,8               | 100 % thermique | 3,5              | 2,16                  | 0,93              | —                  | 600 / 3 000           | 35          | 4         | 2 099 900  |
| Beam Laser                | fixe          | 3      | C        | 25,78          | continu            | 25,8              | 100 % thermique | 7,2              | 5,1                   | 1,62              | —                  | 600 / 3 000           | 50          | 8         | 1 177 600  |
| Beam Laser                | gyrostabilisé | 3      | C        | 20,28          | continu            | 20,3              | 100 % thermique | 7,6              | 5,58                  | 1,6               | —                  | 600 / 3 000           | 50          | 8         | 2 396 160  |
| Beam Laser                | tourelle      | 3      | D        | 14,34          | continu            | 14,3              | 100 % thermique | 5,1              | 3,51                  | 1,51              | —                  | 600 / 3 000           | 50          | 8         | 19 399 600 |
| Beam Laser                | fixe          | 4      | A        | 41,38          | continu            | 41,4              | 100 % thermique | 9,9              | 8,19                  | 2,61              | —                  | 600 / 3 000           | 60          | 16        | 2 396 160  |
| Beam Laser                | gyrostabilisé | 4      | A        | 32,68          | continu            | 32,7              | 100 % thermique | 10,6             | 8,99                  | 2,57              | —                  | 600 / 3 000           | 60          | 16        | 8 746 160  |

*(Source : EDCD/coriolis-data, modules/hardpoints/pulse_laser.json, modules/hardpoints/burst_laser.json, modules/hardpoints/beam_laser.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Armes cinétiques à projectile (Cannon, Multi-Cannon, Fragment Cannon, Rail Gun)

Les armes cinétiques consomment des munitions et frappent la coque bien mieux que le bouclier. Le **Multi-Cannon** arrose, le **Cannon** frappe fort et lentement, le **Fragment Cannon** tire une gerbe de plombs à très courte portée, le **Rail Gun** perce n'importe quel blindage (pénétration 100) au prix d'un temps de charge. Les variantes *Advanced* et *Enhanced* s'obtiennent au Human Technology Broker.

| Arme                                       | Montage       | Classe | Notation | Dégâts par tir | Cadence (cycles/s) | DPS brut (dérivé) | Type de dégâts                     | Charge thermique | Ponction distributeur | Consommation (MW) | Chargeur / réserve | Portée opt. / max (m) | Pénétration | Masse (t) | Prix (Cr)  |
|--------------------------------------------|---------------|--------|----------|----------------|--------------------|-------------------|------------------------------------|------------------|-----------------------|-------------------|--------------------|-----------------------|-------------|-----------|------------|
| Cannon                                     | fixe          | 1      | D        | 22,5           | 0,5                | 11,2              | 100 % cinétique                    | 1,4              | 0,46                  | 0,34              | 6 / 120            | 3 000 / 3 000         | 35          | 2         | 21 100     |
| Cannon                                     | gyrostabilisé | 1      | E        | 16             | 0,52               | 8,3               | 100 % cinétique                    | 1,3              | 0,48                  | 0,38              | 5 / 100            | 3 000 / 3 000         | 35          | 2         | 42 200     |
| Cannon                                     | tourelle      | 1      | F        | 12,75          | 0,43               | 5,5               | 100 % cinétique                    | 0,7              | 0,22                  | 0,32              | 5 / 100            | 3 000 / 3 000         | 35          | 2         | 506 400    |
| Cannon                                     | fixe          | 2      | D        | 36,5           | 0,46               | 16,8              | 100 % cinétique                    | 2,1              | 0,7                   | 0,49              | 6 / 120            | 3 500 / 3 500         | 50          | 4         | 168 430    |
| Cannon                                     | gyrostabilisé | 2      | D        | 24,5           | 0,48               | 11,8              | 100 % cinétique                    | 1,9              | 0,75                  | 0,54              | 5 / 100            | 3 500 / 3 500         | 50          | 4         | 337 600    |
| Concord Cannon                             | gyrostabilisé | 2      | D        | 14,63          | 0,36               | 15,9              | 100 % cinétique                    | 1,92             | 0,75                  | 0,64              | 9 / 300            | 3 500 / 3 500         | 42          | 4         | 314 620    |
| Cannon                                     | tourelle      | 2      | E        | 19,77          | 0,4                | 7,9               | 100 % cinétique                    | 1                | 0,34                  | 0,45              | 5 / 100            | 3 500 / 3 500         | 50          | 4         | 4 051 200  |
| Cannon                                     | fixe          | 3      | C        | 54,94          | 0,42               | 23,1              | 100 % cinétique                    | 3,2              | 1,07                  | 0,67              | 6 / 120            | 4 000 / 4 000         | 70          | 8         | 675 200    |
| Cannon                                     | gyrostabilisé | 3      | C        | 37,39          | 0,44               | 16,5              | 100 % cinétique                    | 2,9              | 1,14                  | 0,75              | 5 / 100            | 4 000 / 4 000         | 70          | 8         | 1 350 400  |
| Cannon                                     | tourelle      | 3      | D        | 30,4           | 0,37               | 11,2              | 100 % cinétique                    | 1,6              | 0,53                  | 0,64              | 5 / 100            | 4 000 / 4 000         | 70          | 8         | 16 204 800 |
| Cannon                                     | fixe          | 4      | B        | 82,1           | 0,38               | 31,2              | 100 % cinétique                    | 4,8              | 1,61                  | 0,92              | 6 / 120            | 4 500 / 4 500         | 90          | 16        | 2 700 800  |
| Cannon                                     | gyrostabilisé | 4      | B        | 56,58          | 0,4                | 22,6              | 100 % cinétique                    | 4,4              | 1,72                  | 1,03              | 5 / 100            | 4 500 / 4 500         | 90          | 16        | 5 401 600  |
| Multi-Cannon                               | fixe          | 1      | F        | 1,12           | 7,69               | 8,6               | 100 % cinétique                    | 0,09             | 0,06                  | 0,28              | 100 / 2 100        | 2 000 / 4 000         | 22          | 2         | 9 500      |
| Enforcer Cannon                            | fixe          | 1      | F        | 2,9            | 4,35               | 12,6              | 100 % cinétique                    | 0,2              | 0,12                  | 0,28              | 60 / 1 000         | 3 000 / 4 500         | 30          | 2         | 13 980     |
| Multi-Cannon                               | gyrostabilisé | 1      | G        | 0,82           | 8,33               | 6,8               | 100 % cinétique                    | 0,1              | 0,07                  | 0,37              | 90 / 2 100         | 2 000 / 4 000         | 22          | 2         | 14 250     |
| Multi-Cannon                               | tourelle      | 1      | G        | 0,56           | 7,14               | 4                 | 100 % cinétique                    | 0,04             | 0,03                  | 0,26              | 90 / 2 100         | 2 000 / 4 000         | 22          | 2         | 81 600     |
| Multi-Cannon                               | fixe          | 2      | E        | 2,19           | 7,14               | 15,6              | 100 % cinétique                    | 0,18             | 0,11                  | 0,46              | 100 / 2 100        | 2 000 / 4 000         | 37          | 4         | 38 000     |
| Rapid Phase Multi-Cannon (pré-ingénieré)   | fixe          | 2      | E        | 2,15           | 8,97               | 19,3              | 100 % cinétique                    | 0,18             | 0,11                  | 0,46              | 294 / 4 706        | 1 800 / 2 000         | 37          | 3,33      | 0          |
| Multi-Cannon                               | gyrostabilisé | 2      | F        | 1,64           | 7,69               | 12,6              | 100 % cinétique                    | 0,2              | 0,14                  | 0,64              | 90 / 2 100         | 2 000 / 4 000         | 37          | 4         | 57 000     |
| Multi-Cannon                               | tourelle      | 2      | F        | 1,17           | 6,25               | 7,3               | 100 % cinétique                    | 0,09             | 0,06                  | 0,5               | 90 / 2 100         | 2 000 / 4 000         | 37          | 4         | 1 292 800  |
| Multi-Cannon                               | fixe          | 3      | C        | 3,92           | 5,88               | 23,1              | 100 % cinétique                    | 0,28             | 0,18                  | 0,64              | 100 / 2 100        | 2 000 / 4 000         | 54          | 8         | 140 400    |
| Multi-Cannon                               | gyrostabilisé | 3      | C        | 2,84           | 6,67               | 18,9              | 100 % cinétique                    | 0,34             | 0,25                  | 0,97              | 90 / 2 100         | 2 000 / 4 000         | 54          | 8         | 578 436    |
| Multi-Cannon                               | tourelle      | 3      | E        | 2,2            | 5,26               | 11,6              | 100 % cinétique                    | 0,2              | 0,16                  | 0,86              | 90 / 2 100         | 2 000 / 4 000         | 54          | 8         | 3 794 600  |
| Multi-Cannon                               | fixe          | 4      | A        | 4,62 × 2       | 3,03               | 28                | 100 % cinétique                    | 0,39             | 0,24                  | 0,73              | 100 / 2 100        | 2 000 / 4 000         | 68          | 16        | 1 177 600  |
| Multi-Cannon                               | gyrostabilisé | 4      | A        | 3,46 × 2       | 3,37               | 23,3              | 100 % cinétique                    | 0,51             | 0,37                  | 1,22              | 90 / 2 100         | 2 000 / 4 000         | 68          | 16        | 6 377 600  |
| Advanced Multi-Cannon                      | fixe          | 1      | F        | 1,12           | 7,69               | 8,6               | 100 % cinétique                    | 0,09             | 0,06                  | 0,28              | 100 / 2 100        | 2 000 / 4 000         | 22          | 2         | 9 500      |
| Advanced Multi-Cannon                      | fixe          | 2      | E        | 2,19           | 7,14               | 15,6              | 100 % cinétique                    | 0,18             | 0,11                  | 0,46              | 100 / 2 100        | 2 000 / 4 000         | 37          | 4         | 38 000     |
| Fragment Cannon                            | fixe          | 1      | E        | 1,43 × 12      | 5,56               | 95,3              | 100 % cinétique                    | 0,4              | 0,21                  | 0,45              | 3 / 180            | 1 800 / 2 000         | 20          | 2         | 36 000     |
| Fragment Cannon                            | gyrostabilisé | 1      | E        | 1,01 × 12      | 5,88               | 71,3              | 100 % cinétique                    | 0,4              | 0,26                  | 0,59              | 3 / 180            | 1 800 / 2 000         | 20          | 2         | 54 720     |
| Fragment Cannon                            | tourelle      | 1      | E        | 0,69 × 12      | 4,76               | 39,4              | 100 % cinétique                    | 0,2              | 0,1                   | 0,42              | 3 / 180            | 1 800 / 2 000         | 20          | 2         | 182 400    |
| Fragment Cannon                            | fixe          | 2      | A        | 3 × 12         | 5                  | 180               | 100 % cinétique                    | 0,7              | 0,37                  | 0,74              | 3 / 180            | 1 800 / 2 000         | 30          | 4         | 291 840    |
| Fragment Cannon                            | gyrostabilisé | 2      | D        | 2,27 × 12      | 5,26               | 143,7             | 100 % cinétique                    | 0,8              | 0,49                  | 1,03              | 3 / 180            | 1 800 / 2 000         | 30          | 4         | 437 760    |
| Fragment Cannon                            | tourelle      | 2      | D        | 1,7 × 12       | 4,35               | 88,7              | 100 % cinétique                    | 0,4              | 0,21                  | 0,79              | 3 / 180            | 1 800 / 2 000         | 30          | 4         | 1 459 200  |
| Fragment Cannon                            | fixe          | 3      | C        | 4,57 × 12      | 4,55               | 249,3             | 100 % cinétique                    | 1,1              | 0,57                  | 1,02              | 3 / 180            | 1 800 / 2 000         | 45          | 8         | 1 167 360  |
| Pacifier Frag-Cannon                       | fixe          | 3      | C        | 3,96 × 12      | 4,55               | 216               | 100 % cinétique                    | 1,1              | 0,57                  | 1,02              | 3 / 180            | 2 800 / 3 000         | 45          | 8         | 1 751 040  |
| Fragment Cannon                            | gyrostabilisé | 3      | C        | 3,77 × 12      | 4,76               | 215,4             | 100 % cinétique                    | 1,4              | 0,81                  | 1,55              | 3 / 180            | 1 800 / 2 000         | 45          | 8         | 1 751 040  |
| Fragment Cannon                            | tourelle      | 3      | C        | 2,98 × 12      | 4                  | 143               | 100 % cinétique                    | 0,7              | 0,37                  | 1,29              | 3 / 180            | 1 800 / 2 000         | 45          | 8         | 5 836 800  |
| Rail Gun                                   | fixe          | 1      | D        | 23,25          | 1,59               | 36,9              | 66,7 % thermique, 33,3 % cinétique | 12               | 2,69                  | 1,15              | 1 / 80             | 1 000 / 3 000         | 100         | 2         | 51 600     |
| Rail Gun                                   | fixe          | 2      | B        | 41,5           | 1,2                | 50                | 66,7 % thermique, 33,3 % cinétique | 20               | 5,11                  | 1,63              | 1 / 80             | 1 000 / 3 000         | 100         | 4         | 412 800    |
| Enduring Feedback Rail Gun (pré-ingénieré) | fixe          | 2      | B        | 41,5           | 2,78               | 115,3             | 66,7 % thermique, 33,3 % cinétique | 20               | 5,11                  | 2,69              | 1 / 80             | 1 000 / 3 000         | 100         | 4         | 0          |
| Imperial Hammer Rail Gun                   | fixe          | 2      | B        | 31,4           | 2,99               | 281,8             | 66,7 % thermique, 33,3 % cinétique | 11               | 2                     | 1,63              | 3 / 240            | 1 000 / 3 000         | 100         | 4         | 619 200    |

*(Source : EDCD/coriolis-data, modules/hardpoints/cannon.json, modules/hardpoints/multi_cannon.json, modules/hardpoints/multi_cannon_advanced.json, modules/hardpoints/fragment_cannon.json, modules/hardpoints/rail_gun.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

#### Combinaisons classe × montage absentes du jeu de données amont

Une combinaison qui ne figure dans aucune des huit tables n'est pas une lacune du corpus : le jeu de données amont ne la porte pas, et l'arme n'existe donc pas sous cette forme en jeu. Relevé sur `modules/hardpoints/` au commit `0db9234b5b9c`, variantes nommées mises à part :

- **Pulse Laser**, **Burst Laser**, **Beam Laser**, **Cannon** et **Multi-Cannon** montent jusqu'à la classe 4 en montage fixe et gyrostabilisé, mais **aucune tourelle de classe 4** n'existe : pour ces cinq familles les tourelles s'arrêtent à la classe 3. Il n'y a donc ni « Multi-Cannon tourelle 4 », ni « Cannon tourelle 4 ».
- **Fragment Cannon** et **Shock Cannon** portent bien les trois montages, mais **s'arrêtent à la classe 3** : aucune version de classe 4.
- **Rail Gun** n'existe qu'en montage **fixe**, en classes 1 et 2 seulement — ni gyrostabilisé, ni tourelle, ni classes 3 ou 4.
- **Plasma Accelerator** n'existe qu'en montage **fixe**, en classes 2, 3 et 4 — pas de classe 1.
- **Mining Laser** n'existe qu'en **fixe et tourelle**, classes 1 et 2 — aucune version gyrostabilisée.

En revanche, les combinaisons Multi-Cannon fixe classe 2, Cannon fixe classe 4, Rail Gun fixe classe 2, Fragment Cannon gyrostabilisé classes 1 et 3, Burst Laser gyrostabilisé classe 2 et Beam Laser fixe classe 4 **existent bien** et figurent dans les tables ci-dessus, sous le nom de chantier naval de leur famille. Elles ont pu paraître absentes tant que ces lignes portaient le nom de la variante MercGear qui réutilise le même module — voir « Conventions de lecture des tables chiffrées » plus haut.

### Armes à plasma (Plasma Accelerator, Plasma Shock Cannon) — dégâts absolus et coût énergétique

Le **Plasma Accelerator** est la seule arme du jeu à infliger une majorité de dégâts *absolus*, que ni les résistances de bouclier ni celles de coque ne réduisent ; il paie cela par une ponction de distributeur et une charge thermique parmi les plus élevées. Le **Plasma Shock Cannon**, du Human Technology Broker, échange ces dégâts absolus contre du cinétique rapide.

| Arme                           | Montage       | Classe | Notation | Dégâts par tir | Cadence (cycles/s) | DPS brut (dérivé) | Type de dégâts                              | Charge thermique | Ponction distributeur | Consommation (MW) | Chargeur / réserve | Portée opt. / max (m) | Pénétration | Masse (t) | Prix (Cr)  |
|--------------------------------|---------------|--------|----------|----------------|--------------------|-------------------|---------------------------------------------|------------------|-----------------------|-------------------|--------------------|-----------------------|-------------|-----------|------------|
| Plasma Accelerator             | fixe          | 2      | C        | 54,3           | 0,33               | 17,9              | 60 % absolu, 20 % cinétique, 20 % thermique | 15,6             | 8,65                  | 1,43              | 5 / 100            | 2 000 / 3 500         | 100         | 4         | 834 200    |
| Mk II Plasma Shock Accelerator | fixe          | 3      | B        | 13,9           | 1,95               | 108,4             | 60 % absolu, 20 % cinétique, 20 % thermique | 1,7              | 0,92                  | 1,51              | 18 / 0             | 2 500 / 3 000         | 60          | 8         | 3 051 200  |
| Plasma Accelerator             | fixe          | 3      | B        | 83,4           | 0,29               | 24,2              | 60 % absolu, 20 % cinétique, 20 % thermique | 21,75            | 13,6                  | 1,97              | 5 / 100            | 2 000 / 3 500         | 100         | 8         | 3 051 200  |
| Advanced Plasma Accelerator    | fixe          | 3      | B        | 34,5           | 0,8                | 27,6              | 60 % absolu, 20 % cinétique, 20 % thermique | 11               | 5,5                   | 1,97              | 20 / 300           | 2 000 / 3 500         | 100         | 8         | 4 119 120  |
| Plasma Accelerator             | fixe          | 4      | A        | 125,2          | 0,25               | 31,3              | 60 % absolu, 20 % cinétique, 20 % thermique | 29,5             | 21,04                 | 2,63              | 5 / 100            | 2 000 / 3 500         | 100         | 16        | 13 793 600 |
| Shock Cannon                   | fixe          | 1      | D        | 8,6            | 7,75               | 66,7              | 100 % cinétique                             | 1,1              | 0,27                  | 0,41              | 16 / 880           | 2 500 / 3 000         | 25          | 2         | 65 941     |
| Shock Cannon                   | gyrostabilisé | 1      | E        | 6,9            | 7,75               | 53,5              | 100 % cinétique                             | 1,5              | 0,39                  | 0,47              | 16 / 880           | 2 500 / 3 000         | 25          | 2         | 137 501    |
| Shock Cannon                   | tourelle      | 1      | F        | 4,5            | 7,75               | 34,9              | 100 % cinétique                             | 0,7              | 0,21                  | 0,54              | 16 / 880           | 2 500 / 3 000         | 25          | 2         | 364 000    |
| Shock Cannon                   | fixe          | 2      | D        | 13             | 7,75               | 100,8             | 100 % cinétique                             | 1,8              | 0,47                  | 0,57              | 16 / 880           | 2 500 / 3 000         | 40          | 4         | 367 501    |
| Shock Cannon                   | gyrostabilisé | 2      | D        | 10,2           | 7,75               | 79,1              | 100 % cinétique                             | 2,1              | 0,58                  | 0,61              | 16 / 880           | 2 500 / 3 000         | 40          | 4         | 565 200    |
| Shock Cannon                   | tourelle      | 2      | E        | 9              | 7,75               | 69,8              | 100 % cinétique                             | 1,2              | 0,39                  | 0,5               | 16 / 880           | 2 500 / 3 000         | 40          | 4         | 1 359 200  |
| Shock Cannon                   | fixe          | 3      | C        | 18,1           | 7,75               | 140,3             | 100 % cinétique                             | 2,66             | 0,92                  | 0,89              | 16 / 880           | 2 500 / 3 000         | 60          | 8         | 1 015 750  |
| Shock Cannon                   | gyrostabilisé | 3      | C        | 14,9           | 7,75               | 115,5             | 100 % cinétique                             | 3,1              | 1,07                  | 0,89              | 16 / 880           | 2 500 / 3 000         | 60          | 8         | 2 249 050  |
| Shock Cannon                   | tourelle      | 3      | D        | 12,26          | 7,75               | 95                | 100 % cinétique                             | 2,2              | 0,79                  | 0,64              | 16 / 880           | 2 500 / 3 000         | 60          | 8         | 6 050 201  |

*(Source : EDCD/coriolis-data, modules/hardpoints/plasma_accelerator.json, modules/hardpoints/shock_cannon.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Lanceurs : missiles, torpilles, mines et flak

Ces armes emportent une réserve limitée et infligent l'essentiel de leurs dégâts en explosif. La colonne Chargeur / réserve devient ici décisive : une torpille n'a qu'un coup. Les portées affichées sont celles du jeu de données ; plusieurs lanceurs n'en portent aucune, leur projectile étant guidé ou déclenché à distance.

| Arme                                         | Montage  | Classe | Notation | Dégâts par tir | Cadence (cycles/s) | DPS brut (dérivé) | Type de dégâts                | Charge thermique | Ponction distributeur | Consommation (MW) | Chargeur / réserve | Portée opt. / max (m) | Pénétration | Masse (t) | Prix (Cr) |
|----------------------------------------------|----------|--------|----------|----------------|--------------------|-------------------|-------------------------------|------------------|-----------------------|-------------------|--------------------|-----------------------|-------------|-----------|-----------|
| Seeker Missile Rack                          | fixe     | 1      | B        | 40             | 0,33               | 13,3              | 100 % explosif                | 3,6              | 0,24                  | 0,6               | 6 / 6              | —                     | 60          | 2         | 72 600    |
| Missile Rack                                 | fixe     | 1      | B        | 50             | 0,5                | 25                | 100 % explosif                | 3,6              | 0,24                  | 0,4               | 8 / 16             | —                     | 60          | 2         | 32 175    |
| Seeker Missile Rack                          | fixe     | 2      | B        | 40             | 0,33               | 13,3              | 100 % explosif                | 3,6              | 0,24                  | 1,2               | 6 / 18             | —                     | 60          | 4         | 512 400   |
| Lockdown Seeker Missile Rack (pré-ingénieré) | fixe     | 2      | B        | 40             | 0,33               | 13,3              | 100 % explosif                | 3,6              | 0,24                  | 1,2               | 6 / 18             | —                     | 60          | 0,57      | 0         |
| Lockdown Seeker Missile Rack (pré-ingénieré) | fixe     | 2      | B        | 42,1           | 0,19               | 8,1               | 100 % explosif                | 3,6              | 0,34                  | 1,2               | 6 / 18             | —                     | 60          | 6,25      | 0         |
| Pack-Hound Missile Rack                      | fixe     | 2      | B        | 7,5 × 4        | 2                  | 60                | 100 % explosif                | 3,6              | 0,24                  | 1,2               | 12 / 120           | —                     | 60          | 4         | 768 600   |
| Missile Rack                                 | fixe     | 2      | B        | 50             | 0,5                | 25                | 100 % explosif                | 3,6              | 0,24                  | 1,2               | 12 / 48            | —                     | 60          | 4         | 240 400   |
| Rocket Propelled FSD Disruptor               | fixe     | 2      | B        | 40             | 0,33               | 13,3              | 100 % explosif                | 3,6              | 0,24                  | 1,2               | 12 / 48            | —                     | 60          | 4         | 1 951 040 |
| Seeker Missile Rack                          | fixe     | 3      | A        | 40             | 0,33               | 13,3              | 100 % explosif                | 3,6              | 0,24                  | 1,62              | 6 / 36             | —                     | 60          | 8         | 1 471 030 |
| Missile Rack                                 | fixe     | 3      | A        | 50             | 0,5                | 25                | 100 % explosif                | 3,6              | 0,24                  | 1,62              | 12 / 96            | —                     | 60          | 8         | 1 021 500 |
| Advanced Missile Rack                        | fixe     | 1      | B        | 50             | 0,5                | 25                | 100 % explosif                | 3,6              | 0,24                  | 0,4               | 8 / 64             | —                     | 60          | 2         | 32 180    |
| Advanced Missile Rack                        | fixe     | 2      | B        | 50             | 0,5                | 25                | 100 % explosif                | 3,6              | 0,24                  | 1,2               | 12 / 64            | —                     | 60          | 4         | 1 471 030 |
| Torpedo Pylon                                | fixe     | 1      | I        | 120            | 1                  | 120               | 100 % explosif                | 45               | 0                     | 0,4               | 1 / 1              | —                     | 10 000      | 2         | 11 200    |
| Torpedo Pylon                                | fixe     | 2      | I        | 120            | 1                  | 120               | 100 % explosif                | 50               | 0                     | 0,4               | 1 / 2              | —                     | 10 000      | 4         | 44 800    |
| Torpedo Pylon                                | fixe     | 3      | I        | 120            | 1                  | 120               | 100 % explosif                | 55               | 0                     | 0,6               | 4 / 4              | —                     | 10 000      | 8         | 157 960   |
| Mine Launcher                                | fixe     | 1      | I        | 44             | 1                  | 44                | 50 % explosif, 50 % thermique | 5                | 0                     | 0,4               | 1 / 36             | —                     | 60          | 2         | 24 260    |
| Shock Mine Launcher                          | fixe     | 1      | I        | 32             | 1                  | 32                | 50 % explosif, 50 % thermique | 5                | 0                     | 0,4               | 1 / 36             | —                     | 60          | 2         | 36 390    |
| Mine Launcher                                | fixe     | 2      | I        | 44             | 1                  | 44                | 50 % explosif, 50 % thermique | 7,5              | 0                     | 0,4               | 3 / 72             | —                     | 60          | 4         | 294 080   |
| Remote Release Flak Launcher                 | fixe     | 2      | B        | 34             | 0,5                | 17                | 100 % explosif                | 3,6              | 0,24                  | 1,2               | 1 / 32             | 100 000 / —           | 60          | 4         | 261 800   |
| Remote Release Flak Launcher                 | tourelle | 2      | B        | 34             | 0,5                | 17                | 100 % explosif                | 3,6              | 0,24                  | 1,2               | 1 / 32             | 100 000 / —           | 60          | 4         | 1 259 200 |
| Remote Release Flechette Launcher            | fixe     | 2      | B        | 13             | 0,5                | 6,5               | 100 % cinétique               | 3,6              | 0,24                  | 1,2               | 1 / 72             | —                     | 80          | 4         | 353 761   |
| Remote Release Flechette Launcher            | tourelle | 2      | B        | 13             | 0,5                | 6,5               | 100 % cinétique               | 3,6              | 0,24                  | 1,2               | 1 / 72             | —                     | 70          | 4         | 1 279 200 |

*(Source : EDCD/coriolis-data, modules/hardpoints/missile_rack.json, modules/hardpoints/missile_rack_advanced.json, modules/hardpoints/torpedo_pylon.json, modules/hardpoints/mine_launcher.json, modules/hardpoints/remote_release_flak_launcher.json, modules/hardpoints/remote_release_flechette_launcher.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Outils miniers montés en hardpoint — lasers, charges et missiles de sous-surface

Le minage occupe des hardpoints comme les armes, avec des chiffres qui se lisent de la même façon. Le **Mining Laser** et l'**Abrasion Blaster** travaillent au contact, la **Seismic Charge Launcher** et le **Sub-surface Displacement Missile** fracturent le gisement. Le **Mining Volley Repeater** est propre au Type-11 Prospector.

| Arme                                          | Montage  | Classe | Notation | Dégâts par tir | Cadence (cycles/s) | DPS brut (dérivé) | Type de dégâts  | Charge thermique | Ponction distributeur | Consommation (MW) | Chargeur / réserve | Portée opt. / max (m) | Pénétration | Masse (t) | Prix (Cr) |
|-----------------------------------------------|----------|--------|----------|----------------|--------------------|-------------------|-----------------|------------------|-----------------------|-------------------|--------------------|-----------------------|-------------|-----------|-----------|
| Mining Laser                                  | fixe     | 1      | D        | 2              | continu            | 2                 | 100 % thermique | 2                | 1,5                   | 0,5               | —                  | 300 / 500             | 18          | 2         | 6 800     |
| Long Range Mining Laser (pré-ingénieré)       | fixe     | 1      | D        | 2              | continu            | 2                 | 100 % thermique | 2                | 0,75                  | 0,25              | —                  | 1 250 / 1 250         | 18          | 2         | 0         |
| Mining Lance                                  | fixe     | 1      | D        | 8              | continu            | 8                 | 100 % thermique | 6                | 1,75                  | 0,7               | —                  | 400 / 2 000           | 18          | 2         | 13 600    |
| Mining Laser                                  | tourelle | 1      | D        | 2              | continu            | 2                 | 100 % thermique | 2                | 1,5                   | 0,5               | —                  | 300 / 500             | 18          | 2         | 9 400     |
| Mining Laser                                  | fixe     | 2      | D        | 4              | continu            | 4                 | 100 % thermique | 4                | 3                     | 0,75              | —                  | 300 / 500             | 18          | 2         | 22 576    |
| Mining Laser                                  | tourelle | 2      | D        | 4              | continu            | 4                 | 100 % thermique | 4                | 3                     | 0,75              | —                  | 300 / 500             | 18          | 2         | 32 576    |
| Abrasion Blaster                              | fixe     | 1      | D        | 4              | 5                  | 20                | 100 % thermique | 1,8              | 2                     | 0,34              | 1 / —              | 1 000 / 1 000         | 18          | 2         | 9 700     |
| Far-Reaching Abrasion Blaster (pré-ingénieré) | fixe     | 1      | D        | 4              | 5                  | 20                | 100 % thermique | 1,8              | 2                     | 0,17              | 1 / —              | 4 000 / 4 180         | 18          | 1,82      | 9 700     |
| Abrasion Blaster                              | tourelle | 1      | D        | 4              | 5                  | 20                | 100 % thermique | 1,8              | 2                     | 0,47              | 1 / —              | 1 000 / 1 000         | 18          | 2         | 27 480    |
| Mining Volley Repeater                        | fixe     | 3      | C        | 0,3            | 20                 | 6                 | 100 % thermique | 0,4              | 2                     | 1,5               | 1 / 1              | 500 / 500             | 18          | 8         | 149 910   |
| Seismic Charge Launcher                       | fixe     | 2      | B        | 15             | 1                  | 15                | 100 % explosif  | 3,6              | 0,24                  | 1,2               | 1 / 72             | 500 / 3 000           | 35          | 4         | 153 110   |
| Seismic Charge Launcher                       | tourelle | 2      | B        | 15             | 1                  | 15                | 100 % explosif  | 3,6              | 0,24                  | 1,2               | 1 / 72             | 500 / 3 000           | 35          | 4         | 445 570   |
| Sub-Surface Displacement Missile              | fixe     | 1      | B        | 5              | 0,5                | 2,5               | 100 % explosif  | 2,2              | 0,18                  | 0,42              | 1 / 32             | 500 / 3 000           | 25          | 2         | 12 600    |
| Sub-Surface Displacement Missile              | tourelle | 1      | B        | 5              | 0,5                | 2,5               | 100 % explosif  | 2,2              | 0,16                  | 0,42              | 1 / 32             | 500 / 3 000           | 25          | 2         | 38 750    |
| Sub-Surface Extraction Missile                | fixe     | 2      | B        | 5              | 0,5                | 2,5               | 100 % explosif  | 2,9              | 0,21                  | 1                 | 1 / 96             | —                     | 25          | 4         | 822 091   |
| Sub-Surface Displacement Missile              | fixe     | 2      | B        | 5              | 0,5                | 2,5               | 100 % explosif  | 2,9              | 0,18                  | 1,01              | 1 / 96             | 500 / 3 000           | 25          | 4         | 122 170   |
| Sub-Surface Displacement Missile              | tourelle | 2      | B        | 5              | 0,5                | 2,5               | 100 % explosif  | 2,9              | 0,24                  | 0,93              | 1 / 96             | 500 / 3 000           | 25          | 4         | 381 750   |

*(Source : EDCD/coriolis-data, modules/hardpoints/mining_laser.json, modules/hardpoints/abrasion_blaster.json, modules/hardpoints/mining_volley_repeater.json, modules/hardpoints/seismic_charge_launcher.json, modules/hardpoints/sub_surface_displacement_missile.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Armes anti-thargoïdes (AX) et armes Guardian — les deux arsenaux de courtier technologique

Ces armes se débloquent au Human Technology Broker (préfixe AX, missiles à enzymes, torpilles à nanites) ou au Guardian Technology Broker (Gauss Cannon, Plasma Charger, Shard Cannon). Les armes AX portent le marqueur anti-xéno dans la colonne Type de dégâts ; le **Guardian Plasma Charger** est, avec le Plasma Accelerator, la seule autre arme à dégâts absolus.

| Arme                                           | Montage       | Classe | Notation | Dégâts par tir | Cadence (cycles/s) | DPS brut (dérivé) | Type de dégâts              | Charge thermique | Ponction distributeur | Consommation (MW) | Chargeur / réserve | Portée opt. / max (m) | Pénétration | Masse (t) | Prix (Cr) |
|------------------------------------------------|---------------|--------|----------|----------------|--------------------|-------------------|-----------------------------|------------------|-----------------------|-------------------|--------------------|-----------------------|-------------|-----------|-----------|
| AX Missile Rack                                | fixe          | 2      | B        | 64             | 0,5                | 32                | 100 % explosif (anti-xéno)  | 2,4              | 0,14                  | 1,2               | 8 / 64             | 10 000 / —            | 60          | 4         | 540 900   |
| AX Missile Rack                                | tourelle      | 2      | B        | 50             | 0,5                | 25                | 100 % explosif (anti-xéno)  | 1,5              | 0,08                  | 1,2               | 8 / 64             | 10 000 / —            | 60          | 4         | 2 022 700 |
| AX Missile Rack (pré-ingénieré)                | fixe          | 2      | E        | 71,5           | 0,33               | 23,5              | 100 % explosif (anti-xéno)  | 2,4              | 0,11                  | 1,2               | 8 / 64             | 10 000 / —            | 60          | 4,25      | 540 900   |
| AX Missile Rack                                | fixe          | 3      | A        | 64             | 0,5                | 32                | 100 % explosif (anti-xéno)  | 3,6              | 0,24                  | 1,62              | 12 / 128           | 10 000 / —            | 60          | 8         | 1 352 250 |
| AX Missile Rack                                | tourelle      | 3      | A        | 64             | 0,5                | 32                | 100 % explosif (anti-xéno)  | 1,9              | 0,14                  | 1,75              | 12 / 128           | 10 000 / —            | 60          | 8         | 4 056 750 |
| AX Missile Rack (pré-ingénieré)                | fixe          | 3      | C        | 71,5           | 0,33               | 23,5              | 100 % explosif (anti-xéno)  | 3,6              | 0,19                  | 1,62              | 12 / 128           | 10 000 / —            | 60          | 8,5       | 0         |
| Enhanced AX Missile Rack                       | fixe          | 2      | D        | 77             | 0,5                | 38,5              | 100 % explosif (anti-xéno)  | 2,4              | 0,14                  | 1,3               | 8 / 64             | —                     | 60          | 4         | 681 534   |
| Enhanced AX Missile Rack                       | tourelle      | 2      | E        | 64             | 0,5                | 32                | 100 % explosif (anti-xéno)  | 1,5              | 0,08                  | 1,3               | 8 / 64             | —                     | 60          | 4         | 2 666 286 |
| Enhanced AX Missile Rack                       | fixe          | 3      | B        | 77             | 0,5                | 38,5              | 100 % explosif (anti-xéno)  | 3,6              | 0,24                  | 1,72              | 12 / 128           | —                     | 60          | 8         | 1 703 835 |
| Enhanced AX Missile Rack                       | tourelle      | 3      | D        | 64             | 0,5                | 32                | 100 % explosif (anti-xéno)  | 1,9              | 0,14                  | 1,85              | 12 / 128           | —                     | 60          | 8         | 5 347 534 |
| AX Multi-Cannon                                | fixe          | 2      | E        | 3,3            | 7,14               | 23,6              | 100 % cinétique (anti-xéno) | 0,2              | 0,11                  | 0,46              | 100 / 2 100        | 2 000 / 4 000         | 17          | 4         | 379 000   |
| AX Multi-Cannon                                | tourelle      | 2      | F        | 1,7            | 6,25               | 10,6              | 100 % cinétique (anti-xéno) | 0,1              | 0,06                  | 0,5               | 90 / 2 100         | 2 000 / 4 000         | 17          | 4         | 1 826 500 |
| AX Multi-Cannon                                | fixe          | 3      | C        | 6,1            | 5,88               | 35,9              | 100 % cinétique (anti-xéno) | 0,3              | 0,18                  | 0,64              | 100 / 2 100        | 2 000 / 4 000         | 33          | 8         | 1 181 500 |
| AX Multi-Cannon                                | tourelle      | 3      | E        | 3,3            | 6,25               | 20,6              | 100 % cinétique (anti-xéno) | 0,1              | 0,06                  | 0,64              | 90 / 2 100         | 2 000 / 4 000         | 33          | 8         | 3 821 600 |
| Enhanced AX Multi-Cannon                       | fixe          | 2      | D        | 3,9            | 7,14               | 27,9              | 100 % cinétique (anti-xéno) | 0,18             | 0,11                  | 0,48              | 100 / 2 100        | 2 000 / 4 000         | 17          | 4         | 455 077   |
| Enhanced AX Multi-Cannon                       | gyrostabilisé | 2      | E        | 3,7            | 7,14               | 26,4              | 100 % cinétique (anti-xéno) | 0,18             | 0,11                  | 0,46              | 100 / 2 100        | 2 000 / 4 000         | 17          | 4         | 1 197 644 |
| Enhanced AX Multi-Cannon (pré-ingénieré)       | gyrostabilisé | 2      | E        | 2,4            | 7,14               | 17,1              | 100 % cinétique (anti-xéno) | 0,18             | 0,11                  | 0,81              | 100 / 2 100        | 2 000 / 4 000         | 17          | 4         | 1 197 644 |
| Enhanced AX Multi-Cannon                       | tourelle      | 2      | E        | 2              | 6,25               | 12,5              | 100 % cinétique (anti-xéno) | 0,1              | 0,06                  | 0,52              | 90 / 2 100         | 2 000 / 4 000         | 17          | 4         | 2 193 297 |
| Enhanced AX Multi-Cannon                       | fixe          | 3      | B        | 7,3            | 5,88               | 42,9              | 100 % cinétique (anti-xéno) | 0,28             | 0,18                  | 0,69              | 100 / 2 100        | 2 000 / 4 000         | 33          | 8         | 1 360 322 |
| Enhanced AX Multi-Cannon                       | gyrostabilisé | 3      | C        | 6,3            | 5,88               | 37,1              | 100 % cinétique (anti-xéno) | 0,28             | 0,18                  | 0,64              | 100 / 2 100        | 2 000 / 4 000         | 33          | 8         | 2 390 460 |
| Enhanced AX Multi-Cannon (pré-ingénieré)       | gyrostabilisé | 3      | C        | 4,07           | 5,88               | 23,9              | 100 % cinétique (anti-xéno) | 0,28             | 0,18                  | 1,12              | 100 / 2 100        | 2 000 / 4 000         | 33          | 8         | 2 390 460 |
| Enhanced AX Multi-Cannon                       | tourelle      | 3      | D        | 3,9            | 6,25               | 24,4              | 100 % cinétique (anti-xéno) | 0,1              | 0,06                  | 0,69              | 90 / 2 100         | 2 000 / 4 000         | 33          | 8         | 4 588 709 |
| Enzyme Missile Rack                            | fixe          | 2      | B        | 5              | 0,5                | 2,5               | 100 % explosif              | 1,5              | 0,08                  | 1,2               | 8 / 64             | —                     | 60          | 4         | 480 501   |
| High-Yield Enzyme Missile Rack (pré-ingénieré) | fixe          | 2      | B        | 5              | 0,5                | 2,5               | 100 % explosif              | 1,5              | 0,08                  | 1,2               | 7 / 40             | —                     | 60          | 4         | 480 501   |
| Guardian Nanite Torpedo Pylon                  | fixe          | 2      | I        | 0              | 0,5                | 0                 | 100 % explosif              | 35               | 0                     | 0,4               | 1 / 64             | —                     | —           | 3         | 843 170   |
| Guardian Nanite Torpedo Pylon                  | fixe          | 3      | I        | 0              | 0,5                | 0                 | 100 % explosif              | 35               | 0                     | 0,7               | 1 / 125            | —                     | —           | 5         | 1 627 419 |
| Guardian Gauss Cannon                          | fixe          | 1      | D        | 22             | 1,2                | 26,5              | 100 % thermique             | 15               | 3,8                   | 1,91              | 1 / 80             | 1 500 / 3 000         | 140         | 2         | 167 250   |
| Guardian Gauss Cannon (pré-ingénieré)          | fixe          | 1      | D        | 9,6            | 0,87               | 8,3               | 100 % thermique             | 15               | 3,8                   | 1,91              | 2 / 200            | 1 200 / 3 000         | 140         | 2         | 0         |
| Guardian Gauss Cannon                          | fixe          | 2      | B        | 38,5           | 1,2                | 46,4              | 100 % thermique             | 25               | 7,2                   | 2,61              | 1 / 80             | 1 500 / 3 000         | 140         | 4         | 543 801   |
| Guardian Gauss Cannon (pré-ingénieré)          | fixe          | 2      | B        | 18,3           | 0,87               | 15,9              | 100 % thermique             | 25               | 7,2                   | 2,61              | 2 / 200            | 1 200 / 3 000         | 140         | 4         | 0         |
| Guardian Plasma Charger                        | fixe          | 1      | D        | 3              | 5                  | 15                | 100 % absolu                | 4,2              | 0,68                  | 1,4               | 15 / 200           | 1 000 / 3 000         | 65          | 2         | 176 500   |
| Guardian Plasma Charger (pré-ingénieré)        | fixe          | 1      | D        | 3              | 5                  | 15                | 100 % absolu                | 4,2              | 0,68                  | 1,4               | 15 / 200           | 1 000 / 3 000         | 65          | 2         | 0         |
| Guardian Plasma Charger                        | tourelle      | 1      | F        | 2              | 5                  | 10                | 100 % absolu                | 5                | 0,8                   | 1,6               | 15 / 200           | 1 000 / 3 000         | 65          | 2         | 484 050   |
| Guardian Plasma Charger                        | fixe          | 2      | B        | 5              | 5                  | 25                | 100 % absolu                | 5,2              | 1,25                  | 2,13              | 15 / 200           | 1 000 / 3 500         | 80          | 4         | 567 761   |
| Guardian Plasma Charger (pré-ingénieré)        | fixe          | 2      | B        | 5              | 5                  | 25                | 100 % absolu                | 5,2              | 1,25                  | 2,13              | 15 / 200           | 1 000 / 3 500         | 80          | 4         | 0         |
| Guardian Plasma Charger                        | tourelle      | 2      | E        | 4              | 5                  | 20                | 100 % absolu                | 5,8              | 1,4                   | 2,01              | 15 / 200           | 1 000 / 3 500         | 80          | 4         | 1 659 200 |
| Guardian Plasma Charger                        | fixe          | 3      | C        | 7              | 5                  | 35                | 100 % absolu                | 6,2              | 2,42                  | 3,1               | 15 / 200           | 1 000 / 3 000         | 95          | 8         | 1 423 301 |
| Guardian Plasma Charger                        | tourelle      | 3      | D        | 6              | 5                  | 30                | 100 % absolu                | 6,4              | 2,6                   | 2,53              | 15 / 200           | 1 000 / 3 000         | 95          | 8         | 5 495 200 |
| Guardian Shard Cannon                          | fixe          | 1      | D        | 2 × 12         | 1,67               | 40                | 100 % thermique             | 0,7              | 0,42                  | 0,87              | 5 / 180            | 1 700 / 1 700         | 30          | 2         | 151 650   |
| Guardian Shard Cannon (pré-ingénieré)          | fixe          | 1      | D        | 2 × 12         | 1,67               | 40                | 100 % thermique             | 0,7              | 0,42                  | 0,87              | 5 / 180            | 1 700 / 1 700         | 30          | 2         | 0         |
| Guardian Shard Cannon                          | tourelle      | 1      | F        | 1,1 × 12       | 1,67               | 22                | 100 % thermique             | 0,6              | 0,36                  | 0,72              | 5 / 180            | 1 700 / 1 700         | 30          | 2         | 502 000   |
| Guardian Shard Cannon                          | fixe          | 2      | A        | 3,7 × 12       | 1,67               | 74                | 100 % thermique             | 1,2              | 0,65                  | 1,21              | 5 / 180            | 1 700 / 1 700         | 45          | 4         | 507 761   |
| Guardian Shard Cannon (pré-ingénieré)          | fixe          | 2      | A        | 3,7 × 12       | 1,67               | 74                | 100 % thermique             | 1,2              | 0,65                  | 1,21              | 5 / 180            | 1 700 / 1 700         | 45          | 4         | 0         |
| Guardian Shard Cannon (pré-ingénieré)          | fixe          | 2      | A        | 3,7 × 12       | 1,67               | 74                | 100 % thermique             | 1,2              | 0,65                  | 1,21              | 5 / 180            | 1 700 / 1 700         | 45          | 4         | 0         |
| Guardian Shard Cannon                          | tourelle      | 2      | D        | 2,4 × 12       | 1,67               | 48                | 100 % thermique             | 1,1              | 0,57                  | 1,16              | 5 / 180            | 1 700 / 1 700         | 45          | 4         | 1 767 001 |
| Guardian Shard Cannon                          | fixe          | 3      | C        | 5,2 × 12       | 1,67               | 104               | 100 % thermique             | 2,2              | 1,4                   | 1,68              | 5 / 180            | 1 700 / 1 700         | 60          | 8         | 1 461 350 |
| Guardian Shard Cannon                          | tourelle      | 3      | D        | 3,4 × 12       | 1,67               | 68                | 100 % thermique             | 2                | 1,2                   | 1,39              | 5 / 180            | 1 700 / 1 700         | 60          | 8         | 5 865 026 |

*(Source : EDCD/coriolis-data, modules/hardpoints/ax_missile_rack.json, modules/hardpoints/ax_missile_rack_enhanced.json, modules/hardpoints/ax_multi_cannon.json, modules/hardpoints/ax_multi_cannon_enhanced.json, modules/hardpoints/enzyme_missile_rack.json, modules/hardpoints/nanite_torpedo_pylon.json, modules/hardpoints/guardian_gauss_cannon.json, modules/hardpoints/guardian_plasma_charger.json, modules/hardpoints/guardian_shard_cannon.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

### Utilitaires de hardpoint (classe 0) — scanners, contre-mesures et lanceurs de leurres

Les emplacements utilitaires, de classe 0, n'accueillent pas d'armes mais des scanners et des contre-mesures. Leurs colonnes diffèrent donc de celles des armes : au lieu de dégâts, on lit une **portée de scan**, une **durée de scan**, une **durée d'effet** et un **angle**. Le Point Defence est le seul de la liste à infliger des dégâts ; ils sont trop faibles pour compter contre un vaisseau, sa fonction étant d'abattre missiles et mines.

| Module                             | Montage | Classe | Notation | Masse (t) | Intégrité | Consommation (MW) | Ponction distributeur | Portée (m) | Durée de scan (s) | Durée d'effet (s) | Angle (°) | Chargeur / réserve | Prix (Cr) |
|------------------------------------|---------|--------|----------|-----------|-----------|-------------------|-----------------------|------------|-------------------|-------------------|-----------|--------------------|-----------|
| Manifest Scanner *(ex-Cargo Scanner)* | —    | 0      | A        | 1,3       | 48        | 3,2               | —                     | 4 000      | 10                | —                 | 15        | —                  | 1 097 095 |
| Manifest Scanner *(ex-Cargo Scanner)* | —    | 0      | B        | 1,3       | 56        | 1,6               | —                     | 3 500      | 10                | —                 | 15        | —                  | 365 698   |
| Manifest Scanner *(ex-Cargo Scanner)* | —    | 0      | C        | 1,3       | 40        | 0,8               | —                     | 3 000      | 10                | —                 | 15        | —                  | 121 899   |
| Manifest Scanner *(ex-Cargo Scanner)* | —    | 0      | D        | 1,3       | 24        | 0,4               | —                     | 2 500      | 10                | —                 | 15        | —                  | 40 633    |
| Manifest Scanner *(ex-Cargo Scanner)* | —    | 0      | E        | 1,3       | 32        | 0,2               | —                     | 2 000      | 10                | —                 | 15        | —                  | 13 544    |
| Chaff Launcher                     | —       | 0      | I        | 1,3       | 20        | 0,2               | 4                     | —          | —                 | 20                | —         | 1 / 10             | 8 500     |
| Caustic Sink Launcher              | —       | 0      | I        | 1,7       | 45        | 0,6               | 2                     | —          | —                 | —                 | —         | 1 / 5              | 50 000    |
| Electronic Countermeasure          | —       | 0      | F        | 1,3       | 20        | 0,2               | —                     | 3 000      | —                 | —                 | —         | —                  | 12 500    |
| Heat Sink Launcher                 | —       | 0      | I        | 1,3       | 20        | 0,2               | 2                     | —          | —                 | 10                | —         | 1 / 3              | 3 500     |
| Heat Sink Launcher (pré-ingénieré) | —       | 0      | I        | 0,65      | 20        | 0,2               | 2                     | —          | —                 | 10                | —         | 1 / 3              | 0         |
| Kill Warrant Scanner               | —       | 0      | A        | 1,3       | 48        | 3,2               | —                     | 4 000      | 10                | —                 | —         | —                  | 1 097 095 |
| Kill Warrant Scanner               | —       | 0      | B        | 1,3       | 56        | 1,6               | —                     | 3 500      | 10                | —                 | —         | —                  | 365 698   |
| Kill Warrant Scanner               | —       | 0      | C        | 1,3       | 40        | 0,8               | —                     | 3 000      | 10                | —                 | —         | —                  | 121 899   |
| Kill Warrant Scanner               | —       | 0      | D        | 1,3       | 24        | 0,4               | —                     | 2 500      | 10                | —                 | —         | —                  | 40 633    |
| Kill Warrant Scanner               | —       | 0      | E        | 1,3       | 32        | 0,2               | —                     | 2 000      | 10                | —                 | —         | —                  | 13 544    |
| Point Defence                      | —       | 0      | I        | 0,5       | 30        | 0,2               | —                     | 2 500      | —                 | —                 | —         | 12 / 10 000        | 18 550    |
| Pulse Wave Analyser                | —       | 0      | A        | 1,3       | 48        | 3,2               | —                     | 24 000     | 3                 | —                 | 15        | —                  | 1 097 095 |
| Pulse Wave Analyser                | —       | 0      | B        | 1,3       | 56        | 1,6               | —                     | 21 000     | 3,1               | —                 | 15        | —                  | 365 698   |
| Pulse Wave Analyser                | —       | 0      | C        | 1,3       | 40        | 0,8               | —                     | 18 000     | 3                 | —                 | 15        | —                  | 121 899   |
| Pulse Wave Analyser                | —       | 0      | D        | 1,3       | 24        | 0,4               | —                     | 15 000     | 3                 | —                 | 15        | —                  | 40 633    |
| Pulse Wave Analyser                | —       | 0      | E        | 1,3       | 24        | 0,2               | —                     | 12 000     | 3                 | —                 | 15        | —                  | 13 544    |
| Thargoid Pulse Neutraliser         | —       | 0      | E        | 3         | 70        | 0,4               | —                     | 0          | —                 | 1                 | —         | —                  | 150 000   |
| Shutdown Field Neutraliser         | —       | 0      | F        | 1,3       | 35        | 0,2               | —                     | 3 000      | —                 | 1                 | —         | —                  | 63 000    |
| Frame Shift Wake Scanner           | —       | 0      | A        | 1,3       | 48        | 3,2               | —                     | 4 000      | 10                | —                 | —         | —                  | 1 097 095 |
| Frame Shift Wake Scanner           | —       | 0      | B        | 1,3       | 56        | 1,6               | —                     | 3 500      | 10                | —                 | —         | —                  | 365 698   |
| Frame Shift Wake Scanner           | —       | 0      | C        | 1,3       | 40        | 0,8               | —                     | 3 000      | 10                | —                 | —         | —                  | 121 899   |
| Frame Shift Wake Scanner           | —       | 0      | D        | 1,3       | 24        | 0,4               | —                     | 2 500      | 10                | —                 | —         | —                  | 40 633    |
| Frame Shift Wake Scanner           | —       | 0      | E        | 1,3       | 32        | 0,2               | —                     | 2 000      | 10                | —                 | —         | —                  | 13 544    |
| Enhanced Xeno Scanner              | —       | 0      | C        | 1,3       | 56        | 0,8               | —                     | 2 000      | 10                | —                 | 23        | —                  | 745 948   |
| Pulse Wave Xeno Scanner            | —       | 0      | C        | 3         | 100       | 1                 | —                     | 1 000      | 10                | —                 | 23        | —                  | 850 000   |
| Xeno Scanner                       | —       | 0      | E        | 1,3       | 56        | 0,2               | —                     | 500        | 10                | —                 | 23        | —                  | 365 698   |

*(Source : EDCD/coriolis-data, modules/hardpoints/cargo_scanner.json, modules/hardpoints/chaff_launcher.json, modules/hardpoints/caustic_sink_launcher.json, modules/hardpoints/electronic_countermeasure.json, modules/hardpoints/heat_sink_launcher.json, modules/hardpoints/kill_warrant_scanner.json, modules/hardpoints/point_defence.json, modules/hardpoints/pulse_wave_analyser.json, modules/hardpoints/shutdown_field_neutraliser.json, modules/hardpoints/frame_shift_wake_scanner.json, modules/hardpoints/xeno_scanner.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6. Le fichier source conserve le nom de fichier hérité `cargo_scanner.json` ; le nom affiché en jeu est désormais **Manifest Scanner**, sans changement de statistiques — voir [30-piraterie-et-pvp.md §2](./30-piraterie-et-pvp.md#2-les-scanners-de-piraterie--un-seul-module-renommé-pas-quatre).)*

### Shield Booster — gain de capacité et résistances par notation

Le Shield Booster occupe lui aussi un emplacement utilitaire, mais sa seule statistique est un pourcentage de capacité de bouclier ajouté. Les cinq notations vont de +4 % à +20 % ; aucune n'apporte de résistance en configuration stock, les colonnes de résistance étant à zéro tant qu'aucun blueprint n'est appliqué. Le cumul de plusieurs boosters subit un rendement décroissant, décrit à la section 4.2 de ce guide.

| Classe | Notation | Masse (t) | Intégrité | Consommation (MW) | Gain de capacité | Résistances (K / T / E) | Prix (Cr) |
|--------|----------|-----------|-----------|-------------------|------------------|-------------------------|-----------|
| 0      | A        | 3,5       | 48        | 1,2               | +20 %            | 0 % / 0 % / 0 %         | 281 000   |
| 0      | B        | 3         | 45        | 1                 | +16 %            | 0 % / 0 % / 0 %         | 122 000   |
| 0      | C        | 2         | 40        | 0,7               | +12 %            | 0 % / 0 % / 0 %         | 53 000    |
| 0      | D        | 1         | 35        | 0,5               | +8 %             | 0 % / 0 % / 0 %         | 23 000    |
| 0      | E        | 0,5       | 25        | 0,2               | +4 %             | 0 % / 0 % / 0 %         | 10 000    |

*(Source : EDCD/coriolis-data, modules/hardpoints/shield_booster.json, commit 0db9234b5b9c ; noms officiels des modules issus de EDCD/FDevIDs, outfitting.csv, commit c35612952dd6.)*

## Blindage de coque (bulkheads) — résistances et masse chiffrées par vaisseau

Le blindage de coque occupe l'unique emplacement d'armure du vaisseau. Cinq grades existent, identiques en résistances et en bonus d'intégrité sur les 47 châssis du jeu de données ; seuls la **masse ajoutée** et le **prix** changent d'un vaisseau à l'autre. Cette section est la référence chiffrée du corpus sur le sujet.

### Les cinq grades de blindage — résistances et multiplicateur de coque

Convention de signe : une valeur positive réduit les dégâts reçus, une valeur négative les aggrave. La coque nue est donc nativement **vulnérable** à l'explosif et au cinétique — c'est le point que le tableau ci-dessous rend, là où une lecture rapide inverserait volontiers les signes.

| Grade                      | Résistance cinétique | Résistance thermique | Résistance explosive | Résistance caustique | Bonus d'intégrité de coque | Multiplicateur appliqué |
|----------------------------|----------------------|----------------------|----------------------|----------------------|----------------------------|-------------------------|
| Lightweight Alloy          | −20 %                | 0 %                  | −40 %                | 0 %                  | +80 %                      | 1,8                     |
| Reinforced Alloy           | −20 %                | 0 %                  | −40 %                | 0 %                  | +152 %                     | 2,52                    |
| Military Grade Composite   | −20 %                | 0 %                  | −40 %                | 0 %                  | +250 %                     | 3,5                     |
| Mirrored Surface Composite | −75 %                | +50 %                | −50 %                | 0 %                  | +250 %                     | 3,5                     |
| Reactive Surface Composite | +25 %                | −40 %                | +20 %                | 0 %                  | +250 %                     | 3,5                     |

*(Source : EDCD/coriolis-data, un fichier `ships/<châssis>.json` par vaisseau, champ `bulkheads`, commit 0db9234b5b9c.)*

Trois enseignements se lisent directement dans cette table. D'abord, les trois grades les plus lourds — Military Grade, Mirrored Surface et Reactive Surface — apportent tous le **même** bonus d'intégrité, +250 % : seul leur profil de résistance les distingue. Ensuite, le **Mirrored Surface Composite** est le blindage anti-laser du jeu (+50 % thermique) et paie cet avantage par une vulnérabilité cinétique extrême (−75 %) : il se destine aux vaisseaux qui encaissent au bouclier et redoutent le laser. Enfin, le **Reactive Surface Composite** fait exactement l'inverse (+25 % cinétique, +20 % explosif, −40 % thermique) et convient aux coques exposées aux canons et aux missiles.

### Calculer l'armure obtenue : la formule et trois exemples chiffrés

L'armure totale se calcule ainsi : **armure = armure de base du vaisseau × (1 + bonus d'intégrité)**. Le bonus vaut 0,8 pour le Lightweight Alloy, 1,52 pour le Reinforced Alloy et 2,5 pour les trois grades lourds. Trois exemples pris dans le jeu de données :

| Vaisseau        | Armure de base | Grade                      | Bonus d'intégrité | Armure obtenue | Masse ajoutée (t) | Prix (Cr)   |
|-----------------|----------------|----------------------------|-------------------|----------------|-------------------|-------------|
| Sidewinder      | 60             | Lightweight Alloy          | +80 %             | 108            | 0                 | 0           |
| Sidewinder      | 60             | Reinforced Alloy           | +152 %            | 151,2          | 2                 | 25 600      |
| Sidewinder      | 60             | Military Grade Composite   | +250 %            | 210            | 4                 | 80 320      |
| Sidewinder      | 60             | Mirrored Surface Composite | +250 %            | 210            | 4                 | 132 064     |
| Sidewinder      | 60             | Reactive Surface Composite | +250 %            | 210            | 4                 | 139 424     |
| Anaconda        | 525            | Lightweight Alloy          | +80 %             | 945            | 0                 | 0           |
| Anaconda        | 525            | Reinforced Alloy           | +152 %            | 1 323          | 30                | 58 787 780  |
| Anaconda        | 525            | Military Grade Composite   | +250 %            | 1 837,5        | 60                | 132 272 505 |
| Anaconda        | 525            | Mirrored Surface Composite | +250 %            | 1 837,5        | 60                | 312 604 021 |
| Anaconda        | 525            | Reactive Surface Composite | +250 %            | 1 837,5        | 60                | 346 406 995 |
| Imperial Cutter | 400            | Lightweight Alloy          | +80 %             | 720            | 0                 | 0           |
| Imperial Cutter | 400            | Reinforced Alloy           | +152 %            | 1 008          | 30                | 83 587 780  |
| Imperial Cutter | 400            | Military Grade Composite   | +250 %            | 1 400          | 60                | 188 072 505 |
| Imperial Cutter | 400            | Mirrored Surface Composite | +250 %            | 1 400          | 60                | 444 478 021 |
| Imperial Cutter | 400            | Reactive Surface Composite | +250 %            | 1 400          | 60                | 492 540 995 |

*(Source : EDCD/coriolis-data, ships/sidewinder.json, ships/anaconda.json, ships/imperial_cutter.json, commit 0db9234b5b9c.)*

Le Lightweight Alloy est monté d'origine sur tout vaisseau neuf : il ne coûte rien et ne pèse rien, mais il ne multiplie l'armure de base que par 1,8. Passer un Sidewinder en Military Grade Composite triple presque son armure pour 4 tonnes ; le même passage sur un Imperial Cutter coûte 188 millions de crédits, soit davantage que la plupart des vaisseaux du jeu.

### Masse ajoutée et prix du blindage, vaisseau par vaisseau

La table qui suit donne, pour les 47 châssis du jeu de données, l'armure de base, puis la masse ajoutée et le prix de chacun des quatre grades payants. Le Lightweight Alloy n'y figure pas : il vaut 0 tonne et 0 crédit sur tous les vaisseaux. Les valeurs se lisent « masse en tonnes / prix en crédits ».

| Vaisseau              | Masse de coque (t) | Armure de base | Reinforced Alloy (t / Cr) | Military Grade (t / Cr) | Mirrored Surface (t / Cr) | Reactive Surface (t / Cr) |
|-----------------------|--------------------|----------------|---------------------------|-------------------------|---------------------------|---------------------------|
| Adder                 | 35                 | 90             | 3 / 35 123                | 5 / 79 027              | 5 / 186 767               | 5 / 206 963               |
| Alliance Challenger   | 450                | 300            | 40 / 12 188 900           | 78 / 27 425 026         | 78 / 64 814 480           | 78 / 71 823 097           |
| Alliance Chieftain    | 400                | 280            | 40 / 7 752 900            | 78 / 17 444 026         | 78 / 41 226 050           | 78 / 45 683 967           |
| Alliance Crusader     | 500                | 300            | 40 / 9 146 536            | 78 / 20 579 706         | 78 / 48 636 707           | 78 / 53 895 965           |
| Anaconda              | 400                | 525            | 30 / 58 787 780           | 60 / 132 272 505        | 60 / 312 604 021          | 60 / 346 406 995          |
| Asp Explorer          | 280                | 210            | 21 / 2 664 461            | 42 / 5 995 038          | 42 / 14 168 274           | 42 / 15 700 339           |
| Asp Scout             | 150                | 180            | 21 / 1 584 461            | 42 / 3 565 038          | 42 / 8 425 374            | 42 / 9 336 439            |
| Beluga Liner          | 950                | 280            | 83 / 33 813 105           | 165 / 76 079 487        | 165 / 179 801 189         | 165 / 199 243 724         |
| Caspian Explorer      | 950                | 345            | 30 / 77 944 520           | 60 / 175 375 160        | 60 / 414 469 960          | 60 / 459 288 060          |
| Cobra Mk III          | 180                | 120            | 14 / 139 887              | 27 / 341 746            | 27 / 734 407              | 27 / 824 285              |
| Cobra Mk IV           | 210                | 120            | 14 / 305 887              | 27 / 688 246            | 27 / 1 605 907            | 27 / 1 802 440            |
| Cobra Mk V            | 150                | 180            | 14 / 795 784              | 27 / 1 790 514          | 27 / 4 177 866            | 27 / 4 689 157            |
| Corsair               | 265                | 270            | 32 / 31 721 900           | 63 / 71 374 270         | 63 / 166 539 970          | 63 / 186 921 290          |
| Diamondback Explorer  | 260                | 150            | 23 / 757 904              | 47 / 1 705 284          | 26 / 3 978 996            | 47 / 4 465 949            |
| Diamondback Scout     | 170                | 120            | 13 / 225 731              | 26 / 507 896            | 26 / 1 185 090            | 26 / 1 330 123            |
| Dolphin               | 140                | 110            | 32 / 534 929              | 63 / 1 203 590          | 63 / 2 808 378            | 63 / 3 152 070            |
| Eagle                 | 50                 | 40             | 4 / 26 880                | 8 / 90 048              | 8 / 140 089               | 8 / 150 393               |
| Federal Assault Ship  | 480                | 300            | 44 / 7 925 682            | 87 / 17 832 784         | 87 / 42 144 814           | 87 / 46 702 081           |
| Federal Corvette      | 900                | 370            | 30 / 75 187 780           | 60 / 169 172 505        | 60 / 399 811 021          | 60 / 443 043 995          |
| Federal Dropship      | 580                | 300            | 44 / 5 725 682            | 87 / 12 882 784         | 87 / 30 446 314           | 87 / 33 738 581           |
| Federal Gunship       | 580                | 350            | 44 / 14 325 682           | 87 / 32 232 784         | 87 / 76 176 814           | 87 / 84 414 081           |
| Fer-de-Lance          | 250                | 225            | 19 / 20 626 816           | 38 / 46 410 336         | 38 / 109 683 094          | 38 / 121 543 513          |
| Hauler                | 14                 | 100            | 1 / 42 176                | 2 / 185 047             | 2 / 270 295               | 2 / 282 421               |
| Imperial Clipper      | 400                | 270            | 30 / 8 918 344            | 60 / 20 066 274         | 60 / 47 423 294           | 60 / 52 551 342           |
| Imperial Courier      | 35                 | 80             | 4 / 1 017 172             | 8 / 2 288 637           | 8 / 5 408 814             | 8 / 5 993 688             |
| Imperial Cutter       | 1 100              | 400            | 30 / 83 587 780           | 60 / 188 072 505        | 60 / 444 478 021          | 60 / 492 540 995          |
| Imperial Eagle        | 50                 | 60             | 4 / 66 495                | 8 / 222 758             | 8 / 346 549               | 8 / 372 039               |
| Keelback              | 180                | 270            | 12 / 1 250 461            | 23 / 2 813 538          | 23 / 6 649 329            | 23 / 7 368 344            |
| Kestrel Mk II         | 190                | 70             | 17 / 1 970 246            | 35 / 4 433 053          | 35 / 10 476 783           | 35 / 11 609 674           |
| Krait Mk II           | 320                | 220            | 36 / 18 325 682           | 67 / 41 232 784         | 67 / 97 446 814           | 67 / 88 322 097           |
| Krait Phantom         | 270                | 180            | 26 / 14 988 900           | 53 / 33 725 026         | 53 / 79 703 480           | 53 / 88 322 097           |
| Mamba                 | 250                | 230            | 19 / 22 346 816           | 38 / 50 280 336         | 38 / 118 829 194          | 38 / 131 678 613          |
| Mandalay              | 230                | 230            | 19 / 6 191 367            | 38 / 13 930 575         | 38 / 32 922 590           | 38 / 36 482 626           |
| Orca                  | 290                | 220            | 21 / 19 415 954           | 87 / 43 685 898         | 87 / 103 244 339          | 87 / 114 408 513          |
| Panther Clipper Mk II | 1 200              | 620            | 75 / 120 839 434          | 150 / 271 213 728       | 150 / 632 832 030         | 150 / 710 278 615         |
| Python                | 350                | 260            | 26 / 22 791 271           | 53 / 51 280 361         | 53 / 121 192 586          | 53 / 134 297 567          |
| Python Mk II          | 450                | 280            | 26 / 23 702 103           | 53 / 53 329 732         | 53 / 126 035 933          | 53 / 139 664 643          |
| Sidewinder            | 25                 | 60             | 2 / 25 600                | 4 / 80 320              | 4 / 132 064               | 4 / 139 424               |
| Type-10 Defender      | 1 200              | 580            | 75 / 49 902 136           | 150 / 112 279 807       | 150 / 265 354 612         | 150 / 294 048 341         |
| Type-11 Prospector    | 320                | 350            | 32 / 27 144 740           | 63 / 61 075 670         | 63 / 144 342 150          | 63 / 159 950 380          |
| Type-6 Transporter    | 155                | 180            | 12 / 418 378              | 23 / 941 350            | 23 / 2 224 725            | 23 / 2 465 292            |
| Type-7 Transporter    | 350                | 340            | 32 / 6 988 900            | 63 / 15 725 026         | 63 / 37 163 480           | 63 / 41 182 097           |
| Type-8 Transporter    | 400                | 440            | 32 / 15 381 590           | 63 / 34 608 570         | 63 / 37 163 480           | 63 / 90 636 000           |
| Type-9 Heavy          | 850                | 480            | 75 / 30 622 336           | 150 / 68 900 257        | 150 / 162 834 275         | 150 / 180 442 119         |
| Viper                 | 50                 | 70             | 5 / 57 172                | 9 / 128 637             | 9 / 304 014               | 9 / 336 888               |
| Viper Mk IV           | 190                | 150            | 5 / 175 172               | 9 / 394 137             | 9 / 931 479               | 9 / 1 032 203             |
| Vulture               | 230                | 160            | 17 / 1 970 246            | 35 / 4 433 053          | 35 / 10 476 783           | 35 / 11 609 674           |

*(Source : EDCD/coriolis-data, un fichier `ships/<châssis>.json` par vaisseau, champ `bulkheads`, commit 0db9234b5b9c ; noms de châssis vérifiés contre EDCD/FDevIDs, shipyard.csv, commit c35612952dd6.)*

Deux particularités du jeu de données méritent d'être signalées plutôt que lissées. Le **Caspian Explorer** ne porte pas les cinq grades habituels mais un Lightweight Alloy gratuit suivi de cinq blindages nommés *Mk II Ablative* ; ses quatre grades payants repris ci-dessus sont les *Mk II Ablative Reinforced*, *Military Grade*, *Mirrored* et *Reactive*, aux mêmes résistances que leurs équivalents standards. Le **Diamondback Explorer** porte une masse de 26 tonnes pour son Mirrored Surface Composite là où ses autres grades lourds pèsent 47 tonnes : l'écart est présent tel quel dans la source amont et n'a pas été corrigé ici.

## Voir aussi

- [Liste complète des vaisseaux d'Elite Dangerous](./03-vaisseaux.md) — emplacements, hardpoints et prix par
  vaisseau, y compris les porteurs d'une baie de vaisseau.
- [Guide complet des Guardians](./05-guardians.md) — sites de ruines, puzzles et stats de combat des armes Guardian.
- [Guide complet des Ingénieurs](./06-ingenieurs.md) — modification (engineering) de tous les modules listés ici.
- [Guide complet du combat spatial](./08-combat-spatial.md) — builds chiffrés, renforts/blindage en contexte de
  combat, rang de combat.
- [Guide complet de l'exploration et de l'exobiologie](./10-exploration.md) — optimisation de la portée de saut, DSS,
  Fuel Scoop.
- [Politique et Powerplay dans Elite Dangerous](./02-powerplay.md) — paliers, mérites et classement actuel des
  Powers (armes/boucliers exclusifs).
- [Le Minage (Mining)](./20-minage.md) — usage détaillé des lasers de minage et des contrôleurs de limpets
  Collector/Prospector.
- [Combat anti-Thargoïde (AX) approfondi](./25-combat-ax.md) — armes AX, anatomie des Interceptors, nuages caustiques.
- [Porte-vaisseaux de joueur (Fleet Carriers)](./19-fleet-carriers.md) — logistique de carburant et de limpets à
  l'échelle d'un escadron.
- [Guide complet de l'équipement à pied (Odyssey)](./07-equipement-a-pied.md) — équipement des personnages, distinct
  des modules de vaisseau couverts ici.
- [Le Rhino et le Nomad](./14-rhino-nomad.md) — les deux véhicules embarqués qui se déploient depuis la baie de
  vaisseau du §13.
- [Les Opérations](./13-operations.md) — la mécanique dont provient le Merc Coin et le catalogue MercGear de la
  section 18.
- [Sources de données](./17-sources-donnees.md) — pour le périmètre exact d'`outfitting.csv` et de `shipyard.csv`, et
  pour les drapeaux `Status.json` du Nomad.

## Notes et limites

Les données de classes, notations et montages proviennent du référentiel technique **EDCD/FDevIDs** (fichier
`outfitting.csv`), utilisé comme source de référence par les principaux outils communautaires (EDMC, Inara, EDSY,
Coriolis). Les valeurs chiffrées ajoutées dans cette révision (bulkheads, HRP/MRP, contrôleurs de limpets, portée FSD,
résistances de bouclier, baies de vaisseau) proviennent du jeu de données **EDCD/coriolis-data** (fichiers JSON par
module) et, pour le mécanisme de rendement décroissant des boucliers, du code source du calculateur **EDCD/coriolis**
— les deux étant maintenus par la même communauté technique que FDevIDs et utilisés en amont par la plupart des
calculateurs de build (Coriolis, EDSY). Les mécanismes précis de déblocage (stations hébergeant les Brokers Guardian
et Human, coûts exacts en matériaux par palier) sont sujets à évolution au fil des mises à jour du jeu ; il est
recommandé de les recouper sur **Inara.cz** (section Engineering/Broker) avant toute planification nécessitant une
précision au matériau près. Les statistiques précises des 4 chasseurs de la baie de vaisseau (section 13) n'ont pas pu
être vérifiées sur une source primaire dans le cadre de cette révision — seuls les fabricants de deux des quatre ont
pu être confirmés (Wikipédia).

Le §13.2 (baies de vaisseau Mk I et Mk II, Nomad, Mk II Biological Scanner, Pulse Lasers), le catalogue MercGear de la
section 18 et les entrées 2026 de la section 19 reposent sur les **notes de version officielles de Frontier**, citées
inline avec leur titre et leur date UTC. Deux éléments seulement viennent d'ailleurs et sont signalés comme tels : le
libellé « Vessel Hangar » / « Mk II Vessel Hangar » d'`outfitting.csv` (référentiel communautaire `EDCD/FDevIDs`) et
le comportement du Nomad dans `Status.json` avec son identifiant interne `Lander01` (corroborations d'outils
communautaires, détaillées dans [17-sources-donnees.md](./17-sources-donnees.md)). Les statistiques chiffrées du Nomad
ne sont pas publiées dans les notes de version : aucune n'est donnée ici. Celles des modules MercGear ne le sont pas
davantage — les tarifs en Merc Coin et les compromis annoncés par Frontier restent hors du corpus — mais les lignes
suffixées « (pré-ingénieré) » des référentiels chiffrés en donnent les caractéristiques telles que
**EDCD/coriolis-data** les porte, ce qui est une source distincte des notes de version et signalée comme telle.

Les chiffres ajoutés dans la présente révision (§11.2 sur l'effet du blueprint « Increased Range », et le Frame Shift
Wake Scanner au §12) proviennent des catalogues hors ligne d'ingénierie et de matériaux, édition 2026-08, eux-mêmes
dérivés de l'étude interne du 19 août 2026 et d'EDCD/coriolis-data. La table du §11.2 est **dérivée par calcul** à
partir de ces sources et n'est portée telle quelle par aucune d'elles.

### Le chiffrage des modules : d'où viennent ces nombres et ce qu'ils ne disent pas

La révision du 10 septembre 2026 comble le manque de chiffrage économique et énergétique signalé jusqu'ici : les
trois référentiels ajoutés en fin de guide donnent, pour les 952 modules et armes du catalogue et pour les
47 châssis du jeu, la masse, l'intégrité, la consommation en MW, la statistique propre à chaque famille et le prix
d'achat en crédits. La couverture est complète : le jeu de données amont compte 960 entrées hors modules de repli,
dont huit — le fichier `internal_fuel_tank.json` — dupliquent les réservoirs de carburant déjà listés. Ils sont produits mécaniquement à partir de **EDCD/coriolis-data** au commit
`0db9234b5b9ce8c939ea84133d7ce336eea88e27` (fichiers `ships/*.json`, `modules/standard/*.json`,
`modules/internal/*.json`, `modules/hardpoints/*.json`), croisé avec **EDCD/FDevIDs** au commit
`c35612952dd6a547d1a7ac4cffab9c7051e86579` (`outfitting.csv`, `shipyard.csv`) pour les noms officiels affichés en
jeu. Chaque table cite en note le fichier amont et le commit dont elle sort, de sorte que n'importe quelle valeur
puisse être recontrôlée à l'identique.

Deux réserves accompagnent ce chiffrage. D'abord, les colonnes **Cadence** et **DPS brut** du référentiel des armes
sont **dérivées par calcul** et non relevées : la source ne porte ni champ `rof` ni champ `dps`, seulement
l'intervalle de tir `fireint` et les dégâts `damage`. Les formules appliquées sont écrites en tête de section, et ce
DPS ignore le temps de rechargement. Ensuite, deux irrégularités du jeu de données amont sont reprises telles quelles
plutôt que lissées : les cinq blindages du **Caspian Explorer** portent la nomenclature *Mk II Ablative* au lieu des
noms habituels, et le **Diamondback Explorer** affiche 26 tonnes pour son Mirrored Surface Composite là où ses autres
grades lourds en pèsent 47. Une correction du guide est à signaler : la table des résistances de blindage donnée
jusqu'ici en section 3.1 en inversait le sens — la coque nue est **vulnérable** au cinétique et à l'explosif, le
Mirrored Surface Composite résiste au **thermique** et non au cinétique. Les valeurs publiées désormais sont celles
de la source.

## Sources

- https://raw.githubusercontent.com/EDCD/FDevIDs/master/outfitting.csv
- https://github.com/EDCD/FDevIDs — commit `c35612952dd6a547d1a7ac4cffab9c7051e86579` pour les noms officiels de
  modules (`outfitting.csv`) et de châssis (`shipyard.csv`) utilisés dans les trois référentiels chiffrés
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/engineers.csv
- https://github.com/EDCD/coriolis-data — commit `0db9234b5b9ce8c939ea84133d7ce336eea88e27` pour l'intégralité des
  valeurs chiffrées des référentiels : `ships/*.json` (bulkheads, armure de base, masse de coque),
  `modules/standard/*.json` (7 familles cœur), `modules/internal/*.json` (39 familles optionnelles),
  `modules/hardpoints/*.json` (43 types d'armes et d'utilitaires)
- https://github.com/EDCD/coriolis (calculateur de référence open source, notamment `src/app/shipyard/Calculations.js`
  pour la formule de rendement décroissant des résistances de bouclier/coque)
- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://inara.cz/

### Notes de version officielles de Frontier (flux d'annonces Steam, appid 359320, relevé le 9 septembre 2026)

- « Elite Dangerous | Kestrel Mk. II Update », 24 février 2026, 12:21 UTC (Mk II Agile Boost Thrusters, Mk II Plasma
  Shock Accelerator).
- « Elite Dangerous | An Update on Operations », 22 avril 2026, 14:02 UTC (report d'Operations en juin).
- « Elite Dangerous | Lynx Highliner Update Notes », 28 avril 2026, 13:11 UTC (cabines passagers Mk II).
- « Discover the Nomad », 2 juin 2026, 13:03 UTC (dévoilement du Nomad, patins d'atterrissage, moteurs pivotants,
  sortie annoncée au 30 juin en accès anticipé ARX).
- « Elite Dangerous | Operations Update », 1er juillet 2026, 14:01 UTC (baies de vaisseau Mk I et Mk II et leurs listes
  de vaisseaux porteurs, Nomad, Mk II Biological Scanner, Pulse Lasers, catalogue MercGear et Merc Coin).
- « Elite Dangerous | Operations Update | Update 3 », 9 juillet 2026, 10:24 UTC (correctifs).
- « Beneath the Surface: Your First Look at the Rhino », 6 août 2026, 14:19 UTC (le Rhino se largue depuis la baie de
  vaisseau et non par la trappe à cargo).
- « Elite Dangerous | Rhino SRV Update », 2 septembre 2026, 11:20 UTC (Planetary Mining Deposit Scanner, Refinery,
  Mining Rig Deployment Module, extension du Detailed Surface Scanner au minage planétaire).

### Sources hors ligne, datées

- Catalogue de blueprints hors ligne, édition 2026-08 (blueprint `fsd_increased_range` : effets par grade, rolls à
  réputation 5, effets expérimentaux Mass Manager et Deep Charge) ; source amont déclarée : EDCD/coriolis-data.
- Catalogue de matériaux hors ligne, édition 2026-08 (catégorie « Wake Scans » : Frame Shift Wake Scanner comme source
  unique, notations, prix, portée, durée de scan, grades et plafonds de stockage) ; source amont déclarée :
  EDCD/FDevIDs `material.csv`.
- Étude interne du 19 août 2026, § 3.3 « Portée du FSD : pourquoi ça bloque, et la table exacte » (formule de portée,
  +30 % de masse du module, réserves sur le FSD SCO et sur EDSY).
