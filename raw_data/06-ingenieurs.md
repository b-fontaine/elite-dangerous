---
id: 06-ingenieurs
titre: "Guide complet des Ingénieurs (Engineers) dans Elite Dangerous"
domaine: vaisseaux-equipement
entites: [Ingénieur, Felicity Farseer, Elvira Martuuk, Mel Brandon, Petra Olmanova, Selene Jean, Marsha Hicks,
  Tod « The Blaster » McQuinn, Blueprint, Technology Broker, Merc Coin, MercGear, Material Trader,
  High Grade Emission, Frame Shift Wake Scanner, Effet expérimental, Mass Manager, Deep Charge, Dav's Hope,
  Meta-Alloys, Bulkheads, Hull Reinforcement Package, Shield Booster, Power Distributor]
mots_cles_en: [engineers, blueprints, engineering materials, raw materials, manufactured materials, encoded data,
  high grade emission, material trader, technology broker, increased range, mass manager, experimental effects,
  merc coin, wake scanner, blueprint grades, engineer max grade, dirty drives, clean drives, drive strengthening,
  faster boot sequence, shielded fsd, overcharged power plant, armoured power plant, low emissions power plant,
  charge enhanced, engine focused, system focused, weapon focused, high charge capacity, reinforced shield generator,
  enhanced low power, kinetic resistant, thermal resistant, heavy duty shield booster, resistance augmented,
  heavy duty hull reinforcement, lightweight sensors, long range sensors, overcharged weapon, efficient weapon,
  long range weapon, rapid fire, sturdy, corrosive shell, thermal vent, double braced, stripped down,
  experimental effect compatibility]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-12
confiance_globale: haute
volatilite: moyenne
sources_primaires:
  - "EDCD/coriolis-data — modifications/blueprints.json, modifications/modules.json, modifications/specials.json et
    modifications/modifications.json, commit 0db9234b5b9ce8c939ea84133d7ce336eea88e27"
  - "EDCD/FDevIDs — material.csv et engineers.csv, commit c35612952dd6a547d1a7ac4cffab9c7051e86579"
  - "EDCD/EDDI — Blueprint.cs, BlueprintTemplate.cs, Engineer.cs"
  - "Steam News Frontier (appid 359320) — annonces officielles 2026"
  - "Wiki communautaire Elite Dangerous — fiches modules et Ingénieurs, consultées le 9 septembre 2026"
  - "EDEngineer (msarilar) — plafonds de stockage par grade"
  - "Catalogues internes consolidés, édition 2026-08, et étude interne du 19 août 2026"
zones_incertaines:
  - "Aucune source ne chiffre la montée en réputation chez un Ingénieur : ni les points par module fabriqué, ni les seuils des rangs 1 à 5."
  - "La nature exacte des matériaux rendus par une Operation (catégorie, grade, quantité par scénario) n'est pas chiffrée par les notes officielles."
  - "Taux de rendement comparé des types d'USS de données et probabilité d'obtenir un grade donné sur un data point précis."
  - "Les 13 Ingénieurs Odyssey n'apparaissent dans aucun des deux jeux de données de blueprints : la matrice
    Blueprint × Ingénieur × grade ne couvre que les 25 Ingénieurs classiques."
  - "specials.json ne porte aucune valeur numérique pour les effets expérimentaux, et n'associe aucun effet à un
    Ingénieur : ces deux informations restent non couvertes par les sources reproductibles."
  - "Attributs du FSD SCO : le mappage module→blueprints d'EDSY porte un commentaire « TODO verify » et Coriolis n'a aucune donnée SCO."
  - "Paliers de montée en grade des trois combinaisons Odyssey : montants issus du wiki Fandom seul, à confirmer en jeu."
  - "Répartition précise « quel ingénieur Odyssey modifie quelle combinaison ou arme », à vérifier en jeu ou sur Inara."
  - "Disponibilité actuelle des Rescue Megaships comme point de déblocage, liée à un contexte narratif ponctuel."
  - "Prix et stocks de Meta-Alloys : instantané de marché communautaire du 19 août 2026, volatil par nature."
  - "Conditions d'apparition des Crystalline Shards : le catalogue de matériaux et le catalogue
    d'exobiologie divergent sur quatre critères (classe de l'étoile primaire, température, distance à
    l'étoile, présence d'un Water Giant) ; aucune source consultable depuis ce chantier ne permet
    d'arbitrer."
guides_lies: [2, 5, 7, 10, 13, 20, 25, 26, 30]
---

# Guide complet des Ingénieurs (Engineers) dans Elite Dangerous

## En bref

L'**Engineering** (ingénierie) d'*Elite Dangerous*, lancé par la mise à jour **2.1 « The Engineers »**
(mai 2016), confie à **38 Ingénieurs** — 25 pour les modules de vaisseau, 13 Odyssey pour l'équipement à pied — des
**modifications (blueprints)** payées en **matériaux**, plus un **effet expérimental** par module. Accès par
invitation puis cinq rangs de réputation ; depuis l'**Update 18.08** (7 août 2024) les rolls sont **déterministes** :
à réputation 5, un grade N coûte N applications. Ce guide chiffre les **81 blueprints** de modules sur **387 couples
blueprint × grade** — matériaux, quantités, effet obtenu, puis coût total des **15 rolls** d'une montée G1 → G5 — et
publie la **matrice Blueprint × Ingénieur × grade maximum** (186 lignes, 25 Ingénieurs), qui dit qui monte quel plan
et jusqu'où. Les **66 effets expérimentaux** (91 recettes, variantes comprises) reçoivent matrice de compatibilité et coût en matériaux. Les
**115 matériaux** restent plafonnés de **300 unités (grade 1) à 100 (grade 5)** ; les
grades 4-5 manufacturés viennent des **High Grade Emissions**, dont le contenu suit l'**allégeance** de la faction.

## Vue d'ensemble du système Engineering (ingénierie des modules) dans Elite Dangerous

Le système **Engineering** (« Ingénierie ») a été introduit dans *Elite Dangerous* avec la mise à jour **2.1 « The
Engineers »**, sortie en **mai 2016** dans le cadre de la saison **Horizons**. Le principe reste inchangé depuis : des
PNJ spécialisés, les **Ingénieurs**, peuvent appliquer des **modifications (blueprints)** sur les modules d'un vaisseau
(et, depuis l'extension **Odyssey** de 2021, sur l'équipement individuel — combinaisons et armes de poing) en échange de
**matériaux** récoltés par le joueur. Chaque modification améliore certaines statistiques d'un module au prix de
contreparties (chauffe, masse, résistance du module modifié, etc.), et peut en plus recevoir un **effet expérimental**
qui ajoute une propriété supplémentaire, indépendante du grade de la modification.

Le système est distinct — mais complémentaire — des **Technology Brokers** (courtiers technologiques), qui débloquent
des modules Guardian ou liés aux Titans Thargoïdes contre des matériaux spécifiques, sans passer par la mécanique de
réputation propre aux Ingénieurs (voir la section dédiée plus bas).

> **Les caractéristiques de vaisseaux et de modules citées ailleurs dans ce corpus sont données en configuration
> stock** (modules non modifiés) ; l'ingénierie décrite dans ce guide peut les modifier significativement — c'est
> précisément tout l'objet du document.

## Liste complète des 38 Ingénieurs d'Elite Dangerous (25 classiques + 13 Odyssey)

Le jeu compte **38 Ingénieurs**, répertoriés dans la base de données de référence de la communauté EDCD (Elite Dangerous
Community Developers), utilisée par les principaux outils tiers (EDMC, EDDI, Inara, Coriolis) : **25 ingénieurs «
classiques »** (base du jeu et extension Horizons, 2015-2018) spécialisés dans les modules de vaisseau, et **13
ingénieurs Odyssey** (introduits en 2021) qui couvrent notamment l'équipement individuel.

### Les 25 Ingénieurs « classiques » — modules de vaisseau : système, base et spécialités

| Ingénieur                   | Système          | Base                  | Spécialités majeures                                                                                                             | Spécialités mineures                                                                                             | Grade maximum par spécialité (relevé Coriolis)                                                                                                                                                                                                                          |
|-----------------------------|------------------|-----------------------|----------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Didi Vatermann              | Leesti           | Vatermann LLC         | Amplificateurs de bouclier                                                                                                       | Générateurs de bouclier                                                                                          | G5 : Shield Booster ; G3 : Bi-Weave Shield Generator, Prismatic Shield Generator, Shield Generator                                                                                                                                                                      |
| Bill Turner                 | Alioth           | Turner Metallics Inc  | Accélérateurs à plasma, Capteurs, Scanners de surface                                                                            | Support de vie, Raffineries, AFMU, Récupérateurs de carburant, Scanners                                          | G5 : Cargo Scanner, Detailed Surface Scanner, Plasma Accelerator, Sensors ; G3 : AFMU, Frame Shift Wake Scanner, Fuel Scoop, Kill Warrant Scanner, Life Support, Refinery                                                                                               |
| Broo Tarquin                | Muang            | Broo's Legacy         | Lasers                                                                                                                           | —                                                                                                                | G5 : Beam Laser, Burst Laser, Pulse Laser                                                                                                                                                                                                                               |
| The Sarge                   | Beta-3 Tucani    | The Beach             | Contrôleurs de limpets, Canons                                                                                                   | Rail guns                                                                                                        | G5 : Cannon, Collector Limpet Controller, Fuel Transfer Limpet Controller, Hatch Breaker Limpet Controller, Prospector Limpet Controller ; G3 : Rail Gun                                                                                                                |
| Zacariah Nemo               | Yoru             | Nemo Cyber Party Base | Canons fragmentants                                                                                                              | Multi-canons, Accélérateurs à plasma                                                                             | G5 : Fragment Cannon ; G3 : Advanced Multi-Cannon, Multi-Cannon ; G2 : Plasma Accelerator                                                                                                                                                                               |
| Liz Ryder                   | Eurybia          | Demolition Unlimited  | Missiles, Torpilles                                                                                                              | Mines, Renforts de coque                                                                                         | G5 : Advanced Missile Rack, Seeker/Dumbfire Missile Rack, Torpedo Pylon ; G3 : Mine Launcher ; G1 : Bulkheads, Hull Reinforcement Package                                                                                                                               |
| Hera Tani                   | Kuwemaki         | The Jet's Hole        | Générateurs d'énergie, Scanners de surface                                                                                       | Capteurs, Distributeurs d'énergie                                                                                | G5 : Detailed Surface Scanner, Power Plant ; G3 : Cargo Scanner, Power Distributor, Sensors                                                                                                                                                                             |
| Felicity Farseer            | Deciat           | Farseer Inc           | FSD                                                                                                                              | Propulseurs, Capteurs, Scanners de surface, Amplificateurs de bouclier, Interdicteurs FSD, Générateurs d'énergie | G5 : Frame Shift Drive ; G3 : Cargo Scanner, Detailed Surface Scanner, Sensors, Thrusters ; G1 : Frame Shift Drive Interdictor, Power Plant, Shield Booster                                                                                                             |
| Ram Tah                     | Meene            | Phoenix Base          | ECM, Défense ponctuelle, Lance-leurres/Heat Sinks                                                                                | Contrôleurs de limpets                                                                                           | G5 : Caustic Sink Launcher, Chaff Launcher, Electronic Countermeasure, Heat Sink Launcher, Point Defence ; G4 : Collector Limpet Controller, Fuel Transfer Limpet Controller, Hatch Breaker Limpet Controller, Prospector Limpet Controller                             |
| Lei Cheung                  | Laksak           | Trader's Rest         | Générateurs de bouclier, Capteurs, Scanners de surface                                                                           | Amplificateurs de bouclier                                                                                       | G5 : Bi-Weave Shield Generator, Cargo Scanner, Detailed Surface Scanner, Prismatic Shield Generator, Sensors, Shield Generator ; G3 : Shield Booster                                                                                                                    |
| Petra Olmanova              | Asura            | Sanctuary             | Renforts de coque, Missiles, Lance-leurres/Heat Sinks, Défense ponctuelle                                                        | Mines, Torpilles, ECM, AFMU                                                                                      | G5 : AFMU, Bulkheads, Caustic Sink Launcher, Chaff Launcher, Electronic Countermeasure, Heat Sink Launcher, Hull Reinforcement Package, Mine Launcher, Point Defence, Seeker/Dumbfire Missile Rack, Torpedo Pylon                                                       |
| Colonel Bris Dekker         | Sol              | Dekker's Yard         | —                                                                                                                                | Interdicteurs FSD, FSD                                                                                           | G4 : Frame Shift Drive Interdictor ; G3 : Frame Shift Drive                                                                                                                                                                                                             |
| Marsha Hicks                | Tir              | The Watchtower        | Contrôleurs de limpets, Raffineries, Récupérateurs de carburant, Multi-canons, Canons fragmentants                               | Canons                                                                                                           | G5 : Advanced Multi-Cannon, Cannon, Collector Limpet Controller, Fragment Cannon, Fuel Scoop, Fuel Transfer Limpet Controller, Hatch Breaker Limpet Controller, Multi-Cannon, Prospector Limpet Controller, Refinery                                                    |
| Elvira Martuuk              | Khun             | Long Sight Base       | FSD, Propulseurs                                                                                                                 | Générateurs de bouclier, Batteries de bouclier                                                                   | G5 : Frame Shift Drive ; G3 : Bi-Weave Shield Generator, Prismatic Shield Generator, Shield Generator ; G2 : Thrusters ; G1 : Shield Cell Bank                                                                                                                          |
| The Dweller                 | Wyrd             | Black Hide            | Distributeurs d'énergie, Lasers                                                                                                  | —                                                                                                                | G5 : Power Distributor ; G4 : Pulse Laser ; G3 : Beam Laser, Burst Laser                                                                                                                                                                                                |
| Marco Qwent                 | Sirius           | Qwent Research Base   | —                                                                                                                                | Générateurs d'énergie, Distributeurs d'énergie                                                                   | G4 : Power Plant ; G3 : Power Distributor                                                                                                                                                                                                                               |
| Selene Jean                 | Kuk              | Prospector's Rest     | Armure, Renforts de coque                                                                                                        | —                                                                                                                | G5 : Bulkheads, Hull Reinforcement Package                                                                                                                                                                                                                              |
| Professor Palin             | Arque            | Abel Laboratory       | Propulseurs                                                                                                                      | FSD                                                                                                              | G5 : Thrusters ; G3 : Frame Shift Drive                                                                                                                                                                                                                                 |
| Lori Jameson                | Shinrarta Dezhra | Jameson Base          | Capteurs, Scanners de surface                                                                                                    | Raffineries, Récupérateurs de carburant, AFMU, Support de vie, Scanners, Batteries de bouclier                   | G5 : Cargo Scanner, Detailed Surface Scanner, Sensors ; G4 : AFMU, Fuel Scoop, Life Support, Refinery ; G3 : Frame Shift Wake Scanner, Kill Warrant Scanner, Shield Cell Bank                                                                                           |
| Juri Ishmaak                | Giryak           | Pater's Memorial      | Mines, Capteurs, Scanners de surface                                                                                             | Torpilles, Missiles, Scanners                                                                                    | G5 : Cargo Scanner, Detailed Surface Scanner, Mine Launcher, Sensors ; G3 : Advanced Missile Rack, Frame Shift Wake Scanner, Kill Warrant Scanner, Seeker/Dumbfire Missile Rack, Torpedo Pylon                                                                          |
| Tod « The Blaster » McQuinn | Wolf 397         | Trophy Camp           | Multi-canons, Rail guns                                                                                                          | Canons fragmentants, Canons                                                                                      | G5 : Advanced Multi-Cannon, Multi-Cannon, Rail Gun ; G3 : Fragment Cannon ; G2 : Cannon                                                                                                                                                                                 |
| Tiana Fortune               | Achenar          | Fortune's Loss        | Scanners, Contrôleurs de limpets, Capteurs                                                                                       | Interdicteurs FSD, Scanners de surface                                                                           | G5 : Cargo Scanner, Collector Limpet Controller, Frame Shift Wake Scanner, Fuel Transfer Limpet Controller, Hatch Breaker Limpet Controller, Kill Warrant Scanner, Prospector Limpet Controller, Sensors ; G3 : Detailed Surface Scanner, Frame Shift Drive Interdictor |
| Mel Brandon                 | Luchtaine        | The Brig              | FSD, Propulseurs, Générateurs de bouclier, Lasers, Interdicteurs FSD, Amplificateurs de bouclier                                 | Batteries de bouclier                                                                                            | G5 : Beam Laser, Bi-Weave Shield Generator, Burst Laser, Frame Shift Drive, Frame Shift Drive Interdictor, Prismatic Shield Generator, Pulse Laser, Shield Booster, Shield Generator, Thrusters ; G4 : Shield Cell Bank                                                 |
| Etienne Dorn                | Los              | Kraken's Retreat      | Accélérateurs à plasma, Capteurs, Scanners de surface, Support de vie, Générateurs d'énergie, Distributeurs d'énergie, Rail guns | Scanners                                                                                                         | G5 : Cargo Scanner, Detailed Surface Scanner, Frame Shift Wake Scanner, Kill Warrant Scanner, Life Support, Plasma Accelerator, Power Distributor, Power Plant, Rail Gun, Sensors                                                                                       |
| Chloe Sedesi                | Shenve           | Cinder Dock           | Propulseurs                                                                                                                      | FSD                                                                                                              | G5 : Thrusters ; G3 : Frame Shift Drive                                                                                                                                                                                                                                 |

*Systèmes, bases et spécialités vérifiés directement dans les fichiers de données `Engineer.cs` et `engineers.csv`
maintenus par EDCD (source primaire utilisée par EDDI, EDMC et Inara).*

*La colonne « Grade maximum par spécialité » est calculée module par module à partir de l'association
blueprint → grade → ingénieurs du fichier `modifications/modules.json` de Coriolis : pour chaque Ingénieur, elle
donne le grade le plus élevé qu'il atteint sur chaque module, tous blueprints confondus. Elle se lit « G5 : … ;
G4 : … », du plafond le plus haut au plus bas, et le détail plan par plan figure dans la matrice Blueprint ×
Ingénieur × grade maximum plus bas.
Deux relevés de nommage à signaler dans la source : « Felicty Farseer » y est une coquille pour Felicity Farseer, et
Tod McQuinn y est écrit avec des guillemets droits. Aucun des deux jeux de données ne couvre les 13 Ingénieurs
Odyssey. Source : EDCD/coriolis-data, `modifications/modules.json`, commit 0db9234b5b9c.*

### Les 13 Ingénieurs Odyssey — équipement individuel à pied : système et base

Ces 13 ingénieurs, ajoutés avec l'extension **Odyssey** (2021), interviennent sur les combinaisons et armes de poing
utilisées lors des sorties à pied. Leurs bases sont confirmées par la même source primaire ; la répartition précise «
quel ingénieur modifie quelle combinaison/arme » évolue avec les mises à jour d'équilibrage et se vérifie le plus
fiablement en jeu, dans l'onglet Ingénieurs, ou sur Inara. **Le détail complet des modifications qu'ils proposent (avec
coûts et matériaux) est traité dans [07 — Équipement à pied](./07-equipement-a-pied.md#lingénierie-à-pied-engineering-dodyssey--engineers-blueprints-et-modifications-irréversibles)
plutôt que répété ici** — voir la nouvelle section « Ingénierie de l'équipement Odyssey » plus bas pour l'articulation
entre les deux guides.

| Ingénieur       | Système   | Base                 |
|-----------------|-----------|----------------------|
| Jude Navarro    | Aurai     | Marshall's Drift     |
| Domino Green    | Orishis   | The Jackrabbit       |
| Hero Ferrari    | Siris     | Nevermore Terrace    |
| Kit Fowler      | Capoya    | The Last Call        |
| Wellington Beck | Jolapa    | Beck Facility        |
| Terra Velasquez | Shou Xing | Rascal's Choice      |
| Uma Laszlo      | Xuane     | Laszlo's Resolve     |
| Oden Geiger     | Candiaei  | Ankh's Promise       |
| Yarden Bond     | Bayan     | Salamander Bank      |
| Baltanos        | Deriso    | The Divine Apparatus |
| Eleanor Bresa   | Desy      | Bresa Modifications  |
| Rosa Dayette    | Kojeara   | Rosa's Shop          |
| Yi Shen         | Einheriar | Eidolon Hold         |

## Débloquer l'accès à un Ingénieur : invitation, rangs de réputation et courtiers technologiques

### Le mécanisme d'invitation chez un Ingénieur (rang, missions, matériau livré, recommandation)

Aucun Ingénieur n'est accessible directement : il faut d'abord recevoir une **invitation**, qui apparaît dans l'onglet «
Ingénieurs » du panneau de gauche du vaisseau. Les conditions qui déclenchent une invitation appartiennent à un petit
nombre de familles, stables depuis la refonte de 2016 :

- atteindre un certain **rang de réputation** avec une faction ou une **superpuissance** (Fédération, Empire, Alliance) ;
- atteindre un **rang de combat, de commerce ou d'exploration** donné ;
- compléter un nombre de **missions** pour une faction ou un type de contrat spécifique ;
- livrer une quantité précise d'un **matériau ou d'une marchandise** ;
- être **recommandé par un autre Ingénieur** déjà débloqué (beaucoup d'invitations s'obtiennent en visitant un premier
  Ingénieur, qui donne accès à un second).

Les seuils numériques exacts (rang requis, quantité à livrer, nom de la faction) varient selon l'Ingénieur et changent
parfois d'une mise à jour à l'autre. **Avant de partir en expédition pour un Ingénieur précis, vérifiez la condition
affichée en jeu dans l'onglet Ingénieurs**, ou consultez un outil communautaire à jour comme Inara — ce sont les sources
les plus fiables pour ces seuils.

#### Cas travaillé : débloquer Felicity Farseer (Deciat), porte d'entrée de l'ingénierie du FSD

Un cas concret vaut mieux qu'une généralité, et celui-ci est le plus fréquent puisque Farseer est la porte d'entrée de
l'ingénierie du FSD. **Deux conditions**, et deux seulement :

1. atteindre le rang d'exploration **Scout** — le 3ᵉ palier affiché, correspondant à la valeur `2` sur l'échelle 0-8 du
   journal de jeu ;
2. lui fournir **1 unité de Meta-Alloys**. Une seule. Et c'est une **marchandise**, pas un matériau : elle occupe une
   tonne de soute et **ne passe pas par un comptoir d'échange de matériaux**.

##### Où trouver le Meta-Alloy exigé par Felicity Farseer (instantané du 19 août 2026)

Le Meta-Alloy est une **marchandise**, et son marché est étroit. Instantané du **19 août 2026**, à partir de données
de marché communautaires — donc volatiles, à revérifier avant de partir :

- **Darnielle's Progress** (système **Maia**, avant-poste planétaire) : 246 598 Cr, **stock 5 t**. C'est la seule
  station classique fiable de l'instantané. **Maia Point** et **Moni's Hub** affichent un prix mais un **stock à 0** ;
  **Obsidian Orbital** n'affiche que de la demande — on y vend, on n'y achète pas.
- **Les Fleet Carriers sont la vraie source** : 58 porteurs avec du stock au moment du relevé, dont **un dans Deciat
  même** (indicatif V4F-L3N, 1 t à 9 729 Cr) — c'est-à-dire dans le système de Farseer. Mais les prix sont fixés par
  leur propriétaire et s'étalent d'environ **9 700 Cr à plus de 19 M Cr la tonne** : comparez avant d'acheter.
- **Ne cherchez plus dans les settlements Odyssey** : l'**Update 10, du 25 janvier 2022**, a corrigé le fait qu'ils
  exportaient des Meta-Alloys par erreur. Les guides qui envoient y faire un tour sont antérieurs à ce correctif.

##### Monter sa réputation chez Felicity Farseer, et ce qui n'est chiffré nulle part

Une fois l'invitation honorée, la montée des rangs 1 à 5 chez Farseer repose sur deux leviers documentés :
**fabriquer des modules** chez elle (l'effet le plus marqué) et **vendre des données d'exploration à sa station** —
Farseer Inc, et non ailleurs : la vente ne compte que si elle est faite sur place.

> **Ce qui n'est chiffré nulle part.** Aucune des sources consultées pour cette révision ne chiffre la montée en
> réputation auprès d'un Ingénieur : ni les points gagnés par module fabriqué, ni par mission, ni par crédit de
> données d'exploration vendues, ni les seuils des rangs 1 → 5. Tout chiffre de ce type rencontré ailleurs (« environ
> 24 M Cr de données au total » circule notamment) doit être traité comme une **estimation non sourcée**, pas comme une
> valeur du jeu.

*(Source : étude interne `docs/faisabilite-spansh-temps-reel-materiaux.md`, § 3.3, étude du 19 août 2026 ; les prix et
stocks cités y sont explicitement présentés comme un instantané de données de marché communautaires.)*

##### Powerplay et déblocage des Ingénieurs : aucune condition ne porte sur un rang de Power

> **Point d'audit.** Une confusion fréquente dans les guides communautaires
> consiste à citer un « rang de puissance (Powerplay) » parmi les conditions de déblocage. Vérification faite sur les
> fiches individuelles des 25 Ingénieurs « classiques » (source : wiki communautaire Elite Dangerous, pages
> individuelles de chaque Ingénieur, consultées le 9 septembre 2026) : **aucune des conditions de déblocage documentées
> ne porte sur un rang au sein d'une Power** (Powerplay, ex. Zachary Hudson, Edmund Mahon, Yuri Grom...). Les conditions
> réellement observées portent sur la réputation de faction locale (ex. Bill Turner ⇒ Alliés avec Alioth Independents),
> le rang de **superpuissance** (ex. Tiana Fortune ⇒ rang Empire « Squire »), ou le rang de carrière (ex. Felicity
> Farseer ⇒ rang Explorateur « Scout »). La confusion vient probablement du fait que « Power » (Powerplay) et «
> superpuissance » (Fédération/Empire/Alliance) sont deux systèmes de réputation distincts dans le jeu — voir
> [02 — Powerplay](./02-powerplay.md) pour le détail du premier.
>
> **Impact de Powerplay 2.0.** La refonte **Powerplay 2.0**, sortie le **31 octobre 2024** dans le cadre de l'extension
> *Ascendancy* (voir [02 — Powerplay, §3.4](./02-powerplay.md#34-le-lancement-de-powerplay-20-31-octobre-2024) pour le
> sourçage complet de cette date, qui est parfois confondue avec la mise à jour *Trailblazers* du 26 février 2025), a
> entièrement redéfini les rangs, mérites et récompenses des Powers. Dans la mesure où aucun déblocage d'Ingénieur
> n'était conditionné à un rang Powerplay avant cette refonte, **Powerplay 2.0 n'a pas d'impact direct sur les
> conditions de déblocage des Ingénieurs** décrites dans ce guide. Si vous repérez malgré tout, en jeu, une condition
> d'invitation formulée en référence à une Power, traitez-la comme prioritaire sur ce guide et signalez l'écart — elle
> serait alors un changement plus récent que notre dernière vérification.

### Progression de réputation chez un Ingénieur (rangs 1 à 5, grades de blueprint 1 à 5)

Une fois l'invitation acceptée, il faut se rendre physiquement à la base de l'Ingénieur pour débloquer le **rang 1**,
donnant accès à ses modifications de grade 1 à 3. La progression jusqu'au **rang 5** (déblocage des grades 4 et 5) se
fait ensuite en **offrant** à l'Ingénieur des matériaux ou marchandises qu'il apprécie particulièrement, via le bouton
dédié de l'interface — sans qu'il soit nécessaire de lui rendre visite à nouveau dans la plupart des cas.

### Les Technology Brokers : deux courtiers bien distincts (Guardian et Human)

Plusieurs modules très recherchés ne s'obtiennent **pas** via un Ingénieur classique mais via un **Technology Broker**
(courtier technologique), présent dans des stations dédiées d'espace habité humain (généralement des systèmes très
peuplés et bien sécurisés). Il s'agit d'un système parallèle à l'Engineering proprement dit, souvent confondu avec lui :
on y paie en **matériaux et marchandises remis en une seule fois** (pas d'installments), sans mécanique de réputation ni
de grade progressif.

Les Technology Brokers ont été introduits avec **Elite Dangerous: Beyond, Chapitre 1 (v3.0)**, le **27 février 2018**,
et ne sont accessibles qu'aux commandants possédant *Horizons*. Il en existe deux types, dont les catalogues sont
**totalement séparés** — un déblocage au comptoir Guardian ne débloque rien au comptoir Human et inversement. Un
troisième point de vente, plus ponctuel, existe aussi à bord de certains **Rescue Megaships** liés à l'arc narratif
Thargoïde (voir plus bas). *(Source : wiki communautaire Elite Dangerous, page « Technology Broker », consultée le 9
septembre 2026, qui cite elle-même l'annonce officielle Frontier du 18/01/2018.)*

#### Guardian Technology Broker — modules et chasseurs Guardian contre Blueprint Fragments

Le **Guardian Technology Broker** débloque des modules et vaisseaux dérivés de la technologie **Guardian**, contre
des matériaux Guardian et des
« Blueprint Fragments » récoltés sur les sites de ruines et structures Guardian (voir
[05 — Guardians](./05-guardians.md) pour la localisation des sites et le farming des matériaux — ce guide n'y revient
pas en détail pour éviter la duplication).

| Module/Vaisseau débloqué                                   | Grade* | Matériaux requis (extrait)                                                                                                                                 | Source d'obtention                          |
|------------------------------------------------------------|--------|------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------|
| Guardian Frame Shift Drive Booster                         | Unlock | 1 Guardian Module Blueprint Fragment, 21 Guardian Power Cell, 21 Guardian Technology Component, 24 Focus Crystals, 8 HN Shock Mount                        | Sites de ruines Guardian + loot manufacturé |
| Guardian Gauss Cannon (Fixed, classe 1 et 2)               | Unlock | 1 Guardian Weapon Blueprint Fragment + Guardian Power Conduit/Cell, Guardian Wreckage/Technology Component, Guardian Sentinel Weapon Parts                 | Sites de ruines Guardian                    |
| Guardian Plasma Charger (Fixed/Turreted, classes 1 à 3)    | Unlock | 1-2 Guardian Weapon Blueprint Fragment + matériaux Guardian + Chromium/Micro-Weave Cooling Hoses/Articulation Motors                                       | Sites de ruines Guardian                    |
| Guardian Shard Cannon (Fixed/Turreted, classes 1 à 3)      | Unlock | 1-2 Guardian Weapon Blueprint Fragment + matériaux Guardian + Carbon/Micro Controllers/Power Transfer Bus                                                  | Sites de ruines Guardian                    |
| Guardian Hull Reinforcement Package                        | Unlock | 1 Guardian Module Blueprint Fragment, Guardian Wreckage Components, Pattern Beta/Gamma Obelisk Data, Reinforced Mounting Plate                             | Sites de ruines + scan d'Obélisques         |
| Guardian Module Reinforcement Package                      | Unlock | 1 Guardian Module Blueprint Fragment, Guardian Wreckage Components, Pattern Epsilon Obelisk Data, Guardian Power Conduit                                   | Sites de ruines + scan d'Obélisques         |
| Guardian Shield Reinforcement Package                      | Unlock | 1 Guardian Module Blueprint Fragment, Guardian Power Cell, Guardian Technology Component, Pattern Delta Obelisk Data                                       | Sites de ruines + scan d'Obélisques         |
| Guardian Hybrid Power Distributor                          | Unlock | 1 Guardian Module Blueprint Fragment, Pattern Alpha Obelisk Data, Guardian Power Cell, Phase Alloys, Heatsink Interlink                                    | Sites de ruines + scan d'Obélisques         |
| Guardian Hybrid Power Plant                                | Unlock | 1 Guardian Module Blueprint Fragment, Guardian Power Conduit, Pattern Epsilon Obelisk Data, Heat Resistant Ceramics                                        | Sites de ruines + scan d'Obélisques         |
| XG7 Trident / XG8 Javelin / XG9 Lance (chasseurs Guardian) | Unlock | 1 Guardian Vessel Blueprint Fragment, Guardian Power Cell, Pattern Epsilon/Beta Obelisk Data, Guardian Technology Component/Wreckage/Sentinel Weapon Parts | Sites de ruines Guardian                    |
| Modified Gauss/Plasma/Shard Cannon (achats répétables)     | Achat  | Mêmes familles de matériaux Guardian que la version « Unlock », en quantités variables                                                                     | Sites de ruines Guardian                    |

*\*Les items « Unlock » se débloquent une fois pour devenir achetables à volonté en crédits en Outfitting ; les items
« Achat » ajoutent immédiatement un exemplaire en stockage local et doivent être repayés en matériaux à chaque
exemplaire supplémentaire.*

*Quantités exactes vérifiées sur le wiki communautaire Elite Dangerous (page « Technology Broker », section
« Guardian »), consultée le 9 septembre 2026 — à revérifier en jeu avant un trajet, les quantités exactes pouvant être
ajustées par un futur équilibrage.*

#### Human Technology Broker — armes anti-Thargoïdes et modules pré-modifiés

Le **Human Technology Broker** débloque des armes et modules d'origine humaine avancée (dont plusieurs armes
anti-Thargoïdes historiques et le module
**Meta Alloy Hull Reinforcement**), contre des matériaux manufacturés/encodés classiques et des matériaux Thargoïdes.

| Module/Arme débloqué(e)                                                                     | Grade* | Matériaux requis (extrait)                                                                                                       | Source d'obtention                                      |
|---------------------------------------------------------------------------------------------|--------|----------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|
| Corrosion Resistant Cargo Rack (classe 4)                                                   | Unlock | 16 Meta-Alloys, 26 Iron, 18 Chemical Manipulators, 22 Radiation Baffle, 12 Neofabric Insulation                                  | Meta-Alloys : sites Thargoïdes ; reste : loot classique |
| Enzyme Missile Rack (Fixed, classe 2)                                                       | Unlock | 15 Tungsten, 16 Thargoid Energy Cell, 18 Thargoid Organic Circuitry, 16 Molybdenum, 6 Radiation Baffle                           | Combat/sites Thargoïdes + loot classique                |
| Meta Alloy Hull Reinforcement                                                               | Unlock | 16 Meta-Alloys, 25 Focus Crystals, 22 Aberrant Shield Pattern Analysis, 20 Configurable Components, 12 Reinforced Mounting Plate | Sites Thargoïdes + loot/scan classique                  |
| Remote Release Flechette Launcher (Fixed/Turreted, classe 2)                                | Unlock | Rhenium, Iron, Molybdenum, Germanium + CMM Composite ou Articulation Motors                                                      | Loot classique                                          |
| Shock Cannon (Fixed/Gimballed/Turreted, classes 1 à 3)                                      | Unlock | Vanadium, Tungsten, Rhenium, Technetium + Power Converter/Ion Distributor/Power Transfer Bus                                     | Loot classique                                          |
| Engineered Detailed Surface Scanner V1 (pré-engineered)                                     | Achat  | Niobium, Mechanical Components, Germanium, Mechanical Scrap                                                                      | Loot classique                                          |
| **Engineered FSD V1** (classe 5, pré-engineered *Increased Range* + *Faster Boot Sequence*) | Achat  | 18 Datamined Wake Exceptions, 26 Tellurium, 26 Electrochemical Arrays, 28 Chemical Processors                                    | Wakes FSD + loot classique                              |
| Engineered Seeker Missile Rack V1 (pré-engineered)                                          | Achat  | Proto Radiolic Alloys, Conductive Ceramics, Hybrid Capacitors, Phosphorus, Osmium                                                | Loot classique                                          |
| Modified Mining Laser (Fixed, classe 1, pré-engineered)                                     | Achat  | Arsenic, Rhenium, Phosphorus, Osmium                                                                                             | Loot classique                                          |
| Thargoid Bobblehead (cosmétique, Livery)                                                    | Unlock | 10 Meta-Alloys, 1 Thargoid Heart                                                                                                 | Sites Thargoïdes                                        |

*\*Même distinction Unlock/Achat que pour le comptoir Guardian.*

L'item **Engineered FSD V1** mérite d'être noté : c'est un raccourci pour obtenir un FSD **déjà engineeré** en grade 5
Increased Range + Faster Boot Sequence sans passer par un Ingénieur — pratique tôt en partie, mais chaque exemplaire
supplémentaire redemande l'intégralité des matériaux, et toute modification ultérieure via un Ingénieur classique fait
perdre le second bonus gratuit.

*Quantités vérifiées sur le wiki communautaire Elite Dangerous (page « Technology Broker », section « Human »), et
recoupées avec les données brutes `blueprints.json`/`specials.json` de Coriolis pour l'Engineered FSD V1 — consulté le 9
septembre 2026.*

#### Cas particulier : les Rescue Megaships, troisième point de déblocage lié à l'arc Thargoïde

Pendant certaines phases de l'arc narratif de la guerre Thargoïde, des **Rescue Megaships** ont proposé un troisième
point de déblocage, avec un catalogue hybride reprenant certains items Human (Corrosion Resistant Cargo Rack, Meta Alloy
Hull Reinforcement) et des items propres à l'urgence Thargoïde (Caustic Sink Launcher, munitions AX améliorées Azimuth,
TG Pulse Neutraliser). Ce point de vente est lié à un contexte narratif ponctuel : **vérifiez sa disponibilité actuelle
en jeu plutôt que de planifier un trajet dessus** — voir [25 — Combat AX](./25-combat-ax.md) pour le contexte plus large
de l'équipement anti-Thargoïde.

### Le Merc Coin et le MercGear : une troisième voie, depuis Operations

Depuis la mise à jour **Operations**, sortie le **30 juin 2026**, il existe une troisième façon d'obtenir des
blueprints et des modules déjà modifiés, distincte à la fois des Ingénieurs et des Technology Brokers : le **Merc
Coin**. C'est une monnaie **gagnée en accomplissant des Operations**, avec un **bonus hebdomadaire** la première fois
que certaines activités sont réalisées ; elle **ne s'achète pas en ARX**. Elle sert à acquérir des **modules de
vaisseau** (armes, modules cœur, modules internes) et des **blueprints d'ingénierie**. Les récompenses d'une Operation
comprennent par ailleurs des **matériaux**, des crédits et — en mode Powerplay — des mérites : voir la section
« Où farmer efficacement les matériaux d'Engineering, type par type » plus bas pour la place de cette source dans le farming.

Le catalogue **MercGear** ouvert à la sortie de la mise à jour comptait **deux blueprints** et **treize modules
pré-modifiés** :

| Type                       | Article                                 | Ce que la modification apporte, et ce qu'elle coûte                                                                       |
|----------------------------|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| Blueprint                  | Thermal Plasma Conversion               | Convertit une part des dégâts en plasma sur lasers à impulsion, à rafale et continus ; consommation ↑                     |
| Blueprint                  | Scoop Rate Enhanced                     | Améliore le débit du récupérateur de carburant ; consommation ↑                                                           |
| Hardpoint pré-modifié      | Enduring Feedback Rail Gun              | Rechargement, chaleur, portée et réserve de munitions ↑ ; masse, consommation ↑, dégâts ↓ ; effet Feedback Cascade inclus |
| Hardpoint pré-modifié      | Far-Reaching Abrasion Blaster           | Vitesse de projectile et portée maximale ↑, consommation et charge thermique ↓ ; intégrité ↓                              |
| Hardpoint pré-modifié      | Double Screaming Fragment Cannon        | Munitions, chargeur, rafale ↑ et rechargement ↓ ; portée et cadence ↓, masse et consommation ↑                            |
| Hardpoint pré-modifié      | Long Range Mining Laser                 | Portée ↑, consommation et charge thermique ↓ ; intégrité et dégâts ↓                                                      |
| Hardpoint pré-modifié      | Rapid Phase Multi-Cannon                | Projectiles par tir, munitions, chargeur et cadence ↑ ; portée ↓, dispersion ↑                                            |
| Hardpoint pré-modifié      | Drag Seeker Missile Rack                | Munitions, chargeur et cadence ↑ ; masse et consommation ↑                                                                |
| Hardpoint pré-modifié      | Lightweight Thermal Seeker Missile Rack | Munitions, chargeur, cadence ↑ et masse/consommation ↓ ; intégrité ↓                                                      |
| Hardpoint pré-modifié      | Lockdown Seeker Missile Rack            | Munitions, chargeur, intégrité ↑ et charge thermique ↓ ; consommation et masse ↑, cadence et dégâts ↓                     |
| Module cœur pré-modifié    | Support Focused Power Distributor       | Capacité et recharge ENG/SYS ↑ ; recharge WEP ↓                                                                           |
| Module cœur pré-modifié    | Balanced Power Distributor              | Débit et charge ↑, consommation ↓ ; masse ↑, intégrité ↓                                                                  |
| Module interne pré-modifié | Extended Cargo Rack                     | Capacité de soute ↑                                                                                                       |
| Module interne pré-modifié | Long Range Detailed Surface Scanner     | Rayon de sonde ↑ ; masse et consommation ↑                                                                                |
| Module interne pré-modifié | Heavy Duty Module Reinforcement Package | Protection des modules ↑ ; masse ↑                                                                                        |

Deux points d'articulation avec le reste de ce guide. D'abord, un **MercGear reste modifiable par un Ingénieur
classique** après achat : c'est un module ordinaire, pas un objet clos — la mise à jour du 2 septembre 2026 corrige
d'ailleurs deux défauts en ce sens, un MercGear qui n'était pas modifiable immédiatement après l'achat, et un *Seeker
Missile Rack* MercGear que **Petra Olmanova** refusait de prendre en charge. Ensuite, le *Long Range Detailed Surface
Scanner* recouvre exactement le terrain du blueprint *Expanded Probe Scanning Radius* chiffré plus bas : c'est un
raccourci payé en Merc Coin plutôt qu'en matériaux, à comparer à la fiche correspondante avant de choisir.

*(Sources : annonces officielles Frontier relayées par le flux Steam News d'Elite Dangerous — « An Update on
Operations », 22 avril 2026 14:02 UTC, pour la nature du Merc Coin et les récompenses d'Operation ; « Operations
Update », 1ᵉʳ juillet 2026 14:01 UTC, pour le catalogue MercGear et les contreparties de chaque article ; « Rhino SRV
Update », 2 septembre 2026 11:20 UTC, pour les deux correctifs de modifiabilité.)*

## Les matériaux d'Engineering (Raw, Manufactured, Encoded)

Les données ci-dessous sont extraites directement du fichier `material.csv` maintenu par EDCD (la base de référence
utilisée par EDMC, EDDI et Inara pour identifier les matériaux), ce qui garantit une répartition par grade exacte.
Elles sont complétées, depuis cette révision, par un **référentiel de matériaux consolidé** (édition 2026-08) qui
reprend cette même table d'identifiants et lui ajoute ce qui manquait le plus ici : les **sources d'obtention et leurs
conditions d'apparition**, catégorie par catégorie. Le référentiel complet des 115 matériaux et les sources par
catégorie sont donnés plus bas, après les tableaux de familles ; son sourçage est détaillé en fin de section.

### Plafonds de stockage des matériaux d'Engineering (300 unités au grade 1, 100 au grade 5)

Chaque matériau a une **capacité de stockage maximale**, qui dépend uniquement de son grade (1 à 5) — et ce, de façon
identique pour les trois catégories (Raw, Manufactured, Encoded).

| Grade | Plafond de stockage (par matériau) | Rareté en jeu |
|-------|------------------------------------|---------------|
| 1     | 300 unités                         | Très commun   |
| 2     | 250 unités                         | Commun        |
| 3     | 200 unités                         | Standard      |
| 4     | 150 unités                         | Rare          |
| 5     | 100 unités                         | Très rare     |

*Source : constantes `MaximumCapacity()` du projet open-source EDEngineer (`EDEngineer.Models/Utils/Extensions.cs`,
dépôt GitHub `msarilar/EDEngineer`), un des trackers de matériaux les plus utilisés par la communauté ; ces plafonds
n'ont pas varié depuis plusieurs années de mises à jour. À vérifier en jeu (panneau Inventaire → Matériaux) si vous
suspectez un changement récent. **Ces cinq valeurs sont confirmées à l'identique** par le référentiel consolidé de
l'édition 2026-08 (lui-même appuyé sur la table d'identifiants `material.csv` d'EDCD/FDevIDs), qui les reporte
matériau par matériau sur les 108 matériaux de vaisseau.*

> **Ce qui arrive au surplus a changé — correction de cette révision.** Les versions antérieures de ce guide indiquaient
> que « tout surplus collecté est perdu » une fois le plafond atteint. Ce n'est plus exact : **depuis le Dodec Update du
> 11 novembre 2025, l'excédent est automatiquement converti en crédits**, à raison de **2 000 Cr (G1), 4 000 Cr (G2),
> 8 000 Cr (G3), 16 000 Cr (G4) et 32 000 Cr (G5)** par unité au-delà du plafond. Plus rien n'est perdu — le plafond
> reste néanmoins la contrainte à gérer, puisque ces crédits ne remplacent pas les matériaux manquants ailleurs.
> *(Source : étude interne `docs/faisabilite-spansh-temps-reel-materiaux.md`, § 3.4, 19 août 2026, qui signale aussi
> que la « réserve de données de 500 unités » encore affichée par la page wiki* Encoded Materials *est un vestige
> d'avant décembre 2018.)*

Ces plafonds sont la raison d'être des **Material Traders** (voir plus bas) : sans eux, il serait impossible d'accumuler
plus de 100 unités d'un matériau de grade 5, ce qui rend l'échange interne à une catégorie indispensable pour préparer
plusieurs blueprints de haut grade d'affilée.

### Matériaux bruts (Raw) — 28 éléments, grades 1 à 4

Les 28 **matériaux bruts** (*Raw*) sont récoltés, **à trois exceptions près signalées dans la table**, par prospection
sur les surfaces planétaires sans atmosphère (Detailed Surface Scanner puis prospection au sol ou en véhicule).

| Grade | Matériaux                                                               | Source d'obtention                                                                             |
|-------|-------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| 1     | Iron, Nickel, Carbon, Sulphur, Phosphorus                               | Prospection de surface (planètes sans atmosphère), très commun                                 |
| 1     | **Rhenium, Lead**                                                       | **Minage d'astéroïdes uniquement** — n'apparaissent jamais au sol                              |
| 2     | Zinc, Manganese, Chromium, Vanadium, Germanium, Arsenic, Zirconium      | Prospection de surface, notamment corps à forte métallicité                                    |
| 3     | Tin, Cadmium, Tungsten, Molybdenum, Niobium, Mercury                    | Prospection de surface, corps géologiquement actifs (volcanisme)                               |
| 3     | **Boron**                                                               | **Minage d'astéroïdes uniquement** — n'apparaît jamais au sol                                  |
| 4     | Selenium, Yttrium, Tellurium, Polonium, Technetium, Ruthenium, Antimony | Prospection de surface ; sites à repérer au DSS — voir [10 — Exploration](./10-exploration.md) |

**Les trois exceptions comptent.** *Rhenium* (G1), *Lead* (G1) et *Boron* (G3) **ne s'obtiennent qu'en minage
d'astéroïdes** : inutile de les chercher au sol, ils n'y apparaissent jamais, quelle que soit la composition affichée
par le Detailed Surface Scanner. C'est la seule intersection entre les matériaux d'Engineering et le minage en anneau
décrit dans [20 — Minage](./20-minage.md) ; le point est repris plus bas dans « Où farmer efficacement les
matériaux d'Engineering, type par type ».

**Où chercher ces sites, et dans quel guide.** Le repérage d'un site de récolte se joue en deux temps, et aucun des
deux ne relève de ce guide-ci : d'abord choisir le système et le corps, ensuite, une fois sur place, lire les signaux
de surface. Les deux sont traités dans [10 — Exploration](./10-exploration.md), qui documente la planification de
route (EDSM, Spansh) puis le **Detailed Surface Scanner** et ce qu'une cartographie révèle en surface, sites de
*Crystalline Shards* compris. Ce guide-ci reste la référence sur **quel** matériau chercher, dans quelle
catégorie et pour quel blueprint.

### Matériaux manufacturés (Manufactured) — 50 matériaux « standards » + 14 matériaux spéciaux

Les 50 **matériaux manufacturés** (*Manufactured*) sont récupérés sur épaves, sources de signaux non identifiées, ou
en détruisant des vaisseaux. Organisés en 10 familles
thématiques, chacune déclinée sur 5 grades. **Source d'obtention principale, toutes familles confondues** : loot sur
épaves de vaisseaux détruits (RES notamment, voir [00 — Glossaire](./00-glossaire.md) pour ce sigle), scavenging de
champs de débris et de Nav Beacons compromis — voir « Où farmer efficacement les matériaux d'Engineering, type par
type » ci-dessous pour le détail
par méthode.

| Famille                 | Grade 1                | Grade 2                 | Grade 3                 | Grade 4                 | Grade 5                  |
|-------------------------|------------------------|-------------------------|-------------------------|-------------------------|--------------------------|
| Composites              | Compact Composites     | Filament Composites     | High Density Composites | Proprietary Composites  | Core Dynamics Composites |
| Alliages (Alloys)       | Salvaged Alloys        | Galvanising Alloys      | Phase Alloys            | Proto Light Alloys      | Proto Radiolic Alloys    |
| Thermique (alliages)    | Tempered Alloys        | Heat Resistant Ceramics | Precipitated Alloys     | Thermic Alloys          | Military Grade Alloys    |
| Conducteurs             | Basic Conductors       | Conductive Components   | Conductive Ceramics     | Conductive Polymers     | Biotech Conductors       |
| Condensateurs           | Grid Resistors         | Hybrid Capacitors       | Electrochemical Arrays  | Polymer Capacitors      | Military Supercapacitors |
| Boucliers               | Worn Shield Emitters   | Shield Emitters         | Shielding Sensors       | Compound Shielding      | Imperial Shielding       |
| Thermique (dissipation) | Heat Conduction Wiring | Heat Dispersion Plate   | Heat Exchangers         | Heat Vanes              | Proto Heat Radiators     |
| Mécanique               | Mechanical Scrap       | Mechanical Equipment    | Mechanical Components   | Configurable Components | Improvised Components    |
| Chimie                  | Chemical Storage Units | Chemical Processors     | Chemical Distillery     | Chemical Manipulators   | Pharmaceutical Isolators |
| Cristaux                | Crystal Shards         | Flawed Focus Crystals   | Focus Crystals          | Refined Focus Crystals  | Exquisite Focus Crystals |

Matériaux manufacturés **spéciaux** (liés aux Thargoïdes ou aux Guardians, hors des 10 familles ci-dessus) :

- **Thargoïdes** (source : combat AX, sites de crash, épaves de Titans — voir [25 — Combat AX](./25-combat-ax.md)) :
  Thargoid Carapace (G2), Wreckage Components (G3), Thargoid Energy Cell (G3), Bio-Mechanical Conduits (G3), Thargoid
  Technological Components (G4), Weapon Parts (G4), Thargoid Organic Circuitry (G5), Propulsion Elements (G5) ;
- **Guardian** (source : sites de ruines Guardian, voir [05 — Guardians](./05-guardians.md)) : Guardian Power Cell (G1),
  Guardian Sentinel Wreckage Components (G1), Guardian Power Conduit (G2), Guardian Technology Component (G3), Guardian
  Sentinel Weapon Parts (G3) ;
- **Autre** : Sensor Fragment (G5, provenant de sources de signal non-humaines).

### Données encodées (Encoded) — 30 données « standards » + 15 données spéciales

Les 30 **données encodées** (*Encoded*) sont récupérées en scannant balises de données, wakes de FSD ou émissions de
vaisseaux. Organisées en 6 familles sur 5 grades. **Source d'obtention principale, toutes familles confondues** :
piratage d'USS (Unidentified Signal Sources) de type données et de Nav Beacons, scan de wakes FSD et d'émissions de
vaisseaux — voir « Où farmer efficacement les matériaux d'Engineering, type par type » ci-dessous.

| Famille             | Grade 1                             | Grade 2                           | Grade 3                     | Grade 4                           | Grade 5                         |
|---------------------|-------------------------------------|-----------------------------------|-----------------------------|-----------------------------------|---------------------------------|
| Firmware            | Specialised Legacy Firmware         | Modified Consumer Firmware        | Cracked Industrial Firmware | Security Firmware Patch           | Modified Embedded Firmware      |
| Chiffrement         | Unusual Encrypted Files             | Tagged Encryption Codes           | Open Symmetric Keys         | Atypical Encryption Archives      | Adaptive Encryptors Capture     |
| Archives de scan    | Anomalous Bulk Scan Data            | Unidentified Scan Archives        | Classified Scan Databanks   | Divergent Scan Data               | Classified Scan Fragment        |
| Wakes FSD           | Atypical Disrupted Wake Echoes      | Anomalous FSD Telemetry           | Strange Wake Solutions      | Eccentric Hyperspace Trajectories | Datamined Wake Exceptions       |
| Émissions           | Exceptional Scrambled Emission Data | Irregular Emission Data           | Unexpected Emission Data    | Decoded Emission Data             | Abnormal Compact Emissions Data |
| Boucliers (données) | Distorted Shield Cycle Recordings   | Inconsistent Shield Soak Analysis | Untypical Shield Scans      | Aberrant Shield Pattern Analysis  | Peculiar Shield Frequency Data  |

Données encodées **spéciales** (Thargoïdes/Guardian) : Thargoid Structural Data (G2), Thargoid Ship Signature (G3),
Thargoid Material Composition Data (G3), Ship Flight Data (G3), Thargoid Wake Data (G4), Thargoid Residue Data (G4),
Ship Systems Data (G4), Pattern Alpha/Beta/Gamma/Delta/Epsilon Obelisk Data (G4, 5 variantes liées aux Obélisques
Guardian), Guardian Weapon Blueprint Segment (G4), Guardian Module Blueprint Segment (G4), Guardian Vessel Blueprint
Segment (G5).

### Référentiel des 115 matériaux d'ingénierie — 24 catégories, quatre tables

Le référentiel consolidé de l'édition 2026-08 recense **115 matériaux** répartis en **24 catégories** : 28 Raw, 50
Manufactured et 30 Encoded (soit les 108 matériaux de vaisseau échangeables, hors Guardian et Thargoïde qui ne le sont
pas), auxquels s'ajoutent les 7 composants de combinaison Odyssey. Il est découpé ci-dessous en **quatre tables, une
par type**, chacune triée **par catégorie puis par grade** : c'est l'ordre dans lequel un comptoir d'échange présente
les matériaux, donc celui qui permet de voir d'un coup d'œil ce qui est convertible en quoi. **Les noms sont ceux
affichés en jeu, en anglais** — ce sont ceux qu'emploient l'interface, les outils tiers et les recherches
communautaires ; les traduire ferait perdre la correspondance.

#### Table 1 — Matériaux bruts (Raw) : 28 matériaux, 7 groupes, grades 1 à 4

Les Raw s'arrêtent au **grade 4** : il n'existe aucun matériau brut de grade 5. Les catégories reprennent les **sept
groupes d'échange** du Raw Material Trader — quatre matériaux chacun, un par grade.

| Nom (affiché en jeu) | Type | Catégorie | Grade | Plafond |
|----------------------|------|-----------|-------|---------|
| Carbon               | raw  | Groupe 1  | 1     | 300     |
| Vanadium             | raw  | Groupe 1  | 2     | 250     |
| Niobium              | raw  | Groupe 1  | 3     | 200     |
| Yttrium              | raw  | Groupe 1  | 4     | 150     |
| Phosphorus           | raw  | Groupe 2  | 1     | 300     |
| Chromium             | raw  | Groupe 2  | 2     | 250     |
| Molybdenum           | raw  | Groupe 2  | 3     | 200     |
| Technetium           | raw  | Groupe 2  | 4     | 150     |
| Sulphur              | raw  | Groupe 3  | 1     | 300     |
| Manganese            | raw  | Groupe 3  | 2     | 250     |
| Cadmium              | raw  | Groupe 3  | 3     | 200     |
| Ruthenium            | raw  | Groupe 3  | 4     | 150     |
| Iron                 | raw  | Groupe 4  | 1     | 300     |
| Zinc                 | raw  | Groupe 4  | 2     | 250     |
| Tin                  | raw  | Groupe 4  | 3     | 200     |
| Selenium             | raw  | Groupe 4  | 4     | 150     |
| Nickel               | raw  | Groupe 5  | 1     | 300     |
| Germanium            | raw  | Groupe 5  | 2     | 250     |
| Tungsten             | raw  | Groupe 5  | 3     | 200     |
| Tellurium            | raw  | Groupe 5  | 4     | 150     |
| Rhenium              | raw  | Groupe 6  | 1     | 300     |
| Arsenic              | raw  | Groupe 6  | 2     | 250     |
| Mercury              | raw  | Groupe 6  | 3     | 200     |
| Polonium             | raw  | Groupe 6  | 4     | 150     |
| Lead                 | raw  | Groupe 7  | 1     | 300     |
| Zirconium            | raw  | Groupe 7  | 2     | 250     |
| Boron                | raw  | Groupe 7  | 3     | 200     |
| Antimony             | raw  | Groupe 7  | 4     | 150     |

#### Table 2 — Matériaux manufacturés (Manufactured) : 50 matériaux, 10 catégories, grades 1 à 5

Dix catégories de cinq grades. Les noms de catégorie ci-dessous sont ceux des intitulés d'échange affichés en jeu ; la
correspondance avec les « familles » francisées employées plus haut dans ce guide se lit dans la table croisée de la
section suivante.

| Nom (affiché en jeu)     | Type         | Catégorie             | Grade | Plafond |
|--------------------------|--------------|-----------------------|-------|---------|
| Salvaged Alloys          | manufactured | Alloys                | 1     | 300     |
| Galvanising Alloys       | manufactured | Alloys                | 2     | 250     |
| Phase Alloys             | manufactured | Alloys                | 3     | 200     |
| Proto Light Alloys       | manufactured | Alloys                | 4     | 150     |
| Proto Radiolic Alloys    | manufactured | Alloys                | 5     | 100     |
| Grid Resistors           | manufactured | Capacitors            | 1     | 300     |
| Hybrid Capacitors        | manufactured | Capacitors            | 2     | 250     |
| Electrochemical Arrays   | manufactured | Capacitors            | 3     | 200     |
| Polymer Capacitors       | manufactured | Capacitors            | 4     | 150     |
| Military Supercapacitors | manufactured | Capacitors            | 5     | 100     |
| Chemical Storage Units   | manufactured | Chemical              | 1     | 300     |
| Chemical Processors      | manufactured | Chemical              | 2     | 250     |
| Chemical Distillery      | manufactured | Chemical              | 3     | 200     |
| Chemical Manipulators    | manufactured | Chemical              | 4     | 150     |
| Pharmaceutical Isolators | manufactured | Chemical              | 5     | 100     |
| Compact Composites       | manufactured | Composite             | 1     | 300     |
| Filament Composites      | manufactured | Composite             | 2     | 250     |
| High Density Composites  | manufactured | Composite             | 3     | 200     |
| Proprietary Composites   | manufactured | Composite             | 4     | 150     |
| Core Dynamics Composites | manufactured | Composite             | 5     | 100     |
| Basic Conductors         | manufactured | Conductive            | 1     | 300     |
| Conductive Components    | manufactured | Conductive            | 2     | 250     |
| Conductive Ceramics      | manufactured | Conductive            | 3     | 200     |
| Conductive Polymers      | manufactured | Conductive            | 4     | 150     |
| Biotech Conductors       | manufactured | Conductive            | 5     | 100     |
| Crystal Shards           | manufactured | Crystals              | 1     | 300     |
| Flawed Focus Crystals    | manufactured | Crystals              | 2     | 250     |
| Focus Crystals           | manufactured | Crystals              | 3     | 200     |
| Refined Focus Crystals   | manufactured | Crystals              | 4     | 150     |
| Exquisite Focus Crystals | manufactured | Crystals              | 5     | 100     |
| Heat Conduction Wiring   | manufactured | Heat                  | 1     | 300     |
| Heat Dispersion Plate    | manufactured | Heat                  | 2     | 250     |
| Heat Exchangers          | manufactured | Heat                  | 3     | 200     |
| Heat Vanes               | manufactured | Heat                  | 4     | 150     |
| Proto Heat Radiators     | manufactured | Heat                  | 5     | 100     |
| Mechanical Scrap         | manufactured | Mechanical Components | 1     | 300     |
| Mechanical Equipment     | manufactured | Mechanical Components | 2     | 250     |
| Mechanical Components    | manufactured | Mechanical Components | 3     | 200     |
| Configurable Components  | manufactured | Mechanical Components | 4     | 150     |
| Improvised Components    | manufactured | Mechanical Components | 5     | 100     |
| Worn Shield Emitters     | manufactured | Shielding             | 1     | 300     |
| Shield Emitters          | manufactured | Shielding             | 2     | 250     |
| Shielding Sensors        | manufactured | Shielding             | 3     | 200     |
| Compound Shielding       | manufactured | Shielding             | 4     | 150     |
| Imperial Shielding       | manufactured | Shielding             | 5     | 100     |
| Tempered Alloys          | manufactured | Thermic               | 1     | 300     |
| Heat Resistant Ceramics  | manufactured | Thermic               | 2     | 250     |
| Precipitated Alloys      | manufactured | Thermic               | 3     | 200     |
| Thermic Alloys           | manufactured | Thermic               | 4     | 150     |
| Military Grade Alloys    | manufactured | Thermic               | 5     | 100     |

#### Table 3 — Données encodées (Encoded) : 30 matériaux, 6 catégories, grades 1 à 5

Six catégories de cinq grades. La catégorie **Wake Scans** est la seule dont la totalité des matériaux dépend d'un
module précis — voir la mise en garde de la section suivante.

| Nom (affiché en jeu)                | Type    | Catégorie        | Grade | Plafond |
|-------------------------------------|---------|------------------|-------|---------|
| Anomalous Bulk Scan Data            | encoded | Data Archives    | 1     | 300     |
| Unidentified Scan Archives          | encoded | Data Archives    | 2     | 250     |
| Classified Scan Databanks           | encoded | Data Archives    | 3     | 200     |
| Divergent Scan Data                 | encoded | Data Archives    | 4     | 150     |
| Classified Scan Fragment            | encoded | Data Archives    | 5     | 100     |
| Exceptional Scrambled Emission Data | encoded | Emission Data    | 1     | 300     |
| Irregular Emission Data             | encoded | Emission Data    | 2     | 250     |
| Unexpected Emission Data            | encoded | Emission Data    | 3     | 200     |
| Decoded Emission Data               | encoded | Emission Data    | 4     | 150     |
| Abnormal Compact Emissions Data     | encoded | Emission Data    | 5     | 100     |
| Specialised Legacy Firmware         | encoded | Encoded Firmware | 1     | 300     |
| Modified Consumer Firmware          | encoded | Encoded Firmware | 2     | 250     |
| Cracked Industrial Firmware         | encoded | Encoded Firmware | 3     | 200     |
| Security Firmware Patch             | encoded | Encoded Firmware | 4     | 150     |
| Modified Embedded Firmware          | encoded | Encoded Firmware | 5     | 100     |
| Unusual Encrypted Files             | encoded | Encryption Files | 1     | 300     |
| Tagged Encryption Codes             | encoded | Encryption Files | 2     | 250     |
| Open Symmetric Keys                 | encoded | Encryption Files | 3     | 200     |
| Atypical Encryption Archives        | encoded | Encryption Files | 4     | 150     |
| Adaptive Encryptors Capture         | encoded | Encryption Files | 5     | 100     |
| Distorted Shield Cycle Recordings   | encoded | Shield Data      | 1     | 300     |
| Inconsistent Shield Soak Analysis   | encoded | Shield Data      | 2     | 250     |
| Untypical Shield Scans              | encoded | Shield Data      | 3     | 200     |
| Aberrant Shield Pattern Analysis    | encoded | Shield Data      | 4     | 150     |
| Peculiar Shield Frequency Data      | encoded | Shield Data      | 5     | 100     |
| Atypical Disrupted Wake Echoes      | encoded | Wake Scans       | 1     | 300     |
| Anomalous FSD Telemetry             | encoded | Wake Scans       | 2     | 250     |
| Strange Wake Solutions              | encoded | Wake Scans       | 3     | 200     |
| Eccentric Hyperspace Trajectories   | encoded | Wake Scans       | 4     | 150     |
| Datamined Wake Exceptions           | encoded | Wake Scans       | 5     | 100     |

#### Table 4 — Composants de combinaison Odyssey : 7 entrées, hors système de grades

Ces sept entrées relèvent de l'économie Odyssey (à pied) et **n'ont ni grade ni plafond de stockage** au sens des
matériaux de vaisseau. Elles figurent ici pour compléter le référentiel ; leur emploi détaillé relève de
[07 — Équipement à pied](./07-equipement-a-pied.md) et de
[26 — Ingénierie à pied avancée](./26-ingenierie-a-pied-avancee.md).

| Nom (affiché en jeu)       | Type    | Catégorie                 | Grade | Plafond |
|----------------------------|---------|---------------------------|-------|---------|
| Aerogel                    | odyssey | Composants de combinaison | —     | —       |
| Carbon Fibre Plating       | odyssey | Composants de combinaison | —     | —       |
| Graphene                   | odyssey | Composants de combinaison | —     | —       |
| Health Monitor             | odyssey | Composants de combinaison | —     | —       |
| Manufacturing Instructions | odyssey | Composants de combinaison | —     | —       |
| Suit Schematic             | odyssey | Composants de combinaison | —     | —       |
| Titanium Plating           | odyssey | Composants de combinaison | —     | —       |

*Sourçage de ce référentiel : catalogue de matériaux consolidé `assets/data/materials.json`, édition 2026-08, qui
déclare pour sources amont la table d'identifiants `material.csv` d'EDCD/FDevIDs (catégorie et grade des matériaux de
vaisseau) et l'étude interne `docs/faisabilite-spansh-temps-reel-materiaux.md`, §§ 3.2, 3.4 et 3.5 (sources de
terrain).*

### Où s'obtiennent les matériaux d'Engineering, catégorie par catégorie

Le référentiel ne se contente pas de nommer les matériaux : il attache à **chacune des 24 catégories** une liste de
**sources d'obtention** — émission haut de gamme, récupération sur épave, mission, comptoir d'échange, data point,
scan de vaisseau, scan de sillage, prospection de surface, pillage de settlement, bartender — assortie d'un descriptif
et, souvent, de **conditions** d'apparition. C'est exactement la granularité que les révisions précédentes de ce guide
déclaraient ne pas avoir pu établir. Les sources étant identiques pour toutes les catégories d'un même type — à une
exception près, signalée —, elles sont présentées ici **par type**, puis complétées matériau par matériau.

#### Raw — prospection de surface et sept groupes d'échange

Les matériaux bruts (*Raw*) ont les mêmes sources déclarées pour les **sept groupes**, à l'identique :

- **Prospection de surface.** Prospection en SRV sur un corps atterrissable. Un outcrop rend 3 unités par morceau ;
  les dépôts volcaniques suivent une échelle de grade — Piceous Cobble (G1), Crystalline Fragments (G2-G3),
  Crystalline Cluster (G3-G4), Needle Crystals (G4, uniquement sur les sites Lava Spout).
  *Conditions :* Chaque corps atterrissable a une composition fixe de 11 matériaux — 5 G1, 3 G2, 2 G3, 1 G4 — révélée
  par le Detailed Surface Scanner. Aucun autre ne peut y apparaître, quel que soit le moment de la prospection. Un DSS
  à 90 % de couverture révèle les signaux géologiques de façon permanente, et ils deviennent des points d'atterrissage
  sélectionnables.
- **Comptoir d'échange.** Material trader Raw : 6 unités contre 1 du grade supérieur dans la même catégorie, 1 contre
  3 vers le grade inférieur.
  *Conditions :* Économies Refinery et Extraction, sécurité moyenne ou haute, gouvernement non-Anarchy. Ne déduisez
  pas le type du trader de l'économie : elle ne le détermine pas.

**Un troisième terrain, très rentable et très lointain : les sites de Crystalline Shards.** C'est la méthode haut de
gamme moderne pour récolter du Raw, mais ses conditions d'apparition sont strictes : étoile mère de classe **A, F, G,
K, M ou S** ; corps **entre 0 et 273 K**, **sans atmosphère**, **avec volcanisme** ; **à plus de 12 000 Ls** de
l'étoile ; et le système doit contenir au moins un monde Earth-Like, Ammonia, Water World, Water Giant ou une géante
gazeuse à vie. Le site le plus proche de Sol est à **1 426 ly** — ce n'est pas une sortie du week-end. **À ne pas
confondre avec le matériau manufacturé *Crystal Shards*** (grade 1, catégorie Crystals), qui n'a aucun rapport avec
ces sites : voir la mise en garde de la section Manufactured ci-dessous.

Le repérage de ces sites relève du guide d'exploration : [10 — Exploration](./10-exploration.md) couvre le DSS et ce
qu'une cartographie révèle en surface, et documente par ailleurs *Crystalline Shards* comme **espèce
d'exobiologie** scannable et revendable à Vista Genomics. **Les conditions d'apparition relevées de part et d'autre ne
coïncident pas exactement** : l'écart est détaillé dans la mise au point ci-dessous.

Composition des groupes — c'est à l'intérieur d'un groupe que l'échange est le moins coûteux :

| Catégorie | Grade 1    | Grade 2   | Grade 3    | Grade 4    |
|-----------|------------|-----------|------------|------------|
| Groupe 1  | Carbon     | Vanadium  | Niobium    | Yttrium    |
| Groupe 2  | Phosphorus | Chromium  | Molybdenum | Technetium |
| Groupe 3  | Sulphur    | Manganese | Cadmium    | Ruthenium  |
| Groupe 4  | Iron       | Zinc      | Tin        | Selenium   |
| Groupe 5  | Nickel     | Germanium | Tungsten   | Tellurium  |
| Groupe 6  | Rhenium    | Arsenic   | Mercury    | Polonium   |
| Groupe 7  | Lead       | Zirconium | Boron      | Antimony   |

Le référentiel précise en outre, matériau par matériau, **sur quel type de corps prospecter**, mesuré sur les cinquante
meilleurs corps de la galaxie pour chaque matériau :

- **Type de corps.** Présent à la surface de tout corps atterrissable : les cinq G1 de surface sont toujours Carbon,
  Iron, Nickel, Phosphorus et Sulphur.
  → Carbon (G1), Phosphorus (G1), Sulphur (G1), Iron (G1), Nickel (G1).
- **Type de corps.** Se prospecte surtout sur un Metal-rich body, parfois icy.
  → Vanadium (G2), Polonium (G4).
- **Type de corps.** Se prospecte surtout sur un Metal-rich body.
  → Niobium (G3), Yttrium (G4), Chromium (G2), Molybdenum (G3), Technetium (G4), Manganese (G2), Cadmium (G3),
  Ruthenium (G4), Zinc (G2), Tin (G3), Tungsten (G3), Mercury (G3), Zirconium (G2), Antimony (G4).
- **Type de corps.** Se prospecte surtout sur un Icy body.
  → Selenium (G4).
- **Type de corps.** Se prospecte surtout sur un Rocky body.
  → Germanium (G2), Tellurium (G4), Arsenic (G2).
- **Minage d'astéroïdes.** Ne s'obtient qu'en minage d'astéroïdes. Inutile de le chercher au sol : il n'y apparaît
  jamais.
  → Rhenium (G1), Lead (G1), Boron (G3).

#### Manufactured — High Grade Emissions, épaves, missions, comptoir

Les matériaux manufacturés (*Manufactured*) ont les mêmes sources déclarées pour les **dix catégories**,
à l'identique :

- **High Grade Emission (HGE).** La source des grades 4 et 5. Elles apparaissent en deep space — le plus vite en
  volant 200 Ls hors du plan orbital — et scanner le Nav Beacon du système peut en faire apparaître.
  *Conditions :* C'est l'allégeance qui domine, pas l'état de faction seul : une faction fédérale ou impériale ne rend
  jamais autre chose que ses composites ou son shielding. L'économie du système n'est pas un critère.
- **Récupération sur épave.** Épaves de vaisseau, signaux de détresse, conteneurs de cargo et destruction de
  vaisseaux, pour les grades 1 à 3.
- **Mission.** Récompense de mission. Depuis l'Update 18.08 (août 2024) les récompenses vont jusqu'à 24 unités.
- **Comptoir d'échange.** Material trader Manufactured.
  *Conditions :* Économies Extraction et Industrial.

Composition des catégories :

| Catégorie             | Grade 1                | Grade 2                 | Grade 3                 | Grade 4                 | Grade 5                  |
|-----------------------|------------------------|-------------------------|-------------------------|-------------------------|--------------------------|
| Alloys                | Salvaged Alloys        | Galvanising Alloys      | Phase Alloys            | Proto Light Alloys      | Proto Radiolic Alloys    |
| Capacitors            | Grid Resistors         | Hybrid Capacitors       | Electrochemical Arrays  | Polymer Capacitors      | Military Supercapacitors |
| Chemical              | Chemical Storage Units | Chemical Processors     | Chemical Distillery     | Chemical Manipulators   | Pharmaceutical Isolators |
| Composite             | Compact Composites     | Filament Composites     | High Density Composites | Proprietary Composites  | Core Dynamics Composites |
| Conductive            | Basic Conductors       | Conductive Components   | Conductive Ceramics     | Conductive Polymers     | Biotech Conductors       |
| Crystals              | Crystal Shards         | Flawed Focus Crystals   | Focus Crystals          | Refined Focus Crystals  | Exquisite Focus Crystals |
| Heat                  | Heat Conduction Wiring | Heat Dispersion Plate   | Heat Exchangers         | Heat Vanes              | Proto Heat Radiators     |
| Mechanical Components | Mechanical Scrap       | Mechanical Equipment    | Mechanical Components   | Configurable Components | Improvised Components    |
| Shielding             | Worn Shield Emitters   | Shield Emitters         | Shielding Sensors       | Compound Shielding      | Imperial Shielding       |
| Thermic               | Tempered Alloys        | Heat Resistant Ceramics | Precipitated Alloys     | Thermic Alloys          | Military Grade Alloys    |

##### Les dix matériaux manufacturés à condition d'apparition propre (allégeance et état de faction)

Dix des cinquante matériaux manufacturés portent en plus une **condition d'apparition qui leur est propre** ; c'est
cette table qui décide où chercher un grade 4 ou 5 précis, et elle vaut correction de l'heuristique
« High Tech + Boom » que répètent beaucoup de guides :

| Condition déclarée en High Grade Emission                 | Matériaux concernés                                                            |
|-----------------------------------------------------------|--------------------------------------------------------------------------------|
| Faction fédérale — et rien d'autre.                       | Proprietary Composites (G4), Core Dynamics Composites (G5)                     |
| Faction impériale — et rien d'autre.                      | Imperial Shielding (G5)                                                        |
| État Boom ou Expansion, faction ni fédérale ni impériale. | Proto Light Alloys (G4), Proto Radiolic Alloys (G5), Proto Heat Radiators (G5) |
| État Civil Unrest.                                        | Improvised Components (G5)                                                     |
| État Outbreak, population supérieure à un million.        | Pharmaceutical Isolators (G5)                                                  |
| État War ou Civil War.                                    | Military Supercapacitors (G5), Military Grade Alloys (G5)                      |

##### Ne pas confondre *Crystal Shards* (matériau manufacturé G1) et *Crystalline Shards* (site de matériaux bruts)

> **Ne confondez pas *Crystal Shards* et *Crystalline Shards*.** Ce sont deux choses sans rapport, et la confusion
> envoie chercher un matériau là où il n'apparaît jamais.
>
> - **Crystal Shards** est un **matériau manufacturé de grade 1**, celui qui ouvre la catégorie Crystals (devant
>   Flawed Focus Crystals, Focus Crystals, Refined Focus Crystals et Exquisite Focus Crystals). Il se récolte comme
>   tous les autres manufacturés, par les **quatre sources listées ci-dessus** — épaves et destruction de vaisseaux
>   pour les grades 1 à 3, missions, comptoir d'échange Manufactured — et **il n'a aucune condition d'apparition qui
>   lui soit propre**.
> - Les **Crystalline Shards** sont un **site de récolte de matériaux bruts (Raw)**, avec les conditions stellaires et
>   planétaires strictes détaillées dans la section Raw ci-dessus (classe stellaire A/F/G/K/M/S, 0 à 273 K, plus de
>   12 000 Ls, monde Earth-Like/Ammonia/Water World/Water Giant ou géante gazeuse à vie dans le système, le plus
>   proche à 1 426 ly de Sol).
>
> Autrement dit, ces conditions-là gouvernent l'apparition d'un **site à Raw**, jamais l'obtention du matériau
> manufacturé de grade 1. Aller à 1 426 ly pour ramener des *Crystal Shards* serait un très long voyage pour rien.

##### Les deux relevés de conditions des Crystalline Shards ne coïncident pas exactement

Le corpus porte **deux relevés indépendants** des conditions d'apparition des *Crystalline Shards* : celui du
**catalogue de matériaux** (`assets/data/materials.json`, édition 2026-08), repris dans la section Raw ci-dessus, et
celui du **catalogue d'exobiologie** compilé par ce corpus (édition 2026-08, sources amont déclarées : Canonn Research,
wiki *Elite Dangerous*, critères biologiques du projet SrvSurvey), repris par
[10 — Exploration](./10-exploration.md), où *Crystalline Shards* figure comme **espèce scannable et revendable à Vista
Genomics**. Les deux décrivent des conditions assez proches pour qu'il s'agisse très probablement du même objet en jeu,
**mais aucune des sources consultées ne l'affirme explicitement**. Confrontation des 8 critères comparables (relevé du
10 septembre 2026) : **4 divergences, 3 précisions apportées par le seul catalogue d'exobiologie, 1 accord**.

| Critère                      | Catalogue de matériaux (section Raw ci-dessus)                            | Catalogue d'exobiologie (repris par le guide 10)               | Nature de l'écart |
|------------------------------|---------------------------------------------------------------------------|----------------------------------------------------------------|-------------------|
| Classe de l'étoile primaire  | A, F, G, K, M **ou S**                                                    | A, F, G, K ou M                                                | divergence        |
| Température du corps         | 0 à 273 K                                                                 | 20 à 250 K                                                     | divergence        |
| Distance à l'étoile          | plus de 12 000 Ls de l'étoile                                             | plus de 10 000 ls de l'étoile d'arrivée                        | divergence        |
| Monde requis dans le système | Earth-Like, Ammonia, Water World, **Water Giant** ou géante gazeuse à vie | Earth-like, Water World, Ammonia World ou géante gazeuse à vie | divergence        |
| Volcanisme                   | exigé, sans autre précision                                               | volcanisme mineur obligatoire, 8 types listés                  | précision         |
| Type de corps                | non précisé                                                               | Icy, Rocky, Rocky Ice ou HMC                                   | précision         |
| Gravité                      | non précisée                                                              | ≤ 1,45 G sur HMC, 0,19 à 0,24 G sinon                          | précision         |
| Atmosphère                   | sans atmosphère                                                           | aucune                                                         | accord            |

**Ce guide n'arbitre pas ces 4 divergences** : les deux relevés viennent de sources distinctes, aucune n'est
vérifiable en jeu depuis ce chantier, et fabriquer une valeur de compromis serait pire que signaler le trou. Deux
conséquences pratiques, dont la seconde est **dérivée par recoupement des deux relevés, et non relevée en jeu** :

- si vous cherchez le **site de récolte Raw**, retenez le relevé de la section Raw ci-dessus, qui est celui du
  catalogue de matériaux ;
- un corps qui satisfait, ligne à ligne, **le plus strict des deux relevés** — corps Icy, Rocky, Rocky Ice ou HMC,
  gravité dans la fourchette du relevé d'exobiologie, étoile primaire A, F, G, K ou M, 20 à 250 K, sans atmosphère,
  avec volcanisme mineur, à plus de 12 000 Ls, dans un système comportant un Earth-like, un Water World, un Ammonia
  World ou une géante gazeuse à vie — satisfait **les deux** à la fois. C'est une intersection logique des deux
  tables, pas une condition observée en jeu.

#### Encoded — scan de vaisseaux, data points, comptoir, et le cas des Wake Scans

Les données encodées (*Encoded*) partagent leurs sources sur **cinq des six catégories** — Data Archives, Emission
Data, Encoded Firmware, Encryption Files et Shield Data :

- **Scan de vaisseau.** Automatique dès qu'un vaisseau est ciblé, en supercruise comme en sub-light.
- **Data point.** Private Data Beacons des Degraded et Encoded Emissions, satellites, Planetary Outposts scannés au
  Data Link Scanner du SRV — les Starports ne comptent pas — et missions de scan de surface, qui rendent souvent des
  données rares.
  *Conditions :* Les data points vont par sets de quatre, avec un timer de reset rechargé à chaque scan réussi ;
  compléter le set rend un Data Point Intel Package en crédits. Plus la sécurité du site est haute, plus les données
  sont rares — et les défenses fortes.
- **Comptoir d'échange.** Material trader Encoded.
  *Conditions :* Économies High Tech et Military. Gresley Dock (Nanomam) est un trader Encoded en économie
  Agriculture : la règle ne se déduit pas.

La sixième catégorie, **Wake Scans**, obéit à un régime entièrement différent :

- **Scan de sillage.** Frame Shift Wake Scanner braqué sur un sillage d'hyperespace (high energy wake). C'est la seule
  source des cinq Wake Scans : sans ce module, aucun ne s'obtient, quel que soit le temps passé à prospecter.
  *Conditions :* Utility mount classe 0, notes E à A, 13 544 à 1 097 095 Cr, portée 2 à 4 km, 10 s de scan. À assigner
  à un groupe de tir. Camper les sillages près d'une station fréquentée est la méthode.
- **Comptoir d'échange.** Le trader Encoded descend d'un grade à 1 pour 3 : une unité de Datamined Wake Exceptions
  (G5) rend 81 Atypical Disrupted Wake Echoes (G1). Récolter n'importe quel Wake Scan puis convertir est bien plus
  rapide que d'espérer le bon grade.
- **Scan de vaisseau.** Automatique dès qu'un vaisseau est ciblé, en supercruise comme en sub-light.

Composition des six catégories :

| Catégorie        | Grade 1                             | Grade 2                           | Grade 3                     | Grade 4                           | Grade 5                         |
|------------------|-------------------------------------|-----------------------------------|-----------------------------|-----------------------------------|---------------------------------|
| Data Archives    | Anomalous Bulk Scan Data            | Unidentified Scan Archives        | Classified Scan Databanks   | Divergent Scan Data               | Classified Scan Fragment        |
| Emission Data    | Exceptional Scrambled Emission Data | Irregular Emission Data           | Unexpected Emission Data    | Decoded Emission Data             | Abnormal Compact Emissions Data |
| Encoded Firmware | Specialised Legacy Firmware         | Modified Consumer Firmware        | Cracked Industrial Firmware | Security Firmware Patch           | Modified Embedded Firmware      |
| Encryption Files | Unusual Encrypted Files             | Tagged Encryption Codes           | Open Symmetric Keys         | Atypical Encryption Archives      | Adaptive Encryptors Capture     |
| Shield Data      | Distorted Shield Cycle Recordings   | Inconsistent Shield Soak Analysis | Untypical Shield Scans      | Aberrant Shield Pattern Analysis  | Peculiar Shield Frequency Data  |
| Wake Scans       | Atypical Disrupted Wake Echoes      | Anomalous FSD Telemetry           | Strange Wake Solutions      | Eccentric Hyperspace Trajectories | Datamined Wake Exceptions       |

#### Odyssey — les cinq composants de combinaison et leurs deux plaquages

Les composants de combinaison Odyssey (à pied) ont les sources déclarées suivantes pour la catégorie
**Composants de combinaison** :

- **Pillage de settlement.** Les settlements contrôlés par une faction Anarchy n'infligent aucune amende : c'est le
  terrain de farm à privilégier.
  *Conditions :* On peut s'octroyer une autorisation de sécurité de niveau 3 depuis un terminal du Command Centre — le
  niveau 2 suffit à éteindre les tourelles — et les gardes n'entrent pas dans un bâtiment dont ils n'ont pas le niveau
  d'accès. Rétablir le courant d'abord empêche les scavengers d'apparaître.
- **Mission.** Depuis le Type-8 Update (août 2024), les récompenses de mission couvrent les cinq composants de
  combinaison, avec des quantités trois à quatre fois supérieures à l'avant. Sélectionner ses missions par récompense
  est devenu plus efficace que piller.
- **Bartender.** Le bartender ne revend que les Assets. Il achète les Goods et les Data contre crédits mais n'en
  revend jamais : Suit Schematic, Health Monitor et Manufacturing Instructions s'obtiennent donc uniquement par
  pillage ou par mission.

Et, composant par composant :

- **Suit Schematic** — catégorie Odyssey *Good*, valeur 50 000 Cr.
  - *Settlements* : Settlements High Tech et Industrial, bâtiments CMD, PWR et STO. **Le plus cher des cinq composants
    de combinaison : ne jamais le vendre au bartender pendant une montée en grade.**
  - *Missions* : Récompense de mission.
- **Health Monitor** — catégorie Odyssey *Good*, valeur 10 000 Cr.
  - *Settlements* : Settlements Industrial, bâtiments IND, MED, RES, HAB et CMD, dans des Lockers.
  - *Épaves* : Seul des cinq composants attesté aussi sur épave de surface.
  - *Missions* : Récompense de mission.
- **Manufacturing Instructions** — catégorie Odyssey *Data*, valeur 9 000 Cr.
  - *Data ports* : uniquement des data ports — settlements Industrial et Extraction (Industrial, Laboratory,
    Satellite, Extraction Data Port), plus Irregular Markers et Impact Sites. Jusqu'à 3 par data port, et seulement
    dans les bâtiments de production industrielle. **Le vrai goulot d'étranglement : il entre dans 56 recettes, n'est ni
    achetable ni vendable, et Rosa Dayette en réclame 10 pour son referral vers Yi Shen. Les téléchargements interdits
    sont signalés en violet et déclenchent l'alarme.**
  - *Missions* : Récompense de mission.
- **Aerogel** — catégorie Odyssey *Asset*, valeur 500 Cr.
  - *Settlements* : Salles LAB et PROC — donc bâtiments RES, IND, EXT et AGRI — via Industrial Locker (S) et Research
    Locker (L).
  - *Bartender* : Achetable au bartender : coût 9, valeur de cession 5. **Céder un Graphene rapporte 13 et un Aerogel
    coûte 9 : échanger du Graphene contre de l'Aerogel est rentable, l'inverse coûteux.**
- **Graphene** — catégorie Odyssey *Asset*, valeur 1 300 Cr.
  - *Settlements* : Abondant dans les bâtiments Research ; aussi AGRI, HAB et SEC.
  - *Bartender* : Achetable au bartender : coût 23, valeur de cession 13.
- **Carbon Fibre Plating** — catégorie Odyssey *Asset*, valeur 500 Cr.
  - *Settlements* : Comme l'Aerogel, dont il tient la place dans la recette de la combinaison Maverick.
- **Titanium Plating** — catégorie Odyssey *Asset*, valeur 500 Cr.
  - *Settlements* : Comme l'Aerogel, dont il tient la place dans la recette de la combinaison Dominator.

### Deux sites de farm de matériaux à coordonnées vérifiées : Dav's Hope et Jameson Crash Site

Deux sites de récolte sont référencés avec leurs coordonnées, et l'un des deux corrige une erreur qui circule dans la
quasi-totalité des guides anciens. Les coordonnées sont données au format du jeu, avec un point décimal.

| Site               | Système                  | Corps | Latitude   | Longitude  | Ce qu'on y récolte                                |
|--------------------|--------------------------|-------|------------|------------|---------------------------------------------------|
| Dav's Hope         | Hyades Sector DR-V c2-23 | A 5   | 50.5426    | 137.4150   | Raw et Manufactured, en boucle au SRV             |
| Jameson Crash Site | HIP 12099                | 1 B   | -54.375358 | -50.353342 | Encoded G3, G4 et G5 sur environ neuf data points |

> **Attention aux coordonnées de Dav's Hope.** Les coordonnées de tous les vieux guides sont celles de *Legacy* (3.8),
> `44.8180, -31.3893`, et vous feront atterrir au mauvais endroit. Sur le client *Live* (4.x), il faut viser
> **`50.5426, 137.4150`** — point confirmé indépendamment par la position du landmark *Abandoned Base* remontée par
> les clients Live, à `50.532878, 137.436019`.

Pour le **Jameson Crash Site**, le landmark à viser est *Wrecked Ship* ; une **seconde épave**, *Crashed Ship*, se
trouve à `-55.431073, -49.255156` sur le même corps — deux épaves distinctes, à ne pas confondre quand on cible le
site aux data points encodés.

*Source : catalogue de matériaux consolidé `assets/data/materials.json`, tableau des sites, édition 2026-08, et étude
interne `docs/faisabilite-spansh-temps-reel-materiaux.md`, § 3.4 (étude du 19 août 2026).*

### Où farmer efficacement les matériaux d'Engineering, type par type

Ces méthodes correspondent à des mécaniques de jeu stables et largement documentées par la communauté depuis la
refonte 2.1 de 2016 ; les **emplacements précis** (systèmes, hotspots) évoluent en revanche avec la génération
procédurale et le [BGS](./00-glossaire.md) — vérifiez-les sur un outil communautaire tenu à jour avant de planifier un
trajet.

> **Note de méthode pour cette section.** Les recherches menées pour cette révision se sont heurtées à plusieurs
> indisponibilités : le wiki communautaire Elite Dangerous et Reddit n'ont pas pu être consultés au moment de la
> rédaction, et la page « Matériaux » d'Inara n'a pas pu être chargée non plus. Les points ci-dessous reposent donc sur
> la mécanique de jeu — stable et documentée depuis 2016 — recoupée avec les données EDCD déjà citées dans ce guide, et
> sur les outils effectivement consultés (EDTools.cc, EDSM.net, EDAstro.com, tous vérifiés le 9 septembre 2026). Un
> chiffre précis qui n'a pas pu être confirmé en direct (taux de spawn selon l'état économique d'un système, par
> exemple) est signalé comme tel plutôt que présenté comme acquis.
>
> **Mise à jour de cette révision.** Une partie de ce qui manquait alors est désormais couverte par le référentiel de
> matériaux consolidé (édition 2026-08) et par l'étude interne du 19 août 2026, qui documentent les sources et
> conditions d'apparition catégorie par catégorie — voir « Où s'obtiennent les matériaux
> d'Engineering, catégorie par catégorie » ci-dessus. Les points ci-dessous ont été corrigés en conséquence, et les
> mentions « non vérifié » ne subsistent que
> là où ces données ne disent effectivement rien.

#### Matériaux bruts (Raw) — la méthode la plus rapide et la plus prévisible

La prospection planétaire reste la voie de référence : **Detailed Surface Scanner** pour repérer les corps sans
atmosphère à forte métallicité ou géologiquement actifs (volcanisme), puis **Surface Prospector**/scanner de
composition en SRV (ou à pied depuis Odyssey) pour cartographier les gisements au sol et collecter à la main. **Point
souvent confondu avec le minage de commodities** : le minage d'astéroïdes classique en anneau (laser/core mining, voir
[20 — Minage](./20-minage.md)) vise d'abord des commodities vendables (Platinum, Painite, etc.), une catégorie
économique entièrement distincte des matériaux d'Engineering ; ne comptez donc pas sur une ceinture d'astéroïdes pour
constituer l'essentiel d'un stock Raw. **Correction de cette révision : il existe malgré tout trois exceptions.**
**Rhenium (G1), Lead (G1) et Boron (G3)** ne s'obtiennent **qu'en minage d'astéroïdes** — inutile de les chercher au
sol, ils n'y apparaissent jamais. Les versions antérieures de ce guide, qui écrivaient que le minage en anneau « ne
produit pas de matériaux Raw d'Engineering », étaient donc trop absolues sur ces trois-là. La table des matériaux
bruts, plus haut, les isole désormais sur leurs propres lignes.

C'est, de tout l'Engineering, le farming le plus rapide et le plus prévisible : les gisements sont des points fixes
sur un corps donné (contrairement aux signaux dynamiques ci-dessous), et les hotspots à forte concentration d'un
élément précis sont cartographiés par la communauté (outils cités plus bas). Une fois sur place, les signaux de
surface qui portent ces gisements se lisent au **Detailed Surface Scanner** : [10 — Exploration](./10-exploration.md)
documente ce qu'une cartographie DSS révèle sur un corps.

##### La composition fixe de 11 matériaux par corps atterrissable (5 G1, 3 G2, 2 G3, 1 G4)

**La règle qui change tout, et qui manquait à ce guide.** Chaque corps atterrissable a une **composition fixe de 11
matériaux — 5 de grade 1, 3 de grade 2, 2 de grade 3 et 1 de grade 4** — révélée par le Detailed Surface Scanner.
**Aucun autre matériau ne peut y apparaître**, quel que soit l'endroit où l'on prospecte ou le moment où l'on revient.
Prospecter au hasard en espérant tomber sur un matériau donné est donc une perte de temps : il faut d'abord scanner,
lire la composition, et ne se poser que si le matériau visé y figure. Deux corollaires utiles : les **cinq matériaux de
grade 1 de surface sont toujours les mêmes** — Carbon, Iron, Nickel, Phosphorus et Sulphur — et un **DSS à 90 % de
couverture révèle les signaux géologiques de façon permanente**, qui deviennent alors des points d'atterrissage
sélectionnables. Côté rendement, un **outcrop rend 3 unités par morceau**, et les dépôts volcaniques suivent une échelle
de grade : *Piceous Cobble* (G1), *Crystalline Fragments* (G2-G3), *Crystalline Cluster* (G3-G4) et *Needle Crystals*
(G4, uniquement sur les sites *Lava Spout*). Le détail par matériau — sur quel type de corps prospecter — figure dans « Où
s'obtiennent les matériaux d'Engineering, catégorie par catégorie » ci-dessus ; retenez au moins que **Selenium se prospecte sur un
corps Icy**, ce qui contredit les guides qui l'envoient chercher sur du High Metal Content.

##### Le minage de surface du Rhino (2 septembre 2026) ne produit aucun matériau Raw d'Engineering

**Le minage de surface planétaire, lui, ne relève pas de l'Engineering.** Introduit avec le **Rhino** le
**2 septembre 2026**, il ajoute au sol treize nouvelles matières premières que l'annonce officielle range explicitement
parmi les **marchandises** (« new commodities ») : Bastnäsite, Deuterium, Diamond, Helium, Helium-3, Iridium,
Magnesite, Olivine, Periclase dunite, Quartz pyroxenite, Ruby, Sapphire et Thortveitite. Elles se revendent, elles ne
se dépensent pas chez un Ingénieur — c'est la même frontière qu'entre le Painite et le Polonium. La même annonce
signale en revanche que la passe d'équilibrage du minage de surface porte aussi sur la **fréquence des microressources
additionnelles** récoltées : à ce titre, une session de minage de surface peut compléter un stock à pied sans jamais
alimenter un stock Raw de vaisseau. Deux effets de bord intéressent directement ce guide : le **Detailed Surface
Scanner** — dont le blueprint *Expanded Probe Scanning Radius* est chiffré plus bas — détecte désormais les
*Planetary Mining Locations*, et le Rhino se déploie depuis un **hangar de vaisseau**, pas par la trappe à cargaison
des SRV classiques. Voir [20 — Minage](./20-minage.md#note-sur-la-fiabilité-des-données-chiffrées) pour la boucle de
gameplay et [14 — Rhino et Nomad](./14-rhino-nomad.md) pour les deux véhicules.

*(Sources : annonces officielles Frontier relayées par le flux Steam News d'Elite Dangerous — « Rhino SRV Update »,
2 septembre 2026 11:20 UTC, pour la liste des marchandises, la détection des Planetary Mining Locations par le
Detailed Surface Scanner et la passe d'équilibrage ; « Beneath the Surface: Your First Look at the Rhino »,
6 août 2026 14:19 UTC, pour le déploiement depuis le hangar de vaisseau.)*

#### Matériaux manufacturés (Manufactured) — les High Grade Emissions (HGE), méthode de référence pour le grade 4-5

Pour les grades 4 et 5 de ce guide (Proprietary/Core Dynamics Composites, Proto Light/Radiolic Alloys, Thermic/Military
Grade Alloys, Conductive Polymers/Biotech Conductors, Polymer/Military Supercapacitors, Compound/Imperial Shielding,
Heat Vanes/Proto Heat Radiators, Configurable/Improvised Components, Chemical Manipulators/Pharmaceutical Isolators,
Refined/Exquisite Focus Crystals — voir le tableau des 10 familles plus haut), la méthode reconnue par la communauté
comme la plus efficace est le signal de type **High Grade Emission (HGE)**, distinct des sources de combat classiques
(RES, USS de piraterie) :

1. **Repérage en supercruise.** Une HGE n'apparaît pas sur la carte système à l'avance : naviguez en supercruise à
   l'intérieur d'un système peuplé et surveillez l'onglet **Signaux** du panneau de navigation, qui liste les sources
   détectées au fur et à mesure du vol — une HGE y apparaît comme un contact distinct des Nav Beacons, des USS et des
   sites de combat. **Deux mécaniques accélèrent le repérage** : les HGE apparaissent **en deep space** — le plus
   vite en volant **200 Ls hors du plan orbital** — et **scanner le Nav Beacon du système peut en faire apparaître**
   s'il n'y en a pas. *(Correction : la mention « de préférence à activité
   industrielle/technologique marquée » des versions antérieures est fausse — l'économie du système n'est pas un
   critère, voir l'encadré ci-dessous.)*
2. **Scan et chute sur le signal.** Approchez le contact pour le stabiliser dans le panneau, puis chutez de la
   supercruise dessus comme sur n'importe quelle autre source de signal — le jeu instancie une **épave/un convoi
   détruit** flottant dans l'espace.
3. **Collecte.** Approchez-vous des débris et cargaisons flottantes : les matériaux manufacturés — typiquement de
   grade plus élevé que ceux d'un débris de combat ordinaire, qui donne surtout du grade 1-2 — se récupèrent à la
   trappe à cargaison. **Aucun véhicule de surface n'est nécessaire pour une HGE : c'est une mécanique purement
   spatiale**, à traiter depuis le cockpit du vaisseau principal.

##### Les sites de crash, deuxième source de matériaux manufacturés de bon grade

En complément, les **sites de crash** — épaves de vaisseaux posées à la surface de planètes/lunes sans atmosphère,
repérables au Detailed Surface Scanner puis en survolant la surface — sont la deuxième source de matériaux manufacturés
de bon grade ; à la différence des HGE, ils demandent un **atterrissage suivi d'une sortie en SRV** (ou à pied depuis
Odyssey) pour fouiller l'épave au sol. Les deux méthodes sont complémentaires mais **ne se confondent pas** : une HGE
se traite sans jamais déployer l'SRV, un site de crash impose au contraire l'atterrissage — gardez cette distinction en
tête si vous planifiez une session dédiée à l'une ou l'autre. Deux sites de crash sont référencés avec leurs
coordonnées Live dans « Deux sites de farm de matériaux à coordonnées vérifiées » ci-dessus : **Dav's Hope** (Raw et Manufactured,
en boucle au SRV) et le **Jameson Crash Site** (Encoded G3 à G5). Attention aux coordonnées de Dav's Hope, que la
quasi-totalité des guides anciens donne dans leur version *Legacy*, désormais fausse.

##### Ce qui décide du contenu d'une HGE : l'allégeance de la faction, pas l'économie du système

> **Ce qui décide réellement du contenu d'une HGE — correction majeure de cette révision.** Les versions antérieures de
> ce guide signalaient une corrélation « HGE ↔ état Boom » comme une heuristique invérifiable. Il est aujourd'hui
> possible de trancher, et la règle est différente de celle que répètent les guides : **c'est
> l'allégeance de la faction contrôlante qui domine, pas l'état de faction seul**, et **l'économie du système n'est pas
> un critère**. Textuellement : « une faction fédérale ou impériale ne rend jamais autre chose que ses composites ou son
> shielding, respectivement ». La table exacte matériau par matériau figure dans « Où s'obtiennent les matériaux
> d'Engineering, catégorie par catégorie » ci-dessus ; en résumé : faction **fédérale** ⇒ Proprietary Composites et
> Core Dynamics Composites,
> faction **impériale** ⇒ Imperial Shielding, état **Civil Unrest** ⇒ Improvised Components, état **War/Civil War** ⇒
> Military Grade Alloys et Military Supercapacitors, état **Boom/Expansion** *et faction ni fédérale ni impériale* ⇒
> Proto Heat Radiators, Proto Light Alloys et Proto Radiolic Alloys, état **Outbreak** avec population supérieure à un
> million ⇒ Pharmaceutical Isolators.
>
> **Conséquence pratique :** chercher des Proto Heat Radiators dans un système **fédéral** en Boom est une perte de
> temps — il faut une faction indépendante ou Alliance. À noter également : l'état **Famine** ne figure dans aucune
> entrée de la table, et l'exigence « High Tech + Boom » lue dans d'innombrables guides ne correspond à rien.
>
> **Les HGE n'ont pas été nerfées, au contraire.** L'Update 18.08 (7 août 2024) a explicitement augmenté la
> disponibilité et le rendement des matériaux sur les sites de farm de grade 4/5 — de 3 à 6 fragments par site à
> **30 à 100 microressources** — et porté les récompenses de mission **jusqu'à 24 unités**. Tout guide qui décrit un
> nerf des HGE est antérieur à ce patch.
>
> **Une source massive qu'aucun guide ancien ne mentionne :** contribuer à la **reprise d'un système Thargoïde** rend, à
> la complétion, des matériaux **G4 Raw et G5 Encoded/Manufactured** — **120 unités** pour le quartile supérieur de
> contributeurs, 60 pour le suivant, 18 pour le dernier, réparties sur **2 matériaux tirés au hasard dans chacune des
> trois catégories**. Voir [25 — Combat AX](./25-combat-ax.md) pour le contexte de ces campagnes.
>
> *(Sources : catalogue de matériaux consolidé `assets/data/materials.json`, édition 2026-08, conditions déclarées
> des dix catégories manufacturées et des dix matériaux à condition propre ; étude interne
> `docs/faisabilite-spansh-temps-reel-materiaux.md`, § 3.4, étude du 19 août 2026.)*

##### La méthode historique (RES, épaves, Nav Beacons compromis), toujours valable pour le grade 1-3

La méthode « historique » — loot sur épaves de vaisseaux détruits dans les **[RES](./00-glossaire.md)** (notamment
High/Hazardous RES), scavenging de champs de débris et de Nav Beacons compromis/endommagés — reste valable et continue
de fournir du grade 1-3 en parallèle d'un combat déjà prévu, mais n'est pas la méthode à privilégier pour cibler
spécifiquement du grade 4-5 : les HGE et les sites de crash restent plus fiables pour ça.

#### Données encodées (Encoded) — signaux de données et USS

Il n'existe pas d'équivalent direct des HGE pour l'encodé : la méthode de référence reste le **piratage des
Unidentified Signal Sources (USS) de type données** et des **Nav Beacons compromis** (Data Terminals) — hack du
terminal via le Data Link Scanner — complété par le **scan de wakes FSD** (Frame Shift Wake Scanner, seule source
connue de *Datamined Wake Exceptions*, le matériau de grade 5 utilisé dans les builds FSD plus bas) et le **scan
d'émissions de vaisseaux** (combo Kill Warrant Scanner + Wake Scanner, pour cibler des vaisseaux recherchés sans
déclencher de combat). Les USS de type données se signalent par leur descriptif dans le panneau de signaux, distinct de
celui des USS de combat.

**Ce qu'il est désormais possible de préciser.** Les versions antérieures de ce guide indiquaient que
la granularité « quel type de source donne quel grade avec quelle fiabilité » n'avait pas pu être vérifiée. Le
référentiel consolidé la documente pour l'essentiel :

- **Cinq des six catégories encodées** — Data Archives, Emission Data, Encoded Firmware, Encryption Files, Shield Data
  — partagent exactement **trois sources** : le **scan de vaisseau** (automatique dès qu'un vaisseau est ciblé, en
  supercruise comme en sub-light), les **data points** et le **comptoir d'échange Encoded**.
- **Les data points** sont la source structurée : *Private Data Beacons* des Degraded et Encoded Emissions, satellites,
  **Planetary Outposts** scannés au Data Link Scanner du SRV — **les Starports ne comptent pas** — et missions de scan
  de surface, qui rendent souvent des données rares. Mécanique à connaître : **les data points vont par sets de
  quatre**, avec un **timer de reset rechargé à chaque scan réussi** ; **compléter le set rend un *Data Point Intel
  Package* en crédits**, en plus des matériaux. Et le rendement suit la sécurité : **plus la sécurité du site est
  haute, plus les données obtenues sont rares — et plus les défenses sont fortes**.
- **La sixième catégorie, Wake Scans, ne relève d'aucune de ces sources** : voir la mise en garde dédiée ci-dessous.

Ce qui **reste** non couvert par ces données, et donc toujours à vérifier soi-même : le taux de rendement comparé d'un
type d'USS de données à l'autre, et la probabilité d'obtenir un grade donné sur un data point précis. Le catalogue
donne les sources et leurs conditions, pas de statistiques de tirage.

> **Sans Frame Shift Wake Scanner, cinq matériaux sont hors d'atteinte.** Le point est catégorique : le
> **Frame Shift Wake Scanner braqué sur un sillage d'hyperespace** (*high energy wake*) est la **seule** source des
> **cinq Wake Scans** — Atypical Disrupted Wake Echoes (G1), Anomalous FSD Telemetry (G2), Strange Wake Solutions (G3),
> Eccentric Hyperspace Trajectories (G4), Datamined Wake Exceptions (G5). Sans ce module, aucun ne s'obtient, quel que
> soit le temps passé à prospecter. Le module est un **utility mount de classe 0**, notes E à A, de **13 544 Cr à
> 1 097 095 Cr**, de **2 à 4 km de portée**, **10 secondes de scan**, et il doit être **assigné à un groupe de tir**
> pour être utilisable. La méthode consiste à **camper les sillages près d'une station fréquentée**.
>
> **Le raccourci qui débloque réellement la situation :** le comptoir Encoded **descend d'un grade à raison de 1 pour
> 3**. Une unité de **Datamined Wake Exceptions (G5) rend donc 81 Atypical Disrupted Wake Echoes (G1)**. Récolter
> n'importe quel Wake Scan, quel que soit son grade, puis convertir au comptoir est bien plus rapide que d'espérer
> tomber sur le bon grade. C'est le point de blocage n° 1 du blueprint FSD « Increased Range » — voir sa fiche chiffrée
> plus bas.
>
> *(Source : catalogue de matériaux consolidé `assets/data/materials.json`, édition 2026-08, catégorie des Wake
> Scans ; étude interne `docs/faisabilite-spansh-temps-reel-materiaux.md`, § 3.3, étude du 19 août 2026.)*

#### Les Operations, source de matériaux depuis juin 2026

Depuis la sortie de la mise à jour **Operations**, le **30 juin 2026**, une source supplémentaire s'ajoute à celles
décrites ci-dessus : **compléter une Operation rend des matériaux**, aux côtés des crédits, du Merc Coin et — en mode
Powerplay — des mérites. La valeur des récompenses **varie avec le scénario et son niveau de difficulté**, les
Operations les plus exigeantes rendant davantage. Elles se lancent depuis les tableaux de missions des starports, des
Fleet Carriers et des Squadron Carriers, seul ou en escouade de quatre commandants au plus, avec appariement
optionnel ; **six scénarios** étaient disponibles à la sortie, rejoints par un septième, *Under Siege*, le
**2 septembre 2026**.

Deux réserves à connaître avant d'en faire un pilier de son farming. D'abord, la nature exacte des matériaux rendus
(catégorie, grade, quantité par scénario) n'est **pas chiffrée par les notes officielles** : elles annoncent des
« Materials » sans autre précision, et rien ne permet à ce jour d'en dresser une table comparable à celle des HGE.
Ensuite, la distribution de ces récompenses a été **défaillante à la sortie** : la mise à jour du 9 juillet 2026
reconnaît des Operations complétées sans récompense et annonce une régularisation rétroactive ultérieure. Traitez donc
les Operations comme un **complément opportuniste** — des matériaux gagnés en jouant autre chose — et non comme la
méthode à privilégier pour cibler un matériau précis. Le détail des scénarios et de leur déroulement relève de
[13 — Operations](./13-operations.md).

*(Sources : annonces officielles Frontier relayées par le flux Steam News d'Elite Dangerous — « An Update on
Operations », 22 avril 2026 14:02 UTC, pour la nature et la variabilité des récompenses ; « Operations Update »,
1ᵉʳ juillet 2026 14:01 UTC, pour la sortie, les six scénarios initiaux et les modalités de lancement ; « Operations
Update | Update 3 », 9 juillet 2026 10:24 UTC, pour les récompenses manquantes et leur régularisation annoncée ;
« Rhino SRV Update », 2 septembre 2026 11:20 UTC, pour l'ajout d'Under Siege.)*

#### Hiérarchie d'efficacité du farming : Raw > Manufactured > Encoded

Consensus communautaire stable sur le temps nécessaire pour constituer un stock de grade 4-5 dans chaque catégorie —
**pas une donnée chiffrée officielle** — du plus rapide au plus lent :

1. **Raw** — le plus rapide et le plus prévisible : gisements fixes, cartographiables à l'avance, aucune dépendance à
   l'apparition aléatoire d'un signal.
2. **Manufactured** — rapide une fois la technique HGE maîtrisée, mais dépendant de l'apparition d'un signal (délai
   variable selon le système) et d'un tri du type de débris une fois sur place.
3. **Encoded** — généralement le plus lent : le piratage d'USS impose de gérer une éventuelle réponse hostile, les
   wakes FSD ne se scannent qu'au survol d'un vaisseau qui vient de sauter (fenêtre de temps courte), et les Nav
   Beacons compromis sont statistiquement plus rares à rencontrer que des HGE ou des RES.

Cet ordre justifie une pratique répandue dans la communauté : **prospecter le Raw en continu** (peu coûteux en temps
de vol dédié, se fait « en passant » lors d'autres activités), **et réserver des sessions ciblées au Manufactured
(HGE/sites de crash) et à l'Encoded (USS/wakes)**, en comblant les manques ponctuels via un Material Trader (voir
« Accélérer le grind de matériaux d'Engineering » plus bas) plutôt que de viser l'exhaustivité matériau par matériau.

#### Matériaux Guardian et équipement Odyssey (à pied)

- **Matériaux Guardian** : exclusivement sur les sites de ruines et structures Guardian, souvent gardés par des
  Sentinelles — un vaisseau correctement blindé/armé est recommandé (détails : [05 — Guardians](./05-guardians.md)).
- **Odyssey (à pied)** : les settlements et leurs coffres/Data Points sont une source rapide de matériaux encodés et
  manufacturés sans passer par le vol spatial — voir [07 — Équipement à pied](./07-equipement-a-pied.md) pour le détail
  des méthodes à pied.

#### Cibler son farming de matériaux avec les bons outils tiers (Inara, EDEngineer, Coriolis)

Contrairement aux hotspots Raw (points fixes, cartographiables), **les HGE et les USS n'ont pas d'emplacement fixe** :
ce sont des signaux régénérés dynamiquement à chaque instanciation du système. C'est pourquoi aucun des outils
effectivement accessibles pour cette révision (EDTools.cc, EDSM.net, EDAstro.com — vérifiés en direct le 9 septembre
2026) ne propose de « carte des HGE » comparable à une carte de hotspots miniers ; EDTools.cc en particulier reste
concentré sur le minage de commodities et l'exploration (Road to Riches, hotspots), sans outil dédié à l'Engineering.
La bonne pratique consiste donc à cibler *quel* matériau farmer avant de partir, plutôt que *où* trouver une HGE
précise :

- **Inara.cn**, section Matériaux (`inara.cn/elite/materials/`) : fiche dédiée par matériau, avec sa catégorie, son
  grade et ses sources de collecte types — à consulter avant de partir pour confirmer quelle mécanique (HGE, site de
  crash, USS, wake) cible effectivement le matériau qui manque à votre stock.
- **EDEngineer** (open-source, `msarilar/EDEngineer`, déjà cité plus haut pour les plafonds de stockage) : en liant le
  journal de jeu, sélectionnez un blueprint cible et l'outil calcule automatiquement les matériaux et quantités qu'il
  vous manque encore — permet de partir en session HGE/USS avec un objectif chiffré plutôt qu'un farming à l'aveugle.
- **Coriolis.io / EDSY.org** : leur simulateur d'engineering affiche, pour n'importe quel module et grade visé, la
  liste exacte des matériaux requis *avant* d'engager le blueprint — combiné à Inara ou EDEngineer, cela donne une
  liste de courses précise avant une session de farming dédiée.

## Les modifications (Blueprints) par module

Les catégories et noms internes ci-dessous ont été **revérifiés** face à deux sources croisées : le code source d'EDDI
(`Blueprint.cs`, `BlueprintTemplate.cs`), les données brutes de Coriolis (`blueprints.json`), et les fiches individuelles
par module du wiki communautaire Elite Dangerous (pages consultées le 9 septembre 2026). Plusieurs intitulés de la
version précédente de ce guide se sont révélés inexacts ou approximatifs à l'usage ; ils sont corrigés ci-dessous, avec
mention explicite du point corrigé.

### Blueprints de propulsion et navigation (propulseurs, FSD, interdicteur, récupérateur de carburant)

| Module                    | Modifications disponibles (nom officiel actuel)                                                           |
|---------------------------|-----------------------------------------------------------------------------------------------------------|
| Propulseurs (Thrusters)   | **Dirty**, **Clean**, **Drive Strengthening** *(corrigé — voir note ①)*                                   |
| FSD                       | Increased Range, Faster Boot Sequence, Shielded                                                           |
| Interdicteur FSD          | **Expanded Capture Arc**, **Long Range** *(corrigé — voir note ②)*                                        |
| Récupérateur de carburant | **Shielded** (seule modification confirmée, jusqu'au grade 4 selon l'Ingénieur) *(corrigé — voir note ③)* |

> **① Propulseurs.** La version précédente listait « Dirty (Drive Tuning) / Reinforced / Tuned (Clean Drive Tuning) ».
> Le blueprint de renfort structurel des propulseurs s'appelle en réalité **Drive Strengthening** (affiché « Strengthened
> » en jeu), pas « Reinforced » ; il est proposé par Felicity Farseer (G3), Elvira Martuuk (G2), Professor Palin (G5),
> Chloe Sedesi (G5) et Mel Brandon (G5). Les deux autres s'appellent simplement **Dirty** et **Clean** en jeu (les
> parenthèses « Drive Tuning » ne correspondent à aucun intitulé actuel trouvé).
>
> **② Interdicteur FSD.** La version précédente mélangeait « Expanded (Longue portée) » et « Increased Range » (qui est
> en réalité le nom du blueprint du FSD lui-même, pas de l'interdicteur). Les deux blueprints réels de l'interdicteur
> sont **Expanded Capture Arc** et **Long Range**.
>
> **③ Récupérateur de carburant.** Aucune source fiable ne confirme de modification « Efficiency » pour ce module :
> seule **Shielded** existe (confirmée à la fois sur la fiche Bill Turner — jusqu'au grade 3 — et sur la fiche Lori
> Jameson — jusqu'au grade 4 — du wiki communautaire, et recoupée avec `FuelScoop_Shielded` dans `blueprints.json`).

### Blueprints d'armement — les dix modifications génériques d'armes

Dix modifications génériques s'appliquent à la plupart des armes (lasers, kinétiques, canons, multi-canons, rail guns,
plasma, missiles, torpilles, mines) : **Overcharged** (dégâts ↑), **Rapid Fire** (cadence ↑), **Efficient**
(consommation/chauffe ↓), **Long Range**/ **Short Range** (portée), **Light Weight** (masse ↓), **Focused**
(dispersion ↓, portée ↓), **Sturdy** (résistance du module ↑), **High Capacity** (réserve de munitions ↑), **Double
Shot** (tir double, sur certaines armes).

### Blueprints de boucliers et de défense (générateur, amplificateur, batterie, armure, renforts)

| Module                    | Modifications disponibles                                                                                  |
|---------------------------|------------------------------------------------------------------------------------------------------------|
| Générateur de bouclier    | **Enhanced Low Power** *(corrigé, ex-« Optimised »)*, Reinforced, Kinetic (résistant), Thermic (résistant) |
| Amplificateur de bouclier | Resistance Augmented, Heavy Duty, Kinetic (résistant), Thermic (résistant), Blast (résistant)              |
| Batterie de bouclier      | Rapid (recharge rapide), Specialised (plus de charges)                                                     |
| Armure/Bulkheads          | Lightweight, Blast (résistant), Heavy Duty, Kinetic (résistant), Thermic (résistant)                       |
| Renforts de coque         | Lightweight, Blast (résistant), Heavy Duty, Kinetic (résistant), Thermic (résistant)                       |

> **Correction.** Le Générateur de bouclier n'a pas de blueprint nommé « Optimised » : le blueprint réel qui réduit la
> consommation énergétique s'appelle **Enhanced Low Power** (confirmé sur la fiche « Shield Generator » du wiki
> communautaire — modifications : Enhanced Low Power, Kinetic Resistant, Reinforced, Thermal Resistant, aucune trace
> d'« Optimised »).

### Blueprints d'énergie (générateur d'énergie, distributeur d'énergie)

| Module                 | Modifications disponibles (nom officiel actuel)                                                                                                                               |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Générateur d'énergie   | **Armoured**, **Overcharged** *(corrigé, ex-« Boosted »)*, **Low Emissions** *(corrigé, ex-« Stealth »)*                                                                      |
| Distributeur d'énergie | High Charge Capacity, **Charge Enhanced** *(corrigé, ex-« High Frequency »)*, **Engine/System/Weapon Focused** *(corrigé, ex-« Priority Engines/Systems/Weapons »)*, Shielded |

> **Correction — Générateur d'énergie.** « Boosted » et « Stealth » sont en réalité des **noms de code internes**
> utilisés par certains fichiers de données (`PowerPlant_Boosted`, `PowerPlant_Stealth` dans `blueprints.json`), pas les
> noms affichés en jeu. Le nom affiché (et confirmé sur la fiche « Power Plant » du wiki communautaire, qui liste
> exactement Armoured / Low emissions / Overcharged) est bien **Overcharged** pour le premier et **Low Emissions** pour
> le second — cohérent au demeurant avec les effets expérimentaux déjà listés plus bas (Monstered, Thermal Spread), qui
> eux étaient corrects.
>
> **Correction — Distributeur d'énergie.** Même situation : `PowerDistributor_HighFrequency` s'affiche en jeu **Charge
> Enhanced**, et les trois `PowerDistributor_PriorityEngines/Systems/Weapons` s'affichent **Engine Focused / System
> Focused / Weapon Focused**. Confirmé sur la fiche « Power Distributor » du wiki communautaire ET sur les champs
> `name` de `blueprints.json` (qui distingue bien la clé interne, historique, du nom affiché actuel).

### Blueprints de capteurs, scanners utilitaires et modules divers

| Module                                                             | Modifications disponibles                                                  |
|--------------------------------------------------------------------|----------------------------------------------------------------------------|
| Capteurs (Sensors, module cœur)                                    | **Lightweight, Long Range, Wide Angle uniquement** *(corrigé — voir note)* |
| Scanners utilitaires (Kill Warrant, Frame Shift Wake, Manifest Scanner *(ex-Cargo Scanner)*) | Fast Scan, Lightweight, Long Range, Reinforced, Shielded, Wide Angle       |
| Detailed Surface Scanner                                           | Expanded Probe Scanning Radius                                             |
| Contrôleurs de limpets                                             | Lightweight, Reinforced, Shielded                                          |
| Support de vie                                                     | Lightweight, Reinforced, Shielded                                          |

> **Correction — Capteurs.** La version précédente listait « Expanded, Fast Scan, Light Weight, Long Range, Wide Angle »
> pour le module **Sensors** (module cœur, non retirable). En réalité, le module Sensors lui-même ne propose que
> **Lightweight, Long Range et Wide Angle** (confirmé sur la fiche « Sensors » du wiki communautaire). « Fast Scan » et
> « Reinforced »/« Shielded » appartiennent aux modules **scanners utilitaires** (Kill Warrant Scanner, Frame Shift Wake
> Scanner, Manifest Scanner — anciennement Cargo Scanner, même module renommé, voir
> [30-piraterie-et-pvp.md §2](./30-piraterie-et-pvp.md#2-les-scanners-de-piraterie--un-seul-module-renommé-pas-quatre)),
> et « Expanded » (nom complet : *Expanded Probe Scanning Radius*)
> appartient exclusivement au **Detailed Surface Scanner** — trois familles de modules distinctes que la version
> précédente avait fusionnées à tort. Recoupé avec les champs `modulename` de `blueprints.json`, qui rattachent chaque
> blueprint à son (ou ses) module(s) réel(s).

### Fiches chiffrées de cinq blueprints du socle exploration

Cinq blueprints sont ici chiffrés intégralement : matériaux et quantités par grade, nombre de rolls, effet obtenu,
ingénieurs habilités avec leur grade maximum, et effets expérimentaux compatibles. Ce sont ceux du « socle
exploration » — FSD, Detailed Surface Scanner, Sensors, Thrusters — mais leurs tables se lisent de la même façon pour
n'importe quel autre blueprint.

Deux conventions de lecture. Les matériaux sont donnés sous leur **nom affiché en jeu**, suivi entre parenthèses de
leur type et de leur grade (`R` = raw, `M` = manufactured, `E` = encoded). Et la colonne « Rolls à réputation 5 »
donne le **nombre d'applications** nécessaires pour valider le grade, pas une quantité de matériaux : le coût réel
d'un grade est *quantité par roll × nombre de rolls*.

> **Les rolls ne sont plus aléatoires — c'est la note la plus importante de cette section.** Depuis l'**Update 18.08
> du 7 août 2024**, un roll d'ingénieur donne un **résultat fixe**, déterminé par le grade de la recette et par le
> rang du commandant auprès de l'ingénieur. **Au grade de réputation 5, un blueprint de grade N demande exactement N
> rolls** ; en dessous, il en faut davantage — mais ce n'est plus un tirage. Conséquence directe : tout conseil du
> type « rerouler jusqu'à obtenir un bon résultat », « brûler des rolls bon marché pour tomber sur un pic », ou toute
> valeur d'effet donnée sous forme de fourchette « selon le tirage », est **périmé depuis août 2024**.

*Sourçage de cette section : catalogue de blueprints consolidé `assets/data/blueprints.json`, édition 2026-08 (qui
déclare pour sources amont `modifications/blueprints.json` et `modifications/specials.json` du projet
EDCD/coriolis-data), et étude interne `docs/faisabilite-spansh-temps-reel-materiaux.md`, §§ 3.2 et 3.3, étude du
19 août 2026.*

#### Portée accrue — Frame Shift Drive (*Increased Range*)

**Objet.** Le blueprint de portée. Il agit sur la masse optimale du FSD, et la distance de saut y est linéaire — un G5
complet donne donc +55 % de portée brute, moins l'effet du +30 % de masse que le blueprint ajoute au module lui-même.

> **Mise en garde.** Les quatre matériaux encodés de la recette appartiennent tous à la catégorie Wake Scans, dont la
> seule source est le Frame Shift Wake Scanner braqué sur des sillages d'hyperespace. Sans ce module, le blueprint est
> impossible à compléter, quel que soit le temps passé à prospecter en SRV.

**Ingénieurs.** **Felicity Farseer** (grade max 5), **Elvira Martuuk** (grade max 5), **Mel Brandon** (grade max 5).
Ce sont les trois seuls à monter aux grades 4 et 5.

| Grade | Rolls à réputation 5 | Matériaux par roll                                                                        | Effet                   |
|-------|----------------------|-------------------------------------------------------------------------------------------|-------------------------|
| 1     | 1                    | 1× Atypical Disrupted Wake Echoes (E1)                                                    | +15 % de masse optimale |
| 2     | 2                    | 1× Atypical Disrupted Wake Echoes (E1), 1× Chemical Processors (M2)                       | +25 % de masse optimale |
| 3     | 3                    | 1× Chemical Processors (M2), 1× Phosphorus (R1), 1× Strange Wake Solutions (E3)           | +35 % de masse optimale |
| 4     | 4                    | 1× Chemical Distillery (M3), 1× Eccentric Hyperspace Trajectories (E4), 1× Manganese (R2) | +45 % de masse optimale |
| 5     | 5                    | 1× Arsenic (R2), 1× Chemical Manipulators (M4), 1× Datamined Wake Exceptions (E5)         | +55 % de masse optimale |

**Coût total d'une montée du grade 1 au grade 5 à réputation 5** (15 rolls) : 5× Arsenic (R2), 3× Atypical Disrupted
Wake Echoes (E1), 4× Chemical Distillery (M3), 5× Chemical Manipulators (M4), 5× Chemical Processors (M2), 5×
Datamined Wake Exceptions (E5), 4× Eccentric Hyperspace Trajectories (E4), 4× Manganese (R2), 3× Phosphorus (R1), 3×
Strange Wake Solutions (E3).

**Le goulot d'étranglement est identifié** : les **5 unités de Datamined Wake Exceptions (E5)** du grade 5. C'est le
matériau de grade 5 de la catégorie Wake Scans, et il concentre à lui seul la difficulté du blueprint. Le raccourci
décrit plus haut — récolter n'importe quel Wake Scan puis descendre de grade au comptoir Encoded, à 1 pour 3 — est la
réponse pratique.

**Effets expérimentaux compatibles** (un seul applicable par module, en plus du grade) :

| Effet expérimental | Coût en matériaux                                                                                             | Ce qu'il fait                                                                                                                                                                        |
|--------------------|---------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Mass Manager       | 5× Atypical Disrupted Wake Echoes (E1), 1× Eccentric Hyperspace Trajectories (E4), 3× Galvanising Alloys (M2) | Optimisation logicielle et suite de capteurs internes qui prennent en compte la configuration du vaisseau : **masse optimale du FSD en hausse, intégrité du module en baisse**.      |
| Deep Charge        | 5× Atypical Disrupted Wake Echoes (E1), 1× Eccentric Hyperspace Trajectories (E4), 3× Galvanising Alloys (M2) | Conduits d'énergie renforcés et champ de charge consolidé : **davantage de carburant injecté à la charge, donc des sauts plus longs, au prix d'une consommation électrique accrue**. |

**Le choix entre les deux mérite d'être posé, pas tranché d'office.** Les deux effets coûtent **exactement les mêmes
matériaux**, ce que les données confirment ligne à ligne. *Mass Manager* apporte **+4 % de masse optimale** contre
**−8 % d'intégrité** du module ; *Deep Charge* apporte **+10 % de carburant maximum par saut**. Sur un long trajet, ce
+10 % de carburant peut valoir davantage que +4 % de portée par saut — c'est un arbitrage entre portée unitaire et
autonomie, à faire selon le profil de voyage. Felicity Farseer pose l'un comme l'autre. *(Chiffres : étude interne
`docs/faisabilite-spansh-temps-reel-materiaux.md`, § 3.3, étude du 19 août 2026 ; coûts en matériaux : catalogue de
blueprints consolidé, édition 2026-08.)*

#### Amorçage accéléré — Frame Shift Drive (*Faster Boot Sequence*)

**Objet.** Le blueprint le moins cher du jeu : son grade 1 ne demande qu'un Grid Resistors, le matériau le plus
commun. C'est le moyen de gagner de la réputation chez Farseer sans consommer un seul Wake Scan — ce qui, vu la rareté
de ceux-ci, est un argument sérieux.

> **Mise en garde.** Depuis l'Update 18.08 (7 août 2024) les rolls sont déterministes : « brûler » des rolls bon
> marché pour tomber sur un bon résultat n'a plus de sens, seule la réputation gagnée compte.

**Ingénieurs.** **Felicity Farseer** (grade max 5).

| Grade | Rolls à réputation 5 | Matériaux par roll                                                      | Effet                     |
|-------|----------------------|-------------------------------------------------------------------------|---------------------------|
| 1     | 1                    | 1× Grid Resistors (M1)                                                  | -20 % de temps d'amorçage |
| 2     | 2                    | 1× Chromium (R2), 1× Grid Resistors (M1)                                | -35 % de temps d'amorçage |
| 3     | 3                    | 1× Grid Resistors (M1), 1× Heat Dispersion Plate (M2), 1× Selenium (R4) | -50 % de temps d'amorçage |
| 4     | 4                    | 1× Cadmium (R3), 1× Heat Exchangers (M3), 1× Hybrid Capacitors (M2)     | -65 % de temps d'amorçage |
| 5     | 5                    | 1× Electrochemical Arrays (M3), 1× Heat Vanes (M4), 1× Tellurium (R4)   | -80 % de temps d'amorçage |

**Coût total d'une montée du grade 1 au grade 5 à réputation 5** (15 rolls) : 4× Cadmium (R3), 2× Chromium (R2), 5×
Electrochemical Arrays (M3), 6× Grid Resistors (M1), 3× Heat Dispersion Plate (M2), 4× Heat Exchangers (M3), 5× Heat
Vanes (M4), 4× Hybrid Capacitors (M2), 3× Selenium (R4), 5× Tellurium (R4).

**À quoi il sert vraiment, depuis août 2024.** Le conseil « fabriquer des Faster Boot Sequence de grade 3 pour monter
les grades vite » date d'avant l'Update 18.08 : les rolls étant désormais déterministes, « brûler » des rolls bon
marché n'a plus le même intérêt. Le blueprint reste néanmoins le moins cher du jeu, et surtout le seul moyen de gagner
de la réputation chez Farseer **sans consommer un seul Wake Scan** — ce qui, vu leur rareté, reste un argument
sérieux.

#### Rayon de sondage étendu — Detailed Surface Scanner (*Expanded Probe Scanning Radius*)

**Objet.** Le blueprint qui compte le plus pour l'exobiologie : un rayon de sonde plus large veut dire moins de sondes
par corps, donc beaucoup moins de temps entre deux cartographies.

**Ingénieurs.** **Felicity Farseer** (grade max 3). Farseer plafonne le Detailed Surface Scanner au grade 3 : pour un
G5, il faut aller voir ailleurs.

| Grade | Rolls à réputation 5 | Matériaux par roll                                                        | Effet                   |
|-------|----------------------|---------------------------------------------------------------------------|-------------------------|
| 1     | 1                    | 1× Mechanical Scrap (M1)                                                  | +10 % de rayon de sonde |
| 2     | 2                    | 1× Germanium (R2), 1× Mechanical Scrap (M1)                               | +20 % de rayon de sonde |
| 3     | 3                    | 1× Germanium (R2), 1× Mechanical Scrap (M1), 1× Phase Alloys (M3)         | +30 % de rayon de sonde |
| 4     | 4                    | 1× Mechanical Equipment (M2), 1× Niobium (R3), 1× Proto Light Alloys (M4) | +40 % de rayon de sonde |
| 5     | 5                    | 1× Mechanical Components (M3), 1× Proto Radiolic Alloys (M5), 1× Tin (R3) | +50 % de rayon de sonde |

**Coût total d'une montée du grade 1 au grade 5 à réputation 5** (15 rolls) : 5× Germanium (R2), 5× Mechanical
Components (M3), 4× Mechanical Equipment (M2), 6× Mechanical Scrap (M1), 4× Niobium (R3), 3× Phase Alloys (M3), 4×
Proto Light Alloys (M4), 5× Proto Radiolic Alloys (M5), 5× Tin (R3).

#### Allégés — Sensors (*Lightweight*)

**Objet.** De la masse en moins sur un module qui ne sert à rien en exploration, donc de la portée de saut en plus,
pour des matériaux communs.

**Ingénieurs.** **Felicity Farseer** (grade max 3). Farseer plafonne les Sensors au grade 3.

| Grade | Rolls à réputation 5 | Matériaux par roll                                                                     | Effet          |
|-------|----------------------|----------------------------------------------------------------------------------------|----------------|
| 1     | 1                    | 1× Phosphorus (R1)                                                                     | -20 % de masse |
| 2     | 2                    | 1× Manganese (R2), 1× Salvaged Alloys (M1)                                             | -35 % de masse |
| 3     | 3                    | 1× Conductive Ceramics (M3), 1× Manganese (R2), 1× Salvaged Alloys (M1)                | -50 % de masse |
| 4     | 4                    | 1× Conductive Components (M2), 1× Phase Alloys (M3), 1× Proto Light Alloys (M4)        | -65 % de masse |
| 5     | 5                    | 1× Conductive Ceramics (M3), 1× Proto Light Alloys (M4), 1× Proto Radiolic Alloys (M5) | -80 % de masse |

**Coût total d'une montée du grade 1 au grade 5 à réputation 5** (15 rolls) : 8× Conductive Ceramics (M3), 4×
Conductive Components (M2), 5× Manganese (R2), 4× Phase Alloys (M3), 1× Phosphorus (R1), 9× Proto Light Alloys (M4),
5× Proto Radiolic Alloys (M5), 5× Salvaged Alloys (M1).

#### Réglage sauvage — Thrusters (*Dirty*)

**Objet.** Ce qui permet de décoller d'un monde à forte gravité et de rejoindre un site d'échantillonnage sans y
passer la soirée.

**Ingénieurs.** **Felicity Farseer** (grade max 3). Farseer plafonne les Thrusters au grade 3.

| Grade | Rolls à réputation 5 | Matériaux par roll                                                                     | Effet                            |
|-------|----------------------|----------------------------------------------------------------------------------------|----------------------------------|
| 1     | 1                    | 1× Specialised Legacy Firmware (E1)                                                    | +12 % de puissance de propulseur |
| 2     | 2                    | 1× Mechanical Equipment (M2), 1× Specialised Legacy Firmware (E1)                      | +19 % de puissance de propulseur |
| 3     | 3                    | 1× Chromium (R2), 1× Mechanical Components (M3), 1× Specialised Legacy Firmware (E1)   | +26 % de puissance de propulseur |
| 4     | 4                    | 1× Configurable Components (M4), 1× Modified Consumer Firmware (E2), 1× Selenium (R4)  | +33 % de puissance de propulseur |
| 5     | 5                    | 1× Cadmium (R3), 1× Cracked Industrial Firmware (E3), 1× Pharmaceutical Isolators (M5) | +40 % de puissance de propulseur |

**Coût total d'une montée du grade 1 au grade 5 à réputation 5** (15 rolls) : 5× Cadmium (R3), 3× Chromium (R2), 4×
Configurable Components (M4), 5× Cracked Industrial Firmware (E3), 3× Mechanical Components (M3), 2× Mechanical
Equipment (M2), 4× Modified Consumer Firmware (E2), 5× Pharmaceutical Isolators (M5), 4× Selenium (R4), 6× Specialised
Legacy Firmware (E1).

#### Matrice Ingénieur × Blueprint × grade maximum

Amorce de matrice, construite à partir des grades maximums déclarés par ingénieur. Elle ne couvre que les cinq
blueprints chiffrés ci-dessus et les trois ingénieurs qu'ils citent ; **la matrice des 186 couples
blueprint × module, avec les 25 Ingénieurs classiques, est donnée plus bas** dans « Matrice Blueprint × Ingénieur ×
grade maximum, pour les 25 Ingénieurs classiques ». Elle ne couvre pas les 13 Ingénieurs Odyssey, absents des deux
jeux de données. Un tiret signifie ici « non couvert par le jeu de données interne », pas « impossible ».

| Ingénieur        | Portée accrue | Amorçage accéléré | Rayon de sondage étendu | Allégés | Réglage sauvage |
|------------------|---------------|-------------------|-------------------------|---------|-----------------|
| Elvira Martuuk   | 5             | —                 | —                       | —       | —               |
| Felicity Farseer | 5             | 5                 | 3                       | 3       | 3               |
| Mel Brandon      | 5             | —                 | —                       | —       | —               |

Ce que cette matrice montre déjà, et qui évite des trajets inutiles : **Felicity Farseer est la seule à couvrir les
cinq**, mais elle **plafonne au grade 3** sur le Detailed Surface Scanner, les Sensors et les Thrusters. Pour un
*Expanded Probe Scanning Radius* G5 ou des *Lightweight Sensors* G5, il faut aller voir un autre ingénieur. L'étude
interne complète ce tableau pour Farseer : **FSD au grade 5** (Increased Range, Faster Boot Sequence, Shielded),
**Sensors, Thrusters et Detailed Surface Scanner au grade 3**, **Power Plant et Shield Booster au grade 1**. Et pour
*Increased Range* au grade 5, les trois seuls ingénieurs sont **Felicity Farseer**, **Elvira Martuuk** et **Mel
Brandon**.

> **Note.** Les mêmes données chiffrent aussi les paliers de montée en grade des **trois
> combinaisons Odyssey** (Artemis, Maverick, Dominator) — matériaux, coûts en crédits et emplacements de modification
> par palier. Ce volet relève de [07 — Équipement à pied](./07-equipement-a-pied.md) et de [26 — Ingénierie à pied
> avancée](./26-ingenierie-a-pied-avancee.md), et n'est pas repris ici. Elles assortissent d'ailleurs ces montants
> d'une réserve explicite : ils proviennent du wiki Fandom seul, Inara n'en liste aucun, et ils sont **à confirmer en
> jeu** avant de s'y fier.

### Référentiel chiffré des 81 blueprints de modules — matériaux, quantités et effet par grade

Les cinq fiches ci-dessus servent de gabarit ; ce référentiel applique la même lecture à **la totalité des 81
blueprints de modules** connus du jeu de données de Coriolis, soit **387 couples blueprint × grade**. Il
est découpé en sept tables, une par famille de modules, pour rester lisible ; chaque table donne, pour un grade
donné, les **matériaux consommés par roll avec leurs quantités exactes** et l'**effet atteint** une fois ce grade
validé.

Trois conventions de lecture, identiques à celles des fiches. Les matériaux portent leur **nom affiché en jeu**,
suivi de leur type et de leur grade entre parenthèses (`R` brut, `M` manufacturé, `E` encodé) ; ces noms et ces
grades sont résolus contre `material.csv` d'EDCD/FDevIDs, ce qui corrige au passage une coquille du jeu de données
amont (« Adaptive Encyptors Capture » y est écrit sans le second `r` ; le nom en jeu est bien **Adaptive Encryptors
Capture**). Les effets sont donnés en **valeur atteinte au grade**, pas en incrément : un *Increased Range* de grade 4
porte la masse optimale à +45 %, il n'ajoute pas 45 % aux +35 % du grade 3. Enfin, lorsque la recette porte une
fourchette, la valeur retenue est la **borne haute**, c'est-à-dire le résultat d'un roll complet depuis que
l'Update 18.08 a rendu les rolls déterministes.

#### Propulsion et navigation — propulseurs, FSD, interdicteur et récupérateur de carburant : coût en matériaux et effet, grade par grade

9 blueprints de cette famille, soit **45 couples blueprint × grade** : matériaux consommés par roll et effet atteint
une fois le grade validé. *(Source : EDCD/coriolis-data, `modifications/blueprints.json`, commit 0db9234b5b9c ; noms
de matériaux résolus par EDCD/FDevIDs, `material.csv`, commit c35612952dd6.)*

| Blueprint            | Module            | Grade | Matériaux par roll                                                                                                | Effet atteint à ce grade                                                                                                               |
|----------------------|-------------------|-------|-------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Expanded Capture Arc | FSD Interdictor   | 1     | 1× Mechanical Scrap (M1)                                                                                          | angle d'interdiction +40 %, portée d'interdiction +10 %, consommation électrique +10 %                                                 |
| Expanded Capture Arc | FSD Interdictor   | 2     | 1× Mechanical Equipment (M2), 1× Unusual Encrypted Files (E1)                                                     | angle d'interdiction +60 %, consommation électrique +20 %, portée d'interdiction −15 %                                                 |
| Expanded Capture Arc | FSD Interdictor   | 3     | 1× Grid Resistors (M1), 1× Mechanical Components (M3), 1× Tagged Encryption Codes (E2)                            | angle d'interdiction +80 %, consommation électrique +30 %, portée d'interdiction −20 %                                                 |
| Expanded Capture Arc | FSD Interdictor   | 4     | 1× Divergent Scan Data (E4), 1× Mechanical Equipment (M2), 1× Strange Wake Solutions (E3)                         | angle d'interdiction +100 %, consommation électrique +40 %, portée d'interdiction −25 %                                                |
| Expanded Capture Arc | FSD Interdictor   | 5     | 1× Classified Scan Fragment (E5), 1× Eccentric Hyperspace Trajectories (E4), 1× Mechanical Components (M3)        | angle d'interdiction +120 %, consommation électrique +50 %, portée d'interdiction −30 %                                                |
| Long Range           | FSD Interdictor   | 1     | 1× Unusual Encrypted Files (E1)                                                                                   | portée d'interdiction +20 %, angle d'interdiction −10 %, masse +10 %, consommation électrique +10 %                                    |
| Long Range           | FSD Interdictor   | 2     | 1× Atypical Disrupted Wake Echoes (E1), 1× Tagged Encryption Codes (E2)                                           | portée d'interdiction +30 %, consommation électrique +20 %, angle d'interdiction −15 %, masse +15 %                                    |
| Long Range           | FSD Interdictor   | 3     | 1× Anomalous Bulk Scan Data (E1), 1× Anomalous FSD Telemetry (E2), 1× Open Symmetric Keys (E3)                    | portée d'interdiction +40 %, consommation électrique +30 %, angle d'interdiction −20 %, masse +20 %                                    |
| Long Range           | FSD Interdictor   | 4     | 1× Atypical Encryption Archives (E4), 1× Strange Wake Solutions (E3), 1× Unidentified Scan Archives (E2)          | portée d'interdiction +50 %, consommation électrique +40 %, angle d'interdiction −25 %, masse +25 %                                    |
| Long Range           | FSD Interdictor   | 5     | 1× Adaptive Encryptors Capture (E5), 1× Classified Scan Databanks (E3), 1× Eccentric Hyperspace Trajectories (E4) | portée d'interdiction +60 %, consommation électrique +50 %, angle d'interdiction −30 %, masse +30 %                                    |
| Faster Boot Sequence | Frame Shift Drive | 1     | 1× Grid Resistors (M1)                                                                                            | temps d'amorçage −20 %, masse optimale +3 %, charge thermique +4 %, intégrité du module −3 %                                           |
| Faster Boot Sequence | Frame Shift Drive | 2     | 1× Chromium (R2), 1× Grid Resistors (M1)                                                                          | temps d'amorçage −35 %, masse optimale +6 %, charge thermique +8 %, intégrité du module −6 %                                           |
| Faster Boot Sequence | Frame Shift Drive | 3     | 1× Grid Resistors (M1), 1× Heat Dispersion Plate (M2), 1× Selenium (R4)                                           | temps d'amorçage −50 %, masse optimale +9 %, charge thermique +12 %, intégrité du module −9 %                                          |
| Faster Boot Sequence | Frame Shift Drive | 4     | 1× Cadmium (R3), 1× Heat Exchangers (M3), 1× Hybrid Capacitors (M2)                                               | temps d'amorçage −65 %, masse optimale +12 %, charge thermique +16 %, intégrité du module −12 %                                        |
| Faster Boot Sequence | Frame Shift Drive | 5     | 1× Electrochemical Arrays (M3), 1× Heat Vanes (M4), 1× Tellurium (R4)                                             | temps d'amorçage −80 %, masse optimale +15 %, charge thermique +20 %, intégrité du module −15 %                                        |
| Increased Range      | Frame Shift Drive | 1     | 1× Atypical Disrupted Wake Echoes (E1)                                                                            | masse optimale +15 %, masse +10 %, intégrité du module −3 %, consommation électrique +3 %                                              |
| Increased Range      | Frame Shift Drive | 2     | 1× Atypical Disrupted Wake Echoes (E1), 1× Chemical Processors (M2)                                               | masse optimale +25 %, masse +15 %, intégrité du module −6 %, consommation électrique +6 %                                              |
| Increased Range      | Frame Shift Drive | 3     | 1× Chemical Processors (M2), 1× Phosphorus (R1), 1× Strange Wake Solutions (E3)                                   | masse optimale +35 %, masse +20 %, intégrité du module −9 %, consommation électrique +9 %                                              |
| Increased Range      | Frame Shift Drive | 4     | 1× Chemical Distillery (M3), 1× Eccentric Hyperspace Trajectories (E4), 1× Manganese (R2)                         | masse optimale +45 %, masse +25 %, intégrité du module −12 %, consommation électrique +12 %                                            |
| Increased Range      | Frame Shift Drive | 5     | 1× Arsenic (R2), 1× Chemical Manipulators (M4), 1× Datamined Wake Exceptions (E5)                                 | masse optimale +55 %, masse +30 %, intégrité du module −15 %, consommation électrique +15 %                                            |
| Shielded             | Frame Shift Drive | 1     | 1× Nickel (R1)                                                                                                    | intégrité du module +25 %, charge thermique −10 %, masse optimale +3 %, masse +4 %                                                     |
| Shielded             | Frame Shift Drive | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                                                           | intégrité du module +50 %, charge thermique −15 %, masse optimale +6 %, masse +8 %                                                     |
| Shielded             | Frame Shift Drive | 3     | 1× Carbon (R1), 1× Shielding Sensors (M3), 1× Zinc (R2)                                                           | intégrité du module +75 %, charge thermique −20 %, masse optimale +9 %, masse +12 %                                                    |
| Shielded             | Frame Shift Drive | 4     | 1× Compound Shielding (M4), 1× High Density Composites (M3), 1× Vanadium (R2)                                     | intégrité du module +100 %, charge thermique −25 %, masse optimale +12 %, masse +16 %                                                  |
| Shielded             | Frame Shift Drive | 5     | 1× Imperial Shielding (M5), 1× Proprietary Composites (M4), 1× Tungsten (R3)                                      | intégrité du module +125 %, charge thermique −30 %, masse optimale +15 %, masse +20 %                                                  |
| Shielded             | Fuel Scoop        | 1     | 1× Worn Shield Emitters (M1)                                                                                      | intégrité du module +60 %, consommation électrique +20 %                                                                               |
| Shielded             | Fuel Scoop        | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                                                           | intégrité du module +120 %, consommation électrique +40 %                                                                              |
| Shielded             | Fuel Scoop        | 3     | 1× Carbon (R1), 1× High Density Composites (M3), 1× Shield Emitters (M2)                                          | intégrité du module +180 %, consommation électrique +60 %                                                                              |
| Shielded             | Fuel Scoop        | 4     | 1× Proprietary Composites (M4), 1× Shielding Sensors (M3), 1× Vanadium (R2)                                       | intégrité du module +240 %, consommation électrique +80 %                                                                              |
| Shielded             | Fuel Scoop        | 5     | 1× Compound Shielding (M4), 1× Core Dynamics Composites (M5), 1× Tungsten (R3)                                    | intégrité du module +300 %, consommation électrique +100 %                                                                             |
| Clean                | Thrusters         | 1     | 1× Sulphur (R1)                                                                                                   | charge thermique −20 %, multiplicateur optimal +8 %, masse optimale −2 %                                                               |
| Clean                | Thrusters         | 2     | 1× Conductive Components (M2), 1× Specialised Legacy Firmware (E1)                                                | charge thermique −30 %, multiplicateur optimal +13 %, intégrité du module −4 %, masse optimale −4 %, consommation électrique +4 %      |
| Clean                | Thrusters         | 3     | 1× Conductive Components (M2), 1× Specialised Legacy Firmware (E1), 1× Unexpected Emission Data (E3)              | charge thermique −40 %, multiplicateur optimal +18 %, intégrité du module −8 %, consommation électrique +8 %, masse optimale −6 %      |
| Clean                | Thrusters         | 4     | 1× Conductive Ceramics (M3), 1× Decoded Emission Data (E4), 1× Modified Consumer Firmware (E2)                    | charge thermique −50 %, multiplicateur optimal +23 %, intégrité du module −12 %, consommation électrique +12 %, masse optimale −8 %    |
| Clean                | Thrusters         | 5     | 1× Abnormal Compact Emissions Data (E5), 1× Conductive Ceramics (M3), 1× Tin (R3)                                 | charge thermique −60 %, multiplicateur optimal +28 %, intégrité du module −16 %, consommation électrique +16 %, masse optimale −10 %   |
| Dirty                | Thrusters         | 1     | 1× Specialised Legacy Firmware (E1)                                                                               | multiplicateur optimal +12 %, charge thermique +20 %, consommation électrique +4 %, intégrité du module −3 %, masse optimale −2,5 %    |
| Dirty                | Thrusters         | 2     | 1× Mechanical Equipment (M2), 1× Specialised Legacy Firmware (E1)                                                 | multiplicateur optimal +19 %, charge thermique +30 %, intégrité du module −6 %, consommation électrique +6 %, masse optimale −5 %      |
| Dirty                | Thrusters         | 3     | 1× Chromium (R2), 1× Mechanical Components (M3), 1× Specialised Legacy Firmware (E1)                              | multiplicateur optimal +26 %, charge thermique +40 %, intégrité du module −9 %, consommation électrique +8 %, masse optimale −7,5 %    |
| Dirty                | Thrusters         | 4     | 1× Configurable Components (M4), 1× Modified Consumer Firmware (E2), 1× Selenium (R4)                             | multiplicateur optimal +33 %, charge thermique +50 %, intégrité du module −12 %, masse optimale −10 %, consommation électrique +10 %   |
| Dirty                | Thrusters         | 5     | 1× Cadmium (R3), 1× Cracked Industrial Firmware (E3), 1× Pharmaceutical Isolators (M5)                            | multiplicateur optimal +40 %, charge thermique +60 %, intégrité du module −15 %, masse optimale −12,5 %, consommation électrique +12 % |
| Reinforced           | Thrusters         | 1     | 1× Carbon (R1)                                                                                                    | intégrité du module +30 %, charge thermique −10 %, masse +5 %                                                                          |
| Reinforced           | Thrusters         | 2     | 1× Heat Conduction Wiring (M1), 1× Vanadium (R2)                                                                  | intégrité du module +50 %, charge thermique −20 %, masse +10 %                                                                         |
| Reinforced           | Thrusters         | 3     | 1× Heat Conduction Wiring (M1), 1× Shielding Sensors (M3), 1× Vanadium (R2)                                       | intégrité du module +70 %, charge thermique −30 %, masse +15 %                                                                         |
| Reinforced           | Thrusters         | 4     | 1× Compound Shielding (M4), 1× Heat Dispersion Plate (M2), 1× High Density Composites (M3)                        | intégrité du module +90 %, charge thermique −40 %, masse +20 %                                                                         |
| Reinforced           | Thrusters         | 5     | 1× Heat Exchangers (M3), 1× Imperial Shielding (M5), 1× Proprietary Composites (M4)                               | intégrité du module +110 %, charge thermique −50 %, masse +25 %                                                                        |

#### Énergie — générateur d'énergie et distributeur d'énergie : coût en matériaux et effet, grade par grade

9 blueprints de cette famille, soit **45 couples blueprint × grade** : matériaux consommés par roll et effet atteint
une fois le grade validé. *(Source : EDCD/coriolis-data, `modifications/blueprints.json`, commit 0db9234b5b9c ; noms
de matériaux résolus par EDCD/FDevIDs, `material.csv`, commit c35612952dd6.)*

| Blueprint            | Module            | Grade | Matériaux par roll                                                                                    | Effet atteint à ce grade                                                                                                                          |
|----------------------|-------------------|-------|-------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| Charge Enhanced      | Power Distributor | 1     | 1× Specialised Legacy Firmware (E1)                                                                   | recharge ENG +9 %, recharge SYS +9 %, recharge WEP +9 %, capacité ENG −1 %, capacité SYS −1 %, capacité WEP −1 %                                  |
| Charge Enhanced      | Power Distributor | 2     | 1× Chemical Processors (M2), 1× Specialised Legacy Firmware (E1)                                      | recharge ENG +18 %, recharge SYS +18 %, recharge WEP +18 %, capacité ENG −2 %, capacité SYS −2 %, capacité WEP −2 %                               |
| Charge Enhanced      | Power Distributor | 3     | 1× Chemical Distillery (M3), 1× Grid Resistors (M1), 1× Modified Consumer Firmware (E2)               | recharge ENG +27 %, recharge SYS +27 %, recharge WEP +27 %, capacité ENG −3 %, capacité SYS −3 %, capacité WEP −3 %                               |
| Charge Enhanced      | Power Distributor | 4     | 1× Chemical Manipulators (M4), 1× Cracked Industrial Firmware (E3), 1× Hybrid Capacitors (M2)         | recharge ENG +36 %, recharge SYS +36 %, recharge WEP +36 %, capacité ENG −4 %, capacité SYS −4 %, capacité WEP −4 %                               |
| Charge Enhanced      | Power Distributor | 5     | 1× Chemical Manipulators (M4), 1× Cracked Industrial Firmware (E3), 1× Exquisite Focus Crystals (M5)  | recharge ENG +45 %, recharge SYS +45 %, recharge WEP +45 %, capacité ENG −5 %, capacité SYS −5 %, capacité WEP −5 %                               |
| Engine Focused       | Power Distributor | 1     | 1× Sulphur (R1)                                                                                       | capacité ENG +20 %, recharge ENG +16 %, capacité SYS −3 %, recharge SYS −3 %, capacité WEP −3 %, recharge WEP −1 %                                |
| Engine Focused       | Power Distributor | 2     | 1× Conductive Components (M2), 1× Sulphur (R1)                                                        | capacité ENG +30 %, recharge ENG +23 %, capacité SYS −6 %, recharge SYS −6 %, capacité WEP −6 %, recharge WEP −2 %                                |
| Engine Focused       | Power Distributor | 3     | 1× Anomalous Bulk Scan Data (E1), 1× Chromium (R2), 1× Electrochemical Arrays (M3)                    | capacité ENG +40 %, recharge ENG +30 %, capacité SYS −9 %, recharge SYS −9 %, capacité WEP −9 %, recharge WEP −3 %                                |
| Engine Focused       | Power Distributor | 4     | 1× Polymer Capacitors (M4), 1× Selenium (R4), 1× Unidentified Scan Archives (E2)                      | capacité ENG +50 %, recharge ENG +37 %, capacité SYS −12 %, recharge SYS −12 %, capacité WEP −12 %, recharge WEP −4 %                             |
| Engine Focused       | Power Distributor | 5     | 1× Cadmium (R3), 1× Classified Scan Databanks (E3), 1× Military Supercapacitors (M5)                  | capacité ENG +60 %, recharge ENG +44 %, capacité SYS −15 %, recharge SYS −15 %, capacité WEP −15 %, recharge WEP −5 %                             |
| High Charge Capacity | Power Distributor | 1     | 1× Sulphur (R1)                                                                                       | capacité ENG +10 %, intégrité du module +10 %, capacité SYS +10 %, capacité WEP +10 %, recharge ENG −2 %, recharge SYS −2 %, recharge WEP −2 %    |
| High Charge Capacity | Power Distributor | 2     | 1× Chromium (R2), 1× Specialised Legacy Firmware (E1)                                                 | capacité ENG +18 %, intégrité du module +18 %, capacité WEP +18 %, capacité SYS +10 %, recharge ENG −6 %, recharge SYS −6 %, recharge WEP −6 %    |
| High Charge Capacity | Power Distributor | 3     | 1× Chromium (R2), 1× High Density Composites (M3), 1× Specialised Legacy Firmware (E1)                | capacité ENG +26 %, capacité SYS +26 %, capacité WEP +26 %, intégrité du module +20 %, recharge ENG −10 %, recharge SYS −10 %, recharge WEP −10 % |
| High Charge Capacity | Power Distributor | 4     | 1× Modified Consumer Firmware (E2), 1× Proprietary Composites (M4), 1× Selenium (R4)                  | capacité ENG +34 %, capacité SYS +34 %, capacité WEP +34 %, intégrité du module +25 %, recharge ENG −14 %, recharge SYS −14 %, recharge WEP −14 % |
| High Charge Capacity | Power Distributor | 5     | 1× Cracked Industrial Firmware (E3), 1× Military Supercapacitors (M5), 1× Proprietary Composites (M4) | capacité ENG +42 %, capacité SYS +42 %, capacité WEP +42 %, intégrité du module +30 %, recharge ENG −18 %, recharge SYS −18 %, recharge WEP −18 % |
| Shielded             | Power Distributor | 1     | 1× Worn Shield Emitters (M1)                                                                          | intégrité du module +40 %, consommation électrique −10 %, masse +3 %                                                                              |
| Shielded             | Power Distributor | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                                               | intégrité du module +80 %, consommation électrique −15 %, masse +6 %                                                                              |
| Shielded             | Power Distributor | 3     | 1× Carbon (R1), 1× High Density Composites (M3), 1× Shield Emitters (M2)                              | intégrité du module +120 %, consommation électrique −20 %, masse +9 %                                                                             |
| Shielded             | Power Distributor | 4     | 1× Proprietary Composites (M4), 1× Shielding Sensors (M3), 1× Vanadium (R2)                           | intégrité du module +160 %, consommation électrique −25 %, masse +12 %                                                                            |
| Shielded             | Power Distributor | 5     | 1× Compound Shielding (M4), 1× Core Dynamics Composites (M5), 1× Tungsten (R3)                        | intégrité du module +200 %, consommation électrique −30 %, masse +15 %                                                                            |
| System Focused       | Power Distributor | 1     | 1× Sulphur (R1)                                                                                       | capacité SYS +20 %, recharge SYS +16 %, capacité ENG −3 %, capacité WEP −3 %, recharge WEP −3 %, recharge ENG −1 %                                |
| System Focused       | Power Distributor | 2     | 1× Conductive Components (M2), 1× Sulphur (R1)                                                        | capacité SYS +30 %, recharge SYS +23 %, capacité ENG −6 %, capacité WEP −6 %, recharge WEP −6 %, recharge ENG −2 %                                |
| System Focused       | Power Distributor | 3     | 1× Anomalous Bulk Scan Data (E1), 1× Chromium (R2), 1× Electrochemical Arrays (M3)                    | capacité SYS +40 %, recharge SYS +30 %, capacité ENG −9 %, capacité WEP −9 %, recharge WEP −9 %, recharge ENG −3 %                                |
| System Focused       | Power Distributor | 4     | 1× Polymer Capacitors (M4), 1× Selenium (R4), 1× Unidentified Scan Archives (E2)                      | capacité SYS +50 %, recharge SYS +37 %, capacité ENG −12 %, capacité WEP −12 %, recharge WEP −12 %, recharge ENG −4 %                             |
| System Focused       | Power Distributor | 5     | 1× Cadmium (R3), 1× Classified Scan Databanks (E3), 1× Military Supercapacitors (M5)                  | capacité SYS +60 %, recharge SYS +44 %, capacité ENG −15 %, capacité WEP −15 %, recharge WEP −15 %, recharge ENG −5 %                             |
| Weapon Focused       | Power Distributor | 1     | 1× Sulphur (R1)                                                                                       | capacité WEP +20 %, recharge WEP +16 %, capacité ENG −3 %, recharge ENG −3 %, capacité SYS −3 %, recharge SYS −1 %                                |
| Weapon Focused       | Power Distributor | 2     | 1× Conductive Components (M2), 1× Sulphur (R1)                                                        | capacité WEP +30 %, recharge WEP +23 %, capacité ENG −6 %, recharge ENG −6 %, capacité SYS −6 %, recharge SYS −2 %                                |
| Weapon Focused       | Power Distributor | 3     | 1× Anomalous Bulk Scan Data (E1), 1× Hybrid Capacitors (M2), 1× Selenium (R4)                         | capacité WEP +40 %, recharge WEP +30 %, capacité ENG −9 %, recharge ENG −9 %, capacité SYS −9 %, recharge SYS −3 %                                |
| Weapon Focused       | Power Distributor | 4     | 1× Cadmium (R3), 1× Electrochemical Arrays (M3), 1× Unidentified Scan Archives (E2)                   | capacité WEP +50 %, recharge WEP +37 %, capacité ENG −12 %, recharge ENG −12 %, capacité SYS −12 %, recharge SYS −4 %                             |
| Weapon Focused       | Power Distributor | 5     | 1× Classified Scan Databanks (E3), 1× Polymer Capacitors (M4), 1× Tellurium (R4)                      | capacité WEP +60 %, recharge WEP +44 %, capacité ENG −15 %, recharge ENG −15 %, capacité SYS −15 %, recharge SYS −5 %                             |
| Armoured             | Power Plant       | 1     | 1× Worn Shield Emitters (M1)                                                                          | intégrité du module +40 %, efficacité thermique −4 %, production d'énergie +4 %, masse +4 %                                                       |
| Armoured             | Power Plant       | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                                               | intégrité du module +60 %, efficacité thermique −6 %, production d'énergie +6 %, masse +8 %                                                       |
| Armoured             | Power Plant       | 3     | 1× Carbon (R1), 1× High Density Composites (M3), 1× Shield Emitters (M2)                              | intégrité du module +80 %, efficacité thermique −8 %, production d'énergie +8 %, masse +12 %                                                      |
| Armoured             | Power Plant       | 4     | 1× Proprietary Composites (M4), 1× Shielding Sensors (M3), 1× Vanadium (R2)                           | intégrité du module +100 %, efficacité thermique −10 %, production d'énergie +10 %, masse +16 %                                                   |
| Armoured             | Power Plant       | 5     | 1× Compound Shielding (M4), 1× Core Dynamics Composites (M5), 1× Tungsten (R3)                        | intégrité du module +120 %, efficacité thermique −12 %, production d'énergie +12 %, masse +20 %                                                   |
| Low Emissions        | Power Plant       | 1     | 1× Iron (R1)                                                                                          | efficacité thermique −25 %, masse +4 %, production d'énergie −3 %                                                                                 |
| Low Emissions        | Power Plant       | 2     | 1× Iron (R1), 1× Irregular Emission Data (E2)                                                         | efficacité thermique −35 %, masse +8 %, production d'énergie −6 %                                                                                 |
| Low Emissions        | Power Plant       | 3     | 1× Heat Exchangers (M3), 1× Iron (R1), 1× Irregular Emission Data (E2)                                | efficacité thermique −45 %, masse +12 %, production d'énergie −9 %                                                                                |
| Low Emissions        | Power Plant       | 4     | 1× Germanium (R2), 1× Heat Vanes (M4), 1× Unexpected Emission Data (E3)                               | efficacité thermique −55 %, masse +16 %, production d'énergie −12 %                                                                               |
| Low Emissions        | Power Plant       | 5     | 1× Decoded Emission Data (E4), 1× Niobium (R3), 1× Proto Heat Radiators (M5)                          | efficacité thermique −65 %, masse +20 %, production d'énergie −15 %                                                                               |
| Overcharged          | Power Plant       | 1     | 1× Sulphur (R1)                                                                                       | production d'énergie +12 %, efficacité thermique +5 %, intégrité du module −5 %                                                                   |
| Overcharged          | Power Plant       | 2     | 1× Conductive Components (M2), 1× Heat Conduction Wiring (M1)                                         | production d'énergie +19 %, efficacité thermique +10 %, intégrité du module −10 %                                                                 |
| Overcharged          | Power Plant       | 3     | 1× Conductive Components (M2), 1× Heat Conduction Wiring (M1), 1× Selenium (R4)                       | production d'énergie +26 %, efficacité thermique +15 %, intégrité du module −15 %                                                                 |
| Overcharged          | Power Plant       | 4     | 1× Cadmium (R3), 1× Conductive Ceramics (M3), 1× Heat Dispersion Plate (M2)                           | production d'énergie +33 %, efficacité thermique +20 %, intégrité du module −20 %                                                                 |
| Overcharged          | Power Plant       | 5     | 1× Chemical Manipulators (M4), 1× Conductive Ceramics (M3), 1× Tellurium (R4)                         | production d'énergie +40 %, efficacité thermique +25 %, intégrité du module −25 %                                                                 |

#### Boucliers — générateur, amplificateur et batterie de bouclier : coût en matériaux et effet, grade par grade

11 blueprints de cette famille, soit **53 couples blueprint × grade** : matériaux consommés par roll et effet atteint
une fois le grade validé. *(Source : EDCD/coriolis-data, `modifications/blueprints.json`, commit 0db9234b5b9c ; noms
de matériaux résolus par EDCD/FDevIDs, `material.csv`, commit c35612952dd6.)*

| Blueprint            | Module           | Grade | Matériaux par roll                                                                                              | Effet atteint à ce grade                                                                                                                                                                                  |
|----------------------|------------------|-------|-----------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Blast Resistant      | Shield Booster   | 1     | 1× Iron (R1)                                                                                                    | résistance explosive +7 pt, résistance cinétique −1 pt, résistance thermique −1 pt                                                                                                                        |
| Blast Resistant      | Shield Booster   | 2     | 1× Conductive Components (M2), 1× Iron (R1)                                                                     | résistance explosive +12 pt, résistance cinétique −1,75 pt, résistance thermique −1,75 pt                                                                                                                 |
| Blast Resistant      | Shield Booster   | 3     | 1× Conductive Components (M2), 1× Focus Crystals (M3), 1× Iron (R1)                                             | résistance explosive +17 pt, résistance cinétique −2,5 pt, résistance thermique −2,5 pt                                                                                                                   |
| Blast Resistant      | Shield Booster   | 4     | 1× Germanium (R2), 1× Refined Focus Crystals (M4), 1× Untypical Shield Scans (E3)                               | résistance explosive +22 pt, résistance cinétique −3,25 pt, résistance thermique −3,25 pt                                                                                                                 |
| Blast Resistant      | Shield Booster   | 5     | 1× Aberrant Shield Pattern Analysis (E4), 1× Exquisite Focus Crystals (M5), 1× Niobium (R3)                     | résistance explosive +27 pt, résistance cinétique −4 pt, résistance thermique −4 pt                                                                                                                       |
| Heavy Duty           | Shield Booster   | 1     | 1× Grid Resistors (M1)                                                                                          | bonus de bouclier +10 %, intégrité du module +3 %, masse +100 %, consommation électrique +5 %                                                                                                             |
| Heavy Duty           | Shield Booster   | 2     | 1× Distorted Shield Cycle Recordings (E1), 1× Hybrid Capacitors (M2)                                            | bonus de bouclier +17 %, intégrité du module +6 %, masse +150 %, consommation électrique +10 %                                                                                                            |
| Heavy Duty           | Shield Booster   | 3     | 1× Distorted Shield Cycle Recordings (E1), 1× Hybrid Capacitors (M2), 1× Niobium (R3)                           | bonus de bouclier +24 %, intégrité du module +9 %, masse +200 %, consommation électrique +15 %                                                                                                            |
| Heavy Duty           | Shield Booster   | 4     | 1× Electrochemical Arrays (M3), 1× Inconsistent Shield Soak Analysis (E2), 1× Tin (R3)                          | bonus de bouclier +31 %, intégrité du module +12 %, masse +250 %, consommation électrique +20 %                                                                                                           |
| Heavy Duty           | Shield Booster   | 5     | 1× Antimony (R4), 1× Polymer Capacitors (M4), 1× Untypical Shield Scans (E3)                                    | bonus de bouclier +38 %, intégrité du module +15 %, masse +300 %, consommation électrique +25 %                                                                                                           |
| Kinetic Resistant    | Shield Booster   | 1     | 1× Iron (R1)                                                                                                    | résistance cinétique +7 pt, résistance explosive −1 pt, résistance thermique −1 pt                                                                                                                        |
| Kinetic Resistant    | Shield Booster   | 2     | 1× Germanium (R2), 1× Grid Resistors (M1)                                                                       | résistance cinétique +12 pt, résistance explosive −1,75 pt, résistance thermique −1,75 pt                                                                                                                 |
| Kinetic Resistant    | Shield Booster   | 3     | 1× Focus Crystals (M3), 1× Hybrid Capacitors (M2), 1× Salvaged Alloys (M1)                                      | résistance cinétique +17 pt, résistance explosive −2,5 pt, résistance thermique −2,5 pt                                                                                                                   |
| Kinetic Resistant    | Shield Booster   | 4     | 1× Galvanising Alloys (M2), 1× Refined Focus Crystals (M4), 1× Untypical Shield Scans (E3)                      | résistance cinétique +22 pt, résistance explosive −3,25 pt, résistance thermique −3,25 pt                                                                                                                 |
| Kinetic Resistant    | Shield Booster   | 5     | 1× Aberrant Shield Pattern Analysis (E4), 1× Exquisite Focus Crystals (M5), 1× Phase Alloys (M3)                | résistance cinétique +27 pt, résistance explosive −4 pt, résistance thermique −4 pt                                                                                                                       |
| Resistance Augmented | Shield Booster   | 1     | 1× Phosphorus (R1)                                                                                              | résistance explosive +5 pt, résistance cinétique +5 pt, résistance thermique +5 pt, consommation électrique +5 %, intégrité du module −4 %                                                                |
| Resistance Augmented | Shield Booster   | 2     | 1× Conductive Components (M2), 1× Phosphorus (R1)                                                               | résistance explosive +8 pt, résistance cinétique +8 pt, résistance thermique +8 pt, consommation électrique +10 %, intégrité du module −6 %                                                               |
| Resistance Augmented | Shield Booster   | 3     | 1× Conductive Components (M2), 1× Focus Crystals (M3), 1× Phosphorus (R1)                                       | résistance explosive +11 pt, résistance cinétique +11 pt, résistance thermique +11 pt, consommation électrique +15 %, intégrité du module −8 %                                                            |
| Resistance Augmented | Shield Booster   | 4     | 1× Conductive Ceramics (M3), 1× Manganese (R2), 1× Refined Focus Crystals (M4)                                  | résistance explosive +14 pt, résistance cinétique +14 pt, résistance thermique +14 pt, consommation électrique +20 %, intégrité du module −10 %                                                           |
| Resistance Augmented | Shield Booster   | 5     | 1× Conductive Ceramics (M3), 1× Imperial Shielding (M5), 1× Refined Focus Crystals (M4)                         | résistance explosive +17 pt, résistance cinétique +17 pt, résistance thermique +17 pt, consommation électrique +25 %, intégrité du module −12 %                                                           |
| Thermal Resistant    | Shield Booster   | 1     | 1× Iron (R1)                                                                                                    | résistance thermique +7 pt, résistance explosive −1 pt, résistance cinétique −1 pt                                                                                                                        |
| Thermal Resistant    | Shield Booster   | 2     | 1× Germanium (R2), 1× Heat Conduction Wiring (M1)                                                               | résistance thermique +12 pt, résistance explosive −1,75 pt, résistance cinétique −1,75 pt                                                                                                                 |
| Thermal Resistant    | Shield Booster   | 3     | 1× Focus Crystals (M3), 1× Heat Conduction Wiring (M1), 1× Heat Dispersion Plate (M2)                           | résistance thermique +17 pt, résistance explosive −2,5 pt, résistance cinétique −2,5 pt                                                                                                                   |
| Thermal Resistant    | Shield Booster   | 4     | 1× Heat Dispersion Plate (M2), 1× Refined Focus Crystals (M4), 1× Untypical Shield Scans (E3)                   | résistance thermique +22 pt, résistance explosive −3,25 pt, résistance cinétique −3,25 pt                                                                                                                 |
| Thermal Resistant    | Shield Booster   | 5     | 1× Aberrant Shield Pattern Analysis (E4), 1× Exquisite Focus Crystals (M5), 1× Heat Exchangers (M3)             | résistance thermique +27 pt, résistance explosive −4 pt, résistance cinétique −4 pt                                                                                                                       |
| Rapid Charge         | Shield Cell Bank | 1     | 1× Sulphur (R1)                                                                                                 | temps de montée en charge −10 %, renfort de bouclier +5 %, temps d'amorçage +10 %, durée −6 %                                                                                                             |
| Rapid Charge         | Shield Cell Bank | 2     | 1× Chromium (R2), 1× Grid Resistors (M1)                                                                        | temps de montée en charge −20 %, renfort de bouclier +10 %, temps d'amorçage +15 %, durée −12 %                                                                                                           |
| Rapid Charge         | Shield Cell Bank | 3     | 1× Hybrid Capacitors (M2), 1× Precipitated Alloys (M3), 1× Sulphur (R1)                                         | temps de montée en charge −30 %, renfort de bouclier +15 %, temps d'amorçage +20 %, durée −18 %                                                                                                           |
| Rapid Charge         | Shield Cell Bank | 4     | 1× Hybrid Capacitors (M2), 1× Precipitated Alloys (M3), 1× Sulphur (R1)                                         | temps de montée en charge −40 %, renfort de bouclier +20 %, temps d'amorçage +25 %, durée −24 %                                                                                                           |
| Specialised          | Shield Cell Bank | 1     | 1× Specialised Legacy Firmware (E1)                                                                             | temps d'amorçage −8 %, charge thermique −6 %, renfort de bouclier +4 %, consommation électrique +10 %, intégrité du module −5 %                                                                           |
| Specialised          | Shield Cell Bank | 2     | 1× Conductive Components (M2), 1× Specialised Legacy Firmware (E1)                                              | temps d'amorçage −16 %, charge thermique −12 %, renfort de bouclier +6 %, consommation électrique +15 %, intégrité du module −10 %                                                                        |
| Specialised          | Shield Cell Bank | 3     | 1× Conductive Components (M2), 1× Cracked Industrial Firmware (E3), 1× Exceptional Scrambled Emission Data (E1) | temps d'amorçage −24 %, charge thermique −18 %, renfort de bouclier +8 %, consommation électrique +20 %, intégrité du module −15 %                                                                        |
| Specialised          | Shield Cell Bank | 4     | 1× Conductive Components (M2), 1× Cracked Industrial Firmware (E3), 1× Yttrium (R4)                             | temps d'amorçage −32 %, charge thermique −24 %, renfort de bouclier +10 %, consommation électrique +25 %, intégrité du module −20 %                                                                       |
| Enhanced Low Power   | Shield Generator | 1     | 1× Distorted Shield Cycle Recordings (E1)                                                                       | consommation électrique −20 %, masse −18 %, multiplicateur optimal +3 %, intégrité du module −5 %, masse optimale −2 %                                                                                    |
| Enhanced Low Power   | Shield Generator | 2     | 1× Distorted Shield Cycle Recordings (E1), 1× Germanium (R2)                                                    | masse −26 %, consommation électrique −25 %, multiplicateur optimal +6 %, intégrité du module −10 %, masse optimale −3 %                                                                                   |
| Enhanced Low Power   | Shield Generator | 3     | 1× Distorted Shield Cycle Recordings (E1), 1× Germanium (R2), 1× Precipitated Alloys (M3)                       | masse −34 %, consommation électrique −30 %, multiplicateur optimal +9 %, intégrité du module −15 %, masse optimale −4 %                                                                                   |
| Enhanced Low Power   | Shield Generator | 4     | 1× Inconsistent Shield Soak Analysis (E2), 1× Niobium (R3), 1× Thermic Alloys (M4)                              | masse −42 %, consommation électrique −35 %, multiplicateur optimal +12 %, intégrité du module −20 %, masse optimale −5 %                                                                                  |
| Enhanced Low Power   | Shield Generator | 5     | 1× Military Grade Alloys (M5), 1× Tin (R3), 1× Untypical Shield Scans (E3)                                      | masse −50 %, consommation électrique −40 %, multiplicateur optimal +15 %, intégrité du module −25 %, masse optimale −6 %                                                                                  |
| Kinetic Resistant    | Shield Generator | 1     | 1× Distorted Shield Cycle Recordings (E1)                                                                       | intégrité du module +20 %, résistance cinétique +10 pt, résistance thermique −3 pt                                                                                                                        |
| Kinetic Resistant    | Shield Generator | 2     | 1× Distorted Shield Cycle Recordings (E1), 1× Modified Consumer Firmware (E2)                                   | intégrité du module +25 %, résistance cinétique +20 pt, résistance thermique −6 pt                                                                                                                        |
| Kinetic Resistant    | Shield Generator | 3     | 1× Distorted Shield Cycle Recordings (E1), 1× Modified Consumer Firmware (E2), 1× Selenium (R4)                 | intégrité du module +30 %, résistance cinétique +30 pt, résistance thermique −9 pt                                                                                                                        |
| Kinetic Resistant    | Shield Generator | 4     | 1× Focus Crystals (M3), 1× Inconsistent Shield Soak Analysis (E2), 1× Mercury (R3)                              | résistance cinétique +40 pt, intégrité du module +35 %, résistance thermique −12 pt                                                                                                                       |
| Kinetic Resistant    | Shield Generator | 5     | 1× Refined Focus Crystals (M4), 1× Ruthenium (R4), 1× Untypical Shield Scans (E3)                               | résistance cinétique +50 pt, intégrité du module +40 %, résistance thermique −15 pt                                                                                                                       |
| Reinforced           | Shield Generator | 1     | 1× Phosphorus (R1)                                                                                              | multiplicateur optimal +14 %, résistance explosive +4,5 pt, résistance cinétique +4,5 pt, résistance thermique +4,5 pt, régénération bouclier hors ligne −10 %, énergie prélevée au distributeur +4 %     |
| Reinforced           | Shield Generator | 2     | 1× Conductive Components (M2), 1× Phosphorus (R1)                                                               | multiplicateur optimal +20 %, résistance explosive +7,5 pt, résistance cinétique +7,5 pt, résistance thermique +7,5 pt, régénération bouclier hors ligne −10 %, énergie prélevée au distributeur +6 %     |
| Reinforced           | Shield Generator | 3     | 1× Conductive Components (M2), 1× Mechanical Components (M3), 1× Phosphorus (R1)                                | multiplicateur optimal +26 %, résistance explosive +10,5 pt, résistance cinétique +10,5 pt, résistance thermique +10,5 pt, régénération bouclier hors ligne −10 %, énergie prélevée au distributeur +8 %  |
| Reinforced           | Shield Generator | 4     | 1× Conductive Ceramics (M3), 1× Configurable Components (M4), 1× Manganese (R2)                                 | multiplicateur optimal +32 %, résistance explosive +13,5 pt, résistance cinétique +13,5 pt, résistance thermique +13,5 pt, régénération bouclier hors ligne −10 %, énergie prélevée au distributeur +10 % |
| Reinforced           | Shield Generator | 5     | 1× Arsenic (R2), 1× Conductive Polymers (M4), 1× Improvised Components (M5)                                     | multiplicateur optimal +38 %, résistance explosive +16,5 pt, résistance cinétique +16,5 pt, résistance thermique +16,5 pt, énergie prélevée au distributeur +12 %, régénération bouclier hors ligne −10 % |
| Thermal Resistant    | Shield Generator | 1     | 1× Distorted Shield Cycle Recordings (E1)                                                                       | intégrité du module +20 %, résistance thermique +10 pt, résistance cinétique −4 pt                                                                                                                        |
| Thermal Resistant    | Shield Generator | 2     | 1× Distorted Shield Cycle Recordings (E1), 1× Germanium (R2)                                                    | intégrité du module +25 %, résistance thermique +20 pt, résistance cinétique −8 pt                                                                                                                        |
| Thermal Resistant    | Shield Generator | 3     | 1× Distorted Shield Cycle Recordings (E1), 1× Germanium (R2), 1× Selenium (R4)                                  | intégrité du module +30 %, résistance thermique +30 pt, résistance cinétique −12 pt                                                                                                                       |
| Thermal Resistant    | Shield Generator | 4     | 1× Focus Crystals (M3), 1× Inconsistent Shield Soak Analysis (E2), 1× Mercury (R3)                              | résistance thermique +40 pt, intégrité du module +35 %, résistance cinétique −16 pt                                                                                                                       |
| Thermal Resistant    | Shield Generator | 5     | 1× Refined Focus Crystals (M4), 1× Ruthenium (R4), 1× Untypical Shield Scans (E3)                               | résistance thermique +50 pt, intégrité du module +40 %, résistance cinétique −20 pt                                                                                                                       |

#### Coque et blindage — bulkheads et renforts de coque : coût en matériaux et effet, grade par grade

10 blueprints de cette famille, soit **50 couples blueprint × grade** : matériaux consommés par roll et effet atteint
une fois le grade validé. *(Source : EDCD/coriolis-data, `modifications/blueprints.json`, commit 0db9234b5b9c ; noms
de matériaux résolus par EDCD/FDevIDs, `material.csv`, commit c35612952dd6.)*

| Blueprint         | Module                     | Grade | Matériaux par roll                                                             | Effet atteint à ce grade                                                                                                   |
|-------------------|----------------------------|-------|--------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| Blast Resistant   | Bulkheads (armure)         | 1     | 1× Nickel (R1)                                                                 | résistance explosive +12 pt, résistance cinétique −4 pt, résistance thermique −4 pt                                        |
| Blast Resistant   | Bulkheads (armure)         | 2     | 1× Carbon (R1), 1× Zinc (R2)                                                   | résistance explosive +19 pt, résistance cinétique −6 pt, résistance thermique −6 pt                                        |
| Blast Resistant   | Bulkheads (armure)         | 3     | 1× Salvaged Alloys (M1), 1× Vanadium (R2)                                      | résistance explosive +26 pt, résistance cinétique −8 pt, résistance thermique −8 pt                                        |
| Blast Resistant   | Bulkheads (armure)         | 4     | 1× Galvanising Alloys (M2), 1× Mercury (R3), 1× Tungsten (R3)                  | résistance explosive +33 pt, résistance cinétique −10 pt, résistance thermique −10 pt                                      |
| Blast Resistant   | Bulkheads (armure)         | 5     | 1× Molybdenum (R3), 1× Phase Alloys (M3), 1× Ruthenium (R4)                    | résistance explosive +40 pt, résistance cinétique −12 pt, résistance thermique −12 pt                                      |
| Heavy Duty        | Bulkheads (armure)         | 1     | 1× Carbon (R1)                                                                 | bonus de coque +12 %, résistance explosive +1 pt, résistance cinétique +1 pt, résistance thermique +1 pt, masse +10 %      |
| Heavy Duty        | Bulkheads (armure)         | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                        | bonus de coque +17 %, résistance explosive +2 pt, résistance cinétique +2 pt, résistance thermique +2 pt, masse +15 %      |
| Heavy Duty        | Bulkheads (armure)         | 3     | 1× Carbon (R1), 1× High Density Composites (M3), 1× Shield Emitters (M2)       | bonus de coque +22 %, résistance explosive +3 pt, résistance cinétique +3 pt, résistance thermique +3 pt, masse +20 %      |
| Heavy Duty        | Bulkheads (armure)         | 4     | 1× Proprietary Composites (M4), 1× Shielding Sensors (M3), 1× Vanadium (R2)    | bonus de coque +27 %, résistance explosive +4 pt, résistance cinétique +4 pt, résistance thermique +4 pt, masse +25 %      |
| Heavy Duty        | Bulkheads (armure)         | 5     | 1× Compound Shielding (M4), 1× Core Dynamics Composites (M5), 1× Tungsten (R3) | bonus de coque +32 %, résistance explosive +5 pt, résistance cinétique +5 pt, résistance thermique +5 pt, masse +30 %      |
| Kinetic Resistant | Bulkheads (armure)         | 1     | 1× Nickel (R1)                                                                 | résistance cinétique +12 pt, résistance explosive −4 pt, résistance thermique −4 pt                                        |
| Kinetic Resistant | Bulkheads (armure)         | 2     | 1× Nickel (R1), 1× Vanadium (R2)                                               | résistance cinétique +19 pt, résistance explosive −6 pt, résistance thermique −6 pt                                        |
| Kinetic Resistant | Bulkheads (armure)         | 3     | 1× High Density Composites (M3), 1× Salvaged Alloys (M1), 1× Vanadium (R2)     | résistance cinétique +26 pt, résistance explosive −8 pt, résistance thermique −8 pt                                        |
| Kinetic Resistant | Bulkheads (armure)         | 4     | 1× Galvanising Alloys (M2), 1× Proprietary Composites (M4), 1× Tungsten (R3)   | résistance cinétique +33 pt, résistance explosive −10 pt, résistance thermique −10 pt                                      |
| Kinetic Resistant | Bulkheads (armure)         | 5     | 1× Core Dynamics Composites (M5), 1× Molybdenum (R3), 1× Phase Alloys (M3)     | résistance cinétique +40 pt, résistance explosive −12 pt, résistance thermique −12 pt                                      |
| Lightweight       | Bulkheads (armure)         | 1     | 1× Iron (R1)                                                                   | masse −15 %, résistance explosive +3 pt, résistance cinétique +3 pt, résistance thermique +3 pt, bonus de coque −1 %       |
| Lightweight       | Bulkheads (armure)         | 2     | 1× Conductive Components (M2), 1× Iron (R1)                                    | masse −25 %, résistance explosive +6 pt, résistance cinétique +6 pt, résistance thermique +6 pt, bonus de coque −2 %       |
| Lightweight       | Bulkheads (armure)         | 3     | 1× Conductive Components (M2), 1× High Density Composites (M3), 1× Iron (R1)   | masse −35 %, résistance explosive +9 pt, résistance cinétique +9 pt, résistance thermique +9 pt, bonus de coque −3 %       |
| Lightweight       | Bulkheads (armure)         | 4     | 1× Conductive Ceramics (M3), 1× Germanium (R2), 1× Proprietary Composites (M4) | masse −45 %, résistance explosive +12 pt, résistance cinétique +12 pt, résistance thermique +12 pt, bonus de coque −4 %    |
| Lightweight       | Bulkheads (armure)         | 5     | 1× Conductive Ceramics (M3), 1× Military Grade Alloys (M5), 1× Tin (R3)        | masse −55 %, résistance explosive +15 pt, résistance cinétique +15 pt, résistance thermique +15 pt, bonus de coque −5 %    |
| Thermal Resistant | Bulkheads (armure)         | 1     | 1× Heat Conduction Wiring (M1)                                                 | résistance thermique +12 pt, résistance explosive −4 pt, résistance cinétique −4 pt                                        |
| Thermal Resistant | Bulkheads (armure)         | 2     | 1× Heat Dispersion Plate (M2), 1× Nickel (R1)                                  | résistance thermique +19 pt, résistance explosive −6 pt, résistance cinétique −6 pt                                        |
| Thermal Resistant | Bulkheads (armure)         | 3     | 1× Heat Exchangers (M3), 1× Salvaged Alloys (M1), 1× Vanadium (R2)             | résistance thermique +26 pt, résistance explosive −8 pt, résistance cinétique −8 pt                                        |
| Thermal Resistant | Bulkheads (armure)         | 4     | 1× Galvanising Alloys (M2), 1× Heat Vanes (M4), 1× Tungsten (R3)               | résistance thermique +33 pt, résistance explosive −10 pt, résistance cinétique −10 pt                                      |
| Thermal Resistant | Bulkheads (armure)         | 5     | 1× Molybdenum (R3), 1× Phase Alloys (M3), 1× Proto Heat Radiators (M5)         | résistance thermique +40 pt, résistance explosive −12 pt, résistance cinétique −12 pt                                      |
| Blast Resistant   | Hull Reinforcement Package | 1     | 1× Nickel (R1)                                                                 | résistance explosive +12 pt, renfort de coque +3 %, résistance cinétique −2 pt, résistance thermique −2 pt                 |
| Blast Resistant   | Hull Reinforcement Package | 2     | 1× Carbon (R1), 1× Zinc (R2)                                                   | résistance explosive +19 pt, renfort de coque +6 %, résistance cinétique −4 pt, résistance thermique −4 pt                 |
| Blast Resistant   | Hull Reinforcement Package | 3     | 1× Salvaged Alloys (M1), 1× Vanadium (R2), 1× Zirconium (R2)                   | résistance explosive +26 pt, renfort de coque +9 %, résistance cinétique −6 pt, résistance thermique −6 pt                 |
| Blast Resistant   | Hull Reinforcement Package | 4     | 1× Galvanising Alloys (M2), 1× Mercury (R3), 1× Tungsten (R3)                  | résistance explosive +33 pt, renfort de coque +12 %, résistance cinétique −8 pt, résistance thermique −8 pt                |
| Blast Resistant   | Hull Reinforcement Package | 5     | 1× Molybdenum (R3), 1× Phase Alloys (M3), 1× Ruthenium (R4)                    | résistance explosive +40 pt, renfort de coque +15 %, résistance cinétique −10 pt, résistance thermique −10 pt              |
| Heavy Duty        | Hull Reinforcement Package | 1     | 1× Carbon (R1)                                                                 | renfort de coque +24 %, résistance explosive +3 pt, résistance cinétique +3 pt, résistance thermique +3 pt, masse +8 %     |
| Heavy Duty        | Hull Reinforcement Package | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                        | renfort de coque +36 %, résistance explosive +6 pt, résistance cinétique +6 pt, résistance thermique +6 pt, masse +16 %    |
| Heavy Duty        | Hull Reinforcement Package | 3     | 1× Carbon (R1), 1× High Density Composites (M3), 1× Shield Emitters (M2)       | renfort de coque +48 %, résistance explosive +9 pt, résistance cinétique +9 pt, résistance thermique +9 pt, masse +24 %    |
| Heavy Duty        | Hull Reinforcement Package | 4     | 1× Proprietary Composites (M4), 1× Shielding Sensors (M3), 1× Vanadium (R2)    | renfort de coque +60 %, résistance explosive +12 pt, résistance cinétique +12 pt, résistance thermique +12 pt, masse +32 % |
| Heavy Duty        | Hull Reinforcement Package | 5     | 1× Compound Shielding (M4), 1× Core Dynamics Composites (M5), 1× Tungsten (R3) | renfort de coque +72 %, résistance explosive +15 pt, résistance cinétique +15 pt, résistance thermique +15 pt, masse +40 % |
| Kinetic Resistant | Hull Reinforcement Package | 1     | 1× Nickel (R1)                                                                 | résistance cinétique +12 pt, renfort de coque +3 %, résistance explosive −2 pt, résistance thermique −2 pt                 |
| Kinetic Resistant | Hull Reinforcement Package | 2     | 1× Nickel (R1), 1× Vanadium (R2)                                               | résistance cinétique +19 pt, renfort de coque +6 %, résistance explosive −4 pt, résistance thermique −4 pt                 |
| Kinetic Resistant | Hull Reinforcement Package | 3     | 1× High Density Composites (M3), 1× Salvaged Alloys (M1), 1× Vanadium (R2)     | résistance cinétique +26 pt, renfort de coque +9 %, résistance explosive −6 pt, résistance thermique −6 pt                 |
| Kinetic Resistant | Hull Reinforcement Package | 4     | 1× Galvanising Alloys (M2), 1× Proprietary Composites (M4), 1× Tungsten (R3)   | résistance cinétique +33 pt, renfort de coque +12 %, résistance explosive −8 pt, résistance thermique −8 pt                |
| Kinetic Resistant | Hull Reinforcement Package | 5     | 1× Core Dynamics Composites (M5), 1× Molybdenum (R3), 1× Phase Alloys (M3)     | résistance cinétique +40 pt, renfort de coque +15 %, résistance explosive −10 pt, résistance thermique −10 pt              |
| Lightweight       | Hull Reinforcement Package | 1     | 1× Iron (R1)                                                                   | bonus de coque +8 %, masse −8 %, renfort de coque −4 %                                                                     |
| Lightweight       | Hull Reinforcement Package | 2     | 1× Conductive Components (M2), 1× Iron (R1)                                    | bonus de coque +12 %, masse −12 %, renfort de coque −8 %                                                                   |
| Lightweight       | Hull Reinforcement Package | 3     | 1× Conductive Components (M2), 1× High Density Composites (M3), 1× Iron (R1)   | bonus de coque +16 %, masse −16 %, renfort de coque −12 %                                                                  |
| Lightweight       | Hull Reinforcement Package | 4     | 1× Conductive Ceramics (M3), 1× Germanium (R2), 1× Proprietary Composites (M4) | bonus de coque +20 %, masse −20 %, renfort de coque −16 %                                                                  |
| Lightweight       | Hull Reinforcement Package | 5     | 1× Conductive Ceramics (M3), 1× Military Grade Alloys (M5), 1× Tin (R3)        | bonus de coque +24 %, masse −24 %, renfort de coque −20 %                                                                  |
| Thermal Resistant | Hull Reinforcement Package | 1     | 1× Heat Conduction Wiring (M1)                                                 | résistance thermique +12 pt, renfort de coque +3 %, résistance explosive −2 pt, résistance cinétique −2 pt                 |
| Thermal Resistant | Hull Reinforcement Package | 2     | 1× Heat Dispersion Plate (M2), 1× Nickel (R1)                                  | résistance thermique +19 pt, renfort de coque +6 %, résistance explosive −4 pt, résistance cinétique −4 pt                 |
| Thermal Resistant | Hull Reinforcement Package | 3     | 1× Heat Exchangers (M3), 1× Salvaged Alloys (M1), 1× Vanadium (R2)             | résistance thermique +26 pt, renfort de coque +9 %, résistance explosive −6 pt, résistance cinétique −6 pt                 |
| Thermal Resistant | Hull Reinforcement Package | 4     | 1× Galvanising Alloys (M2), 1× Heat Vanes (M4), 1× Tungsten (R3)               | résistance thermique +33 pt, renfort de coque +12 %, résistance explosive −8 pt, résistance cinétique −8 pt                |
| Thermal Resistant | Hull Reinforcement Package | 5     | 1× Molybdenum (R3), 1× Phase Alloys (M3), 1× Proto Heat Radiators (M5)         | résistance thermique +40 pt, renfort de coque +15 %, résistance explosive −10 pt, résistance cinétique −10 pt              |

#### Armement — les onze blueprints d'armes : coût en matériaux et effet, grade par grade

Onze blueprints — dix génériques, plus un *Overcharged* propre au multi-canon —, soit **55 couples blueprint × grade** : matériaux consommés par roll et effet atteint
une fois le grade validé. *(Source : EDCD/coriolis-data, `modifications/blueprints.json`, commit 0db9234b5b9c ; noms
de matériaux résolus par EDCD/FDevIDs, `material.csv`, commit c35612952dd6.)*

| Blueprint     | Module                              | Grade | Matériaux par roll                                                                                   | Effet atteint à ce grade                                                                                                               |
|---------------|-------------------------------------|-------|------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Double Shot   | Armes (blueprint générique)         | 1     | 1× Carbon (R1)                                                                                       | cadence en rafale = 6, tirs par rafale = 2, chargeur +34 %, portée −2 %                                                                |
| Double Shot   | Armes (blueprint générique)         | 2     | 1× Carbon (R1), 1× Mechanical Equipment (M2)                                                         | cadence en rafale = 8, tirs par rafale = 2, chargeur +34 %, portée −4 %                                                                |
| Double Shot   | Armes (blueprint générique)         | 3     | 1× Carbon (R1), 1× Cracked Industrial Firmware (E3), 1× Mechanical Equipment (M2)                    | cadence en rafale = 10, tirs par rafale = 2, chargeur +34 %, portée −6 %                                                               |
| Double Shot   | Armes (blueprint générique)         | 4     | 1× Mechanical Components (M3), 1× Security Firmware Patch (E4), 1× Vanadium (R2)                     | cadence en rafale = 12, tirs par rafale = 2, chargeur +34 %, portée −8 %                                                               |
| Double Shot   | Armes (blueprint générique)         | 5     | 1× Configurable Components (M4), 1× High Density Composites (M3), 1× Modified Embedded Firmware (E5) | cadence en rafale = 14, tirs par rafale = 2, chargeur +100 %, portée −10 %                                                             |
| Efficient     | Armes (blueprint générique)         | 1     | 1× Sulphur (R1)                                                                                      | charge thermique −38 %, dégâts +8 %                                                                                                    |
| Efficient     | Armes (blueprint générique)         | 2     | 1× Heat Dispersion Plate (M2), 1× Sulphur (R1)                                                       | charge thermique −43 %, énergie prélevée au distributeur −15 %, dégâts +12 %, consommation électrique −12 %                            |
| Efficient     | Armes (blueprint générique)         | 3     | 1× Chromium (R2), 1× Exceptional Scrambled Emission Data (E1), 1× Heat Exchangers (M3)               | charge thermique −48 %, énergie prélevée au distributeur −25 %, consommation électrique −24 %, dégâts +16 %                            |
| Efficient     | Armes (blueprint générique)         | 4     | 1× Heat Vanes (M4), 1× Irregular Emission Data (E2), 1× Selenium (R4)                                | charge thermique −52 %, consommation électrique −36 %, énergie prélevée au distributeur −35 %, dégâts +20 %                            |
| Efficient     | Armes (blueprint générique)         | 5     | 1× Cadmium (R3), 1× Proto Heat Radiators (M5), 1× Unexpected Emission Data (E3)                      | charge thermique −60 %, consommation électrique −48 %, énergie prélevée au distributeur −45 %, dégâts +24 %                            |
| Focused       | Armes (blueprint générique)         | 1     | 1× Iron (R1)                                                                                         | pénétration d'armure +40 %, distance de perte d'efficacité +36 %, portée +36 %, vitesse de projectile +36 %, charge thermique +1 %     |
| Focused       | Armes (blueprint générique)         | 2     | 1× Conductive Components (M2), 1× Iron (R1)                                                          | pénétration d'armure +60 %, distance de perte d'efficacité +52 %, portée +52 %, vitesse de projectile +52 %, charge thermique +2 %     |
| Focused       | Armes (blueprint générique)         | 3     | 1× Chromium (R2), 1× Conductive Ceramics (M3), 1× Iron (R1)                                          | pénétration d'armure +80 %, distance de perte d'efficacité +68 %, portée +68 %, vitesse de projectile +68 %, charge thermique +3 %     |
| Focused       | Armes (blueprint générique)         | 4     | 1× Focus Crystals (M3), 1× Germanium (R2), 1× Polymer Capacitors (M4)                                | pénétration d'armure +100 %, distance de perte d'efficacité +84 %, portée +84 %, vitesse de projectile +84 %, charge thermique +4 %    |
| Focused       | Armes (blueprint générique)         | 5     | 1× Military Supercapacitors (M5), 1× Niobium (R3), 1× Refined Focus Crystals (M4)                    | pénétration d'armure +120 %, distance de perte d'efficacité +100 %, portée +100 %, vitesse de projectile +100 %, charge thermique +5 % |
| High Capacity | Armes (blueprint générique)         | 1     | 1× Mechanical Scrap (M1)                                                                             | réserve de munitions +36 %, chargeur +36 %, cadence de tir −2 %, masse +20 %, consommation électrique +4 %                             |
| High Capacity | Armes (blueprint générique)         | 2     | 1× Mechanical Scrap (M1), 1× Vanadium (R2)                                                           | réserve de munitions +52 %, chargeur +52 %, cadence de tir −4 %, masse +30 %, consommation électrique +8 %                             |
| High Capacity | Armes (blueprint générique)         | 3     | 1× Mechanical Scrap (M1), 1× Niobium (R3), 1× Vanadium (R2)                                          | réserve de munitions +68 %, chargeur +68 %, cadence de tir −6 %, masse +40 %, consommation électrique +12 %                            |
| High Capacity | Armes (blueprint générique)         | 4     | 1× High Density Composites (M3), 1× Mechanical Equipment (M2), 1× Tin (R3)                           | réserve de munitions +84 %, chargeur +84 %, cadence de tir −8 %, masse +50 %, consommation électrique +16 %                            |
| High Capacity | Armes (blueprint générique)         | 5     | 1× Mechanical Components (M3), 1× Military Supercapacitors (M5), 1× Proprietary Composites (M4)      | réserve de munitions +100 %, chargeur +100 %, cadence de tir −10 %, masse +60 %, consommation électrique +20 %                         |
| Lightweight   | Armes (blueprint générique)         | 1     | 1× Phosphorus (R1)                                                                                   | masse −30 %, intégrité du module −20 %                                                                                                 |
| Lightweight   | Armes (blueprint générique)         | 2     | 1× Manganese (R2), 1× Salvaged Alloys (M1)                                                           | masse −45 %, énergie prélevée au distributeur −20 %, consommation électrique −10 %, intégrité du module −30 %                          |
| Lightweight   | Armes (blueprint générique)         | 3     | 1× Conductive Ceramics (M3), 1× Manganese (R2), 1× Salvaged Alloys (M1)                              | masse −60 %, énergie prélevée au distributeur −25 %, consommation électrique −20 %, intégrité du module −40 %                          |
| Lightweight   | Armes (blueprint générique)         | 4     | 1× Conductive Components (M2), 1× Phase Alloys (M3), 1× Proto Light Alloys (M4)                      | masse −75 %, énergie prélevée au distributeur −30 %, consommation électrique −30 %, intégrité du module −50 %                          |
| Lightweight   | Armes (blueprint générique)         | 5     | 1× Conductive Ceramics (M3), 1× Proto Light Alloys (M4), 1× Proto Radiolic Alloys (M5)               | masse −90 %, consommation électrique −40 %, énergie prélevée au distributeur −35 %, intégrité du module −60 %                          |
| Long Range    | Armes (blueprint générique)         | 1     | 1× Sulphur (R1)                                                                                      | portée +20 %, vitesse de projectile +20 %, perte d'efficacité calée sur la portée = 0,2, masse +10 %, consommation électrique +3 %     |
| Long Range    | Armes (blueprint générique)         | 2     | 1× Modified Consumer Firmware (E2), 1× Sulphur (R1)                                                  | portée +40 %, vitesse de projectile +40 %, perte d'efficacité calée sur la portée = 0,4, masse +15 %, consommation électrique +6 %     |
| Long Range    | Armes (blueprint générique)         | 3     | 1× Focus Crystals (M3), 1× Modified Consumer Firmware (E2), 1× Sulphur (R1)                          | portée +60 %, vitesse de projectile +60 %, perte d'efficacité calée sur la portée = 0,6, masse +20 %, consommation électrique +9 %     |
| Long Range    | Armes (blueprint générique)         | 4     | 1× Conductive Polymers (M4), 1× Focus Crystals (M3), 1× Modified Consumer Firmware (E2)              | portée +80 %, vitesse de projectile +80 %, perte d'efficacité calée sur la portée = 0,8, masse +25 %, consommation électrique +12 %    |
| Long Range    | Armes (blueprint générique)         | 5     | 1× Biotech Conductors (M5), 1× Cracked Industrial Firmware (E3), 1× Thermic Alloys (M4)              | portée +100 %, vitesse de projectile +100 %, perte d'efficacité calée sur la portée = 1, masse +30 %, consommation électrique +15 %    |
| Overcharged   | Multi-Cannon, Advanced Multi-Cannon | 1     | 1× Nickel (R1)                                                                                       | dégâts +30 %, énergie prélevée au distributeur +15 %, chargeur −3 %, charge thermique +3 %                                             |
| Overcharged   | Multi-Cannon, Advanced Multi-Cannon | 2     | 1× Conductive Components (M2), 1× Nickel (R1)                                                        | dégâts +40 %, énergie prélevée au distributeur +20 %, chargeur −6 %, charge thermique +6 %                                             |
| Overcharged   | Multi-Cannon, Advanced Multi-Cannon | 3     | 1× Conductive Components (M2), 1× Electrochemical Arrays (M3), 1× Nickel (R1)                        | dégâts +50 %, énergie prélevée au distributeur +25 %, chargeur −9 %, charge thermique +9 %                                             |
| Overcharged   | Multi-Cannon, Advanced Multi-Cannon | 4     | 1× Conductive Ceramics (M3), 1× Polymer Capacitors (M4), 1× Zinc (R2)                                | dégâts +60 %, énergie prélevée au distributeur +30 %, chargeur −12 %, charge thermique +12 %                                           |
| Overcharged   | Multi-Cannon, Advanced Multi-Cannon | 5     | 1× Conductive Polymers (M4), 1× Modified Embedded Firmware (E5), 1× Zirconium (R2)                   | dégâts +70 %, énergie prélevée au distributeur +35 %, chargeur −15 %, charge thermique +15 %                                           |
| Overcharged   | Armes (blueprint générique)         | 1     | 1× Nickel (R1)                                                                                       | dégâts +30 %, énergie prélevée au distributeur +15 %, charge thermique +3 %                                                            |
| Overcharged   | Armes (blueprint générique)         | 2     | 1× Conductive Components (M2), 1× Nickel (R1)                                                        | dégâts +40 %, énergie prélevée au distributeur +20 %, charge thermique +6 %                                                            |
| Overcharged   | Armes (blueprint générique)         | 3     | 1× Conductive Components (M2), 1× Electrochemical Arrays (M3), 1× Nickel (R1)                        | dégâts +50 %, énergie prélevée au distributeur +25 %, charge thermique +9 %                                                            |
| Overcharged   | Armes (blueprint générique)         | 4     | 1× Conductive Ceramics (M3), 1× Polymer Capacitors (M4), 1× Zinc (R2)                                | dégâts +60 %, énergie prélevée au distributeur +30 %, charge thermique +12 %                                                           |
| Overcharged   | Armes (blueprint générique)         | 5     | 1× Conductive Polymers (M4), 1× Modified Embedded Firmware (E5), 1× Zirconium (R2)                   | dégâts +70 %, énergie prélevée au distributeur +35 %, charge thermique +15 %                                                           |
| Rapid Fire    | Armes (blueprint générique)         | 1     | 1× Mechanical Scrap (M1)                                                                             | temps de rechargement −25 %, cadence de tir −8 %, dispersion +0,5, dégâts −1 %                                                         |
| Rapid Fire    | Armes (blueprint générique)         | 2     | 1× Heat Dispersion Plate (M2), 1× Mechanical Scrap (M1)                                              | temps de rechargement −35 %, cadence de tir −17 %, énergie prélevée au distributeur −5 %, dispersion +0,5, dégâts −2 %                 |
| Rapid Fire    | Armes (blueprint générique)         | 3     | 1× Mechanical Equipment (M2), 1× Precipitated Alloys (M3), 1× Specialised Legacy Firmware (E1)       | temps de rechargement −45 %, cadence de tir −26 %, énergie prélevée au distributeur −15 %, dispersion +0,5, dégâts −3 %                |
| Rapid Fire    | Armes (blueprint générique)         | 4     | 1× Mechanical Components (M3), 1× Modified Consumer Firmware (E2), 1× Thermic Alloys (M4)            | temps de rechargement −55 %, cadence de tir −35 %, énergie prélevée au distributeur −25 %, dispersion +0,5, dégâts −4 %                |
| Rapid Fire    | Armes (blueprint générique)         | 5     | 1× Configurable Components (M4), 1× Precipitated Alloys (M3), 1× Technetium (R4)                     | temps de rechargement −65 %, cadence de tir −44 %, énergie prélevée au distributeur −35 %, dispersion +0,5, dégâts −5 %                |
| Short Range   | Armes (blueprint générique)         | 1     | 1× Nickel (R1)                                                                                       | dégâts +27 %, portée −10 %                                                                                                             |
| Short Range   | Armes (blueprint générique)         | 2     | 1× Modified Consumer Firmware (E2), 1× Nickel (R1)                                                   | dégâts +39 %, portée −20 %, charge thermique +10 %                                                                                     |
| Short Range   | Armes (blueprint générique)         | 3     | 1× Electrochemical Arrays (M3), 1× Modified Consumer Firmware (E2), 1× Nickel (R1)                   | dégâts +51 %, portée −30 %, charge thermique +20 %                                                                                     |
| Short Range   | Armes (blueprint générique)         | 4     | 1× Conductive Polymers (M4), 1× Electrochemical Arrays (M3), 1× Modified Consumer Firmware (E2)      | dégâts +63 %, portée −40 %, charge thermique +30 %                                                                                     |
| Short Range   | Armes (blueprint générique)         | 5     | 1× Biotech Conductors (M5), 1× Configurable Components (M4), 1× Cracked Industrial Firmware (E3)     | dégâts +75 %, portée −50 %, charge thermique +40 %                                                                                     |
| Sturdy        | Armes (blueprint générique)         | 1     | 1× Nickel (R1)                                                                                       | intégrité du module +100 %, pénétration d'armure +20 %, charge thermique −10 %, masse +20 %                                            |
| Sturdy        | Armes (blueprint générique)         | 2     | 1× Nickel (R1), 1× Shield Emitters (M2)                                                              | intégrité du module +150 %, pénétration d'armure +30 %, charge thermique −15 %, masse +40 %                                            |
| Sturdy        | Armes (blueprint générique)         | 3     | 1× Nickel (R1), 1× Shield Emitters (M2), 1× Tungsten (R3)                                            | intégrité du module +200 %, pénétration d'armure +40 %, charge thermique −20 %, masse +60 %                                            |
| Sturdy        | Armes (blueprint générique)         | 4     | 1× Molybdenum (R3), 1× Tungsten (R3), 1× Zinc (R2)                                                   | intégrité du module +250 %, pénétration d'armure +50 %, charge thermique −25 %, masse +80 %                                            |
| Sturdy        | Armes (blueprint générique)         | 5     | 1× High Density Composites (M3), 1× Molybdenum (R3), 1× Technetium (R4)                              | intégrité du module +300 %, pénétration d'armure +60 %, charge thermique −30 %, masse +100 %                                           |

#### Capteurs, scanners et modules utilitaires : coût en matériaux et effet, grade par grade

13 blueprints de cette famille, soit **53 couples blueprint × grade** : matériaux consommés par roll et effet atteint
une fois le grade validé. *(Source : EDCD/coriolis-data, `modifications/blueprints.json`, commit 0db9234b5b9c ; noms
de matériaux résolus par EDCD/FDevIDs, `material.csv`, commit c35612952dd6.)*

| Blueprint                      | Module                   | Grade | Matériaux par roll                                                                     | Effet atteint à ce grade                                              |
|--------------------------------|--------------------------|-------|----------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| Ammo Capacity                  | Chaff Launcher           | 1     | 1× Mechanical Scrap (M1), 1× Niobium (R3), 1× Vanadium (R2)                            | réserve de munitions +50 %, masse +100 %, temps de rechargement +10 % |
| Lightweight                    | Chaff Launcher           | 1     | 1× Phosphorus (R1)                                                                     | masse −45 %, intégrité du module −10 %                                |
| Lightweight                    | Chaff Launcher           | 2     | 1× Manganese (R2), 1× Salvaged Alloys (M1)                                             | masse −55 %, intégrité du module −20 %                                |
| Lightweight                    | Chaff Launcher           | 3     | 1× Conductive Ceramics (M3), 1× Manganese (R2), 1× Salvaged Alloys (M1)                | masse −65 %, intégrité du module −30 %                                |
| Lightweight                    | Chaff Launcher           | 4     | 1× Conductive Components (M2), 1× Phase Alloys (M3), 1× Proto Light Alloys (M4)        | masse −75 %, intégrité du module −40 %                                |
| Lightweight                    | Chaff Launcher           | 5     | 1× Conductive Ceramics (M3), 1× Proto Light Alloys (M4), 1× Proto Radiolic Alloys (M5) | masse −85 %, intégrité du module −50 %                                |
| Reinforced                     | Chaff Launcher           | 1     | 1× Nickel (R1)                                                                         | intégrité du module +60 %, masse +30 %                                |
| Reinforced                     | Chaff Launcher           | 2     | 1× Nickel (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, masse +60 %                               |
| Reinforced                     | Chaff Launcher           | 3     | 1× Nickel (R1), 1× Shield Emitters (M2), 1× Tungsten (R3)                              | intégrité du module +180 %, masse +90 %                               |
| Reinforced                     | Chaff Launcher           | 4     | 1× Molybdenum (R3), 1× Tungsten (R3), 1× Zinc (R2)                                     | intégrité du module +240 %, masse +120 %                              |
| Reinforced                     | Chaff Launcher           | 5     | 1× High Density Composites (M3), 1× Molybdenum (R3), 1× Technetium (R4)                | intégrité du module +300 %, masse +150 %                              |
| Shielded                       | Chaff Launcher           | 1     | 1× Worn Shield Emitters (M1)                                                           | intégrité du module +60 %, consommation électrique +20 %              |
| Shielded                       | Chaff Launcher           | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, consommation électrique +40 %             |
| Shielded                       | Chaff Launcher           | 3     | 1× Carbon (R1), 1× High Density Composites (M3), 1× Shield Emitters (M2)               | intégrité du module +180 %, consommation électrique +60 %             |
| Shielded                       | Chaff Launcher           | 4     | 1× Proprietary Composites (M4), 1× Shielding Sensors (M3), 1× Vanadium (R2)            | intégrité du module +240 %, consommation électrique +80 %             |
| Shielded                       | Chaff Launcher           | 5     | 1× Compound Shielding (M4), 1× Core Dynamics Composites (M5), 1× Tungsten (R3)         | intégrité du module +300 %, consommation électrique +100 %            |
| Expanded Probe Scanning Radius | Detailed Surface Scanner | 1     | 1× Mechanical Scrap (M1)                                                               | rayon de sonde +10 %, masse +20 %                                     |
| Expanded Probe Scanning Radius | Detailed Surface Scanner | 2     | 1× Germanium (R2), 1× Mechanical Scrap (M1)                                            | rayon de sonde +20 %, masse +40 %                                     |
| Expanded Probe Scanning Radius | Detailed Surface Scanner | 3     | 1× Germanium (R2), 1× Mechanical Scrap (M1), 1× Phase Alloys (M3)                      | rayon de sonde +30 %, masse +60 %                                     |
| Expanded Probe Scanning Radius | Detailed Surface Scanner | 4     | 1× Mechanical Equipment (M2), 1× Niobium (R3), 1× Proto Light Alloys (M4)              | rayon de sonde +40 %, masse +80 %                                     |
| Expanded Probe Scanning Radius | Detailed Surface Scanner | 5     | 1× Mechanical Components (M3), 1× Proto Radiolic Alloys (M5), 1× Tin (R3)              | rayon de sonde +50 %, masse +100 %                                    |
| Ammo Capacity                  | Heat Sink Launcher       | 1     | 1× Mechanical Scrap (M1), 1× Niobium (R3), 1× Vanadium (R2)                            | réserve de munitions +49 %, masse +100 %, temps de rechargement +50 % |
| Ammo Capacity                  | Point Defence            | 1     | 1× Mechanical Scrap (M1), 1× Niobium (R3), 1× Vanadium (R2)                            | réserve de munitions +50 %, masse +100 %, temps de rechargement +10 % |
| Fast Scan                      | Scanners utilitaires     | 1     | 1× Phosphorus (R1)                                                                     | durée de scan −20 %, intégrité du module −10 %, portée −5 %           |
| Fast Scan                      | Scanners utilitaires     | 2     | 1× Flawed Focus Crystals (M2), 1× Phosphorus (R1)                                      | durée de scan −35 %, intégrité du module −20 %, portée −10 %          |
| Fast Scan                      | Scanners utilitaires     | 3     | 1× Flawed Focus Crystals (M2), 1× Open Symmetric Keys (E3), 1× Phosphorus (R1)         | durée de scan −50 %, intégrité du module −30 %, portée −15 %          |
| Fast Scan                      | Scanners utilitaires     | 4     | 1× Atypical Encryption Archives (E4), 1× Focus Crystals (M3), 1× Manganese (R2)        | durée de scan −65 %, intégrité du module −40 %, portée −20 %          |
| Fast Scan                      | Scanners utilitaires     | 5     | 1× Adaptive Encryptors Capture (E5), 1× Arsenic (R2), 1× Refined Focus Crystals (M4)   | durée de scan −80 %, intégrité du module −50 %, portée −25 %          |
| Long Range                     | Scanners utilitaires     | 1     | 1× Iron (R1)                                                                           | portée +24 %, angle de balayage −10 %, consommation électrique +10 %  |
| Long Range                     | Scanners utilitaires     | 2     | 1× Hybrid Capacitors (M2), 1× Iron (R1)                                                | portée +48 %, consommation électrique +20 %, angle de balayage −15 %  |
| Long Range                     | Scanners utilitaires     | 3     | 1× Hybrid Capacitors (M2), 1× Iron (R1), 1× Unexpected Emission Data (E3)              | portée +72 %, consommation électrique +30 %, angle de balayage −20 %  |
| Long Range                     | Scanners utilitaires     | 4     | 1× Decoded Emission Data (E4), 1× Electrochemical Arrays (M3), 1× Germanium (R2)       | portée +96 %, consommation électrique +40 %, angle de balayage −25 %  |
| Long Range                     | Scanners utilitaires     | 5     | 1× Abnormal Compact Emissions Data (E5), 1× Niobium (R3), 1× Polymer Capacitors (M4)   | portée +120 %, consommation électrique +50 %, angle de balayage −30 % |
| Wide Angle                     | Scanners utilitaires     | 1     | 1× Mechanical Scrap (M1)                                                               | angle de balayage +40 %, masse +20 %, durée de scan +10 %             |
| Wide Angle                     | Scanners utilitaires     | 2     | 1× Germanium (R2), 1× Mechanical Scrap (M1)                                            | angle de balayage +80 %, masse +40 %, durée de scan +20 %             |
| Wide Angle                     | Scanners utilitaires     | 3     | 1× Classified Scan Databanks (E3), 1× Germanium (R2), 1× Mechanical Scrap (M1)         | angle de balayage +120 %, masse +60 %, durée de scan +30 %            |
| Wide Angle                     | Scanners utilitaires     | 4     | 1× Divergent Scan Data (E4), 1× Mechanical Equipment (M2), 1× Niobium (R3)             | angle de balayage +160 %, masse +80 %, durée de scan +40 %            |
| Wide Angle                     | Scanners utilitaires     | 5     | 1× Classified Scan Fragment (E5), 1× Mechanical Components (M3), 1× Tin (R3)           | angle de balayage +200 %, masse +100 %, durée de scan +50 %           |
| Lightweight                    | Sensors                  | 1     | 1× Phosphorus (R1)                                                                     | masse −20 %, intégrité du module −10 %, angle de balayage −5 %        |
| Lightweight                    | Sensors                  | 2     | 1× Manganese (R2), 1× Salvaged Alloys (M1)                                             | masse −35 %, intégrité du module −20 %, angle de balayage −10 %       |
| Lightweight                    | Sensors                  | 3     | 1× Conductive Ceramics (M3), 1× Manganese (R2), 1× Salvaged Alloys (M1)                | masse −50 %, intégrité du module −30 %, angle de balayage −15 %       |
| Lightweight                    | Sensors                  | 4     | 1× Conductive Components (M2), 1× Phase Alloys (M3), 1× Proto Light Alloys (M4)        | masse −65 %, intégrité du module −40 %, angle de balayage −20 %       |
| Lightweight                    | Sensors                  | 5     | 1× Conductive Ceramics (M3), 1× Proto Light Alloys (M4), 1× Proto Radiolic Alloys (M5) | masse −80 %, intégrité du module −50 %, angle de balayage −25 %       |
| Long Range                     | Sensors                  | 1     | 1× Iron (R1)                                                                           | portée +15 %, masse +20 %, angle de balayage −10 %                    |
| Long Range                     | Sensors                  | 2     | 1× Hybrid Capacitors (M2), 1× Iron (R1)                                                | portée +30 %, masse +40 %, angle de balayage −15 %                    |
| Long Range                     | Sensors                  | 3     | 1× Hybrid Capacitors (M2), 1× Iron (R1), 1× Unexpected Emission Data (E3)              | portée +45 %, masse +60 %, angle de balayage −20 %                    |
| Long Range                     | Sensors                  | 4     | 1× Decoded Emission Data (E4), 1× Electrochemical Arrays (M3), 1× Germanium (R2)       | portée +60 %, masse +80 %, angle de balayage −25 %                    |
| Long Range                     | Sensors                  | 5     | 1× Abnormal Compact Emissions Data (E5), 1× Niobium (R3), 1× Polymer Capacitors (M4)   | portée +75 %, masse +100 %, angle de balayage −30 %                   |
| Wide Angle                     | Sensors                  | 1     | 1× Mechanical Scrap (M1)                                                               | angle de balayage +40 %, consommation électrique +10 %, portée −4 %   |
| Wide Angle                     | Sensors                  | 2     | 1× Germanium (R2), 1× Mechanical Scrap (M1)                                            | angle de balayage +80 %, consommation électrique +20 %, portée −8 %   |
| Wide Angle                     | Sensors                  | 3     | 1× Classified Scan Databanks (E3), 1× Germanium (R2), 1× Mechanical Scrap (M1)         | angle de balayage +120 %, consommation électrique +30 %, portée −12 % |
| Wide Angle                     | Sensors                  | 4     | 1× Divergent Scan Data (E4), 1× Mechanical Equipment (M2), 1× Niobium (R3)             | angle de balayage +160 %, consommation électrique +40 %, portée −16 % |
| Wide Angle                     | Sensors                  | 5     | 1× Classified Scan Fragment (E5), 1× Mechanical Components (M3), 1× Tin (R3)           | angle de balayage +200 %, consommation électrique +50 %, portée −20 % |

#### Modules de soutien, soutes et contrôleurs de limpets : coût en matériaux et effet, grade par grade

18 blueprints de cette famille, soit **86 couples blueprint × grade** : matériaux consommés par roll et effet atteint
une fois le grade validé. *(Source : EDCD/coriolis-data, `modifications/blueprints.json`, commit 0db9234b5b9c ; noms
de matériaux résolus par EDCD/FDevIDs, `material.csv`, commit c35612952dd6.)*

| Blueprint         | Module                             | Grade | Matériaux par roll                                                                     | Effet atteint à ce grade                                   |
|-------------------|------------------------------------|-------|----------------------------------------------------------------------------------------|------------------------------------------------------------|
| Shielded          | Auto Field Maintenance Unit (AFMU) | 1     | 1× Worn Shield Emitters (M1)                                                           | intégrité du module +60 %, consommation électrique +20 %   |
| Shielded          | Auto Field Maintenance Unit (AFMU) | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, consommation électrique +40 %  |
| Shielded          | Auto Field Maintenance Unit (AFMU) | 3     | 1× Carbon (R1), 1× High Density Composites (M3), 1× Shield Emitters (M2)               | intégrité du module +180 %, consommation électrique +60 %  |
| Shielded          | Auto Field Maintenance Unit (AFMU) | 4     | 1× Proprietary Composites (M4), 1× Shielding Sensors (M3), 1× Vanadium (R2)            | intégrité du module +240 %, consommation électrique +80 %  |
| Shielded          | Auto Field Maintenance Unit (AFMU) | 5     | 1× Compound Shielding (M4), 1× Core Dynamics Composites (M5), 1× Tungsten (R3)         | intégrité du module +300 %, consommation électrique +100 % |
| Expanded Capacity | Cargo Rack (capacité étendue)      | 5     | aucun matériau : recette vide dans le jeu de données                                   | capacité de soute +34,4 %                                  |
| Lightweight       | Collector Limpet Controller        | 1     | 1× Phosphorus (R1)                                                                     | masse −45 %, intégrité du module −10 %                     |
| Lightweight       | Collector Limpet Controller        | 2     | 1× Manganese (R2), 1× Salvaged Alloys (M1)                                             | masse −55 %, intégrité du module −20 %                     |
| Lightweight       | Collector Limpet Controller        | 3     | 1× Conductive Ceramics (M3), 1× Manganese (R2), 1× Salvaged Alloys (M1)                | masse −65 %, intégrité du module −30 %                     |
| Lightweight       | Collector Limpet Controller        | 4     | 1× Conductive Components (M2), 1× Phase Alloys (M3), 1× Proto Light Alloys (M4)        | masse −75 %, intégrité du module −40 %                     |
| Lightweight       | Collector Limpet Controller        | 5     | 1× Conductive Ceramics (M3), 1× Proto Light Alloys (M4), 1× Proto Radiolic Alloys (M5) | masse −85 %, intégrité du module −50 %                     |
| Reinforced        | Collector Limpet Controller        | 1     | 1× Nickel (R1)                                                                         | intégrité du module +60 %, masse +30 %                     |
| Reinforced        | Collector Limpet Controller        | 2     | 1× Nickel (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, masse +60 %                    |
| Reinforced        | Collector Limpet Controller        | 3     | 1× Nickel (R1), 1× Shield Emitters (M2), 1× Tungsten (R3)                              | intégrité du module +180 %, masse +90 %                    |
| Reinforced        | Collector Limpet Controller        | 4     | 1× Molybdenum (R3), 1× Tungsten (R3), 1× Zinc (R2)                                     | intégrité du module +240 %, masse +120 %                   |
| Reinforced        | Collector Limpet Controller        | 5     | 1× High Density Composites (M3), 1× Molybdenum (R3), 1× Technetium (R4)                | intégrité du module +300 %, masse +150 %                   |
| Shielded          | Collector Limpet Controller        | 1     | 1× Worn Shield Emitters (M1)                                                           | intégrité du module +60 %, consommation électrique +20 %   |
| Shielded          | Collector Limpet Controller        | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, consommation électrique +40 %  |
| Shielded          | Collector Limpet Controller        | 3     | 1× Carbon (R1), 1× High Density Composites (M3), 1× Shield Emitters (M2)               | intégrité du module +180 %, consommation électrique +60 %  |
| Shielded          | Collector Limpet Controller        | 4     | 1× Proprietary Composites (M4), 1× Shielding Sensors (M3), 1× Vanadium (R2)            | intégrité du module +240 %, consommation électrique +80 %  |
| Shielded          | Collector Limpet Controller        | 5     | 1× Compound Shielding (M4), 1× Core Dynamics Composites (M5), 1× Tungsten (R3)         | intégrité du module +300 %, consommation électrique +100 % |
| Lightweight       | Fuel Transfer Limpet Controller    | 1     | 1× Phosphorus (R1)                                                                     | masse −45 %, intégrité du module −10 %                     |
| Lightweight       | Fuel Transfer Limpet Controller    | 2     | 1× Manganese (R2), 1× Salvaged Alloys (M1)                                             | masse −55 %, intégrité du module −20 %                     |
| Lightweight       | Fuel Transfer Limpet Controller    | 3     | 1× Conductive Ceramics (M3), 1× Manganese (R2), 1× Salvaged Alloys (M1)                | masse −65 %, intégrité du module −30 %                     |
| Lightweight       | Fuel Transfer Limpet Controller    | 4     | 1× Conductive Components (M2), 1× Phase Alloys (M3), 1× Proto Light Alloys (M4)        | masse −75 %, intégrité du module −40 %                     |
| Lightweight       | Fuel Transfer Limpet Controller    | 5     | 1× Conductive Ceramics (M3), 1× Proto Light Alloys (M4), 1× Proto Radiolic Alloys (M5) | masse −85 %, intégrité du module −50 %                     |
| Reinforced        | Fuel Transfer Limpet Controller    | 1     | 1× Nickel (R1)                                                                         | intégrité du module +60 %, masse +30 %                     |
| Reinforced        | Fuel Transfer Limpet Controller    | 2     | 1× Nickel (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, masse +60 %                    |
| Reinforced        | Fuel Transfer Limpet Controller    | 3     | 1× Nickel (R1), 1× Shield Emitters (M2), 1× Tungsten (R3)                              | intégrité du module +180 %, masse +90 %                    |
| Reinforced        | Fuel Transfer Limpet Controller    | 4     | 1× Molybdenum (R3), 1× Tungsten (R3), 1× Zinc (R2)                                     | intégrité du module +240 %, masse +120 %                   |
| Reinforced        | Fuel Transfer Limpet Controller    | 5     | 1× High Density Composites (M3), 1× Molybdenum (R3), 1× Technetium (R4)                | intégrité du module +300 %, masse +150 %                   |
| Shielded          | Fuel Transfer Limpet Controller    | 1     | 1× Worn Shield Emitters (M1)                                                           | intégrité du module +60 %, consommation électrique +20 %   |
| Shielded          | Fuel Transfer Limpet Controller    | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, consommation électrique +40 %  |
| Shielded          | Fuel Transfer Limpet Controller    | 3     | 1× Carbon (R1), 1× High Density Composites (M3), 1× Shield Emitters (M2)               | intégrité du module +180 %, consommation électrique +60 %  |
| Shielded          | Fuel Transfer Limpet Controller    | 4     | 1× Proprietary Composites (M4), 1× Shielding Sensors (M3), 1× Vanadium (R2)            | intégrité du module +240 %, consommation électrique +80 %  |
| Shielded          | Fuel Transfer Limpet Controller    | 5     | 1× Compound Shielding (M4), 1× Core Dynamics Composites (M5), 1× Tungsten (R3)         | intégrité du module +300 %, consommation électrique +100 % |
| Lightweight       | Hatch Breaker Limpet Controller    | 1     | 1× Phosphorus (R1)                                                                     | masse −45 %, intégrité du module −10 %                     |
| Lightweight       | Hatch Breaker Limpet Controller    | 2     | 1× Manganese (R2), 1× Salvaged Alloys (M1)                                             | masse −55 %, intégrité du module −20 %                     |
| Lightweight       | Hatch Breaker Limpet Controller    | 3     | 1× Conductive Ceramics (M3), 1× Manganese (R2), 1× Salvaged Alloys (M1)                | masse −65 %, intégrité du module −30 %                     |
| Lightweight       | Hatch Breaker Limpet Controller    | 4     | 1× Conductive Components (M2), 1× Phase Alloys (M3), 1× Proto Light Alloys (M4)        | masse −75 %, intégrité du module −40 %                     |
| Lightweight       | Hatch Breaker Limpet Controller    | 5     | 1× Conductive Ceramics (M3), 1× Proto Light Alloys (M4), 1× Proto Radiolic Alloys (M5) | masse −85 %, intégrité du module −50 %                     |
| Reinforced        | Hatch Breaker Limpet Controller    | 1     | 1× Nickel (R1)                                                                         | intégrité du module +60 %, masse +30 %                     |
| Reinforced        | Hatch Breaker Limpet Controller    | 2     | 1× Nickel (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, masse +60 %                    |
| Reinforced        | Hatch Breaker Limpet Controller    | 3     | 1× Nickel (R1), 1× Shield Emitters (M2), 1× Tungsten (R3)                              | intégrité du module +180 %, masse +90 %                    |
| Reinforced        | Hatch Breaker Limpet Controller    | 4     | 1× Molybdenum (R3), 1× Tungsten (R3), 1× Zinc (R2)                                     | intégrité du module +240 %, masse +120 %                   |
| Reinforced        | Hatch Breaker Limpet Controller    | 5     | 1× High Density Composites (M3), 1× Molybdenum (R3), 1× Technetium (R4)                | intégrité du module +300 %, masse +150 %                   |
| Shielded          | Hatch Breaker Limpet Controller    | 1     | 1× Worn Shield Emitters (M1)                                                           | intégrité du module +60 %, consommation électrique +20 %   |
| Shielded          | Hatch Breaker Limpet Controller    | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, consommation électrique +40 %  |
| Shielded          | Hatch Breaker Limpet Controller    | 3     | 1× Carbon (R1), 1× High Density Composites (M3), 1× Shield Emitters (M2)               | intégrité du module +180 %, consommation électrique +60 %  |
| Shielded          | Hatch Breaker Limpet Controller    | 4     | 1× Proprietary Composites (M4), 1× Shielding Sensors (M3), 1× Vanadium (R2)            | intégrité du module +240 %, consommation électrique +80 %  |
| Shielded          | Hatch Breaker Limpet Controller    | 5     | 1× Compound Shielding (M4), 1× Core Dynamics Composites (M5), 1× Tungsten (R3)         | intégrité du module +300 %, consommation électrique +100 % |
| Lightweight       | Life Support                       | 1     | 1× Phosphorus (R1)                                                                     | masse −45 %, intégrité du module −10 %                     |
| Lightweight       | Life Support                       | 2     | 1× Manganese (R2), 1× Salvaged Alloys (M1)                                             | masse −55 %, intégrité du module −20 %                     |
| Lightweight       | Life Support                       | 3     | 1× Conductive Ceramics (M3), 1× Manganese (R2), 1× Salvaged Alloys (M1)                | masse −65 %, intégrité du module −30 %                     |
| Lightweight       | Life Support                       | 4     | 1× Conductive Components (M2), 1× Phase Alloys (M3), 1× Proto Light Alloys (M4)        | masse −75 %, intégrité du module −40 %                     |
| Lightweight       | Life Support                       | 5     | 1× Conductive Ceramics (M3), 1× Proto Light Alloys (M4), 1× Proto Radiolic Alloys (M5) | masse −85 %, intégrité du module −50 %                     |
| Reinforced        | Life Support                       | 1     | 1× Nickel (R1)                                                                         | intégrité du module +60 %, masse +30 %                     |
| Reinforced        | Life Support                       | 2     | 1× Nickel (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, masse +60 %                    |
| Reinforced        | Life Support                       | 3     | 1× Nickel (R1), 1× Shield Emitters (M2), 1× Tungsten (R3)                              | intégrité du module +180 %, masse +90 %                    |
| Reinforced        | Life Support                       | 4     | 1× Molybdenum (R3), 1× Tungsten (R3), 1× Zinc (R2)                                     | intégrité du module +240 %, masse +120 %                   |
| Reinforced        | Life Support                       | 5     | 1× High Density Composites (M3), 1× Molybdenum (R3), 1× Technetium (R4)                | intégrité du module +300 %, masse +150 %                   |
| Shielded          | Life Support                       | 1     | 1× Worn Shield Emitters (M1)                                                           | intégrité du module +60 %, consommation électrique +20 %   |
| Shielded          | Life Support                       | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, consommation électrique +40 %  |
| Shielded          | Life Support                       | 3     | 1× Carbon (R1), 1× High Density Composites (M3), 1× Shield Emitters (M2)               | intégrité du module +180 %, consommation électrique +60 %  |
| Shielded          | Life Support                       | 4     | 1× Proprietary Composites (M4), 1× Shielding Sensors (M3), 1× Vanadium (R2)            | intégrité du module +240 %, consommation électrique +80 %  |
| Shielded          | Life Support                       | 5     | 1× Compound Shielding (M4), 1× Core Dynamics Composites (M5), 1× Tungsten (R3)         | intégrité du module +300 %, consommation électrique +112 % |
| Lightweight       | Prospector Limpet Controller       | 1     | 1× Phosphorus (R1)                                                                     | masse −45 %, intégrité du module −10 %                     |
| Lightweight       | Prospector Limpet Controller       | 2     | 1× Manganese (R2), 1× Salvaged Alloys (M1)                                             | masse −55 %, intégrité du module −20 %                     |
| Lightweight       | Prospector Limpet Controller       | 3     | 1× Conductive Ceramics (M3), 1× Manganese (R2), 1× Salvaged Alloys (M1)                | masse −65 %, intégrité du module −30 %                     |
| Lightweight       | Prospector Limpet Controller       | 4     | 1× Conductive Components (M2), 1× Phase Alloys (M3), 1× Proto Light Alloys (M4)        | masse −75 %, intégrité du module −40 %                     |
| Lightweight       | Prospector Limpet Controller       | 5     | 1× Conductive Ceramics (M3), 1× Proto Light Alloys (M4), 1× Proto Radiolic Alloys (M5) | masse −85 %, intégrité du module −50 %                     |
| Reinforced        | Prospector Limpet Controller       | 1     | 1× Nickel (R1)                                                                         | intégrité du module +60 %, masse +30 %                     |
| Reinforced        | Prospector Limpet Controller       | 2     | 1× Nickel (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, masse +60 %                    |
| Reinforced        | Prospector Limpet Controller       | 3     | 1× Nickel (R1), 1× Shield Emitters (M2), 1× Tungsten (R3)                              | intégrité du module +180 %, masse +90 %                    |
| Reinforced        | Prospector Limpet Controller       | 4     | 1× Molybdenum (R3), 1× Tungsten (R3), 1× Zinc (R2)                                     | intégrité du module +240 %, masse +120 %                   |
| Reinforced        | Prospector Limpet Controller       | 5     | 1× High Density Composites (M3), 1× Molybdenum (R3), 1× Technetium (R4)                | intégrité du module +300 %, masse +150 %                   |
| Shielded          | Prospector Limpet Controller       | 1     | 1× Worn Shield Emitters (M1)                                                           | intégrité du module +60 %, consommation électrique +20 %   |
| Shielded          | Prospector Limpet Controller       | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, consommation électrique +40 %  |
| Shielded          | Prospector Limpet Controller       | 3     | 1× Carbon (R1), 1× High Density Composites (M3), 1× Shield Emitters (M2)               | intégrité du module +180 %, consommation électrique +60 %  |
| Shielded          | Prospector Limpet Controller       | 4     | 1× Proprietary Composites (M4), 1× Shielding Sensors (M3), 1× Vanadium (R2)            | intégrité du module +240 %, consommation électrique +80 %  |
| Shielded          | Prospector Limpet Controller       | 5     | 1× Compound Shielding (M4), 1× Core Dynamics Composites (M5), 1× Tungsten (R3)         | intégrité du module +300 %, consommation électrique +100 % |
| Shielded          | Refinery                           | 1     | 1× Worn Shield Emitters (M1)                                                           | intégrité du module +60 %, consommation électrique +20 %   |
| Shielded          | Refinery                           | 2     | 1× Carbon (R1), 1× Shield Emitters (M2)                                                | intégrité du module +120 %, consommation électrique +40 %  |
| Shielded          | Refinery                           | 3     | 1× Carbon (R1), 1× High Density Composites (M3), 1× Shield Emitters (M2)               | intégrité du module +180 %, consommation électrique +60 %  |
| Shielded          | Refinery                           | 4     | 1× Proprietary Composites (M4), 1× Shielding Sensors (M3), 1× Vanadium (R2)            | intégrité du module +240 %, consommation électrique +80 %  |
| Shielded          | Refinery                           | 5     | 1× Compound Shielding (M4), 1× Core Dynamics Composites (M5), 1× Tungsten (R3)         | intégrité du module +300 %, consommation électrique +100 % |
### Coût total d'une montée du grade 1 au grade 5, blueprint par blueprint

Une ligne par blueprint : le **total des matériaux réellement consommés** pour enchaîner tous les grades à
réputation 5, c'est-à-dire *quantité par roll × nombre de rolls du grade*, sommé sur les grades. Le nombre de rolls
vaut N pour un grade N, soit **15 rolls** pour une montée complète G1 → G5 ; les blueprints qui ne comptent pas cinq
grades — les deux plans de Shield Cell Bank s'arrêtent au grade 4, trois plans de capacité de munitions et le plan
*Expanded Capacity* n'existent qu'à un seul grade — sont signalés dans la colonne « Grades couverts ».
81 lignes. *(Source : EDCD/coriolis-data, `modifications/blueprints.json`, commit 0db9234b5b9c ; noms de
matériaux résolus par EDCD/FDevIDs, `material.csv`, commit c35612952dd6.)*

| Blueprint                      | Module                              | Grades couverts | Rolls | Total des matériaux consommés                                                                                                                                                                                                                                                                                                                                                                                                         |
|--------------------------------|-------------------------------------|-----------------|-------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Double Shot                    | Armes (blueprint générique)         | G1→G5           | 15    | 6× Carbon (R1), 5× Configurable Components (M4), 3× Cracked Industrial Firmware (E3), 5× High Density Composites (M3), 4× Mechanical Components (M3), 5× Mechanical Equipment (M2), 5× Modified Embedded Firmware (E5), 4× Security Firmware Patch (E4), 4× Vanadium (R2)                                                                                                                                                             |
| Efficient                      | Armes (blueprint générique)         | G1→G5           | 15    | 5× Cadmium (R3), 3× Chromium (R2), 3× Exceptional Scrambled Emission Data (E1), 2× Heat Dispersion Plate (M2), 3× Heat Exchangers (M3), 4× Heat Vanes (M4), 4× Irregular Emission Data (E2), 5× Proto Heat Radiators (M5), 4× Selenium (R4), 3× Sulphur (R1), 5× Unexpected Emission Data (E3)                                                                                                                                        |
| Focused                        | Armes (blueprint générique)         | G1→G5           | 15    | 3× Chromium (R2), 3× Conductive Ceramics (M3), 2× Conductive Components (M2), 4× Focus Crystals (M3), 4× Germanium (R2), 6× Iron (R1), 5× Military Supercapacitors (M5), 5× Niobium (R3), 4× Polymer Capacitors (M4), 5× Refined Focus Crystals (M4)                                                                                                                                                                                  |
| High Capacity                  | Armes (blueprint générique)         | G1→G5           | 15    | 4× High Density Composites (M3), 5× Mechanical Components (M3), 4× Mechanical Equipment (M2), 6× Mechanical Scrap (M1), 5× Military Supercapacitors (M5), 3× Niobium (R3), 5× Proprietary Composites (M4), 4× Tin (R3), 5× Vanadium (R2)                                                                                                                                                                                              |
| Lightweight                    | Armes (blueprint générique)         | G1→G5           | 15    | 8× Conductive Ceramics (M3), 4× Conductive Components (M2), 5× Manganese (R2), 4× Phase Alloys (M3), 1× Phosphorus (R1), 9× Proto Light Alloys (M4), 5× Proto Radiolic Alloys (M5), 5× Salvaged Alloys (M1)                                                                                                                                                                                                                           |
| Long Range                     | Armes (blueprint générique)         | G1→G5           | 15    | 5× Biotech Conductors (M5), 4× Conductive Polymers (M4), 5× Cracked Industrial Firmware (E3), 7× Focus Crystals (M3), 9× Modified Consumer Firmware (E2), 6× Sulphur (R1), 5× Thermic Alloys (M4)                                                                                                                                                                                                                                     |
| Overcharged                    | Multi-Cannon, Advanced Multi-Cannon | G1→G5           | 15    | 4× Conductive Ceramics (M3), 5× Conductive Components (M2), 5× Conductive Polymers (M4), 3× Electrochemical Arrays (M3), 5× Modified Embedded Firmware (E5), 6× Nickel (R1), 4× Polymer Capacitors (M4), 4× Zinc (R2), 5× Zirconium (R2)                                                                                                                                                                                              |
| Overcharged                    | Armes (blueprint générique)         | G1→G5           | 15    | 4× Conductive Ceramics (M3), 5× Conductive Components (M2), 5× Conductive Polymers (M4), 3× Electrochemical Arrays (M3), 5× Modified Embedded Firmware (E5), 6× Nickel (R1), 4× Polymer Capacitors (M4), 4× Zinc (R2), 5× Zirconium (R2)                                                                                                                                                                                              |
| Rapid Fire                     | Armes (blueprint générique)         | G1→G5           | 15    | 5× Configurable Components (M4), 2× Heat Dispersion Plate (M2), 4× Mechanical Components (M3), 3× Mechanical Equipment (M2), 3× Mechanical Scrap (M1), 4× Modified Consumer Firmware (E2), 8× Precipitated Alloys (M3), 3× Specialised Legacy Firmware (E1), 5× Technetium (R4), 4× Thermic Alloys (M4)                                                                                                                               |
| Short Range                    | Armes (blueprint générique)         | G1→G5           | 15    | 5× Biotech Conductors (M5), 4× Conductive Polymers (M4), 5× Configurable Components (M4), 5× Cracked Industrial Firmware (E3), 7× Electrochemical Arrays (M3), 9× Modified Consumer Firmware (E2), 6× Nickel (R1)                                                                                                                                                                                                                     |
| Sturdy                         | Armes (blueprint générique)         | G1→G5           | 15    | 5× High Density Composites (M3), 9× Molybdenum (R3), 6× Nickel (R1), 5× Shield Emitters (M2), 5× Technetium (R4), 7× Tungsten (R3), 4× Zinc (R2)                                                                                                                                                                                                                                                                                      |
| Shielded                       | Auto Field Maintenance Unit (AFMU)  | G1→G5           | 15    | 5× Carbon (R1), 5× Compound Shielding (M4), 5× Core Dynamics Composites (M5), 3× High Density Composites (M3), 4× Proprietary Composites (M4), 5× Shield Emitters (M2), 4× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2), 1× Worn Shield Emitters (M1)                                                                                                                                                                   |
| Blast Resistant                | Bulkheads (armure)                  | G1→G5           | 15    | 2× Carbon (R1), 4× Galvanising Alloys (M2), 4× Mercury (R3), 5× Molybdenum (R3), 1× Nickel (R1), 5× Phase Alloys (M3), 5× Ruthenium (R4), 3× Salvaged Alloys (M1), 4× Tungsten (R3), 3× Vanadium (R2), 2× Zinc (R2)                                                                                                                                                                                                                   |
| Heavy Duty                     | Bulkheads (armure)                  | G1→G5           | 15    | 6× Carbon (R1), 5× Compound Shielding (M4), 5× Core Dynamics Composites (M5), 3× High Density Composites (M3), 4× Proprietary Composites (M4), 5× Shield Emitters (M2), 4× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2)                                                                                                                                                                                                 |
| Kinetic Resistant              | Bulkheads (armure)                  | G1→G5           | 15    | 5× Core Dynamics Composites (M5), 4× Galvanising Alloys (M2), 3× High Density Composites (M3), 5× Molybdenum (R3), 3× Nickel (R1), 5× Phase Alloys (M3), 4× Proprietary Composites (M4), 3× Salvaged Alloys (M1), 4× Tungsten (R3), 5× Vanadium (R2)                                                                                                                                                                                  |
| Lightweight                    | Bulkheads (armure)                  | G1→G5           | 15    | 9× Conductive Ceramics (M3), 5× Conductive Components (M2), 4× Germanium (R2), 3× High Density Composites (M3), 6× Iron (R1), 5× Military Grade Alloys (M5), 4× Proprietary Composites (M4), 5× Tin (R3)                                                                                                                                                                                                                              |
| Thermal Resistant              | Bulkheads (armure)                  | G1→G5           | 15    | 4× Galvanising Alloys (M2), 1× Heat Conduction Wiring (M1), 2× Heat Dispersion Plate (M2), 3× Heat Exchangers (M3), 4× Heat Vanes (M4), 5× Molybdenum (R3), 2× Nickel (R1), 5× Phase Alloys (M3), 5× Proto Heat Radiators (M5), 3× Salvaged Alloys (M1), 4× Tungsten (R3), 3× Vanadium (R2)                                                                                                                                           |
| Expanded Capacity              | Cargo Rack (capacité étendue)       | G5              | 5     | aucun matériau : recette vide dans le jeu de données                                                                                                                                                                                                                                                                                                                                                                                  |
| Ammo Capacity                  | Chaff Launcher                      | G1              | 1     | 1× Mechanical Scrap (M1), 1× Niobium (R3), 1× Vanadium (R2)                                                                                                                                                                                                                                                                                                                                                                           |
| Lightweight                    | Chaff Launcher                      | G1→G5           | 15    | 8× Conductive Ceramics (M3), 4× Conductive Components (M2), 5× Manganese (R2), 4× Phase Alloys (M3), 1× Phosphorus (R1), 9× Proto Light Alloys (M4), 5× Proto Radiolic Alloys (M5), 5× Salvaged Alloys (M1)                                                                                                                                                                                                                           |
| Reinforced                     | Chaff Launcher                      | G1→G5           | 15    | 5× High Density Composites (M3), 9× Molybdenum (R3), 6× Nickel (R1), 5× Shield Emitters (M2), 5× Technetium (R4), 7× Tungsten (R3), 4× Zinc (R2)                                                                                                                                                                                                                                                                                      |
| Shielded                       | Chaff Launcher                      | G1→G5           | 15    | 5× Carbon (R1), 5× Compound Shielding (M4), 5× Core Dynamics Composites (M5), 3× High Density Composites (M3), 4× Proprietary Composites (M4), 5× Shield Emitters (M2), 4× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2), 1× Worn Shield Emitters (M1)                                                                                                                                                                   |
| Lightweight                    | Collector Limpet Controller         | G1→G5           | 15    | 8× Conductive Ceramics (M3), 4× Conductive Components (M2), 5× Manganese (R2), 4× Phase Alloys (M3), 1× Phosphorus (R1), 9× Proto Light Alloys (M4), 5× Proto Radiolic Alloys (M5), 5× Salvaged Alloys (M1)                                                                                                                                                                                                                           |
| Reinforced                     | Collector Limpet Controller         | G1→G5           | 15    | 5× High Density Composites (M3), 9× Molybdenum (R3), 6× Nickel (R1), 5× Shield Emitters (M2), 5× Technetium (R4), 7× Tungsten (R3), 4× Zinc (R2)                                                                                                                                                                                                                                                                                      |
| Shielded                       | Collector Limpet Controller         | G1→G5           | 15    | 5× Carbon (R1), 5× Compound Shielding (M4), 5× Core Dynamics Composites (M5), 3× High Density Composites (M3), 4× Proprietary Composites (M4), 5× Shield Emitters (M2), 4× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2), 1× Worn Shield Emitters (M1)                                                                                                                                                                   |
| Expanded Probe Scanning Radius | Detailed Surface Scanner            | G1→G5           | 15    | 5× Germanium (R2), 5× Mechanical Components (M3), 4× Mechanical Equipment (M2), 6× Mechanical Scrap (M1), 4× Niobium (R3), 3× Phase Alloys (M3), 4× Proto Light Alloys (M4), 5× Proto Radiolic Alloys (M5), 5× Tin (R3)                                                                                                                                                                                                               |
| Expanded Capture Arc           | FSD Interdictor                     | G1→G5           | 15    | 5× Classified Scan Fragment (E5), 4× Divergent Scan Data (E4), 5× Eccentric Hyperspace Trajectories (E4), 3× Grid Resistors (M1), 8× Mechanical Components (M3), 6× Mechanical Equipment (M2), 1× Mechanical Scrap (M1), 4× Strange Wake Solutions (E3), 3× Tagged Encryption Codes (E2), 2× Unusual Encrypted Files (E1)                                                                                                             |
| Long Range                     | FSD Interdictor                     | G1→G5           | 15    | 5× Adaptive Encryptors Capture (E5), 3× Anomalous Bulk Scan Data (E1), 3× Anomalous FSD Telemetry (E2), 2× Atypical Disrupted Wake Echoes (E1), 4× Atypical Encryption Archives (E4), 5× Classified Scan Databanks (E3), 5× Eccentric Hyperspace Trajectories (E4), 3× Open Symmetric Keys (E3), 4× Strange Wake Solutions (E3), 2× Tagged Encryption Codes (E2), 4× Unidentified Scan Archives (E2), 1× Unusual Encrypted Files (E1) |
| Faster Boot Sequence           | Frame Shift Drive                   | G1→G5           | 15    | 4× Cadmium (R3), 2× Chromium (R2), 5× Electrochemical Arrays (M3), 6× Grid Resistors (M1), 3× Heat Dispersion Plate (M2), 4× Heat Exchangers (M3), 5× Heat Vanes (M4), 4× Hybrid Capacitors (M2), 3× Selenium (R4), 5× Tellurium (R4)                                                                                                                                                                                                 |
| Increased Range                | Frame Shift Drive                   | G1→G5           | 15    | 5× Arsenic (R2), 3× Atypical Disrupted Wake Echoes (E1), 4× Chemical Distillery (M3), 5× Chemical Manipulators (M4), 5× Chemical Processors (M2), 5× Datamined Wake Exceptions (E5), 4× Eccentric Hyperspace Trajectories (E4), 4× Manganese (R2), 3× Phosphorus (R1), 3× Strange Wake Solutions (E3)                                                                                                                                 |
| Shielded                       | Frame Shift Drive                   | G1→G5           | 15    | 5× Carbon (R1), 4× Compound Shielding (M4), 4× High Density Composites (M3), 5× Imperial Shielding (M5), 1× Nickel (R1), 5× Proprietary Composites (M4), 2× Shield Emitters (M2), 3× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2), 3× Zinc (R2)                                                                                                                                                                         |
| Shielded                       | Fuel Scoop                          | G1→G5           | 15    | 5× Carbon (R1), 5× Compound Shielding (M4), 5× Core Dynamics Composites (M5), 3× High Density Composites (M3), 4× Proprietary Composites (M4), 5× Shield Emitters (M2), 4× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2), 1× Worn Shield Emitters (M1)                                                                                                                                                                   |
| Lightweight                    | Fuel Transfer Limpet Controller     | G1→G5           | 15    | 8× Conductive Ceramics (M3), 4× Conductive Components (M2), 5× Manganese (R2), 4× Phase Alloys (M3), 1× Phosphorus (R1), 9× Proto Light Alloys (M4), 5× Proto Radiolic Alloys (M5), 5× Salvaged Alloys (M1)                                                                                                                                                                                                                           |
| Reinforced                     | Fuel Transfer Limpet Controller     | G1→G5           | 15    | 5× High Density Composites (M3), 9× Molybdenum (R3), 6× Nickel (R1), 5× Shield Emitters (M2), 5× Technetium (R4), 7× Tungsten (R3), 4× Zinc (R2)                                                                                                                                                                                                                                                                                      |
| Shielded                       | Fuel Transfer Limpet Controller     | G1→G5           | 15    | 5× Carbon (R1), 5× Compound Shielding (M4), 5× Core Dynamics Composites (M5), 3× High Density Composites (M3), 4× Proprietary Composites (M4), 5× Shield Emitters (M2), 4× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2), 1× Worn Shield Emitters (M1)                                                                                                                                                                   |
| Lightweight                    | Hatch Breaker Limpet Controller     | G1→G5           | 15    | 8× Conductive Ceramics (M3), 4× Conductive Components (M2), 5× Manganese (R2), 4× Phase Alloys (M3), 1× Phosphorus (R1), 9× Proto Light Alloys (M4), 5× Proto Radiolic Alloys (M5), 5× Salvaged Alloys (M1)                                                                                                                                                                                                                           |
| Reinforced                     | Hatch Breaker Limpet Controller     | G1→G5           | 15    | 5× High Density Composites (M3), 9× Molybdenum (R3), 6× Nickel (R1), 5× Shield Emitters (M2), 5× Technetium (R4), 7× Tungsten (R3), 4× Zinc (R2)                                                                                                                                                                                                                                                                                      |
| Shielded                       | Hatch Breaker Limpet Controller     | G1→G5           | 15    | 5× Carbon (R1), 5× Compound Shielding (M4), 5× Core Dynamics Composites (M5), 3× High Density Composites (M3), 4× Proprietary Composites (M4), 5× Shield Emitters (M2), 4× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2), 1× Worn Shield Emitters (M1)                                                                                                                                                                   |
| Ammo Capacity                  | Heat Sink Launcher                  | G1              | 1     | 1× Mechanical Scrap (M1), 1× Niobium (R3), 1× Vanadium (R2)                                                                                                                                                                                                                                                                                                                                                                           |
| Blast Resistant                | Hull Reinforcement Package          | G1→G5           | 15    | 2× Carbon (R1), 4× Galvanising Alloys (M2), 4× Mercury (R3), 5× Molybdenum (R3), 1× Nickel (R1), 5× Phase Alloys (M3), 5× Ruthenium (R4), 3× Salvaged Alloys (M1), 4× Tungsten (R3), 3× Vanadium (R2), 2× Zinc (R2), 3× Zirconium (R2)                                                                                                                                                                                                |
| Heavy Duty                     | Hull Reinforcement Package          | G1→G5           | 15    | 6× Carbon (R1), 5× Compound Shielding (M4), 5× Core Dynamics Composites (M5), 3× High Density Composites (M3), 4× Proprietary Composites (M4), 5× Shield Emitters (M2), 4× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2)                                                                                                                                                                                                 |
| Kinetic Resistant              | Hull Reinforcement Package          | G1→G5           | 15    | 5× Core Dynamics Composites (M5), 4× Galvanising Alloys (M2), 3× High Density Composites (M3), 5× Molybdenum (R3), 3× Nickel (R1), 5× Phase Alloys (M3), 4× Proprietary Composites (M4), 3× Salvaged Alloys (M1), 4× Tungsten (R3), 5× Vanadium (R2)                                                                                                                                                                                  |
| Lightweight                    | Hull Reinforcement Package          | G1→G5           | 15    | 9× Conductive Ceramics (M3), 5× Conductive Components (M2), 4× Germanium (R2), 3× High Density Composites (M3), 6× Iron (R1), 5× Military Grade Alloys (M5), 4× Proprietary Composites (M4), 5× Tin (R3)                                                                                                                                                                                                                              |
| Thermal Resistant              | Hull Reinforcement Package          | G1→G5           | 15    | 4× Galvanising Alloys (M2), 1× Heat Conduction Wiring (M1), 2× Heat Dispersion Plate (M2), 3× Heat Exchangers (M3), 4× Heat Vanes (M4), 5× Molybdenum (R3), 2× Nickel (R1), 5× Phase Alloys (M3), 5× Proto Heat Radiators (M5), 3× Salvaged Alloys (M1), 4× Tungsten (R3), 3× Vanadium (R2)                                                                                                                                           |
| Lightweight                    | Life Support                        | G1→G5           | 15    | 8× Conductive Ceramics (M3), 4× Conductive Components (M2), 5× Manganese (R2), 4× Phase Alloys (M3), 1× Phosphorus (R1), 9× Proto Light Alloys (M4), 5× Proto Radiolic Alloys (M5), 5× Salvaged Alloys (M1)                                                                                                                                                                                                                           |
| Reinforced                     | Life Support                        | G1→G5           | 15    | 5× High Density Composites (M3), 9× Molybdenum (R3), 6× Nickel (R1), 5× Shield Emitters (M2), 5× Technetium (R4), 7× Tungsten (R3), 4× Zinc (R2)                                                                                                                                                                                                                                                                                      |
| Shielded                       | Life Support                        | G1→G5           | 15    | 5× Carbon (R1), 5× Compound Shielding (M4), 5× Core Dynamics Composites (M5), 3× High Density Composites (M3), 4× Proprietary Composites (M4), 5× Shield Emitters (M2), 4× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2), 1× Worn Shield Emitters (M1)                                                                                                                                                                   |
| Ammo Capacity                  | Point Defence                       | G1              | 1     | 1× Mechanical Scrap (M1), 1× Niobium (R3), 1× Vanadium (R2)                                                                                                                                                                                                                                                                                                                                                                           |
| Charge Enhanced                | Power Distributor                   | G1→G5           | 15    | 3× Chemical Distillery (M3), 9× Chemical Manipulators (M4), 2× Chemical Processors (M2), 9× Cracked Industrial Firmware (E3), 5× Exquisite Focus Crystals (M5), 3× Grid Resistors (M1), 4× Hybrid Capacitors (M2), 3× Modified Consumer Firmware (E2), 3× Specialised Legacy Firmware (E1)                                                                                                                                            |
| Engine Focused                 | Power Distributor                   | G1→G5           | 15    | 3× Anomalous Bulk Scan Data (E1), 5× Cadmium (R3), 3× Chromium (R2), 5× Classified Scan Databanks (E3), 2× Conductive Components (M2), 3× Electrochemical Arrays (M3), 5× Military Supercapacitors (M5), 4× Polymer Capacitors (M4), 4× Selenium (R4), 3× Sulphur (R1), 4× Unidentified Scan Archives (E2)                                                                                                                            |
| High Charge Capacity           | Power Distributor                   | G1→G5           | 15    | 5× Chromium (R2), 5× Cracked Industrial Firmware (E3), 3× High Density Composites (M3), 5× Military Supercapacitors (M5), 4× Modified Consumer Firmware (E2), 9× Proprietary Composites (M4), 4× Selenium (R4), 5× Specialised Legacy Firmware (E1), 1× Sulphur (R1)                                                                                                                                                                  |
| Shielded                       | Power Distributor                   | G1→G5           | 15    | 5× Carbon (R1), 5× Compound Shielding (M4), 5× Core Dynamics Composites (M5), 3× High Density Composites (M3), 4× Proprietary Composites (M4), 5× Shield Emitters (M2), 4× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2), 1× Worn Shield Emitters (M1)                                                                                                                                                                   |
| System Focused                 | Power Distributor                   | G1→G5           | 15    | 3× Anomalous Bulk Scan Data (E1), 5× Cadmium (R3), 3× Chromium (R2), 5× Classified Scan Databanks (E3), 2× Conductive Components (M2), 3× Electrochemical Arrays (M3), 5× Military Supercapacitors (M5), 4× Polymer Capacitors (M4), 4× Selenium (R4), 3× Sulphur (R1), 4× Unidentified Scan Archives (E2)                                                                                                                            |
| Weapon Focused                 | Power Distributor                   | G1→G5           | 15    | 3× Anomalous Bulk Scan Data (E1), 4× Cadmium (R3), 5× Classified Scan Databanks (E3), 2× Conductive Components (M2), 4× Electrochemical Arrays (M3), 3× Hybrid Capacitors (M2), 5× Polymer Capacitors (M4), 3× Selenium (R4), 3× Sulphur (R1), 5× Tellurium (R4), 4× Unidentified Scan Archives (E2)                                                                                                                                  |
| Armoured                       | Power Plant                         | G1→G5           | 15    | 5× Carbon (R1), 5× Compound Shielding (M4), 5× Core Dynamics Composites (M5), 3× High Density Composites (M3), 4× Proprietary Composites (M4), 5× Shield Emitters (M2), 4× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2), 1× Worn Shield Emitters (M1)                                                                                                                                                                   |
| Low Emissions                  | Power Plant                         | G1→G5           | 15    | 5× Decoded Emission Data (E4), 4× Germanium (R2), 3× Heat Exchangers (M3), 4× Heat Vanes (M4), 6× Iron (R1), 5× Irregular Emission Data (E2), 5× Niobium (R3), 5× Proto Heat Radiators (M5), 4× Unexpected Emission Data (E3)                                                                                                                                                                                                         |
| Overcharged                    | Power Plant                         | G1→G5           | 15    | 4× Cadmium (R3), 5× Chemical Manipulators (M4), 9× Conductive Ceramics (M3), 5× Conductive Components (M2), 5× Heat Conduction Wiring (M1), 4× Heat Dispersion Plate (M2), 3× Selenium (R4), 1× Sulphur (R1), 5× Tellurium (R4)                                                                                                                                                                                                       |
| Lightweight                    | Prospector Limpet Controller        | G1→G5           | 15    | 8× Conductive Ceramics (M3), 4× Conductive Components (M2), 5× Manganese (R2), 4× Phase Alloys (M3), 1× Phosphorus (R1), 9× Proto Light Alloys (M4), 5× Proto Radiolic Alloys (M5), 5× Salvaged Alloys (M1)                                                                                                                                                                                                                           |
| Reinforced                     | Prospector Limpet Controller        | G1→G5           | 15    | 5× High Density Composites (M3), 9× Molybdenum (R3), 6× Nickel (R1), 5× Shield Emitters (M2), 5× Technetium (R4), 7× Tungsten (R3), 4× Zinc (R2)                                                                                                                                                                                                                                                                                      |
| Shielded                       | Prospector Limpet Controller        | G1→G5           | 15    | 5× Carbon (R1), 5× Compound Shielding (M4), 5× Core Dynamics Composites (M5), 3× High Density Composites (M3), 4× Proprietary Composites (M4), 5× Shield Emitters (M2), 4× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2), 1× Worn Shield Emitters (M1)                                                                                                                                                                   |
| Shielded                       | Refinery                            | G1→G5           | 15    | 5× Carbon (R1), 5× Compound Shielding (M4), 5× Core Dynamics Composites (M5), 3× High Density Composites (M3), 4× Proprietary Composites (M4), 5× Shield Emitters (M2), 4× Shielding Sensors (M3), 5× Tungsten (R3), 4× Vanadium (R2), 1× Worn Shield Emitters (M1)                                                                                                                                                                   |
| Fast Scan                      | Scanners utilitaires                | G1→G5           | 15    | 5× Adaptive Encryptors Capture (E5), 5× Arsenic (R2), 4× Atypical Encryption Archives (E4), 5× Flawed Focus Crystals (M2), 4× Focus Crystals (M3), 4× Manganese (R2), 3× Open Symmetric Keys (E3), 6× Phosphorus (R1), 5× Refined Focus Crystals (M4)                                                                                                                                                                                 |
| Long Range                     | Scanners utilitaires                | G1→G5           | 15    | 5× Abnormal Compact Emissions Data (E5), 4× Decoded Emission Data (E4), 4× Electrochemical Arrays (M3), 4× Germanium (R2), 5× Hybrid Capacitors (M2), 6× Iron (R1), 5× Niobium (R3), 5× Polymer Capacitors (M4), 3× Unexpected Emission Data (E3)                                                                                                                                                                                     |
| Wide Angle                     | Scanners utilitaires                | G1→G5           | 15    | 3× Classified Scan Databanks (E3), 5× Classified Scan Fragment (E5), 4× Divergent Scan Data (E4), 5× Germanium (R2), 5× Mechanical Components (M3), 4× Mechanical Equipment (M2), 6× Mechanical Scrap (M1), 4× Niobium (R3), 5× Tin (R3)                                                                                                                                                                                              |
| Lightweight                    | Sensors                             | G1→G5           | 15    | 8× Conductive Ceramics (M3), 4× Conductive Components (M2), 5× Manganese (R2), 4× Phase Alloys (M3), 1× Phosphorus (R1), 9× Proto Light Alloys (M4), 5× Proto Radiolic Alloys (M5), 5× Salvaged Alloys (M1)                                                                                                                                                                                                                           |
| Long Range                     | Sensors                             | G1→G5           | 15    | 5× Abnormal Compact Emissions Data (E5), 4× Decoded Emission Data (E4), 4× Electrochemical Arrays (M3), 4× Germanium (R2), 5× Hybrid Capacitors (M2), 6× Iron (R1), 5× Niobium (R3), 5× Polymer Capacitors (M4), 3× Unexpected Emission Data (E3)                                                                                                                                                                                     |
| Wide Angle                     | Sensors                             | G1→G5           | 15    | 3× Classified Scan Databanks (E3), 5× Classified Scan Fragment (E5), 4× Divergent Scan Data (E4), 5× Germanium (R2), 5× Mechanical Components (M3), 4× Mechanical Equipment (M2), 6× Mechanical Scrap (M1), 4× Niobium (R3), 5× Tin (R3)                                                                                                                                                                                              |
| Blast Resistant                | Shield Booster                      | G1→G5           | 15    | 5× Aberrant Shield Pattern Analysis (E4), 5× Conductive Components (M2), 5× Exquisite Focus Crystals (M5), 3× Focus Crystals (M3), 4× Germanium (R2), 6× Iron (R1), 5× Niobium (R3), 4× Refined Focus Crystals (M4), 4× Untypical Shield Scans (E3)                                                                                                                                                                                   |
| Heavy Duty                     | Shield Booster                      | G1→G5           | 15    | 5× Antimony (R4), 5× Distorted Shield Cycle Recordings (E1), 4× Electrochemical Arrays (M3), 1× Grid Resistors (M1), 5× Hybrid Capacitors (M2), 4× Inconsistent Shield Soak Analysis (E2), 3× Niobium (R3), 5× Polymer Capacitors (M4), 4× Tin (R3), 5× Untypical Shield Scans (E3)                                                                                                                                                   |
| Kinetic Resistant              | Shield Booster                      | G1→G5           | 15    | 5× Aberrant Shield Pattern Analysis (E4), 5× Exquisite Focus Crystals (M5), 3× Focus Crystals (M3), 4× Galvanising Alloys (M2), 2× Germanium (R2), 2× Grid Resistors (M1), 3× Hybrid Capacitors (M2), 1× Iron (R1), 5× Phase Alloys (M3), 4× Refined Focus Crystals (M4), 3× Salvaged Alloys (M1), 4× Untypical Shield Scans (E3)                                                                                                     |
| Resistance Augmented           | Shield Booster                      | G1→G5           | 15    | 9× Conductive Ceramics (M3), 5× Conductive Components (M2), 3× Focus Crystals (M3), 5× Imperial Shielding (M5), 4× Manganese (R2), 6× Phosphorus (R1), 9× Refined Focus Crystals (M4)                                                                                                                                                                                                                                                 |
| Thermal Resistant              | Shield Booster                      | G1→G5           | 15    | 5× Aberrant Shield Pattern Analysis (E4), 5× Exquisite Focus Crystals (M5), 3× Focus Crystals (M3), 2× Germanium (R2), 5× Heat Conduction Wiring (M1), 7× Heat Dispersion Plate (M2), 5× Heat Exchangers (M3), 1× Iron (R1), 4× Refined Focus Crystals (M4), 4× Untypical Shield Scans (E3)                                                                                                                                           |
| Rapid Charge                   | Shield Cell Bank                    | G1→G4           | 10    | 2× Chromium (R2), 2× Grid Resistors (M1), 7× Hybrid Capacitors (M2), 7× Precipitated Alloys (M3), 8× Sulphur (R1)                                                                                                                                                                                                                                                                                                                     |
| Specialised                    | Shield Cell Bank                    | G1→G4           | 10    | 9× Conductive Components (M2), 7× Cracked Industrial Firmware (E3), 3× Exceptional Scrambled Emission Data (E1), 3× Specialised Legacy Firmware (E1), 4× Yttrium (R4)                                                                                                                                                                                                                                                                 |
| Enhanced Low Power             | Shield Generator                    | G1→G5           | 15    | 6× Distorted Shield Cycle Recordings (E1), 5× Germanium (R2), 4× Inconsistent Shield Soak Analysis (E2), 5× Military Grade Alloys (M5), 4× Niobium (R3), 3× Precipitated Alloys (M3), 4× Thermic Alloys (M4), 5× Tin (R3), 5× Untypical Shield Scans (E3)                                                                                                                                                                             |
| Kinetic Resistant              | Shield Generator                    | G1→G5           | 15    | 6× Distorted Shield Cycle Recordings (E1), 4× Focus Crystals (M3), 4× Inconsistent Shield Soak Analysis (E2), 4× Mercury (R3), 5× Modified Consumer Firmware (E2), 5× Refined Focus Crystals (M4), 5× Ruthenium (R4), 3× Selenium (R4), 5× Untypical Shield Scans (E3)                                                                                                                                                                |
| Reinforced                     | Shield Generator                    | G1→G5           | 15    | 5× Arsenic (R2), 4× Conductive Ceramics (M3), 5× Conductive Components (M2), 5× Conductive Polymers (M4), 4× Configurable Components (M4), 5× Improvised Components (M5), 4× Manganese (R2), 3× Mechanical Components (M3), 6× Phosphorus (R1)                                                                                                                                                                                        |
| Thermal Resistant              | Shield Generator                    | G1→G5           | 15    | 6× Distorted Shield Cycle Recordings (E1), 4× Focus Crystals (M3), 5× Germanium (R2), 4× Inconsistent Shield Soak Analysis (E2), 4× Mercury (R3), 5× Refined Focus Crystals (M4), 5× Ruthenium (R4), 3× Selenium (R4), 5× Untypical Shield Scans (E3)                                                                                                                                                                                 |
| Clean                          | Thrusters                           | G1→G5           | 15    | 5× Abnormal Compact Emissions Data (E5), 9× Conductive Ceramics (M3), 5× Conductive Components (M2), 4× Decoded Emission Data (E4), 4× Modified Consumer Firmware (E2), 5× Specialised Legacy Firmware (E1), 1× Sulphur (R1), 5× Tin (R3), 3× Unexpected Emission Data (E3)                                                                                                                                                           |
| Dirty                          | Thrusters                           | G1→G5           | 15    | 5× Cadmium (R3), 3× Chromium (R2), 4× Configurable Components (M4), 5× Cracked Industrial Firmware (E3), 3× Mechanical Components (M3), 2× Mechanical Equipment (M2), 4× Modified Consumer Firmware (E2), 5× Pharmaceutical Isolators (M5), 4× Selenium (R4), 6× Specialised Legacy Firmware (E1)                                                                                                                                     |
| Reinforced                     | Thrusters                           | G1→G5           | 15    | 1× Carbon (R1), 4× Compound Shielding (M4), 5× Heat Conduction Wiring (M1), 4× Heat Dispersion Plate (M2), 5× Heat Exchangers (M3), 4× High Density Composites (M3), 5× Imperial Shielding (M5), 5× Proprietary Composites (M4), 3× Shielding Sensors (M3), 5× Vanadium (R2)                                                                                                                                                          |

### Matrice Blueprint × Ingénieur × grade maximum, pour les 25 Ingénieurs classiques — qui monte quel plan, et jusqu'où

C'est la table qui répond à « qui peut me monter ce plan au grade 5 ? ». Chaque ligne est un couple **blueprint ×
module** : un même blueprint générique d'arme, par exemple *Long Range*, n'est pas proposé par les mêmes Ingénieurs
selon qu'il s'applique à un Pulse Laser ou à un Rail Gun, et la matrice les distingue donc. Les trois dernières
colonnes répartissent les Ingénieurs selon le **grade maximum** qu'ils atteignent sur ce couple : ceux qui plafonnent
au grade 1-2, ceux qui plafonnent au grade 3-4, et ceux qui montent jusqu'au grade 5. Un tiret signifie qu'aucun
Ingénieur ne se trouve dans cette tranche. 186 lignes, 25 Ingénieurs.

Deux limites à garder en tête. **Les 13 Ingénieurs Odyssey n'y figurent pas** : ni `modules.json` ni `blueprints.json`
ne les référencent, et `engineers.csv` d'EDCD/FDevIDs ne porte que des identifiants (`id`, `system_address`,
`market_id`, `name`), sans aucune association vers un blueprint ou un grade. L'association Ingénieur → grade maximum
pour l'ingénierie à pied est donc **non couverte par les deux jeux de données**. Ensuite, un couple —
*Expanded Capacity* sur le Cargo Rack — n'a **aucun Ingénieur déclaré** dans la source ; il apparaît avec trois
tirets, ce qui traduit un manque du jeu de données et non une impossibilité en jeu.

*(Source : EDCD/coriolis-data, `modifications/modules.json`, commit 0db9234b5b9c, croisé avec
`modifications/blueprints.json` pour les noms affichés des blueprints ; liste des Ingénieurs recoupée avec
EDCD/FDevIDs, `engineers.csv`, commit c35612952dd6.)*

| Blueprint                      | Module concerné                 | Ingénieurs plafonnant au grade 1-2 | Ingénieurs plafonnant au grade 3-4                 | Ingénieurs montant au grade 5                                                    |
|--------------------------------|---------------------------------|------------------------------------|----------------------------------------------------|----------------------------------------------------------------------------------|
| Shielded                       | AFMU                            | —                                  | Bill Turner, Lori Jameson                          | Petra Olmanova                                                                   |
| High Capacity                  | Advanced Missile Rack           | —                                  | Juri Ishmaak                                       | Liz Ryder                                                                        |
| Lightweight                    | Advanced Missile Rack           | —                                  | Juri Ishmaak                                       | Liz Ryder                                                                        |
| Rapid Fire                     | Advanced Missile Rack           | —                                  | Juri Ishmaak                                       | Liz Ryder                                                                        |
| Sturdy                         | Advanced Missile Rack           | —                                  | Juri Ishmaak                                       | Liz Ryder                                                                        |
| Efficient                      | Advanced Multi-Cannon           | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| High Capacity                  | Advanced Multi-Cannon           | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Lightweight                    | Advanced Multi-Cannon           | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Long Range                     | Advanced Multi-Cannon           | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Overcharged                    | Advanced Multi-Cannon           | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Rapid Fire                     | Advanced Multi-Cannon           | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Short Range                    | Advanced Multi-Cannon           | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Sturdy                         | Advanced Multi-Cannon           | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Efficient                      | Beam Laser                      | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Lightweight                    | Beam Laser                      | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Long Range                     | Beam Laser                      | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Overcharged                    | Beam Laser                      | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Short Range                    | Beam Laser                      | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Sturdy                         | Beam Laser                      | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Enhanced Low Power             | Bi-Weave Shield Generator       | —                                  | Didi Vatermann, Elvira Martuuk                     | Lei Cheung, Mel Brandon                                                          |
| Kinetic Resistant              | Bi-Weave Shield Generator       | —                                  | Didi Vatermann, Elvira Martuuk                     | Lei Cheung, Mel Brandon                                                          |
| Reinforced                     | Bi-Weave Shield Generator       | —                                  | Didi Vatermann, Elvira Martuuk                     | Lei Cheung, Mel Brandon                                                          |
| Thermal Resistant              | Bi-Weave Shield Generator       | —                                  | Didi Vatermann, Elvira Martuuk                     | Lei Cheung, Mel Brandon                                                          |
| Blast Resistant                | Bulkheads                       | Liz Ryder                          | —                                                  | Petra Olmanova, Selene Jean                                                      |
| Heavy Duty                     | Bulkheads                       | Liz Ryder                          | —                                                  | Petra Olmanova, Selene Jean                                                      |
| Kinetic Resistant              | Bulkheads                       | Liz Ryder                          | —                                                  | Petra Olmanova, Selene Jean                                                      |
| Lightweight                    | Bulkheads                       | Liz Ryder                          | —                                                  | Petra Olmanova, Selene Jean                                                      |
| Thermal Resistant              | Bulkheads                       | Liz Ryder                          | —                                                  | Petra Olmanova, Selene Jean                                                      |
| Efficient                      | Burst Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Focused                        | Burst Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Lightweight                    | Burst Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Long Range                     | Burst Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Overcharged                    | Burst Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Rapid Fire                     | Burst Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Short Range                    | Burst Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Sturdy                         | Burst Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Efficient                      | Cannon                          | Tod « The Blaster » McQuinn        | —                                                  | Marsha Hicks, The Sarge                                                          |
| High Capacity                  | Cannon                          | Tod « The Blaster » McQuinn        | —                                                  | Marsha Hicks, The Sarge                                                          |
| Lightweight                    | Cannon                          | Tod « The Blaster » McQuinn        | —                                                  | Marsha Hicks, The Sarge                                                          |
| Long Range                     | Cannon                          | Tod « The Blaster » McQuinn        | —                                                  | Marsha Hicks, The Sarge                                                          |
| Overcharged                    | Cannon                          | Tod « The Blaster » McQuinn        | —                                                  | Marsha Hicks, The Sarge                                                          |
| Rapid Fire                     | Cannon                          | Tod « The Blaster » McQuinn        | —                                                  | Marsha Hicks, The Sarge                                                          |
| Short Range                    | Cannon                          | Tod « The Blaster » McQuinn        | —                                                  | Marsha Hicks, The Sarge                                                          |
| Sturdy                         | Cannon                          | Tod « The Blaster » McQuinn        | —                                                  | Marsha Hicks, The Sarge                                                          |
| Expanded Capacity              | Cargo Rack                      | —                                  | —                                                  | —                                                                                |
| Fast Scan                      | Cargo Scanner                   | —                                  | Felicity Farseer, Hera Tani                        | Bill Turner, Etienne Dorn, Juri Ishmaak, Lei Cheung, Lori Jameson, Tiana Fortune |
| Lightweight                    | Cargo Scanner                   | —                                  | Felicity Farseer, Hera Tani                        | Bill Turner, Etienne Dorn, Juri Ishmaak, Lei Cheung, Lori Jameson, Tiana Fortune |
| Long Range                     | Cargo Scanner                   | —                                  | Felicity Farseer, Hera Tani                        | Bill Turner, Etienne Dorn, Juri Ishmaak, Lei Cheung, Lori Jameson, Tiana Fortune |
| Reinforced                     | Cargo Scanner                   | —                                  | Felicity Farseer, Hera Tani                        | Bill Turner, Etienne Dorn, Juri Ishmaak, Lei Cheung, Lori Jameson, Tiana Fortune |
| Shielded                       | Cargo Scanner                   | —                                  | Felicity Farseer, Hera Tani                        | Bill Turner, Etienne Dorn, Juri Ishmaak, Lei Cheung, Lori Jameson, Tiana Fortune |
| Wide Angle                     | Cargo Scanner                   | —                                  | Felicity Farseer, Hera Tani                        | Bill Turner, Etienne Dorn, Juri Ishmaak, Lei Cheung, Lori Jameson, Tiana Fortune |
| Ammo Capacity                  | Caustic Sink Launcher           | Petra Olmanova, Ram Tah            | —                                                  | —                                                                                |
| Lightweight                    | Caustic Sink Launcher           | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Reinforced                     | Caustic Sink Launcher           | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Shielded                       | Caustic Sink Launcher           | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Ammo Capacity                  | Chaff Launcher                  | Petra Olmanova, Ram Tah            | —                                                  | —                                                                                |
| Lightweight                    | Chaff Launcher                  | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Reinforced                     | Chaff Launcher                  | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Shielded                       | Chaff Launcher                  | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Lightweight                    | Collector Limpet Controller     | —                                  | Ram Tah                                            | Marsha Hicks, The Sarge, Tiana Fortune                                           |
| Reinforced                     | Collector Limpet Controller     | —                                  | Ram Tah                                            | Marsha Hicks, The Sarge, Tiana Fortune                                           |
| Shielded                       | Collector Limpet Controller     | —                                  | Ram Tah                                            | Marsha Hicks, The Sarge, Tiana Fortune                                           |
| Expanded Probe Scanning Radius | Detailed Surface Scanner        | —                                  | Felicity Farseer, Tiana Fortune                    | Bill Turner, Etienne Dorn, Hera Tani, Juri Ishmaak, Lei Cheung, Lori Jameson     |
| Lightweight                    | Electronic Countermeasure       | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Reinforced                     | Electronic Countermeasure       | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Shielded                       | Electronic Countermeasure       | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Double Shot                    | Fragment Cannon                 | —                                  | Tod « The Blaster » McQuinn                        | Marsha Hicks, Zacariah Nemo                                                      |
| Efficient                      | Fragment Cannon                 | —                                  | Tod « The Blaster » McQuinn                        | Marsha Hicks, Zacariah Nemo                                                      |
| High Capacity                  | Fragment Cannon                 | —                                  | Tod « The Blaster » McQuinn                        | Marsha Hicks, Zacariah Nemo                                                      |
| Lightweight                    | Fragment Cannon                 | —                                  | Tod « The Blaster » McQuinn                        | Marsha Hicks, Zacariah Nemo                                                      |
| Overcharged                    | Fragment Cannon                 | —                                  | Tod « The Blaster » McQuinn                        | Marsha Hicks, Zacariah Nemo                                                      |
| Rapid Fire                     | Fragment Cannon                 | —                                  | Tod « The Blaster » McQuinn                        | Marsha Hicks, Zacariah Nemo                                                      |
| Sturdy                         | Fragment Cannon                 | —                                  | Tod « The Blaster » McQuinn                        | Marsha Hicks, Zacariah Nemo                                                      |
| Faster Boot Sequence           | Frame Shift Drive               | —                                  | Chloe Sedesi, Colonel Bris Dekker, Professor Palin | Elvira Martuuk, Felicity Farseer, Mel Brandon                                    |
| Increased Range                | Frame Shift Drive               | —                                  | Chloe Sedesi, Colonel Bris Dekker, Professor Palin | Elvira Martuuk, Felicity Farseer, Mel Brandon                                    |
| Shielded                       | Frame Shift Drive               | —                                  | Chloe Sedesi, Colonel Bris Dekker, Professor Palin | Elvira Martuuk, Felicity Farseer, Mel Brandon                                    |
| Expanded Capture Arc           | Frame Shift Drive Interdictor   | Felicity Farseer                   | Colonel Bris Dekker, Tiana Fortune                 | Mel Brandon                                                                      |
| Long Range                     | Frame Shift Drive Interdictor   | Felicity Farseer                   | Colonel Bris Dekker, Tiana Fortune                 | Mel Brandon                                                                      |
| Fast Scan                      | Frame Shift Wake Scanner        | —                                  | Bill Turner, Juri Ishmaak, Lori Jameson            | Etienne Dorn, Tiana Fortune                                                      |
| Lightweight                    | Frame Shift Wake Scanner        | —                                  | Bill Turner, Juri Ishmaak, Lori Jameson            | Etienne Dorn, Tiana Fortune                                                      |
| Long Range                     | Frame Shift Wake Scanner        | —                                  | Bill Turner, Juri Ishmaak, Lori Jameson            | Etienne Dorn, Tiana Fortune                                                      |
| Reinforced                     | Frame Shift Wake Scanner        | —                                  | Bill Turner, Juri Ishmaak, Lori Jameson            | Etienne Dorn, Tiana Fortune                                                      |
| Shielded                       | Frame Shift Wake Scanner        | —                                  | Bill Turner, Juri Ishmaak, Lori Jameson            | Etienne Dorn, Tiana Fortune                                                      |
| Wide Angle                     | Frame Shift Wake Scanner        | —                                  | Bill Turner, Juri Ishmaak, Lori Jameson            | Etienne Dorn, Tiana Fortune                                                      |
| Shielded                       | Fuel Scoop                      | —                                  | Bill Turner, Lori Jameson                          | Marsha Hicks                                                                     |
| Lightweight                    | Fuel Transfer Limpet Controller | —                                  | Ram Tah                                            | Marsha Hicks, The Sarge, Tiana Fortune                                           |
| Reinforced                     | Fuel Transfer Limpet Controller | —                                  | Ram Tah                                            | Marsha Hicks, The Sarge, Tiana Fortune                                           |
| Shielded                       | Fuel Transfer Limpet Controller | —                                  | Ram Tah                                            | Marsha Hicks, The Sarge, Tiana Fortune                                           |
| Lightweight                    | Hatch Breaker Limpet Controller | —                                  | Ram Tah                                            | Marsha Hicks, The Sarge, Tiana Fortune                                           |
| Reinforced                     | Hatch Breaker Limpet Controller | —                                  | Ram Tah                                            | Marsha Hicks, The Sarge, Tiana Fortune                                           |
| Shielded                       | Hatch Breaker Limpet Controller | —                                  | Ram Tah                                            | Marsha Hicks, The Sarge, Tiana Fortune                                           |
| Ammo Capacity                  | Heat Sink Launcher              | Petra Olmanova, Ram Tah            | —                                                  | —                                                                                |
| Lightweight                    | Heat Sink Launcher              | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Reinforced                     | Heat Sink Launcher              | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Shielded                       | Heat Sink Launcher              | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Blast Resistant                | Hull Reinforcement Package      | Liz Ryder                          | —                                                  | Petra Olmanova, Selene Jean                                                      |
| Heavy Duty                     | Hull Reinforcement Package      | Liz Ryder                          | —                                                  | Petra Olmanova, Selene Jean                                                      |
| Kinetic Resistant              | Hull Reinforcement Package      | Liz Ryder                          | —                                                  | Petra Olmanova, Selene Jean                                                      |
| Lightweight                    | Hull Reinforcement Package      | Liz Ryder                          | —                                                  | Petra Olmanova, Selene Jean                                                      |
| Thermal Resistant              | Hull Reinforcement Package      | Liz Ryder                          | —                                                  | Petra Olmanova, Selene Jean                                                      |
| Fast Scan                      | Kill Warrant Scanner            | —                                  | Bill Turner, Juri Ishmaak, Lori Jameson            | Etienne Dorn, Tiana Fortune                                                      |
| Lightweight                    | Kill Warrant Scanner            | —                                  | Bill Turner, Juri Ishmaak, Lori Jameson            | Etienne Dorn, Tiana Fortune                                                      |
| Long Range                     | Kill Warrant Scanner            | —                                  | Bill Turner, Juri Ishmaak, Lori Jameson            | Etienne Dorn, Tiana Fortune                                                      |
| Reinforced                     | Kill Warrant Scanner            | —                                  | Bill Turner, Juri Ishmaak, Lori Jameson            | Etienne Dorn, Tiana Fortune                                                      |
| Shielded                       | Kill Warrant Scanner            | —                                  | Bill Turner, Juri Ishmaak, Lori Jameson            | Etienne Dorn, Tiana Fortune                                                      |
| Wide Angle                     | Kill Warrant Scanner            | —                                  | Bill Turner, Juri Ishmaak, Lori Jameson            | Etienne Dorn, Tiana Fortune                                                      |
| Lightweight                    | Life Support                    | —                                  | Bill Turner, Lori Jameson                          | Etienne Dorn                                                                     |
| Reinforced                     | Life Support                    | —                                  | Bill Turner, Lori Jameson                          | Etienne Dorn                                                                     |
| Shielded                       | Life Support                    | —                                  | Bill Turner, Lori Jameson                          | Etienne Dorn                                                                     |
| High Capacity                  | Mine Launcher                   | —                                  | Liz Ryder                                          | Juri Ishmaak, Petra Olmanova                                                     |
| Lightweight                    | Mine Launcher                   | —                                  | Liz Ryder                                          | Juri Ishmaak, Petra Olmanova                                                     |
| Rapid Fire                     | Mine Launcher                   | —                                  | Liz Ryder                                          | Juri Ishmaak, Petra Olmanova                                                     |
| Sturdy                         | Mine Launcher                   | —                                  | Liz Ryder                                          | Juri Ishmaak, Petra Olmanova                                                     |
| Efficient                      | Multi-Cannon                    | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| High Capacity                  | Multi-Cannon                    | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Lightweight                    | Multi-Cannon                    | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Long Range                     | Multi-Cannon                    | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Overcharged                    | Multi-Cannon                    | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Rapid Fire                     | Multi-Cannon                    | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Short Range                    | Multi-Cannon                    | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Sturdy                         | Multi-Cannon                    | —                                  | Zacariah Nemo                                      | Marsha Hicks, Tod « The Blaster » McQuinn                                        |
| Efficient                      | Plasma Accelerator              | Zacariah Nemo                      | —                                                  | Bill Turner, Etienne Dorn                                                        |
| Focused                        | Plasma Accelerator              | Zacariah Nemo                      | —                                                  | Bill Turner, Etienne Dorn                                                        |
| Lightweight                    | Plasma Accelerator              | Zacariah Nemo                      | —                                                  | Bill Turner, Etienne Dorn                                                        |
| Long Range                     | Plasma Accelerator              | Zacariah Nemo                      | —                                                  | Bill Turner, Etienne Dorn                                                        |
| Overcharged                    | Plasma Accelerator              | Zacariah Nemo                      | —                                                  | Bill Turner, Etienne Dorn                                                        |
| Rapid Fire                     | Plasma Accelerator              | Zacariah Nemo                      | —                                                  | Bill Turner, Etienne Dorn                                                        |
| Short Range                    | Plasma Accelerator              | Zacariah Nemo                      | —                                                  | Bill Turner, Etienne Dorn                                                        |
| Sturdy                         | Plasma Accelerator              | Zacariah Nemo                      | —                                                  | Bill Turner, Etienne Dorn                                                        |
| Ammo Capacity                  | Point Defence                   | Petra Olmanova, Ram Tah            | —                                                  | —                                                                                |
| Lightweight                    | Point Defence                   | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Reinforced                     | Point Defence                   | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Shielded                       | Point Defence                   | —                                  | —                                                  | Petra Olmanova, Ram Tah                                                          |
| Charge Enhanced                | Power Distributor               | —                                  | Hera Tani, Marco Qwent                             | Etienne Dorn, The Dweller                                                        |
| Engine Focused                 | Power Distributor               | —                                  | Hera Tani, Marco Qwent                             | Etienne Dorn, The Dweller                                                        |
| High Charge Capacity           | Power Distributor               | —                                  | Hera Tani, Marco Qwent                             | Etienne Dorn, The Dweller                                                        |
| Shielded                       | Power Distributor               | —                                  | Hera Tani, Marco Qwent                             | Etienne Dorn, The Dweller                                                        |
| System Focused                 | Power Distributor               | —                                  | Hera Tani, Marco Qwent                             | Etienne Dorn, The Dweller                                                        |
| Weapon Focused                 | Power Distributor               | —                                  | Hera Tani, Marco Qwent                             | Etienne Dorn, The Dweller                                                        |
| Armoured                       | Power Plant                     | Felicity Farseer                   | Marco Qwent                                        | Etienne Dorn, Hera Tani                                                          |
| Low Emissions                  | Power Plant                     | Felicity Farseer                   | Marco Qwent                                        | Etienne Dorn, Hera Tani                                                          |
| Overcharged                    | Power Plant                     | Felicity Farseer                   | Marco Qwent                                        | Etienne Dorn, Hera Tani                                                          |
| Enhanced Low Power             | Prismatic Shield Generator      | —                                  | Didi Vatermann, Elvira Martuuk                     | Lei Cheung, Mel Brandon                                                          |
| Kinetic Resistant              | Prismatic Shield Generator      | —                                  | Didi Vatermann, Elvira Martuuk                     | Lei Cheung, Mel Brandon                                                          |
| Reinforced                     | Prismatic Shield Generator      | —                                  | Didi Vatermann, Elvira Martuuk                     | Lei Cheung, Mel Brandon                                                          |
| Thermal Resistant              | Prismatic Shield Generator      | —                                  | Didi Vatermann, Elvira Martuuk                     | Lei Cheung, Mel Brandon                                                          |
| Lightweight                    | Prospector Limpet Controller    | —                                  | Ram Tah                                            | Marsha Hicks, The Sarge, Tiana Fortune                                           |
| Reinforced                     | Prospector Limpet Controller    | —                                  | Ram Tah                                            | Marsha Hicks, The Sarge, Tiana Fortune                                           |
| Shielded                       | Prospector Limpet Controller    | —                                  | Ram Tah                                            | Marsha Hicks, The Sarge, Tiana Fortune                                           |
| Efficient                      | Pulse Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Focused                        | Pulse Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Lightweight                    | Pulse Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Long Range                     | Pulse Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Overcharged                    | Pulse Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Rapid Fire                     | Pulse Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Short Range                    | Pulse Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| Sturdy                         | Pulse Laser                     | —                                  | The Dweller                                        | Broo Tarquin, Mel Brandon                                                        |
| High Capacity                  | Rail Gun                        | —                                  | The Sarge                                          | Etienne Dorn, Tod « The Blaster » McQuinn                                        |
| Lightweight                    | Rail Gun                        | —                                  | The Sarge                                          | Etienne Dorn, Tod « The Blaster » McQuinn                                        |
| Long Range                     | Rail Gun                        | —                                  | The Sarge                                          | Etienne Dorn, Tod « The Blaster » McQuinn                                        |
| Short Range                    | Rail Gun                        | —                                  | The Sarge                                          | Etienne Dorn, Tod « The Blaster » McQuinn                                        |
| Sturdy                         | Rail Gun                        | —                                  | The Sarge                                          | Etienne Dorn, Tod « The Blaster » McQuinn                                        |
| Shielded                       | Refinery                        | —                                  | Bill Turner, Lori Jameson                          | Marsha Hicks                                                                     |
| High Capacity                  | Seeker/Dumbfire Missile Rack    | —                                  | Juri Ishmaak                                       | Liz Ryder, Petra Olmanova                                                        |
| Lightweight                    | Seeker/Dumbfire Missile Rack    | —                                  | Juri Ishmaak                                       | Liz Ryder, Petra Olmanova                                                        |
| Rapid Fire                     | Seeker/Dumbfire Missile Rack    | —                                  | Juri Ishmaak                                       | Liz Ryder, Petra Olmanova                                                        |
| Sturdy                         | Seeker/Dumbfire Missile Rack    | —                                  | Juri Ishmaak                                       | Liz Ryder, Petra Olmanova                                                        |
| Lightweight                    | Sensors                         | —                                  | Felicity Farseer, Hera Tani                        | Bill Turner, Etienne Dorn, Juri Ishmaak, Lei Cheung, Lori Jameson, Tiana Fortune |
| Long Range                     | Sensors                         | —                                  | Felicity Farseer, Hera Tani                        | Bill Turner, Etienne Dorn, Juri Ishmaak, Lei Cheung, Lori Jameson, Tiana Fortune |
| Wide Angle                     | Sensors                         | —                                  | Felicity Farseer, Hera Tani                        | Bill Turner, Etienne Dorn, Juri Ishmaak, Lei Cheung, Lori Jameson, Tiana Fortune |
| Blast Resistant                | Shield Booster                  | Felicity Farseer                   | Lei Cheung                                         | Didi Vatermann, Mel Brandon                                                      |
| Heavy Duty                     | Shield Booster                  | Felicity Farseer                   | Lei Cheung                                         | Didi Vatermann, Mel Brandon                                                      |
| Kinetic Resistant              | Shield Booster                  | Felicity Farseer                   | Lei Cheung                                         | Didi Vatermann, Mel Brandon                                                      |
| Resistance Augmented           | Shield Booster                  | Felicity Farseer                   | Lei Cheung                                         | Didi Vatermann, Mel Brandon                                                      |
| Thermal Resistant              | Shield Booster                  | Felicity Farseer                   | Lei Cheung                                         | Didi Vatermann, Mel Brandon                                                      |
| Rapid Charge                   | Shield Cell Bank                | Elvira Martuuk                     | Lori Jameson, Mel Brandon                          | —                                                                                |
| Specialised                    | Shield Cell Bank                | Elvira Martuuk                     | Lori Jameson, Mel Brandon                          | —                                                                                |
| Enhanced Low Power             | Shield Generator                | —                                  | Didi Vatermann, Elvira Martuuk                     | Lei Cheung, Mel Brandon                                                          |
| Kinetic Resistant              | Shield Generator                | —                                  | Didi Vatermann, Elvira Martuuk                     | Lei Cheung, Mel Brandon                                                          |
| Reinforced                     | Shield Generator                | —                                  | Didi Vatermann, Elvira Martuuk                     | Lei Cheung, Mel Brandon                                                          |
| Thermal Resistant              | Shield Generator                | —                                  | Didi Vatermann, Elvira Martuuk                     | Lei Cheung, Mel Brandon                                                          |
| Clean                          | Thrusters                       | Elvira Martuuk                     | Felicity Farseer                                   | Chloe Sedesi, Mel Brandon, Professor Palin                                       |
| Dirty                          | Thrusters                       | Elvira Martuuk                     | Felicity Farseer                                   | Chloe Sedesi, Mel Brandon, Professor Palin                                       |
| Reinforced                     | Thrusters                       | Elvira Martuuk                     | Felicity Farseer                                   | Chloe Sedesi, Mel Brandon, Professor Palin                                       |
| Lightweight                    | Torpedo Pylon                   | —                                  | Juri Ishmaak                                       | Liz Ryder, Petra Olmanova                                                        |
| Sturdy                         | Torpedo Pylon                   | —                                  | Juri Ishmaak                                       | Liz Ryder, Petra Olmanova                                                        |

## Exemples de builds FSD chiffrés

Plutôt qu'un exemple isolé, voici la mécanique complète de calcul, avec **matériaux, prix et effet réel sur la masse
optimale** pour trois builds concrets. Le tableau de coût en matériaux par grade ci-dessous reste la référence
(inchangé et déjà vérifié face à `blueprints.json`) :

| Grade | Matériaux requis (Increased Range, FSD, tous vaisseaux)             |
|-------|---------------------------------------------------------------------|
| 1     | Atypical Disrupted Wake Echoes                                      |
| 2     | + Chemical Processors                                               |
| 3     | Phosphorus + Chemical Processors + Strange Wake Solutions           |
| 4     | Manganese + Chemical Distillery + Eccentric Hyperspace Trajectories |
| 5     | Arsenic + Chemical Manipulators + Datamined Wake Exceptions         |

Ces quantités sont **par roll**, à raison d'**une unité de chaque matériau listé**. Le coût réel d'un grade se lit
donc dans la fiche chiffrée du blueprint donnée plus haut — « Portée accrue — Frame Shift Drive » — qui multiplie
chaque ligne par le nombre de rolls requis à réputation 5, et donne le total consolidé d'une montée G1→G5. Cette même
table est confirmée **à l'identique par cinq jeux de données indépendants** (Inara, `EDCD/coriolis-data`, EDEngineer,
EDSY et le wiki communautaire), constat repris de l'étude interne
`docs/faisabilite-spansh-temps-reel-materiaux.md`, § 3.3 (étude du 19 août 2026).

**Point clé, souvent ignoré des guides :** ce coût en matériaux est **identique quelle que soit la classe du FSD** (un
FSD de classe 2 sur une Sidewinder et un FSD de classe 8 sur une Panther Clipper coûtent exactement les mêmes
matériaux pour le même grade). Seuls le **prix d'achat du module lui-même** et son **effet en masse optimale (tonnes)**
changent avec la classe/le rating.

### La formule de portée de saut du FSD, et l'effet réel d'*Increased Range*

Portée maximale d'un saut (formule officielle, documentée par la communauté depuis 2015 et toujours d'actualité) :

```
d = (MasseOptimaleFSD / MasseVaisseau) × (CarburantMaxParSaut × 1000 / ConstanteLinéaire) ^ (1 / ConstantePuissance)
```

- **Constante linéaire** (dépend du *rating*) : A = 12, B = 10, C = 8, D = 10, E = 11.
- **Constante de puissance** (dépend de la *classe*) : classe 2 = 2,00 ; classe 3 = 2,15 ; classe 4 = 2,30 ; classe 5 =
  2,45 ; classe 6 = 2,60 ; classe 7 = 2,75 ; classe 8 = 2,90.

*(Source : wiki communautaire Elite Dangerous, page « Frame Shift Drive », section « Hyperspace Fuel Equation »,
consultée le 9 septembre 2026 — formule stable depuis 2015, non affectée par les mises à jour récentes.)*

Une écriture équivalente, plus proche de la façon dont les simulateurs la calculent, figure dans l'étude interne :

```
saut = (carburant / fuelmul) ^ (1 / fuelpower) × MasseOptimaleFSD / (MasseVaisseau + carburant) + bonus
```

Le terme `bonus` couvre les apports additifs (Guardian FSD Booster, notamment) qui s'ajoutent après le calcul
proportionnel. La lecture importante est la même dans les deux écritures : **la distance de saut est linéaire en masse
optimale du FSD**.

#### Effet chiffré d'*Increased Range* sur la masse optimale du FSD : des valeurs fixes depuis l'Update 18.08

La modification **Increased Range** agit précisément sur cette masse optimale. **Correction de cette révision : ses
valeurs ne sont plus des fourchettes.** Les versions antérieures de ce guide annonçaient « +0 à +15 % au grade 1,
+45 % à +55 % au grade 5 selon le tirage » — une formulation d'avant l'**Update 18.08 du 7 août 2024**, qui a rendu
les rolls **déterministes**. Les valeurs exactes, déclarées grade par grade par le catalogue de blueprints consolidé
(édition 2026-08), sont **fixes** :

| Grade | Effet sur la masse optimale du FSD |
|-------|------------------------------------|
| 1     | +15 %                              |
| 2     | +25 %                              |
| 3     | +35 %                              |
| 4     | +45 %                              |
| 5     | +55 %                              |

**Attention à ne pas confondre +55 % de masse optimale et +55 % de portée réelle** : le blueprint ajoute aussi **+30 %
à la masse du module FSD lui-même**, qui vient s'ajouter à la masse du vaisseau au dénominateur de la formule. Le gain
net est donc de quelques points de pourcentage inférieur à +55 %, l'écart dépendant du rapport entre la masse du FSD
et celle du vaisseau — négligeable sur un gros vaisseau, sensible sur un petit. Un ordre de grandeur souvent cité, « de
+10 à +15 al », est **plausible pour un vaisseau moyen mais reste un ordre de grandeur, pas une valeur** : seule la
formule appliquée à votre loadout donne le chiffre.

#### *Mass Manager*, *Deep Charge* et le multiplicateur ×1,61 — et le cas du FSD SCO

L'effet expérimental **Mass Manager** ajoute **+4 %** supplémentaires à la masse optimale (au prix de −8 % d'intégrité
du module) ; il nécessite 5× Atypical Disrupted Wake Echoes, 3× Galvanising Alloys et 1× Eccentric Hyperspace
Trajectories *(source : wiki communautaire, page « Mass Manager », recoupée avec `specials.json` de Coriolis, et
confirmée à l'identique par le catalogue de blueprints consolidé, édition 2026-08)*. Son concurrent
**Deep Charge** coûte exactement les mêmes matériaux pour **+10 % de carburant maximum par saut** — voir l'arbitrage
détaillé dans la fiche du blueprint plus haut.

Combinés, **Grade 5 Increased Range + Mass Manager multiplient la masse optimale du FSD par ×1,61** (1,55 × 1,04), et
donc, à masse de vaisseau égale, la portée de saut par le même facteur. Ce multiplicateur, autrefois donné comme une
fourchette ×1,51 à ×1,61 « selon le tirage », est **désormais une valeur unique** depuis que les rolls sont
déterministes. C'est cette proportionnalité, indépendante de la classe de FSD, qui permet les trois builds ci-dessous.

> **Le FSD SCO ne change rien au blueprint.** *Increased Range* s'applique aux deux familles de modules — FSD classique
> et FSD Supercruise Overcharge — avec **les mêmes matériaux**. En revanche, les attributs propres au SCO (vitesse,
> accélération, chaleur, consommation en overcharge) **ne sont pas modifiables par l'ingénierie**. Réserve à connaître :
> ce point est établi via le mappage module→blueprints d'EDSY, qui porte lui-même un commentaire `// TODO verify` ;
> Coriolis, de son côté, n'a **aucune** donnée SCO. Pour planifier un build SCO ingénié, c'est donc EDSY, pas Coriolis.
> *(Source : étude interne `docs/faisabilite-spansh-temps-reel-materiaux.md`, § 3.3, étude du 19 août 2026.)*

### Build 1 — Explorateur économique (Diamondback Explorer, FSD 5A, grade 3 seul)

- Vaisseau : **Diamondback Explorer** (Lakon), FSD stock de classe 5.
- Objectif : un premier palier de portée avec des matériaux courants, sans viser le grade 5 immédiatement.
- Masse optimale FSD 5A stock : **1 050 t** ; grade 3 : ×1,35 → **1 418 t** *(valeur fixe, corrigée : la fourchette
  « ×1,25 à ×1,35 » des versions antérieures supposait un tirage aléatoire, supprimé par l'Update 18.08)*.
- Matériaux cumulés (grades 1 à 3, **à réputation 5**, soit 1 + 2 + 3 = 6 rolls) : 3× Atypical Disrupted Wake Echoes,
  5× Chemical Processors, 3× Phosphorus, 3× Strange Wake Solutions — **14 unités, 4 matériaux distincts, tous de grade
  1 à 3** (obtenables tôt en partie). *Correction : les versions antérieures annonçaient 6 unités, ce qui revenait à
  compter une seule application par grade ; les données donnent 1 roll au grade 1, 2 au grade 2 et 3 au
  grade 3 pour un commandant de réputation 5 — et davantage en dessous.*
- Coût en crédits de l'ingénierie elle-même : **0 Cr** (l'application d'un blueprint ne coûte que des matériaux ; seul
  l'achat initial du module 5A, si non déjà monté, coûte des crédits — voir prix ci-dessous).

### Build 2 — Explorateur optimisé (Diamondback Explorer, FSD 5A, grade 5 + Mass Manager)

- Même vaisseau, FSD 5A poussé au maximum.
- Prix d'achat du module FSD 5A (si à remplacer) : **5 103 953 Cr** *(source : spécifications FSD, wiki communautaire,
  tableau des classes/ratings, consulté le 9 septembre 2026)*.
- Masse optimale FSD 5A stock 1 050 t → engineeré grade 5 + Mass Manager : **1 693 t** (×1,61, valeur fixe).
- Matériaux cumulés (grades 1 à 5 **à réputation 5**, soit 15 rolls, + Mass Manager) : 8× Atypical Disrupted Wake
  Echoes, 5× Chemical Processors, 3× Phosphorus, 3× Strange Wake Solutions, 4× Chemical Distillery, 5× Eccentric
  Hyperspace Trajectories, 4× Manganese, 5× Arsenic, 5× Chemical Manipulators, 5× Datamined Wake Exceptions, 3×
  Galvanising Alloys — **50 unités, 11 matériaux distincts**, aucun au-delà du grade 5. *Correction : le total de
  21 unités des versions antérieures comptait une seule application par grade ; il faut N rolls pour un grade N à
  réputation 5.*
- **Le point dur de ce build est identifié** : les **5× Datamined Wake Exceptions**, matériau de grade 5 de la
  catégorie Wake Scans, inaccessible sans Frame Shift Wake Scanner. Prévoyez le module, ou la conversion descendante au
  comptoir Encoded, avant de planifier le trajet vers l'Ingénieur.
- **Portée de saut finale obtenue** : dépend de la masse totale embarquée de votre configuration précise (coque +
  modules + carburant), qui n'est pas invariante d'un loadout à l'autre. Reportez la masse indiquée par Coriolis.io,
  EDSY.org ou l'écran Vaisseau en jeu dans la formule ci-dessus pour l'obtenir exactement ; le multiplicateur ×1,61
  calculé ci-dessus, lui, est constant et vérifiable indépendamment du reste du fit — sous réserve du +30 % de masse du
  module lui-même, signalé plus haut.

### Build 3 — Vaisseau lourd longue distance (Anaconda, FSD 6A, grade 5 + Mass Manager)

- Vaisseau : **Anaconda** (Faulcon DeLacy), FSD de classe 6 (rating A).
- Prix d'achat du module FSD 6A : **16 179 531 Cr** *(même source que ci-dessus)*.
- Masse optimale FSD 6A stock : **1 800 t** → engineeré grade 5 + Mass Manager : **2 902 t** (même multiplicateur
  ×1,61 que le Build 2 — la classe du FSD ne change pas le pourcentage de gain, seulement les tonnes de départ).
- Matériaux nécessaires : **identiques au Build 2** (le coût en matériaux d'un blueprint ne dépend que de son grade, pas
  de la classe du module modifié — voir « Point clé » ci-dessus).
- Comme pour le Build 2, la portée finale en années-lumière dépend de la masse totale de la configuration : à
  reproduire dans Coriolis.io ou EDSY.org avec votre propre loadout pour obtenir un chiffre exact et à jour.

*Les masses optimales et prix de modules ci-dessus sont des grandeurs stables (mécanique de jeu, non sujettes aux
fluctuations de marché) ; ils ont été calculés à partir des spécifications techniques publiées du Frame Shift Drive et
n'ont pas de date de péremption attendue, contrairement à un classement Powerplay ou un prix ARX.*

## Ingénierie de l'équipement Odyssey (à pied)

Depuis l'extension **Odyssey** (2021), l'ingénierie s'étend aux **combinaisons** et **armes de poing** portées lors des
sorties à pied, via 13 Ingénieurs dédiés (voir le tableau plus haut). Les grandes différences avec l'ingénierie des
vaisseaux :

- les modifications s'appliquent **chez l'Ingénieur physiquement**, en sortant de son vaisseau dans un starport — il
  n'y a pas d'équivalent de la synthèse à distance ;
- une modification posée est **définitive** : elle ne peut ni être retirée, ni remplacée par une autre, ce qui impose
  de planifier son build avant d'engager les matériaux ;
- les matériaux à pied relèvent des quatre catégories officielles du journal de jeu (**Item, Component, Data,
  Consumable**), distinctes des catégories Raw/Manufactured/Encoded réservées aux matériaux de vaisseau ; les termes
  **Chemical / Circuit / Tech**, usuels dans l'UI et la communauté, ne sont pas des catégories officielles mais une
  subdivision interne de `Component` — voir [26 — Ingénierie à pied avancée](./26-ingenierie-a-pied-avancee.md),
  qui fait référence sur ce point ;
- la collecte passe surtout par les **missions** proposées aux terminaux à pied des stations, plutôt que par le
  farming spatial classique.

Le détail complet — les 13 Ingénieurs à pied et leurs chaînes de déblocage, les blueprints de combinaison et d'arme
avec effets et coûts en crédits, et les recommandations de build par style de jeu (combat, exploration, infiltration)
— est traité en profondeur dans **[07 — Équipement à pied, section « L'ingénierie à pied (Engineering) »
](./07-equipement-a-pied.md#lingénierie-à-pied-engineering-dodyssey--engineers-blueprints-et-modifications-irréversibles)**, pour éviter de dupliquer un contenu qui a sa place
naturelle dans ce guide dédié à l'équipement. Ce guide-ci se concentre sur l'ingénierie des **vaisseaux** et sur les
mécaniques transverses (matériaux, Technology Brokers) communes aux deux volets.

## Effets expérimentaux — matrice de compatibilité, effets chiffrés et coûts

Un module ne peut porter qu'**un seul effet expérimental**, en plus de sa modification de grade. Le jeu de données de
Coriolis en décrit **91 entrées** pour **66 noms distincts** : un même effet — *Double Braced*,
*Stripped Down*, *Flow Control*, *Angled Plating*… — existe en plusieurs recettes selon la famille de module à
laquelle il s'applique, avec des matériaux différents. C'est pourquoi chaque ligne porte aussi sa **clé interne**,
qui est l'identifiant réellement stocké dans le fichier source et permet de retrouver la bonne variante.

### Ce que les sources couvrent, et ce qu'elles ne couvrent pas

Trois des cinq colonnes attendues sont pleinement documentées par les sources reproductibles : la **compatibilité
module → effet**, le **coût en matériaux avec ses quantités**, et une **description de l'effet**. Les deux autres ne
le sont pas, et il faut le dire plutôt que de combler :

- **Aucune valeur numérique.** `specials.json` ne porte que les champs `id`, `edname`, `name`, `uuid`, `components`
  et `description` : il n'existe **aucun champ chiffrant l'effet** d'un effet expérimental, contrairement aux
  blueprints, qui portent un bloc `features`. La colonne « Effet obtenu » ci-dessous résume donc la description
  textuelle de la source, sans pourcentage. Les deux seuls effets chiffrés de ce guide — *Mass Manager* à
  **+4 % de masse optimale pour −8 % d'intégrité**, et *Deep Charge* à **+10 % de carburant maximum par saut** —
  proviennent de l'étude interne du 19 août 2026 citée plus haut, pas de Coriolis.
- **Aucune association vers un Ingénieur.** Ni `specials.json`, ni `modules.json`, ni `engineers.csv` d'EDCD/FDevIDs
  ne disent quel Ingénieur propose quel effet expérimental. La colonne « Ingénieurs le proposant » porte donc
  « non couvert par le jeu de données » sur la totalité des lignes : c'est un manque de la source, pas une absence en
  jeu. À vérifier dans l'onglet Ingénieurs ou sur Inara.

Deux autres relevés : quatre effets — *Choke canister*, *Feedback Cascade*, *Plasma Slug* et *Super Penetrator* —
n'ont **aucune liste de matériaux** dans la source, et *Choke canister* n'a même pas de description ; par ailleurs
*Choke canister* et *Deep Cut Payload* ne sont référencés par **aucun module**, ce qui suggère des entrées héritées
ou non implémentées.

### Matrice de compatibilité des 66 effets expérimentaux et de leurs 91 recettes — modules acceptés, effet et coût

La colonne « Modules et armes compatibles » est le cœur de cette section : elle répond à la question que le reste du
corpus laissait ouverte, à savoir **quels modules acceptent quel effet**. Elle est construite en inversant les listes
d'effets déclarées module par module dans `modules.json` — autrement dit, un effet n'apparaît en face d'un module
que si ce module le déclare explicitement. Une précision de lecture importante pour qui voudrait refaire la
vérification : la clé porte le nom `specials` pour 22 familles de modules, mais **les racks de missiles utilisent des
clés suffixées** — `specials_S` (variante Seeker) et `specials_D` (variante Dumbfire) — parce que le groupe `mr` de
Coriolis réunit les deux variantes de missile sous un même identifiant, distinguées par le champ `missile` valant
`S` ou `D`. Le groupe `amr` (*Advanced Missile Rack*) ne porte que `specials_D`, ses modules étant tous des
Dumbfire. Chercher la seule clé `specials` conclurait donc à tort que ces deux familles n'acceptent aucun effet.
En comptant les trois clés, la source déclare **206 références** réparties sur **24 familles de modules**, dont
177 sous `specials`, 19 sous les deux clés du groupe `mr` et 10 sous `specials_D` du groupe `amr`. Dans la matrice
ci-dessous, les deux listes du groupe `mr` sont fusionnées en une seule entrée *Seeker/Dumbfire Missile Rack*, ce qui
ramène le décompte à **198 attributions** ; la lecture inverse de la section suivante les garde séparées et retrouve
donc les 206. 91 lignes, dont 89 portent au moins un module.
*(Sources : EDCD/coriolis-data, `modifications/specials.json` et `modifications/modules.json`, commit 0db9234b5b9c ;
noms et grades de matériaux résolus par EDCD/FDevIDs, `material.csv`, commit c35612952dd6.)*

| Effet expérimental        | Clé interne                            | Modules et armes compatibles                                                                                                                                                                                        | Effet obtenu                                                                                       | Matériaux et quantités                                                                                                         | Ingénieurs le proposant           |
|---------------------------|----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|-----------------------------------|
| Angled Plating            | `special_armour_kinetic`               | Bulkheads                                                                                                                                                                                                           | plaques inclinées : résistance cinétique en hausse, intégrité structurelle en baisse               | 5× Compact Composites (M1), 3× High Density Composites (M3), 3× Zirconium (R2)                                                 | non couvert par le jeu de données |
| Angled Plating            | `special_hullreinforcement_kinetic`    | Hull Reinforcement Package                                                                                                                                                                                          | plaques inclinées : résistance cinétique en hausse, intégrité structurelle en baisse               | 5× Carbon (R1), 3× High Density Composites (M3), 5× Tempered Alloys (M1), 3× Zirconium (R2)                                    | non couvert par le jeu de données |
| Auto loader               | `special_auto_loader`                  | Advanced Multi-Cannon, Cannon, Multi-Cannon                                                                                                                                                                         | rechargement automatique de l'arme, y compris pendant le tir                                       | 3× High Density Composites (M3), 3× Mechanical Components (M3), 4× Mechanical Equipment (M2)                                   | non couvert par le jeu de données |
| Blast Block               | `special_shieldbooster_explosive`      | Shield Booster                                                                                                                                                                                                      | résistance explosive en hausse, force totale du bouclier en baisse                                 | 3× Heat Dispersion Plate (M2), 3× Heat Resistant Ceramics (M2), 5× Inconsistent Shield Soak Analysis (E2), 2× Selenium (R4)    | non couvert par le jeu de données |
| Boss Cells                | `special_shieldcell_oversized`         | Shield Cell Bank                                                                                                                                                                                                    | charge de la batterie de bouclier en hausse, temps de montée en charge allongé                     | 5× Chemical Storage Units (M1), 3× Chromium (R2), 1× Polymer Capacitors (M4)                                                   | non couvert par le jeu de données |
| Choke canister            | `special_choke_canister`               | aucun module ne le référence dans le jeu de données                                                                                                                                                                 | aucune description dans le jeu de données                                                          | non couvert par le jeu de données                                                                                              | non couvert par le jeu de données |
| Cluster Capacitors        | `special_powerdistributor_capacity`    | Power Distributor                                                                                                                                                                                                   | capacité de stockage du distributeur en hausse, vitesse de recharge en baisse                      | 1× Cadmium (R3), 3× Heat Resistant Ceramics (M2), 5× Phosphorus (R1)                                                           | non couvert par le jeu de données |
| Concordant sequence       | `special_concordant_sequence`          | Beam Laser, Burst Laser, Pulse Laser                                                                                                                                                                                | les tirs régénèrent le bouclier d'un ailier, au prix d'une chauffe accrue                          | 5× Focus Crystals (M3), 3× Modified Embedded Firmware (E5), 1× Zirconium (R2)                                                  | non couvert par le jeu de données |
| Corrosive shell           | `special_corrosive_shell`              | Advanced Multi-Cannon, Fragment Cannon, Multi-Cannon                                                                                                                                                                | affaiblit temporairement la dureté de coque de la cible, munitions en baisse                       | 3× Arsenic (R2), 5× Chemical Storage Units (M1), 4× Precipitated Alloys (M3)                                                   | non couvert par le jeu de données |
| Dazzle shell              | `special_blinding_shell`               | Fragment Cannon, Plasma Accelerator                                                                                                                                                                                 | réduit temporairement l'acuité des capteurs de la cible                                            | 5× Hybrid Capacitors (M2), 4× Manganese (R2), 5× Mechanical Scrap (M1)                                                         | non couvert par le jeu de données |
| Deep Charge               | `special_fsd_fuelcapacity`             | Frame Shift Drive                                                                                                                                                                                                   | carburant injecté par saut en hausse, donc sauts plus longs, consommation électrique en hausse     | 5× Atypical Disrupted Wake Echoes (E1), 1× Eccentric Hyperspace Trajectories (E4), 3× Galvanising Alloys (M2)                  | non couvert par le jeu de données |
| Deep Plating              | `special_armour_chunky`                | Bulkheads                                                                                                                                                                                                           | intégrité structurelle en hausse, résistances à tous les types de dégâts en baisse                 | 5× Compact Composites (M1), 3× Mechanical Equipment (M2), 2× Molybdenum (R3)                                                   | non couvert par le jeu de données |
| Deep Plating              | `special_hullreinforcement_chunky`     | Hull Reinforcement Package                                                                                                                                                                                          | intégrité structurelle en hausse, résistances à tous les types de dégâts en baisse                 | 5× Compact Composites (M1), 3× Molybdenum (R3), 2× Ruthenium (R4)                                                              | non couvert par le jeu de données |
| Dispersal field           | `special_dispersal_field`              | Cannon, Plasma Accelerator                                                                                                                                                                                          | brouille temporairement gimbals et tourelles de la cible, dégâts directs en baisse                 | 5× Conductive Components (M2), 5× Hybrid Capacitors (M2), 5× Irregular Emission Data (E2), 5× Worn Shield Emitters (M1)        | non couvert par le jeu de données |
| Double Braced             | `special_engine_toughened`             | Thrusters                                                                                                                                                                                                           | supports renforcés : survie du module en hausse                                                    | 3× Hybrid Capacitors (M2), 5× Iron (R1), 1× Proprietary Composites (M4)                                                        | non couvert par le jeu de données |
| Double Braced             | `special_fsd_toughened`                | Frame Shift Drive                                                                                                                                                                                                   | supports renforcés : survie du module en hausse                                                    | 5× Atypical Disrupted Wake Echoes (E1), 1× Configurable Components (M4), 3× Galvanising Alloys (M2)                            | non couvert par le jeu de données |
| Double Braced             | `special_powerdistributor_toughened`   | Power Distributor                                                                                                                                                                                                   | supports renforcés : survie du module en hausse                                                    | 3× Heat Resistant Ceramics (M2), 5× Phosphorus (R1), 1× Proprietary Composites (M4)                                            | non couvert par le jeu de données |
| Double Braced             | `special_powerplant_toughened`         | Power Plant                                                                                                                                                                                                         | supports renforcés : survie du module en hausse                                                    | 5× Grid Resistors (M1), 1× Proprietary Composites (M4), 3× Vanadium (R2)                                                       | non couvert par le jeu de données |
| Double Braced             | `special_shield_toughened`             | Bi-Weave Shield Generator, Prismatic Shield Generator, Shield Generator                                                                                                                                             | supports renforcés : survie du module en hausse                                                    | 5× Compact Composites (M1), 5× Mechanical Scrap (M1), 3× Vanadium (R2)                                                         | non couvert par le jeu de données |
| Double Braced             | `special_shieldbooster_toughened`      | Shield Booster                                                                                                                                                                                                      | supports renforcés : survie du module en hausse                                                    | 5× Distorted Shield Cycle Recordings (E1), 3× Galvanising Alloys (M2), 3× Shield Emitters (M2)                                 | non couvert par le jeu de données |
| Double Braced             | `special_shieldcell_toughened`         | Shield Cell Bank                                                                                                                                                                                                    | supports renforcés : survie du module en hausse                                                    | 5× Chemical Storage Units (M1), 3× Chromium (R2), 1× Yttrium (R4)                                                              | non couvert par le jeu de données |
| Double Braced             | `special_weapon_toughened`             | Advanced Missile Rack, Advanced Multi-Cannon, Beam Laser, Burst Laser, Cannon, Fragment Cannon, Mine Launcher, Multi-Cannon, Plasma Accelerator, Pulse Laser, Rail Gun, Seeker/Dumbfire Missile Rack, Torpedo Pylon | supports renforcés : survie du module en hausse                                                    | 5× Compact Composites (M1), 5× Mechanical Scrap (M1), 3× Vanadium (R2)                                                         | non couvert par le jeu de données |
| Drag Drives               | `special_engine_overloaded`            | Thrusters                                                                                                                                                                                                           | protections logicielles retirées : poussée en hausse, chaleur générée en hausse                    | 3× Hybrid Capacitors (M2), 5× Iron (R1), 1× Security Firmware Patch (E4)                                                       | non couvert par le jeu de données |
| Drag munitions            | `special_drag_munitions`               | Fragment Cannon, Seeker/Dumbfire Missile Rack                                                                                                                                                                       | empêche temporairement la cible de convertir l'énergie ENG en poussée                              | 5× Carbon (R1), 5× Grid Resistors (M1), 5× Molybdenum (R3)                                                                     | non couvert par le jeu de données |
| Drive Distributors        | `special_engine_haulage`               | Thrusters                                                                                                                                                                                                           | meilleur équilibrage poussée/carburant : efficacité de la courbe de masse en hausse                | 3× Hybrid Capacitors (M2), 5× Iron (R1), 1× Security Firmware Patch (E4)                                                       | non couvert par le jeu de données |
| Emissive munitions        | `special_emissive_munitions`           | Advanced Missile Rack, Advanced Multi-Cannon, Mine Launcher, Multi-Cannon, Pulse Laser, Seeker/Dumbfire Missile Rack                                                                                                | amplifie fortement la signature de la cible, chauffe accrue pour le tireur                         | 3× Heat Exchangers (M3), 3× Manganese (R2), 4× Mechanical Equipment (M2), 3× Unexpected Emission Data (E3)                     | non couvert par le jeu de données |
| Fast Charge               | `special_shield_regenerative`          | Bi-Weave Shield Generator, Prismatic Shield Generator, Shield Generator                                                                                                                                             | régénération du bouclier en hausse, résistances légèrement en baisse                               | 3× Compound Shielding (M4), 3× Flawed Focus Crystals (M2), 5× Worn Shield Emitters (M1)                                        | non couvert par le jeu de données |
| Feedback Cascade          | `special_feedback_cascade_cooled`      | Rail Gun                                                                                                                                                                                                            | endommage la batterie de bouclier de la cible quand elle en déploie une, dégâts en baisse          | 5× Filament Composites (M2), 5× Open Symmetric Keys (E3), 5× Shield Emitters (M2)                                              | non couvert par le jeu de données |
| Feedback cascade (Legacy) | `special_feedback_cascade`             | Rail Gun                                                                                                                                                                                                            | version héritée de Feedback Cascade, conservée pour les modules anciens                            | non couvert par le jeu de données                                                                                              | non couvert par le jeu de données |
| Flow Control              | `special_powerdistributor_efficient`   | Power Distributor                                                                                                                                                                                                   | régulation logicielle du flux d'énergie : consommation électrique du module en baisse              | 1× Conductive Polymers (M4), 3× Heat Resistant Ceramics (M2), 5× Phosphorus (R1)                                               | non couvert par le jeu de données |
| Flow Control              | `special_shieldbooster_efficient`      | Shield Booster                                                                                                                                                                                                      | régulation logicielle du flux d'énergie : consommation électrique du module en baisse              | 3× Focus Crystals (M3), 5× Inconsistent Shield Soak Analysis (E2), 3× Niobium (R3), 3× Security Firmware Patch (E4)            | non couvert par le jeu de données |
| Flow Control              | `special_shieldcell_efficient`         | Shield Cell Bank                                                                                                                                                                                                    | régulation logicielle du flux d'énergie : consommation électrique du module en baisse              | 5× Chemical Storage Units (M1), 3× Chromium (R2), 1× Conductive Polymers (M4)                                                  | non couvert par le jeu de données |
| Flow Control              | `special_weapon_efficient`             | Advanced Missile Rack, Advanced Multi-Cannon, Beam Laser, Burst Laser, Cannon, Fragment Cannon, Mine Launcher, Multi-Cannon, Plasma Accelerator, Pulse Laser, Rail Gun, Seeker/Dumbfire Missile Rack, Torpedo Pylon | régulation logicielle du flux d'énergie : consommation électrique du module en baisse              | 3× Hybrid Capacitors (M2), 5× Mechanical Scrap (M1), 1× Modified Embedded Firmware (E5)                                        | non couvert par le jeu de données |
| Force Block               | `special_shield_kinetic`               | Bi-Weave Shield Generator, Prismatic Shield Generator, Shield Generator                                                                                                                                             | résistance cinétique en hausse, force totale du bouclier en baisse                                 | 1× Decoded Emission Data (E4), 5× Flawed Focus Crystals (M2), 5× Worn Shield Emitters (M1)                                     | non couvert par le jeu de données |
| Force Block               | `special_shieldbooster_kinetic`        | Shield Booster                                                                                                                                                                                                      | résistance cinétique en hausse, force totale du bouclier en baisse                                 | 2× Aberrant Shield Pattern Analysis (E4), 3× Shielding Sensors (M3), 5× Unidentified Scan Archives (E2)                        | non couvert par le jeu de données |
| Force shell               | `special_force_shell`                  | Cannon                                                                                                                                                                                                              | obus propulsifs qui écartent la cible de sa trajectoire, précision en baisse                       | 3× Heat Conduction Wiring (M1), 5× Mechanical Scrap (M1), 3× Phase Alloys (M3), 5× Zinc (R2)                                   | non couvert par le jeu de données |
| FSD interrupt             | `special_fsd_interrupt`                | Advanced Missile Rack, Seeker/Dumbfire Missile Rack                                                                                                                                                                 | force le redémarrage du FSD de la cible touchée, dégâts en baisse                                  | 5× Anomalous FSD Telemetry (E2), 3× Configurable Components (M4), 5× Mechanical Equipment (M2), 3× Strange Wake Solutions (E3) | non couvert par le jeu de données |
| Hi-Cap                    | `special_shield_health`                | Bi-Weave Shield Generator, Prismatic Shield Generator, Shield Generator                                                                                                                                             | force maximale du bouclier en hausse, consommation et ponction SYS en hausse                       | 1× Conductive Polymers (M4), 3× Flawed Focus Crystals (M2), 5× Worn Shield Emitters (M1)                                       | non couvert par le jeu de données |
| High yield shell          | `special_high_yield_shell`             | Cannon                                                                                                                                                                                                              | convertit une part des dégâts en explosif et touche plusieurs modules internes, cadence en baisse  | 3× Chemical Manipulators (M4), 5× Mechanical Scrap (M1), 5× Nickel (R1), 3× Proto Light Alloys (M4)                            | non couvert par le jeu de données |
| Incendiary rounds         | `special_incendiary_rounds`            | Advanced Multi-Cannon, Fragment Cannon, Multi-Cannon                                                                                                                                                                | dégâts en hausse et convertis en grande partie en thermique                                        | 5× Heat Conduction Wiring (M1), 3× Phase Alloys (M3), 5× Phosphorus (R1), 5× Sulphur (R1)                                      | non couvert par le jeu de données |
| Inertial impact           | `special_distortion_field`             | Burst Laser                                                                                                                                                                                                         | dégâts en hausse, moitié convertie en cinétique, au prix d'une dispersion de visée                 | 5× Atypical Disrupted Wake Echoes (E1), 5× Distorted Shield Cycle Recordings (E1), 5× Flawed Focus Crystals (M2)               | non couvert par le jeu de données |
| Ion disruptor             | `special_ion_disruptor`                | Mine Launcher                                                                                                                                                                                                       | fait redémarrer les propulseurs de la cible                                                        | 3× Chemical Distillery (M3), 3× Electrochemical Arrays (M3), 5× Phosphorus (R1), 5× Sulphur (R1)                               | non couvert par le jeu de données |
| Layered Plating           | `special_armour_explosive`             | Bulkheads                                                                                                                                                                                                           | résistance explosive en hausse, intégrité structurelle en baisse                                   | 5× Heat Conduction Wiring (M1), 3× High Density Composites (M3), 3× Niobium (R3)                                               | non couvert par le jeu de données |
| Layered Plating           | `special_hullreinforcement_explosive`  | Hull Reinforcement Package                                                                                                                                                                                          | résistance explosive en hausse, intégrité structurelle en baisse                                   | 5× Heat Conduction Wiring (M1), 3× Shielding Sensors (M3), 3× Tungsten (R3)                                                    | non couvert par le jeu de données |
| Lo-draw                   | `special_shield_efficient`             | Bi-Weave Shield Generator, Prismatic Shield Generator, Shield Generator                                                                                                                                             | consommation et ponction SYS en baisse, efficacité globale du bouclier en baisse                   | 1× Conductive Polymers (M4), 3× Flawed Focus Crystals (M2), 5× Worn Shield Emitters (M1)                                       | non couvert par le jeu de données |
| Mass Lock Munition        | `special_mass_lock`                    | Torpedo Pylon                                                                                                                                                                                                       | la détonation inhibe fortement la charge de survitesse de la cible                                 | 3× Aberrant Shield Pattern Analysis (E4), 3× High Density Composites (M3), 5× Mechanical Equipment (M2)                        | non couvert par le jeu de données |
| Mass lock munition        | `special_mass_lock_munition`           | Torpedo Pylon                                                                                                                                                                                                       | la détonation inhibe fortement la charge de survitesse de la cible                                 | 3× Aberrant Shield Pattern Analysis (E4), 3× High Density Composites (M3), 5× Mechanical Equipment (M2)                        | non couvert par le jeu de données |
| Mass Manager              | `special_fsd_heavy`                    | Frame Shift Drive                                                                                                                                                                                                   | masse optimale du FSD en hausse, intégrité du module en baisse                                     | 5× Atypical Disrupted Wake Echoes (E1), 1× Eccentric Hyperspace Trajectories (E4), 3× Galvanising Alloys (M2)                  | non couvert par le jeu de données |
| Monstered                 | `special_powerplant_highcharge`        | Power Plant                                                                                                                                                                                                         | production d'énergie en hausse, masse en hausse                                                    | 5× Grid Resistors (M1), 1× Polymer Capacitors (M4), 3× Vanadium (R2)                                                           | non couvert par le jeu de données |
| Multi-servos              | `special_weapon_rateoffire`            | Advanced Missile Rack, Advanced Multi-Cannon, Burst Laser, Cannon, Fragment Cannon, Mine Launcher, Multi-Cannon, Plasma Accelerator, Pulse Laser, Rail Gun, Seeker/Dumbfire Missile Rack, Torpedo Pylon             | cadence de tir en hausse, consommation électrique en hausse                                        | 2× Conductive Polymers (M4), 2× Configurable Components (M4), 4× Focus Crystals (M3), 5× Mechanical Scrap (M1)                 | non couvert par le jeu de données |
| Multi-weave               | `special_shield_resistive`             | Bi-Weave Shield Generator, Prismatic Shield Generator, Shield Generator                                                                                                                                             | résistance à tous les types de dégâts en hausse, consommation et ponction SYS en hausse            | 1× Aberrant Shield Pattern Analysis (E4), 3× Flawed Focus Crystals (M2), 5× Worn Shield Emitters (M1)                          | non couvert par le jeu de données |
| Overload munitions        | `special_overload_munitions`           | Advanced Missile Rack, Mine Launcher, Seeker/Dumbfire Missile Rack                                                                                                                                                  | convertit une part des dégâts explosifs en thermique                                               | 2× Aberrant Shield Pattern Analysis (E4), 5× Filament Composites (M2), 3× Germanium (R2), 4× Tagged Encryption Codes (E2)      | non couvert par le jeu de données |
| Oversized                 | `special_weapon_damage`                | Advanced Missile Rack, Advanced Multi-Cannon, Beam Laser, Burst Laser, Cannon, Fragment Cannon, Mine Launcher, Multi-Cannon, Plasma Accelerator, Pulse Laser, Rail Gun, Seeker/Dumbfire Missile Rack, Torpedo Pylon | dégâts en hausse, consommation électrique en hausse                                                | 3× Mechanical Components (M3), 5× Mechanical Scrap (M1), 1× Ruthenium (R4)                                                     | non couvert par le jeu de données |
| Penetrator Munitions      | `special_penetrator_munitions`         | Advanced Missile Rack, Seeker/Dumbfire Missile Rack                                                                                                                                                                 | les munitions traversent la coque et endommagent les modules internes                              | 3× Electrochemical Arrays (M3), 5× Galvanising Alloys (M2), 3× Zirconium (R2)                                                  | non couvert par le jeu de données |
| Penetrator Payload        | `special_deep_cut_payload`             | aucun module ne le référence dans le jeu de données                                                                                                                                                                 | pénétration garantie à l'impact, plusieurs modules internes touchés                                | 5× Anomalous Bulk Scan Data (E1), 3× Mechanical Components (M3), 3× Selenium (R4), 3× Tungsten (R3)                            | non couvert par le jeu de données |
| Penetrator payload        | `special_penetrator_payload`           | Torpedo Pylon                                                                                                                                                                                                       | pénétration garantie à l'impact, plusieurs modules internes touchés                                | 5× Anomalous Bulk Scan Data (E1), 3× Mechanical Components (M3), 3× Selenium (R4), 3× Tungsten (R3)                            | non couvert par le jeu de données |
| Phasing sequence          | `special_phasing_sequence`             | Burst Laser, Plasma Accelerator, Pulse Laser                                                                                                                                                                        | une petite part des dégâts traverse le bouclier et frappe la coque, dégâts totaux en légère baisse | 3× Aberrant Shield Pattern Analysis (E4), 3× Configurable Components (M4), 5× Focus Crystals (M3), 3× Niobium (R3)             | non couvert par le jeu de données |
| Plasma Slug               | `special_plasma_slug_cooled`           | Rail Gun                                                                                                                                                                                                            | munitions générées à partir du carburant du vaisseau, dégâts en baisse                             | 3× Heat Exchangers (M3), 4× Mercury (R3), 2× Modified Embedded Firmware (E5), 2× Refined Focus Crystals (M4)                   | non couvert par le jeu de données |
| Plasma Slug               | `special_plasma_slug_pa`               | Plasma Accelerator                                                                                                                                                                                                  | munitions générées à partir du carburant du vaisseau, dégâts en baisse                             | 3× Heat Exchangers (M3), 4× Mercury (R3), 2× Modified Embedded Firmware (E5), 2× Refined Focus Crystals (M4)                   | non couvert par le jeu de données |
| Plasma slug (Legacy)      | `special_plasma_slug`                  | Plasma Accelerator, Rail Gun                                                                                                                                                                                        | version héritée de Plasma Slug, conservée pour les modules anciens                                 | non couvert par le jeu de données                                                                                              | non couvert par le jeu de données |
| Radiant Canister          | `special_radiant_canister`             | Mine Launcher                                                                                                                                                                                                       | chaleur importante sur toutes les cibles de la zone et capteurs perturbés, munitions en baisse     | 4× Heat Dispersion Plate (M2), 3× Phase Alloys (M3), 1× Polonium (R4)                                                          | non couvert par le jeu de données |
| Recycling Cell            | `special_shieldcell_gradual`           | Shield Cell Bank                                                                                                                                                                                                    | durée d'activité de la batterie de bouclier en hausse, force de la charge en baisse                | 5× Chemical Storage Units (M1), 3× Chromium (R2), 1× Configurable Components (M4)                                              | non couvert par le jeu de données |
| Reflective Plating        | `special_armour_thermic`               | Bulkheads                                                                                                                                                                                                           | revêtement réfléchissant : résistance thermique en hausse, intégrité structurelle en baisse        | 5× Compact Composites (M1), 3× Heat Dispersion Plate (M2), 2× Thermic Alloys (M4)                                              | non couvert par le jeu de données |
| Reflective Plating        | `special_hullreinforcement_thermic`    | Hull Reinforcement Package                                                                                                                                                                                          | revêtement réfléchissant : résistance thermique en hausse, intégrité structurelle en baisse        | 5× Compact Composites (M1), 3× Heat Dispersion Plate (M2), 2× Thermic Alloys (M4)                                              | non couvert par le jeu de données |
| Regeneration sequence     | `special_regeneration_sequence`        | Beam Laser                                                                                                                                                                                                          | le faisceau régénère le bouclier d'un ailier au lieu de l'endommager                               | 1× Peculiar Shield Frequency Data (E5), 3× Refined Focus Crystals (M4), 4× Shielding Sensors (M3)                              | non couvert par le jeu de données |
| Reverberating cascade     | `special_reverberating_cascade`        | Mine Launcher, Torpedo Pylon                                                                                                                                                                                        | surcharge les boucliers à l'impact et endommage directement le générateur de bouclier              | 4× Chromium (R2), 3× Classified Scan Databanks (E3), 2× Configurable Components (M4), 4× Filament Composites (M2)              | non couvert par le jeu de données |
| Scramble spectrum         | `special_scramble_spectrum`            | Burst Laser, Pulse Laser                                                                                                                                                                                            | les impacts sur la coque peuvent déclencher des pannes aléatoires de modules                       | 5× Crystal Shards (M1), 5× Exceptional Scrambled Emission Data (E1), 3× Untypical Shield Scans (E3)                            | non couvert par le jeu de données |
| Screening shell           | `special_screening_shell`              | Fragment Cannon                                                                                                                                                                                                     | temps de rechargement en baisse, efficacité contre les munitions en hausse                         | 5× Distorted Shield Cycle Recordings (E1), 5× Mechanical Scrap (M1), 5× Modified Consumer Firmware (E2), 2× Niobium (R3)       | non couvert par le jeu de données |
| Shift-lock canister       | `special_shiftlock_canister`           | Mine Launcher                                                                                                                                                                                                       | fait redémarrer tous les FSD pris dans la zone de souffle, dégâts en baisse                        | 5× Salvaged Alloys (M1), 3× Strange Wake Solutions (E3), 5× Tempered Alloys (M1)                                               | non couvert par le jeu de données |
| Smart rounds              | `special_smart_rounds`                 | Advanced Multi-Cannon, Cannon, Multi-Cannon                                                                                                                                                                         | les projectiles s'autodétruisent avant de toucher un vaisseau non ciblé                            | 3× Classified Scan Databanks (E3), 3× Decoded Emission Data (E4), 5× Mechanical Scrap (M1), 3× Security Firmware Patch (E4)    | non couvert par le jeu de données |
| Stripped Down             | `special_engine_lightweight`           | Thrusters                                                                                                                                                                                                           | composants allégés et pièces superflues retirées : masse du module en baisse                       | 3× Hybrid Capacitors (M2), 5× Iron (R1), 1× Proto Light Alloys (M4)                                                            | non couvert par le jeu de données |
| Stripped Down             | `special_fsd_lightweight`              | Frame Shift Drive                                                                                                                                                                                                   | composants allégés et pièces superflues retirées : masse du module en baisse                       | 5× Atypical Disrupted Wake Echoes (E1), 3× Galvanising Alloys (M2), 1× Proto Light Alloys (M4)                                 | non couvert par le jeu de données |
| Stripped Down             | `special_powerdistributor_lightweight` | Power Distributor                                                                                                                                                                                                   | composants allégés et pièces superflues retirées : masse du module en baisse                       | 3× Heat Resistant Ceramics (M2), 5× Phosphorus (R1), 1× Proto Light Alloys (M4)                                                | non couvert par le jeu de données |
| Stripped Down             | `special_powerplant_lightweight`       | Power Plant                                                                                                                                                                                                         | composants allégés et pièces superflues retirées : masse du module en baisse                       | 5× Grid Resistors (M1), 1× Proto Light Alloys (M4), 3× Vanadium (R2)                                                           | non couvert par le jeu de données |
| Stripped Down             | `special_shield_lightweight`           | Bi-Weave Shield Generator, Prismatic Shield Generator, Shield Generator                                                                                                                                             | composants allégés et pièces superflues retirées : masse du module en baisse                       | 3× Flawed Focus Crystals (M2), 1× Proto Light Alloys (M4), 5× Worn Shield Emitters (M1)                                        | non couvert par le jeu de données |
| Stripped Down             | `special_shieldcell_lightweight`       | Shield Cell Bank                                                                                                                                                                                                    | composants allégés et pièces superflues retirées : masse du module en baisse                       | 5× Chemical Storage Units (M1), 3× Chromium (R2), 1× Proto Light Alloys (M4)                                                   | non couvert par le jeu de données |
| Stripped Down             | `special_weapon_lightweight`           | Advanced Missile Rack, Advanced Multi-Cannon, Beam Laser, Burst Laser, Cannon, Fragment Cannon, Mine Launcher, Multi-Cannon, Plasma Accelerator, Pulse Laser, Rail Gun, Seeker/Dumbfire Missile Rack, Torpedo Pylon | composants allégés et pièces superflues retirées : masse du module en baisse                       | 3× Carbon (R1), 5× Salvaged Alloys (M1), 1× Tin (R3)                                                                           | non couvert par le jeu de données |
| Super Capacitors          | `special_shieldbooster_chunky`         | Shield Booster                                                                                                                                                                                                      | force totale du bouclier en hausse, résistances en baisse                                          | 2× Cadmium (R3), 5× Compact Composites (M1), 3× Untypical Shield Scans (E3)                                                    | non couvert par le jeu de données |
| Super Conduits            | `special_powerdistributor_fast`        | Power Distributor                                                                                                                                                                                                   | vitesse de recharge du distributeur en hausse, charge maximale en baisse                           | 3× Heat Resistant Ceramics (M2), 5× Phosphorus (R1), 1× Security Firmware Patch (E4)                                           | non couvert par le jeu de données |
| Super Penetrator          | `special_super_penetrator_cooled`      | Rail Gun                                                                                                                                                                                                            | traverse et endommage tous les modules sur sa trajectoire, rechargement allongé                    | 3× Proto Light Alloys (M4), 3× Refined Focus Crystals (M4), 5× Untypical Shield Scans (E3), 3× Zirconium (R2)                  | non couvert par le jeu de données |
| Super penetrator (Legacy) | `special_super_penetrator`             | Rail Gun                                                                                                                                                                                                            | version héritée de Super Penetrator, conservée pour les modules anciens                            | non couvert par le jeu de données                                                                                              | non couvert par le jeu de données |
| Target lock breaker       | `special_lock_breaker`                 | Plasma Accelerator                                                                                                                                                                                                  | casse le verrouillage de la cible à chaque impact réussi                                           | 1× Adaptive Encryptors Capture (E5), 3× Security Firmware Patch (E4), 5× Selenium (R4)                                         | non couvert par le jeu de données |
| Thermal cascade           | `special_thermal_cascade`              | Advanced Missile Rack, Cannon, Seeker/Dumbfire Missile Rack                                                                                                                                                         | génère une chaleur importante sur la cible à la détonation contre ses boucliers                    | 5× Heat Conduction Wiring (M1), 3× High Density Composites (M3), 4× Hybrid Capacitors (M2), 5× Phosphorus (R1)                 | non couvert par le jeu de données |
| Thermal conduit           | `special_thermal_conduit`              | Beam Laser, Plasma Accelerator                                                                                                                                                                                      | dégâts croissants avec la température du vaisseau tireur                                           | 5× Heat Dispersion Plate (M2), 5× Sulphur (R1), 5× Tempered Alloys (M1)                                                        | non couvert par le jeu de données |
| Thermal shock             | `special_thermalshock`                 | Advanced Multi-Cannon, Beam Laser, Burst Laser, Multi-Cannon, Pulse Laser                                                                                                                                           | les impacts sur bouclier et coque transmettent de la chaleur à la cible                            | 3× Conductive Components (M2), 5× Flawed Focus Crystals (M2), 3× Heat Resistant Ceramics (M2), 3× Tungsten (R3)                | non couvert par le jeu de données |
| Thermal Spread            | `special_engine_cooled`                | Thrusters                                                                                                                                                                                                           | conduits thermiques supplémentaires : refroidissement en hausse, légère hausse de masse            | 1× Heat Vanes (M4), 3× Hybrid Capacitors (M2), 5× Iron (R1)                                                                    | non couvert par le jeu de données |
| Thermal Spread            | `special_fsd_cooled`                   | Frame Shift Drive                                                                                                                                                                                                   | conduits thermiques supplémentaires : refroidissement en hausse, légère hausse de masse            | 5× Atypical Disrupted Wake Echoes (E1), 3× Galvanising Alloys (M2), 3× Grid Resistors (M1), 1× Heat Vanes (M4)                 | non couvert par le jeu de données |
| Thermal Spread            | `special_powerplant_cooled`            | Power Plant                                                                                                                                                                                                         | conduits thermiques supplémentaires : refroidissement en hausse, légère hausse de masse            | 5× Grid Resistors (M1), 1× Heat Vanes (M4), 3× Vanadium (R2)                                                                   | non couvert par le jeu de données |
| Thermal vent              | `special_thermal_vent`                 | Beam Laser                                                                                                                                                                                                          | dissipation thermique en hausse quand le tir touche, chauffe accrue quand il manque                | 3× Conductive Components (M2), 5× Flawed Focus Crystals (M2), 3× Precipitated Alloys (M3)                                      | non couvert par le jeu de données |
| Thermo Block              | `special_shield_thermic`               | Bi-Weave Shield Generator, Prismatic Shield Generator, Shield Generator                                                                                                                                             | résistance thermique en hausse, force totale du bouclier en baisse                                 | 5× Anomalous Bulk Scan Data (E1), 3× Conductive Ceramics (M3), 3× Heat Vanes (M4)                                              | non couvert par le jeu de données |
| Thermo Block              | `special_shieldbooster_thermic`        | Shield Booster                                                                                                                                                                                                      | résistance thermique en hausse, force totale du bouclier en baisse                                 | 5× Anomalous Bulk Scan Data (E1), 3× Conductive Ceramics (M3), 3× Heat Vanes (M4)                                              | non couvert par le jeu de données |

### Les effets expérimentaux acceptés module par module — la lecture inverse

La même donnée lue depuis le module : ce que l'on consulte quand on a un module en main et que l'on veut savoir ce
qu'on peut y poser. Les racks de missiles font exception et méritent une note : le jeu de données leur associe des
clés suffixées plutôt que la clé `specials` commune — `specials_D` pour la version **Dumbfire** et `specials_S` pour
la version **Seeker** —, et la colonne « Effets expérimentaux acceptés » signale chaque entrée en conséquence. Le
*Seeker/Dumbfire Missile Rack* (groupe `mr`) porte donc les deux listes, 9 effets côté Seeker et 10 côté Dumbfire ;
l'*Advanced Missile Rack* (groupe `amr`) n'en porte qu'une, `specials_D`, ses modules étant tous des Dumbfire. Un
même effet listé des deux côtés apparaît donc deux fois sur la ligne du *Seeker/Dumbfire Missile Rack* et compte
deux fois dans la colonne « Nombre ». 24 modules et armes acceptent au moins un effet expérimental, pour un total
de **206 références** — c'est la somme exacte de la colonne « Nombre » et le décompte brut des trois clés dans
`modules.json`.

| Module ou arme               | Nombre | Effets expérimentaux acceptés                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|------------------------------|--------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Advanced Missile Rack        | 10     | Double Braced *(rack Dumbfire)*, Emissive munitions *(rack Dumbfire)*, FSD interrupt *(rack Dumbfire)*, Flow Control *(rack Dumbfire)*, Multi-servos *(rack Dumbfire)*, Overload munitions *(rack Dumbfire)*, Oversized *(rack Dumbfire)*, Penetrator Munitions *(rack Dumbfire)*, Stripped Down *(rack Dumbfire)*, Thermal cascade *(rack Dumbfire)*                                                                                                                                                                                                                                                                                               |
| Advanced Multi-Cannon        | 11     | Auto loader, Corrosive shell, Double Braced, Emissive munitions, Flow Control, Incendiary rounds, Multi-servos, Oversized, Smart rounds, Stripped Down, Thermal shock                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Beam Laser                   | 9      | Concordant sequence, Double Braced, Flow Control, Oversized, Regeneration sequence, Stripped Down, Thermal conduit, Thermal shock, Thermal vent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Bi-Weave Shield Generator    | 8      | Double Braced, Fast Charge, Force Block, Hi-Cap, Lo-draw, Multi-weave, Stripped Down, Thermo Block                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Bulkheads                    | 4      | Angled Plating, Deep Plating, Layered Plating, Reflective Plating                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Burst Laser                  | 10     | Concordant sequence, Double Braced, Flow Control, Inertial impact, Multi-servos, Oversized, Phasing sequence, Scramble spectrum, Stripped Down, Thermal shock                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Cannon                       | 11     | Auto loader, Dispersal field, Double Braced, Flow Control, Force shell, High yield shell, Multi-servos, Oversized, Smart rounds, Stripped Down, Thermal cascade                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Fragment Cannon              | 10     | Corrosive shell, Dazzle shell, Double Braced, Drag munitions, Flow Control, Incendiary rounds, Multi-servos, Oversized, Screening shell, Stripped Down                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Frame Shift Drive            | 5      | Deep Charge, Double Braced, Mass Manager, Stripped Down, Thermal Spread                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Hull Reinforcement Package   | 4      | Angled Plating, Deep Plating, Layered Plating, Reflective Plating                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Mine Launcher                | 11     | Double Braced, Emissive munitions, Flow Control, Ion disruptor, Multi-servos, Overload munitions, Oversized, Radiant Canister, Reverberating cascade, Shift-lock canister, Stripped Down                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Multi-Cannon                 | 11     | Auto loader, Corrosive shell, Double Braced, Emissive munitions, Flow Control, Incendiary rounds, Multi-servos, Oversized, Smart rounds, Stripped Down, Thermal shock                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Plasma Accelerator           | 12     | Dazzle shell, Dispersal field, Double Braced, Flow Control, Multi-servos, Oversized, Phasing sequence, Plasma Slug, Plasma slug (Legacy), Stripped Down, Target lock breaker, Thermal conduit                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Power Distributor            | 5      | Cluster Capacitors, Double Braced, Flow Control, Stripped Down, Super Conduits                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| Power Plant                  | 4      | Double Braced, Monstered, Stripped Down, Thermal Spread                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| Prismatic Shield Generator   | 8      | Double Braced, Fast Charge, Force Block, Hi-Cap, Lo-draw, Multi-weave, Stripped Down, Thermo Block                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Pulse Laser                  | 10     | Concordant sequence, Double Braced, Emissive munitions, Flow Control, Multi-servos, Oversized, Phasing sequence, Scramble spectrum, Stripped Down, Thermal shock                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Rail Gun                     | 11     | Double Braced, Feedback Cascade, Feedback cascade (Legacy), Flow Control, Multi-servos, Oversized, Plasma Slug, Plasma slug (Legacy), Stripped Down, Super Penetrator, Super penetrator (Legacy)                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Seeker/Dumbfire Missile Rack | 19     | Double Braced *(rack Dumbfire)*, Double Braced *(rack Seeker)*, Drag munitions *(rack Seeker)*, Emissive munitions *(rack Dumbfire)*, Emissive munitions *(rack Seeker)*, FSD interrupt *(rack Dumbfire)*, Flow Control *(rack Dumbfire)*, Flow Control *(rack Seeker)*, Multi-servos *(rack Dumbfire)*, Multi-servos *(rack Seeker)*, Overload munitions *(rack Dumbfire)*, Overload munitions *(rack Seeker)*, Oversized *(rack Dumbfire)*, Oversized *(rack Seeker)*, Penetrator Munitions *(rack Dumbfire)*, Stripped Down *(rack Dumbfire)*, Stripped Down *(rack Seeker)*, Thermal cascade *(rack Dumbfire)*, Thermal cascade *(rack Seeker)* |
| Shield Booster               | 6      | Blast Block, Double Braced, Flow Control, Force Block, Super Capacitors, Thermo Block                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Shield Cell Bank             | 5      | Boss Cells, Double Braced, Flow Control, Recycling Cell, Stripped Down                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Shield Generator             | 8      | Double Braced, Fast Charge, Force Block, Hi-Cap, Lo-draw, Multi-weave, Stripped Down, Thermo Block                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Thrusters                    | 5      | Double Braced, Drag Drives, Drive Distributors, Stripped Down, Thermal Spread                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Torpedo Pylon                | 9      | Double Braced, Flow Control, Mass Lock Munition, Mass lock munition, Multi-servos, Oversized, Penetrator payload, Reverberating cascade, Stripped Down                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

Les **61 autres familles de modules du jeu de données n'acceptent aucun effet expérimental** :
AFMU, AX Missile Rack, AX Multi-Cannon, Abrasion Blaster, Business Passenger Cabin, Cargo Rack, Cargo Rack (large),
Cargo Scanner, Caustic Sink Launcher, Chaff Launcher, Collector Limpet Controller, Decontamination Limpet
Controller, Detailed Surface Scanner, Docking Computer, Economy Passenger Cabin, Electronic Countermeasure, Enhanced
AX Missile Rack, Enhanced AX Multi-Cannon, Enzyme Missile Rack, Experimental Weapon Stabiliser, Fighter Hangar,
First Class Passenger Cabin, Frame Shift Drive Interdictor, Frame Shift Wake Scanner, Fuel Scoop, Fuel Tank, Fuel
Transfer Limpet Controller, Guardian FSD Booster, Guardian Gauss Cannon, Guardian Hull Reinforcement Package,
Guardian Hybrid Power Distributor, Guardian Hybrid Power Plant, Guardian Module Reinforcement Package, Guardian
Plasma Charger, Guardian Shard Cannon, Guardian Shield Reinforcement Package, Hatch Breaker Limpet Controller, Heat
Sink Launcher, Kill Warrant Scanner, Life Support, Luxury Passenger Cabin, Meta Alloy Hull Reinforcement, Mining
Laser, Module Reinforcement Package, Nanite Torpedo Pylon, Planetary Approach Suite, Planetary Vehicle Hangar, Point
Defence, Prospector Limpet Controller, Pulse Wave Analyser, Refinery, Remote Release Flak Launcher, Remote Release
Flechette Launcher, Repair Limpet Controller, Scanner (générique), Seismic Charge Launcher, Sensors, Shock Cannon,
Shutdown Field Neutraliser, Sub-Surface Displacement Missile, Xeno Scanner.

Cette liste est le complément exact de la table ci-dessus dans `modules.json` ; elle vaut pour les modules eux-mêmes,
indépendamment du fait que certains d'entre eux acceptent par ailleurs des blueprints de grade. Les deux entrées de
remplissage du jeu de données — `missing_hardpoint` et `missing_module`, qui ne correspondent à aucun module du jeu —
en sont écartées.

*(Source : EDCD/coriolis-data, `modifications/modules.json`, commit 0db9234b5b9c.)*

## Ordre optimal d'Engineering par rôle

Ce classement reflète un consensus communautaire stable depuis plusieurs années plutôt qu'une donnée officielle
chiffrée : il vise à prioriser d'abord ce qui accélère et sécurise le reste du grind (déplacement, survie), puis les
modules spécifiques au rôle.

### Ordre d'Engineering d'un vaisseau de combat (RES, Conflict Zones, PvP)

1. **FSD** (Increased Range) — rallier rapidement zones de combat et bases d'Ingénieurs.
2. **Propulseurs** (Dirty + effet expérimental *Drag Drives*) — vitesse et maniabilité en dogfight.
3. **Distributeur d'énergie** (Charge Enhanced + *Super Conduits*) — plus de capacité SYS/ENG/WEP.
4. **Bouclier** (Reinforced/Enhanced Low Power + *Fast Charge* ou résistance ciblée) et **amplificateurs de bouclier**
   (Resistance Augmented).
5. **Armement principal** (Overcharged sur l'arme principale, Efficient sur le secondaire ; effets expérimentaux
   *Thermal Vent* sur lasers, *Corrosive Shell*/ *Feedback Cascade* selon la cible).
6. **Générateur d'énergie** (Overcharged + *Monstered*) — alimenter l'ensemble sans distribuer de priorité.
7. **Renforts de coque/armure** en dernier — matériaux plus rares pour un gain relatif plus faible que boucliers/armes.

### Ordre d'Engineering d'un vaisseau d'exploration

1. **FSD** (Increased Range grade 5 + effet expérimental *Mass Manager*) — priorité absolue pour la portée de saut
   (voir builds chiffrés ci-dessus).
2. **Distributeur d'énergie** et **récupérateur de carburant** pour l'autonomie.
3. **Capteurs** (Long Range) pour le Discovery Scanner et le Detailed Surface Scanner.
4. **Propulseurs** (Clean, orienté consommation/chauffe plutôt que vitesse pure).
5. **Boucliers/renforts de coque légers** en option, sans trop alourdir le vaisseau — l' *optimal mass* étant crucial
   pour la portée de saut.

### Ordre d'Engineering d'un vaisseau de commerce/transport

1. **FSD** (Increased Range) — routes longues, moins d'interdictions en zone dangereuse.
2. **Propulseurs** (Dirty) — compenser la masse du fret et fuir plus vite en cas d'interdiction.
3. **Amplificateurs de bouclier** — encaisser un ganking le temps de fuir.
4. **Distributeur d'énergie** (High Charge Capacity) pour un boost soutenu.
5. **Renforts de coque/armure** en fin de liste, pour la survie passive en Powerplay ou zone de guerre.

## Accélérer le grind de matériaux d'Engineering

### Comptoirs d'échange de matériaux (Material Traders)

Présents dans des stations dédiées, il en existe trois types — **Raw Material Trader**, **Manufactured Material
Trader**, **Encoded Data Trader**. Ils permettent d'échanger un surplus de matériaux d'un grade contre des matériaux
d'un autre grade **au sein du même type** (raw→raw, manufactured→manufactured, encoded→encoded) : **l'échange entre
types est impossible**. Très efficace pour transformer un stock inutile de matériaux communs en matériaux rares
manquants — notamment pour ne pas gaspiller le surplus qui dépasse les plafonds de stockage vus plus haut — sans
repartir en farming ciblé.

#### Où s'installent les Material Traders, et pourquoi leur type ne se déduit pas de l'économie

Le comptoir **Raw** s'installe dans les économies *Refinery* et *Extraction*, le **Manufactured** dans *Extraction*
et *Industrial*, l'**Encoded** dans *High Tech* et *Military* ; à quoi s'ajoutent une sécurité moyenne ou haute, une
population comprise entre 1 et 22 millions,
un gouvernement non-Anarchy, et une station ni endommagée ni en lockdown. **Mais le type du comptoir ne se déduit pas
de l'économie de la station** : le test mené dans l'étude interne sur les trente comptoirs situés à moins de 30 al de
Sol donne deux candidats pour presque toutes, et **Gresley Dock (Nanomam) est un comptoir Encoded en économie
*Agriculture***, qui ne correspond à aucune règle. Vérifiez le type affiché avant de vous déplacer.

#### La table exacte des taux de conversion d'un Material Trader

À l'intérieur d'un type, on peut changer de **catégorie** (les sept groupes du Raw, les dix familles du Manufactured,
les six familles de l'Encoded), mais cela **multiplie le coût par 6**. D'où la table complète :

| Écart de grade | Même catégorie | Catégorie différente |
|----------------|----------------|----------------------|
| +1 grade       | **6 → 1**      | 36 → 1               |
| +2 grades      | 36 → 1         | 216 → 1              |
| +3 grades      | 216 → 1        | *impossible*         |
| même grade     | —              | **6 → 1**            |
| −1 grade       | **1 → 3**      | 2 → 1                |
| −2 grades      | 1 → 9          | 2 → 3                |
| −3 grades      | 1 → 27         | 2 → 9                |
| −4 grades      | 1 → 81         | 2 → 27               |

Deux remarques qui comptent :

- les conversions théoriques à **1296:1 et 7776:1** sont listées par le jeu mais **physiquement impossibles** : elles
  exigeraient de stocker plus d'unités que le plafond n'autorise ;
- ces taux **n'ont pas changé depuis l'introduction des comptoirs en février 2018**, vérification faite à la fois sur
  l'historique des révisions du wiki et sur six années de notes de patch.

La lecture pratique de cette table est **asymétrique** : monter d'un grade coûte cher (6 pour 1), descendre rapporte
beaucoup (1 pour 3, soit 81 unités de G1 pour une de G5 en descendant quatre grades). D'où la stratégie décrite plus
haut pour les Wake Scans : **récolter n'importe quel grade, puis descendre**, plutôt que viser le grade exact.

*(Source : étude interne `docs/faisabilite-spansh-temps-reel-materiaux.md`, § 3.4, étude du 19 août 2026 ; les taux
Raw « 6 pour 1 vers le haut, 1 pour 3 vers le bas » et le taux Encoded 1 pour 3 sont également déclarés par les
sources de comptoir du catalogue de matériaux consolidé, édition 2026-08.)*

### Synthèse (Synthesis)

La **synthèse** (*Synthesis*) est accessible depuis le panneau droit (onglet Engineering → Synthesis) ; elle consomme
des matériaux pour fabriquer directement des consommables (munitions, heat sinks, chaff, réparations AFMU, boost de
carburant, kits de vie Odyssey) sans repasser par une station — utile pour prolonger une session de farming ou de
combat plutôt que pour l'engineering des modules eux-mêmes.

### Fleet Carrier : un apport purement logistique à l'ingénierie

Un porte-vaisseaux personnel peut installer des services **Shipyard/Outfitting** embarqués, mais **ni Material Trader
ni Technology Broker** ne figurent parmi les services installables : ces deux services restent réservés aux stations
dédiées. Aucun Ingénieur (PNJ) n'est présent à bord non plus, si bien qu'un Porte-Vaisseau ne permet jamais d'appliquer
un blueprint. Son apport à l'ingénierie est donc purement **logistique** : stocker et transporter matériaux et modules
à proximité d'une base d'Ingénieur, ce qui réduit les allers-retours — une stratégie courante pour les joueurs
organisés ou en groupe, qui mutualisent les coûts d'installation et d'entretien. Voir
[19 — Fleet Carriers](./19-fleet-carriers.md) pour l'ensemble de la mécanique (achat, services, entretien).

### Spécificités Odyssey du farming de matériaux (settlements, Data Points, exobiologie)

Le farming à pied dans les settlements (coffres, Data Points) est une source rapide de matériaux encodés et manufacturés
sans avoir à voler. Le scan de plantes (exobiologie, via le Genetic Sampler) rapporte des crédits mais ne fournit pas
directement de matériaux d'Engineering classiques — c'est une activité distincte.

### Outils tiers utiles à l'Engineering (Coriolis, EDSY, Inara, EDTools, EDEngineer)

- **Coriolis.io** et **EDSY.org** : ship-builders avec simulateur d'engineering complet et calcul exact des gains par
  grade — voir [16 — Outils](./16-outils.md) pour une présentation plus large de l'écosystème d'outils tiers.
- **Inara.cn** : localisation des Ingénieurs, Material Traders et Technology Brokers, calcul de la liste de matériaux
  manquants pour un blueprint donné.
- **EDTools.cc** : outils orientés minage et exploration ; ne propose pas d'outil dédié à l'Engineering à proprement
  parler.
- **EDEngineer** (open-source, `msarilar/EDEngineer` sur GitHub) : tracker de matériaux avec import automatique du
  journal de jeu, source des plafonds de stockage cités plus haut.

## Contexte 2025-2026 de l'Engineering (Colonisation, Operations, Nomad, Rhino)

Le développement du jeu se poursuit avec une équipe réduite depuis l'arrêt du support console : Frontier a annoncé, le
**10 mars 2022**, que le développement de nouveau contenu pour les versions PlayStation 4 et Xbox One était abandonné,
et **David Braben** a quitté la direction du développement du studio en **août 2022**. Le fait marquant récent est la
mise à jour **[Colonisation](./18-colonisation.md)** : les joueurs peuvent revendiquer des systèmes stellaires et
développer des installations au sol et des stations — bêta lancée le **26 février 2025** dans le cadre de la mise à
jour *Trailblazers* (et non le 28 février, date d'un simple article-guide publié deux jours plus tard sur le site
officiel — correction apportée lors de cet audit), sortie complète le **11 novembre 2025** via la mise à jour « Dodec
Update ». Plusieurs nouveaux vaisseaux ont été publiés depuis l'arc narratif des Titans Thargoïdes, dont le **Python Mk
II**, conçu autour de la technologie de Supercruise Overcharge. Cette mise à jour n'a pas ajouté de nouvel Ingénieur (la
liste de 38 noms, issue d'une source activement maintenue, ne montre aucune entrée postérieure à Odyssey), mais
introduit une économie de construction (matériaux de colonisation) distincte du système classique d'Engineering — voir
[18 — Colonisation](./18-colonisation.md) pour cette économie parallèle.

**L'année 2026 a, elle, touché à l'Engineering.** La mise à jour **Operations**, un temps attendue pour avril puis
**reportée à juin** par l'annonce du 22 avril 2026, est sortie le **30 juin 2026**, avec un premier correctif majeur
le 9 juillet. Elle apporte trois choses qui concernent directement ce guide : une **nouvelle monnaie**, le Merc Coin,
qui achète des **blueprints** et des **modules pré-modifiés** hors du circuit des Ingénieurs et des Technology Brokers
— voir « Le Merc Coin et le MercGear » plus haut ; des **matériaux** parmi les récompenses de fin d'Operation ; et
l'arrivée du **Nomad**, dévoilé le 2 juin 2026 comme un petit vaisseau compact lancé depuis un vaisseau-mère et conçu
pour explorer les surfaces planétaires. Il est équipé d'un **Mk II Biological Scanner**, qui détecte les signaux
biologiques directement depuis le cockpit, et se déploie depuis **tout hangar de vaisseau compatible, module Mk I
comme Mk II** ; les modules d'accueil ont été retouchés à cette occasion, le *Mk I Vessel Bay* ajusté et un *Mk II
Vessel Bay* ajouté. Le **Rhino**, plus grand SRV déployable depuis un vaisseau, a suivi le **2 septembre 2026**, avec
une boucle de minage au sol et une septième Operation. **Aucun de ces ajouts ne crée de nouvel Ingénieur**, et aucun
n'entre dans le décompte des vaisseaux pilotables de [03 — Vaisseaux](./03-vaisseaux.md) : le Nomad est un vaisseau
lancé depuis un vaisseau-mère, le Rhino un SRV. Le détail de ces deux véhicules est traité dans
[14 — Rhino et Nomad](./14-rhino-nomad.md), et celui du mode multijoueur dans [13 — Operations](./13-operations.md).

*(Sources : annonces officielles Frontier relayées par le flux Steam News d'Elite Dangerous — « An Update on
Operations », 22 avril 2026 14:02 UTC ; « Discover the Nomad », 2 juin 2026 13:03 UTC ; « Operations Update »,
1ᵉʳ juillet 2026 14:01 UTC ; « Operations Update | Update 3 », 9 juillet 2026 10:24 UTC ; « Rhino SRV Update »,
2 septembre 2026 11:20 UTC.)*

## Voir aussi

- [05 — Guardians](./05-guardians.md) — localisation des sites de ruines, farming des matériaux Guardian et contexte
  narratif, référencés depuis la section Guardian Technology Broker de ce guide.
- [07 — Équipement à pied](./07-equipement-a-pied.md) — détail complet de l'ingénierie Odyssey (Ingénieurs à pied,
  blueprints de combinaison/arme, builds par style de jeu).
- [00 — Glossaire](./00-glossaire.md) — sigles utilisés dans ce guide (BGS, RES, etc.).
- [02 — Powerplay](./02-powerplay.md) — système des Powers et refonte Powerplay 2.0 (31 octobre 2024), pour clarifier
  sa non-interférence avec le déblocage des Ingénieurs.
- [10 — Exploration](./10-exploration.md) — usage pratique des builds FSD longue portée en expédition.
- [13 — Operations](./13-operations.md) — le mode d'escouade dont proviennent le Merc Coin, le MercGear et les
  matériaux distribués en récompense de scénario.
- [14 — Rhino et Nomad](./14-rhino-nomad.md) — les deux véhicules ajoutés en 2026, leur mode de déploiement et le
  Mk II Biological Scanner du Nomad.
- [16 — Outils](./16-outils.md) — présentation complète de l'écosystème d'outils tiers (Coriolis, EDSY, Inara, EDMC...).
- [18 — Colonisation](./18-colonisation.md) — économie de construction distincte de l'Engineering classique.
- [19 — Fleet Carriers](./19-fleet-carriers.md) — liste des services réellement installables à bord et rôle purement
  logistique du Porte-Vaisseau vis-à-vis de l'ingénierie.
- [20 — Minage](./20-minage.md) — pour les matériaux bruts obtenus par extraction plutôt que par prospection de surface.
- [25 — Combat AX](./25-combat-ax.md) — matériaux et armes anti-Thargoïdes liés au Human Technology Broker et aux
  Rescue Megaships.
- [27 — Débuter et progresser](./27-debuter-et-progresser.md) — quels deux ou trois Ingénieurs débloquer en priorité
  selon l'objectif visé, quand on démarre et que le temps comme les matériaux manquent.

## Sources

### Sources internes au dépôt (catalogues consolidés et étude du 19 août 2026)

- `assets/data/materials.json` — **catalogue de matériaux consolidé, édition 2026-08** : 115 matériaux, 24 catégories,
  plafonds de stockage par grade, sources et conditions d'apparition par catégorie, deux sites de récolte avec
  leurs coordonnées Live. Sources amont déclarées par le fichier lui-même : la table d'identifiants `material.csv` du
  projet EDCD/FDevIDs (catégorie et grade des matériaux de vaisseau) et l'étude
  `docs/faisabilite-spansh-temps-reel-materiaux.md`, §§ 3.2, 3.4 et 3.5 (sources de terrain).
  **Réserve d'usage :** ce fichier rattache l'entrée *Crystal Shards* (matériau manufacturé de grade 1) aux conditions
  d'apparition des **sites de Crystalline Shards**, qui relèvent des matériaux bruts. Ce guide corrige la confusion —
  voir la mise en garde de la section Manufactured — et ne retient pas ce rattachement.
- `assets/data/blueprints.json` — **catalogue de blueprints consolidé, édition 2026-08** : cinq blueprints entièrement
  chiffrés (matériaux et quantités par grade, rolls à réputation 5, effets, ingénieurs et grades maximum, effets
  expérimentaux), note sur le caractère déterministe des rolls depuis l'Update 18.08, et paliers de montée en grade des
  trois combinaisons Odyssey. Sources amont déclarées : `modifications/blueprints.json` et `modifications/specials.json`
  du projet EDCD/coriolis-data, et `docs/faisabilite-spansh-temps-reel-materiaux.md`, §§ 3.2 et 3.3.
- `docs/faisabilite-spansh-temps-reel-materiaux.md` — **étude interne du 19 août 2026**, §§ 3.3 et 3.4 : table exacte du
  blueprint FSD *Increased Range*, formule de portée et effet du +30 % de masse module, déblocage de Felicity Farseer et
  disponibilité du Meta-Alloy, plafonds de stockage et conversion de l'excédent en crédits depuis le Dodec Update, table
  complète des taux de conversion des comptoirs d'échange, règle d'allégeance des High Grade Emissions, correspondance
  type de corps → matériau brut, coordonnées Live de Dav's Hope et du Jameson Crash Site.

### Sources externes

#### Annonces officielles Frontier relevées sur le flux Steam News (appid 359320)

- **Annonces officielles Frontier Developments**, relevées le 9 septembre 2026 sur le flux Steam News d'*Elite
  Dangerous* (appid 359320), qui republie les annonces mot pour mot — utilisées ici pour tout ce qui concerne
  Operations, le Merc Coin, le MercGear, le Nomad et le Rhino :
  - « Elite Dangerous | An Update on Operations », **22 avril 2026 14:02 UTC** — report d'Operations à juin ; nature du
    Merc Coin (gagné en Operation, non achetable en ARX, bonus hebdomadaire) et composition des récompenses.
  - « Discover the Nomad », **2 juin 2026 13:03 UTC** — premier dévoilement du Nomad, vaisseau lancé depuis un
    vaisseau-mère et conçu pour l'exploration des surfaces planétaires ; patins d'atterrissage de type hélicoptère,
    moteurs pivotant à l'atterrissage ; sortie annoncée pour le 30 juin 2026, en accès anticipé ARX, avec Operations.
  - « Elite Dangerous | Operations Update », **1ᵉʳ juillet 2026 14:01 UTC** — notes de version complètes : Operation
    Runner, six scénarios initiaux, catalogue MercGear (deux blueprints, treize modules pré-modifiés), Mk II
    Biological Scanner, déploiement du Nomad depuis un hangar de vaisseau compatible Mk I comme Mk II.
  - « Elite Dangerous | Operations Update | Update 3 », **9 juillet 2026 10:24 UTC** — correctifs ; récompenses
    d'Operation manquantes et régularisation rétroactive annoncée.
  - « Beneath the Surface: Your First Look at the Rhino », **6 août 2026 14:19 UTC** — le Rhino, plus grand SRV
    déployable, largué par le nouveau hangar de véhicule et non par la trappe à cargaison.
  - « Elite Dangerous | Rhino SRV Update », **2 septembre 2026 11:20 UTC** — sortie du Rhino, minage de surface,
    treize nouvelles marchandises, Operation *Under Siege*, et deux correctifs sur la modifiabilité du MercGear.
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320 (flux consulté le 9 septembre 2026 ; c'est
  par cette API publique que les six annonces ci-dessus ont été relevées, le site officiel elitedangerous.com étant
  inaccessible depuis l'environnement de rédaction)

#### Jeux de données communautaires (EDCD/FDevIDs, EDCD/EDDI, EDCD/coriolis-data, EDEngineer)

- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/engineers.csv
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/material.csv
- https://raw.githubusercontent.com/EDCD/EDDI/develop/DataDefinitions/Engineer.cs
- https://raw.githubusercontent.com/EDCD/EDDI/develop/DataDefinitions/EngineerSpecialty.cs
- https://raw.githubusercontent.com/EDCD/EDDI/develop/DataDefinitions/Blueprint.cs
- https://raw.githubusercontent.com/EDCD/EDDI/develop/DataDefinitions/BlueprintTemplate.cs
- https://api.github.com/repos/EDCD/EDDI/contents/DataDefinitions
- https://github.com/EDCD/coriolis-data — dépôt cloné localement au commit
  `0db9234b5b9ce8c939ea84133d7ce336eea88e27` pour cette révision ; fichiers exploités :
  `modifications/blueprints.json` (81 blueprints, 387 couples blueprint × grade),
  `modifications/modules.json` (association module → blueprint → grade → ingénieurs, et listes d'effets
  expérimentaux par module), `modifications/specials.json` (91 effets expérimentaux) et
  `modifications/modifications.json` (type et sens de variation de chaque attribut modifié)
- https://github.com/EDCD/FDevIDs — dépôt cloné localement au commit
  `c35612952dd6a547d1a7ac4cffab9c7051e86579` ; fichiers exploités : `material.csv` (résolution des noms affichés,
  du type et du grade des matériaux) et `engineers.csv` (identifiants des 38 Ingénieurs)
- https://raw.githubusercontent.com/EDCD/coriolis-data/master/modifications/specials.json
- https://raw.githubusercontent.com/EDCD/coriolis-data/master/modifications/blueprints.json
- https://raw.githubusercontent.com/EDCD/coriolis-data/master/modifications/modifications.json
- https://raw.githubusercontent.com/EDCD/coriolis-data/master/ships/diamondback_explorer.json
- https://raw.githubusercontent.com/EDCD/coriolis-data/master/ships/anaconda.json
- https://github.com/msarilar/EDEngineer (fichier `EDEngineer.Models/Utils/Extensions.cs`, plafonds de stockage par grade)

#### Wiki communautaire et outils tiers consultés le 9 septembre 2026

- https://elite-dangerous.fandom.com/wiki/Technology_Broker (consulté le 9 septembre 2026, via l'API MediaWiki)
- https://elite-dangerous.fandom.com/wiki/Frame_Shift_Drive (formule de portée de saut et spécifications par classe/rating)
- https://elite-dangerous.fandom.com/wiki/Thrusters, /wiki/Power_Plant, /wiki/Power_Distributor, /wiki/Sensors,
  /wiki/Shield_Generator, /wiki/Shield_Booster, /wiki/Bulkheads, /wiki/Hull_Reinforcement_Package, /wiki/Drive_Strengthening,
  /wiki/Mass_Manager, /wiki/Felicity_Farseer, /wiki/Bill_Turner, /wiki/Lori_Jameson, /wiki/Elvira_Martuuk,
  /wiki/Tiana_Fortune (fiches individuelles consultées le 9 septembre 2026, pour vérification des conditions de
  déblocage et des blueprints réellement proposés)
- https://canonn.science
- https://edtools.cc/ (consulté le 9 septembre 2026 — confirme l'absence d'outil dédié à l'Engineering/aux HGE sur ce
  site, section « Où farmer efficacement les matériaux d'Engineering, type par type »)
- https://www.edsm.net/ (consulté le 9 septembre 2026 — même constat que ci-dessus, aucun outil de repérage des HGE)
- https://edastro.com/ (consulté le 9 septembre 2026 — même constat)

*Corrections et ajouts de cette révision : voir le changelog associé pour le détail des points corrigés (blueprints
douteux, dates, scission des Technology Brokers, et ajout de la section HGE/farming des matériaux manufacturés et
encodés).*

*Révision suivante — intégration des données internes du dépôt (catalogues `assets/data/materials.json` et
`assets/data/blueprints.json`, édition 2026-08, et étude `docs/faisabilite-spansh-temps-reel-materiaux.md` du 19 août
2026). Ajouts : référentiel des 115 matériaux, sources et conditions des 24 catégories, deux sites de farm avec leurs
coordonnées Live, cinq fiches de blueprints entièrement chiffrées, matrice Ingénieur × Blueprint, table des taux de
conversion des comptoirs, cas travaillé du déblocage de Felicity Farseer. Corrections : conversion de l'excédent de
matériaux en crédits depuis le Dodec Update, règle d'allégeance des High Grade Emissions (et non l'économie du
système), trois matériaux bruts obtenus uniquement en minage d'astéroïdes, effets de blueprint devenus déterministes
depuis l'Update 18.08 (fourchettes « selon le tirage » supprimées), et coûts en matériaux des builds FSD recalculés en
rolls plutôt qu'en applications uniques.*

*Révision en cours — corrections et ajouts. Corrections : séparation de* Crystal Shards *(matériau manufacturé G1) et
des* Crystalline Shards *(site de récolte de matériaux bruts), qu'une source interne confondait ; Rhenium, Lead et
Boron retirés des lignes « prospection de surface » de la table des matériaux bruts, où ils contredisaient la règle
« minage d'astéroïdes uniquement » énoncée plus bas ; décompte des matériaux manufacturés à condition propre ramené de
onze à dix, conforme au tableau ; classification des treize matières premières du minage de surface tranchée par
l'annonce officielle du 2 septembre 2026, qui les range parmi les marchandises. Ajouts : section « Le Merc Coin et le
MercGear », les Operations comme source de matériaux, et mise à jour du contexte 2026 (Operations, Nomad, Rhino).
Nettoyage : les intitulés de section nomment désormais leur sujet plutôt que le fichier de données dont ils
proviennent, et le sourçage interne est reporté en fin de section et dans la liste des sources.*

*Révision du 10 septembre 2026 — passage au chiffre depuis deux dépôts clonés localement (EDCD/coriolis-data au
commit `0db9234b5b9ce8c939ea84133d7ce336eea88e27` et EDCD/FDevIDs au commit
`c35612952dd6a547d1a7ac4cffab9c7051e86579`), ce qui rend chaque valeur re-vérifiable par script. Ajouts :
référentiel chiffré des 81 blueprints de modules sur 387 couples blueprint × grade, table des coûts totaux
d'une montée G1 → G5 pour les 81 blueprints, matrice Blueprint × Ingénieur × grade maximum sur
186 couples et les 25 Ingénieurs classiques, colonne « Grade maximum par spécialité » ajoutée au tableau des 25 Ingénieurs
classiques, et section « Effets expérimentaux » refondue autour d'une matrice de compatibilité des 91 effets
avec leur coût en matériaux et la lecture inverse module par module. Points explicitement laissés ouverts :
`specials.json` ne chiffre aucun effet expérimental et n'en associe aucun à un Ingénieur, et aucun des deux dépôts ne
couvre les 13 Ingénieurs Odyssey.*

*Passe de vérification du 10 septembre 2026 — les tables chiffrées ont été recalculées par script contre le clone
d'EDCD/coriolis-data au commit `0db9234b5b9ce8c939ea84133d7ce336eea88e27`, et les affirmations en prose alignées sur
ce que la source porte réellement. Trois corrections. D'abord, deux blueprints distincts, `MC_Overcharged` et
`Weapon_Overcharged`, portent le même nom affiché *Overcharged* et étaient tous deux rattachés à « Armes (blueprint
générique) », ce qui les rendait indiscernables dans la table des coûts totaux ; `MC_Overcharged` n'est déclaré que
par les groupes `mc` et `advmc` et porte désormais « Multi-Cannon, Advanced Multi-Cannon », si bien que les 81 lignes
de cette table correspondent maintenant à 81 couples distincts. Ensuite, la phrase de méthode de la matrice des
effets expérimentaux ne parlait que de la clé `specials` alors que les racks de missiles utilisent `specials_S` et
`specials_D` : la précision a été ajoutée, faute de quoi une vérification portant sur la seule clé `specials`
conclurait à tort que 21 attributions ne sont pas étayées. Recomptage fait : 206 références sur trois clés et
24 familles de modules, 198 attributions une fois les deux listes du groupe `mr` fusionnées dans la matrice,
0 divergence sur les 89 lignes de la matrice qui portent au moins un module et 0 sur les 24 lignes de la lecture
inverse. Enfin, les intitulés qui annonçaient une matrice « complète » nomment désormais leur périmètre réel, les
25 Ingénieurs classiques, les 13 Ingénieurs Odyssey restant hors de portée des deux jeux de données.*

*Révision du 10 septembre 2026 — articulation avec le guide d'exploration. Le renvoi vague « hotspots à cartographier
via un outil communautaire » de la table des matériaux bruts est remplacé par un renvoi vers
[10 — Exploration](./10-exploration.md), qui traite la planification de route et ce qu'une cartographie DSS révèle en
surface. Trois autres renvois vers ce même guide sont posés dans les sections consacrées aux matériaux bruts, un
quatrième dans la mise au point Crystal Shards / Crystalline Shards — tous sans ancre, pour rester justes si
l'intitulé de la section visée évolue. Cette mise au point est complétée par la confrontation des deux relevés de
conditions que porte le corpus, celui du catalogue de matériaux et celui du catalogue d'exobiologie repris par le
guide 10 : sur 8 critères comparables, 4 divergent, 3 sont des précisions apportées par le seul catalogue
d'exobiologie et 1 fait accord. Cet écart n'est pas arbitré ici, faute de source vérifiable depuis ce chantier, et il
est reporté en* zones_incertaines. *Aucun chiffre nouveau n'est introduit : les valeurs confrontées sont recopiées
telles quelles des deux guides, et la table d'écart comme le réalignement de la table des matériaux bruts sont générés
par script.*
