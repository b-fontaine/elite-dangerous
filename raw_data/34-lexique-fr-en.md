---
id: 34-lexique-fr-en
titre: "Lexique bilingue français-anglais des termes d'Elite Dangerous"
domaine: transversal
entites: [Frame Shift Drive, Fleet Carrier, Hardpoint, Mass Lock, Wake, Notoriety, Thargoïde, Guardian, Powerplay, Background Simulation, Community Goal, Manifest Scanner]
mots_cles_en: [frame shift drive, fleet carrier, hardpoint, mass lock, wake, notoriety, thargoid, guardian, powerplay, background simulation, community goal, manifest scanner, hatch breaker, heat sink, fuel scoop, power distributor, shield cell bank, point defence, chaff launcher, fsd interdictor, nav beacon, compromised nav beacon, mission board, interstellar factors, universal cartographics, material trader, technology broker, rebuy, silent running]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-13
confiance_globale: haute
volatilite: basse
sources_primaires: ["corpus interne — lecture intégrale et vérification par grep des 32 guides thématiques et du glossaire (raw_data/*.md)", "00-glossaire.md", "04-equipements.md", "08-combat-spatial.md", "06-ingenieurs.md", "31-pilotage-navigation-et-stations.md"]
zones_incertaines: ["la colonne « Synonymes et abréviations communauté » restitue un usage communautaire anglophone ou francophone général, pas nécessairement attesté mot pour mot dans un guide du corpus", "quelques termes très recherchés par les joueurs (Passenger Lounge notamment) ne sont nommés par aucun guide du corpus sous ce nom exact ; la ligne correspondante le signale plutôt que d'inventer une source", "le « Guide de référence » indiqué est celui qui traite le terme le plus en détail, mais la plupart des termes apparaissent aussi, en passant, dans plusieurs autres guides"]
guides_lies: [0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 28, 29, 30, 31, 32]
---

# Lexique bilingue français-anglais des termes d'Elite Dangerous

## En bref

*Elite Dangerous* se joue en anglais : modules, lieux et mécaniques portent leur nom officiel anglais, et un joueur
qui cherche de l'aide emploie ces noms-là. Le corpus, lui, répond en français, en glosant ou en conservant ces termes
selon les guides. Ce lexique fait le pont : il aligne le nom anglais tel qu'il apparaît en jeu, la façon dont le
corpus le nomme en français, les synonymes et abréviations que la communauté emploie couramment (FSD, HRP, CNB, PA,
SCB...), et le guide où le sujet est traité en profondeur. Il ne tranche aucun fait de jeu ni n'ajoute de donnée
chiffrée : chaque ligne a été vérifiée par relecture directe du fichier cité, jamais déduite — quand un terme cherché
par les joueurs n'est nommé par aucun guide, la ligne le dit plutôt que d'inventer une source. Deux usages attendus :
retrouver, depuis une requête en anglais, le bon guide français à interroger ; et, à l'ingestion RAG, enrichir
l'index des formes anglaises que les guides n'emploient pas toujours littéralement.

## Lexique

Classement par domaine de jeu, des modules et lieux transversaux vers les systèmes thématiques (BGS, Powerplay,
Colonisation, Guardians, Thargoïdes, vie sociale, Odyssey...), sur le modèle des regroupements du
[README.md](./README.md). Chaque sous-tableau partage les quatre mêmes colonnes.

