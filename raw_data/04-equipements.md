# Liste complète des équipements dans Elite Dangerous

## Introduction

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

### 1.1 Classe et taille

- **Modules internes et standards** (boucliers, centrales électriques, FSD, senseurs, soutes, distributeurs,
  propulseurs, etc.) : classés de **Class 1 à Class 8**, la classe la plus élevée correspondant à la plus grande
  capacité mais aussi au poids et au coût les plus importants.
- **Points d'ancrage d'armes (hardpoints)** : quatre tailles — **Small (1)**, **Medium (2)**, **Large (3)**, **Huge (
  4)** — qui déterminent les armes pouvant y être montées.
- **Emplacements utilitaires** : taille **0**, dédiés aux modules légers (contre-mesures, boosters de bouclier, scanners
  passifs).

### 1.2 Notation (rating)

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
**Module Reinforcement Package** et le **Fighter Hangar** (voir sections 3.2, 3.3 et 13) n'existent par exemple qu'en
notations D et/ou E, D étant alors la meilleure des deux — ne pas présumer qu'une notation D ou E est automatiquement
inférieure sans vérifier la fiche du module concerné.

### 1.3 Types de montage (armes)

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

### 2.3 Armes à plasma

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

### 2.5 Armes minières spécialisées

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

### 2.8 Effets expérimentaux (ingénierie)

Les **effets expérimentaux** ne sont pas des armes distinctes mais une modification de 5ᵉ niveau appliquée par un
ingénieur sur une arme existante, en complément d'un blueprint de modification classique (Overcharged, Efficient, Long
Range, Rapid Fire, etc.). Chaque arme n'accepte qu'un sous-ensemble d'effets compatibles. Les principaux effets
rencontrés dans le jeu :

- **Choc thermique (Thermal Shock)**
- **Incendiaire (Incendiary Rounds)**
- **Munitions émissives (Emissive Munitions)**
- **Cascade de rétroaction (Feedback Cascade)**
- **Bouclier de force (Force Shell)**
- **Coque corrosive (Corrosive Shell)**
- **Écran de dispersion (Screening Shell)**
- **Séquence de déphasage (Phasing Sequence)**
- **Munitions régénératrices (Regenerative Sequence)**
- **Chargeur automatique / tir rapide (Auto Loader / Rapid Fire)**, selon le type d'arme concerné

## 3. Coque et blindage (Bulkheads, HRP, MRP)

Le blindage de coque (**Bulkheads**) occupe l'unique emplacement standard dédié à l'armure (pas de « classe » au sens
habituel : un seul emplacement par vaisseau, avec 5 grades disponibles) et détermine à la fois l'intégrité totale de
la coque et sa résistance aux dégâts cinétiques, thermiques et explosifs. Il se complète, en emplacements internes
optionnels, par les **Hull Reinforcement Package ([HRP](./00-glossaire.md))** et **Module Reinforcement Package
([MRP](./00-glossaire.md))**.

### 3.1 Bulkheads — les 5 grades

| Grade                       | Résistance Explosive | Résistance Cinétique | Résistance Thermique | Bonus d'intégrité de coque |
|------------------------------|-----------------------|-----------------------|-----------------------|-------------------------------|
| Lightweight Alloy            | +40 %                 | +20 %                 | 0 %                    | +80 %                          |
| Reinforced Alloy             | +40 %                 | +20 %                 | 0 %                    | +152 %                         |
| Military Grade Composite     | +40 %                 | +20 %                 | 0 %                    | +250 %                         |
| Mirrored Surface Composite   | +50 %                 | +75 %                 | −50 %                  | +250 %                         |
| Reactive Surface Composite   | −20 %                 | −25 %                 | +40 %                  | +250 %                         |

*(Résistance aux dégâts caustiques : nulle pour les 5 grades. Ces valeurs de résistance et de bonus d'intégrité sont
identiques sur tous les vaisseaux — seule la masse de coque de base et le coût du blindage varient selon la
plateforme. Source : jeu de données de référence EDCD/coriolis-data.)*

