---
id: 18-colonisation
titre: "La Colonisation de systèmes"
domaine: economie
entites: [Colonisation de systèmes, Architecte système, Balise de colonisation système, Mégavaisseau de colonisation,
  Points de Construction, Trailblazers, Dodec Update, liens forts et liens faibles, Coriolis, Orbis, Ocellus,
  Brewer Corporation, metahauling]
mots_cles_en: [system colonisation, system architect, system colonisation beacon, colonisation ship, construction points,
  primary port, trailblazers, dodec update, strong link, weak link, construction effort, metahauling, uncontrolled populated]
version_jeu_couverte: "4.2.2.x (Dodec Update du 11 novembre 2025, dernière mise à jour couverte)"
branche: live
date_verification: 2026-09-13
confiance_globale: moyenne
volatilite: moyenne
sources_primaires: [elitedangerous.com update-notes 4.1.0.0 / 4.1.2.0 / 4.1.2.102 / 4.2.2.0, mega-guide communautaire
  CMDR Mechan (MikeCZ23/CCCL), EDCD/coriolis-data, Wikipédia, aussig/BGS-Tally]
zones_incertaines: ["formule exacte du revenu hebdomadaire de l'Architecte et fonctionnement du facteur « Chance »",
  "effets précis de la Richesse et du Niveau de vie sur un système colonisé",
  "statut du « sniping » des revendications après le Dodec Update, non vérifié",
  "pondération chiffrée du port primaire sur les statistiques système, recherchée et non confirmée, donc retirée",
  "portée de saut après ingénierie d'un porteur de fret, non chiffrée faute de source accessible",
  "capacité de fret du Panther Clipper Mk II, non vérifiée",
  "noms anglais complets des organisations logistiques SCCN et CTN, non confirmés",
  "usage documenté du contrôleur de limpets collecteurs en contexte de colonisation, déduit de la mécanique générale"]
guides_lies: [0, 2, 3, 11, 12, 13, 16, 19, 21, 27, 31]
---

# La Colonisation de systèmes

## En bref

La **Colonisation de systèmes** (*System Colonisation*) permet à tout commandant, sans prérequis de rang, de revendiquer
un système inhabité situé à **15 années-lumière au maximum** d'un contact « System Colonisation », pour **25 000 000 Cr**
non remboursables, puis d'en devenir l'**Architecte système** (*System Architect*) de façon permanente. Entrée en bêta le
**26 février 2025** avec *Trailblazers* (v4.1.0.0), la fonctionnalité est sortie de bêta le **11 novembre 2025** avec le
**Dodec Update** (v4.2.2.0) ; au 4 octobre 3311, la communauté recensait **75 984 systèmes colonisés** et
**277 638 installations**. Après la revendication, il faut déployer la **balise** sous **24 heures** et achever le **port
primaire** sous **4 semaines**, en livrant les commodités au **mégavaisseau de colonisation**. La construction ensuite
s'organise en trois **Tiers**, financés par des **Points de Construction** (CP jaunes puis verts), avec un coût croissant
par port supplémentaire, une orientation économique héritée du corps céleste et des **liens forts** (0,35–0,80) et
**faibles** (0,05). Le système devient « Uncontrolled Populated » (littéralement « peuplé non contrôlé »), donc immédiatement éligible au Powerplay et au BGS.

## Introduction — objet et périmètre de ce guide de la Colonisation

La **Colonisation de systèmes** (*System Colonisation*) est l'une des fonctionnalités les plus structurantes ajoutées à *Elite Dangerous* depuis son lancement : elle permet à n'importe quel commandant, sans prérequis de rang particulier, de revendiquer un système inhabité, d'y faire construire un port primaire puis des installations supplémentaires, et de devenir de façon permanente l'**Architecte système** (*System Architect*) du système ainsi fondé. Annoncée le 20 octobre 2024 lors du livestream *Frontier Unlocked*, la fonctionnalité est entrée en **Bêta** le **26 février 2025** avec la mise à jour gratuite **Elite Dangerous: Trailblazers** (v4.1.0.0), a connu plusieurs refontes majeures de son économie et de ses mécaniques de liaison au cours de l'année, puis est sortie de Bêta le **11 novembre 2025** avec le **Dodec Update** (v4.2.2.0).

