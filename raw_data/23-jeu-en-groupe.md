---
id: 23-jeu-en-groupe
titre: "Wings, Multicrew et CQC : jouer à plusieurs dans Elite Dangerous"
domaine: social
entites: [Wing, Multicrew, CQC, "Elite Dangerous: Arena", nav-lock, chasseur embarqué, F63 Condor, Taipan, Gu-97, Trident,
  Crew Lounge, équipage PNJ, Squadron, Utopixx Entertainment, instance, CGNAT, matchmaking, Fuel Rats, Hull Seals, DSSA,
  Fleetcomm, Buckyball Racing Club, Hutton Orbital Truckers]
mots_cles_en: [wing, multicrew, cqc, close quarters combat, arena, nav-lock, ship-launched fighter, slf, fighter hangar,
  crew lounge, npc crew, bounty voucher, combat bond, telepresence, wing mission, instancing, peer-to-peer,
  matchmaking, nat type, cgnat, port forwarding, fuel rats, hull seals, deep space support array, buckyball racing,
  canyon racing, fleetcomm]
version_jeu_couverte: "4.4.0.x (mécaniques introduites entre 2015 et 2018, sans refonte majeure depuis)"
branche: live
date_verification: 2026-09-13
confiance_globale: moyenne
volatilite: basse
sources_primaires: [Wikipédia EN/FR/DE, fiche Steam officielle Elite Dangerous (appid 359320), guides Steam Community,
  "elite-dangerous.fandom.com (Instance, Game Mode, Background Simulation)", "forums.frontier.co.uk (architecture réseau, NAT/CGNAT, matchmaking, parité BGS entre modes)",
  "fuelrats.com, hullseals.space, forums Frontier (DSSA, FleetComm, Buckyball Racing Club) — voir 01-lore.md §7.7 pour le détail par groupe"]
zones_incertaines: ["date précise et numéro de version d'introduction des Wings en 2015",
  "date précise d'introduction du CQC dans le jeu de base, avant le renommage en Arena",
  "portée exacte de l'enrichissement des missions de wing par Beyond Chapter One en 2018",
  "valeurs précises du partage des revenus Multicrew entre capitaine et invités",
  "nombre maximal d'invités humains simultanés en Multicrew (deux, non confirmé)",
  "paliers intermédiaires de frais et de commission de l'équipage PNJ du Crew Lounge",
  "noms exacts et nombre des modes de jeu du CQC (Deathmatch / Team Deathmatch / Domination supposés)",
  "promotion gratuite d'Elite Dangerous: Arena en juillet 2016, non recoupée",
  "statistiques de fréquentation du CQC en 2025-2026",
  "plafond technique actuel de joueurs par instance : le chiffre de 32 date du Kickstarter (2012-2013) et n'est confirmé par aucune source datée de la version 4.4.x",
  "effet du Squadron sur le matchmaking d'instance : non documenté par une source officielle",
  "compatibilité d'instanciation entre lanceurs PC (Steam/Epic/Frontier) : sources communautaires contradictoires",
  "statut de résolution d'un signalement communautaire d'écart de mérites Powerplay entre Solo et jeu groupé (ticket officiel non lu directement)",
  "statut d'activité 2025-2026 non confirmé pour plusieurs groupes communautaires cités en 7.1-7.3 (détail en 01-lore.md §7.7)"]
guides_lies: [1, 2, 3, 4, 8, 19, 21, 22, 27, 30]
---

# Wings, Multicrew et CQC : jouer à plusieurs dans Elite Dangerous

## En bref

*Elite Dangerous* propose trois façons distinctes de jouer à plusieurs. Le **Wing** (escadre) réunit jusqu'à
**quatre joueurs**, chacun dans son propre vaisseau, dans le monde persistant : **nav-lock** (verrouillage de
navigation) partagé, panneau Wing affichant position et cap des membres, missions de wing partagées, et surtout
**primes et combat bonds versés à pleine valeur à chaque contributeur**, sans division — d'où l'intérêt de la chasse
aux primes en Wing dans les **RES** (sites d'extraction de ressources) et les **CNB** (Nav Beacons compromis). Le
**Multicrew**, livré le **11 avril 2017** avec l'Update 2.3 « The Commanders », place jusqu'à trois
Commandants sur un **même** vaisseau : le capitaine pilote, les invités tiennent les tourelles ou pilotent un **chasseur
embarqué** (*Ship-Launched Fighter*, rayon d'environ 30 km) en télé-présence holographique, dix vaisseaux disposant
d'une baie de chasseurs. Le **CQC** (*Close Quarters Combat*, [glossaire](./00-glossaire.md)), décliné en produit autonome **Elite Dangerous: Arena** le
**16 février 2016** puis retiré de la vente le **10 février 2017**, est un mode d'arène PvP arcade hors du monde
persistant, doté d'un rang propre suivi par la **Pilots Federation**. À ne pas confondre avec le **Squadron**, ni avec
l'**équipage PNJ** du **Crew Lounge** (comptoir de recrutement d'équipage). Une nouvelle section explique enfin
**pourquoi deux joueurs ne se voient pas toujours** : l'instanciation pair-à-pair, distincte du BGS et de Powerplay qui
restent partagés entre tous les modes de jeu, et les causes réseau (NAT, ou traduction d'adresse réseau, et CGNAT)
d'un échec d'instanciation. Une dernière section documente les activités organisées **hors de tout outil Frontier** —
courses (Buckyball, SRV, canyon), rôle logistique des **Fleet Carriers** (porte-vaisseaux) relais du réseau **DSSA**
dans les grandes expéditions, et procédure pour devenir secouriste bénévole (**Fuel Rats**,
**Hull Seals**).

## Introduction — Wing, Multicrew et CQC, trois échelles de jeu à plusieurs

Wings, Multicrew et CQC sont les trois mécaniques par lesquelles Elite Dangerous fait jouer plusieurs Commandants ensemble, à trois échelles différentes : le **Wing** (escadre) réunit jusqu'à quatre joueurs qui pilotent chacun leur propre vaisseau dans le monde persistant ; le **Multicrew** place plusieurs joueurs à bord d'un **même** vaisseau, avec des rôles distincts ; le **CQC** (Close Quarters Combat) est un mode d'arène PvP en petits vaisseaux, entièrement séparé du monde persistant, avec son propre système de progression. Ces trois systèmes sont indépendants et peuvent se combiner (un Multicrew peut par exemple constituer un membre d'un Wing plus large), mais ils répondent à des besoins différents et sont fréquemment confondus entre eux, ainsi qu'avec deux autres notions voisines qu'il convient d'écarter d'emblée :

- Le **Squadron** (escadron) est une structure sociale *persistante*, avec adhésion, rôles administratifs et rattachement possible à une faction mineure — à ne pas confondre avec le Wing, qui est un simple groupement *temporaire* de session. Voir [22-squadrons.md](./22-squadrons.md) pour ce système.
- L'**équipage PNJ** recruté au Crew Lounge (un tourelleur ou pilote de chasseur contrôlé par l'IA, moyennant un pourcentage de commission) est un système plus ancien et entièrement distinct du Multicrew entre joueurs humains, bien qu'il en partage l'esthétique (un poste de tourelleur, un chasseur embarqué). Les deux sont détaillés séparément plus bas pour éviter toute confusion.

