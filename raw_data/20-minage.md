---
id: 20-minage
titre: "Le Minage (Mining) dans Elite Dangerous"
domaine: economie
entites: [Mining Laser, Abrasion Blaster, Pulse Wave Analyser, Seismic Charge Launcher, Sub-Surface Displacement Missile, Prospector Limpet Controller, Refinery, Type-11 Prospector, Rhino, Planetary Mining Deposit Scanner, Void Opals, EDTools.cc, Bertrandite, Painite, Platinum, Monazite, Alexandrite, Musgravite, Rhodplumsite, anneau glacé, anneau rocheux, anneau métallique, anneau riche en métaux]
mots_cles_en: [mining, laser mining, core mining, deep core mining, subsurface deposit, abrasion blaster, pulse wave analyser, seismic charge launcher, prospector limpet, hotspot, surface mining, Rhino SRV, void opals, painite, low temperature diamonds, ring type, icy ring, rocky ring, metallic ring, metal rich ring, pristine reserve, bertrandite, platinum, palladium, gold, silver, osmium, samarium, praseodymium, coltan, indite, gallite, uraninite, lepidolite, rutile, bauxite, cobalt, bromellite, monazite, musgravite, serendibite, rhodplumsite, benitoite, grandidierite, alexandrite, tritium]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-12
confiance_globale: haute
volatilite: haute
sources_primaires: ["Steam News Frontier (API ISteamNews, billets Frontier intégraux)", "EDCD/FDevIDs (outfitting.csv, commodity.csv, rings.csv, commit c356129)", "EDDiscovery/EliteDangerousCore (énumération RingClassEnum)", "EDSM (API bodies, FAQ Commodities)", "Inara.cz", "EDTools.cc", "pilotstradenetwork.com", "Guides et discussions Steam Community sur le minage (types d'anneau)"]
zones_incertaines: ["Frontier a publié les douze axes d'équilibrage du minage de surface sans aucune valeur chiffrée", "rôle fonctionnel exact du Sub-Surface Extraction Missile non confirmé par des notes de patch", "correctif « 9 → 12 fragments » du Rhino : ni numéro de version ni date publiés au 9 septembre 2026", "vaisseaux et classes de module permettant d'embarquer un Rhino, et existence d'un achat en crédits", "prix de vente, économies acheteuses et usages en ingénierie des treize marchandises de surface", "pourcentages de bonus Powerplay au minage (Torval, Kaine) et rendement PTN de 3,5 Md Cr par cycle, tous deux d'origine communautaire", "aucun système hotspot n'a pu être confirmé pour le Platine ni pour les Low Temperature Diamonds seuls", "section 4.5 : aucune source primaire Frontier ne publie la distribution des minéraux par type d'anneau ; les colonnes « technique » et « type d'anneau » sont une synthèse de guides de joueurs datés, non vérifiée en jeu", "section 4.5 : le type d'anneau reste non établi pour 16 des 63 marchandises Minerals et Metals, et aucune source ne publie de réserve minimale ni de rendement en tonnes par minéral"]
guides_lies: [2, 4, 11, 14, 16, 28, 31]
---
# Le Minage (Mining) dans Elite Dangerous

## En bref

Le minage (*mining*) extrait des minéraux d'astéroïdes en anneau planétaire ou, depuis le 2 septembre 2026, à la
surface des planètes. Trois techniques d'anneau coexistent : le **laser mining** (Mining Laser), le **minage de
gisements de subsurface** (Abrasion Blaster) et le **core mining**, le plus rentable — Pulse Wave Analyser,
Sub-Surface Displacement Missile puis Seismic Charge Launcher pour faire éclater un noyau qui libère des
dizaines de tonnes de Void Opals, Low Temperature Diamonds ou Alexandrite. Le jeu ne reconnaît que **quatre
types d'anneau** : glacé, rocheux, métallique, riche en métaux. La section 4.5 donne la correspondance minerai ×
technique × type d'anneau pour les 63 marchandises `Minerals` et `Metals` — la Bertrandite se mine au laser en
anneau métallique ou riche en métaux. Trente de ces lignes portent un type d'anneau ; les autres sont déclarées
non établies plutôt que comblées. Le **Type-11 Prospector** (29 septembre 2025) est le premier vaisseau dédié au
minage, le SRV **Rhino** (2 septembre 2026) ouvre le minage de surface. Un minage laser bien optimisé dépasse
100 M Cr/heure.

## Introduction au minage dans Elite Dangerous

Le **minage** (*mining*) est, avec le commerce, l'exploration et le combat, l'une des quatre boucles de gameplay
économiques fondamentales d'*Elite Dangerous* : il consiste à extraire des ressources minérales directement dans
l'espace (astéroïdes en anneau planétaire) ou, depuis septembre 2026, à la surface des astres, pour les revendre ou
les utiliser en ingénierie. Ce guide couvre les trois techniques de minage (laser, gisements de subsurface, minage de
noyau/profond), l'équipement dédié complet (armes minières, contrôleurs de limpets, raffinerie, scanners), les
hotspots et les outils de repérage — avec des exemples concrets de systèmes/anneaux et un mode d'emploi pas à pas des
outils communautaires —, la **quatrième technique** apparue le 2 septembre 2026, le **minage de surface planétaire**
en Rhino (sections 3.2 à 3.4), les rendements chiffrés et la revente, ainsi que les liens avec Powerplay.

