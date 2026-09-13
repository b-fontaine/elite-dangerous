---
id: 31-pilotage-navigation-et-stations
titre: "Pilotage, navigation, stations et carburant dans Elite Dangerous"
domaine: vaisseaux-equipement
entites: [Supercruise Assist, Access Corridor, mailslot, Orbital Cruise, Glide, Surface Port, Fleet Carrier,
  Manifest Scanner, Fuel Scoop, Fuel Rats, Planetary Vehicle Hangar, Interstellar Factors, Material Trader,
  Technology Broker, Vista Genomics, Pioneer Supplies]
mots_cles_en: [supercruise, supercruise assist, docking, mailslot, access corridor, orbital cruise, glide,
  landing pad, outpost, surface port, fleet carrier, hud, subsystem targeting, fuel scoop, fuel rats,
  ship transfer, module storage, shipyard, outfitting, tech level]
version_jeu_couverte: "4.4.0.x (recherche consultée jusqu'aux notes 4.4.1.1 du 3 septembre 2026)"
branche: live
date_verification: 2026-09-12
confiance_globale: moyenne
volatilite: moyenne
sources_primaires: ["elite-dangerous.fandom.com (Supercruise, Supercruise Assist, Docking, Station, Access Corridor, Outpost, Surface Port, Orbis, Coriolis, Ocellus, Asteroid Base, Megaship, Fleet Carrier, Landing Pad, Concourse, Black Market, Interstellar Factor, Material Trader, Technology Broker, Universal Cartographics, HUD/Left, HUD/Right, HUD/Center, Sensors, Power Plant, Shield Generator, Orbital Cruise, Planetary Landing, Glide, Landing Gear, Gravity, Fuel, Fuel Scoop, Frame Shift Drive, Scarab, Scorpion, Wave Scanner, Drive Assist, Skimmers, Defence Turrets, Synthesis, Redeployment, Planetary Vehicle Hangar, Shipyard, Outfitting)", "elitedangerous.com (Update Notes Trailblazers 3.3 v4.1.2.102 ; boutique officielle Scarab/Scorpion)", "community.elitedangerous.com (Horizons Quick Start Guide)", "forums.frontier.co.uk (accostage, supercroisière, transfert de vaisseau/module, pips SRV)", "confluence.fuelrats.com (Rescue Standard Operating Procedures)", "corpus interne (03-vaisseaux, 04-equipements, 08-combat-spatial, 14-rhino, 19-fleet-carriers)"]
zones_incertaines: ["contradiction non résolue entre deux pages du même wiki communautaire sur le délai avant destruction en cas d'accostage sans autorisation : 90 secondes (page Docking) contre 60 secondes (page Station)", "rayon exact de la no-fire zone d'une station, jamais chiffré par une source officielle", "délai précis de tolérance de flânerie sur un pad non assigné avant tir (~30 s évoqué par la communauté, non confirmé par une source primaire)", "prime active comme motif de refus de la demande d'accostage : non confirmé par les sources consultées, contrairement à une hypothèse répandue", "formule exacte de décélération gravitationnelle en supercroisière (m/s² selon masse/distance), jamais publiée par Frontier", "seuil chiffré (vitesse verticale ou G) au-delà duquel un atterrissage inflige des dégâts au train, non documenté officiellement", "formule de consommation de carburant par saut FSD, qualifiée de spéculative par sa propre source communautaire", "capacité de soute du Scorpion : 2 t selon les notes de patch de 2021, 30 t selon le site boutique actuel (valeur identique à la masse, suspicion d'erreur d'affichage)", "formule de coût et de délai de transfert de vaisseau/module, datée de 2019 et non revérifiée pour la version actuelle", "géométrie d'amarrage et gravité artificielle d'un megaship accostable, non documentées par une source consultée", "statut de l'Interstellar Factor, du Material Trader et du Technology Broker dans les seuils officiels de la Colonisation (absents de la liste des 8 services couverts par Trailblazers 3.3)"]
guides_lies: [3, 4, 5, 8, 14, 16, 18, 19, 20, 27]
---

# Pilotage, navigation, stations et carburant dans Elite Dangerous

## En bref

Ce guide documente la première heure de jeu, jamais couverte par le corpus malgré 31 guides existants : comment
voler, accoster et se ravitailler. **Supercroisière** : plage de 29,9 km/s à 2001c, freinage gravitationnel qui n'est
qu'un effet du plafond de vitesse (pas un système dédié), et la technique communautaire des « 7 secondes / 75 % ».
**Accostage**, en sept temps : demande à 7,5 km, pad assigné avec délai de 10 minutes, franchissement du mailslot
(222 × 52 m), limite de 100 m/s, zone sans tir, et un délai de flânerie de 5 minutes après décollage. Variantes avant-
poste (aucun pad Large) et **Surface Port** planétaire — terme qui remplace un « Coriolis/Ocellus au sol » qui
n'existe pas. **Atterrissage planétaire** : Orbital Cruise (plancher 25 km) puis Glide (2 500 m/s constants jusqu'à
3 km). Une **matrice de neuf types de stations** × taille de pad × quinze services, avec les seuils réels de
Trailblazers (niveau technologique 35 pour Chantier Naval et Équipement). Le **HUD** complet (panneaux gauche/droit/
centre, ciblage de sous-système) et le **carburant** (écopage, panne sèche, procédure Fuel Rats). Enfin la
**logistique de flotte**, traitée dans 03-vaisseaux.md et 04-equipements.md plutôt qu'ici. Plusieurs contradictions
entre sources sont signalées sans être tranchées.

