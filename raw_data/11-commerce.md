---
id: 11-commerce
titre: "Guide complet du commerce dans Elite Dangerous"
domaine: economie
entites: [ Trade Rank, Rare Goods, Trade Dangerous, Spansh, Type-9 Heavy, Imperial Cutter, Type-10 Defender, Panther Clipper Mk II, Type-8 Transporter, Keelback, Cargo Rack, Robigo Run, piraterie, Hatch Breaker Limpet Controller, Frame Shift Drive Interdictor, Cargo Scanner, notoriety ]
mots_cles_en: [ trading, supply and demand, trade rank, rare goods, black market, smuggling, Robigo run, cargo rack, trade route, Trade Dangerous, mining to trade, piracy, hatch breaker limpet, FSD interdictor, cargo scanner, stolen cargo, notoriety ]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-09
confiance_globale: haute
volatilite: haute
sources_primaires: [ EDCD/coriolis-data, EDCD/FDevIDs, Trade Dangerous (dépôt GitHub), EDSM, TheGamer, GameRant, TwistedVoxel, chronologie canonique interne ]
zones_incertaines: [ "seuils de profit cumulé de chaque palier de Trade Rank : aucune source primaire retrouvée, à lire dans le panneau Réputation en jeu", "portée de saut laden/unladen du Keelback, du Type-8 Transporter et du Panther Clipper Mk II : non publiée par coriolis-data, dépend du FSD et de la charge", "chiffres de rentabilité GameRant (100 M Cr/h en minage laser, 90 M Cr/h en Robigo, 3,5 Md Cr par cycle PTN) : instantanés non redatés par la source", "rentabilité horaire de la piraterie : aucun ordre de grandeur vérifié n'a été retrouvé, la section 2.5 le déclare explicitement plutôt que d'avancer un chiffre", "traitement exact du cargo marqué « volé » (stolen) sur un marché légal par rapport au marché noir : non recoupé avec une source primaire", "prise en compte ou non des ventes de cargo volé dans la progression du Trade Rank : non documentée par les sources consultées" ]
guides_lies: [ 3, 8, 12, 16, 18, 20, 21, 24, 28 ]
---

# Guide complet du commerce dans Elite Dangerous

## En bref

Le commerce (*trading*) consiste à acheter une commodité là où une économie de station la produit (offre abondante, prix
bas) pour la revendre là où une autre la consomme (forte demande), selon l'état de simulation de fond (**BGS**) de la
faction locale : **Boom** favorise la vente, **Famine** fait exploser la demande alimentaire, **Outbreak** celle des
produits médicaux. Cinq familles coexistent : le vrac, les données, la contrebande (*smuggling*, dont la **Robigo
Run**, ~90 M Cr/h en Python), le **mining-to-trade** (plus de 100 M Cr/h en laser) et la **piraterie**, qui prend sa
cargaison par interdiction et l'écoule au marché noir, au prix d'une prime et d'une *notoriety* qui ne se paie pas. Le
**Trade Rank** compte neuf paliers, de Penniless à Elite, ce dernier subdivisé en Elite I à V. Une route en Type-6
Transporter (114 t, marge 2 150 Cr/t) rapporte ~1,2 M Cr/heure. Le **Type-9 Heavy**, l' **Imperial Cutter** (rang de
Duc), le **Type-10 Defender** et le **Panther Clipper Mk II** couvrent le haut de gamme ; **Spansh** et **Trade
Dangerous** calculent les routes.

## Introduction au commerce dans Elite Dangerous

Le commerce (*trading*) est l'une des activités économiques centrales d'Elite Dangerous : il permet de générer des
crédits en exploitant les écarts de prix entre stations, tout en offrant plusieurs variantes de gameplay (commerce légal
en vrac, données, marché noir, minage) adaptées à des styles de jeu très différents. Ce guide couvre la mécanique de
base (offre/demande, économies de station, rang de commerce), les cinq grandes familles de commerce, un exemple chiffré
complet, les outils pour trouver des routes rentables, les vaisseaux de fret optimaux et leurs configurations,
l'équipement complémentaire indispensable, le rôle des Porte-Vaisseaux et des Community Goals, ainsi que les bonnes
pratiques de gestion du risque et les évolutions récentes de la méta (2025-2026).

> **Voir aussi.** Ce guide se concentre sur le commerce proprement dit. Pour les mécaniques annexes qui l'alimentent ou
> le recoupent, voir : [Vaisseaux](./03-vaisseaux.md), [Équipements](./04-equipements.md),
> [Ingénieurs](./06-ingenieurs.md), [Transport](./12-transport.md), [Le Minage](./20-minage.md),
> [Le BGS](./21-bgs.md), [La Colonisation](./18-colonisation.md), [Porte-Vaisseaux](./19-fleet-carriers.md),
> [Community Goals](./24-community-goals.md), [Escadrons](./22-squadrons.md) et [Outils](./16-outils.md).

## 1. Mécanique générale du commerce

Le principe de base du trading repose sur l'écart entre le prix d'achat d'une commodité dans une station où l'offre
(*supply*) est élevée et son prix de vente dans une station où la demande (*demand*) est élevée. Les prix fluctuent en
continu selon deux facteurs :

- **L'activité des joueurs** : chaque achat/vente modifie localement l'offre et la demande.
- **La simulation de fond (*Background Simulation*, [BGS](./00-glossaire.md))** : l'état économique d'un système
  influence directement les prix — voir la sous-section dédiée ci-dessous, ainsi que le guide [Le BGS](./21-bgs.md)
  pour le fonctionnement complet de la simulation.

**Règle de prudence communautaire** : ne jamais engager la totalité de sa trésorerie dans un seul chargement. Le risque
de perte du vaisseau (piraterie, interdiction, erreur de pilotage) n'est jamais nul, et l'assurance (*rebuy*) ne couvre
que le remplacement de la coque — jamais la cargaison perdue.

### Mécanique des prix du commerce : offre, demande et économies de station

Chaque station possède un ou plusieurs types d' **économie** (fichier de référence officiel `economy.csv` du dépôt
communautaire EDCD/FDevIDs, qui reprend les identifiants internes du jeu) qui déterminent quelles commodités elle
**produit** à bas prix avec une offre abondante, et lesquelles elle **consomme** à prix élevé avec une forte demande. La
règle d'or du commerce en vrac est donc : **acheter dans l'économie qui produit la commodité, vendre dans celle qui la
consomme**.

| Économie              | Produit typiquement (achat pas cher, offre élevée)         | Consomme typiquement (vente chère, forte demande)                                                  |
|-----------------------|------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| Agriculture           | Denrées alimentaires, produits agricoles                   | Machines, produits chimiques, technologie                                                          |
| Extraction            | Métaux et minerais bruts                                   | Machines, denrées, technologie                                                                     |
| Refinery (raffinage)  | Métaux raffinés (à partir du minerai brut acheté ailleurs) | Minerai brut, produits chimiques                                                                   |
| Industrial            | Machines, alliages, produits chimiques industriels         | Métaux bruts, produits chimiques de base                                                           |
| High Tech             | Composants électroniques, technologie avancée              | Métaux, produits chimiques rares                                                                   |
| Military              | Armements, équipement militaire                            | Métaux, machines, produits chimiques                                                               |
| Tourism               | Services, produits de luxe                                 | Denrées alimentaires, produits de luxe                                                             |
| Colony (Colonisation) | Matériaux de construction en phase de démarrage            | Quasiment tout, en particulier alliages et machines — voir [La Colonisation](./18-colonisation.md) |

