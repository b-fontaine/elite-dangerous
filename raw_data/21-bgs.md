---
id: 21-bgs
titre: "Le Background Simulation (BGS)"
domaine: politique
entites: [Background Simulation, faction mineure, tick quotidien, influence, faction contrôlante, Boom, Famine, Outbreak,
  Lockdown, Investment, Expansion, Retreat, War, Civil War, Election, Player Minor Faction, BGS-Tally]
mots_cles_en: [background simulation, bgs, minor faction, controlling faction, influence, tick, boom, bust, famine, outbreak,
  lockdown, civil unrest, investment, expansion, retreat, war, civil war, election, conflict zone, player minor faction, bgs-tally]
version_jeu_couverte: "4.4.0.x (mécanique stable depuis 2015, non rattachée à une version précise)"
branche: live
date_verification: 2026-09-12
confiance_globale: moyenne
volatilite: basse
sources_primaires: [Wikipédia EN/FR, 00-chronologie-canonique du corpus, wiki GitHub aussig/BGS-Tally,
  connaissances communautaires corroborées]
zones_incertaines: ["horaire exact du tick quotidien, jamais publié par Frontier et dérivant au fil des années",
  "seuil d'influence déclenchant une Expansion (~35 %), estimation communautaire non officielle",
  "seuil d'influence déclenchant un Retreat (2,5 à 5 %), estimation communautaire non officielle",
  "algorithme de sélection du système cible d'une Expansion, non documenté officiellement",
  "valeur numérique du plafond d'influence par tick (« tick cap »), non confirmée",
  "rapport de poids exact entre les cinq paliers de récompense de mission ventilés par BGS-Tally",
  "classement chiffré d'INF par heure de jeu entre les leviers, non établi faute de source vérifiable",
  "formule complète de calcul de l'influence, jamais publiée par Frontier Developments"]
guides_lies: [2, 8, 11, 16, 18, 22, 24, 29]
---

# Le Background Simulation (BGS)

## En bref

Le **Background Simulation** (**BGS**) est le moteur qui simule en permanence, dans chaque système peuplé
d'*Elite Dangerous*, l'**influence** (*influence*) des **factions mineures** (*minor factions*) — de 3 à 10 par système,
pour une somme toujours égale à **100 %**. Il se met à jour une fois par cycle de 24 heures lors d'un **tick**, dont
l'horaire n'a jamais été publié : une session de jeu ne produit donc jamais d'effet visible avant le lendemain. La
faction la plus influente est la **faction contrôlante** (*controlling faction*) et fixe allégeance, taxes et accès au
marché noir. Les factions traversent des **états** (*states*) économiques — **Boom**, **Bust**, **Famine**, **Outbreak**,
**Lockdown**, **Investment** — ou de conflit — **War**, **Civil War**, **Election**, **Expansion** (autour de 35 %
d'influence selon le consensus communautaire), **Retreat** (2,5 à 5 %). Un commandant pèse sur le BGS par ses missions,
ses ventes, ses primes, ses **Conflict Zones**, ses dons et ses données d'exploration ; les groupes organisés pilotent
leurs campagnes au tick et instrumentent leur effort avec le plugin **BGS-Tally**.

## Introduction — ce que simule le BGS et ce que couvre ce guide

Sous la surface visible d'*Elite Dangerous* — les combats, le commerce, l'exploration — tourne en permanence un moteur
discret qui décide, système par système, qui gouverne, quelles denrées manquent, où éclate une guerre civile et où une
faction s'effondre : le **Background Simulation**, universellement abrégé **BGS**. Présent depuis le lancement du jeu
en 2014-2015, ce système n'a jamais fait l'objet d'une documentation officielle détaillée de la part de Frontier
Developments : ses seuils numériques précis (pourcentages d'influence déclenchant une expansion, une guerre ou un
retrait) n'ont jamais été publiés et proviennent entièrement d'un travail collectif de rétro-ingénierie mené par la
communauté depuis 2015. Sa mécanique générale, en revanche, est stable, largement corroborée et documentée par des
milliers d'heures d'observation communautaire.

Ce guide explique ce qu'est le BGS, comment il façonne la carte politique de la bulle humaine, quels états peut prendre
une faction mineure, comment une expansion ou un retrait se déclenche, et surtout comment un commandant — seul ou au
sein d'un groupe organisé — peut peser dessus. Il se termine par un point sur l'articulation du BGS avec trois autres
systèmes de jeu majeurs : Powerplay, la Colonisation et les Community Goals.

## 1. Qu'est-ce que le Background Simulation ?

### 1.1 Le BGS, un moteur de simulation continue des factions mineures

Le BGS est le système qui simule, pour chaque système peuplé de la galaxie, l'état de ses factions mineures : leur
influence relative, leur allégeance, leur type de gouvernement, et un ensemble d'« états » (*states*) économiques ou
politiques qui modifient temporairement les conditions de jeu locales (primes, prix, sécurité, accès au marché noir,
missions disponibles, etc.). Il tourne indépendamment du fait qu'un joueur soit présent ou non dans le système : les
actions des personnages non-joueurs (PNJ) continuent de compter, mais l'activité des commandants — missions
complétées, marchandises vendues, ennemis abattus — a un poids déterminant sur son évolution.

Le BGS n'est pas un système « à part » que l'on choisirait d'activer : il tourne en permanence, dans absolument tous
les systèmes habités du jeu, qu'un joueur s'y intéresse ou non. Un commandant qui ne s'en préoccupe jamais y participe
quand même dès qu'il vend une cargaison, complète une mission ou abat un vaisseau ennemi dans un système peuplé.

### 1.2 Le tick quotidien du BGS : une agrégation des actions sur 24 heures

Le BGS se met à jour une fois par cycle de 24 heures, lors d'un événement communément appelé le **tick**. Durant ce
tick — dont l'horaire exact n'a jamais été fixé ni publié officiellement par Frontier Developments et a dérivé à
plusieurs reprises au fil des années selon les rapports de la communauté — le serveur agrège l'ensemble des actions
effectuées par les joueurs dans les dernières 24 heures, calcule les nouvelles valeurs d'influence de chaque faction
mineure dans chaque système concerné, et détermine si un nouvel état doit démarrer, se poursuivre ou se terminer.

Points importants sur le tick :

- Les actions effectuées **après** le tick du jour ne sont comptabilisées qu'au tick **suivant** : l'effet d'une
  session de jeu n'est donc jamais visible immédiatement, mais seulement le lendemain.
- Le tick est propre à chaque système : il n'y a pas de mise à jour simultanée strictement identique partout, même si
  l'essentiel des systèmes bascule dans une fenêtre commune.
- L'horaire précis de cette fenêtre commune varie selon les périodes et les rapports communautaires (des groupes
  spécialisés en BGS republient régulièrement l'horaire observé, par exemple via le plugin BGS-Tally — documenté dans
  [Outils](./16-outils.md) — ou les outils cités en 5.6) ; aucun horaire fixe ne doit être considéré comme garanti
  sans le recouper avec une source communautaire à jour au moment de jouer.