## Ce que couvre ce guide, et ce qu'il ne couvre pas

Le corpus documente le combat spatial en profondeur (pips, FA off, interdiction) mais jamais le vol de base :
vérifié, aucune procédure d'accostage, aucune règle de taille de pad par station, aucune procédure d'atterrissage
planétaire sur les 31 fichiers précédents. Ce guide comble ce vide et couvre en plus le HUD hors contexte de combat
(déjà traité pour le combat anti-Thargoïde dans [25-combat-ax.md](./25-combat-ax.md)) et le carburant. Il ne couvre
**pas** la comparaison des véhicules de surface (Scarab/Scorpion/Rhino), traitée dans
[14-rhino.md §4](./14-rhino.md), ni la logistique de flotte (transfert et stockage de vaisseaux et de modules),
traitée directement dans [03-vaisseaux.md](./03-vaisseaux.md) et [04-equipements.md](./04-equipements.md) — chacune
prolonge un guide qui documente déjà le sujet voisin plutôt que de créer une troisième source.

> **Avertissement de sourçage.** L'essentiel de ce guide s'appuie sur le wiki communautaire Elite Dangerous Wiki
> (Fandom), recoupé quand c'était possible par le site officiel Frontier (notes de mise à jour, guide de démarrage
> Horizons) et les forums officiels. Plusieurs pages du wiki se contredisent entre elles sur des détails précis
> (délai de destruction, capacité de soute du Scorpion) : ces contradictions sont rapportées telles quelles plutôt
> que tranchées d'autorité.

---

## 1. Supercroisière

La supercroisière permet de voyager de **29,9 km/s à 2001c** à l'intérieur d'un système en compressant l'espace
devant le vaisseau via le FSD (1c = 300 Mm/s ; parcourir 1 année-lumière à 2001c prend environ 4 h 23 min).

- **Freinage gravitationnel** : ce n'est pas un système dédié mais une conséquence directe du plafond de vitesse, qui
  diminue à l'approche d'un corps massif et augmente en s'en éloignant — aucune formule exacte n'est publiée.
- **« 7 secondes / 75 % »** : technique empirique communautaire, non documentée officiellement — maintenir la
  manette à 100 % jusqu'à ce que le compte à rebours affiche 7 secondes, puis la ramener à 75 % (zone bleue). En
  dessous de ~6 secondes restantes, le vaisseau ne peut plus freiner à temps et risque le dépassement (*overshoot*).