Ce guide constitue la référence unique sur la colonisation de systèmes pour ce corpus : il détaille la mécanique de revendication, la construction (de l'avant-poste au starport Coriolis/Orbis/Ocellus et aux installations planétaires), les points de construction, l'orientation économique et les liens forts/faibles, le tonnage de commodités requis, la logistique de transport (capacité utile comparée des gros porteurs, méthode de calcul des rotations, Fleet Carrier comme dépôt avancé), l'interface du contact « System Colonisation », les récompenses de l'Architecte, ainsi que l'impact sur le Powerplay, le BGS et l'économie galactique.

> **Note sur les sources.** Les mécaniques citées comme « officielles » proviennent des notes de mise à jour et articles publiés sur elitedangerous.com. Les valeurs numériques fines (coûts en Points de Construction, tonnages, force des liens économiques, répartition des factions héritées) proviennent en complément d'un mega-guide communautaire détaillé (CMDR Mechan et contributeurs, licence CC BY-SA 4.0) qui documente des mécaniques que Frontier n'a jamais publiées dans le détail ; ces passages sont signalés explicitement comme communautaires plutôt qu'officiels. Plusieurs affirmations chiffrées de ce guide ont été vérifiées directement dans le texte source du mega-guide communautaire (converti en texte depuis le PDF original) ainsi que sur Wikipédia pour les dates clés ; un point resté non confirmable après recherche a été retiré (voir [Points d'incertitude](#points-dincertitude-à-garder-en-tête-sur-la-colonisation)).

## Chronologie officielle de la Colonisation de systèmes (2024-2025)

Chaque tableau chiffré de ce guide porte désormais une colonne terminale **`Fiab.`** (fiabilité), au code à quatre
valeurs défini par [00-methodologie-sourcing.md §10](./00-methodologie-sourcing.md#10-la-colonne-fiab-des-tableaux-sans-attribution) :
**P** = primaire (patch notes Frontier, journal du jeu, EDCD), **C** = communautaire recoupée (base ou guide
communautaire), **E** = estimation (reconstruction non recoupée, y compris un calcul fait par ce corpus lui-même), **N** =
non confirmé. Le code reflète la provenance documentée du tableau dans son ensemble ; les rangées individuellement
signalées comme incertaines ailleurs dans ce guide ou dans le [registre d'incertitudes](./00-chronologie-canonique.md#registre-dincertitudes-du-corpus)
portent leur propre code.

| Date | Version | Événement | Fiab. |
|---|---|---|---|
| 20 octobre 2024 | — | Annonce de la fonctionnalité lors du livestream *Frontier Unlocked* | P |
| 26 février 2025, 11:00 UTC | v4.1.0.0 | Lancement en **Bêta** avec *Elite Dangerous: Trailblazers* | P |
| 28 février 2025 | — | Publication de l'article officiel « System Colonisation Guide » | P |
| Fin février / début mars 2025 | — | « System Colonisation Claim Pause » : suspension temporaire du contact suite à un bug critique sur les revendications (plus de 8 000 systèmes colonisés et 13 000 installations complétées en quelques jours de Bêta) ; mégavaisseaux de CG retardés d'une semaine | P |
| Quelques jours plus tard | — | « System Colonisation Unpaused » : réactivation, présentée comme faisant partie d'un test de charge de la Bêta | P |
| 30 avril 2025 | v4.1.2.0 | *Trailblazers – Update 3* : refonte majeure de l'économie et de la croissance de population (liens forts/faibles) | P |
| 4 juin 2025 | v4.1.2.102 | *Trailblazers – Update 3.3* : réécriture des conditions d'activation des services de station selon liens et niveau technologique | P |
| 19 août 2025 | v4.2.0.0 | *Elite Dangerous: Vanguards* : refonte des escadrons, effets marginaux sur la colonisation | P |
| 11 novembre 2025, 10:00 UTC | v4.2.2.0 | **Dodec Update** : fin officielle de la Bêta de System Colonisation, rééquilibrage des statistiques système, nombreux correctifs | P |
| 13 novembre 2025 | v4.2.2.1 | *Dodec Update Patch 1* : correctifs mineurs | P |

Au 4 octobre 3311 (date in-game), le total cumulé rapporté par la communauté atteignait **75 984 systèmes colonisés et 277 638 installations construites**, témoignant de l'ampleur de l'adoption de la fonctionnalité.

## Mécanique de revendication d'un système inhabité (claim)

### Trouver un contact « System Colonisation » pour lancer une revendication

Le contact de station **« System Colonisation »** (l'exemple utilisé dans la documentation officielle est Miracle Davidson) n'est disponible que dans les **systèmes peuplés qui possèdent déjà ce contact** : il s'agit soit des systèmes de la Bulle (concentrés autour de Sol, Achenar, Alliot), soit de systèmes déjà colonisés par un joueur **dont le port primaire est terminé**. Un système peuplé « naturel » situé hors de la Bulle et jamais colonisé par un joueur (Colonia, la nébuleuse Witch Head, etc.) n'a **pas** de contact tant qu'il n'a pas lui-même été rattaché à la chaîne de colonisation par un architecte.

### Portée (15 al) et coût (25 M Cr) d'une revendication de système

- **Portée maximale de la revendication : 15,00 années-lumière** depuis le contact utilisé. Cette portée est affichée littéralement par la carte galactique dédiée, en mode **« System Claim Mode »**, sous forme d'un cercle vert. *(Valeur confirmée dans le texte du mega-guide communautaire : « Přímo lze nárokovat pouze systémy do 15 LY od osídleného systému ».)*
- **Coût de la revendication : 25 000 000 CR**, payés d'avance et **non remboursés** en cas d'échec de la tentative (expiration de la balise ou du délai de construction). *(Valeur confirmée dans le même texte : « Nárok... stojí jednorázový poplatek 25 milionů kreditů. Tento poplatek se nevrací... ».)*

### Les quatre étapes officielles d'une colonisation, du contact au port primaire

1. **Trouver le contact de colonisation** dans un système éligible.
2. **Créer la revendication** : choisir le système cible dans le rayon de 15 al, puis le **port primaire** (type d'installation et orientation économique).
3. **Déployer la Balise de colonisation système** (*System Colonisation Beacon*) via le module **« System Colonisation Suite »** (suite d'outils de colonisation système), présent par défaut sur tous les vaisseaux au même titre que le Discovery Scanner.
4. **Construire le port primaire** en livrant les commodités requises au **Mégavaisseau de colonisation** (*Colonisation Ship*), qui sert de dépôt temporaire pendant le chantier.

### Délais impératifs : 24 heures pour la balise, 4 semaines pour le port primaire

| Étape | Délai | Conséquence en cas de dépassement | Fiab. |
|---|---|---|---|
| Déploiement de la balise après l'enregistrement de la revendication | **24 heures** | La revendication expire et redevient disponible pour un autre commandant | P |
| Achèvement du port primaire après le déploiement de la balise | **4 semaines** | La revendication expire ; le système ne peut pas être re-revendiqué immédiatement | P |

Une fois le port primaire achevé, une séquence de confirmation (Brewer Corporation) s'affiche, le mégavaisseau de colonisation quitte le système quelques minutes plus tard, et le commandant devient de façon **permanente et non transférable** l'**Architecte système**. Le système bascule alors dans la catégorie **« Uncontrolled Populated »**.

### Héritage des factions mineures par un système colonisé (mécanique communautaire)

À la création du système, jusqu'à quatre factions mineures peuvent être héritées, selon une répartition documentée par la communauté et confirmée verbatim dans le texte du mega-guide :

| Rang | Poids | Origine de la faction | Fiab. |
|---|---|---|---|
| 1 | 60 % | Faction contrôlant la **station** d'où la revendication a été faite | C |
| 2 | 20 % | Faction contrôlant le **système** d'origine (ou une deuxième faction locale par influence, si station et système partagent la même faction) | C |
| 3 | 13 % | Faction alliée de l'**escadron** du joueur (mécanisme non documenté précisément si le joueur n'appartient à aucun escadron) | N |
| 4 | 6 % | Faction **Anarchie** reprise du système existant le plus proche qui en possède une (s'applique même si la faction de la station est déjà elle-même une Anarchie) | C |

Frontier présente explicitement ce mécanisme comme un moyen de « propager les factions du BGS en dehors de la Bulle » (voir la section [Impact sur le BGS](#impact-de-la-colonisation-sur-le-bgs)).

### Concurrence et « sniping » des revendications de colonisation

Le système est **strictement premier arrivé, premier servi**, sans aucune exigence de contribution minimale préalable à une revendication. En pratique, un commandant peut se contenter d'observer une chaîne de revendications construite par des tiers — un « pont » (*bridging*) de systèmes-relais espacés de 15 al pour progresser vers une région éloignée (un exemple cité par la communauté atteint plus de 500 années-lumière jusqu'à la nébuleuse de Californie) — puis foncer avec un vaisseau rapide dès l'apparition d'un nouveau contact pour revendiquer le système convoité à la place de celui qui a fait le travail préparatoire. Ce problème était documenté comme non résolu à l'écriture de la version bêta du guide communautaire (mai/juin 2025). Les notes du Dodec Update (novembre 2025) mentionnent des « corrections significatives de l'interface de revendication » sans confirmer explicitement la disparition du sniping : **ce point doit être considéré comme non vérifié à la date de rédaction et pris au conditionnel**.

## Construction : de l'avant-poste au starport

### Les quatre catégories d'installations colonisables

Quatre grandes catégories d'installations existent :

- **Ports** (orbitaux et planétaires) — les seules installations soumises au mécanisme de coût croissant décrit plus bas.
- **Colonies / Settlements planétaires**.
- **Hubs planétaires** — toujours de niveau 2, sans classe de taille.
- **Installations orbitales**.

### Les trois niveaux d'installation (Tier 1 à 3) et les Points de Construction

| Tier | Coût | Génère | Installations concernées | Fiab. |
|---|---|---|---|---|
| **Tier 1** | Aucun Point de Construction (CP) | CP de niveau 2 (« CP jaunes ») | Avant-poste civil/commercial orbital, avant-poste civil planétaire (ports « type colonie »), avant-poste industriel/scientifique/militaire/contrebande orbital ou planétaire (ports « spécialisés ») | C |
| **Tier 2** | CP jaunes | CP de niveau 3 (« CP verts ») | **Coriolis** (type colonie), **base d'astéroïde** (spécialisée, économie Extraction) | C |
| **Tier 3** | CP verts | Aucun | **Orbis**, **Ocellus**, **Port planétaire T3** (pas d'équivalent « spécialisé » à ce niveau) | C |

La plupart des installations Tier 2 coûtent 1 CP jaune pour générer 1 CP vert, à deux exceptions près : les grandes colonies planétaires (1 CP jaune → 2 CP verts), et les starports Tier 2 eux-mêmes (Coriolis, base d'astéroïde), qui coûtent plus de 3 CP jaunes pour ne générer qu'1 CP vert.

### Le coût croissant en CP de chaque port supplémentaire d'un système

Chaque port Tier 2 ou Tier 3 construit dans un système coûte plus cher que le précédent — à l'exception du **port primaire**, qui ne compte jamais dans ce calcul, quel que soit son niveau. *(Exemption confirmée verbatim dans le mega-guide communautaire : « primární port se do tohoto limitu NEZAPOČÍTÁVÁ ».)* Cette exception a une conséquence stratégique majeure : construire directement le port primaire en Tier 3 (Orbis ou Ocellus) est « gratuit » vis-à-vis de cette mécanique de coût croissant.

| N-ième port construit | Coût en CP T2 (Coriolis / base d'astéroïde) | Coût en CP T3 (Orbis / Ocellus / Port planétaire T3) | Fiab. |
|---|---|---|---|
| 1er | 3 | 6 | C |
| 2e | 3 | 6 | C |
| 3e | 5 | 12 | C |
| 4e | 7 | 18 | C |
| 5e | 9 | 24 | C |
| N-ième | 3 + (n−2) × 2 | (n−1) × 6 | C |

**Conséquence chiffrée** : construire dans l'ordre T2, T2, T3, T3 coûte 6 CP jaunes + **30** CP verts (soit un minimum de 36 installations de support pour générer ces CP), alors que l'ordre T3, T3, T2, T2 ne coûte que 16 CP jaunes + 12 CP verts (28 installations minimum). D'où la recommandation forte de la communauté : **construire les ports Tier 3 avant les ports Tier 2** dans un système donné.

Cette mécanique de coût croissant ne s'applique **ni** au Tier 1, **ni** aux Settlements, Hubs et Installations — seuls les starports Tier 2/Tier 3 et le port planétaire Tier 3 sont concernés. Elle confère une valeur stratégique particulière à l'**avant-poste civil planétaire Tier 1** (« type colonie »), seule installation de ce type échappant totalement à la contrainte.

### Chantiers de construction simultanés : cinq au maximum par système

Un système peut avoir jusqu'à **5 chantiers de construction simultanés** ; il faut en achever un pour en démarrer un sixième.

## Choix de l'orientation économique d'un port colonisé

### Ports « type colonie » et ports « spécialisés »

- Les ports **« type colonie »** héritent leur économie du corps céleste sur ou en orbite duquel ils sont construits.
- Les ports **« spécialisés »** (Industriel, Contrebande, HighTech/Scientifique, Militaire) ont une économie fixe imposée par le type d'installation, non affectée par l'héritage local.

### Héritage de l'économie de base par type de corps céleste

D'après un post officiel des forums Frontier relatif à *Trailblazers – Update 3*, cité par le guide communautaire :

| Type de corps céleste | Économie héritée | Fiab. |
|---|---|---|
| Trous noirs, étoiles à neutrons, naines blanches | HighTech, Tourisme | P |
| Naines brunes et tous les autres types d'étoiles | Militaire | P |
| Mondes de type terrestre (Earth-like) | Agriculture, HighTech, Militaire, Tourisme | P |
| Mondes océaniques (Water world) | Agriculture, Tourisme | P |
| Mondes ammoniaqués | HighTech, Tourisme | P |
| Géantes gazeuses | HighTech, Industriel | P |
| Corps riches en métaux / à haute teneur métallique | Extraction | P |
| Corps rocheux glacés | Industriel, Raffinerie | P |
| Corps rocheux | Raffinerie | P |
| Corps glacés | Industriel | P |

*Fiab. `P`* : origine revendiquée comme un post officiel des forums Frontier, mais relayé uniquement par le mega-guide
communautaire (le post original n'a pas été retrouvé indépendamment par ce corpus) — à nuancer en ce sens malgré le code P.

**Modificateurs locaux additifs** :
- Anneaux (y compris étoiles à ceinture d'astéroïdes) → +Extraction
- Signaux biologiques → +Agriculture, +Terraformation
- Signaux géologiques → +Extraction, +Industriel

### Liens forts et liens faibles entre installations d'un système colonisé

La mécanique des **liens économiques**, formalisée officiellement dans *Trailblazers – Update 3* (v4.1.2.0), détermine comment les installations d'un système colonisé interagissent économiquement entre elles :

- Toute construction terminée est classée soit comme **Port**, soit comme **Installation de support** (colonies, installations, hubs).
- **Lien fort** : entre un port et toute installation de support située sur ou autour du **même corps céleste**. Force de base ~0,35–0,80, modulée de ±0,4 selon des critères précis par type d'économie (par exemple, l'Agriculture est boostée en orbite d'un monde Earth-like, terraformable ou organique, et réduite sur un corps glacé ; l'Extraction est boostée par des ressources majeures/pristines ou du volcanisme, et réduite si les ressources sont faibles/épuisées) ; la force ne descend jamais sous un plancher de 0,1. S'il existe plusieurs ports sur le même corps céleste, seul le port de plus haut niveau (ou le plus ancien à niveau égal) reçoit le lien fort ; les ports planétaires transmettent leurs liens forts au port orbital du même corps selon les mêmes règles de priorité.
- **Lien faible** : entre un port et toute installation d'un type économique donné **ailleurs dans le même système**. Valeur fixe de **0,05**, jamais modifiée — d'où l'intérêt de raisonner la spécialisation à l'échelle du **système entier**, et pas seulement du corps céleste.
- Un port peut cumuler plusieurs types d'économie via ces liens, ce qui introduit du commerce proportionnel dans les biens correspondants.

**Recommandations de la communauté** :
- Ne construire **qu'un seul port par corps céleste** — les configurations à plusieurs ports sur un même corps sont documentées comme complexes, voire buggées.
- **Spécialiser fortement chaque marché** : mélanger deux économies sur un même marché peut créer un marché « stérile » où l'offre et la demande s'auto-neutralisent.
- Construire les **raffineries en premier** : les métaux qu'elles produisent profitent ensuite à la construction de toutes les autres installations du système.

### Statistiques système influencées par chaque installation

Chaque installation influence, de façon non linéaire, les statistiques suivantes du système : Sécurité, Richesse (*Wealth*), Niveau de vie (*Standard of Living*), Niveau technologique, Niveau de développement, population de départ et maximale, et un facteur « Chance »/*Luck* qui module le paiement hebdomadaire versé à l'Architecte. L'écran de construction affiche des « chevrons » indiquant l'effet attendu de l'installation en cours sur chacune de ces statistiques, mais l'ampleur exacte de chaque contribution n'est pas documentée officiellement dans le détail.

> **Point retiré après vérification.** Une pondération chiffrée précise (port primaire à +40 %/+40 %/+40 %/+20 %/+40 % contre −10 %/−10 %/−20 %/−25 %/−25 % pour chaque installation suivante, attribuée à un rééquilibrage rétroactif du Dodec Update) figurait dans une version antérieure de ce guide. Recherche faite, aucune source consultée ne la confirme : le mega-guide communautaire documente l'état du jeu jusqu'à juin 2025, donc avant le Dodec Update, et les notes de mise à jour officielles n'ont pas pu être vérifiées sur ce point précis. Ce chiffrage est donc **considéré comme non confirmé et retiré** de ce guide (voir [Points d'incertitude](#points-dincertitude-à-garder-en-tête-sur-la-colonisation)). Le principe général — le Dodec Update a bien inclus un « rééquilibrage des statistiques système », cf. [Chronologie officielle](#chronologie-officielle-de-la-colonisation-de-systèmes-2024-2025) — n'est en revanche pas remis en cause.

Un **niveau technologique minimal de 35** est requis pour qu'un chantier naval soit en ligne dans le système *(seuil confirmé verbatim dans le mega-guide communautaire : « Existuje minimální technologická úroveň (35), aby byly loděnice v přístavech online », explicitement daté des « services... depuis l'aktualizace 3.3 »)*, condition introduite par *Trailblazers – Update 3.3* (v4.1.2.102), qui a globalement réécrit les conditions d'activation des services de station — marché, chantier naval, équipement, cartographie universelle, Vista Genomics, marché noir, salon d'équipage, contact Pioneer Supplies — en fonction des liens forts/faibles et du niveau technologique. Table complète des neuf types de station, de leurs tailles de pad et de la disponibilité de ces quinze services (confirmée cette fois directement sur le texte officiel des notes de mise à jour) dans [31-pilotage-navigation-et-stations.md §4](./31-pilotage-navigation-et-stations.md#4-types-de-stations-tailles-de-pad-et-services).

> Les effets précis de la « Richesse » et du « Niveau de vie » sur le système restent **non confirmés officiellement** dans le détail.

## Tonnage de commodités requis pour construire une installation

Aucun barème fixe n'a été publié officiellement pour le tonnage de commodités par type et par niveau d'installation. Les notes officielles de *Trailblazers – Update 3* précisent seulement le principe général :

> « Le niveau global de production d'une installation est déterminé par la population qui lui est rattachée — plus la population est élevée, plus la production de commodités est élevée. »

Le tonnage dépend donc conjointement du **type d'installation**, de son **niveau (Tier)**, et de la **population locale associée**. À titre d'illustration (exemples réels capturés par le guide communautaire, à ne pas généraliser comme table universelle) :

| Exemple | Commodité | Tonnage | Fiab. |
|---|---|---|---|
| Port planétaire (Tier 3), exemple 1 | Titane | 34 580 t | C |
| | Aluminium | 43 282 t | C |
| | Polymères | 2 712 t | C |
| | Cuivre | 2 442 t | C |
| | Cartouches alimentaires | 544 t | C |
| | Superconducteurs | 544 t | C |
| | Semi-conducteurs | 458 t | C |
| | Fruits et légumes | 390 t | C |
| Port planétaire, type Contrebande, exemple 2 | Eau | 65 t | C |
| | Titane | 1 594 t | C |
| | Cuivre | 57 t | C |
| | Aluminium | 1 233 t | C |

L'écart entre les deux exemples (dizaines de milliers de tonnes de matériaux de structure contre quelques centaines à quelques milliers) confirme la forte variabilité selon le type d'installation et le corps céleste local. Un point chiffré fiable, en revanche : **le port primaire coûte 17 à 25 % de matériaux en plus** qu'un starport non-primaire équivalent, car il est construit via les mégavaisseaux de colonisation plutôt que par livraison directe.

Pour le fret de construction, la communauté recommande couramment le **Type-9 Heavy** et le **Type-8** (gros tonnage), l'**Imperial Cutter** restant une option haut de gamme. Pour simuler à l'avance le coût total en Points de Construction d'un système complet, l'outil de référence cité par la communauté est la **feuille de calcul « DaftMav »** (voir [Outils communautaires](#outils-communautaires-de-planification-de-colonisation)).

Pour le détail des capacités de fret utiles de ces trois vaisseaux, l'outillage recommandé, une méthode de calcul du nombre de rotations à partir de ces tonnages, et l'usage d'un Fleet Carrier (Porte-Vaisseau) comme dépôt avancé, voir la section [Logistique de transport](#logistique-de-transport-capacité-utile-et-fleet-carrier-comme-dépôt-avancé) ci-dessous.

## Logistique de transport, capacité utile et Fleet Carrier comme dépôt avancé

Cette section comble une lacune du guide : les tonnages requis sont documentés en détail ci-dessus (voir [Tonnage de commodités requis](#tonnage-de-commodités-requis-pour-construire-une-installation)), mais ni la capacité utile réelle des gros porteurs recommandés, ni une méthode pour convertir ces tonnages en nombre de trajets, ni la technique communautaire de référence — utiliser un **Fleet Carrier** comme dépôt avancé — n'étaient jusqu'ici traitées. Les données chiffrées ci-dessous proviennent de deux sources vérifiées : la base de données communautaire **EDCD/coriolis-data** (dépôt GitHub `EDCD/coriolis-data`, qui alimente les outils d'outfitting Coriolis et EDSY déjà cités dans ce guide) pour les emplacements internes exacts des vaisseaux, et le même mega-guide communautaire (CMDR Mechan et contributeurs) déjà utilisé comme source principale de ce document, pour la technique de dépôt via Fleet Carrier.

### Capacité utile comparée : Type-9 Heavy, Type-8, Imperial Cutter

Un rack de cargaison (Cargo Rack) n'existe qu'en qualité E et a une capacité fixe de **2^classe tonnes** (classe 1 → 2 t, classe 2 → 4 t, classe 3 → 8 t... classe 8 → 256 t), quel que soit le vaisseau qui le porte. En appliquant cette règle aux emplacements internes optionnels réels de chaque vaisseau (source : EDCD/coriolis-data) :

| Vaisseau | Rang requis | Emplacements internes optionnels utilisables pour du fret | Capacité de fret maximale (tous racks classe E, sans bouclier) | Capacité avec un générateur de bouclier dans le plus grand emplacement libre | Fiab. |
|---|---|---|---|---|---|
| **Type-8 Transporter** | Aucun | 9 emplacements : classes 7, 6, 6, 6, 5, 5, 4, 2, 1 | **406 t** | 406 − 64 = **342 t** | P |
| **Type-9 Heavy** | Aucun | 11 emplacements : classes 8, 8, 7, 6, 5, 4, 4, 3, 3, 2, 1 | **790 t** | 790 − 64 = **726 t** | P |
| **Imperial Cutter** | Duc (*Duke*) de la marine impériale ou rang supérieur | 10 emplacements utilisables : classes 8, 8, 6, 6, 6, 5, 5, 4, 3, 1 (+ 2 emplacements classe 5 supplémentaires verrouillés en « Military » (militaire), qui n'acceptent jamais de rack de cargaison) | **794 t** | 794 − 64 = **730 t** | P |

Quelques nuances tirées de ces mêmes données :
- Le Type-9 Heavy et l'Imperial Cutter sont, avec le Panther Clipper Mk II (non chiffré ici faute de vérification), les seuls vaisseaux du jeu à disposer de **deux emplacements internes de classe 8**, ce qui explique leur écart de capacité avec le Type-8.
- Le Type-8, malgré sa capacité brute nettement inférieure, embarque un **Frame Shift Drive de classe 5 de série** (contre classe 6 pour le Type-9 et classe 7 pour l'Imperial Cutter) sur une coque bien plus légère (400 t contre 850 t et 1 100 t) : à gabarit de FSD comparable après ingénierie, il conserve donc une meilleure portée de saut par trajet, ce qui en fait un choix pertinent pour des relais longue distance (bridging, cf. [Concurrence et « sniping » des revendications](#concurrence-et--sniping--des-revendications-de-colonisation)) plutôt que pour du tonnage brut.
- *(Note pratique, hors capacité de fret)* : le mega-guide communautaire précise que l'achat de l'Imperial Cutter à Summerland donne une remise permanente de **30 %** sur l'achat et sur tous les rachats futurs — et non 10 % comme l'indiquent à tort le wiki communautaire et Inara selon la même source.

### Outfitting recommandé pour un porteur de fret de colonisation

D'après le mega-guide communautaire et les données de modules ci-dessus :
- **Racks de cargaison** dans tous les emplacements internes généraux disponibles (voir tableau ci-dessus) — c'est la configuration qui maximise le tonnage par trajet, au prix de l'absence de bouclier.
- **Générateur de bouclier** : optionnel. Un porteur de fret n'a pas vocation à combattre ; beaucoup de commandants font le choix du « tout cargaison » (0 protection) sur Type-9 et Type-8, mais gardent un bouclier sur l'Imperial Cutter du fait de son coût d'achat et de rachat élevé — au prix d'un emplacement (généralement le plus grand disponible après les racks essentiels), soit environ 64 t de fret en moins dans les trois cas ci-dessus.
- **Ordinateur d'accostage avancé** (*Advanced Docking Computer*, classe 3) et/ou **assistant de supercruise** (*Supercruise Assist*, classe 1) : recommandés explicitement par le mega-guide pour qui ne souhaite pas piloter manuellement en continu — l'assistant de supercruise peut aussi servir à un freinage hyperbrake automatisé sur les stations orbitales. Le coût en tonnage est marginal (2 à 10 t selon qu'on installe l'un, l'autre, ou les deux dans des emplacements séparés) au regard du gain de confort sur des dizaines de rotations.
- **FSD amélioré** (chimère d'ingénierie « Increased Range ») et **Guardian FSD Booster** : recommandés par la communauté pour réduire le nombre de sauts par trajet sur les liaisons longues ; ce guide n'a pas pu vérifier de valeur chiffrée précise de portée après ingénierie auprès d'une source externe accessible durant la rédaction de cette section et ne l'invente donc pas — se référer à un simulateur de build (Coriolis, EDSY) pour un chiffrage exact selon la masse embarquée.
- **Contrôleur de limpets collecteurs** (classe 1 suffit) : permet de récupérer dans l'espace une cargaison éjectée par un autre commandant ou un coéquipier sans qu'aucun des deux navires n'ait besoin de s'arrimer — utile quand plusieurs commandants convergent en même temps vers le même Fleet Carrier et que les baies d'amarrage sont saturées. Il s'agit d'un mécanisme générique du jeu (limpets + éjection de cargaison), stable depuis son introduction ; les sources consultées pour cette section ne documentent pas explicitement son usage en contexte de colonisation, cette recommandation relève donc de la mécanique générale plutôt que d'un témoignage communautaire direct sur ce point précis.

### Méthode de calcul du nombre de rotations de fret vers un chantier

Le nombre de rotations minimal pour livrer un tonnage donné se calcule simplement :

> **Rotations = ⌈ Tonnage requis ÷ Capacité utile par trajet ⌉**

En appliquant cette formule aux tonnages déjà cités dans ce guide (voir [Tonnage de commodités requis](#tonnage-de-commodités-requis-pour-construire-une-installation)) avec les capacités « tout cargaison » du tableau ci-dessus :

| Poste | Tonnage | Rotations Type-8 (406 t) | Rotations Type-9 (790 t) | Rotations Imperial Cutter (794 t) | Fiab. |
|---|---|---|---|---|---|
| Titane seul (port planétaire T3, exemple 1) | 34 580 t | 86 | 44 | 44 | E |
| Total des huit commodités de l'exemple 1 (34 580 + 43 282 + 2 712 + 2 442 + 544 + 544 + 458 + 390 t) | **84 952 t** | 210 | 108 | 107 | E |

*Fiab. `E`* : rotations obtenues par un calcul (division arrondie au supérieur) fait par ce guide lui-même à partir de
tonnages `C` (mega-guide) et de capacités `P` (coriolis-data) — une reconstruction du corpus, non une valeur publiée telle quelle.

Ce calcul suppose un seul vaisseau dédié ; en pratique, plusieurs commandants se répartissent les commodités et les rotations en parallèle, ce qui réduit d'autant le temps total mais pas le nombre brut de trajets. À titre de calibration sur des chantiers plus lourds, le mega-guide communautaire donne un ordre de grandeur en unités de « charge de Cutter » : *« Stavba základny vyžaduje minimálně 29 kutrů (v praxi i několik dalších). Při stavbě Orbisu se toto číslo vyšplhá na 267 »* — soit, au minimum, **29 charges** d'Imperial Cutter pour un avant-poste (Tier 1) et **267 charges** pour un Orbis (Tier 3). En appliquant la capacité « tout cargaison » ci-dessus (794 t), cela représente un ordre de grandeur d'environ 23 000 t pour un avant-poste et 212 000 t pour un Orbis — cohérent avec l'écart de tonnage observé entre les deux exemples de la section Tonnage, mais à traiter comme un ordre de grandeur : la source ne précise pas la configuration exacte (bouclier ou non) du Cutter utilisé comme unité de compte.

### Le Fleet Carrier comme dépôt avancé

C'est la technique la plus rentable documentée par la communauté pour les chantiers éloignés de la Bulle, et elle est absente du reste de ce guide malgré son usage massif :

#### Principe : parcourir la longue distance une fois, puis enchaîner des rotations courtes

**Principe général** *(traduit du mega-guide communautaire)* : « Le principe général est d'utiliser des vaisseaux pour des transferts courts et rapides depuis une station d'approvisionnement vers un Fleet Carrier, et d'utiliser le Fleet Carrier pour de grands transferts de ressources, puis pour un transfert du Fleet Carrier vers le vaisseau/site de colonisation à l'autre bout. » Concrètement, la portion la plus coûteuse en temps — le trajet longue distance depuis la Bulle ou depuis un pôle d'approvisionnement établi (raffinerie, mégalonef Trailblazer) — n'est parcourue **qu'une seule fois par lot** (par un ou plusieurs commandants en parallèle, chacun remplissant le Fleet Carrier), après quoi toutes les rotations suivantes se font en **allers-retours courts** entre le Fleet Carrier positionné au plus près du chantier et le site de construction lui-même — un trajet qui, une fois le Fleet Carrier stationné dans le système cible ou à un saut de celui-ci, se réduit à de la supercruise plutôt qu'à un hyperespace de plusieurs centaines d'années-lumière.

#### « Metahauling » : réduire les services du porteur pour atteindre 24 070 t de fret

**« Metahauling » — configurer le Fleet Carrier pour maximiser sa capacité de fret** : le mega-guide recommande de réduire les services embarqués du Fleet Carrier au strict minimum : *« La meilleure utilisation des porteurs consiste à les réduire de façon à ne contenir que les modules suivants, réellement indispensables : Réarmement, Ravitaillement en carburant, Réparation. De cette façon, vous atteignez une capacité de fret maximale de 24 070 (dite metahauling). »* Chaque service additionnel (marché noir, salon d'équipage, chantier naval, etc.) réduit d'autant la capacité commerciale disponible pour stocker des commodités de construction — un arbitrage à faire consciemment avant de partir en expédition de colonisation lointaine.

#### Astuce de transfert : passer par le marché du Fleet Carrier plutôt que par le panneau

**Astuce de transfert** : le transfert de cargaison via le panneau de transfert (right panel) est décrit comme « frustrant et lent ». La méthode recommandée consiste à passer par le **marché du Fleet Carrier** : placer un ordre de vente (à soi-même) des matériaux à livrer, puis les « racheter » sur le marché du porteur — en faisant attention au prix fixé si le Fleet Carrier est ouvert à tous les commandants.

#### Mutualisation : faire livrer par d'autres commandants (30 000 à 60 000 Cr la tonne)

**Mutualisation entre commandants** : un Fleet Carrier peut ouvrir ses ordres de marché à l'ensemble des commandants, qui sont alors payés en crédits pour livrer du fret pendant que l'architecte se consacre à autre chose (ou dort). Le mega-guide chiffre le coût de cette sous-traitance : le tarif communautaire usuel pour transporter 1 t de fret sur une courte distance se situe entre **30 000 et 60 000 CR**, soit environ **720 millions de crédits** pour faire remplir 24 000 t par d'autres commandants à 30 000 CR/t. Pour trouver des preneurs, la source recommande de lier son compte commandant à **Inara** et/ou de publier l'offre sur le bulletin commercial du **Fleet Carrier Owners Club (FCOC)** et/ou sur les discords **PTN** — présentés comme les deux principaux canaux par lesquels les commandants transporteurs trouvent des contrats à honorer. Le déchargement du Fleet Carrier vers le chantier reste en revanche à la charge manuelle de l'architecte : les services communautaires visant à l'automatiser sont qualifiés d'« encore assez immatures et peu pratiques » par la même source.

#### Organisations communautaires d'aide logistique à une colonisation

**Organisations communautaires d'aide logistique** citées par le mega-guide comme apportant un soutien gratuit ou contractuel aux commandants engagés dans une colonisation (voir aussi [Opérations](./13-operations.md) pour l'organisation d'une campagne à plusieurs) :
- **Systémoví kolonizační kontraktoři (SCCN)** — littéralement « Contractants de colonisation systémique », nom anglais complet non confirmé par les sources consultées
- **Opération Ida (OIDA)**
- **F.R.E.I.G.H.T. (FRHT)**
- **Obchodní síť kolonizátorů (CTN)** — littéralement « Réseau commercial des colonisateurs », nom anglais complet non confirmé par les sources consultées

#### Alternative pour un commandant isolé : s'approvisionner au mégalonef Trailblazer

**Alternative pour les commandants isolés** : lorsqu'un mégalonef de colonisation Trailblazer est accessible à proximité, la source recommande de s'y approvisionner directement plutôt que de dépendre d'un Fleet Carrier personnel — ces mégalonefs sont rapidement atteignables, accostables, et stockent la plupart des matériaux nécessaires (y compris certains normalement récoltables uniquement au sol, donc beaucoup plus lents à obtenir autrement) ; leurs places d'amarrage peuvent cependant être limitées lorsque plusieurs commandants convergent en même temps.

#### Repères chiffrés du Fleet Carrier utiles à une opération de colonisation

**Caractéristiques propres du Fleet Carrier** : elles sont documentées, sourcées et datées dans [Fleet Carriers](./19-fleet-carriers.md), fichier de référence unique du corpus sur ce sujet — s'y reporter plutôt qu'aux valeurs redonnées ici en raccourci. Les repères utiles à une opération de colonisation : **prix d'achat 5 000 000 000 Cr** (5 milliards) ; **entretien hebdomadaire de base 5 000 000 Cr** pour un porteur nu, hors services optionnels, plus **100 000 Cr par saut** ; **dépôt de Tritium de 1 000 t**, séparé de la soute et donc sans effet sur le pool de 25 000 t de cargaison ; **portée maximale de saut de 500 al**, valeur fixe et non améliorable par ingénierie (champ brut `JumpRangeMax: 500` du journal de jeu) ; **consommation d'environ 135 t de Tritium** pour un saut de 500 al à vide et **d'environ 260 t** soute et réserve pleines (plancher de 10 t pour un saut à distance nulle ; formule complète dans le guide dédié) ; **cycle de saut complet d'environ 20 minutes** (charge-up d'au moins ~15 min, puis cooldown d'environ 5 min avant de replanifier). Ces six valeurs sont données avec un niveau de **confiance haute** dans [Fleet Carriers](./19-fleet-carriers.md) (sources concordantes : guide PTN, roguey.co.uk, journal de jeu). Voir aussi [Outils](./16-outils.md) pour un calculateur de carburant à jour.

## Interface du contact « System Colonisation »

### Écran d'accueil du contact et carte « System Claim Mode »

Le contact affiche un écran d'accueil (« Help [faction] expand to a new system ») avec un bouton **« BEGIN NEW CLAIM »**, qui ouvre une carte galactique dédiée en mode **« SYSTEM CLAIM MODE »**. Cette carte affiche :

- un **cercle vert de 15 années-lumière** de portée autour du contact,
- les systèmes éligibles en points verts vifs (aucun point vert affiché si aucun système n'est éligible),
- un panneau récapitulatif **« SYSTEM ARCHITECT »** indiquant le nombre de sites disponibles, les constructions actives et les points de construction accumulés.

### Suivi des systèmes et des chantiers : « My Colonies » et « Construction Effort »

- Un panneau dédié **« My Colonies »** liste les systèmes de l'Architecte. Un bug faisant que le port primaire n'apparaissait pas toujours comme « installation terminée » a été corrigé au Dodec Update.
- L'interface de suivi de construction (**« Construction Effort »**) est consultable par **n'importe quel commandant** visitant le site : elle indique le type d'installation en cours, sa progression, et les commodités requises restantes, avec un raccourci vers les points d'approvisionnement.
- Corrections notables apportées au Dodec Update : incohérence entre le montant réellement requis et celui affiché à l'écran de pré-achat ; l'UI de l'effort de construction des ports primaires n'indiquait pas la faction en expansion ; icône incorrecte pour un chantier terminé non retiré de la carte système ; carte système affichant une progression de construction erronée.

### Renommage des installations colonisées (gratuit ou contre ARX)

Les installations peuvent être renommées gratuitement (choix dans une liste prédéfinie, ou tirage aléatoire) ou avec un nom entièrement personnalisé contre ARX. Un bug bloquant l'usage d'apostrophes dans le renommage a été corrigé au Dodec Update.

### Abandon et démolition : « Cancel Construction » contre « Demolish Facility »

Le Dodec Update a corrigé une confusion d'interface persistante entre deux actions bien différentes :

| Action | Effet | Corrections apportées au Dodec Update | Fiab. |
|---|---|---|---|
| **Cancel Construction** | Annule un chantier **en cours**, rembourse des Points de Construction | Le panneau affichait par erreur « Economy Points » au lieu de « Construction Points », et parlait à tort de « Demolition » au lieu de « Cancellation » pour le nombre de CP remboursés | P |
| **Demolish Facility** | Démolit une installation **déjà terminée** | Un bug faisant traiter la démolition comme une simple annulation a été corrigé ; le panneau de démolition n'affichait pas le nom complet de l'installation ; la carte système continuait à tort d'afficher une installation démolie | P |

Un bouton « Cancel » du panneau « Cancel Demolition » a également été renommé « Back » pour éviter toute confusion supplémentaire.

### Cooldown de 30 minutes et irréversibilité des ordres de construction

- Une restriction de **30 minutes** s'applique entre deux actions de revendication/construction (le panneau affichait à tort « 24h » avant correction au Dodec Update).
- **Aucune action de construction ne peut être annulée ou défaite une fois lancée** au sens propre (hors « Cancel Construction » qui rembourse partiellement des CP avant achèvement) : le guide communautaire insiste — « il n'y a aucun bouton pour annuler, supprimer ou déconstruire ; toutes les instructions de construction sont définitives dès le départ ». **Il est donc essentiel de bien planifier l'orientation économique et l'ordre de construction avant de lancer un chantier.**
- Un joueur membre d'un escadron soumis à une restriction active sur les nouvelles revendications via une installation de colonisation système ne peut pas contourner cette restriction en quittant l'escadron (correction apportée au Dodec Update).

## Récompenses économiques de l'Architecte système

- **Paiement hebdomadaire** (« impôt »/tax) à récupérer auprès d'un contact d'administration. La formule exacte n'est pas documentée officiellement ; une formule communautaire non officielle avance : Revenu hebdomadaire ≈ (score du système) × 10 000 × (1 + Chance du système), vraisemblablement plafonné en pratique bien en dessous de 1 000 000 CR/semaine pour un système isolé. **Cette formule et le fonctionnement précis du facteur « Chance » restent non confirmés officiellement** — le guide communautaire lui-même l'indique : « nous ne savons tout simplement pas ».
- Un **impôt galactique** est prélevé sur tout revenu hebdomadaire cumulé dépassant **5 000 000 CR**, destiné à financer la maintenance des infrastructures à grande échelle.
- **Remise de 3 % sur les vaisseaux et l'équipement** achetés dans un système où l'Architecte a fait construire au moins **10 installations** — cumulable avec les remises de Powerplay, mais réservée à l'Architecte lui-même.
- Un léger bonus de prix (au-dessus de la moyenne galactique) est versé à tout commandant, architecte ou non, qui livre des commodités sur un chantier de construction.

## Impact de la Colonisation sur le Powerplay

Un système nouvellement colonisé devient **« Uncontrolled Populated »**, ce qui le rend **immédiatement éligible à l'expansion et au contrôle Powerplay** — un point confirmé explicitement dans les notes officielles de *Trailblazers*. La colonisation constitue ainsi un levier direct d'expansion territoriale pour les Powers, en dehors de la Bulle historique.

Le **Dodec Update** a par ailleurs livré, dans le même paquet que la fin de la Bêta de colonisation, plusieurs correctifs liés au Powerplay :

- Mesures anti-abus sur le gain de mérites/score de contrôle système, empêchant la vente de commodités « une unité à la fois » ou l'*undermining* avec des commodités « blanchies » à faible valeur pour gonfler artificiellement les mérites.
- Réactivation du score/mérite lié au transfert de données de pouvoir à pied.
- Refonte des **Care Packages Powerplay** : expiration automatique après 30 jours, avec ouverture et conversion en crédits selon le barème suivant.

| Grade du matériau | Valeur de conversion | Fiab. |
|---|---|---|
| 1 | 2 000 CR | P |
| 2 | 4 000 CR | P |
| 3 | 8 000 CR | P |
| 4 | 16 000 CR | P |
| 5 | 32 000 CR | P |

Les matériaux spécifiques Odyssey ne sont plus versés aux joueurs sans Odyssey (correctif rétroactif). Pour plus de détails sur le fonctionnement général du Powerplay, voir le [Voir aussi](#voir-aussi) ci-dessous.

## Impact de la Colonisation sur le BGS

Le *Background Simulation* — états de faction, influence, expansion et rétraction — est documenté par
[Le Background Simulation (BGS)](./21-bgs.md), qui fait référence sur ce système. Cette section ne traite que
de ce que la Colonisation y change.

- Le **troisième faction mineure** d'un système nouvellement colonisé est systématiquement celle **alignée avec l'escadron de l'Architecte système** — Frontier présente explicitement ce mécanisme comme un moyen direct « de propager les factions du BGS en dehors de la Bulle ».
- La répartition complète à l'origine d'un système (60/20/13/6 %, cf. [Héritage des factions mineures](#héritage-des-factions-mineures-par-un-système-colonisé-mécanique-communautaire)) est communautaire dans le détail chiffré (confirmée dans le texte du mega-guide), mais s'appuie sur le principe officiel ci-dessus.
- Changer la faction dirigeante d'un système déjà colonisé est ensuite qualifié de « très pénible » par la communauté, nécessitant des semaines de guerres BGS.
- Un correctif du Dodec Update a résolu des cas où de nouveaux systèmes colonisés ne déclenchaient pas de conflits aux avant-postes malgré des conditions BGS remplies, et un autre où des missions influençaient à tort le BGS pendant des élections dans des systèmes sous Powerplay.
- **Effet indirect documenté par la communauté** : l'expansion de la Bulle dilue l'efficacité de certaines routes de mission « à réputation » historiques (par exemple Robigo/Sothis) en multipliant les systèmes cibles potentiels, et réduit la disponibilité de « systèmes optimaux » pour l'empilement de missions de type massacre.

## Impact de la Colonisation sur l'économie et le lore (Thargoïdes)

- La colonisation introduit des sources de signal humaines qui entrent en concurrence avec les sources de signal non-humaines (Thargoïdes), réduisant de fait leur présence dans les systèmes nouvellement colonisés.
- Sur le plan narratif, la communauté relève que les Thargoïdes ont envoyé des Titans en réaction à l'expansion humaine dramatique permise par la colonisation.
- Le **contact de raffinerie** (*Refinery Contact*, permettant de raffiner des minerais minés en produits raffinés — par exemple l'hématite en acier, une commodité introduite avec *Trailblazers*) n'est officiellement disponible, depuis le Dodec Update, **que dans les marchés à économie Raffinerie pure**, et non plus dans tout marché comportant une composante raffinerie.

## Outils communautaires de planification de colonisation

- **Feuille de calcul « DaftMav »** : outil de référence pour simuler la construction complète d'un système et calculer ses dépendances en Points de Construction, cité par le mega-guide communautaire comme quasi indispensable.
- **BGS-Tally** (plugin EDMC, dépôt GitHub `aussig/BGS-Tally`) : suit le BGS, la Colonisation et le Powerplay.
- Plusieurs planificateurs de colonisation open-source sur GitHub (par exemple `00Chaotic/ed-colonisation-planner`, `Roescoe/elite-colonisation`, `gaborauth/ed-colonisation-planner`) : écosystème actif mais fragmenté, sans outil officiel unique faisant consensus.

## Points d'incertitude à garder en tête sur la Colonisation

- La **formule exacte** de revenu hebdomadaire de l'Architecte et la mécanique précise du facteur **« Chance »** restent non officiellement documentées.
- L'effet précis de la **Richesse** et du **Niveau de vie** sur les systèmes colonisés n'est pas confirmé officiellement.
- Le statut actuel du problème de **« sniping »** des revendications après le Dodec Update n'a pas pu être vérifié de façon définitive : à traiter au conditionnel jusqu'à confirmation.
- Une pondération chiffrée précise du poids du port primaire par rapport aux installations suivantes sur les statistiques système, attribuée à un rééquilibrage rétroactif du Dodec Update, a été **recherchée et non confirmée** par les sources disponibles (le mega-guide communautaire s'arrête à juin 2025, avant le Dodec Update) ; elle a été retirée de ce guide plutôt que présentée comme fiable.
- Les caractéristiques propres du **Fleet Carrier** (réservoir de Tritium, consommation par saut, portée de saut, temps de recharge, coût d'achat et d'entretien) ne constituent **plus un point d'incertitude** : elles sont chiffrées, sourcées et affectées d'un niveau de confiance dans [Fleet Carriers](./19-fleet-carriers.md), et rappelées en raccourci dans la section [Logistique de transport](#logistique-de-transport-capacité-utile-et-fleet-carrier-comme-dépôt-avancé).

## Check-list : de la revendication (claim) à la première livraison

- **Avant de revendiquer** : confirmer le système cible dans le rayon de 15 al et le type de port primaire visé
  (orientation économique, voir section [Choix de l'orientation économique d'un port colonisé](#choix-de-lorientation-économique-dun-port-colonisé)).
- Réunir les **25 M Cr** de coût de revendication avant de contacter le point de colonisation — non remboursables en
  cas d'abandon.
- **Dans les 24 heures** suivant l'enregistrement de la revendication : déployer la Balise de colonisation système
  (*System Colonisation Beacon*), sous peine d'expiration automatique de la revendication.
- Planifier la logistique de fret avant le déploiement de la balise, pas après : calculer le tonnage requis (section
  « Tonnage de commodités ») et le nombre de rotations nécessaires (section « Logistique de transport »).
- **Dans les 4 semaines** suivant le déploiement de la balise : achever le port primaire, sous peine d'expiration de
  la revendication et d'impossibilité de la re-revendiquer immédiatement.
- Positionner un Fleet Carrier comme dépôt avancé si le système cible est éloigné d'une route commerciale établie
  (voir « Le Fleet Carrier comme dépôt avancé »).
- Après achèvement : attendre la séquence de confirmation Brewer Corporation avant de considérer le statut
  d'Architecte système comme acquis (permanent et non transférable).

## Pièges fréquents et coûts cachés de la Colonisation

| Piège | Conséquence chiffrée | Comment l'éviter | Fiab. |
|---|---|---|---|
| Laisser expirer le délai de 24 h sans déployer la balise | Revendication perdue, redevient disponible pour un autre commandant | Déployer la balise dès l'enregistrement de la revendication, pas après avoir organisé la logistique | P |
| Laisser expirer le délai de 4 semaines sans achever le port primaire | Revendication perdue, système non re-revendicable immédiatement | Planifier le tonnage et les rotations de fret avant le déploiement de la balise | P |
| Compter sur le brut du revenu hebdomadaire de l'Architecte | Impôt galactique prélevé au-delà de 5 M Cr cumulés par semaine | Ne pas se fier au chiffre affiché avant impôt (voir [Récompenses économiques de l'Architecte système](#récompenses-économiques-de-larchitecte-système)) | P |
| Se fier à la formule communautaire de revenu hebdomadaire comme à un chiffre garanti | Formule non officielle, facteur « Chance » non documenté | Traiter tout revenu annoncé comme un ordre de grandeur, pas un montant garanti | N |
| Revendiquer sans capital de construction déjà réuni | 25 M Cr de revendication immobilisés sans pouvoir achever le port dans les 4 semaines | Réunir le tonnage de commodités avant de lancer la revendication, pas après | P |

## Questions fréquentes

**Combien coûte de revendiquer un système en colonisation (system colonisation claim) et jusqu'où peut-on viser ?**

Le coût est de **25 000 000 Cr**, payés d'avance et non remboursés en cas d'échec (expiration de la balise ou du délai de construction), pour un système situé à **15 années-lumière au maximum** du contact « System Colonisation » utilisé. Voir [Mécanique de revendication d'un système inhabité (claim)](#mécanique-de-revendication-dun-système-inhabité-claim).

**Combien de temps ai-je pour déployer la balise puis terminer le port primaire (primary port) après avoir revendiqué un système ?**

24 heures pour déployer la Balise de colonisation système après l'enregistrement de la revendication, puis 4 semaines supplémentaires pour achever le port primaire. Passé l'un ou l'autre délai, la revendication expire et le système ne peut pas être re-revendiqué immédiatement. Voir [Mécanique de revendication d'un système inhabité (claim)](#mécanique-de-revendication-dun-système-inhabité-claim).

**Quel vaisseau utiliser pour transporter le fret de construction (cargo hauling) d'une colonisation ?**

Le Type-9 Heavy (790 t tout cargaison, 726 t avec un bouclier) et l'Imperial Cutter (794 t / 730 t, rang impérial de Duc requis) offrent la plus grande capacité utile ; le Type-8 Transporter (406 t / 342 t) reste pertinent pour les relais longue distance grâce à son FSD de classe 5 de série sur une coque plus légère. Voir [Logistique de transport, capacité utile et Fleet Carrier comme dépôt avancé](#logistique-de-transport-capacité-utile-et-fleet-carrier-comme-dépôt-avancé).

**Faut-il construire les ports Tier 3 avant les Tier 2 pour économiser des Points de Construction (Construction Points) ?**

Oui : construire dans l'ordre T3, T3, T2, T2 coûte 16 CP jaunes + 12 CP verts, contre 6 CP jaunes + 30 CP verts pour l'ordre inverse T2, T2, T3, T3 — le port primaire, lui, ne compte jamais dans ce calcul de coût croissant, quel que soit son niveau. Voir [Le coût croissant en CP de chaque port supplémentaire d'un système](#le-coût-croissant-en-cp-de-chaque-port-supplémentaire-dun-système).

**C'est quoi un lien fort et un lien faible (strong link / weak link) entre les installations d'un système colonisé ?**

Un lien fort relie un port à une installation de support sur le **même corps céleste** (force de base 0,35 à 0,80, modulée selon l'économie, plancher à 0,1) ; un lien faible relie un port à une installation du même type économique **ailleurs dans le système**, à une valeur fixe et non modulable de 0,05. Voir [Liens forts et liens faibles entre installations d'un système colonisé](#liens-forts-et-liens-faibles-entre-installations-dun-système-colonisé).

**Comment utiliser un Fleet Carrier comme dépôt avancé pour une colonisation loin de la Bulle ?**

On parcourt la longue distance une seule fois pour remplir le Fleet Carrier positionné près du chantier, puis on enchaîne des rotations courtes en supercruise entre le porteur et le site de construction. En réduisant ses services au strict minimum (Réarmement, Ravitaillement en carburant, Réparation), le porteur atteint une capacité de fret maximale de **24 070 t** — technique dite « metahauling ». Voir [Logistique de transport, capacité utile et Fleet Carrier comme dépôt avancé](#logistique-de-transport-capacité-utile-et-fleet-carrier-comme-dépôt-avancé).

**Quelles récompenses touche l'Architecte système (system architect) une fois le port primaire terminé ?**

Un paiement hebdomadaire (formule officielle non documentée), une remise de **3 %** sur les vaisseaux et l'équipement dans tout système où il a fait construire au moins 10 installations, et un léger bonus de prix pour toute livraison de commodités sur un chantier — un impôt galactique étant prélevé au-delà de 5 000 000 Cr de revenu hebdomadaire cumulé. Voir [Récompenses économiques de l'Architecte système](#récompenses-économiques-de-larchitecte-système).

**Un système colonisé devient-il jouable en Powerplay tout de suite ?**

Oui : il devient « Uncontrolled Populated » dès l'achèvement du port primaire, ce qui le rend immédiatement éligible à l'expansion et au contrôle Powerplay, en dehors de la Bulle historique. Voir [Impact de la Colonisation sur le Powerplay](#impact-de-la-colonisation-sur-le-powerplay).

**D'où viennent les factions mineures (minor factions) d'un système qu'on vient de coloniser ?**

Jusqu'à quatre factions sont héritées à la création : 60 % la faction contrôlant la station d'origine, 20 % celle du système d'origine, 13 % une faction alliée de l'escadron du joueur, et 6 % une faction Anarchie reprise du système existant le plus proche qui en possède une. Voir [Héritage des factions mineures par un système colonisé (mécanique communautaire)](#héritage-des-factions-mineures-par-un-système-colonisé-mécanique-communautaire).

**Le sniping des revendications de colonisation marche-t-il encore après le Dodec Update ?**

Non vérifié officiellement : les notes du Dodec Update (novembre 2025) mentionnent des « corrections significatives de l'interface de revendication » sans confirmer explicitement la disparition du sniping — ce point reste à traiter au conditionnel tant qu'aucune source ne le confirme. Voir [Concurrence et « sniping » des revendications de colonisation](#concurrence-et--sniping--des-revendications-de-colonisation).

## Voir aussi

- [Carte des boucles de gameplay](./00-boucles-de-gameplay.md) — la colonisation comparée aux 21 autres boucles du
  jeu (temps avant premier revenu, capital d'entrée) et sa place dans la matrice boucle × système structurant.
- [Chronologie canonique](./00-chronologie-canonique.md) — arbitrage daté des événements officiels cités dans ce guide (annonce, Bêta, mises à jour, Dodec Update).
- [Powerplay](./02-powerplay.md) — fonctionnement complet du méta-jeu politique et des Care Packages
- [Vaisseaux](./03-vaisseaux.md) — Type-9 Heavy, Type-8 et Imperial Cutter pour le fret de construction
- [Équipements](./04-equipements.md) — modules utiles au transport de commodités de construction
- [Guardians](./05-guardians.md) — technologies et sites liés aux civilisations précurseures, en périphérie de la Bulle
- [Équipement à pied](./07-equipement-a-pied.md) — matériel Odyssey pertinent sur les installations colonisées
- [Combat à pied](./09-combat-a-pied.md) — activités possibles sur les settlements et avant-postes nouvellement construits
- [Exploration](./10-exploration.md) — repérage des systèmes et corps célestes candidats à la colonisation
- [Commerce](./11-commerce.md) — routes commerciales et fret dans les systèmes colonisés
- [Transport](./12-transport.md) — logistique de livraison des commodités de construction
- [Opérations](./13-operations.md) — organisation d'une campagne de colonisation à plusieurs commandants
- [Roadmap](./15-roadmap.md) — calendrier des mises à jour touchant la colonisation
- [Outils](./16-outils.md) — planificateurs et calculateurs communautaires de colonisation
- [Sources et données](./17-sources-donnees.md) — méthodologie de collecte des données officielles et communautaires
- [Fleet Carriers](./19-fleet-carriers.md) — prix, entretien, Tritium, portée et cycle de saut du porteur servant de dépôt avancé
- [Glossaire](./00-glossaire.md) — sigles et termes utilisés dans ce guide (CP, Tritium, Bulle)

## Sources

Format normalisé selon [00-methodologie-sourcing.md §9](./00-methodologie-sourcing.md#9-format-normalisé-dune-section-sources),
sur le modèle de [11-commerce.md](./11-commerce.md) et [02-powerplay.md](./02-powerplay.md). Date de consultation reprise du
champ `date_verification` de ce fichier (13/09/2026), aucune date par source n'étant présente dans la version antérieure de
cette section.

- https://www.elitedangerous.com/update-notes/4-1-0-0 | primaire | consulté le 13/09/2026 | confirme : la sortie en Bêta de System Colonisation le 26 février 2025 avec *Trailblazers* (v4.1.0.0) | ne confirme pas : les valeurs chiffrées communautaires (CP, tonnages, %) détaillées par le mega-guide ci-dessous
- https://www.elitedangerous.com/update-notes/4-2-2-0 | primaire | consulté le 13/09/2026 | confirme : le contenu du Dodec Update (11 novembre 2025) — fin officielle de la Bêta, rééquilibrage des statistiques système, corrections d'interface (Cancel Construction/Demolish Facility, Care Packages, cooldown de 30 minutes) | ne confirme pas : une pondération chiffrée précise du port primaire sur les statistiques système (recherchée et retirée du guide, voir [Points d'incertitude](#points-dincertitude-à-garder-en-tête-sur-la-colonisation))
- https://www.elitedangerous.com/update-notes/4-1-2-0 | primaire | consulté le 13/09/2026 | confirme : la refonte de l'économie et des liens forts/faibles apportée par *Trailblazers – Update 3* (30 avril 2025), et le principe officiel d'héritage de l'économie selon le type de corps céleste | ne confirme pas : le barème communautaire précis des coûts en Points de Construction
- https://www.elitedangerous.com/update-notes/4-1-2-102 | primaire | consulté le 13/09/2026 | confirme : *Trailblazers – Update 3.3* (4 juin 2025), le niveau technologique minimal de 35 pour qu'un chantier naval soit en ligne, et la réécriture des conditions d'activation des services de station selon liens et niveau technologique | ne confirme pas : le détail des quinze services par type de station (voir [31-pilotage-navigation-et-stations.md §4](./31-pilotage-navigation-et-stations.md#4-types-de-stations-tailles-de-pad-et-services))
- https://www.elitedangerous.com/update-notes | primaire | consulté le 13/09/2026 | confirme : l'existence et la liste chronologique des notes de version officielles citées dans ce guide | ne confirme pas : un contenu spécifique — page d'index seulement
- https://www.elitedangerous.com/news | primaire | consulté le 13/09/2026 | confirme : l'existence du fil d'actualités officiel dont proviennent les articles cités ci-dessous | ne confirme pas : un contenu spécifique — page d'index seulement
- https://www.elitedangerous.com/news/system-colonisation-guide | primaire | consulté le 13/09/2026 | confirme : la publication de l'article officiel « System Colonisation Guide » le 28 février 2025 | ne confirme pas : les mécaniques communautaires fines ajoutées ensuite (liens forts/faibles, coûts en CP)
- https://www.elitedangerous.com/news/system-colonisation-claim-pause | primaire | consulté le 13/09/2026 | confirme : la suspension temporaire du contact de colonisation (« Claim Pause ») fin février/début mars 2025, après plus de 8 000 systèmes et 13 000 installations complétés en quelques jours de Bêta | ne confirme pas : un décompte exact au-delà de cet ordre de grandeur
- https://www.elitedangerous.com/news/system-colonisation-unpaused | primaire | consulté le 13/09/2026 | confirme : la réactivation du contact (« Unpaused ») quelques jours après la pause | ne confirme pas : une date exacte de réactivation, non précisée par l'article
- https://en.wikipedia.org/wiki/Elite_Dangerous | secondaire | consulté le 13/09/2026 | confirme : le contexte général du jeu et recoupe les dates clés (annonce du 20 octobre 2024, calendrier des mises à jour) | ne confirme pas : les mécaniques de colonisation elles-mêmes, absentes de l'article
- https://raw.githubusercontent.com/MikeCZ23/CCCL/main/MegaGuide-Colonisation.pdf | secondaire | consulté le 13/09/2026 | confirme : la quasi-totalité des valeurs chiffrées communautaires du guide (portée de 15 al, coût de 25 M Cr, répartition des factions héritées 60/20/13/6 %, coûts en Points de Construction par palier, forces des liens forts/faibles, tonnages d'exemple, remise Cutter de 30 %, techniques de Fleet Carrier et de metahauling) | ne confirme pas : les corrections apportées par le Dodec Update de novembre 2025 — le document s'arrête à juin 2025
- https://github.com/MikeCZ23/CCCL | secondaire | consulté le 13/09/2026 | confirme : l'existence du dépôt et du projet CCCL (auteur CMDR Mechan et contributeurs, licence CC BY-SA 4.0) portant le mega-guide | ne confirme pas : un contenu chiffré en propre — page de dépôt, pas le document lui-même (voir l'entrée du PDF ci-dessus)
- https://github.com/aussig/BGS-Tally | secondaire | consulté le 13/09/2026 | confirme : l'existence et le rôle de l'outil communautaire BGS-Tally (suivi du BGS, de la Colonisation et du Powerplay), cité dans [Outils communautaires](#outils-communautaires-de-planification-de-colonisation) | ne confirme pas : des données chiffrées de colonisation en propre — outil de suivi local, pas une base de données publiée
- https://github.com/EDCD/coriolis-data | primaire | consulté le 13/09/2026 | confirme : les emplacements internes et les capacités de fret utilisées dans la section [Logistique de transport](#logistique-de-transport-capacité-utile-et-fleet-carrier-comme-dépôt-avancé) pour le Type-9 Heavy, le Type-8 Transporter et l'Imperial Cutter | ne confirme pas : le prix d'achat ou le rang requis pour ces vaisseaux (voir [03-vaisseaux.md](./03-vaisseaux.md), source unique des prix)