> **Note sur la fraîcheur des données.** Wings (2015), CQC (2015-2016) et Multicrew (2017) sont des mécaniques anciennes et stables : elles n'ont fait l'objet d'aucune refonte majeure depuis leur introduction, contrairement à Powerplay ou à la Colonisation. Lors de la rédaction de cette version, Wikipédia (EN/FR/DE), la fiche Steam officielle du jeu et les guides Steam Community ont pu être consultés avec succès et ont permis de confirmer plusieurs points clés : la limite de 4 joueurs par Wing, la date de sortie du Multicrew, les dates du lancement et du retrait de vente d'*Elite Dangerous: Arena*, ainsi que les noms des chasseurs embarqués. En revanche, le site officiel elitedangerous.com, les forums Frontier et les wikis communautaires (Fandom, wiki.gg) sont restés inaccessibles depuis cet environnement (erreurs HTTP 402/403/404). Les quelques points qui n'ont pas pu être recoupés par une source consultable restent signalés explicitement par un encadré « à revérifier » et devront être confirmés via elitedangerous.com/codex ou les forums Frontier avant toute publication faisant autorité.

---

## 1. Vue d'ensemble comparative : Wing, Multicrew, CQC et Squadron

| Mécanique | Échelle | Persistance | Où ça se joue | Objectif principal |
|---|---|---|---|---|
| **Wing** (escadre) | Jusqu'à 4 joueurs, chacun dans son propre vaisseau | Temporaire (dure la session) | Monde persistant (Open, Groupe privé, Solo) | Coopération en combat, exploration, minage, missions groupées |
| **Multicrew** | Jusqu'à 3 joueurs sur **un seul** vaisseau (1 capitaine + invités) | Temporaire (dure la session) | Monde persistant | Coopération à bord d'un vaisseau moyen/gros (tourelles, chasseur embarqué) |
| **CQC** (Close Quarters Combat / Arena) | Matchs à petite échelle (équipes) | Aucune (matchmaking — appariement des joueurs — par partie) | Arènes dédiées, hors monde persistant | PvP arcade en petits vaisseaux, progression de rang séparée |
| **Squadron** (pour mémoire) | Dizaines à centaines de membres | Persistante (adhésion durable) | Structure administrative + monde persistant | Communauté, classements, Squadron Carrier — voir [22-squadrons.md](./22-squadrons.md) |

---

## 2. Les Wings (escadres)

### 2.1 Formation et taille d'un Wing : quatre joueurs au maximum

Un Wing rassemble le Commandant qui l'initie et **jusqu'à trois autres joueurs**, soit **quatre joueurs au maximum** au total, chacun aux commandes de son propre vaisseau. Cette limite est confirmée par la fiche officielle du jeu sur Steam, qui indique explicitement : *« Forge your path solo or with up to three friends in a Wing »*. L'invitation se fait via le panneau Comms/Contacts en jeu (par pseudonyme de Commandant) ; rejoindre un Wing ne coûte rien et ne nécessite aucune prérequis de rang.

Un Wing n'a pas de hiérarchie formelle comparable à celle d'un Squadron : il n'existe pas de rôle « chef de wing » disposant de permissions particulières au sens administratif — n'importe quel membre peut inviter de nouveaux joueurs tant que le groupe n'a pas atteint sa taille maximale.

### 2.2 Le nav-lock partagé entre membres d'un Wing

Chaque membre d'un Wing peut activer un **nav-lock** sur un autre membre depuis le panneau Wing du HUD. Une fois le nav-lock actif, la prochaine destination de saut FSD, de supercruise ou d'accostage sélectionnée par le membre ciblé est automatiquement reprise comme cible par celui qui a activé le lock. Concrètement, cela permet de suivre un chef de formation de système en système, ou de station en station, sans avoir à re-sélectionner soi-même chaque destination — un outil précieux pour garder un groupe soudé lors de longs trajets ou d'opérations en formation serrée.

### 2.3 Wing : partage des primes, des combat bonds et du rang de combat

Le principal attrait mécanique du Wing en combat tient à la façon dont il traite les récompenses :

- **Bounty vouchers et combat bonds** : chaque membre du Wing présent dans la même instance et ayant contribué à la destruction d'une cible hostile reçoit son **propre** voucher, à **pleine valeur** — le gain n'est pas divisé entre les participants. Un groupe de quatre joueurs qui abat ensemble un même vaisseau touche donc chacun l'intégralité de la prime, ce qui explique pourquoi la chasse aux primes en Wing dans les Resource Extraction Sites (RES) ou les Compromised Nav Beacons (CNB) est particulièrement lucrative comparée au farming en solo.
- **Progression de rang de combat** : de la même façon, l'expérience de rang de combat est créditée à tous les membres du Wing ayant contribué à la destruction, pas uniquement à celui qui porte le coup fatal. Ce rang de combat (Harmless → Elite) reste toutefois le même système que celui utilisé hors Wing — voir [08-combat-spatial.md](./08-combat-spatial.md) pour l'échelle complète et les mécaniques de notoriety/crime associées.

### 2.4 Les missions de wing, partagées entre les membres

