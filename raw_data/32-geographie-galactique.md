---
id: 32-geographie-galactique
titre: "Géographie galactique, systèmes de référence et grands voyages dans Elite Dangerous"
domaine: exploration
entites: [la Bulle, Core Systems, Colonia, Jaques Station, Sagittarius A*, Beagle Point, Hutton Orbital,
  Colonia Bridge, DSSA, Stellar Forge, Inner Orion Spur, Shinrarta Dezhra]
mots_cles_en: [the bubble, core systems, colonia, jaques station, sagittarius a*, beagle point, hutton orbital,
  colonia bridge, dssa, deep space support array, stellar forge, galactic regions, spiral arm, boxel]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-12
confiance_globale: moyenne
volatilite: basse
sources_primaires: ["elite-dangerous.fandom.com (Core Systems, Galactic regions, Inner Orion Spur et bras nommés, Galaxy, Stellar Forge, Colonia, Jaques Station, Colonia Bridge, Sagittarius A*, Explorer's Anchorage, Beagle Point, Hutton Orbital, Pleiades/Witch Head/California Nebula, fiches des systèmes du gazetteer)", "hosting.zaonce.net (Player Journal Manual v32, champ StarPos)", "edsm.net (API publique, coordonnées vérifiées)", "wiki.herzbube.ch (nomenclature Stellar Forge)", "forums.frontier.co.uk (fil officiel DSSA)", "corpus interne (01-lore, 02-powerplay, 05-guardians, 10-exploration, 19-fleet-carriers)"]
zones_incertaines: ["rayon exact de la Bulle : ~200 al mesuré sur trois axes (wiki communautaire), une valeur de 150 al circule sans source primaire retrouvée", "nombre total actuel de systèmes peuplés dans/autour de la Bulle après plusieurs années de colonisation joueur, aucun chiffre 2026 confirmé", "aucune carte officielle de frontières fixes Fédération/Empire/Alliance : seuls des ordres de grandeur datés de 3308 et des cartes dynamiques tierces existent", "allégeance actuelle de Riedquat : contradiction entre deux pages du même wiki communautaire (Indépendant/Anarchie vs Fédération)", "nombre exact et espacement en années-lumière des porte-vaisseaux du réseau DSSA, non publié officiellement et non revérifié pour 2026", "distance de route réelle (par sauts successifs) jusqu'à Beagle Point, par opposition à la distance en ligne droite de 65 279 al", "classement officiel distance-par-distance des bras spiraux du Codex par rapport au centre galactique, non publié par Frontier — seule la distance du bras de Perseus (~6 400 al) est chiffrée", "format de nommage Stellar Forge (lettres de masse, tailles de boxel) : reconstruction communautaire de 2015 jamais démentie depuis, mais non documentée par une source primaire Frontier", "fiche système dédiée à Varati introuvable sur le wiki communautaire ; rôle reconstruit via des pages liées (Canonn, The Gnosis)"]
guides_lies: [1, 2, 5, 10, 19]
---

# Géographie galactique, systèmes de référence et grands voyages dans Elite Dangerous

## En bref