### Modules de vaisseau — emplacements standards et internes

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Frame Shift Drive | Frame Shift Drive, module standard de saut hyperspatial et de survitesse | FSD | [04-equipements.md](./04-equipements.md) |
| Frame Shift Drive (SCO) | Frame Shift Drive, variante Supercruise Overcharge | SCO | [04-equipements.md](./04-equipements.md) |
| Power Plant | centrale électrique (Power Plant) | PP (rare, ambigu avec Powerplay) | [04-equipements.md](./04-equipements.md) |
| Power Distributor | distributeur d'énergie (Power Distributor) | pips, SYS/ENG/WEP | [04-equipements.md](./04-equipements.md) |
| Life Support | support de vie (Life Support) | LS | [04-equipements.md](./04-equipements.md) |
| Sensors | senseurs (Sensors) | — | [04-equipements.md](./04-equipements.md) |
| Fuel Tank | réservoir de carburant (Fuel Tank) | — | [04-equipements.md](./04-equipements.md) |
| Cargo Rack | soute (Cargo Rack) | — | [04-equipements.md](./04-equipements.md) |
| Shield Generator | générateur de bouclier, bouclier standard | SG | [04-equipements.md](./04-equipements.md) |
| Bi-Weave Shield Generator | générateur de bouclier Bi-Weave | Bi-Weave | [04-equipements.md](./04-equipements.md) |
| Prismatic Shields | Prismatic Shield Generator, exclusif de rang Powerplay | Prismatics | [04-equipements.md](./04-equipements.md) |
| Shield Cell Bank | Shield Cell Bank, recharge d'urgence par cellules consommables | SCB | [04-equipements.md](./04-equipements.md) |
| Shield Booster | Shield Booster, module utilitaire augmentant la capacité du bouclier | booster | [04-equipements.md](./04-equipements.md) |
| Hull Reinforcement Package | renfort de coque (Hull Reinforcement Package) | HRP | [04-equipements.md](./04-equipements.md) |
| Module Reinforcement Package | protection des modules (Module Reinforcement Package) | MRP | [04-equipements.md](./04-equipements.md) |
| Bulkheads | blindage de coque (bulkheads) | — | [04-equipements.md](./04-equipements.md) |
| Auto Field-Maintenance Unit | unité de maintenance automatique (AFMU) | AFMU | [04-equipements.md](./04-equipements.md) |
| Fuel Scoop | collecteur de carburant (Fuel Scoop) | scoop | [04-equipements.md](./04-equipements.md) |
| Refinery | raffinerie embarquée (Refinery) | — | [04-equipements.md](./04-equipements.md) |
| Detailed Surface Scanner | module de cartographie de surface (Detailed Surface Scanner) | DSS | [04-equipements.md](./04-equipements.md) |
| Full Spectrum Scanner | scan à distance intégré (Full Spectrum System Scanner) — pas un module à acheter | FSS | [04-equipements.md](./04-equipements.md) |
| Discovery Scanner (basique) | scanner de découverte basique | « honk » | [10-exploration.md](./10-exploration.md) |
| Frame Shift Wake Scanner | scanner de sillage (Frame Shift Wake Scanner) | FSWS | [08-combat-spatial.md](./08-combat-spatial.md) |
| Kill Warrant Scanner | Kill Warrant Scanner, révèle les primes actives d'une autre juridiction | KWS | [04-equipements.md](./04-equipements.md) |
| Manifest Scanner | Manifest Scanner, anciennement Cargo Scanner (même module) | Cargo Scanner (nom historique) | [30-piraterie-et-pvp.md](./30-piraterie-et-pvp.md) |
| Pulse Wave Analyser | Pulse Wave Analyser, détection de gisements miniers | PWA | [20-minage.md](./20-minage.md) |
| Xeno Scanner | Xeno Scanner (et variantes Enhanced, Pulse Wave) | XS | [04-equipements.md](./04-equipements.md) |
| Frame Shift Drive Interdictor | Frame Shift Drive Interdictor, module d'interdiction | Interdictor | [08-combat-spatial.md](./08-combat-spatial.md) |
| Hatch Breaker Limpet Controller | contrôleur de Hatch Breaker | Hatch Breaker | [30-piraterie-et-pvp.md](./30-piraterie-et-pvp.md) |
| Collector Limpet Controller | contrôleur de Collector Limpet | Collector | [20-minage.md](./20-minage.md) |
| Prospector Limpet Controller | contrôleur de Prospector Limpet | Prospector | [20-minage.md](./20-minage.md) |
| Heat Sink Launcher | Heat Sink Launcher, dissipation thermique instantanée | Heat Sink | [04-equipements.md](./04-equipements.md) |
| Chaff Launcher | Chaff Launcher, brouille le verrouillage adverse | Chaff | [04-equipements.md](./04-equipements.md) |
| Point Defence | Point Defence, tourelle anti-missile automatique | PD | [04-equipements.md](./04-equipements.md) |
| Shutdown Field Neutraliser | Shutdown Field Neutraliser | SFN | [25-combat-ax.md](./25-combat-ax.md) |
| Docking Computer (Standard/Advanced) | ordinateur d'accostage (Standard/Advanced Docking Computer) | ADC | [31-pilotage-navigation-et-stations.md](./31-pilotage-navigation-et-stations.md) |
| Supercruise Assist | Supercruise Assist | SCA | [31-pilotage-navigation-et-stations.md](./31-pilotage-navigation-et-stations.md) |
| Vessel Hangar (ex-Fighter Hangar) | Vessel Hangar, anciennement Fighter Hangar (renommé) | baie de chasseur | [03-vaisseaux.md](./03-vaisseaux.md) |

