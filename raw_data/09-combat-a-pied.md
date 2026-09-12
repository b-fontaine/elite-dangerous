---
id: 09-combat-a-pied
titre: "Guide complet du combat à pied dans Elite Dangerous"
domaine: combat
entites: [Dominator, Maverick, Artemis, Flight Suit, Manticore Executioner, Karma AR-50, Added Melee Damage, Quieter Footsteps, Audio Masking, Ground CZ, Merc Coin, MercGear]
mots_cles_en: [on-foot combat, dominator suit, maverick suit, artemis suit, ground conflict zone, added melee damage, quieter footsteps, audio masking, noise suppressor, merc coin, mercgear, operations]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-09
confiance_globale: haute
volatilite: moyenne
sources_primaires: [Steam News Frontier (API ISteamNews), Wikipedia Elite Dangerous, Canonn Research, Inara, PCGamesN, Spansh, Steam Community Guides]
zones_incertaines:
  - "Plafond d'ingénierie à 75 % de résistance attribué au Caspian Explorer : non retrouvé dans une source primaire, à vérifier en jeu."
  - "Lien causal entre la mise à jour Caspian Explorer et une IA de PNJ au sol plus prudente : à confirmer en jeu."
  - "Grade exact de chaque matériau d'ingénierie à pied nommé, non détaillé de façon exhaustive."
  - "Coûts d'ingénierie en crédits : instantané du 9 septembre 2026, susceptible d'être rééquilibré."
  - "Aucune modification de combat recensée à ce jour chez les quatre Engineers de Colonia."
  - "Correspondance entre les six scénarios annoncés le 22 avril 2026 et les six opérations du lancement : Frontier n'a publié aucune table de correspondance."
guides_lies: [0, 2, 6, 7, 8, 13, 14, 18, 26]
---

# Guide complet du combat à pied dans Elite Dangerous

## En bref

Le combat à pied (*on-foot combat*) d'*Elite Dangerous* est arrivé avec l'extension **Odyssey** le **19 mai 2021**. Un
commandant emporte une arme longue, une arme de poing, un outil utilitaire non létal, **trois grenades d'un même
type** et un sac à dos, dans l'une des quatre combinaisons (*suits*) : **Flight Suit**, **Dominator** (tank),
**Maverick** (polyvalente) et **Artemis** (précision et discrétion). Chacune existe en **5 grades**, puis s'améliore
chez neuf Engineers de la bulle Core pour **500 000 à 1 000 000 Cr** par modification, avec des matériaux Chemicals,
Circuits, Technology et Data. Les armes viennent de trois fabricants — **Manticore**, **Kinematic Armaments** et
**Takada** ; aucune arme de mêlée dédiée n'existe, le corps-à-corps passant par l'attaque à mains nues renforcée par
**Added Melee Damage**. Deux mises à jour de 2026 comptent : la refonte de l'audio de combat du **24 février 2026** et
le passage de la portée des armes silencieuses de **40 à 128 mètres** le **28 avril 2026**. Le terrain de jeu reste les
zones de conflit au sol (**Ground CZ**), les raids de settlement et, depuis le **1ᵉʳ juillet 2026**, le mode
**Operations**.

## Introduction — ce que couvre ce guide du combat à pied

Le combat à pied (« on-foot combat ») a été introduit avec l'extension **Odyssey** en mai 2021 et reste, en 2025-2026,
le principal moyen d'agir directement sur les conflits de surface : raids de settlements, zones de conflit au sol
(Ground CZ — voir [glossaire](./00-glossaire.md)), missions de mercenariat et, depuis le **1ᵉʳ juillet 2026**, le mode
coopératif **Operations** — des scénarios d'escouade jusqu'à quatre commandants, dont plusieurs se jouent en grande
partie à pied (abordage de mégavaisseau, évacuation de station en feu, secours de port planétaire). Le détail complet
du système vit dans [13-operations.md](./13-operations.md) ; ce guide-ci ne traite que ce qui relève du combat au sol.
Ce guide couvre l'équipement (armes, combinaisons, grenades, gadgets), la manière de l'obtenir et de
l'améliorer, les meilleures combinaisons selon le style de jeu, les tactiques contre PNJ et joueurs — y compris la
détection/infiltration et le combat à mains nues —, ainsi que les stratégies pour les settlements et les zones de
conflit au sol.

## Historique des évolutions récentes du combat à pied (2021-2026)