Certaines missions distribuées aux tableaux des stations peuvent être partagées avec l'ensemble d'un Wing : accepter une mission de ce type la propage aux autres membres présents, qui peuvent alors y contribuer et en toucher les récompenses sans avoir à l'accepter individuellement au préalable. Cette fonctionnalité existait dès les premières versions du Wing, et a été enrichie par de nouvelles missions de wing lors de la saison **Beyond** (Update 3.0 « Beyond Chapter One », sortie le **27 février 2018**) ; la portée exacte de cet enrichissement (nouveaux types de missions vs. simple extension du pool existant) n'a pas pu être établie avec certitude à partir des sources consultées.

### 2.5 Suivi des membres : le panneau Wing, pas une « balise » physique

Contrairement à ce que le terme pourrait suggérer, il n'existe pas d'objet de balisage déployable propre au Wing. Le **panneau Wing** du HUD affiche en permanence, pour chaque membre présent dans la même instance, sa position relative, sa distance et son cap — un affichage de contact continu qui fait office de repère de navigation en formation, sans qu'aucun module ou objet physique ne soit à équiper ou à larguer.

### 2.6 Limites d'instance réseau d'un Wing

Le partage de primes, l'affichage mutuel et le nav-lock supposent que les membres du Wing soient dans la **même instance réseau** — c'est-à-dire à portée physique raisonnable, dans le même système, avec une connexion suffisamment stable pour que le serveur les regroupe dans la même simulation locale. Au-delà d'une certaine distance dans un système (ou en cas de conditions réseau dégradées), un membre peut se retrouver désynchronisé dans une instance séparée : les autres membres ne le voient alors plus, et il ne bénéficie plus du partage de primes pour les cibles détruites hors de sa propre instance.

### 2.7 Wing et Squadron : deux notions à ne pas confondre

Le Wing est un regroupement **temporaire**, formé et dissous à la volée pendant une session de jeu, sans structure administrative ni persistance au-delà de la déconnexion. Le **Squadron**, à l'inverse, est une structure sociale **persistante** : adhésion durable, rôles et permissions, rattachement possible à une faction mineure du BGS, Squadron Carrier et Squadron Bank partagés, classements. Un joueur peut très bien appartenir à un Squadron de plusieurs centaines de membres tout en ne formant un Wing qu'avec trois d'entre eux le temps d'une session de chasse aux primes. Le détail du système Squadron est traité dans [22-squadrons.md](./22-squadrons.md).

---

## 3. Le Multicrew

### 3.1 Le Multicrew : présentation et introduction en avril 2017

Le Multicrew place plusieurs Commandants humains à bord d'un **même** vaisseau : l'un est le **capitaine** (celui qui possède le vaisseau et en garde les commandes de pilotage), les autres sont des **invités** qui occupent des rôles complémentaires. Le Multicrew a été livré avec l'**Update 2.3 « The Commanders »**, sortie le **11 avril 2017** — Wikipédia confirme que cette mise à jour « consiste en un Commander Creator (Holo-Me), le Multicrew et diverses autres fonctionnalités » — dans le cadre du cycle de contenu de l'extension payante **Horizons** (2015-2017), aux côtés du Commander Creator (Holo-Me).

### 3.2 Vaisseaux compatibles avec le Multicrew

Le Multicrew ne concerne que les vaisseaux dotés d'un poste de tourelleur et/ou d'une baie de hangar à chasseurs — typiquement les gabarits medium et large. Les petits chasseurs (Sidewinder, Eagle, Viper, etc.) ne disposent d'aucun poste d'équipage et ne peuvent donc pas accueillir d'invités. Voir [03-vaisseaux.md](./03-vaisseaux.md) pour les fiches techniques complètes des vaisseaux et [04-equipements.md](./04-equipements.md) pour l'équipement des postes de tourelleur.

### 3.3 Multicrew : le rôle du capitaine

Le capitaine conserve seul les commandes de pilotage du vaisseau principal (navigation, FSD, supercruise, accostage) pendant toute la session Multicrew. Point important : **le capitaine ne peut pas lui-même piloter un chasseur embarqué** pendant une session Multicrew — ce rôle est réservé aux invités.

### 3.4 Multicrew : le rôle du tourelleur et la télé-présence holographique

Un invité peut prendre le contrôle manuel d'une ou plusieurs tourelles multi-canons du vaisseau hôte depuis un poste dédié. Sur le plan narratif, chaque invité connecté en Multicrew apparaît sous forme d'**hologramme en télé-présence** visible par les autres membres d'équipage à bord du vaisseau principal — un habillage immersif propre à ce mode, qu'il occupe le poste de tourelleur ou qu'il pilote un chasseur embarqué.

### 3.5 Rôle du chasseur embarqué en télé-présence (Ship-Launched Fighter)

Un invité peut également prendre les commandes d'un **chasseur embarqué** (Ship-Launched Fighter, SLF) déployé depuis le hangar du vaisseau hôte, avec accès complet à ses armes, son bouclier et son boost.

- **Rayon d'opération** : environ 30 km autour du vaisseau-mère.
- **Nombre de chasseurs simultanés** : en solo (sans invité humain), un seul chasseur peut être déployé à la fois, piloté soit par le joueur lui-même (à distance, laissant le vaisseau principal sans pilote actif), soit par un pilote PNJ recruté. En Multicrew, il est possible d'avoir **simultanément** un chasseur piloté par un invité humain **et** un second chasseur piloté par une IA — un guide Steam Community détaillé sur les SLF le confirme explicitement.
- **Piège fréquent** : si le vaisseau-mère engage la supercruise avant que le chasseur ait fini de s'arrimer au hangar, celui-ci est détruit automatiquement — un point de vigilance à transmettre aux nouveaux invités.

Dix vaisseaux disposent d'une baie de hangar à chasseurs :

| Vaisseau | Fabricant / catégorie |
|---|---|
| Alliance Crusader | Alliance |
| Anaconda | Faulcon DeLacy |
| Beluga Liner | Saud Kruger |
| Federal Corvette | Federal Navy |
| Federal Gunship | Federal Navy |
| Imperial Cutter | Gutamaya |
| Keelback | Lakon Spaceways |
| Krait Mk II | Faulcon DeLacy |
| Type-9 Heavy | Lakon Spaceways |
| Type-10 Defender | Lakon Spaceways |

Selon la taille de la baie (classe 5 à 7), un hangar stocke un ou plusieurs modèles de chasseurs et produit (restock) entre **6 et 30 chasseurs** avant d'avoir besoin d'être réapprovisionné. Quatre modèles de chasseurs existent, avec plusieurs configurations d'armement déblocables (armes fixes = dégâts supérieurs mais visée manuelle ; armes en tourelle/gimballed = plus faciles à viser) ; leurs noms sont confirmés par un guide Steam Community dédié aux chasseurs embarqués :