### Armement (hardpoints)

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Hardpoint | point d'ancrage d'armes (hardpoint) | point d'emport | [04-equipements.md](./04-equipements.md) |
| Multi-Cannon | Multi-Cannon | MC | [04-equipements.md](./04-equipements.md) |
| Beam Laser | Beam Laser (laser à faisceau continu) | — | [04-equipements.md](./04-equipements.md) |
| Pulse Laser | Pulse Laser (laser à impulsions) | — | [04-equipements.md](./04-equipements.md) |
| Burst Laser | Burst Laser (laser en rafale) | — | [04-equipements.md](./04-equipements.md) |
| Rail Gun | Rail Gun | — | [04-equipements.md](./04-equipements.md) |
| Plasma Accelerator | Plasma Accelerator | PA | [04-equipements.md](./04-equipements.md) |
| Missile Rack (Seeker/Dumbfire/Torpedo Pylon) | famille des armes à guidage (Missile Rack, Torpedo Pylon) | — | [04-equipements.md](./04-equipements.md) |
| Guardian Gauss Cannon | Guardian Gauss Cannon | Gauss | [05-guardians.md](./05-guardians.md) |
| Guardian Plasma Charger | Guardian Plasma Charger | — | [05-guardians.md](./05-guardians.md) |
| Guardian Shard Cannon | Guardian Shard Cannon | Shard | [05-guardians.md](./05-guardians.md) |
| Guardian FSD Booster | Guardian FSD Booster | FSD Booster | [05-guardians.md](./05-guardians.md) |
| Mining Laser | Mining Laser (laser minier) | — | [20-minage.md](./20-minage.md) |
| Abrasion Blaster | Abrasion Blaster | — | [20-minage.md](./20-minage.md) |
| Seismic Charge Launcher / Sub-Surface Displacement Missile | armes de fracturation de gisement (core mining) | SSDM | [20-minage.md](./20-minage.md) |

