---
id: 05-guardians
titre: "Guide complet des Guardians dans Elite Dangerous"
domaine: lore
entites: [Guardians, Guardian Ruins, Guardian Structures, Guardian Sentinels, Ram Tah, Canonn Research, Guardian Tech Broker, Gauss Cannon, Shard Cannon, Guardian FSD Booster, Ancient Data Terminal, Guardian Beacon]
mots_cles_en: [guardian ruins, guardian structure, guardian sentinel, guardian tech broker, gauss cannon, plasma charger, shard cannon, guardian fsd booster, obelisk data, ancient data terminal, guardian beacon, brain tree]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-10
confiance_globale: haute
volatilite: moyenne
sources_primaires: ["canonn.science", "EDSM (API publique)", "EDCD/coriolis-data", "EDCD/FDevIDs", "Elite Dangerous Wiki (Fandom, API MediaWiki)", "inara.cz"]
zones_incertaines: ["le type exact de bâtiment présent sur chaque site Guardian n'a pas pu être vérifié site par site", "la cartographie exhaustive des types d'obélisques n'a pas pu être revérifiée auprès d'une source primaire", "les plages de bonus par grade (1 à 5) des blueprints d'ingénierie applicables aux armes Guardian", "les quantités du Tech Broker pour les autres classes que celles listées (FSD Booster classes 2 à 5, armes small/large)", "le minutage de charge des 6 pylônes d'un site au sol, seulement extrapolé des 3 minutes documentées pour une balise", "la durée totale d'un passage complet sur un Guardian Structure, non chiffrée par une source primaire", "le rattachement aux Guardians du teaser Canonn du 30 août 2025 relève d'une hypothèse communautaire"]
guides_lies: [0, 3, 6, 7, 8, 9, 10, 18, 25]
---
# Guide complet des Guardians dans Elite Dangerous

## En bref

Les Guardians sont une civilisation extraterrestre humanoïde d'*Elite Dangerous*, éteinte depuis un à deux millions
d'années et découverte par les commandants en 3302-3303, dans une trentaine de systèmes situés à plusieurs centaines
d'années-lumière de la Bulle humaine — HIP 12099 à environ 217 al de Sol, amas Synuefe entre 368 et 793 al. Leurs sites
de surface se répartissent en **Guardian Ruins** non défendues, où un puzzle de pylônes active une Relic Tower livrant
des objets de catégorie Salvage (Guardian Relic, Casket, Orb, Tablet, Urn), et en **Guardian Structures** défendues par
des Guardian Sentinels, où la charge de six pylônes puis le scan d'un Ancient Data Terminal délivrent un seul Blueprint
Segment par instance et par commandant solo. Ces fragments s'échangent au **Guardian Tech Broker** contre trois armes —
Gauss Cannon, Plasma Charger, Shard Cannon — et des modules hybrides, dont le Guardian FSD Booster (de +4 al en classe 1
à +10,5 al en classe 5, un seul exemplaire par vaisseau). Ram Tah, à Meene, décrypte 28 Guardian Logs issus des
obélisques ; Canonn Research en documente le lore.

## Vue d'ensemble — la civilisation Guardian et son héritage technologique

La civilisation **Guardian** est l'une des deux grandes civilisations extraterrestres d'Elite Dangerous, aux côtés des
Thargoids — mais à la différence de ces derniers, les Guardians ont disparu depuis longtemps. Ce guide rassemble
l'essentiel du lore, de la géographie, des mécaniques de jeu (ruines, structures, énigmes, combat) et de l'équipement
(armes, modules, vaisseaux) liés à cette civilisation, ainsi que les ressources communautaires permettant d'aller plus
loin. Un encart « Voir aussi » en fin de guide renvoie vers les autres guides du corpus utiles pour compléter une
expédition Guardian (ingénierie, équipement à pied, combat, exploration, colonisation).

## 1. Lore et contexte historique des Guardians

### Une civilisation humanoïde disparue depuis un à deux millions d'années

Les Guardians sont une civilisation extraterrestre humanoïde découverte par les Commanders en 3302-3303, dans une région
aujourd'hui surnommée informellement « la Nébuleuse Guardian » : un amas de systèmes situé à plusieurs centaines
d'années-lumière de la Bulle humaine, dans le secteur regroupant des systèmes comme Synuefe ou les désignations HIP. Les
vestiges retrouvés sur place — ruines, structures militaires, technologies avancées — indiquent que cette civilisation a
mené une lutte défensive de grande ampleur avant de s'éteindre, il y a environ un à deux millions d'années. L'identité
exacte de l'ennemi affronté par les Guardians reste débattue dans le lore du jeu, mais plusieurs éléments narratifs
ultérieurs — dont l'épisode du Proteus Wave et la découverte des Unclassified Relics (voir plus bas) — tendent à relier
cette guerre ancienne aux Thargoids qui menacent aujourd'hui la Bulle humaine.

### Ram Tah et le décryptage des Guardian Logs (28 logs du Codex)

**Ram Tah**, ingénieur basé à **Meene** (station Phoenix Base, à environ 164 années-lumière de Sol), est la figure
centrale du décryptage de cette histoire. Dans le cadre de sa mission « Decrypting the Guardian Logs », les Commanders
lui livrent des données Guardian récupérées sur le terrain (les « Guardian Logs »), et il publie progressivement des
révélations narratives sur l'histoire, la guerre et l'extinction des Guardians via des mises à jour du Codex en jeu.
Selon le Codex documenté par Canonn Research, l'ensemble constitue un corpus de **28 logs (avec audio)** issus de cette
seconde mission Ram Tah. Ce sont précisément les obélisques disséminés sur les sites Guardian qui fournissent la matière
première de ces logs — voir la sous-section dédiée dans la section 4.

### Canonn Research, le principal organe d'investigation sur les Guardians

**Canonn Research** (canonn.science) est un groupe scientifique communautaire — fondé en avril 3301 dans la fiction du
jeu par le Dr Arcanonn, opérant depuis Thompson Dock, dans le système Varati — qui constitue la référence pour ce lore.
Canonn a cartographié les sites Guardian, documenté les logs traduits par Ram Tah, et continue de suivre activement le
sujet. Le site organise son travail en quatre départements : Archéologie & Histoire, Cartographie & Exploration,
Géologie & Organismes de Surface, et Technologie Xéno.

### Un lore Guardian toujours vivant (Proteus Wave, Unclassified Relics)

Le lore Guardian n'est pas une intrigue close :

