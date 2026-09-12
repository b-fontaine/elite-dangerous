---
id: 30-piraterie-et-pvp
titre: "Piraterie, prédation et PvP subi dans Elite Dangerous"
domaine: combat
entites: [Manifest Scanner, Kill Warrant Scanner, Frame Shift Wake Scanner, Frame Shift Drive Interdictor,
  Hatch Breaker Limpet Controller, Collector Limpet Controller, Convoy Dispersal Pattern, Mobius PvE,
  combat logging, Interstellar Factors, Archon Delaine, Deciat, Shinrarta Dezhra]
mots_cles_en: [piracy, ganking, griefing, combat logging, private group, open play, solo play, mobius,
  block player, report player, manifest scanner, kill warrant scanner, frame shift wake scanner,
  convoy dispersal pattern, hatch breaker, collector limpet, instancing, matchmaking, seal clubbing]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-12
confiance_globale: moyenne
volatilite: moyenne
sources_primaires: ["elite-dangerous.fandom.com (Manifest Scanner, Kill Warrant Scanner, Frame Shift Wake Scanner, Pirate, Convoy Dispersal Pattern, Resource Extraction Site, Influence, Game Mode, Instance, Background Simulation, Griefers, Acronyms & Slang, Combat Logging, Shinrarta Dezhra, Colonia Bridge)", "forums.frontier.co.uk (fils datés sur le ganking, le blocage, l'instanciation, le combat logging et le BGS multi-mode)", "elitepve.com (Mobius, politique et procédure d'adhésion)", "frontier.co.uk/legal (EULA, Code of Conduct)", "corpus interne (02-powerplay, 04-equipements, 06-ingenieurs, 08-combat-spatial, 11-commerce, 21-bgs, 23-jeu-en-groupe)"]
zones_incertaines: ["plafond technique actuel de joueurs par instance : le chiffre de 32 date du Kickstarter (2012-2013) et a été qualifié d'arbitraire par Frontier à l'époque, aucune source datée de 4.4.x ne le confirme ni ne l'infirme", "fiabilité actuelle du blocage d'un joueur sur l'instanciation : un test communautaire de 2017 montrait que rester ami avec un joueur bloqué annulait l'effet du blocage ; aucune source datée de 4.4.x ne confirme si ce comportement a changé", "texte exact et actuellement en vigueur de l'EULA/Code of Conduct sur le combat logging : la formulation « undesirable exploit, not part of the game » circule largement mais n'a pas pu être retracée jusqu'à un texte légal primaire consulté directement (accès HTTP 403 pendant cette recherche)", "taille de la communauté Mobius PvE : 40 000 membres selon la page de politique du groupe, 19 309 selon le compteur du forum consulté le même jour — divergence non résolue", "Colonia Bridge comme point de rassemblement de ganking : hypothèse du plan de cycle, mais aucune source communautaire directe ne l'établit (contrairement à Deciat, Shinrarta Dezhra et aux stations de Community Goal, bien documentés) — à traiter comme un risque diffus, pas un hotspot avéré", "légalité de l'acte de scanner un vaisseau innocent : confirmée non sanctionnée par la page actuelle « Crime & Punishment » du wiki communautaire, mais la seule déclaration explicite trouvée date de 2015, avant les refontes de 2018 et d'Odyssey (2021)", "effet du Squadron (par opposition au Wing) sur le matchmaking d'instance : non documenté par une source officielle", "compatibilité d'instanciation entre lanceurs PC (Steam/Epic/Frontier) : sources communautaires contradictoires", "date exacte du renommage de « Cargo Scanner » en « Manifest Scanner » : largement associée à Odyssey (mai 2021) sans note de patch primaire retrouvée", "montants exacts de bounty vouchers par type de PNJ en zone de conflit ou RES : aucune moyenne fiable, à lire en jeu"]
guides_lies: [2, 4, 6, 8, 11, 21, 23, 27]
---

# Piraterie, prédation et PvP subi dans Elite Dangerous

## En bref

