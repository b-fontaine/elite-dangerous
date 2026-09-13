---
id: 22-squadrons
titre: "Escadrons de joueurs (Squadrons)"
domaine: social
entites: [Squadron, Vanguards, Squadron Carrier, Squadron Bank, Squadron Browser, Squadron Leaderboards, Squadron Leader, Senior Officer, System Architect, Squadron Bar]
mots_cles_en: [squadron, vanguards, squadron carrier, squadron bank, squadron browser, squadron leaderboards, squadron leader, senior officer, permission groups, claim sniping]
version_jeu_couverte: "non déterminée — contenu arrêté au Caspian Explorer Update (2 décembre 2025), non revu depuis pour la 4.4.0.x"
branche: live
date_verification: 2026-09-10
confiance_globale: haute
volatilite: moyenne
sources_primaires: [Steam News Frontier (API ISteamNews v0002), Inara.cz annuaire des escadrons, fiche Inara de l'escadron New Pilots Initiative]
zones_incertaines:
  - "Liste complète et officielle des rangs d'escadron au-delà de Squadron Leader, Senior Officer et Recruit."
  - "Détail exact de l'interface des groupes de permissions personnalisables."
  - "Existence d'une condition de rang, d'ancienneté ou de coût pour fonder un escadron."
  - "Mécanisme précis d'affiliation formelle d'un escadron à un Power, au-delà du filtre du Squadron Browser."
  - "Catégories exactes des Squadron Leaderboards."
  - "Assimilation du Squadron Carrier à un Fleet Carrier au sens mécanique : déduction du guide, jamais énoncée telle quelle par Frontier."
guides_lies: [0, 2, 16, 21, 23]
---

# Escadrons de joueurs (Squadrons)

## En bref

Un **Squadron** (escadron) d'*Elite Dangerous* est une structure sociale persistante, comparable à une guilde, qui
regroupe jusqu'à **600 membres** depuis le Patch 1 du 22 août 2025 et accepte au maximum **25 candidatures** en
attente. Le système existe depuis 2018 et a été entièrement refondu par la saison **« Vanguards »**, lancée le
**19 août 2025** puis corrigée par trois patches (22 août, 1er et 11 septembre 2025). La refonte apporte logo,
bannière et devise (*motto*) personnalisés, un **Squadron Browser** filtrable par Power, des **Squadron
Leaderboards**, une trésorerie commune (**Squadron Bank**), des bonus sélectionnables (*perks*) et un **Squadron
Carrier** collectif que seul le **Squadron Leader** peut acheter. Un escadron peut être rattaché à une faction
mineure du Background Simulation, dont il devient le bras opérationnel. Si le Leader ne s'est pas connecté depuis
**90 jours**, un nouveau leader est tiré au sort parmi les membres actifs du rang immédiatement inférieur. En
colonisation, les membres de l'escadron du **System Architect** (l'architecte système ayant initié la colonisation) bénéficient d'une fenêtre de revendication élargie,
de **30 minutes à 24 heures** après l'achèvement du port primaire.

## Introduction — ce qu'est un Squadron (escadron) dans Elite Dangerous

Un **Squadron** (escadron) est, dans *Elite Dangerous*, une structure sociale persistante regroupant des commandants
autour d'une identité, d'un objectif ou d'une communauté commune — de quelques amis à plusieurs centaines de pilotes.
Contrairement aux **Wings** (groupes temps réel de quatre joueurs maximum en instance) ou au **Multicrew** (équipage
partagé sur un même vaisseau), un escadron n'implique aucune présence simultanée en jeu : c'est une structure
administrative et sociale, comparable à une guilde, qui persiste indépendamment des sessions de jeu de ses membres.
Pour la distinction complète entre ces différents modes de jeu en groupe, voir le guide
[Jeu en groupe : Wings, Multicrew et CQC](./23-jeu-en-groupe.md).