D'autres économies n'ont pas de profil d'achat et de vente propre documenté dans ce corpus (Service, Terraforming,
Prison, Rescue, Repair, Engineer, Private Enterprise/Carrier — cette dernière étant celle des Porte-Vaisseaux, voir plus
bas). Cela ne signifie pas qu'elles soient sans rôle commercial : le relevé de
[Marchandises](./28-marchandises.md) montre que plusieurs d'entre elles achètent ou produisent effectivement des
marchandises. Leur profil reste simplement à établir.

**États de la faction locale ([BGS](./00-glossaire.md))**. Au-delà du type d'économie, l'état courant de la faction qui
contrôle la station (liste officielle `factionstate.csv`) modifie fortement le marché :

- **Boom** : offre abondante et prix de vente favorables — l'état idéal pour vendre.
- **Bust** : marché dégradé, prix de vente en baisse — à éviter pour vendre.
- **Famine** : pénurie alimentaire locale. La demande de denrées alimentaires explose et leur prix d'achat sur place
  grimpe fortement, tandis que l'offre locale s'effondre — apporter de la nourriture depuis l'extérieur devient très
  rentable, et des missions de secours alimentaire apparaissent en nombre.
- **Outbreak** (épidémie) : forte demande de produits médicaux/pharmaceutiques (Basic Medicines et équivalents),
  missions de livraison médicale fréquentes et lucratives.
- **Guerre civile (CivilWar)** : marché fortement perturbé, sécurité réduite, opportunités de contrebande accrues mais
  risque de blocus et de patrouilles renforcées.
- D'autres états impactent aussi le commerce (Lockdown, War, Investment, Expansion, Election, TradeWar, etc.).

Ces états sont pilotés par la simulation de fond et évoluent selon l'activité des joueurs (missions accomplies, conflits
de faction, événements aléatoires) ; le mécanisme complet (influence, facteurs qui font basculer un état, durée typique)
est détaillé dans le guide dédié [Le BGS](./21-bgs.md), pour éviter de dupliquer ici une mécanique qui a sa place
naturelle ailleurs dans le corpus.

### Rang de commerce (Trade Rank)

Comme pour le combat ou l'exploration, le commerce dispose de son propre rang de réputation, basé sur le **profit
cumulé** réalisé en vendant des marchandises. La progression suit neuf paliers officiels (source : fichier de référence
`TradeRank.csv` du dépôt communautaire EDCD/FDevIDs, qui reprend les identifiants internes du jeu), le dernier palier «
Elite » ayant depuis été subdivisé en cinq sous-niveaux (Elite I à V), sur le même principe que les rangs de combat et
d'exploration :

| Palier | Nom               |
|--------|-------------------|
| 0      | Penniless         |
| 1      | Mostly Penniless  |
| 2      | Peddler           |
| 3      | Dealer            |
| 4      | Merchant          |
| 5      | Broker            |
| 6      | Entrepreneur      |
| 7      | Tycoon            |
| 8      | Elite             |
| 9-13   | Elite I à Elite V |