| Chasseur | Profil |
|---|---|
| **F63 Condor** | Le plus polyvalent |
| **Taipan** | Le plus résistant, moins maniable |
| Gu-97 | Modèle impérial |
| Trident | Variante de la gamme XG-Series |

### 3.6 Multicrew : partage des revenus entre le capitaine et les invités

> **À revérifier via une source primaire.** Les points suivants correspondent à une mécanique stable et largement documentée par la communauté depuis 2017. Le principe général (commerce/minage/exploration réservés au capitaine, primes et combat bonds partagés avec les invités humains) a pu être en partie recoupé, mais les valeurs précises n'ont pas pu être confirmées par une source consultable dans cet environnement de recherche.

- Le **commerce**, le **minage** et la vente de données d'**exploration** (FSS/DSS) ne rapportent qu'au **capitaine**, propriétaire du vaisseau et de sa cargaison — les invités ne peuvent pas vendre de données d'exploration en leur nom propre pendant une session Multicrew.
- Les **primes et combat bonds** générés pendant la session (kills PNJ ou PvP) versent en revanche une rémunération en crédits à chaque invité (tourelleur ou pilote de chasseur), proportionnelle à sa contribution aux combats, créditée directement sur son propre compte sans réduire la part du capitaine. Ce mécanisme est distinct du partage en Wing (voucher à pleine valeur pour chaque membre), mais poursuit le même objectif d'inciter au jeu coopératif.
- Le nombre maximal d'invités humains simultanés serait de **deux**, soit trois joueurs au total sur un même vaisseau (un capitaine + deux invités) — non confirmé par une source consultée cette session, à vérifier.

### 3.7 Ne pas confondre avec l'équipage PNJ (Crew Lounge)

Le système de **crew PNJ**, accessible via le Crew Lounge d'une station, permet de recruter contre paiement un tourelleur ou pilote de chasseur contrôlé par l'IA — un système **plus ancien** et **entièrement indépendant** du Multicrew entre joueurs humains, bien qu'il partage la même mise en scène (hologramme, poste de tourelleur, chasseur embarqué). Ce PNJ prélève un pourcentage sur les primes et combat bonds obtenus, fonction de son rang de combat ; un guide Steam Community dédié confirme les deux paliers suivants :

| Rang du PNJ | Frais d'embauche | Commission prélevée |
|---|---|---|
| Harmless | 15 000 CR | 2 % |
| Expert | 150 000 CR | 12 % |