Les deux tables ci-dessous ont été **entièrement recoupées** avec 07-equipement-a-pied.md, 14-rhino-nomad.md et
l'audit chronologique consolidé dans 00-chronologie-canonique.md. Plusieurs dates de la version précédente de ce
guide étaient erronées
(confusions d'un an ou entre deux mises à jour distinctes) ; elles sont corrigées ici, avec le niveau de confiance
de la correction.

### Évolutions 2021-2025 du combat à pied : Odyssey, Powerplay 2.0, Colonisation, Caspian Explorer

| Date                                       | Mise à jour                                    | Changement pour le combat à pied                                                                                                                                                                                              | Confiance / source                                                                                                       |
|---------------------------------------------|-------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| 19 mai 2021                                 | Odyssey                                         | Introduction du gameplay à pied dans son ensemble (combinaisons, armes, settlements, CZ au sol).                                                                                                                             | Haute — date de référence, voir 07 et 13.                                                                                  |
| **31 octobre 2024** (et non « 2023-2024 »)  | Powerplay 2.0 (extension « Ascendancy »)        | Cycles hebdomadaires d'acquisition/renforcement/sape ; les Ground CZ et missions de combat au sol deviennent un levier d'action direct dans les systèmes disputés par les Powers.                                            | Haute — voir 02-powerplay.md et 00-chronologie-canonique.md §1. Ne pas confondre avec Trailblazers (26 février 2025).      |
| **26 février 2025** (bêta), et non « 2 mars 2025 » | Colonisation de systèmes (« Trailblazers »)      | Les commandants peuvent construire systèmes et établissements ; les conflits liés aux colonies génèrent de nouvelles zones de conflit au sol, en complément des Ground CZ traditionnelles et de celles liées à Powerplay 2.0. | Haute — le 28 février 2025 est la date d'un article explicatif, pas du lancement. Sortie complète : **11 novembre 2025** (« Dodec Update »). Voir 00-chronologie-canonique.md §2. |
| **2 décembre 2025** (et non « janvier 2025 »)      | Caspian Explorer (révélé le 25 novembre 2025)   | Vaisseau d'exploration (Zorgon Peterson) associé, selon 14-rhino-nomad.md, à une « IA ennemie à pied améliorée » (comportement des PNJ au sol : couverture, esquive, repli). Le chiffre précis d'un plafond d'ingénierie à 75 % de résistance, avancé par une version antérieure de ce guide, n'a pas pu être retrouvé dans une source primaire et doit être traité comme **non confirmé** jusqu'à vérification en jeu. | Haute pour la date ; non confirmé pour le détail du plafond de résistance. Voir 00-chronologie-canonique.md §5.            |

### Évolutions 2026 du combat à pied : Kestrel Mk II, Lynx Highliner, Operations, Rhino SRV

| Date                                       | Mise à jour                                    | Changement pour le combat à pied                                                                                                                                                                                              | Confiance / source                                                                                                       |
|---------------------------------------------|-------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| **24 février 2026** (et non « février 2025 »)      | Kestrel Mk II                                   | La mise à jour embarque une **refonte étendue de l'audio de combat à pied**, explicitement dédiée à la conscience situationnelle : portée de propagation des tirs augmentée, directivité de la ligne de feu ennemie améliorée et réverbération parasite réduite, explosions et grenades aux transitoires plus nettes et différenciées intérieur/extérieur, atténuation temporaire des tirs alentour quand le joueur est touché, hit markers / ruptures de bouclier / confirmations de kill plus lisibles dans le mix. Refonte par arme (Manticore Executioner et Intimidator, Karma AR-50 et P-15), par grenade (Shield Disruptor et fragmentation), et sur les sons de déplacement (pas, surfaces, respiration, glissades) et d'environnement (réverbération intérieure, ambiance de settlement, vaisseaux distants atténués pour laisser entendre tirs et pas). | **Haute** — billet officiel Frontier « Elite Dangerous \| Kestrel Mk. II Update », 24 février 2026 12:21 UTC, section « On-Foot Combat Audio Rebalance ». La réserve d'une version antérieure de ce guide est levée. |
| **28 avril 2026**                           | Lynx Highliner Update                           | Correctif d'équilibrage direct pour l'infiltration : la **portée des armes silencieuses passe de 40 à 128 mètres**, pour les aligner sur les autres armes — elle reste toutefois inférieure à celle des armes non silencieuses. Corrections associées sur les sons de tir silencieux du Karma AR-50 et sur les modes suppressed / audio-masked du Manticore Executioner, désormais comparables à ceux du Karma AR-50 et du P-15. | **Haute** — billet officiel Frontier « Elite Dangerous \| Lynx Highliner Update Notes », 28 avril 2026 13:11 UTC.          |
| **30 juin 2026** (jeu en 4.4.0.0), notes le **1ᵉʳ juillet 2026** | Mode coopératif **Operations**   | Nouveau mode d'escouade jusqu'à 4 commandants, avec six scénarios au lancement dont plusieurs se jouent essentiellement à pied. La même mise à jour corrige trois défauts de longue date des **zones de conflit au sol** (voir le détail sous le tableau). Nouvelle monnaie **Merc Coin** et catalogue **MercGear**. | **Haute** — billet officiel Frontier « Elite Dangerous \| Operations Update », 1ᵉʳ juillet 2026 14:01 UTC ; report annoncé le 22 avril 2026 14:02 UTC. Voir [13-operations.md](./13-operations.md). |
| 2 septembre 2026 (et non « août 2025 »)     | Rhino (SRV de minage, fabricant Vodel) + opération « Under Siege » | Véhicule de surface à 3 places dédié au minage planétaire ; peut servir de couverture mobile improvisée en surface, mais son rôle premier est l'extraction (scanner de gisements, raffinerie embarquée), pas le combat. La même mise à jour ajoute une **septième opération, « Under Siege »** : répondre à l'appel de détresse d'un settlement planétaire, lever un blocus et neutraliser les forces ennemies qui tentent de s'en emparer — un scénario de combat de surface. | Haute — billet officiel Frontier « Elite Dangerous \| Rhino SRV Update », 2 septembre 2026 11:20 UTC. Voir 14-rhino-nomad.md et 00-chronologie-canonique.md §4.   |

### Correctifs de zones de conflit au sol livrés avec la mise à jour Operations

Les mêmes notes du 1ᵉʳ juillet 2026 14:01 UTC corrigent trois défauts qui pénalisaient directement les **Ground CZ**,
résolus à cette occasion :

- les CZ à pied qui échouaient malgré une victoire du joueur, sans navette de retour vers la station (Issue ID 80753) ;
- les CZ à pied qui ne se plaçaient pas dans le bon état lorsque le joueur arrivait par Dropship (Issue ID 78904) ;
- les CZ qui ne se résolvaient pas correctement, s'accumulant en grand nombre dans certains systèmes (Issue ID 78480) ;
- s'y ajoute la correction de Frontline Solutions, qui ne réservait pas de dropship à l'engagement dans un conflit.

### Constat pour la méta 2025-2026 du combat à pied

Deux évolutions structurelles touchent aujourd'hui le combat à pied. La première est indirecte et ancienne —
l'ouverture de nouvelles Ground CZ via Powerplay 2.0 (31 octobre 2024) et la Colonisation
(bêta le 26 février 2025, sortie complète le 11 novembre 2025). La seconde est directe et récente : le mode
**Operations** (1ᵉʳ juillet 2026) ajoute un format d'escouade scénarisé, avec une progression et une monnaie propres,
là où le combat au sol reposait jusque-là sur les CZ et les missions de settlement. Les PNJ au sol seraient par
ailleurs devenus plus prudents (couverture, esquive, repli) autour de la période Caspian Explorer (2 décembre 2025),
mais ce lien causal précis reste à confirmer en jeu. Voir [13-operations.md](./13-operations.md) pour le détail du
mode Operations et [14-rhino-nomad.md](./14-rhino-nomad.md) pour les véhicules livrés dans la même fenêtre.

## L'équipement du commandant au sol

### Les cinq emplacements d'équipement d'un commandant à pied

Un commandant à pied dispose d'un nombre limité d'emplacements, qu'il faut choisir avant chaque sortie (le changement
d'équipement se fait à une station, un settlement habité ou dans certains abris) :

- **1 arme longue** (primaire), portée dans le dos ou à la main ;
- **1 arme de poing** (secondaire), pour les situations rapprochées ou en complément de l'arme longue ;
- **1 outil utilitaire non létal** (piratage de terminaux/portes, découpe/breach, profileur de cibles, scanner, etc.) ;
- **jusqu'à 3 grenades d'un même type**, choisies avant la sortie ;
- un **sac à dos** avec des emplacements limités en poids/volume pour les objets ramassés (Items, Components, Data,
  Goods — ce sont les catégories de **tri de l'inventaire du sac à dos**, à ne pas confondre avec les catégories de
  **matériaux d'ingénierie** détaillées plus bas).

### Les combinaisons à pied (suits) : Dominator, Maverick, Artemis et Flight Suit

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

### Les armes à pied

#### Armes longues à pied (primaires) : assaut, précision, pompe, plasma, laser

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

#### Armes de poing à pied (secondaires)

Les armes de poing à pied sont des déclinaisons compactes des mêmes familles de fabricants (kinétique, laser, plasma),
utilisées en complément de l'arme longue à courte portée, en dégainage rapide, ou comme arme principale silencieuse
lors des missions d'infiltration.

#### Armes à pied nommées par fabricant (Manticore, Kinematic Armaments, Takada)

Trois fabricants se partagent le catalogue des armes à pied, chacun avec ses propres recettes d'ingénierie. Le tableau
ci-dessous est un **résumé condensé** ; pour la liste exhaustive des modèles et l'ensemble des builds nommés par la
communauté, voir [07-equipement-a-pied.md](./07-equipement-a-pied.md#les-armes-à-pied-dodyssey--catégories-fabricants-et-builds), qui reste la source de
référence pour ce sujet.

| Fabricant               | Catégories couvertes                                        | Exemples de builds nommés (détail dans 07)                                                  | Style de jeu associé                          |
|--------------------------|--------------------------------------------------------------|-----------------------------------------------------------------------------------------------|------------------------------------------------|
| **Manticore**            | Fusils plasma polyvalents et sniper                          | Manticore Terminator (généraliste), Manticore Executioner / Executioner Warfighter (sniper/CZ) | Assaut, sniping, zones de conflit à haut dégât |
| **Kinematic Armaments**  | Pistolets et fusils cinétiques (dont la famille Karma)       | Karma P15 Infiltrator (infiltration silencieuse), Karma P15 Warfighter (achever une cible)     | Infiltration, exécution rapprochée             |
| **Takada**               | Armes à énergie/laser (SMG, fusils)                          | Catalogue tenu à jour dans 07 — non repris intégralement ici                                   | Combat à cadence soutenue, moyenne portée      |

Il n'existe pas d'arme de mêlée dédiée : voir la sous-section **Combat à mains nues** ci-dessous.

#### Outils utilitaires non létaux du Suit Tool (piratage, découpe, profileur, scanner)

Le commandant ne dispose que d'un seul emplacement d'outil utilitaire, mais son choix est déterminant selon la
mission : outil de piratage de portes/terminaux, outil de découpe (breach) pour ouvrir des accès non prévus, profileur
de cibles (identification à distance), scanner de signaux, ou outil de récupération d'énergie à distance pour un
vaisseau posé à proximité. Le détail de chaque outil (Compact Multi-Tool,
Profile Analyser, Wave Scanner, Arc Cutter, E-Break) est couvert dans
[07-equipement-a-pied.md](./07-equipement-a-pied.md#les-outils-à-pied--genetic-sampler-arc-cutter-wave-scanner-profile-analyser-compact-multi-tool-e-break).

### Les grenades à pied et gadgets (fragmentation, shield disruptor, incendiaire, non létale)

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
[07-equipement-a-pied.md](./07-equipement-a-pied.md#modifications-de-combinaison-blueprints--les-quatorze-effets-et-leurs-engineers).

Usages tactiques recommandés :

- **Infiltration** : neutraliser silencieusement une cible isolée sans déclencher l'alerte sonore d'un tir (voir la
  section Détection et infiltration ci-dessous) ;
- **Dernier recours en CZ** : achever un adversaire au bouclier tombé lorsque le rechargement de l'arme principale
  prendrait trop de temps ;
- **PvP à pied** : un profil offensif rare mais dévastateur une fois Added Melee Damage posé, notamment en combinaison
  avec une approche furtive qui place le joueur au corps-à-corps sans avoir été détecté.

### Grades et progression des armes et combinaisons à pied (1 à 5)

Chaque arme et chaque suit progresse sur 5 grades. Les grades les plus élevés offrent de meilleures statistiques de base
et davantage d'emplacements de modification pour l'ingénierie. La progression de grade se fait via l'achat (une fois
débloqué) ou via la montée en rang du commandant dans les activités de mercenariat/combat.

### Achat et déblocage de l'équipement à pied (Pioneer Supplies, rang, Engineers)

- **Achat initial en crédits** : les comptoirs « Pioneer Supplies » (outfitting à pied) dans les stations et settlements
  habités vendent l'équipement de base et ses premiers grades.
- **Déblocage de grades/armes/suits supplémentaires** : nécessite généralement une progression de rang (rang de
  combat/mercenaire) et/ou l'accès à des ingénieurs spécifiques présents dans certains settlements, chacun spécialisé
  dans un type d'arme ou de suit.
- **Effets expérimentaux et modifications** : nécessitent la collecte de matériaux au sol puis leur dépôt chez
  l'ingénieur correspondant.

### Ingénierie du matériel de combat à pied et ses quatre catégories de matériaux

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
[07-equipement-a-pied.md](./07-equipement-a-pied.md#lingénierie-à-pied-engineering-dodyssey--engineers-blueprints-et-modifications-irréversibles) pour la méthode de collecte
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
[07-equipement-a-pied.md](./07-equipement-a-pied.md#les-treize-engineers-à-pied--neuf-dans-la-bulle-core-quatre-à-colonia).

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

### Sniping et harcèlement à distance au sol

- **Suit** : famille précision/discrétion, pour le zoom et la stabilité de visée.
- **Arme longue** : fusil de précision à forte puissance et longue portée.
- **Rôle** : éliminer les cibles isolées (gardes, tourelles, opérateurs) avant qu'elles ne réagissent ou n'alertent le
  groupe ; reconnaissance avant un assaut d'escouade.
- **Priorité d'ingénierie** : portée, stabilité de visée, réduction du temps de réaction (recul, temps de rechargement
  du zoom).

### Composition d'escouade hybride à pied (multijoueur)

Un profil courant en groupe consiste à faire porter à un membre une **suit tank** pour absorber l'attention et les
dégâts, pendant qu'un autre membre en **suit précision** élimine à distance les cibles prioritaires (tourelles,
opérateurs, renforts), le tout complété par un membre en **suit polyvalente** chargé du piratage/soutien logistique
(portes, terminaux, ravitaillement).

## Tactiques de combat à pied

### Face aux PNJ au sol : cibles isolées, points faibles, repérage sonore

Le comportement des PNJ au sol serait devenu plus prudent (usage de couvertures, esquive accrue) depuis la période de
la mise à jour Caspian Explorer (2 décembre 2025) — voir la réserve exprimée dans le tableau d'historique ci-dessus.
Recommandations générales, indépendantes de cette évolution précise :

- Éliminer les cibles isolées avant qu'elles n'alertent le reste du groupe.
- Viser les points faibles une fois le bouclier tombé (les dégâts kinétiques sont généralement plus efficaces une fois
  le bouclier neutralisé).
- Utiliser une grenade EMP/perturbatrice pour désactiver le bouclier avant un assaut à l'arme automatique ou au
  corps-à-corps.
- Exploiter le repérage sonore pour anticiper les angles de tir ennemis avant d'être vu — la refonte audio du
  24 février 2026 (mise à jour Kestrel Mk II) a précisément été conçue pour cela : la ligne de feu ennemie est plus
  facile à localiser, la réverbération parasite est réduite, et les tirs alentour s'atténuent brièvement lorsque le
  joueur est touché ou frôlé, afin de faciliter l'identification de la menace.

### Face aux tourelles et défenses automatisées de settlement

Les tourelles représentent souvent la principale source de dégâts imprévus lors d'un raid de settlement. Privilégier :

- le piratage/la désactivation à distance avant d'entrer dans leur champ de tir ;
- ou une élimination à l'arme longue de précision depuis l'extérieur de leur portée effective.

### Détection et infiltration au sol : suspicion, confinement et armes silencieuses

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

**Portée des armes silencieuses — un rééquilibrage majeur pour l'infiltration.** Jusqu'au printemps 2026, une arme
silencieuse plafonnait à **40 mètres** de portée, ce qui condamnait le joueur furtif à s'approcher très près de sa
cible. La mise à jour du **28 avril 2026** (billet « Elite Dangerous | Lynx Highliner Update Notes », 13:11 UTC) a
porté cette portée à **128 mètres**, explicitement « pour les aligner sur les autres armes » ; Frontier précise
qu'elle reste inférieure à celle des armes non silencieuses. Un build d'infiltration conçu avant cette date part donc
d'une hypothèse de portée périmée : l'élimination silencieuse à distance moyenne est désormais viable. La même mise à
jour a corrigé les sons de tir silencieux du Karma AR-50 et aligné les modes *suppressed* et *audio-masked* du
Manticore Executioner sur ceux du Karma AR-50 et du P-15 — ce qui rend le comportement des modifications **Noise
Suppressor** et **Audio Masking** plus homogène d'une arme à l'autre.

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

### Gestion des ressources vitales à pied : bouclier, santé, oxygène

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

### Le mode Operations, vu du combat à pied

Le mode **Operations** est sorti le **30 juin 2026** (version du jeu 4.4.0.0), ses notes de version étant publiées le
**1ᵉʳ juillet 2026 14:01 UTC** sous le titre « Elite Dangerous | Operations Update » — *« The Operations Update is
here »*. Il avait été reporté d'avril à juin par le billet « An Update on Operations » du **22 avril 2026 14:02 UTC**.
Frontier le déploie en **« Networking & Balancing Beta »**, c'est-à-dire avec des ajustements de charge serveur et
d'équilibrage possibles en continu. Le système complet — lobby, appariement, récompenses, difficulté — est traité dans
**[13-operations.md](./13-operations.md)** ; cette sous-section ne retient que ce qui change pour un commandant au sol.

#### Format d'escouade d'une opération : quatre commandants, modes Mercenary et Powerplay

Une opération se lance seul ou en escouade constituée, avec appariement facultatif pour combler les places restantes,
et se joue **jusqu'à quatre commandants** (billet du 22 avril 2026). Elle s'ouvre depuis les tableaux de mission une
fois amarré — starport, Fleet Carrier ou Squadron Carrier. Deux modes coexistent : le mode
**Mercenary**, par défaut, sans conséquence ni effet Powerplay, et le mode **Powerplay**, dans lequel l'escouade sape
une Power adverse ; les systèmes éligibles dépendent de l'allégeance du chef d'escouade, et un commandant non aligné
peut participer sans gagner de mérites.

#### L'Operation Runner, point d'entrée, de réapparition et d'extraction de l'escouade

Une fois l'opération lancée, tous les commandants sont transférés à bord de l'**Operation Runner**, vaisseau de
déploiement spécialisé qui sert de point d'entrée, de point de réapparition et de point d'extraction finale. Un commandant mis hors de combat y revient automatiquement, son vaisseau réparé, ravitaillé et
réarmé, avant d'être redéployé.

#### Les six opérations du lancement et leur part de combat à pied

Les six opérations du lancement, dont plusieurs sont majoritairement à pied :

| Opération | Déroulé | Part de combat à pied |
|---|---|---|
| **Tactical Takedown** | Aborder un mégavaisseau compromis, se frayer un chemin jusqu'au pont de commandement pour récupérer des renseignements, puis frapper le général responsable dans sa base | Forte — abordage et progression en intérieur |
| **Firestorm Rescue** | Briser le siège d'une station en feu et évacuer les otages, en gérant la montée en température de la station | Forte — évacuation sous contrainte de temps |
| **Reclamation Point** | Éliminer toutes les forces hostiles dans et autour d'un mégavaisseau détourné pour permettre au client de le récupérer | Mixte — vaisseau et intérieur |
| **Biohazard Takedown** | Assaillir un vaisseau de recherche, obtenir la position et l'identité des chercheurs développant une arme dangereuse, puis les neutraliser | Forte — assaut et élimination ciblée |
| **Rapid Response** | Évacuer le personnel piégé dans un port planétaire attaqué avant l'arrivée d'une flotte hostile | Forte — port planétaire, timer serré |
| **Terminal Prosecution** | Nettoyer un système d'un élément criminel qui y opère des raids depuis des semaines | Mixte |

Ces six intitulés sont ceux des notes de version du 1ᵉʳ juillet 2026 et font foi. **Piège de comptage** : le billet de
présentation du 22 avril 2026 annonçait six scénarios sous d'autres noms — *Counter Attack*, *Burning Rescue*,
*Megaship Massacre Reclaim*, *Megaship Massacre Strike*, *Surface Rescue* et *Pirate Hunt*. Leurs descriptifs
recouvrent ceux des six opérations du lancement, ce qui suggère de simples noms de travail renommés en cours de
développement — Frontier n'a toutefois publié aucune table de correspondance. Dans tous les cas, il y avait bien
**six** opérations au lancement, et non douze.

Une **septième opération, « Under Siege »**, a été ajoutée le **2 septembre 2026** (billet « Rhino SRV Update »,
11:20 UTC) : répondre à l'appel de détresse d'un settlement planétaire, lever un blocus et neutraliser les forces
ennemies qui tentent de s'en emparer.

#### Merc Coin et MercGear : aucune pièce d'équipement à pied dans le catalogue de lancement

Terminer une opération rapporte des crédits, des matériaux, des mérites (mode Powerplay
uniquement) et du **Merc Coin**, une monnaie gagnée en jeu qui **ne s'achète pas en ARX**, assortie d'un bonus
hebdomadaire à la première réalisation de certaines activités. Le Merc Coin sert à acheter le catalogue **MercGear**.
**Attention à un contresens fréquent** : le catalogue MercGear publié au lancement est composé de **modules de
vaisseau** — plans d'ingénierie (*Thermal Plasma Conversion*, *Scoop Rate Enhanced*), armes pré-modifiées
(*pre-engineered* : rail gun, abrasion blaster, canon à fragmentation, laser minier, multi-canon, lance-missiles à tête
chercheuse) et modules internes ou de cœur pré-modifiés (distributeurs de puissance, soute étendue, DSS longue portée,
renfort de module).
**Aucune pièce d'équipement à pied — arme, combinaison, outil, grenade — ne figure dans la liste du lancement.** Le
correctif du 2 septembre 2026 sur l'ingénierie du MercGear (« Seeker Missile Rack MercGear » chez Petra Olmanova, une
ingénieure de vaisseaux) confirme cette lecture. L'équipement de combat à pied reste donc acheté et amélioré par les
circuits décrits plus haut dans ce guide et dans [07-equipement-a-pied.md](./07-equipement-a-pied.md).

#### Réserve : incidents de récompenses et interface d'escouade à pied manquante

Le mode a connu des incidents de récompenses et d'inventaire lors de ses premiers jours : le correctif
« Operations Update | Update 3 » du **9 juillet 2026 10:24 UTC** annonce la restitution rétroactive des récompenses
d'opération non attribuées et des inventaires à pied effacés après une opération. Au 2 septembre 2026, Frontier
signale encore comme problème connu une **interface d'escouade à pied manquante** (« On-foot wing UI is currently
missing ») — un point à garder en tête pour la coordination d'une escouade au sol.

### Colonisation, Powerplay 2.0 et nouvelles zones de conflit au sol

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

Ce guide se concentre sur les **tactiques et choix de style de jeu** en combat à pied. Pour éviter les redites (et les
contradictions qu'elles ont pu créer par le passé entre guides), le détail exhaustif de certains sujets vit ailleurs
dans le corpus :

- **[07 — Équipement à pied](./07-equipement-a-pied.md)** — catalogue complet des armes par fabricant, des
  combinaisons, outils et consommables, tables d'ingénierie exhaustives (Engineers, blueprints, coûts) et builds
  nommés. Ce guide-ci ne reprend que des tableaux condensés qui renvoient vers 07 pour le détail.
- **[26 — Ingénierie à pied avancée](./26-ingenierie-a-pied-avancee.md)** — où et comment farmer les matériaux
  nécessaires aux modifications citées ici (Quieter Footsteps, Audio Masking, Damage Resistance…), règles d'échange
  chez le barman et ordre de déblocage recommandé des Engineers à pied.
- **[13 — Opérations](./13-operations.md)** — typologie des settlements, mécanique complète de
  détection/suspicion/confinement, catégories de missions au sol, zones de conflit à pied, et système **Operations**
  complet (lobby, appariement, difficulté, récompenses, Merc Coin). Ce guide-ci résume la mécanique et renvoie vers 13
  pour l'exhaustif.
- **[14 — Le Rhino et le Nomad](./14-rhino-nomad.md)** — chronologie sourcée du SRV Rhino de Vodel (2 septembre 2026)
  et du **Nomad**, premier vaisseau embarqué (SLV) du jeu, livré avec Operations le 30 juin 2026.
- **[02 — Powerplay](./02-powerplay.md)** — détail de Powerplay 2.0 / l'extension Ascendancy (31 octobre 2024), dont
  les cycles hebdomadaires influencent l'apparition des Ground CZ liées aux Powers.
- **[00 — Chronologie canonique](./00-chronologie-canonique.md)** — arbitrage daté de toutes les corrections
  chronologiques appliquées dans ce guide (Powerplay 2.0 vs Trailblazers, Colonisation, Rhino, Caspian Explorer,
  Kestrel Mk II, mode « Operations »).
- **[06 — Ingénieurs](./06-ingenieurs.md)** — système général d'ingénierie (vaisseaux et à pied) et référentiel des
  grades de matériaux.
- **[08 — Combat spatial](./08-combat-spatial.md)** — pendant vaisseau des CZ et tactiques de combat au sol.
- **[18 — Colonisation](./18-colonisation.md)** — mécanique de construction de systèmes/établissements, source des
  nouvelles zones de conflit au sol évoquées plus haut.
- **[00 — Glossaire](./00-glossaire.md)** — définitions des sigles utilisés (CZ, etc.).

## Sources

Corpus interne recoupé pour cette révision : 00-chronologie-canonique.md, 02-powerplay.md, 06-ingenieurs.md,
07-equipement-a-pied.md, 13-operations.md, 14-rhino-nomad.md.

**Source primaire de cette révision** — flux Steam News officiel d'Elite Dangerous (appid 359320), qui republie
verbatim les annonces de Frontier, relevé le 9 septembre 2026 via
https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320. Billets cités inline dans ce guide :

| Billet | Horodatage UTC | Ce qu'il établit pour ce guide |
|---|---|---|
| « Elite Dangerous \| Kestrel Mk. II Update » | 24 février 2026 12:21 | Refonte de l'audio de combat à pied (section « On-Foot Combat Audio Rebalance ») |
| « Elite Dangerous \| An Update on Operations » | 22 avril 2026 14:02 | Report d'Operations en juin ; format d'escouade à 4, modes Mercenary/Powerplay, Operation Runner, Merc Coin |
| « Elite Dangerous \| Lynx Highliner Update Notes » | 28 avril 2026 13:11 | Portée des armes silencieuses portée de 40 à 128 m ; correctifs audio d'armes silencieuses |
| « Elite Dangerous \| Operations Update » | 1ᵉʳ juillet 2026 14:01 | Sortie d'Operations ; six opérations ; MercGear ; correctifs de zones de conflit au sol |
| « Elite Dangerous \| Operations Update \| Update 3 » | 9 juillet 2026 10:24 | Restitution des récompenses d'opération et des inventaires à pied |
| « Elite Dangerous \| Rhino SRV Update » | 2 septembre 2026 11:20 | SRV Rhino ; septième opération « Under Siege » ; interface d'escouade à pied manquante |

Sources externes (historique, contexte général, non ré-explorées intégralement pour cette révision) :

- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://canonn.science
- https://inara.cz/elite/
- https://inara.cz/elite/database/
- https://www.pcgamesn.com/elite-dangerous
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320
- https://www.spansh.co.uk/
- https://steamcommunity.com/app/359320/guides/

## Note sur la fiabilité des données chiffrées de ce guide

Les noms de familles d'équipement, les mécaniques de jeu et l'historique des mises à jour présentés ici ont été
recoupés avec les guides 07, 13, 14 et la chronologie canonique (00), puis **revérifiés sur les notes de version
officielles de Frontier** (voir Sources) : chaque fait daté des tables d'historique de ce guide cite désormais le
billet qui l'établit, avec son horodatage UTC. En revanche, les **valeurs numériques précises**
(dégâts exacts, points de vie, prix en crédits, quantités de matériaux d'ingénierie) évoluent au fil des correctifs et
doivent être confirmées directement dans l'écran d'outfitting en jeu ou sur le wiki communautaire
(elite-dangerous.fandom.com) avant toute prise de décision engageant beaucoup de crédits ou de temps de collecte. Les
coûts en crédits cités dans ce guide sont un **instantané capturé le 9 septembre 2026** (repris de 07) — à revérifier
auprès de l'Engineer concerné, ces montants pouvant être rééquilibrés par Frontier. Ce guide privilégie donc les
catégories, rôles et rapports de force relatifs (« élevé / moyen / faible ») plutôt que des chiffres qui seraient
rapidement obsolètes ou invérifiables.