Ce guide donne au corpus le référentiel spatial qui lui manquait entièrement : où sont les lieux qu'il cite. **La
Bulle**, jamais définie malgré 13 fichiers qui l'emploient, mesure environ 200 années-lumière de rayon autour de
Sol, plus de 20 000 systèmes peuplés, sans frontière territoriale fixe entre Fédération, Empire et Alliance — leur
territoire fluctue en continu via le BGS et Powerplay. Un **gazetteer de 31 systèmes** fondateurs ou emblématiques
(les trois capitales, le siège de la Pilots Federation, les **Old Worlds** — littéralement « Vieux Mondes » —, les
QG Powerplay, Colonia). Les
**destinations hors-Bulle** avec leurs distances exactes depuis Sol : Colonia (22 000 al), Sagittarius A*
(25 900 al), Beagle Point (65 279 al **en ligne droite**, à ne pas confondre avec une distance de route), Hutton
Orbital (0,22 al, un rite de passage comique). La **structure galactique** : bras spiraux, 42 régions du Codex,
coordonnées x/y/z (Sol à l'origine), et la nomenclature Stellar Forge des secteurs procéduraux. Enfin les **grands
voyages** : fiches Colonia/Sagittarius A*/Beagle Point et une check-list d'expédition longue distance.

## Ce que couvre ce guide, et ce qu'il ne couvre pas

Le corpus documente en profondeur des activités (minage, exploration, combat) sans jamais situer où elles se
déroulent : « où est Colonia », « combien de sauts jusqu'au centre de la galaxie », « où trouve-t-on des
méta-alliages » restaient sans réponse. Ce guide ne reproduit pas les mécaniques déjà documentées ailleurs — formule
de portée de saut ([10-exploration.md](./10-exploration.md)), Neutron Router de Spansh (également 10-exploration),
logistique de Porte-Vaisseau ([19-fleet-carriers.md](./19-fleet-carriers.md)) — il y renvoie et fournit le
référentiel spatial qui les situe.

---

## 1. La Bulle : définition chiffrée

La **Bulle** (*The Bubble*, alias *Core Systems*) est une région ellipsoïdale d'environ **200 années-lumière de
rayon** autour de Sol, dans la région galactique Inner Orion Spur — mesures précises sur les trois axes de la
**Galaxy Map** (la carte galactique du jeu) depuis Sol (0,0,0) : environ 398 al en X, 595 al en Y, 393 al en Z (donc
allongée sur l'axe Y, pas une sphère parfaite). Elle contient plus de **20 000 systèmes peuplés** et plus de
**470 000 installations** (starports,
avant-postes, bases d'astéroïde, ports de surface, settlements) sur un volume d'environ 13,8 millions d'années-lumière
cubiques — un chiffre de base historique, la colonisation de systèmes par les joueurs (depuis 2025) ayant depuis fait
croître ce total sans qu'un chiffre à jour ait pu être confirmé pour 2026. Elle recoupe **28 des 42 régions** du
Codex ([section 4](#4-structure-de-la-galaxie--bras-régions-coordonnées-et-nomenclature)).

**Aucune frontière territoriale fixe n'existe.** Fédération, Empire et Alliance gouvernent chacune directement des
centaines à des milliers de systèmes (ordres de grandeur datés de janvier 3308 : environ 3 730 pour la Fédération,
4 239 pour l'Empire, 1 199 pour l'Alliance — obsolètes en 2026 mais indicatifs des proportions relatives), aux côtés
de puissances mineures notables (EG Union, Kumo Crew, Marlinist Colonies, Sirius Corporation, Utopia). Une large part
des systèmes de la Bulle reste indépendante. Le territoire réel varie en continu via le [BGS](./21-bgs.md) et
[Powerplay](./02-powerplay.md), système par système : aucune carte de démarcation figée n'a de sens durable — pour un
état à jour, consulter une carte dynamique (EDSM, Spansh, Inara) à la date voulue plutôt qu'une frontière citée ici.

---

## 2. Gazetteer des systèmes fondateurs et emblématiques

| Système | Allégeance | Rôle | Station emblématique | Permis |
|---|---|---|---|---|
| **Sol** | Fédération | Berceau de l'humanité, capitale fédérale (Mars) ; siège de l'invasion du Titan Cocijo (2024) | Mars High, Daedalus | Oui (Federal Navy Petty Officer) |
| **Achenar** | Empire | Capitale impériale depuis 2320 | Dawes Hub (Palais impérial) | Oui (Imperial Navy Squire) |
| **Alioth** | Alliance | Capitale de l'Alliance, fondée en 3230 | Donaldson | Oui (réputation Alliée) |
| **Shinrarta Dezhra** | Pilots Federation | Siège des Pilotes Fédérés, « Founders World » | Jameson Memorial (-10 %) | Oui (rang Elite ou héritage Kickstarter) |
| **Lave** | Indépendant | Ex-capitale du GalCop, système de départ du jeu original (1984) | Lave Station | Non |
| **Diso** | Alliance | Old World, patrie du Premier ministre Edmund Mahon | Shifnalport | Non |
| **Riedquat** | Indépendant/Anarchie *(contesté, voir zones incertaines)* | Old World, ex-repaire de pirates | — | Non |
| **Nanomam** | Fédération | QG Powerplay du président Jerome Archer (ex-Zachary Hudson) | Gresley Dock, Hahn Gateway | Non |
| **Facece** | Empire | 2ᵉ système de l'Empire, bastion de l'Imperial Navy, berceau de Jaques Station | — | Oui (Imperial Navy Earl) |
| **Cubeo** | Empire | QG Powerplay de la princesse Aisling Duval | — | Non |
| **Beta Hydri** | Fédération | Un des cinq systèmes fondateurs de l'Accord fédéral (2242) | — | Oui (Federal Navy Chief Petty Officer) |
| **Tionisla** | Alliance | Old World, cimetière orbital des pilotes Elite | — | Non |
| **Synteini** | Indépendant | QG Powerplay de la sénatrice Zemina Torval | — | Non |
| **Deciat** | Indépendant | Atelier de l'ingénieure Felicity Farseer | Farseer Inc | Non |
| **Maia** | Alliance | Premier établissement des Pléiades, épicentre des Barnacles thargoïdes | Obsidian Orbital | Non |
| **Merope** | Indépendant | Pléiades, découverte du premier Barnacle thargoïde (3302) | — | Non |
| **Delphi** | Indépendant | Ex-QG de recherche Aegis anti-thargoïde ; associé au mythe de Raxxla | Donar's Oak | Non |
| **Varati** | Indépendant | Siège du Canonn Interstellar Research Group ; départ du mégavaisseau The Gnosis (3303) | Thompson Dock | Non |
| **Leesti** | Alliance | Old World, atelier de l'ingénieure Didi Vatermann | George Lucas | Non |
| **Zaonce** | Alliance | Old World, siège de la Bank of Zaonce | — | Non |
| **Reorte** | Alliance | Old World, siège historique de Faulcon DeLacy | — | Non |
| **Orerve** | Fédération | Old World, site test du traitement anti-fléau des cultures (3305) | — | Non |
| **Sirius** | Indépendant | Premier système colonisé par une mégacorporation (Sirius Corp, 2339) | — | Oui (réputation Alliée) |
| **Colonia** | Indépendant | Capitale de facto de la région de Colonia (≈22 000 al de Sol, [section 3](#3-destinations-hors-bulle--distances-de-référence)) | Jaques Station | Non |
| **Asellus Primus** | Pilots Federation | Système de départ historique pour un nouveau Commandant | Baker's Prospect | Non |
| **Clayakarma** | Indépendant | QG Powerplay du dictateur Yuri Grom | — | Non |
| **Gateway** | Alliance | QG Powerplay d'Edmund Mahon ; point de départ de *Frontier: First Encounters* (1995) | Old Blackelk | Non |
| **Quator** | Fédération | Old World, théâtre de la Bataille de Lave Station (3265) | — | Non |
| **Uszaa** | Fédération | Old World | — | Non |
| **Orrere** | Indépendant/Anarchie | Old World, base du syndicat de pirates « The Code » | — | Non |
| **Eotienses** | Empire | QG Powerplay du sénateur Denton Patreus | Port Isabelle | Non |

*(Sources : elite-dangerous.fandom.com, fiche de chaque système et pages Permits/Federation, Permits/Empire,
Permits/Independent, consultées le 12 septembre 2026. Les capitales et Shinrarta Dezhra recoupent déjà
[01-lore.md §2.6-2.7](./01-lore.md) et les QG Powerplay recoupent [02-powerplay.md](./02-powerplay.md).)*

---

## 3. Destinations hors-Bulle : distances de référence

| Destination | Distance depuis Sol | Note |
|---|---|---|
| **Colonia** / Jaques Station | ≈ 22 000 al | Née de l'échouage accidentel de Jaques Station lors d'un saut extrême manqué vers Beagle Point (21 mai 3302). Voir [section 5](#5-les-grands-voyages). |
| **Sagittarius A\*** / Explorer's Anchorage | ≈ 25 900 al | Trou noir supermassif au centre galactique ; Explorer's Anchorage, la station habitée la plus distante de Sol, en est à seulement 3,66 al. |
| **Beagle Point** | ≈ 65 279 al **en ligne droite** | Distance directe, pas la distance de route (toujours plus longue à cause des détours). Premier atteint le 18 janvier 3301 par CMDR Erimus Kamzel. |
| **Hutton Orbital** (Alpha Centauri) | ≈ 0,22 al **en supercroisière** (6 784 404 ls) | Rite de passage comique de la communauté — environ 1h30 de trajet à pleine vitesse stock ; deux denrées rares exclusives (Centauri Mega Gin, The Hutton Mug). |
| **Nébuleuse des Pléiades** (Maia) | ≈ 384 al | Voir [section 2](#2-gazetteer-des-systèmes-fondateurs-et-emblématiques) ; diamètre d'environ 10 al. |
| **Witch Head Nebula** | ≈ 890 al | Site de colonisation « The Enclave » (2025), exploitation de méta-alliages issus de Barnacles thargoïdes. |
| **California Nebula** | ≈ 1 000 al | Développée par l'Alliance depuis fin 3302 ; éclairée par l'étoile Menkib. |
| **Nébuleuse Guardian** | « Plusieurs centaines d'al » (non chiffré précisément) | Voir [05-guardians.md](./05-guardians.md), qui ne donne pas de distance exacte. |

*(Sources : elite-dangerous.fandom.com — Colonia, Jaques Station, Sagittarius A\*, Explorer's Anchorage, Beagle
Point, Hutton Orbital, Pleiades/Witch Head/California Nebula, consultées le 12 septembre 2026.)*

---

## 4. Structure de la galaxie : bras, régions, coordonnées et nomenclature

**Bras spiraux et régions du Codex.** La galaxie du jeu est divisée depuis décembre 3304 en **42 « Galactic
Regions »** (Universal Cartographics), le découpage utilisé par le Codex — la Bulle en recoupe 28. Six régions
« bras » nommées d'après l'astronomie réelle existent, avec une nuance : *Scutum-Centaurus* se scinde en **Inner**
(#9, contient Colonia) et **Outer** (#26), distinct d'*Outer Arm* (#27) ; s'y ajoutent *Norma Arm* (#5),
*Orion-Cygnus Arm* (#16), **Inner Orion Spur** (#18, contient Sol et la Bulle), *Sagittarius-Carina Arm* (#21),
*Perseus Arm* (#30, à environ 6 400 al de Sol — seule distance de bras chiffrée trouvée), *Outer Orion Spur* (#35).
Topologiquement, l'Inner Orion Spur est frontalier direct de l'Inner Scutum-Centaurus Arm et de l'Outer Orion Spur,
mais **pas** directement du Sagittarius-Carina ni du Perseus — la carte du Codex n'est pas un simple anneau radial
autour du centre galactique. Frontier ne publie aucun classement officiel distance-par-distance de ses propres
régions ; l'ordre usuel (Norma → Scutum-Centaurus → Sagittarius-Carina → éperon d'Orion/Sol → Perseus → Outer)
reprend celui de l'astronomie réelle, dont le jeu revendique s'inspirer.

**Coordonnées galactiques x/y/z.** Le système utilisé par EDSM et Spansh (extrait tel quel du champ `StarPos` du
journal de jeu, en années-lumière) a pour origine **Sol = (0, 0, 0)**. L'axe X pointe vers le centre galactique,
l'axe Y vers l'« Est galactique », l'axe Z vers le « Nord galactique » (direction de la Chevelure de Bérénice).
Vérifié par requête directe à l'API EDSM : Alpha Centauri à (3,03 ; -0,09 ; 3,16), soit ≈ 4,38 al de Sol (valeur
réelle : 4,37 al) ; Sagittarius A\* à (25,2 ; -20,9 ; 25 900), soit ≈ 25 900 al.

**Génération procédurale (Stellar Forge) et nomenclature des secteurs.** Un système non nommé manuellement porte un
nom du type « *Nom-de-secteur* AA-A h0 » : le nom de secteur désigne un cube de **1 280 années-lumière de côté** ; ce
cube est ensuite subdivisé en huit catégories de masse (lettres A à H) correspondant à des cubes emboîtés de taille
décroissante — H = 1 280 al (le secteur entier), G = 640 al, F = 320 al, E = 160 al, D = 80 al, C = 40 al, B = 20 al,
A = 10 al. La lettre de masse encode la masse ZAMS de l'étoile primaire (A = la plus faible, H = la plus élevée),
d'où une corrélation entre lettre et type d'étoile probable (géantes/Wolf-Rayet/trous noirs concentrés en G/H, naines
brunes et rouges en A). Deux systèmes voisins dans l'espace partagent souvent le même nom de secteur parce qu'ils
tombent dans le même cube de 1 280 al — seuls l'ID de cube, la lettre de masse et le numéro final varient. Ce
mécanisme reste une reconstruction communautaire (2015, jamais démentie depuis), pas une spécification publiée par
Frontier. Preuve empirique de son fonctionnement : avant sa découverte réelle en 2017, l'étoile aujourd'hui nommée
**Trappist-1** portait un nom procédural (« Core Sys Sector XU-P a5-0 ») à un emplacement quasi identique, avant
d'être renommée par Frontier lors d'Horizons 2.3.

*(Sources : elite-dangerous.fandom.com — Galactic regions, Inner Orion Spur et pages de bras individuelles, Galaxy,
Stellar Forge ; hosting.zaonce.net (Player Journal Manual v32, champ StarPos) ; edsm.net (API publique) ;
wiki.herzbube.ch (EDExploration, nomenclature des secteurs) ; consultées le 12 septembre 2026.)*

---

## 5. Les grands voyages

### 5.1 Colonia

Née d'un accident : Jaques Station, en tentant le plus long saut FSD jamais enregistré (21 890 al) vers Beagle
Point, s'est échouée le 21 mai 3302 dans le système aujourd'hui nommé Colonia, redécouvert le 29 juin 3302. La région
compte aujourd'hui **8 Ingénieurs** — 4 ajoutés avec *Beyond* (vaisseau, dont Elvira Martuuk-like specialists à Los,
Tir, Luchtaine, Asura) et 4 avec *Odyssey* (combinaison/armes, à Deriso, Desy, Kojeara, Einheriar, déjà listés en
[07-equipement-a-pied.md](./07-equipement-a-pied.md#les-treize-engineers-à-pied--neuf-dans-la-bulle-core-quatre-à-colonia))
— accessibles via une invitation du Colonia Council plutôt que par la voie habituelle des Ingénieurs de la Bulle.
Jaques Station elle-même n'héberge aucun Ingénieur, mais dispose d'un Chantier Naval et d'un Équipement complets.
Le **Colonia Bridge**, financé par Brewer Corporation en 4 phases (octobre 3307 à février 3308), relie Alcor à
Colonia le long de la *Colonia Connection Highway* : environ 56 mégavaisseaux (*Flight Operations Carrier*, classe
Wells) espacés de 400 à 500 années-lumière, complétés par 6 starports Ocellus permanents à des points clés — 62
installations au total. Voir [19-fleet-carriers.md](./19-fleet-carriers.md) pour la logistique de Porte-Vaisseau
applicable à ce trajet.

### 5.2 Sagittarius A* et le centre galactique

Le trou noir supermassif au centre de la galaxie, avec l'étoile B « Source 2 » en orbite et la balise touristique
« The Centre ». **Explorer's Anchorage**, construite par l'expédition Distant Worlds II et mise en service le
21 février 3305, est à seulement 3,66 al — la station la plus proche à la fois de Sagittarius A* et de Beagle Point.
Aucune source officielle ne publie de portée de saut minimale *spécifique* à Sagittarius A* seul : les seuils de
33-45 al généralement cités concernent le tronçon le plus dur (*The Abyss*, vers Beagle Point) des expéditions qui
visitent aussi le centre galactique — via le Neutron Router déjà documenté en
[10-exploration.md §1.2](./10-exploration.md), Sagittarius A* est atteignable avec une portée de saut nettement plus
modeste.

### 5.3 Beagle Point et le bord de la galaxie

À 65 279 années-lumière de Sol **en ligne droite** (record établi le 18 janvier 3301 par CMDR Erimus Kamzel) — ne
pas confondre avec la distance de route effectivement parcourue par une expédition, toujours supérieure à cause des
détours (zones à faible densité stellaire de *The Abyss*, étoiles non ravitaillables). Portée de saut minimale
généralement citée : **34 al** sans recours au *jumponium* (boosts de synthèse de carburant).

### 5.4 Check-list d'une expédition longue distance

Le corpus documente déjà l'essentiel du fit d'exploration en
[10-exploration.md](./10-exploration.md#build-chiffré--portée-de-saut-stock-vs-ingénierée-du-diamondback-explorer-177-à-74-al) —
FSD classe A ingénierié + Guardian FSD Booster, Fuel Scoop (collecteur de carburant) classe A, AFMU (unité de
maintenance automatique), hangar SRV. En complément pour une
expédition de type Distant Worlds/Beagle Point :

- **Limpets de réparation** et **heat sinks** (charges de dissipation thermique instantanée) en réserve, au-delà de
  l'AFMU seul, pour les réparations d'urgence loin de tout support.
- **Synthèse de carburant** (jumponium) pour franchir ponctuellement un seuil de portée de saut trop juste.
- **Marge de sécurité** sur la portée de saut plutôt que le minimum théorique (33-34 al) — les routes calculées ne
  garantissent pas toujours une étoile scoopable à chaque étape.
- **Relais DSSA et Porte-Vaisseaux** : le réseau communautaire **DSSA** (*Deep Space Support Array*, initiative
  FleetComm), à ne pas confondre avec le Colonia Bridge officiel, maille la galaxie d'environ un Porte-Vaisseau par
  région (règle affichée : maximum trois par région pour éviter le regroupement), chacun offrant au minimum
  ravitaillement et réparation ouverts à tous. Contrairement au Colonia Bridge, aucun espacement en années-lumière
  n'est publié officiellement.
- **Sauvegarde des données non vendues** : vendre régulièrement les données d'exploration accumulées (FSS, DSS,
  scans d'exobiologie) à un contact Universal Cartographics ou Vista Genomics dès que l'occasion se présente, plutôt
  que d'attendre la fin de l'expédition — toute destruction du vaisseau avant la vente perd les données non
  encaissées.

---

## Questions fréquentes

**Où se trouve Colonia par rapport à Sol ?**
Colonia est à environ 22 000 années-lumière de Sol. Elle est née d'un accident : Jaques Station tentait le plus long
saut FSD jamais enregistré (21 890 al) vers Beagle Point et s'est échouée le 21 mai 3302 dans le système aujourd'hui
nommé Colonia, redécouvert le 29 juin 3302. Voir [Colonia](#51-colonia).

**Quelle est la taille de la Bulle (The Bubble) ?**
La Bulle mesure environ 200 années-lumière de rayon autour de Sol (précisément ≈398 al en X, ≈595 al en Y, ≈393 al
en Z, donc allongée sur l'axe Y). Elle contient plus de 20 000 systèmes peuplés et plus de 470 000 installations, sur
un volume d'environ 13,8 millions d'années-lumière cubiques. Voir
[La Bulle : définition chiffrée](#1-la-bulle--définition-chiffrée).

**Combien de temps faut-il pour rejoindre Hutton Orbital ?**
Hutton Orbital n'est qu'à 0,22 al de Sol (dans Alpha Centauri) mais représente 6 784 404 secondes-lumière en
supercroisière, soit environ 1h30 de trajet à pleine vitesse stock — un rite de passage comique de la communauté,
récompensé par deux denrées rares exclusives (Centauri Mega Gin, The Hutton Mug). Voir
[Destinations hors-Bulle](#3-destinations-hors-bulle--distances-de-référence).

**Quelle est la distance jusqu'à Beagle Point ?**
Beagle Point est à environ 65 279 années-lumière de Sol en ligne droite — une distance directe qui ne correspond pas
à la distance de route réellement parcourue (toujours plus longue à cause des détours). Le record a été établi le
18 janvier 3301 par CMDR Erimus Kamzel. Voir
[Beagle Point et le bord de la galaxie](#53-beagle-point-et-le-bord-de-la-galaxie).

**Combien y a-t-il de systèmes peuplés dans la Bulle (Core Systems) ?**
Plus de 20 000 systèmes peuplés et plus de 470 000 installations (starports, avant-postes, bases d'astéroïde, ports
de surface, settlements) — un chiffre de base historique, la colonisation de systèmes par les joueurs depuis 2025
ayant depuis fait croître ce total sans qu'un chiffre à jour ait pu être confirmé pour 2026.

**À quelle distance se trouve Sagittarius A\* du centre galactique ?**
Sagittarius A\*, le trou noir supermassif au centre de la galaxie, est à environ 25 900 années-lumière de Sol. La
station habitée la plus proche, Explorer's Anchorage (mise en service le 21 février 3305), n'en est qu'à 3,66 al —
c'est aussi la station la plus proche de Beagle Point. Voir
[Sagittarius A* et le centre galactique](#52-sagittarius-a-et-le-centre-galactique).

**Combien d'Ingénieurs (Engineers) sont accessibles depuis Colonia ?**
8 Ingénieurs sont accessibles à Colonia : 4 ajoutés avec Beyond (à Los, Tir, Luchtaine, Asura) et 4 avec Odyssey (à
Deriso, Desy, Kojeara, Einheriar), via une invitation du Colonia Council plutôt que par la voie habituelle des
Ingénieurs de la Bulle. Jaques Station elle-même n'héberge aucun Ingénieur. Voir [Colonia](#51-colonia).

**Comment fonctionne le Colonia Bridge ?**
Le Colonia Bridge relie Alcor à Colonia le long de la Colonia Connection Highway : environ 56 mégavaisseaux (Flight
Operations Carrier, classe Wells) espacés de 400 à 500 années-lumière, complétés par 6 starports Ocellus
permanents — 62 installations au total, financées en 4 phases par Brewer Corporation (octobre 3307 à février 3308).
Voir [Colonia](#51-colonia).

**C'est quoi le réseau DSSA (Deep Space Support Array) ?**
Le DSSA est un réseau communautaire (initiative FleetComm), à ne pas confondre avec le Colonia Bridge officiel, qui
maille la galaxie d'environ un Porte-Vaisseau par région (règle affichée : maximum trois par région), chacun offrant
au minimum ravitaillement et réparation ouverts à tous. Aucun espacement en années-lumière n'est publié
officiellement. Voir
[Check-list d'une expédition longue distance](#54-check-list-dune-expédition-longue-distance).

**Combien de régions galactiques (Galactic Regions) le Codex compte-t-il ?**
42 « Galactic Regions » découpent la galaxie depuis décembre 3304, dont 28 recoupent la Bulle. Sol et la Bulle se
trouvent dans l'Inner Orion Spur (#18) ; Colonia dans le Scutum-Centaurus Inner (#9). Voir
[Structure de la galaxie](#4-structure-de-la-galaxie--bras-régions-coordonnées-et-nomenclature).

**Quelle portée de saut minimale pour une expédition vers Beagle Point ?**
Le seuil généralement cité est de 34 al sans recours au jumponium (boosts de synthèse de carburant). Une marge de
sécurité au-delà de ce minimum théorique (33-34 al) est recommandée, car les routes calculées ne garantissent pas
toujours une étoile scoopable à chaque étape. Voir
[Beagle Point et le bord de la galaxie](#53-beagle-point-et-le-bord-de-la-galaxie).

**Comment sont nommés les systèmes procéduraux (Stellar Forge) ?**
Un système non nommé manuellement porte un nom du type « Nom-de-secteur AA-A h0 » : le secteur mesure 1 280
années-lumière de côté, subdivisé en huit catégories de masse (lettres A à H, de 10 al à 1 280 al) qui encodent la
masse ZAMS de l'étoile primaire. C'est une reconstruction communautaire de 2015, jamais démentie depuis mais non
documentée officiellement par Frontier. Voir
[Structure de la galaxie](#4-structure-de-la-galaxie--bras-régions-coordonnées-et-nomenclature).

---

## Voir aussi

- **[Elite Dangerous : lore et histoire de l'univers](./01-lore.md)** — capitales des trois superpuissances et
  siège de la Pilots Federation
  ([§2.6](./01-lore.md#26-tableau-comparatif-des-trois-superpuissances-fondation-régime-capitale-dirigeant-en-3312)-[§2.7](./01-lore.md#27-la-pilots-federation-organisation-neutre-au-dessus-des-superpuissances)),
  repris sans modification dans le gazetteer.
- **[Politique et Powerplay](./02-powerplay.md)** — les QG Powerplay cités dans le gazetteer (Cubeo, Synteini,
  Clayakarma, Gateway, Eotienses, Nanomam).
- **[Guide complet des Guardians](./05-guardians.md)** — Nébuleuse Guardian, distance non chiffrée précisément.
- **[Exploration et exobiologie](./10-exploration.md)** — formule de portée de saut, Neutron Router, fit
  d'expédition longue distance, régions galactiques citées pour la répartition des espèces d'exobiologie.
- **[Porte-vaisseaux (Fleet Carriers)](./19-fleet-carriers.md)** — logistique de Porte-Vaisseau applicable au
  Colonia Bridge et au réseau DSSA.
- **[Le Background Simulation (BGS)](./21-bgs.md)** et **[Politique et Powerplay](./02-powerplay.md)** — pourquoi
  aucune frontière territoriale de la Bulle n'est fixe.

## Sources

### Sources distantes, consultées le 12 septembre 2026

- `elite-dangerous.fandom.com` — Core Systems, Galactic regions, Inner Orion Spur et pages de bras individuelles
  (Norma, Scutum-Centaurus Inner/Outer, Orion-Cygnus, Sagittarius-Carina, Perseus, Outer Arm, Outer Orion Spur),
  Galaxy, Stellar Forge, Colonia, Jaques Station, Colonia Bridge, Sagittarius A*, Explorer's Anchorage, Beagle
  Point, Hutton Orbital, Pleiades/Witch Head/California Nebula, Engineers, et la fiche de chacun des 31 systèmes du
  gazetteer ([section 2](#2-gazetteer-des-systèmes-fondateurs-et-emblématiques)), plus Permits/Federation,
  Permits/Empire, Permits/Independent.
- `hosting.zaonce.net/community/journal/v32/Journal_Manual-v32.pdf` — Player Journal Manual officiel, champ
  `StarPos`.
- `edsm.net/api-v1/system` — API publique, coordonnées vérifiées directement (Sol, Alpha Centauri, Colonia,
  Sagittarius A*).
- `wiki.herzbube.ch/index.php/EDExploration` — nomenclature Stellar Forge des secteurs et catégories de masse.
- `forums.frontier.co.uk` — fil officiel « The Deep Space Support Array (DSSA) | A FleetComm Initiative ».
- `distantworlds3.space/faq` — seuils de portée de saut recommandés pour Beagle Point/The Abyss (expédition
  Distant Worlds 3).
- `en.wikipedia.org/wiki/Elite_Dangerous` — ordres de grandeur de systèmes par superpuissance (datés, janvier 3308).

### Sources tentées et inaccessibles le 12 septembre 2026

- `forums.frontier.co.uk` — plusieurs fils sources primaires (décodage Stellar Forge, coordonnées galactiques,
  nombre exact de porte-vaisseaux DSSA) bloqués par un contrôle anti-robot ; consultés via des relais tiers.
- `spansh.co.uk/docs`, `/api` — documentation propre du système de coordonnées non récupérable (squelette JS vide).

### Méthode et limites

Ce guide agrège trois recherches indépendantes (Bulle/gazetteer/DSSA, bras spiraux/Codex/coordonnées/Stellar Forge,
grands voyages/distances), chacune sourcée et datée séparément. Plusieurs chiffres qui circulent largement dans des
synthèses agrégées (rayon de 150 al pour la Bulle, distance de route de 81 500 al vers Beagle Point) n'ont pu être
retracés à aucune source primaire consultable et sont explicitement écartés plutôt que repris.