- **Gravity assist** (frôler une planète pour se faire freiner par sa gravité) : astuce communautaire non chiffrée.
- **Sortie de supercroisière** : **Safe Disengage** (vitesse < 1 Mm/s, cible verrouillée dans un cône à moins de
  1 Mm, cooldown FSD de 10 s, aucun dégât) ou **Emergency Drop** (double appui à plus de 1 Mm/s, interdiction,
  franchissement d'une surface d'impact, coupure moteur/FSD, ou carburant ≤ 5 % — dégâts de 1-2 % sur coque et
  modules, cooldown de 40 s ; jusqu'à ~30 % de dégâts avec un FSD SCO engagé).
- **Supercruise Assist** (classe 1, notation E, ~9 121 Cr, installé de série depuis l'*April Update* du 23 avril
  2019) : automatise l'approche vers une destination ciblée une fois aligné, manette en zone bleue ; option
  « Hyperspace Dethrottle » qui stoppe le vaisseau après un saut. **Ce n'est pas un autopilote complet** : il ne
  contourne aucun obstacle, se désactive en cas d'interdiction, et n'assiste pas l'atterrissage planétaire
  ([section 3, « Atterrissage planétaire »](#3-atterrissage-planétaire)).

Pour la mécanique du FSD lui-même (classes, notations, Guardian FSD Booster, SCO) voir
[03-vaisseaux.md](./03-vaisseaux.md) et [04-equipements.md](./04-equipements.md), qui la documentent déjà.

---

## 2. Accostage en station

### 2.1 Procédure standard, étape par étape

1. **Demande d'autorisation** — à moins de **7 500 m** de la station, onglet Contacts (panneau gauche,
   [section 6, « Le HUD hors combat anti-Thargoïde »](#6-le-hud-hors-combat-anti-thargoïde--panneaux-et-ciblage)),
   sélectionner la station puis « Request Docking Permission ». Au-delà de cette distance, la demande est refusée
   automatiquement.
2. **Attribution d'un pad** — en cas d'acceptation, un numéro de pad s'affiche (« Proceed to landing pad XX ») avec
   un **délai de dix minutes** pour se poser.
3. **Franchissement du mailslot** (*Access Corridor*) — corridor d'environ **222 m de large sur 52 m de haut**,
   gardé par des tourelles de défense qui ouvrent le feu sur tout vaisseau flânant ou intrus. Il faut se centrer
   dessus puis synchroniser la rotation du vaisseau avec celle de la station (option « Rotational Correction »).
4. **Vitesse et zone sans tir** — pas de limite dure universelle à l'intérieur, mais dépasser **100 m/s** en cas de
   collision entraîne une amende pour vol dangereux ; toute collision destructrice, quelle que soit la vitesse,
   vaut une accusation de meurtre et l'ouverture du feu des tourelles. Tirer une arme dans la **no-fire zone**
   entraîne une amende (riposte des tourelles en cas de dégât porté) ; le scan y reste autorisé, larguer du cargo y
   est sanctionné sauf à quai.
5. **Délai de flânerie** — après une entrée sans autorisation, la sanction va jusqu'à la destruction : le wiki
   communautaire donne deux chiffres contradictoires selon la page (90 s ou 60 s), non tranchés par une source
   officielle. Flâner sur un pad non assigné vaut une amende puis la destruction (délai non chiffré officiellement).
6. **Motifs de refus documentés** : distance excessive, nouvelle demande depuis l'intérieur de la station, tous les
   pads occupés, ou vaisseau trop grand pour les pads disponibles (aucun avant-poste n'a de pad Large,
   [section 5, « Taille de vaisseau et pad requis »](#5-taille-de-vaisseau-et-pad-requis)).
   **Une prime active n'est pas confirmée comme motif de refus par les sources consultées**, contrairement à une
   hypothèse répandue — un vaisseau recherché semble pouvoir accoster, au risque d'y être scanné puis pris pour
   cible par la sécurité.
7. **Décollage** — depuis le menu du pad, choisir « Launch » (par opposition à « Enter Hangar », qui descend le pad
   pour l'entretien). Après décollage, **cinq minutes** pour quitter la zone de la station avant d'être considéré
   en flânerie, ce qui déclenche un compte à rebours hostile de 60 secondes.

Numérotation des 45 pads d'un starport classique : 12 lignes, le pad 01 au centre-bas près du corridor, la
numérotation croît en s'éloignant du corridor puis reprend à 1 sur la ligne suivante (dizaines à gauche, vingtaines
en haut, trentaines à droite). Un **Docking Computer** (ordinateur d'accostage ; Standard ou Advanced) automatise tout le processus une fois
la permission demandée et la manette à zéro — évitez de l'activer à l'exact opposé du corridor d'accès à l'intérieur
de la station. La gravité artificielle à quai (rotation de la station) avoisine 0,1 g.

### 2.2 Variante avant-poste : pas de mailslot

Les avant-postes ne tournent pas et n'ont pas de corridor d'accès : leurs pads sont exposés directement à l'espace,
le vaisseau est maintenu par verrouillage magnétique. Ils comptent 2 à 5 pads (typiquement 4 Small + 1 Medium),
**sans aucun pad Large** — voir la liste des vaisseaux concernés en
[section 5, « Taille de vaisseau et pad requis »](#5-taille-de-vaisseau-et-pad-requis).

### 2.3 Variante planétaire : le Surface Port, pas un « Coriolis au sol »

**Correction de terminologie.** Coriolis, Orbis et Ocellus sont exclusivement des classes de stations **orbitales**,
dotées d'un mailslot ; il n'existe pas de variante posée au sol. L'équivalent planétaire s'appelle **Surface Port**
(sous-types Planetary Outpost et Planetary Port) : mêmes règles de demande à 7,5 km, mais les pads sont disposés à
l'air libre, sans corridor. La gravité y est celle, réelle, de la planète — sur un monde à forte gravité, les
propulseurs du vaisseau peuvent ne pas suffire à freiner la descente, causant des dégâts au bouclier ou à la coque
au contact du pad.

---

## 3. Atterrissage planétaire

1. **Orbital Cruise** — régime de vitesse intermédiaire activé automatiquement à l'approche d'une planète/lune
   atterrissable ; maintenir le tangage entre **-5° et +5°** (zone bleue) pour la vitesse maximale. Plancher
   d'altitude : **25 km**, en dessous duquel le vaisseau bascule en Glide (ou subit une chute d'urgence si vitesse/
   angle sont incorrects).
2. **Glide** — ne s'engage que si le tangage est compris entre **-60° et +5°** à la sortie de l'Orbital Cruise, à
   vitesse suffisamment basse. Vitesse constante de **2 500 m/s** pendant le Glide, qui se termine automatiquement à
   **3 km d'altitude** (retour en vitesse normale, propulseurs repris en main). Piquer trop fort déclenche une chute
   d'urgence (dégâts).
3. **Vol planétaire normal** — en dessous de 30° de tangage à faible vitesse, une sécurité automatique ramène
   progressivement le nez vers le vol en palier. Approche finale recommandée à un angle d'environ **45°** (non
   obligatoire).
4. **Gravité de surface** — vérifier la gravité dans la carte système avant d'atterrir : un monde à forte gravité
   peut déborder un vaisseau à propulseurs faibles et causer un atterrissage trop rapide, donc des dégâts sévères
   voire la destruction. La gravité maximale à laquelle un pilote peut encore **débarquer à pied** est de 2,69 g ;
   le déploiement d'un **SRV n'a aucune limite de gravité**.
5. **Train d'atterrissage** — à sortir avant tout posé ; le sortir en vol normal divise par deux la vitesse maximale
   du vaisseau ; impossible à sortir en supercroisière/hyperespace, et il doit être rentré avant tout saut FSD.
6. **Déploiement du SRV** — depuis l'interface de changement de rôle (bascule dédiée) une fois posé, à condition de
   disposer d'un **Planetary Vehicle Hangar** équipé et d'un SRV acheté. Détail des véhicules disponibles dans
   [14-rhino.md §4](./14-rhino.md).

---

## 4. Types de stations, tailles de pad et services

### 4.1 Neuf types d'infrastructures accostables

| Type | Pad max | Amarrage | Gravité artificielle | Contexte | Particularité |
|---|---|---|---|---|---|
| **Coriolis** | Large (15 S/18 M/9 L) | Interne (mailslot) | 0,26 g aux docks, 0,5-0,7 g en niveaux inférieurs | Système peuplé | Conception la moins chère/rapide à construire ; souvent la 1ʳᵉ station d'un système colonisé |
| **Orbis** | Large (15 S/18 M/9 L) | Interne (mailslot) | Jusqu'à 1 g sur l'anneau de 4 km (unique), 0,13 g aux docks | Système établi ou riche | Jaques Station (Colonia) est le seul Orbis doté d'un FSD propre |
| **Ocellus** | Large (15 S/18 M/9 L) | Interne (mailslot) | ~0,7-0,99 g selon la source (écart non résolu) | Système peuplé | Seule station déplaçable intacte d'un système à l'autre (moteurs + hyperdrive) |
| **Base d'astéroïde** | Large (4 S/8 M/6 L) | Interne (mailslot) | Rotation lente (300 s), valeur en g non documentée | Anneaux/clusters d'astéroïdes | Services variables d'une base à l'autre (marché noir/outfitting/shipyard optionnels) |
| **Avant-poste (Outpost)** | Medium — **aucun pad Large** (2-4 S + 1 M) | Externe (verrouillage magnétique) | Aucune (pas de rotation) | N'importe quel système, souvent peu peuplé | 7 sous-types (Civil, Commercial, Industriel, Militaire, Minier, Scientifique, Non sanctionné) |
| **Surface Port** | Large (2-4 S/2-4 M/2-8 L) | Externe (pads à l'air libre) | Gravité naturelle de la planète | Surface planétaire/lunaire | Sous-types Planetary Outpost (petit) et Planetary Port (grand) ; SRV déployable |
| **Settlement Odyssey** | Variable, jusqu'à Large (1-2 S/0-1 M/0-1 L) | Externe | Gravité planétaire (bottes magnétiques dans le Concourse, zone sociale à pied) | Surface, +400 000 settlements | Pas de hangar interne : Outfitting/Shipyard/Livery indisponibles au sol |
| **Megaship** (accostable) | Large, un seul (4 S/2 M/1 L) | Externe (probable, non confirmé) | Non documentée | Espace profond, fixe ou mobile | Seuls les Wells-class Carrier/Detention Centre/Rescue Vessel s'accostent ; jamais de Shipyard |
| **Porte-Vaisseau (Fleet Carrier)** | Large majoritaire — cas unique (8 L/4 M/4 S) | Externe (pads exposés sur le pont) | Non documentée | Mobile, jusqu'à 500 al par saut | Services entièrement modulaires, payants à l'installation et à l'entretien |

*(Sources : elite-dangerous.fandom.com — Coriolis, Orbis, Ocellus, Asteroid Base, Outpost, Surface Port, Settlement,
Megaship, Fleet Carrier, Landing Pad, Station, consultées le 12 septembre 2026.)*

### 4.2 Disponibilité réelle des services de station

Depuis la mise à jour **Trailblazers (Update 3.3, v4.1.2.102)**, huit services de station suivent une règle officielle
de seuil dans un système colonisé, citée ici mot pour mot pour les deux plus contraignants :

- **Chantier Naval (Shipyard)** et **Équipement (Outfitting)** — tous deux « always require a minimum system tech
  level of 35 » ; ce niveau est automatiquement atteint par un port Tier 2 ou 3 ; un Tier 1 Planet Port ne l'obtient
  qu'avec un lien fort vers une installation qualifiante (Comms/Relais/Tourisme/Bar/Outpost Hub pour le Shipyard ;
  High Tech Hub/Militaire/Industriel pour l'Outfitting, sauf avant-poste militaire ou port industriel Tier 1 qui
  l'ont d'office). Conséquence pratique : un avant-poste, dont les pads plafonnent à Medium, n'a structurellement
  presque aucune chance d'un Chantier Naval complet.
- **Marché (Commodities Market)** — universel sur tout port Tier 2/3 et tout Settlement ; les avant-postes
  Commercial/Industriel/Civil l'ont d'office, les autres (Criminel/Scientifique/Militaire) nécessitent un lien fort
  qualifiant.
- **Marché noir** — dépend du **type de gouvernement** de la faction contrôlante, pas seulement de l'Anarchie :
  Anarchie, Communisme, Confédération, Coopérative et Démocratie le tolèrent ; Corporation, Dictature, Féodalité,
  Mécénat, Colonie pénitentiaire et Théocratie le suppriment. Un Lockdown le désactive, un Civil Unrest peut
  l'activer temporairement.
- **Interstellar Factors** — corrélé à un **niveau de sécurité système bas**, pas formellement à l'Anarchie ; absent
  de la liste officielle des huit seuils de Colonisation, donc probablement soumis à la seule règle de sécurité.
  Frais de 25 % sur toute transaction (amendes, primes, vouchers) ; ne peut effacer une prime que si aucune faction
  du système où se trouve le contact n'est émettrice ni alignée à la superpuissance émettrice.
- **Material Trader** — spécialisé par économie : **Raw** en Refinery/Extraction, **Manufactured** en Extraction/
  Industrial, **Encoded** en High Tech/Military ; toujours en sécurité moyenne/haute, population 1 à 22 millions
  d'habitants, jamais en système Anarchie ni station endommagée/Lockdown.
- **Technology Broker** (Humain et Guardian) — préférentiellement en systèmes très peuplés à haute sécurité ; deux
  inventaires distincts et non interchangeables.
- **Universal Cartographics** — quasi ubiquitaire ; automatique pour un port Tier 3, un avant-poste Scientifique ou
  un Research Bio Settlement en système colonisé, sinon lien fort vers une installation qualifiante.
- **Vista Genomics** — **pas** réservé à tout Concourse Odyssey comme on pourrait le supposer : absent des petits
  Concourses (avant-postes, anciens Settlements Horizons), présent dans les grands (Planetary Port, Coriolis/Ocellus/
  Orbis/Base d'astéroïde, Flight Operations Carrier) ; installable en option sur un Porte-Vaisseau (150 M Cr +
  1,5 M Cr/semaine).
- **Pioneer Supplies** — à l'inverse, quasi universel : présent même dans les avant-postes et petits Settlements ;
  condition triviale dans la règle officielle de Colonisation (« tout port orbital ou planétaire »).
- **Crew Lounge** (recrutement d'équipage PNJ) — port Tier 2/3, avant-poste Criminel/Civil, port planétaire Tier 1 Civil, ou tout autre Tier 1
  avec une installation Bar dans le système.
- **Mission Board** (tableau des missions) et **Refuel/Repair/Rearm** — quasi systématiques sur toute infrastructure accostable, désactivés
  en cas de station endommagée ; sur un Porte-Vaisseau, ce sont des modules payants optionnels (« Advanced
  Maintenance »), contrairement au jeu de base où ils sont gratuits.

*(Sources : elitedangerous.com/update-notes/4-1-2-102 ; elite-dangerous.fandom.com — Black Market, Interstellar
Factor, Material Trader, Technology Broker, Universal Cartographics, Concourse, Shipyard ; consultées le
12 septembre 2026.)*

---

## 5. Taille de vaisseau et pad requis

Onze vaisseaux de taille **Large** ne peuvent **pas** se poser sur un avant-poste (aucun pad Large disponible) :
**Anaconda, Beluga Liner, Caspian Explorer, Federal Corvette, Imperial Clipper, Imperial Cutter, Orca, Panther
Clipper Mk II, Type-7 Transporter, Type-9 Heavy, Type-10 Defender**. À l'inverse, plusieurs ajouts récents sont
Medium ou Small et peuvent s'y poser : **Type-8 Transporter** (conçu spécifiquement pour desservir les avant-postes,
propulseurs rétractables), **Type-11 Prospector**, **Lynx Highliner** (Medium), **Kestrel Mk II** (Small). Le Rhino
n'est pas concerné : ce n'est pas un vaisseau pilotable mais un SRV transporté (voir
[14-rhino.md](./14-rhino.md)). Caractéristiques complètes de chaque châssis dans
[03-vaisseaux.md](./03-vaisseaux.md).

---

## 6. Le HUD hors combat anti-Thargoïde : panneaux et ciblage

### 6.1 Panneau gauche : Navigation, Transactions, Contacts, Target

Quatre onglets, pas trois :

- **Navigation** — position actuelle, prochain saut, sauts restants, destination ; liste défilante des corps/
  signaux/systèmes avec filtres, sélection = marqueur jaune (bleu si lié à une mission).
- **Transactions** — sous-onglets All Transactions, Missions (dont progression de CG), Passengers, Claims (bounty
  et combat bond vouchers), Fines, Bounties.
- **Contacts** — tout ce que le scanner détecte, verrouillable depuis la liste ; une station affiche sa faction et
  un bouton de demande d'accostage, un vaisseau son type, son allégeance, sa prime, bouclier et coque.
- **Target** — n'apparaît qu'une fois une cible sélectionnée **et scannée** ; deux sous-onglets : **Sub-Targets**
  (état de chaque sous-système, ciblage individuel, aussi accessible par raccourcis clavier dédiés) et **Manifest**
  (cargaison de la cible, visible seulement avec un Manifest Scanner équipé et utilisé — voir
  [30-piraterie-et-pvp.md §2](./30-piraterie-et-pvp.md)).

### 6.2 Panneau droit : Modules, Fire Groups, Ship, Inventory, Status

Sept sections : Home, **Modules** (nom/classe/notation/type/consommation/priorité/intégrité de chaque module,
priorité modifiable, extinction possible sauf réacteur et verrière), **Fire Groups** (jusqu'à 8 groupes, cercle jaune
= tir primaire, bleu = secondaire), **Ship** (sous-onglets Functions — feux, vision nocturne, train, écope à cargo,
balise d'escadron, reboot/repair, mode tourelle, mode furtif (silent running), autodestruction —, Flight Assistance, Pilot
Preferences, Statistics), Inventory, Status, Playlist.

### 6.3 Panneau central, Comms et panneau Rôle

Le HUD central bascule entre **Mode Combat** (crochets orange incurvés, requis pour déployer/tirer les armes) et
**Mode Analyse** (crochets bleus droits, requis pour Discovery Scanner, FSS, DSS, Pulse Wave Analyser, Data Link
Scanner, Short Range Composition Scanner). Il affiche : informations et hologramme de la cible (bouclier en trois
anneaux, coque, localisation des impacts), hologramme du vaisseau du joueur (même principe), un **compas** (plein =
devant, contour = derrière, bleu si aligné pour un saut), un **scanner/radar** codé par couleur et forme (rouge
hostile, orange neutre, vert ami, gris épave/sillage, bleu coéquipier ; carré = affûts rentrés, triangle = déployés ;
plein = PNJ, contour = joueur), la **distribution de puissance** (6 pips/12 demi-pips entre SYS/ENG/WEP), un
indicateur de **chaleur** (dégâts à 100 %), et des indicateurs Mass Locked / Landing Gear / Cargo Scoop.

Le panneau **Comms** (touche dédiée, généralement C) est distinct des panneaux gauche/droit : Chat log, Comms
contacts, Inbox, Alerts, Comms options, Squadron Feed. Le panneau **Rôle** (terminologie officielle Frontier, « role
panel », employée jusque dans les notes de mise à jour) gère le changement de chargement et le débarquement en SRV
ou à pied ; les touches par défaut exactes ne sont pas confirmées de façon cohérente par les sources consultées.

### 6.4 Ciblage de sous-système : effets concrets

Cibler un sous-système précis d'un ennemi (via le sous-onglet Sub-Targets ou un raccourci de cyclage) permet de le
désactiver sélectivement — **mais seulement une fois le bouclier de la cible tombé**, la coque n'encaissant aucun
dégât tant que le bouclier est chargé. Deux effets concrets :

- **Sensors** détruits → les armes à tourelle et gimbal cessent de fonctionner (perte de verrouillage) ; les armes
  fixes restent utilisables.
- **Power Plant** désactivé → puissance disponible réduite de moitié (priorités de module à arbitrer) ; des dégâts
  cumulés supplémentaires d'environ 0,5 fois son intégrité provoquent une brèche catastrophique qui détruit le
  vaisseau quelle que soit sa coque restante.

---

## 7. Carburant : écopage, panne sèche et Fuel Rats

### 7.1 Écopage (Fuel Scoop)

Seules les étoiles de la **séquence principale O, B, A, F, G, K, M** sont scoopables (les naines blanches, étoiles à
neutrons et naines brunes ne le sont pas pour le ravitaillement, seulement pour le FSD Supercharging). Le taux
d'écopage croît avec la classe/notation du module, de 18 kg/s (1E) à 1 680 kg/s (8A) ; plus proche de l'étoile,
écopage plus rapide mais risque de surchauffe accru — un vaisseau immobile à distance de sécurité peut aussi écoper.

Le réservoir a une petite **réserve** séparée qui alimente les modules en continu et se recharge automatiquement
depuis le réservoir principal ; un saut FSD, lui, puise directement dans le réservoir principal en court-circuitant
la réserve. Chaque FSD a un plafond dur de carburant consommable par saut (« Max Fuel Per Jump », ex. 0,60 t pour un
2E, 8,00 t pour un 6A) : en dessous de ce plafond, la portée du saut chute proportionnellement. La formule complète
de consommation (masse, distance, constantes de FSD) est qualifiée de **spéculative** par sa propre source
communautaire, pas de mécanique officiellement publiée par Frontier.

### 7.2 Panne sèche

Réservoir principal et réserve tous deux vides → le Power Plant s'éteint intégralement : plus de FSD, propulseurs,
support de vie ni boucliers. Le pilote respire alors l'oxygène limité de sa combinaison Remlok ; une fois épuisé, il
s'éjecte (Redeployment) et le vaisseau s'autodétruit.

### 7.3 Appeler les Fuel Rats

Procédure vérifiée en direct le 12 septembre 2026 : sur `fuelrats.com`, cliquer « I Need Fuel! » (l'avertissement
prioritaire : si un compte à rebours « oxygen depleted » est affiché, **quitter au menu principal immédiatement**
pour le geler), puis remplir le formulaire `qms.fuelrats.com` (statut O2, nom du CMDR, système, plateforme). Le
joueur est connecté à un canal IRC (#fuelrats) où le bot **MechaSqueak** ouvre un dossier et déclenche un
« Ratsignal » ; un Dispatcher coordonne l'intervention. Les rats assignés rejoignent le système, puis transfèrent du
carburant via un **Fuel Transfer Limpet Controller** (1 tonne par limpet, ~5 secondes de délai chacun ; le carburant
n'est effectivement reçu qu'au message « Fuel Transfer Complete »). L'objectif est de donner assez d'autonomie pour
rejoindre un point de ravitaillement, pas de remplir le réservoir : service **gratuit**, don optionnel en fin
d'intervention.

*(Sources : elite-dangerous.fandom.com — Fuel, Fuel Scoop, Frame Shift Drive ; fuelrats.com ;
confluence.fuelrats.com/display/FRKB/Rescue+Standard+Operating+Procedures, consultées le 12 septembre 2026.)*

---

## Questions fréquentes

### À quelle distance faut-il demander l'autorisation d'accoster (docking request) ?

Il faut être à moins de **7 500 m** de la station : onglet Contacts (panneau gauche), sélectionner la station puis
« Request Docking Permission ». Au-delà de cette distance, la demande est automatiquement refusée. Voir
[section 2.1, « Procédure standard, étape par étape »](#21-procédure-standard-étape-par-étape).

### Combien de temps ai-je pour rejoindre mon pad une fois l'accostage accepté ?

Un délai de **dix minutes** s'affiche avec le numéro de pad attribué (« Proceed to landing pad XX »). Après le
décollage, il faut ensuite quitter la zone de la station dans les **cinq minutes**, sous peine d'être considéré en
flânerie. Voir [section 2.1, « Procédure standard, étape par étape »](#21-procédure-standard-étape-par-étape).

### Quelle est la taille du mailslot (access corridor) d'une station ?

Le corridor d'accès mesure environ **222 m de large sur 52 m de haut**. Il est gardé par des tourelles de défense qui
ouvrent le feu sur tout vaisseau flânant ou intrus, d'où l'intérêt d'activer l'option « Rotational Correction » pour
synchroniser sa rotation avec celle de la station. Voir
[section 2.1, « Procédure standard, étape par étape »](#21-procédure-standard-étape-par-étape).

### Quelle est la vitesse en supercroisière (supercruise) et le temps pour parcourir une année-lumière ?

La supercroisière va de **29,9 km/s à 2001c** ; à cette vitesse maximale, parcourir une année-lumière prend environ
**4 h 23 min**. Le freinage gravitationnel n'est pas un système dédié mais une conséquence directe du plafond de
vitesse, qui diminue à l'approche d'un corps massif. Voir [section 1, « Supercroisière »](#1-supercroisière).

### Quelle est la différence entre Safe Disengage et Emergency Drop pour sortir de la supercroisière ?

**Safe Disengage** s'obtient sous 1 Mm/s avec la cible verrouillée à moins de 1 Mm, cooldown FSD de 10 s et aucun
dégât. **Emergency Drop** (double appui à plus de 1 Mm/s, interdiction, carburant ≤ 5 %...) inflige 1-2 % de dégâts
sur coque et modules avec un cooldown de 40 s, jusqu'à ~30 % avec un FSD SCO engagé. Voir
[section 1, « Supercroisière »](#1-supercroisière).

### Pourquoi mon Anaconda (ou un autre gros vaisseau) ne peut pas se poser sur un avant-poste (outpost) ?

Aucun avant-poste n'a de pad Large : **onze vaisseaux** en sont exclus (Anaconda, Beluga Liner, Federal Corvette,
Imperial Cutter, Type-9 Heavy, Type-10 Defender...). À l'inverse, des ajouts récents comme le **Type-8 Transporter**
sont conçus spécifiquement pour desservir ces plateformes. Voir
[section 5, « Taille de vaisseau et pad requis »](#5-taille-de-vaisseau-et-pad-requis).

### Qu'est-ce qu'un Surface Port et en quoi diffère-t-il d'un Coriolis/Orbis/Ocellus ?

Coriolis, Orbis et Ocellus sont exclusivement des classes de stations **orbitales** dotées d'un mailslot ; il
n'existe pas de variante posée au sol. L'équivalent planétaire s'appelle **Surface Port** (Planetary Outpost ou
Planetary Port) : mêmes règles de demande à 7,5 km, mais pads à l'air libre sans corridor, soumis à la gravité réelle
de la planète. Voir
[section 2.3, « Variante planétaire : le Surface Port, pas un Coriolis au sol »](#23-variante-planétaire--le-surface-port-pas-un--coriolis-au-sol-).

### Comment se déroule un atterrissage planétaire (Orbital Cruise puis Glide) ?

L'**Orbital Cruise** s'active automatiquement à l'approche d'un corps atterrissable (tangage entre -5° et +5°,
plancher à **25 km**), puis le **Glide** prend le relais à vitesse constante de **2 500 m/s** jusqu'à **3 km**
d'altitude, où le vol normal reprend. Piquer trop fort dans l'un ou l'autre régime déclenche une chute d'urgence.
Voir [section 3, « Atterrissage planétaire »](#3-atterrissage-planétaire).

### Quel niveau technologique faut-il pour avoir un Chantier Naval (Shipyard) ou l'Équipement (Outfitting) ?

Les deux services exigent toujours un **niveau technologique système minimum de 35**, automatiquement atteint par un
port Tier 2 ou 3 ; un Tier 1 doit s'appuyer sur une installation qualifiante. Un avant-poste, dont les pads plafonnent
à Medium, a donc structurellement presque aucune chance d'obtenir un Chantier Naval complet. Voir
[section 4.2, « Disponibilité réelle des services de station »](#42-disponibilité-réelle-des-services-de-station).

### Quelles étoiles puis-je écoper avec un Fuel Scoop et à quel taux ?

Seules les étoiles de séquence principale **O, B, A, F, G, K, M** sont scoopables (pas les naines blanches, étoiles à
neutrons ni naines brunes). Le taux d'écopage va de **18 kg/s** pour un module 1E à **1 680 kg/s** pour un 8A, plus
rapide près de l'étoile mais avec un risque de surchauffe accru. Voir
[section 7.1, « Écopage (Fuel Scoop) »](#71-écopage-fuel-scoop).

### Que se passe-t-il en cas de panne sèche de carburant ?

Quand le réservoir principal et la réserve sont tous deux vides, le Power Plant s'éteint intégralement : plus de FSD,
propulseurs, support de vie ni boucliers. Le pilote respire alors l'oxygène limité de sa combinaison Remlok, puis
s'éjecte (Redeployment) avant que le vaisseau ne s'autodétruise. Voir
[section 7.2, « Panne sèche »](#72-panne-sèche).

### Comment appeler les Fuel Rats si je suis à sec de carburant ?

Sur `fuelrats.com`, cliquer « I Need Fuel! » (quitter au menu principal immédiatement si un compte à rebours
« oxygen depleted » s'affiche), puis remplir le formulaire `qms.fuelrats.com`. Le bot **MechaSqueak** ouvre un
dossier sur IRC et un Dispatcher coordonne l'intervention ; les rats transfèrent ensuite **1 tonne de carburant par
limpet** (~5 s chacun) via un Fuel Transfer Limpet Controller, service **gratuit**. Voir
[section 7.3, « Appeler les Fuel Rats »](#73-appeler-les-fuel-rats).

---

## Voir aussi

- **[Vaisseaux](./03-vaisseaux.md)** — caractéristiques de châssis, FSD/SCO, et la section « Gestion de flotte »
  (transfert et stockage de vaisseaux).
- **[Équipements](./04-equipements.md)** — modules cités ici (Supercruise Assist, Fuel Scoop, Docking Computer,
  Planetary Vehicle Hangar), et la section « Gestion de flotte — modules » (transfert et stockage de modules,
  outils de recherche).
- **[14-rhino.md](./14-rhino.md)** — Scarab, Scorpion et Rhino comparés, conduite, wave scanner, combat SRV.
- **[Combat spatial](./08-combat-spatial.md)** — interdiction, mass lock, crime et notoriety, rang de combat.
- **[Piraterie et PvP](./30-piraterie-et-pvp.md)** — Manifest Scanner, sous-ciblage en contexte de piraterie.
- **[Porte-vaisseaux (Fleet Carriers)](./19-fleet-carriers.md)** — détail des 16 pads et des services modulaires.
- **[La Colonisation](./18-colonisation.md)** — origine des seuils de niveau technologique cités en
  [section 4.2, « Disponibilité réelle des services de station »](#42-disponibilité-réelle-des-services-de-station).
- **[Le Minage](./20-minage.md)** — Wave Scanner du Scarab et Planetary Mining Deposit Scanner du Rhino.
- **[Débuter et progresser](./27-debuter-et-progresser.md)** — première heure de jeu, dont l'accostage fait partie.
- **[Le guide des outils communautaires](./16-outils.md)** — Fuel Rats parmi les initiatives d'entraide.

## Sources

### Sources distantes, consultées le 12 septembre 2026

- `elite-dangerous.fandom.com` — Supercruise, Supercruise Assist, Docking, Station, Access Corridor, Outpost,
  Surface Port, Orbis, Coriolis, Ocellus, Asteroid Base, Megaship, Fleet Carrier, Landing Pad, Concourse, Black
  Market, Interstellar Factor, Material Trader, Technology Broker, Universal Cartographics, HUD, HUD/Left,
  HUD/Right, HUD/Center, HUD/Down, Sensors, Power Plant, Shield Generator, Orbital Cruise, Planetary Landing, Glide,
  Landing Gear, Gravity, Fuel, Fuel Scoop, Frame Shift Drive, Shipyard, Outfitting.
- `community.elitedangerous.com/en/node/348` — Elite Dangerous: Horizons Quick Start Guide (source primaire
  Frontier pour l'Orbital Cruise et le Glide).
- `www.elitedangerous.com/update-notes/4-1-2-102` — notes officielles Trailblazers Update 3.3, seuils de service.
- `forums.frontier.co.uk` — fils sur la technique des 7 secondes/75 %, le transfert de vaisseau/module (b0redb0y,
  juin 2019), les pips en SRV, le panneau Rôle.
- `fuelrats.com`, `confluence.fuelrats.com` — procédure de secours, consultées en direct.
- `spansh.co.uk/stations` — outil de recherche de station par module/vaisseau, vérifié directement.

### Sources du corpus relues pour ce guide, sans modification

- [03-vaisseaux.md](./03-vaisseaux.md), [04-equipements.md](./04-equipements.md) — FSD/SCO, scanners, modules cités.
- [19-fleet-carriers.md](./19-fleet-carriers.md) — les 16 pads (8 L/4 M/4 S) d'un Porte-Vaisseau, repris ici sans
  modification.
- [18-colonisation.md](./18-colonisation.md) — niveau technologique 35 pour le Chantier Naval, déjà cité dans ce
  guide et confirmé ici par les notes officielles.

### Méthode et limites

Ce guide agrège six recherches indépendantes menées en parallèle (accostage/supercroisière, atterrissage/carburant,
typologie des stations/services, HUD/ciblage, SRV, logistique de flotte), chacune sourcée et datée séparément. Les
contradictions relevées entre pages d'une même source, ou entre une hypothèse de départ et ce que les sources
confirment réellement (absence de catégorie « Coriolis au sol », prime non confirmée comme motif de refus
d'accostage), sont rapportées telles quelles plutôt que tranchées d'autorité.
