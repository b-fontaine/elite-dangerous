# Guide complet de l'équipement à pied dans Elite Dangerous (Odyssey)

> **Voir aussi** : ce guide se concentre sur l'équipement individuel (combinaisons, armes, outils, ingénierie). Pour le
> déroulement des missions et des raids de settlements eux-mêmes, voir [09-combat-a-pied.md](./09-combat-a-pied.md) et
> [13-operations.md](./13-operations.md) ; pour l'exobiologie approfondie (espèces, rangs), voir
> [10-exploration.md](./10-exploration.md) ; pour l'ingénierie des vaisseaux (mécanique générale, matériaux), voir
> [06-ingenieurs.md](./06-ingenieurs.md) ; pour toute date contestée dans ce document, la source d'arbitrage est
> [00-chronologie-canonique.md](./00-chronologie-canonique.md).

## Vue d'ensemble du gameplay à pied

Odyssey, sorti le **19 mai 2021** sur PC, a introduit pour la première fois dans Elite Dangerous la possibilité de
sortir de son vaisseau en combinaison spatiale et de se déplacer à pied : flottaison en apesanteur, propulsion via les
micro-propulseurs de la combinaison, marche magnétique sur la coque des vaisseaux, et exploration de stations,
avant-postes et installations planétaires à l'échelle humaine.

À pied, le commandant gère un jeu de ressources propre à la combinaison, distinct de celui du vaisseau :

- **Santé** — jauge de points de vie, régénérée par le repos ou soignée avec des consommables.
- **Oxygène** — réserve d'air de la combinaison, consommée en continu et plus rapidement à l'effort (sprint, saut
  assisté) ou en cas de brèche.
- **Énergie de combinaison (batterie)** — alimente le bouclier personnel, les outils et les capacités de mobilité
  (jetpack, sprint) ; elle se recharge automatiquement mais peut être vidée par un usage intensif des outils ou par les
  dégâts.

Cet équipement à pied sert quatre grandes familles d'activités :

- **Combat / mercenariat** — raids de colonies et de settlements, zones de conflit à pied (CZ, voir
  [glossaire](./00-glossaire.md)), missions d'assassinat ou de récupération armée.
- **Exploration / exobiologie** — échantillonnage de formes de vie extraterrestres sur les corps planétaires.
- **Infiltration / piratage** — vol de données, sabotage, missions furtives dans des installations gardées.
- **Vie sociale et logistique** — interactions dans les concourses de stations, achats auprès des vendeurs à pied
  (Pioneer Supplies, Vista Genomics, comptoirs de matériaux), missions à pied.

### Point de vigilance chronologique : la fonctionnalité « Operations »

Plusieurs guides de ce corpus (dont une version antérieure de celui-ci) évoquaient une nouvelle fonctionnalité
multijoueur baptisée **« Operations »**, censée combiner pour la première fois combat spatial, combat à pied et SRV
dans une même instance de raid. Le problème : les dates avancées d'un guide à l'autre sont mutuellement exclusives —
« fin juin 2024 » selon [09-combat-a-pied.md](./09-combat-a-pied.md), « détails préliminaires début novembre 2025,
précisions en janvier 2026, lancement début 2026 » selon une version antérieure de ce guide, et « confirmation le
27 mai 2026 pour un lancement le 30 juin 2026, effectif le 1ᵉʳ juillet 2026 après un jour de report » selon
[14-rhino-nomad.md](./14-rhino-nomad.md).