Le système des Squadrons existe depuis 2018, mais il a connu en août 2025 une refonte majeure baptisée
**« Elite Dangerous: Vanguards »**, présentée par Frontier Developments comme *« a full rework of Squadrons to give
you more options and customisation in managing your groups »* (une refonte complète des Squadrons pour offrir plus
d'options et de personnalisation dans la gestion de vos groupes). Ce guide couvre le système tel qu'il se présente
après cette refonte et ses trois patches correctifs (fin août - mi-septembre 2025) : création, rôles et permissions,
rattachement à une faction mineure du Background Simulation, Squadron Carrier, Squadron Bank, classements, et
visibilité.

## 1. Chronologie de la refonte « Vanguards »

Une confusion de date doit être levée d'emblée : la refonte Vanguards a eu lieu **en 2025, et non en 2024** comme
certains résumés automatisés ont pu l'indiquer par erreur. La lecture directe des horodatages Unix du flux Steam News
officiel de Frontier Developments confirme sans ambiguïté la chronologie suivante, qui recoupe également les jours de
semaine annoncés dans les billets (le teaser du 12 août 2025 annonçait un lancement « Tuesday 19th August », et le 19
août 2025 est effectivement un mardi). Cette date s'insère par ailleurs entre la sortie de la Colonisation (26 février
2025) et le Panther Clipper Mk II (22 juillet 2025) dans la chronologie déjà établie du corpus — voir
[Chronologie canonique](./00-chronologie-canonique.md).

*(Colonne **Fiab.** : code de fiabilité par ligne — P/C/E/N, voir [00-methodologie-sourcing.md §10](./00-methodologie-sourcing.md#10-la-colonne-fiab-des-tableaux-sans-attribution).)*

| Date (2025)       | Jour       | Événement                                                                 | Fiab. |
|--------------------|------------|----------------------------------------------------------------------------|-------|
| 12 août            | mardi      | Teaser officiel : « Elite Dangerous: Vanguards – Arriving 19th August »   | P     |
| 19 août            | mardi      | Lancement effectif de la saison Vanguards                                | P     |
| 22 août            | vendredi   | Vanguards Patch 1                                                         | P     |
| 1er septembre      | lundi      | Vanguards Patch 2 (annoncé pour un déploiement le 2 septembre)            | P     |
| 11 septembre       | jeudi      | Vanguards Patch 3                                                         | P     |

### 1.1 Nouveautés des Squadrons annoncées au lancement de Vanguards

Frontier a présenté les apports suivants comme le cœur de la refonte :

- un **logo et une bannière personnalisés** pour l'escadron, applicables également sur les vaisseaux des membres ;
- une **devise (« motto »)** d'escadron ;
- un **Squadron Browser** repensé pour découvrir les escadrons et leurs membres, filtrable notamment par Power
  (Powerplay) — voir la [section 7.1](#71-découverte-des-escadrons-et-filtres-du-squadron-browser) ;
- des **Squadron Leaderboards** (classements) étendus, avec de nouvelles récompenses ;
- une **Squadron Bank** pour partager des ressources entre membres ;
- un **Squadron Carrier** dédié, avec une Squadron Bank étendue pour stocker marchandises, objets et vaisseaux ;
- un système de **perks** (bonus sélectionnables par l'escadron, par exemple une assurance cargo — « Cargo
  Insurance ») ;
- des **rapports d'influence** (« Influence reports ») permettant de suivre l'impact de l'escadron sur la galaxie —
  directement liés au Background Simulation, voir [Le Background Simulation (BGS)](./21-bgs.md).

Les trois patches correctifs qui ont suivi (22 août, 1er et 11 septembre 2025) ont surtout corrigé des bugs et ajusté
des plafonds numériques ; ils sont détaillés dans les sections correspondantes ci-dessous.

## 2. Créer un escadron

### 2.1 Champs obligatoires à la création d'un escadron

Les notes du Patch 3 confirment explicitement, via la description d'un correctif (« Fixed squadron not being created
if motto, mission statement, and application requirements are blank »), les champs requis pour fonder un escadron :
en plus du logo et de la bannière, un escadron doit comporter :

- une **devise** (motto) ;
- une **déclaration de mission** (mission statement) ;
- des **conditions de candidature** (application requirements).

Ces trois champs ne peuvent pas être laissés vides — le jeu refusait auparavant la création dans ce cas, ce que le
Patch 3 a corrigé pour éviter une confirmation silencieuse en échec.

> **Point non confirmé.** Aucune source primaire consultée ne précise s'il existe une condition de rang, d'ancienneté
> ou de coût pour fonder un escadron. La compréhension communautaire générale est que la création est gratuite et
> ouverte à tout commandant, mais ce point n'a pas pu être vérifié via une note de patch ou une page officielle dans
> cet environnement — à confirmer en jeu ou sur une source officielle avant de l'affirmer comme un fait établi.

### 2.2 Filtrage anti-injures des textes libres d'escadron

Le motto, la description de l'escadron et les messages de recrutement sont soumis à un filtre anti-injures
(« profanity filtering »). Les notes du Patch 1 confirment que ce filtre, jugé trop restrictif au lancement, a été
assoupli pour autoriser explicitement « commas and accented characters » (les virgules et les caractères accentués) —
un ajustement bienvenu pour un jeu à forte communauté francophone et plus largement non anglophone.

### 2.3 Limites numériques d'un escadron : 600 membres, 25 candidatures en attente

Les notes officielles du Patch 1 confirment verbatim les deux relèvements de plafond suivants :

| Paramètre                                   | Avant Vanguards | Depuis le Patch 1 (22 août 2025) | Fiab. |
|----------------------------------------------|-----------------|-----------------------------------|-------|
| Taille maximale d'un escadron                | 500 membres     | **600 membres**                   | P     |
| Candidatures en attente maximum              | 10              | **25**                            | P     |

Ces deux plafonds réapparaissent identiques dans les notes du « Caspian Explorer Update » (2 décembre 2025), ce qui
confirme qu'ils sont restés stables plusieurs mois après la refonte.

## 3. Rôles, permissions et gouvernance d'un escadron

### 3.1 Rangs d'escadron : Squadron Leader, Senior Officer, Recruit

Les notes de patch confirment explicitement l'existence des rangs suivants, du plus élevé au plus bas :

- **Squadron Leader** — rang le plus élevé. C'est le seul habilité à **acheter un Squadron Carrier** et à gérer les
  commandes d'achat du bar embarqué (voir [section 6.3](#63-services-embarqués-dun-squadron-carrier-vista-genomics-pioneer-supplies-bar)). Les notes du Patch 2 le confirment explicitement en corrigeant
  un bug : « Fixed Senior Officers of Squadrons incorrectly having the ability to purchase Squadron Carriers,
  resulting in an error and disconnect. Only Squadron Leaders should have this ability. »
- **Senior Officer** — rang intermédiaire, disposant de capacités de gestion étendues mais pas de celles réservées au
  Leader.
- **Recruit** — rang d'entrée observé sur les fiches d'escadron d'Inara.cz.

Un ou plusieurs rangs intermédiaires supplémentaires existent probablement entre Senior Officer et Recruit (le jeu
proposait historiquement une hiérarchie à plusieurs niveaux), mais leur dénomination exacte n'a pas pu être confirmée
via les sources consultées.

Le **rang le plus bas d'un escadron est explicitement exclu de la succession de leadership** (« The lowest rank
within a squadron will not be eligible for leadership transfer ») — voir la mécanique de succession automatique en
[section 3.3](#33-succession-automatique-du-squadron-leader-après-90-jours-dinactivité).

### 3.2 Groupes de permissions personnalisables d'un escadron

Au-delà de la hiérarchie de rangs, un système de **« permission groups »** (groupes de permissions) personnalisables permet d'attribuer des
droits de gestion plus fins que le simple rang. Ce système a été retravaillé pendant la saison Vanguards : un bug de
crash « when editing permission groups for a Squadron » a été corrigé au Patch 2, ce qui indique un remaniement actif
de cette fonctionnalité durant la refonte. Par ailleurs, depuis le Patch 1, le **propriétaire fondateur** de
l'escadron ne peut plus retirer ses propres permissions de gestion par erreur (« Squadron owners may no longer remove
their own management permissions »). Le « Type-11 Prospector Update » (29 septembre 2025) a par ailleurs corrigé un
bug empêchant certains Squadron Leaders d'éditer les permissions de rang (« Fixed instances of Squadron Leaders being
unable to edit rank permissions »).