### Lieux et services de station

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Interstellar Factors | Interstellar Factors (Contact) | IF | [08-combat-spatial.md](./08-combat-spatial.md) |
| Universal Cartographics | comptoirs Universal Cartographics | UC | [10-exploration.md](./10-exploration.md) |
| Material Trader | Material Trader | — | [06-ingenieurs.md](./06-ingenieurs.md) |
| Technology Broker (Guardian/Human) | Technology Broker (Guardian et Human, deux inventaires distincts) | Tech Broker | [06-ingenieurs.md](./06-ingenieurs.md) |
| Nav Beacon | Nav Beacon (balise de navigation) | — | [06-ingenieurs.md](./06-ingenieurs.md) |
| Compromised Nav Beacon | Nav Beacon compromis | CNB | [08-combat-spatial.md](./08-combat-spatial.md) |
| Unidentified Signal Source | source de signal non identifiée | USS | [08-combat-spatial.md](./08-combat-spatial.md) |
| Concourse | Concourse (zone sociale à pied) | — | [31-pilotage-navigation-et-stations.md](./31-pilotage-navigation-et-stations.md) |
| Drydock | Drydock (chantier de radoub pour Porte-Vaisseaux) | — | [19-fleet-carriers.md](./19-fleet-carriers.md) |
| Shipyard | Chantier Naval (Shipyard) | — | [31-pilotage-navigation-et-stations.md](./31-pilotage-navigation-et-stations.md) |
| Outfitting | Équipement (Outfitting) | — | [04-equipements.md](./04-equipements.md) |
| Commodities Market | marché (Commodities Market) | — | [11-commerce.md](./11-commerce.md) |
| Black Market | marché noir | — | [30-piraterie-et-pvp.md](./30-piraterie-et-pvp.md) |
| Bartender | Bartender (comptoir d'échange de matériaux à pied) | — | [07-equipement-a-pied.md](./07-equipement-a-pied.md) |
| Crew Lounge | Crew Lounge (recrutement d'équipage PNJ) | — | [23-jeu-en-groupe.md](./23-jeu-en-groupe.md) |
| Passenger Lounge | *non nommé sous ce terme par le corpus* — traité via les cabines passagers et les missions de transport | cabines passagers | [12-transport.md](./12-transport.md) |
| Vista Genomics | Vista Genomics | — | [10-exploration.md](./10-exploration.md) |
| Pioneer Supplies | Pioneer Supplies | — | [07-equipement-a-pied.md](./07-equipement-a-pied.md) |
| Mission Board | tableau des missions | Board | [29-missions-reputation-et-rangs.md](./29-missions-reputation-et-rangs.md) |
| Apex Interstellar | Apex Interstellar (Transport) | Apex | [29-missions-reputation-et-rangs.md](./29-missions-reputation-et-rangs.md) |
| Frontline Solutions | Frontline Solutions | — | [29-missions-reputation-et-rangs.md](./29-missions-reputation-et-rangs.md) |

### Porte-vaisseaux (Fleet Carriers)

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Fleet Carrier | Porte-Vaisseau (Fleet Carrier) | FC | [19-fleet-carriers.md](./19-fleet-carriers.md) |
| Tritium | Tritium (carburant de Porte-Vaisseau) | — | [19-fleet-carriers.md](./19-fleet-carriers.md) |
| Tritium Depot | dépôt de Tritium | — | [19-fleet-carriers.md](./19-fleet-carriers.md) |
| Carrier Jump | saut de Porte-Vaisseau | — | [19-fleet-carriers.md](./19-fleet-carriers.md) |
| Decommissioning | décommissionnement | — | [19-fleet-carriers.md](./19-fleet-carriers.md) |
| Stronghold Carrier | Stronghold Carrier | — | [19-fleet-carriers.md](./19-fleet-carriers.md) |

### Vol, navigation et combat spatial

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Supercruise | supercroisière | SC | [31-pilotage-navigation-et-stations.md](./31-pilotage-navigation-et-stations.md) |
| Interdiction | interdiction | — | [08-combat-spatial.md](./08-combat-spatial.md) |
| Mass Lock (Mass Lock Factor) | mass lock (verrouillage de masse) | MLF | [08-combat-spatial.md](./08-combat-spatial.md) |
| Wake (low/high) | sillage (low wake / high wake) | wake | [08-combat-spatial.md](./08-combat-spatial.md) |
| Boost | boost | — | [08-combat-spatial.md](./08-combat-spatial.md) |
| Silent Running | mode furtif (silent running) | SR | [08-combat-spatial.md](./08-combat-spatial.md) |
| Flight Assist Off | Flight Assist Off (coupure de l'assistance de vol) | FA off | [08-combat-spatial.md](./08-combat-spatial.md) |
| Pips | pips (répartition SYS/ENG/WEP) | — | [08-combat-spatial.md](./08-combat-spatial.md) |
| Glide | Glide (transition survitesse → vol atmosphérique) | — | [31-pilotage-navigation-et-stations.md](./31-pilotage-navigation-et-stations.md) |
| Mailslot | mailslot (ouverture d'accostage) | — | [31-pilotage-navigation-et-stations.md](./31-pilotage-navigation-et-stations.md) |
| Combat Zone | zone de conflit (Combat Zone) | CZ | [08-combat-spatial.md](./08-combat-spatial.md) |
| Resource Extraction Site | site d'extraction de ressources | RES, HazRES | [08-combat-spatial.md](./08-combat-spatial.md) |
| Notoriety | notoriety (ne se paie pas, décroît seule) | — | [08-combat-spatial.md](./08-combat-spatial.md) |
| Rebuy | rebuy (coût de remplacement du vaisseau) | — | [03-vaisseaux.md](./03-vaisseaux.md) |
| Bounty Voucher / Combat Bond | bounty voucher (prime) et combat bond, un par faction émettrice | — | [08-combat-spatial.md](./08-combat-spatial.md) |
| Wanted / Clean | statut « wanted » (recherché) ou « clean » | — | [08-combat-spatial.md](./08-combat-spatial.md) |
| First Footfall | First Footfall (première empreinte, ne verse aucun crédit) | — | [10-exploration.md](./10-exploration.md) |
| First Logged | First Logged (première consignation d'exobiologie, ×5) | — | [10-exploration.md](./10-exploration.md) |
| First discovered / First mapped | première découverte / première cartographie | — | [10-exploration.md](./10-exploration.md) |

### Colonisation de systèmes

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| System Colonisation | Colonisation de systèmes (System Colonisation) | — | [18-colonisation.md](./18-colonisation.md) |
| System Architect | Architecte système (System Architect) | — | [18-colonisation.md](./18-colonisation.md) |
| System Colonisation Beacon | Balise de colonisation système | balise | [18-colonisation.md](./18-colonisation.md) |
| Construction Point | Construction Point (unité de progression d'un chantier) | CP | [18-colonisation.md](./18-colonisation.md) |
| Primary Port | port primaire | — | [18-colonisation.md](./18-colonisation.md) |
| Tier (construction) | Tier (palier de construction) | — | [18-colonisation.md](./18-colonisation.md) |
| Uncontrolled Populated | statut « Uncontrolled Populated » | — | [18-colonisation.md](./18-colonisation.md) |

### BGS, Powerplay et Community Goals

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Background Simulation | Background Simulation | BGS | [21-bgs.md](./21-bgs.md) |
| Minor Faction | faction mineure | — | [21-bgs.md](./21-bgs.md) |
| Controlling Faction | faction contrôlante | — | [21-bgs.md](./21-bgs.md) |
| Influence | influence (INF) | INF | [21-bgs.md](./21-bgs.md) |
| Tick (BGS) | tick quotidien (horaire jamais publié) | — | [21-bgs.md](./21-bgs.md) |
| Boom / Bust / Famine / Outbreak / Lockdown / Investment | états économiques du BGS | — | [21-bgs.md](./21-bgs.md) |
| War / Civil War / Election / Expansion / Retreat | états de conflit du BGS | — | [21-bgs.md](./21-bgs.md) |
| Player Minor Faction | faction mineure de joueurs (Player Minor Faction) | PMF | [21-bgs.md](./21-bgs.md) |
| Powerplay | Powerplay | PP | [02-powerplay.md](./02-powerplay.md) |
| Merits / Pledge | mérites (permanents depuis Powerplay 2.0), gagnés en s'engageant (pledge) auprès d'un Power | — | [02-powerplay.md](./02-powerplay.md) |
| Acquisition (Powerplay) | Acquisition | — | [02-powerplay.md](./02-powerplay.md) |
| Reinforcement (Powerplay) | Renforcement | — | [02-powerplay.md](./02-powerplay.md) |
| Undermining | Undermining (déstabilisation) | — | [02-powerplay.md](./02-powerplay.md) |
| Exploited / Fortified / Stronghold | Exploité / Fortifié / Bastion (états de contrôle territorial) | — | [02-powerplay.md](./02-powerplay.md) |
| Community Goal | objectif communautaire (Community Goal) | CG | [24-community-goals.md](./24-community-goals.md) |

### Commerce, transport, minage et marchandises

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Trade Rank | rang de commerce (Trade Rank), neuf paliers | — | [11-commerce.md](./11-commerce.md) |
| Rare Goods | denrées rares | — | [28-marchandises.md](./28-marchandises.md) |
| Robigo Run | Robigo Run | — | [11-commerce.md](./11-commerce.md) |
| Smuggling | contrebande | — | [11-commerce.md](./11-commerce.md) |
| Search & Rescue | Search & Rescue (sauvetage de survivants) | SAR | [12-transport.md](./12-transport.md) |
| Occupied Escape Pod / Black Box / Wreckage Component | capsule de sauvetage occupée / boîte noire / composant d'épave | — | [12-transport.md](./12-transport.md) |
| Passenger Cabin (Economy/Business/First/Luxury) | cabine passagers (Économique, Affaires, Première, Luxe) | — | [12-transport.md](./12-transport.md) |
| Core Mining | minage de noyau (core mining) | — | [20-minage.md](./20-minage.md) |
| Laser Mining | minage au laser | — | [20-minage.md](./20-minage.md) |
| Hotspot | hotspot (concentration minérale) | — | [20-minage.md](./20-minage.md) |
| Ring (Icy/Rocky/Metallic/Metal-Rich) | anneau glacé / rocheux / métallique / riche en métaux | — | [20-minage.md](./20-minage.md) |
| Commodity categories (Salvage, Minerals, Machinery, Metals) | catégories de marchandises : Récupération, Minéraux, Machines, Métaux | — | [28-marchandises.md](./28-marchandises.md) |

### Ingénierie (Engineers) et matériaux

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Engineer | Ingénieur (Engineer) | — | [06-ingenieurs.md](./06-ingenieurs.md) |
| Blueprint | blueprint (plan de modification) | — | [06-ingenieurs.md](./06-ingenieurs.md) |
| Experimental Effect | effet expérimental | — | [06-ingenieurs.md](./06-ingenieurs.md) |
| Grade (blueprint/matériau) | grade | G1-G5 | [06-ingenieurs.md](./06-ingenieurs.md) |
| Roll | roll (application d'un blueprint, déterministe depuis l'Update 18.08) | — | [06-ingenieurs.md](./06-ingenieurs.md) |
| Raw materials | matériaux bruts (Raw) | — | [06-ingenieurs.md](./06-ingenieurs.md) |
| Manufactured materials | matériaux manufacturés (Manufactured) | — | [06-ingenieurs.md](./06-ingenieurs.md) |
| Encoded materials (Data) | données encodées (Encoded) | — | [06-ingenieurs.md](./06-ingenieurs.md) |
| High Grade Emission | High Grade Emission | HGE | [06-ingenieurs.md](./06-ingenieurs.md) |
| Merc Coin | Merc Coin (monnaie du mode Operations) | — | [13-operations.md](./13-operations.md) |
| MercGear | MercGear (catalogue payé en Merc Coin) | — | [13-operations.md](./13-operations.md) |

### Exploration et exobiologie

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Road to Riches | Road to Riches | RtR | [10-exploration.md](./10-exploration.md) |
| Neutron Highway | Neutron Highway | — | [10-exploration.md](./10-exploration.md) |
| Supercharge (FSD) | surcharge du FSD (supercharge) | — | [10-exploration.md](./10-exploration.md) |
| Genetic Sampler | Genetic Sampler (intégré à la combinaison Artemis) | — | [07-equipement-a-pied.md](./07-equipement-a-pied.md) |
| Codex (in-jeu) | Codex, à ne pas confondre avec le « Codex Canonn » | — | [10-exploration.md](./10-exploration.md) |
| Distant Worlds (expédition) | expédition Distant Worlds | DW | [32-geographie-galactique.md](./32-geographie-galactique.md) |
| Exobiology | exobiologie | — | [10-exploration.md](./10-exploration.md) |

### Guardians

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Guardian Ruins | Guardian Ruins (site de ruines non défendu) | — | [05-guardians.md](./05-guardians.md) |
| Guardian Structures | Guardian Structures (site défendu par des Sentinels) | — | [05-guardians.md](./05-guardians.md) |
| Guardian Sentinel | Sentinel (Guardian Sentinel) | — | [05-guardians.md](./05-guardians.md) |
| Relic Tower | Relic Tower (tour-relique) | — | [05-guardians.md](./05-guardians.md) |
| Blueprint Segment | Blueprint Segment | — | [05-guardians.md](./05-guardians.md) |
| Obelisk | Obélisque (Obelisk) | — | [05-guardians.md](./05-guardians.md) |
| Guardian Logs | Guardian Logs (décryptés par Ram Tah) | — | [05-guardians.md](./05-guardians.md) |
| Construct | Construct (IA responsable de l'extinction Guardian) | — | [05-guardians.md](./05-guardians.md) |

### Thargoïdes et combat anti-Thargoïde (AX)

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Thargoid | Thargoïde (Thargoid) | Xeno | [25-combat-ax.md](./25-combat-ax.md) |
| Scout (thargoïde) | Scout | — | [25-combat-ax.md](./25-combat-ax.md) |
| Interceptor | Interceptor | — | [25-combat-ax.md](./25-combat-ax.md) |
| Titan (Maelstrom) | Titan (Maelstrom) | — | [25-combat-ax.md](./25-combat-ax.md) |
| Barnacle | Barnacle | — | [25-combat-ax.md](./25-combat-ax.md) |
| Meta-Alloy | Meta-Alloy | — | [25-combat-ax.md](./25-combat-ax.md) |
| Thargoid Spire Site | Thargoid Spire Site, désactivé depuis la fin de la guerre | Spire | [25-combat-ax.md](./25-combat-ax.md) |
| Non-Human Signal Source | NHSS | NHSS | [25-combat-ax.md](./25-combat-ax.md) |
| AX Conflict Zone | zone de conflit anti-Thargoïde (AXCZ) | AXCZ | [25-combat-ax.md](./25-combat-ax.md) |
| AEGIS | AEGIS (coalition inter-puissances anti-Thargoïde) | — | [25-combat-ax.md](./25-combat-ax.md) |
| Caustic (dégâts/nuage) | caustique | — | [25-combat-ax.md](./25-combat-ax.md) |

### Jeu à plusieurs (Wings, Multicrew, CQC, Squadrons)

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Wing | Wing (escadre) | — | [23-jeu-en-groupe.md](./23-jeu-en-groupe.md) |
| Multicrew | Multicrew | — | [23-jeu-en-groupe.md](./23-jeu-en-groupe.md) |
| CQC | CQC (Close Quarters Combat) | — | [23-jeu-en-groupe.md](./23-jeu-en-groupe.md) |
| Squadron | Escadron (Squadron) | — | [22-squadrons.md](./22-squadrons.md) |
| Squadron Carrier | Squadron Carrier | — | [22-squadrons.md](./22-squadrons.md) |
| Squadron Bank | Squadron Bank | — | [22-squadrons.md](./22-squadrons.md) |
| Squadron Browser | Squadron Browser | — | [22-squadrons.md](./22-squadrons.md) |
| Squadron Leaderboards | Leaderboards (Squadron) | — | [22-squadrons.md](./22-squadrons.md) |
| Fuel Rats | Fuel Rats (secours bénévole en carburant) | — | [23-jeu-en-groupe.md](./23-jeu-en-groupe.md) |
| Hull Seals | Hull Seals (secours bénévole en réparation) | — | [23-jeu-en-groupe.md](./23-jeu-en-groupe.md) |
| DSSA | DSSA (Deep Space Support Array) | — | [23-jeu-en-groupe.md](./23-jeu-en-groupe.md) |

### Équipement et combat à pied (Odyssey)

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Flight Suit | Flight Suit (combinaison de départ, sans spécialisation) | — | [07-equipement-a-pied.md](./07-equipement-a-pied.md) |
| Artemis (Bio Suit) | Artemis (« Bio Suit »), exobiologie | — | [07-equipement-a-pied.md](./07-equipement-a-pied.md) |
| Maverick | Maverick (combinaison polyvalente) | — | [07-equipement-a-pied.md](./07-equipement-a-pied.md) |
| Dominator | Dominator (combinaison de combat) | — | [07-equipement-a-pied.md](./07-equipement-a-pied.md) |
| Arc Cutter | Arc Cutter (découpeur plasma intégré à la Maverick) | — | [07-equipement-a-pied.md](./07-equipement-a-pied.md) |
| E-Breach | E-Breach (outil de forçage d'accès, et non « E-Break ») | — | [07-equipement-a-pied.md](./07-equipement-a-pied.md) |
| Frag Grenade / Shield Disruptor / Shield Projector | les trois grenades du jeu (fragmentation, anti-bouclier, bulle de bouclier) | « EMP Grenade » (nom erroné communautaire du Shield Disruptor) | [07-equipement-a-pied.md](./07-equipement-a-pied.md) |
| Backpack | sac à dos (perdu à la mort) | — | [07-equipement-a-pied.md](./07-equipement-a-pied.md) |
| Ship Locker | casier du vaisseau (Ship Locker, conservé à la mort) | — | [07-equipement-a-pied.md](./07-equipement-a-pied.md) |
| On-foot Engineer | Engineer à pied | — | [26-ingenierie-a-pied-avancee.md](./26-ingenierie-a-pied-avancee.md) |
| Assets | Assets, seule monnaie de troc échangeable au bartender | — | [26-ingenierie-a-pied-avancee.md](./26-ingenierie-a-pied-avancee.md) |
| Manufacturing Instructions | Manufacturing Instructions, goulot d'étranglement de la progression à pied | — | [26-ingenierie-a-pied-avancee.md](./26-ingenierie-a-pied-avancee.md) |

### Mode Operations, Rhino et Nomad

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Operations (mode multijoueur) | mode Operations | — | [13-operations.md](./13-operations.md) |
| Operation Runner | Operation Runner (vaisseau de déploiement/extraction) | — | [13-operations.md](./13-operations.md) |
| Nomad | Nomad, premier « ship-launched vessel » du jeu | SLV | [14-rhino.md](./14-rhino.md) |
| Rhino | Rhino, SRV minier six roues (Vodel) | — | [14-rhino.md](./14-rhino.md) |
| Ship-Launched Vessel | véhicule lancé depuis un vaisseau (Ship-Launched Vessel) | SLV | [14-rhino.md](./14-rhino.md) |
| Mk II Biological Scanner | Mk II Biological Scanner (embarqué sur le Nomad) | — | [14-rhino.md](./14-rhino.md) |
| Planetary Vehicle Hangar | baie de véhicule (Planetary Vehicle Hangar) | — | [31-pilotage-navigation-et-stations.md](./31-pilotage-navigation-et-stations.md) |

### Rangs, réputation et progression

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Combat Rank | rang de combat (Harmless → Elite) | — | [08-combat-spatial.md](./08-combat-spatial.md) |
| Exploration Rank | rang d'exploration (Explorateur) | — | [10-exploration.md](./10-exploration.md) |
| Exobiologist Rank | rang d'exobiologie (Exobiologiste) | — | [10-exploration.md](./10-exploration.md) |
| Mercenary Rank | rang Mercenaire (combat à pied) | — | [29-missions-reputation-et-rangs.md](./29-missions-reputation-et-rangs.md) |
| Federal Navy Rank / Imperial Navy Rank | rang de la Federal Navy et de l'Imperial Navy (quinze paliers chacune) | — | [29-missions-reputation-et-rangs.md](./29-missions-reputation-et-rangs.md) |
| Faction reputation (Hostile→Allied) | réputation de faction, six paliers | — | [29-missions-reputation-et-rangs.md](./29-missions-reputation-et-rangs.md) |

### Lore, institutions et géographie

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| The Bubble | la Bulle (The Bubble) | Bulle | [32-geographie-galactique.md](./32-geographie-galactique.md) |
| Colonia | Colonia | — | [32-geographie-galactique.md](./32-geographie-galactique.md) |
| Shinrarta Dezhra | Shinrarta Dezhra (système à accès restreint) | — | [01-lore.md](./01-lore.md) |
| Sagittarius A* | Sagittarius A* | Sag A* | [32-geographie-galactique.md](./32-geographie-galactique.md) |
| Beagle Point | Beagle Point | — | [32-geographie-galactique.md](./32-geographie-galactique.md) |
| Pilots Federation | Pilots Federation | — | [01-lore.md](./01-lore.md) |
| GalNet | GalNet | — | [01-lore.md](./01-lore.md) |
| Raxxla | Raxxla (mystère non résolu) | — | [01-lore.md](./01-lore.md) |
| Stellar Forge | Stellar Forge (génération procédurale des secteurs) | — | [32-geographie-galactique.md](./32-geographie-galactique.md) |
| Federation | Fédération | — | [01-lore.md](./01-lore.md) |
| Empire (of Achenar) | Empire d'Achenar | — | [01-lore.md](./01-lore.md) |

### Outils et sources de données communautaires

| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |
|---|---|---|---|
| Elite Dangerous Data Network | Elite Dangerous Data Network (EDDN) | EDDN | [16-outils.md](./16-outils.md) |
| Companion API | Frontier Companion API (CAPI) | CAPI | [17-sources-donnees.md](./17-sources-donnees.md) |
| E:D Market Connector | E:D Market Connector (EDMC) | EDMC | [16-outils.md](./16-outils.md) |
| Elite Dangerous Star Map | Elite Dangerous Star Map (EDSM) | EDSM | [16-outils.md](./16-outils.md) |
| Inara | Inara | — | [16-outils.md](./16-outils.md) |
| Spansh | Spansh | — | [16-outils.md](./16-outils.md) |
| Coriolis / EDSY | constructeurs de vaisseau tiers (Coriolis, EDSY) | — | [16-outils.md](./16-outils.md) |
| BGS-Tally | BGS-Tally | — | [16-outils.md](./16-outils.md) |
| Player Journal | journal du joueur (Player Journal) | — | [17-sources-donnees.md](./17-sources-donnees.md) |

## Voir aussi

- [Glossaire](./00-glossaire.md) — définitions complètes des sigles et entités que ce lexique se contente
  d'aligner avec leur terme anglais ; les deux documents sont complémentaires, celui-ci n'explique pas ce que fait un
  terme, il dit seulement comment le corpus le nomme et où le trouver.
- [Méthodologie de sourcing et gouvernance du corpus](./00-methodologie-sourcing.md) — hiérarchie de sources et
  échelle de confiance appliquées à l'ensemble du corpus, dont ce lexique.
- [Liste complète des équipements](./04-equipements.md) — le guide le plus cité de ce lexique (modules standards,
  internes et armement), qui porte le référentiel chiffré des modules et des armes.
- [Guide complet du combat spatial](./08-combat-spatial.md) — mécaniques de vol et de combat (wake, mass lock,
  interdiction, notoriety) reprises dans ce lexique.
- [Pilotage, navigation, stations et carburant](./31-pilotage-navigation-et-stations.md) — vocabulaire de
  l'accostage et des services de station.

## Sources

- Corpus interne : ce lexique n'introduit aucune information nouvelle sur le jeu — chaque ligne a été établie par
  relecture directe du guide cité en dernière colonne (recherche du terme anglais dans le fichier, vérification de
  la forme française employée) plutôt que par mémoire ou déduction. Les guides consultés pour cette vérification
  couvrent l'intégralité des 32 guides thématiques et du [glossaire](./00-glossaire.md), avec une attention
  particulière à [04-equipements.md](./04-equipements.md), [06-ingenieurs.md](./06-ingenieurs.md),
  [08-combat-spatial.md](./08-combat-spatial.md), [07-equipement-a-pied.md](./07-equipement-a-pied.md),
  [10-exploration.md](./10-exploration.md), [20-minage.md](./20-minage.md),
  [25-combat-ax.md](./25-combat-ax.md), [29-missions-reputation-et-rangs.md](./29-missions-reputation-et-rangs.md)
  et [31-pilotage-navigation-et-stations.md](./31-pilotage-navigation-et-stations.md), consultés le 13 septembre 2026.
- Un cas explicite d'absence : **Passenger Lounge**, terme cherché par les joueurs anglophones, n'est nommé sous
  cette forme par aucun guide du corpus à la date de vérification ; la ligne correspondante le signale au lieu
  d'inventer un guide de référence qui n'existe pas.