> **Voir aussi.** Ce guide se concentre sur la boucle de minage proprement dite. Pour les mécaniques annexes qui
> l'alimentent ou la recoupent, voir : [Commerce](./11-commerce.md) (lien minage → revente, outils de routage),
> [Équipements](./04-equipements.md) (fiches techniques complètes de chaque arme et module cité ici),
> [Rhino et Nomad](./14-rhino.md) (chronologie et caractéristiques du Rhino, véhicule de minage de surface, et
> du Nomad, le ship-launched vessel d'exploration livré avec la mise à jour Operations),
> [Powerplay](./02-powerplay.md) (bonus de profits et mérites liés au minage) et [Outils](./16-outils.md)
> (écosystème EDSM/Inara/Spansh pour le suivi de marché).

## 1. Les trois techniques de minage d'astéroïdes

Les mécaniques de minage en anneau sont stables depuis l'extension *Beyond*/*Chapter Four* (2019) et reposent sur
trois techniques distinctes, de complexité et de rendement croissants, que l'on peut combiner sur un même astéroïde.
Le **minage de surface planétaire**, ajouté le 2 septembre 2026, est une boucle séparée : il ne se pratique pas en
anneau, n'utilise aucun des outils ci-dessous et ne produit pas les mêmes marchandises — voir la section 3.3.

| Technique                          | Type d'astéroïde ciblé                              | Outil principal                                                        | Complexité | Rendement typique |
|-------------------------------------|-------------------------------------------------------|----------------------------------------------------------------------------|------------|--------------------|
| **Laser mining**                    | N'importe quel astéroïde                               | Mining Laser (ou Mining Lance)                                            | Faible     | Modéré, mais rapide à mettre en œuvre |
| **Sub-surface deposit mining**      | Astéroïdes affichant des « cloques » de surface visibles | Abrasion Blaster                                                          | Moyenne    | Supérieur au laser par gisement, sans charge sismique |
| **Core mining / Deep core mining** | Astéroïdes « à noyau » (identifiés au Pulse Wave Analyser) | Pulse Wave Analyser + Sub-Surface Displacement Missile + Seismic Charge Launcher | Élevée     | Le plus haut rendement : dizaines de tonnes par noyau |

### 1.1 Le minage au laser (Laser Mining)

C'est la technique de base, utilisable sur **n'importe quel astéroïde**, sans prérequis de repérage particulier. Le
**Mining Laser** (taille 1-2, montage fixe ou tourelle — voir [Équipements §2.1](./04-equipements.md)) tire en
continu sur la surface pour détacher des fragments de minerai directement exploitables par des Collector Limpets.
Le rendement est modéré mais la mise en œuvre est rapide : c'est la méthode privilégiée pour le Painite, le Platine
et l'Osmium en anneaux métalliques.

Une variante avancée existe : la **Mining Lance**, récompense **Powerplay** de rating D (voir
[Équipements §2.1](./04-equipements.md), la section 6 de ce guide et
[Powerplay, « Modules exclusifs Powerplay »](./02-powerplay.md)).

### 1.2 Le minage de gisements de subsurface (Abrasion Blaster)

Certains astéroïdes affichent des « cloques » visibles en surface : des **gisements de subsurface**. Une fois
repérées (au Prospector Limpet ou à l'œil nu), l'**Abrasion Blaster** — arme minière dédiée, taille 1, montage fixe
ou tourelle — les fait exploser en une seule salve, libérant d'un coup plusieurs fragments à haute teneur. C'est plus
rapide que le laser seul, et cela ne nécessite pas de charge sismique.

### 1.3 Le minage de noyau / minage profond (Core Mining, Deep Core Mining)

Technique à plus haut rendement, réservée aux astéroïdes « à noyau ». La boucle complète :

1. Le **Pulse Wave Analyser** (module utilitaire — voir [Équipements §8](./04-equipements.md)) scanne l'astéroïde et
   révèle ses fissures internes.
2. Le **Sub-Surface Displacement Missile** (taille 1-2, fixe/tourelle) est tiré sur les fissures visibles pour faire
   monter la pression interne de l'astéroïde.
3. Une fois la pression suffisante, le **Seismic Charge Launcher** (taille 2, fixe/tourelle) largue une charge à
   retardement — il faut s'éloigner avant la détonation.
4. L'astéroïde se fissure entièrement, libérant un gros **« noyau » (motherlode)** que l'on finit de casser au laser
   ou à l'Abrasion Blaster, avant de tout collecter avec des Collector Limpets.

Un seul noyau peut livrer des dizaines de tonnes du minéral cible : Void Opals, Low Temperature Diamonds, Musgravite,
Serendibite, Alexandrite, Grandidierite, Benitoite, Rhodplumsite, Monazite. Le type d'anneau où chercher chacun
d'eux, et la technique applicable à chacune des 63 marchandises minières du jeu, sont donnés en **section 4.5**.

> **Point à vérifier avant usage stratégique.** [Équipements §2.5](./04-equipements.md) liste également un
> **Sub-Surface Extraction Missile** (fixe, taille 2, notation B, type de projectile « Seeker »). Son existence et
> ses caractéristiques techniques sont confirmées indépendamment par le registre officiel des identifiants de jeu
> (EDCD/FDevIDs, fichier `outfitting.csv`, entrée `Hpt_Human_Extraction_Fixed_Medium` — voir Sources) : il s'agit
> bien d'une arme minière distincte du Sub-Surface Displacement Missile, portant un identifiant numérique nettement
> plus récent que les armes de core mining historiques de 2019, ce qui suggère un ajout plus tardif au jeu. En
> revanche, sa mécanique fonctionnelle précise (rôle exact dans la boucle de core mining, complémentarité ou
> alternative au Displacement Missile) n'a pas pu être confirmée par un texte de notes de patch descriptif lors de
> la rédaction de ce guide — à vérifier directement en jeu avant de lui attribuer un rôle précis dans une stratégie
> de minage.

---

## 2. Équipement dédié au minage

### 2.1 Armes minières de vaisseau (hardpoints)

| Arme                                   | Montages         | Taille(s) | Obtention / particularité                                              |
|------------------------------------------|-------------------|-----------|------------------------------------------------------------------------|
| **Mining Laser**                        | Fixe / Tourelle   | 1–2       | Chantier naval standard — outil de base du laser mining                  |
| **Mining Lance**                        | —                 | 1 (D)     | Récompense **Powerplay** — variante avancée du Mining Laser              |
| **Abrasion Blaster**                    | Fixe / Tourelle   | 1         | Chantier naval standard — extraction des gisements de subsurface en une salve |
| **Sub-Surface Displacement Missile**    | Fixe / Tourelle   | 1–2       | Chantier naval standard — fait monter la pression dans les fissures d'un astéroïde à noyau |
| **Seismic Charge Launcher**             | Fixe / Tourelle   | 2         | Chantier naval standard — fait exploser le noyau une fois la pression suffisante |
| **Sub-Surface Extraction Missile**      | Fixe              | 2         | Notation B, type de projectile Seeker (confirmé EDCD/FDevIDs) — rôle fonctionnel exact non confirmé par notes de patch (voir 1.3) |

*(Source des classes/montages : voir [Équipements §2.1, §2.2 et §2.5](./04-equipements.md), qui reprend le
référentiel EDCD/FDevIDs, recoupé indépendamment lors de cette révision avec `outfitting.csv` — voir Sources.)*

### 2.2 Contrôleurs de limpets pour le minage (Prospector, Collector, Multi)

Les limpets sont des drones jetables lancés depuis un vaisseau ; chaque fonction nécessite un contrôleur dédié,
installé en emplacement interne de **classe impaire uniquement (1, 3, 5 ou 7)**.

| Contrôleur                            | Tailles       | Notations | Limpets actifs (classe 7, meilleure notation) | Fonction                                                                 |
|-----------------------------------------|---------------|-----------|--------------------------------------------------|---------------------------------------------------------------------------|
| **Prospector Limpet Controller**       | 1, 3, 5, 7    | A–E       | 8                                                 | Analyse la composition exacte (% de chaque minéral) d'un astéroïde/gisement avant de décider de le miner |
| **Collector Limpet Controller**        | 1, 3, 5, 7    | A–E       | 4                                                 | Collecte automatiquement les canisters et fragments éjectés, et les ramène en soute |
| **Mining Multi Limpet Controller**     | 3, 5, 7       | A–E       | jusqu'à 14 (classe 7)                             | Combine les fonctions Collector et Prospector dans un seul emplacement — pratique pour des configurations compactes |

Le **Prospector Limpet Controller** est l'outil transversal aux trois techniques : c'est lui qui, avant tout tir,
révèle la composition exacte de l'astéroïde et permet de décider s'il vaut la peine d'être miné pour le minéral visé.

### 2.3 Raffinerie embarquée (Refinery)

La **Refinery** est le module qui raffine le minerai brut collecté en cargo directement vendable. Pour du minage
sérieux, **2 à 3 emplacements dédiés à la raffinerie** sont recommandés (voir
[Commerce § 2.4](./11-commerce.md)) : plus la raffinerie dispose de « bacs » de raffinage simultanés, moins on risque
de devoir jeter du minerai brut faute de place pendant une session de minage intensive.

### 2.4 Scanners et détection : Pulse Wave Analyser, DSS, Planetary Mining Deposit Scanner

- **Pulse Wave Analyser** (utilitaire) — une fois sur zone, scanne un astéroïde à noyau et révèle ses fissures ;
  indispensable au core mining (voir 1.3).
- **Detailed Surface Scanner (DSS)** — repère les points chauds (*hotspots*) de ressources à l'échelle d'un système,
  en complément du FSS (voir section 4). Depuis le **2 septembre 2026**, le module a été « mis à jour pour détecter
  les Planetary Mining Locations sur les planètes » (notes de version *Rhino SRV Update*) : le même sondage sert donc
  désormais au repérage des sites de minage de surface (voir section 3.3).
- **Planetary Mining Deposit Scanner** — scanner embarqué sur le Rhino, qui localise les gisements exploitables à
  l'intérieur d'un site repéré au DSS (voir section 3.3).
- **SRV embarqué (Scarab)** : sur le SRV de base, un « wave scanner » intégré permet déjà de repérer ressources et
  épaves en **surface planétaire** — une mécanique distincte et plus rudimentaire que le scanner dédié du Rhino (voir
  section 3.3). Détail des trois catégories de signaux qu'il distingue (natural/vessel/artificial, aucune catégorie
  biologique) dans [14-rhino.md §5.3](./14-rhino.md#53-lecture-du-wave-scanner).

---

## 3. Vaisseaux et véhicules miniers dédiés

### 3.1 Le Type-11 Prospector (Lakon Spaceways), premier vaisseau entièrement dédié au minage

Annoncé le **9 septembre 2025**, initialement prévu pour le 23 septembre puis reporté (annonce du report confirmée
le **22 septembre**), le **Type-11 Prospector** est sorti effectivement le **29 septembre 2025** — dates confirmées
via l'API JSON officielle Steam News de Frontier (voir Sources), qui contient les billets d'annonce et de notes de
patch d'origine. C'est le **premier vaisseau spatial entièrement dédié au minage** de l'histoire du jeu (formulation
reprise du billet officiel Frontier lui-même), avec un lien thématique fort avec la colonisation de systèmes (voir
[15-roadmap.md](./15-roadmap.md)). Caractéristiques confirmées par les notes de patch et billets officiels Frontier :

- **8 points d'ancrage**, dont **4 exclusivement miniers** (un large, deux moyens, un petit), plus **4 emplacements
  utilitaires** standards pouvant recevoir toute arme de gabarit compatible (trois petits, un moyen) ;
- **12 emplacements internes optionnels** : deux de taille 1, un de taille 2, un de taille 3, un de taille 4, quatre
  de taille 5, trois de taille 6 ;
- **Mk II Mining Repeater** : nouvel outil de minage laser capable d'extraire davantage de fragments des astéroïdes,
  avec une chance d'extraire des fragments à plus haute densité ;
- **Mining Volley Repeater** : tire des projectiles conçus pour maximiser la quantité de fragments extraits d'un
  astéroïde, avec un rendement annoncé supérieur aux autres outils de minage — réservé au Type-11 Prospector au
  lancement en raison de sa charge thermique ;
- **Mk II Mining Multi Limpet Controller** : contrôleur multi-limpet minier de taille 5, capacité de limpets
  augmentée et vitesse des Collector Limpets améliorée.

Trois formules de vaisseau pré-équipé ont été proposées dès le lancement (29 septembre 2025), aux mêmes paliers Arx
que ceux repris un an plus tard pour le Rhino : **Standard** (16 520 Arx), **Stellar** (33 000 Arx) et **Galactic**
(60 000 Arx) — confirmé par les notes de patch officielles. Un bundle distinct et plus cher, publié un an plus tard
avec le Rhino, associe les deux véhicules : **Type-11 Prospector Galactic Mining Pack, 100 000 Arx** (voir
[Rhino et Nomad](./14-rhino.md)), ce qui souligne la filiation thématique entre les deux ajouts. Une
**Update 2** du **16 octobre 2025** a ajouté une protection anti « claim sniping » pour les claims de **colonisation**
de systèmes (verrou d'exclusivité temporaire pour l'architecte système et sa Squadron) — confirmé par les notes de
patch officielles ; voir aussi [15-roadmap.md](./15-roadmap.md).

### 3.2 Le Rhino (Vodel), SRV du minage de surface planétaire

Le corpus dispose d'un guide dédié à ce véhicule : **[Rhino et Nomad](./14-rhino.md)**. Pour éviter la
duplication, ce guide n'en donne que le résumé utile au mineur, établi directement sur les billets officiels Frontier
(« Beneath the Surface: Your First Look at the Rhino », 6 août 2026 14:19 UTC, et « Elite Dangerous | Rhino SRV
Update », 2 septembre 2026 11:20 UTC — voir Sources) :

- Le **Rhino**, fabriqué par **Vodel**, est un SRV à six roues (confirmé par une citation du directeur artistique de
  Frontier dans le billet de présentation), sorti le **2 septembre 2026** via la mise à jour officielle *Rhino SRV
  Update*, entièrement dédié au **minage planétaire de surface** — une boucle de gameplay distincte du minage
  d'astéroïdes classique, et la première apparition d'un nouveau SRV depuis le Scarab et le Scorpion.
- **Équipage de trois occupants** : « le cockpit du Rhino comporte aussi des sièges pour trois commandants »
  (6 août 2026), le billet du 2 septembre 2026 parlant de « multi-crew capability for up to three occupants ». Le
  reste du volume intérieur est occupé par le stockage des matières extraites et par l'équipement : contrairement au
  Nomad, le Rhino **n'offre aucun espace intérieur praticable** (6 août 2026).
- **Déploiement** : le Rhino est « le plus gros SRV qu'un commandant puisse déployer depuis son vaisseau » et il est
  trop volumineux pour passer par la trappe de soute qui sert au Scarab et au Scorpion ; il est **largué depuis la
  nouvelle soute à véhicule** (6 août 2026) — la même famille de modules, désignée « Vessel Hangar » en jeu, que
  celle qui déploie le Nomad. Frontier n'a pas publié, dans les billets consultés, la liste des vaisseaux ni les
  classes de module requises pour embarquer un Rhino : ce point reste à vérifier en jeu.
- **Trois équipements signature**, cités mot pour mot par les notes de version du 2 septembre 2026 :
  **Planetary Mining Deposit Scanner**, **Refinery** (raffinerie embarquée) et **Mining Rig Deployment Module**.
- **Prix Arx au lancement**, confirmés par les notes de version : Rhino Standard 16 520 Arx (Surface Mining Vehicle +
  Owners Club Decal), Rhino Stellar 33 000 Arx (+ peinture Excavation Yellow, Chase Ship Kit), Rhino Galactic
  60 000 Arx (+ combinaison cosmétique Motherlode Galactic Miner, Proximity Yellow Holo-Kit Pack, Deflection Ship Kit
  Pack), et bundle **Type-11 Prospector Galactic Mining Pack** à 100 000 Arx réunissant les deux véhicules. Les
  billets officiels ne mentionnent que ces formules en boutique Arx ; ils ne disent rien d'un achat en crédits au
  chantier naval — **absence de mention, et non refus explicite** : à vérifier en jeu ou lors d'une communication
  Frontier ultérieure.

### 3.3 La boucle de minage de surface planétaire (mise à jour du 2 septembre 2026)

Le minage de surface est une boucle **entièrement nouvelle**, introduite par la mise à jour du 2 septembre 2026 sous
l'intitulé « Surface Mining gameplay added ». Elle se joue au sol, en SRV, et ne partage ni ses outils ni ses
marchandises avec le minage d'astéroïdes des sections 1 et 2.

#### 3.3.1 Enchaînement des étapes du minage de surface : DSS, Deposit Scanner, foreuse

**Enchaînement des étapes**, tel que les notes de version du *Rhino SRV Update* (2 septembre 2026) le décrivent :

1. **Depuis le vaisseau** — le **Detailed Surface Scanner** a été mis à jour « pour détecter les Planetary Mining
   Locations sur les planètes ». Le module de sondage utilisé pour cartographier un corps sert donc désormais aussi à
   repérer les sites miniers exploitables au sol ; les notes de version ne mentionnent aucun autre moyen de les
   détecter depuis l'orbite.
2. **Sur zone, en Rhino** — le **Planetary Mining Deposit Scanner** localise les **Planetary Mining Deposits**. Le
   billet distingue en effet deux échelles, la *Location* et le *Deposit*, dont il règle séparément « tailles et
   quantités » ; il ne décrit pas explicitement la relation entre les deux.
3. **Extraction** — le **Mining Rig Deployment Module** déploie une foreuse (*rig*), et la **raffinerie** embarquée
   traite la matière extraite. Les notes de version nomment ces trois modules et règlent leurs statistiques, mais ne
   décrivent pas la manipulation en jeu : le détail des gestes (pose de la foreuse, durée, collecte) est à découvrir
   en jeu.

#### 3.3.2 Paramètres de la boucle de surface : douze axes d'équilibrage publiés sans aucune valeur

**Les paramètres de la boucle, et ce que Frontier n'a pas publié.** Les notes de version énumèrent explicitement les
axes de réglage de cette boucle, sous les intitulés « Initial balance pass on: » et « Adjusted the balance of: »,
**sans donner la moindre valeur chiffrée**. Le tableau ci-dessous reproduit ces axes tels que listés ; toute valeur
numérique serait une invention et n'a donc pas sa place ici.

| Axe de réglage cité par Frontier (2 septembre 2026)                       | Ce qu'il gouverne                                       | Valeur publiée ? |
|---------------------------------------------------------------------------|---------------------------------------------------------|------------------|
| *Deposit capacity per density level*                                      | Capacité d'un gisement selon son niveau de densité      | Non              |
| *Time to replenish a deposit*                                             | Délai de reconstitution d'un gisement épuisé            | Non              |
| *Commodity weighting for deposits*                                        | Pondération des marchandises tirées par gisement        | Non              |
| *Planetary Mining Deposits / Planetary Mining Location sizes and amounts* | Tailles et quantités de gisements et de sites miniers   | Non              |
| *Base mining time*                                                        | Temps de minage de base                                 | Non              |
| *Maximum amount of content mined*                                         | Quantité maximale extraite                              | Non              |
| *The % of a commodity unit within the mined content*                      | Part d'une unité de marchandise dans le contenu extrait | Non              |
| *Frequency of additional Microresources*                                  | Fréquence des microressources obtenues en plus          | Non              |
| *Efficiency recharge rates*                                               | Taux de recharge de l'efficacité                        | Non              |
| *Efficiency based on deposit density*                                     | Efficacité en fonction de la densité du gisement        | Non              |
| *Temperature affects on rig efficiency*                                   | Effet de la température sur l'efficacité des foreuses   | Non              |
| *Rhino Vessel stats* / *Rig stats*                                        | Statistiques du véhicule et des foreuses                | Non              |

Trois éléments de mécanique se déduisent des intitulés eux-mêmes — ce sont des lectures de la liste ci-dessus, pas des
affirmations de Frontier, et aucun chiffre ne les accompagne :

- la **densité d'un gisement** est une variable structurante : deux axes distincts s'y réfèrent, la capacité du
  gisement et l'efficacité de l'extraction ;
- l'**efficacité** se comporte comme une jauge, puisqu'elle a un « taux de recharge », et la **température** l'affecte
  — le choix du site de minage n'est donc pas neutre ;
- les gisements **se reconstituent**, puisqu'un « délai de reconstitution » est réglé : un site n'est pas consommé
  définitivement.

#### 3.3.3 Les treize nouvelles marchandises du minage de surface planétaire

**Les treize nouvelles marchandises.** Les notes de version listent, sous « Initial balance values for new
commodities », treize entrées. Frontier les qualifie explicitement de **commodities** (marchandises), et les
distingue des **microressources**, qui apparaissent « en plus » du contenu miné — les deux catégories coexistent donc
dans la boucle sans se confondre.

| Marchandise (nom officiel) | Nom français d'usage |
|----------------------------|----------------------|
| Bastnäsite                 | Bastnäsite           |
| Deuterium                  | Deutérium            |
| Diamond                    | Diamant              |
| Helium                     | Hélium               |
| Helium-3                   | Hélium-3             |
| Iridium                    | Iridium              |
| Magnesite                  | Magnésite            |
| Olivine                    | Olivine              |
| Periclase dunite           | Périclase dunite     |
| Quartz pyroxenite          | Quartz pyroxénite    |
| Ruby                       | Rubis                |
| Sapphire                   | Saphir               |
| Thortveitite               | Thortveitite         |

**Attention à un homonyme.** Le *Diamond* de cette liste est une marchandise nouvelle, distincte des **Low
Temperature Diamonds** extraits au core mining en anneau (voir section 1.3) : les deux entrées coexistent désormais
dans le jeu, et confondre l'une avec l'autre fausse toute recherche de prix.

Les billets officiels ne précisent ni les prix de vente, ni les stations ou économies acheteuses, ni un éventuel
usage en ingénierie de ces treize marchandises : ces points sont à établir en jeu ou via un outil de marché vivant
(voir section 4.2).

#### 3.3.4 Problème connu au lancement : le Rhino ne collecte que 9 fragments sur 12

**Problème connu au lancement.** Les notes de version du 2 septembre 2026 signalent, dans leur section « Known
Issues », que « le Rhino ne collecte que 9 morceaux (*chunks*) lors du minage de surface, ce nombre sera porté à
12 ». Le billet annonce l'intention de corriger « dès que possible » mais ne donne ni numéro de version ni date, et
le flux d'actualités officiel ne comporte aucune publication ultérieure au 9 septembre 2026, date de cette révision —
soit une semaine après le lancement. **À vérifier en jeu** pour savoir si le passage de 9 à 12 est déjà déployé. Deux
autres problèmes connus, sans rapport direct avec le minage, sont signalés dans le même billet : l'opération
*Under Siege* peut se terminer prématurément, et l'interface de wing à pied est absente.

### 3.4 Portée du rééquilibrage du 2 septembre 2026 : ce que les notes de version disent, et ce qu'elles ne disent pas

Une révision antérieure de ce guide présentait le rééquilibrage du 2 septembre 2026 comme portant sur des
« paramètres globaux du minage d'astéroïdes ». **Les notes de version ne l'établissent pas** : dans le billet, la
liste « Adjusted the balance of: » est imbriquée sous l'entrée « Added Vodel's Rhino SRV », aux côtés des trois
modules du véhicule, et elle se termine par « Rhino Vessel stats » et « Rig stats ». Tout indique donc un
rééquilibrage de la **boucle de surface**, et rien dans le billet n'affirme que le minage d'astéroïdes en anneau soit
touché.

La formulation prudente à retenir : les intitulés cités (temps de minage de base, quantité maximale extraite, taux de
recharge d'efficacité) emploient un vocabulaire qui pourrait recouvrir des mécaniques partagées, mais Frontier n'a ni
publié de valeurs ni délimité le périmètre. Les rendements chiffrés de minage d'astéroïdes cités plus bas restent à
traiter comme des **ordres de grandeur** — pour la raison ordinaire, à savoir la volatilité des prix de marché, et
non parce qu'un rééquilibrage documenté les aurait invalidés.

---

## 4. Hotspots et outils de repérage

### 4.1 Repérage des hotspots en jeu : FSS, Detailed Surface Scanner, Pulse Wave Analyser

- Le **FSS** (Full Spectrum Scanner) repère les signaux d'anneaux depuis le système, avant même de s'y rendre.
- Le **Detailed Surface Scanner (DSS)** cartographie les corps du système et peut révéler des points d'intérêt liés
  au minage — dont, depuis le 2 septembre 2026, les **Planetary Mining Locations** à la surface des planètes, point
  d'entrée du minage de surface (voir 3.3).
- Le **Pulse Wave Analyser**, une fois sur l'astéroïde ciblé, révèle ses fissures pour le core mining (voir 1.3).

Les outils communautaires décrits ci-dessous (EDTools.cc, Spansh Ring Finder) portent tous sur les **anneaux**. Ce
guide n'a identifié, au 9 septembre 2026 — soit une semaine après l'introduction du minage de surface —, aucun outil
communautaire indexant les Planetary Mining Locations : le repérage des sites de surface se fait donc, à cette date,
au DSS en jeu.

### 4.2 Outils communautaires spécialisés : EDTools.cc, Inara, EDSM, Spansh

**EDTools.cc** est l'outil de référence pour le repérage de hotspots et de prix de minage, avec deux fonctionnalités
principales, revérifiées directement sur le site lors de cette révision :

| Outil (EDTools.cc)     | Fonction                                                                                          | Minéraux couverts |
|--------------------------|----------------------------------------------------------------------------------------------------|--------------------|
| **Hotspot finder**       | Recherche de systèmes avec hotspots pour un minéral donné, filtrable par type d'anneau (Glacé/Rocheux/Métallique) et par statut (systèmes pristines uniquement, systèmes peuplés uniquement) | Alexandrite, Benitoite, Bromellite, Grandidierite, Low Temperature Diamond, Monazite, Musgravite, Void Opal, Painite, Platinum, Rhodplumsite, Serendibite, Tritium *(13 minéraux)* |
| **Miner's Tool**         | Liste des minéraux core/laser-minables avec prix de station, triable par Distance/Prix/Demande     | Platinum, Painite, Osmium, LT Diamonds, Rhodplumsite, Serendibite, Monazite, Musgravite, Grandidierite, Benitoite, Alexandrite, Void Opals *(12 minéraux)* |

EDTools.cc propose également un finder multi-minerais et un locator de missions de minage.

Pour la cartographie et le suivi de marché plus généraux, voir le guide dédié **[Outils](./16-outils.md)** :
**Inara.cz** (marché galactique, comparateur — nécessite une navigation côté client pour les pages de résultats de
prix), **EDSM** (cartographie et API de commodités) et **Spansh** (outils de routage, référence pour le calcul de
trajets). Ces trois outils sont documentés en détail dans [Outils](./16-outils.md) et dans
[Commerce § 4](./11-commerce.md) ; ce guide ne les résume ici que sous l'angle du minage, pour éviter de dupliquer un
contenu qui a sa place naturelle ailleurs dans le corpus.

### 4.3 Exemples concrets de systèmes et anneaux à hotspot connu (Borann, Paesia)

Le reste de cette section reste volontairement générique (techniques, outils) : voici, pour combler cette lacune,
**deux exemples concrets et nommés**, revérifiés en direct lors de cette révision via l'API brute d'EDSM
(`edsm.net/api-system-v1/bodies`) et via Inara.cz — plutôt que de reprendre sans vérification des noms de systèmes
issus de guides communautaires anciens.

**Méthodologie et limite honnête.** L'accès direct (sans navigateur, sans exécution JavaScript) aux pages de
résultats d'EDTools.cc/hotspot et de Spansh (Ring Finder) ne renvoie que le formulaire de recherche vide, ces outils
calculant leurs résultats côté client une fois la recherche lancée dans un vrai navigateur (confirmé lors de cette
révision — voir Sources). Il n'a donc **pas été possible de faire dire à ces outils, depuis cette session, quel
minéral précis est en hotspot sur quel anneau aujourd'hui**, ni combien de hotspots y sont actifs, ni le prix courant
en Cr/tonne — ces trois informations sont les plus volatiles de tout ce guide (elles dépendent des scans FSS/DSS
soumis par la communauté à EDDN, et des prix de marché du moment). Ce qui a pu être confirmé en direct, en revanche,
c'est l'**existence réelle des systèmes et anneaux cités ci-dessous, avec leur type d'anneau et leur niveau de
réserve** — cohérents avec leur réputation de longue date dans la communauté anglophone (guides YouTube/Reddit
répétés depuis la refonte du minage de 2019), réputation que ce guide rapporte donc comme telle, sans la présenter
comme revérifiée hotspot par hotspot cette semaine.

| Système     | Corps et anneau                                                                 | Type d'anneau / réserve            | Minéral associé (réputation communautaire) | Station(s) de vente proche confirmée(s) | Prix approximatif |
|-------------|----------------------------------------------------------------------------------|-------------------------------------|-----------------------------------------------|-------------------------------------------|---------------------|
| **Borann**  | Géante gazeuse *Borann A 2*, anneau *Borann A 2 A Ring*                          | Glacé, réserve **Pristine** (confirmé EDSM) | **Void Opals** — Borann est le système le plus cité depuis 2019 comme référence pour ce minéral | **Brothers Installation** (Surface Port, 885 Ls), Sullivan Terminal ou Garay Works (Outposts) — présence des trois confirmée en direct via Inara.cz | Non figé ici — le prix du Void Opal fluctue fortement et doit être vérifié via EDTools.cc (Miner's Tool) ou Inara avant de partir |
| **Paesia**  | Anneaux *2 A* (métallique), *2 B* (métal riche), *2 C* et *5 A* (glacés)         | *2 C* et *5 A* en réserve **Pristine** (confirmé EDSM) | **Painite / Low Temperature Diamonds** — Paesia est un système d'anarchie très cité comme site multi-minéraux pratique (pas de restriction de cargaison illégale), à proximité de la bulle | Non identifiée avec certitude lors de cette révision | Non figé ici — idem, à vérifier via un outil vivant |
| **Platine** | — | — | **Aucun système précis n'a pu être confirmé de façon fiable pour le Platine lors de cette révision** (voir ci-dessous) | — | — |

> **Sur le Platine : absence assumée plutôt qu'invention.** Le Platine se mine couramment dans de très nombreux
> anneaux métalliques sans qu'un hotspot spécifique soit nécessaire (c'est un minerai « de base » d'anneau
> métallique, contrairement au Painite ou aux Void Opals qui bénéficient de hotspots dédiés). Les moteurs de recherche
> accessibles ont soit bloqué l'accès par un CAPTCHA, soit renvoyé des résultats sans
> rapport avec le jeu pour les requêtes tentées lors de cette révision — voir Sources. Plutôt que de reprendre de
> mémoire un nom de système « hotspot à Platine » non vérifiable dans ces conditions, ce guide préfère l'admettre
> explicitement et renvoyer à la méthode de la section 4.4 pour que le lecteur obtienne une réponse à jour en
> quelques minutes.

> **Sur les Low Temperature Diamonds isolément.** De la même façon, aucun système *spécifiquement* et
> *exclusivement* réputé pour les LTD n'a pu être confirmé indépendamment lors de cette révision (au-delà de la
> réputation multi-minéraux de Paesia ci-dessus) : une tentative de vérification sur un système historiquement cité
> en mémoire (« 17 Lyrae ») a été infirmée par l'API EDSM elle-même, qui ne lui trouve **aucun anneau du tout** —
> exactement le genre d'erreur que cette revérification en direct est censée éviter. Ce guide s'abstient donc de
> nommer un système LTD dédié et renvoie, là aussi, à la méthode ci-dessous.

### 4.4 Mode d'emploi pas à pas : trouver un hotspot à jour avec EDTools.cc et Spansh

Face à la volatilité documentée ci-dessus, voici comment obtenir soi-même, en quelques minutes, une réponse à jour —
plutôt que de se fier à un nom de système imprimé dans un guide.

**Avec EDTools.cc — Hotspot finder (`edtools.cc/hotspot`)**

Étapes confirmées en direct sur l'interface réelle du site lors de cette révision (champs et libellés exacts) :

1. Ouvrir https://edtools.cc/hotspot dans un navigateur.
2. Dans le champ **« Reference system »**, entrer son système actuel (laissé vide, l'outil part de Sol par défaut).
3. Choisir le minéral visé dans le menu déroulant **Mineral** — les 13 minéraux couverts sont listés dans le tableau
   4.2 ci-dessus (Painite, Platinum, Void Opal *(affiché « Opal » dans l'interface)*, Low Temperature Diamond, etc.).
4. Renseigner si besoin le champ **« Minimum Hotspots »** pour n'afficher que les anneaux cumulant au moins N
   hotspots confirmés — utile pour repérer un anneau à plusieurs hotspots du même minéral, plus rentable qu'un
   anneau à un seul.
5. Cocher **« Populated systems only »** si l'on veut rester dans un système peuplé (accès facilité, marché de
   vente potentiellement plus proche, mais aussi plus de trafic/concurrence).
6. Lancer la recherche : l'outil renvoie une liste de systèmes triée par distance, avec le type d'anneau (l'outil se
   limite explicitement aux anneaux **Glacé, Rocheux et Métallique de systèmes Pristine**, d'après sa propre
   description) et le nombre de hotspots par anneau.
7. Noter le nom exact du corps et de l'anneau affiché (format `Système X Y Ring`, comme `Borann A 2 A Ring` dans
   l'exemple ci-dessus), s'y rendre, puis confirmer visuellement le hotspot en jeu (FSS puis approche de l'anneau)
   avant d'engager une session de minage complète.

**Avec EDTools.cc — Miner's Tool (`edtools.cc/miner`), pour la revente**

Une fois le minerai en soute (ou avant de partir, pour choisir sa destination de vente) :

1. Ouvrir https://edtools.cc/miner.
2. Renseigner son système actuel dans le champ **« I am in: »**.
3. Cliquer sur le minéral concerné dans la liste affichée (Platinum, Painite, Osmium, LT Diamonds, Rhodplumsite,
   Serendibite, Monazite, Musgravite, Grandidierite, Benitoite, Alexandrite, Void Opals).
4. Choisir le critère de tri dans le menu **« Sort by: »** — Distance, Price ou Demand.
5. Repérer dans la liste la station qui correspond au meilleur compromis pour son propre trajet (station la plus
   proche, la mieux payée, ou la plus demandeuse), puis noter son nom et son système avant de s'y rendre.

**Avec Spansh (Ring Finder)**

Spansh héberge un outil de recherche d'anneaux à l'adresse https://spansh.co.uk/riches, au sein de sa suite d'outils
de routage déjà documentée dans [Outils](./16-outils.md). **Limite à signaler honnêtement** : cette page est une
application JavaScript entièrement dynamique — un accès direct sans navigateur (tel que tenté lors de cette
révision) ne renvoie que le titre générique de la page, sans le formulaire ni les résultats, contrairement à
EDTools.cc dont le HTML brut expose déjà les champs. Les étapes suivantes reposent donc sur le fonctionnement
générique connu de l'outil (renseigner un système de référence, un rayon de recherche en années-lumière, filtrer par
type d'anneau et/ou par minéral, trier les résultats par distance) mais **n'ont pas pu être vérifiées mot pour mot
sur l'interface actuelle lors de cette révision** — à confirmer directement dans un navigateur avant de s'y fier
pour un guide pas à pas définitif. En pratique, pour un premier repérage rapide, **EDTools.cc reste l'outil dont ce
guide peut garantir la description exacte de l'interface** (voir ci-dessus) ; Spansh vaut surtout pour recouper la
distance de trajet une fois un système candidat identifié, via son Neutron Router (voir [Outils](./16-outils.md)).

### 4.5 Quel minerai dans quel type d'anneau : table de correspondance

Les sous-sections précédentes expliquent comment interroger les outils de repérage ; celle-ci répond à la
question qui vient juste avant. Le menu **Mineral** d'`edtools.cc/hotspot` et son filtre par type d'anneau
(voir 4.4) supposent en effet que le lecteur sache déjà **dans quel type d'anneau chercher le minerai qu'il
vise** — une correspondance que ce guide ne portait pas jusqu'ici. La voici, marchandise par marchandise.

> **Ce que vaut cette table, et ce qu'elle ne vaut pas.** Frontier ne publie aucune table de distribution des
> minéraux par type d'anneau. Les colonnes « Technique » et « Type d'anneau » ci-dessous sont donc une
> **synthèse de sources communautaires datées**, consultées le 10 septembre 2026, et non une donnée de jeu
> officielle : elles doivent être traitées comme les exemples de la section 4.3, c'est-à-dire vérifiées au
> Prospector Limpet avant d'engager une session. Elles sont recoupées entre deux relevés indépendants séparés
> de sept ans chaque fois que la marchandise figure dans les deux, et les désaccords sont listés en 4.5.5
> plutôt que masqués. **Une case vide signifie « non établi », jamais « aucun ».**
>
> Le **nommage et la classification complète des 270 marchandises** du jeu — les seize catégories, les denrées
> rares, les marchandises non minières — relèvent du guide dédié
> **[Les marchandises](./28-marchandises.md)**. Ce guide-ci n'en retient que les 63 entrées des catégories
> `Minerals` et `Metals`, et sous le seul angle du minage.

#### 4.5.1 Les quatre types d'anneau reconnus par le jeu

| Identifiant interne    | Nom en jeu (anglais) | Nom français retenu ici | Remarque                                                                                                     |
|------------------------|----------------------|-------------------------|--------------------------------------------------------------------------------------------------------------|
| `eRingClass_Icy`       | Icy                  | Glacé                   | —                                                                                                            |
| `eRingClass_Rocky`     | Rocky                | Rocheux                 | —                                                                                                            |
| `eRingClass_Metalic`   | Metallic             | Métallique              | Le journal de jeu écrit « Metalic », avec une seule L ; les lecteurs de journaux normalisent en « Metallic » |
| `eRingClass_MetalRich` | Metal Rich           | Riche en métaux         | Type **distinct** du métallique ; `edtools.cc/hotspot` ne le propose pas dans ses filtres                    |

**Il n'existe que ces quatre types d'anneau** : c'est un relevé intégral du registre d'identifiants EDCD/FDevIDs
(fichier `rings.csv`, quatre lignes), corroboré par l'énumération `RingClassEnum` du lecteur de journaux
EliteDangerousCore, qui normalise lui-même « Metalic » en « Metallic » (voir Sources). Toute réponse qui en cite
un cinquième est fausse. Conséquence pratique pour la section 4.4 : le Hotspot finder d'EDTools.cc, qui se
limite aux anneaux glacés, rocheux et métalliques, **laisse de côté le quatrième type**, alors que dix-huit des
marchandises du tableau ci-dessous y sont documentées — la recherche d'un anneau riche en métaux passe donc par
un autre outil ou par le FSS en jeu.

#### 4.5.2 Les 63 marchandises `Minerals` et `Metals` : technique et type d'anneau

Les colonnes « Marchandise » et « Catégorie FDev » sont un relevé intégral de `commodity.csv` filtré sur les
deux catégories minières (39 + 24 = 63 lignes). Les colonnes « Technique » et « Type d'anneau » viennent des
sources communautaires ci-dessous, **ou restent vides quand aucune source n'a pu être établie**.

| Marchandise (nom en jeu)      | Nom français                        | Catégorie FDev | Technique          | Type d'anneau                              | Source      |
|-------------------------------|-------------------------------------|----------------|--------------------|--------------------------------------------|-------------|
| Alexandrite                   |                                     | Minerals       | Noyau              | Glacé, Rocheux, Riche en métaux            | S1+S3       |
| Aluminium                     | Aluminium                           | Metals         |                    |                                            |             |
| Bastnasite                    | Bastnäsite                          | Minerals       | Surface planétaire | *hors anneau (minage de surface)*          | L1          |
| Bauxite                       | Bauxite                             | Minerals       | Laser              | Rocheux                                    | S1+S2       |
| Benitoite                     |                                     | Minerals       | Noyau              | Rocheux, Riche en métaux                   | S1          |
| Bertrandite                   |                                     | Minerals       | Laser              | Métallique, Riche en métaux                | S1+S2       |
| Beryllium                     | Béryllium                           | Metals         |                    |                                            |             |
| Bismuth                       | Bismuth                             | Metals         |                    |                                            |             |
| Bromellite                    |                                     | Minerals       | Laser + noyau      | Glacé                                      | S1+S2       |
| Cobalt                        | Cobalt                              | Metals         | Laser              | Rocheux                                    | S1+S2       |
| Coltan                        |                                     | Minerals       | Laser              | Rocheux, Riche en métaux                   | S1+S2       |
| Copper                        | Cuivre                              | Metals         |                    |                                            |             |
| Cryolite                      |                                     | Minerals       | Surface planétaire | *hors anneau (Extraction (Surface))*       | S4          |
| Deuterium                     | Deutérium                           | Minerals       | Surface planétaire | *hors anneau (minage de surface)*          | L1          |
| Diamond                       | Diamant                             | Minerals       | Surface planétaire | *hors anneau (minage de surface)*          | L1          |
| Gallite                       |                                     | Minerals       | Laser              | Rocheux, Métallique, Riche en métaux       | S1+S2       |
| Gallium                       | Gallium                             | Metals         |                    |                                            |             |
| Gold                          | Or                                  | Metals         | Laser              | Métallique, Riche en métaux *(?)*          | S1/S2       |
| Goslarite                     |                                     | Minerals       | Surface planétaire | *hors anneau (Extraction (Surface))*       | S4          |
| Grandidierite                 |                                     | Minerals       | Noyau              | Glacé                                      | S1+S3       |
| Haematite                     | Hématite                            | Minerals       |                    |                                            |             |
| Hafnium 178                   | Hafnium 178                         | Metals         |                    |                                            |             |
| Indite                        |                                     | Minerals       | Laser              | Rocheux, Métallique, Riche en métaux       | S1+S2       |
| Indium                        | Indium                              | Metals         |                    |                                            |             |
| Iridium                       | Iridium                             | Metals         | Surface planétaire | *hors anneau (minage de surface)*          | L1          |
| Jadeite                       |                                     | Minerals       | Surface planétaire | *hors anneau (Planetary Mining)*           | S4          |
| Lanthanum                     | Lanthane                            | Metals         |                    |                                            |             |
| Lepidolite                    |                                     | Minerals       | Laser              | Rocheux, Riche en métaux                   | S1+S2       |
| Lithium                       | Lithium                             | Metals         |                    |                                            |             |
| Lithium Hydroxide             | Hydroxyde de lithium                | Minerals       | Laser              | Glacé                                      | S1+S2       |
| Low Temperature Diamonds      | Diamants basse température          | Minerals       | Noyau + subsurface | Glacé                                      | S1+S3+S5    |
| Magnesite                     | Magnésite                           | Minerals       | Surface planétaire | *hors anneau (minage de surface)*          | L1          |
| Methane Clathrate             | Clathrate de méthane                | Minerals       | Laser              | Glacé                                      | S1+S2       |
| Methanol Monohydrate Crystals | Cristaux de monohydrate de méthanol | Minerals       | Laser              | Glacé                                      | S1+S2       |
| Moissanite                    |                                     | Minerals       | Surface planétaire | *hors anneau (Planetary Mining)*           | S4          |
| Monazite                      |                                     | Minerals       | Noyau              | Rocheux, Métallique, Riche en métaux       | S1          |
| Musgravite                    |                                     | Minerals       | Noyau              | Rocheux                                    | S1+S3       |
| Olivine                       | Olivine                             | Minerals       | Surface planétaire | *hors anneau (minage de surface)*          | L1          |
| Osmium                        | Osmium                              | Metals         | Laser              | Métallique, Riche en métaux                | S1+S2       |
| Painite                       |                                     | Minerals       | Laser + noyau      | Métallique, Riche en métaux *(noyau)*      | S1+S2+S3+S5 |
| Palladium                     | Palladium                           | Metals         | Laser              | Métallique                                 | S1+S2       |
| Periclase Dunite              | Périclase dunite                    | Minerals       | Surface planétaire | *hors anneau (minage de surface)*          | L1          |
| Platinum                      | Platine                             | Metals         | Laser + noyau      | Métallique, Riche en métaux *(noyau)*      | S1+S2+S3    |
| Praseodymium                  | Praséodyme                          | Metals         | Laser              | Métallique, Riche en métaux                | S1+S2       |
| Pyrophyllite                  |                                     | Minerals       | Surface planétaire | *hors anneau (Extraction (Surface))*       | S4          |
| Quartz Pyroxenite             | Quartz pyroxénite                   | Minerals       | Surface planétaire | *hors anneau (minage de surface)*          | L1          |
| Rhodplumsite                  |                                     | Minerals       | Noyau              | Métallique, Riche en métaux                | S1+S3       |
| Ruby                          | Rubis                               | Minerals       | Surface planétaire | *hors anneau (minage de surface)*          | L1          |
| Rutile                        |                                     | Minerals       | Laser              | Rocheux                                    | S1+S2       |
| Samarium                      | Samarium                            | Metals         | Laser              | Métallique, Riche en métaux, Rocheux *(?)* | S1/S2       |
| Sapphire                      | Saphir                              | Minerals       | Surface planétaire | *hors anneau (minage de surface)*          | L1          |
| Serendibite                   |                                     | Minerals       | Noyau              | Rocheux, Métallique, Riche en métaux       | S1          |
| Silver                        | Argent                              | Metals         | Laser              | Métallique, Riche en métaux                | S1+S2       |
| Steel                         | Acier                               | Metals         |                    |                                            |             |
| Taaffeite                     |                                     | Minerals       | Surface planétaire | *hors anneau (Planetary Mining)*           | S4          |
| Tantalum                      | Tantale                             | Metals         |                    |                                            |             |
| Thallium                      | Thallium                            | Metals         |                    |                                            |             |
| Thorium                       | Thorium                             | Metals         |                    |                                            |             |
| Thortveitite                  | Thortveitite                        | Minerals       | Surface planétaire | *hors anneau (minage de surface)*          | L1          |
| Titanium                      | Titane                              | Metals         |                    |                                            |             |
| Uraninite                     |                                     | Minerals       | Laser              | Rocheux, Riche en métaux                   | S1+S2       |
| Uranium                       | Uranium                             | Metals         |                    |                                            |             |
| Void Opal                     | Opale du vide                       | Minerals       | Noyau              | Glacé                                      | S1+S3       |

**Clés de source.** S1 = guide Steam *Best Commodities to Mine (Laser & Core)* (3 octobre 2025, mis à jour le
6 octobre 2025), tableaux « Laser Mining » et « Core Mining », qui donnent un type d'anneau par minéral ·
S2 = guide Steam *Mining 3.3 Update in progress for 4.0* (décembre 2018), section « Ring types », qui donne la
liste inverse, minéraux par anneau · S3 = discussion Steam *Mining Filter*, réponse retenue d'Edwyndham
(1er octobre 2025), témoignage de core miner · S4 = EDSM, FAQ Commodities, colonne « Produced by » ·
L1 = ce guide lui-même, section 3.3.3. Références complètes en Sources.

**Lecture des marqueurs.** *(?)* signale un type d'anneau sur lequel les deux relevés fermés se contredisent —
l'un l'affirme, l'autre donne pour la même marchandise une liste qui l'omet. *(noyau)* signale un type d'anneau
que la source ne cite que pour les astéroïdes à noyau, et non pour le minage laser. Les deux cas sont détaillés
en 4.5.5. La mention *hors anneau* n'est pas une case vide : elle signifie qu'une source atteste que la
marchandise s'obtient ailleurs qu'en anneau — soit parce qu'EDSM la donne produite par une économie
d'extraction de surface, soit parce qu'elle fait partie des treize marchandises du minage de surface planétaire
du 2 septembre 2026 déjà listées en 3.3.3.

**Décompte recalculé sur le tableau ci-dessus, et non de mémoire :**

| Colonne                | Renseignée | « Hors anneau » | Vide (non établi) |
|------------------------|------------|-----------------|-------------------|
| Type d'anneau          | 30 / 63    | 17              | 16                |
| Technique d'extraction | 47 / 63    | —               | 16                |

Les 30 lignes à type d'anneau renseigné se répartissent en **22 marchandises `Minerals` et 8 `Metals`**, et 30 +
17 + 16 = 63. Les **16 lignes entièrement vides** sont, nommément : Aluminium, Beryllium, Bismuth, Copper,
Gallium, Haematite, Hafnium 178, Indium, Lanthanum, Lithium, Steel, Tantalum, Thallium, Thorium, Titanium,
Uranium. Pour treize d'entre elles, EDSM indique une production par une économie `Refinery` ou `Refinery
(Surface)`, ce qui rendrait plausible qu'elles ne soient pas extraites d'astéroïde du tout mais achetées en
station — aucune source consultée ne l'affirme, la case reste donc vide plutôt que devinée. Les trois dernières
— Hafnium 178, Steel, Haematite — n'ont strictement aucune donnée, pas même une économie productrice.

#### 4.5.3 Le tableau inverse : ce que l'on trouve dans chaque type d'anneau

Même contenu, lu dans l'autre sens. Une marchandise documentée dans plusieurs types d'anneau compte dans
chacun : la somme des quatre nombres (54) n'est donc pas un effectif de marchandises distinctes.

| Type d'anneau   | Nb (Minerals + Metals) | Marchandises documentées                                                                                                                                                                                            |
|-----------------|------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Glacé           | 8                      | Alexandrite, Bromellite, Grandidierite, Lithium Hydroxide, Low Temperature Diamonds, Methane Clathrate, Methanol Monohydrate Crystals, Void Opal                                                                    |
| Rocheux         | 14                     | Alexandrite, Bauxite, Benitoite, Cobalt, Coltan, Gallite, Indite, Lepidolite, Monazite, Musgravite, Rutile, Samarium *(?)*, Serendibite, Uraninite                                                                  |
| Métallique      | 14                     | Bertrandite, Gallite, Gold, Indite, Monazite, Osmium, Painite, Palladium, Platinum, Praseodymium, Rhodplumsite, Samarium, Serendibite, Silver                                                                       |
| Riche en métaux | 18                     | Alexandrite, Benitoite, Bertrandite, Coltan, Gallite, Gold *(?)*, Indite, Lepidolite, Monazite, Osmium, Painite *(noyau)*, Platinum *(noyau)*, Praseodymium, Rhodplumsite, Samarium, Serendibite, Silver, Uraninite |

**Réponse directe à la question qui manquait à ce guide** : la **Bertrandite** se mine **au laser**, dans les
anneaux **métalliques** et **riches en métaux**. Les deux relevés, séparés de sept ans, l'y placent tous les
deux et ne la placent nulle part ailleurs — ni en anneau glacé, ni en anneau rocheux.

> **Piège de découpage à connaître : les anneaux glacés ne contiennent pas que des `Minerals`.** Le tableau
> ci-dessus ne couvre que les catégories `Minerals` et `Metals`. Or le **Tritium** — carburant des Fleet
> Carriers, et l'un des treize minéraux du Hotspot finder cité en 4.2 —, le **Hydrogen Peroxide**, le
> **Liquid Oxygen** et l'**Eau** sont extraits en anneau glacé mais classés `Chemicals` par le jeu. Le nombre
> « 8 » de la ligne Glacé ne dit donc pas combien de choses se minent dans un anneau glacé ; il dit combien de
> `Minerals` et `Metals` y sont documentés. Voir [Les marchandises](./28-marchandises.md) pour la répartition
> complète par catégorie.

#### 4.5.4 Réserves d'anneau : la seule règle générale établie

Un anneau porte, en plus de son type, un **niveau de réserve** qui conditionne le rendement. Les cinq niveaux,
relevés tels que la source les énumère :

| Niveau de réserve (nom en jeu) | Nom français | Ce que la source en dit                                                  |
|--------------------------------|--------------|--------------------------------------------------------------------------|
| Pristine                       | Vierge       | Le meilleur endroit où miner                                             |
| Major                          | Majeure      | Correct, mais chercher plutôt une réserve Pristine                       |
| Common                         | Commune      | On y trouve des ressources, mais le rendement ne vaut pas le temps passé |
| Low                            | Faible       | Il ne reste que les restes                                               |
| Depleted                       | Épuisée      | À éviter                                                                 |

**Aucune source consultée ne publie de seuil de réserve minimale par minéral.** Il serait tentant d'ajouter au
tableau 4.5.2 une colonne « réserve minimale conseillée » ; elle serait vide sur les 63 lignes, et la remplir
« Pristine » partout reviendrait à transformer un conseil global en donnée par minéral. Ce qui est établi est
la règle générale, corroborée par trois voies indépendantes : le relevé ci-dessus, la restriction que
`edtools.cc/hotspot` s'impose à lui-même (« Pristine systems only », voir 4.4), et la vérification EDSM des
anneaux cités en 4.3, tous en réserve Pristine. À type d'anneau égal, viser une réserve Pristine.

#### 4.5.5 Divergences entre sources, et ce que cette table ne couvre pas

| Marchandise       | Ce que dit le relevé de 2025 (S1)                                | Ce que dit l'autre relevé                                                           | Traitement retenu dans le tableau 4.5.2                        |
|-------------------|------------------------------------------------------------------|-------------------------------------------------------------------------------------|----------------------------------------------------------------|
| Gold              | Métallique seul (tableau laser)                                  | S2 (2018) range l'Or dans les anneaux métalliques **et** riches en métaux           | « Riche en métaux » marqué *(?)*                               |
| Samarium          | Métallique, Riche en métaux **et Rocheux**                       | S2 (2018) ne range le Samarium que dans les anneaux métalliques et riches en métaux | « Rocheux » marqué *(?)*                                       |
| Platinum, Painite | Métallique au laser ; Métallique **et** Riche en métaux au noyau | S2 (2018) ne les range que dans les anneaux métalliques                             | « Riche en métaux » marqué *(noyau)*                           |
| Benitoite         | Rocheux et Riche en métaux                                       | S3 (2025) ne cite que le rocheux, sans se prononcer sur le reste                    | Les deux types conservés : silence n'est pas démenti           |
| Monazite          | Rocheux, Métallique, Riche en métaux                             | S3 (2025) signale **aussi** du Monazite en anneau glacé                             | « Glacé » **non** ajouté : mention isolée d'un seul témoignage |

**Poids respectif des sources, à peser avant de s'y fier.** S1 est le seul document structuré qui donne un type
d'anneau minéral par minéral, mais c'est un guide de joueur à faible audience, et son tableau de prix porte une
coquille de date. S3 est signé d'un autre joueur, mais publié dans une discussion ouverte par l'auteur de S1 :
les deux ne sont pas totalement indépendants. S2 date de décembre 2018 et son propre auteur le reconnaissait
périmé dès 2019 ; sa valeur ici est de servir de **contrôle indépendant à sept ans de distance**, jamais de
source unique. Le wiki Fandom, source la plus citée sur ce sujet par les moteurs de recherche, est resté
inaccessible (erreurs 402 et 403) comme lors des révisions précédentes, et n'a donc rien pu confirmer.

**Ce que cette table ne donne pas, et où le chercher.**

- **Les prix par tonne.** Volontairement absents, conformément à la règle que ce guide s'est donnée (voir la
  note sur la fiabilité des données chiffrées) : les seuls prix disponibles pour ces minéraux forment un relevé
  Inara unique du 3 octobre 2025, dont l'auteur signale lui-même deux valeurs possiblement gonflées par un
  Community Goal alors en cours. Consulter `edtools.cc/miner` ou Inara avant de partir (voir 4.4).
- **Le rendement par minéral en tonnes.** Aucune source ne le publie. Les seuls chiffres par minéral que S1
  fournit sont des estimations de crédits par heure pour cinq métaux au laser ; ils ne sont pas repris ici,
  la section 5 s'en tenant à un ordre de grandeur global pour la technique.
- **La réserve minimale par minéral.** Voir 4.5.4 : la donnée n'existe pas publiquement.
- **Le type d'anneau de 16 marchandises sur 63.** Voir la liste nominative en 4.5.2. La piste serait le wiki
  Fandom, page par marchandise, aujourd'hui inaccessible — à défaut, un relevé au Prospector Limpet en jeu.
- **Les économies acheteuses et productrices**, traitées pour les seules marchandises de valeur en section 5 et
  dans leur ensemble par [Les marchandises](./28-marchandises.md).

---

## 5. Rendements chiffrés du minage et revente

Le minage alimente le commerce en fournissant des matières premières à forte valeur ajoutée — **Platine, Painite,
Diamants basse température, Void Opals**. Une révision antérieure de ce guide ajoutait qu'elles se revendent « sur
des marchés spécialisés (économies de raffinage/extraction) » : **le relevé d'EDSM établit l'inverse**, et la phrase
est corrigée ci-dessous avant d'aborder les rendements.

### Où se revendent réellement les minerais de valeur : correction d'une affirmation de ce guide

Colonnes relevées telles quelles chez EDSM, en anglais pour ne pas les déformer par traduction — « Produced by »
désigne les économies qui produisent la marchandise, « Consumed by » celles qui l'achètent :

| Marchandise              | Nom français               | « Produced by » (EDSM)  | « Consumed by » (EDSM)                                  |
|--------------------------|----------------------------|-------------------------|---------------------------------------------------------|
| Platinum                 | Platine                    | Mining only             | All except Agri, Refinery, Extraction and Military      |
| Painite                  |                            | Mining only             | Everywhere except Terraforming, Extraction and Military |
| Low Temperature Diamonds | Diamants basse température | Mining only             | All                                                     |
| Void Opal                | Opale du vide              |                         |                                                         |
| Gold                     | Or                         | Extraction and Refinery | All except Agri, Refinery, Extraction and Military      |
| Palladium                | Palladium                  | Extraction              | All except Agri, Refinery, Extraction and Military      |
| Silver                   | Argent                     | Extraction and Refinery | All except Agri, Refinery, Extraction and Military      |
| Osmium                   | Osmium                     | Mining only             | High Tech, Industrial, Military and Terraforming        |

**Décompte fait sur ces huit lignes.** Sept portent une valeur, une est vide. **Quatre** — Platine, Or, Palladium,
Argent — excluent explicitement le raffinage *et* l'extraction de leurs acheteuses (« All except Agri, **Refinery**,
**Extraction** and Military »). **Une**, l'Osmium, ne cite ni l'un ni l'autre. **Une**, la Painite, exclut
l'extraction mais pas le raffinage. **Une seule**, les Diamants basse température, est achetée partout (« All »),
raffinage et extraction compris. Et **une**, les Void Opals, n'a aucune donnée chez EDSM : la ligne reste vide
plutôt que remplie par analogie.

Étendu aux 63 marchandises `Minerals` et `Metals`, le même relevé donne 41 lignes renseignées, dont **une seule**
— les Diamants basse température — a une économie d'extraction pour acheteuse, et **treize** nomment littéralement
`Refinery` : Bauxite, Bertrandite, Coltan, Cryolite, Gallite, Goslarite, Indite, Lepidolite, Lithium Hydroxide,
Methane Clathrate, Pyrophyllite, Rutile, Uraninite. Ce sont toutes des **minerais bruts ou des glaces à faible
valeur unitaire**, jamais des gemmes. La logique du jeu est cohérente une fois la phrase corrigée : une économie de
raffinage achète le minerai brut qu'elle va traiter, pas le métal déjà pur ni la gemme taillée ; et une économie
d'extraction rachète rarement ce qu'elle produit elle-même — les Diamants basse température, achetés partout, sont
la seule exception du relevé. En pratique, **le Platine, l'Or, le Palladium et l'Argent se vendent partout sauf
dans les économies agricoles, de raffinage, d'extraction et militaires** : les deux économies que ce guide
désignait comme leurs débouchés naturels sont précisément celles qui ne les achètent pas.

> **Point à corriger hors de ce guide.** La même formulation figure dans
> [Commerce § 2.4 « Mining-to-trade »](./11-commerce.md), fichier hors du périmètre de cette révision : la
> correction y reste à faire. Le relevé complet des économies productrices et acheteuses, marchandise par
> marchandise, relève de **[Les marchandises](./28-marchandises.md)**.

### Rendements horaires observés

Les chiffres de rendement ci-dessous sont repris de [Commerce § 2.4 « Mining-to-trade »](./11-commerce.md) plutôt que
réinventés, pour rester cohérent avec le reste du corpus :

- **Minage laser bien optimisé** (Python ou Type-9 Heavy, équipé de refinery, prospector/collector limpets, surface
  scanners et cargo racks en nombre) : **bien plus de 100 millions de Cr/heure** (source : GameRant).
- **Wing mining organisé** via le réseau communautaire **Pilots Trade Network (PTN)** — une organisation Discord/
  Reddit réelle et active pour *Elite Dangerous*, dont l'existence et l'activité (guides de « Wing Mining Missions »,
  gestion de plus de 400 Fleet Carriers) ont été confirmées directement sur son site officiel
  (pilotstradenetwork.com) lors de cette révision — permettrait, selon la presse spécialisée citée par le corpus
  (TheGamer/GameRant), à une escouade de 4 commandants complétant 60 à 80 missions de minage de générer jusqu'à
  **3,5 milliards de Cr par cycle** pour l'équipage complet. Ce chiffre précis n'a pas pu être revérifié de façon
  indépendante lors de cette révision (le site de PTN ne publie pas ce type de statistique de rendement) : à traiter
  comme un ordre de grandeur ponctuel plutôt qu'une garantie, ces estimations dépendant fortement des prix de marché
  du moment et du rééquilibrage du minage de septembre 2026.

### Progression de vaisseaux miniers recommandée

| Étape          | Vaisseau              | Profil                                                        |
|-----------------|-------------------------|--------------------------------------------------------------|
| Débutant        | Adder / Cobra Mk III    | Faible investissement, apprentissage des trois techniques        |
| Intermédiaire   | Python                  | Meilleur compromis soute/maniabilité pour du minage laser sérieux |
| Avancé          | Imperial Cutter         | Grande soute, résistance, adapté au wing mining en équipage       |

### Bonnes pratiques : ne jamais considérer sa cargaison minée comme acquise

Comme pour le commerce en vrac (voir [Commerce, Introduction](./11-commerce.md)), ne jamais considérer sa cargaison
minée comme acquise avant la vente : l'assurance (*rebuy*) ne couvre que le remplacement de la coque, jamais la perte
de cargaison en cas de piraterie ou d'interdiction pendant le trajet retour vers une station de vente.

---

## 6. Minage et Powerplay

Le minage est l'une des activités reconnues par le système de **Powerplay** (voir
**[Powerplay](./02-powerplay.md)** pour le fonctionnement complet) :

- Plusieurs Powers accordent à leurs partisans un bonus de profit spécifique aux activités de minage — historiquement
  cité pour **Zemina Torval** (Empire) et **Nakato Kaine** (Alliance). Les taux exacts (souvent avancés comme +45 %
  et +50 % dans des guides communautaires plus anciens) n'ont pas pu être revérifiés de façon indépendante lors de
  cette révision — l'accès aux fiches détaillées par Power sur Inara.cz n'a été que partiel, et ces bonus sont
  connus pour évoluer au fil des rééquilibrages de Powerplay. **Consulter la fiche à jour de chaque Power sur
  Inara.cz avant de baser une stratégie sur un pourcentage précis.**
- Le minage de commodités dans un système d'**acquisition** ou de **renforcement**, sur un hotspot de ressources et
  avec un prix de vente élevé sur place, rapporte environ **25 000 à 75 000 mérites/heure** — l'une des méthodes de
  farm de mérites les plus citées par la communauté (chiffre à revérifier au cas par cas, comme les taux ci-dessus).
- La **Mining Lance** (voir section 2.1) fait partie des modules exclusifs Powerplay débloqués par la progression
  de rang — confirmé indépendamment par son marqueur interne dans les données de jeu (EDCD/FDevIDs,
  `outfitting.csv`, tag `ELITE_SPECIFIC_V_POWER_200120` sur l'entrée Mining Lance — voir Sources), aux côtés d'armes
  comme le Pacifier Frag-Cannon ou l'Advanced Plasma Accelerator.

Sous réserve de vérification des taux exacts ci-dessus, ces bonus font potentiellement du minage une activité
doublement rentable pour un commandant affilié à une Power qui le favorise : gains en crédits (revente des minéraux)
et gains en mérites Powerplay simultanément.

---

## Note sur la fiabilité des données chiffrées

Sauf mention contraire, les rendements horaires, prix Arx et statistiques d'équipement cités dans ce guide sont des
**instantanés capturés le 9 septembre 2026**, à revérifier en jeu ou via des outils vivants (Inara, EDTools, Spansh)
avant toute décision de session — ces valeurs fluctuent avec les prix de marché, l'état du [BGS](./00-glossaire.md)
local et les correctifs de Frontier. **Point d'attention particulier** : la mise à jour *Rhino SRV Update*
(« Elite Dangerous | Rhino SRV Update », 2 septembre 2026 11:20 UTC — voir [Rhino et Nomad](./14-rhino.md)) a
introduit le **minage de surface planétaire**, une boucle entièrement nouvelle traitée en section 3.3, et
accompagné cet ajout d'une passe d'équilibrage dont Frontier a publié les **axes** mais **aucune valeur chiffrée**
(voir le tableau de la section 3.3 et la mise au point de portée en section 3.4). Les rendements de minage
d'astéroïdes cités en section 5 restent donc des **ordres de grandeur**. De même, les prix unitaires par tonne des
minéraux (Painite, Void Opals, Tritium, etc.) ne sont volontairement pas figés dans ce guide : ils fluctuent en
continu par station, par [BGS](./00-glossaire.md) et par Power — consulter un outil vivant (Inara, EDTools, Spansh)
plutôt qu'un chiffre imprimé. **Cette réserve
s'applique en particulier à la section 4.3** : les systèmes et anneaux qui y sont cités sont des exemples
concrets pour illustrer la méthode, pas une liste figée de bons plans — le statut de hotspot d'un anneau ne change
normalement pas, mais son intérêt économique (prix de vente, concurrence, sécurité du système) si.

---

## Voir aussi

- **[Le Commerce dans Elite Dangerous](./11-commerce.md)** — lien minage → revente, exemple chiffré de route
  commerciale, outils de routage (Trade Dangerous, Spansh).
- **[Les marchandises](./28-marchandises.md)** — nommage et classification complète des 270 marchandises et des
  142 denrées rares du jeu, catégorie par catégorie : ce guide-ci n'en traite que les 63 entrées `Minerals` et
  `Metals`, et sous le seul angle du minage (section 4.5).
- **[Liste complète des équipements](./04-equipements.md)** — fiches techniques complètes de toutes les armes
  minières, des contrôleurs de limpets et des scanners cités dans ce guide.
- **[Guide complet du Rhino et du Nomad](./14-rhino.md)** — chronologie, spécifications et prix détaillés du
  Rhino (minage de surface planétaire), du Nomad (ship-launched vessel d'exploration livré le 30 juin 2026 avec la
  mise à jour Operations) et du Type-11 Prospector.
- **[13 — Opérations](./13-operations.md)** — le mode multijoueur **Operations** livré le 30 juin 2026, dont la mise
  à jour du 2 septembre 2026 a apporté à la fois le Rhino, le minage de surface et l'opération *Under Siege*.
- **[Politique et Powerplay dans Elite Dangerous](./02-powerplay.md)** — bonus de profits Torval/Kaine, mérites de
  minage, Mining Lance.
- **[Le guide des outils communautaires](./16-outils.md)** — écosystème complet EDSM/Inara/Spansh/EDMC pour le
  suivi de marché au-delà des outils spécifiques au minage (EDTools.cc).
- **[Liste complète des vaisseaux](./03-vaisseaux.md)** — fiches détaillées des vaisseaux de minage (Python, Type-9
  Heavy, Imperial Cutter, Type-11 Prospector).
- **[Débuter et progresser](./27-debuter-et-progresser.md)** — où situer le minage parmi les premières activités
  rentables d'un nouveau Commandant, et pourquoi les rendements chiffrés de ce guide, calibrés sur des configurations
  ingénierées de fin de partie, ne sont pas transposables à un vaisseau de départ.

---

## Sources

### Sources web et référentiels consultés pour ce guide du minage

Sources web consultées directement lors de la première révision de ce guide (accès brut, sans intermédiaire de
résumé, pour les deux premières) :

- `https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320` — API JSON publique du flux d'actualités
  officiel d'*Elite Dangerous*, qui republie sans intermédiaire les billets de Frontier Developments : **source
  primaire** de ce guide pour tout ce qui concerne le Rhino, le minage de surface et le Type-11 Prospector. Relevée
  en brut (`curl`) et parsée, avec horodatage Unix vérifié : 1757409923 → 9 septembre 2025 (« Type-11 Prospector
  Highlights »), 1758017038 → 18 septembre 2025 (« Galactic Edition »), 1758559636 → 22 septembre 2025 (« Release
  Date Update »), 1759155710 → 29 septembre 2025 (« Type-11 Prospector Update »), 1760615316 → 16 octobre 2025
  (« Update 2 »), 1786025946 → 6 août 2026 (« Beneath the Surface: Your First Look at the Rhino », 14:19 UTC),
  1788348019 → 2 septembre 2026 (« Elite Dangerous | Rhino SRV Update », 11:20 UTC). Le texte intégral de ces
  billets établit les hardpoints et emplacements internes du Type-11 Prospector, le fabricant du Rhino (Vodel), son
  équipage de trois occupants, son déploiement depuis la nouvelle soute à véhicule, ses trois modules signature, les
  axes d'équilibrage du minage de surface, la liste des treize nouvelles marchandises, les prix Arx des deux
  véhicules et le problème connu « 9 chunks, sera porté à 12 ».
  Le même flux contient les billets qui documentent la mise à jour **Operations** du 30 juin 2026 et le **Nomad**
  (« An Update on Operations », 22 avril 2026 14:02 UTC ; « Discover the Nomad », 2 juin 2026 13:03 UTC ;
  « Elite Dangerous | Operations Update », 1er juillet 2026 14:01 UTC) — traités dans
  [13-operations.md](./13-operations.md) et [14-rhino.md](./14-rhino.md).
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/outfitting.csv — registre communautaire de référence des
  identifiants internes du jeu (EDCD/FDevIDs), récupéré en brut (`curl`) et filtré sur les entrées liées au minage :
  confirme indépendamment l'existence, les tailles, montages et notations de toutes les armes minières listées en
  section 2.1, dont le Sub-Surface Extraction Missile et la Mining Lance (avec son tag Powerplay).
- https://edtools.cc/ , https://edtools.cc/hotspot et https://edtools.cc/miner — outils communautaires de repérage
  de hotspots et de prix de minage ; contenu et fonctionnalités revérifiés lors de cette révision.

- https://pilotstradenetwork.com/ — site officiel du réseau communautaire Pilots Trade Network (PTN) ; confirme son
  existence et son activité de wing mining, sans toutefois publier de statistique de rendement chiffrée.
- https://inara.cz/elite/ (accès partiel — page d'accueil et vue d'ensemble Powerplay uniquement ; les fiches
  détaillées par Power n'ont pas pu être chargées lors de cette révision).
- https://en.wikipedia.org/wiki/Elite_Dangerous (contenu partiel sur les mécaniques de base du minage).
- Corpus interne réutilisé pour cette révision : [14-rhino.md](./14-rhino.md) (chronologie et specs du
  Rhino, sourcé massivelyop.com et twistedvoxel.com), [11-commerce.md](./11-commerce.md) § 2.4 « Mining-to-trade »
  (rendements horaires, sourcé TheGamer et GameRant), [04-equipements.md](./04-equipements.md) (tableaux d'armes
  minières et de contrôleurs de limpets, sourcé EDCD/FDevIDs et EDCD/coriolis-data), [02-powerplay.md](./02-powerplay.md)
  (bonus de minage Torval/Kaine et mérites, sourcé inara.cz et lavewiki.com — taux non revérifiés indépendamment
  ici, voir section 6).


### Sources ajoutées lors de la révision du 10 septembre 2026 (section 4.5 — minerai × technique × type d'anneau)

- https://raw.githubusercontent.com/EDCD/FDevIDs/master/commodity.csv — registre EDCD/FDevIDs, commit
  `c35612952dd6a547d1a7ac4cffab9c7051e86579` (5 septembre 2026), lu en local. **Assiette du tableau 4.5.2** :
  270 marchandises réparties en seize catégories, dont `Minerals` 39 et `Metals` 24, soit les 63 lignes du tableau.
  Ce fichier ne contient **ni prix, ni économie, ni type d'anneau** : il ne donne que l'identifiant, le symbole, la
  catégorie et le nom.
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/rings.csv — même commit : les quatre types d'anneau du
  tableau 4.5.1 (`eRingClass_Icy`, `eRingClass_Metalic`, `eRingClass_MetalRich`, `eRingClass_Rocky`), relevé
  intégral.
- Dépôt EDDiscovery/EliteDangerousCore, fichier
  `EliteDangerous/FrontierData/Enumerations/Rings.cs` — énumération `RingClassEnum { Unknown, Rocky, Metallic, Icy,
  MetalRich }` et normalisation documentant la coquille « Metalic » du journal de jeu : corrobore `rings.csv` par
  une voie indépendante. Vérifié : ce dépôt ne contient **aucune** table de prix ni de distribution de minerais.
- **S1** — https://steamcommunity.com/sharedfiles/filedetails/?id=3579503571 — guide Steam *Best Commodities to
  Mine (Laser & Core)*, par Devilish Dave, publié le 3 octobre 2025 et mis à jour le 6 octobre 2025 ; consulté le
  10 septembre 2026. Tableaux « Laser Mining » (24 lignes minéral / type d'anneau / prix) et « Core Mining »
  (12 lignes). Guide de joueur, « Not enough ratings » : utilisable parce que daté et vérifiable, pas parce qu'il
  fait autorité.
- **S2** — https://steamcommunity.com/sharedfiles/filedetails/?id=1594281413 — guide Steam *Mining 3.3 Update in
  progress for 4.0*, par Yousseff., décembre 2018 ; consulté le 10 septembre 2026. Sections « Where to mine »
  (les cinq niveaux de réserve du tableau 4.5.4) et « Ring types » (listes de minéraux par type d'anneau, avec
  l'avertissement de l'auteur « This list is subject to change »). Périmé de l'aveu de son auteur dès 2019 :
  employé ici uniquement comme contrôle indépendant du relevé de 2025.
- **S3** — https://steamcommunity.com/app/359320/discussions/0/596287304340200947/ — discussion Steam *Mining
  Filter*, réponse retenue d'Edwyndham (1er octobre 2025), consultée le 10 septembre 2026 : types d'anneau
  pratiqués en core mining, et jugement selon lequel core-miner du Platine ou de la Painite est possible mais
  contre-productif, ces deux-là étant bien plus efficaces au laser — ce que la section 1.1 de ce guide disait déjà.
- **S4** — https://www.edsm.net/en/faq/commodities/index/id/9/name/Minerals et
  https://www.edsm.net/en/faq/commodities/index/id/8/name/Metals — colonnes « Produced by » et « Consumed by »
  d'EDSM, consultées le 10 septembre 2026 : source des mentions *hors anneau* du tableau 4.5.2 et du tableau des
  économies de la section 5. Attention en cas de recoupement : la page « Minerals » d'EDSM compte 41 entrées
  contre 39 dans FDevIDs, l'écart venant de deux denrées rares qu'EDSM range dans les minerais ; un croisement
  naïf des deux référentiels fabriquerait donc de faux minerais minables.
- **S5** — https://www.elitedangerous.net/mining.php (Pilots Trade Network, dernière mise à jour du
  15 juillet 2020) : confirme Painite en anneau métallique, Low Temperature Diamonds et Tritium en anneau glacé.
- Restées inaccessibles, et à ne pas retenter à l'identique : `elite-dangerous.fandom.com` (HTTP 402 puis 403, y
  compris via son API), les forums Frontier (HTTP 403 puis réponse vide), `spansh.co.uk/riches` (coquille
  applicative sans données), `newp.io/mining` (HTTP 521). Aucune donnée n'en a été tirée.

### Limites de la recherche et points du minage restés à vérifier en jeu

**Note sur les limites de cette recherche.** elitedangerous.com/news et /update-notes ainsi que
elite-dangerous.fandom.com ont renvoyé des erreurs HTTP (403/402) et sont restés inaccessibles, limitant la
vérification à des accès ciblés sur des points d'accès JSON/CSV bruts. Cette contrainte n'affecte pas la fiabilité du contenu tiré
du flux Steam News : celui-ci republie mot pour mot les billets de Frontier et reste accessible sans blocage, ce qui
en fait une source **de rang primaire** malgré l'inaccessibilité du site officiel. Une vérification adversariale
antérieure, privée de cet accès, avait jugé plusieurs de ces éléments invérifiables ou fabriqués : cette conclusion
est erronée et le flux officiel l'infirme point par point pour le Rhino, ses caractéristiques, son fabricant Vodel,
les treize marchandises et le problème connu de collecte 9/12.

Ce qui reste réellement absent des sources officielles, et doit être vérifié en jeu plutôt qu'estimé :

- **Les valeurs numériques de la boucle de minage de surface.** Frontier a publié les axes d'équilibrage, jamais les
  chiffres (voir le tableau de la section 3.3).
- **Le numéro de version et la date du correctif « 9 → 12 chunks »** du Rhino : annoncé « dès que possible » le
  2 septembre 2026, sans publication ultérieure dans le flux officiel au 9 septembre 2026.
- **Les prix de vente, économies acheteuses et usages en ingénierie** des treize nouvelles marchandises.
- **Les vaisseaux et classes de module** permettant d'embarquer un Rhino, et l'existence d'un achat en crédits du
  véhicule au-delà des formules Arx.
- **Les pourcentages exacts de bonus Powerplay** liés au minage (Torval/Kaine) et les chiffres de rendement en
  crédits par cycle du wing mining PTN, tous deux d'origine communautaire.

Les prix unitaires par minéral (Cr/tonne) n'ont volontairement pas été figés dans ce guide pour la même raison —
consulter un outil vivant (Inara, EDTools, Spansh) avant toute planification économique.

### Sources ajoutées lors de la révision du 9 septembre 2026 (sections 4.3 et 4.4 — exemples de hotspots)

- https://www.edsm.net/api-system-v1/bodies?systemName=Borann — API JSON brute d'EDSM, interrogée directement lors
  de cette révision : confirme l'existence du système Borann et de son anneau *Borann A 2 A Ring* (type Icy,
  réserve **Pristine**) autour de la géante gazeuse Borann A 2, cohérent avec la réputation communautaire de ce
  système pour les Void Opals.
- https://www.edsm.net/api-system-v1/bodies?systemName=Paesia — idem pour Paesia : confirme quatre anneaux
  (*2 A* métallique, *2 B* métal riche, *2 C* et *5 A* glacés en réserve Pristine), cohérent avec la réputation
  communautaire de système multi-minéraux (Painite, LTD).
- https://www.edsm.net/api-system-v1/bodies?systemName=17%20Lyrae — même API, interrogée pour vérifier un nom de
  système retenu de mémoire comme hotspot LTD potentiel : **infirme** cette mémoire, ce système ne possédant aucun
  anneau d'après EDSM. Ce système n'est donc, à raison, cité nulle part ailleurs dans ce guide.
- https://inara.cz/elite/starsystem/?search=Borann — confirme en direct les stations proches de Borann (Brothers
  Installation, Sullivan Terminal, Garay Works) et les statistiques générales du système (population, sécurité,
  faction contrôlante).
- https://edtools.cc/hotspot et https://edtools.cc/miner — HTML brut des deux pages, inspecté en détail lors de
  cette révision pour en décrire l'interface exacte (champs « Reference system », « Mineral », « Minimum Hotspots »,
  case « Populated systems only » pour le Hotspot finder ; champ « I am in: », liste de minéraux cliquables et tri
  Distance/Price/Demand pour le Miner's Tool). Outil créé par CMDR VicTic (version 0.6, datée du 8 octobre 2025
  d'après la page elle-même).
- https://spansh.co.uk/riches — tenté en accès brut lors de cette révision : ne renvoie qu'une coquille
  d'application JavaScript (titre de page seul, sans formulaire ni résultat), l'outil étant entièrement dynamique
  côté client. Son fonctionnement décrit en 4.4 repose donc sur la connaissance générale de l'outil, **non
  revérifiée mot pour mot sur l'interface actuelle** — limite signalée explicitement dans le texte.
- Moteurs de recherche web tentés en repli : DuckDuckGo
  (`html.duckduckgo.com` et `lite.duckduckgo.com`) a bloqué chaque requête derrière un CAPTCHA anti-robot ; Bing
  (`www.bing.com/search`) a répondu sans CAPTCHA mais avec des résultats entièrement hors sujet (série télévisée
  « Élite », équipementier cycliste, championnat de basket) pour les requêtes « Elite Dangerous Painite/Borann
  hotspot ». elite-dangerous.fandom.com est resté inaccessible (erreur 402) comme lors de la première révision.
  Aucune de ces tentatives n'a donc pu fournir de donnée exploitable, ce qui explique le choix méthodologique de
  cette section : vérifier l'existence structurelle des systèmes via l'API EDSM plutôt que de citer un chiffre ou un
  nom non vérifiable.
