---
id: 24-community-goals
titre: "Community Goals (mécanique générique)"
domaine: social
entites: [Community Goal, CG, paliers (tiers), tranches de contribution, Inara.cz, GalNet, tableau des missions, modules pré-engineered, merits Powerplay, Battle for Sol, Wreaken Calls for Mining Support, Third Aegis Initiative]
mots_cles_en: [community goal, CG, tier, contribution ranking, top percentile, top 25 CMDRs, GalNet, mission board, pre-engineered module, paint job, decal, merits, mission stacking]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-09
confiance_globale: moyenne
volatilite: haute
sources_primaires: [Inara.cz (pages Community Goals et historique paginé), Wikipédia (Elite Dangerous), corpus interne 00-chronologie-canonique.md, 01-lore.md et guides d'activité]
zones_incertaines: ["aucun barème standardisé de paliers, ni de seuils de tranches de centile, n'a pu être confirmé sur l'ensemble de l'historique du jeu", "barème exact des merits Powerplay distribués par les CG rattachées à une Power", "détail des modules engineered offerts par la CG « Battle for Sol » de décembre 2024", "on ignore si une CG crédite la livraison au commandant qui l'effectue ou à celui qui a produit la marchandise déposée sur un Fleet Carrier", "chiffres de rendement de la section 4 repris des guides d'activité internes, faute d'accès web lors de la rédaction"]
guides_lies: [1, 10, 11, 20, 21]
---
# Community Goals (mécanique générique)

## En bref

Une **Community Goal** (CG, [glossaire](./00-glossaire.md)) est un objectif temporaire publié par Frontier sur GalNet et au tableau des missions,
rattaché à une station ou un système, auquel tous les commandants contribuent quels que soient leur plateforme et leur
mode de jeu : livrer une commodité, miner un minerai, rendre des primes (*bounty vouchers*) ou des combat bonds,
soumettre des données d'exploration ou d'exobiologie. Sa fenêtre dure généralement une à trois semaines. La récompense
combine deux mesures : le **palier** (*tier*) atteint collectivement, qui plafonne le gain de tout le monde, et la
**tranche de contribution individuelle** (top 75 %, 50 %, 25 %, parfois « top 10 » ou « top 25 CMDRs »). Les barèmes
observés vont de quelques paliers à neuf, pour environ 30 à 180 M Cr. S'y ajoutent des modules pré-engineered, des
peintures, des décalques, des packs Odyssey, l'ouverture d'un ingénieur ou d'un permis (Alioth), rarement un vaisseau
complet (Alliance Chieftain, 2022), et depuis Powerplay 2.0 des merits. Pendant la CG, la marchandise ciblée bénéficie
d'un multiplicateur de prix de x2 à x10. Inara.cz suit chaque CG active depuis 2015.

## Vue d'ensemble des Community Goals (CG) dans Elite Dangerous

Un **Community Goal** (CG) est un objectif de jeu temporaire, publié par Frontier Developments (annoncé sur GalNet et proposé au tableau des missions en jeu), rattaché à une station ou un système précis, que l'ensemble des commandants de la galaxie — toutes plateformes et tous modes de jeu confondus — peuvent contribuer à remplir en effectuant une action de jeu donnée : livrer une marchandise, miner un minerai, rendre des primes ou des combat bonds, soumettre des données d'exploration ou d'exobiologie, etc. C'est le principal mécanisme par lequel Frontier transforme une action individuelle de millions de commandants isolés en un événement collectif mesurable, doté de récompenses et, souvent, d'une portée narrative.

Ce guide documente la mécanique générique des CG — structure à paliers, double suivi de contribution, cycles temporels, récompenses typiques — ainsi que la façon de les repérer en jeu ou via les outils communautaires, propose un échantillon de CG marquantes entre 2015 et 2026, et détaille en [section 4](#4-optimiser-sa-contribution-individuelle-à-une-cg--stratégies-actionnables) les stratégies concrètes pour optimiser son classement individuel (timing d'engagement, activités et builds les plus rentables par type de CG, logistique collective). Les épisodes de CG ayant fait progresser le lore galactique (guerre thargoïde, Aegis, anniversaire de Colonia...) sont traités en détail dans [Lore et histoire de l'univers](./01-lore.md) ; ce guide-ci se concentre sur le mécanisme lui-même et sur son optimisation pratique.

*Dernière vérification : 9 septembre 2026. Les données chiffrées et historiques de ce guide s'appuient principalement sur Inara.cz (voir [section 2.2](#22-inaracz-la-référence-communautaire-pour-le-suivi-chiffré-des-cg) pour sa méthode) et sur la [Chronologie canonique du corpus](./00-chronologie-canonique.md) pour l'arbitrage des dates ; pour toute CG postérieure à cette date, se référer au tableau des missions en jeu ou au flux GalNet. Certains détails chiffrés (barèmes exacts de paliers, montants précis de merits Powerplay) n'ont pas pu être confirmés par une source primaire lors de la dernière relecture et sont signalés comme tels ci-dessous plutôt que présentés comme des standards fixes.*

---

## 1. Fonctionnement générique des Community Goals

### 1.1 Qu'est-ce qu'un Community Goal ?

Un CG combine trois éléments constants :

- **Un objectif de jeu unique et mesurable**, rattaché à une station ou un système cible (livrer X tonnes d'une commodité, rendre Y crédits de primes, miner Z tonnes d'un minerai, soumettre N échantillons d'exobiologie ou de données d'exploration, etc.).
- **Une fenêtre de temps limitée**, le plus souvent de une à trois semaines.
- **Un barème de récompenses par palier**, distribué à la fin de la CG selon deux critères combinés : le palier atteint par la communauté entière, et le rang de contribution individuelle du commandant au sein de ce palier (voir [1.3](#13-deux-niveaux-de-suivi-de-contribution--progression-collective-et-rang-individuel)).

Les CG sont initiées par des factions mineures, des superpuissances (Fédération, Empire, Alliance) ou, depuis Powerplay 2.0, par des Powers, et servent souvent de vecteur à un enjeu de fond : renforcer une faction en conflit local ([BGS](./21-bgs.md)), soutenir l'effort de guerre anti-thargoïde, financer la recherche scientifique, ou accompagner la sortie d'un nouveau contenu (vaisseau, véhicule, fonctionnalité).

### 1.2 Une structure à paliers (tiers) cumulatifs de récompense

Chaque CG définit un barème de paliers cumulatifs : la progression totale de la communauté (tonnage livré, primes rendues, données soumises...) fait franchir ces paliers un par un ; plus le palier final atteint est élevé, meilleure est la récompense pour l'ensemble des participants. Le nombre de paliers varie sensiblement d'une CG à l'autre — les exemples observés dans ce guide vont d'une poignée de paliers à environ neuf — sans qu'un barème unique et standardisé sur l'ensemble de l'historique du jeu ait pu être confirmé pour ce guide.

Exemple illustratif (CG « Wreaken Calls for Mining Support », minage, 9 paliers, active en septembre 2026) :

| Palier atteint par la communauté | Récompense en crédits (indicative) |
|---|---|
| Palier bas (1-3) | ≈ 30 M Cr |
| Paliers intermédiaires (4-6) | croissante |
| Palier maximal (9/9) | ≈ 180 M Cr |

Un palier non atteint par la communauté plafonne la récompense de **tous** les participants à ce niveau, quel qu'ait été leur effort individuel — un très gros contributeur dans une CG qui échoue à monter de palier reste plafonné à la récompense du dernier palier collectivement franchi.

### 1.3 Deux niveaux de suivi de contribution : progression collective et rang individuel

La récompense effectivement perçue par un commandant dépend de la combinaison de deux mesures distinctes :

- **Le suivi collectif** : une barre de progression globale (par ex. « 32,74 % — palier 3/5 », ou en tonnage brut « 583 427 / 3 200 000 ») détermine quel palier est débloqué pour l'ensemble des participants.
- **Le suivi individuel** : au sein d'un palier atteint, chaque commandant est classé selon sa contribution personnelle relative à celle des autres participants — souvent par tranche de centile (par ex. « top 75 % », « top 50 % », « top 25 % »), parfois par classement nominal restreint (« top 10 CMDRs », « top 25 CMDRs ») réservé aux récompenses les plus exceptionnelles (module engineered rare, vaisseau complet). Le nombre de tranches et leurs seuils exacts varient d'une CG à l'autre ; il n'existe pas de grille strictement standardisée observable sur l'ensemble de l'historique du jeu.

Conséquence pratique : un commandant n'ayant rien livré ne touche rien, même si le palier maximal est atteint par la communauté ; à l'inverse, contribuer davantage n'améliore la récompense que jusqu'à la tranche de classement supérieure suivante, et seulement si le palier collectif correspondant a été débloqué.

### 1.4 Cycles temporels : une fenêtre variable plutôt qu'un cycle hebdomadaire strict

Les CG ne suivent pas un cycle hebdomadaire unique et figé. La majorité durent entre une et trois semaines, avec des échéances typiquement calées sur les fenêtres de maintenance ou de mise à jour du jeu (souvent le jeudi). En revanche, plusieurs CG tournent généralement en parallèle à un instant donné — souvent des paires antagonistes rattachées au même conflit (campagne « Pour » contre « Contre » une faction, ou Fédération contre Alliance pour un même système). Ce chevauchement crée, à l'échelle de la galaxie, un flux quasi continu de renouvellement plutôt qu'un rythme hebdomadaire strict et unique.

### 1.5 Le bonus économique : le multiplicateur de prix appliqué pendant une CG

Indépendamment de la récompense de fin de palier, la marchandise ou l'activité ciblée par une CG bénéficie très souvent d'un multiplicateur de prix de vente pendant toute sa durée — des multiplicateurs de x2 à x10 selon les CG ont été observés. Ce bonus incite à participer à l'activité même sans viser le haut du classement individuel, et explique pourquoi les CG figurent parmi les activités commerciales et minières ponctuellement les plus rentables du jeu.

### 1.6 Panorama des récompenses typiques d'une CG (2015-2026)

| Type de récompense | Exemples observés (2015-2026) |
|---|---|
| Crédits | Quasi systématiques ; de quelques centaines de milliers à plusieurs centaines de millions de Cr selon le palier atteint |
| Modules pré-engineered | Armes et modules déjà modifiés par un ingénieur sans coût de matériaux ni de réputation (multicanon pré-engineered, module de point-defence engineered, Detailed Surface Scanner (module de cartographie de surface, DSS) à portée de sonde doublée, modules AX anti-thargoïdes pré-engineered) |
| Peintures de vaisseau (paint jobs) | Fréquentes en récompense de palier haut (Federal Corvette, Imperial Cutter, Krait Mk II, Scarab SRV, Type-11 Prospector, Rhino) |
| Décalques (decals) | Cosmétiques mineurs, souvent réservés aux tranches de contribution inférieures |
| Matériaux et packs d'équipement | Packs de combinaison Odyssey (Artemis Suit Pack, version modifiée grade 5 pour les meilleurs contributeurs), Caustic Sink Launcher gratuits, racks de soute agrandis (Expanded Cargo Rack taille 5) |
| Accès débloqués | Ouverture d'un nouvel ingénieur ou vendeur (ex. atelier de Marco Qwent), permis de système permanent (ex. Alioth) |
| Vaisseau complet | Cas rare mais attesté : un vaisseau entier offert aux tout meilleurs contributeurs (ex. un Alliance Chieftain pour le top 25 CMDRs, 2022) |
| Merits Powerplay | Depuis Powerplay 2.0 (31 octobre 2024, voir [Powerplay](./02-powerplay.md)), certaines CG rattachées à une Power intègrent une récompense en merits Powerplay en plus des crédits pour les meilleurs contributeurs ; le barème exact de ces merits varie selon la campagne et n'a pas pu être confirmé de façon fiable pour ce guide (à vérifier au cas par cas sur le tableau des missions) |
| Lien narratif | Certaines CG font directement progresser une trame de lore (guerre thargoïde, conflits BGS locaux, storyline de puissance) — voir [Lore](./01-lore.md) |

---

## 2. Comment repérer les Community Goals actives

### 2.1 Repérer une CG en jeu : tableau des missions et flux GalNet

Le tableau des missions, disponible à quai dans les stations concernées, liste les CG actives rattachées à cette station. Le lancement et le suivi de chaque CG sont également relayés sur le flux **GalNet**, consultable en jeu et sur le site officiel.

### 2.2 Inara.cz, la référence communautaire pour le suivi chiffré des CG

La page dédiée [inara.cz/elite/communitygoals/](https://inara.cz/elite/communitygoals/) est la ressource tierce la plus complète pour suivre les CG. Elle liste les CG actives et achevées — l'historique remonte aux toutes premières semaines suivant le lancement du jeu (16 décembre 2014), avec des entrées dès février 2015 — et affiche pour chacune : nom, station et système, objectif exact, palier courant et pourcentage de progression, nombre de contributeurs, temps restant, et barème de récompenses par palier et par tranche de classement.

Inara précise elle-même sa méthode : elle suit la progression globale, estime les seuils de palier et calcule la contribution personnelle du joueur à partir de données de journal de jeu (*journal data*) — soumises soit via des outils tiers (EDMC, EDDiscovery), soit par import direct du journal sur Inara. Le suivi individuel dépend donc d'une soumission volontaire du joueur : Inara n'a pas d'accès direct aux serveurs de Frontier, à la différence du tableau des missions en jeu qui reflète l'état réel côté serveur.

### 2.3 Autres relais de publication des CG : wiki communautaire et réseaux Frontier

Le wiki communautaire Elite Dangerous ainsi que les réseaux sociaux officiels de Frontier relaient également le lancement de chaque CG, mais n'offrent généralement pas le même niveau de suivi chiffré en temps réel qu'Inara.cz. Pour un panorama plus large des outils tiers de suivi de données (EDDN, EDSM, Spansh, Canonn...), voir [Le guide des outils communautaires](./16-outils.md) et [Sources de données disponibles](./17-sources-donnees.md).

---

## 3. Community Goals marquantes (2015-2026) : un échantillon vérifié

Le tableau ci-dessous est un échantillon repéré à intervalles réguliers dans l'historique d'Inara.cz (plusieurs centaines de CG au total depuis 2015) : il donne un point d'ancrage vérifié par période plutôt qu'un palmarès exhaustif des CG les plus célèbres. La liste complète, avec pagination, reste consultable en direct sur [inara.cz/elite/communitygoals/](https://inara.cz/elite/communitygoals/).

| Période | Nom de la CG | Système / Station | Objectif | Portée ou récompense notable |
|---|---|---|---|---|
| 17-18 février 2015 | Secure Banki / Starport Supplies Test | Banki / Yembo | Combat bonds / vente de métaux | Parmi les toutes premières CG du jeu, quelques semaines après le lancement (16 décembre 2014) |
| Mai 2015 | Preparing For The President | 78 Ursae Majoris | Bounty vouchers Alliance | Palier 10 atteint, 6 941 contributeurs |
| Décembre 2015 | Xihe Companions for Weber Gateway | Noti | Livraison de compagnons androïdes Xihe | Palier 8/8 complet |
| Juillet-août 2016 | Protect Traders in Carthage / A Majestic Development | Carthage | Chasse de primes / construction d'infrastructure | Jusqu'à ≈ 43,7 M Cr pour les meilleurs contributeurs |
| Octobre 2017 | Third Aegis Initiative | Wyrd | Livraison de matériaux et explosifs thargoïdes pour la recherche | Jalon de la storyline anti-thargoïde Aegis (11,1 M tonnes collectées ; voir [Lore, « AEGIS et l'arc Salvation / Azimuth Biotech »](./01-lore.md)) |
| Juin 2018 | The 'Shut Down Lave Radio' Campaign | Lave Station | Composants pour un brouilleur de signal | Épisode de la storyline « Lave Radio » |
| Février-mars 2019 | Macrosphere Mining Petition | DS Leonis | Minerais rares (Benitoite, Grandidierite, Alexandrite) | Alimente un scanner de détection de reprogrammation robotique illégale |
| Décembre 2020-janvier 2021 | Deliver Xenological Samples Required by Colonia Scientists | Jaques Station, Colonia | Échantillons biologiques | Décalques exclusifs, lien direct avec la storyline Colonia |
| Mai-juin 2021 | Prime Minister Edmund Mahon's Expansion Initiative/Policy | Gateway (Dublin Citadel) | Tritium miné et composites | Permis permanent pour Alioth (top 75 %) ; chaque palier finance la construction d'un nouveau starport en territoire Alliance |
| Juin 2022 | Palin's Thargoid Research Project Phase 2 | Arque | Capteurs, sondes et résine thargoïdes | Packs de renforcement de coque engineered grade 5 |
| Juin 2022 | Oppose the Sirius-Alliance Defense Pact | Di Jian | Composants divers | Vaisseau complet (Alliance Chieftain) offert au top 25 CMDRs |
| Mars 2023 | Fight for Tavgi Blue Life Inc / Fight for Torval Mining | Tavgi | Combat bonds | Peintures Federal Corvette / Imperial Cutter pour le top 50 % — conflit [BGS](./21-bgs.md) entre factions locales |
| 26 septembre 2024 | Defend Shinrarta Dezhra Against Thargoid Invasion | V886 Centauri | Combat bonds anti-thargoïdes | Modules d'armes AX pré-engineered (voir [Lore, « La Seconde Guerre Thargoïde moderne »](./01-lore.md)) |
| 12-19 décembre 2024 | Battle for Sol: Destroy Titan Cocijo | Luyten's Star (Sol) | Combat et livraisons pendant le siège final du Titan Cocijo | Récompenses en crédits et modules engineered (barème détaillé non confirmé pour ce guide) ; CG climactique marquant la destruction du dernier Titan thargoïde et la fin officielle de la Seconde Guerre Thargoïde. La [Chronologie canonique](./00-chronologie-canonique.md) arbitre les deux bornes réelles — début de l'invasion de Sol par Cocijo le 5 décembre 2024 et chute du Titan le 19 décembre 2024 à 15:00 UTC — sans raconter le siège lui-même ; c'est [Lore, « La Seconde Guerre Thargoïde »](./01-lore.md) qui en donne le déroulé : siège entamé le 12 décembre, blocage des conduits de refroidissement, annonce de victoire par la présidente Felicia Winters |
| Novembre-décembre 2025 | Opening Federal Campaign / Opening Alliance Campaign for HIP 87621 | Col 359 Sector (The Ironbridge / Horizon's Glow) | Renforcer ou saper les systèmes autour de HIP 87621 | Merits Powerplay 2.0 (barème exact non confirmé), multicanon pré-engineered et crédits |
| Juillet-août 2026 | Colonia Council Anniversary Celebrations Support | Peters Base, Facece | Livraison de marchandises rares | Cosmétiques Type-8 Convoy et Panther Clipper — lié au 10ᵉ anniversaire de la fondation de Colonia (9 septembre 2016, voir [Lore, « 10ᵉ anniversaire de Colonia »](./01-lore.md)) |
| Septembre 2026 (en cours à la rédaction) | Wreaken Calls for Mining Support / Surface Mining Support | Metz Enterprise, Ega | Minage laser et minage de surface | 30 à 180 M Cr et skins Type-11 Prospector et Rhino (le SRV Rhino est sorti le 2 septembre 2026, voir [Roadmap](./15-roadmap.md)) |

---

## 4. Optimiser sa contribution individuelle à une CG : stratégies actionnables

Les sections précédentes décrivent la mécanique (paliers, double suivi, cycles) mais pas la question que se pose concrètement un commandant en lançant une CG : *comment maximiser mon classement individuel pour le moins d'heures possible ?* Cette section synthétise, en s'appuyant sur les guides d'activité déjà vérifiés du corpus (minage, commerce, combat, exploration, logistique de groupe), les leviers pratiques disponibles.

*Note méthodologique : les recherches web tentées pour cette section se sont heurtées à un budget épuisé et à des sites de référence inaccessibles (voir le détail dans la note méthodologique de la [section Sources](#sources), en bas de page) ; les chiffres cités ci-dessous proviennent donc des guides d'activité déjà vérifiés de ce corpus plutôt que d'une nouvelle collecte, et le raisonnement de timing ([4.1](#41-stratégie-de-timing-dune-cg--sengager-tôt-ou-attendre-la-fin-de-la-fenêtre)) découle directement de la mécanique décrite en [section 1.3](#13-deux-niveaux-de-suivi-de-contribution--progression-collective-et-rang-individuel). Pour un rendement chiffré à jour au moment de la lecture, croiser le tableau des missions en jeu (valeur de la CG en cours) avec les outils listés en [section 2](#2-comment-repérer-les-community-goals-actives) et dans [16-outils.md](./16-outils.md).*

### 4.1 Stratégie de timing d'une CG : s'engager tôt ou attendre la fin de la fenêtre

Le mécanisme à deux niveaux décrit en [1.3](#13-deux-niveaux-de-suivi-de-contribution--progression-collective-et-rang-individuel) crée un arbitrage réel entre deux approches :

- **S'engager tôt** (dès l'annonce de la CG) sécurise une place favorable dans le classement individuel pendant que le nombre de participants est encore faible — un avantage particulièrement net pour les récompenses à classement nominal restreint (« top 10/25 CMDRs »), qui sont mathématiquement plus difficiles à atteindre une fois que la masse des contributeurs tardifs a rejoint l'effort. La contribution déjà livrée n'est jamais perdue : il n'y a pas de risque de « gâchis » à contribuer tôt.
- **Le risque associé** est que le palier collectif visé (celui qui plafonne la récompense de tout le monde, voir [1.2](#12-une-structure-à-paliers-tiers-cumulatifs-de-récompense)) n'est jamais garanti à l'avance : un commandant qui a beaucoup investi dans une CG qui plafonne finalement à un palier bas touche une récompense limitée par ce palier, quel qu'ait été son rang individuel. Ce risque est structurel et ne se résout pas en attendant — attendre ne fait que déplacer le pari sur la progression collective vers la fin de la fenêtre, avec moins de marge pour réagir si la CG patine.
- **Attendre la fin de la fenêtre** réduit l'incertitude sur le palier collectif (souvent plus visible dans les derniers jours, la barre de progression globale étant publique en jeu et sur Inara — voir [2.1](#21-repérer-une-cg-en-jeu--tableau-des-missions-et-flux-galnet)-[2.2](#22-inaracz-la-référence-communautaire-pour-le-suivi-chiffré-des-cg)) mais expose à une concurrence bien plus dense pour les tranches de centile : la communauté publie régulièrement des sursauts de contribution dans les dernières heures d'une CG, ce qui peut faire grimper le seuil nécessaire pour atteindre une tranche donnée (« top 25 % ») plus vite que prévu.
- **Approche hybride recommandée** : suivre la barre de progression collective ([2.1](#21-repérer-une-cg-en-jeu--tableau-des-missions-et-flux-galnet)-[2.2](#22-inaracz-la-référence-communautaire-pour-le-suivi-chiffré-des-cg)) durant la première moitié de la fenêtre pour estimer si le palier visé est en bonne voie ; si oui, répartir l'effort régulièrement ; si la progression semble en retard par rapport au temps restant, concentrer l'essentiel de l'effort dans le dernier tiers de la fenêtre, au moment où la communauté elle-même accélère typiquement sa contribution.

### 4.2 Activités et builds les plus efficaces par type de CG

Le rendement par heure dépend avant tout de l'activité ciblée par la CG. Les guides dédiés du corpus détaillent les builds ; cette sous-section indique lequel privilégier et pourquoi, dans un contexte de CG spécifiquement.

#### 4.2.1 CG de minage : laser, core mining, hotspot et wing mining

**Minage.** Voir [Le Minage](./20-minage.md) pour le détail complet des trois techniques, de l'équipement et des vaisseaux. Pour une CG :
- Le **minage laser bien optimisé** (Python ou Type-9 Heavy équipés de refinery, prospector/collector limpets en nombre et cargo racks) atteint, selon la presse spécialisée citée par [20-minage.md, section 5](./20-minage.md), largement plus de 100 millions de Cr/heure en valeur de revente — un ordre de grandeur transposable au tonnage brut recherché par une CG de minage.
- Le **minage de noyau (core mining)** produit des volumes plus concentrés par roche pour les minerais rares (Painite, diamants basse température, Void Opals) mais demande davantage de pilotage actif (voir [20-minage.md, section 1.3](./20-minage.md)) : à réserver aux CG portant sur ces minerais spécifiques plutôt qu'au tonnage générique.
- Choisir un **hotspot** (concentration minérale) du type de ressource exactement demandé par la CG et situé le plus près possible de la station cible (voir [20-minage.md, section 4](./20-minage.md) pour les outils de repérage) : le temps de trajet aller-retour est souvent le principal facteur limitant le tonnage/heure, davantage que la vitesse d'extraction elle-même.
- Le **wing mining organisé** (minage en escadre : plusieurs commandants dédiant chacun un rôle — extraction, navette, vente) est cité par la presse spécialisée comme pouvant démultiplier le rendement collectif d'une escouade ; voir la mise en garde sur la fiabilité de ce chiffre précis dans [20-minage.md, section 5](./20-minage.md).

#### 4.2.2 CG de primes et de combat bonds : RES, Compromised Nav Beacons, builds AX

**Prime/combat.** Voir [Combat spatial](./08-combat-spatial.md) (sections 4, 7 et 8) et, pour les CG anti-thargoïdes spécifiquement, [Combat AX](./25-combat-ax.md). Pour une CG :
- Vérifier d'abord **quelle monnaie exacte** la CG compte (bounty vouchers, combat bonds, ou nombre de destructions) : cela oriente le choix de la zone de farm et du type de cible, une prime individuelle plus élevée (cibles « Deadly »/« Elite ») rapportant davantage par kill qu'un grand nombre de cibles faiblement primées.
- Les **Resource Extraction Sites** (sites d'extraction de ressources), en particulier les **Hazardous RES**, et les **Compromised Nav Beacons** (Nav Beacons compromis) ([08-combat-spatial.md, sections 4.1-4.2](./08-combat-spatial.md)) restent les foyers de farm de primes les plus denses en continu ; un HazRES exige toutefois un vaisseau robuste (boucliers renforcés, SCB) pour éviter une destruction rapide face à des meutes de rang élevé.
- Pour une CG de type combat anti-thargoïde, un build classique de chasse aux primes ne suffit pas : il faut un armement AX dédié et des contre-mesures aux nuages caustiques ([25-combat-ax.md, sections 4-5](./25-combat-ax.md)), et l'organisation communautaire **AXI (Anti Xeno Initiative)** coordonne justement ce type de campagne à grande échelle ([25-combat-ax.md, section 6.2](./25-combat-ax.md)).
- Confirmer où les vouchers doivent être encaissés (comptoir de la faction/superpuissance liée à la CG) **avant** de lancer une session de farm loin de ce point de vente : un voucher encaissé au mauvais guichet ne compte pas pour la CG.

#### 4.2.3 CG de commerce : gros porteurs et point d'approvisionnement le plus proche

**Commerce.** Voir [Le Commerce](./11-commerce.md), notamment la section 9 déjà consacrée aux CG et la section 5 sur les vaisseaux de fret. Pour une CG :
- Le tonnage/heure dépend directement de la capacité de soute du vaisseau utilisé : privilégier un **Type-9 Heavy, un Type-10 Defender ou un Imperial Cutter** ([11-commerce.md, section 5](./11-commerce.md)) plutôt qu'un vaisseau polyvalent moins spécialisé en fret.
- Acheter la commodité au **point d'approvisionnement le plus proche possible** de la station cible de la CG réduit le temps de trajet par rotation, ce qui compte souvent davantage que la taille de la soute au-delà d'un certain seuil.
- Si un point d'achat unique s'épuise (stock insuffisant, prix qui grimpe au fur et à mesure des achats), répartir les achats sur plusieurs stations sources proches, éventuellement en coordination avec d'autres membres d'escadron achetant chacun à un point différent avant de converger vers la station cible.

#### 4.2.4 CG d'exploration et d'exobiologie : corps à forte valeur et échantillons complets

**Exploration et exobiologie.** Voir [Exploration et exobiologie](./10-exploration.md) pour le détail complet. Pour une CG :
- Une CG de données d'exploration valorise surtout les corps à forte valeur de cartographie (mondes semblables à la Terre, mondes d'eau terraformables, mondes riches en ammoniac ou en métaux terraformables — voir [10-exploration.md, section 1.5](./10-exploration.md)) : prioriser leur scan plutôt que celui de chaque corps d'un système.
- Une CG d'exobiologie impose de vendre des échantillons complets (trois scans de la même espèce, chacun espacé de la précédente) ; privilégier les corps hébergeant plusieurs espèces à forte valeur repérées ensemble, dont le classement complet figure dans [10-exploration.md, section 2.5](./10-exploration.md), pour limiter les trajets en SRV/à pied entre relevés.
- Les données doivent être physiquement rapportées et vendues à la station cible de la CG : intégrer la distance de retour dans le calcul de rentabilité dès le départ plutôt que de s'enfoncer loin dans une région inexplorée pendant la fenêtre de la CG.

### 4.3 Logistique collective d'une CG : Wing, escadron, Fleet Carrier, stacking de missions

- **Répartition en Wing/escadron.** Un [Wing](./23-jeu-en-groupe.md) (jusqu'à 4 joueurs) ne mutualise pas le score individuel de CG — chaque commandant reste comptabilisé séparément — mais partage en revanche l'intégralité des bounty vouchers et combat bonds entre tous les membres présents dans la même instance ayant participé à une destruction, **sans division du montant** ([23-jeu-en-groupe.md, section 2.3](./23-jeu-en-groupe.md)) : une CG de type combat/primes est donc mécaniquement plus rentable en Wing qu'en solo, à ressources égales. Un [Squadron](./22-squadrons.md), structure persistante plus large qu'un Wing, sert surtout à coordonner qui mine, qui transporte et qui vend, et à répartir les hotspots ou routes commerciales pour éviter que plusieurs membres ne se marchent dessus sur le même point de collecte.
- **Le Fleet Carrier comme relais.** Un [Porte-Vaisseau](./19-fleet-carriers.md) peut être positionné à portée de saut du site de collecte (jusqu'à 500 années-lumière par saut, avec un cycle complet le plus rapide d'environ 20 minutes entre deux sauts — [19-fleet-carriers.md, section 3](./19-fleet-carriers.md)) et servir de point de dépôt intermédiaire pour les vaisseaux miniers ou commerciaux, qui livrent alors au carrier au lieu de faire l'aller-retour complet jusqu'à la station de la CG à chaque rotation ; un ou quelques gros porteurs se chargent ensuite de rapatrier le stock accumulé du carrier vers la station cible en un nombre réduit de trajets. Un **Squadron Carrier**, financé collectivement via la Squadron Bank, fonctionne selon toute vraisemblance comme un Fleet Carrier au sens mécanique et peut jouer ce même rôle de relais pour un escadron entier ([22-squadrons.md, section 6.1](./22-squadrons.md)). Point à vérifier avant de s'appuyer dessus : la CG crédite la contribution au commandant qui effectue la livraison finale à la station, ce qui peut ne pas correspondre à celui qui a miné ou acheté la marchandise déposée sur le carrier — à tester sur un petit lot avant d'y engager toute une cargaison, ou à confirmer auprès de la coordination communautaire de la CG en cours.
- **Stacking de missions** (cumul volontaire de plusieurs missions compatibles sur un même trajet). Le tableau des missions d'une station propose fréquemment, en parallèle d'une CG, des contrats individuels portant sur la même commodité, le même type de cible ou la même activité (livraison, primes). Accepter ces missions compatibles avant de démarrer une session permet de cumuler, pour un même trajet ou une même session de combat, la progression de la CG, la récompense de la mission, et le bonus de prix ou de primes propre à la CG (voir [1.5](#15-le-bonus-économique--le-multiplicateur-de-prix-appliqué-pendant-une-cg)) — à condition de vérifier que la commodité ou le type de cible de la mission correspond **exactement** à celui compté par la CG, une mission portant sur un produit ou une cible voisine mais différente ne faisant pas progresser la barre de la CG même si elle reste rentable en elle-même.

---

## 5. Community Goals et le reste du jeu

Les Community Goals ne sont pas un système isolé : elles recoupent plusieurs autres mécaniques documentées ailleurs dans ce corpus.

- **Lore et narration** ([01-lore.md](./01-lore.md)) — de nombreuses CG font progresser des arcs narratifs majeurs : collecte de matériaux et défense de stations pendant la Seconde Guerre Thargoïde, financement du décryptage des logs Guardian par Ram Tah, campagnes logistiques pour l'anniversaire de Colonia. Ce guide documente le mécanisme générique ; [01-lore.md](./01-lore.md), section 7, documente les épisodes de CG ayant marqué l'histoire du jeu.
- **Exploration et exobiologie** ([10-exploration.md](./10-exploration.md)) — les CG de type « livraison de données d'exploration ou d'exobiologie » récompensent souvent des scanners engineered (Detailed Surface Scanner à portée doublée) ou des multiplicateurs temporaires de gains d'exploration ; elles constituent un débouché ponctuel très rentable pour les données accumulées en exploration.
- **Roadmap et sorties de contenu** ([15-roadmap.md](./15-roadmap.md)) — les CG accompagnent quasi systématiquement la sortie d'un nouveau vaisseau, véhicule ou fonctionnalité (skins Type-11 Prospector et Rhino lors de leurs sorties respectives, merits Powerplay 2.0 intégrés à certaines campagnes de Power depuis fin 2025) : elles restent le principal vecteur communautaire par lequel Frontier fait vivre une nouveauté après son lancement.
- **Background Simulation** ([21-bgs.md](./21-bgs.md)) — les CG de type « Fight for X » (combat bonds au profit d'une faction) sont un instrument direct du BGS : elles arbitrent des conflits entre factions mineures locales et peuvent faire basculer l'état d'expansion, de guerre ou de récession d'une faction. Voir [21-bgs.md](./21-bgs.md) pour la mécanique complète des états de faction et leur articulation avec Powerplay et la Colonisation.

---

## Questions fréquentes

**Qu'est-ce qu'une Community Goal (CG) ?**
Un objectif de jeu temporaire publié par Frontier sur GalNet et au tableau des missions, rattaché à une station ou un système, auquel tous les commandants contribuent — toutes plateformes et tous modes de jeu confondus — en livrant une marchandise, en minant, en rendant des primes ou des combat bonds, ou en soumettant des données d'exploration ou d'exobiologie. Voir [1.1](#11-quest-ce-quun-community-goal-).

**Comment fonctionnent les paliers (tiers) d'une CG ?**
Chaque CG définit un barème de paliers cumulatifs : la progression totale de la communauté fait franchir ces paliers un par un, et le palier final atteint plafonne la récompense de **tous** les participants, quel qu'ait été leur effort individuel. Le nombre de paliers observés va d'une poignée à environ neuf (ex. 9 paliers pour « Wreaken Calls for Mining Support », de ≈30 à ≈180 M Cr). Voir [1.2](#12-une-structure-à-paliers-tiers-cumulatifs-de-récompense).

**Comment est calculée ma récompense individuelle dans une CG (contribution ranking) ?**
Elle dépend de deux mesures combinées : le palier collectif débloqué par toute la communauté, et le rang de contribution individuelle du commandant au sein de ce palier, exprimé en tranche de centile (top 75 %, 50 %, 25 %) ou, pour les récompenses les plus rares, en classement nominal restreint (« top 10/25 CMDRs »). Un commandant n'ayant rien livré ne touche rien même si le palier maximal est atteint par la communauté. Voir [1.3](#13-deux-niveaux-de-suivi-de-contribution--progression-collective-et-rang-individuel).

**Combien de temps dure une Community Goal ?**
La majorité durent entre une et trois semaines, avec des échéances souvent calées sur les fenêtres de maintenance du jeu. Plusieurs CG tournent généralement en parallèle à un instant donné, ce qui crée un flux quasi continu plutôt qu'un cycle hebdomadaire strict et unique. Voir [1.4](#14-cycles-temporels--une-fenêtre-variable-plutôt-quun-cycle-hebdomadaire-strict).

**Le prix de vente augmente-t-il pendant une CG (price boost) ?**
Oui : la marchandise ou l'activité ciblée bénéficie très souvent d'un multiplicateur de prix pendant toute la durée de la CG, observé entre x2 et x10 selon les campagnes — un bonus qui s'ajoute à la récompense de fin de palier. Voir [1.5](#15-le-bonus-économique--le-multiplicateur-de-prix-appliqué-pendant-une-cg).

**Où voir les Community Goals actives en jeu et sur Inara (mission board) ?**
En jeu, le tableau des missions à quai liste les CG actives rattachées à la station, et le flux GalNet relaie leur lancement. En ligne, [inara.cz/elite/communitygoals/](https://inara.cz/elite/communitygoals/) suit chaque CG depuis 2015 et affiche palier courant, pourcentage de progression, nombre de contributeurs et barème de récompenses. Voir [2.1](#21-repérer-une-cg-en-jeu--tableau-des-missions-et-flux-galnet) et [2.2](#22-inaracz-la-référence-communautaire-pour-le-suivi-chiffré-des-cg).

**Quelles récompenses peut-on gagner en participant à une CG ?**
Des crédits (de quelques centaines de milliers à plusieurs centaines de millions selon le palier), des modules pré-engineered, des peintures et décalques, des packs Odyssey, l'ouverture d'un ingénieur ou d'un permis, très rarement un vaisseau complet (un Alliance Chieftain offert au top 25 CMDRs en 2022), et depuis Powerplay 2.0 des merits pour les CG rattachées à une Power. Voir [1.6](#16-panorama-des-récompenses-typiques-dune-cg-2015-2026).

**Vaut-il mieux s'engager tôt ou attendre la fin d'une CG (CG timing) ?**
S'engager tôt sécurise une meilleure place au classement individuel — surtout pour les récompenses à classement nominal restreint — sans risque de « gâchis » sur la contribution déjà livrée, mais n'élimine pas le risque que le palier collectif visé ne soit finalement pas atteint. L'approche hybride recommandée consiste à suivre la barre de progression durant la première moitié de la fenêtre, puis à concentrer l'effort en fin de CG si la progression semble en retard. Voir [4.1](#41-stratégie-de-timing-dune-cg--sengager-tôt-ou-attendre-la-fin-de-la-fenêtre).

**Quelle activité rapporte le plus pendant une CG de minage, de primes ou de commerce ?**
Le minage laser bien optimisé dépasse largement 100 M Cr/heure en valeur de revente selon la presse spécialisée citée par le guide du minage ; les Hazardous RES et Compromised Nav Beacons restent les foyers de farm de primes les plus denses ; en commerce, un Type-9 Heavy, un Type-10 Defender ou un Imperial Cutter achetant au point d'approvisionnement le plus proche maximisent le tonnage/heure. Voir [4.2.1](#421-cg-de-minage--laser-core-mining-hotspot-et-wing-mining), [4.2.2](#422-cg-de-primes-et-de-combat-bonds--res-compromised-nav-beacons-builds-ax) et [4.2.3](#423-cg-de-commerce--gros-porteurs-et-point-dapprovisionnement-le-plus-proche).

**Un Wing ou un Fleet Carrier aident-ils à progresser dans une CG (group play) ?**
Un Wing ne mutualise pas le score individuel de CG, mais partage sans division l'intégralité des bounty vouchers et combat bonds entre ses membres présents à une même destruction, ce qui rend une CG de combat mécaniquement plus rentable en groupe qu'en solo. Un Fleet Carrier positionné à portée de saut du site de collecte peut aussi servir de dépôt intermédiaire pour limiter les allers-retours vers la station cible. Voir [4.3](#43-logistique-collective-dune-cg--wing-escadron-fleet-carrier-stacking-de-missions).

---

## Voir aussi

- [Lore et histoire de l'univers](./01-lore.md) — épisodes de Community Goals ayant marqué le lore galactique (Aegis, guerre thargoïde, anniversaire de Colonia).
- [Exploration et exobiologie](./10-exploration.md) — CG de livraison de données d'exploration et d'exobiologie, et leurs récompenses spécifiques ; classement des espèces exobiologiques les plus rentables pour cibler efficacement une CG de ce type.
- [Le Minage](./20-minage.md) — techniques, équipement et vaisseaux pour maximiser le tonnage/heure sur une CG de minage.
- [Le Commerce](./11-commerce.md) — vaisseaux de fret et routes d'approvisionnement pour maximiser le tonnage/heure livré sur une CG commerciale.
- [Combat spatial](./08-combat-spatial.md) — RES/HazRES, Compromised Nav Beacons et builds de combat pour une CG de primes/combat bonds.
- [Combat anti-Thargoïde (AX) approfondi](./25-combat-ax.md) — builds AX dédiés et organisation communautaire AXI pour une CG de combat anti-thargoïde.
- [Wings, Multicrew et CQC](./23-jeu-en-groupe.md) — partage non divisé des primes et combat bonds en Wing, un levier direct pour une CG de combat.
- [Escadrons de joueurs (Squadrons)](./22-squadrons.md) — coordination collective et Squadron Carrier comme relais logistique partagé.
- [Porte-vaisseaux de joueur (Fleet Carriers)](./19-fleet-carriers.md) — portée de saut et cycle de cooldown, pour évaluer la viabilité d'un carrier comme relais de collecte pendant une CG.
- [La roadmap des développeurs](./15-roadmap.md) — calendrier des sorties de contenu que les CG accompagnent régulièrement.
- [Le Background Simulation (BGS)](./21-bgs.md) — mécanique des états de faction, dont les CG de type « Fight for X » sont un des leviers directs.
- [Powerplay](./02-powerplay.md) — intégration des merits aux CG depuis Powerplay 2.0 (31 octobre 2024).
- [Chronologie canonique du corpus](./00-chronologie-canonique.md) — dates réelles arbitrées pour trois événements croisés avec des CG : invasion de Sol par le Titan Cocijo (5 décembre 2024) puis fin de la Seconde Guerre Thargoïde (19 décembre 2024, 15:00 UTC), fondation de Colonia le 9 septembre 2016 dont découle le 10ᵉ anniversaire de 2026, et sortie du SRV Rhino le 2 septembre 2026. Ce document arbitre des dates, il ne raconte pas les événements.
- [Le guide des outils communautaires](./16-outils.md) — panorama des outils tiers (EDMC, EDDiscovery...) utilisés pour soumettre les données de journal exploitées par Inara.
- [Glossaire](./00-glossaire.md) — sigles utilisés dans ce guide (CG, RES, USS).

## Sources

- https://inara.cz/elite/communitygoals/
- https://inara.cz/elite/communitygoals/?page=1
- https://inara.cz/elite/communitygoals/?page=2
- https://inara.cz/elite/communitygoals/?page=5
- https://inara.cz/elite/communitygoals/?page=10
- https://inara.cz/elite/communitygoals/?page=17
- https://inara.cz/elite/communitygoals/?page=25
- https://inara.cz/elite/communitygoals/?page=40
- https://inara.cz/elite/communitygoals/?page=45
- https://inara.cz/elite/communitygoals/?page=55
- https://inara.cz/elite/communitygoals/?page=70
- https://inara.cz/elite/communitygoals/?page=85
- https://inara.cz/elite/communitygoals/?page=100
- https://inara.cz/elite/communitygoals/?page=115
- https://inara.cz/elite/communitygoals/?page=130
- https://inara.cz/elite/communitygoals/?page=145
- https://inara.cz/elite/communitygoals/?page=150
- https://inara.cz/elite/communitygoals/?page=154
- https://en.wikipedia.org/wiki/Elite_Dangerous
- [00-chronologie-canonique.md](./00-chronologie-canonique.md) (corpus interne, réconciliation de dates, notamment la date du 31 octobre 2024 pour Powerplay 2.0/Ascendancy)
- [01-lore.md](./01-lore.md) (corpus interne, sections « La Seconde Guerre Thargoïde », « La Seconde Guerre Thargoïde moderne » et « Community Goals de la guerre thargoïde » — déroulé du siège de Sol du 12 au 19 décembre 2024 et destruction du Titan Cocijo)
- [20-minage.md](./20-minage.md) (corpus interne, section 5 — rendements chiffrés de minage laser et wing mining, déjà sourcés sur GameRant/TheGamer et Pilots Trade Network)
- [11-commerce.md](./11-commerce.md) (corpus interne, sections 5, 8 et 9 — vaisseaux de fret et Fleet Carrier appliqués au commerce et aux CG)
- [08-combat-spatial.md](./08-combat-spatial.md) (corpus interne, sections 4.1-4.2 et 7 — RES/HazRES, Compromised Nav Beacons, bounty vouchers)
- [25-combat-ax.md](./25-combat-ax.md) (corpus interne, sections 5-6 — builds AX et organisation communautaire AXI)
- [10-exploration.md](./10-exploration.md) (corpus interne, sections 1.5 et 2.5 — corps célestes et espèces exobiologiques à forte valeur)
- [23-jeu-en-groupe.md](./23-jeu-en-groupe.md) (corpus interne, section 2.3 — partage non divisé des bounty vouchers et combat bonds en Wing, déjà sourcé sur la fiche Steam officielle)
- [19-fleet-carriers.md](./19-fleet-carriers.md) (corpus interne, section 3 — portée de saut de 500 al et cycle de cooldown d'un Fleet Carrier, déjà sourcés sur roguey.co.uk, PTN et elite-journal.readthedocs.io)
- [22-squadrons.md](./22-squadrons.md) (corpus interne, section 6.1 — Squadron Carrier comme Fleet Carrier collectif)

*Note méthodologique : lors de cette relecture, le budget de recherche web de la session était épuisé ; les corrections apportées aux affirmations signalées comme douteuses s'appuient donc sur un recoupement avec les fichiers de réconciliation déjà présents dans le corpus interne (voir ci-dessus) plutôt que sur une nouvelle recherche en ligne. Les points qui restaient non confirmables après ce recoupement (barème exact des merits Powerplay distribués par certaines CG, détail précis des modules offerts pour la CG « Battle for Sol ») ont été reformulés avec prudence plutôt que présentés comme des faits établis.*

*Note méthodologique (ajout de la section 4, « Optimiser sa contribution individuelle »)* : plusieurs recherches web ciblées ont été tentées pour cet ajout (stratégies de classement CG, rendements récents de minage/combat par activité). Le budget de recherche web de la session s'est révélé épuisé dès les premières requêtes, et les tentatives d'accès direct aux sites de référence habituels (moteurs de recherche DuckDuckGo/Bing, elite-dangerous.fandom.com, elitedangerous.com/en/community-goals, Reddit) ont systématiquement échoué (CAPTCHA, 402, 403, ou domaine non joignable depuis cet environnement) — une limitation d'accès déjà rencontrée et documentée indépendamment par les guides [19-fleet-carriers.md](./19-fleet-carriers.md) et [23-jeu-en-groupe.md](./23-jeu-en-groupe.md) lors de leurs propres relectures. La section 4 s'appuie donc exclusivement sur les chiffres déjà vérifiés dans les guides d'activité du corpus interne listés ci-dessus, plus le raisonnement de timing ([4.1](#41-stratégie-de-timing-dune-cg--sengager-tôt-ou-attendre-la-fin-de-la-fenêtre)), qui découle directement de la mécanique à deux niveaux décrite en [section 1.3](#13-deux-niveaux-de-suivi-de-contribution--progression-collective-et-rang-individuel) et non d'une source externe. Pour un rendement chiffré à jour au moment de la lecture (barème exact d'une CG en cours, meilleurs hotspots ou systèmes du moment), consulter le tableau des missions en jeu et les outils listés en [section 2](#2-comment-repérer-les-community-goals-actives) et dans [16-outils.md](./16-outils.md).
