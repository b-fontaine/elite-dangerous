---
id: 13-operations
titre: "Elite Dangerous : Guide complet des Opérations — mode multijoueur (2026) et gameplay à pied (Odyssey)"
domaine: combat
entites: [Operations, Operation Runner, Merc Coin, MercGear, Under Siege, Tactical Takedown, Firestorm Rescue, settlement, zone de conflit au sol, Odyssey, Nomad, Profile Analyser]
mots_cles_en: [operations, operation runner, merc coin, mercgear, under siege, tactical takedown, on-foot combat zone, settlement, odyssey, matchmaking, powerplay mode]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-13
confiance_globale: haute
volatilite: haute
sources_primaires: [Steam News Frontier (API ISteamNews), ticket EDCD/EDDI n° 2849, Wikipedia Elite Dangerous, EDSM, Canonn Research, Steam Community Guides]
zones_incertaines:
  - "Plafond de 9 999 Merc Coins et gain limité à 1 000 par semaine : donnée communautaire jamais publiée par Frontier, à confirmer en jeu."
  - "Correspondance entre les six scénarios annoncés le 22 avril 2026 et les six opérations du lancement : rapprochement éditorial, sans table officielle."
  - "Table des récompenses des opérations au sol par niveau de menace : ordres de grandeur communautaires non vérifiés en session."
  - "Numéros de version client 4.4.0.0 et 4.4.0.3 : relevés communautaires de journaux de jeu, non officiels."
  - "Spécialités des quatre Engineers à pied de Colonia, non détaillées dans les sources consultées."
  - "Aucun build nommé recoupé pour le fabricant d'armes Takada."
guides_lies: [0, 2, 6, 7, 9, 14, 18, 23, 26, 29]
---

# Elite Dangerous : Guide complet des Opérations — mode multijoueur (2026) et gameplay à pied (Odyssey)

## En bref