Ce guide assemble en une procédure jouable ce que le corpus documentait jusqu'ici en fragments épars : la **piraterie**
(cibler, interdire, forcer l'éjection de cargaison, récupérer, écouler) et son symétrique, le **PvP non consenti**
subi par la victime. Côté offensif : la chaîne opératoire complète, un seul module de scan de cargaison — le
**Manifest Scanner**, qui n'est pas un quatrième scanner distinct mais le nouveau nom du Cargo Scanner, une confusion
que ce cycle corrige — plus le Kill Warrant Scanner et le Frame Shift Wake Scanner ; où trouver des cibles PNJ
(signaux Convoy Dispersal Pattern, Resource Extraction Sites, lanes en état Boom) ; deux builds chiffrés (Python,
Krait Mk II) ; et le sort légal du butin. Côté défensif : les lieux à risque réellement documentés par la communauté
(Deciat, Shinrarta Dezhra, stations de Community Goal — mais pas le Colonia Bridge, hypothèse non confirmée), la
procédure d'évasion, les groupes privés PvE (Mobius), le blocage et le signalement, et une définition sourcée du
combat logging. Une réserve traverse tout le guide : plusieurs de ces sujets (fréquence réelle du ganking, texte exact
des règles Frontier, fiabilité du blocage) ne sont documentés que par la communauté, jamais par une source primaire
consultée directement.

## Ce que couvre ce guide, et ce qu'il ne couvre pas

Chaque brique de la piraterie existe déjà, séparément, dans le corpus : le Hatch Breaker et le FSD Interdictor
étiquetés « piraterie » dans [04-equipements.md](./04-equipements.md), le mini-jeu d'interdiction et le mass lock dans
[08-combat-spatial.md §2](./08-combat-spatial.md), les marchés noirs et systèmes Anarchy dans
[11-commerce.md §2](./11-commerce.md) et [21-bgs.md](./21-bgs.md), le bonus de marché noir d'Archon Delaine dans
[02-powerplay.md](./02-powerplay.md). Aucun guide ne les relie en une procédure : une requête « comment pirater un
vaisseau » ne pouvait récupérer qu'un fragment de catalogue. Ce guide assemble la chaîne opératoire et ajoute ce qui
manquait entièrement : où chasser, des builds chiffrés, et tout le volet PvP subi (ganking, combat logging, blocage,
groupes PvE), absent à zéro occurrence avant ce cycle. Il ne reproduit pas les mécaniques déjà documentées ailleurs —
interdiction, mass lock, notoriety, marché noir — il y renvoie.

---

## 1. La chaîne opératoire de la piraterie, étape par étape

1. **Choisir une cible chargée** — un PNJ marchand (types courants : Type-9 Heavy, Type-7 Transporter, Lakon lourds)
   repéré sur une lane commerciale ou dans un signal (section 3).
2. **Lire le manifeste avant d'agir** — scanner la cargaison au **Manifest Scanner** (section 2) pour vérifier qu'elle
   vaut le coup avant d'engager l'interdiction : un vaisseau vide n'a rien à céder.
3. **Interdire proprement** — déclencher le mini-jeu d'interdiction en supercroisière ; voir la mécanique complète en
   [08-combat-spatial.md §2.1](./08-combat-spatial.md#21-le-mini-jeu-dinterdiction--résister-ou-se-soumettre).
4. **Mass locker la cible** — une fois sorti en espace normal, le Mass Lock Factor du vaisseau du pirate (et de tout
   vaisseau tiers massif à proximité) empêche la cible de recharger son FSD tant qu'elle reste à portée ; voir
   [08-combat-spatial.md §2.2](./08-combat-spatial.md#22-le-mass-lock-mass-lock-factor--empêcher-une-cible-de-sauter).
5. **Forcer l'éjection de cargo** — un ou plusieurs **Hatch Breaker Limpet Controllers** endommagent la trappe de
   soute et forcent l'éjection de conteneurs de marchandise, sans nécessairement détruire le vaisseau cible.
6. **Récupérer** — un **Collector Limpet Controller** ramasse les conteneurs éjectés flottant dans l'espace.
7. **Écouler** — la cargaison récupérée est marquée **volée** (*stolen*) : elle ne se revend que sur un marché noir ou
   via un Interstellar Factors Contact (section 5).

---

## 2. Les scanners de piraterie : un seul module renommé, pas quatre

**Correction au plan de ce cycle.** Le plan initial de ce chantier attendait un tableau « des 3 scanners plus le
Manifest Scanner », en supposant quatre modules distincts — hypothèse reprise du guide interne
[06-ingenieurs.md](./06-ingenieurs.md), qui liste « Kill Warrant, Wake, Cargo, Manifest Scanner » comme s'il
s'agissait de quatre modules séparés. Ce n'est pas le cas : le **Manifest Scanner** est le nom actuel du **Cargo
Scanner**, renommé (et étendu au scan des cabines passagers) — pas un module supplémentaire. Il n'existe donc que
**trois** scanners utilitaires de piraterie, tous en emplacement utilitaire de classe 0 :

| Scanner | Rôle | Portée (E→A) | Temps de scan | Alerte la cible ? |
|---|---|---|---|---|
| **Manifest Scanner** (ex-Cargo Scanner) | Révèle le contenu de la soute d'un vaisseau ciblé | 2 000 à 4 000 m | 10 s, à maintenir | Oui — acte intrusif, la cible est immédiatement alertée |
| **Kill Warrant Scanner** | Révèle les primes émises par d'autres juridictions sur une cible | 2 000 à 4 000 m | 10 s, à maintenir | Oui |
| **Frame Shift Wake Scanner** | Révèle la destination d'une cible via son sillage (*high wake*) après un saut hyperespace | 2 000 à 4 000 m | 10 s, à maintenir | Non documenté dans un sens ou l'autre |

Portées et temps de scan proviennent des tableaux déjà chiffrés de
[04-equipements.md](./04-equipements.md#utilitaires-de-hardpoint-classe-0--scanners-contre-mesures-et-lanceurs-de-leurres)
(source EDCD/coriolis-data), recoupés avec le wiki communautaire, qui donne la même grille de portée (2 à 4 km). Le
**low wake** (transition supercroisière, dans le même système) se lit sans équipement spécial par n'importe quel
vaisseau ; seul le **high wake** (saut hyperespace) exige le Frame Shift Wake Scanner — voir
[08-combat-spatial.md §2.3](./08-combat-spatial.md#23-low-wake-et-high-wake--traquer-une-cible-au-frame-shift-wake-scanner).

**Légalité de l'acte de scanner.** D'après la documentation communautaire actuelle, scanner un vaisseau « Clean »
n'est listé nulle part comme un délit pour le scanneur : c'est la cible, si elle transporte du fret volé ou illégal,
qui écope d'une amende une fois démasquée — pas l'auteur du scan. Un vaisseau scanné peut réagir : fuir, activer le
*Silent Running*, déployer ses affûts (ce qui interrompt un scan de sécurité par précaution) ou larguer du chaff pour
empêcher l'achèvement d'un Kill Warrant Scanner. Attention : scanner une prime au KWS ne rend pas pour autant licite
d'attaquer une cible « Clean » dans le système courant — sauf en système **Anarchy**, où tous les vaisseaux
apparaissent « Clean » localement par défaut, ce qui rend le Kill Warrant Scanner indispensable à la chasse aux primes
qui s'y pratique.

**Fix apporté à ce cycle.** [04-equipements.md](./04-equipements.md) nommait ce module « Cargo Scanner » ;
[06-ingenieurs.md](./06-ingenieurs.md) le comptait en plus comme un module séparé nommé « Manifest Scanner ». Les deux
sont corrigés pour refléter un seul module sous son nom actuel.

---

## 3. Où pirater : signaux, sites de minage et lanes commerciales

- **Convoy Dispersal Pattern** — signal (USS) spontané apparaissant dans les systèmes peuplés, en priorité sur les
  lanes commerciales et dans la sphère d'influence d'un système. Cinq niveaux de menace (0 à 4) : du petit groupe de
  vaisseaux neutres scannables et pillables sans risque (niveau 0) jusqu'à un convoi de Type-9 Heavy escorté par des
  PNJ armés que le joueur peut choisir d'attaquer ou de défendre (niveau 2, récompense en crédits ou en réputation
  selon le camp choisi).
- **Resource Extraction Sites (RES)** — voir
  [08-combat-spatial.md §4.1](./08-combat-spatial.md#41-resource-extraction-sites-res-et-hazardous-res-hazres) pour le
  détail. Quatre intensités (Low, Regular, High, **Hazardous**) déterminent la densité de PNJ ; en HazRES, les crimes
  ne sont pas signalés à la sécurité locale, ce qui en fait un terrain de chasse dense en cibles recherchées de toute
  taille sans réponse de sécurité organisée.
- **Lanes commerciales et état économique Boom** — les PNJ marchands transportent une cargaison reflétant l'économie
  de leur station d'origine (minerais/métaux en économie Extraction, machines/biens de consommation en Industrial) ;
  un système en état **Boom** augmente le nombre de missions commerciales et, avec l'état secondaire **Pirate Attack**
  (plus probable en économie positive), la fréquence des interdictions de marchands par des PNJ pirates. Un terrain
  classique consiste à patrouiller juste au-delà des zones de non-tir d'une station riche, ou à suivre le sillage des
  gros transporteurs qui en sortent.

---

## 4. Deux builds pirates chiffrés : Python et Krait Mk II

Les deux builds ci-dessous suivent le gabarit déjà établi en
[08-combat-spatial.md §8.5](./08-combat-spatial.md#85-trois-builds-de-combat-chiffrés-vulture-federal-corvette-fer-de-lance) :
les choix de modules sont des configurations de référence de la méta communautaire, à valider dans un outil de
configuration à jour ([16-outils.md](./16-outils.md)) ; les caractéristiques de châssis viennent d'EDCD/coriolis-data,
déjà recalées dans [03-vaisseaux.md](./03-vaisseaux.md). Aucun des deux vaisseaux n'exige de rang de superpuissance.

**Build A — Python « Corsaire polyvalent »**

| Emplacement | Choix |
|---|---|
| Hardpoints (3× Large + 2× Medium) | Armement mixte gimbal (multi-canons ou canons à fragmentation) pour forcer la reddition sans détruire la cible avant récupération du butin |
| Utilitaires (4×) | Manifest Scanner, Kill Warrant Scanner, Frame Shift Wake Scanner, Chaff Launcher |
| Optionnels internes | Frame Shift Drive Interdictor classe 4A ; 2× Hatch Breaker Limpet Controller ; 1× Collector Limpet Controller ; Cargo Racks dans le reste des emplacements |
| Bouclier | Générateur bi-weave + boosters — Python bien pourvu en emplacements internes de classe 5-6 pour ce compromis |
| Châssis | 3 Large + 2 Medium + 4 util. ; emplacements optionnels 3×6+2×5+1×4+2×3+1×2+1×1 ; dureté de coque 65 — EDCD/coriolis-data, `ships/python.json`, commit 0db9234b5b9c |
| Prix du châssis nu | 56 978 180 Cr (Faulcon DeLacy), aucun rang requis |
| Source | Archétype communautaire multi-rôle adapté à la piraterie (forums, Coriolis, EDSY) |

**Build B — Krait Mk II « Intercepteur léger »**

| Emplacement | Choix |
|---|---|
| Hardpoints (3× Large + 2× Medium) | Configuration plus orientée dégâts que le Python (silhouette plus maniable), multi-canons/canons gimbal |
| Utilitaires (4×) | Manifest Scanner, Kill Warrant Scanner, Frame Shift Wake Scanner, Heat Sink Launcher |
| Optionnels internes | Frame Shift Drive Interdictor classe 4A ; 2× Hatch Breaker Limpet Controller ; 1× Collector Limpet Controller ; Cargo Racks dans le reste |
| Bouclier | Bi-weave + boosters, priorité à la maniabilité pour l'interdiction et la fuite |
| Châssis | 3 Large + 2 Medium + 4 util. ; emplacements optionnels 2×6+2×5+1×4+2×3+1×2+1×1 ; dureté de coque 55 — EDCD/coriolis-data, `ships/krait_mkii.json`, commit 0db9234b5b9c |
| Prix du châssis nu | 45 814 210 Cr (Faulcon DeLacy), aucun rang requis |
| Source | Archétype communautaire, moins cher et plus véloce que le Python au prix d'une coque plus fragile |

Les deux châssis partagent le même gabarit d'affûts (3 Large + 2 Medium + 4 utilitaires) et proviennent du même
fabricant ; le choix entre eux relève d'un arbitrage maniabilité (Krait Mk II) contre robustesse et volume de soute
(Python) — voir [03-vaisseaux.md](./03-vaisseaux.md) pour les deux tableaux de référence chiffrés complets.

---

## 5. Le statut légal du butin

Une cargaison récupérée par Hatch Breaker/Collector est marquée **volée** (*stolen*) : les marchés légaux la
refusent. Deux canaux d'écoulement, déjà détaillés en
[11-commerce.md §2.3 et §2.5](./11-commerce.md#23-commerce-noir-et-marché-illégal-smuggling) : le **marché noir**
(*Black Market*), présent surtout en systèmes Anarchy, et un **Interstellar Factors Contact**, qui permet de payer une
prime émise dans un autre système sans s'y déplacer (moyennant commission) mais ne réduit **pas** la notoriety, dont
la décroissance suit son propre délai — voir
[08-combat-spatial.md §7.2](./08-combat-spatial.md#72-devenir-wanted-et-interstellar-factors). Un vaisseau qui accumule
les infractions graves voit sa notoriety monter et se voit refuser l'accostage dans les stations légitimes du système
concerné, indépendamment du paiement de ses primes. Le Power **Archon Delaine** (Kumo Crew), déjà documenté en
[02-powerplay.md](./02-powerplay.md), offre à ses partisans un bonus de **+30 % sur les profits du marché noir** et une
réduction ou suppression des amendes pour activité criminelle en territoire qu'il contrôle.

---

## 6. Impact BGS, piraterie PvP contre PvE, étiquette

La piraterie et la contrebande contribuent à l'influence de la faction qui contrôle le marché noir où le butin est
écoulé — généralement une faction en Anarchie — un levier déjà quantifié en
[21-bgs.md §5.5](./21-bgs.md#55-autres-leviers-bgs--contrebande-dons-et-sauvetage). La piraterie **PvE** (contre des
PNJ, section 3) ne pose pas de question d'étiquette : c'est une activité de jeu normale. La piraterie **PvP** (contre
un autre joueur) en pose une, traitée en détail à la section 7 : la communauté distingue nettement le pirate qui
demande une rançon en cargaison et laisse repartir sa cible du **ganker** qui recherche la destruction sans intérêt
pour le butin.

---

## 7. Survivre au PvP non consenti

### 7.1 Lieux à risque documentés par la communauté

Ces lieux existent déjà dans le corpus sans jamais y être signalés comme dangereux :

- **Deciat** (base de l'ingénieure Felicity Farseer, la première que la quasi-totalité des nouveaux joueurs
  débloquent) — documenté depuis 2020 sur les forums officiels comme un point de guet classique contre des vaisseaux
  non armés en route vers l'ingénierie.
- **Shinrarta Dezhra / Jameson Memorial** — hub de fin de partie à accès permis (voir
  [01-lore.md](./01-lore.md)), documenté depuis 2017 comme lieu où des vaisseaux moyens endommagés ou sans bouclier
  (explorateurs de retour, notamment) sont pris pour cible : le risque financier est nul pour l'attaquant, qui n'y
  perd presque jamais son propre vaisseau.
- **Stations où se déroule une Community Goal active** — la forte concentration de joueurs en Open qu'attire une CG
  active en fait, d'après des témoignages de joueurs, une cible privilégiée de PvP non consenti pendant l'événement.
- **Colonia Bridge** — cité par le plan de ce cycle comme hotspot documenté, cette recherche ne le confirme **pas** :
  aucun témoignage direct de ganking ciblé sur les mégaships du Colonia Bridge n'a été trouvé, seulement des mises en
  garde génériques sur le risque diffus d'un long trajet et la recommandation de voyager en groupe. À traiter comme
  un risque plausible mais **faiblement documenté**, à ne pas mettre sur le même plan que les trois lieux ci-dessus.

### 7.2 Procédure d'évasion

La défense contre une interdiction ou un engagement PvP repose sur des mécaniques déjà chiffrées ailleurs dans le
corpus plutôt que sur un module dédié : soumettre volontairement à l'interdiction pour contrôler sa position de
sortie, gérer les pips SYS/ENG pendant le mini-jeu (section 1, renvoi 08 §2.1), booster hors du rayon de mass lock
avant de charger un **high wake** — jamais un low wake sous mass lock, qui laisse la cible à portée — puis Silent
Running, Heat Sink et Chaff pour couvrir la manœuvre. Détail complet en
[08-combat-spatial.md §2](./08-combat-spatial.md#2-interdiction-en-supercroisière-et-évasion) et §9.

### 7.3 Builds de fuite pour vaisseaux de fret

[11-commerce.md §6](./11-commerce.md#6-configurations-recommandées-dun-vaisseau-de-commerce) détaille déjà
l'arbitrage soute/défense, les modules de fuite (FSD à portée maximisée, Heat Sink, Chaff, Point Defence) et la
stratégie anti-interdiction combinée (ingénierie, gestion des pips, réduction du nombre de sauts) pour un vaisseau de
fret — ce guide n'en reproduit pas le détail.

### 7.4 Groupes privés PvE : Mobius et équivalents

Un **Groupe privé** (Private Group) n'est pas un mode de jeu distinct mais une restriction d'instanciation à
l'intérieur du même univers persistant : seuls les commandants explicitement invités par le propriétaire du groupe y
apparaissent. **Mobius PvE** est le plus connu de ces groupes, fondé sur une règle unique : interdiction totale du PvP
non consenti, quelle qu'en soit la raison, y compris contre un commandant recherché (bounty). Pour le rejoindre sur
PC : remplir le formulaire d'inscription du site du groupe, puis en jeu, Social > Groups, rechercher « MOBIUS PVE
EURASIA », « MOBIUS PVE AMERICA » ou « MOBIUS FACTIONS » et envoyer une demande d'adhésion (acceptée manuellement par
un administrateur, pas de code). Les violations constatées (avec capture d'écran à l'appui) entraînent l'expulsion de
tous les sous-groupes Mobius, jusqu'au bannissement permanent pour les cas les plus graves. La taille de la
communauté reste incertaine : 40 000 membres selon la page de politique du groupe, 19 309 selon le compteur du forum
consulté le même jour — un écart non résolu par cette recherche.

### 7.5 Blocage, signalement et combat logging

- **Bloquer un joueur** (Social > Friends > sélectionner le CMDR > Block Player, ou depuis le panneau Comms en jeu) ne
  garantit pas, à en juger par les tests communautaires disponibles, une non-instanciation totale : un test de 2017
  montrait que rester **ami** avec un joueur bloqué annulait l'effet du blocage sur l'instanciation, et des fils plus
  récents suggèrent que le blocage coupe les communications sans bloquer l'instanciation de façon fiable. Aucune
  source datée de la version 4.4.0.x ne confirme si ce comportement a changé : ne pas présenter le blocage comme une
  garantie absolue.
- **Signaler un joueur** se fait via Social > Report en jeu (nom du CMDR + type de comportement fautif), ou par
  ticket de support Frontier pour la triche ou le harcèlement.
- **Combat logging** désigne la déconnexion brutale du client (processus tué, réseau coupé) pendant un engagement,
  pour empêcher l'enregistrement d'une issue défavorable — par opposition à une sortie normale par le menu du jeu, qui
  impose une temporisation d'environ 15 secondes avant déconnexion effective. Les sources secondaires convergentes
  rapportent que Frontier qualifie cette pratique d'« exploit indésirable, ne faisant pas partie du jeu » et
  susceptible de sanction — mais aucun texte légal primaire (EULA, Code of Conduct) nommant explicitement le terme
  n'a pu être consulté directement pour confirmer ce libellé dans la version actuelle.

---

## Voir aussi

- **[Combat spatial](./08-combat-spatial.md)** — interdiction, mass lock, low/high wake, crime et notoriety, modes de
  jeu Open/Groupe privé/Solo : le socle mécanique que ce guide assemble en procédure de piraterie et de survie.
- **[Équipements](./04-equipements.md)** — statistiques complètes des scanners, du FSD Interdictor et des limpets.
- **[Ingénieurs](./06-ingenieurs.md)** — modifications disponibles sur les scanners utilitaires.
- **[Commerce](./11-commerce.md)** — marché noir, contrebande, configurations défensives d'un vaisseau de fret.
- **[Le Background Simulation (BGS)](./21-bgs.md)** — impact de la piraterie et de la contrebande sur l'influence.
- **[Politique et Powerplay](./02-powerplay.md)** — Archon Delaine et le bonus de marché noir.
- **[Wings, Multicrew et CQC](./23-jeu-en-groupe.md)** — mécanique du réseau, de l'instanciation et du Wing (navlock).
- **[Vaisseaux](./03-vaisseaux.md)** — fiches complètes du Python et du Krait Mk II.
- **[Missions, réputation et rangs](./29-missions-reputation-et-rangs.md)** — réputation de faction, dont le statut
  Allié conditionne certains déblocages cités ici.

## Sources

### Sources distantes, consultées le 12 septembre 2026

- `https://elite-dangerous.fandom.com/wiki/Manifest_Scanner` — identité Cargo Scanner/Manifest Scanner, portée, temps
  de scan, usage et légalité.
- `https://elite-dangerous.fandom.com/wiki/Kill_Warrant_Scanner`, `Frame_Shift_Wake_Scanner` — spécifications et
  usage des deux autres scanners.
- `https://elite-dangerous.fandom.com/wiki/Pirate`, `Convoy_Dispersal_Pattern`, `Resource_Extraction_Site`,
  `Influence`, `Market_Economy` — terrains de chasse et équipement type d'un pirate.
- `https://elite-dangerous.fandom.com/wiki/Game_Mode`, `Instance`, `Background_Simulation` — modes de jeu,
  instanciation, partage du BGS entre modes.
- `https://elite-dangerous.fandom.com/wiki/Griefers`, `Acronyms_%26_Slang`, `Combat_Logging` — définitions
  communautaires du ganking et du combat logging.
- `https://elite-dangerous.fandom.com/wiki/Shinrarta_Dezhra`, `Colonia_Bridge` — hub de fin de partie et
  infrastructure de la route Colonia.
- `forums.frontier.co.uk` — fils datés cités ponctuellement pour l'instanciation (architecture réseau, NAT/CGNAT), le
  ganking (Deciat, Jameson Memorial, Community Goals), le blocage, le combat logging et la parité BGS entre modes ;
  voir le détail par affirmation dans le corps du guide.
- `https://www.elitepve.com/` (Mobius PvE) — politique du groupe, procédure d'adhésion, effectifs.
- `https://www.frontier.co.uk/legal/elite-dangerous/eula`, `frontier-code-of-conduct` — clauses de comportement entre
  joueurs.
- `https://issues.frontierstore.net/issue-detail/68416` — signalement communautaire d'un écart de mérites Powerplay
  entre Solo et jeu groupé (statut de résolution non vérifié).

### Sources du corpus relues pour ce guide

- [08-combat-spatial.md](./08-combat-spatial.md) — interdiction, mass lock, wakes, crime/notoriety, modes de jeu,
  gabarit des builds chiffrés (§8.5), repris ici sans modification.
- [11-commerce.md](./11-commerce.md) — marché noir, contrebande, configurations défensives (§6), repris sans
  modification.
- [21-bgs.md](./21-bgs.md), [02-powerplay.md](./02-powerplay.md) — impact BGS de la piraterie et bonus Archon
  Delaine, repris sans modification.
- [04-equipements.md](./04-equipements.md), [06-ingenieurs.md](./06-ingenieurs.md) — corrigés à ce cycle pour
  refléter un seul module « Manifest Scanner » plutôt que deux entrées distinctes (voir section 2).

### Méthode et limites

Ce guide agrège cinq recherches indépendantes menées en parallèle (réseau et instanciation, groupes PvE et modération,
scanners, terrains de chasse et lieux à risque, culture PvP), chacune sourcée et datée séparément puis harmonisée
manuellement. Une large part des affirmations sur le ganking, le blocage et le combat logging repose sur des extraits
indexés par moteur de recherche plutôt que sur une lecture intégrale des pages sources (plusieurs domaines —
elite-dangerous.fandom.com, forums.frontier.co.uk, frontierstore.net — ont opposé des blocages anti-robot pendant
cette session) : la confiance est notée en conséquence pour chaque affirmation, et aucun chiffre de fréquence du
ganking n'a été retenu faute de source statistique fiable.
