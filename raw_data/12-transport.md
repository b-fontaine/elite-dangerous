---
id: 12-transport
titre: "Guide complet du transport dans Elite Dangerous"
domaine: economie
entites: [Lynx Highliner, Beluga Liner, Orca, Dolphin, Panther Clipper Mk II, Type-8 Transporter, Search & Rescue, Occupied Escape Pods, Stronghold Carrier, cabines passagers, marchandises rares, stations en feu]
mots_cles_en: [passenger cabins, economy cabin, business class cabin, first class cabin, luxury cabin, Lynx Highliner, Beluga Liner, search and rescue, occupied escape pods, burning stations, rare goods, stronghold carrier, colonisation hauling, interdiction escape]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-09
confiance_globale: moyenne
volatilite: moyenne
sources_primaires: [MassivelyOP, PCGamesN, EDSM, EDSY, Canonn Research, Inara.cz, notes de version officielles 4.2.2.0]
zones_incertaines: ["capacités de cabines passagers par taille de module non reconfirmées en direct (valeurs communautaires EDSY/Inara/Coriolis)", "aucun bonus Powerplay propre au Search & Rescue n'a pu être ni confirmé ni infirmé", "tonnages de colonisation donnés en ordres de grandeur composites, non revérifiés", "date du passage du Panther Clipper Mk II à l'achat en crédits (~octobre 2025) non sourcée précisément"]
guides_lies: [2, 3, 18, 19, 22]
---
# Guide complet du transport dans Elite Dangerous

## En bref

Le transport recouvre quatre métiers distincts dans *Elite Dangerous*. Le **transport de passagers** repose sur des
cabines de quatre conforts — Économique, Affaires, Première classe, Luxe (*economy, business, first class, luxury*) —,
un module de taille 6 embarquant 128 passagers en Économique contre 12 en Luxe ; les vaisseaux dédiés sont le Dolphin,
l'Orca et le Beluga Liner, rejoints en avril 2026 par le **Lynx Highliner** de **Zorgon Peterson** (jusqu'à 225
passagers), qui ramène les missions « stations en feu » (*burning stations*). Le **Search & Rescue** consiste à
ramasser Occupied Escape Pods, Black Boxes et Wreckage Components sur épaves et USS, puis à les livrer au contact
dédié en station. Le **fret** sert Powerplay et surtout la **colonisation**, achevée le 11 novembre 2025 (« Dodec
Update », 4.2.2.0), qui exige des milliers à des dizaines de milliers de tonnes par chantier et impose les gros
porteurs : Type-9 Heavy, Imperial Cutter et **Panther Clipper Mk II** (1200 à 1400 t, sorti le 22 juillet 2025),
relayés par un Fleet Carrier en base avancée. Les **marchandises rares** (*rare goods*) se bonifient jusqu'à 150-200
al.

## Vue d'ensemble du transport dans Elite Dangerous et actualités majeures (2024-2026)

Le transport — de passagers, de fret, de marchandises rares ou de matériaux stratégiques — est l'une des activités les
plus polyvalentes d'Elite Dangerous. Entre 2024 et 2026, plusieurs mises à jour majeures ont profondément renouvelé ce
pan du jeu : nouveaux vaisseaux dédiés, refonte complète de Powerplay, ouverture puis achèvement de la colonisation
joueur, retour de missions de sauvetage emblématiques, et développement des Fleet Carriers comme outil logistique à
part entière. Ce guide couvre l'ensemble de ces mécaniques telles qu'elles existent aujourd'hui, avec des renvois vers
les guides dédiés du corpus pour le détail de chaque système connexe (Powerplay, colonisation, Fleet Carriers).

### Chronologie des mises à jour ayant touché le transport (2024-2026)