**Seuils de profit cumulé exacts** : nous n'avons pas pu retrouver de source primaire fiable donnant les seuils en
crédits pour chaque palier lors de la rédaction de ce guide (le site officiel et les forums Frontier ont renvoyé des
erreurs d'accès, et le wiki communautaire correspondant était inaccessible depuis cet environnement) — plutôt que
d'inventer des chiffres, nous recommandons de consulter le panneau **Right Panel > Réputation** en jeu, qui affiche le
seuil exact du prochain palier, ou un wiki communautaire à jour.

**Avantages du rang de commerce** : au-delà du prestige, un rang élevé conditionne l'accès à certaines missions de
commerce les mieux rémunérées (visibilité et fréquence accrues dans le tableau des missions), et sert de filtre
d'affichage dans certains outils communautaires de recherche de missions. Il n'ouvre en revanche pas de déblocage de
vaisseau ou de module spécifique, contrairement au rang impérial/fédéral qui conditionne l'achat de certains vaisseaux
(voir Imperial Cutter plus bas). Pour situer cette échelle par rapport aux sept autres et savoir quelles méthodes de
profit décrites ci-dessous font effectivement monter le rang de commerce, voir
[27 — Débuter et progresser](./27-debuter-et-progresser.md).

### Les denrées rares (Rare Goods)

Une méthode historique pour les débutants, toujours valable aujourd'hui, est le commerce de **denrées rares** : chaque
station productrice ne renouvelle qu'un lot limité de marchandise toutes les quelques heures, mais le prix de vente
augmente avec la distance parcourue jusqu'à un plafond. Cela permet de réaliser un aller simple très rentable, sans
avoir besoin d'organiser un fret retour — une méthode qualifiée par la presse spécialisée de « toujours la plus
lucrative » pour démarrer une carrière de commerçant.

La **liste nominative des denrées rares** (noms en jeu, identifiants internes et ce que les sources publiques permettent
ou non d'établir sur leur station productrice) est tenue dans le référentiel dédié
[Marchandises, denrées rares et minerais](./28-marchandises.md), que ce guide ne duplique pas : on trouvera ici la
mécanique du commerce de rares, et là-bas le catalogue.

## 2. Les cinq types de commerce

Cinq familles d'activité commerciale coexistent, décrites une à une ci-dessous : le commerce légal en vrac (2.1), le
commerce de données (2.2), la contrebande (2.3), le mining-to-trade (2.4) et la piraterie (2.5). Les quatre premières
achètent leur cargaison ou la produisent ; la cinquième la prend à un autre vaisseau.

### 2.1 Commerce simple : commodités légales en vrac

C'est l'activité de base du trading : acheter des marchandises légales (métaux, denrées alimentaires, produits
chimiques, machines, technologie) dans une station et les revendre ailleurs avec une marge bénéficiaire.

Ces familles de produits correspondent aux **catégories officielles de marchandises** du jeu — seize au total, dont
Metals, Foods, Chemicals, Machinery, Technology, Minerals et Salvage (relevé sur le fichier de référence
`commodity.csv` du dépôt communautaire EDCD/FDevIDs, commit `c356129`, consulté le 10 septembre 2026). La liste des
marchandises qui les composent est tenue dans le référentiel dédié
[Marchandises, denrées rares et minerais](./28-marchandises.md), que ce guide ne duplique pas.

Progression classique de vaisseaux recommandée par les guides communautaires :

| Étape           | Vaisseau                                               | Prix indicatif | Soute indicative                            |
|-----------------|--------------------------------------------------------|----------------|---------------------------------------------|
| Débutant        | Hauler                                                 | ~50 000 Cr     | 26 t                                        |
| Débutant avancé | Keelback                                               | ~3,1 M Cr      | ~112 t (soute + baie de chasseur défensive) |
| Intermédiaire   | Cobra Mk III                                           | ~340 000 Cr    | 64 t                                        |
| Confirmé        | Type-6 Transporter                                     | ~1 M Cr        | 114 t                                       |
| Confirmé avancé | Type-8 Transporter *(nouveau)*                         | ~38,5 M Cr     | jusqu'à ~400 t selon configuration          |
| Avancé          | Asp Explorer                                           | ~6,6 M Cr      | 130 t                                       |
| Expert          | Type-9 Heavy / Imperial Cutter / Panther Clipper Mk II | voir section 5 | voir section 5                              |

Le **Keelback** (Lakon Spaceways) occupe une niche particulière : c'est un cargo de gabarit moyen doté d'une **baie de
chasseur** (*fighter bay*), ce qui en fait une bonne transition pour qui veut commencer à transporter du fret dans des
systèmes un peu moins sûrs sans encore investir dans un vaisseau de fret pur. Le **Type-8 Transporter**, introduit le 7
août 2024, se positionne juste au-dessus du Type-6/Keelback : bonne capacité de chargement, gestion supérieure du FSD en
régime **[SCO](./00-glossaire.md)** (Supercruise Overcharge), au prix d'un armement minimal. Voir la fiche détaillée de
chacun en section 5, et [Vaisseaux](./03-vaisseaux.md) pour la liste complète et les fabricants.

> **Encart outils — EDMC et BGS-Tally.** Pour suivre concrètement sa progression de rang de commerce et les opportunités
> de marché, deux outils communautaires reviennent systématiquement : **EDMC** (Elite Dangerous Market Connector),
> l'application de référence qui lit le journal de vol du jeu, envoie les données de marché aux bases communautaires
> (EDDN) et sert de socle à un écosystème de plugins — version 6.1.2 publiée le 29 janvier 2026 (instantané daté au
> 9 septembre 2026, à revérifier sur le dépôt GitHub car les versions évoluent fréquemment) ; et **BGS-Tally**, un
> plugin EDMC qui suit l'activité de [BGS](./00-glossaire.md), de Colonisation et de Powerplay d'une ou plusieurs
> factions, utile pour repérer les états Boom/Famine/Guerre civile pertinents pour le commerce sans avoir à parcourir
> la carte manuellement — version 5.6.0 publiée le 31 août 2026 (instantané daté au 9 septembre 2026, à revérifier sur
> le dépôt GitHub). Présentation complète des deux outils (installation, écosystème de plugins) dans
> [Outils](./16-outils.md).

### 2.2 Commerce de données (Data Trading)

Moins connu que le commerce de marchandises, il consiste à transporter des données (missions de courrier de données,
données d'exploration, données tactiques) qui n'occupent aucune ou très peu de soute. C'est un point d'entrée idéal pour
les nouveaux joueurs disposant d'une faible capacité de cargo, car il permet d'accumuler des crédits sans investir dans
une grosse soute. Cette activité recoupe également :

- l'exploration (vente de données de scan aux comptoirs universels type Universal Cartographics) ;
- certaines missions de renseignement pour les factions locales, liées au [BGS](./00-glossaire.md) ou au Powerplay
  (voir [Powerplay](./02-powerplay.md)).

### 2.3 Commerce noir et marché illégal (Smuggling)

Les marchandises illégales (stupéfiants, esclaves, armes interdites, biotechnologie de contrebande) s'achètent et se
vendent exclusivement sur les **marchés noirs** (*Black Markets*), disponibles principalement dans les systèmes en état
d' **Anarchie** ou via des contacts de contrebande dans certaines stations.

**Risque principal** : les balayages de cargo (*cargo scans*) effectués par la police système ou la sécurité de station.
Être pris avec de la marchandise illégale entraîne amendes, saisie de cargaison, voire poursuite et prime sur la tête du
pilote.

**Tactiques classiques** :

- éviter les zones surveillées et privilégier les systèmes d'Anarchie pour écouler l'illégal ;
- utiliser le **silent running** (extinction des systèmes non essentiels) pour réduire la signature thermique et
  échapper aux scans ;
- planifier des routes courtes et discrètes plutôt que de longs trajets en zone surveillée.

Une variante très rentable est le transport clandestin de passagers illégaux, popularisé par les fameuses **« Robigo
Runs »** : la boucle classique relie le système de Sothis à la station Robigo Mines, sur une distance d'une soixantaine
d'années-lumière. Elle consiste à empiler plusieurs missions de transport de passagers illégaux (criminels recherchés,
etc.) et à éviter tout balayage de cargo pendant le trajet, sous peine d'échec de mission. Selon GameRant, un **Python**
correctement équipé pour cette route peut rapporter jusqu'à environ **90 millions de crédits par heure** sur des
allers-retours réussis (chiffre instantané, capturé début 2025 selon l'article source — à revérifier auprès de la
communauté avant de bâtir un plan de jeu dessus, ce type d'estimation évoluant avec les rééquilibrages du jeu). Pour les
mécaniques détaillées de transport de passagers légal/illégal, voir [Transport](./12-transport.md).

### 2.4 Mining-to-trade (minage puis revente)

Le minage alimente le commerce en fournissant des matières premières à forte valeur ajoutée (Platine, Painite, Diamants
basse température, Void Opals). **Contrairement à une idée répandue, les économies de raffinage et d'extraction ne sont
pas leurs débouchés** : le relevé économie par économie de [Marchandises](./28-marchandises.md) établit que le Platine,
l'Or, le Palladium et l'Argent s'achètent partout *sauf* dans les économies agricoles, de raffinage, d'extraction et
militaires. Une économie de raffinage achète le minerai brut qu'elle va traiter — Bauxite, Bertrandite, Coltan, Gallite,
Indite, Uraninite — pas le métal déjà pur ni la gemme taillée ; une économie d'extraction rachète rarement ce qu'elle
produit elle-même, les Diamants basse température étant la seule exception du relevé. Ce guide ne couvre que le lien
minage → revente ; pour l'équipement minier détaillé, les techniques (laser, deep core, hotspots) et les emplacements,
voir le guide dédié [Le Minage](./20-minage.md).

**Équipement essentiel** (d'après le guide de minage de TheGamer, voir aussi [Le Minage](./20-minage.md) pour le
détail) :

- **Cargo Rack** : stockage du minerai raffiné ;
- **Refinery** (2-3 emplacements recommandés) : raffine le minerai brut directement à bord ;
- **Mining Laser** (2-3 lasers moyens) : extraction du minerai en surface d'astéroïde ;
- **Collector Limpet Controller** : pilote des drones qui « aspirent efficacement » le minerai et le rassemblent
  automatiquement ;
- **Detailed Surface Scanner** : localise les points chauds (*hotspots*) de minéraux ;
- pour le **minage de noyau profond (deep core)** : ajouter des **Prospector Limpets** et un **Seismic Charge
  Launcher**.

**Progression de vaisseaux** : Adder/Cobra Mk III en débutant → Python en intermédiaire (bon compromis
stockage/maniabilité) → Imperial Cutter en avancé (rapide, grande soute, assez résistant).

Selon GameRant, l'extraction laser bien optimisée avec un Python ou un Type-9, correctement équipé (refinery, prospector
et collector limpet controllers, surface scanners, cargo racks en nombre), peut rapporter **bien plus de 100 millions de
crédits par heure**. Le « wing mining » organisé via des réseaux communautaires comme le **Pilots Trade Network (
PTN)** — où un groupe complète 60 à 80 missions de minage en équipage de quatre commandants — peut générer jusqu'à **3,5
milliards de crédits par cycle** pour l'équipage au complet (chiffres instantanés, capturés lors de la rédaction de
l'article GameRant source — à revérifier, ces estimations dépendant fortement des prix de marché du moment). Ce mode de
jeu en groupe recoupe l'organisation d'escadron ; voir [Escadrons](./22-squadrons.md).

### 2.5 Piraterie : prendre la cargaison plutôt que l'acheter

La **piraterie** est la cinquième façon d'alimenter une soute, et la seule qui ne passe ni par un marché ni par un
astéroïde : elle consiste à intercepter un vaisseau chargé, à lui faire lâcher tout ou partie de son fret, puis à
écouler ce fret. À ce titre elle relève autant du commerce que du combat, et c'est pourquoi elle figure dans cette
taxonomie : le pirate est un acteur du marché, avec un coût d'acquisition nul en crédits mais élevé en réputation.

**La boucle de piraterie, étape par étape.** Elle enchaîne quatre gestes, chacun adossé à un module documenté dans
[Équipements](./04-equipements.md) :

| Étape | Geste                                                                       | Module concerné                                                                                 | Classes / notations                     |
|-------|-----------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|-----------------------------------------|
| 1     | Repérer une soute qui vaut le détour, en supercroisière ou en espace normal | **Cargo Scanner** (utilitaire)                                                                  | classe 0, notations A–E                 |
| 2     | Sortir la cible de supercroisière                                           | **Frame Shift Drive Interdictor**                                                               | classes 1 à 4, notations A–E            |
| 3     | Empêcher la fuite pendant la négociation ou le tir                          | pas de module dédié : **mass lock** exercé par la masse du vaisseau, éventuellement à plusieurs | —                                       |
| 4     | Forcer l'éjection du fret, puis le ramasser                                 | **Hatch Breaker Limpet Controller**, puis **Collector Limpet Controller**                       | classes impaires 1/3/5/7, notations A–E |

*(Source des tailles, notations et fonctions : fiches modules du guide [Équipements](./04-equipements.md), elles-mêmes
tirées du dépôt communautaire EDCD/coriolis-data.)* Sur le **Hatch Breaker**, les notations B et E déploient plus de
limpets simultanés que A, C ou D à classe égale — une notation plus chère n'augmente pas la quantité, seulement la
portée et le temps de charge ; le détail figure dans [Équipements](./04-equipements.md). La mécanique du mini-jeu
d'interdiction (résister ou se soumettre) et celle du mass lock sont traitées dans
[Combat spatial](./08-combat-spatial.md), qui est aussi la référence pour l'engagement proprement dit si la cible
choisit de se battre plutôt que de larguer sa cargaison.

**Où elle se pratique.** La piraterie suit la carte des niveaux de sécurité décrite dans
[Combat spatial](./08-combat-spatial.md) : les systèmes à sécurité **basse** et surtout en **Anarchie** n'opposent
aucune réponse de sécurité organisée, ce qui en fait le terrain habituel, tandis qu'un système à sécurité haute
déclenche une réponse rapide des vaisseaux d'autorité. Les lieux de chasse classiques sont les mêmes que ceux de la
chasse aux primes, mais pris du côté opposé : sites d'extraction de ressources ([RES](./00-glossaire.md)) où les mineurs
remontent chargés, et balises de navigation compromises (*Compromised Nav Beacons*) — les deux lieux que
[Combat spatial](./08-combat-spatial.md) recense comme foyers d'activité pirate en système à sécurité basse. Les trajets
en supercroisière y sont également plus exposés : selon ce même guide, un vaisseau volant en sécurité faible ou en
Anarchie subit statistiquement davantage de tentatives d'interdiction opportunistes.

**Ce qu'elle rapporte.** Le produit d'une prise, c'est la valeur marchande du fret saisi, sans capital engagé à
l'achat — contrairement au commerce en vrac de la section 2.1, où l'achat de la cargaison immobilise la trésorerie avant
même d'avoir vendu. En revanche la cargaison prise à un autre vaisseau entre en soute marquée **volée**
(*stolen*), ce qui la renvoie vers les mêmes canaux d'écoulement que la contrebande de la section 2.3 : contact de
**marché noir**, stations d'Anarchie.

**Nous n'avons retrouvé aucun ordre de grandeur vérifiable de rentabilité horaire de la piraterie** — ni chez les
sources chiffrées utilisées ailleurs dans ce guide (GameRant, TheGamer), ni dans les fichiers de référence EDCD, qui ne
publient pas de prix de marché. Plutôt que d'avancer un chiffre, nous signalons le manque : à établir par relevé en jeu,
ou auprès d'un tracker communautaire à jour. Deux points restent également non recoupés : le traitement exact d'un cargo
marqué volé s'il est présenté à un marché légal, et la question de savoir si ces ventes font monter le **Trade Rank** au
même titre qu'une vente légale (voir la sous-section « Rang de commerce » plus haut, dont les seuils ne sont eux-mêmes
pas documentés).

**Ce qu'elle coûte en réputation.** C'est le poste de dépense réel de cette activité, et il est décrit en détail dans
[Combat spatial](./08-combat-spatial.md) :

- attaquer ou détruire un vaisseau « clean » génère une **prime** (*bounty*) auprès de la faction qui contrôle le
  système ; les infractions mineures — une cargaison illégale détectée lors d'un scan, par exemple — ne génèrent qu'une
  **amende** (*fine*) ;
- la répétition d'infractions graves fait monter la **notoriety**, qui, tant qu'elle est élevée, fait refuser
  l'autorisation d'accostage dans les stations légitimes du système concerné **même après paiement de la prime** — elle
  ne décroît qu'avec le temps, sans raccourci payant ;
- les **Interstellar Factors Contacts**, fréquents dans les systèmes en Anarchie ou à sécurité faible, permettent de
  régler à distance les primes émises dans d'autres systèmes, moyennant commission ; ils ne touchent pas à la notoriety.

**Ce qu'elle coûte en risque.** Le pirate encaisse le risque qu'il fait courir aux autres : réponse de la sécurité
locale en système surveillé, riposte d'une cible mieux armée qu'elle n'en avait l'air, et perte du vaisseau, sachant que
l'assurance (*rebuy*) ne rembourse jamais la cargaison — la règle de prudence de la section 1 vaut ici comme ailleurs, à
ceci près que le butin embarqué est intégralement à risque et n'a coûté aucun crédit à acquérir. Voyager en *wing*
change l'équilibre des deux côtés : voir [Wings, Multicrew et CQC](./23-jeu-en-groupe.md).

**Effet sur les factions.** La piraterie n'est pas neutre pour la simulation de fond : écouler un butin sur un marché
noir contribue à l'influence de la faction propriétaire de ce marché noir, généralement une faction en Anarchie. Ce
levier, ses limites et la façon dont il se combine aux autres sont traités dans [Le BGS](./21-bgs.md).

> **Note de couverture.** Ce guide décrit la piraterie sous l'angle commercial — acquisition et écoulement de
> marchandise. Le corpus ne dispose pas encore d'un guide dédié à cette activité ; en attendant, les mécaniques de
> combat associées (interdiction, mass lock, traque au *Frame Shift Wake Scanner*, crime et notoriety) sont dans
> [Combat spatial](./08-combat-spatial.md), et l'effet sur les factions dans [Le BGS](./21-bgs.md).

## 3. Exemple chiffré complet d'une route de commerce légal en vrac

L'exemple ci-dessous illustre la méthode de calcul de rentabilité d'une route de commerce en vrac. **Il s'agit d'un
exemple pédagogique construit à partir d'ordres de grandeur typiques du commerce de composants industriels/high-tech**
et non d'un relevé de marché en direct — les prix réels doivent impérativement être revérifiés via Spansh ou Inara juste
avant de partir, car ils fluctuent en continu selon l'offre, la demande et l'état de [BGS](./00-glossaire.md) de chaque
station (voir la sous-section « Mécanique des prix » ci-dessus). Instantané pédagogique daté du 9 septembre

2026.

**Paramètres de l'exemple** :

- **Vaisseau** : Type-6 Transporter, soute de 114 t (voir tableau de progression ci-dessus).
- **Commodité** : composants électroniques (catégorie « produits manufacturés/technologie »), achetés dans une station à
  économie **Industrial** en état **Boom** (offre abondante, prix d'achat bas), revendus dans une station à économie
  **High Tech** en forte demande.
- **Prix d'achat** : ~4 750 Cr/tonne.
- **Prix de vente** : ~6 900 Cr/tonne.
- **Marge unitaire** : 6 900 − 4 750 = **2 150 Cr/tonne**.
- **Distance entre les deux stations** : 18 années-lumière, 2 sauts.

**Calcul du profit** :

| Étape                                                                    | Valeur                                            |
|--------------------------------------------------------------------------|---------------------------------------------------|
| Capital engagé (achat de la cargaison complète)                          | 114 t × 4 750 Cr = **541 500 Cr**                 |
| Recette à la vente                                                       | 114 t × 6 900 Cr = **786 600 Cr**                 |
| Profit brut (aller simple)                                               | 786 600 − 541 500 = **245 100 Cr**                |
| Temps estimé de l'aller simple (achat, 2 sauts, amarrage, vente)         | ~12 minutes                                       |
| **Profit horaire estimé** (en répétant l'aller simple, sans fret retour) | 245 100 Cr / 12 min × 60 ≈ **1 225 500 Cr/heure** |

Ce chiffre de profit horaire suppose un marché qui ne s'épuise pas d'un aller à l'autre (l'achat/la vente répétés font
en réalité baisser l'offre et la demande locales, donc la marge réelle se dégrade progressivement — d'où l'intérêt des
outils de routage multi-étapes comme Trade Dangerous ou Spansh, voir section 4, qui recalculent la meilleure boucle
disponible plutôt que de répéter un aller simple jusqu'à épuisement du marché). Trouver un **fret retour** rentable sur
le trajet inverse permettrait, en théorie, de doubler le profit horaire pour un temps de trajet quasiment identique.

## 4. Trouver des routes commerciales rentables : les outils

Les outils communautaires de recherche de marché et de routage commercial (Trade Dangerous, EDSM, Spansh, Inara, et
l'obsolète EDDB) sont documentés en détail, avec leur statut de maintenance à jour, dans le guide dédié
[Outils](./16-outils.md) — nous ne les résumons ici que sous l'angle spécifique du commerce, pour éviter de dupliquer un
contenu qui a sa place naturelle ailleurs dans le corpus.

| Outil               | Rôle pour le commerce                                              | Statut (voir [Outils](./16-outils.md) pour le détail à jour) |
|---------------------|--------------------------------------------------------------------|--------------------------------------------------------------|
| **Trade Dangerous** | Optimiseur de routes multi-étapes en ligne de commande (Python)    | Actif                                                        |
| **Spansh**          | Calculateur de routes commerciales web, successeur de facto d'EDDB | Actif — référence principale pour le routage commercial      |
| **Inara**           | Marché galactique, comparateur de vaisseaux, profils commandants   | Actif — référence majeure                                    |
| **EDSM**            | Cartographie galactique, recherche de commodités/vaisseaux         | Actif                                                        |
| **EDDB.io**         | *(fermé en 2022)*                                                  | Obsolète — remplacé par Spansh/Inara, à ne plus utiliser     |

Commande type de Trade Dangerous, dont la particularité est de « maximiser les gains de chaque espace de cargaison ET
crédit », plutôt que de simplement suggérer le chargement maximal :

```
trade.py run --credits 5000 --capacity 8 --ly-per 8.56 --jumps 2 --hops 2
```

## 5. Vaisseaux de commerce optimaux : spécifications vérifiées

*(Données extraites des fichiers officiels du dépôt communautaire EDCD/coriolis-data, base de référence utilisée par les
calculateurs de configuration comme Coriolis et EDSY)*

> **Disclaimer stats.** Ces valeurs sont données en configuration stock ; l'ingénierie (voir
> [Ingénieurs](./06-ingenieurs.md)) peut les modifier significativement.

| Caractéristique      | Type-9 Heavy                               | Imperial Cutter                              | Type-10 Defender | Anaconda       |
|----------------------|--------------------------------------------|----------------------------------------------|------------------|----------------|
| Fabricant            | Lakon Spaceways                            | Gutamaya                                     | Lakon Spaceways  | Faulcon deLacy |
| Masse de coque       | 850 t                                      | 1 100 t                                      | 1 200 t          | 400 t          |
| Vitesse / Boost      | 130 / 200 m/s                              | 200 / 320 m/s                                | 179 / 219 m/s    | 180 / 240 m/s  |
| Prix coque           | ~72,1 M Cr                                 | ~200,5 M Cr                                  | ~121,3 M Cr      | ~142,5 M Cr    |
| Prix détail (équipé) | ~76,6 M Cr                                 | ~209 M Cr                                    | ~124,8 M Cr      | ~147 M Cr      |
| Condition d'achat    | —                                          | Rang impérial de Duc                         | —                | —              |
| Blindage de base     | —                                          | —                                            | 580              | 525            |
| Bouclier de base     | —                                          | —                                            | 320              | 350            |
| Soute max théorique* | ~790 t                                     | ~760 t                                       | ~566 t           | ~470 t         |
| Maniabilité          | Faible (tangage 20°, roulis 20°, lacet 8°) | Correcte (tangage 18°, roulis 45°, lacet 8°) | Moyenne          | Moyenne        |

*\*Capacité théorique calculée à partir des emplacements internes officiels ci-dessous, en installant des Cargo Racks
dans tous les emplacements compatibles (hors emplacements militaires et suite d'approche planétaire) ; un build réel
réservera une partie de ces emplacements aux boucliers et modules de fuite.*

### Type-9 Heavy (Lakon) — le « camion » de fret classique

- **Emplacements internes** : deux classe 8, un classe 7, un classe 6, un classe 5, deux classe 4, deux classe 3, un
  classe 2, un classe 1 (+ suite d'approche planétaire classe 1).
- **Points d'ancrage** : trois classe 2, deux classe 1, quatre classe 0 (utilitaires).
- **Rôle** : capacité de fret brute maximale par crédit investi grâce à ses deux emplacements classe 8. C'est
  historiquement LE vaisseau de commerce en volume pur, au prix d'une maniabilité et d'une vitesse médiocres et de peu
  d'armement — à éviter en solo dans les systèmes dangereux sans investissement conséquent en boucliers.

### Imperial Cutter (Gutamaya) — le vaisseau de commerce « premium »

- **Emplacements internes** : deux classe 8, trois classe 6, deux classe 5 (dont un militaire), un classe 4, un classe 3
  (+ suite planétaire classe 1).
- **Points d'ancrage** : un classe 4, deux classe 3, quatre classe 2 (+ 8 emplacements utilitaires vides).
- **Rôle** : meilleur compromis vitesse/portée de saut/robustesse parmi les gros porteurs. Considéré par la communauté
  comme le meilleur vaisseau de commerce « tout-terrain » pour qui a débloqué le rang impérial, grâce à sa capacité à
  fuir plus efficacement et à encaisser davantage de dégâts que le Type-9. Nécessite le rang impérial de **Duc** pour
  l'achat.

### Type-10 Defender (Lakon) — l'hybride combat/commerce

- **Emplacements internes** (13 au total) : un classe 8, un classe 7, un classe 6, deux classe 5 (dont un militaire),
  deux classe 4, deux classe 3, un classe 2, un classe 1 (+ suite planétaire).
- **Points d'ancrage** : 17 emplacements (quatre classe 3, deux classe 2, trois classe 1, huit vides) — le plus armé des
  quatre vaisseaux.
- **Équipage** : 4, avec baie de chasseurs.
- **Rôle** : moins de soute brute que le Type-9/Cutter (slots militaires non convertibles en cargo) mais de loin le plus
  résistant et le mieux armé, grâce aux meilleures valeurs défensives (blindage et bouclier de base) des quatre
  vaisseaux. Recommandé pour le commerce en zone dangereuse (systèmes de guerre, routes de contrebande à haut risque,
  marché noir) où la capacité à survivre à une interception prime sur le volume transporté.

### Anaconda (Faulcon deLacy) — le multirôle polyvalent

- **Emplacements internes** (14 au total) : un classe 7, trois classe 6, quatre classe 5 (dont un militaire), trois
  classe 4, un classe 2, un classe 1 (+ suite planétaire).
- **Points d'ancrage** : 16 emplacements (quatre classe 4, deux classe 3, deux classe 2, deux classe 1, huit vides).
- **Rôle** : meilleure portée de saut de la catégorie et vaisseau réellement multirôle (exploration, combat, commerce,
  minage). Souvent choisi par les joueurs qui veulent UN SEUL vaisseau polyvalent plutôt qu'un hauler dédié ; sa soute
  est notablement inférieure à celle du Type-9 ou du Cutter du fait de son slot militaire et de sa configuration plus
  généraliste.

### Vaisseaux de fret additionnels (2024-2025) — Type-8 Transporter, Keelback, Panther Clipper Mk II

Trois vaisseaux de fret complètent utilement le tableau ci-dessus, chacun sur un segment différent : le **Keelback**
(entrée de gamme armée), le **Type-8 Transporter** (milieu de gamme moderne, sorti en 2024), et le **Panther Clipper Mk
II** (le plus gros transporteur non-capital du jeu, sorti en 2025). Format de tableau conforme aux colonnes standard du
corpus pour les comparatifs de vaisseaux :

| Nom                               | Fabricant       | Prix         | Portée de saut                                                               | Hardpoints                                     | Emplacements internes                                                                                   | Source                                                                                                                      | Date                                                                                       |
|-----------------------------------|-----------------|--------------|------------------------------------------------------------------------------|------------------------------------------------|---------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Keelback                          | Lakon Spaceways | ~3,13 M Cr   | Variable selon FSD installé (classe 4 max) — non fixe                        | 2 moyens + 2 petits + 3 utilitaires            | 2×classe 5, 1×classe 4, 1×classe 3, 2×classe 2, 1×classe 1 (+ suite planétaire)                         | EDCD/coriolis-data (`ships/keelback.json`)                                                                                  | Vaisseau historique, antérieur à la période couverte par ce guide                          |
| Type-8 Transporter *(nouveau)*    | Lakon Spaceways | ~38,45 M Cr  | Variable selon FSD installé (classe 5 max) — non fixe                        | 1 moyen + 5 petits + 4 utilitaires             | 1×classe 7, 3×classe 6, 2×classe 5, 1×classe 4, 1×classe 2, 1×classe 1 (+ suite planétaire)             | EDCD/coriolis-data (`ships/type_8_transport.json`)                                                                          | 7 août 2024 (chronologie canonique)                                                        |
| Panther Clipper Mk II *(nouveau)* | Zorgon Peterson | ~301,35 M Cr | Variable selon FSD installé (classe 7 max, la plus élevée du jeu) — non fixe | 2 larges + 4 moyens + 4 petits + 6 utilitaires | 2×classe 8, 2×classe 7, 3×classe 6, 2×classe 5, 1×classe 4, 1×classe 2, 1×classe 1 (+ suite planétaire) | EDCD/coriolis-data (`ships/panther_clipper.json`), corroboré par [Vaisseaux](./03-vaisseaux.md) et la chronologie canonique | **22 juillet 2025** (accès anticipé ARX — première incarnation jouable du Panther Clipper) |

**Sur la portée de saut** : contrairement au prix ou au blindage, la portée de saut n'est pas une statistique fixe du
vaisseau — elle dépend du grade et du rating du **Frame Shift Drive** installé, de la masse totale embarquée (cargaison
comprise) et de l'ingénierie appliquée. Les fichiers de référence EDCD/coriolis-data ne publient donc pas de chiffre
unique en années-lumière ; nous n'avons pas pu obtenir de valeur vérifiée (laden/unladen) pour ces trois vaisseaux
malgré la recherche — le site officiel et le wiki communautaire habituellement utilisés pour ce type de statistique
étaient inaccessibles depuis cet environnement. Utilisez un configurateur (Coriolis, EDSY) avec votre propre chargement
pour obtenir une valeur exacte plutôt qu'un chiffre générique qui serait rapidement faux.

Le **Panther Clipper Mk II** dispose du plus grand nombre d'emplacements internes de cargo classe 8 (deux) de tous les
vaisseaux non-capitaux du jeu, ce qui en fait le nouveau roi du volume de fret pur, devant le Type-9 Heavy — au prix
d'une maniabilité très limitée et d'un mass-lock élevé qui le rend particulièrement vulnérable pendant les manœuvres
d'interdiction. Fiche complète dans [Vaisseaux](./03-vaisseaux.md).

## 6. Configurations recommandées d'un vaisseau de commerce

### Soutes (Cargo Racks) : capacité doublée à chaque classe d'emplacement

On maximise le cargo en installant des **Cargo Racks** dans les plus gros emplacements internes disponibles. La capacité
double à chaque classe :

| Classe       | 1 | 2 | 3 | 4  | 5  | 6  | 7   | 8   |
|--------------|---|---|---|----|----|----|-----|-----|
| Capacité (t) | 2 | 4 | 8 | 16 | 32 | 64 | 128 | 256 |

Le choix central est l'arbitrage entre :

- **Soute maximale (« stripped build »)** : tous les emplacements disponibles convertis en cargo, boucliers et défenses
  sacrifiés. Rentable uniquement sur des routes en haute sécurité surveillées.
- **Configuration équilibrée** : soute légèrement réduite mais conservant boucliers et modules utilitaires. Recommandée
  par la communauté pour toute route qui n'est pas garantie 100% sûre.

### Boucliers d'un vaisseau de fret : générateur, boosters et Shield Cell Bank

- **Shield Generator** de la classe la plus élevée compatible avec le vaisseau.
- **Shield Boosters** dans les points d'ancrage utilitaires (classe 0) pour renforcer la capacité d'encaisser une
  interdiction avant de pouvoir fuir.
- **Shield Cell Bank** : permet de régénérer rapidement le bouclier après un engagement bref.

### Modules de fuite d'un cargo : FSD, Heat Sink, Chaff, Point Defence

- **FSD (Frame Shift Drive)** à la portée de saut la plus élevée possible, éventuellement complété par un **Guardian FSD
  Booster** — réduit le nombre de sauts, donc le nombre d'occasions d'être intercepté, sur une route donnée. Voir
  [Guardians](./05-guardians.md) pour le détail de ce module.
- **Heat Sink Launcher** : coupe temporairement la signature thermique pour se soustraire à la détection ou refroidir
  après un boost prolongé.
- **Chaff Launcher** : réduit la précision des tirs adverses le temps de fuir.
- **Point Defence** : protège des missiles/torpilles de pirates pendant la fuite.

### Anti-interdiction : pas de module dédié, une stratégie combinée

Il n'existe pas de module « anti-interdiction » à proprement parler dans le jeu de base. La défense contre
l'interdiction repose sur trois leviers combinés :

1. **Ingénierie** des propulseurs (*Dirty Drive Tuning*) et du distributeur d'énergie, pour maximiser vitesse/boost et
   régénération du bouclier — voir [Ingénieurs](./06-ingenieurs.md).
2. **Gestion des répartiteurs d'énergie (pips)** vers SYS/ENG pendant une tentative d'interdiction, pour gagner le
   mini-jeu de tir au but qui détermine l'issue de l'interdiction.
3. **Réduction du nombre de sauts nécessaires** (via un FSD à portée maximisée) pour limiter les occasions
   d'interdiction sur une route.

Enfin, soumettre volontairement à l'interdiction (« *submit* ») permet de contrôler le moment et la position de sortie
de la vitesse supraluminique, plutôt que de subir une sortie forcée à un endroit défavorable.

## 7. Équipement complémentaire : Collector Limpet Controller, AFMU, Fuel Scoop, Refinery

- **Collector Limpet Controller** : module essentiel dans la boucle mining-to-trade — il pilote des drones qui aspirent
  efficacement le minerai/cargo éjecté dans l'espace, évitant la collecte manuelle. Utile aussi pour récupérer du fret
  perdu lors d'une attaque ou lors du pillage d'une épave.
- **Auto Field-Maintenance Unit (AFMU)** : répare la coque en vol sur les longues routes commerciales, sans devoir
  rentrer au chantier spatial.
- **Fuel Scoop** : permet de ravitailler en carburant directement aux étoiles, réduisant les arrêts logistiques sur les
  longues routes.
- **Refinery** : indispensable pour convertir le minerai brut en cargo vendable dans le cadre du mining-to-trade. Voir
  [Équipements](./04-equipements.md) pour la fiche complète de chaque module cité ici.

## 8. Fleet Carrier et commerce

Les **Porte-Vaisseaux de joueur** (*Fleet Carriers*) ajoutent une dimension logistique importante au commerce :

- ils embarquent un module de **marché aux commodités** paramétrable par le propriétaire, qui peut acheter/vendre à ses
  propres prix — utile pour redistribuer du fret entre deux zones éloignées de la galaxie sans dépendre du marché
  générique d'une station ;
- leur saut longue distance (plusieurs centaines d'années-lumière par saut, avec un temps de recharge) permet de
  déplacer un stock de marchandises bien plus vite qu'un aller-retour classique en vaisseau individuel, notamment pour
  approvisionner des chantiers de [Colonisation](./18-colonisation.md) loin des routes commerciales habituelles ; cette
  dernière est elle-même détenue par une économie dédiée (« Private Enterprise / Carrier ») ;
- leur fonctionnement (coût d'achat, entretien en Tritium, services installables, restrictions) est détaillé dans le
  guide dédié [Porte-Vaisseaux (Fleet Carriers)](./19-fleet-carriers.md), que nous ne dupliquons pas ici.

## 9. Community Goals (CG) : le commerce en pic de demande temporaire

Les **Community Goals** ([CG](./00-glossaire.md)) sont des objectifs galactiques temporaires proposés par des factions
ou des superpuissances, très souvent construits autour du commerce : livrer un volume cumulé donné d'une commodité
précise à une station cible sur une période limitée. Ils génèrent typiquement un pic de demande extrême et localisé (le
prix d'achat de la commodité concernée grimpe fortement le temps du CG), ce qui en fait l'une des activités commerciales
les plus rentables ponctuellement — souvent organisées en escadron pour maximiser le volume livré (voir
[Escadrons](./22-squadrons.md)). Les récompenses sont généralement échelonnées par palier de contribution individuelle
et de contribution globale de la communauté (crédits, matériaux, parfois modules exclusifs). Le fonctionnement générique
des Community Goals (mécanique de contribution, paliers de récompense, historique) est détaillé dans le guide
dédié [Community Goals](./24-community-goals.md).

## 10. Sécurité et gestion du risque du commerçant

- Ne jamais transporter une cargaison dont la perte mettrait en péril la trésorerie du commandant.
- L'assurance (*rebuy*) ne couvre que le remplacement du vaisseau, jamais la marchandise perdue — un argument
  supplémentaire pour équilibrer soute et défense plutôt que maximiser aveuglément le cargo.
- Voyager en escadron/ *wing* sur les routes dangereuses (protection mutuelle, partage du butin en contrebande) — voir
  [Wings, Multicrew et CQC](./23-jeu-en-groupe.md) pour la mécanique de wing.
- Éviter les marchés noirs et routes de contrebande dans les systèmes fortement surveillés ; privilégier les systèmes
  d'Anarchie pour l'illégal.

## 11. Actualités et méta récente du commerce (2025-2026)

- **Colonisation des systèmes** : nouvelle fonctionnalité majeure permettant aux joueurs de revendiquer des systèmes
  inhabités et de construire des colonies (facilités, économies façonnées par le joueur en tant qu'« architecte
  système »). Ajoutée gratuitement en bêta le **26 février 2025** (mise à jour « Trailblazers », v4.1.0.0), avec une
  sortie complète le **11 novembre 2025** via la mise à jour officiellement nommée « Dodec Update » (v4.2.2.0). Cette
  fonctionnalité a créé un pan entier de gameplay commercial : l'approvisionnement des chantiers de construction de
  colonies en matériaux (alliages, machines, produits chimiques) génère des pics de demande localisés et temporaires
  extrêmement rentables — un axe à surveiller en priorité pour des routes commerciales rentables en 2025-2026. Détails
  complets dans [La Colonisation](./18-colonisation.md).
- **Powerplay 2.0 / Ascendancy** : sorti le **31 octobre 2024** (extension « Elite Dangerous: Ascendancy », avec le
  vaisseau Mandalay), et non le 26 février 2025 comme l'indiquaient certaines versions antérieures de ce guide — cette
  dernière date correspond en réalité à la mise à jour « Trailblazers » (colonisation), sortie près de quatre mois plus
  tard. Détails et sources dans [Powerplay](./02-powerplay.md).
- **Panther Clipper Mk II** : disponible en jeu depuis le **22 juillet 2025** en accès anticipé ARX — voir tableau de la
  section 5 pour ses spécifications.
- **Type-8 Transporter** : lancé le **7 août 2024**, 406 tonnes de capacité annoncées, efficace en carburant — voir
  [Transport](./12-transport.md) pour la chronologie complète des mises à jour touchant le fret.
- **Patch « Vanguards » (Patch 1, août 2025)** : ce patch a notamment augmenté le plafond de membres d'escadron (500 →
    600) et le nombre de candidatures en attente autorisées (10 → 25), facilitant la gestion de flottes marchandes plus
         importantes, et ajouté des vendeurs Vista Genomics et Pioneer Supplies installables sur les Porte-Vaisseaux
         d'escadron (renforçant les capacités commerciales collectives). En revanche, le bonus d'assurance cargo
         d'escadron (*Squadrons cargo Insurance perk*) a été temporairement désactivé — il reste sélectionnable mais
         sans effet — ce qui a accru le risque pour le commerce en groupe pendant cette période.
- **Mise à jour « Caspian Explorer »** : le vaisseau a été révélé le 25 novembre 2025 (November Dev Blog officiel), puis
  mis en vente le **2 décembre 2025** via accès anticipé ARX, avec un correctif dédié (« Update 1 ») publié le 11
  décembre 2025. Élargit les options de vaisseaux disponibles côté exploration/gros tonnage plutôt que commerce pur ;
  fiche complète dans [Vaisseaux](./03-vaisseaux.md).
- **Chiffres de rentabilité 2025 (source GameRant, instantané non redaté par la source d'origine — à revérifier)** :
  minage laser optimisé (Python/Type-9) supérieur à 100 M Cr/heure ; contrebande de passagers façon Robigo (Python)
  environ 90 M Cr/heure ; minage en escadron coordonné via le réseau communautaire PTN jusqu'à 3,5 milliards de Cr par
  cycle pour un équipage de quatre commandants. Ces chiffres illustrent que la méta actuelle privilégie fortement le jeu
  en groupe organisé (*wings*/ *squadrons*) pour maximiser les profits — un axe que les mises à jour Vanguards ont
  explicitement renforcé côté infrastructure (porte-vaisseaux, plafond de membres).

## En résumé : quel vaisseau de commerce pour quel usage ?

| Objectif                                  | Vaisseau recommandé                               | Raison                                                              |
|-------------------------------------------|---------------------------------------------------|---------------------------------------------------------------------|
| Débuter le commerce                       | Hauler → Cobra Mk III                             | Faible coût d'entrée, boucle d'apprentissage rapide                 |
| Transition débutant armé                  | Keelback                                          | Baie de chasseur, bonne soute pour son prix                         |
| Commerce moderne milieu de gamme          | Type-8 Transporter                                | Bonne capacité, régime SCO, sorti en 2024                           |
| Commerce en volume, zone sûre             | Type-9 Heavy                                      | Meilleure soute brute par crédit investi                            |
| Commerce en volume maximal                | Panther Clipper Mk II                             | Plus gros transporteur non-capital du jeu (2 emplacements classe 8) |
| Commerce polyvalent haut de gamme         | Imperial Cutter                                   | Meilleur compromis vitesse/soute/résistance (nécessite rang de Duc) |
| Commerce en zone dangereuse / marché noir | Type-10 Defender                                  | Meilleures valeurs défensives, le plus armé                         |
| Un seul vaisseau pour tout faire          | Anaconda                                          | Meilleure portée de saut, vrai multirôle                            |
| Mining-to-trade                           | Python (intermédiaire) → Imperial Cutter (avancé) | Bon compromis stockage/maniabilité, puis grande soute et résistance |
| Contrebande de passagers                  | Python                                            | Vitesse et discrétion adaptées aux boucles type Robigo              |

Ce tableau ne comporte volontairement **pas de ligne pour la piraterie** (section 2.5) : aucune source vérifiée n'a été
retrouvée qui désigne un vaisseau de référence pour cette activité, et les critères y sont ceux du combat (maniabilité
pour gagner l'interdiction, emplacement interne impair pour le Hatch Breaker Limpet Controller, capacité à encaisser une
riposte) plutôt que ceux du fret. Voir [Combat spatial](./08-combat-spatial.md) pour les builds correspondants.

## Voir aussi

- [Marchandises, denrées rares et minerais](./28-marchandises.md) — référentiel nominatif des marchandises, de leurs
  catégories officielles et des denrées rares, complément direct des sections 1 et 2 de ce guide.
- [Vaisseaux](./03-vaisseaux.md) — liste complète des vaisseaux, fabricants et fiches détaillées.
- [Équipements](./04-equipements.md) — fiches modules (Cargo Rack, Refinery, Fuel Scoop, AFMU, Cargo Scanner, FSD
  Interdictor, Hatch Breaker et Collector Limpet Controllers, etc.).
- [Combat spatial](./08-combat-spatial.md) — interdiction, mass lock, crime, primes et notoriety : les mécaniques qui
  encadrent la piraterie décrite en section 2.5.
- [Ingénieurs](./06-ingenieurs.md) — ingénierie des modules cités dans ce guide.
- [Guardians](./05-guardians.md) — Guardian FSD Booster.
- [Transport](./12-transport.md) — passagers légaux/illégaux, chronologie des vaisseaux de fret.
- [Le Minage](./20-minage.md) — équipement et techniques de minage détaillées.
- [Le BGS](./21-bgs.md) — mécanique complète des états de faction (Boom/Bust/Famine/Guerre civile...) et effet de la
  piraterie/contrebande sur l'influence des factions.
- [La Colonisation](./18-colonisation.md) — logistique de fret liée à la construction de colonies.
- [Porte-Vaisseaux (Fleet Carriers)](./19-fleet-carriers.md) — coûts, entretien, marché embarqué.
- [Community Goals](./24-community-goals.md) — mécanique générique des CG.
- [Escadrons](./22-squadrons.md) — organisation collective (wing mining, CG, PTN).
- [Wings, Multicrew et CQC](./23-jeu-en-groupe.md) — mécanique de wing pour voyager à plusieurs.
- [Powerplay](./02-powerplay.md) — dates canoniques d'Ascendancy/Powerplay 2.0.
- [Outils](./16-outils.md) — Trade Dangerous, EDSM, Spansh, Inara, EDMC, BGS-Tally en détail.
- [Débuter et progresser](./27-debuter-et-progresser.md) — parcours du nouveau Commandant et comparatif des huit
  échelles de rang, dont la façon de relier au rang de commerce les méthodes de profit décrites ici.

## Sources

- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://raw.githubusercontent.com/eyeonus/Trade-Dangerous/master/README.md
- https://www.edsm.net/en/
- https://www.thegamer.com/elite-dangerous-trading-guide/
- https://www.thegamer.com/elite-dangerous-guide-to-mining/
- https://gamerant.com/elite-dangerous-best-ways-to-make-money/
- https://twistedvoxel.com/elite-dangerous-vanguards-patch-1-expands-squadron-features-and-fixes-major-bugs/
- https://raw.githubusercontent.com/EDCD/coriolis-data/master/ships/type_9_heavy.json
- https://raw.githubusercontent.com/EDCD/coriolis-data/master/ships/imperial_cutter.json
- https://raw.githubusercontent.com/EDCD/coriolis-data/master/ships/type_10_defender.json
- https://raw.githubusercontent.com/EDCD/coriolis-data/master/ships/anaconda.json
- https://raw.githubusercontent.com/EDCD/coriolis-data/master/ships/keelback.json
- https://raw.githubusercontent.com/EDCD/coriolis-data/master/ships/type_8_transport.json
- https://raw.githubusercontent.com/EDCD/coriolis-data/master/ships/panther_clipper.json
- https://api.github.com/repos/EDCD/coriolis-data/contents/ships
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/TradeRank.csv
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/economy.csv
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/factionstate.csv
- https://api.github.com/repos/EDCD/EDMarketConnector/releases/latest (version instantanée, 29 janvier 2026)
- https://api.github.com/repos/aussig/BGS-Tally/releases/latest (version instantanée, 31 août 2026)
- Chronologie canonique interne du corpus (00-chronologie-canonique.md) pour les dates Ascendancy/Colonisation/Panther
  Clipper/Type-8.
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/commodity.csv (commit `c356129`, consulté le 10 septembre 2026 :
  relevé du nombre de catégories officielles de marchandises et de leurs libellés — ce fichier ne contient ni prix, ni
  économie productrice/consommatrice, ni légalité par superpuissance)
- Guides internes du corpus référencés en lien croisé : 03-vaisseaux.md, 04-equipements.md, 08-combat-spatial.md,
  12-transport.md, 16-outils.md, 21-bgs.md, 28-marchandises.md.
