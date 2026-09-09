# Elite Dangerous : Guide complet des Opérations (Odyssey)

## Vue d'ensemble

Le mode **Opérations** désigne ici l'ensemble du gameplay à pied (*on-foot*) introduit avec l'extension **Odyssey**,
lancée le 19 mai 2021 sur PC. Il permet aux commandants de quitter leur vaisseau pour explorer des installations
planétaires (« settlements »), interagir avec elles via des tableaux de mission locaux, mener des combats en vue
première personne, s'infiltrer discrètement, pirater des systèmes informatiques et remplir des contrats allant du
simple sabotage à l'assassinat ciblé. Ce guide couvre l'intégralité de ce périmètre : typologie des settlements,
catégories de missions au sol, mécaniques d'infiltration et de piratage, zones de conflit à pied, équipement
(combinaisons et armes), progression par l'ingénierie, récompenses, et conseils pratiques.

**Attention au titre** : une rumeur communautaire non confirmée associe aussi le mot « Operations » à un prétendu
mode multijoueur distinct. Voir la mise au point dans la section
[À propos du nom Operations et de la rumeur associée](#à-propos-du-nom-operations-et-de-la-rumeur-associée) juste en
dessous avant de continuer.

Odyssey a connu un lancement difficile : d'importants problèmes de stabilité client/serveur, des bugs de gameplay et
des performances PC inadéquates ont entraîné des retours largement négatifs sur Steam. Frontier Developments a réagi
en publiant sept mises à jour majeures dans les mois suivants — les cinq premières sur un rythme hebdomadaire,
centrées en priorité sur la stabilité, puis deux mises à jour supplémentaires (juillet et septembre 2021) portant sur
les missions, l'interface et l'optimisation des performances. La version console de l'extension, dont la sortie avait
déjà été repoussée indéfiniment en juillet 2021, a finalement été annulée en mars 2022, Frontier ayant choisi de
concentrer ses efforts sur une base de code unique post-Odyssey, développée pour PC. Ces éléments de contexte
n'affectent plus l'expérience de jeu actuelle, mais expliquent pourquoi certaines mécaniques ont été révisées par la
suite (notamment l'ajout des « missions partagées » facilitant le jeu à plusieurs sur les opérations au sol).

## Voir aussi

Ce guide se concentre sur les **mécaniques d'opération au sol** (settlements, missions, infiltration, CZ). Pour
éviter les redites entre guides du corpus, le détail exhaustif de certains sujets connexes vit ailleurs :

- **[07 — Équipement à pied](./07-equipement-a-pied.md)** : catalogue complet des armes par fabricant, tables
  d'ingénierie (Engineers, blueprints, coûts, grades de matériaux), builds nommés. Ce guide-ci ne reprend que des
  tableaux condensés qui renvoient vers 07 pour l'exhaustif.
- **[09 — Combat à pied](./09-combat-a-pied.md)** : tactiques et choix de style de jeu en combat à pied.
- **[06 — Ingénieurs](./06-ingenieurs.md)** : mécanique générale de l'ingénierie (vaisseaux et à pied).
- **[02 — Powerplay](./02-powerplay.md)** : cycles hebdomadaires Acquisition/Renforcement/Undermining et leur effet
  sur les missions et zones de conflit au sol.
- **[18 — Colonisation](./18-colonisation.md)** : mécanique complète de colonisation de systèmes et des nouvelles
  installations qu'elle crée.
- **[00 — Chronologie canonique](./00-chronologie-canonique.md)** : arbitrage daté de toutes les confusions
  chronologiques mentionnées dans ce guide.

## À propos du nom Operations et de la rumeur associée

Le titre de ce guide partage son nom avec une rumeur communautaire non confirmée évoquant un mode multijoueur
distinct appelé « Operations », qui serait accompagné d'un vaisseau « Nomad ». Aucune source fiable ne confirme
l'existence de ce mode ni d'aucune date qui lui serait associée : ni l'article Wikipédia sur *Elite Dangerous* (dont
la seule fonctionnalité majeure documentée pour 2024-2026 est la **System Colonisation**), ni l'article Wikipédia
sur *Elite Dangerous: Odyssey* (qui liste les missions à pied réellement existantes — Mercenary, Covert Heist,
Salvage, Rescue, Assassination, Exobiology, Ground Combat Zones — sans qu'aucune ne soit nommée « Operations »), ni
le fil GalNet agrégé par Inara.cz. De même, aucune source fiable ne confirme l'existence d'un vaisseau « Nomad » : la
liste quasi exhaustive des vaisseaux d'Inara.cz (47 vaisseaux au 9 septembre 2026, vérification refaite en direct ce
jour-là) n'en mentionne aucun, pas plus que l'article Wikipédia sur *Elite Dangerous*.

Cette entrée du corpus est donc à traiter comme non fondée (probable rumeur, fan-fiction ou confusion), et aucune
date, nom d'opération, monnaie ou caractéristique de vaisseau qui lui serait associée ne doit être considérée comme
un fait. Ce guide-ci ne traite que du gameplay à pied introduit avec **Odyssey le 19 mai 2021**, un contenu bien réel
et sans rapport avec cette rumeur.

## Accéder aux opérations : embarquement et déplacement

Il existe plusieurs façons de rejoindre une opération au sol :

- **Atterrissage direct sur le settlement** : si l'autorisation d'accostage est accordée (settlement civil ou faction
  amicale), le vaisseau se pose directement sur une plateforme du site, ce qui donne un accès rapide mais expose
  immédiatement le joueur aux systèmes de sécurité du settlement.
- **Atterrissage à proximité, puis approche à pied ou en véhicule** : pour les settlements non autorisés, hostiles, ou
  lorsque la mission exige la discrétion, il est préférable de se poser hors du périmètre de détection et d'approcher
  à pied ou en SRV (véhicule terrestre).
- **Forçage de l'accès** : en l'absence d'autorisation, certaines missions demandent d'obtenir un code de bypass, de
  pirater le contrôle d'accès, ou d'entrer par une voie non surveillée (conduit technique, porte non verrouillée,
  faille dans le périmètre).

Une fois sur place, le déplacement se fait en vue première personne, avec une gestion de l'oxygène (réserve de la
combinaison, rechargeable via des bonbonnes ou en retournant au vaisseau/à une station), un système de posture
(debout, accroupi, ramper) qui influence la vitesse de détection, et un scanner de profil (« Profile Analyser »)
permettant d'identifier les gardes, employés civils et objets d'intérêt à distance.

