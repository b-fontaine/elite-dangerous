# Guide complet du combat à pied dans Elite Dangerous

Le combat à pied (« on-foot combat ») a été introduit avec l'extension **Odyssey** en mai 2021 et reste, en 2025-2026,
le principal moyen d'agir directement sur les conflits de surface : raids de settlements, zones de conflit au sol
(Ground CZ — voir [glossaire](./00-glossaire.md)), missions de mercenariat et, potentiellement, un mode coopératif
« Operations » dont l'existence même reste à confirmer par une source primaire fiable (voir la section Historique
ci-dessous). Ce guide couvre l'équipement (armes, combinaisons, grenades, gadgets), la manière de l'obtenir et de
l'améliorer, les meilleures combinaisons selon le style de jeu, les tactiques contre PNJ et joueurs — y compris la
détection/infiltration et le combat à mains nues —, ainsi que les stratégies pour les settlements et les zones de
conflit au sol.

## Voir aussi

Ce guide se concentre sur les **tactiques et choix de style de jeu** en combat à pied. Pour éviter les redites (et les
contradictions qu'elles ont pu créer par le passé entre guides), le détail exhaustif de certains sujets vit ailleurs
dans le corpus :

- **[07 — Équipement à pied](./07-equipement-a-pied.md)** : catalogue complet des armes par fabricant, tables
  d'ingénierie (Engineers, blueprints, coûts), builds nommés, outils et consommables. Ce guide-ci ne reprend que des
  tableaux condensés qui renvoient vers 07 pour le détail.
- **[13 — Opérations (gameplay à pied)](./13-operations.md)** : typologie des settlements, mécanique fine de
  détection/suspicion/confinement, catégories de missions au sol. Ce guide-ci résume la mécanique et renvoie vers 13
  pour l'exhaustif.
- **[14 — Rhino et Nomad](./14-rhino-nomad.md)** : chronologie sourcée du SRV Rhino, du vaisseau Nomad et de la
  fonctionnalité multijoueur « Operations » (2026).
- **[02 — Powerplay](./02-powerplay.md)** : détail de Powerplay 2.0 / l'extension Ascendancy (31 octobre 2024), dont
  les cycles hebdomadaires influencent l'apparition des Ground CZ liées aux Powers.
- **[00 — Chronologie canonique](./00-chronologie-canonique.md)** : arbitrage daté de toutes les confusions
  chronologiques listées ci-dessous (Powerplay 2.0 vs Trailblazers, Colonisation, Rhino, Caspian Explorer, Kestrel
  Mk II, mode « Operations »).
- **[06 — Ingénieurs](./06-ingenieurs.md)** : système général d'ingénierie (vaisseaux et à pied), grades de matériaux.

## Note sur la fiabilité des données chiffrées

Les noms de familles d'équipement, les mécaniques de jeu et l'historique des mises à jour présentés ici ont été
recoupés avec les guides 07, 13, 14 et la chronologie canonique (00). En revanche, les **valeurs numériques précises**
(dégâts exacts, points de vie, prix en crédits, quantités de matériaux d'ingénierie) évoluent au fil des correctifs et
doivent être confirmées directement dans l'écran d'outfitting en jeu ou sur le wiki communautaire
(elite-dangerous.fandom.com) avant toute prise de décision engageant beaucoup de crédits ou de temps de collecte. Les
coûts en crédits cités dans ce guide sont un **instantané capturé le 9 septembre 2026** (repris de 07) — à revérifier
auprès de l'Engineer concerné, ces montants pouvant être rééquilibrés par Frontier. Ce guide privilégie donc les
catégories, rôles et rapports de force relatifs (« élevé / moyen / faible ») plutôt que des chiffres qui seraient
rapidement obsolètes ou invérifiables.

## Historique des évolutions récentes du combat à pied (2021-2026)

Cette table a été **entièrement recoupée** avec 07-equipement-a-pied.md, 14-rhino-nomad.md et l'audit chronologique
consolidé dans 00-chronologie-canonique.md. Plusieurs dates de la version précédente de ce guide étaient erronées
(confusions d'un an ou entre deux mises à jour distinctes) ; elles sont corrigées ici, avec le niveau de confiance de
la correction.

| Date                                       | Mise à jour                                    | Changement pour le combat à pied                                                                                                                                                                                              | Confiance / source                                                                                                       |
|---------------------------------------------|-------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| 19 mai 2021                                 | Odyssey                                         | Introduction du gameplay à pied dans son ensemble (combinaisons, armes, settlements, CZ au sol).                                                                                                                             | Haute — date de référence, voir 07 et 13.                                                                                  |
| **31 octobre 2024** (et non « 2023-2024 »)  | Powerplay 2.0 (extension « Ascendancy »)        | Cycles hebdomadaires d'acquisition/renforcement/sape ; les Ground CZ et missions de combat au sol deviennent un levier d'action direct dans les systèmes disputés par les Powers.                                            | Haute — voir 02-powerplay.md et 00-chronologie-canonique.md §1. Ne pas confondre avec Trailblazers (26 février 2025).      |
| **26 février 2025** (bêta), et non « 2 mars 2025 » | Colonisation de systèmes (« Trailblazers »)      | Les commandants peuvent construire systèmes et établissements ; les conflits liés aux colonies génèrent de nouvelles zones de conflit au sol, en complément des Ground CZ traditionnelles et de celles liées à Powerplay 2.0. | Haute — le 28 février 2025 est la date d'un article explicatif, pas du lancement. Sortie complète : **11 novembre 2025** (« Dodec Update »). Voir 00-chronologie-canonique.md §2. |
| **2 décembre 2025** (et non « janvier 2025 »)      | Caspian Explorer (révélé le 25 novembre 2025)   | Vaisseau d'exploration (Zorgon Peterson) associé, selon 14-rhino-nomad.md, à une « IA ennemie à pied améliorée » (comportement des PNJ au sol : couverture, esquive, repli). Le chiffre précis d'un plafond d'ingénierie à 75 % de résistance, avancé par une version antérieure de ce guide, n'a pas pu être retrouvé dans une source primaire et doit être traité comme **non confirmé** jusqu'à vérification en jeu. | Haute pour la date ; non confirmé pour le détail du plafond de résistance. Voir 00-chronologie-canonique.md §5.            |
| **24 février 2026** (et non « février 2025 »)      | Kestrel Mk II                                   | Sortie accompagnée, selon 14-rhino-nomad.md, d'« une refonte du système audio ». Une version antérieure de ce guide présentait cette refonte comme spécifiquement dédiée au combat à pied (repérage sonore des tirs et explosions) ; ce point n'est pas explicitement confirmé par la source disponible et est donc à considérer comme plausible mais non garanti. | Moyenne — date corroborée indirectement (commit EDCD/FDevIDs du 25/02/2026). Voir 00-chronologie-canonique.md §6.          |
| Non confirmée                               | Mode coopératif « Operations »                  | L'existence même de ce mode n'a pas pu être confirmée par une source primaire fiable. Voir la sous-section dédiée plus bas.                                                                    | **Non confirmé** — aucune source primaire officielle (elitedangerous.com, forums Frontier, GalNet) n'a pu être vérifiée. Voir 00-chronologie-canonique.md §3.                                     |
| 2 septembre 2026 (et non « août 2025 »)     | Rhino (SRV de minage, fabricant Vodel)          | Véhicule de surface à 3 places dédié au minage planétaire ; peut servir de couverture mobile improvisée en surface, mais son rôle premier est l'extraction (scanner de gisements, raffinerie embarquée), pas le combat. | Haute — confirmé par Steam News Frontier et GalNet in-univers. Voir 14-rhino-nomad.md et 00-chronologie-canonique.md §4.   |

**Constat pour la méta 2025-2026** : la seule refonte structurelle avérée touchant directement le combat à pied
« classique » depuis fin 2024 est indirecte — l'ouverture de nouvelles Ground CZ via Powerplay 2.0 (31 octobre 2024)
et la Colonisation (bêta le 26 février 2025, sortie complète le 11 novembre 2025). Les PNJ au sol seraient devenus
plus prudents (couverture, esquive, repli) autour de la période Caspian Explorer (2 décembre 2025), mais ce lien
causal précis reste à confirmer en jeu. Le mode **Operations**, souvent cité comme la grande nouveauté de combat
coopératif au sol de la période récente, n'a pas de date de sortie confirmée par une source primaire fiable — voir
ci-dessous et [13-operations.md](./13-operations.md) / [14-rhino-nomad.md](./14-rhino-nomad.md) pour l'état des
lieux détaillé de cette incertitude.

## L'équipement du commandant au sol

### Emplacements d'équipement

Un commandant à pied dispose d'un nombre limité d'emplacements, qu'il faut choisir avant chaque sortie (le changement
d'équipement se fait à une station, un settlement habité ou dans certains abris) :

- **1 arme longue** (primaire), portée dans le dos ou à la main ;
- **1 arme de poing** (secondaire), pour les situations rapprochées ou en complément de l'arme longue ;
- **1 outil utilitaire non létal** (piratage de terminaux/portes, découpe/breach, profileur de cibles, scanner, etc.) ;
- **jusqu'à 3 grenades d'un même type**, choisies avant la sortie ;
- un **sac à dos** avec des emplacements limités en poids/volume pour les objets ramassés (Items, Components, Data,
  Goods — ce sont les catégories de **tri de l'inventaire du sac à dos**, à ne pas confondre avec les catégories de
  **matériaux d'ingénierie** détaillées plus bas).

### Les combinaisons (suits)

Il existe trois familles de combinaisons de combat, en plus de la combinaison de vol par défaut (sans bonus de combat,
portée hors mission dédiée) :

| Famille de suit              | Rôle                                       | Bouclier / santé | Mobilité      | Style de jeu recommandé                                                |
|------------------------------|--------------------------------------------|------------------|---------------|--------------------------------------------------------------------------|
| Suit d'assaut lourd (tank)   | Encaissement, capacité de munitions        | Élevé            | Faible        | Assaut frontal, Ground CZ, dégagement complet de settlement            |
| Suit polyvalente             | Équilibre généraliste                      | Moyen            | Moyen à élevé | Infiltration rapide, combat à moyenne portée, usage « touche-à-tout »  |
| Suit de précision/discrétion | Stabilité de visée, déplacement silencieux | Faible           | Moyen         | Sniping, reconnaissance, missions furtives sans déclenchement d'alarme |

Ces trois rôles correspondent respectivement aux combinaisons nommées **Dominator**, **Maverick** et **Artemis**
(plus la **Flight Suit** de base) — voir [07-equipement-a-pied.md](./07-equipement-a-pied.md) pour le détail complet
de chaque combinaison, ses builds recommandés et ses statistiques.

Chaque suit existe en **5 grades** (du grade 1 de base au grade 5 le plus performant). Les grades supérieurs
s'obtiennent par achat progressif ou déblocage de rang, et chaque grade peut ensuite être **engineered** (amélioré par
un ingénieur au sol) indépendamment de son grade de base.

### Les armes

#### Armes longues (primaires)

Les armes longues couvrent plusieurs archétypes, portés par différents fabricants en jeu :

- **Fusil d'assaut kinétique automatique** : cadence de tir élevée, dégâts modérés par tir, efficace en combat rapproché
  à moyen ; c'est l'archétype de référence pour l'assaut frontal et les CZ au sol.
- **Fusil de précision (sniper)** : tir unique ou semi-automatique, forte puissance par tir, idéal pour l'élimination à
  distance de cibles isolées, gardes et tourelles avant qu'elles ne réagissent.
- **Fusil à pompe (shotgun)** : dégâts massifs à très courte portée, adapté au nettoyage rapide de pièces en intérieur
  de settlement.
- **Arme à énergie/plasma** : dégâts soutenus, souvent efficace contre les boucliers, à cadence intermédiaire.
- **Lance-roquettes / arme explosive de zone** : dégâts de zone élevés, utile contre les groupes ou pour percer un point
  de couverture, munitions limitées.
- **Arme à faisceau laser longue portée** : tir continu, efficace à distance moyenne à longue, sensible à la surchauffe.

#### Armes de poing (secondaires)

Déclinaisons compactes des mêmes familles de fabricants (kinétique, laser, plasma), utilisées en complément de l'arme
longue à courte portée, en dégainage rapide, ou comme arme principale silencieuse lors des missions d'infiltration.

#### Armes nommées par fabricant

Trois fabricants se partagent le catalogue des armes à pied, chacun avec ses propres recettes d'ingénierie. Le tableau
ci-dessous est un **résumé condensé** ; pour la liste exhaustive des modèles et l'ensemble des builds nommés par la
communauté, voir [07-equipement-a-pied.md](./07-equipement-a-pied.md#les-armes-à-pied), qui reste la source de
référence pour ce sujet.

| Fabricant               | Catégories couvertes                                        | Exemples de builds nommés (détail dans 07)                                                  | Style de jeu associé                          |
|--------------------------|--------------------------------------------------------------|-----------------------------------------------------------------------------------------------|------------------------------------------------|
| **Manticore**            | Fusils plasma polyvalents et sniper                          | Manticore Terminator (généraliste), Manticore Executioner / Executioner Warfighter (sniper/CZ) | Assaut, sniping, zones de conflit à haut dégât |
| **Kinematic Armaments**  | Pistolets et fusils cinétiques (dont la famille Karma)       | Karma P15 Infiltrator (infiltration silencieuse), Karma P15 Warfighter (achever une cible)     | Infiltration, exécution rapprochée             |
| **Takada**               | Armes à énergie/laser (SMG, fusils)                          | Catalogue tenu à jour dans 07 — non repris intégralement ici                                   | Combat à cadence soutenue, moyenne portée      |

Il n'existe pas d'arme de mêlée dédiée : voir la sous-section **Combat à mains nues** ci-dessous.

#### Outils utilitaires non létaux

Un seul emplacement, mais déterminant selon la mission : outil de piratage de portes/terminaux, outil de découpe
(breach) pour ouvrir des accès non prévus, profileur de cibles (identification à distance), scanner de signaux, ou outil
de récupération d'énergie à distance pour un vaisseau posé à proximité. Le détail de chaque outil (Compact Multi-Tool,
Profile Analyser, Wave Scanner, Arc Cutter, E-Break) est couvert dans
[07-equipement-a-pied.md](./07-equipement-a-pied.md#les-outils-à-pied).

### Les grenades et gadgets

Les grenades se déclinent en plusieurs catégories, sélectionnées par lot de 3 avant la sortie (un seul type à la fois) :

| Catégorie                            | Effet                                                               | Usage tactique                                                                              |
|---------------------------------------|-----------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Explosive/fragmentation              | Dégâts de zone                                                      | Nettoyer un groupe ennemi ou une pièce avant d'entrer                                       |
| Perturbatrice (EMP/shield disruptor) | Désactive boucliers et électronique                                 | Faire tomber le bouclier d'une cible avant l'assaut, désactiver une tourelle ou un terminal |
| Incendiaire/thermique                | Dégâts continus de zone                                             | Interdire une zone ou déloger un ennemi retranché                                           |
| Utilitaire non létale                | Effet de soutien (piratage, récupération d'énergie, soin, marquage) | Ouvrir un accès à distance, se soigner en urgence, marquer des cibles pour l'escouade       |

### Combat à mains nues (Added Melee Damage)

Il n'existe **aucune arme de corps-à-corps dédiée** dans le combat à pied : le corps-à-corps se fait via une
**attaque à mains nues**, disponible en permanence quel que soit le loadout équipé (aucun emplacement dédié n'est
nécessaire). C'est le seul recours « toujours disponible », utile en dernier ressort (munitions épuisées, arme en
recharge) ou pour une neutralisation strictement silencieuse en infiltration.

Cette mécanique reste améliorable par ingénierie : la modification de combinaison **Added Melee Damage** — proposée
par les Engineers **Jude Navarro** et **Kit Fowler**, pour un coût observé d'environ **500 000 Cr** (instantané
capturé le 9 septembre 2026, source 07) — « augmente fortement les dégâts des coups de poing et des attaques de
corps-à-corps à l'arme ». Cette formulation confirme que le mêlée à pied couvre à la fois le coup de poing pur et le
coup porté avec l'arme tenue en main (crosse), et non une arme séparée. Pour la planification du build (matériaux
requis, chaîne de déblocage des deux Engineers), voir
[07-equipement-a-pied.md](./07-equipement-a-pied.md#modifications-de-combinaison-blueprints).

Usages tactiques recommandés :

- **Infiltration** : neutraliser silencieusement une cible isolée sans déclencher l'alerte sonore d'un tir (voir la
  section Détection et infiltration ci-dessous) ;
- **Dernier recours en CZ** : achever un adversaire au bouclier tombé lorsque le rechargement de l'arme principale
  prendrait trop de temps ;
- **PvP à pied** : un profil offensif rare mais dévastateur une fois Added Melee Damage posé, notamment en combinaison
  avec une approche furtive qui place le joueur au corps-à-corps sans avoir été détecté.

### Grades et progression (1 à 5)

Chaque arme et chaque suit progresse sur 5 grades. Les grades les plus élevés offrent de meilleures statistiques de base
et davantage d'emplacements de modification pour l'ingénierie. La progression de grade se fait via l'achat (une fois
débloqué) ou via la montée en rang du commandant dans les activités de mercenariat/combat.

### Achat et déblocage de l'équipement

- **Achat initial en crédits** : les comptoirs « Pioneer Supplies » (outfitting à pied) dans les stations et settlements
  habités vendent l'équipement de base et ses premiers grades.
- **Déblocage de grades/armes/suits supplémentaires** : nécessite généralement une progression de rang (rang de
  combat/mercenaire) et/ou l'accès à des ingénieurs spécifiques présents dans certains settlements, chacun spécialisé
  dans un type d'arme ou de suit.
- **Effets expérimentaux et modifications** : nécessitent la collecte de matériaux au sol puis leur dépôt chez
  l'ingénieur correspondant.

### Ingénierie (engineering) du matériel de combat

L'ingénierie du matériel de combat à pied fonctionne sur le même principe que l'ingénierie des vaisseaux (voir
[06-ingenieurs.md](./06-ingenieurs.md)) : on apporte des matériaux à un Engineer physique spécialisé pour débloquer
des modifications, puis un effet expérimental au choix. **Une modification appliquée ne peut ni être retirée ni
remplacée** — la planification du build est cruciale avant d'engager des matériaux.

Les matériaux d'ingénierie à pied se répartissent en **quatre catégories** (à ne pas confondre avec les catégories de
tri du sac à dos — Items/Components/Data/Goods — mentionnées plus haut, qui décrivent l'inventaire général et non les
matériaux d'ingénierie proprement dits) :

| Catégorie      | Échangeable entre catégories ? | Grade      | Source d'obtention                                                | Usage typique                       |
|-----------------|----------------------------------|------------|----------------------------------------------------------------------|----------------------------------------|
| **Chemicals**   | Oui (via les barmen des stations) | 1 à 5*     | Missions à pied, fouille de conteneurs en settlement, démontage      | Modifications de base et avancées   |
| **Circuits**    | Oui (via les barmen des stations) | 1 à 5*     | Missions à pied, démontage d'objets techniques, piratage de terminaux | Modifications de base et avancées   |
| **Technology**  | Oui (via les barmen des stations) | 1 à 5*     | Missions à pied, matériel technique de haute valeur                  | Effets expérimentaux, mods avancées |
| **Data**        | Non (aucun échange possible)      | 1 à 5*     | Piratage de terminaux/ordinateurs, récompenses de mission uniquement  | Effets expérimentaux                |

\* Le grade exact varie par matériau nommé et n'est pas détaillé exhaustivement ici — voir
[07-equipement-a-pied.md](./07-equipement-a-pied.md#lingénierie-à-pied-engineering) pour la méthode de collecte
recommandée (missions aux terminaux à pied des stations) et [06-ingenieurs.md](./06-ingenieurs.md) pour le
référentiel général des grades de matériaux.

Les modifications ajoutent des bonus (capacité de chargeur, dégâts, stabilité de visée, réduction du recul, portée) ;
l'effet expérimental apporte une spécialisation supplémentaire (dégâts additionnels contre boucliers, régénération,
discrétion accrue, résistance à un type de dégâts).

#### Tableau condensé : Engineers de combat à pied

Neuf Engineers sont présents dans la bulle « Core », organisés en trois chaînes de déblocage, plus quatre Engineers
dans la région de Colonia. Le tableau ci-dessous liste uniquement les **spécialités directement utiles au combat**
(bouclier, dégâts, discrétion, munitions) ; pour la table complète (position exacte dans la chaîne, coûts détaillés de
chaque blueprint, liste intégrale des modifications d'armes et de combinaison), voir
[07-equipement-a-pied.md](./07-equipement-a-pied.md#les-engineers-à-pied).

| Engineer            | Système   | Spécialités combat (suit)                              | Spécialités combat (arme)                       | Coût typique observé*      |
|----------------------|-----------|-----------------------------------------------------------|----------------------------------------------------|--------------------------------|
| **Uma Laszlo**       | Xuane     | Damage Resistance, Faster Shield Regen                    | Headshot Damage, Reload Speed, Stowed Reloading     | 750 000 Cr                     |
| **Jude Navarro**     | Aurai     | Added Melee Damage, Extra Ammo Capacity                   | Reload Speed, Magazine Size                          | 500 000 – 750 000 Cr           |
| **Kit Fowler**       | Capoya    | Faster Shield Regen, Added Melee Damage, Extra Ammo Capacity | Stowed Reloading, Magazine Size                    | 500 000 – 750 000 Cr           |
| **Terra Velasquez**  | Shou Xing | Combat Movement Speed, Increased Sprint Duration           | Improved Hip Fire Accuracy, Noise Suppressor        | 750 000 – 1 000 000 Cr          |
| **Yarden Bond**      | Bayan     | Combat Movement Speed, Quieter Footsteps                   | Improved Hip Fire Accuracy, Audio Masking           | 750 000 – 1 000 000 Cr          |
| **Oden Geiger**      | Candiaei  | Night Vision, Enhanced Tracking                            | Scope, Stability                                    | 750 000 – 1 000 000 Cr          |
| **Domino Green**     | Orishis   | Extra Backpack Capacity, Enhanced Tracking                 | Greater Range, Stability                            | 750 000 Cr                     |
| **Hero Ferrari**     | Sirius    | Increased Air Reserves, Increased Sprint Duration          | Noise Suppressor, Faster Handling                   | 750 000 Cr                     |
| **Wellington Beck**  | Jolapa    | Extra Backpack Capacity, Improved Battery Capacity         | Greater Range, Scope                                | 750 000 Cr                     |

\* Instantané capturé le 9 septembre 2026 (repris de 07-equipement-a-pied.md) — à revérifier en jeu, ces coûts
pouvant être rééquilibrés. Les quatre Engineers de Colonia (Baltanos, Eleanor Bresa, Rosa Dayette, Yi Shen) ne
proposent pas de modifications de combat spécifiques recensées à ce jour ; voir 07 pour leur mécanique de
déblocage convergente.

## Meilleures combinaisons arme/suit selon le style de jeu

### Assaut frontal (Ground CZ, dégagement complet de settlement)

- **Suit** : famille assaut lourd (tank), pour encaisser les tirs et tenir la ligne de front.
- **Arme longue** : fusil d'assaut kinétique automatique à cadence de tir élevée, pour le combat rapproché à moyen.
- **Grenades** : explosives/fragmentation pour nettoyer les groupes, ou perturbatrices pour faire tomber les boucliers
  avant de pousser.
- **Priorité d'ingénierie** : capacité de munitions et résistance/bouclier plutôt que discrétion.
- **Contexte d'usage** : Ground CZ, raids de settlement « bruyants », opérations d'escouade en première ligne.

### Infiltration et discrétion (récupération de données, sabotage, missions « sans alerte »)

- **Suit** : famille polyvalente ou précision/discrétion, pour limiter le bruit et la signature thermique.
- **Arme** : arme de poing silencieuse ou outil non létal en priorité, arme longue en secours seulement.
- **Priorité d'ingénierie** : réduction du bruit de déplacement, réduction de la signature thermique, performance de
  l'outil de piratage.
- **Contexte d'usage** : vol de données, sabotage, missions à timer serré où le déclenchement d'alarme est pénalisant.
  Voir la sous-section **Détection et infiltration** ci-dessous pour la mécanique complète de suspicion.

### Sniping et harcèlement à distance

- **Suit** : famille précision/discrétion, pour le zoom et la stabilité de visée.
- **Arme longue** : fusil de précision à forte puissance et longue portée.
- **Rôle** : éliminer les cibles isolées (gardes, tourelles, opérateurs) avant qu'elles ne réagissent ou n'alertent le
  groupe ; reconnaissance avant un assaut d'escouade.
- **Priorité d'ingénierie** : portée, stabilité de visée, réduction du temps de réaction (recul, temps de rechargement
  du zoom).

### Composition d'escouade hybride (multijoueur)

Un profil courant en groupe consiste à faire porter à un membre une **suit tank** pour absorber l'attention et les
dégâts, pendant qu'un autre membre en **suit précision** élimine à distance les cibles prioritaires (tourelles,
opérateurs, renforts), le tout complété par un membre en **suit polyvalente** chargé du piratage/soutien logistique
(portes, terminaux, ravitaillement).

## Tactiques de combat

### Face aux PNJ

Le comportement des PNJ au sol serait devenu plus prudent (usage de couvertures, esquive accrue) depuis la période de
la mise à jour Caspian Explorer (2 décembre 2025) — voir la réserve exprimée dans le tableau d'historique ci-dessus.
Recommandations générales, indépendantes de cette évolution précise :

- Éliminer les cibles isolées avant qu'elles n'alertent le reste du groupe.
- Viser les points faibles une fois le bouclier tombé (les dégâts kinétiques sont généralement plus efficaces une fois
  le bouclier neutralisé).
- Utiliser une grenade EMP/perturbatrice pour désactiver le bouclier avant un assaut à l'arme automatique ou au
  corps-à-corps.
- Exploiter le repérage sonore pour anticiper les angles de tir ennemis avant d'être vu (voir la réserve sur la
  refonte audio associée à Kestrel Mk II dans le tableau d'historique).

### Face aux tourelles et défenses automatisées de settlement

Les tourelles représentent souvent la principale source de dégâts imprévus lors d'un raid de settlement. Privilégier :

- le piratage/la désactivation à distance avant d'entrer dans leur champ de tir ;
- ou une élimination à l'arme longue de précision depuis l'extérieur de leur portée effective.

### Détection et infiltration

Cette sous-section résume la mécanique de suspicion et de confinement décrite en détail dans
[13-operations.md](./13-operations.md#infiltration-détection-et-système-dalarme) ; s'y référer pour la table complète
des niveaux de sécurité par type de settlement.

**Ce qui déclenche la détection** :

- le **champ de vision** des gardes et des caméras/tourelles automatiques ;
- le **bruit produit par le joueur** — courir est nettement plus détectable que marcher accroupi, et dégainer une
  arme dans une zone civile ou surveillée déclenche la suspicion même sans tir ;
- le fait d'être repéré en zone interdite, de forcer une porte verrouillée, ou de pirater un terminal sous
  observation.

**Escalade de la suspicion** : la détection n'est pas binaire mais progressive. Un niveau de suspicion monte à
mesure que le joueur s'expose, et peut redescendre si le joueur se met hors de vue suffisamment longtemps — ou, à
l'inverse, déclencher une **alerte complète** s'il continue de s'exposer.

**Confinement et statut recherché** : une alerte complète entraîne le verrouillage des portes en mode confinement,
l'appel de renforts armés, l'activation des tourelles, et l'attribution d'un statut recherché localement au joueur.
Ce statut complique fortement l'extraction : ressortir du site implique alors soit un affrontement direct, soit un
risque de scan au moment du décollage si le vaisseau reste dans la zone de sécurité du settlement.

**Contre-mesures disponibles** :

- les modifications d'ingénierie **Quieter Footsteps** (Yarden Bond, −50 % de portée audible des pas) et **Audio
  Masking** (Yarden Bond, bruit réduit en environnement non pressurisé) — voir le tableau condensé d'ingénierie
  ci-dessus et [07-equipement-a-pied.md](./07-equipement-a-pied.md) pour le détail ;
- une posture accroupie/rampante plutôt que debout, qui réduit la vitesse de détection ;
- une bonne connaissance du cycle des rondes et des angles morts des caméras, qui reste l'outil le plus fiable pour
  éviter toute alerte, quel que soit le niveau d'ingénierie de la combinaison ;
- le **Profile Analyser**, pour repérer gardes et points d'intérêt à distance avant de s'engager.

Le niveau de sécurité du settlement (civile / faible / moyenne / élevée) dimensionne directement la difficulté de
cette phase — voir la table complète dans 13-operations.md.

### Face à d'autres joueurs (PvP à pied)

Le PvP à pied reste plus rare qu'en vaisseau mais survient en zone de guerre ouverte, en Ground CZ ou lors de raids de
settlement disputés. Principes clés :

- la discrétion et le premier coup (dégâts d'ouverture avant que l'adversaire ne réagisse) sont déterminants ;
- un adversaire en suit tank encaisse mieux un duel frontal prolongé ;
- un joueur en suit précision doit engager à distance et éviter le corps-à-corps ;
- gérer la régénération du bouclier (se replier hors de vue pour laisser le bouclier se régénérer avant de rengager) est
  une tactique clé, en CZ comme en duel.

### Gestion des ressources vitales

- **Bouclier** : se régénère automatiquement après un délai sans être touché.
- **Santé** : ne se régénère pas seule ; nécessite des consommables de soin (kit de soin/auto-injecteur).
- **Oxygène** : ressource limitée hors zone pressurisée (vaisseau, settlement habité) ; à surveiller impérativement lors
  d'un raid prolongé en extérieur ou en cas de dépressurisation d'un bâtiment.

## Missions au sol, settlements et zones de conflit

### Zones de conflit au sol (Ground CZ)

Les Ground CZ apparaissent dans les systèmes en état de guerre/conflit entre factions, ou, depuis Powerplay 2.0
(31 octobre 2024) et la Colonisation (bêta le 26 février 2025), entre Powers ou dans des systèmes disputés. Elles
opposent deux camps de PNJ (et éventuellement des joueurs alliés à l'un des camps) autour d'un objectif au sol, avec
des vagues de renforts et des points de capture — un fonctionnement proche des CZ spatiales, mais à pied, avec un
support SRV possible. Pour la typologie complète des niveaux d'intensité (Low/Medium/High) et des settlements, voir
[13-operations.md](./13-operations.md#zones-de-conflit-au-sol-on-foot-combat-zones).

**Approche recommandée** :

- arriver en **suit tank** pour tenir la ligne de front ;
- exploiter les couvertures naturelles du terrain ;
- prioriser l'élimination des unités à distance et des tourelles avant de pousser ;
- surveiller la jauge de force du camp adverse et se retirer ou changer de camp si celui choisi est en train de perdre,
  comme en CZ spatiale.

### Raids et infiltrations de settlements

Les missions de raid de settlement (récupération de données, sabotage, assassinat, vol) se déclinent en deux approches :

- **version furtive** : sans déclenchement d'alarme, timer serré, suit discrétion/polyvalente recommandée — voir la
  sous-section **Détection et infiltration** plus haut ;
- **version combat** : dégagement complet du settlement, suit tank recommandée.

Dans les deux cas, une **reconnaissance préalable** est recommandée : scanner les signaux, repérer les gardes et
tourelles depuis l'extérieur, puis désactiver en priorité les systèmes d'alarme et les tourelles pour éviter d'être
submergé par les renforts.

### Le mode « Operations » : état des lieux et incertitude

Aucune source fiable ne confirme l'existence d'un mode multijoueur coopératif appelé « Operations » dans Elite
Dangerous. Ce point est à traiter comme une entrée sans fondement vérifiable dans le corpus (probable confusion,
rumeur ou contenu non officiel), et non comme un fait établi — voir le texte de référence dans
00-chronologie-canonique.md §3, et [14-rhino-nomad.md](./14-rhino-nomad.md) pour le détail de l'enquête menée sur ce
sujet.

**Recommandation pratique** : pour toute décision de jeu (achat, planification de session), vérifier directement en
jeu ou sur les canaux officiels Frontier l'existence et l'état actuel d'un tel mode plutôt que de se fier à une
mention de ce guide ou d'un autre document du corpus.

### Colonisation, Powerplay 2.0 et nouvelles zones de conflit

Le système de **Colonisation** (« Trailblazers ») est passé en **bêta le 26 février 2025**, puis en **lancement
complet le 11 novembre 2025** via la mise à jour officiellement nommée « Dodec Update » — et non le 2 mars 2025
comme l'indiquait une version antérieure de ce guide (voir 00-chronologie-canonique.md §2 pour le détail de cette
confusion de date, née d'un article explicatif publié deux jours après la bêta). Cette fonctionnalité permet aux
commandants de construire des systèmes et des établissements. Les conflits et l'état de sécurité des systèmes
colonisés génèrent de nouvelles zones de conflit au sol, en complément des Ground CZ liées aux conflits de factions
traditionnels et à **Powerplay 2.0** (31 octobre 2024, cycles hebdomadaires d'acquisition/renforcement/sape des
systèmes disputés par les Powers — voir [02-powerplay.md](./02-powerplay.md)). Pour le détail de la mécanique de
colonisation elle-même, voir le guide dédié [18-colonisation.md](./18-colonisation.md).

## Check-list avant une sortie de combat à pied

- Choisir la suit adaptée à la mission (tank / polyvalente / précision) plutôt qu'un seul suit « par défaut » pour tout
  faire.
- Vérifier le grade et l'état d'ingénierie de l'arme et du suit choisis.
- Emporter un seul type de grenade adapté à l'objectif (explosive pour nettoyer, perturbatrice pour désactiver
  boucliers/électronique).
- Prévoir des consommables de soin, la santé ne se régénérant pas seule.
- Prévoir l'autonomie en oxygène si la mission implique une exposition prolongée hors zone pressurisée.
- Faire une reconnaissance (scanner de signaux) avant d'entrer dans un settlement ou une CZ, pour repérer gardes et
  tourelles.
- Pour une mission « sans alarme », revoir la sous-section **Détection et infiltration** et prévoir Quieter
  Footsteps/Audio Masking si le build le permet.

## Voir aussi

- **[07 — Équipement à pied](./07-equipement-a-pied.md)** — catalogue complet des armes, combinaisons, outils,
  consommables, et tables d'ingénierie exhaustives (Engineers, blueprints, coûts).
- **[13 — Opérations (gameplay à pied)](./13-operations.md)** — typologie des settlements, mécanique complète de
  détection/infiltration, catégories de missions au sol, zones de conflit à pied.
- **[14 — Rhino et Nomad](./14-rhino-nomad.md)** — chronologie sourcée du Rhino, du Nomad et de la fonctionnalité
  « Operations » (2026).
- **[02 — Powerplay](./02-powerplay.md)** — Powerplay 2.0 / extension Ascendancy, cycles hebdomadaires affectant les
  Ground CZ.
- **[00 — Chronologie canonique](./00-chronologie-canonique.md)** — arbitrage daté de toutes les corrections
  chronologiques appliquées dans ce guide.
- **[06 — Ingénieurs](./06-ingenieurs.md)** — système général d'ingénierie et référentiel des grades de matériaux.
- **[08 — Combat spatial](./08-combat-spatial.md)** — pendant vaisseau des CZ et tactiques de combat au sol.
- **[18 — Colonisation](./18-colonisation.md)** — mécanique de construction de systèmes/établissements, source des
  nouvelles zones de conflit au sol évoquées plus haut.
- **[00 — Glossaire](./00-glossaire.md)** — définitions des sigles utilisés (CZ, etc.).

## Sources

Corpus interne recoupé pour cette révision : 00-chronologie-canonique.md, 02-powerplay.md, 06-ingenieurs.md,
07-equipement-a-pied.md, 13-operations.md, 14-rhino-nomad.md.

Sources externes (historique, contexte général, non ré-explorées intégralement pour cette révision) :

- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://canonn.science
- https://inara.cz/elite/
- https://inara.cz/elite/database/
- https://www.pcgamesn.com/elite-dangerous
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320
- https://www.spansh.co.uk/
- https://steamcommunity.com/app/359320/guides/