Deux contenus d'*Elite Dangerous* portent le nom « Operations ». Le **mode Operations** (multijoueur) est une couche
de gameplay en escouade sortie le **30 juin 2026**, ses notes de version étant publiées le **1ᵉʳ juillet 2026** :
jusqu'à **4 commandants** enchaînent les étapes d'un scénario instancié, lancé depuis un tableau de missions et
desservi par l'**Operation Runner**, qui sert de hub, de point de réapparition et d'extraction. **Sept opérations**
existent — *Tactical Takedown*, *Firestorm Rescue*, *Reclamation Point*, *Biohazard Takedown*, *Rapid Response*,
*Terminal Prosecution*, puis *Under Siege* ajoutée le 2 septembre 2026 —, jouables en mode **Mercenary** ou
**Powerplay** (déstabilisation, *undermining*, uniquement). Elles rapportent crédits, matériaux, mérites et **Merc
Coin**, monnaie gagnée en jeu et non achetable en Arx, qui donne accès au catalogue **MercGear** de quinze modules de
vaisseau et blueprints pré-ingénierés. Les **opérations au sol** désignent, elles, le gameplay à pied d'**Odyssey**
(19 mai 2021) : settlements (installations au sol) classés par activité économique et par niveau de sécurité, huit
familles de missions, infiltration et piratage au *Suit Tool* (emplacement d'outil de combinaison), zones de conflit
à pied et combinaisons Dominator, Maverick et Artemis.

## Vue d'ensemble — deux contenus nommés « Operations » à ne pas confondre

Deux contenus distincts d'*Elite Dangerous* portent le nom « Operations ». Ils n'ont ni la même date, ni le même
périmètre, ni les mêmes mécaniques, et les confondre est la principale source d'erreur sur ce sujet. Ce guide les
documente tous les deux, en les séparant explicitement :

| Sens du mot « Operations »            | De quoi il s'agit                                                                          | Date de mise en service | Où le lire ici                                                         |
|---------------------------------------|--------------------------------------------------------------------------------------------|-------------------------|------------------------------------------------------------------------|
| **Le mode Operations** (multijoueur)  | Couche de gameplay en escouade : scénarios instanciés, Operation Runner, Merc Coin         | 30 juin 2026            | [Partie A](#partie-a--le-mode-operations-multijoueur-en-escouade-2026) |
| **Les opérations au sol** (*on-foot*) | Gameplay à pied d'*Odyssey* : settlements, missions, infiltration, zones de conflit à pied | 19 mai 2021             | [Partie B](#partie-b--les-opérations-au-sol-dodyssey)                  |

Le mode Operations est un contenu **multijoueur en escouade** livré par la mise à jour du même nom, dont les notes de
version officielles ont été publiées le **1er juillet 2026** (« Operations Update », 1er juillet 2026 14:01 UTC). Les
opérations au sol, elles, désignent l'ensemble du gameplay à pied introduit avec l'extension **Odyssey**, lancée le
**19 mai 2021** sur PC : quitter son vaisseau pour explorer des installations planétaires (« settlements »),
interagir avec elles via des tableaux de mission locaux, combattre en vue première personne, s'infiltrer, pirater des
systèmes informatiques et remplir des contrats allant du simple sabotage à l'assassinat ciblé.

Les deux se recoupent sur un point pratique : les Operations se lancent depuis les **tableaux de missions**, les
mêmes que ceux qui distribuent les contrats au sol, et plusieurs scénarios d'Operations se déroulent en tout ou
partie à pied. Les mécaniques de détection, d'équipement et d'ingénierie décrites en partie B restent donc
directement utiles à qui joue le mode de la partie A.

## Partie A — Le mode Operations (multijoueur en escouade, 2026)

### Chronologie officielle du mode Operations (avril 2026 – septembre 2026)

Toutes les dates ci-dessous proviennent des billets d'annonce publiés par Frontier Developments sur le flux
d'actualités officiel du jeu.

| Date et heure (UTC)     | Billet officiel Frontier          | Ce que le billet établit                                                                                             |
|-------------------------|-----------------------------------|----------------------------------------------------------------------------------------------------------------------|
| 22 avril 2026, 14:02    | « An Update on Operations »       | Report de la sortie d'Operations, « which will now be arriving in June » ; présentation détaillée du système à venir |
| 2 juin 2026, 13:03      | « Discover the Nomad »            | Confirme la fenêtre de sortie : le Nomad arrivera « in ARX Early Access alongside Operations on 30th June »          |
| 1er juillet 2026, 14:01 | « Operations Update »             | Notes de version complètes : « The Operations Update is here » — six opérations, Operation Runner, Merc Coin, Nomad  |
| 9 juillet 2026, 10:24   | « Operations Update \| Update 3 » | Correctifs, restitution des récompenses d'Operations et des inventaires à pied manquants                             |
| 2 septembre 2026, 11:20 | « Rhino SRV Update »              | Ajoute une septième opération, « Under Siege », et corrige plusieurs points touchant les Operations et le MercGear   |

Deux précisions de lecture :

- Le billet du 9 juillet 2026 s'intitule « Operations Update | Update 3 » mais son texte annonce « The Operations
  Update 2 is now live ». Cette incohérence est présente telle quelle dans le billet officiel ; elle n'affecte pas le
  contenu du correctif, décrit plus bas.
- Les **numéros de version du client** correspondants (4.4.0.0 au 30 juin 2026, 4.4.0.3 au 9 juillet 2026) ne
  proviennent pas des billets Frontier mais des journaux de jeu relevés par la communauté technique (ticket EDCD/EDDI
  n° 2849 du 5 août 2026) — donnée **communautaire**, utile pour dater un journal, à ne pas présenter comme
  officielle.

### Principe du mode Operations : une couche de gameplay en escouade jusqu'à 4 commandants

Le mode Operations ajoute, selon les notes de version du 1er juillet 2026, « une nouvelle couche de gameplay à haute
intensité, centrée sur l'escouade, articulée autour du travail d'équipe, de la coordination et de l'exécution
tactique ». Le billet du 22 avril 2026 précise la structure : un **système d'opérations en plusieurs étapes**, conçu
pour le jeu en escouade, permettant à **jusqu'à 4 commandants** d'enchaîner des défis de difficulté croissante et
d'en tirer des récompenses.

Chaque opération se déroule dans son **environnement isolé dédié** et comporte **plusieurs étapes** de difficultés
variables — ce n'est donc pas une activité de la galaxie persistante mais un scénario instancié, ce qui explique le
transport préalable de l'escouade décrit ci-dessous.

### Lancer une opération Operations : escouade, appariement et accès depuis les tableaux de missions

- **Point d'accès** : les Operations sont accessibles depuis les **tableaux de missions**, à quai dans un starport,
  sur un Fleet Carrier ou sur un Squadron Carrier (« An Update on Operations », 22 avril 2026).
- **Composition de l'équipe** : une opération peut être lancée « soit par un commandant seul, soit par une escouade
  déjà constituée, avec un appariement (*matchmaking*) optionnel pour compléter les places restantes » (« Operations
  Update », 1er juillet 2026). La mise à jour introduit à cet effet « un tout nouveau système de lobby et
  d'appariement ».
- **Invitations** : le chef d'escouade peut inviter d'autres commandants, mais doit être **à quai** pour sélectionner
  une opération et envoyer une invitation. Les membres n'ont pas besoin d'être au même endroit : une escouade peut se
  former à l'échelle de la galaxie, tous ses membres étant ensuite transférés vers l'Operation Runner avant le début
  du scénario.
- **Rejoindre via l'appariement** : il faut également être à quai pour accéder aux annonces d'escouades ouvertes dans
  le menu Operations. Un commandant qui sélectionne une annonce sans être à quai voit sa place **réservée** jusqu'à
  ce qu'il accoste.

### L'Operation Runner — vaisseau de déploiement, de réapparition et d'extraction

Une fois l'opération lancée, « tous les commandants sont transportés à bord du nouvel **Operation Runner**, un
vaisseau de déploiement spécialisé qui emmène l'équipe directement vers le système du scénario » (« Operations
Update », 1er juillet 2026). Le billet du 22 avril 2026 en détaille le rôle, qui va au-delà du simple transport :

- il sert de **hub central** et de point d'entrée de l'escouade dans l'opération ;
- il fait office de **point de réapparition** : un commandant mis hors de combat pendant n'importe quelle étape y
  revient automatiquement, son vaisseau étant alors **entièrement réparé, ravitaillé en carburant et réarmé** avant
  redéploiement ;
- il constitue le **point d'extraction final** de l'opération ;
- sa position dans chaque scénario est choisie pour raccourcir le trajet de retour vers l'objectif.

### Les sept opérations disponibles, de Tactical Takedown à Under Siege

Six opérations étaient disponibles au lancement, « et nous en avons d'autres de prévues pour de futures mises à
jour » (« Operations Update », 1er juillet 2026) ; une septième a été ajoutée le 2 septembre 2026.

| Opération                | Scénario (d'après les notes officielles)                                                                                                                                                                                                                       | Ajoutée le       |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------|
| **Tactical Takedown**    | Le megaship du client a été compromis par une faction rivale : aborder le vaisseau, se frayer un chemin jusqu'au pont de commandement pour récupérer des renseignements et remonter à l'origine de l'attaque, puis frapper le général responsable dans sa base | 1er juillet 2026 |
| **Firestorm Rescue**     | Des otages sont piégés dans une station en feu : briser le siège et évacuer les survivants, en gérant la chaleur de la station pour gagner du temps tout en repoussant les forces hostiles                                                                     | 1er juillet 2026 |
| **Reclamation Point**    | Un megaship a été détourné : éliminer toutes les forces hostiles à l'intérieur et autour du vaisseau pour que le client puisse le récupérer — opération annoncée comme exigeant le meilleur équipement et le meilleur vaisseau                                 | 1er juillet 2026 |
| **Biohazard Takedown**   | Un groupe de chercheurs met au point une arme dangereuse : donner l'assaut au vaisseau, obtenir la localisation et l'identité des chercheurs, puis les neutraliser                                                                                             | 1er juillet 2026 |
| **Rapid Response**       | Un port planétaire est attaqué et du personnel y est encore piégé : l'évacuation est contre-la-montre, une importante flotte hostile étant en route                                                                                                            | 1er juillet 2026 |
| **Terminal Prosecution** | Un élément criminel écume le système depuis des semaines : le nettoyer                                                                                                                                                                                         | 1er juillet 2026 |
| **Under Siege**          | Répondre à l'appel de détresse d'un settlement planétaire où une aide urgente est requise : lever le blocus et neutraliser les forces ennemies qui tentent de s'emparer du site                                                                                | 2 septembre 2026 |

**Déroulé d'Under Siege en deux temps.** L'annonce préalable du 27 août 2026 (« Elite Dangerous previews the Rhino,
surface mining, and a new operation arriving September 2 », MassivelyOP) précise un enchaînement que les notes de
version elles-mêmes ne détaillent pas : l'escouade commence par dégager les menaces aériennes au-dessus du settlement,
puis se pose pour reprendre le contrôle du site au sol en combat à pied, avant l'arrivée d'« une menace plus
importante » dont la nature n'est pas précisée par cette source. Relevé de sourçage : voir
[00-methodologie-sourcing.md §7](./00-methodologie-sourcing.md#7-étude-de-cas--la-fiabilité-de-massivelyop-comme-source-de-presse), qui a tranché la fiabilité de MassivelyOP comme source de presse (P3) sur cette même série d'articles.

**Sur la liste annoncée en avril 2026.** Le billet du 22 avril 2026 annonçait six scénarios sous d'autres intitulés —
*Counter Attack*, *Burning Rescue*, *Megaship Massacre Reclaim*, *Megaship Massacre Strike*, *Surface Rescue*,
*Pirate Hunt* — dont les descriptions recoupent très largement celles publiées au lancement. Le
rapprochement entre les deux listes est un **rapprochement éditorial de ce guide**, à partir des descriptions des
deux billets : Frontier n'a pas publié de table de correspondance, et rien n'établit officiellement qu'il s'agit des
mêmes scénarios renommés. Les noms qui font foi en jeu sont ceux de la colonne de gauche du tableau ci-dessus.

### Les deux modes de jeu du mode Operations : Mercenary et Powerplay

Le billet du 22 avril 2026 décrit deux modes de jeu pour une même opération :

| Mode               | Conditions d'accès                                                                             | Conséquences                                                                                                                                                                      |
|--------------------|------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Mercenary Mode** | Mode par défaut, ouvert à tout commandant remplissant les prérequis du scénario                | Aucune conséquence ni effet Powerplay                                                                                                                                             |
| **Powerplay Mode** | Les systèmes éligibles dépendent de l'alignement du chef d'escouade et de sa position courante | L'escouade **déstabilise** (*undermine*) un Power choisi ; impossible de viser son propre Power ; les commandants non alignés peuvent participer mais ne gagnent **aucun mérite** |

Le mode Powerplay branche donc les Operations sur le cycle décrit dans [02-powerplay.md](./02-powerplay.md), du côté
de l'axe **Undermining** uniquement. Les **Powerplay Squads** (escouades dédiées à l'axe Powerplay des Operations)
d'Operations sont une entité de jeu distincte : le
billet du 2 septembre 2026 corrige d'ailleurs « un crash lors de la tentative de création d'une Powerplay Squad pour
les Operations pendant un saut en hyperespace ».

### Récompenses du mode Operations : la monnaie Merc Coin et le catalogue MercGear

Terminer une opération rapporte à chaque commandant un assortiment de récompenses : **crédits**, **matériaux**,
**mérites** (mode Powerplay uniquement) et **Merc Coin** (« An Update on Operations », 22 avril 2026).

#### Le Merc Coin, monnaie gagnée en jeu et non achetable en Arx

Le **Merc Coin** est une monnaie inédite, introduite avec les Operations :

- elle s'obtient en réussissant un scénario d'Operations, et un **bonus hebdomadaire** est versé la première fois que
  certaines activités sont accomplies ;
- elle **n'est pas achetable en Arx** — c'est une monnaie gagnée en jeu, explicitement non monétisée ;
- elle sert à acheter des récompenses : **modules de vaisseau** (armes, core internals, optional internals) et
  **blueprints d'ingénierie**.
- Un plafond de **9 999 Merc Coins**, avec un gain limité à **1 000 par semaine**, circule dans la documentation
  communautaire. Frontier n'a publié aucun de ces deux chiffres dans ses billets officiels : à traiter comme une
  **donnée communautaire non vérifiée**, à confirmer en jeu. La question connexe — le Merc Coin permet-il d'acheter de
  l'équipement à pied ? — est traitée par [07-equipement-a-pied.md](./07-equipement-a-pied.md), qui relève que les
  annonces officielles ne mentionnent que des modules de vaisseau et des blueprints d'ingénierie.

#### Le catalogue MercGear : quinze modules de vaisseau et blueprints achetés en Merc Coin

L'équipement achetable avec le Merc Coin est désigné sous le nom de **MercGear**. Les notes de version du 1er
juillet 2026 en donnent le catalogue de lancement, composé de quinze entrées :

| Catégorie                       | Élément                                 | Effet annoncé                                                                                                                           |
|---------------------------------|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Blueprint                       | Thermal Plasma Conversion               | Consommation électrique accrue pour convertir une part des dégâts en plasma (lasers *beam*, *pulse*, *burst*)                           |
| Blueprint                       | Scoop Rate Enhanced                     | Consommation électrique accrue pour améliorer le débit du fuel scoop                                                                    |
| Hardpoint pré-ingénieré         | Enduring Feedback Rail Gun              | Masse, consommation et dégâts revus pour améliorer rechargement, chaleur, portée et munitions ; effet Feedback Cascade                  |
| Hardpoint pré-ingénieré         | Far-Reaching Abrasion Blaster           | Consommation, distributeur et charge thermique réduits, vitesse de tir et portée maximale accrues, au prix de l'intégrité               |
| Hardpoint pré-ingénieré         | Double Screaming Fragment Cannon        | Munitions, chargeur et rafale accrus, rechargement réduit, au prix de la portée, de la cadence, de la masse et de la consommation       |
| Hardpoint pré-ingénieré         | Long Range Mining Laser                 | Portée accrue, consommation, distributeur et charge thermique réduits, au prix de l'intégrité et des dégâts                             |
| Hardpoint pré-ingénieré         | Rapid Phase Multi-Cannon                | Plus de projectiles par tir, munitions, chargeur et cadence accrus, au prix de la portée et d'une dispersion accrue                     |
| Hardpoint pré-ingénieré         | Drag Seeker Missile Rack                | Munitions, chargeur et cadence accrus, au prix de la masse, de la consommation et du distributeur                                       |
| Hardpoint pré-ingénieré         | Lightweight Thermal Seeker Missile Rack | Munitions, chargeur et cadence accrus, masse et consommation réduites, au prix de l'intégrité                                           |
| Hardpoint pré-ingénieré         | Lockdown Seeker Missile Rack            | Munitions, chargeur et intégrité accrus, charge thermique réduite, au prix de la consommation, de la masse, de la cadence et des dégâts |
| Core interne pré-ingénieré      | Support Focused Power Distributor       | Capacité et charge moteurs/systèmes accrues, au prix de la charge du circuit armes                                                      |
| Core interne pré-ingénieré      | Balanced Power Distributor              | Débit et charge du distributeur modérément accrus, consommation réduite, au prix de la masse et de l'intégrité                          |
| Interne optionnel pré-ingénieré | Extended Cargo Rack                     | Capacité de soute accrue                                                                                                                |
| Interne optionnel pré-ingénieré | Long Range Detailed Surface Scanner     | Masse et consommation accrues contre un meilleur rayon de sondes                                                                        |
| Interne optionnel pré-ingénieré | Heavy Duty Module Reinforcement Package | Protection des modules accrue au prix d'une masse accrue                                                                                |

**Le MercGear passe par les ingénieurs.** Deux correctifs officiels l'établissent sans ambiguïté : le billet du
2 septembre 2026 corrige « un problème où le MercGear n'était pas ingénierable immédiatement après achat », puis « un
problème où le Seeker Missile Rack MercGear ne pouvait pas être ingénieré chez Petra Olmanova ». Le MercGear
pré-ingénieré n'est donc pas un équipement figé : il entre dans la boucle d'ingénierie décrite dans
[06-ingenieurs.md](./06-ingenieurs.md). L'Update 3 du 9 juillet 2026 a par ailleurs amélioré la lisibilité de ces
modules (« Merc Engineering / Merc Modules telegraphing ») dans l'outfitting et dans le panneau interne du vaisseau.

### Le Nomad, ship-launched vessel livré par la mise à jour Operations

La mise à jour Operations a également introduit le **Nomad** : « Cette mise à jour amène également avec elle le
puissant Nomad ! » (« Operations Update », 1er juillet 2026). Il s'agit d'un **ship-launched vessel** (véhicule lancé
depuis un vaisseau, SLV) compact
dédié à l'exploration des surfaces planétaires, doté d'un **Mk II Biological Scanner** permettant de détecter les
signaux biologiques depuis le cockpit, et déployable « depuis une soute à vaisseau compatible, y compris les modules
MK I et MK II ». Le Nomad n'est pas un vaisseau de chantier naval et ne modifie donc pas le décompte des vaisseaux
pilotables du corpus.

Pour la chronologie complète, les caractéristiques et les modules de soute concernés, voir le guide dédié
[14-rhino.md](./14-rhino.md).

### État du service du mode Operations : « Networking & Balancing Beta » et problèmes connus

Frontier a livré les Operations sous le statut explicite de **« Networking & Balancing Beta »** : « comme pour tout
changement majeur apporté à *Elite Dangerous*, nous devons équilibrer diverses considérations de connectivité et de
serveur […] cela nous permet d'apporter des ajustements plus régulièrement en coulisses pour garantir des
performances optimales » (« Operations Update », 1er juillet 2026). Le mode est donc, de l'aveu de l'éditeur, sujet à
des ajustements réguliers côté serveur.

L'Update 3 du 9 juillet 2026 a traité les principaux incidents du lancement : récompenses d'Operations (Merc Coins,
crédits, matériaux et inventaire) non attribuées, à restituer rétroactivement ; inventaires à pied effacés après une
opération terminée avant le 2 juillet 2026 à 23:30 UTC, à restaurer ; données d'exploration non vendues d'avant la
maintenance du 2 juillet, restaurées ; ajout d'un bouton « Resync Local Data » dans le sous-menu Help and Info du
menu principal pour reconstruire le cache local des étoiles visitées.

Au 2 septembre 2026, Frontier signale encore deux problèmes connus touchant directement ce mode : l'opération **Under
Siege peut parfois se terminer prématurément**, et l'**interface de wing à pied est actuellement absente**.

### Note de méthode : pourquoi ce guide niait auparavant l'existence du mode Operations

Une révision antérieure concluait qu'aucune source fiable ne confirmait l'existence d'un mode multijoueur
« Operations » ni d'un vaisseau « Nomad », et traitait les deux comme une rumeur. **Cette conclusion était erronée**,
et sa cause est identifiée : la vérification s'appuyait sur les catalogues de vaisseaux d'Inara.cz et d'EDCD, qui ne
recensent que les **vaisseaux pilotables achetables au chantier naval**. Ces catalogues ne contiennent ni les SRV
(Scarab, Scorpion, Rhino), ni les chasseurs embarqués (SLF), ni les *ship-launched vessels* (SLV) : y chercher le
Nomad revenait à chercher un chasseur embarqué dans une liste de chantier naval, et son absence n'y avait aucune
valeur probante. Combinée aux erreurs d'accès HTTP rencontrées sur les sites d'actualité et les wikis communautaires,
cette erreur de catégorie a produit un faux négatif.

Toute la [partie A](#partie-a--le-mode-operations-multijoueur-en-escouade-2026) ci-dessus est rétablie à partir des
billets d'annonce officiels de Frontier Developments, chacun
cité avec son titre et son horodatage UTC.

## Partie B — Les opérations au sol d'Odyssey

Cette partie couvre l'intégralité du gameplay à pied : typologie des settlements, catégories de missions au sol,
mécaniques d'infiltration et de piratage, zones de conflit à pied, équipement (combinaisons et armes), progression
par l'ingénierie, récompenses, et conseils pratiques. Sauf mention explicite du contraire, tout ce qui suit concerne
ce périmètre-là, et non le mode multijoueur de la partie A.

Odyssey a connu un lancement difficile : d'importants problèmes de stabilité client/serveur, des bugs de gameplay et
des performances PC inadéquates ont entraîné des retours largement négatifs sur Steam. Frontier Developments a réagi
en publiant sept mises à jour majeures dans les mois suivants — les cinq premières sur un rythme hebdomadaire,
centrées en priorité sur la stabilité, puis deux mises à jour supplémentaires (juillet et septembre 2021) portant sur
les missions, l'interface et l'optimisation des performances. La version console de l'extension, dont la sortie avait
déjà été repoussée indéfiniment en juillet 2021, a finalement été annulée en mars 2022, Frontier ayant choisi de
concentrer ses efforts sur une base de code unique post-Odyssey, développée pour PC. Ces éléments de contexte
n'affectent plus l'expérience de jeu actuelle, mais expliquent pourquoi certaines mécaniques ont été révisées par la
suite (notamment l'ajout des « missions partagées » facilitant le jeu à plusieurs sur les opérations au sol).

## Accéder aux opérations au sol d'Odyssey : atterrissage, approche et déplacement à pied

Il existe plusieurs façons de rejoindre une opération au sol :

- **Atterrissage direct sur le settlement** : si l'autorisation d'accostage est accordée (settlement civil ou faction
  amicale), le vaisseau se pose directement sur une plateforme du site, ce qui donne un accès rapide mais expose
  immédiatement le joueur aux systèmes de sécurité du settlement.
- **Atterrissage à proximité, puis approche à pied ou en véhicule** : pour les settlements non autorisés, hostiles, ou
  lorsque la mission exige la discrétion, il est préférable de se poser hors du périmètre de détection et d'approcher
  à pied ou en SRV (véhicule terrestre).
- **Forçage de l'accès** : en l'absence d'autorisation, certaines missions demandent d'obtenir un code de bypass
  (contournement du contrôle d'accès), de pirater le contrôle d'accès, ou d'entrer par une voie non surveillée
  (conduit technique, porte non verrouillée, faille dans le périmètre).

Une fois sur place, le déplacement se fait en vue première personne, avec une gestion de l'oxygène (réserve de la
combinaison, rechargeable via des bonbonnes ou en retournant au vaisseau/à une station), un système de posture
(debout, accroupi, ramper) qui influence la vitesse de détection, et un scanner de profil (« Profile Analyser »)
permettant d'identifier les gardes, employés civils et objets d'intérêt à distance.

## Les settlements d'Odyssey : typologie et sécurité

### Types de settlements Odyssey par activité économique (agricole, minier, industriel, militaire…)

Les settlements se répartissent selon l'activité économique dominante du site, qui détermine le type de ressources et
de missions disponibles :

| Type de settlement        | Activité dominante                          | Intérêt pour le joueur                                     |
|---------------------------|---------------------------------------------|--------------------------------------------------------------|
| Agricole                  | Production alimentaire, biochimie           | Missions de vol de marchandises, matériaux organiques      |
| Extraction / minier       | Exploitation de ressources minérales        | Missions de sabotage, matériaux manufacturés               |
| Industriel                | Fabrication, traitement de composants       | Missions de vol de données, composants d'ingénierie        |
| Militaire                 | Sécurité, entraînement, contrats de défense | Missions d'assassinat et de conflit, sécurité élevée       |
| Scientifique              | Recherche, expérimentation                  | Vol de données technologiques, matériaux encodés           |
| Tourisme / civil          | Habitation, commerce, loisirs               | Sécurité faible à nulle, bon point d'entrée pour débutants |
| Installations criminelles | Factions pirates ou hors-la-loi             | Butin illégal, marché noir, risques accrus                 |

### Niveaux de sécurité d'un settlement (civile, faible, moyenne, élevée)

Chaque settlement affiche un niveau de sécurité qui conditionne la difficulté de l'opération :

| Niveau de sécurité | Gardes                                  | Défenses automatiques                                       | Réaction à l'alerte                                      |
|--------------------|------------------------------------------|---------------------------------------------------------------|-------------------------------------------------------------|
| Aucune / civile    | Employés non armés uniquement           | Aucune ou minimale                                          | Signalement, pas de riposte armée                        |
| Faible             | Quelques agents armés légers            | Caméras occasionnelles                                      | Renforts limités, délai de réponse long                  |
| Moyenne            | Agents de sécurité armés en nombre      | Tourelles ponctuelles, drones de surveillance               | Renforts rapides, verrouillage partiel                   |
| Élevée             | Troupes d'élite, patrouilles nombreuses | Tourelles multiples, drones actifs, confinement automatique | Renforts massifs, verrouillage total, scans au décollage |

Le niveau de sécurité influence aussi le comportement des patrouilles (rotations, cycles jour/nuit) et la probabilité
de croiser des gardes en dehors des zones normalement surveillées.

### Autorisations d'accostage sur un settlement et options en leur absence

Un settlement peut être librement accessible (autorisation civile automatique) ou nécessiter une **autorisation
d'accostage** demandée en approche. Sans autorisation, trois options existent : accomplir une mission ou une action de
type « bypass » pour l'obtenir légitimement, s'infiltrer discrètement par une entrée non surveillée, ou engager le
combat frontalement en acceptant le statut recherché qui en découle localement.

### Apex Interstellar et Frontline Solutions : rallier une opération sans y poser son propre vaisseau

Deux services Odyssey permettent de rejoindre un point d'engagement sans y amener son propre vaisseau. **Apex
Interstellar** est une navette rapide, réservable à un comptoir en station ou à distance depuis un settlement,
tarifée à la distance (frais de base + frais hyperespace variable), qui dépose son passager n'importe où — y compris
à proximité d'un settlement distant. **Frontline Solutions** est spécifique à l'engagement en **zone de conflit au
sol** : un comptoir dédié, actif uniquement dans un système en état Guerre ou Guerre Civile, permet de choisir un
settlement en conflit et un camp, puis d'embarquer à bord d'un dropship (navette de débarquement) dédié (jusqu'à cinq
autres commandants ou
PNJ) sans que le trajet compte pour la réputation du joueur envers les factions belligérantes. Le détail complet des
deux services — tarification, limites, niveaux de « Conflict Intensity » (intensité du conflit), paie observée — est
traité dans
[29-missions-reputation-et-rangs.md §7](./29-missions-reputation-et-rangs.md#7-apex-interstellar-et-frontline-solutions--les-deux-portes-dentrée-dodyssey),
qui couvre aussi la correction du 30 juin 2026 mentionnée plus haut au sujet de la réservation systématique d'un
dropship.

## Le tableau de missions et les huit familles d'opérations au sol (assassinat, sabotage, hacking…)

Ce tableau documente les missions **au sol**. Pour la typologie équivalente côté missions de **vaisseau** (sept
familles officieuses : Courier, Supply, Assassination, Massacre, Theft/Liberation, Recovery, Surface Operations) et
la mécanique de cumul et de cycle de vie du tableau de missions en général, voir
[29-missions-reputation-et-rangs.md §1](./29-missions-reputation-et-rangs.md#1-le-tableau-de-missions-de-vaisseau--typologie-et-fonctionnement).

Le tableau de mission d'un settlement (ou le comptoir de contacts en station, pour les missions à distance) propose
plusieurs grandes familles d'opérations :

| Type de mission                  | Objectif                                                            | Contrainte fréquente                                     | Approche recommandée                                   |
|-----------------------------------|-----------------------------------------------------------------------|-------------------------------------------------------------|-------------------------------------------------------------|
| Assassinat                       | Éliminer une cible nommée retranchée dans un site gardé             | Variante « covert » : ne jamais être repéré              | Infiltration, arme silencieuse ou combinaison discrète |
| Massacre au sol                  | Éliminer un nombre donné d'ennemis                                  | Souvent lié à une zone de conflit active                 | Équipement de combat lourd, jeu en groupe conseillé    |
| Vol de données (hacking)         | Pirater un terminal pour en extraire des données                    | Discrétion optionnelle selon la mission                  | Outil de piratage de bon grade, timing des rondes      |
| Vol de marchandises              | Dérober un objet physique dans une zone restreinte                  | Zone souvent surveillée par caméras                      | Approche furtive, connaissance du layout du bâtiment   |
| Sabotage                         | Endommager ou désactiver un équipement (générateur, communications) | Déclenche souvent une alerte locale immédiate            | Plan de fuite préparé avant l'action                   |
| Restauration / réactivation      | Rétablir l'alimentation ou relancer un système                      | Première étape d'une chaîne de missions liées            | Peu de combat, souvent un bon point d'entrée           |
| Mercenariat / défense de faction | Combattre pour ou contre une faction (mineure ou Powerplay)         | Peut inclure la tenue ou l'assaut d'un settlement entier | Équipement de CZ, coordination en groupe               |
| Récupération / scan              | Récupérer une boîte noire, scanner un objet ou une personne         | Cible parfois mobile ou protégée                         | Reconnaissance préalable du site                       |

Chaque mission indique généralement un **niveau de menace** (faible / moyen / élevé) qui dimensionne le nombre et
l'équipement des gardes rencontrés, ainsi qu'éventuellement une contrainte « non-lethal » ou « sans alarme » qui
impose une approche entièrement différente (armes non létales, discrétion stricte, pas d'affrontement toléré). Voir
la section [Récompenses des opérations au sol](#récompenses-des-opérations-au-sol-par-niveau-de-menace)
pour la table des gains associés à chaque niveau de menace.

### Powerplay et missions de mercenariat au sol

Cette section traite du recoupement entre Powerplay et les **missions au sol** (partie B). Pour le **mode Powerplay
des Operations multijoueur**, mécanique distincte et postérieure, voir
[Les deux modes : Mercenary et Powerplay](#les-deux-modes-de-jeu-du-mode-operations--mercenary-et-powerplay) en partie A.

Les missions **Mercenariat / défense de faction** ci-dessus recoupent, dans les systèmes disputés par les
superpuissances, le cycle hebdomadaire de **Powerplay 2.0** (extension « Ascendancy », sortie le **31 octobre 2024** —
et non le 26 février 2025, date qui correspond en réalité à une mise à jour distincte, « Trailblazers » ; voir
[00-chronologie-canonique.md](./00-chronologie-canonique.md) pour l'arbitrage complet). Ce cycle structure trois axes
d'action, détaillés dans [02-powerplay.md](./02-powerplay.md) :

- **Acquisition** — conquérir un système inoccupé pour le rattacher à son Power.
- **Renforcement** — consolider un système déjà tenu par son propre Power.
- **Undermining** (déstabilisation, parfois appelé « sape ») — affaiblir un système tenu par un Power rival.

Concrètement pour les Opérations au sol : le tableau de mission d'un settlement situé dans un système en cours
d'Acquisition, de Renforcement ou d'Undermining propose plus fréquemment des contrats de Mercenariat/défense de
faction, et parfois l'assaut ou la tenue complète du settlement. Réaliser l'activité correspondant à l'axe assigné
par son Power au système concerné confère, selon 02-powerplay.md, un **bonus de mérites d'environ +50 %** sur cet
axe — un mécanisme géré entièrement au niveau de Powerplay, pas par les Opérations elles-mêmes. Pour le détail
complet du cycle, des seuils de contrôle et du classement actuel des Powers (qui évolue chaque semaine au tick du
jeudi 07:00 UTC), voir [02-powerplay.md](./02-powerplay.md) plutôt que de se fier à un chiffre reproduit ici, qui
serait rapidement obsolète.

## Infiltration, détection et système d'alarme

### Détection visuelle et sonore par les gardes et les caméras d'un settlement

La discrétion repose sur le champ de vision des gardes et des caméras/tourelles automatiques, sur le bruit produit
par le joueur (courir est bien plus détectable que marcher accroupi) et sur l'état apparent du joueur : dégainer une
arme dans une zone civile ou surveillée déclenche immédiatement la suspicion, même sans tir.

### Escalade de la suspicion jusqu'à l'alerte complète du settlement

Être repéré en zone interdite, forcer une porte verrouillée ou pirater un terminal sous observation fait monter un
niveau de suspicion progressif. Ce niveau peut redescendre si le joueur se met hors de vue suffisamment longtemps, ou
déclencher une **alerte complète** s'il continue de s'exposer.

### Confinement du settlement et statut recherché après une alerte complète

Une alerte complète entraîne le verrouillage des portes en mode confinement, l'appel de renforts armés, l'activation
des tourelles, et l'attribution d'un statut recherché localement au joueur. Ce statut complique l'extraction :
ressortir du site implique alors soit un affrontement direct, soit un risque de scan au moment du décollage si le
vaisseau reste dans la zone de sécurité du settlement.

### Contre-mesures de discrétion : combinaisons, modules et lecture des rondes

Face au système de détection d'un settlement, certaines combinaisons et modules réduisent la vitesse de détection ou
le bruit produit par le joueur, ce qui facilite nettement une approche furtive prolongée. Une bonne connaissance du
cycle des rondes et des angles morts
des caméras reste toutefois l'outil le plus fiable pour éviter toute alerte.

## Piratage de terminaux et de portes au sol (hacking, emplacement Suit Tool)

Le piratage s'effectue avec un outil dédié, porté dans l'emplacement « Suit Tool », que l'on pointe sur un terminal
ou un point d'accès verrouillé. L'opération prend un temps variable pendant lequel le joueur reste immobile et
vulnérable, et peut être interrompue par du bruit ou une alerte à proximité.

- Le matériel de piratage existe en **plusieurs grades** : les modèles de grade supérieur réduisent le temps
  nécessaire au bypass et permettent de forcer des verrous de sécurité plus élevés, inaccessibles aux outils de base.
- Des **outils complémentaires** existent pour les situations où le piratage pur est trop risqué ou impossible :
  charges explosives pour forcer une porte de force, ou outils de coupe (Arc Cutter) pour ouvrir certains accès
  techniques non électroniques.
- Les terminaux piratés donnent accès à des données (souvent liées à une faction ou à un individu ciblé par la
  mission), à l'ouverture de portes verrouillées, ou à la désactivation temporaire de systèmes de sécurité (caméras,
  tourelles).

Pour la liste complète et à jour des outils de piratage/reconnaissance (Wave Scanner, Profile Analyser, Compact
Multi-Tool, E-Break) et de leurs paliers de grade, voir [07-equipement-a-pied.md](./07-equipement-a-pied.md) — ce
guide-ci n'en donne qu'un résumé fonctionnel pour éviter les redites.

## Zones de conflit au sol (On-Foot Combat Zones)

Les zones de conflit à pied (CZ, voir [glossaire](./00-glossaire.md)) opposent deux factions, ou une faction contre
des mercenaires engagés par le joueur, sur un site dédié.

| Intensité                 | Effectifs adverses    | Équipement rencontré                                   | Difficulté                                                      | Public visé                                |
|----------------------------|-------------------------|-------------------------------------------------------------|--------------------------------------------------------------------|-----------------------------------------------|
| Faible (Low)              | Réduits               | Armement de base, peu de véhicules                     | Accessible en solo avec un équipement standard                  | Débutants, farming de matériaux            |
| Moyenne (Medium/Standard) | Modérés               | Armement varié, quelques snipers                       | Nécessite un équipement correct                                 | Joueurs intermédiaires                     |
| Élevée (High)             | Nombreux et agressifs | Véhicules blindés, tourelles, snipers, troupes d'élite | Exigeante, quasi impraticable en solo sans équipement engineeré | Joueurs expérimentés, idéalement en groupe |

L'objectif principal est d'accumuler des éliminations et de capturer des points de contrôle pour faire basculer
l'issue de la bataille en faveur de la faction soutenue. Les récompenses en crédits sont versées régulièrement
pendant l'engagement, avec une prime supplémentaire à la victoire finale. Un correctif ultérieur a introduit les
**missions partagées**, permettant à plusieurs commandants de réaliser ensemble une même opération ou CZ au sol — un
ajout qui facilite nettement le nettoyage des zones de conflit High en répartissant la pression de détection et de
combat.

## S'équiper à pied : les quatre combinaisons (suits) Flight, Dominator, Maverick, Artemis

Quatre familles de combinaisons structurent la progression du joueur à pied :

| Combinaison    | Orientation                        | Points forts                                                                                | Points faibles                     | Usage recommandé                                    |
|-----------------|--------------------------------------|--------------------------------------------------------------------------------------------|---------------------------------------|--------------------------------------------------------|
| Flight Suit    | Polyvalente, combinaison de départ | Disponible immédiatement, équilibrée                                                        | Peu d'emplacements de modules      | Apprentissage, missions Low threat                  |
| Dominator Suit | Combat lourd                       | Résistance et bouclier élevés                                                               | Mobilité et discrétion réduites    | Zones de conflit, assauts frontaux                  |
| Maverick Suit  | Mobilité et discrétion             | Déplacement plus silencieux, sprint amélioré                                                | Résistance plus faible             | Infiltration, missions de piratage/vol              |
| Artemis Suit   | Utilitaire et reconnaissance       | Autonomie en oxygène, résistance environnementale, emplacements utilitaires supplémentaires | Moins spécialisée en combat direct | Exploration, exobiologie, combat à distance discret |

Chaque combinaison existe en plusieurs **grades** (du plus basique au plus avancé), débloqués progressivement selon
la réputation acquise auprès des factions locales ou des superpuissances (rang mercenaire, exploration, etc.), et
achetés auprès des techniciens d'équipement présents dans les stations et certains settlements. Les grades supérieurs
offrent davantage d'emplacements de modules et de meilleures statistiques de base ; ils peuvent ensuite être
améliorés via l'ingénierie une fois les Engineers concernés débloqués (voir
[Les Engineers à pied par archétype de mission](#les-engineers-à-pied-par-archétype-de-mission) plus bas).

## S'équiper à pied : les armes et leurs trois fabricants

Les armes à pied se répartissent en plusieurs catégories, chacune déclinée en variantes cinétique, laser ou plasma,
avec pour certaines une version non létale.

### Les trois fabricants d'armes à pied et les catégories d'armes

Trois fabricants se partagent le catalogue, chacun avec ses propres recettes d'ingénierie (détail complet dans
[07-equipement-a-pied.md](./07-equipement-a-pied.md)) :

- **Kinematic Armaments**
- **Manticore**
- **Takada**

| Catégorie                   | Rôle                                   | Types de dégâts disponibles | Remarques                                            |
|-------------------------------|-------------------------------------------|--------------------------------|----------------------------------------------------------|
| Arme principale — assaut    | Combat rapproché et moyenne portée     | Cinétique, laser, plasma    | Polyvalente, cadence de tir élevée                   |
| Arme principale — précision | Élimination à distance, cibles isolées | Cinétique, laser            | Idéale pour l'assassinat discret                     |
| Arme secondaire (poing)     | Appoint, dégagement rapide             | Cinétique, laser, plasma    | Encombrement réduit, portée limitée                  |
| Arme de mêlée               | Neutralisation silencieuse             | Impact                      | Évite tout bruit de tir, usage strictement rapproché |

Les variantes **non létales** sont indispensables pour les missions imposant explicitement de ne pas tuer les
cibles. Comme les combinaisons, chaque arme existe en plusieurs grades et peut être engineerée pour améliorer les
dégâts, la cadence, la portée, ou au contraire réduire le bruit et la signature — un critère déterminant pour
l'infiltration.

### Armes à pied nommées par archétype de mission (Karma P15, Manticore Terminator…)

Pour faire le lien avec
[le tableau de missions](#le-tableau-de-missions-et-les-huit-familles-dopérations-au-sol-assassinat-sabotage-hacking)
plus haut, voici les modèles nommés qui reviennent le plus souvent dans la documentation communautaire pour chaque
archétype (source : builds nommés recensés dans [07-equipement-a-pied.md](./07-equipement-a-pied.md), à recouper avec
[09-combat-a-pied.md](./09-combat-a-pied.md) pour la cohérence tactique) :

| Archétype de mission (voir [tableau plus haut](#le-tableau-de-missions-et-les-huit-familles-dopérations-au-sol-assassinat-sabotage-hacking)) | Arme recommandée               | Fabricant           | Pourquoi                                                                 |
|------------------------------------------------|-----------------------------------|-----------------------|-------------------------------------------------------------------------|
| Assassinat (covert) / Infiltration            | Karma P15 Infiltrator           | Kinematic Armaments | Masquage audio + suppresseur : neutralise sans déclencher l'alarme      |
| Vol de marchandises / Sabotage                | Karma P15 Infiltrator           | Kinematic Armaments | Discrétion pour l'approche ; utile en solution de repli si repéré       |
| Massacre au sol / CZ Moyenne-Élevée           | Manticore Terminator            | Manticore            | Fusil plasma polyvalent, cadence et capacité de chargeur élevées        |
| Assassinat (élimination à distance)           | Manticore Executioner           | Manticore            | Fusil plasma sniper, dégâts à la tête et suppression du bruit           |
| Mercenariat / défense de faction (CZ dédiée)  | Manticore Executioner Warfighter | Manticore            | Build offensif dédié, pensé pour les zones de conflit à haut dégât      |
| Récupération / scan (achever une cible)       | Karma P15 Warfighter            | Kinematic Armaments  | Visée rapide et chargeur agrandi pour achever des cibles sans bouclier  |
| Massacre au sol (groupes d'ennemis)           | Lance-roquettes Warfighter      | Manticore            | Dégâts de zone contre plusieurs adversaires regroupés                  |

**Takada** complète le catalogue des trois fabricants mais aucun build nommé spécifique n'a pu être recoupé pour ce
fabricant dans les sources communautaires consultées pour ce guide — pour l'exhaustif (Takada inclus) et les valeurs
numériques précises de dégâts, consultez [07-equipement-a-pied.md](./07-equipement-a-pied.md) ou une base de données
à jour (Inara, wiki communautaire Elite Dangerous) plutôt qu'une valeur figée ici.

## Outils, utilitaires et consommables des emplacements Suit Tool et Utility

En complément des armes, le joueur dispose d'emplacements « Suit Tool » et « Utility » pouvant accueillir :

- l'**outil de piratage**, indispensable pour toute mission de hacking ;
- le **Profile Analyser**, pour scanner à distance gardes, civils et points d'intérêt ;
- des **grenades** (fragmentation, EMP pour désactiver temporairement l'électronique, ou étourdissantes en variante
  non létale) ;
- des **consommables de survie** (recharge d'oxygène, kits de soin) essentiels lors d'opérations prolongées loin du
  vaisseau.

Pour la liste exhaustive des six consommables à pied et leur mode de réapprovisionnement réel (achat au comptoir
Pioneer Supplies ou butin — il n'existe pas de synthèse par matériaux à pied, contrairement au vaisseau), voir la
section [« Pas de synthèse à
pied »](./07-equipement-a-pied.md#pas-de-synthèse-à-pied--réapprovisionnement-par-achat-ou-par-butin-à-distinguer-de-la-synthèse-embarquée)
de [07-equipement-a-pied.md](./07-equipement-a-pied.md).

## Progression et ingénierie de l'équipement à pied

La progression de l'équipement à pied suit une boucle proche de celle des vaisseaux :

1. **Gagner en réputation** auprès des factions locales et des superpuissances (via missions et CZ) pour débloquer
   l'accès aux grades supérieurs de combinaisons, d'armes et d'outils chez les techniciens d'équipement.
2. **Collecter des matériaux** — trouvés sur le terrain (dans les settlements, sur les corps, dans les coffres),
   obtenus en récompense de mission, achetés, ou synthétisés à partir d'autres ressources.
3. **Consulter les Engineers** spécialisés dans l'équipement à pied pour appliquer des améliorations aux combinaisons
   et aux armes, une fois leur déblocage obtenu et les matériaux requis réunis.
4. **Répéter missions et CZ** pour financer les achats d'équipement de grade supérieur et continuer à monter en rang
   auprès des factions concernées.

L'écart de performance entre un équipement de base et un équipement pleinement engineeré est important, en
particulier pour aborder sereinement les zones de conflit High. Ces valeurs sont données en configuration stock ;
l'ingénierie (voir [06-ingenieurs.md](./06-ingenieurs.md)) peut les modifier significativement.

### Les Engineers à pied par archétype de mission

Neuf Engineers à pied sont présents dans la bulle « Core », auxquels s'ajoutent quatre Engineers dans la région de
Colonia (déblocage convergent plutôt que séquentiel). Le tableau ci-dessous reprend leurs spécialités documentées
dans [07-equipement-a-pied.md](./07-equipement-a-pied.md) et les rapproche de l'archétype de mission (voir
[le tableau de missions](#le-tableau-de-missions-et-les-huit-familles-dopérations-au-sol-assassinat-sabotage-hacking)
plus haut, et [06-ingenieurs.md](./06-ingenieurs.md) pour la mécanique générale d'ingénierie) le
plus cohérent avec ce que chaque Engineer permet d'améliorer :

| Engineer        | Système   | Spécialité dominante (suit / arme)                                             | Archétype de mission le plus cohérent           | Source |
|-------------------|-------------|-------------------------------------------------------------------------------|-----------------------------------------------------|-----------|
| Hero Ferrari     | Sirius    | Réserves d'air, sprint, saut assisté / suppresseur de bruit, dégainage rapide  | Infiltration / Assassinat covert                    | 07 |
| Wellington Beck  | Jolapa    | Capacité de sac à dos, batterie / portée accrue, optique                      | Vol de marchandises / Récupération-scan             | 07 |
| Uma Laszlo       | Xuane     | Résistance aux dégâts, régén. bouclier / dégâts à la tête, rechargement       | Massacre au sol / CZ                                | 07 |
| Jude Navarro     | Aurai     | Dégâts de mêlée, capacité de munitions / vitesse de rechargement              | Massacre au sol / CZ                                | 07 |
| Terra Velasquez  | Shou Xing | Vitesse de déplacement en combat, réserves d'air / précision en tir de hanche | Mercenariat / défense de faction                    | 07 |
| Oden Geiger      | Candiaei  | Batterie, tracking, vision nocturne / optique, stabilité                     | Vol de données (hacking, repérage discret)          | 07 |
| Domino Green     | Orishis   | Sac à dos, batterie, tracking / portée, stabilité                            | Vol de marchandises / Récupération-scan             | 07 |
| Kit Fowler       | Capoya    | Régén. bouclier, mêlée, munitions / rechargement en étui, chargeur           | Massacre au sol / CZ                                | 07 |
| Yarden Bond      | Bayan     | Vitesse de combat, saut assisté, pas silencieux / masquage audio             | Assassinat covert / Infiltration                    | 07 |
| Baltanos, Eleanor Bresa, Rosa Dayette | Deriso, Desy, Kojeara (Colonia) | Spécialités non détaillées dans les sources consultées | Débloquent conjointement Yi Shen ; pas d'archétype dédié identifié | 07 |
| Yi Shen          | Einheriar (Colonia) | Spécialités non détaillées dans les sources consultées                | Débloqué par les trois Engineers Colonia précédents | 07 |

## Récompenses des opérations au sol par niveau de menace

Les missions et zones de conflit au sol rapportent des crédits, de la réputation, des matériaux/données et parfois
des marchandises. Le tableau suivant tente de chiffrer ces gains par niveau de menace ; **avertissement de
fiabilité** : lors de la rédaction de cette version, la recherche web de session était déjà épuisée et les tentatives
de consultation directe de bases communautaires (fandom, Inara) ont renvoyé des erreurs d'accès (HTTP 402/410),
cohérent avec les limitations d'accès déjà documentées dans ce corpus (voir
[00-chronologie-canonique.md](./00-chronologie-canonique.md)). Les fourchettes ci-dessous sont donc des **ordres de
grandeur communautaires non vérifiés en session**, à confirmer sur le tableau de mission en jeu ou sur Inara avant
toute décision engageant du temps de jeu — *instantané non confirmé, capturé le 9 septembre 2026, à revérifier sur
[Inara](https://inara.cz/elite/) ou en jeu*.

| Niveau de menace | Crédits par mission (ordre de grandeur, non vérifié)   | Réputation                        | Matériaux / données                                             | Marchandises                                     |
|--------------------|-------------------------------------------------------------|----------------------------------------|--------------------------------------------------------------------|------------------------------------------------------|
| Faible            | Quelques dizaines de milliers de Cr                        | Gain limité                       | Matériaux communs, données de base                              | Objets de faible valeur, revente normale         |
| Moyen             | Plusieurs dizaines à ~100 000+ Cr                          | Gain modéré                       | Matériaux et données incluant certains grades intermédiaires    | Objets de valeur correcte, parfois marché noir   |
| Élevé             | De l'ordre de plusieurs centaines de milliers de Cr, davantage pour les CZ High soutenues | Gain élevé, parfois avec bonus de faction | Matériaux et données de grade supérieur, données liées aux Guardians | Butin de valeur, souvent lié au marché noir       |

Les zones de conflit versent en plus des paiements réguliers en crédits **pendant** l'engagement (voir
[Zones de conflit au sol](#zones-de-conflit-au-sol-on-foot-combat-zones)), avec une prime supplémentaire à la
victoire finale — ce complément n'est pas inclus dans la colonne « Crédits par mission » ci-dessus, qui ne couvre que
les missions au tableau.

## Colonisation de systèmes et sécurité des installations planétaires

Depuis le lancement de la **Colonisation de systèmes**, les commandants peuvent construire eux-mêmes des systèmes et
des établissements, ce qui crée directement de nouvelles installations planétaires relevant du même périmètre de
sécurité que celui décrit dans ce guide (typologie de settlement, niveaux de sécurité, gardes et défenses
automatiques — voir [Les settlements d'Odyssey : typologie et sécurité](#les-settlements-dodyssey--typologie-et-sécurité)
plus haut).

**Chronologie corrigée** (voir [00-chronologie-canonique.md](./00-chronologie-canonique.md) pour le détail complet) :

- **20 octobre 2024** : annonce de la fonctionnalité lors du livestream Frontier Unlocked.
- **26 février 2025** : lancement en **bêta**, dans le cadre de la mise à jour gratuite « Elite Dangerous:
  Trailblazers ». Une version antérieure de ce guide indiquait le 28 février 2025 pour cette étape — cette date est
  en réalité celle d'un article explicatif publié deux jours après le lancement réel de la bêta, pas celle du
  lancement lui-même.
- **11 novembre 2025** : sortie de bêta et **lancement complet**, via la mise à jour officiellement nommée « Dodec
  Update » (version 4.2.2.0).

Comme le résume [09-combat-a-pied.md](./09-combat-a-pied.md#colonisation-powerplay-20-et-nouvelles-zones-de-conflit-au-sol),
les conflits et l'état de sécurité des systèmes colonisés génèrent de nouvelles zones de conflit au sol, en
complément des Ground CZ traditionnelles et de celles liées à Powerplay 2.0. Pour toute la mécanique de
colonisation elle-même (revendication de système, construction, coût, gouvernance) — hors du périmètre de ce
guide — voir le guide dédié [18-colonisation.md](./18-colonisation.md), qui fait référence sur ce sujet plutôt que
de dupliquer ce contenu ici.

## Contexte et évolutions récentes, d'Odyssey (2021) au mode Operations (2026)

- **19 mai 2021** : lancement de l'extension Odyssey sur PC, marqué par d'importants problèmes de stabilité
  client/serveur, des bugs de gameplay et des performances PC inadéquates, entraînant des retours largement négatifs
  sur Steam. Frontier publie sept mises à jour majeures dans les mois suivants — les cinq premières sur un rythme
  hebdomadaire, centrées sur la stabilité, puis deux autres (juillet et septembre 2021) portant sur les missions,
  l'interface et l'optimisation des performances.
- **Juillet 2021** : la sortie de la version console (PS4/Xbox One) d'Odyssey, initialement prévue en parallèle du
  PC, est repoussée indéfiniment.
- Un correctif ultérieur introduit les **missions partagées**, permettant de réaliser à plusieurs les missions et
  opérations au sol — un changement significatif pour l'accessibilité des CZ High.
- **10 mars 2022** : la version console d'Odyssey est officiellement annulée, Frontier ayant choisi de concentrer
  ses efforts sur une base de code unique post-Odyssey, développée pour PC.
- **22 avril 2026** : Frontier annonce le report du mode multijoueur **Operations**, « which will now be arriving in
  June » (« An Update on Operations », 22 avril 2026 14:02 UTC).
- **30 juin 2026** : sortie du mode **Operations** et du **Nomad**, en accès anticipé Arx pour ce dernier (date
  annoncée dans « Discover the Nomad », 2 juin 2026 13:03 UTC) ; notes de version publiées le **1er juillet 2026**.
- **2 septembre 2026** : la mise à jour **Rhino SRV Update** ajoute une septième opération, **Under Siege**, dont le
  scénario se joue autour d'un **settlement planétaire** assiégé — un point de contact direct entre le mode
  multijoueur et le décor des opérations au sol décrites dans cette partie.

Pour les évolutions liées à la Colonisation et à Powerplay 2.0, voir respectivement
[Colonisation de systèmes et sécurité des installations planétaires](#colonisation-de-systèmes-et-sécurité-des-installations-planétaires)
ci-dessus et
[Powerplay et missions de mercenariat au sol](#powerplay-et-missions-de-mercenariat-au-sol) plus haut. Pour les
évolutions de 2026 (mode Operations, Nomad, Rhino), voir la
[partie A](#partie-a--le-mode-operations-multijoueur-en-escouade-2026).

## Stratégies et conseils pour progresser efficacement dans les opérations au sol

- **Commencer petit** : réaliser des missions à faible menace en Flight Suit pour apprendre les mécaniques de
  détection et d'alarme avant d'investir dans une combinaison spécialisée.
- **Choisir la combinaison selon le style de mission dominant** plutôt que de tout miser sur un seul modèle :
  Dominator pour le combat frontal et les CZ, Maverick pour l'infiltration et le piratage, Artemis pour la
  polyvalence et le combat discret à distance.
- **Prioriser l'accès aux Engineers d'équipement à pied** dès que possible (voir
  [le tableau des Engineers par archétype](#les-engineers-à-pied-par-archétype-de-mission) plus
  haut) : l'écart entre équipement stock et équipement engineeré est déterminant, en particulier pour les CZ High.
- **Jouer les opérations les plus difficiles en groupe**, via les missions partagées, afin de répartir la pression
  de détection et de combat et de sécuriser l'extraction.
- **Utiliser les settlements à sécurité faible ou moyenne** pour farmer matériaux et réputation avant de s'attaquer
  aux sites à haute sécurité.
- **Préparer un plan de fuite** avant toute action bruyante (sabotage, vol avec alarme probable) : connaître à
  l'avance le chemin de retour au vaisseau limite les risques en cas d'alerte complète.
- **Surveiller l'état Powerplay du système visé** avant une session de Mercenariat/défense de faction, pour profiter
  du bonus de mérites lié à l'axe (Acquisition, Renforcement, Undermining) actuellement assigné par le Power local
  (voir [02-powerplay.md](./02-powerplay.md)).

## Notes sur les guides communautaires Steam consacrés aux opérations au sol

Deux guides publiés sur la page Steam Community du jeu traitent spécifiquement de ce périmètre et peuvent compléter
ce document pour les commandants souhaitant approfondir certains détails d'équipement ou de mission :

- *Ground Combat Modules (Elite Dangerous)* par ZanyScum — recensement des modules disponibles pour combinaisons et
  armes de poing.
- *How to do Odyssey Assassination Missions* par Sighman — guide dédié aux missions d'assassinat à pied.

## Questions fréquentes

**Le mode Operations et les « opérations au sol » (ground operations), c'est la même chose ?**

Non : ce sont deux contenus distincts qui portent tous les deux le nom « Operations ». Le **mode Operations**
(multijoueur, escouades de 4 commandants) est sorti le **30 juin 2026** ; les **opérations au sol** désignent le
gameplay à pied introduit par l'extension **Odyssey**, sortie le **19 mai 2021** (settlements, missions,
infiltration, zones de conflit à pied). Voir [Vue d'ensemble — deux contenus nommés « Operations » à ne pas
confondre](#vue-densemble--deux-contenus-nommés--operations--à-ne-pas-confondre).

**Combien de commandants peuvent former une escouade (squad) pour une Operation ?**

Jusqu'à **4 commandants**, en escouade déjà constituée ou complétée par un appariement (*matchmaking*) optionnel pour
les places restantes. Chaque opération se déroule dans un environnement isolé et instancié, découpé en plusieurs
étapes de difficulté croissante — ce n'est donc pas une activité de la galaxie persistante. Voir [Principe du mode
Operations](#principe-du-mode-operations--une-couche-de-gameplay-en-escouade-jusquà-4-commandants).

**Comment lancer une Operation (comment y accéder) ?**

Depuis un **tableau de missions**, à quai dans un starport, sur un Fleet Carrier ou sur un Squadron Carrier — il faut
être à quai pour sélectionner l'opération et envoyer les invitations. Une opération peut être lancée seul ou par une
escouade déjà formée, les places restantes pouvant être comblées par appariement. Voir [Lancer une opération
Operations](#lancer-une-opération-operations--escouade-appariement-et-accès-depuis-les-tableaux-de-missions).

**C'est quoi l'Operation Runner ?**

Le vaisseau de déploiement spécialisé qui transporte toute l'escouade vers le système du scénario. Il sert aussi de
**point de réapparition** (un commandant mis hors de combat y revient avec un vaisseau entièrement réparé, ravitaillé
et réarmé) et de **point d'extraction final** de l'opération. Voir [L'Operation
Runner](#loperation-runner--vaisseau-de-déploiement-de-réapparition-et-dextraction).

**Combien y a-t-il d'Operations différentes, et lesquelles ?**

**Sept** : Tactical Takedown, Firestorm Rescue, Reclamation Point, Biohazard Takedown, Rapid Response et Terminal
Prosecution (les six sorties le 1er juillet 2026), plus **Under Siege**, ajoutée le **2 septembre 2026**. Voir
[Les sept opérations disponibles](#les-sept-opérations-disponibles-de-tactical-takedown-à-under-siege).

**Le Merc Coin, ça s'achète avec de l'Arx ?**

Non : le **Merc Coin** est une monnaie gagnée uniquement en réussissant un scénario d'Operations (avec un bonus
hebdomadaire pour certaines activités), explicitement **non achetable en Arx**. Un plafond de 9 999 Merc Coins et un
gain limité à 1 000 par semaine circulent dans la documentation communautaire, mais Frontier n'a publié aucun des
deux chiffres — à confirmer en jeu. Voir [Récompenses du mode
Operations](#récompenses-du-mode-operations--la-monnaie-merc-coin-et-le-catalogue-mercgear).

**Le MercGear, ça contient combien d'objets (modules et blueprints) ?**

**Quinze entrées** au lancement : 2 blueprints (Thermal Plasma Conversion, Scoop Rate Enhanced), 8 hardpoints
pré-ingénierés, 2 core internals pré-ingénierés et 3 internes optionnels pré-ingénierés. Le MercGear reste
ingénierable après achat, comme un module classique. Voir [Récompenses du mode
Operations](#récompenses-du-mode-operations--la-monnaie-merc-coin-et-le-catalogue-mercgear).

**Le mode Operations a-t-il encore des bugs (known issues) en ce moment ?**

Oui : Frontier le livre sous le statut explicite de « Networking & Balancing Beta », sujet à des ajustements serveur
réguliers. Au 2 septembre 2026, deux problèmes connus subsistent : l'opération **Under Siege peut se terminer
prématurément**, et l'**interface de wing à pied est absente**. Voir
[partie A](#partie-a--le-mode-operations-multijoueur-en-escouade-2026).

**Comment savoir le niveau de sécurité (security level) d'un settlement avant d'y poser le vaisseau ?**

Chaque settlement affiche l'un de quatre niveaux — aucune/civile, faible, moyenne, élevée — qui conditionne le
nombre de gardes, la présence de tourelles ou de drones, et la vitesse de réaction en cas d'alerte (renforts limités
en sécurité faible, verrouillage total et scans au décollage en sécurité élevée). Voir [Niveaux de sécurité d'un
settlement](#niveaux-de-sécurité-dun-settlement-civile-faible-moyenne-élevée).

**Quelle combinaison (suit) choisir pour le combat à pied ?**

Quatre familles existent : la **Flight Suit** de départ (polyvalente, peu de modules), la **Dominator** (combat
lourd, résistance et bouclier élevés), la **Maverick** (mobilité et discrétion, pour l'infiltration/piratage) et
l'**Artemis** (utilitaire/reconnaissance, exobiologie). Voir [les quatre combinaisons Flight, Dominator, Maverick,
Artemis](#séquiper-à-pied--les-quatre-combinaisons-suits-flight-dominator-maverick-artemis).

**Combien rapporte une mission au sol selon son niveau de menace (threat level) ?**

Ce sont des **ordres de grandeur communautaires non vérifiés en session**, à confirmer en jeu : quelques dizaines de
milliers de Cr en menace faible, plusieurs dizaines à ~100 000+ Cr en menace moyenne, et de l'ordre de plusieurs
centaines de milliers de Cr en menace élevée (davantage pour les zones de conflit High soutenues). Voir
[Récompenses des opérations au sol par niveau de
menace](#récompenses-des-opérations-au-sol-par-niveau-de-menace).

**Comment rester discret (stealth) pendant une mission au sol ?**

La détection dépend du champ de vision des gardes et des caméras, du bruit produit (courir est bien plus détectable
que marcher accroupi) et de l'état apparent du joueur (dégainer une arme en zone surveillée déclenche la suspicion).
Être repéré fait monter un niveau de suspicion progressif, qui peut redescendre hors de vue ou déclencher une alerte
complète. Voir [Infiltration, détection et système
d'alarme](#infiltration-détection-et-système-dalarme).

## Voir aussi

Ce guide couvre le **mode multijoueur Operations** (partie A) et les **mécaniques d'opération au sol** (partie B :
settlements, missions, infiltration, CZ). Pour éviter les redites entre guides du corpus, le détail exhaustif de
certains sujets connexes vit ailleurs :

- **[14 — Rhino et Nomad](./14-rhino.md)** — chronologie, caractéristiques et modules du **Nomad**, le
  ship-launched vessel livré par la mise à jour Operations, et du **Rhino**, ajouté le 2 septembre 2026 en même temps
  que l'opération Under Siege.
- **[23 — Jeu en groupe](./23-jeu-en-groupe.md)** — wings, modes de jeu et coordination multijoueur, cadre général
  dans lequel s'inscrivent les escouades d'Operations.
- **[07 — Équipement à pied](./07-equipement-a-pied.md)** — catalogue complet des armes par fabricant, tables
  d'ingénierie exhaustives (Engineers, blueprints, coûts, grades de matériaux), builds nommés, outils et
  consommables. Ce guide-ci ne reprend que des tableaux condensés qui renvoient vers 07 pour l'exhaustif.
- **[09 — Combat à pied](./09-combat-a-pied.md)** — tactiques et choix de style de jeu en combat à pied.
- **[26 — Ingénierie à pied avancée](./26-ingenierie-a-pied-avancee.md)** — quelles opérations au sol rapportent quels
  matériaux : missions de réactivation/restauration, corrélation entre économie du settlement et loot, farming ciblé
  des schémas d'armes et des Data, et règles d'échange chez le barman.
- **[06 — Ingénieurs](./06-ingenieurs.md)** — mécanique générale de l'ingénierie (vaisseaux et à pied).
- **[02 — Powerplay](./02-powerplay.md)** — Powerplay 2.0 / extension Ascendancy (31 octobre 2024), cycles
  hebdomadaires Acquisition/Renforcement/Undermining et leur effet sur les missions et zones de conflit au sol.
- **[18 — Colonisation](./18-colonisation.md)** — mécanique complète de colonisation de systèmes et des nouvelles
  installations qu'elle crée.
- **[00 — Chronologie canonique](./00-chronologie-canonique.md)** — arbitrage daté de toutes les confusions
  chronologiques mentionnées dans ce guide et des corrections qui y ont été appliquées.

## Sources

### Sources primaires du mode Operations (partie A)

Billets d'annonce officiels de Frontier Developments, relevés le 9 septembre 2026 sur le flux d'actualités officiel
d'*Elite Dangerous* (appid Steam 359320), via l'API publique
`api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320`, qui republie les annonces de Frontier sans
intermédiaire :

- « Elite Dangerous | An Update on Operations », **22 avril 2026 14:02 UTC** | primaire | consulté le 09/09/2026 | confirme : le report du mode Operations à juin 2026, le principe du système en plusieurs étapes pour escouades de 4 commandants, l'accès depuis les tableaux de missions (station, Fleet Carrier, Squadron Carrier) et le rôle de l'Operation Runner (hub, réapparition, extraction) | ne confirme pas : la date de sortie définitive (reportée une nouvelle fois par la suite au 30 juin 2026), ni que les six scénarios ici nommés (Counter Attack, Burning Rescue…) correspondent officiellement aux six opérations sorties au lancement — rapprochement éditorial de ce guide, non confirmé par Frontier
- « Elite Dangerous | Discover the Nomad », **2 juin 2026 13:03 UTC** | primaire | consulté le 09/09/2026 | confirme : la date de sortie du 30 juin 2026 pour le mode Operations et pour le Nomad, ce dernier en accès anticipé Arx | ne confirme pas : le contenu détaillé des opérations, de l'Operation Runner ou du catalogue MercGear, révélés seulement le 1er juillet 2026
- « Elite Dangerous | Operations Update », **1er juillet 2026 14:01 UTC** | primaire | consulté le 09/09/2026 | confirme : les notes de version complètes — principe du mode en escouade, composition d'équipe et matchmaking, rôle de l'Operation Runner, les six opérations de lancement, les modes Mercenary et Powerplay, le Merc Coin et le catalogue MercGear de quinze entrées, le Nomad, le statut « Networking & Balancing Beta » | ne confirme pas : le plafond de 9 999 Merc Coins ni la limite hebdomadaire de 1 000 (données communautaires non publiées par Frontier), ni la correspondance entre ces six opérations et les six scénarios annoncés en avril
- « Elite Dangerous | Operations Update | Update 3 », **9 juillet 2026 10:24 UTC** | primaire | consulté le 09/09/2026 | confirme : les correctifs post-lancement — restitution des récompenses et inventaires à pied, restauration des données d'exploration, bouton « Resync Local Data », amélioration de la lisibilité du Merc Engineering | ne confirme pas : les numéros de version client 4.4.0.0/4.4.0.3, qui proviennent du ticket EDCD/EDDI n° 2849 et non de ce billet
- « Elite Dangerous | Rhino SRV Update », **2 septembre 2026 11:20 UTC** | primaire | consulté le 09/09/2026 | confirme : l'ajout de la septième opération Under Siege, les correctifs Powerplay Squad et MercGear, et les deux problèmes connus signalés (fin prématurée d'Under Siege, interface de wing à pied absente) | ne confirme pas : le déroulé en deux temps d'Under Siege ni la nature de la « menace plus importante » en fin d'opération (voir la source MassivelyOP ci-dessous)
- https://massivelyop.com/2026/08/27/elite-dangerous-takes-a-quick-look-at-the-rhino-vehicle-surface-mining-and-a-new-operation-arriving-september-2/ | tertiaire (presse, palier confirmé fiable — voir [00-methodologie-sourcing.md §7](./00-methodologie-sourcing.md)) | consulté le 13/09/2026 | confirme : déroulé en deux temps d'Under Siege (menaces aériennes puis combat au sol, puis « menace plus importante ») | ne confirme pas : la nature de cette menace additionnelle
- ticket **EDCD/EDDI n° 2849**, 5 août 2026 | secondaire | consulté le 09/09/2026 | confirme : les versions client 4.4.0.0 (30 juin 2026) et 4.4.0.3 (9 juillet 2026), relevées dans le journal de jeu joint au ticket | ne confirme pas : une numérotation de version officiellement publiée par Frontier — donnée communautaire, citée comme telle et non comme source officielle

### Sources des opérations au sol (partie B)

- https://en.wikipedia.org/wiki/Elite_Dangerous | secondaire | consulté le 09/09/2026 | confirme : le contexte général de l'extension Odyssey (sortie le 19 mai 2021) et du gameplay à pied qu'elle introduit | ne confirme pas : le détail des mécaniques de settlement, de sécurité, d'équipement ou d'Engineers à pied propres à ce guide
- https://www.edsm.net/en/ | secondaire | consulté le 09/09/2026 | confirme : le rôle d'EDSM comme base communautaire de référence, utile en recoupement général | ne confirme pas : un détail spécifique aux opérations au sol documenté dans cette partie
- https://canonn.science/ | secondaire | consulté le 09/09/2026 | confirme : le rôle de Canonn Research comme base communautaire de recherche recoupée | ne confirme pas : un détail spécifique aux opérations au sol documenté dans cette partie
- https://www.pcgamesn.com/elite-dangerous | tertiaire | consulté le 09/09/2026 | confirme : la couverture de presse spécialisée générale du jeu | ne confirme pas : un chiffre ou une mécanique précise des opérations au sol
- https://steamcommunity.com/app/359320/guides/ | tertiaire | consulté le 09/09/2026 | confirme : l'existence du répertoire de guides communautaires Steam, dont les deux cités plus haut (ZanyScum, Sighman) | ne confirme pas : l'exactitude détaillée de leur contenu, non vérifiée ligne à ligne par ce guide
- https://steamcommunity.com/app/359320/guides/?searchText=odyssey+ground+combat | tertiaire | consulté le 09/09/2026 | confirme : le repérage des deux guides Steam cités (*Ground Combat Modules*, *How to do Odyssey Assassination Missions*) | ne confirme pas : un contenu propre au-delà de ce repérage

**Note de vérification (9 septembre 2026)** : la table de récompenses par niveau de menace n'a pas pu être recoupée
avec une source primaire ou une base communautaire dans cette session (budget de recherche web épuisé ;
elite-dangerous.fandom.com a renvoyé une erreur HTTP 402, inara.cz une erreur HTTP 410 lors des tentatives d'accès
direct). Les autres données de la partie B (settlements, missions, Engineers, armes) proviennent du recoupement avec
07-equipement-a-pied.md, 06-ingenieurs.md, 09-combat-a-pied.md, 02-powerplay.md et 00-chronologie-canonique.md.

**Correction du 9 septembre 2026 (mode Operations et Nomad)** : une révision antérieure de ce guide déclarait le mode
Operations et le vaisseau Nomad non confirmés et en avait retiré tout le contenu. Cette conclusion reposait sur une
erreur de catégorie — chercher un *ship-launched vessel* dans un catalogue de chantier naval — détaillée dans
[Note de méthode](#note-de-méthode--pourquoi-ce-guide-niait-auparavant-lexistence-du-mode-operations) en fin de partie A. Le
contenu correspondant a été rétabli en partie A à partir des billets officiels listés ci-dessus.
