# Le Rhino, véhicule de minage de surface — et le cas non confirmé du « Nomad »

> **⚠️ Désambiguïsation** — Le mode multijoueur **« Operations »** évoqué (et non confirmé, voir section 3) dans ce
> guide n'a **aucun rapport** avec les **Opérations à pied d'Odyssey** (extension sortie le 19 mai 2021 : missions sur
> settlements, combat à pied, infiltration), qui sont un contenu réel et bien documenté. Pour ce second sujet,
> entièrement distinct malgré le nom proche, voir le guide **[13 — Opérations (gameplay à pied)](./13-operations.md)**.

## Vue d'ensemble

Ce guide documente le **Rhino**, un véhicule de surface (SRV) ajouté à *Elite Dangerous* le 2 septembre 2026 et
entièrement dédié au minage planétaire : contexte de son annonce, calendrier, caractéristiques techniques, coût,
disponibilité et utilisation en jeu. Le Rhino est corroboré avec un niveau de confiance **élevé** par des sources
indépendantes (Steam News Frontier, GalNet officiel — voir [00-chronologie-canonique.md
§4](./00-chronologie-canonique.md)) : le contenu qui lui est consacré (section 2) peut être considéré comme fiable.

Ce guide portait à l'origine également sur un vaisseau nommé « **Nomad** » et sur un mode multijoueur baptisé
« **Operations** », présentés comme liés au calendrier de sortie du Rhino. Une vérification menée le 9 septembre 2026
n'a trouvé **aucune source fiable** confirmant l'existence de l'un ou de l'autre — voir la **section 3** pour le
détail de cette vérification, et [00-chronologie-canonique.md](./00-chronologie-canonique.md) pour l'audit consolidé
du corpus. Les affirmations qui les concernaient (spécifications techniques, fabricant, prix, date de sortie,
classification, noms d'opérations comme « Operation Runner », « Merc Coins », « Firestorm Rescue » ou « Under
Siege ») ont donc été retirées de ce guide plutôt que présentées comme des faits : il s'agit très probablement d'une
prémisse erronée introduite dans le corpus (rumeur, fan-fiction, ou confusion avec un autre jeu ou un mod), pas d'un
contenu réellement livré par Frontier Developments.

### Note sur la fiabilité des données chiffrées