- **21 décembre 2023** : selon les archives de Canonn, l'échec du **Proteus Wave** — une arme expérimentale développée
  par la faction Salvation et employée contre les Thargoids dans la fiction du jeu — a été suivi de la découverte de
  reliques inédites, baptisées **Unclassified Relics** (ou « Green Relics » / « Grelics »), une variante des reliques
  Guardian encore non pleinement expliquée dans le lore. Précision technique : dans les fichiers du jeu (base
  communautaire EDCD/FDevIDs), cet objet porte le symbole interne `AncientRelicTG` et le nom affiché « Unclassified
  Relic », catégorie *Salvage* — la présence du suffixe « TG » (Thargoid) dans le symbole interne alimente d'ailleurs
  une partie des spéculations communautaires sur un lien Guardians/Thargoids, sans que cela constitue une confirmation
  narrative officielle.
- **30 août 2025** : Canonn a publié un teaser intitulé *« A secret to be uncovered. A trail to be followed »*,
  accompagné d'une vidéo. **Attention** : aucune source fiable consultée ne confirme que ce teaser concernait
  spécifiquement les Guardians plutôt qu'un autre volet du lore xéno suivi par Canonn (Thargoïdes, Titans, etc.) — le
  rattachement de ce teaser aux Guardians relève d'une hypothèse communautaire non confirmée à la date de cette mise à
  jour. À vérifier directement sur canonn.science avant de le citer comme un indice Guardian avéré.

Ces éléments montrent que le sujet continue d'évoluer, et qu'il vaut la peine de suivre les publications de Canonn pour
rester à jour — en gardant à l'esprit la distinction entre lore confirmé et spéculation communautaire.

## 2. Géographie : où trouver les sites Guardian

Les sites Guardian (ruines et structures) sont concentrés dans une trentaine de systèmes situés dans une région bien
délimitée, souvent appelée « Guardian Space » ou « Nébuleuse Guardian » par la communauté, à plusieurs centaines
d'années-lumière de la Bulle humaine. On y accède généralement via des routes documentées par la communauté (Canonn,
EDSM, Spansh) plutôt qu'en explorant au hasard, tant la densité de sites intéressants y est élevée par rapport au reste
de la galaxie.

Deux types de sites de surface coexistent dans cette zone :

| Type de site                             | Défense                                  | Contenu principal                                                 |
|------------------------------------------|------------------------------------------|-------------------------------------------------------------------|
| **Guardian Ruins** (ruines simples)      | Aucune sentinelle hostile                | Puzzle de pylônes → données et objets « Ancient »                 |
| **Ancient Ruins**                        | Aucune / très limitée                    | Vestiges peu interactifs, moins de mécanique active               |
| **Guardian Structures** (sites défendus) | Sentinelles actives (drones + tourelles) | Fragments de plans de vaisseaux/armes/modules, composants d'épave |

### Sites Guardian de référence et distances depuis Sol