Points clés :

- Les 3 grades les plus lourds (**Military Grade**, **Mirrored Surface**, **Reactive Surface**) offrent tous le
  **même bonus brut d'intégrité (+250 %)** ; seul leur profil de résistance diffère.
- **Mirrored Surface Composite** offre la meilleure protection cinétique/explosive du jeu, mais rend la coque **plus
  vulnérable au thermique** (lasers) — à réserver aux vaisseaux qui encaissent l'essentiel des dégâts via le bouclier
  plutôt que la coque nue.
- **Reactive Surface Composite** fait l'inverse : bon contre le thermique, mais plus faible contre le cinétique et
  l'explosif (donc contre canons, multi-cannons et missiles).
- **Military Grade Composite** reste le choix « neutre » (même profil de résistance que Lightweight/Reinforced, mais
  bonus d'intégrité maximal).

### 3.2 Hull Reinforcement Package (HRP)

Module interne (classes 1 à 5, **notations D et E uniquement**) qui ajoute un bonus fixe de points de vie de coque et
une petite résistance additionnelle aux trois types de dégâts physiques.

| Classe | Notation | Bonus de PV de coque | Résistance (Explosive / Cinétique / Thermique) | Masse | Source d'obtention |
|--------|----------|--------------------------|----------------------------------------------------|-------|------------------------|
| 1      | E        | +80                       | +0,5 %                                              | 2 t   | Chantier naval          |
| 1      | D        | +110                      | +0,5 %                                              | 1 t   | Chantier naval          |
| 2      | E        | +150                      | +1,0 %                                              | 4 t   | Chantier naval          |
| 2      | D        | +190                      | +1,0 %                                              | 2 t   | Chantier naval          |
| 3      | E        | +230                      | +1,5 %                                              | 8 t   | Chantier naval          |
| 3      | D        | +260                      | +1,5 %                                              | 4 t   | Chantier naval          |
| 4      | E        | +300                      | +2,0 %                                              | 16 t  | Chantier naval          |
| 4      | D        | +330                      | +2,0 %                                              | 8 t   | Chantier naval          |
| 5      | E        | +360                      | +2,5 %                                              | 32 t  | Chantier naval          |
| 5      | D        | +390                      | +2,5 %                                              | 16 t  | Chantier naval          |

*(Aucun bonus de résistance aux dégâts caustiques. Source : EDCD/coriolis-data.)* Comme pour plusieurs modules
« spéciaux » du jeu, la notation **D est ici supérieure à E** (plus de PV, plus de résistance, coût environ triplé) —
l'échelle A–E habituelle (A meilleur) ne s'applique pas puisque seules D et E existent pour ce module.

### 3.3 Module Reinforcement Package (MRP)

Module interne (classes 1 à 5, **notations D et E uniquement**) qui réduit les dégâts subis par les *autres modules
internes* une fois le bouclier tombé et la coque touchée.

| Classe | Notation | Réduction des dégâts aux modules | Intégrité du MRP | Masse | Source d'obtention |
|--------|----------|--------------------------------------|-----------------------|-------|------------------------|
| 1      | E        | −30 %                                 | 77                     | 2 t   | Chantier naval          |
| 1      | D        | −60 %                                 | 70                     | 1 t   | Chantier naval          |
| 2      | E        | −30 %                                 | 115                    | 4 t   | Chantier naval          |
| 2      | D        | −60 %                                 | 105                    | 2 t   | Chantier naval          |
| 3      | E        | −30 %                                 | 170                    | 8 t   | Chantier naval          |
| 3      | D        | −60 %                                 | 155                    | 4 t   | Chantier naval          |
| 4      | E        | −30 %                                 | 260                    | 16 t  | Chantier naval          |
| 4      | D        | −60 %                                 | 235                    | 8 t   | Chantier naval          |
| 5      | E        | −30 %                                 | 385                    | 32 t  | Chantier naval          |
| 5      | D        | −60 %                                 | 350                    | 16 t  | Chantier naval          |

*(Source : EDCD/coriolis-data.)* Compromis à noter : le MRP en notation D protège deux fois mieux les autres modules,
mais possède lui-même une intégrité (PV) **plus faible** que le E de même classe — il encaisse donc moins bien un
coup direct sur son propre emplacement.

### 3.4 Renforts Guardian

Les renforts de coque et de module d'origine Guardian (**Guardian Hull Reinforcement**, **Guardian Module
Reinforcement**) suivent une logique de protection similaire mais se débloquent exclusivement auprès du Guardian
Technology Broker — voir section 14 « Modules Guardian » pour leur détail et leurs conditions de déblocage.