*(seuls ces deux paliers ont pu être confirmés par la source consultée ; les rangs intermédiaires suivent vraisemblablement une progression comparable mais leurs valeurs exactes n'ont pas été vérifiées.)* Il est généralement plus rentable, à l'usage, d'engager un PNJ de rang faible et de le former en jeu plutôt que d'embaucher directement un PNJ expérimenté aux frais et à la commission élevés.

---

## 4. Le CQC (Close Quarters Combat)

### 4.1 Principe du CQC : une arène PvP arcade hors du monde persistant

Le CQC est un mode d'**arène PvP arcade** en petits vaisseaux, entièrement séparé du monde persistant d'Elite Dangerous : vaisseaux et armements préconfigurés et déblocables par la progression, aucune perte d'équipement en cas de destruction, aucune interaction avec l'économie ou les factions du jeu principal. Il s'agit d'un mode de matchmaking par partie, sans lien direct avec les mécaniques de Wing ou de Multicrew.

### 4.2 Historique : de CQC à Elite Dangerous: Arena

Le CQC a d'abord existé comme mode intégré au jeu principal avant d'être décliné en produit autonome :

- Le **16 février 2016**, Frontier lance simultanément **Elite Dangerous: Arena**, une version *standalone* à bas prix reprenant uniquement le mode CQC, et renomme ce même mode « **Arena** » au sein du jeu principal, le même jour — ces deux dates sont confirmées par Wikipédia.
- **Arena** a été **retiré de la vente** sur Steam le **10 février 2017**, tout en restant accessible gratuitement au sein d'Elite Dangerous — confirmé également par Wikipédia. Le mode CQC/Arena n'a donc jamais nécessité d'achat séparé pour les possesseurs du jeu de base.
- La date exacte d'introduction du CQC dans le jeu de base, avant ce renommage, n'a pas pu être confirmée par une source consultée cette session (les sources consultées ne couvrent que le lancement du spin-off standalone).

Sur le plan du lore, le « CQC Championship » est présenté en jeu comme organisé par la société fictive **Utopixx Entertainment**.

### 4.3 Vaisseaux et arènes du CQC (liste non sourcée, à vérifier en jeu)

Quatre arènes (cartes) dédiées existent, séparées du jeu principal. Quatre petits vaisseaux, propres au mode, y sont pilotables, avec des configurations d'armement déblocables et personnalisables au fil de la progression du rang CQC :

- F63 Condor
- Sidewinder Mk I
- Eagle
- Imperial Fighter

### 4.4 Modes de jeu du CQC (noms et nombre non confirmés)

> **À revérifier.** Aucune source consultée cette session n'a permis de confirmer avec certitude les noms exacts et le nombre de modes disponibles. Sur la base de la connaissance générale du jeu, le CQC proposerait trois modes classiques d'arène : **Deathmatch** (chacun pour soi), **Team Deathmatch** (par équipes) et **Domination** (capture/contrôle de zones), en équipes allant jusqu'à 4 contre 4 (8 joueurs maximum par match).

### 4.5 Le rang CQC, séparé et suivi par la Pilots Federation

Point essentiel à retenir : **les rangs CQC sont officiellement suivis par la Pilots Federation**, séparément du rang de combat principal du jeu (Harmless → Elite, décrit dans [08-combat-spatial.md](./08-combat-spatial.md)). Participer aux matchs d'arène est nécessaire pour progresser dans cette échelle propre au CQC — un Commandant peut donc atteindre le rang Elite en CQC sans être Elite en combat spatial classique, et réciproquement. En 2025-2026, le CQC reste un mode annexe, nettement moins fréquenté qu'à son lancement en 2015-2016, sans qu'aucune statistique chiffrée de fréquentation n'ait pu être identifiée pour cette version du guide.

---

## 5. Chronologie récapitulative de Wings, Multicrew et CQC

| Fonctionnalité | Date | Update / contexte | Confiance |
|---|---|---|---|
| Wings | 2015 (date précise et numéro de version non confirmés par une source consultée cette session) | Jeu de base | Faible — à vérifier via elitedangerous.com/codex |
| CQC (mode intégré) | 2015 (date précise non confirmée par une source consultée cette session) | Jeu de base, avant le spin-off standalone | Faible — à vérifier via elitedangerous.com/codex |
| Elite Dangerous: Arena (spin-off) + renommage CQC → Arena en jeu | 16 février 2016 | Lancement simultané | Haute |
| Arena gratuit sur Steam (temporaire) | 7–11 juillet 2016 | Promotion | Moyenne — non recoupée cette session |
| Arena retiré de la vente Steam (reste gratuit in-game) | 10 février 2017 | — | Haute |
| Multicrew | 11 avril 2017 | Update 2.3 « The Commanders », extension Horizons | Haute |
| Nouvelles missions de wing | 27 février 2018 | Update 3.0 « Beyond Chapter One » | Haute (date) / Moyenne (portée) |

---

## 6. Comment fonctionne le réseau : instanciation P2P et simulation persistante

Cette section explique un phénomène que tout joueur en groupe rencontre tôt ou tard — « je suis dans le même système
que mon ami, en Open, et je ne le vois pas » — jamais documenté ailleurs dans le corpus.

### 6.1 Deux systèmes distincts : instances pair-à-pair et état persistant

Le trafic de jeu en temps réel entre commandants présents dans la **même instance** (mouvement des vaisseaux, tirs,
chat de proximité) circule en **pair-à-pair (P2P)**, via une connexion directe entre les machines des joueurs. En
parallèle, un ensemble de serveurs cloud Frontier assure le **matchmaking** (qui regrouper avec qui), la traversée
NAT, et surtout l'**état persistant partagé** de la galaxie — systèmes, factions, [BGS](./21-bgs.md), Powerplay — qui
n'a rien à voir avec le P2P local : un joueur affecte cet état qu'il soit ou non instancié avec qui que ce soit.

### 6.2 Combien de joueurs dans une même instance ?

Le chiffre de « 32 joueurs par instance », souvent cité, remonte à l'époque du financement participatif du jeu
(2012-2013) et a été qualifié d'approximatif par Frontier à l'époque plutôt que présenté comme un plafond technique
ferme ; aucune documentation officielle datée de la version actuelle ne republie de plafond chiffré. En pratique, la
taille réelle d'une instance dépend surtout de la bande passante et de la latence des participants plutôt que d'une
limite logicielle fixe — le système de matchmaking cherche la meilleure qualité de connexion, ce qui produit souvent
des instances à faible effectif. Dans des conditions optimales et avec coordination communautaire, des instances bien
plus grandes ont été atteintes : un record de 127 commandants simultanés a été établi lors de l'expédition « Small
Worlds 2 ». Les grandes expéditions type Distant Worlds (voir [10-exploration.md](./10-exploration.md)) rassemblent
plusieurs milliers de participants au total, mais répartis sur un très grand nombre d'instances distinctes, jamais
dans une seule instance géante.

### 6.3 Ce qui regroupe deux joueurs dans la même instance

Trois critères se combinent :

1. **Le mode de jeu**, filtre strict et exclusif — Solo n'instancie jamais avec un autre humain (uniquement des PNJ) ;
   Groupe privé n'instancie qu'avec les membres explicitement invités par le propriétaire du groupe ; Open peut
   instancier avec n'importe quel autre joueur en Open, sans aucune garantie de rencontre (la galaxie est assez vaste
   pour y jouer sans jamais croiser personne).
2. **La localisation fine** — être dans le même système ne suffit pas : il faut partager le même point local (même
   sortie de supercroisière, même signal, même station, même site de surface). Chaque déplacement peut faire
   réévaluer l'instance du joueur.
3. **La qualité de connexion** — le matchmaking privilégie des paires à latence comparable et proches
   géographiquement, ce qui peut empêcher deux amis très éloignés (même système, même mode) de s'instancier ensemble.