Le tableau suivant liste quelques systèmes Guardian couramment cités par la communauté, avec leur distance réelle
depuis Sol (calculée à partir des coordonnées galactiques publiques d'EDSM, Sol = (0, 0, 0)) :

| Système                       | Distance depuis Sol | Particularité                                                                                                                    |
|--------------------------------|---------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| **HIP 12099**                   | ≈ 217 al            | L'un des hubs de farming les plus efficaces : plusieurs sites Guardian rapprochés dans le même système.                          |
| **HIP 22460**                    | ≈ 362 al            | Système Guardian documenté, dans la même région générale que HIP 12099.                                                          |
| **Synuefe XR-H d11-102**         | ≈ 368 al            | Site Guardian du secteur Synuefe, l'un des plus proches de la Bulle parmi ceux listés ici.                                       |
| **Synuefe EU-Q c21-9**           | ≈ 774 al            | Site Guardian de l'amas du secteur Synuefe (voir les deux entrées suivantes, systèmes voisins).                                  |
| **Synuefe EU-Q c21-16**          | ≈ 786 al            | Idem, autre site du même amas.                                                                                                    |
| **Synuefe EU-Q c21-4**           | ≈ 793 al            | Guardian Ruins souvent recommandées pour s'entraîner au puzzle des pylônes.                                                      |
| **Col 173 Sector LJ-F c12-0**    | ≈ 1 232 al          | Guardian Ruins confirmées par Canonn Research, à proximité du mégaship du Professeur Melville (le *Cete*).                       |
| **Meene**                       | ≈ 164 al            | Pas un site Guardian à proprement parler : abrite Phoenix Base, la station de **Ram Tah** (voir section 1).                      |

> Distances calculées depuis les coordonnées galactiques publiques d'EDSM (edsm.net) — chiffre stable (position des
> systèmes, non sujette à changement). En revanche, le type exact de bâtiment présent sur chaque site (Foundry,
> Robotics Facility, Technology Facility, Vessel/Weapon Blueprint Facility) n'a pas pu être vérifié site par site avec
> une source primaire accessible durant cette mise à jour — croiser avec l'outil communautaire **Bifrost — « Guardian
> Ancient Ruins »** de Canonn (https://ruins.canonn.tech/, référencé depuis canonn.science/resources/), qui recense et
> filtre les systèmes à sites Guardian connus, avant de partir en expédition ciblée sur un fragment de plan précis. La
> section 10 (« La boucle de session Guardian ») détaille comment enchaîner plusieurs de ces sites une fois repérés.

## 3. Sites de ruines (Guardian Ruins)

### Présentation des Guardian Ruins : pylônes lumineux et Relic Tower

Les ruines Guardian se présentent comme des sites de surface **non défendus** — pas de sentinelles hostiles sur les
sites de ruines « simples » — organisés autour de **pylônes de pierre** émettant des faisceaux de lumière colorés
(bleu/vert) qui convergent vers une **Relic Tower** (tour-relique) centrale.

### Mécanique du puzzle des pylônes (Guardian Ruins)

1. Descendre en SRV (Scarab) à proximité du site.
2. Observer la séquence lumineuse projetée par les pylônes/plaques au sol.
3. Interagir avec les pylônes pour reproduire ou compléter cette séquence.
4. Une fois la séquence validée, la tour-relique s'active et libère des données/objets.

Ce puzzle des pylônes est distinct du **puzzle des obélisques**, décrit dans la section 4 : les pylônes activent
collectivement la Relic Tower d'un site donné, alors que chaque obélisque se capture individuellement, sans séquence à
reproduire.

### Butin obtenu sur les ruines Guardian (objets « Ancient », catégorie Salvage)

Les objets libérés appartiennent à la famille des marchandises de catégorie **Salvage** (et non au système de grades
Raw/Manufactured/Encoded utilisé pour l'ingénierie — voir [Ingénieurs](./06-ingenieurs.md)), qui servent à débloquer
des plans au Guardian Tech Broker. Noms affichés en jeu, avec leur symbole interne (base EDCD/FDevIDs) :

- Guardian Relic (`AncientRelic`)
- Guardian Casket (`AncientCasket`)
- Guardian Orb (`AncientOrb`)
- Guardian Tablet (`AncientTablet`)
- Guardian Urn (`AncientUrn`)

### Lien entre ruines Guardian et exobiologie (Brain Trees)

Selon le Codex Canonn, les **Brain Trees** (organismes de surface exploitables en exobiologie — voir
[Exploration](./10-exploration.md) pour la méthodologie de scan) apparaissent systématiquement dans les cratères situés
à proximité des ruines Guardian — un repère utile pour les Commanders qui veulent combiner farming de données Guardian
et scan xénobiologique dans le même déplacement.

## 4. Guardian Structures : les sites défendus

### Composition d'un site Guardian Structure (Foundry, Robotics, Blueprint Facilities)

Un nombre plus restreint de systèmes contient des **Guardian Structures** : des installations plus grandes, organisées
autour d'un hub central avec plusieurs bâtiments spécialisés :

- **Foundry**
- **Robotics Facility**
- **Technology Facility**
- **Vessel Blueprint Facility**
- **Weapon Blueprint Facility**

Contrairement aux simples ruines, ces sites sont **activement défendus** par des Guardian Sentinels (drones volants et
tourelles immobiles au sol — voir section 9).

### Déroulé typique d'une expédition sur Guardian Structure

1. **Neutraliser les sentinelles** qui protègent le site (drones volants + tourelles immobiles).
2. **Descendre en SRV** pour résoudre le puzzle des pylônes/obélisques (voir les deux sous-sections dédiées ci-dessous),
   avec accès aux fragments de plans les plus recherchés.
3. **Récupérer** les fragments de plans — Guardian Vessel Blueprint Segment, Guardian Weapon Blueprint Segment, Guardian
   Module Blueprint Segment — ainsi que les composants de récupération/épave dispersés au sol.
4. **Livrer** ces fragments et données à un **Guardian Tech Broker** pour débloquer définitivement les plans (voir
   section 5).
5. **Depuis Odyssey (2021)** : un volet complémentaire à pied est disponible sur certains sites — voir la sous-section
   « Volet à pied des sites Guardian (Odyssey) » ci-dessous.

### Le puzzle des obélisques Guardian (Pattern Obelisk Data)

À ne pas confondre avec le puzzle des pylônes (section 3), qui active collectivement la Relic Tower d'un site de
ruines : les **obélisques** sont des colonnes de pierre isolées, disséminées individuellement autour des Guardian
Structures (et parfois à proximité de certaines ruines), qui émettent chacune un faisceau de lumière porteur de
données.

- **Mécanique** : s'approcher d'un obélisque en SRV (ou à pied, voir la sous-section suivante) permet de capturer le
  faisceau qu'il projette — il n'y a pas de séquence à reproduire comme sur les pylônes de la Relic Tower, chaque
  obélisque se « scanne » individuellement.
- **Lien avec Ram Tah** : ce sont ces captures, une fois livrées, qui alimentent les logs de la mission « Decrypting
  the Guardian Logs » évoquée en section 1 (28 logs documentés par le Codex Canonn).
- **Bonnes pratiques** : les obélisques d'un même site ne délivrent généralement un contenu utile qu'une fois chacun —
  mieux vaut parcourir méthodiquement l'ensemble du site plutôt que de s'acharner sur un seul obélisque, et vérifier le
  Codex en jeu pour repérer les logs déjà obtenus.

> Le détail exhaustif des types d'obélisques et leur cartographie complète site par site n'ont pas pu être revérifiés
> auprès d'une source primaire accessible durant cette mise à jour — se référer au Codex en jeu et à canonn.science
> pour la liste exhaustive. En revanche, la donnée précise **« Pattern [Alpha/Beta/Gamma/Delta/Epsilon] Obelisk
> Data »** que ces obélisques délivrent a bien été vérifiée sur Inara.cz (fiche Technology Brokers) : c'est un
> ingrédient obligatoire de plusieurs modules Guardian de la section 8 (Shield/Hull Reinforcement, Power Distributor,
> Power Plant) — voir le tableau chiffré de la section 10 pour le détail exact par module.

### Volet à pied des sites Guardian (Odyssey)

Depuis l'extension **Odyssey** (2021), les Commanders peuvent sortir de leur SRV ou de leur vaisseau en combinaison
spatiale pour explorer à pied une partie des Guardian Structures.

- **Combinaison recommandée** : l'Artemis (ou à défaut une combinaison offrant un bon blindage énergétique) est
  conseillée face aux tirs des tourelles et drones Guardian, dont les faisceaux infligent des dégâts thermiques/
  énergétiques importants même à un fantassin.
- **Activités spécifiques au volet à pied** : accès à pied à des obélisques ou points d'intérêt difficiles à atteindre
  en véhicule, entrées de Codex supplémentaires, et récupération de butin au sol en complément de ce qui est ramassé en
  SRV.
- **Danger** : les sentinelles Guardian actives sur les sites défendus (section 9) représentent une menace sérieuse
  pour un fantassin ; il est recommandé de nettoyer le site depuis l'espace ou en SRV avant de s'exposer à pied sur les
  zones les plus surveillées.
- Les mécaniques génériques de combat et d'équipement à pied (armes, combinaisons, outils de piratage) ne sont pas
  spécifiques aux Guardians : voir [Équipement à pied](./07-equipement-a-pied.md) et
  [Combat à pied](./09-combat-a-pied.md) pour le détail complet plutôt qu'une répétition ici.

## 5. Le Guardian Tech Broker

Le **Guardian Tech Broker** est le comptoir spécial, présent dans certaines stations, où se déroule le déblocage des
plans Guardian. Le processus se fait en deux temps :

1. **Déblocage** du plan : livraison des fragments de plans obtenus sur les Guardian Structures (Vessel/Weapon/Module
   Blueprint Segments) et des données issues des ruines (objets de catégorie Salvage).
2. **Achat** de chaque exemplaire du module ou de l'arme : une fois le plan débloqué, chaque fabrication ultérieure
   consomme des quantités précises de matériaux Guardian bruts et manufacturés, propres à chaque module et à sa classe.

Les quantités exactes de matériaux requis par plan et par classe de module varient précisément selon le module. Elles
sont documentées de façon exhaustive sur le wiki communautaire (Elite Dangerous Wiki, sur Fandom) et sur Inara.cz
(section Technology Brokers, https://inara.cz/elite/techbroker/2/ pour le comptoir Guardian) — deux outils de
référence à consulter avant de partir en expédition de farming ciblée ; un tableau chiffré pour huit plans Guardian
courants figure en section 10.

## 6. Vaisseaux Guardian : Fighter et « hybrides »

### Pas de coque Guardian pilotable

Point important à clarifier : Elite Dangerous **ne propose pas de coque de vaisseau Guardian pilotable** par le joueur.
Il n'existe aucun châssis Guardian achetable ou fabricable comme vaisseau principal.

### Le Guardian Fighter

Le **Guardian Fighter** est une unité de combat autonome (design en forme de soucoupe) rencontrée comme **adversaire
PNJ**, défendant les sites Guardian aux côtés des sentinelles. Ce n'est pas un chasseur embarqué pilotable par le joueur
dans le cadre standard des mécaniques Guardian.

### Les « vaisseaux hybrides » Guardian : coques humaines et modules alien

Ce qu'on appelle communément « vaisseaux hybrides Guardian » désigne en réalité des **vaisseaux humains standards
équipés de modules Guardian** (armes, FSD booster, distributeur/centrale électrique, renforts de coque/bouclier). Le
terme « hybride » renvoie donc à la fusion entre une coque humaine classique et une technologie alien embarquée en
modules — pas à un nouveau châssis. Pour les caractéristiques détaillées (prix, portée de saut, hardpoints,
emplacements internes) des coques humaines couramment équipées ainsi, voir [Vaisseaux](./03-vaisseaux.md).

## 7. Armes Guardian

Trois armes sont débloquées via le Tech Broker et constituent les piliers du combat [AX](./00-glossaire.md) contre les
Thargoids autant que de l'arsenal Guardian « classique » :

| Arme               | Montage          | Mécanique                                | Profil de dégâts                                                                   | Usage typique                                               |
|--------------------|------------------|------------------------------------------|--------------------------------------------------------------------------------------|-------------------------------------------------------------|
| **Gauss Cannon**   | Fixe uniquement  | À charge (temps de charge avant tir)     | Dégâts kinétiques/thermiques élevés en un seul coup puissant                       | Cibler les points faibles (cœurs) des Thargoid Interceptors |
| **Plasma Charger** | Fixe ou gimbal   | À charge                                 | Dégâts thermiques importants, forte consommation d'énergie et de chaleur           | Polyvalent contre boucliers et coque                        |
| **Shard Cannon**   | Fixe ou tourelle | Gerbe de projectiles façon fusil à pompe | Dégâts sur la durée dévastateurs à courte portée sur la coque et les sous-systèmes | Très prisée en combat anti-Thargoid rapproché               |

### Statistiques de combat des trois armes Guardian (configuration stock)

Chiffres calculés à partir des valeurs brutes de la base communautaire technique EDCD/coriolis-data (données extraites
des fichiers du jeu), pour la variante **montage fixe, taille 2 (moyenne), configuration stock** de chaque arme — la
plus couramment recommandée sur les vaisseaux listés en section 9 :

| Arme               | Dégâts par tir (alpha)                          | Cycle de tir                                              | DPS soutenu (calculé)* | Charge thermique                        |
|---------------------|--------------------------------------------------|------------------------------------------------------------|--------------------------|-------------------------------------------|
| **Gauss Cannon**    | 38,5                                             | 1 tir par cycle de charge + rechargement ≈ 1 s              | ≈ 38,5                   | 25 par tir                                |
| **Plasma Charger**  | 5 par tir (chargeur de 15 tirs à 0,2 s d'intervalle) | rechargement du chargeur : 3 s                              | ≈ 12,9                   | 5,2 par tir                               |
| **Shard Cannon**    | 44,4 par pression de détente (12 billes × 3,7)   | 1 pression toutes les 0,6 s, chargeur de 5, rechargement 5 s | ≈ 30,0                   | 1,2 par bille (≈ 14,4 par pression)       |

\* DPS soutenu calculé selon la formule *(dégâts par tir × tirs par salve × taille du chargeur) ÷ (temps de
rechargement + (taille du chargeur − 1) × intervalle de tir)*, à partir des valeurs brutes de la base EDCD/coriolis-data
(montage fixe, taille moyenne, config stock). Les montages tourelle et les autres tailles (petit/large) ont des profils
différents — voir Coriolis ou EDSY pour le détail par taille et par montage.

> Ces valeurs sont données en configuration stock ; l'ingénierie (voir [Ingénieurs](./06-ingenieurs.md)) peut les
> modifier significativement.

### Ingénierie des armes Guardian

Contrairement à une idée reçue, les trois armes Guardian **acceptent l'ingénierie standard**, au même titre que les
armes humaines classiques (voir [Ingénieurs](./06-ingenieurs.md) pour la méthode générale de déblocage et d'application
des modifications) :

- **Gauss Cannon** : accepte notamment les modifications *High Capacity* et *Rapid Fire* — cette dernière est
  particulièrement recherchée puisqu'elle réduit le temps de charge caractéristique de l'arme.
- **Plasma Charger** : accepte notamment *Overcharged* (dégâts) et *Focused* (précision/dispersion).
- **Shard Cannon** : accepte notamment *Long Range* et *Focused*, ainsi qu'un effet expérimental spécifique,
  *Super Penetrator*, qui améliore la pénétration des billes contre la coque et les sous-systèmes.

Ces blueprints sont confirmés par l'existence de variantes « pré-ingénierées » distribuées via des [CG](./00-glossaire.md)
passées et documentées dans la base communautaire EDCD/coriolis-data. Les plages exactes de bonus par grade (1 à 5)
n'ont pas pu être revérifiées auprès d'une source primaire accessible durant cette mise à jour — consulter Coriolis,
EDSY ou [Ingénieurs](./06-ingenieurs.md) avant de planifier un build précis.

### Module utilitaire complémentaire : le Guardian Shutdown Field Neutraliser

Le **Guardian Shutdown Field Neutraliser** contre le pulse de mise hors service (« shutdown field ») des Interceptors
Thargoids — un module devenu indispensable sur les configurations de combat anti-xéno modernes, même s'il n'est pas une
arme offensive à proprement parler.

## 8. Modules Guardian défensifs et utilitaires

| Module                                    | Emplacement               | Fonction                            | Remarques                                                                                                                                                             |
|-------------------------------------------|---------------------------|--------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Guardian Shield Reinforcement Package** | Interne                   | Augmente les points de bouclier     | Plusieurs classes disponibles                                                                                                                                         |
| **Guardian Hull Reinforcement Package**   | Interne                   | Renforce la coque                   | Bonus de résistance inclus                                                                                                                                            |
| **Guardian Power Distributor (Hybrid)**   | Interne (distributeur)    | Répartition d'énergie alternative   | Répartition de pips différente, apprécié sur les builds « tank »                                                                                                      |
| **Guardian Power Plant (Hybrid)**         | Interne (centrale)        | Alimentation électrique alternative | Profil thermique/efficacité différent des modules humains standards                                                                                                   |
| **Guardian FSD Booster**                  | Utilitaire (classe 1 à 5) | Bonus fixe de portée de saut        | Un seul exemplaire utilisable par vaisseau (voir tableau ci-dessous) ; indispensable pour optimiser les longs trajets et les sauts boostés par les étoiles à neutrons |

### Guardian FSD Booster par classe

Chiffres extraits de la base communautaire technique EDCD/coriolis-data (fichiers du jeu) :

| Classe | Bonus nominal de portée | Coût (une fois le plan débloqué) | Intégrité | Consommation d'énergie |
|--------|--------------------------|------------------------------------|------------|--------------------------|
| 1      | +4 al                    | 405 022 Cr                         | 32         | 0,75 MW                  |
| 2      | +6 al                    | 810 521 Cr                         | 32         | 0,98 MW                  |
| 3      | +7,75 al                 | 1 620 431 Cr                       | 32         | 1,27 MW                  |
| 4      | +9,25 al                 | 3 245 013 Cr                       | 32         | 1,65 MW                  |
| 5      | +10,5 al                 | 6 483 101 Cr                       | 32         | 2,14 MW                  |

Le bonus nominal ci-dessus est tel qu'il apparaît dans les fichiers du jeu ; le gain réel de portée de saut appliqué au
vaisseau dépend de la formule de portée du FSD (masse du vaisseau, carburant, autres modules) et n'est donc pas
strictement additif sur un vaisseau donné.

**Règle importante : un seul Guardian FSD Booster peut être installé par vaisseau**, quel que soit le nombre
d'emplacements utilitaires libres — il ne sert à rien d'en embarquer plusieurs, les bonus ne se cumulent pas entre
plusieurs exemplaires.

Tous ces modules nécessitent un déblocage préalable au Guardian Tech Broker via livraison de fragments de plans, puis
l'achat de chaque exemplaire consomme des matériaux Guardian bruts et manufacturés spécifiques (voir section 5 pour les
quantités exactes par classe).

## 9. Guardian Sentinels et combat sur les sites

### Types de Guardian Sentinels (drones volants et tourelles au sol)

Les **Guardian Sentinels** sont les gardiens automatisés des Guardian Structures :

- des **drones volants** de type « soucoupe » ;
- des **tourelles immobiles** au sol.

Leurs faisceaux de tir peuvent endommager rapidement la coque et perturber ou désactiver des modules du vaisseau — le
FSD est une cible fréquente — ce qui impose une approche rapide et mobile plutôt qu'un combat statique.

### Bonnes pratiques de combat contre les Guardian Sentinels

- Privilégier des **armes fixes à tir rapide** pour abattre les drones avant qu'ils ne verrouillent leur faisceau.
- Emporter **heatsinks/chaff** pour limiter les dégâts de composants pendant l'engagement.
- N'engager le SRV pour le puzzle **qu'une fois le site « nettoyé »** des menaces actives.
- Activer les pylônes fait apparaître des vagues supplémentaires de sentinelles pendant le puzzle lui-même (voir le
  détail précis en section 10) — ce n'est qu'une fois le site rejoué depuis une nouvelle instance (reconnexion) qu'un
  nouveau passage complet redevient possible pour un même Commander en solo ; la section 10 explique pourquoi
  enchaîner plusieurs sites rapprochés est en pratique plus efficace que d'attendre sur place.

Pour les fondamentaux du pilotage et du combat spatial hors contexte Guardian (gestion des pips, ciblage des
sous-systèmes, etc.), voir [Combat spatial](./08-combat-spatial.md).

### Vaisseaux recommandés pour le nettoyage des sites Guardian

| Vaisseau             | Points forts sur ce type de mission                              |
|----------------------|--------------------------------------------------------------------|
| **Chieftain**        | Bonne maniabilité, tir précis sur cibles rapides                 |
| **Krait Mk II**      | Bon compromis polyvalence/soute pour ramasser le butin ensuite   |
| **Federal Gunship**  | Bon tank, puissance de feu élevée                                |
| **Anaconda**         | Grande capacité de soute et de modules, bon tank                 |
| **Federal Corvette** | Excellent tank et armement, pour les Commanders les plus équipés |

Pour les caractéristiques détaillées de ces vaisseaux (prix, portée de saut, hardpoints, emplacements internes), voir
[Vaisseaux](./03-vaisseaux.md) plutôt qu'une fiche technique dupliquée ici.

## 10. Farming des matériaux Guardian

### Deux grandes catégories de ressources Guardian

#### Composants d'épave Guardian (matériaux manufacturés, grades 1 à 3)

| Matériau                                     | Grade | Source d'obtention                                                                 |
|-----------------------------------------------|-------|--------------------------------------------------------------------------------------|
| Guardian Power Cell                           | 1     | Guardian Structures — composants d'épave au sol, souvent après combat               |
| Guardian Sentinel Wreckage Components         | 1     | Guardian Structures — butin des sentinelles détruites                               |
| Guardian Power Conduit                        | 2     | Guardian Structures — composants d'épave au sol, souvent après combat               |
| Guardian Technology Component                 | 3     | Guardian Structures — composants d'épave au sol, souvent après combat               |
| Guardian Sentinel Weapon Parts                | 3     | Guardian Structures — butin des sentinelles détruites                               |

#### Données de sites et fragments de plans Guardian (Blueprint Segments)

| Objet                                  | Catégorie / Grade                                                    | Source d'obtention                                          |
|------------------------------------------|-------------------------------------------------------------------------|----------------------------------------------------------------|
| Guardian Relic / Casket / Orb / Tablet / Urn | Salvage (hors système de grades Raw/Manufactured/Encoded)            | Puzzle des pylônes sur Guardian Ruins et Structures (section 3) |
| Guardian Weapon Blueprint Segment       | Encoded, grade 4                                                        | Guardian Structures — Weapon Blueprint Facility                |
| Guardian Module Blueprint Segment       | Encoded, grade 4                                                        | Guardian Structures — installations spécialisées                |
| Guardian Vessel Blueprint Segment       | Encoded, grade 5                                                        | Guardian Structures — Vessel Blueprint Facility                 |

*(Grades et symboles internes vérifiés sur la base communautaire technique EDCD/FDevIDs.)*

### Stratégie de farming communautaire des sites Guardian

- Cibler des **systèmes contenant plusieurs sites de ruines rapprochés** pour enchaîner les puzzles sans combat.
- Alterner avec des passages sur les **Guardian Structures** pour les fragments de plans (voir le déroulé précis et le
  vrai mécanisme de « repop » dans la sous-section « La boucle de session Guardian » ci-dessous, plutôt qu'une simple
  attente sur place).
- Combiner farming Guardian et exobiologie sur un même trajet (voir la note sur les Brain Trees en section 3).

### La boucle de session Guardian : du site au fragment, puis au site suivant

Le reste de cette section liste les ressources et leurs sources ; voici comment les enchaîner concrètement en session,
combien de fragments et de matériaux prévoir par plan, et où vérifier des données de site à jour. Sources principales
de cette sous-section : l'Elite Dangerous Wiki (Fandom, pages *Ancient Data Terminal*, *Guardian Structure*, *Guardian
Beacon*, *Technology Broker*, interrogées via l'API MediaWiki publique) et Inara.cz (page *Technology Brokers*,
comptoir Guardian) — voir la liste complète en fin de guide.

#### Combien de fragments et de matériaux par plan Guardian au Tech Broker

Chaque plan du Guardian Tech Broker (section 5) consomme, par exemplaire acheté : **1 fragment de blueprint** de la
famille correspondante (Weapon/Module/Vessel Blueprint Segment — voir le tableau « Données de sites et fragments de
plans Guardian » plus haut dans cette section), une combinaison de
**matériaux Guardian** farmés sur site (composants d'épave ou données d'obélisques, voir sections 3-4 et le tableau
ci-dessus), et le plus souvent un ou deux **éléments/matériaux non spécifiques aux Guardians** (minerai brut, salvage
de vaisseau) ainsi qu'une **commodity Guardian achetée en station** (pas farmée sur site). Chiffres vérifiés sur
Inara.cz pour la variante indiquée (montage/classe la plus courante) :

| Plan (variante vérifiée)                                 | Fragment requis                        | Matériaux Guardian (site)                                              | Autre matériau/élément                       | Commodity (achat en station)     |
|------------------------------------------------------------|-------------------------------------------|----------------------------------------------------------------------------|-------------------------------------------------|---------------------------------------|
| **Gauss Cannon** (fixe, taille moyenne) [2B]                | 1 Guardian Weapon Blueprint Fragment       | 18 Guardian Power Cell + 20 Guardian Technology Component                  | 15 Manganese                                    | 6 Magnetic Emitter Coil                |
| **Plasma Charger** (fixe, taille moyenne) [2B]              | 1 Guardian Weapon Blueprint Fragment       | 18 Guardian Power Conduit + 16 Guardian Sentinel Weapon Parts              | 14 Chromium                                     | 8 Micro-weave Cooling Hoses            |
| **Shard Cannon** (fixe, taille moyenne) [2A]                | 1 Guardian Weapon Blueprint Fragment       | 20 Guardian Wreckage Components + 18 Guardian Technology Component         | 14 Carbon                                       | 12 Power Transfer Bus                  |
| **Guardian FSD Booster**, classe 1 [1H]                     | 1 Guardian Module Blueprint Fragment       | 21 Guardian Power Cell + 21 Guardian Technology Component                  | 24 Focus Crystals (salvage/USS, non-Guardian)   | 8 HN Shock Mount                       |
| **Guardian Shield Reinforcement Package**, classe 1 [1E]    | 1 Guardian Module Blueprint Fragment       | 17 Guardian Power Cell + 20 Guardian Technology Component + 24 Pattern Delta Obelisk Data | —                          | 8 Hardware Diagnostic Sensor           |
| **Guardian Hull Reinforcement Package**, classe 1 [1E]      | 1 Guardian Module Blueprint Fragment       | 21 Guardian Wreckage Components + 16 Pattern Beta Obelisk Data + 16 Pattern Gamma Obelisk Data | —                    | 12 Reinforced Mounting Plate           |
| **Guardian Power Distributor (Hybrid)**, classe 1 [1A]      | 1 Guardian Module Blueprint Fragment       | 24 Guardian Power Cell + 20 Pattern Alpha Obelisk Data                     | 18 Phase Alloys (non-Guardian)                  | 6 Heatsink Interlink                   |
| **Guardian Power Plant (Hybrid)**, classe 2 [2A]            | 1 Guardian Module Blueprint Fragment       | 18 Guardian Power Conduit + 21 Pattern Epsilon Obelisk Data                | 15 Heat Resistant Ceramics (non-Guardian)       | 10 Energy Grid Assembly                |

> Ces quantités sont celles affichées par Inara.cz pour la classe/le montage indiqué entre crochets ; elles n'ont pas
> pu être revérifiées pour les autres classes (FSD Booster classes 2 à 5, tailles small/large des armes, etc.) auprès
> d'une source primaire durant cette mise à jour — Inara.cz (lien en section 11) affiche ces variantes au comptoir
> correspondant et reste la référence à consulter avant de calculer une quantité de session précise. Les cinq
> familles de « Pattern [Alpha/Beta/Gamma/Delta/Epsilon] Obelisk Data » ci-dessus sont exactement les données que le
> puzzle des obélisques (section 4) permet de récolter : un site avec plusieurs obélisques actifs sert donc
> directement à alimenter ces modules, indépendamment des fragments de plans obtenus au Data Terminal.

#### Le mécanisme exact d'un passage sur site (Guardian Structures)

D'après l'Elite Dangerous Wiki (pages *Ancient Data Terminal* et *Guardian Structure*), un passage complet sur un
« petit » site suit une séquence fixe :

1. Se poser et déployer le SRV près de l'**Ancient Data Terminal** : deux pylônes lui sont directement adjacents et
   doivent être chargés en premier ; **6 pylônes au total** composent le site (2 + 4 dispersés alentour).
2. Charger chaque pylône en tirant dessus (SRV ou vaisseau) fait apparaître les sentinelles par vagues : **au moins 6
   sentinelles** sur un petit site (3 apparaissent pendant la levée des pylônes, 1 une fois tous chargés, 2 après le
   déverrouillage du Terminal) — jusqu'à **12 sentinelles** sur les sites « larges » accessibles via un Guardian
   Beacon (voir point 4 ci-dessous).
3. Une fois les 6 pylônes chargés, déposer dans la fente lumineuse un **Ancient Relic** (sites à Module/Weapon
   Blueprint Segment) ou un **Ancient Key** (sites à Vessel Blueprint Segment, sourcé exclusivement via un Guardian
   Beacon) puis scanner le cœur du Terminal avec le Data Link Scanner du SRV : cela délivre **1 seul fragment de
   plan** par scan.
4. **Les Guardian Beacons** (structures orbitales séparées, distinctes des sites au sol) suivent un minutage
   documenté avec précision : une fois le premier de leurs **3 pylônes** chargé, les deux autres doivent l'être dans
   un délai de **3 minutes** pour réactiver la balise et obtenir un Ancient Key, seul moyen d'accéder aux sites larges
   et à leurs Guardian Vessel Blueprint Segments. Le minutage équivalent pour les 6 pylônes d'un site au sol n'a pas
   été retrouvé chiffré dans une source primaire lors de cette mise à jour — par extrapolation prudente (deux fois
   plus de pylônes), compter un ordre de grandeur de quelques minutes pour la phase de charge, à valider en jeu.

#### Le vrai « délai de repop » d'un Guardian Structure : une reconnexion, pas un minuteur

Contrairement à une idée répandue, ce n'est pas un minuteur qui limite le farming répété d'un même Data Terminal par
un seul Commander : selon la page *Guardian Structure* du wiki communautaire, **« si le même joueur réactive et
scanne à nouveau la même structure sans se déconnecter puis se reconnecter, aucune donnée n'est obtenue »**. En
escadron (Wing), en revanche, chaque membre peut scanner le même Terminal rechargé pour obtenir son propre exemplaire
du fragment, sans faire réapparaître de sentinelles supplémentaires. Deux conséquences pratiques pour une session en
solo :

- Refaire le **même** site suppose de quitter vers le menu principal et de se reconnecter (nouvelle instance) — une
  perte de temps réelle (chargement + retour au site) que la méthode ci-dessous permet d'éviter.
- Jouer en Wing avec un ou deux autres Commanders multiplie mécaniquement le nombre de fragments obtenus par site
  visité, sans multiplier le temps de nettoyage des sentinelles.

#### Enchaîner plusieurs sites Guardian rapprochés plutôt qu'attendre un repop

Puisqu'un site donné ne rapporte qu'un seul fragment par instance et par joueur solo, la boucle la plus efficace
observée par la communauté consiste à **enchaîner plusieurs sites Guardian déjà vérifiés et proches entre eux**,
plutôt que d'attendre une hypothétique régénération sur place :

1. Repérer, avant de partir, un petit groupe de sites confirmés dans la même zone (le tableau de la section 2 signale
   par exemple le hub **HIP 12099**, qui regroupe plusieurs sites dans un même système, et l'amas **Synuefe EU-Q
   c21-4 / c21-9 / c21-16**) via l'outil Bifrost de Canonn (voir encart ci-dessous).
2. Sur chaque site : nettoyer les sentinelles → activer les 6 pylônes → déposer la relique/clé → scanner le Terminal
   → ramasser les composants d'épave au sol au passage (voir le tableau des matériaux plus haut dans cette section).
3. Sauter directement au site vérifié suivant du groupe repéré à l'étape 1, sans revenir sur le précédent : le temps
   de trajet interstellaire remplace l'attente d'un repop, et chaque nouveau site rapporte un nouveau fragment sans
   contrainte de reconnexion.
4. Une fois le groupe de sites épuisé, soit continuer vers un autre cluster (Spansh, voir encart ci-dessous), soit
   revenir sur le premier site après une reconnexion complète pour reprendre la boucle.

#### Estimation de temps par passage sur un site Guardian

Aucune source primaire consultée ne chiffre précisément la durée totale d'un passage complet (atterrissage → segment
scanné) sur un Guardian Structure — cette durée dépend fortement de l'armement embarqué, du skill de pilotage et du
niveau de sentinelles rencontré ; ne pas prendre les chiffres suivants pour autre chose qu'un ordre de grandeur
décomposé, à valider en chronométrant son propre premier passage :

| Étape                                         | Repère chiffré disponible                                                                   |
|------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Trajet interstellaire vers le site suivant     | Variable selon la distance entre sites du même cluster (quelques minutes en Frame Shift Drive) |
| Nettoyage des sentinelles (6 à 12 selon le site) | Non chiffré par une source primaire — dépend de l'armement (section 9)                       |
| Charge des pylônes (6 au sol, contre 3 en 3 minutes sur une balise) | Ordre de grandeur extrapolé de quelques minutes (voir point 4 ci-dessus)          |
| Dépôt de la relique/clé + scan du Terminal     | Quelques secondes une fois les pylônes chargés                                               |

#### Où vérifier des sites Guardian et des coûts à jour (Bifrost, Inara, Spansh)

Pas seulement à mentionner en passant : ces trois outils couvrent, ensemble, tout le cycle de préparation d'une
session de farming Guardian et se complètent — utiliser les trois avant de partir en expédition ciblée :

1. **Canonn Bifrost — « Guardian Ancient Ruins »** (https://ruins.canonn.tech/, listé sur canonn.science/resources/) :
   liste filtrable des systèmes à sites Guardian connus par la communauté — le point de départ pour choisir un
   cluster de sites rapprochés (étape 1 de la boucle ci-dessus).
2. **Inara.cz — Technology Brokers** (https://inara.cz/elite/techbroker/2/) : coût exact et à jour en fragments,
   matériaux Guardian et commodities pour chaque plan (tableau ci-dessus), et localisation du comptoir le plus proche
   pour dépenser les fragments une fois farmés.
3. **Spansh.co.uk — planificateur de routes** (voir section 11) : une fois le cluster de sites choisi via Bifrost,
   construire l'itinéraire optimisé entre ces systèmes plutôt que de les visiter dans un ordre arbitraire.

### Contexte récent : la colonisation de systèmes et la demande en matériaux Guardian

La fonctionnalité de **colonisation de systèmes** a été lancée en bêta le **26 février 2025** (mise à jour *Trailblazers*,
v4.1.0.0), puis est sortie de bêta le **11 novembre 2025** via le *Dodec Update* (v4.2.2.0) — voir
[Chronologie canonique](./00-chronologie-canonique.md) pour le détail sourcé de ces dates. Certains projets de
construction en jeu font appel à un large éventail de marchandises manufacturées et technologiques dans leurs listes de
matériaux requis, ce qui a relancé une demande communautaire pour le farming de matériaux Guardian. Pour la mécanique
complète de colonisation (coûts, étapes de construction, logistique), voir [La Colonisation de systèmes](./18-colonisation.md)
plutôt qu'un résumé partiel ici ; il est recommandé de vérifier les quantités et types exacts requis auprès des patch
notes officiels ou d'Inara avant de planifier une session de farming dédiée à un projet de colonisation.

## Ressources et outils communautaires pour approfondir les Guardians

| Ressource                                             | Usage                                                                                                                                                                |
|---------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Canonn Research** (canonn.science)                  | Référence communautaire pour le lore Guardian : Codex, cartographie des sites, suivi de la mission Ram Tah, Guardian Beacons/Structures/Sentinels/Relics             |
| **Canonn Bifrost — « Guardian Ancient Ruins »** (ruins.canonn.tech, listé sur canonn.science/resources/) | Liste filtrable des systèmes à sites Guardian connus — point de départ pour repérer un cluster de sites rapprochés (voir la boucle de session en section 10) |
| **Elite Dangerous Wiki** (Fandom)                     | Fiches techniques précises (ingrédients exacts par plan, emplacements de sites, mécanique des pylônes/sentinelles détaillée en section 10)                          |
| **Inara.cz** (inara.cz/elite/techbroker/2/ pour le comptoir Guardian) | Coûts exacts en fragments/matériaux/commodities par plan au Tech Broker, localisation du comptoir le plus proche                                     |
| **EDSM** (edsm.net)                                   | Base de données galactique communautaire (plus de 475 millions de corps célestes répertoriés) ; localisation et journalisation des coordonnées des systèmes Guardian |
| **Spansh.co.uk**                                      | Planificateur de routes avancé (« road-to-riches », planification multi-systèmes) pour organiser une expédition visitant plusieurs sites Guardian d'affilée          |
| **EDCD/coriolis-data et EDCD/FDevIDs** (GitHub)       | Bases techniques communautaires (fichiers du jeu extraits) utilisées dans ce guide pour les statistiques d'armes/modules et les grades de matériaux                 |
| **Forums officiels Frontier** (forums.frontier.co.uk) | Section Aliens dédiée aux discussions Guardian/Thargoid, fils-guides communautaires                                                                                  |
| **Reddit r/EliteDangerous et r/canonn**               | Discussions sur les configurations d'armement optimales et les routes de farming les plus efficaces                                                                  |

Canonn Research organise son contenu en quatre départements — Archéologie & Histoire, Cartographie & Exploration,
Géologie & Organismes de Surface, Technologie Xéno — et maintient un Codex avec des dizaines d'entrées audio sur les
Guardians. Le site documente également des « Unclassified/Green Relics » encore non pleinement expliquées dans le lore,
preuve que l'enquête communautaire se poursuit activement.

## Conclusion — pourquoi les Guardians restent centraux dans Elite Dangerous

La civilisation Guardian reste, plus de dix ans après la sortie du jeu, l'un des fils narratifs et mécaniques les plus
riches d'Elite Dangerous : un lore encore actif porté par Canonn Research et Ram Tah, une boucle de gameplay complète
allant du puzzle de ruines paisible au combat contre des sentinelles, et un arsenal de modules (armes, boucliers, coque,
FSD booster) devenu central dans le méta anti-xéno moderne. Pour toute expédition de farming ciblée, croiser les
informations de ce guide avec les données précises d'Inara et du wiki communautaire reste la meilleure façon de partir
préparé.

## Voir aussi

- [Chronologie canonique](./00-chronologie-canonique.md) — dates officielles vérifiées (Powerplay 2.0, Colonisation,
  etc.), pour éviter les confusions de dates entre mises à jour.
- [Ingénieurs](./06-ingenieurs.md) — méthode générale de déblocage et d'application des modifications d'ingénierie,
  y compris sur les armes Guardian.
- [Équipement à pied](./07-equipement-a-pied.md) — combinaisons, armes et outils Odyssey pour le volet à pied des sites
  Guardian.
- [Combat spatial](./08-combat-spatial.md) — bases du pilotage et du combat, complémentaires aux bonnes pratiques de la
  section 9.
- [Combat à pied](./09-combat-a-pied.md) — mécaniques de combat FPS génériques applicables sur les sites Guardian.
- [Exploration](./10-exploration.md) — routes, scan et exobiologie, notamment pour combiner farming Guardian et Brain
  Trees.
- [Vaisseaux](./03-vaisseaux.md) — fiches techniques complètes des coques recommandées en sections 6 et 9.
- [La Colonisation de systèmes](./18-colonisation.md) — mécanique complète de colonisation, à l'origine d'une demande
  accrue en matériaux Guardian (section 10).
- [Combat anti-Thargoïde (AX) approfondi](./25-combat-ax.md) — approfondissement du combat AX, où les armes Guardian de
  la section 7 occupent une place centrale.

## Sources

- https://canonn.science/
- https://canonn.science/tag/guardians/
- https://canonn.science/science/archaeology-history/
- https://canonn.science/codex/
- https://canonn.science/science/xeno-technology/
- https://www.edsm.net/en/ (API publique — coordonnées galactiques utilisées pour calculer les distances de la
  section 2)
- https://github.com/EDCD/coriolis-data (statistiques d'armes et de modules Guardian, section 7 et 8)
- https://github.com/EDCD/FDevIDs (grades et symboles internes des matériaux Guardian, section 10)
- https://en.wikipedia.org/wiki/Elite_Dangerous
- 00-chronologie-canonique.md (dates de la colonisation de systèmes, section 10)
- https://elite-dangerous.fandom.com/wiki/Ancient_Data_Terminal (via l'API MediaWiki publique — mécanique des 6
  pylônes, du dépôt de relique/clé et du scan, section 10)
- https://elite-dangerous.fandom.com/wiki/Guardian_Structure (via l'API MediaWiki publique — nécessité de se
  reconnecter pour rescanner un même Terminal en solo, section 10)
- https://elite-dangerous.fandom.com/wiki/Guardian_Beacon (via l'API MediaWiki publique — minutage de 3 minutes pour
  les 3 pylônes d'une balise, section 10)
- https://elite-dangerous.fandom.com/wiki/Guardian_Sentinel (via l'API MediaWiki publique — comportement des
  sentinelles, section 9)
- https://elite-dangerous.fandom.com/wiki/Technology_Broker (via l'API MediaWiki publique — mécanique générale de
  déblocage/achat au Tech Broker)
- https://inara.cz/elite/techbroker/2/ (comptoir Guardian — fragments, matériaux et commodities exacts par plan,
  section 10)
- https://canonn.science/resources/ et https://ruins.canonn.tech/ (outil communautaire Bifrost de recensement des
  sites Guardian, sections 2 et 10)