Un audit croisé mené sur l'ensemble du corpus (détails complets dans
[00-chronologie-canonique.md](./00-chronologie-canonique.md#3-mode-operations)) n'a trouvé, dans les sources
vérifiables consultées (article Wikipédia sur *Elite Dangerous*, article Wikipédia sur *Elite Dangerous: Odyssey*,
agrégateur GalNet d'Inara.cz), **aucune confirmation fiable de l'existence d'un tel mode**, à l'une ou l'autre de ces
dates. Il s'agit très probablement d'une entrée non fondée introduite dans le corpus communautaire plutôt que d'une
simple confusion entre deux évènements réels distincts — les tentatives d'accès direct à elitedangerous.com/news et aux
forums officiels Frontier ayant par ailleurs été bloquées (erreurs HTTP 403) pendant la vérification, sans qu'une
source alternative fiable ne vienne trancher.

**Ne confondez pas cette fonctionnalité disputée avec le mot « Opérations »** employé dans
[13-operations.md](./13-operations.md), qui désigne plus largement l'ensemble générique du gameplay au sol
(settlements, missions, zones de conflit) introduit dès le lancement d'Odyssey en 2021 — ce sens-là est, lui, bien
établi et ne pose aucun problème de datation. Si une confirmation officielle de la fonctionnalité « Operations »
apparaît (patch notes elitedangerous.com, billet GalNet), merci de mettre à jour cette section ainsi que
[00-chronologie-canonique.md](./00-chronologie-canonique.md) en conséquence plutôt que de réintroduire l'une des dates
contradictoires ci-dessus.

## Les combinaisons (Suits)

Quatre types de combinaisons sont disponibles. Chacune peut ensuite être personnalisée par des modifications
d'ingénierie (voir plus loin) et achetée à différents **grades**.

| Combinaison              | Rôle principal                       | Points forts                                                                                                                    | Points faibles                                                           | Équipement de départ                  |
|--------------------------|--------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|---------------------------------------|
| **Flight Suit**          | Combinaison de base, point de départ | Aucune spécialisation, universelle                                                                                              | Pas de bonus particulier                                                 | Aucun outil/arme dédié                |
| **Artemis** ("Bio Suit") | Exploration / exobiologie            | Bonnes réserves d'oxygène et d'énergie ; conçue pour de longues sessions de scan                                                | Moins résistante et moins adaptée au pillage/scavenging que la Dominator | Genetic Sampler intégré               |
| **Maverick**             | Polyvalence / infiltration           | Grande capacité de sac à dos, bonne discrétion, adaptée à un usage « à tout faire » y compris les raids de factions/settlements | Moins spécialisée que Dominator ou Artemis sur leurs domaines respectifs | Découpeur plasma (Arc Cutter) intégré |
| **Dominator**            | Combat lourd                         | Deux emplacements d'armes principales, bouclier personnel à régénération renforcée, meilleure endurance au combat               | Moins de rangement (sac à dos réduit)                                    | —                                     |

### Flight Suit

C'est la combinaison par défaut de tout commandant : basique, sans bonus ni outil dédié. Elle sert surtout de point de
départ avant d'investir dans une combinaison spécialisée.

### Artemis (Bio Suit)

Orientée exploration et **exobiologie**, l'Artemis est livrée d'origine avec le **Genetic Sampler**. Elle offre une
autonomie en oxygène et une gestion énergétique supérieures aux autres combinaisons, pensées pour de longues marches de
prospection. Elle est en revanche moins résistante et moins adaptée au pillage que la Dominator. Pour la mécanique de
scan complète et le détail des espèces, voir [10-exploration.md](./10-exploration.md).

Build recommandé par la communauté : « Artemis Bio Suit » avec **Night Vision**, **Improved Jump Assist** et **Increased
Sprint Duration**, pour couvrir rapidement de grandes zones à la recherche de faune et de flore.

### Maverick

Combinaison **polyvalente**, souvent recommandée pour débuter. Équipée par défaut d'un découpeur plasma (Arc Cutter)
utile pour l'infiltration et le sabotage, elle offre une grande capacité de sac à dos et une discrétion supérieure. Elle
est décrite par la communauté comme la mieux adaptée aux missions de raid de factions et de settlements grâce à sa
capacité d'emport.

Builds recommandés :

- **Maverick General Purpose** — Increased Sprint Duration, Extra Backpack Capacity, Improved Battery Capacity,
  Increased Air Reserves : un profil généraliste solide.
- **Maverick Farming Suit** — Reduced Tool Battery Consumption, pour prolonger les sessions de récolte de matériaux.
- **Maverick Infiltration Suit** — Night Vision, Increased Sprint Duration, Improved Jump Assist, Extra Backpack
  Capacity : jugée la meilleure configuration pour la furtivité.

### Dominator

Combinaison de **combat lourd**, avec deux emplacements pour armes principales et un bouclier personnel à régénération
rapide, au prix d'une capacité de rangement réduite.

Builds recommandés :

- **Dominator General Combat Suit** — Faster Shield Regen, Extra Ammo Capacity, mobilité améliorée.
- **Dominator War Suit** — Night Vision et capacité de munitions accrue, pour tenir des zones de conflit prolongées.

### Grades des combinaisons et des armes

Suits et armes peuvent chacun être améliorés sur **cinq niveaux de grade**, achetés directement contre des crédits
auprès des vendeurs **Pioneer Supplies**, présents dans les concourses de la plupart des stations — une mécanique
distincte de l'ingénierie (voir plus loin), puisqu'il s'agit d'un simple achat plutôt que d'une modification appliquée
par un Engineer. Le prix augmente avec le grade et le type d'équipement ; consultez le vendeur Pioneer Supplies local ou
une base de données à jour (Inara, wiki communautaire) pour les tarifs exacts en vigueur (*instantané non disponible* :
ces tarifs n'ont pas pu être vérifiés auprès d'une source primaire accessible au moment de la rédaction).

Deux précisions utiles :

- Le grade de la combinaison n'a **aucune incidence sur la qualité des scans d'exobiologie** — un grade 1 suffit pour
  cette activité.
- Il est possible de trouver dans le monde des combinaisons ou armes **déjà pré-améliorées** (grade 2 ou 3 appliqué)
  plutôt que de payer soi-même la montée en grade, notamment via des drops ou des récompenses de mission.

## Les armes à pied

### Catégories et fabricants

Les armes à pied se répartissent en plusieurs catégories : **pistolets, mitraillettes (SMG), fusils à pompe,
lance-roquettes, grenades**, ainsi qu'un système d'attaque à mains nues.

Trois fabricants se partagent le catalogue, chacun avec ses propres recettes d'ingénierie (matériaux distincts par
fabricant, confirmé par les pages Engineer du wiki communautaire) :

- **Kinematic Armaments**
- **Manticore**
- **Takada**

Chaque commandant reçoit une arme de poing par défaut en descendant à pied — l'équivalent, pour le combat au sol, du
vaisseau de départ Sidewinder. Les lance-roquettes et les grenades sont les munitions les plus efficaces contre le
blindage et les véhicules ; il est également possible de partager munitions et armes entre coéquipiers au sol.

### Catalogue d'armes nommées par fabricant

Le tableau ci-dessous ne référence que les modèles pour lesquels une source vérifiable a pu être retrouvée pendant la
rédaction de ce guide ; il ne prétend pas à l'exhaustivité (voir la note en dessous pour Kinematic Armaments).

| Fabricant                | Arme                | Type                          | Dégâts    | Rôle typique                                                             | Source                                                     |
|--------------------------|---------------------|-------------------------------|-----------|---------------------------------------------------------------------------|-------------------------------------------------------------|
| Manticore                | **Terminator**      | Fusil polyvalent              | Plasma    | Combat généraliste ; dégâts égaux contre boucliers et blindage           | gamerant.com (guide de builds)                              |
| Manticore                | **Executioner**     | Fusil de précision (sniper)   | Plasma    | Élimination discrète à distance, dégâts à la tête                       | gamerant.com (guide de builds)                              |
| Takada                   | **Karma P-15**      | Pistolet                      | Cinétique | Polyvalent ; particulièrement efficace contre des PNJ sans bouclier/blindage | gamerant.com (guide de builds)                          |
| Kinematic Armaments      | *non confirmé*      | *non confirmé*                | *non confirmé* | Fabricant confirmé comme catégorie de matériaux d'ingénierie distincte (voir la section Engineers), mais aucun modèle nommé n'a pu être identifié via les sources consultées | edfieldmanual.com (page Uma Laszlo, matériaux par fabricant) |

**Limite de recherche** : contrairement à Manticore et Takada, aucune source accessible pendant la rédaction (recherche
web + wikis communautaires) n'a permis d'attribuer un nom d'arme précis à Kinematic Armaments — seule son existence en
tant que fabricant (matériaux d'ingénierie propres) a pu être confirmée. Pour le catalogue exhaustif et à jour de tous
les modèles par fabricant, avec leurs statistiques précises, consultez Inara ou le wiki communautaire Elite Dangerous.
*Instantané de cette recherche : 9 septembre 2026.*

### Pas d'arme de mêlée dédiée

Il n'existe pas d'arme de corps-à-corps à proprement parler : le combat rapproché se fait via une **attaque à mains
nues**, disponible quel que soit le loadout équipé. Cette mécanique reste améliorable par ingénierie : la modification
de combinaison **Added Melee Damage** (proposée par Jude Navarro et Kit Fowler) « augmente fortement les dégâts des
coups de poing et des attaques de corps-à-corps à l'arme », confirmant que le mêlée est un système à mains nues/à crosse
d'arme et non une arme séparée.

### Exemples de builds nommés

| Build                                | Arme de base            | Usage                                   | Modifications typiques                                                          |
|--------------------------------------|--------------------------|------------------------------------------|-----------------------------------------------------------------------------------|
| **Manticore Terminator**             | Fusil plasma polyvalent | Combat généraliste                      | Vitesse de rechargement, portée, précision, capacité du chargeur                |
| **Manticore Executioner**            | Fusil plasma sniper     | Élimination discrète à distance         | Dégâts à la tête, portée, suppression du bruit                                  |
| **Karma P15 Infiltrator**            | Pistolet cinétique      | Infiltration silencieuse                | Masquage audio + suppresseur, pour neutraliser des PNJ sans déclencher l'alarme |
| **Karma P15 Warfighter**             | Pistolet cinétique      | Achever des ennemis sans bouclier       | Visée rapide, portée, chargeur agrandi                                          |
| **Manticore Executioner Warfighter** | Fusil plasma sniper     | Zones de conflit à haut dégât           | Build offensif dédié aux CZ                                                      |
| **Lance-roquettes Warfighter**       | Lance-roquettes         | Dégâts de zone contre groupes d'ennemis | Portée, capacité de chargeur, rechargement en étui                              |

Pour une liste exhaustive de tous les modèles disponibles par fabricant, référez-vous à une base de données
communautaire à jour (Inara, wiki Elite Dangerous) — le catalogue complet évolue et n'est pas repris intégralement ici.

## Les outils à pied

Les outils sont équipés dans l'emplacement dédié de la combinaison et consomment de l'énergie à l'usage. Le plus
documenté et le mieux maîtrisé par la communauté est le Genetic Sampler ; les autres remplissent des rôles
complémentaires de reconnaissance, de piratage et d'accès forcé, résumés ci-dessous à partir de leur fonction
généralement admise dans le jeu — pour les statistiques précises (portée, consommation de batterie), consultez Inara.cn
ou le wiki communautaire Elite Dangerous.

### Genetic Sampler (échantillonneur génétique)

Outil central de l' **exobiologie**, livré par défaut avec la combinaison Artemis et activable par défaut avec la touche
**5**. Fonctionnement en deux temps :

1. Une **impulsion de détection** (scan pulse) colore les organismes détectés :
    - **bleu** — organisme génétiquement trop proche (même colonie clonale) : à éviter pour un nouvel échantillon ;
    - **vert** — même espèce mais diversité génétique suffisante : échantillon valide ;
    - **violet** — espèce différente.
2. Le Codex indique une **distance de colonie clonale** à respecter entre deux prélèvements, variable selon le type
   d'organisme (courte pour les touffes/buissons, plus longue pour les colonies bactériennes).

Il faut prélever **trois échantillons partiels** de la même espèce, suffisamment espacés géographiquement, pour obtenir
un échantillon complet. Prélever un échantillon d'une espèce différente en cours de route **réinitialise la
progression** de l'échantillon partiel en cours. Le grade de la combinaison Artemis n'a aucune incidence sur la qualité
du scan.

Pour repérer les zones biologiques avant d'atterrir, on utilise en complément le **Detailed Surface Scanner (DSS)** et
le **FSS** du vaisseau (des outils de scan spatial, pas des outils à pied). Le détail complet des espèces, rangs
d'exobiologiste et primes de première découverte est traité dans [10-exploration.md](./10-exploration.md) ; ce guide-ci
ne résume que la mécanique de l'outil lui-même.

Vente des échantillons aux comptoirs **Vista Genomics** dans les stations : de 50 000 à 1 000 000 Cr par échantillon
selon la rareté, avec une **prime doublée pour la première découverte** *(fourchette de prix instantanée capturée le
9 septembre 2026 — à revérifier sur Inara ou en jeu, ces valeurs pouvant évoluer avec les mises à jour économiques)*.
Selon un guide communautaire de 2025, une session sur deux planètes comportant huit espèces peut rapporter jusqu'à
environ 250 millions de crédits en deux heures grâce aux primes de première découverte, en particulier à plus de
1 500 années-lumière des zones peuplées où la faune découverte est plus susceptible d'être une première mondiale — ce
chiffre reste une estimation communautaire ponctuelle, pas une moyenne garantie.

### Arc Cutter (découpeur plasma)

Livré par défaut avec la combinaison Maverick, il sert à découper des points d'accès, panneaux et portes verrouillées
par la force plutôt que par le piratage électronique — une alternative « brute » au Compact Multi-Tool, utile notamment
lorsque le piratage n'est pas souhaitable ou possible.

### Wave Scanner

Outil de reconnaissance à courte/moyenne portée : il émet une impulsion qui révèle sur le HUD les points d'intérêt
proches à l'intérieur d'une installation (terminaux, générateurs, personnel, conteneurs), permettant de repérer des
objectifs avant de s'en approcher.

### Profile Analyser

Utilisé sur les points d'accès électroniques (terminaux, panneaux de sécurité, ports de données) pour en analyser le
profil avant de tenter un piratage avec le Compact Multi-Tool — une étape de reconnaissance qui facilite ou sécurise la
tentative de bypass qui suit.

### Compact Multi-Tool

L'outil de piratage proprement dit, utilisé sur les panneaux d'accès et terminaux pour contourner leur sécurité
électronique (via un mini-jeu chronométré) et ainsi débloquer des portes, coffres ou données.

### E-Break (outil de forçage d'urgence)

Outil de secours permettant de forcer l'ouverture d'une porte ou d'un panneau lorsque l'installation est privée
d'alimentation (par exemple lors d'une infiltration en coupant le courant/« silent running »), dans les cas où le
piratage électronique normal via le Profile Analyser et le Compact Multi-Tool n'est plus possible.

### Modifications d'outils

| Outil                | Amélioration disponible                    | Effet documenté / attendu                                                                                  | Modification par un Engineer ?              |
|-----------------------|---------------------------------------------|---------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| **Wave Scanner**      | Montée en grade (achat Pioneer Supplies)    | Amélioration générale de la portée et/ou de la rapidité de détection des points d'intérêt                     | Non confirmée dans les sources consultées     |
| **Profile Analyser**  | Montée en grade (achat Pioneer Supplies)    | Amélioration de la portée et de la fiabilité d'analyse avant piratage                                          | Non confirmée dans les sources consultées     |
| **Compact Multi-Tool**| Montée en grade (achat Pioneer Supplies)    | Amélioration possible du temps ou de la marge de manœuvre du mini-jeu de piratage                              | Non confirmée dans les sources consultées     |
| **E-Break**           | Aucune montée en grade identifiée           | Outil de forçage de base ; aucune information de montée en grade ou de modification retrouvée                 | Non confirmée dans les sources consultées     |

**Limite de recherche** : à la différence des combinaisons et des armes (grades 1-5 achetés chez Pioneer Supplies,
puis modifications d'ingénierie chez les Engineers, voir la section suivante), la documentation communautaire
accessible pendant la rédaction de ce guide (edfieldmanual.com, starzen.space, gamingwithdaopa.ellatha.com — toutes
consultées le 9 septembre 2026) ne confirme ni l'existence de blueprints d'Engineer dédiés à ces quatre outils, ni le
détail exact de leurs paliers de grade. Si votre expérience en jeu diffère, ou si vous disposez d'une source à jour,
consultez et complétez ce tableau via Inara ou le wiki communautaire Elite Dangerous plutôt que de vous fier à des
valeurs non vérifiées.

## Les consommables

Le commandant à pied dispose d'objets consommables pour soutenir sa survie et son efficacité au combat, obtenus par
pillage, par achat, ou fabriqués sur le terrain via le système de **synthèse** (une variante à pied de la synthèse
embarquée des vaisseaux, à partir de matériaux collectés).

Catégories généralement disponibles :

- **Medkit** — soigne les points de vie du commandant.
- **Energy Cell** — recharge l'énergie de la combinaison (batterie/bouclier personnel).
- **Frag Grenade** — grenade à fragmentation, dégâts de zone contre l'infanterie.
- **EMP Grenade** — grenade électromagnétique, désactive temporairement boucliers et systèmes électroniques adverses
  (drones, tourelles, boucliers ennemis).

Pour les recettes de synthèse exactes (matériaux requis, quantités produites) et la liste complète des consommables
disponibles à un instant donné, consultez le wiki communautaire ou l'outil tiers **Elite Dangerous Odyssey Material
Helper (EDOMH)**, qui sert justement à planifier ces besoins en matériaux.

## L'ingénierie à pied (Engineering)

### Mécanique générale

- Les modifications s'appliquent **chez des Engineers physiques**, dans des starports : il faut sortir de son vaisseau
  et se rendre à leur emplacement, contrairement à l'ingénierie des vaisseaux qui se fait depuis le vaisseau (mécanique
  générale de l'ingénierie de vaisseau détaillée dans [06-ingenieurs.md](./06-ingenieurs.md)).
- **Une modification appliquée ne peut ni être retirée ni remplacée** : la planification du build est cruciale avant
  d'engager des matériaux.
- Les matériaux se répartissent en quatre catégories : **Chemicals, Circuits, Technology** (échangeables entre eux via
  les barmen des stations) et **Data** (non échangeable, obtenue uniquement via des missions ou des points de données
  in-game).
- La méthode principale de collecte de matériaux consiste à compléter des **missions** proposées aux terminaux à pied
  des stations — l'offre variant d'une station à l'autre, il est utile de vérifier plusieurs tablettes.
- Outil tiers recommandé par la communauté : **Elite Dangerous Odyssey Material Helper (EDOMH)**, pour suivre son
  inventaire de matériaux et planifier ses montées en grade.

### Les Engineers à pied

Neuf Engineers sont présents dans la bulle « Core », répartis en trois chaînes de déblocage (chaque Engineer débloque
l'accès au suivant), auxquels s'ajoutent quatre Engineers dans la région de Colonia. Ces derniers suivent une structure
de déblocage différente : Baltanos, Eleanor Bresa et Rosa Dayette fonctionnent chacun de façon indépendante, et c'est en
complétant **les trois** tâches de recommandation qu'ils proposent (livraison de matériaux/données spécifiques à chacun)
que l'accès à Yi Shen à Einheriar s'ouvre — il ne s'agit donc pas d'une chaîne séquentielle mais d'une convergence des
trois vers un seul déblocage commun.

| Engineer        | Système   | Groupe          | Position dans la chaîne           | Spécialités suit                                                                     | Spécialités arme                                           |
|------------------|-----------|-----------------|-------------------------------------|-----------------------------------------------------------------------------------------|---------------------------------------------------------------|
| Hero Ferrari    | Sirius    | Chaîne 1 (Core) | 1er                               | Increased Air Reserves, Increased Sprint Duration, Improved Jump Assist              | Noise Suppressor, Faster Handling                          |
| Wellington Beck | Jolapa    | Chaîne 1 (Core) | 2e                                | Extra Backpack Capacity, Improved Battery Capacity, Reduced Tool Battery Consumption | Greater Range, Scope                                       |
| Uma Laszlo      | Xuane     | Chaîne 1 (Core) | 3e                                | Damage Resistance, Faster Shield Regen                                               | Headshot Damage, Reload Speed, Stowed Reloading            |
| Jude Navarro    | Aurai     | Chaîne 2 (Core) | 1er                               | Added Melee Damage, Extra Ammo Capacity                                              | Reload Speed, Magazine Size                                |
| Terra Velasquez | Shou Xing | Chaîne 2 (Core) | 2e                                | Combat Movement Speed, Increased Air Reserves, Increased Sprint Duration             | Improved Hip Fire Accuracy, Noise Suppressor               |
| Oden Geiger     | Candiaei  | Chaîne 2 (Core) | 3e                                | Improved Battery Capacity, Enhanced Tracking, Night Vision                           | Scope, Stability                                            |
| Domino Green    | Orishis   | Chaîne 3 (Core) | 1er                               | Extra Backpack Capacity, Reduced Tool Battery Consumption, Enhanced Tracking         | Greater Range, Stability                                    |
| Kit Fowler      | Capoya    | Chaîne 3 (Core) | 2e                                | Faster Shield Regen, Added Melee Damage, Extra Ammo Capacity                         | Stowed Reloading, Magazine Size                             |
| Yarden Bond     | Bayan     | Chaîne 3 (Core) | 3e                                | Combat Movement Speed, Improved Jump Assist, Quieter Footsteps                       | Improved Hip Fire Accuracy, Audio Masking, Faster Handling  |
| Baltanos        | Deriso    | Colonia         | Convergent → Yi Shen              | —                                                                                        | —                                                             |
| Eleanor Bresa   | Desy      | Colonia         | Convergent → Yi Shen              | —                                                                                        | —                                                             |
| Rosa Dayette    | Kojeara   | Colonia         | Convergent → Yi Shen              | —                                                                                        | —                                                             |
| Yi Shen         | Einheriar | Colonia         | Débloqué par les trois précédents | —                                                                                        | —                                                             |

### Un « effet expérimental » à pied ? Précision méthodologique

Sur les vaisseaux, l'ingénierie des modules distingue un **effet primaire** (le blueprint gradué G1-G5) d'un **effet
expérimental** optionnel qui vient s'y ajouter (voir [06-ingenieurs.md](./06-ingenieurs.md)). Un audit de ce guide a
soulevé la question d'un mécanisme équivalent côté équipement à pied. Après vérification auprès des sources
communautaires accessibles (starzen.space, edfieldmanual.com), **aucune preuve d'un second emplacement d'effet
expérimental distinct n'a pu être établie pour les suits et les armes d'Odyssey** : le seul mécanisme confirmé est
qu'une combinaison ou une arme dispose d'un nombre de **emplacements de modification** (jusqu'à quatre selon le grade
de l'objet) dans lesquels on peut appliquer, une par une, les modifications listées dans les tables ci-dessous — sans
distinction primaire/expérimental. Les colonnes « Effet expérimental » ci-dessous sont donc conservées à titre
d'inventaire de vérification (elles indiquent « non applicable / non confirmé ») plutôt que remplies de valeurs
inventées ; si une source fiable vient confirmer l'existence d'un tel mécanisme, il faudra revenir compléter ces
tables.

### Modifications de combinaison (blueprints)

| Modification                     | Effet                                                                                   | Engineer(s) — source d'obtention                | Grade des matériaux                          | Effet expérimental        | Coût         |
|-----------------------------------|--------------------------------------------------------------------------------------------|----------------------------------------------------|-------------------------------------------------|-------------------------------|---------------|
| Damage Resistance                | −10 % de dégâts cinétiques, thermiques, plasma et explosifs (chacun)                    | Uma Laszlo (Xuane)                                 | Non détaillé par palier dans les sources consultées | Non confirmé (voir note ci-dessus) | 750 000 Cr   |
| Faster Shield Regen              | Environ +25 % de régénération du bouclier personnel                                     | Uma Laszlo (Xuane) / Kit Fowler (Capoya)           | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Extra Backpack Capacity          | Augmente la capacité d'inventaire et de consommables du sac à dos (Data/Component/Item) | Domino Green (Orishis) / Wellington Beck (Jolapa)  | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Improved Battery Capacity        | +50 % de capacité énergétique                                                           | Wellington Beck (Jolapa) / Oden Geiger (Candiaei)  | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Reduced Tool Battery Consumption | Réduit la consommation d'énergie des outils                                             | Domino Green (Orishis) / Wellington Beck (Jolapa)  | Non détaillé par palier                          | Non confirmé                    | 500 000 Cr   |
| Enhanced Tracking                | Augmente la portée et la vitesse du scan de base de la combinaison                      | Domino Green (Orishis) / Oden Geiger (Candiaei)    | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Night Vision                     | Ajoute la vision nocturne                                                               | Oden Geiger (Candiaei)                             | Non détaillé par palier                          | Non confirmé                    | 1 000 000 Cr |
| Added Melee Damage               | Augmente fortement les dégâts à mains nues et en corps-à-corps à l'arme                 | Jude Navarro (Aurai) / Kit Fowler (Capoya)         | Non détaillé par palier                          | Non confirmé                    | 500 000 Cr   |
| Extra Ammo Capacity              | +50 % de capacité de munitions                                                          | Jude Navarro (Aurai) / Kit Fowler (Capoya)         | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Combat Movement Speed            | Supprime le malus de vitesse en visée ADS                                               | Terra Velasquez (Shou Xing) / Yarden Bond (Bayan)  | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Increased Air Reserves           | Double les réserves d'oxygène d'urgence                                                 | Hero Ferrari (Sirius) / Terra Velasquez (Shou Xing)| Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Increased Sprint Duration        | Réduit la pénalité d'épuisement au sprint prolongé                                      | Hero Ferrari (Sirius) / Terra Velasquez (Shou Xing)| Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Improved Jump Assist             | Allonge la durée du saut assisté (jetpack)                                              | Hero Ferrari (Sirius) / Yarden Bond (Bayan)        | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Quieter Footsteps                | −50 % de portée audible des pas                                                         | Yarden Bond (Bayan)                                | Non détaillé par palier                          | Non confirmé                    | 1 000 000 Cr |

*Coûts capturés le 9 septembre 2026 sur les sources communautaires listées en fin de guide — à revérifier auprès du
Pioneer Supplies/Engineer local, ces montants pouvant être ajustés par Frontier au fil des patchs. La colonne « Grade
des matériaux » reste volontairement non chiffrée : aucune source accessible pendant la rédaction ne détaille de
palier G1-G5 par blueprint pour l'équipement à pied (contrairement aux modules de vaisseau) ; utilisez l'outil EDOMH
pour la liste précise des matériaux requis par modification.*

### Modifications d'armes (blueprints)

Les matériaux requis varient selon le fabricant de l'arme (Kinematic Armaments, Manticore ou Takada) — par exemple,
pour la modification Headshot Damage, Uma Laszlo demande des matériaux totalement différents selon que l'arme provient
de Kinematic Armaments (Weapon Test Data, Medical Records, Chemical Catalyst, RDX, Weapon Component), de Manticore
(Chemical Experiment Data, Blood Test Results, Ion Battery, Electromagnet, Micro Supercapacitor) ou de Takada
(Spectral Analysis Data, Biometric Data, Ion Battery, Optical Lens, Scrambler).

| Modification               | Effet                                                                          | Engineer(s) — source d'obtention                     | Grade des matériaux | Effet expérimental |
|------------------------------|-------------------------------------------------------------------------------|----------------------------------------------------------|-------------------------|-------------------------|
| Headshot Damage            | Augmente les dégâts aux tirs à la tête                                         | Uma Laszlo (Xuane)                                       | Non détaillé par palier | Non confirmé (voir note) |
| Greater Range               | Jusqu'à +50 % de portée effective                                              | Wellington Beck (Jolapa) / Domino Green (Orishis)        | Non détaillé par palier | Non confirmé            |
| Scope                       | Ajoute ou améliore une optique de visée                                        | Wellington Beck (Jolapa) / Oden Geiger (Candiaei)        | Non détaillé par palier | Non confirmé            |
| Improved Hip Fire Accuracy | Jusqu'à +45 % de précision en tir de hanche                                    | Terra Velasquez (Shou Xing) / Yarden Bond (Bayan)        | Non détaillé par palier | Non confirmé            |
| Stability                   | Jusqu'à +30 % de stabilité, réduit le recul                                    | Domino Green (Orishis) / Oden Geiger (Candiaei)          | Non détaillé par palier | Non confirmé            |
| Noise Suppressor            | Réduit le bruit en environnement pressurisé                                    | Hero Ferrari (Sirius) / Terra Velasquez (Shou Xing)      | Non détaillé par palier | Non confirmé            |
| Audio Masking               | Réduit le bruit en environnement non pressurisé — essentiel pour la discrétion | Yarden Bond (Bayan)                                       | Non détaillé par palier | Non confirmé            |
| Faster Handling             | Réduit le temps de dégainage/rangement, améliore la visée ADS                  | Hero Ferrari (Sirius) / Yarden Bond (Bayan)              | Non détaillé par palier | Non confirmé            |
| Reload Speed                | Réduit le temps de rechargement                                                | Uma Laszlo (Xuane) / Jude Navarro (Aurai)                | Non détaillé par palier | Non confirmé            |
| Stowed Reloading            | Recharge automatique quand l'arme est rangée                                   | Uma Laszlo (Xuane) / Kit Fowler (Capoya)                 | Non détaillé par palier | Non confirmé            |
| Magazine Size               | Augmente la capacité du chargeur                                               | Jude Navarro (Aurai) / Kit Fowler (Capoya)               | Non détaillé par palier | Non confirmé            |

Noise Suppressor et Audio Masking sont respectivement facturés autour de 1 000 000 Cr *(capturé le 9 septembre 2026)*,
cohérent avec le tarif des modifications de discrétion côté combinaison.

## Choisir son équipement selon le style de jeu

| Style de jeu                          | Combinaison                                        | Arme(s) recommandée(s)                                 | Modifications clés                                                                                                       |
|-----------------------------------------|-------------------------------------------------------|------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| **Combat**                            | Dominator (2 armes principales, bouclier renforcé) | Manticore Executioner / Terminator, ou lance-roquettes | Damage Resistance, Faster Shield Regen, Extra Ammo Capacity, Headshot Damage                                             |
| **Exploration / Exobiologie**         | Artemis (Genetic Sampler intégré)                  | Arme de secours uniquement                             | Night Vision, Improved Jump Assist, Increased Sprint Duration, Increased Air Reserves                                    |
| **Discrétion / Infiltration**         | Maverick (découpeur plasma intégré, bon rangement) | Karma P15 Infiltrator (silencieux)                     | Quieter Footsteps, Audio Masking, Night Vision, Increased Sprint Duration, Improved Jump Assist, Extra Backpack Capacity |
| **Polyvalent / Farming de matériaux** | Maverick                                           | Arme de poing par défaut                               | Reduced Tool Battery Consumption, pour prolonger les sessions de récolte                                                 |

### Combat

La **Dominator**, avec ses deux emplacements d'armes principales et son bouclier à régénération renforcée, est la
combinaison de référence pour les zones de conflit à pied et les raids de settlements. Elle s'associe bien à des armes à
haut dégâts (Manticore Executioner/Terminator, lance-roquettes) et à des modifications défensives (Damage Resistance,
Faster Shield Regen) et offensives (Extra Ammo Capacity, Headshot Damage). Pour le détail tactique du combat au sol
(couverture, détection, IA), voir [09-combat-a-pied.md](./09-combat-a-pied.md).

### Exploration et exobiologie

L' **Artemis**, avec son Genetic Sampler intégré, ses réserves d'oxygène et sa gestion énergétique supérieures, reste le
choix par défaut pour l'exobiologie. Les modifications Night Vision, Improved Jump Assist, Increased Sprint Duration et
Increased Air Reserves permettent de couvrir efficacement de vastes zones planétaires ; rappelons que le grade de la
combinaison n'affecte pas la qualité des scans.

### Discrétion et infiltration

La **Maverick**, combinée à une arme silencieuse comme le Karma P15 Infiltrator et à des modifications ciblées (Quieter
Footsteps, Audio Masking, Night Vision), forme le combo de référence identifié par la communauté pour l'infiltration :
bruit réduit, bonne capacité de sac à dos pour transporter du matériel, et mobilité accrue (Increased Sprint Duration,
Improved Jump Assist) pour se déplacer rapidement entre deux points sans être repéré.

### Polyvalent et farming de matériaux

La **Maverick** équipée de Reduced Tool Battery Consumption prolonge les sessions de récolte de matériaux (utilisation
intensive d'outils sans recharge fréquente), un profil adapté à qui veut préparer ses futures montées en grade
d'ingénierie.

## Mort et rebuy à pied

Contrairement à la perte d'un vaisseau, la mort à pied du commandant a été délibérément conçue par Frontier pour rester
à **faible conséquence** — mais elle n'est pas totalement gratuite. Voici ce qui est confirmé par la FAQ officielle
citée sur les forums communautaires et corroboré par plusieurs retours concordants :

- **Ce qui est perdu** : le contenu du **sac à dos** (backpack) au moment de la mort — matériaux, Data, Items et
  Components non encore transférés — est perdu. La règle est la même en cas de mort en SRV. Citation de la FAQ
  officielle relayée par la communauté : « Anything that is not in the locker on the ship, and in the backpack of the
  player, is lost upon the event of death. »
- **Ce qui est conservé** : tout ce qui a été rangé au préalable dans le **casier du vaisseau** (ship locker) est
  épargné, quel que soit l'endroit où le commandant meurt. D'où le conseil pratique : videz régulièrement votre sac à
  dos vers le casier du vaisseau avant une session de raid ou de CZ à risque, en particulier si vous transportez des
  échantillons d'exobiologie ou des matériaux rares non encore vendus/utilisés.
- **Écran de rebuy** : la mort à pied ouvre un écran de rebuy à l'interface repensée par rapport à celui des vaisseaux,
  mais fonctionnellement proche — un coût d'assurance est bien appliqué. Un fil de discussion officiel des forums
  Frontier evoque une conception « aussi peu pénalisante que possible » de la mort à pied, ce qui suggère un coût
  d'assurance modéré, mais **le montant exact appliqué aux combinaisons et armes équipées au moment du décès n'a pas pu
  être confirmé avec certitude** via les sources consultées pendant la rédaction (accès direct à
  forums.frontier.co.uk bloqué par une erreur HTTP 403, Reddit inaccessible depuis cet environnement). Vérifiez le
  montant affiché en jeu au moment du décès, ou consultez le wiki communautaire pour une valeur à jour.
- **Réapparition** : le commandant est réanimé au point de réapparition disponible le plus proche (souvent son propre
  vaisseau ou une station), sans perte de personnage ni de progression de rang.

*Section basée sur l'état des mécaniques constaté le 9 septembre 2026 ; le coût de rebuy à pied étant un paramètre que
Frontier peut ajuster au fil des patchs, revérifiez-le sur le wiki communautaire ou en jeu avant de vous y fier pour du
contenu à enjeu élevé (raid de settlement de haute valeur, transport de gros volumes de matériaux rares).*

## Actualités récentes touchant l'équipement à pied (2025-2026)

- **Trailblazers (26 février 2025)** — introduction de la **colonisation de systèmes** en bêta, impliquant la
  construction de settlements et donc un terrain d'action à pied élargi (voir
  [18-colonisation.md](./18-colonisation.md) pour le détail de cette mécanique ; date corrigée par rapport à une
  version antérieure de ce guide qui indiquait le 25 février — voir
  [00-chronologie-canonique.md](./00-chronologie-canonique.md#2-colonisation-de-systèmes--dates-bêta-et-sortie-complète)).
- **Caspian Explorer (2 décembre 2025, Update 1 le 11 décembre 2025)** — il s'agit avant tout d'un **vaisseau**
  d'exploration longue distance (Zorgon Peterson), pas d'un patch d'équipement à pied à proprement parler ; pour sa
  fiche technique, voir [03-vaisseaux.md](./03-vaisseaux.md). Certains guides du corpus (dont
  [09-combat-a-pied.md](./09-combat-a-pied.md)) associent cette période à un plafonnement de l'ingénierie de combat à
  pied et à une refonte du comportement des PNJ au sol ; cette association temporelle est reprise ici par cohérence
  avec 09, mais n'a pas pu être vérifiée directement dans les notes de patch officielles pendant la rédaction
  (elitedangerous.com bloqué par une erreur 403) — à confirmer sur les notes de mise à jour officielles si vous vous en
  servez pour du contenu compétitif. **Cette date remplace la mention erronée « janvier 2025 »** trouvée dans une
  version antérieure de ce corpus (voir
  [00-chronologie-canonique.md](./00-chronologie-canonique.md#5-caspian-explorer)).
- **Kestrel Mk II (très probablement le 24 février 2026 — confiance moyenne)** — chasseur léger (petite plateforme
  d'atterrissage), accompagné d'une refonte de l'audio de combat pertinente pour le combat à pied (repérage sonore des
  tirs et explosions à distance). Cette date, corroborée indirectement par un commit du dépôt technique EDCD/FDevIDs
  daté du 25 février 2026, **remplace la mention erronée « février 2025 »** (probable erreur de transcription d'une
  année) trouvée dans une version antérieure de ce corpus — voir le détail et le niveau de confiance dans
  [00-chronologie-canonique.md](./00-chronologie-canonique.md#6-kestrel-mk-ii--date-de-sortie). Voir aussi
  [14-rhino-nomad.md](./14-rhino-nomad.md) pour le contexte complet de cette période.
- **Véhicule terrestre « Rhino »** (SRV de minage de surface, sorti le 2 septembre 2026) — ajout lié au minage de
  surface plutôt qu'à l'équipement individuel à pied stricto sensu, mais pertinent pour le contexte du gameplay au sol ;
  voir [14-rhino-nomad.md](./14-rhino-nomad.md) et [20-minage.md](./20-minage.md).
- Mises à jour mineures (numérotation 4.0.x à 4.4.1.1) — ajustements d'interface à pied, option d'aide à la visée pour
  les contrôles à pied, corrections de bugs de caméra à pied ; pour le détail précis de chaque patch, consultez les
  notes de mise à jour officielles.
- **Fonctionnalité « Operations »** — voir l'encart « Point de vigilance chronologique » en tête de ce guide : son
  existence même n'a pas pu être confirmée par une source fiable, malgré trois dates différentes circulant dans le
  corpus communautaire.

## Ressources utiles pour aller plus loin

- **Pioneer Supplies** (en station) — achat et montée en grade des combinaisons et armes.
- **Vista Genomics** (en station) — vente des échantillons d'exobiologie.
- **Les Engineers à pied** (en station) — application des modifications d'ingénierie, irréversibles une fois posées.
- **Elite Dangerous Odyssey Material Helper (EDOMH)** — outil tiers pour suivre ses matériaux et planifier ses montées
  en grade et modifications.
- **Wiki communautaire et bases de données d'objets** (Inara, wiki Elite Dangerous) — pour le catalogue exhaustif des
  armes par fabricant et les valeurs numériques les plus à jour.

## Voir aussi

- [09-combat-a-pied.md](./09-combat-a-pied.md) — déroulement tactique du combat au sol (zones de conflit, IA, détection,
  mains nues), qui s'appuie directement sur l'équipement décrit ici.
- [13-operations.md](./13-operations.md) — le gameplay au sol générique (settlements, missions, piratage) au sens large
  du terme « Opérations », à ne pas confondre avec la fonctionnalité multijoueur disputée du même nom.
- [14-rhino-nomad.md](./14-rhino-nomad.md) — chronologie détaillée du Rhino, du Nomad et de la fonctionnalité
  « Operations » évoquée plus haut.
- [10-exploration.md](./10-exploration.md) — exobiologie approfondie (espèces, rangs, primes de première découverte).
- [06-ingenieurs.md](./06-ingenieurs.md) — mécanique générale de l'ingénierie (vaisseaux), grades, effets expérimentaux.
- [18-colonisation.md](./18-colonisation.md) — colonisation de systèmes et construction de settlements, contexte direct
  d'usage de l'équipement à pied depuis Trailblazers.
- [00-chronologie-canonique.md](./00-chronologie-canonique.md) — arbitrage de toutes les dates contestées citées dans ce
  guide.

## Sources

- https://massivelyop.com/2026/01/11/elite-dangerous-drops-preliminary-details-about-its-raid-like-multiplayer-operations-instances/
- https://massivelyop.com/2025/11/05/elite-dangerous-announces-a-paid-station-a-new-ship-and-multi-step-operation-missions/
- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://gamingwithdaopa.ellatha.com/elitedangerous/engineer/domino-green/
- https://gamingwithdaopa.ellatha.com/elitedangerous/
- https://edfieldmanual.com/
- https://edfieldmanual.com/wiki/Engineers
- https://edfieldmanual.com/wiki/Uma_Laszlo
- https://edfieldmanual.com/wiki/Hero_Ferrari
- https://edfieldmanual.com/wiki/Wellington_Beck
- https://edfieldmanual.com/wiki/Jude_Navarro
- https://edfieldmanual.com/wiki/Terra_Velasquez
- https://edfieldmanual.com/wiki/Oden_Geiger
- https://edfieldmanual.com/wiki/Kit_Fowler
- https://edfieldmanual.com/wiki/Yarden_Bond
- https://edfieldmanual.com/wiki/Category:Odyssey
- https://edfieldmanual.com/wiki/Dominator_Suit
- https://edfieldmanual.com/wiki/Pioneer_Supplies
- https://www.starzen.space/t/elite-dangerous-odyssey-all-suits-explained-artemis-maverick-dominator-guide/32431
- https://www.starzen.space/t/guide-on-foot-engineering-upgrading-elite-dangerous-odyssey/37839
- https://gamerant.com/elite-dangerous-best-personal-weapon-builds/
- https://gamerant.com/elite-dangerous-best-space-suit-builds/
- https://k224p24mgt.wordpress.com/2025/05/11/elite-dangerous-exobiology-guide-how-to-discover-alien-life-and-make-a-fortune/
- https://www.mmorpg.com/news/elite-dangerous-details-how-on-foot-weapons-will-work-in-upcoming-odyssey-expansion-2000121151
- https://www.pilot-gaming.com/exobiology-guide-elite-dangerous/
- https://gameplay.tips/guides/11223-elite-dangerous.html
- https://justabout.com/elite-dangerous/37867/tell-us-how-to-get-into-exobiology-reward
- https://steamcommunity.com/sharedfiles/filedetails/?id=2516179683
- https://www.edsm.net/en/
- https://www.pcgamesn.com/elite-dangerous
- https://canonn.science/
- https://www.magicgameworld.com/elite-dangerous-odyssey-what-happens-if-i-die-while-on-foot/ (mécanique de mort à pied)
- https://steamcommunity.com/app/359320/discussions/0/3039355912932616546/ (perte de matériaux / sac à dos à la mort)
- ./00-chronologie-canonique.md (arbitrage des dates Operations, Trailblazers, Caspian Explorer, Kestrel Mk II)