Le **Wing** ([section 2](#2-les-wings-escadres)) force activement l'instanciation commune de ses membres via son mécanisme de nav-lock : une
fois deux joueurs mutuellement visibles en survitesse, former un Wing place le coéquipier qui en sort dans l'instance
de son coéquipier — c'est le remède le plus fiable pour se retrouver entre amis. Le **Squadron** (structure
persistante, voir [22-squadrons.md](./22-squadrons.md)), à la différence du Wing, n'a aucun effet connu et confirmé
sur le matchmaking d'instance : il structure la vie sociale et le soutien BGS d'un groupe, pas sa visibilité mutuelle
en jeu.

### 6.4 Échecs d'instanciation : causes et remèdes

La cause la plus documentée est un **type de NAT restrictif** (« strict », ou symétrique) chez un participant, qui
empêche l'établissement direct de la connexion P2P — le menu réseau du jeu affiche un indicateur de type de NAT.
Le **CGNAT** (adresse IP mutualisée par le fournisseur d'accès, fréquent en fibre/mobile) est une cause reconnue et
particulièrement tenace : en P2P, au moins un participant doit être joignable en connexion entrante, ce que le CGNAT
empêche structurellement, sans que la redirection de port habituelle n'y remédie. Remèdes communautaires alignés sur
le support Frontier : activer manuellement la redirection du **port UDP** dédié au jeu si l'UPnP du routeur échoue,
assigner une IP locale statique à sa machine pour que cette redirection reste valable, ouvrir les exceptions
pare-feu nécessaires, et, en dernier recours derrière du CGNAT, recourir à IPv6 ou à un service de redirection de port.

### 6.5 Modes de jeu, BGS et Powerplay : un état partagé, une exposition différente

Le [BGS](./21-bgs.md#1-quest-ce-que-le-background-simulation-) et Powerplay (voir
[02-powerplay.md](./02-powerplay.md)) sont gérés par le système persistant, **indépendamment** de l'instanciation
P2P : une mission accomplie, une vente en marché ou un combat pèse de façon identique sur l'influence d'une faction,
que le joueur soit en Solo, Groupe privé ou Open. C'est une parité de principe, pas nécessairement perçue comme
équitable par la communauté : un groupe qui choisit d'agir sur le BGS **uniquement en Solo** obtient de fait une
immunité totale au risque de rétorsion PvP (invisible et inattaquable par des rivaux en Open), mais y perd toute
coordination en jeu — il est techniquement impossible de former ou de rejoindre un Wing en restant en Solo, toute
coordination doit alors passer par des moyens hors-jeu (chat vocal, tableurs). Cette asymétrie — peser sur un monde
partagé sans risque de riposte visible — est un point de friction récurrent de la communauté, documenté jusque dans
une pétition publique demandant à Frontier de rééquilibrer le poids du BGS entre les trois modes. Pour le volet PvP
subi par un joueur qui choisit malgré tout l'Open, voir [30-piraterie-et-pvp.md §7](./30-piraterie-et-pvp.md#7-survivre-au-pvp-non-consenti).

---

## 7. Activités communautaires organisées : courses, expéditions et entraide

Au-delà des structures de groupe formelles (Wing, Multicrew, Squadron), *Elite Dangerous* héberge depuis plus de dix
ans des activités organisées par les joueurs eux-mêmes, sans aucun outil dédié fourni par Frontier — coordination
entièrement externe, par Discord et forums. Le tissu associatif qui les porte est recensé en détail dans
[01-lore.md §7.7](./01-lore.md) (treize groupes, fondation, contact, statut d'activité) ; cette section documente les
trois familles d'activité elles-mêmes.

### 7.1 Les courses communautaires : Buckyball, SRV et canyon racing

Trois formats coexistent, sans mode de jeu dédié ni classement officiel :

- **Le format « Buckyball »** (Buckyball Racing Club, actif depuis 2015) : course longue distance ouverte à tout
  vaisseau, sur un itinéraire fixé à l'avance entre systèmes publics — l'essentiel du défi est la navigation et la
  gestion de carburant, pas le combat.
- **Les courses de SRV** : parcours au sol chronométrés sur un corps planétaire donné, souvent organisés en marge d'un
  rassemblement communautaire (voir [7.3](#73-devenir-secouriste-bénévole--fuel-rats-et-hull-seals)) plutôt que par un club dédié permanent.
- **Le « canyon racing »** : vol de précision à très basse altitude dans les canyons de certains corps rocheux
  (repérage communautaire de site plutôt que liste officielle), qui teste la maniabilité d'un vaisseau plus que sa
  vitesse pure.

Aucun de ces formats ne verse de récompense en jeu : la participation, le chronométrage et le classement reposent
entièrement sur l'honneur et sur des outils tiers (chat vocal, feuilles de calcul partagées).

### 7.2 Expéditions et rôle logistique des Fleet Carriers relais

Les grandes expéditions communautaires (Distant Worlds, voir [01-lore.md §7.1-7.3](./01-lore.md)) reposent sur une
coordination permanente assurée par **Fleetcomm**, et depuis 2020 sur un maillage de Fleet Carriers relais entretenu
par le projet **DSSA** (Deep Space Support Array) : des porte-vaisseaux positionnés en marge de la Bulle, à un
emplacement fixe et public pendant au moins un an, qui offrent a minima réparation et ravitaillement aux explorateurs
de passage — un rôle que ne remplit aucune station en dehors de la Bulle (voir
[19-fleet-carriers.md](./19-fleet-carriers.md) pour la mécanique du Fleet Carrier lui-même). Rejoindre une expédition
en cours ne demande aucune inscription formelle : suivre le canal Discord de coordination et respecter l'itinéraire et
les fenêtres de saut communiquées suffit.

### 7.3 Devenir secouriste bénévole : Fuel Rats et Hull Seals

Les deux principaux services de secours bénévoles (voir [01-lore.md §7.7](./01-lore.md) pour leur fiche complète)
recrutent ouvertement et sans condition de rang :

- **Build minimal côté Fuel Rats** : un vaisseau doté d'un **Fuel Transfer Limpet Controller** et d'un stock de
  limpets, capable d'atteindre rapidement la position du commandant en détresse (FSD à portée confortable, pas
  nécessairement ingénierée) ; l'appel se déclenche par le commandant en détresse lui-même (procédure documentée sur
  fuelrats.com), qui poste sa position, reprise en charge par un « Rat » disponible.
- **Build minimal côté Hull Seals** : un **Hull/Module Repair Limpet Controller** pour la réparation de coque à
  distance, utile en complément (matériel distinct, service distinct : les Hull Seals ne traitent pas le carburant).
- Les deux organisations opèrent en dehors de toute affiliation de faction ou de superpuissance : un secouriste
  intervient quel que soit le mode de jeu ou l'allégeance du commandant secouru.

### 7.4 Lieux de rendez-vous et folklore communautaire

Trois lieux concentrent l'essentiel des rassemblements spontanés et du folklore du jeu : **Hutton Orbital** (système
Alpha Centauri), rendu culte par sa distance orbitale extrême et les convois humoristiques des Hutton Orbital
Truckers ; **Jameson Memorial** à Shinrarta Dezhra (voir [01-lore.md §2.7](./01-lore.md)), qui cumule le statut de
meilleur point d'aménagement du jeu et de lieu de rassemblement de facto pour toute annonce communautaire majeure ; et
**Colonia**, capitale de facto de la région du même nom, point de ralliement de toutes les expéditions vers la
périphérie galactique depuis sa fondation en 2016.

---

## Questions fréquentes

### Combien de joueurs peut-on mettre dans un Wing (wing) ?

Un Wing réunit au maximum **quatre joueurs** au total : le Commandant qui l'initie plus jusqu'à trois autres, chacun
aux commandes de son propre vaisseau. Cette limite est confirmée par la fiche Steam officielle du jeu (« *Forge your
path solo or with up to three friends in a Wing* »). Rejoindre un Wing est gratuit et ne demande aucun rang minimum.
Voir [2.1](#21-formation-et-taille-dun-wing--quatre-joueurs-au-maximum).

### Les primes (bounty vouchers) et les combat bonds sont-ils partagés entre les membres d'un Wing ?

Non : chaque membre du Wing présent dans la même instance et ayant contribué à la destruction d'une cible reçoit son
**propre voucher, à pleine valeur**, sans aucune division entre les participants. Un groupe de quatre joueurs qui abat
ensemble un vaisseau touche donc chacun l'intégralité de la prime — d'où l'intérêt de la chasse aux primes en Wing
dans les RES et les CNB. Voir [2.3](#23-wing--partage-des-primes-des-combat-bonds-et-du-rang-de-combat).

### C'est quoi le Multicrew et il est sorti quand ?

Le Multicrew place jusqu'à **trois Commandants** humains sur un **même** vaisseau : un capitaine qui garde les
commandes de pilotage, et des invités qui tiennent les tourelles ou pilotent un chasseur embarqué. Il a été livré le
**11 avril 2017** avec l'Update 2.3 « The Commanders », dans le cadre du cycle de contenu de l'extension Horizons.
Voir [3.1](#31-le-multicrew--présentation-et-introduction-en-avril-2017).

### Quels vaisseaux ont une baie de chasseurs (fighter hangar) pour le Multicrew ?

Dix vaisseaux en disposent : Alliance Crusader, Anaconda, Beluga Liner, Federal Corvette, Federal Gunship, Imperial
Cutter, Keelback, Krait Mk II, Type-9 Heavy et Type-10 Defender. Les petits chasseurs (Sidewinder, Eagle, Viper...)
n'ont aucun poste d'équipage et ne peuvent donc pas accueillir d'invités. Voir
[3.2](#32-vaisseaux-compatibles-avec-le-multicrew).

### Peut-on avoir deux chasseurs embarqués (ship-launched fighter) déployés en même temps ?

Oui, mais seulement en Multicrew : un invité humain peut piloter un chasseur pendant qu'un second, piloté par une IA,
est déployé simultanément — un guide Steam Community dédié aux SLF le confirme explicitement. En solo (sans invité),
un seul chasseur est déployable à la fois, dans un rayon d'environ **30 km** autour du vaisseau-mère. Voir
[3.5](#35-rôle-du-chasseur-embarqué-en-télé-présence-ship-launched-fighter).

### Qui touche l'argent du commerce et du minage en Multicrew : le capitaine ou les invités ?

Le commerce, le minage et la vente de données d'exploration ne rapportent qu'au **capitaine**, propriétaire du
vaisseau et de sa cargaison. Les primes et combat bonds, en revanche, versent une rémunération à chaque invité
(tourelleur ou pilote de chasseur) proportionnelle à sa contribution aux combats, sans réduire la part du capitaine.
Voir [3.6](#36-multicrew--partage-des-revenus-entre-le-capitaine-et-les-invités).

### Faut-il acheter Elite Dangerous: Arena séparément pour jouer au CQC ?

Non. Le CQC (Close Quarters Combat) a été décliné le **16 février 2016** en produit autonome *Elite Dangerous: Arena*,
retiré de la vente sur Steam le **10 février 2017** tout en restant accessible **gratuitement** au sein du jeu de
base. Le mode CQC/Arena n'a donc jamais nécessité d'achat séparé pour les possesseurs d'Elite Dangerous. Voir
[4.2](#42-historique--de-cqc-à-elite-dangerous-arena).

### Le rang CQC, c'est le même que le rang de combat classique (Harmless → Elite) ?

Non : ce sont deux échelles séparées. Le rang CQC est suivi spécifiquement par la **Pilots Federation** et ne progresse
qu'en participant aux matchs d'arène, tandis que le rang de combat principal découle des activités du monde
persistant. Un Commandant peut donc être Elite en CQC sans l'être en combat spatial classique, et réciproquement.
Voir [4.5](#45-le-rang-cqc-séparé-et-suivi-par-la-pilots-federation).

### Pourquoi je ne vois pas un ami en Open alors qu'on est dans le même système ?

Trois critères doivent se combiner pour partager la même instance : le même mode de jeu, la même localisation fine
(pas seulement le même système, mais le même point local), et une qualité de connexion suffisamment proche entre les
deux joueurs. Un type de NAT restrictif ou du CGNAT chez l'un des deux peut aussi empêcher l'instanciation P2P. Voir
[6.3](#63-ce-qui-regroupe-deux-joueurs-dans-la-même-instance) et [6.4](#64-échecs-dinstanciation--causes-et-remèdes).

### Comment forcer l'instanciation avec un ami pour être sûr de le retrouver ?

Le moyen le plus fiable est de former un **Wing** : dès que deux joueurs sont mutuellement visibles en survitesse,
activer le nav-lock et rejoindre le Wing place le coéquipier qui en sort dans l'instance de son ami. Le Squadron, à
l'inverse, n'a aucun effet connu et confirmé sur le matchmaking d'instance. Voir
[2.2](#22-le-nav-lock-partagé-entre-membres-dun-wing) et [6.3](#63-ce-qui-regroupe-deux-joueurs-dans-la-même-instance).

### Le BGS et Powerplay sont-ils les mêmes en Solo, Groupe privé et Open ?

Oui : ils sont gérés par le système persistant **indépendamment de l'instanciation** — une mission, une vente ou un
combat pèse de façon identique sur l'influence d'une faction quel que soit le mode choisi. Cette parité de principe
reste un point de friction communautaire, un joueur agissant uniquement en Solo obtenant de fait une immunité totale
au risque de rétorsion PvP. Voir
[6.5](#65-modes-de-jeu-bgs-et-powerplay--un-état-partagé-une-exposition-différente).

### Comment devenir secouriste bénévole (Fuel Rats ou Hull Seals) ?

Les deux services recrutent ouvertement, sans condition de rang. Côté Fuel Rats, un vaisseau doté d'un Fuel Transfer
Limpet Controller et d'un stock de limpets suffit pour rejoindre rapidement un commandant en détresse ; côté Hull
Seals, un Hull/Module Repair Limpet Controller sert à la réparation de coque à distance. L'appel se déclenche par le
commandant en détresse lui-même, via la procédure documentée sur fuelrats.com. Voir
[7.3](#73-devenir-secouriste-bénévole--fuel-rats-et-hull-seals).

---

## Voir aussi

- [01-lore.md §7.7](./01-lore.md) — fiche complète des treize groupes communautaires (fondation, contact, statut d'activité) résumés en [section 7](#7-activités-communautaires-organisées--courses-expéditions-et-entraide) ci-dessus.
- [19-fleet-carriers.md](./19-fleet-carriers.md) — mécanique du Fleet Carrier, dont s'inspirent les porte-vaisseaux relais du réseau DSSA ([7.2](#72-expéditions-et-rôle-logistique-des-fleet-carriers-relais)).
- [08-combat-spatial.md](./08-combat-spatial.md) — échelle de rang de combat (Harmless → Elite), primes et notoriety hors Wing, coordination d'escadre en PvP.
- [22-squadrons.md](./22-squadrons.md) — structure persistante du Squadron, à ne pas confondre avec le Wing temporaire.
- [03-vaisseaux.md](./03-vaisseaux.md) — fiches techniques des vaisseaux compatibles Multicrew et dotés d'une baie de chasseurs.
- [04-equipements.md](./04-equipements.md) — équipement des postes de tourelleur et modules liés aux chasseurs embarqués.
- [27-debuter-et-progresser.md](./27-debuter-et-progresser.md) — comparatif des huit échelles de rang du jeu, dont le rang CQC séparé décrit en [4.5](#45-le-rang-cqc-séparé-et-suivi-par-la-pilots-federation), et ce qui reste confirmé ou non sur sa progression.
- [30-piraterie-et-pvp.md](./30-piraterie-et-pvp.md) — piraterie, PvP subi, groupes privés PvE (Mobius), blocage et combat logging ; s'appuie sur l'architecture réseau décrite en [section 6](#6-comment-fonctionne-le-réseau--instanciation-p2p-et-simulation-persistante).
- [21-bgs.md](./21-bgs.md), [02-powerplay.md](./02-powerplay.md) — les deux systèmes persistants partagés entre modes de jeu ([section 6.5](#65-modes-de-jeu-bgs-et-powerplay--un-état-partagé-une-exposition-différente)).
- [Glossaire](./00-glossaire.md) — sigles utilisés dans ce guide (CQC, PvE, PvP, notoriety).

## Sources

Format normalisé selon [00-methodologie-sourcing.md §9](./00-methodologie-sourcing.md#9-format-normalisé-dune-section-sources) ;
conversion réalisée au chantier 16bis (13 septembre 2026), sur le modèle de [11-commerce.md](./11-commerce.md) et
[02-powerplay.md](./02-powerplay.md).

- https://en.wikipedia.org/wiki/Elite_Dangerous | secondaire | consulté le 13/09/2026 | confirme : la limite de 4 joueurs par Wing, la date de sortie du Multicrew (Update 2.3, 11 avril 2017), les dates de lancement (16/02/2016) et de retrait de vente (10/02/2017) d'Elite Dangerous: Arena, et les noms des chasseurs embarqués | ne confirme pas : la date précise et le numéro de version d'introduction des Wings et du CQC intégré en 2015
- https://www.wikiwand.com/en/articles/Elite_Dangerous | secondaire | consulté le 13/09/2026 | confirme : les mêmes points que l'article anglais de Wikipédia dont il reprend le contenu (miroir de lecture) | ne confirme pas : une information indépendante de la source Wikipédia qu'il reflète
- https://fr.wikipedia.org/wiki/Elite_Dangerous | secondaire | consulté le 13/09/2026 | confirme : les mêmes points que la version anglaise (limite de 4 joueurs par Wing, dates Multicrew/Arena, noms des chasseurs), recoupés entre éditions linguistiques | ne confirme pas : la date précise d'introduction des Wings en 2015
- https://de.wikipedia.org/wiki/Elite_Dangerous | secondaire | consulté le 13/09/2026 | confirme : les mêmes points, recoupés une troisième fois entre éditions linguistiques indépendantes | ne confirme pas : des éléments absents des versions anglaise et française
- https://store.steampowered.com/app/359320/Elite_Dangerous/ | primaire | consulté le 13/09/2026 | confirme : la limite de quatre joueurs par Wing (citation exacte « Forge your path solo or with up to three friends in a Wing ») | ne confirme pas : la date d'introduction des Wings, ni le détail du Multicrew ou du CQC
- https://steamcommunity.com/app/359320/guides/ | tertiaire | consulté le 13/09/2026 | confirme : l'existence d'un corpus de guides communautaires couvrant Multicrew, chasseurs embarqués et Crew Lounge | ne confirme pas : à elle seule, un chiffre précis — voir le guide spécifique ci-dessous
- https://steamcommunity.com/sharedfiles/filedetails/?id=2439430996 | tertiaire | consulté le 13/09/2026 | confirme : le déploiement simultané d'un chasseur humain et d'un chasseur IA en Multicrew, les noms des quatre chasseurs embarqués (F63 Condor, Taipan, Gu-97, Trident) et les frais/commissions PNJ du Crew Lounge pour les rangs Harmless (15 000 CR / 2 %) et Expert (150 000 CR / 12 %) | ne confirme pas : les paliers de rang intermédiaires du Crew Lounge, ni les valeurs précises du partage des revenus Multicrew entre capitaine et invités
- https://fuelrats.com/ | secondaire | consulté le 13/09/2026 | confirme : la procédure publique d'appel de détresse déclenchée par le commandant en détresse lui-même | ne confirme pas : le statut d'activité 2025-2026 de l'organisation (voir 01-lore.md §7.7)
- https://confluence.fuelrats.com/display/public/FRKB/History | secondaire | consulté le 13/09/2026 | confirme : la fondation des Fuel Rats en juin 2015 | ne confirme pas : le statut d'activité courant de l'organisation
- https://hullseals.space/knowledge/books/acknowledgments/page/the-fuel-rats | secondaire | consulté le 13/09/2026 | confirme : le lien historique entre Hull Seals et Fuel Rats | ne confirme pas : la date de fondation exacte de Hull Seals, ni son statut d'activité 2025-2026
- https://forums.frontier.co.uk/threads/the-deep-space-support-array-dssa-a-fleetcomm-initiative.540166/ | secondaire | consulté le 13/09/2026 | confirme : le principe du réseau DSSA (Fleet Carriers relais en marge de la Bulle, emplacement fixe et public pendant au moins un an, réparation et ravitaillement) | ne confirme pas : le statut d'activité 2025-2026 du réseau (voir 01-lore.md §7.7)
- https://forums.frontier.co.uk/threads/announcing-fleetcomm-the-exploration-focused-private-pc-group.474455/ | secondaire | consulté le 13/09/2026 | confirme : la nature de Fleetcomm comme groupe de coordination d'expéditions dédié à l'exploration | ne confirme pas : le statut d'activité courant du groupe en 2025-2026