> **Point à approfondir.** Le détail exact de l'interface des groupes de permissions (quelles actions sont
> attribuables individuellement, combien de groupes personnalisés sont possibles) n'a pas pu être confirmé par une
> source primaire consultable dans cet environnement. À vérifier directement en jeu ou via une capture d'écran
> officielle avant de documenter plus précisément cette interface.

### 3.3 Succession automatique du Squadron Leader après 90 jours d'inactivité

La refonte Vanguards a introduit, au Patch 3 (11 septembre 2025), une mécanique de **succession automatique** destinée
à éviter qu'un escadron reste bloqué avec un Squadron Leader inactif indéfiniment. Son fonctionnement, confirmé
verbatim dans les notes de patch :

1. À chaque maintenance hebdomadaire, le jeu vérifie si le Squadron Leader s'est connecté au cours des **90 derniers
   jours**.
2. Si ce n'est pas le cas, un message in-game est envoyé à tous les membres du rang immédiatement inférieur qui se
   sont eux-mêmes connectés dans la semaine écoulée, les informant que le leader a jusqu'à la prochaine maintenance
   hebdomadaire pour se reconnecter.
3. Si le Leader se reconnecte dans cette fenêtre, le processus est annulé.
4. Si aucun membre actif n'est trouvé au rang immédiatement inférieur, le rang suivant est vérifié, et ainsi de suite.
5. Si le Leader ne s'est toujours pas reconnecté avant la maintenance suivante, un **nouveau leader est tiré au sort**
   parmi les membres actifs ayant reçu le message.
