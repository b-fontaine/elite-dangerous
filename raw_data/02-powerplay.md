---
id: 02-powerplay
titre: "Politique et Powerplay dans Elite Dangerous"
domaine: politique
entites: [Powerplay, Powerplay 2.0, Mérites, Éthos, Undermining, Bastion (Stronghold), Jerome Archer, Nakato Kaine, Ascendancy, Concord Cannon, Fédération, Empire d'Achenar]
mots_cles_en: [powerplay, merits, pledge, undermining, reinforcement, acquisition, stronghold, fortified, exploited, ethos, control points]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-09
confiance_globale: haute
volatilite: haute
sources_primaires: [Steam News Frontier, inara.cz, forums.frontier.co.uk, elite-dangerous.fandom.com, edpowerplay.com]
zones_incertaines: ["taux exacts de conversion des mérites en points de contrôle, révisés à chaque rééquilibrage", "barème de rang exhaustif jamais publié par Frontier : le tableau des rangs 6 à 99 est une extrapolation", "éthos de Zemina Torval issu d'une source secondaire, fiche inara.cz en erreur HTTP 503 le 9 septembre 2026", "existence d'un seuil de développement avant qu'un système colonisé devienne éligible à l'Acquisition Powerplay", "l'allégeance choisie à la fondation d'un système colonisé restreint-elle les Powers pouvant le revendiquer", "durée exacte du délai de latence (cooldown) avant réengagement après avoir quitté un Power", "un module Powerplay déjà débloqué reste-t-il utilisable après avoir quitté le Power concerné"]
guides_lies: [0, 1, 16, 18, 19, 21, 22, 24]
---
# Politique et Powerplay dans Elite Dangerous

## En bref

Powerplay est la couche de méta-jeu territorial d'*Elite Dangerous* : douze Powers — deux fédéraux, quatre impériaux,
deux de l'Alliance, quatre indépendants — se disputent le contrôle territorial des systèmes. Lancé en juin 2015 avec la
mise à jour 1.3, il a été entièrement refondu le 31 octobre 2024 par la mise à jour *Ascendancy*
(« Powerplay 2.0 ») : les mérites (merits) gagnés en s'engageant (pledge) auprès d'un Power sont désormais permanents
et non décroissants, et presque toute activité du jeu en rapporte. Trois axes structurent le jeu territorial :
Acquisition, Renforcement (reinforcement) et Undermining. Le score de contrôle d'un système détermine son état —
Exploité (exploited, 0 à 350 000 points), Fortifié (fortified, 350 000 à 1 000 000, bulle de 20 années-lumière) ou
Bastion (stronghold, au-delà d'un million, bulle de 30 années-lumière) — et les bascules sont appliquées au tick
hebdomadaire du jeudi à 07:00 UTC. Les rangs vont de 1 à 100 (environ 775 000 mérites cumulés) et débloquent douze
modules exclusifs communs à tous les Powers, dont les Prismatic Shields et le Concord Cannon.

## Introduction — le méta-jeu politique d'Elite Dangerous

Depuis son lancement en 2014, *Elite Dangerous* propose non seulement une simulation spatiale de vol, de combat et de
commerce, mais aussi une toile de fond politique dense : trois superpuissances humaines rivales, des milliers de
systèmes indépendants, et depuis 2015 une couche de méta-jeu appelée **Powerplay**, qui permet aux commandants de peser
directement sur le contrôle territorial de la galaxie en s'engageant auprès de figures politiques charismatiques (les «
Powers »). Ce guide présente le contexte politique galactique, explique en détail le fonctionnement de Powerplay — de
son lancement en 2015 jusqu'à la refonte majeure « Powerplay 2.0 » d'octobre 2024 et ses ajustements les plus récents
(2025-2026) —, dresse le portrait des douze Powers actuels, et propose une méthode pratique pour y jouer efficacement
aujourd'hui.

## 1. Le paysage politique galactique d'Elite Dangerous

L'univers d'*Elite Dangerous* se situe au-delà de l'an 3300. Il est structuré autour de trois superpuissances humaines
et d'une multitude de systèmes n'ayant prêté allégeance à aucune d'entre elles.

### 1.1 La Fédération (Federation) — superpuissance démocratique, 3730 systèmes

La Fédération est une démocratie représentative, la plus ancienne et la plus peuplée des trois superpuissances. Elle a
été fondée dans la foulée de la Troisième Guerre mondiale (2044-2055) et a établi sa capitale à Olympus Village, sur
Mars. Elle se perçoit comme le centre naturel de l'humanité, Sol étant le berceau de l'espèce, et met en avant des
valeurs de démocratie, de liberté d'expression et de niveau de vie élevé.

D'après les statistiques in-universe de janvier 3308 (données fictionnelles du jeu), la Fédération compte environ **1,9
trillion d'habitants** répartis sur **3730 systèmes**.

Figures politiques actuelles liées à Powerplay :

- **Felicia Winters** — Présidente fédérale en exercice.
- **Jerome Archer** — Président fantôme fédéral et chef de l'opposition républicaine ; il a hérité de la base de soutien
  de Zachary Hudson.
- **Zachary Hudson** — ancien président et figure historique de Powerplay 1.0 (base de soutien répartie sur toute la
  Fédération et de nombreux systèmes indépendants) ; il s'est retiré du jeu politique et de Powerplay le 31 octobre
  3310, jour du lancement de Powerplay 2.0.

### 1.2 L'Empire d'Achenar — monarchie héréditaire, 4239 systèmes

L'Empire est une monarchie héréditaire fondée par Marlin Duval, organisée selon un système de clientélisme directement
inspiré de la Rome antique. La société impériale est strictement stratifiée par l'argent, le patronage et l'influence ;
elle valorise le statut et l'honneur, et a eu historiquement recours à l'esclavage, au travail forcé et au clonage.

Toujours selon les statistiques in-universe de 3308, l'Empire rassemble environ **1,65 trillion d'habitants** sur **4239
systèmes** — ce qui en fait la superpuissance comptant le plus grand nombre de systèmes.

Une crise de succession a récemment opposé Arissa Lavigny-Duval et Aisling Duval pour la couronne impériale ; le Sénat a
tranché en faveur d'Arissa Lavigny-Duval, déclarée Empereur en octobre 3301. Les quatre Powers impériaux actuels
reflètent cette hiérarchie sénatoriale :

- **Denton Patreus** — sénateur d'Eotienses, commandant militaire et Amiral de la Flotte.
- **Zemina Torval** — sénatrice de Synteini.
- **Aisling Duval** — prétendante malheureuse au trône, restée une figure politique influente.
- **Arissa Lavigny-Duval** — l'Empereur elle-même.

### 1.3 L'Alliance des systèmes indépendants (Alliance of Independent Systems) — 1199 systèmes

L'Alliance est une démocratie parlementaire décentralisée, association volontaire de systèmes qui rejette à la fois la
hiérarchie rigide de l'Empire et le capitalisme fédéral extrême, au profit de la prospérité mutuelle de ses membres. Son
assemblée parlementaire siège à Alioth.

Avec environ **557 milliards d'habitants** pour **1199 systèmes**, l'Alliance est structurellement la plus petite des
trois superpuissances et aussi la plus fragile, ses nombreux systèmes membres peinant souvent à s'accorder.

- **Edmund Mahon**, Premier ministre, dirige l'exécutif de l'Alliance.
- **Nakato Kaine**, conseillère de l'Alliance, s'est présentée sans succès contre lui à l'élection de 3307, avant de
  devenir elle-même un Power actif lors du lancement de Powerplay 2.0 en octobre 3310, où elle a rallié de nombreux
  partisans.

### 1.4 Les systèmes indépendants et leurs quatre Powers

En dehors des trois superpuissances existent d'innombrables systèmes indépendants, y compris des enclaves situées
géographiquement à l'intérieur des frontières fédérales ou impériales mais qui conservent leur souveraineté et leurs
propres lois : enclaves religieuses, mondes communistes, systèmes corporatistes, etc. Les quatre Powers « Indépendants »
actuels incarnent chacun une facette différente de ce pan du jeu :

- **Li Yong-Rui** — PDG de la Sirius Corporation, poids économique et technologique majeur.
- **Archon Delaine** — chef du Kumo Crew, réseau criminel et pirate.
- **Pranav Antal** — à la tête du mouvement Utopia, orientation scientifique et idéaliste.
- **Yuri Grom** — ancien chef de la milice EG Pilots, vainqueur des « Dangerous Games » de 3302, territoire centré sur
  la région de Clan Grom / Achilles' Altar.

### 1.5 Comparatif des trois superpuissances d'Elite Dangerous

| Superpuissance   | Type de gouvernement                   | Capitale               | Population (in-universe, 3308) | Nombre de systèmes | Powers actuels                                                     |
|------------------|----------------------------------------|------------------------|--------------------------------|--------------------|--------------------------------------------------------------------|
| Fédération       | Démocratie représentative              | Olympus Village (Mars) | ~1,9 trillion                  | 3730               | Felicia Winters, Jerome Archer                                     |
| Empire d'Achenar | Monarchie héréditaire / clientélisme   | (siège impérial)       | ~1,65 trillion                 | 4239               | Denton Patreus, Zemina Torval, Aisling Duval, Arissa Lavigny-Duval |
| Alliance         | Démocratie parlementaire décentralisée | Alioth                 | ~557 milliards                 | 1199               | Edmund Mahon, Nakato Kaine                                         |
| Indépendants     | (variable selon le système)            | —                      | —                              | —                  | Li Yong-Rui, Archon Delaine, Pranav Antal, Yuri Grom               |

## 2. Qu'est-ce que Powerplay ?

Powerplay est la couche de méta-jeu galactique persistante d' *Elite Dangerous* : une guerre froide (et parfois chaude)
pour le contrôle territorial, menée entre des **Powers** — des puissances ou leaders charismatiques — chacun affilié
idéologiquement à la Fédération, à l'Empire, à l'Alliance ou aux Indépendants, mais agissant de façon largement autonome
vis-à-vis de sa superpuissance de tutelle.

Les commandants (les joueurs) se **« pledgent »** (s'engagent) volontairement auprès d'un Power de leur choix, puis
accomplissent des activités qui font progresser — ou au contraire reculer — le contrôle territorial de celui-ci, en
échange de récompenses économiques, de modules exclusifs et de rangs de prestige.

Le système a été lancé en **juin 2015** avec la mise à jour **1.3**, puis a connu une refonte quasi-totale le **31
octobre 2024** (« Powerplay 2.0 », dans le cadre de la mise à jour *Ascendancy*), après près d'une décennie de critiques
communautaires. On distingue donc deux grandes ères :

- **Powerplay 1.0** (juin 2015 – octobre 2024)
- **Powerplay 2.0** (depuis le 31 octobre 2024), avec des ajustements continus depuis, dont un rééquilibrage majeur en
  2025 nommé *Trailblazers Update 3.4*.

## 3. Historique de Powerplay : de 2015 à la refonte 2.0

### 3.1 Le lancement de Powerplay et ses débuts (2015-2018)

Powerplay a été introduit en juin 2015 avec la mise à jour 1.3, avec un premier groupe de Powers répartis entre
Fédération, Empire, Alliance et Indépendants. Le système ajoutait une strate de stratégie territoriale à grande échelle,
organisée en un cycle hebdomadaire à trois phases : **Préparation → Expansion → Fortification**, alimenté par une
monnaie appelée « Command Capital » (CC), générée par les systèmes contrôlés pour financer l'expansion.

Dès 2016, Frontier publiait un bilan officiel (« Powerplay Annual Summary ») après un an d'existence du système — signe
de son importance dans la feuille de route du jeu, mais aussi des ajustements réguliers déjà nécessaires. Le roster
s'est ensuite étoffé au fil des années : Arissa Lavigny-Duval a rejoint les Powers après la résolution de la crise de
succession impériale (vers 2017), portant le total à dix.

Vers 2018, dans le cadre du chapitre *Beyond*, **Yuri Grom** a rejoint à son tour les rangs des Powers après avoir mené
sa milice (les EG Pilots) à la victoire lors des « Dangerous Games » de 3302 — épisode fictionnel qui a porté le nombre
de Powers à onze, chiffre resté stable jusqu'à la refonte 2.0. Particularité notable : contrairement aux Powers
d'origine, qui disposent chacun d'un « Powerplay Group » officiel, Grom s'appuie sur un groupe de joueurs communautaire
baptisé « The Eyes of Leshak ».

### 3.2 Powerplay 1.0 : une décennie de critiques (2016-2024)

Pendant près de dix ans, la communauté a très largement jugé Powerplay 1.0 mal conçu, et ce jugement a peu varié dans le
temps. Les griefs les plus récurrents étaient :

- des mécaniques de conquête jugées répétitives et fastidieuses (« grindy ») ;
- une absence quasi totale de retour visuel ou immersif sur les actions entreprises, réduites à des chiffres et
  statistiques abstraites ;
- une terminologie confuse pour les nouveaux joueurs ;
- une déconnexion presque complète entre les activités Powerplay et le reste du gameplay, obligeant à des sessions
  dédiées, isolées du reste de l'expérience ;
- une **décroissance des mérites** dans le temps, qui pénalisait les joueurs occasionnels et rendait toute progression
  non permanente.

Résultat : Powerplay est resté une activité de niche, pratiquée surtout pour ses bonus économiques passifs, boudée par
la majorité des joueurs.

### 3.3 Le contexte de mai 2024 : la controverse « pay-to-win » du Python Mk II

Juste avant la refonte, en mai 2024, Frontier a déclenché un important « review bombing » sur Steam (la note globale du
jeu est tombée dans la catégorie « Mixed », autour de 66 %) en annonçant la vente du vaisseau Python Mk II contre de
l'**ARX** ([glossaire](./00-glossaire.md), monnaie payante) en accès anticipé exclusif. Cette décision a été perçue par une partie de la communauté comme
une trahison d'un engagement pris en 2019, selon lequel l'ARX resterait strictement cosmétique. Bien que distincte de
Powerplay au sens strict, cette controverse a nourri la défiance de la communauté à l'approche de la sortie de Powerplay
2.0, expliquant en partie le scepticisme initial des joueurs face à cette refonte.

### 3.4 Le lancement de Powerplay 2.0 (31 octobre 2024)

Le **31 octobre 2024**, la mise à jour **« Ascendancy »** a introduit une refonte quasi complète de Powerplay,
accompagnée de plusieurs autres nouveautés : le vaisseau d'exploration **Mandalay** (Zorgon Peterson) avec un accès
anticipé via l'ARX, des « care packages » de récompenses, un classement hebdomadaire compétitif (leaderboard), et une
carte galactique enrichie. Ce même jour, Zachary Hudson s'est retiré de Powerplay tandis que **Jerome Archer** et
**Nakato Kaine** rejoignaient les rangs des Powers actifs, portant le total à douze. Cette mise à jour a globalement été
perçue comme un succès, restaurant une bonne partie de la confiance de la communauté après les tensions du printemps
2024.

> **Précision et sourçage officiel de la date (résolution d'une incohérence du corpus).** Cette date du 31 octobre 2024
> est reconstituée à partir de plusieurs communiqués officiels de Frontier Developments diffusés sur le canal Steam
> news du jeu — canal qui reprend verbatim le contenu publié sur elitedangerous.com/GalNet — retraçant les étapes
> suivantes : une annonce initiale visant le 29 octobre 2024, un report à « la semaine du 28 octobre », une
> reprogrammation définitive au « jeudi 31 octobre » (maintenance à partir de 06:00 GMT, serveurs de nouveau en ligne
> vers 15:00 GMT), puis un message « Available Now! » confirmant la mise en ligne effective ce jour-là, avec la mention
> « Featuring the all-new Powerplay 2.0 rework ». Un billet de suivi publié le 21 novembre 2024 (« Ascendancy Update 1
> ») confirme que « Powerplay 2.0 has been out for a few weeks now », ce qui recoupe bien un lancement fin octobre
> 2024.
>
> Certains guides du corpus (voir [Lore](./01-lore.md), section 1.8) citent par erreur le **26 février 2025** pour la
> mise à jour Ascendancy/Powerplay 2.0. Cette date réelle correspond en fait au lancement, ce jour-là, d'une mise à
> jour **distincte** : **« Elite Dangerous: Trailblazers »**, qui a introduit la mécanique de **Colonisation de
> systèmes** (voir [Colonisation](./18-colonisation.md) et la section 5.8 ci-dessous) — sortie près de quatre mois
> après Ascendancy. La confusion vient vraisemblablement du fait que les deux mises à jour ont chacune constitué un
> tournant majeur pour le jeu, à quelques mois d'écart. La date de référence pour Ascendancy/Powerplay 2.0 dans ce
> guide, et à retenir pour le reste du corpus, est donc bien le **31 octobre 2024**.
>
> Limite méthodologique : l'accès direct à elitedangerous.com/update-notes et aux forums Frontier
> (forums.frontier.co.uk) a systématiquement renvoyé une erreur HTTP 403 lors de cette vérification (blocage anti-bot),
> empêchant une citation littérale de la page officielle. La reconstitution s'appuie donc sur les communiqués Frontier
> repris sur le canal Steam news du jeu, mutuellement cohérents et convergents (annonce, report, reprogrammation,
> confirmation de sortie, suivi un mois après).

## 4. Powerplay 2.0 : les changements fondamentaux

Powerplay 2.0 répondait directement aux deux griefs les plus cités contre la version 1.0 : la déconnexion vis-à-vis du
reste du jeu, et la décroissance des mérites.

- **Réinitialisation générale** — tous les commandants engagés dans Powerplay 1.0 ont été désengagés (« unpledged ») au
  lancement de la 2.0 : chacun repart de zéro et choisit (ou re-choisit) un nouveau Power.
- **Mérites permanents et non-décroissants** — contrairement à la version 1.0, les mérites gagnés ne se dégradent plus
  jamais avec le temps : la progression individuelle est cumulative et définitive. Seul le contrôle territorial
  collectif d'un système peut, lui, régresser (voir section 5).
- **Intégration au gameplay normal** — quasiment toute activité du jeu (combat, chasse de primes, commerce, minage,
  exploration, missions Odyssey à pied, sauvetage, piraterie, etc.) peut désormais rapporter des mérites Powerplay selon
  le système et l'activité concernés, alors qu'en 1.0 il fallait mener des activités dédiées et largement déconnectées
  du reste du jeu. C'est le changement le plus structurant : Powerplay devient une couche méta appliquée à l'ensemble du
  jeu, plutôt qu'un mini-jeu à part entière.
- **Modules non-exclusifs** — les modules spécifiques à Powerplay (armes, boucliers, etc.) ne sont plus réservés à un
  seul Power ; tout commandant, quel que soit son Power, peut à terme débloquer l'intégralité des modules (dont le
  nouveau Concord Cannon) en progressant dans les rangs.
- **Deux nouveaux Powers** — Jerome Archer (Fédération) et Nakato Kaine (Alliance) ont rejoint les rangs actifs le jour
  même du lancement, tandis que Zachary Hudson se retirait. Le nombre total de Powers reste fixé à **12**.
- **Contrôle territorial hebdomadaire dynamique** — chaque activité entreprise dans un système contribue à son « score
  de contrôle » ; les bascules de territoire (changement de Power contrôlant un système, changement d'état) surviennent
  au moment du tick de cycle hebdomadaire, le **jeudi à 07:00 UTC**.
- **Salaire hebdomadaire basé sur la performance relative** — les commandants reçoivent un paiement calculé selon leur
  classement relatif au sein de leur Power, allant de 500 000 Cr. pour l'ensemble de la base de joueurs jusqu'à environ
  1 milliard de Cr. pour le top 1 %. *(Valeurs instantanées au 9 septembre 2026, sujettes à ajustement lors des
  rééquilibrages — voir 5.7.)*

## 5. Mécaniques détaillées de Powerplay 2.0

### 5.1 Les trois axes d'activité territoriale : Acquisition, Renforcement, Undermining

- **Renforcement (Reinforcement)** — agir dans des systèmes déjà contrôlés par son propre Power afin de les consolider
  et de les faire progresser en état.
- **Acquisition / Expansion** — conquérir des systèmes inoccupés (non contrôlés par un Power), situés à proximité (20 à
  30 années-lumière) des bastions (« strongholds ») alliés déjà établis. Lorsque deux Powers dépassent chacun 30 % de
  progression sur un même système inoccupé, celui-ci devient **« contesté »** : s'ouvre alors une course jusqu'au cycle
  suivant pour déterminer lequel l'emportera.
- **Undermining (déstabilisation)** — agir contre des systèmes tenus par un Power ennemi ou rival, afin d'en faire
  baisser le score de contrôle, avec pour objectif ultime de le faire basculer sous son propre contrôle ou de le faire
  régresser d'état.

### 5.2 Conversion des mérites en points de contrôle

Les mérites individuels gagnés par les joueurs alimentent un score de contrôle collectif par système : chaque activité
menée dans un système donné contribue à ce score, selon un taux de conversion propre à l'activité (le détail précis de
ces taux a fait l'objet d'ajustements répétés au fil des mises à jour d'équilibrage — voir 5.7 — et il est recommandé de
vérifier les valeurs courantes via les outils communautaires cités en section 7.3 plutôt que de se fier à un chiffre
figé). Ce qui est stable, en revanche, ce sont les seuils de points de contrôle définissant les états d'un système,
détaillés ci-dessous.

### 5.3 États des systèmes Powerplay : Exploité, Fortifié, Bastion (paliers de contrôle)

| État                     | Seuil de points de contrôle | Effet                                                                                                                                                                                                                   |
|--------------------------|-----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Exploité (Exploited)** | 0 à 350 000                 | Niveau d'entrée, notamment pour les systèmes nouvellement acquis.                                                                                                                                                       |
| **Fortifié (Fortified)** | 350 000 à 1 000 000         | Le système projette une bulle de soutien logistique d'environ 20 années-lumière de rayon (accès facilité, bonus étendus aux systèmes voisins).                                                                          |
| **Bastion (Stronghold)** | > 1 000 000                 | Bulle de soutien étendue à 30 années-lumière ; seul ce palier permet l'apparition de « Stronghold Carriers » (porte-vaisseaux dédiés, jouant un rôle logistique comparable au Jameson Memorial pour le Power concerné — voir [Fleet Carriers](./19-fleet-carriers.md) pour le fonctionnement général des porte-vaisseaux). |

Les changements d'état et de territoire ne sont appliqués qu'au moment du cycle hebdomadaire.

### 5.4 Fortification contre undermining : la dynamique hebdomadaire

Chaque semaine, deux scores opposés s'accumulent en parallèle sur un système contrôlé : le score de renforcement
(apporté par le Power en place et ses soutiens) et le score de déstabilisation/undermining (apporté par les Powers
rivaux). Si l'undermining l'emporte largement, le système peut perdre des points de contrôle, régresser d'état, voire
basculer entièrement sous le contrôle d'un Power adverse lors du tick hebdomadaire.

### 5.5 Rangs Powerplay (1 à 100) et récompenses

- **Rangs de 1 à 100** — le rang 1 est atteint après 5 missions initiales (0 mérite requis) ; les paliers 2 à 5
  nécessitent une progression croissante jusqu'à 15 000 mérites ; du rang 6 à 99, chaque rang requiert environ 8 000
  mérites supplémentaires ; le rang 100 nécessite environ **775 000 mérites** cumulés.
- **Récompenses de rang** — « mini-packages » (250 000 Cr. + matériaux d'ingénierie vaisseau et à pied) obtenus à
  intervalles réguliers ; avantages économiques permanents propres à chaque Power (bonus de profit, réduction de coûts
  d'armement, etc. — voir section 6) ; déblocage progressif des modules exclusifs, généralement complet à partir du
  rang ~97.

#### Tableau de progression des rangs Powerplay (mérites cumulés, estimation par palier)

Frontier n'a jamais publié de barème officiel exhaustif rang par rang. Le tableau ci-dessous combine les rares points de
mesure documentés (rang 2, rang 100) avec une extrapolation linéaire au taux moyen de ~8 000 mérites/rang décrit
ci-dessus pour les rangs 6 à 99 — à traiter comme une **estimation indicative**, pas comme un barème exact :

| Rang    | Mérites cumulés requis (estimation) | Remarque                                                                                   |
|---------|--------------------------------------|---------------------------------------------------------------------------------------------|
| 1       | 0                                     | Atteint automatiquement après les 5 missions d'introduction du Power.                        |
| 2       | ~2 000                                | Seul point de mesure en jeu documenté en dehors du rang 100 ; suggère une courbe resserrée en tout début de progression, plus abrupte qu'une simple interpolation linéaire jusqu'à 15 000 au rang 5. |
| 5       | ~15 000                               | Fin du premier palier (2 à 5).                                                                |
| 10      | ~55 000                               | Estimation (+8 000/rang après le rang 5).                                                     |
| 20      | ~135 000                              | Estimation.                                                                                   |
| 30      | ~215 000                              | Estimation.                                                                                   |
| 40      | ~295 000                              | Estimation.                                                                                   |
| 50      | ~375 000                              | Estimation.                                                                                   |
| 60      | ~455 000                              | Estimation.                                                                                   |
| 70      | ~535 000                              | Estimation.                                                                                   |
| 80      | ~615 000                              | Estimation.                                                                                   |
| 90      | ~695 000                              | Estimation.                                                                                   |
| 99      | ~767 000                              | Estimation.                                                                                   |
| **100** | **~775 000**                          | Valeur haute couramment citée par la communauté ; déblocage généralement complet des modules exclusifs dès ~97. |

**Estimation du temps nécessaire pour atteindre le rang 100.** En reprenant les rendements indiqués en 7.2 (environ
25 000 à 75 000 mérites/heure en minage optimisé dans un système d'acquisition ou de renforcement, 10 000 à 25 000
mérites/heure en combat/chasse de primes), atteindre ~775 000 mérites cumulés représente très approximativement :

- **~10 à 30 heures** de jeu actif dans le meilleur cas (méthode la plus rentable du moment, jouée sans interruption) ;
- **~50 à 75 heures**, voire davantage, pour un joueur mixant des activités moins optimisées, jouant en session courtes,
  ou visant des activités secondaires (commerce, exobiologie, données Odyssey — voir 7.2).

Instantané au 9 septembre 2026, à revérifier sur les rendements courants (voir 7.2 et [Outils](./16-outils.md)) : les
taux de conversion mérites ont été révisés à plusieurs reprises depuis le lancement de la 2.0 (voir 5.7), ce qui change
directement ces estimations d'heures.

### 5.6 Le système d'éthos Powerplay (bonus de mérites d'environ +50 %)

Chaque Power associe l'une des quatre catégories d'activités suivantes à chacun de ses trois axes d'action
(Acquisition, Renforcement, Undermining — voir 5.1) :

| Éthos       | Activités concernées                                                  |
|-------------|-----------------------------------------------------------------------|
| **Combat**  | Chasse de primes, zones de combat Powerplay, destruction de vaisseaux |
| **Finance** | Commerce, minage, transport Powerplay                                 |
| **Social**  | Recherche et sauvetage, missions de soutien, activités Odyssey        |
| **Covert**  | Données Odyssey volées, piratage, malware                             |

Réaliser, sur un système donné, l'activité correspondant à l'éthos assigné par son Power à l'axe concerné (Acquisition,
Renforcement ou Undermining) confère un **bonus de mérites d'environ +50 %** sur cet axe, ce qui encourage de fait une
spécialisation selon le Power choisi et l'axe travaillé.

#### Matrice des éthos par Power

L'association précise entre chaque axe et chaque catégorie est propre à chaque Power et n'est pas résumée nulle part
dans l'interface officielle sous cette forme ; la matrice ci-dessous a été reconstituée à partir des fiches
individuelles de chaque Power sur inara.cz (une par Power), **instantané capturé le 9 septembre 2026** — à revérifier
dans le panneau Powerplay en jeu, Frontier ayant par le passé modifié certaines associations lors de ses
rééquilibrages (voir 5.7). Chaque cellule indique le ou les axes (Acquisition / Renforcement / Undermining) qui
utilisent la catégorie d'éthos de la colonne pour ce Power :

| Power                    | Combat                              | Finance                    | Social                  | Covert                |
|--------------------------|--------------------------------------|-----------------------------|--------------------------|------------------------|
| Denton Patreus           | Renforcement, Undermining            | Acquisition                 | —                        | —                      |
| Aisling Duval            | —                                     | Renforcement                | Acquisition, Undermining | —                      |
| Arissa Lavigny-Duval     | Renforcement, Undermining            | —                            | Acquisition              | —                      |
| Zemina Torval            | —                                     | Acquisition, Renforcement*  | —                        | Undermining*           |
| Felicia Winters          | —                                     | Renforcement, Undermining   | Acquisition              | —                      |
| Jerome Archer            | Acquisition, Renforcement            | —                            | —                        | Undermining            |
| Edmund Mahon             | Undermining                          | Acquisition, Renforcement   | —                        | —                      |
| Nakato Kaine             | —                                     | —                            | Acquisition, Undermining | Renforcement           |
| Li Yong-Rui              | —                                     | Renforcement, Undermining   | Acquisition              | —                      |
| Archon Delaine           | Acquisition, Renforcement, Undermining | —                          | —                        | —                      |
| Pranav Antal             | —                                     | —                            | Acquisition, Undermining | Renforcement           |
| Yuri Grom                | Renforcement                         | —                            | —                        | Acquisition, Undermining |

\* **Zemina Torval : donnée non confirmée directement.** La fiche inara.cz de ce Power a renvoyé une erreur HTTP 503
(indisponibilité temporaire) lors de la recherche du 9 septembre 2026 ; les valeurs indiquées proviennent d'une source
secondaire (lavewiki.com) qui, sur les Powers où elle a pu être recoupée avec inara.cz, s'est révélée fiable pour
certains mais en désaccord pour d'autres (notamment l'axe Undermining d'Edmund Mahon et d'Archon Delaine). À vérifier en
priorité dans le panneau Powerplay en jeu avant de bâtir une stratégie dessus.

### 5.7 Rééquilibrages continus de Powerplay 2.0 (2025-2026)

Le système a fait l'objet d'ajustements fréquents après son lancement, preuve d'un suivi actif de Frontier, mais aussi
de problèmes d'équilibrage persistants :

- **Peu après le lancement** — deux « leviers » jugés trop rentables ont été désactivés : la collecte de capsules de
  sauvetage (« escape pods ») et la livraison de biens rares (« rare goods »), au détriment notamment d'Aisling Duval et
  de Nakato Kaine, pour qui ces activités constituaient des points forts. Cette décision a été annoncée uniquement sur
  les réseaux sociaux, sans notification claire en jeu, ce qui a suscité des critiques sur la communication de Frontier.
- **Courant 2025** — instauration d'une pénalité sur le renforcement passif, destinée à limiter le « turtling »
  (fortification excessive de systèmes déjà tranquilles, sans contestation réelle).
- **Trailblazers Update 3.4 (été 2025)** — rééquilibrage majeur de la formule de mérites :
    - le renforcement passe à un système de bonus/malus glissant, calculé en fonction de l'intensité de l'undermining
      subi par le système récemment (un système non attaqué du tout rapporte nettement moins de mérites au renforcement
      qu'un système fortement attaqué) ;
    - l'undermining bénéficie d'un bonus de mérites revu à la hausse par rapport à la formule précédente ;
    - l'acquisition de systèmes inoccupés voit son bonus de mérites réduit ;
    - introduction d'une **décroissance du score de contrôle** (« control score decay ») : à chaque tick hebdomadaire,
      tout système contrôlé perd automatiquement une partie de son score, sans toutefois pouvoir descendre en dessous
      d'un plancher correspondant à une fraction du seuil de son état actuel. Cette décroissance est non linéaire : plus
      un système est proche du score maximum de son palier, plus il décroît fortement ; plus il est proche du plancher,
      plus la décroissance ralentit. Cette perte est comptabilisée comme de l'undermining et s'additionne aux autres
      sources de déstabilisation ;
    - l'objectif affiché par Frontier est d'encourager un jeu plus agressif et davantage de prise de risque, en rendant
      les territoires de Power plus vulnérables et plus « fluides » dans le temps, afin d'empêcher la stagnation d'un
      contrôle acquis passivement.

  Les pourcentages exacts de ces bonus/malus ont eux-mêmes été révisés à plusieurs reprises depuis leur introduction ;
  consulter les notes de mise à jour officielles ou un site de suivi communautaire (voir section 7.3) pour connaître les
  valeurs en vigueur au moment de jouer.

- **Ajustements ponctuels ultérieurs (fin 2025 / 2026)** — désactivation temporaire des gains de mérites/score liés aux
  données d'exploration et aux échantillons génétiques (Genetic Samples) pour corriger des abus ; correctifs sur le fait
  que les kills PvP en zone Powerplay ne rapportaient parfois aucun score/mérite ; réduction des mérites accordés pour
  la destruction de chasseurs embarqués (Ship Launched Fighters) ; correction du comportement des marchés noirs dans les
  systèmes tenus par Archon Delaine (qui doivent désormais s'ouvrir automatiquement) et par Pranav Antal (qui doit au
  contraire les fermer dans les systèmes Fortifiés/Bastions). Ces micro-correctifs, documentés dans les notes de mise à
  jour successives, montrent que Frontier continue d'itérer activement sur l'équilibrage plus d'un an après le lancement
  de la 2.0.

### 5.8 Powerplay et Colonisation

Depuis le déploiement du système de **Colonisation de systèmes** (bêta ouverte le 26 février 2025 avec la mise à jour
*Trailblazers*, sortie complète le 11 novembre 2025 avec la mise à jour *Dodec Update* — voir
[Colonisation](./18-colonisation.md) pour le détail complet de cette mécanique, non dupliqué ici), les commandants
peuvent fonder de nouvelles installations dans des systèmes auparavant inhabités.

Du point de vue de Powerplay, un système nouvellement colonisé apparaît, comme n'importe quel système non revendiqué,
parmi les systèmes **inoccupés** de la carte Powerplay : il ne bascule sous le contrôle d'un Power que lorsque celui-ci
y mène une opération d'**Acquisition / Expansion** réussie (voir 5.1), selon les mêmes règles générales que pour un
système indépendant préexistant. La fondation d'un système via la Colonisation et son rattachement éventuel à un Power
via Powerplay sont donc deux processus **distincts et découplés** : le premier détermine l'existence et le
développement du système, le second détermine séparément s'il finit sous influence d'un Power, et lequel.

**Point de vigilance.** Les sources accessibles lors de cette mise à jour (9 septembre 2026) ne permettent pas de
confirmer avec certitude : s'il existe un seuil minimal de développement économique ou de population avant qu'un
système colonisé devienne éligible à l'Acquisition Powerplay ; ni si l'allégeance choisie à la fondation du système
(Fédération, Empire, Alliance ou indépendant, voir [Colonisation](./18-colonisation.md)) restreint la liste des Powers
pouvant légitimement le revendiquer. Se référer à [Colonisation](./18-colonisation.md) et aux notes de mise à jour
courantes pour les règles exactes en vigueur au moment de jouer.

## 6. Les 12 Powers actuels (depuis le 31 octobre 2024)

Les bonus ci-dessous sont ceux en vigueur au **9 septembre 2026** ; Frontier les ajuste occasionnellement lors de ses
rééquilibrages (voir 5.7) — vérifier les valeurs courantes dans le panneau Powerplay en jeu avant de choisir un Power
sur la seule base de ce tableau.

| Power                    | Superpuissance | Bonus / avantages caractéristiques                                                                                     |
|--------------------------|----------------|--------------------------------------------------------------------------------------------------------------------------|
| **Jerome Archer**        | Fédération     | ~+100 % primes de chasse (bounties) ; -30 % coût des modules d'armement                                                |
| **Felicia Winters**      | Fédération     | +100 % profits de sauvetage (Search & Rescue) ; +60 % sur médicaments et denrées alimentaires                          |
| **Denton Patreus**       | Empire         | +80 % primes ; -90 % coût de réarmement ; -40 % coût des armes                                                         |
| **Zemina Torval**        | Empire         | +45 % profits sur le minage ; +50 % sur les esclaves impériaux ; +20 % sur les bons commerciaux                        |
| **Aisling Duval**        | Empire         | +200 % profits de sauvetage (Search & Rescue)                                                                          |
| **Arissa Lavigny-Duval** | Empire         | +100 % primes ; -30 % coût des armes                                                                                   |
| **Edmund Mahon**         | Alliance       | +50 % sur les biens rares ; +25 % bonus commercial                                                                     |
| **Nakato Kaine**         | Alliance       | +50 % profits sur le minage ; +150 % réputation auprès des factions mineures ; +120 % profits de sauvetage             |
| **Yuri Grom**            | Indépendant    | +60 % primes ; +15 % données d'exploration ; +15 % bons commerciaux ; -30 % coût des armes                             |
| **Li Yong-Rui**          | Indépendant    | +100 % données d'exploration ; ravitaillement/réarmement/réparation gratuits ; +25 % bonus commercial                  |
| **Pranav Antal**         | Indépendant    | +30 % exobiologie ; +50 % commerce technologique                                                                       |
| **Archon Delaine**       | Indépendant    | +30 % profits sur le marché noir ; réduction/suppression des amendes pour activités criminelles en territoire contrôlé |

Répartition par superpuissance : **Fédération (2)**, **Empire (4)**, **Alliance (2)**, **Indépendants (4)** — soit un
total de **12 Powers**.

**Instantané capturé le 9 septembre 2026** (nombre de systèmes en état Bastion/« stronghold » par Power, source
[Inara.cz](https://inara.cz/elite/powerplay/)) — ce classement fluctue chaque semaine selon les cycles de contrôle ; à
revérifier sur Inara.cz ou les autres outils listés dans [Outils](./16-outils.md) avant de s'en servir pour choisir un
Power :

| Rang | Power                | Systèmes Bastion (instantané 09/09/2026) |
|------|----------------------|-------------------------------------------|
| 1    | Li Yong-Rui          | 228                                        |
| 2    | Aisling Duval        | 202                                        |
| 3    | Arissa Lavigny-Duval | 166                                        |
| 4    | Edmund Mahon         | 135                                        |
| 5    | Pranav Antal         | 132                                        |
| 5    | Yuri Grom            | 132                                        |
| 7    | Nakato Kaine         | 111                                        |
| 8    | Jerome Archer        | 99                                         |
| 9    | Felicia Winters      | 84                                         |
| 10   | Archon Delaine       | 76                                         |
| 11   | Zemina Torval        | 65                                         |
| 12   | Denton Patreus       | 48                                         |

### Modules exclusifs Powerplay

Depuis la 2.0, chaque Power dispose du même ensemble de **12 modules exclusifs**, communs à tous les Powers et débloqués
par la progression de rang :

- Prismatic Shields (boucliers)
- Pacifier Frag-Cannons
- Imperial Hammer (railgun)
- Advanced Plasma Accelerator
- Pack-Hound (missiles)
- Containment Missile (relance le FSD ennemi)
- Pulse Disruptor (dysfonctionnement de module ciblé)
- Concord Cannon (nouveauté de la 2.0)
- Enforcer Cannon
- Mining Lance
- Cytoscramblers
- Retributor (augmente la chaleur de la cible)

## 7. Guide pratique pour bien jouer Powerplay en 2025-2026

### 7.1 Choisir son Power (s'engager, « pledge »)

Le choix d'un Power — l'engagement, ou « pledge » — se fait via le panneau droit du cockpit (onglet Powerplay), qui
affiche pour chaque Power son système d'origine, sa philosophie/affiliation et ses avantages
propres.

Comme tous les modules finissent par être accessibles quel que soit le Power choisi, le critère de sélection le plus
souvent recommandé par la communauté repose sur trois axes :

1. **Le rôle de jeu recherché** — les avantages économiques du Power correspondent-ils à votre style de jeu (minage,
   combat, sauvetage, commerce, exploration, criminalité) ? La [matrice des éthos](#matrice-des-éthos-par-power) en 5.6
   permet d'affiner ce choix activité par activité.
2. **L'affinité de rôle-play** avec la faction (Fédération, Empire, Alliance ou Indépendants).
3. **Le Power qui contrôle votre système d'attache** — pour profiter des bonus locaux sans avoir à se déplacer.

Jerome Archer est souvent cité comme un choix « généraliste » équilibré, offrant un bon compromis entre activités, gains
de mérites et progression des modules.

Attention : rejoindre un Power vous rend automatiquement **hostile aux autres Powers** dans les systèmes qu'ils
contrôlent (interdictions possibles en territoire adverse), et **changer de Power fait perdre les avantages acquis**
avec le précédent (voir 7.5 pour le détail de ce qui est conservé ou perdu).

### 7.2 Méthodes efficaces pour engranger des mérites (méta 2025-2026)

| Méthode                                                                                                                                | Rendement approximatif           | Remarques                                                                                              |
|----------------------------------------------------------------------------------------------------------------------------------------|----------------------------------|----------------------------------------------------------------------------------------------------------|
| **Minage de commodités** dans un système d'acquisition ou de renforcement, avec hotspot de ressources et prix de vente élevé sur place | ~25 000 à 75 000 mérites/heure   | L'écart s'explique par les rééquilibrages successifs ; l'une des méthodes les plus citées actuellement |
| **Zones de combat Powerplay / chasse de primes**, dans des systèmes contestés ou autour de Stronghold Carriers ennemis                 | ~10 000 à 25 000 mérites/heure   | Nécessite un vaisseau de combat bien équipé                                                            |
| **Missions en escadre (wing missions)** empilées, notamment de primes                                                                  | Bon rendement combiné            | Gains en mérites, crédits et matériaux d'ingénierie                                                    |
| **Commerce à haute marge (>40 % de profit), exobiologie, données Odyssey**                                                             | Sources secondaires mais viables | Exploiter le bonus d'éthos de +50 % quand l'activité correspond au profil du Power choisi (voir 5.6)   |

*Rendements instantanés au 9 septembre 2026, à revérifier via [Outils](./16-outils.md) : les taux de conversion mérites
évoluent à chaque rééquilibrage (voir 5.7).*

**À éviter / obsolète** : la collecte de capsules de sauvetage et la vente de biens rares, désactivées comme sources de
mérites peu après le lancement de la 2.0 en raison d'abus trop importants ; les données d'exploration et les
échantillons génétiques ont également été temporairement neutralisés à un moment donné en 2025-2026 pour corriger des
abus similaires. Il est recommandé de vérifier l'état courant en jeu ou sur les sites communautaires avant de bâtir une
stratégie sur ces activités, la situation évoluant rapidement.

Depuis l'Update 3.4 (Trailblazers, été 2025), il est conseillé de privilégier l' **undermining** et le renforcement de
systèmes **activement contestés**, plutôt que le renforcement passif de bastions déjà tranquilles, pénalisé par la
nouvelle formule (voir 5.7).

### 7.3 Stratégie territoriale Powerplay (acquisition, decay hebdomadaire, coordination)

- Privilégier l'acquisition de systèmes inoccupés proches (20 à 30 années-lumière) des bastions déjà alliés, pour
  bénéficier de la bulle logistique et faciliter le ravitaillement et la défense.
- Surveiller le score de décroissance hebdomadaire (control score decay, en vigueur depuis l'été 2025) : un système «
  trop tranquille » perd mécaniquement du score chaque semaine, ce qui impose une activité minimale de maintenance même
  en l'absence d'attaque ennemie.
- Pour un suivi en temps réel (classements, systèmes vulnérables, modèles d'effet cascade), s'appuyer sur les outils
  communautaires tiers plutôt que sur la carte galactique in-game, jugée insuffisante par la communauté sur ce point
  (informations manquantes ou erronées concernant ce qui rapporte des mérites dans tel ou tel système) : voir le
  comparatif détaillé de ces outils (Inara.cz, EDPowerPlay, ED-Board, etc.) dans [Outils](./16-outils.md) plutôt que
  répété ici.
- Rejoindre le serveur Discord ou le groupe de joueurs dédié à son Power est une recommandation récurrente, afin
  d'accéder à une coordination stratégique (cibles prioritaires de la semaine, campagnes d'undermining coordonnées)
  largement absente de l'interface officielle — voir aussi [Escadrons de joueurs](./22-squadrons.md) pour la
  coordination structurée en groupe.

### 7.4 Points de vigilance et limites actuelles de Powerplay 2.0

Malgré le succès relatif de la refonte 2.0 par rapport à la version 1.0, plusieurs critiques persistent au sein de la
communauté (2025) :

- des bugs et des mécaniques mal calibrées au lancement ;
- des activités clairement déséquilibrées entre elles, certaines dominant largement le farm de mérites au détriment
  d'autres, ce qui oblige Frontier à des corrections répétées ;
- une documentation officielle jugée insuffisante — les informations fiables sont surtout disponibles via les sites
  communautaires et les créateurs de contenu, pas en jeu ;
- une communication parfois jugée insuffisante par Frontier lors des changements d'équilibrage, avec des annonces faites
  uniquement sur les réseaux sociaux, sans reflet clair en jeu.

Le système reste toutefois considéré par la majeure partie de la communauté (2025-2026) comme très supérieur à la
version 1.0, avec une participation des joueurs en nette hausse depuis octobre 2024. Frontier continue de communiquer
sur des affinements fondés sur les retours de la communauté.

### 7.5 Basculer ou quitter un Power

Un commandant peut quitter son Power ou en rejoindre un autre à tout moment depuis le panneau Powerplay du cockpit.
Voici ce qui a pu être vérifié, et ce qui n'a pas pu l'être, lors de cette mise à jour (9 septembre 2026) :

**Confirmé :**

- **Progression propre à chaque Power** — dans la logique des mérites permanents introduite par la 2.0 (voir section
  4), le rang et les mérites accumulés restent attachés au Power auprès duquel ils ont été gagnés ; ils ne se
  transfèrent pas vers un nouveau Power. Rejoindre un Power différent de celui déjà progressé fait donc repartir de
  rang 1 auprès de ce nouveau Power.
- **Perte des avantages actifs** — quitter un Power, ou en rejoindre un autre, fait perdre l'accès immédiat aux bonus
  économiques et au statut propres au Power quitté (voir section 6), remplacés le cas échéant par ceux, potentiellement
  très différents, du nouveau Power.
- **Hostilité territoriale** — rejoindre un Power vous rend hostile aux autres Powers dans leurs systèmes contrôlés
  (voir 7.1) ; rester non engagé (n'avoir quitté aucun Power pour en rejoindre un autre) neutralise cette hostilité.

**Non confirmé via les sources consultées pour cette mise à jour** (documentation officielle inaccessible en accès
direct — voir la limite méthodologique en 3.4 — et guides communautaires disponibles insuffisamment précis ou
contradictoires sur ce point) :

- la durée exacte, en heures ou en jours, d'un éventuel **délai de latence (« cooldown »)** avant de pouvoir se
  réengager après avoir quitté ou changé de Power ; plusieurs sources évoquent l'existence d'un tel délai, hérité de
  Powerplay 1.0, sans en documenter la valeur actuelle sous la 2.0 ;
- si un module Powerplay déjà débloqué et monté sur un vaisseau reste utilisable après avoir quitté le Power concerné
  (les modules ne sont plus exclusifs à un Power depuis la 2.0, voir section 4, ce qui suggère qu'il devrait rester
  fonctionnel une fois acquis, mais cela n'a pas pu être vérifié directement contre une source officielle).

**Recommandation pratique.** Avant de basculer ou de tout quitter, vérifier ces deux points directement dans le panneau
Powerplay en jeu (un texte d'avertissement y est généralement affiché avant confirmation) ou sur les outils de suivi
communautaires (voir [Outils](./16-outils.md)).

## Voir aussi

- [Chronologie canonique](./00-chronologie-canonique.md) — repères de dates officielles pour tout le corpus, dont la
  sortie d'Ascendancy/Powerplay 2.0 et de la Colonisation (voir la précision chronologique en 3.4).
- [Lore](./01-lore.md) — contexte politique et historique complet des trois superpuissances et des Powers.
- [Colonisation](./18-colonisation.md) — mécanique de fondation de systèmes ; son articulation avec Powerplay est
  résumée en 5.8.
- [Fleet Carriers](./19-fleet-carriers.md) — fonctionnement général des porte-vaisseaux, dont les Stronghold Carriers
  propres aux systèmes Bastion (voir 5.3).
- [Le Background Simulation (BGS)](./21-bgs.md) — l'autre grande couche de méta-jeu politique du jeu, à ne pas
  confondre avec Powerplay.
- [Escadrons de joueurs (Squadrons)](./22-squadrons.md) — coordination en groupe autour d'un Power (voir 7.3).
- [Community Goals](./24-community-goals.md) — mécanique générique de community goal, distincte mais parfois
  complémentaire des objectifs Powerplay.
- [Outils](./16-outils.md) — comparatif détaillé des outils communautaires de suivi (Inara, EDPowerPlay, ED-Board,
  etc.) utiles pour jouer Powerplay efficacement.
- [Glossaire](./00-glossaire.md) — sigles et entités utilisés dans ce guide (ARX, Power, Bulle).

## Sources

- https://elite-dangerous.fandom.com/wiki/Powerplay
- https://elite-dangerous.fandom.com/wiki/Alliance
- https://elite-dangerous.fandom.com/wiki/Empire
- https://elite-dangerous.fandom.com/wiki/Federation
- https://elite-dangerous.fandom.com/wiki/Category:Factions
- https://elite-dangerous.fandom.com/wiki/Zachary_Hudson
- https://elite-dangerous.fandom.com/wiki/Denton_Patreus
- https://elite-dangerous.fandom.com/wiki/Category:Power
- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://inara.cz/elite/logbook/84502/
- https://inara.cz/elite/powers/
- https://inara.cz/elite/powerplay/
- https://inara.cz/elite/power/ (fiches individuelles de chaque Power, consultées le 9 septembre 2026 pour la matrice
  d'éthos et le tableau des systèmes Bastion de la section 6 ; la fiche de Zemina Torval, id 8, a renvoyé une erreur
  HTTP 503 temporaire ce jour-là)
- https://www.lavewiki.com/powerplay (source secondaire pour l'éthos de Zemina Torval, partiellement recoupée avec
  inara.cz — voir la note en 5.6)
- https://edpowerplay.com/guide
- https://edpowerplay.com
- https://gamerant.com/elite-dangerous-powerplay-20-ascendancy-update/
- https://gamerant.com/elite-dangerous-review-bombed-why/
- https://www.pcgamer.com/games/sim/elite-dangerous-gets-its-own-kick-in-the-steam-ratings-shin-over-real-money-ship-sales/
- https://ricardosgaming.com/blog/elite-dangerous-powerplay-2-0-guide-choose-a-power-earn-merits-and-unlock-modules/
- https://ricardosgaming.com/blog/elite-dangerous-news-updates-2026/
- https://www.elitedangerous.com/news/powerplay-20-qa
- https://www.elitedangerous.com/update-notes/4-1-2-103
- https://www.elitedangerous.com/en-US/news/updates/4-0-19-01
- https://www.elitedangerous.com/update-notes/4-0-19-0
- https://www.elitedangerous.com/en-US/news/galnet/jerome-archer-and-nakato-kaine-increase-supporters
- https://community.elitedangerous.com/news/03/06/2016/Powerplay-Annual-Summary
- https://justabout.com/elite-dangerous/37813/an-elite-dangerous-powerplay-20-guide-and-review-created-by-veteran-players
- https://forums.frontier.co.uk/threads/elite-dangerous-powerplay-2-0-exploration-and-trade-balance-changes.629107/
- https://forums.frontier.co.uk/threads/elite-dangerous-powerplay-2-0-merit-changes.630583/
- https://forums.frontier.co.uk/threads/the-state-of-power-play-2-0-is-extremely-frustrating.633157/
- https://forums.frontier.co.uk/threads/elite-dangerous-trailblazers-update-3-now-live.636973/
- https://simulationdaily.com/news/elite-dangerous-ascendancy-release-patch-notes/
- https://issues.frontierstore.net/issue-detail/73963
- https://ed-board.net/en/?m=powers
- https://www.pcgamingwiki.com/wiki/Elite_Dangerous
