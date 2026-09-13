---
id: 29-missions-reputation-et-rangs
titre: "Missions, réputation et rangs de superpuissance dans Elite Dangerous"
domaine: transversal
entites: [Federal Navy, Imperial Navy, Federal Corvette, Imperial Cutter, Imperial Courier, Federal Dropship,
  Shinrarta Dezhra, Alioth, Achenar, Apex Interstellar, Frontline Solutions, Mission Board, Domino Green,
  Gatekeeper, Pilots Federation]
mots_cles_en: [mission board, federal navy rank, imperial navy rank, reputation, permit, apex interstellar,
  frontline solutions, board flipping, mission stacking, team missions, wing missions, courier, massacre,
  assassination, surface operations, conflict intensity, faction representative]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-12
confiance_globale: moyenne
volatilite: moyenne
sources_primaires: ["elite-dangerous.fandom.com (Federation/Ranks, Empire/Ranks, Permits, Mission Board, Reputation, Team Missions, Apex Interstellar Transport, Conflict Zone (On Foot), Frontline Solutions, Domino Green)", "elitedangerous.com/news/updates (4.4.0.0, 4.4.0.2, 4.4.0.3)", "GitHub EDCD/EDMarketConnector (stats.py)", "forums.frontier.co.uk", "corpus interne (03-vaisseaux, 06-ingenieurs, 09-combat-a-pied, 13-operations, 24-community-goals, 27-debuter-et-progresser)"]
zones_incertaines: ["seuils numériques exacts (%) des paliers Unfriendly et Hostile de l'échelle de réputation : aucune source consultée ne les chiffre, seuls Cordial (15 %), Friendly (35 %) et Allied (75 %) le sont", "condition d'accès au marché noir d'une station : une page wiki l'attribue uniquement au type de gouvernement et à l'état BGS de la faction contrôlante, des discussions communautaires affirment à l'inverse qu'un statut Cordial minimum est requis — contradiction non résolue", "plafond de missions actives simultanées (mission stacking) : chiffré à 20 par un fil de forum de janvier 2018, jamais revérifié pour la version 4.4.0.x actuelle", "mécanisme actuel du board flipping : le changement de mode de jeu a été neutralisé en 2018 par le serveur de missions dédié, mais aucune source datée de 2025-2026 ne confirme si une déconnexion complète force un nouveau tirage", "localisation exacte de la mission d'invitation du permis Sirius : une source situe le mégaship Gatekeeper à Luyten's Star, une autre à Avik", "date du Community Goal ayant conditionné le permis Alioth : le corpus interne (voir 24-community-goals.md et README.md) date un CG « Prime Minister Edmund Mahon » de mai-juin 2021 ; cette recherche ne retrouve qu'un CG distinct de février 2022 et un établissement du mégaship Gatekeeper d'Alioth en novembre 2021 — divergence non tranchée, signalée mais non corrigée d'autorité", "accessibilité actuelle du permis du Pilots' Federation District : l'option de démarrage à Dromi qui le délivrait automatiquement semble avoir disparu de la création de personnage depuis 2023 (Update 14), sans confirmation d'une réintroduction ni d'un retrait définitif pour la version 4.4.0.x", "échelle de paliers ordonnée du rang Mercenaire (combat à pied) : aucune source consultée, cette édition comme la précédente (27-debuter-et-progresser.md), n'en publie une", "durée exacte d'un trajet Apex selon la distance et taux précis du Hyperspace Fee : aucune formule officielle trouvée, seuls des exemples communautaires isolés", "sort de la cargaison du vaisseau laissé à quai lorsque le joueur voyage en Apex : non documenté par une source fiable", "prêt d'équipement par Frontline Solutions à l'engagement dans une zone de conflit : la mention reprise d'une source antérieure du corpus n'a pas pu être confirmée ; les indices disponibles suggèrent au contraire que le joueur apporte son propre équipement"]
guides_lies: [2, 3, 6, 8, 9, 10, 11, 13, 21, 23, 24, 27]
---

# Missions, réputation et rangs de superpuissance dans Elite Dangerous

## En bref