6. Le **rang le plus bas de l'escadron n'est jamais éligible** à cette succession.
7. Si aucun membre actif n'est trouvé à aucun rang éligible, l'escadron est marqué **« Inactive »** — ce qui ne change
   rien d'autre que de le masquer du Squadron Browser public — et redevient visible dès qu'un de ses membres se
   reconnecte.
8. Le nouveau leader désigné par tirage au sort peut ensuite retransférer librement le leadership à un autre membre
   via l'interface **« Roster »** (liste des membres).
9. Frontier précise que pour les escadrons dont le leader était déjà inactif depuis plus de 90 jours au moment du
   Patch 3, ce processus démarre immédiatement.

Cette mécanique est directe pour tout escadron important, mais elle intervient également en toile de fond de la
mécanique de colonisation décrite en [section 4.2](#42-colonisation--la-fenêtre-de-revendication-à-léchelle-de-lescadron), où l'appartenance à un escadron — même réduit à un seul membre — a
un effet concret sur le jeu.

## 4. Escadron et Background Simulation (BGS)

### 4.1 Rattachement d'un escadron à une faction mineure du BGS

Un escadron peut être associé à une **faction mineure** du Background Simulation, généralement portant le même nom.
C'est le cas, par exemple, de l'escadron « New Pilots Initiative » sur Inara.cz, dont la fiche affiche un champ
« Related minor faction » distinct. Ce rattachement permet à un escadron de fonctionner comme le bras opérationnel
d'une faction mineure : les activités de ses membres (missions, ventes, assassinats, dons de faction) contribuent à
l'influence de cette faction dans les systèmes où elle est présente. Pour le détail complet du fonctionnement du BGS
(états de faction, expansion, influence), voir [Le Background Simulation (BGS)](./21-bgs.md).

### 4.2 Colonisation : la fenêtre de revendication à l'échelle de l'escadron

Le lien le plus concret et le mieux documenté entre Squadrons et BGS concerne la **colonisation de systèmes**. Les
notes officielles du « Type-11 Prospector Update 2 » (16 octobre 2025) décrivent verbatim un nouveau mécanisme
anti-« claim sniping » (l'accaparement précoce d'une revendication par un tiers) : lorsque le port primaire est achevé dans un système nouvellement colonisé, la priorité de
revendication (« claim ») suit la temporalité suivante :

| Délai depuis l'achèvement du port primaire | Qui peut revendiquer le système                          | Fiab. |
|----------------------------------------------|-----------------------------------------------------------|-------|
| 0 à 30 minutes                                | Le **System Architect** exclusivement (le commandant à l'origine de la colonisation) | P |
| 30 minutes à 24 heures (soit 23,5 heures de fenêtre) | **Tous les membres de l'escadron** du System Architect | P |
| Au-delà de 24 heures                          | N'importe quel commandant                                  | P     |

Frontier précise explicitement que cette extension de la fenêtre de revendication à l'escadron s'applique **« even if
the System Architect is in their own solo Squadron »** — c'est-à-dire même lorsque l'escadron concerné ne compte
qu'un seul membre — et que si le System Architect n'appartient à aucun escadron, seul le verrou de 30 minutes
s'applique (« if the System Architect is not in a squadron, then only the 30 minute lockout applies »). C'est un
point à connaître pour tout joueur ou groupe se lançant dans la colonisation en solo ou en petit comité : créer un
escadron, même personnel, avant de lancer une colonisation peut sécuriser un délai de revendication supplémentaire
pour des alliés. Le panneau de revendication accessible depuis le contact de colonisation affiche désormais également
si un verrou est actif et la durée restante.

### 4.3 Escadron et Powerplay

Le lien formel entre Squadrons et **Powerplay** reste plus limité dans les sources disponibles. Le Squadron Browser
repensé par Vanguards permet de filtrer les escadrons par **Power** (personnage politique soutenu), et les fiches
d'escadron sur Inara.cz affichent également un champ « Power ». Le mécanisme précis d'affiliation formelle d'un
escadron à un Power — au-delà de ce filtre de recherche et d'affichage — n'a pas pu être détaillé davantage à partir
des sources consultées. Pour le fonctionnement complet de Powerplay (Powers, mérites, systèmes Stronghold), voir
[Politique et Powerplay](./02-powerplay.md).

## 5. La Squadron Bank, trésorerie commune de l'escadron

La **Squadron Bank** est la trésorerie commune de l'escadron : elle permet aux membres de mutualiser des ressources
(crédits) pour financer des projets collectifs. Depuis le Patch 2 (1er septembre 2025), le solde du Squadron Carrier
lui-même est directement rattaché à la Squadron Bank (« Carrier balance is now accessible via the Squadron Bank »), et
les membres peuvent y contribuer directement pour financer l'achat ou l'entretien du porte-vaisseaux d'escadron — voir
[section 6](#6-squadron-carrier).

## 6. Squadron Carrier

### 6.1 Le Squadron Carrier, porte-vaisseaux collectif de l'escadron

Le **Squadron Carrier** est un porte-vaisseaux dédié à l'escadron, financé et géré via la Squadron Bank. Il offre un
stockage étendu pour les marchandises, les objets et les vaisseaux des membres. D'après les fonctionnalités décrites
dans les notes de patch — livrée (« Livery ») personnalisable, service de chantier naval (« shipyard ») activable ou
désactivable, procédures d'achat et de « decommissioning » (décommissionnement) calquées sur celles d'un Fleet Carrier personnel, et des
restrictions d'accostage spécifiques ajoutées au « Type-11 Prospector Update » (« Added additional docking
restrictions on Squadron Fleet Carriers ») — le Squadron Carrier apparaît, avec une forte probabilité mais sans
qu'une phrase officielle unique ne l'énonce explicitement, comme un **Fleet Carrier au sens mécanique**, simplement
possédé et financé collectivement par l'escadron plutôt qu'individuellement par un seul commandant. Pour le
fonctionnement général des Fleet Carriers, voir le guide dédié [19-fleet-carriers.md](./19-fleet-carriers.md).

### 6.2 Achat d'un Squadron Carrier : une prérogative du Squadron Leader

Seul le **Squadron Leader** peut acheter un Squadron Carrier (voir [section 3.1](#31-rangs-descadron--squadron-leader-senior-officer-recruit)). Un bug corrigé au Patch 2 avait
permis par erreur aux Senior Officers d'effectuer cet achat, provoquant une erreur et une déconnexion ; ce
comportement a été confirmé non intentionnel et corrigé, ce qui fixe cette prérogative comme réservée au rang le plus
élevé de l'escadron.

### 6.3 Services embarqués d'un Squadron Carrier (Vista Genomics, Pioneer Supplies, Bar)

Les services disponibles à bord d'un **Squadron Carrier** ont été déployés progressivement pendant la saison Vanguards :

- **Vista Genomics** et **Pioneer Supplies**, activables dès le Patch 1 (22 août 2025) ;
- un **Bar** avec service de « Bartender », ajouté au Patch 2 (1er septembre 2025) — la gestion des commandes d'achat
  de ce bar est réservée au Squadron Leader, comme pour l'achat du Carrier lui-même.

## 7. Squadron Browser, recrutement et visibilité

### 7.1 Découverte des escadrons et filtres du Squadron Browser

Le **Squadron Browser**, entièrement repensé par Vanguards, permet de rechercher des escadrons et leurs membres selon
plusieurs critères, dont le **Power** soutenu (Powerplay). C'est l'outil principal pour trouver un escadron à
rejoindre ou évaluer sa propre visibilité auprès des autres commandants. Le Patch 1 a par ailleurs corrigé des erreurs
de filtrage du Squadron Browser lorsque le nom d'un Power soutenu contenait certains caractères spéciaux.

### 7.2 Visibilité et confidentialité d'un escadron (Private, Squadron only)

Depuis le Patch 2, un escadron peut définir sa **visibilité** parmi plusieurs niveaux, dont « Private » et « Squadron
only », qui masquent la localisation et d'autres détails aux commandants non-membres. Cette option est particulièrement
pertinente pour un groupe d'amis souhaitant jouer discrètement sans exposer ses activités au grand public — voir
[Jeu en groupe : Wings, Multicrew et CQC](./23-jeu-en-groupe.md) pour l'articulation entre cette confidentialité
d'escadron et les autres outils de jeu privé entre amis (Private Groups, invitations directes en Wing).

## 8. Classements (Squadron Leaderboards)

La refonte Vanguards a introduit des **Squadron Leaderboards** (classements d'escadron) étendus, avec de nouvelles
récompenses associées au classement.
Les catégories précises de ces classements (par exemple par combat, exploration, commerce ou contribution au BGS,
comme c'était le cas avant la refonte) n'ont pas pu être confirmées verbatim à partir des sources consultées ; ce
point est à vérifier directement en jeu, dans l'onglet dédié aux classements de l'interface Squadron.

## 9. Plafonds et limites d'un escadron — récapitulatif

| Paramètre                                      | Valeur (depuis le Patch 1, 22 août 2025) | Fiab. |
|-------------------------------------------------|--------------------------------------------|-------|
| Taille maximale d'un escadron                   | 600 membres                                 | P     |
| Candidatures en attente maximum                 | 25                                           | P     |
| Rang habilité à acheter un Squadron Carrier     | Squadron Leader uniquement                  | P     |
| Rang exclu de la succession de leadership       | Le rang le plus bas de l'escadron           | P     |
| Délai d'inactivité déclenchant la succession    | 90 jours sans connexion du Leader           | P     |
| Fenêtre de revendication exclusive (colonisation) | 30 minutes (System Architect seul)        | P     |
| Fenêtre de revendication élargie à l'escadron   | 23,5 heures supplémentaires (30 min à 24h)  | P     |

## 10. Outils communautaires pour les escadrons (annuaire Inara.cz)

**[Inara.cz](https://inara.cz/elite/squadrons/)** maintient un annuaire complet des escadrons du jeu, avec recherche
et tri par nombre de membres actifs, filtrage par allégeance, Power, langue ou fuseau horaire. Chaque fiche d'escadron
y détaille les effectifs, l'activité récente des membres, la faction mineure éventuellement liée, ainsi que des
documents internes que certains escadrons y publient (guide de prise en main, notes d'ingénierie). C'est la ressource
externe la plus pratique pour trouver un escadron actif correspondant à ses préférences de jeu, ou pour évaluer la
santé d'un escadron avant de le rejoindre. Voir aussi [Outils](./16-outils.md) pour le panorama complet des outils
communautaires disponibles sur *Elite Dangerous*.

## Points d'incertitude à vérifier sur les Squadrons

Les points suivants n'ont pas pu être confirmés par une source primaire accessible depuis l'environnement de
recherche (elitedangerous.com, forums.frontier.co.uk et le wiki Fandom ont de nouveau systématiquement renvoyé des
erreurs 403/402 lors de cette session) et méritent une vérification humaine directe en jeu ou via une capture d'écran
officielle avant d'être présentés comme des faits établis :

- la liste complète et officielle de tous les rangs d'escadron au-delà de Squadron Leader, Senior Officer et Recruit ;
- le détail exact de l'interface des groupes de permissions personnalisables introduits ou retravaillés par Vanguards ;
- une éventuelle condition de rang, d'ancienneté ou de coût pour fonder un escadron ;
- le mécanisme précis d'affiliation formelle d'un escadron à un Power, au-delà du simple filtre de recherche du
  Squadron Browser ;
- les catégories exactes des Squadron Leaderboards.

## Questions fréquentes

**Combien de membres maximum peut avoir un escadron (squadron) ?**

Depuis le Patch 1 de la refonte Vanguards (22 août 2025), un escadron peut compter jusqu'à **600 membres** (contre 500
auparavant) et accepter au maximum **25 candidatures** en attente (contre 10 auparavant). Ces deux plafonds sont
réapparus identiques dans les notes du Caspian Explorer Update (2 décembre 2025). Voir
[2.3 Limites numériques d'un escadron](#23-limites-numériques-dun-escadron--600-membres-25-candidatures-en-attente).

**Qui a le droit d'acheter un Squadron Carrier ?**

Seul le **Squadron Leader** peut acheter un Squadron Carrier. Un bug corrigé au Patch 2 (1er septembre 2025) permettait
par erreur aux Senior Officers de le faire, ce qui provoquait une erreur et une déconnexion ; cette prérogative est
désormais confirmée comme réservée au rang le plus élevé de l'escadron. Voir
[6.2 Achat d'un Squadron Carrier](#62-achat-dun-squadron-carrier--une-prérogative-du-squadron-leader).

**Quand est sortie la refonte Vanguards des escadrons (squadrons) ?**

La saison **« Vanguards »** a été lancée le **19 août 2025** (un mardi) — en 2025, et non en 2024 comme certains
résumés automatisés l'ont indiqué par erreur — puis corrigée par trois patches : le 22 août, le 1er septembre et le 11
septembre 2025. Voir [1. Chronologie de la refonte Vanguards](#1-chronologie-de-la-refonte--vanguards-).

**Que se passe-t-il si le chef de mon escadron (Squadron Leader) ne se connecte plus ?**

Si le Squadron Leader ne s'est pas connecté depuis **90 jours**, un message in-game est envoyé aux membres actifs du
rang immédiatement inférieur ; s'il ne se reconnecte pas avant la maintenance hebdomadaire suivante, un nouveau leader
est **tiré au sort** parmi eux. Le rang le plus bas de l'escadron n'est jamais éligible à cette succession. Voir
[3.3 Succession automatique du Squadron Leader](#33-succession-automatique-du-squadron-leader-après-90-jours-dinactivité).

**Un escadron peut-il être rattaché à une faction mineure du BGS ?**

Oui : un escadron peut être associé à une faction mineure du Background Simulation portant généralement le même nom —
c'est le cas de l'escadron « New Pilots Initiative » sur Inara.cz — et fonctionne alors comme son bras opérationnel,
les activités de ses membres contribuant à l'influence de cette faction. Voir
[4.1 Rattachement à une faction mineure](#41-rattachement-dun-escadron-à-une-faction-mineure-du-bgs).

**Comment fonctionne la fenêtre de revendication (claim) d'un système en colonisation pour un escadron ?**

Une fois le port primaire achevé, le **System Architect** dispose de **30 minutes** d'exclusivité ; puis, jusqu'à
**24 heures** après l'achèvement (soit 23,5 heures de fenêtre supplémentaire), tous les membres de son escadron
peuvent revendiquer le système, même s'il s'agit d'un escadron solo. Au-delà de 24 heures, n'importe quel commandant
le peut. Voir
[4.2 La fenêtre de revendication à l'échelle de l'escadron](#42-colonisation--la-fenêtre-de-revendication-à-léchelle-de-lescadron).

**À quoi sert la Squadron Bank ?**

C'est la trésorerie commune de l'escadron, qui permet aux membres de mutualiser des crédits pour financer des projets
collectifs. Depuis le Patch 2 (1er septembre 2025), le solde du Squadron Carrier lui-même y est directement rattaché,
ce qui permet d'y contribuer pour financer son achat ou son entretien. Voir
[5. La Squadron Bank](#5-la-squadron-bank-trésorerie-commune-de-lescadron).

**Comment trouver un escadron à rejoindre (Squadron Browser) ?**

Le **Squadron Browser**, entièrement repensé par Vanguards, permet de rechercher des escadrons et leurs membres selon
plusieurs critères, dont le Power soutenu en Powerplay. L'annuaire communautaire Inara.cz propose en complément un tri
par nombre de membres actifs, allégeance, langue ou fuseau horaire. Voir
[7.1 Découverte des escadrons et filtres du Squadron Browser](#71-découverte-des-escadrons-et-filtres-du-squadron-browser).

**Peut-on rendre son escadron privé ou invisible aux autres joueurs ?**

Oui : depuis le Patch 2, un escadron peut choisir un niveau de visibilité parmi plusieurs, dont **« Private »** et
**« Squadron only »**, qui masquent sa localisation et d'autres détails aux commandants non-membres. Voir
[7.2 Visibilité et confidentialité d'un escadron](#72-visibilité-et-confidentialité-dun-escadron-private-squadron-only).

**Quels sont les rangs (ranks) dans un escadron ?**

Les rangs confirmés, du plus élevé au plus bas, sont **Squadron Leader** (seul habilité à acheter un Squadron
Carrier), **Senior Officer** (capacités de gestion étendues) et **Recruit** ; un ou plusieurs rangs intermédiaires
existent probablement mais leur dénomination exacte n'a pas pu être confirmée par les sources consultées. Voir
[3.1 Rangs d'escadron](#31-rangs-descadron--squadron-leader-senior-officer-recruit).

**Quels champs sont obligatoires pour créer un escadron ?**

Un escadron doit obligatoirement comporter un logo, une bannière, une **devise** (motto), une **déclaration de
mission** (mission statement) et des **conditions de candidature** (application requirements) ; ces trois derniers
champs ne peuvent plus être laissés vides depuis la correction apportée par le Patch 3. Voir
[2.1 Champs obligatoires à la création](#21-champs-obligatoires-à-la-création-dun-escadron).

**Est-ce gratuit de fonder un escadron (squadron) ?**

Ce point n'est pas confirmé par une source primaire consultée : la compréhension communautaire générale est que la
création est gratuite et ouverte à tout commandant, mais aucune note de patch ou page officielle ne le confirme
explicitement, ni ne mentionne une éventuelle condition de rang, d'ancienneté ou de coût. Voir
[2.1 Champs obligatoires à la création](#21-champs-obligatoires-à-la-création-dun-escadron).

## Voir aussi

- [Politique et Powerplay](./02-powerplay.md) — fonctionnement complet de Powerplay, dont le filtrage par Power du
  Squadron Browser ([section 7.1](#71-découverte-des-escadrons-et-filtres-du-squadron-browser)) n'est qu'un point de contact.
- [Le Background Simulation (BGS)](./21-bgs.md) — mécanique complète des factions mineures, de l'influence et de leur
  articulation avec la colonisation évoquée en [section 4](#4-escadron-et-background-simulation-bgs).
- [Jeu en groupe : Wings, Multicrew et CQC](./23-jeu-en-groupe.md) — distinction avec les Squadrons (structure
  persistante) et les autres formes de jeu en groupe (temps réel, session par session).
- [Chronologie canonique](./00-chronologie-canonique.md) — repères de dates officielles pour tout le corpus, dont la
  saison Vanguards.
- [Outils](./16-outils.md) — panorama des outils communautaires, dont l'annuaire d'escadrons d'Inara.cz.
- [Glossaire](./00-glossaire.md) — sigles utilisés dans ce guide (BGS, PP, bartender).

## Sources

- https://api.steampowered.com/ISteamNews/GetNewsForApp/v0002/?appid=359320 (flux officiel Steam News d'Elite
  Dangerous, billets Frontier Developments republiés verbatim — récupéré directement au format JSON avec horodatages
  Unix exacts. Billets utilisés : « Elite Dangerous: Vanguards - Arriving 19th August » du 12/08/2025, « Elite
  Dangerous | Vanguards » du 19/08/2025, « Elite Dangerous: Vanguards Patch 1 » du 22/08/2025, « Elite Dangerous:
  Vanguards | Patch 2 » du 01/09/2025, « Elite Dangerous: Vanguards Patch 3 » du 11/09/2025, « Elite Dangerous:
  Type-11 Prospector Update » du 29/09/2025, « Type-11 Prospector Update 2 » du 16/10/2025, « Elite Dangerous:
  Caspian Explorer Update » du 02/12/2025)
- https://inara.cz/elite/squadrons/ (annuaire communautaire des escadrons, colonnes et filtres consultés directement)
- https://inara.cz/elite/squadron/5068/ (fiche de l'escadron « New Pilots Initiative », champ « Related minor
  faction » et champ « Power » confirmés)

> **Note sur les sources.** L'essentiel du contenu factuel de ce guide provient du flux officiel de mise à jour de
> Frontier Developments sur Steam News, récupéré directement au format JSON brut (horodatages Unix exacts, contenus
> intégraux des billets « Vanguards », « Vanguards Patch 1 », « Patch 2 », « Patch 3 », « Type-11 Prospector Update »
> et « Type-11 Prospector Update 2 »), ainsi que de la base communautaire [Inara.cz](https://inara.cz/elite/squadrons/).
> Cette récupération directe a permis de confirmer verbatim l'ensemble des dates, plafonds numériques et mécaniques
> détaillés dans ce guide. Les pages officielles elitedangerous.com, le forum Frontier et le wiki Fandom restent en
> revanche inaccessibles depuis l'environnement de recherche (erreurs 403/402 systématiques, y compris via des
> méthodes de contournement). Certains points de détail — liste exhaustive des rangs, mécanique fine des groupes de
> permissions, catégories précises des classements, mécanisme formel d'affiliation à un Power — n'ont donc pas pu
> être vérifiés via une source primaire directement consultable ; ils sont signalés comme tels dans le texte et
> rassemblés en fin de guide.

> **Note méthodologique.** elitedangerous.com (page /news), forums.frontier.co.uk et elite-dangerous.fandom.com ont
> de nouveau renvoyé des erreurs HTTP 403/402 lors des tentatives d'accès directes effectuées pendant cette session de
> finalisation, confirmant l'indisponibilité déjà constatée précédemment. En revanche, l'accès direct au flux JSON
> brut de l'API Steam News (plutôt qu'à une page HTML tierce le résumant) a permis de vérifier verbatim l'ensemble des
> dates, plafonds numériques et mécaniques de jeu cités dans ce guide, y compris ceux qu'une vérification
> contradictoire antérieure avait signalés comme douteux faute d'accès web à ce moment-là.