## Les settlements : typologie et sécurité

### Types de settlements par activité économique

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

### Niveaux de sécurité

Chaque settlement affiche un niveau de sécurité qui conditionne la difficulté de l'opération :

| Niveau de sécurité | Gardes                                  | Défenses automatiques                                       | Réaction à l'alerte                                      |
|--------------------|------------------------------------------|---------------------------------------------------------------|-------------------------------------------------------------|
| Aucune / civile    | Employés non armés uniquement           | Aucune ou minimale                                          | Signalement, pas de riposte armée                        |
| Faible             | Quelques agents armés légers            | Caméras occasionnelles                                      | Renforts limités, délai de réponse long                  |
| Moyenne            | Agents de sécurité armés en nombre      | Tourelles ponctuelles, drones de surveillance               | Renforts rapides, verrouillage partiel                   |
| Élevée             | Troupes d'élite, patrouilles nombreuses | Tourelles multiples, drones actifs, confinement automatique | Renforts massifs, verrouillage total, scans au décollage |

Le niveau de sécurité influence aussi le comportement des patrouilles (rotations, cycles jour/nuit) et la probabilité
de croiser des gardes en dehors des zones normalement surveillées.

### Autorisations d'accès

Un settlement peut être librement accessible (autorisation civile automatique) ou nécessiter une **autorisation
d'accostage** demandée en approche. Sans autorisation, trois options existent : accomplir une mission ou une action de
type « bypass » pour l'obtenir légitimement, s'infiltrer discrètement par une entrée non surveillée, ou engager le
combat frontalement en acceptant le statut recherché qui en découle localement.