Ce guide documente trois mécaniques qui structurent la progression du joueur mais n'existaient nulle part comme
sujet en soi dans le corpus. **Le tableau de missions** : sept familles officieuses (Courier, Supply, Assassination,
Massacre, Theft/Liberation, Recovery, Surface Operations), leur cycle de vie (rafraîchissement partiel, timers réels,
pénalité d'abandon) et les règles de cumul. **La réputation de faction**, en six paliers de Hostile à Allied, avec
ses trois seuils chiffrés (Cordial 15 %, Friendly 35 %, Allied 75 %). **Les deux échelles de marine de
superpuissance**, Federal Navy et Imperial Navy, quinze paliers chacune (dont « None »), listées ici en entier pour
la première fois avec leur déblocage exact — sept vaisseaux et une dizaine de permis de système en dépendent. S'y
ajoutent un tableau des systèmes à permis, le rang Mercenaire (dont l'absence de barème publié est confirmée plutôt
que comblée), et les deux portes d'entrée d'Odyssey vers le combat organisé : Apex Interstellar et Frontline
Solutions. Plusieurs divergences entre sources communautaires sont signalées sans être tranchées d'autorité.

## Ce que couvre ce guide, et ce qu'il ne couvre pas

Ce guide est la **colonne vertébrale de la progression** que le reste du corpus traite activité par activité sans
jamais l'assembler. [27-debuter-et-progresser.md](./27-debuter-et-progresser.md) énumère depuis le cycle précédent
les **huit échelles de rang indépendantes** du jeu — six filières Pilots Federation (Combat, Commerce, Exploration,
Exobiologie, Mercenaire, CQC) plus les deux marines de superpuissance — mais renvoie leur détail ailleurs. Ce guide
ne traite PAS les six filières Pilots Federation : leur progression est déjà documentée dans
[08-combat-spatial.md](./08-combat-spatial.md) (Combat), [11-commerce.md](./11-commerce.md) (Commerce),
[10-exploration.md](./10-exploration.md) (Exploration et Exobiologie) et
[23-jeu-en-groupe.md](./23-jeu-en-groupe.md) (CQC, rang séparé et suivi par la Pilots Federation). Il traite en
revanche, pour la première fois dans le corpus : le tableau de missions de vaisseau en tant que système (typologie et
mécanique), l'échelle de réputation de faction mineure, les deux marines en entier, le rang Mercenaire, les systèmes à
permis, et les deux services Odyssey qui donnent accès au combat organisé (Apex Interstellar, Frontline Solutions).

> **Avertissement de sourçage.** Faute d'accès direct à inara.cz et à elitedangerous.com pendant cette recherche
> (erreurs HTTP 402/403/503 et contrôles anti-robot rencontrés sur les deux, sauf pour les pages de notes de mise à
> jour officielles, consultées avec succès), l'essentiel de ce guide s'appuie sur le wiki communautaire
> **Elite Dangerous Wiki (Fandom)**, recoupé quand c'était possible par des forums officiels Frontier, des dépôts
> EDCD et des guides Steam Community datés. Plusieurs de ses propres tableaux portent un bandeau interne signalant des
> zones obsolètes ou non sourcées ; ces réserves sont reportées ici plutôt que lissées. Plusieurs affirmations d'une
> édition précédente du corpus n'ont pas pu être recoupées et sont signalées comme divergentes, sans être corrigées
> d'autorité — voir en particulier la date du Community Goal Alioth ([section 5](#5-tableau-des-systèmes-à-permis)) et le prêt d'équipement Frontline
> Solutions ([section 7.2](#72-frontline-solutions--sengager-dans-une-zone-de-conflit-au-sol)).

---

## 1. Le tableau de missions de vaisseau : typologie et fonctionnement

### 1.1 Les sept familles officieuses de missions

Il n'existe aucune taxonomie officielle publiée par Frontier des missions de vaisseau ; le wiki communautaire en
retient sept, par lesquelles il regroupe l'ensemble du tableau de missions d'une station :

| Famille (EN)         | Contenu                                                                                          | Risque    | Récompense | Variantes notables                                                                 |
|-----------------------|---------------------------------------------------------------------------------------------------|-----------|------------|---------------------------------------------------------------------------------------|
| **Courier**           | Livrer des données ou de la marchandise fournie par le donneur d'ordre à une destination donnée   | Faible    | Faible     | Devient **Smuggling** si la marchandise est illégale à destination                  |
| **Supply**            | Acheter puis livrer un bien, miner-raffiner-livrer (« Mining Rush »), ou faire un don de crédits   | —         | —          | **Donation** : récompense en réputation/influence seulement, complétable aussitôt   |
| **Assassination**     | Détruire une cible nommée                                                                          | Très élevé| Très élevé | **Wetwork** : cible non révélée avant l'arrivée, parfois civile                     |
| **Massacre**          | Détruire un nombre donné de vaisseaux d'une faction, souvent lié à une Guerre Civile               | Élevé     | Élevé      | Factions Anarchy : cible nommée « Civilian » ; factions légales : « Spec/Black Ops » |
| **Theft / Liberation**| Voler ou récupérer un bien ou un otage détenu par une cible                                        | Élevé     | Élevé      | —                                                                                     |
| **Recovery**          | Récupérer un objet en espace profond ou en surface planétaire                                      | Moyen     | Moyen      | **Illegal Recovery**, **Civil War Recovery**                                          |
| **Surface Operations**| Scanner un Data Point (point de données) en SRV (Data Recovery/Theft) ou saboter un générateur de settlement (installation au sol) | Moyen     | Moyen      | À la frontière missions-vaisseau / missions au sol — nécessite un SRV                |

À ces familles s'ajoutent deux carrières transversales au tableau, avec leur propre profil risque/récompense :
**Salvager** (récupération de cargaison/matériaux légaux ou volés — risque moyen, récompense faible) et
**Smuggler** (transport de biens ou de passagers illégaux sans se faire scanner — risque moyen, récompense moyenne),
ainsi que les contrats **Passenger**, scindés en deux familles étanches : les contrats **VIP** (aller-retour, haute
récompense, haut risque, alimentent surtout les rangs Explorateur et Commerce) et les contrats **Bulk** (aller simple,
faible récompense, faible risque, alimentent surtout l'Influence BGS et le rang Commerce). *(elite-dangerous.fandom.com
— Mission Board/Types, Salvager, Smuggler, Passenger Carrier, consultés le 12 septembre 2026.)*

> **Correspondance avec des intitulés attendus.** Les termes « Boom Delivery » et « Source and Return », parfois
> cités dans la documentation communautaire, ne sont pas des familles indépendantes du tableau solo : « Source and
> Return » est un des quatre types de **mission d'équipe** ([section 1.3](#13-missions-déquipe-teamwing-missions)), et le libellé exact « Boom Delivery » n'a
> pas pu être confirmé sur une page de référence — seuls des fils de discussion l'évoquent sans citer le texte d'une
> mission en jeu. « Wetwork » n'est pas non plus une famille : c'est un sous-titre d'Assassination. Un rédacteur
> voulant vérifier le libellé exact affiché en jeu devra le faire directement en jeu ou via un datamine EDCD/FDevIDs,
> qu'aucune source consultée ne documente pour les intitulés de mission.

### 1.2 Qui propose une mission, et pourquoi elle est parfois grisée

Le tableau de missions d'une station est peuplé par les **« Faction Representatives »** de chaque faction mineure
présente localement — un représentant par faction, dont le titre affiché dépend à la fois du palier de réputation du
joueur envers cette faction et du type de gouvernement de la faction (les intitulés diffèrent entre une Anarchie, une
Théocratie ou une Corporation, par exemple). Une mission proposée mais non acceptable affiche explicitement la
condition non remplie — réputation insuffisante, soute insuffisante, ou crédits insuffisants pour un don.
*(elite-dangerous.fandom.com — Mission Board, Reputation, consultés le 12 septembre 2026.)*

### 1.3 Missions d'équipe (Team/Wing missions)

Quatre des familles ci-dessus existent aussi en version **partagée** entre membres d'une même équipe (Wing, renommée
« Team » depuis Odyssey — voir [23-jeu-en-groupe.md](./23-jeu-en-groupe.md)) : **Assassination, Delivery, Massacre,
Source and Return**. Une équipe de quatre joueurs au maximum peut ainsi mener jusqu'à **quatre missions d'équipe
actives simultanément**, chaque joueur ne pouvant partager qu'une seule mission à la fois ; le joueur qui l'a acceptée
doit la valider en premier pour que les autres membres puissent ensuite la rendre à leur tour, et tous les membres
présents à la complétion reçoivent un choix de récompense individuel.
*(elite-dangerous.fandom.com — Team Missions, consulté le 12 septembre 2026.)*

### 1.4 Rafraîchissement du tableau et « board flipping »

Le tableau se rafraîchit automatiquement et **partiellement** environ toutes les dix minutes — certaines missions
sont retirées ou ajoutées à chaque cycle, sans renouvellement complet ; cette valeur est un consensus communautaire
convergent, non publiée officiellement par Frontier pour la version 4.4.0.x. Le terme historique **« board
flipping »** désignait le fait de changer de mode de jeu (Solo / Groupe privé / Ouvert) pour forcer un nouveau tirage
du tableau ; cette possibilité a été neutralisée dès **2018** par l'introduction d'un serveur de missions dédié
(*Beyond*, chapitre 4, v3.3), qui rend le tableau cohérent entre tous les modes de jeu. Le terme survit dans l'usage
communautaire de 2024, mais désigne aujourd'hui une pratique différente : visiter plusieurs stations et factions pour
accumuler des contrats compatibles entre eux (voir stacking, [1.6](#16-cumul-de-missions-mission-stacking)), plutôt qu'un vrai changement de tirage.
*(elite-dangerous.fandom.com — Mission Board ; forums.frontier.co.uk, fils « Now that board flipping is gone... »
2019 et « Elite Dangerous Money Making in 2024 », consultés le 12 septembre 2026.)*

### 1.5 Cycle de vie : timers, échec et abandon

Les minuteurs de mission tournent en **temps réel** et ne se mettent jamais en pause. Dépasser le délai ou abandonner
une mission entraîne systématiquement une baisse de réputation avec la faction émettrice, et parfois une amende dont
le montant n'est spécifié que dans le détail de cette mission précise — il n'existe pas de formule générale. Les
missions de cargaison tolèrent une réussite partielle dès 50 % livré ; les missions de données échouent totalement à
la destruction du vaisseau porteur. *(elite-dangerous.fandom.com — Mission Board, Reputation, consultés le
12 septembre 2026.)*

### 1.6 Cumul de missions (mission stacking)

Le cumul fonctionne surtout pour les missions **Massacre** et **Assassination** : une même élimination compte
simultanément pour plusieurs missions, à condition qu'elles proviennent de **factions différentes** ciblant la même
faction hostile ; deux missions de la **même** faction contre la même cible ne se valident pas toutes les deux avant
que l'une d'elles soit achevée. Un plafond de **20 missions actives simultanées**, partagé avec les contrats
passagers, est documenté par un fil de forum Frontier de janvier 2018 — non revérifié depuis pour la version
4.4.0.x actuelle. [24-community-goals.md, §4.3](./24-community-goals.md) documente par ailleurs la même logique de
cumul appliquée aux Community Goals : une mission individuelle portant sur exactement la même commodité ou le même
type de cible qu'une CG en cours fait progresser les deux à la fois. *(elite-dangerous.fandom.com — Assassin ;
forums.frontier.co.uk, consultés le 12 septembre 2026.)*

### 1.7 États BGS et peuplement du tableau

Les états du [Background Simulation](./21-bgs.md) modifient directement le volume et la nature des missions
proposées : **Boom** augmente fortement les missions de commerce et de livraison ; **Famine** fait que les missions
et actions de combat cessent de contribuer à l'influence tandis que les livraisons de nourriture voient leur effet
doublé ; **Guerre** et **Guerre Civile** gèlent l'influence et récompensent la faction qui complète le plus de
missions et d'actions de combat sur quatre jours cumulés dans une fenêtre de sept. La page communautaire source porte
elle-même un bandeau signalant des zones non sourcées sur les durées et seuils exacts, à ne pas tenir pour établi sans
recoupement. *(elite-dangerous.fandom.com — Background Simulation, consulté le 12 septembre 2026.)*

---

## 2. L'échelle de réputation de faction mineure

### 2.1 Six paliers, de Hostile à Allied

Tout commandant démarre **Neutral** avec chaque faction mineure qu'il rencontre. L'échelle complète, du plus bas au
plus haut :

| Palier      | Seuil                        | Effet documenté                                                               |
|-------------|-------------------------------|----------------------------------------------------------------------------------|
| Hostile     | non chiffré par la source     | Attaqué à vue par les PNJ affiliés à cette faction                             |
| Unfriendly  | non chiffré par la source     | —                                                                                |
| Neutral     | 0 à 15 %                       | Palier de départ par défaut                                                     |
| Cordial     | ≥ 15 %                         | Accès aux missions de promotion Navy (Federal/Imperial, voir [section 3](#3-les-deux-échelles-de-marine-de-superpuissance))         |
| Friendly    | ≥ 35 %                         | Accès à des missions mieux rémunérées                                          |
| Allied      | ≥ 75 %                         | Accès aux missions les mieux rémunérées ; condition la plus fréquente d'un permis|

Les seuils numériques d'Unfriendly et de Hostile ne sont chiffrés par aucune source consultée. *(elite-dangerous.fandom.com
— Reputation, consulté le 12 septembre 2026 ; page portant elle-même un bandeau « en partie obsolète ».)*

### 2.2 Ce que le palier conditionne réellement

Un statut **Allié** est la condition la plus répandue des missions d'invitation à un permis de système ([section 5](#5-tableau-des-systèmes-à-permis)) et
d'un Ingénieur (exemple déjà présent dans le corpus : **Bill Turner ⇒ Allié avec Alioth Independents**, cité en
[06-ingenieurs.md](./06-ingenieurs.md)). Un statut **Hostile** déclenche une attaque à vue par les PNJ de la faction
concernée. L'accès au **marché noir** d'une station est documenté par le wiki communautaire comme dépendant
uniquement du type de gouvernement de la faction contrôlante (Anarchie, Communisme, Confédération, Coopérative,
Démocratie l'autorisent ; Corporation, Dictature, Féodalité, Mécénat, Colonie pénitentiaire, Théocratie le
suppriment) et de son état BGS (un Lockdown ferme un marché noir existant, un Civil Unrest peut en ouvrir un
temporaire) — sans mention d'un seuil de réputation du joueur. Des discussions communautaires affirment à l'inverse
qu'un statut **Cordial** minimum serait requis. Ces deux affirmations n'ont pas pu être réconciliées avec les sources
disponibles ; ce guide rapporte la contradiction plutôt que de la trancher.
*(elite-dangerous.fandom.com — Black Market, Reputation, Permits, consultés le 12 septembre 2026.)*

### 2.3 La réputation de faction ne se dégrade pas ; celle des superpuissances, si

La **décroissance** de réputation (« decay ») ne s'applique **qu'aux trois superpuissances majeures** (Fédération,
Empire, Alliance) : au-dessus de 75 %, elle redescend lentement vers ce plancher (au moins un point par jour, même
hors connexion) ; en dessous de Neutral mais au-dessus de 25 %, elle remonte lentement vers ce plafond. Il n'existe
**aucune décroissance de réputation pour les factions mineures** — un statut Allié acquis avec une faction locale
reste acquis tant qu'aucune action négative ne l'entame. *(elite-dangerous.fandom.com — Reputation, consulté le
12 septembre 2026.)*

---

## 3. Les deux échelles de marine de superpuissance

Les deux échelles ci-dessous comptent chacune **quinze paliers numérotés de 0 à 14**, le palier 0 étant « None »
(aucun rang) — soit **quatorze rangs titrés** à proprement parler. Elles conditionnent l'achat de **sept vaisseaux**
(déjà recensés dans [03-vaisseaux.md](./03-vaisseaux.md)), plusieurs permis de système ([section 5](#5-tableau-des-systèmes-à-permis)) et au moins une
invitation d'Ingénieur.

### 3.1 Federal Navy Auxiliary

| # | Rang               | Débloque                                              |
|---|--------------------|---------------------------------------------------------|
| 0 | None               | —                                                        |
| 1 | Recruit            | —                                                         |
| 2 | Cadet              | —                                                         |
| 3 | Midshipman         | **Federal Dropship** ; invitation de l'Ingénieur The Sarge (condition exacte non recoupée verbatim) |
| 4 | Petty Officer      | Permis **Sol**, délivré par le Federal Congress            |
| 5 | Chief Petty Officer| **Federal Assault Ship** ; permis **Vega** et **Beta Hydri** |
| 6 | Warrant Officer    | Permis **PLX 695**                                        |
| 7 | Ensign             | **Federal Gunship** ; permis **Ross 128**                 |
| 8 | Lieutenant         | Permis **Exbeur**                                          |
| 9 | Lieutenant Commander | —                                                       |
| 10| Post Commander     | Permis **Hors**                                            |
| 11| Post Captain       | —                                                          |
| 12| Rear Admiral       | **Federal Corvette** — dernier déblocage utile de l'échelle |
| 13| Vice Admiral       | —                                                          |
| 14| Admiral            | — (rang honorifique de sommet, aucun déblocage supplémentaire) |

*(elite-dangerous.fandom.com — Federation/Ranks, Federal_Navy, Permits/Federation ; GitHub EDCD/EDMarketConnector
stats.py, consultés le 12 septembre 2026.)*

### 3.2 Imperial Navy

| # | Rang     | Débloque                                                               |
|---|----------|--------------------------------------------------------------------------|
| 0 | None     | —                                                                          |
| 1 | Outsider | Invitation de l'Ingénieure **Hera Tani** (condition cumulée avec une progression Liz Ryder et 50 Kamitra Cigars) |
| 2 | Serf     | —                                                                           |
| 3 | Master   | **Imperial Courier**                                                      |
| 4 | Squire   | Permis **Achenar** (capitale de l'Empire), délivré par l'Achenar Empire League |
| 5 | Knight   | —                                                                           |
| 6 | Lord     | —                                                                           |
| 7 | Baron    | **Imperial Clipper** ; permis **Summerland**                               |
| 8 | Viscount | —                                                                           |
| 9 | Count    | —                                                                           |
| 10| Earl     | Permis **Facece** (siège historique de l'Imperial Navy)                    |
| 11| Marquis  | —                                                                           |
| 12| Duke     | **Imperial Cutter** — et non au rang King, contrairement à une idée reçue répandue |
| 13| Prince   | —                                                                           |
| 14| King     | — (rang honorifique de sommet, aucun déblocage supplémentaire)             |

Le jeu n'emploie **aucun titre féminisé** (pas de « Princess », « Queen » ou « Duchess ») : plusieurs fils des forums
officiels Frontier réclament leur ajout, ce qui confirme leur absence actuelle plutôt que de la documenter directement.
*(elite-dangerous.fandom.com — Empire/Ranks, consulté le 12 septembre 2026 ; absence de titres féminisés déduite de
forums.frontier.co.uk, confiance moyenne.)*

### 3.3 Comment on monte en grade : un mécanisme unique pour les deux marines

Le rang de marine se construit en deux temps. D'abord, accomplir des missions (ou dons, transport, contrats
divers) pour des factions mineures alignées à la superpuissance visée fait progresser une **jauge de réputation
interne au rang**, distincte de la réputation de faction ([section 2](#2-léchelle-de-réputation-de-faction-mineure)). Une fois cette jauge pleine, les factions de
cette superpuissance avec lesquelles le commandant a un statut **Cordial ou supérieur** commencent à proposer des
**missions de promotion** explicitement titrées (par exemple « Federal Navy Acquisition Contract » ou son équivalent
impérial) ; terminer une telle mission fait monter le rang d'un palier. La progression de réputation excédentaire
n'est pas perdue en attendant qu'une mission de promotion apparaisse. Tout commandant indépendant de la Pilots
Federation peut servir dans l'une ou l'autre marine sans démarche d'adhésion formelle — contrairement à Powerplay, où
il faut se *pledge* (s'engager) à un Power (voir [02-powerplay.md](./02-powerplay.md), système de réputation entièrement
distinct : aucune des deux échelles de marine ne recoupe un rang Powerplay). Ces rangs sont honorifiques et ne
confèrent aucune autorité réelle : seulement l'achat de certains vaisseaux et l'accès à des systèmes restreints.
*(elite-dangerous.fandom.com — Federation/Ranks, Empire/Ranks, Federal_Navy, consultés le 12 septembre 2026.)*

---

## 4. Le rang Mercenaire (combat à pied)

Le rang Mercenaire conditionne l'accès à des grades de combinaison et à des settlements spécifiques (voir
[09-combat-a-pied.md](./09-combat-a-pied.md) et [13-operations.md](./13-operations.md), qui citent la « réputation
acquise auprès des factions locales ou des superpuissances (rang mercenaire, exploration, etc.) » comme condition de
déblocage sans jamais lister ses paliers). **Aucune source consultée pour cette édition — pas plus que pour
[27-debuter-et-progresser.md](./27-debuter-et-progresser.md) lors du cycle précédent — ne publie une échelle de
paliers ordonnée pour ce rang.** Il ne s'agit donc pas d'un oubli de rédaction mais d'une absence documentée à deux
reprises : à défaut d'une échelle chiffrée, la seule méthode fiable reste de suivre sa propre progression dans le
panneau Statut > Réputation en jeu.

---

## 5. Tableau des systèmes à permis

Le mécanisme général n'a pas changé avec Powerplay 2.0 (31 octobre 2024) ni avec la Colonisation (2025) : aucune
recherche ciblée sur ces deux mises à jour, ni sur les notes 4.4.0.0/4.4.0.2/4.4.0.3, ne documente de refonte des
permis de système historiques. L'accès s'obtient par un rang de carrière (Pilots Federation, Federal Navy, Imperial
Navy, CQC), par une réputation **Alliée** avec la faction détentrice suivie d'une mission d'invitation (souvent à
bord d'un mégaship *Gatekeeper*), ou ponctuellement par un Community Goal historique.

| Système | Autorité | Condition | Intérêt |
|---|---|---|---|
| **Shinrarta Dezhra** | Pilots Federation Local Branch | Rang **Elite** dans Combat, Commerce, Exploration, Mercenaire OU Exobiologie (une seule filière suffit) ; accès permanent | Siège de la Pilots Federation ; Jameson Memorial vend tout le catalogue à 10 % de remise |
| **Sol** | Federal Congress | Federal Navy **Petty Officer** | Capitale de la Fédération ; berceau de l'humanité |
| **Beta Hydri** | Beta Hydri Democrats | Federal Navy **Chief Petty Officer** | Un des cinq systèmes fondateurs de la Fédération |
| **Vega** | Vega Independents | Federal Navy **Chief Petty Officer** | 10 % de remise sur l'Eagle Mk II à Edmondson High |
| **PLX 695** | PLX 695 Values Party | Federal Navy **Warrant Officer** | Fournisseur militaire In Depth Protection |
| **Ross 128** | Social Ross 128 Coalition | Federal Navy **Ensign** | Abrite la Warren Prison Mine |
| **Exbeur** | Workers of Exbeur Democrats | Federal Navy **Lieutenant** | — |
| **Hors** | Clan of Hors | Federal Navy **Post Commander** | Centre d'entraînement Brightlight Training |
| **Achenar** | Achenar Empire League | Imperial Navy **Squire** | Capitale de l'Empire |
| **Summerland** | — | Imperial Navy **Baron** | Débloqué au même rang que l'Imperial Clipper |
| **Facece** | Facece Empire Party | Imperial Navy **Earl** | Siège historique de l'Imperial Navy |
| **Sirius** | Sirius Corporation | Réputation **Alliée** + mission d'invitation (mégaship *Spirit of Laelaps* — localisation contestée, voir zones incertaines) | Siège de Sirius Corporation et de l'Ingénieur Marco Qwent |
| **Van Maanen's Star** | Sublime Order of Van Maanen's Star | Réputation **Alliée** + mission d'invitation (mégaship *Shadows Endurant*, système voisin Epsilon Eridani) | — |
| **CD-43 11917** | CQC Holdings | Rang **Prestige** en CQC Championship | Siège du CQC Championship ; remises à Attilius Orbital |
| **Alioth** | Alioth Independents | Réputation **Alliée** + mission d'invitation (mégaship *Meredith's Dream*, système voisin Alcor) — voir note ci-dessous | Capitale de l'Alliance |
| **Pilots' Federation District** | Pilots' Federation Administration | Historiquement automatique en démarrant à Mawson Dock (Dromi) ; option probablement retirée depuis 2023, voir note | Dix systèmes en zone de départ protégée |

> **Note sur Alioth.** Le corpus (voir [24-community-goals.md](./24-community-goals.md) et
> [README.md](./README.md)) date le déblocage du permis d'un Community Goal « Prime Minister Edmund Mahon » de
> mai-juin 2021. Cette recherche ne retrouve ni cette date ni ce libellé précis : elle situe l'établissement du
> mégaship Gatekeeper *Meredith's Dream* à Alcor en novembre 2021 (date in-jeu du 24 novembre 3307), et un Community
> Goal distinct, « Fight For Reorte Mining Coalition », en février 2022, qui a offert le permis aux 75 % meilleurs
> contributeurs. Le mécanisme aujourd'hui documenté comme standard — réputation Alliée puis mission d'invitation à
> Alcor — n'est conditionné par aucun Community Goal ponctuel dans les sources consultées cette session. Ces deux
> versions ne sont pas nécessairement incompatibles (un CG historique a pu coexister avec la voie de réputation
> permanente), mais aucune source consultée ne les réconcilie explicitement : ce guide signale la divergence sans la
> trancher, et ne modifie pas l'affirmation existante de 24-community-goals.md.
>
> **Note sur le Pilots' Federation District.** L'option de démarrage « Dromi » qui délivrait ce permis automatiquement
> semble avoir disparu de l'écran de création de personnage après l'*Update 14* (vers avril 2023), ne laissant que
> deux points de départ (LHS 3447 ou Asellus Primus). Aucune source datée de 2024-2026 ne confirme si ce choix a été
> réintroduit ; si la suppression perdure, ce permis est aujourd'hui de facto hors d'atteinte pour un nouveau
> commandant, bien que la région et le permis existent toujours dans les données du jeu.

*(elite-dangerous.fandom.com — Permits, Permits/Federation, Permits/Empire, Alioth, Pilots' Federation District ;
guide Steam Community « All Known Permits and How to Unlock Them », 28 mai 2025 ; elitedangerous.com/news/powerplay-20-qa ;
consultés le 12 septembre 2026.)*

---

## 6. Récompenses non-créditées de la progression

Les rangs et la réputation documentés dans ce guide débloquent, au-delà des crédits :

- **Des vaisseaux** — sept au total, tous listés en [section 3](#3-les-deux-échelles-de-marine-de-superpuissance) et déjà recensés dans
  [03-vaisseaux.md](./03-vaisseaux.md).
- **Des permis de système** — [section 5](#5-tableau-des-systèmes-à-permis).
- **Des invitations d'Ingénieur** — The Sarge (Federal Navy Midshipman, condition exacte non recoupée verbatim),
  Hera Tani (Imperial Navy Outsider, cumulée avec une condition Liz Ryder et 50 Kamitra Cigars), et plus généralement
  toute invitation conditionnée à un statut Allié avec une faction (exemple déjà présent dans le corpus : Bill Turner,
  voir [06-ingenieurs.md](./06-ingenieurs.md)).
- **Des remises locales ponctuelles** — 20 % sur l'Eagle Mk II à Daedalus (Sol), 10 % sur le Federal Dropship et le
  Vulture au même comptoir, 10 % sur l'Eagle Mk II à Edmondson High (Vega) : des remises de comptoir précis, non une
  remise générale sur l'ensemble des vaisseaux d'une superpuissance.

Aucune source consultée ne documente de **module pré-engineered** offert en récompense d'un rang de marine — à la
différence des Community Goals, qui en offrent parfois (voir [24-community-goals.md](./24-community-goals.md)). Ce
guide ne reconduit donc pas cette hypothèse, plausible mais non vérifiée, qui figurait dans le plan de ce cycle.

---

## 7. Apex Interstellar et Frontline Solutions : les deux portes d'entrée d'Odyssey

[13-operations.md](./13-operations.md) documente en détail les zones de conflit au sol et l'atterrissage sur un
settlement, sans jamais expliquer comment le joueur **rejoint** un point d'engagement distant sans y poser lui-même
son vaisseau. Deux services Odyssey comblent ce trou.

### 7.1 Apex Interstellar : la navette rapide

**Réservation.** En station, un comptoir Apex Interstellar Transport se trouve dans la plupart des Concourses (zones sociales à pied). Depuis
un settlement, sans comptoir physique, la navette se commande à distance via le menu personnel du joueur.

**Tarification.** Le coût combine un **Supercruise Fee** de base (100 Cr) pour la portion intra-système, plus un
**Hyperspace Fee** variable selon la distance si le trajet exige un ou plusieurs sauts. Aucune formule officielle
(taux par année-lumière) n'est publiée ; un exemple communautaire cite environ 100 + 43 900 Cr pour un trajet
d'environ 88 années-lumière — un ordre de grandeur, non une règle de calcul.

**Le véhicule et ses limites.** La navette est un Adder modifié à livrée Apex, quatre places (dont une réservée au
pilote), sans Fuel Scoop, avec une portée typique de six à sept sauts (21,68 al à vide de cargaison, 23,88 al à
vide) — un Sol → Colonia direct est donc hors de portée d'un aller Apex. Le trajet se déroule en **temps réel** et se
met en pause si le joueur quitte le jeu. Après réservation, le joueur dispose de **cinq minutes** pour embarquer ou
annuler avec remboursement intégral ; ne pas se présenter fait partir la navette sans remboursement. Depuis
*Odyssey Update 7*, un déroutement en vol (retour au point de départ ou nouvelle destination) est possible moyennant
un supplément. Apex n'est **pas** proposé dans les Concourses des Fleet Carriers. Aucune capacité de fret n'est
documentée : c'est un service de transport du personnage à pied, pas de la cargaison du vaisseau laissé à quai — dont
le sort exact (conservée ou perdue) n'a pas pu être confirmé. Aucune source ne documente non plus de trajet gratuit
garanti pour un commandant sans le moindre crédit ; les joueurs bloqués rapportent recourir au support joueur ou à
l'option « Recover to Orbit » (récupération en orbite) du menu principal, des mécanismes indépendants d'Apex.

**Confirmation d'une mention du corpus, et un complément.** [26-ingenierie-a-pied-avancee.md](./26-ingenierie-a-pied-avancee.md)
cite « voyager 100 années-lumière en navette/taxi (Apex) » comme condition de déblocage de l'Ingénieure **Domino
Green** — confirmé exactement par la fiche de l'Ingénieure (« Travel 100 light-years in Apex Interstellar Transport
shuttles »), aucune correction nécessaire. Un complément que ce guide ne documente pas encore : fournir 5 unités de
**Push** est une condition distincte, listée sur la même fiche comme « Referral Requirement », qui sert à débloquer
l'Ingénieur **Kit Fowler** *par l'intermédiaire* de Domino Green — pas à débloquer Domino Green elle-même, dont
l'unique condition de rencontre reste le trajet Apex.

### 7.2 Frontline Solutions : s'engager dans une zone de conflit au sol

**Frontline Solutions** est une société de mercenariat non alignée (dirigée par Imogen le Ray) qui propose des
contrats de zone de conflit **sans impact sur la réputation** du joueur envers les factions en présence. Le joueur
s'inscrit à un comptoir dédié dans le Concourse d'une station ou d'un Surface Port — uniquement disponible si le
système est en état **Guerre** ou **Guerre Civile** — choisit sur la carte système une planète et un settlement en
conflit, sélectionne un camp parmi les deux factions belligérantes, puis embarque via des ascenseurs dédiés à bord
d'un dropship Frontline Solutions (un Vulture reconverti) qui transporte jusqu'à cinq autres joueurs ou PNJ vers la
zone.

**Intensité, pas grade.** Les Ground CZ n'ont pas de « grade » de contrat nommé mais trois niveaux de **Conflict
Intensity** — Low, Medium, High — visibles uniquement sur la carte du comptoir Frontline Solutions, indépendants du
« Threat Level » (niveau de menace) affiché dans le panneau système standard. La paie totale observée va d'environ **500 000 Cr** en
intensité Low à **5-20 millions de Cr** en intensité High, selon la compétence du joueur et son équipement ; la
capture d'un point de contrôle rapporte en plus un bond fixe de 3 000 Cr par joueur du camp capturant, au-dessus des
primes de combat individuelles.

**Sur le prêt d'équipement.** Une mention reprise d'une source antérieure du corpus indique que Frontline Solutions
prêterait arme et combinaison pour la durée du contrat, restituées ensuite. **Cette recherche ne confirme pas ce
mécanisme** : la documentation communautaire disponible est au contraire cohérente avec un joueur apportant son
propre équipement (combinaison achetée via Pioneer Supplies, Dominator recommandée), sans mention d'un prêt. Il est
possible que la mention d'origine confonde ceci avec le ravitaillement gratuit en munitions et kits médicaux pendant
la bataille, ou avec un changement de loadout autorisé au redéploiement — mais cela reste à vérifier directement en
jeu avant de trancher.

**Correctif de juin 2026.** Les notes officielles de la mise à jour **4.4.0.0** (« Elite Dangerous: Operations »,
publiée le **30 juin 2026**) corrigent, sous « Bug Fixes », le fait que « Frontline Solutions ne réservait pas de
dropship à l'engagement dans un conflit » — texte déjà repris par [09-combat-a-pied.md](./09-combat-a-pied.md), qui
distingue correctement la date de sortie du jeu (30 juin) de celle des notes publiées (1ᵉʳ juillet) ; aucune
correction n'est donc nécessaire à ce guide. La même mise à jour de juin 2026 a étendu les services de Frontline
Solutions au déploiement rapide d'escouades vers le mode **Operations**, avec un nouveau petit porte-vaisseaux nommé
**Operation Runner**.

*(elite-dangerous.fandom.com — Apex Interstellar Transport, Domino Green, Conflict Zone (On Foot), Frontline
Solutions, Bonds ; elitedangerous.com/news/updates/4-4-0-0 ; consultés le 12 septembre 2026.)*

---

## Questions fréquentes

**Combien de missions actives je peux cumuler en même temps (mission stacking) ?**
Un plafond de 20 missions actives simultanées, partagé avec les contrats passagers, est documenté par un fil de
forum Frontier de janvier 2018 — non revérifié depuis pour la version 4.4.0.x actuelle. Le cumul fonctionne surtout
pour les missions Massacre et Assassination : une même élimination compte pour plusieurs missions à condition
qu'elles proviennent de factions différentes ciblant la même faction hostile. Voir
[section 1.6](#16-cumul-de-missions-mission-stacking).

**Le board flipping, ça marche encore pour rafraîchir le tableau de missions ?**
Non : cette pratique, qui consistait à changer de mode de jeu (Solo / Groupe privé / Ouvert) pour forcer un
nouveau tirage, a été neutralisée dès 2018 par l'introduction d'un serveur de missions dédié qui rend le tableau
cohérent entre tous les modes. Le terme survit dans l'usage communautaire mais désigne aujourd'hui une pratique
différente : visiter plusieurs stations pour accumuler des contrats compatibles entre eux. Voir
[section 1.4](#14-rafraîchissement-du-tableau-et--board-flipping-).

**Combien de missions d'équipe (team/wing missions) peut-on avoir en cours en même temps ?**
Quatre familles de missions existent en version partagée entre membres d'une équipe (Assassination, Delivery,
Massacre, Source and Return). Une équipe de quatre joueurs au maximum peut mener jusqu'à quatre missions d'équipe
actives simultanément, chaque joueur ne pouvant partager qu'une seule mission à la fois. Voir
[section 1.3](#13-missions-déquipe-teamwing-missions).

**Il faut quel palier de réputation pour débloquer les missions les mieux payées ?**
Le statut Allied (≥ 75 %) donne accès aux missions les mieux rémunérées et conditionne le plus souvent l'invitation
à un permis de système ; Friendly (≥ 35 %) donne déjà accès à des missions mieux payées, et Cordial (≥ 15 %) ouvre
les missions de promotion Navy. Voir [section 2.1](#21-six-paliers-de-hostile-à-allied).

**La réputation de faction redescend toute seule avec le temps (reputation decay) ?**
Non pour les factions mineures : un statut Allié acquis reste acquis tant qu'aucune action négative ne l'entame.
La décroissance ne s'applique qu'aux trois superpuissances majeures (Fédération, Empire, Alliance) : au-dessus de
75 % elle redescend lentement vers ce plancher, et en dessous de Neutral mais au-dessus de 25 % elle remonte
lentement vers ce plafond. Voir
[section 2.3](#23-la-réputation-de-faction-ne-se-dégrade-pas--celle-des-superpuissances-si).

**Le rang Federal Navy et le rang Imperial Navy, ça débloque quoi exactement ?**
Chaque échelle compte quinze paliers numérotés de 0 à 14 (dont « None »), soit quatorze rangs titrés. À elles deux
elles conditionnent l'achat de sept vaisseaux — dont le Federal Corvette au palier Rear Admiral côté Fédération, et
l'Imperial Cutter au palier Duke (et non King) côté Empire — plusieurs permis de système et au moins une invitation
d'Ingénieur. Voir [section 3](#3-les-deux-échelles-de-marine-de-superpuissance).

**Le rang Mercenaire (Mercenary), c'est quoi les paliers ?**
Aucune source consultée pour ce guide, ni pour l'édition précédente du corpus, ne publie une échelle de paliers
ordonnée pour ce rang de combat à pied : il s'agit d'une absence documentée à deux reprises, pas d'un oubli de
rédaction. La seule méthode fiable reste de suivre sa propre progression dans le panneau Statut > Réputation en
jeu. Voir [section 4](#4-le-rang-mercenaire-combat-à-pied).

**Comment débloquer le permis pour Alioth ?**
La voie documentée comme standard est une réputation Alliée avec les Alioth Independents suivie d'une mission
d'invitation à bord du mégaship *Meredith's Dream*, dans le système voisin Alcor. Une divergence de sourçage sur un
Community Goal historique associé à ce permis est signalée sans être tranchée. Voir
[section 5](#5-tableau-des-systèmes-à-permis).

**Apex Interstellar, combien ça coûte et jusqu'où ça peut m'emmener ?**
Le coût combine un Supercruise Fee de base (100 Cr) plus un Hyperspace Fee variable selon la distance ; un exemple
communautaire cite environ 100 + 43 900 Cr pour un trajet d'environ 88 années-lumière. La navette a une portée
typique de six à sept sauts (21,68 al à vide de cargaison, 23,88 al à vide) : un Sol → Colonia direct est donc hors
de portée d'un aller Apex. Voir [section 7.1](#71-apex-interstellar--la-navette-rapide).

**Frontline Solutions, ça paie combien pour une zone de conflit au sol ?**
La paie totale observée va d'environ 500 000 Cr en intensité Low à 5-20 millions de Cr en intensité High, selon la
compétence du joueur et son équipement ; la capture d'un point de contrôle rapporte en plus un bond fixe de 3 000 Cr
par joueur du camp capturant, au-dessus des primes de combat individuelles. Voir
[section 7.2](#72-frontline-solutions--sengager-dans-une-zone-de-conflit-au-sol).

---

## Voir aussi

- **[Débuter et progresser](./27-debuter-et-progresser.md)** — vue d'ensemble des huit échelles de rang
  indépendantes du jeu ; ce guide-ci en détaille deux (Federal Navy, Imperial Navy) et les mécaniques qui les
  entourent (missions, réputation, permis).
- **[Combat spatial](./08-combat-spatial.md)** — progression du rang Combat (Harmless → Elite, score pondéré).
- **[Commerce](./11-commerce.md)** — progression du rang Commerce.
- **[Exploration](./10-exploration.md)** — progression des rangs Explorateur et Exobiologiste.
- **[Wings, Multicrew et CQC](./23-jeu-en-groupe.md)** — mécanique des missions d'équipe (Team missions) et rang CQC
  séparé.
- **[Vaisseaux](./03-vaisseaux.md)** — les sept vaisseaux conditionnés à un rang de marine, avec prix et
  caractéristiques.
- **[Ingénieurs](./06-ingenieurs.md)** — exemples de déblocage par réputation de faction ou par rang de
  superpuissance (Bill Turner, Tiana Fortune, Felicity Farseer).
- **[Le Background Simulation (BGS)](./21-bgs.md)** — les missions comme levier BGS, et les états qui modifient le
  tableau de missions.
- **[Community Goals](./24-community-goals.md)** — mécanique générique de cumul de missions, et le Community Goal
  associé au permis Alioth (dont la date est ici signalée comme divergente).
- **[Opérations](./13-operations.md)** — zones de conflit au sol, auxquelles Apex Interstellar et Frontline Solutions
  donnent accès.
- **[Combat à pied](./09-combat-a-pied.md)** — équipement et combinaisons utilisés en zone de conflit Frontline
  Solutions.
- **[Politique et Powerplay](./02-powerplay.md)** — système de réputation distinct (rang Power, 1 à 100), à ne pas
  confondre avec les rangs de marine documentés ici.

## Sources

### Sources distantes, consultées le 12 septembre 2026

- `https://elite-dangerous.fandom.com/wiki/Federation/Ranks` et `Federal_Navy` — échelle complète Federal Navy,
  déblocages par palier.
- `https://elite-dangerous.fandom.com/wiki/Empire/Ranks` — échelle complète Imperial Navy, déblocages par palier.
- `https://elite-dangerous.fandom.com/wiki/Permits`, `Permits/Federation`, `Permits/Empire` — conditions d'accès aux
  systèmes à permis.
- `https://elite-dangerous.fandom.com/wiki/Alioth`, `Pilots'_Federation_District` — historique et statut des permis
  Alioth et Pilots' Federation District.
- `https://elite-dangerous.fandom.com/wiki/Mission_Board`, `Mission_Board/Types`, `Team_Missions` — typologie et
  mécanique du tableau de missions.
- `https://elite-dangerous.fandom.com/wiki/Reputation` — échelle de réputation de faction mineure et décroissance.
- `https://elite-dangerous.fandom.com/wiki/Courier`, `Salvager`, `Miner`, `Assassin`, `Smuggler`, `Passenger_Carrier`
  — profils risque/récompense par famille de mission.
- `https://elite-dangerous.fandom.com/wiki/Background_Simulation` — effet des états BGS sur le tableau de missions
  (page signalée par ses propres éditeurs comme partiellement non sourcée).
- `https://elite-dangerous.fandom.com/wiki/Apex_Interstellar_Transport`, `Domino_Green` — service Apex, tarification,
  limites, correction de la condition de déblocage de Domino Green.
- `https://elite-dangerous.fandom.com/wiki/Conflict_Zone_(On_Foot)`, `Frontline_Solutions`, `Bonds` — engagement,
  intensité et paie des Ground CZ via Frontline Solutions.
- `https://www.elitedangerous.com/news/updates/4-4-0-0`, `4-4-0-2`, `4-4-0-3` — notes officielles de mise à jour,
  datation du correctif Frontline Solutions.
- `https://www.elitedangerous.com/news/powerplay-20-qa` — absence de changement documenté aux permis de système lors
  de Powerplay 2.0.
- `https://github.com/EDCD/EDMarketConnector/blob/main/stats.py` — confirmation indépendante de l'échelle Federal
  Navy (15 paliers, mêmes intitulés).
- Guide Steam Community « All Known Permits and How to Unlock Them », 28 mai 2025 — recoupement des conditions de
  permis Federation et Empire.
- `forums.frontier.co.uk` — plusieurs fils cités ponctuellement pour recouper un déblocage, une date, ou l'absence de
  titres féminisés impériaux ; voir le détail par affirmation ci-dessus.

### Sources du corpus relues pour ce guide, sans modification

- [Débuter et progresser](./27-debuter-et-progresser.md) — vue d'ensemble des huit échelles, et confirmation que
  l'absence d'échelle publiée pour le rang Mercenaire avait déjà été constatée lors du cycle précédent.
- [Vaisseaux](./03-vaisseaux.md) — table des sept vaisseaux conditionnés à un rang de marine, reprise ici sans
  modification.
- [Ingénieurs](./06-ingenieurs.md) — exemples de déblocage par réputation ou par rang de superpuissance.
- [Community Goals](./24-community-goals.md) — mécanique de cumul, et le Community Goal Alioth dont la date est
  signalée comme divergente sans être corrigée.
- [Combat à pied](./09-combat-a-pied.md) — texte déjà correct sur la date du correctif Frontline Solutions (30 juin
  vs notes du 1ᵉʳ juillet 2026) ; aucune correction requise.

### Sources tentées et inaccessibles le 12 septembre 2026

- `inara.cz` (pages de rangs Federation/Empire, permis) — erreurs HTTP 503 et contrôle anti-robot bloquant l'accès
  direct ; les fragments cités par la recherche web n'ont donc pas pu être recoupés par une lecture intégrale de la
  page.
- `edfieldmanual.com` — page d'accueil récupérée mais sans contenu exploitable localisé sur les rangs, permis ou
  mécanique de mission dans le temps imparti.
- `spacejock.com.au`, `lavewiki.com` — erreurs 403/500 ou comportement erratique de l'outil de navigation.

### Méthode et limites

Ce guide agrège des recherches indépendantes menées en parallèle par sous-thème (Federal Navy, Imperial Navy,
permis, missions/réputation, Apex/Frontline), chacune sourcée et datée séparément puis harmonisée manuellement.
Contrairement à [28-marchandises.md](./28-marchandises.md), aucune donnée n'est issue d'un script traitant un jeu de
données structuré : le sujet de ce guide (mécaniques de jeu, pas catalogue chiffré) ne s'y prête pas. Les
contradictions relevées entre sources, ou entre une source et une affirmation antérieure du corpus, sont rapportées
telles quelles plutôt que tranchées d'autorité — voir en particulier la date du Community Goal Alioth ([section 5](#5-tableau-des-systèmes-à-permis)) et
le prêt d'équipement Frontline Solutions ([section 7.2](#72-frontline-solutions--sengager-dans-une-zone-de-conflit-au-sol)).