| Date                 | Mise à jour                                                                                       | Impact sur le transport                                                                                                                                  |
|----------------------|---------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| 7 août 2024          | Lancement du **Type-8 Transporter**                                                               | Nouveau vaisseau de fret moyen, 406 tonnes de capacité, efficace en carburant                                                                            |
| 31 octobre 2024      | **Ascendancy** — Powerplay 2.0 + **Mandalay**                                                     | Refonte complète de la logistique Powerplay ; nouveau vaisseau d'exploration longue portée ; teasing de la colonisation                                  |
| 22 novembre 2024     | Ajustements des gains Powerplay                                                                   | Réduction du temps nécessaire pour monter en rang et débloquer les premiers modules                                                                      |
| 26 février 2025      | **Bêta** de la **colonisation** (mise à jour *Trailblazers*, patch 4.1.x)                         | Les joueurs peuvent revendiquer des systèmes et y construire des installations, créant une toute nouvelle logistique de fret                             |
| 5 mars 2025          | Pause temporaire de la colonisation                                                               | Correction d'un problème après plus de 8 000 systèmes déjà colonisés (et 13 000 installations construites) durant la première semaine de la bêta ouverte |
| 30 avril 2025        | Rééquilibrage économique de la colonisation                                                       | Introduction des liens économiques automatiques entre systèmes colonisés (forts/faibles)                                                                 |
| 22 juillet 2025      | Accès anticipé du **Panther Clipper Mk II**                                                       | Nouveau vaisseau-cargo super-massif, 1200 à 1400 tonnes selon l'outillage, le plus gros transporteur non-capital du jeu                                  |
| ~octobre 2025        | Panther Clipper Mk II disponible contre crédits                                                   | Fin de la fenêtre d'accès anticipé payant                                                                                                                |
| **11 novembre 2025** | **Sortie complète de la colonisation** (« **Dodec Update** », version 4.2.2.0)                    | Fin officielle de la bêta ouverte de colonisation ; introduction de la station Dodec en accès anticipé ARX (correctif « Patch 1 » le 13 novembre 2025)   |
| avril 2026           | **Lynx Highliner** (Zorgon Peterson) distribué gratuitement, puis achetable en crédits (28 avril) | Nouveau vaisseau de transport de passagers de taille moyenne (jusqu'à 225 passagers) ; retour des missions « stations en feu »                           |
| 2 septembre 2026     | Mise à jour minage de surface (SRV **Rhino**)                                                     | Impact indirect sur la logistique de fret vers les zones minières                                                                                        |
Cette chronologie constitue la toile de fond de toutes les mécaniques détaillées ci-dessous : missions de passagers,
sauvetage de survivants, fret pour Powerplay, matériaux rares, logistique de colonisation et Fleet Carriers, et
configurations optimales de vaisseaux.

## Transport de passagers

### Mécaniques générales des missions de passagers

Le transport de passagers repose sur l'installation de **cabines passagers** dans les slots internes du vaisseau, à la
place (ou en complément) des racks de cargo classiques. Il existe quatre niveaux de confort, du plus dense au plus
exclusif :

- **Économique** — la classe la plus dense : elle permet d'embarquer le plus grand nombre de passagers par tonne, mais
  rapporte le moins par tête.
- **Affaires (Business)** — un compromis entre densité et rémunération.
- **Première classe (First Class)** — occupe des slots proportionnellement plus grands pour moins de passagers, contre
  une rémunération nettement supérieure.
- **Luxe (Luxury)** — la classe la plus exigeante en espace, réservée aux plus gros vaisseaux dédiés, mais la mieux
  rémunérée par passager.

Chaque mission de transport de passagers précise plusieurs paramètres à vérifier avant acceptation :

- le nombre de passagers et la classe de cabine exigée ;
- le statut **VIP** ou non du passager (un VIP à haute valeur peut justifier une escorte armée) ;
- la destination et, souvent, une **limite de temps** stricte ;
- le statut légal : certains passagers sont **recherchés** ou voyagent clandestinement, ce qui impose d'éviter les scans
  de sécurité — l'équivalent de la contrebande appliqué aux personnes.

La réputation avec les factions locales et les superpuissances déverrouille progressivement des contrats mieux rémunérés
et des passagers VIP à forte valeur. À l'inverse, l'échec d'une mission — destruction du vaisseau, dépassement du délai,
arrivée au mauvais quai — entraîne la perte du passager, une pénalité de réputation, voire une prime (bounty) si le
passager bénéficiait d'une protection particulière.

### Classes de cabines passagers : l'arbitrage densité / rémunération

| Classe de cabine | Densité de passagers | Rémunération par tête | Usage typique                                             |
|------------------|----------------------|-----------------------|-------------------------------------------------------------|
| Économique       | Très élevée          | Faible                | Missions de masse, évacuations, sauvetages                  |
| Affaires         | Élevée               | Moyenne               | Missions courantes à bon rendement                           |
| Première classe  | Modérée              | Élevée                | Contrats VIP, tourisme haut de gamme                         |
| Luxe             | Faible               | Très élevée           | Circuits de luxe longue distance sur gros porteurs dédiés    |

#### Capacité en passagers par taille de module de cabine (valeurs stock, tailles 2 à 6)

| Taille du module | Économique | Affaires | Première classe | Luxe |
|-------------------|------------|----------|-------------------|------|
| 2                  | 8          | 4        | —                  | —    |
| 3                  | 16         | 8        | 3                  | —    |
| 4                  | 32         | 16       | 6                  | 3    |
| 5                  | 64         | 32       | 12                 | 6    |
| 6                  | 128        | 64       | 24                 | 12   |

> **Fraîcheur des données :** ces chiffres correspondent aux valeurs historiquement documentées par la communauté
> (EDSY, Inara, Coriolis) pour des cabines en configuration stock. Les recherches web nécessaires pour les revérifier en
> direct au moment de la rédaction de cette mise à jour ont échoué (budget de recherche épuisé, puis erreurs HTTP
> 402/403 sur les bases communautaires habituelles) : ce tableau **n'a donc pas pu être reconfirmé en temps réel**.
> Économique et Affaires existent à partir de la taille 2, Première classe à partir de la taille 3, Luxe à partir de la
> taille 4. Vérifiez les valeurs actuelles sur un configurateur de vaisseau tel qu'EDSY.org avant de planifier un fit
> précis, les patchs d'équilibrage pouvant les faire évoluer.

### Vaisseaux dédiés au transport de passagers

| Vaisseau                              | Fabricant        | Profil      | Points forts                                                                                                                   | Points faibles                                                                             | Usage recommandé                                                                        |
|---------------------------------------|------------------|-------------|----------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| **Dolphin**                           | Saud Kruger      | Petit-moyen | Rapide et agile pour sa catégorie, très abordable, bonne portée grâce à sa faible masse                                        | Capacité de cabines modeste                                                                    | Débuter dans le transport de passagers, missions à faible effectif et haute fréquence     |
| **Orca**                              | Saud Kruger      | Moyen-large | Excellent rapport vitesse/portée de saut, bonne maniabilité                                                                    | Défense et armement faibles                                                                    | Missions VIP/Luxe longue distance où vitesse et autonomie priment                          |
| **Beluga Liner**                      | Saud Kruger      | Grand       | Capacité de cabines la plus élevée parmi les vaisseaux spécialisés, maniabilité correcte pour sa taille                        | Défenses limitées, difficile à poser dans certains petits quais                                | Maximiser le nombre de passagers par rotation (mix Économique/Affaires/Première classe)   |
| **Type-9 Heavy** (reconfiguré)        | Lakon            | Grand cargo | Slots internes énormes permettant une capacité massive en Économique                                                           | Lent, peu maniable, portée réduite une fois chargé                                             | Missions à très gros volume de passagers bon marché                                       |
| **Anaconda**                          | Faulcon deLacy   | Polyvalent  | Combine cargo, cabines et emplacements d'armes/hangar de chasseur ; portée de saut très élevée avec ingénierie                 | Coût d'achat élevé                                                                              | Escorte auto-gérée de passagers VIP à haut risque                                          |
| **Lynx Highliner** *(nouveauté 2026)* | **Zorgon Peterson** | Moyen       | Transporteur de passagers pouvant accueillir jusqu'à 225 personnes, en échange de moins de raffinement que l'Orca ou le Beluga | Confort moindre que les liners établis, vaisseau récent avec un fit d'ingénierie moins documenté | Alternative moderne à forte capacité pour le tourisme de milieu de gamme                   |

> **Correction (audit corpus) :** le Lynx Highliner n'est **pas** un vaisseau Saud Kruger, contrairement à une confusion
> répandue dans certaines sources communautaires (Saud Kruger étant le fabricant « attendu » pour ce type de
> vaisseau de croisière, via l'Orca, le Beluga Liner et le Dolphin). Il s'agit en réalité du tout premier paquebot de
> passagers de **Zorgon Peterson**, fabricant jusque-là plutôt associé à des vaisseaux de combat (Adder, Fer-de-Lance,
> Krait Mk II/Phantom, Mamba) — la fiche produit officielle et la base communautaire Inara confirment toutes deux
> « Manufacturer: Zorgon Peterson ». Voir [03-vaisseaux.md](./03-vaisseaux.md) pour la fiche technique complète et à
> jour de ce vaisseau, source unique de vérité du corpus pour les fiches vaisseaux.
>
> Pour les caractéristiques chiffrées complètes de chacun des vaisseaux ci-dessus (Prix, Portée de saut, Hardpoints,
> Emplacements internes), au format standard du corpus (Nom | Fabricant | Prix | Portée de saut | Hardpoints |
> Emplacements internes | Source | Date), consultez le tableau dédié dans [03-vaisseaux.md](./03-vaisseaux.md) plutôt
> que ce guide, afin d'éviter toute duplication de données susceptibles de diverger après un patch d'équilibrage.
> Ces valeurs sont données en configuration stock ; l'ingénierie (voir [06-ingenieurs.md](./06-ingenieurs.md)) peut les
> modifier significativement.

### Missions spéciales : évacuations et « stations en feu »

Le patch d'avril 2026 a réintroduit les missions **« stations en feu » (burning stations)** : le joueur doit rejoindre
une station spatiale en train de brûler pour en évacuer les civils. Cette mécanique de sauvetage exploite directement
les capacités de transport de passagers en masse, typiquement avec des **cabines Économiques** pour maximiser le nombre
de survivants évacués en un minimum de rotations. Un Beluga Liner, un Lynx Highliner ou un Type-9 Heavy reconfiguré en
configuration Économique dense sont particulièrement adaptés à ce type d'opération d'urgence. Cette mécanique est
étroitement liée au **Search & Rescue** détaillé dans la section suivante, qui couvre le sauvetage de survivants au sens
large (au-delà des seules missions passagers).

## Sauvetage et transport de survivants (Search & Rescue)

Le sauvetage de survivants (**Search & Rescue**, souvent abrégé SAR par la communauté anglophone) est une activité de
transport à part entière, distincte des missions de passagers classiques : elle consiste à récupérer des personnes en
détresse ou des données/effets liés à un naufrage, puis à les livrer à un contact dédié en station.

### Où trouver les marchandises de sauvetage : épaves, USS de détresse, zones de conflit

Les marchandises de type sauvetage se trouvent typiquement :

- sur les **épaves** laissées par des vaisseaux détruits (les vôtres, ceux d'autres joueurs ou de PNJ) ;
- dans les **sites de signal non identifiés (USS)** signalés « détresse » ou « combat » lors du survol d'un système ;
- lors de combats, y compris dans les **zones de conflit** (CZ, voir [00-glossaire.md](./00-glossaire.md)), où des
  vaisseaux détruits laissent parfois des survivants à récupérer ;
- lors des missions d'évacuation type « stations en feu » décrites plus haut, qui produisent directement ce type de
  cargaison.

Les commodités concernées incluent notamment :

- les **capsules de sauvetage occupées (Occupied Escape Pods)** — chaque unité représente un ou plusieurs survivants ;
- les **boîtes noires (Black Boxes)** ;
- les **effets personnels (Personal Effects)** et **composants d'épave (Wreckage Components)**.

Elles se transportent comme du fret classique (soute standard, pas besoin de cabine passagers dédiée), mais doivent être
manipulées avec prudence : scanner ou détruire un vaisseau contenant des occupants vivants avant de les récupérer
entraîne leur perte définitive.

### Livraison au contact Search and Rescue et récompenses associées

La livraison au contact **Search and Rescue** d'une station rapporte :

- une récompense en crédits, généralement supérieure à la revente sur le marché libre de la même marchandise ;
- un gain de réputation avec la faction locale ;
- occasionnellement, une contribution à des **Community Goals** (CG, voir [00-glossaire.md](./00-glossaire.md) et
  [24-community-goals.md](./24-community-goals.md)) à thème « évacuation » ou « secours », lorsqu'un tel objectif est
  actif dans le secteur.

### Search & Rescue et Powerplay : bonus de mérites non confirmé à ce jour

L'audit de ce guide demandait de documenter un éventuel bonus Powerplay lié au Search & Rescue. **Cette information n'a
pas pu être vérifiée** lors de la rédaction de cette mise à jour : les recherches web nécessaires ont échoué (budget de
recherche de session épuisé, puis erreurs HTTP 402/403 sur les bases communautaires habituelles — la même limitation
que celle rencontrée sur elitedangerous.com et forums.frontier.co.uk pour d'autres vérifications de ce corpus), et
aucune source déjà en main ne documente un multiplicateur de mérites propre au Search & Rescue dans Powerplay 2.0.

Ce qui est établi avec confiance sur la mécanique générale (voir [02-powerplay.md](./02-powerplay.md) pour le détail à
jour) : les mérites Powerplay se gagnent par combat ou par livraison de la marchandise d'acquisition propre à chaque
Puissance auprès d'un contact Powerplay local (voir la section suivante). Rien dans les sources consultées ne confirme
ni n'infirme que les marchandises de sauvetage comptent dans cette seconde catégorie pour une Puissance donnée.
**N'ajoutez pas ce bonus à une stratégie de mérites sans l'avoir vérifié vous-même via les notes de mise à jour
officielles ou [02-powerplay.md](./02-powerplay.md).**

## Transport de fret pour factions et Powerplay

### Powerplay 2.0 : des états de contrôle territorial progressifs

Depuis **Ascendancy** (31 octobre 2024), Powerplay a été entièrement refondu. Les territoires progressent désormais à
travers une échelle d'états de contrôle :

1. **Non-contrôlé** — aucune Puissance présente.
2. **Expansion** — une faction prend pied dans le système.
3. **Contesté** — plusieurs Puissances rivalisent pour le contrôle.
4. **Exploité** — une Puissance domine mais le contrôle n'est pas total.
5. **Fortifié** — contrôle avancé, ressources renforcées.
6. **Bastion (Stronghold)** — contrôle total.

Le passage d'un système au statut bastion modifie visuellement le branding du concourse selon le nouveau gouvernement et
augmente exponentiellement les récompenses et ressources disponibles.

### Merits et logistique de fret pour les Puissances

L'économie de Powerplay repose sur les **merits (mérites)**, gagnés de deux façons :

- **par le combat** : interdiction et destruction d'ennemis affiliés à des factions rivales dans son système d'attache ;
- **par la logistique de fret** : achat/collecte d'une commodité liée à la Puissance, puis livraison au contact
  Powerplay local, au service de la fortification, de l'expansion ou de la sape (undermining) des Puissances rivales.

Un classement hebdomadaire par rang de contribution (par exemple atteindre le top 25 % ou le top 75 % de sa Puissance)
détermine le paiement final en crédits. En novembre 2024, Frontier a ajusté les gains pour réduire le temps nécessaire à
la montée en rang et au déblocage des premiers modules, tout en corrigeant un exploit et des problèmes affectant
certains chefs de faction. Le système continue de faire l'objet d'ajustements réguliers tout au long de 2025.

### Stronghold Carriers : la logistique en territoire bastion

Powerplay 2.0 introduit les **Stronghold Carriers**, d'immenses porte-vaisseaux disponibles uniquement dans les systèmes
au statut bastion, réservés aux membres de la faction dominante. Ils offrent des installations d'équipement et un
inventaire de vaisseaux supérieurs à ceux d'un port classique, mais constituent également des **cibles de grande
valeur** pour les Puissances rivales — créant une dynamique risque/récompense pour tout convoi logistique qui les
approvisionne ou en dépend.

> À ne pas confondre avec les **Fleet Carriers** (porte-vaisseaux appartenant à des joueurs), présentés en détail dans
> la section [Fleet Carriers](#fleet-carriers--base-logistique-mobile) ci-dessous.

### Classement des Puissances Powerplay : donnée centralisée dans 02-powerplay.md

Le nombre de systèmes contrôlés par chaque Puissance change en continu au gré de l'activité des joueurs et des cycles
hebdomadaires de Powerplay ; publier ici un classement figé reviendrait à diffuser une donnée obsolète dès sa lecture,
et une version antérieure de ce guide contenait à ce sujet un tableau daté de novembre 2024 en désaccord avec les
chiffres tenus à jour ailleurs dans le corpus. **Ce guide ne présente donc plus de classement des Puissances** : le
corpus centralise cette donnée dans [02-powerplay.md](./02-powerplay.md), qui fait foi comme **source unique de
vérité** pour l'état courant des territoires et des rangs de Puissance — consultez-le pour toute décision logistique
liée au fret Powerplay (choix de la Puissance à approvisionner, systèmes en expansion ou contestés à privilégier, etc.).

## Colonisation et logistique multi-systèmes

### Le système de colonisation (bêta depuis février 2025, complet depuis novembre 2025)

Ouvert officiellement en **bêta** le 26 février 2025 (mise à jour **Trailblazers**, patch 4.1.x), après un report puis
une pause volontaire début mars 2025 pour corriger un problème non précisé mais décrit comme affectant significativement
la capacité à revendiquer des systèmes, le système de **colonisation** permet aux joueurs et aux escadrons de :

1. **revendiquer** un système inhabité, à distance minimale des systèmes peuplés existants ;
2. **commander la construction** de starports, d'installations planétaires et d'avant-postes.

L'engouement a été tel que plus de **8 000 systèmes** avaient déjà été revendiqués et plus de **13 000 installations**
construites dès la première semaine de la bêta ouverte, ce qui a motivé la pause de début mars 2025 (les colonies
existantes ont continué de progresser normalement pendant la pause, sans aucun retour en arrière).

La bêta s'est refermée le **11 novembre 2025**, avec la sortie complète du système via la mise à jour officiellement
nommée **« Dodec Update »** (version 4.2.2.0), dont les notes officielles indiquent explicitement la fin de la
« System Colonisation Beta » et introduisent en parallèle la station Dodec en accès anticipé ARX (suivie d'un
correctif « Patch 1 » le 13 novembre 2025). La colonisation est donc désormais une mécanique stable et définitive du
jeu, non plus une fonctionnalité expérimentale.

Ce chantier constitue le plus gros défi logistique actuel du jeu : construire une installation nécessite de livrer
physiquement de très grandes quantités de marchandises de construction (matériaux, équipements) au site. Cela a fait des
plus gros porteurs de fret — Type-9 Heavy, Imperial Cutter, et depuis juillet 2025 le Panther Clipper Mk II — les outils
de choix pour ce type d'opération, souvent organisée en convois coordonnés par escadron ou appuyée sur un Fleet Carrier
servant de base avancée pour raccourcir le dernier saut de livraison. Pour l'ensemble des mécaniques de colonisation
(revendication, économies, gouvernance des systèmes), voir le guide dédié **[18-colonisation.md](./18-colonisation.md)**.

### Marchandises et tonnage de la colonisation (ordre de grandeur)

| Type de projet                            | Tonnage total approximatif                          | Nombre de marchandises différentes typiques |
|---------------------------------------------|--------------------------------------------------------|-------------------------------------------------|
| Avant-poste simple                          | de l'ordre de quelques milliers de tonnes               | 5 à 10                                            |
| Starport (Coriolis / Ocellus)               | de l'ordre de la dizaine de milliers de tonnes          | 15 à 20                                           |
| Installation planétaire                     | de l'ordre du millier à quelques milliers de tonnes     | 5 à 8                                              |
| Structure orbitale majeure (Orbis, etc.)    | plusieurs dizaines de milliers de tonnes                | 20 et plus                                        |

> **Instantané capturé le 9 septembre 2026, à revérifier :** ces ordres de grandeur sont des estimations composites
> issues de la connaissance générale du système de colonisation ; ils n'ont pas pu être revérifiés en direct pour cette
> mise à jour (recherche web indisponible — budget épuisé, puis erreurs HTTP 402/403 sur les sources habituelles). Le
> détail exact et à jour des marchandises requises, projet par projet, est tenu par
> **[18-colonisation.md](./18-colonisation.md)**, qui sert de **source unique de vérité** sur ce sujet ; ces besoins ont
> déjà été ajustés une fois par le passé (rééquilibrage du 30 avril 2025 décrit ci-dessous) et peuvent l'être de nouveau.

### Liens économiques automatiques entre systèmes colonisés (depuis avril 2025)

Le rééquilibrage du 30 avril 2025 a introduit des **liens économiques automatiques** entre systèmes colonisés :

- des liens **forts** entre ports au sein d'un même système ;
- des liens **faibles** via des installations de soutien, qui peuvent fournir une partie de leur économie aux ports du
  système.

Ces liens modifient dynamiquement l'offre, la demande et la disponibilité des marchandises, et font apparaître de
**nouvelles routes commerciales** à mesure que la frontière coloniale se développe — le type d'économie qui émerge
(high-tech, extraction, tourisme, etc.) dépend directement des choix de construction effectués par les colons.

### Vaisseaux et méthodes recommandés pour la logistique de colonisation

- **Type-9 Heavy** et **Imperial Cutter** : gros porteurs éprouvés, bon compromis capacité/disponibilité.
- **Panther Clipper Mk II** : le plus gros transporteur non-capital du jeu, avec une capacité estimée entre 1200 et
  1400 tonnes selon l'outillage — bien au-delà du Type-9 Heavy ou de l'Imperial Cutter — idéal pour les livraisons
  massives en une seule rotation.
- **Fleet Carrier** : base avancée permettant de rapprocher le stock de matériaux de construction du site final,
  réduisant le nombre de sauts nécessaires par rotation (voir sous-section dédiée ci-dessous).
- **Convois d'escadron coordonnés** : répartir la charge entre plusieurs joueurs accélère considérablement la
  construction d'une installation — voir [22-squadrons.md](./22-squadrons.md) pour l'organisation d'escadron.

### Fleet Carriers : base logistique mobile

Le **Fleet Carrier** (porte-vaisseau appartenant à un joueur ou à un escadron — à ne pas confondre avec les
**Stronghold Carriers** de Powerplay, propriété d'une Puissance et non d'un joueur, décrits plus haut) est un outil de
transport à part entière : il permet de déplacer un stock de marchandises, de vaisseaux et de modules sur de longues
distances en un minimum de sauts, puis de servir de **base avancée** pour raccourcir la dernière portion d'une rotation
de fret — un usage déjà cité ci-dessus pour la logistique de colonisation, et tout aussi pertinent pour approvisionner
un convoi Powerplay loin de sa base d'attache.

Ce guide n'entre pas dans le détail de son fonctionnement (achat, entretien en Tritium, gestion d'escadron, services
embarqués, marché privé) : cette mécanique dispose désormais de son propre guide dédié,
**[19-fleet-carriers.md](./19-fleet-carriers.md)**, qui fait foi comme source de référence sur le sujet.

## Transport de matériaux et données rares

### Marchandises rares (Rare Goods)

Chaque marchandise rare est produite dans **une seule station source** dans toute la galaxie, et se vend légalement (à
de rares exceptions près) partout ailleurs. Son prix de vente augmente avec la distance parcourue depuis la station
d'origine, jusqu'à un plafond situé généralement autour de **150 à 200 années-lumière**, au-delà duquel le bonus
n'augmente plus.

Caractéristiques pratiques à connaître :

- la demande par station reste faible, de quelques dizaines à environ **130 unités** ;
- les traders combinent donc plusieurs rares différents sur une même boucle pour remplir leur soute ;
- les boucles classiques enchaînent **8 à 12 stations sources** rapprochées (souvent dans le cœur de la bulle habitée),
  suivies d'un long trajet vers un hub à forte population pour vendre au bonus maximal, puis d'un retour pour se
  réapprovisionner ;
- c'est une activité peu risquée et à faible mise de départ, souvent combinée avec des **cabines passagers** (Beluga,
  Orca, Dolphin) puisque les rares occupent peu de place en soute.

### Transport de données : courrier Odyssey à pied et cargo de données classifiées

Le transport de données est la variante la moins encombrante du métier de transporteur : la marchandise n'occupe
aucune place, ou presque, en soute. Deux mécaniques distinctes coexistent :

1. **Missions « à pied » (Odyssey)** : courrier de données via un terminal, transport physique sur soi sans passer par
   la soute du vaisseau, avec nécessité d'éviter la détection.
2. **Missions cargo classiques** : la marchandise transportée est un type de données classifiées ou scientifiques,
   fonctionnant comme n'importe quelle mission de fret standard.

### Matériaux et données des Gardiens (Guardians)

Les matériaux et données Gardiens sont collectés sur les sites et structures Gardiens (Obélisques, orbes, résidus) puis
transportés vers un **Tech Broker Gardien** pour débloquer des armes et modules exclusifs — un exemple direct de
transport de matériaux rares à forte valeur stratégique. **Canonn Research** (canonn.science) reste la référence
communautaire pour la cartographie et la documentation scientifique de ces mécaniques, avec une section « Science »
organisée par thèmes et un Codex détaillé des espèces et sites découverts.

## Configurations de vaisseaux optimales pour le transport

### Choisir sa classe de cabine : l'arbitrage central du transporteur de passagers

Pour tout transporteur de passagers, le choix de classe de cabine détermine le profil de mission visé :

- **Économique** maximise le nombre de passagers par tonne — utile pour les missions de masse et les évacuations type «
  stations en feu » ou Search & Rescue.
- **Affaires** et **Première classe** réduisent la densité mais augmentent fortement le paiement par passager.
- **Luxe** est la classe la plus exigeante en espace mais la mieux rémunérée, réservée aux gros vaisseaux dédiés (Orca,
  Beluga Liner).

### Optimiser l'autonomie de saut du FSD (jump range) d'un transporteur

L'autonomie de saut est le nerf de la guerre pour tout transporteur longue distance. Les leviers principaux :

- **Alléger le vaisseau** : retirer les modules optionnels non essentiels, privilégier les modules les plus légers
  disponibles pour la classe requise.
- **Ingénierie du FSD** (voir [06-ingenieurs.md](./06-ingenieurs.md)) : le blueprint « Increased Range », combiné à
  l'effet expérimental **Mass Manager** (réduction de la masse des modules), permet un gain significatif de portée.
- **Guardian FSD Booster** : module additionnel ajoutant un bonus fixe de portée, cumulable avec la portée de base
  (rendements décroissants selon le bonus déjà atteint).
- **Arbitrage cargo/cabines vs portée** : plus la cargaison ou le nombre de cabines est élevé, plus la portée chute.
  D'où l'intérêt fréquent de multiplier les trajets partiels plutôt que de charger au maximum sur de très longues
  distances, ou de dédier un vaisseau « éclaireur » allégé pour reconnaître la route avant d'envoyer le gros porteur.
- **Circuits longue distance** (tourisme de luxe, colonisation en périphérie, boucles de rares étendues) : une soute à
  carburant adaptée, voire un fuel scoop, devient pertinente — contrairement aux rotations courtes de commerce
  classique.

### Évasion d'interdiction pour un transporteur peu armé

À l'alerte d'interdiction en supra-luminique, deux choix s'offrent au pilote :

- **Se soumettre** immédiatement (drop contrôlé), utile si l'on compte combattre ou que l'on sait pouvoir s'échapper une
  fois au sol.
- **Résister** en maintenant le réticule à l'opposé de l'icône de l'interdicteur tout en boostant, ce qui peut casser
  l'interdiction et permettre de continuer la route.

Une fois « dropé » en espace normal :

1. S'éloigner de l'interdicteur pour sortir du **mass lock** (verrouillage de masse empêchant tout saut).
2. Charger un saut : **high-wake** (saut vers un autre système) pour une fuite définitive, ou **low-wake** (saut
   supra-luminique dans le même système) pour repositionner rapidement.

Contre-mesures utiles pour un transporteur peu armé :

- **Chaff** — réduit la précision des armes à tourelle/asservies adverses.
- **Banques de cellules de bouclier** — pour encaisser les premières salves.
- **Tourelles de défense ponctuelle (Point Defence)** — contre les missiles.
- **Mode furtif** (silent running + dissipateurs thermiques) — pour éviter d'être repéré par un scanner de sillage/cargo
  avant même la tentative d'interdiction, au prix d'un risque de surchauffe sans bouclier actif.

Stratégie générale recommandée pour un vaisseau peu ou pas armé : privilégier un **bouclier renforcé**, une **vitesse de
pointe/boost élevée**, et une **marge de portée de saut suffisante** pour enchaîner rapidement un low-wake ou un
high-wake plutôt que d'engager le combat.

### Tableau récapitulatif : quel vaisseau de transport pour quel usage ?

| Objectif                                  | Vaisseau recommandé                                            | Raison principale                                |
|-------------------------------------------|------------------------------------------------------------------|-----------------------------------------------------|
| Débuter dans le transport de passagers    | Dolphin                                                          | Abordable, agile, bonne portée                      |
| Tourisme VIP/Luxe longue distance         | Orca                                                              | Meilleur rapport vitesse/portée                     |
| Maximiser les passagers par rotation      | Beluga Liner ou Lynx Highliner                                    | Plus grande capacité dédiée                          |
| Évacuation de masse / « stations en feu » / Search & Rescue | Type-9 Heavy ou Beluga en config Économique      | Volume maximal à faible coût par tête                |
| Escorte de VIP à haut risque              | Anaconda                                                          | Cargo + cabines + armement                           |
| Fret massif pour colonisation/Powerplay   | Panther Clipper Mk II, Type-9 Heavy, Imperial Cutter                | Tonnage maximal par rotation                         |
| Boucles de marchandises rares             | Beluga, Orca, Dolphin (cabines + rares)                           | Rares peu volumineux, combinables avec passagers     |
| Exploration et matériaux Gardiens         | Anaconda ou vaisseau d'exploration équipé Guardian FSD Booster    | Portée de saut étendue                               |
| Base logistique avancée multi-rotation    | Fleet Carrier                                                     | Rapproche le stock du site de livraison final        |

Avant tout achat ou refit important, il reste recommandé de vérifier les statistiques précises (slots de cabines,
tonnage exact, coûts en crédits ou en Arx) sur un configurateur à jour comme EDSY.org, les valeurs de jeu évoluant au
fil des patchs d'équilibrage.

## Voir aussi

- [00-glossaire.md](./00-glossaire.md) — tous les sigles utilisés dans ce guide (CZ, CG, etc.)
- [02-powerplay.md](./02-powerplay.md) — mécaniques Powerplay complètes et classement à jour des Puissances (source
  unique de vérité pour cette donnée)
- [03-vaisseaux.md](./03-vaisseaux.md) — fiches techniques complètes des vaisseaux cités dans ce guide (prix, portée de
  saut, hardpoints, emplacements internes)
- [06-ingenieurs.md](./06-ingenieurs.md) — ingénierie des modules (FSD, boucliers, cellules) qui modifie
  significativement les valeurs stock présentées ici
- [18-colonisation.md](./18-colonisation.md) — mécanique complète de la colonisation de systèmes, marchandises et
  tonnage détaillés
- [19-fleet-carriers.md](./19-fleet-carriers.md) — porte-vaisseaux de joueur, utilisés ici comme base logistique mobile
- [20-minage.md](./20-minage.md) — activité minière, dont la logistique de fret recoupe le transport vers les zones
  minières (cf. mise à jour Rhino)
- [22-squadrons.md](./22-squadrons.md) — organisation des convois d'escadron évoqués dans la logistique de colonisation
  et de fret Powerplay
- [24-community-goals.md](./24-community-goals.md) — mécanique générique des Community Goals, y compris ceux à thème
  sauvetage/évacuation
- [25-combat-ax.md](./25-combat-ax.md) — combat anti-Thargoïde, contexte fréquent des opérations de sauvetage et
  d'évacuation
- [27-debuter-et-progresser.md](./27-debuter-et-progresser.md) — parcours du nouveau Commandant : où situer le
  transport de passagers parmi les premières activités rentables, et pourquoi les Cr/h publiés supposent des
  configurations de fin de partie

## Sources

- https://www.edsm.net/en/
- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://canonn.science/
- https://www.edsy.org/
- https://www.pcgamesn.com/elite-dangerous
- https://www.pcgamesn.com/elite-dangerous/powerplay-2-0-released
- https://www.pcgamesn.com/elite-dangerous/new-ship-type-8
- https://massivelyop.com/2026/09/03/elite-dangerous-launches-mining-updates-surface-mining-and-the-rhino-mining-vehicle/
- https://massivelyop.com/2026/08/27/elite-dangerous-takes-a-quick-look-at-the-rhino-vehicle-surface-mining-and-a-new-operation-arriving-september-2/
- https://massivelyop.com/2026/04/29/elite-dangerous-hands-out-its-new-passenger-ship-for-free-and-brings-back-burning-stations-in-latest-patch/
- https://massivelyop.com/2026/04/23/elite-dangerous-delays-dungeon-like-operations-to-june-makes-new-ship-available-for-credits-april-28/
- https://massivelyop.com/2025/07/01/choose-my-adventure-defending-our-backyard-in-elite-dangerous-for-powerplay-profits/
- https://massivelyop.com/2024/11/22/elite-dangerous-makes-changes-to-powerplay-earnings-and-highlights-the-top-five-powers-in-game/
- https://massivelyop.com/2025/05/14/the-stream-team-first-steps-into-elite-dangerous-powerplay-system/
- https://massivelyop.com/2024/05/30/elite-dangerous-introduces-its-next-new-ship-the-type-8-cargo-hauler/
- https://massivelyop.com/2024/08/01/elite-dangerous-confirms-type-8-ship-launch-and-major-overhauls-to-engineering-for-august-7/
- https://massivelyop.com/2024/08/07/elite-dangerous-deploys-its-new-ship-and-engineering-revamps-in-the-type-8-update/
- https://massivelyop.com/2024/09/10/stick-and-rudder-elite-dangerous-type-8-update-engineering-revamp-saved-the-game/
- https://massivelyop.com/2024/10/18/elite-dangerous-delays-this-months-mandalay-ship-and-powerplay-rework-by-a-week/
- https://massivelyop.com/2024/08/29/elite-dangerous-confirms-a-third-new-ship-and-powerplay-2-0s-arrival-in-october-as-lave-radio-hits-500th-episode/
- https://massivelyop.com/2024/10/31/elite-dangerous-launches-its-ascendancy-update-and-teases-a-brand-new-player-colonization-system/
- https://massivelyop.com/2025/04/30/elite-dangerous-rebalances-colonization-economies-and-teases-its-next-new-ship/
- https://massivelyop.com/2025/02/26/the-stream-team-discussing-and-examining-elite-dangerous-new-colonization-feature/
- https://massivelyop.com/2025/01/30/elite-dangerous-dates-the-release-of-its-colonization-feature-for-february-26/
- https://massivelyop.com/2024/12/20/elite-dangerous-begins-its-holiday-event-and-talks-space-colonization-as-the-thargoid-war-ends/
- https://massivelyop.com/2025/03/05/elite-dangerous-pauses-new-colony-establishment-to-address-an-unspecified-important-issue/
- https://massivelyop.com/2025/05/01/elite-dangerous-unveils-its-next-upcoming-new-ship-frontier-elite-iis-panther-clipper-mkii/
- https://massivelyop.com/2025/06/26/elite-dangerous-outlines-the-upcoming-panther-clipper-mk2-ahead-of-its-paid-early-access-july-22/
- https://massivelyop.com/2025/07/07/elite-dangerous-confirms-a-higher-cash-shop-cost-for-its-upcoming-clipper-mk2-and-other-large-ships/
- https://massivelyop.com/2025/07/22/elite-dangerous-adds-the-mega-heavy-panther-clipper-mk2-to-the-early-access-cash-shop-in-latest-patch/
- https://massivelyop.com/2025/07/23/the-stream-team-taking-the-panther-clipper-mk2-for-a-shakedown-flight-in-elite-dangerous/
- https://massivelyop.com/2018/01/24/elite-dangerous-disables-part-of-its-passenger-transport-system-to-block-huge-credit-exploit/
- https://massivelyop.com/2021/01/27/stick-and-rudder-nine-non-combat-activities-to-enjoy-in-elite-dangerous/
- Correction du fabricant du Lynx Highliner (Zorgon Peterson, et non Saud Kruger) : fiche produit officielle du
  vaisseau et base de données communautaire Inara.cz, confirmées lors de l'audit du corpus. Aucune URL primaire n'a pu
  être citée littéralement depuis cet environnement (elitedangerous.com et forums.frontier.co.uk renvoient une erreur
  HTTP 403 lors des tentatives d'accès direct).
- Sortie complète de la colonisation (« Dodec Update », version 4.2.2.0, 11 novembre 2025) : notes de version
  officielles à l'adresse elitedangerous.com/update-notes/4-2-2-0 (métadonnées CMS confirmées lors de l'audit du
  corpus). Accès direct à cette page bloqué depuis cet environnement (anti-bot), donnée reconstituée via des sources
  miroirs convergentes.