Les prix (Arx), quantités de matières et statistiques de véhicules cités dans ce guide sont, sauf mention contraire,
un **instantané capturé le 9 septembre 2026** — à revérifier en jeu ou sur [Inara.cz](https://inara.cz) avant toute
décision d'achat, ces valeurs pouvant changer avec de futurs correctifs. Ces valeurs sont par ailleurs données en
**configuration stock** ; l'ingénierie (voir [06-ingenieurs.md](./06-ingenieurs.md)) peut les modifier
significativement lorsqu'elle s'applique aux modules concernés.

---

## 1. Contexte : la feuille de route 2026 de Frontier Developments

### 1.1 L'annonce du 17 février 2026

Le 17 février 2026, Frontier Developments a dévoilé sa feuille de route annuelle pour *Elite Dangerous*. Un détail de
vocabulaire a été relevé par la presse spécialisée : l'annonce parlait de « vaisseaux » au sens large (*vessels*) plutôt
que strictement de « ships », laissant entendre que les ajouts de l'année ne seraient pas tous des vaisseaux spatiaux
classiques — ce qui s'est confirmé avec le Rhino, un véhicule terrestre.

Le programme annoncé prévoyait **six sorties de véhicules** dans l'année, réparties par saison :

| Période         | Véhicule / contenu                                                                        | Statut                                                                                  |
|-----------------|-------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| 24 février 2026 | **Kestrel Mk II** — chasseur agile à propulseurs verticaux, canon à plasma spécial Mark 2 | Sorti, accompagné d'une refonte du système audio                                        |
| Avril 2026      | **Lynx Highliner** — vaisseau passager de taille moyenne (jusqu'à 225 personnes)          | Sorti (achat en crédits dès le 28 avril, puis offert gratuitement à partir du 29 avril) |
| Été 2026        | **Rhino** — véhicule de minage de surface (voir section 2)                                | Sorti le 2 septembre 2026 (confirmé). La feuille de route annonçait un second contenu pour cette même période ; son identité n'a pas pu être confirmée (voir section 3) |
| Automne 2026    | Véhicule non identifié                                                                    | Non confirmé à ce jour                                                                  |
| Hiver 2026      | Véhicule non identifié                                                                    | Non confirmé à ce jour                                                                  |

La même annonce évoquait aussi un mode multijoueur dont l'existence n'a pas pu être confirmée par la suite (voir
section 3), ainsi qu'une **refonte** (« feature reboot ») d'un système ancien du jeu, promise pour l'automne 2026,
sans détails supplémentaires disponibles à ce stade.

### 1.2 Rythme de sortie de Frontier avant 2026

Pour resituer le contexte, voici les sorties majeures précédant la feuille de route 2026 (dates recoupées avec
[00-chronologie-canonique.md](./00-chronologie-canonique.md)) :

| Date              | Ajout                         | Nature                                               |
|-------------------|-------------------------------|------------------------------------------------------|
| 22 juillet 2025   | Panther Clipper Mk II         | Gros vaisseau (accès anticipé Arx)                   |
| Août 2025         | Vanguards Patch 1             | Fonctionnalités d'escadron                           |
| 29 septembre 2025 | Type-11 Prospector            | Vaisseau minier + colonisation de systèmes           |
| 16 octobre 2025   | Type-11 Prospector — Update 2 | Ajout de la protection des claims                    |
| 2 décembre 2025   | Caspian Explorer               | Vaisseau d'exploration + IA ennemie à pied améliorée |
| 24 février 2026   | Kestrel Mk II                 | Chasseur                                             |

Le Rhino est d'ailleurs vendu en bundle avec le Type-11 Prospector (voir §2.7), ce qui souligne la filiation
thématique « minage » entre ces deux ajouts.

---

## 2. Le Rhino : véhicule de minage de surface

### 2.1 Présentation générale

Le **Rhino** est un nouveau **SRV** (*Surface Reconnaissance Vehicle*, véhicule de surface) à **six roues**, entièrement
dédié au **minage planétaire**. Ce n'est pas un vaisseau spatial : il se conduit à la surface des astres, comme les SRV
existants du jeu (Scarab et Scorpion), mais s'en distingue nettement par sa vocation purement minière :

- **constructeur** : Vodel (filiale de Core Dynamics selon [15-roadmap.md](./15-roadmap.md)) ;
- **équipage** : jusqu'à **3 joueurs** simultanément (contre 1 place pour le Scarab et 2 pour le Scorpion) — le plus
  gros SRV du jeu à ce jour ;
- **blindage** renforcé pour la conduite sur terrains accidentés ;
- **grande soute**, pensée pour de longues expéditions minières sur lunes et planétoïdes.

### 2.2 Chronologie de l'annonce et de la sortie

| Date               | Événement                                                                                                                                                                                   |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 4 août 2026        | Frontier tease son prochain véhicule via une image cryptique montrant une surface planétaire                                                                                                |
| 6 août 2026        | Vidéo « Rhino Miner – Drive it this August! » sur la chaîne YouTube *The Buur Pit*                                                                                                          |
| 7 août 2026        | Révélation officielle par Frontier (dev blog + vidéo), confirmant les spéculations des joueurs autour d'un « véhicule minier »                                                              |
| 27 août 2026       | Article de prévisualisation fixant la sortie au **2 septembre 2026**, avec des previews de créateurs de contenu disponibles dès le 28 août                                                  |
| 2-3 septembre 2026 | **Lancement effectif**, dans la mise à jour identifiée comme la version **4.4.1.0** ; bande-annonce de lancement relayée le 2 septembre                                                     |
| **3 septembre 2026** | **Hotfix 4.4.1.1** — voir §2.3 pour son contenu (déjà livré, pas une simple annonce future)                                                                                                |

Cette chronologie est corroborée avec un niveau de confiance **élevé** par le fil GalNet officiel (article « Vodel
Reveals New SRV Rhino », daté in-univers du 3 septembre 3312 = 3 septembre 2026 réel) et par les communiqués Steam
News de Frontier — voir [00-chronologie-canonique.md §4](./00-chronologie-canonique.md).

### 2.3 Caractéristiques techniques et équipements

Les caractéristiques chiffrées précises (vitesse, capacité de soute en tonnes, résistance du blindage) n'ont pas été
communiquées officiellement. Les éléments confirmés sont les suivants :

- **six roues motrices**, blindage renforcé pour la conduite sur terrains planétaires accidentés ;
- **cockpit/habitacle pour 3 joueurs** ;
- **scanner de gisements minéraux planétaires** (*Planetary Mining Deposit Scanner*), qui « éclaire » les gisements
  exploitables au sol, de façon similaire au scanner d'astéroïdes classique ;
- **raffinerie embarquée** (*onboard Refinery*) ;
- **module de déploiement de foreuse / plateforme de minage** (*Mining Rig Deployment Module*).

**Limite de collecte : corrigée, pas seulement « annoncée ».** Au lancement (2-3 septembre 2026), la limite de
collecte était de 9 « chunks » (fragments de minerai) par opération de minage — un problème connu. Une version
antérieure de ce guide présentait le passage à 12 chunks comme une simple promesse pour « une future mise à jour ».
Ce n'est plus le cas : le **hotfix 4.4.1.1, publié dès le 3 septembre 2026** (soit le lendemain du lancement), a déjà
porté cette limite de **9 à 12 chunks** par passage, en réponse aux retours des joueurs — voir
[15-roadmap.md](./15-roadmap.md) pour le détail de ce correctif, qui a aussi corrigé des textes provisoires. À la
date de rédaction (9 septembre 2026), aucun autre correctif n'a pu être identifié pour ce véhicule au-delà de
4.4.1.1 ; toute recherche de correctif plus récent n'a pas pu être menée dans cette révision (budget de recherche web
de la session épuisé) — vérifier les notes de version en jeu pour tout ajustement postérieur.

Le véhicule nécessite une **baie de véhicule dédiée** (« hangar de véhicule planétaire large » selon
[15-roadmap.md](./15-roadmap.md)), différente des baies SRV classiques, pour être transporté et déployé depuis un
vaisseau. Les vaisseaux confirmés compatibles avec cette baie au lancement sont :

| Vaisseau compatible | Rôle habituel       | Source                          |
|---------------------|---------------------|----------------------------------|
| Type-9 Heavy        | Cargo lourd         | massivelyop.com (voir Sources)  |
| Crusader             | Multi-rôle          | massivelyop.com (voir Sources)  |
| Clipper Mk II        | Transport/passagers | massivelyop.com (voir Sources)  |

Cette liste n'a pas pu être recoupée avec une seconde source indépendante à ce jour et pourrait être incomplète ;
pour la fiche technique complète d'un vaisseau candidat (soutes, hardpoints, portée de saut), voir
[03-vaisseaux.md](./03-vaisseaux.md).

### 2.4 Armement, sécurité et répartition des rôles

Aucune source consultée — ni les articles de presse, ni [15-roadmap.md](./15-roadmap.md) — ne mentionne de système
d'armement offensif embarqué sur le Rhino, à la différence du Scorpion (SRV de combat). Le Rhino semble conçu comme
un véhicule **utilitaire non armé**, dont la survie sur le terrain repose sur son blindage renforcé (voir §2.3) plutôt
que sur une capacité de riposte propre — un choix cohérent avec sa vocation purement minière.

**Répartition des rôles (3 places) — hypothèse opérationnelle, non confirmée officiellement par Frontier :** aucun
document consulté ne détaille l'attribution précise des trois sièges. À partir de la liste d'équipements confirmée
(§2.3), une répartition plausible serait : un **pilote/conducteur** (navigation sur terrain accidenté), un
**opérateur de scanner/foreuse** (Planetary Mining Deposit Scanner et Mining Rig Deployment Module), et un troisième
équipier libre pour la logistique (raffinerie embarquée, gestion de la soute, ou vigilance en cas de menace). Cette
répartition reste une déduction du guide, à vérifier en jeu, et non une donnée officielle.

**Coût de rebuy : non communiqué spécifiquement pour le Rhino.** De façon générale dans *Elite Dangerous*, les SRV
déployés depuis la soute d'un vaisseau n'ont historiquement **pas de coût de rebuy** propre (contrairement aux
vaisseaux, soumis à une franchise d'assurance) : un SRV détruit peut être rappelé gratuitement depuis le vaisseau
tant que celui-ci reste intact. Frontier n'a toutefois communiqué aucune confirmation explicite que le Rhino suive
cette même règle plutôt qu'un modèle de coût dédié, compte tenu de son statut de véhicule premium vendu exclusivement
en Arx au lancement (§2.7). À vérifier directement en jeu avant toute session risquant sa perte en zone hostile.

### 2.5 Le minage de surface : une nouvelle boucle de gameplay

Le patch 4.4.1.0 introduit une boucle de jeu entièrement nouvelle : le **minage de surface planétaire**, distinct du
minage d'astéroïdes existant. Son fonctionnement :

1. Le **Detailed Surface Scanner** (scanner de surface détaillé), dans une version améliorée, permet de repérer les
   sites de minage sur un astre ;
2. une fois posé, le **Planetary Mining Deposit Scanner** du Rhino localise précisément les gisements exploitables au
   sol ;
3. la **raffinerie embarquée** et le **module de déploiement de foreuse** permettent d'extraire et de traiter le minerai
   directement sur place (jusqu'à 12 chunks par passage depuis le hotfix 4.4.1.1, voir §2.3).

Cette même mise à jour a par ailleurs **rééquilibré plusieurs paramètres globaux du minage** — temps de minage, densité
et rendement des ressources, taux de recharge des gisements, pourcentage de commodité par unité minée — ce qui affecte
donc aussi le minage d'astéroïdes déjà existant, pas seulement le nouveau minage de surface. Pour la boucle de minage
complète (laser mining, core mining, subsurface deep core, limpets, hotspots), voir le guide dédié
**[20-minage.md](./20-minage.md)**, qui fait désormais référence pour ce sujet transversal ; ce guide-ci ne couvre que
la spécificité « surface » apportée par le Rhino.

### 2.6 Nouvelles matières premières minables en surface

La mise à jour introduit **treize nouvelles matières premières** exclusivement minables en surface, corroborées de
façon identique par [15-roadmap.md](./15-roadmap.md) :

| Catégorie              | Matières                                                            |
|------------------------|---------------------------------------------------------------------|
| Minerais/gemmes        | Diamant (Diamond), Rubis (Ruby), Saphir (Sapphire)                  |
| Gaz/isotopes           | Hélium (Helium), Hélium-3 (Helium-3), Deutérium (Deuterium)         |
| Minéraux/roches        | Magnésite (Magnesite), Olivine, Periclase dunite, Quartz pyroxenite |
| Terres rares et métaux | Bastnäsite, Iridium, Thortveitite                                   |

Selon [15-roadmap.md](./15-roadmap.md), ces gisements sont conçus comme une ressource **rare, à régénération très
lente** — un choix délibéré des développeurs pour encourager soit le partage communautaire des bons emplacements,
soit au contraire leur dissimulation compétitive.

#### Tableau économique de valorisation (à vérifier — voir 11-commerce.md / 06-ingenieurs.md)

Ces treize matières sont trop récentes (une semaine à la date de rédaction) pour figurer dans les tables détaillées
de [11-commerce.md](./11-commerce.md) (commerce de commodités) ou de [06-ingenieurs.md](./06-ingenieurs.md)
(référentiel des grades de matériaux d'ingénierie, lui-même construit sur `material.csv` d'EDCD). Une recherche web
dédiée a été tentée pour cette révision afin d'obtenir des prix de revente ou une classification par grade
d'ingénierie ; elle n'a pas pu aboutir (budget de recherche web de la session déjà épuisé au moment de cette
vérification). Le tableau ci-dessous doit donc être lu comme un **squelette à compléter**, pas comme des valeurs
vérifiées :

| Matière            | Catégorie              | Grade (référentiel ingénierie) | Source d'obtention                          | Valeur de revente indicative                                    |
|---------------------|------------------------|----------------------------------|----------------------------------------------|-------------------------------------------------------------------|
| Diamant             | Minerai/gemme          | Non classée à ce jour — voir 06-ingenieurs.md | Minage de surface planétaire (Rhino) uniquement | Non confirmé — capture tentée le 9 septembre 2026, sans résultat ; vérifier sur Inara Trade Tool ou EDDB |
| Rubis               | Minerai/gemme          | Non classée à ce jour           | Minage de surface planétaire (Rhino) uniquement | idem                                                               |
| Saphir              | Minerai/gemme          | Non classée à ce jour           | Minage de surface planétaire (Rhino) uniquement | idem                                                               |
| Hélium              | Gaz/isotope            | Non classée à ce jour           | Minage de surface planétaire (Rhino) uniquement | idem                                                               |
| Hélium-3            | Gaz/isotope            | Non classée à ce jour           | Minage de surface planétaire (Rhino) uniquement | idem                                                               |
| Deutérium           | Gaz/isotope            | Non classée à ce jour           | Minage de surface planétaire (Rhino) uniquement | idem                                                               |
| Magnésite           | Minéral/roche          | Non classée à ce jour           | Minage de surface planétaire (Rhino) uniquement | idem                                                               |
| Olivine             | Minéral/roche          | Non classée à ce jour           | Minage de surface planétaire (Rhino) uniquement | idem                                                               |
| Periclase dunite    | Minéral/roche          | Non classée à ce jour           | Minage de surface planétaire (Rhino) uniquement | idem                                                               |
| Quartz pyroxenite   | Minéral/roche          | Non classée à ce jour           | Minage de surface planétaire (Rhino) uniquement | idem                                                               |
| Bastnäsite          | Terre rare/métal       | Non classée à ce jour           | Minage de surface planétaire (Rhino) uniquement | idem                                                               |
| Iridium             | Terre rare/métal       | Non classée à ce jour           | Minage de surface planétaire (Rhino) uniquement | idem                                                               |
| Thortveitite        | Terre rare/métal       | Non classée à ce jour           | Minage de surface planétaire (Rhino) uniquement | idem                                                               |

Frontier n'a pas non plus précisé, à la date de rédaction, si ces treize matières sont de simples **commodités**
revendables en crédits sur les marchés (comme le Platine ou les Void Opals, voir
[11-commerce.md](./11-commerce.md)), des **matériaux d'ingénierie** consommés par les Engineers (comme les
28 éléments bruts du référentiel [06-ingenieurs.md](./06-ingenieurs.md)), ou les deux à la fois. Ce point doit être
vérifié directement dans l'écran de marché/inventaire en jeu avant toute planification économique.

### 2.7 Coût et disponibilité

Au lancement, le Rhino n'est disponible **qu'à l'achat en boutique payante (Arx)**, sans option d'achat en crédits
in-game. Frontier a précisé qu'une disponibilité en crédits est prévue « plus tard », sans date communiquée ; ce point
restait vrai à la date du 8 septembre 2026 selon [15-roadmap.md](./15-roadmap.md) (section « Contenu annoncé mais pas
encore sorti »), donc toujours au stade d'annonce non livrée à ce jour — contrairement au correctif du plafond de
minage (§2.3), qui lui a bien été livré.

| Formule                                 | Prix (Arx)  | Contenu                                                            |
|------------------------------------------|-------------|---------------------------------------------------------------------|
| Rhino Standard                          | 16 520 Arx  | Véhicule seul (+ inclusions ci-dessous)                            |
| Rhino Stellar                           | 33 000 Arx  | Version supérieure                                                 |
| Rhino Galactic                          | 60 000 Arx  | Version la plus complète                                           |
| Type-11 Prospector Galactic Mining Pack | 100 000 Arx | Bundle associant le Rhino et le vaisseau minier Type-11 Prospector |

*Prix Arx instantané capturé le 9 septembre 2026, à revérifier en boutique in-jeu.*

Tout achat du véhicule inclut, au-delà du SRV lui-même :

- la **baie de véhicule** nécessaire à son déploiement ;
- un **scanner minéral planétaire** ;
- un **décalque cosmétique** marquant l'appartenance au « Rhino Owners Club » (élément communautaire/cosmétique).

### 2.8 Retours de la communauté

Le lancement du Rhino a été relayé activement par des créateurs de contenu communautaires (chaîne YouTube *The Buur
Pit*) avant sa sortie officielle, signe d'un engagement notable de la communauté autour de l'annonce.

---

## 3. Cas non confirmé : le vaisseau « Nomad » et le mode multijoueur « Operations »

Cette section documente, à des fins de transparence, l'état de vérification de deux éléments qui figuraient
auparavant dans ce guide comme des faits établis : le vaisseau « Nomad » et le mode multijoueur « Operations ». Après
vérification, aucun des deux n'a pu être confirmé par une source fiable. Le contenu qui les décrivait (spécifications
techniques, fabricant, prix, date de sortie, classification, noms d'opérations, chronologie d'annonce détaillée) a en
conséquence été retiré du reste de ce guide plutôt que présenté comme un fait.

### 3.1 Le vaisseau « Nomad »

Aucune source fiable ne confirme l'existence d'un vaisseau nommé « Nomad » dans *Elite Dangerous*. La base Inara.cz —
liste quasi exhaustive des vaisseaux du jeu, 47 vaisseaux recensés au 9 septembre 2026, de la Sidewinder Mk I au
Panther Clipper Mk II, incluant tous les ajouts récents (Corsair, Python Mk II, Type-11 Prospector, Caspian Explorer,
Kestrel Mk II, Lynx Highliner, Mandalay, Type-8 Transporter) — ne mentionne aucun vaisseau « Nomad » ; cette absence a
été reconfirmée par une vérification refaite en direct le 9 septembre 2026. L'article Wikipédia consacré à *Elite
Dangerous* n'en fait pas mention non plus.

Il s'agit très probablement d'une confusion (fan-fiction, rumeur, faux leak, ou vaisseau appartenant à un autre jeu
ou à un mod) plutôt que d'un vaisseau réellement présent dans le jeu. **Aucune date de sortie, aucun fabricant, aucun
prix et aucune classification (« Ship-Launched Vessel » / SLV ou autre) ne doivent donc être présentés comme des
faits pour ce « vaisseau ».** Les données techniques, tarifaires et de compatibilité de soute qui figuraient
auparavant dans cette section (attribuées à un autre guide du corpus, [15-roadmap.md](./15-roadmap.md)) ont été
retirées pour cette raison, de même que l'ancienne section « Sources » de ce guide qui prétendait citer des pages
officielles pour le Nomad : ces URLs n'ont jamais été vérifiées comme retournant un contenu réel.

### 3.2 Le mode multijoueur « Operations »

Aucune source fiable ne confirme l'existence d'un mode multijoueur appelé « Operations » dans *Elite Dangerous*, ni
pour une date de fin juin 2024, ni pour celle du 1er juillet 2026 (les deux dates rapportées à différents endroits du
corpus). Les vérifications suivantes ont été effectuées, et sont négatives :

- l'article Wikipédia sur *Elite Dangerous* (historique détaillé des mises à jour 2024-2026), dont la seule grande
  fonctionnalité de cette période est la **« System Colonisation »** ;
- l'article Wikipédia sur *Elite Dangerous: Odyssey* (missions à pied documentées : Mercenary, Covert Heist, Salvage,
  Rescue, Assassination, Exobiology, Ground Combat Zones — aucune nommée « Operations ») ;