## 4. Boucliers et générateurs de bouclier

| Module                            | Tailles        | Notation | Caractéristique                                                           | Obtention                      |
|-------------------------------------|----------------|----------|-----------------------------------------------------------------------------|------------------------------------|
| **Shield Generator**              | 1–8            | A–E      | Bouclier standard, régénération normale                                   | Chantier naval                 |
| **Bi-Weave Shield Generator**     | 1–8            | C (fixe) | Régénération plus rapide, capacité totale plus faible                     | Chantier naval                 |
| **Prismatic Shield Generator**    | 1–8            | A        | Capacité maximale, régénération plus lente, consommation d'énergie élevée | **Powerplay** (rang élevé)     |
| **Shield Cell Bank**              | 1–8            | A–E      | Recharge d'urgence via des cellules consommables                          | Chantier naval                 |
| **Shield Booster**                | 0 (utilitaire) | A–E      | Augmente la capacité totale du bouclier ; plusieurs cumulables            | Chantier naval / ingénieur     |
| **Guardian Shield Reinforcement** | 1–5            | D/E      | Ajoute de la capacité de bouclier brute                                   | **Guardian Technology Broker** |

### 4.1 Résistances de base

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

- **Thrusters standards** (tailles 2–8, notations A–E) : déterminent vitesse et maniabilité en vol normal ; disponibles
  en chantier naval.
- **Enhanced Performance Thrusters** (tailles 2–3, notation A) : variante plus rapide, obtenue par ingénierie (Felicity
  Farseer) plutôt qu'en magasin.

Les propulseurs bénéficient fortement des modifications d'ingénieur **Dirty Drive Tuning** et **Clean Drive Tuning**
(proposées par Felicity Farseer), qui augmentent respectivement la vitesse brute ou l'efficacité énergétique/thermique.

## 6. Centrales électriques (Power Plants)

| Module                          | Tailles | Notation | Caractéristique                                                                                                   | Obtention                      |
|-----------------------------------|---------|----------|-----------------------------------------------------------------------------------------------------------------------|-------------------------------------|
| **Power Plant** standard        | 2–8     | A–E      | Alimente l'ensemble des modules ; le rating impacte fortement signature thermique et masse                        | Chantier naval                 |
| **Guardian Hybrid Power Plant** | 2–8     | A        | Combine technologie humaine et Guardian ; faible signature thermique, s'intègre bien avec le Guardian FSD Booster | **Guardian Technology Broker** |

## 7. Distributeurs d'énergie (Power Distributors)

| Module                                | Tailles | Notation | Caractéristique                      | Obtention                      |
|------------------------------------------|---------|----------|------------------------------------------|-------------------------------------|
| **Power Distributor** standard        | 1–8     | A–E      | Gère la répartition SYS/ENG/WEP      | Chantier naval                 |
| **Guardian Hybrid Power Distributor** | 1–8     | A        | Capacité de distributeur plus élevée | **Guardian Technology Broker** |

## 8. Senseurs et modules de détection

- **Sensors** (module interne standard, tailles 1–8, notations A–E) — détermine la portée de détection des autres
  vaisseaux et l'affichage radar/HUD.
