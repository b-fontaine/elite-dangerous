---
id: 23-jeu-en-groupe
titre: "Wings, Multicrew et CQC : jouer à plusieurs dans Elite Dangerous"
domaine: social
entites: [Wing, Multicrew, CQC, "Elite Dangerous: Arena", nav-lock, chasseur embarqué, F63 Condor, Taipan, Gu-97, Trident,
  Crew Lounge, équipage PNJ, Squadron, Utopixx Entertainment]
mots_cles_en: [wing, multicrew, cqc, close quarters combat, arena, nav-lock, ship-launched fighter, slf, fighter hangar,
  crew lounge, npc crew, bounty voucher, combat bond, telepresence, wing mission]
version_jeu_couverte: "4.4.0.x (mécaniques introduites entre 2015 et 2018, sans refonte majeure depuis)"
branche: live
date_verification: 2026-09-10
confiance_globale: moyenne
volatilite: basse
sources_primaires: [Wikipédia EN/FR/DE, fiche Steam officielle Elite Dangerous (appid 359320), guides Steam Community]
zones_incertaines: ["date précise et numéro de version d'introduction des Wings en 2015",
  "date précise d'introduction du CQC dans le jeu de base, avant le renommage en Arena",
  "portée exacte de l'enrichissement des missions de wing par Beyond Chapter One en 2018",
  "valeurs précises du partage des revenus Multicrew entre capitaine et invités",
  "nombre maximal d'invités humains simultanés en Multicrew (deux, non confirmé)",
  "paliers intermédiaires de frais et de commission de l'équipage PNJ du Crew Lounge",
  "noms exacts et nombre des modes de jeu du CQC (Deathmatch / Team Deathmatch / Domination supposés)",
  "promotion gratuite d'Elite Dangerous: Arena en juillet 2016, non recoupée",
  "statistiques de fréquentation du CQC en 2025-2026"]
guides_lies: [3, 4, 8, 22, 27]
---

# Wings, Multicrew et CQC : jouer à plusieurs dans Elite Dangerous

## En bref

*Elite Dangerous* propose trois façons distinctes de jouer à plusieurs. Le **Wing** (escadre) réunit jusqu'à
**quatre joueurs**, chacun dans son propre vaisseau, dans le monde persistant : **nav-lock** partagé, panneau Wing
affichant position et cap des membres, missions de wing partagées, et surtout **primes et combat bonds versés à pleine
valeur à chaque contributeur**, sans division — d'où l'intérêt de la chasse aux primes en Wing dans les **RES** et les
**CNB**. Le **Multicrew**, livré le **11 avril 2017** avec l'Update 2.3 « The Commanders », place jusqu'à trois
Commandants sur un **même** vaisseau : le capitaine pilote, les invités tiennent les tourelles ou pilotent un **chasseur
embarqué** (*Ship-Launched Fighter*, rayon d'environ 30 km) en télé-présence holographique, dix vaisseaux disposant
d'une baie de chasseurs. Le **CQC** (*Close Quarters Combat*), décliné en produit autonome **Elite Dangerous: Arena** le
**16 février 2016** puis retiré de la vente le **10 février 2017**, est un mode d'arène PvP arcade hors du monde
persistant, doté d'un rang propre suivi par la **Pilots Federation**. À ne pas confondre avec le **Squadron**, ni avec
l'**équipage PNJ** du Crew Lounge.

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
| **CQC** (Close Quarters Combat / Arena) | Matchs à petite échelle (équipes) | Aucune (matchmaking par partie) | Arènes dédiées, hors monde persistant | PvP arcade en petits vaisseaux, progression de rang séparée |
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

## Voir aussi

- [08-combat-spatial.md](./08-combat-spatial.md) — échelle de rang de combat (Harmless → Elite), primes et notoriety hors Wing, coordination d'escadre en PvP.
- [22-squadrons.md](./22-squadrons.md) — structure persistante du Squadron, à ne pas confondre avec le Wing temporaire.
- [03-vaisseaux.md](./03-vaisseaux.md) — fiches techniques des vaisseaux compatibles Multicrew et dotés d'une baie de chasseurs.
- [04-equipements.md](./04-equipements.md) — équipement des postes de tourelleur et modules liés aux chasseurs embarqués.
- [27-debuter-et-progresser.md](./27-debuter-et-progresser.md) — comparatif des huit échelles de rang du jeu, dont le rang CQC séparé décrit en 4.5, et ce qui reste confirmé ou non sur sa progression.

## Sources

- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://www.wikiwand.com/en/articles/Elite_Dangerous
- https://fr.wikipedia.org/wiki/Elite_Dangerous
- https://de.wikipedia.org/wiki/Elite_Dangerous
- https://store.steampowered.com/app/359320/Elite_Dangerous/
- https://steamcommunity.com/app/359320/guides/
- https://steamcommunity.com/sharedfiles/filedetails/?id=2439430996