- le fil GalNet agrégé par Inara.cz.

Ce point doit être traité comme une entrée sans fondement vérifiable dans le corpus — probable confusion, rumeur ou
contenu non officiel — et non comme une simple confusion entre deux dates par ailleurs réelles. **Aucune date, aucun
détail (noms d'opérations comme « Operation Runner », monnaie « Merc Coins », scénarios « Firestorm Rescue », « Under
Siege », etc.) ne doit être présenté comme un fait dans ce corpus.** Le contenu qui décrivait ce mode (mécaniques
d'équipe, monnaie de récompense, vaisseau dédié, scénarios nommés) a été retiré de ce guide pour cette raison, ainsi
que les mentions d'« Under Siege » qui figuraient dans la section consacrée au Rhino (section 2) : l'existence d'une
opération multijoueur associée au patch du Rhino n'a pas pu être confirmée séparément.

### 3.3 Pour aller plus loin

Pour le détail complet de cette vérification, voir [00-chronologie-canonique.md](./00-chronologie-canonique.md)
(§3 pour « Operations », §8 pour « Nomad »), qui reste la référence pour l'état de confirmation de ces deux éléments
dans l'ensemble du corpus. Un autre guide du corpus, [15-roadmap.md](./15-roadmap.md), présente également des
informations sur le Nomad et sur Operations ; elles n'ont pas pu être vérifiées indépendamment et devraient être lues
avec la même réserve qu'ici plutôt que comme des faits établis.

---

## Voir aussi

- **[00 — Chronologie canonique](./00-chronologie-canonique.md)** — arbitrage sourcé de toutes les incertitudes et
  contradictions chronologiques mentionnées dans ce guide (Rhino §4, Operations §3, Nomad §8).
- **[00 — Glossaire](./00-glossaire.md)** — définitions des sigles utilisés ailleurs dans le corpus pour ce même sujet
  (SCO, CG, etc.).
- **[03 — Vaisseaux](./03-vaisseaux.md)** — fiches techniques complètes des vaisseaux cités comme compatibles avec la
  baie de véhicule du Rhino (§2.3).
- **[06 — Ingénieurs](./06-ingenieurs.md)** — référentiel des grades de matériaux ; base pour situer (ou non) les
  treize nouvelles matières du Rhino (§2.6).
- **[09 — Combat à pied](./09-combat-a-pied.md)** — rapporte une divergence de date similaire (« fin juin 2024 »)
  pour un mode analogue à « Operations », utile pour comprendre l'étendue de la confusion dans le corpus (§3.2).
- **[11 — Commerce](./11-commerce.md)** — commerce de commodités ; à consulter dès que les prix de revente des
  nouvelles matières de surface seront documentés.
- **[13 — Opérations (gameplay à pied, Odyssey 2021)](./13-operations.md)** — le sujet homonyme mais entièrement
  distinct visé par l'encadré de désambiguïsation en tête de ce guide.
- **[15 — Roadmap](./15-roadmap.md)** — chronologie détaillée des mises à jour 2024-2026 ; contient aussi, comme ce
  guide avant sa correction, des informations non confirmées sur le Nomad et sur « Operations » (voir section 3).
- **[20 — Minage](./20-minage.md)** — boucle de gameplay complète du minage (spatial et, désormais, de surface),
  source unique de vérité pour les techniques et rendements ; ce guide ne couvre que la spécificité Rhino.

---

## Sources

- https://massivelyop.com/2026/09/03/elite-dangerous-launches-mining-updates-surface-mining-and-the-rhino-mining-vehicle/
- https://massivelyop.com/2026/08/27/elite-dangerous-takes-a-quick-look-at-the-rhino-vehicle-surface-mining-and-a-new-operation-arriving-september-2/
- https://massivelyop.com/2026/08/07/elite-dangerous-unveils-the-rhino-mining-buggy-and-hints-at-new-surface-mining-gameplay/
- https://massivelyop.com/2026/04/29/elite-dangerous-hands-out-its-new-passenger-ship-for-free-and-brings-back-burning-stations-in-latest-patch/
- https://massivelyop.com/2026/04/23/elite-dangerous-delays-dungeon-like-operations-to-june-makes-new-ship-available-for-credits-april-28/
- https://massivelyop.com/2026/02/28/make-my-mmo-epitome-made-661k-on-kickstarter-elite-dangerous-unveiled-the-kestrel-mk-ii/
- https://massivelyop.com/2026/02/17/elite-dangerous-plots-six-vessel-releases-group-based-operations-and-a-feature-reboot-in-2026-roadmap/
- https://massivelyop.com/tag/elite-dangerous/
- https://twistedvoxel.com/elite-dangerous-rhino-srv-update-adds-surface-mining/
- https://twistedvoxel.com/tag/elite-dangerous/
- https://inara.cz/elite/ships/
- Corpus interne recoupé pour cette révision : [00-chronologie-canonique.md](./00-chronologie-canonique.md),
  [09-combat-a-pied.md](./09-combat-a-pied.md), [15-roadmap.md](./15-roadmap.md) — les deux derniers contiennent des
  informations non confirmées sur le Nomad et sur « Operations », traitées avec réserve en section 3 plutôt que
  reprises comme des faits ; 15-roadmap.md reste par ailleurs la source de la confirmation du hotfix 4.4.1.1 en §2.3.
- Recherche web complémentaire tentée pour cette révision (prix de revente des nouvelles matières, §2.6) : budget de
  recherche web de la session épuisé au moment de la vérification — non aboutie, signalé explicitement plutôt que
  comblé par une valeur inventée.