- **Kill Warrant Scanner** (utilitaire) — révèle les primes actives sur une cible dans d'autres juridictions.
- **Cargo Scanner** (utilitaire) — analyse le contenu de soute d'un vaisseau cible.
- **Frame Shift Wake Scanner** (utilitaire) — détecte la destination d'un vaisseau ayant sauté récemment.
- **Pulse Wave Analyser** (utilitaire) — détection de sites de minage sur les astéroïdes.
- **Xeno Scanner**, **Enhanced Xeno Scanner**, **Pulse Wave Xeno Scanner** (utilitaires) — analyse et diagnostic des
  structures et vaisseaux Thargoïdes.

## 9. Soutes (Cargo) et réservoirs

| Module                             | Tailles | Notation | Caractéristique                                                               |
|---------------------------------------|---------|----------|-----------------------------------------------------------------------------------|
| **Cargo Rack**                     | 1–8     | E        | Capacité de fret standard                                                     |
| **Corrosion Resistant Cargo Rack** | 1 et 4  | E/F      | Protège certaines marchandises corrosives (matériaux Thargoïdes, exobiologie) |
| **Fuel Tank** additionnel          | 1–8     | C        | Réservoir de carburant supplémentaire                                         |

## 10. Contrôleurs de limpets

Les limpets sont des drones jetables lancés depuis un vaisseau pour automatiser diverses tâches (minage, collecte,
piratage, ravitaillement, réparation, etc.). Chaque fonction nécessite un **contrôleur de limpets** dédié, installé
en emplacement interne de **classe impaire uniquement (1, 3, 5 ou 7)**, et consomme des munitions de limpets stockées
dans une soute de cargo dédiée.

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
| **Detailed Surface Scanner (DSS)**                               | 1       | I                                   | Sonde de cartographie des corps planétaires, révèle les points d'intérêt en surface et permet le bonus de première cartographie                                                           |
| **Planetary Approach Suite / Advanced Planetary Approach Suite** | 1       | I                                   | Requis pour l'atterrissage planétaire (Horizons)                                                                                                                                          |
| **Fuel Scoop**                                                   | 1–8     | A–E                                 | Récupération de carburant depuis une étoile en vol                                                                                                                                        |
| **Auto Field-Maintenance Unit (AFMU)**                           | 1–8     | A–E                                 | Réparation autonome des modules endommagés en vol                                                                                                                                         |

### 11.1 Portée de saut : masse optimale par classe et notation

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
carburant embarqué, Guardian FSD Booster, engineering « Increased Range »), voir [10-exploration.md](./10-exploration.md).

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
| **Shield Booster**                  | A–E      | Voir section 4 (Boucliers), notamment §4.2 pour le cumul et le rendement décroissant                       |

Ces modules varient en notation (A à I selon le module) mais restent tous de classe 0.

## 13. Chasseurs embarqués (Fighter Hangar)

Le **Fighter Hangar** est un module interne qui permet de stocker, réparer et lancer un ou plusieurs chasseurs
monoplaces, pilotables soit par un membre d'équipage (Multicrew), soit par un PNJ recruté. Contrairement à la plupart
des modules internes, il n'existe **qu'en notation D**, en classes 5, 6 et 7 :

| Classe | Notation | Baies | Reconstructions par baie |
|--------|----------|-------|-------------------------------|
| 5      | D        | 1     | 6                              |
| 6      | D        | 2     | 8                              |
| 7      | D        | 2     | 15                             |

*(Source : EDCD/coriolis-data.)* Un chasseur détruit en combat peut être reconstruit un nombre limité de fois par
baie et par sortie (« reconstructions par baie » ci-dessus) avant que la baie ne devienne indisponible jusqu'au
retour à une station.

### Les 4 modèles de chasseurs

Quatre modèles de chasseurs standards sont disponibles au choix dans l'interface du Fighter Hangar, indépendamment du
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
l'interface du Fighter Hangar (choix du modèle, armement fixe limité propre à chaque appareil), et non via un
chantier naval classique — leurs statistiques précises (PV, vitesse, DPS) ne peuvent donc pas être sourcées de la
même façon que le reste de ce guide ; se référer à un calculateur communautaire (Coriolis, EDSY) ou à Inara.cz pour
des valeurs exactes. Pour la liste des vaisseaux capables d'embarquer un Fighter Hangar (Anaconda, Federal Corvette,
Imperial Cutter, Type-10 Defender, etc.), voir [03-vaisseaux.md](./03-vaisseaux.md).

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