- Les groupes de joueurs qui pratiquent le BGS de façon intensive organisent généralement leurs campagnes en cycles
  correspondant à ces ticks quotidiens (« faire du BGS » se compte en général en jours de tick, pas en heures de jeu).

### 1.3 Une mécanique de BGS stable depuis 2015

Le BGS a été introduit avec le jeu de base et son fonctionnement général — factions mineures, influence en
pourcentage, états économiques et de conflit, expansion/rétraction — n'a pas connu de refonte structurelle majeure
depuis. Des ajustements ponctuels (nouveaux états, rééquilibrages de gains d'influence par activité) sont intervenus
au fil des mises à jour, mais le squelette du système reste celui décrit dans ce guide. C'est cette stabilité qui a
permis à la communauté d'en cartographier le fonctionnement de façon aussi fine malgré l'absence de documentation
officielle.

## 2. Factions mineures et influence

### 2.1 Anatomie d'un système habité : factions mineures, allégeance, gouvernement

Chaque système peuplé d'*Elite Dangerous* héberge un certain nombre de **factions mineures** (*minor factions*), en
général entre 3 et 10 selon la taille et l'ancienneté du système. Chaque faction mineure possède :

- une **allégeance** : Fédération, Empire, Alliance, ou Indépendante (aucune superpuissance) ;
- un **type de gouvernement**, qui conditionne notamment l'accès à certains équipements/modules et le comportement de
  sa sécurité locale ;
- un ou plusieurs systèmes où elle est présente (une faction peut être implantée dans plusieurs systèmes voisins) ;
- une **valeur d'influence**, exprimée en pourcentage, propre à chaque système où elle est présente.

Les principaux types de gouvernement rencontrés dans le BGS sont résumés ci-dessous :

| Type de gouvernement | Caractéristique générale |
|---|---|
| Démocratie (*Democracy*) | Gouvernement électoral ; les conflits internes se règlent par des **Élections** plutôt que par la guerre. |
| Dictature (*Dictatorship*) | Pouvoir concentré, changements de faction contrôlante généralement plus abrupts. |
| Ploutocratie (*Patronage* / *Plutocracy*) | Pouvoir lié à la richesse et au clientélisme, fréquent dans les systèmes impériaux. |
| Coopérative (*Cooperative*) | Gouvernance collective, courante chez les indépendants et l'Alliance. |
| Confédération (*Confederacy*) | Fédération lâche de groupes locaux, également fréquente côté Alliance. |
| Théocratie (*Theocracy*) | Pouvoir religieux. |
| Communisme (*Communism*) | Économie planifiée. |
| Anarchie (*Anarchy*) | Absence d'autorité centrale reconnue ; marché noir généralement accessible sans restriction, sécurité locale minimale. |
| Corporatiste (*Corporate*) | Pouvoir détenu par une entreprise ou un consortium. |
| Féodal (*Feudal*) | Hiérarchie de vassalité, courant côté Empire. |
| Colonie pénitentiaire (*Prison Colony*) | Système dédié à l'incarcération, avec ses propres particularités de sécurité. |

### 2.2 L'influence BGS, une jauge à somme constante (100 % par système)

L'influence de chaque faction présente dans un système est exprimée en pourcentage, et **la somme des influences de
toutes les factions du système est toujours égale à 100 %**. Concrètement, cela signifie que l'influence est un jeu à
somme nulle au sein d'un même système : quand une faction gagne des points d'influence à un tick donné, une ou
plusieurs autres factions du même système en perdent mécaniquement, proportionnellement à leur poids relatif.

C'est cette contrainte qui rend le BGS intéressant à jouer collectivement : soutenir une faction ne suffit pas
toujours à la faire progresser si l'activité globale du système reste trop faible, et affaiblir délibérément une
faction rivale (via des missions de sabotage, d'assassinat ou simplement en cessant toute activité en son nom) est
souvent aussi efficace que de soutenir directement sa cible.

### 2.3 La faction contrôlante d'un système et ce qu'elle détermine

La faction ayant l'influence la plus élevée dans un système est dite **faction contrôlante** (*controlling faction*).
Elle détermine, entre autres :

- l'allégeance affichée du système (Fédération, Empire, Alliance ou Indépendant) ;
- les taxes locales appliquées sur les transactions ;
- l'accès (ou non) au marché noir et à des services spécifiques selon son type de gouvernement (une Anarchie ouvre
  largement l'accès au marché noir, une Démocratie ou une Corporation le restreint davantage) ;
- l'état affiché du système lorsqu'un état de conflit ou économique de la faction contrôlante est actif ;
- l'accès à certains équipements ou modules liés à l'allégeance de la faction contrôlante (par exemple certains
  modules réservés aux systèmes fédéraux ou impériaux).

Un changement de faction contrôlante — à la suite d'une expansion, d'une guerre remportée ou d'une élection — modifie
donc immédiatement l'expérience de jeu dans le système concerné, ce qui explique pourquoi les groupes de joueurs
orientés BGS considèrent la prise de contrôle d'un système comme un objectif à part entière.

## 3. Les états (states) d'une faction mineure

Une faction mineure peut se trouver, à un instant donné, dans un ou plusieurs **états** (*states*) qui modifient
temporairement les conditions de jeu dans les systèmes où elle est présente. On distingue traditionnellement deux
familles d'états : les états économiques/situationnels, et les états de conflit entre factions.

### 3.1 États BGS économiques et situationnels (Boom, Famine, Outbreak, Lockdown…)

Les états économiques et situationnels d'une faction mineure reflètent la conjoncture locale (activité commerciale,
incidents, aléas) plutôt qu'une confrontation directe entre factions. Plusieurs peuvent survenir de façon largement indépendante des autres factions du système.

| État | Déclencheur général | Effets principaux pour les joueurs |
|---|---|---|
| **Boom** | Forte activité commerciale soutenue en faveur de la faction | Croissance économique, primes et gains d'influence accrus pour les activités commerciales et de mission ; état généralement recherché par les groupes BGS pour accélérer une progression. |
| **Bust** (récession) | Activité commerciale en berne, influence en baisse | Ralentissement économique, perte d'influence progressive de la faction si la situation persiste, peut ouvrir la voie à une Famine ou à des troubles civils. |
| **Famine** | Pénurie de denrées alimentaires | Certaines commodités alimentaires disparaissent ou se raréfient au marché ; livrer des denrées permet des primes et des gains d'influence très élevés ; état recherché par les traders et les groupes BGS pour son fort effet de levier. |
| **Outbreak** (épidémie) | Crise sanitaire locale | Forte demande de médicaments (Basic Medicines, Performance Enhancers, etc.) ; livrer ces produits rapporte gros ; la population du système peut diminuer si l'épidémie perdure. |
| **Infrastructure Failure** | Défaillance technique locale | Perturbation de services et de la sécurité locale ; opportunités de missions de réparation/logistique. |
| **Public Holiday** | Événement festif | Ambiance positive, hausse ponctuelle de la demande de biens de loisir/luxe ; impact généralement neutre à léger sur l'influence. |
| **Drought** (sécheresse) | Pénurie en eau/ressources agricoles | Effets similaires à la Famine, centrés sur les commodités liées à l'eau et à l'agriculture. |
| **Civil Unrest** (troubles civils) | Mécontentement local, souvent après une Bust ou une attaque | Sécurité dégradée, hausse de la criminalité et des opportunités de chasse aux primes ; peut fragiliser la faction contrôlante. |
| **Lockdown** | Suite d'une attaque, d'une guerre ou de troubles graves | Restriction de l'accès aux services de station (docking, marché) ; contraint fortement l'activité commerciale locale. |
| **Pirate Attack / Terrorist Attack** | Incident de sécurité ponctuel | Dégradation temporaire de la sécurité et de l'influence de la faction visée ; opportunités de missions de représailles. |
| **Natural Disaster** | Catastrophe naturelle | Perte de population/influence, opportunités de missions humanitaires. |
| **Investment** | État préparatoire, précède une Expansion | Signale qu'une faction approche du seuil d'expansion ; les activités de soutien y sont particulièrement efficaces pour préparer la future expansion. |

Une faction peut cumuler un état économique/situationnel avec, en parallèle, un état de conflit (par exemple être en
Boom dans un système tout en étant en Guerre dans un autre où elle est également présente).

### 3.2 États de conflit BGS (Expansion, Retreat, War, Civil War, Election)

Les états de conflit du BGS naissent de la proximité des niveaux d'influence entre deux (ou plusieurs) factions d'un
même système, ou du franchissement d'un seuil haut ou bas par une faction isolée.

| État | Déclencheur | Résolution |
|---|---|---|
| **Expansion** | Une faction franchit un seuil d'influence élevé (le consensus communautaire, non officiel, situe ce seuil autour de 35 % ou plus) et est précédée d'un état préparatoire *Investment* | La faction s'implante dans un système voisin candidat, choisi selon des critères de distance et de score qui restent partiellement empiriques ; l'expansion réussit ou échoue au tick suivant selon l'activité enregistrée. |
| **Retreat / Retraction** | L'influence d'une faction tombe et se maintient sous un seuil bas (consensus communautaire non officiel autour de 2,5 à 5 %) pendant plusieurs ticks | La faction se retire intégralement du système : elle perd toute présence et toutes ses stations/actifs locaux repassent aux factions restantes. |
| **War** (état de guerre) | Deux factions ont des niveaux d'influence très proches l'une de l'autre | Résolu par du combat en Conflict Zones spatiales et au sol ; la faction remportant le plus de zones de conflit sur la période gagne en influence, pouvant aller jusqu'à la prise de contrôle du système. |
| **Civil War** (guerre civile) | Équivalent d'une War, mais entre deux factions de même allégeance/groupe au sein du système | Même mécanique de résolution par Conflict Zones que la War ; l'issue redistribue l'influence entre les deux factions concernées. |
| **Election** | Équivalent pacifique d'une War/Civil War entre deux factions **démocratiques** aux influences proches | Résolue par l'activité de mission plutôt que par du combat létal ; la faction générant le plus d'activité de soutien remporte l'élection et gagne en influence. |

Les seuils numériques cités ci-dessus (35 % pour l'expansion, 2,5-5 % pour le retrait) sont des **estimations
communautaires non officielles**, issues d'années d'observation par des groupes de joueurs spécialisés en BGS ; Frontier
Developments n'a jamais publié les valeurs exactes ni la formule complète de calcul. Ils doivent être traités comme des
ordres de grandeur indicatifs plutôt que comme des règles absolues, d'autant qu'ils peuvent avoir été ajustés au fil
des mises à jour sans annonce officielle. Un commandant qui planifie une campagne BGS précise a intérêt à recouper ces
valeurs avec un outil communautaire à jour (voir 5.6) avant de s'y fier au tick près.

## 4. Expansion et rétraction d'une faction mineure : la mécanique de territoire

### 4.1 Comment une faction mineure s'étend (Investment puis Expansion)

Lorsqu'une faction approche du seuil d'expansion, elle entre d'abord dans l'état préparatoire **Investment**, puis
bascule en **Expansion** si son influence reste suffisamment élevée au tick suivant. Le système cible de l'expansion
est choisi parmi les systèmes voisins non contrôlés par la faction, selon des critères combinant proximité et un score
d'adéquation (population, économie, présence ou non de la faction dans des systèmes déjà proches) — les détails exacts
de cet algorithme de sélection ne sont pas documentés officiellement et restent partiellement empiriques.

Une expansion réussie installe la faction comme nouvelle présence dans le système cible, avec une influence de départ
généralement modeste, qui devra ensuite être développée comme celle de toute autre faction du système par les
activités décrites en section 5.

### 4.2 Comment une faction mineure se retire d'un système (Retreat)

À l'inverse, une faction dont l'influence chute et se maintient durablement sous le seuil bas entre en état de
**Retreat**. Si la situation ne se redresse pas, la faction perd toute présence dans le système : elle en disparaît
purement et simplement, cédant la totalité de son influence aux factions restantes (proportionnellement à leur poids
respectif). C'est le principal outil dont dispose un groupe de joueurs pour faire disparaître une faction hostile ou
indésirable d'un système : cesser tout soutien à son égard, voire cibler ses missions et ses activités pour accélérer
sa chute sous le seuil.

Une faction qui perd sa dernière présence dans tous les systèmes où elle existait disparaît définitivement de la
galaxie.

### 4.3 Les factions mineures créées par des joueurs (PMF)

Un groupe de joueurs (généralement une escadre ou une communauté organisée) peut demander la création d'une **faction
mineure de joueurs** (*Player Minor Faction*, PMF), rattachée dès sa création à un système donné. Une fois créée, une
PMF suit exactement les mêmes règles de BGS qu'une faction non-joueur (NPC) : elle gagne ou perd de l'influence selon
l'activité enregistrée en son nom, peut entrer en Boom, en Guerre, en Expansion ou en Retreat comme n'importe quelle
autre faction. La différence tient uniquement à l'intention qui la pilote : une PMF est en général au service d'un
groupe qui coordonne délibérément ses campagnes d'expansion, de défense ou d'influence, alors qu'une faction NPC suit
une trajectoire plus organique.

## 5. Comment un joueur (ou un groupe) influence le BGS

Toute action ayant un effet économique, sécuritaire ou politique enregistrable dans un système peuplé nourrit le BGS.
Les leviers les plus efficaces et les plus utilisés par les groupes spécialisés sont les suivants.

### 5.1 Missions : le levier BGS le plus direct et le plus contrôlable

Compléter une mission proposée par une faction augmente l'influence de cette faction dans le système où elle est
donnée. C'est le levier le plus direct et le plus contrôlable : un joueur choisit explicitement quelle faction il
soutient à chaque mission acceptée. À l'inverse, certaines missions (massacre, assassinat) visent explicitement une
faction adverse et réduisent son influence lorsqu'elles sont complétées — un même passage en station permet donc
souvent de soutenir une faction et d'en affaiblir une autre simultanément. Pour la typologie complète du tableau de
missions, sa mécanique de génération et l'effet des états BGS (Boom, Famine, Guerre) sur son contenu, voir
[29-missions-reputation-et-rangs.md, §1](./29-missions-reputation-et-rangs.md#1-le-tableau-de-missions-de-vaisseau--typologie-et-fonctionnement).

### 5.2 Commerce et ventes en marché comme levier BGS

Vendre des marchandises dans une station appartenant à une faction contribue à son influence, l'effet étant amplifié
dans certains contextes :

- vendre des marchandises de forte valeur pendant un état **Boom** ;
- livrer des denrées alimentaires pendant une **Famine**, ou des médicaments pendant un **Outbreak** ;
- vendre des données d'exploration ou d'exobiologie à un comptoir universel rattaché à une faction (voir 5.4).

### 5.3 Combat, primes et Conflict Zones comme levier BGS

Le combat influe sur le BGS de plusieurs façons :

- la chasse aux primes (*bounty hunting*) contre des PNJ hostiles à une faction contribue modestement à son influence ;
- pendant un état **War**, **Civil War** ou pour un scénario de type Powerplay, la participation aux **Conflict
  Zones** (spatiales ou au sol) est le principal moyen de peser sur l'issue du conflit : la faction dont le camp
  remporte le plus de zones de conflit sur la période gagne en influence, jusqu'à emporter potentiellement le contrôle
  du système ;
- les missions d'assassinat ciblées affaiblissent directement l'influence de la faction visée, indépendamment de tout
  état de conflit actif.

### 5.4 Exploration et exobiologie comme levier BGS

Les données collectées en exploration (cartographie, scans FSS/DSS) et en exobiologie (échantillonnage d'espèces)
peuvent être vendues à un comptoir universel rattaché à une faction donnée plutôt qu'à un comptoir neutre, ce qui
contribue à son influence — un levier apprécié des explorateurs qui souhaitent tout de même peser sur le BGS sans
s'engager dans le commerce ou le combat.

### 5.5 Autres leviers BGS : contrebande, dons et sauvetage

- **Piraterie et contrebande** : le trafic de marchandises illicites via le marché noir contribue à l'influence de la
  faction propriétaire du marché noir concerné, généralement une faction en Anarchie.
- **Dons** (*donations*) : remettre des crédits à une faction via certaines interfaces de station contribue directement
  à son influence.
- **Sauvetage** (*search and rescue*) : la récupération d'objets de sauvetage (capsules, cargaisons perdues) livrée à
  une faction lui apporte de l'influence.

### 5.6 Jouer le BGS en groupe organisé

Un joueur isolé a un effet réel mais limité sur le BGS d'un système peuplé de plusieurs milliers d'habitants et visité
par de nombreux commandants. C'est pourquoi le BGS est en pratique surtout pratiqué par des **groupes dédiés** —
escadres, communautés Discord, alliances inter-groupes — qui coordonnent des campagnes ciblées :

- pousser une faction alliée vers le seuil d'expansion en concentrant missions et ventes en sa faveur ;
- défendre une faction en guerre en remplissant massivement les Conflict Zones qui la soutiennent ;
- provoquer le retrait forcé d'une faction hostile en cessant tout soutien à son égard et en accélérant sa chute sous
  le seuil bas ;
- faire progresser et défendre une PMF créée à la demande du groupe (voir 4.3).

Pour suivre ces campagnes, la communauté s'appuie largement sur des outils tiers dédiés — notamment le plugin
**BGS-Tally**, qui enregistre automatiquement les activités pertinentes du journal de jeu (missions, ventes, kills,
Conflict Zones) et peut publier des rapports d'activité BGS sur Discord, facilitant la coordination d'un groupe sur
plusieurs sessions et plusieurs joueurs.

### 5.7 Quantifier l'effort : plafonds par tick, efficacité comparée des leviers, et méthode de mesure avec BGS-Tally

Les sections précédentes indiquent quels leviers influent sur le BGS, mais restent volontairement muettes sur
l'ampleur de cet effet et sur le volume d'activité nécessaire pour obtenir un résultat donné. Cette section tente de
combler ce manque avec ce qui peut être établi de façon fiable, et indique explicitement les points sur lesquels une
donnée chiffrée précise et à jour n'a pas pu être vérifiée lors de la préparation de ce guide — auquel cas une méthode
de mesure directe est proposée à la place plutôt qu'un chiffre inventé.

#### 5.7.1 Ce qui est structurellement vérifiable sur l'effort BGS

Trois faits, contrairement aux seuils numériques exacts d'expansion/retrait déjà signalés en 3.2, reposent sur une
observation directe du comportement du jeu et de ses outils communautaires plutôt que sur une seule source volatile :

- **Le poids d'une mission dépend de son palier de récompense.** Le plugin **BGS-Tally** — l'outil de référence de la
  communauté pour instrumenter le BGS — ventile lui-même l'influence de mission en **cinq paliers de récompense
  distincts** (notés ➊ à ➎ dans son interface et ses rapports), chacun comptabilisé séparément. Cela confirme
  qu'une mission à récompense élevée ne pèse pas comme une mission à récompense minimale, même si le rapport de poids
  exact entre paliers n'est publié ni par Frontier Developments ni, à notre connaissance, par la documentation de
  l'outil lui-même.
- **L'effet d'un même volume d'activité est dilué par la population du système.** L'influence étant une part d'un
  total de 100 % réparti entre toutes les factions présentes (voir 2.2), un système peu peuplé à 3 factions bascule
  pour un volume d'activité qu'un hub très peuplé et très fréquenté absorbera presque sans effet visible sur le
  pourcentage. Deux systèmes comptant le même nombre de factions peuvent donc exiger des volumes d'activité très
  différents pour un même gain d'influence en points de pourcentage.
- **Un tick agrège une fenêtre de 24 h et non un flux continu.** Toute activité produite après l'agrégation du jour
  n'apparaît qu'au tick suivant (rappel de 1.2) : un groupe qui pousse fort le jour J ne voit jamais le résultat avant
  J+1, ce qui interdit tout ajustement fin en cours de journée — la seule granularité de pilotage possible est le jour
  de tick.

#### 5.7.2 Le plafond d'influence par tick : une observation communautaire répandue, non quantifiée officiellement

Une large partie de la communauté spécialisée en BGS rapporte, de façon récurrente depuis plusieurs années, qu'au-delà
d'un certain volume d'activité produit pour une même faction dans un même système sur un même tick, le gain
d'influence marginal supplémentaire s'effondre ou devient nul — un phénomène généralement désigné par l'expression
**« cap de tick »** (*tick cap*). L'existence du phénomène est largement corroborée par le retour d'expérience des
groupes BGS organisés ; en revanche, **aucune valeur numérique fiable et à jour n'a pu être confirmée lors de la
préparation de ce guide** : les recherches effectuées se sont heurtées aux mêmes obstacles d'accès que ceux déjà
rencontrés lors de la rédaction de 3.2, avec en plus le budget de recherche web de l'outil épuisé au moment de
chercher spécifiquement ce chiffre (détail complet dans les Sources, en fin de document). Toute valeur chiffrée de
plafond par tick trouvée ailleurs (anciens threads, vidéos, mémoire d'un joueur) doit donc être traitée comme
potentiellement obsolète, dépendante du système considéré, et recoupée empiriquement (méthode en 5.7.4) plutôt que
prise pour une constante universelle.

Conséquence pratique pour un groupe organisé : **répartir l'effort sur plusieurs jours de tick plutôt que de le
concentrer en une seule journée** est presque toujours plus efficace, précisément parce qu'un plafond de rendement par
tick — quelle qu'en soit la valeur exacte pour le système visé — rend improbable qu'un pic isolé d'activité se
convertisse linéairement en gain d'influence.

#### 5.7.3 Efficacité comparée des leviers BGS (INF par heure de jeu)

Un classement chiffré et universel de l'INF/heure par levier (missions courtes vs longues, trade en Boom/Famine vs
normal, Conflict Zones) n'a pas pu être établi à partir de sources vérifiables et à jour lors de la préparation de ce
guide : c'est précisément le type de donnée la plus volatile, la plus dépendante du contexte (état économique en
cours, distance entre station de départ et cible, classe de vaisseau, prix locaux du jour) et la moins documentée
officiellement — les tentatives de recherche dédiées ont échoué pour les mêmes raisons qu'en 5.7.2. Ce qui suit est
donc un **ordre de classement qualitatif**, construit à partir de faits déjà établis dans ce guide (sections 3.1 et
5.1-5.5), et non des chiffres d'INF/heure vérifiés :

| Levier | Facteur favorable | Facteur défavorable |
|---|---|---|
| Missions courtes et répétables (livraison locale, mini-massacre) | Cycle très court entre deux complétions ⇒ nombre de missions/heure élevé ; chaque complétion compte comme une unité d'influence indépendamment du temps de trajet | Poids d'influence par mission généralement plus faible (paliers bas ➊/➋) |
| Missions longues ou à forte récompense (livraison longue distance, haut risque) | Poids d'influence par mission plus élevé (paliers hauts ➍/➎) | Cycle beaucoup plus long ⇒ peu de complétions par heure ; effet total par heure de jeu incertain sans mesure directe |
| Trade en état **Famine** ou **Outbreak** | Marges et primes de vente très supérieures à la normale (3.1) ; effet de levier largement reconnu par la communauté BGS pour ce type d'état | Fenêtre temporaire (l'état finit par se résorber) ; nécessite souvent un aller-retour d'approvisionnement hors du système en état |
| Trade en état **Boom** | Influence et primes accrues pour les activités commerciales (3.1) ; achat et vente parfois possibles dans le même système en croissance | Effet de levier généralement moins spectaculaire que Famine/Outbreak en marge unitaire |
| Trade en conditions normales | Toujours disponible, aucune dépendance à un état particulier | Effet d'influence par unité vendue le plus faible des options de trade |
| Conflict Zones (War/Civil War) | Seul levier capable de faire basculer directement l'issue d'un conflit et donc le contrôle d'un système ; forte valeur symbolique pour un groupe coordonné | Ne s'applique qu'en présence d'un état de conflit actif ; temps par CZ variable selon l'intensité et la classe de vaisseau engagée |

**Pour obtenir un vrai chiffre d'INF/heure applicable à son propre cas**, la seule méthode fiable consiste à mesurer
directement, avec BGS-Tally (protocole en 5.7.4), le volume d'activité produit par heure de jeu pour un levier donné,
puis à recouper ce volume avec le gain d'influence en points de pourcentage effectivement constaté au tick suivant
pour la faction ciblée dans le système visé. Ce ratio (points d'influence gagnés ÷ heures investies) est spécifique à
chaque système, chaque faction et chaque période, et ne se généralise pas de façon fiable d'un cas à l'autre.

#### 5.7.4 Protocole de mesure et d'ajustement avec BGS-Tally

BGS-Tally (voir 5.6) est l'outil de référence pour transformer les principes qualitatifs ci-dessus en pilotage chiffré
d'une campagne. Protocole recommandé pour un groupe organisé :

1. **Avant de commencer**, noter l'influence exacte de la faction ciblée dans le système visé (panneau de la faction
   en jeu, ou via un outil communautaire de suivi des systèmes) juste avant un tick, pour disposer d'un point de
   départ fiable.
2. **Activer le suivi BGS-Tally** pour le système et la faction concernés : le plugin détecte automatiquement les
   événements pertinents du journal de jeu (missions par palier de récompense, ventes de marché par niveau de
   demande, marché noir, primes, Combat Bonds, Conflict Zones au sol et dans l'espace, données cartographiques,
   sauvetage — voir le détail en 5.1-5.5).
3. **Jouer une journée de tick normale** en laissant BGS-Tally agréger, pour chaque commandant du groupe, le volume
   d'activité produit ; l'outil génère un rapport prêt à publier sur Discord.
4. **Relever l'influence après le tick suivant** et calculer la variation en points de pourcentage.
5. **Calculer le ratio local** : variation d'influence (en points) ÷ volume d'activité produit (missions complétées
   par palier, chiffre d'affaires de trade, primes, Conflict Zones gagnées). Ce ratio constitue l'étalonnage réel et
   local du système visé — il remplace avantageusement toute estimation générique trouvée en ligne.
6. **Répéter sur plusieurs ticks consécutifs** avant de tirer une conclusion : un seul tick peut être bruité par
   l'activité d'autres commandants non coordonnés avec le groupe (positive ou négative pour la faction visée), par un
   plafond de tick (5.7.2), ou par un changement d'état économique en cours de période.
7. **Ajuster le volume quotidien** à la hausse ou à la baisse selon l'écart entre le ratio mesuré et l'objectif du
   groupe (voir l'exemple méthodologique en 5.7.5), et republier le rapport BGS-Tally à jour pour que le reste du
   groupe recalibre son propre effort en conséquence.

Ce protocole a un avantage supplémentaire pour un groupe nombreux : en centralisant les rapports d'activité
individuels dans un canal Discord commun via BGS-Tally, il évite qu'une faction reçoive un volume d'activité largement
supérieur à ce qu'un éventuel plafond de tick (5.7.2) peut convertir en influence réelle — un effort mal coordonné
au-delà de ce plafond est, pour l'objectif BGS visé, du temps de jeu gaspillé, même s'il reste par ailleurs rentable
en crédits ou en équipement.

#### 5.7.5 Exemple méthodologique chiffré d'une campagne BGS (illustratif)

L'exemple suivant illustre la **méthode de calcul** à appliquer une fois le ratio local mesuré (étape 5 du protocole
ci-dessus). Les chiffres d'activité et de ratio utilisés ici sont des **valeurs d'illustration choisies pour la
démonstration**, et non une donnée vérifiée universelle : ils doivent être remplacés par le ratio réellement mesuré
pour le système et la faction concernés avant toute planification réelle.

> Un groupe souhaite faire passer sa PMF de **25 % à 35 %** d'influence (le seuil d'expansion indicatif, section 3.2)
> dans un système donné, en **10 jours de tick**.
>
> - Gain total nécessaire : 35 − 25 = **10 points d'influence**, soit en moyenne **1 point par jour de tick**.
> - Supposons que le groupe ait mesuré, lors d'un tick de calibrage précédent dans ce système précis (étape 5 du
>   protocole), un ratio local d'environ **0,2 point d'influence pour 10 missions de palier bas/moyen** complétées au
>   nom de la faction (ratio fictif, fourni uniquement à titre d'exemple de calcul).
> - Pour produire 1 point par jour avec ce ratio, il faudrait alors environ **50 missions complétées par jour de
>   tick** au nom de la faction.
> - Si un commandant isolé complète en moyenne 8 à 12 missions de ce type par session de jeu (ordre de grandeur
>   usuel pour une rotation courte, non vérifié pour ce guide), il faudrait environ **4 à 6 commandants actifs
>   quotidiennement** sur la durée de la campagne pour tenir l'objectif — ou un nombre moindre de commandants en
>   combinant missions et trade en état Boom/Famine si un tel état est disponible dans le système.
>
> Ce calcul ne devient fiable pour une vraie campagne qu'une fois le ratio (ici 0,2 point pour 10 missions) remplacé
> par la valeur réellement observée via BGS-Tally sur le système visé, sur plusieurs ticks consécutifs, comme décrit
> en 5.7.4.

## 6. Articulation du BGS avec les autres systèmes de jeu

Le BGS n'est pas un système isolé : trois autres mécaniques majeures d'*Elite Dangerous* interagissent avec lui sans
pour autant être calculées par le même moteur.

### 6.1 BGS et Powerplay : deux couches distinctes sur un même système

**Powerplay** est un système parallèle géré au niveau des **Powers** — des figures politiques qui se situent
au-dessus des factions mineures — et non au niveau du BGS lui-même. Depuis la refonte **Powerplay 2.0**, sortie le
**31 octobre 2024** dans le cadre de l'extension **Ascendancy**, une Power exerce sur les systèmes qu'elle contrôle une
influence de fond distincte (fortification, exploitation, contestation) qui peut moduler les conditions économiques
locales parallèlement aux états BGS classiques. Concrètement, un système peut se trouver simultanément :

- contrôlé BGS par une faction mineure donnée (allégeance, taxes, accès marché noir) ;
- affilié à une Power dans le cadre de Powerplay (bonus/malus liés à cette Power, mérites à gagner).

Ces deux couches coexistent et s'influencent parfois indirectement (l'activité de Powerplay dans un système alimente
également, en creux, l'activité générale qui nourrit le BGS local), mais elles ne sont pas gouvernées par le même
calcul. Le fonctionnement complet de Powerplay, le détail des Powers actuelles et leur méthode de jeu sont couverts
dans le guide dédié (voir [Politique et Powerplay](./02-powerplay.md)).

### 6.2 BGS et Colonisation de systèmes

La **Colonisation** de systèmes — passée en bêta le **26 février 2025** avec la mise à jour gratuite **Trailblazers**,
puis sortie complète le **11 novembre 2025** avec la mise à jour **Dodec Update** (version 4.2.2.0) — permet à un
joueur de revendiquer un système jusque-là inhabité, en dehors du cycle BGS classique : tant qu'un système est en
cours de colonisation par un seul commandant, il n'héberge encore aucune faction mineure et n'est donc pas soumis au
BGS. Une fois le système suffisamment développé et peuplé, il finit par générer ses propres factions mineures, qui
entrent alors dans le cycle normal d'influence, d'expansion et d'états du BGS décrit dans ce guide. La Colonisation
constitue ainsi un point d'entrée complémentaire et piloté par le joueur dans la carte politique du BGS, distinct de
l'expansion organique d'une faction déjà existante. Le détail de la mécanique de revendication, de construction et de
progression économique est couvert dans le guide dédié (voir [Colonisation](./18-colonisation.md)).

### 6.3 BGS et Community Goals (CG)

Les **Community Goals** (CG) sont des objectifs galactiques ponctuels, généralement sponsorisés par une faction ou une
entité précise, auxquels l'ensemble de la communauté peut contribuer sur une période limitée. Leur réussite ou leur
échec peut injecter un gain ou une perte d'influence massif et immédiat pour la faction sponsor — voire déclencher
directement un état spécial (Boom, expansion accélérée) — en plus et indépendamment du calcul BGS organique quotidien
décrit dans ce guide. Les CG constituent ainsi un levier « macro » que Frontier Developments utilise ponctuellement
pour accélérer des évolutions de lore ou de territoire que le BGS seul mettrait beaucoup plus longtemps à produire. Le
fonctionnement générique des Community Goals, leur historique et la manière de les repérer sont couverts dans le guide
dédié (voir [Community Goals](./24-community-goals.md)).

## Voir aussi

- [Politique et Powerplay dans Elite Dangerous](./02-powerplay.md) — fonctionnement complet de Powerplay, la couche de
  méta-jeu politique qui coexiste avec le BGS sans être calculée par le même moteur (voir la section 6.1 ci-dessus).
- [Colonisation](./18-colonisation.md) — mécanique de revendication et de construction de systèmes, point d'entrée
  piloté par le joueur qui finit par générer de nouvelles factions mineures soumises au BGS (voir la section 6.2).
- [Community Goals](./24-community-goals.md) — objectifs galactiques ponctuels dont l'issue peut injecter un gain ou
  une perte d'influence massif pour une faction, en plus du calcul BGS organique quotidien (voir la section 6.3).
- [Commerce](./11-commerce.md) — marchandises, marchés et routes rentables, matière première du levier « ventes en
  marché » décrit en 5.2.
- [Combat spatial](./08-combat-spatial.md) — primes, Conflict Zones et builds de combat, matière première du levier
  « combat » décrit en 5.3.
- [Escadrons de joueurs](./22-squadrons.md) — outil de jeu pour structurer le groupe organisé qui mène une campagne
  BGS (voir la section 5.6).

## Sources

- https://en.wikipedia.org/wiki/Elite_Dangerous — consulté directement lors de la préparation de ce guide ; confirme
  notamment les dates de la Colonisation (bêta le 26 février 2025, sortie complète le 11 novembre 2025) et l'ajout de
  Powerplay avec la mise à jour 1.3 (juin 2015), mais ne détaille pas les mécaniques internes du BGS ni les dates de
  Powerplay 2.0/Ascendancy.
- https://fr.wikipedia.org/wiki/Elite_Dangerous — consulté directement, confirmation générale du contexte du jeu.
- [Chronologie canonique du corpus](./00-chronologie-canonique.md) — document interne de réconciliation factuelle
  déjà établi pour cette base de connaissances, qui fait foi pour les dates citées en section 6 : Powerplay 2.0 sorti
  le 31 octobre 2024 dans le cadre de l'extension *Ascendancy* (sourcé via les billets officiels Frontier
  Developments relayés sur Steam News, dont « Ascendancy | Available Now! » et le suivi « Ascendancy Update 1» du 21
  novembre 2024), et Colonisation passée en bêta le 26 février 2025 via la mise à jour *Trailblazers* puis sortie
  complète le 11 novembre 2025 via le *Dodec Update* v4.2.2.0 (sourcé via les pages officielles
  elitedangerous.com/news/updates/4-1-0-0 et /update-notes/4-2-2-0).
- Connaissances communautaires stables et largement corroborées sur le fonctionnement général du BGS (factions
  mineures, influence en pourcentage, états économiques et de conflit, tick quotidien), mécanique globalement
  inchangée depuis son introduction en 2015. Frontier Developments n'a jamais publié de documentation officielle
  détaillant les seuils numériques exacts d'expansion et de retrait, ni la formule complète de calcul de l'influence,
  ni un horaire garanti pour le tick quotidien : ces éléments résultent d'un travail collectif de rétro-ingénierie
  communautaire (notamment via des outils comme BGS-Tally) et sont présentés dans ce guide comme des estimations
  explicitement non officielles, à recouper avec une source communautaire à jour avant toute planification précise.
- Tentatives de consultation infructueuses lors de la préparation de ce guide (à ne pas citer comme sources
  positives) : https://elite-dangerous.fandom.com/wiki/Background_Simulation (HTTP 402),
  https://elite-dangerous.fandom.com/wiki/Minor_Faction (HTTP 402), https://inara.cz/elite/bgs/ (HTTP 410 Gone),
  page wiki communautaire r/EliteDangerous sur le BGS (accès refusé par l'outil de récupération), archive.org (accès
  refusé par l'outil de récupération), https://elitebgs.app/ (contenu insuffisant récupéré), moteurs de recherche
  Bing/DuckDuckGo (résultats hors sujet ou bloqués par un CAPTCHA lors des tentatives de vérification complémentaire
  des seuils numériques de la section 3.2 et de l'horaire du tick). Lors de l'ajout de la section 5.7 (plafonds
  d'influence par tick, efficacité INF/heure des leviers) : quota de recherche web de la session épuisé avant d'avoir
  pu interroger des sources supplémentaires sur ces deux points précis ; domaine reddit.com (y compris
  old.reddit.com et les wikis communautaires r/EliteDangerous et r/EliteBGS) bloqué par l'outil de récupération ;
  forums.frontier.co.uk retourne HTTP 403 ; web.archive.org de nouveau inaccessible depuis l'outil ;
  https://elite-dangerous.fandom.com/wiki/Background_Simulation retourne toujours HTTP 402 ;
  https://raw.githubusercontent.com/aussig/BGS-Tally/main/README.md retourne HTTP 404 ; https://www.edsm.net/en/faction
  consulté avec succès mais ne contient aucune donnée de mécanique BGS pertinente (simple base de factions).
- https://github.com/aussig/BGS-Tally et son wiki (notamment la page « Usage – BGS and TW Tracking »,
  https://github.com/aussig/BGS-Tally/wiki/Usage-%E2%80%93-BGS-and-TW-Tracking) — consultés avec succès lors de la
  préparation de la section 5.7 ; confirment que le plugin ventile l'influence de mission en cinq paliers de
  récompense distincts (➊ à ➎) et liste l'ensemble des activités suivies (missions, achats/ventes de trade par
  niveau de demande, marché noir, primes, Combat Bonds, Conflict Zones au sol et dans l'espace, données
  cartographiques, sauvetage). Ces pages ne documentent en revanche aucun seuil numérique de plafond d'influence par
  tick ni de formule d'efficacité INF/heure — d'où le classement qualitatif et le protocole de mesure proposés en
  5.7 plutôt que des chiffres inventés.