## Le tableau de missions et les types d'opérations au sol

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
la section [Récompenses des opérations](#récompenses-des-opérations) pour la table des gains associés à chaque
niveau de menace.

### Powerplay et missions d'Opérations

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

### Détection visuelle et sonore

La discrétion repose sur le champ de vision des gardes et des caméras/tourelles automatiques, sur le bruit produit
par le joueur (courir est bien plus détectable que marcher accroupi) et sur l'état apparent du joueur : dégainer une
arme dans une zone civile ou surveillée déclenche immédiatement la suspicion, même sans tir.

### Escalade de la suspicion

Être repéré en zone interdite, forcer une porte verrouillée ou pirater un terminal sous observation fait monter un
niveau de suspicion progressif. Ce niveau peut redescendre si le joueur se met hors de vue suffisamment longtemps, ou
déclencher une **alerte complète** s'il continue de s'exposer.

### Confinement et statut recherché

Une alerte complète entraîne le verrouillage des portes en mode confinement, l'appel de renforts armés, l'activation
des tourelles, et l'attribution d'un statut recherché localement au joueur. Ce statut complique l'extraction :
ressortir du site implique alors soit un affrontement direct, soit un risque de scan au moment du décollage si le
vaisseau reste dans la zone de sécurité du settlement.

### Contre-mesures

Certaines combinaisons et modules réduisent la vitesse de détection ou le bruit produit par le joueur, ce qui
facilite nettement une approche furtive prolongée. Une bonne connaissance du cycle des rondes et des angles morts
des caméras reste toutefois l'outil le plus fiable pour éviter toute alerte.

## Piratage de terminaux et de portes (hacking)

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

## S'équiper : les combinaisons (suits)

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

## S'équiper : les armes

Les armes à pied se répartissent en plusieurs catégories, chacune déclinée en variantes cinétique, laser ou plasma,
avec pour certaines une version non létale.

### Fabricants

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

### Armes nommées par archétype de mission

Pour faire le lien avec le tableau de missions plus haut, voici les modèles nommés qui reviennent le plus souvent
dans la documentation communautaire pour chaque archétype (source : builds nommés recensés dans
[07-equipement-a-pied.md](./07-equipement-a-pied.md), à recouper avec 09-combat-a-pied.md pour la cohérence
tactique) :

| Archétype de mission (voir tableau plus haut) | Arme recommandée               | Fabricant           | Pourquoi                                                                 |
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

## Outils, utilitaires et consommables

En complément des armes, le joueur dispose d'emplacements « Suit Tool » et « Utility » pouvant accueillir :

- l'**outil de piratage**, indispensable pour toute mission de hacking ;
- le **Profile Analyser**, pour scanner à distance gardes, civils et points d'intérêt ;
- des **grenades** (fragmentation, EMP pour désactiver temporairement l'électronique, ou étourdissantes en variante
  non létale) ;
- des **consommables de survie** (recharge d'oxygène, kits de soin) essentiels lors d'opérations prolongées loin du
  vaisseau.

Pour le détail des recettes de synthèse et la liste exhaustive des consommables, voir
[07-equipement-a-pied.md](./07-equipement-a-pied.md).

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
dans [07-equipement-a-pied.md](./07-equipement-a-pied.md) et les rapproche de l'archétype de mission (voir le
tableau de missions plus haut, et [06-ingenieurs.md](./06-ingenieurs.md) pour la mécanique générale d'ingénierie) le
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

## Récompenses des opérations

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

## Colonisation et sécurité des installations

Depuis le lancement de la **Colonisation de systèmes**, les commandants peuvent construire eux-mêmes des systèmes et
des établissements, ce qui crée directement de nouvelles installations planétaires relevant du même périmètre de
sécurité que celui décrit dans ce guide (typologie de settlement, niveaux de sécurité, gardes et défenses
automatiques — voir [Les settlements : typologie et sécurité](#les-settlements--typologie-et-sécurité) plus haut).

**Chronologie corrigée** (voir [00-chronologie-canonique.md](./00-chronologie-canonique.md) pour le détail complet) :

- **20 octobre 2024** : annonce de la fonctionnalité lors du livestream Frontier Unlocked.
- **26 février 2025** : lancement en **bêta**, dans le cadre de la mise à jour gratuite « Elite Dangerous:
  Trailblazers ». Une version antérieure de ce guide indiquait le 28 février 2025 pour cette étape — cette date est
  en réalité celle d'un article explicatif publié deux jours après le lancement réel de la bêta, pas celle du
  lancement lui-même.
- **11 novembre 2025** : sortie de bêta et **lancement complet**, via la mise à jour officiellement nommée « Dodec
  Update » (version 4.2.2.0).

Comme le résume [09-combat-a-pied.md](./09-combat-a-pied.md#colonisation-powerplay-20-et-nouvelles-zones-de-conflit),
les conflits et l'état de sécurité des systèmes colonisés génèrent de nouvelles zones de conflit au sol, en
complément des Ground CZ traditionnelles et de celles liées à Powerplay 2.0. Pour toute la mécanique de
colonisation elle-même (revendication de système, construction, coût, gouvernance) — hors du périmètre de ce
guide — voir le guide dédié [18-colonisation.md](./18-colonisation.md), qui fait référence sur ce sujet plutôt que
de dupliquer ce contenu ici.

## Contexte et évolutions récentes

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

Pour les évolutions liées à la Colonisation et à Powerplay 2.0, voir respectivement
[Colonisation et sécurité des installations](#colonisation-et-sécurité-des-installations) ci-dessus et
[Powerplay et missions d'Opérations](#powerplay-et-missions-dopérations) plus haut.

## Stratégies et conseils pour progresser efficacement

- **Commencer petit** : réaliser des missions à faible menace en Flight Suit pour apprendre les mécaniques de
  détection et d'alarme avant d'investir dans une combinaison spécialisée.
- **Choisir la combinaison selon le style de mission dominant** plutôt que de tout miser sur un seul modèle :
  Dominator pour le combat frontal et les CZ, Maverick pour l'infiltration et le piratage, Artemis pour la
  polyvalence et le combat discret à distance.
- **Prioriser l'accès aux Engineers d'équipement à pied** dès que possible (voir le tableau par archétype plus
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

## Notes sur les guides communautaires

Deux guides publiés sur la page Steam Community du jeu traitent spécifiquement de ce périmètre et peuvent compléter
ce document pour les commandants souhaitant approfondir certains détails d'équipement ou de mission :

- *Ground Combat Modules (Elite Dangerous)* par ZanyScum — recensement des modules disponibles pour combinaisons et
  armes de poing.
- *How to do Odyssey Assassination Missions* par Sighman — guide dédié aux missions d'assassinat à pied.

## Voir aussi

- **[07 — Équipement à pied](./07-equipement-a-pied.md)** — catalogue complet des armes par fabricant, tables
  d'ingénierie exhaustives (Engineers, blueprints, coûts, grades de matériaux), outils et consommables.
- **[09 — Combat à pied](./09-combat-a-pied.md)** — tactiques et style de jeu en combat à pied.
- **[06 — Ingénieurs](./06-ingenieurs.md)** — système général d'ingénierie (vaisseaux et à pied).
- **[02 — Powerplay](./02-powerplay.md)** — Powerplay 2.0 / extension Ascendancy (31 octobre 2024), cycles
  hebdomadaires Acquisition/Renforcement/Undermining.
- **[18 — Colonisation](./18-colonisation.md)** — mécanique complète de colonisation de systèmes.
- **[00 — Chronologie canonique](./00-chronologie-canonique.md)** — arbitrage daté de toutes les corrections
  chronologiques appliquées dans ce guide.

## Sources

- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://www.edsm.net/en/
- https://canonn.science/
- https://www.pcgamesn.com/elite-dangerous
- https://steamcommunity.com/app/359320/guides/
- https://steamcommunity.com/app/359320/guides/?searchText=odyssey+ground+combat

**Note de vérification (9 septembre 2026)** : la table de récompenses par niveau de menace n'a pas pu être recoupée
avec une source primaire ou une base communautaire dans cette session (budget de recherche web épuisé ;
elite-dangerous.fandom.com a renvoyé une erreur HTTP 402, inara.cz une erreur HTTP 410 lors des tentatives d'accès
direct). Les autres données de ce guide (settlements, missions, Engineers, armes) proviennent du recoupement avec
07-equipement-a-pied.md, 06-ingenieurs.md, 09-combat-a-pied.md, 02-powerplay.md et 00-chronologie-canonique.md. La
section sur le nom « Operations » et le vaisseau « Nomad » a été vérifiée et corrigée le 9 septembre 2026 : aucune
source fiable ne confirme leur existence (voir la section
[À propos du nom Operations et de la rumeur associée](#à-propos-du-nom-operations-et-de-la-rumeur-associée)
ci-dessus pour le détail des vérifications effectuées).