## 16. Ingénieurs — panorama

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
| **Chantier naval standard**         | Armes énergie/cinétiques/plasma de base, boucliers standards, propulseurs, centrales électriques, distributeurs, senseurs, soutes, FSD (standard et SCO), Fuel Scoop, AFMU, bulkheads, HRP/MRP, contrôleurs de limpets, Fighter Hangar, modules utilitaires courants |
| **Ingénieurs (systèmes dédiés)**    | Modifications (blueprints) et effets expérimentaux sur presque tous les modules ; certains modules exclusifs comme l'Enhanced Performance Thrusters                                    |
| **Guardian Technology Broker**      | Armes Guardian, renforts Guardian, Guardian FSD Booster, centrale/distributeur Hybrid Guardian, Guardian Nanite Torpedo Pylon (avec matériaux Thargoïdes)                              |
| **Human Technology Broker (Aegis)** | Variantes AX améliorées (Enhanced AX Multi-Cannon, Enhanced AX Missile Rack)                                                                                                           |
| **Powerplay**                       | Armes et modules exclusifs listés en section 17, dont le Prismatic Shield Generator                                                                                                    |

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
- Au 17 juin 2026, environ **195,5 millions de systèmes stellaires** avaient été catalogués par les joueurs (dont
  environ 97,7 millions explorés directement), soit environ 0,0489 % de la galaxie — signe d'une activité d'exploration
  toujours soutenue (pertinent pour l'usage des FSD, DSS et Discovery Scanner). *Capture au 17 juin 2026 ; à
  revérifier sur les outils de suivi communautaires (EDAstro, Canonn, Inara) pour un chiffre à jour.*

## Voir aussi

- [Liste complète des vaisseaux d'Elite Dangerous](./03-vaisseaux.md) — emplacements, hardpoints et prix par
  vaisseau, y compris les porteurs de Fighter Hangar.
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

## Notes et limites

Les données de classes, notations et montages proviennent du référentiel technique **EDCD/FDevIDs** (fichier
`outfitting.csv`), utilisé comme source de référence par les principaux outils communautaires (EDMC, Inara, EDSY,
Coriolis). Les valeurs chiffrées ajoutées dans cette révision (bulkheads, HRP/MRP, contrôleurs de limpets, portée FSD,
résistances de bouclier, Fighter Hangar) proviennent du jeu de données **EDCD/coriolis-data** (fichiers JSON par
module) et, pour le mécanisme de rendement décroissant des boucliers, du code source du calculateur **EDCD/coriolis**
— les deux étant maintenus par la même communauté technique que FDevIDs et utilisés en amont par la plupart des
calculateurs de build (Coriolis, EDSY). Les mécanismes précis de déblocage (stations hébergeant les Brokers Guardian
et Human, coûts exacts en matériaux par palier) sont sujets à évolution au fil des mises à jour du jeu ; il est
recommandé de les recouper sur **Inara.cz** (section Engineering/Broker) avant toute planification nécessitant une
précision au matériau près. Les statistiques précises des 4 chasseurs du Fighter Hangar (section 13) n'ont pas pu
être vérifiées sur une source primaire dans le cadre de cette révision — seuls les fabricants de deux des quatre ont
pu être confirmés (Wikipédia).

## Sources

- https://raw.githubusercontent.com/EDCD/FDevIDs/master/outfitting.csv
- https://github.com/EDCD/FDevIDs
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/engineers.csv
- https://github.com/EDCD/coriolis-data (modules internes/standards/hardpoints en JSON : bulkheads, HRP, MRP,
  contrôleurs de limpets, FSD, shield generator, shield booster, fighter hangar)
- https://github.com/EDCD/coriolis (calculateur de référence open source, notamment `src/app/shipyard/Calculations.js`
  pour la formule de rendement décroissant des résistances de bouclier/coque)
- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://inara.cz/
