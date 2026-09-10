---
id: 07-equipement-a-pied
titre: "Guide complet de l'équipement à pied dans Elite Dangerous (Odyssey)"
domaine: vaisseaux-equipement
entites: [Flight Suit, Artemis, Maverick, Dominator, Genetic Sampler, Arc Cutter, Pioneer Supplies, Vista Genomics, Suit Schematic, Manufacturing Instructions, Engineers à pied, Merc Coin, Kinematic Armaments, Manticore, Takada, Karma P-15, Karma AR-50, Manticore Executioner, Manticore Intimidator, Manticore Terminator, Medkit, Energy Cell, Frag Grenade, Shield Disruptor, Shield Projector, E-Breach, Aerogel, Carbon Fibre Plating, Titanium Plating, Graphene, Health Monitor, Headshot Damage, Greater Range]
mots_cles_en: [on-foot suit, Artemis bio suit, Maverick suit, Dominator suit, genetic sampler, Pioneer Supplies, suit grade upgrade, on-foot engineering, bartender, Merc Coin, Kinematic Armaments, Manticore, Takada, Karma P-15, Karma AR-50, Manticore Executioner, Manticore Intimidator, Manticore Terminator, Shield Disruptor, Shield Projector, E-Breach, on-foot consumable, microresource, weapon blueprint materials, suit modification slots]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-10
confiance_globale: haute
volatilite: haute
sources_primaires: ["Flux d'annonces officielles Frontier", "EDCD/coriolis-data (commit 0db9234b5b9ce8c939ea84133d7ce336eea88e27) — consulté comme contrôle négatif et pour le renvoi vers le volet vaisseau : ce dépôt ne porte aucune donnée d'équipement à pied", "EDCD/FDevIDs (commit c35612952dd6a547d1a7ac4cffab9c7051e86579) — microresources.csv, seule source locale couvrant les micro-ressources et consommables Odyssey", "Inara", "edfieldmanual.com", "starzen.space"]
zones_incertaines: ["Les montants en crédits des paliers de montée en grade viennent du wiki Fandom seul et restent à confirmer en jeu", "Le tarif au comptoir du Carbon Fibre Plating et du Titanium Plating est déduit de leur type et non relevé", "Aucun jeu de données local ne porte les statistiques de combat des armes à pied : dégâts par tir, cadence, DPS, chargeur, portée nominale, efficacité contre bouclier et blindage, prix par grade restent non chiffrés", "Aucun jeu de données local ne porte les caractéristiques chiffrées des combinaisons : bouclier, points de vie, capacité du sac à dos, réserve d'oxygène, nombre d'emplacements d'armes", "Le catalogue complet des armes à pied n'est pas dénombrable localement : cinq modèles seulement sont nommés par une source, contre les onze que suppose le calcul des 56 recettes", "Vingt-sept des trente-trois cellules de la matrice modification d'arme × fabricant restent sans recette relevée", "L'existence de blueprints d'Engineer et de paliers de grade pour les quatre outils n'est pas confirmée", "Aucune preuve d'un effet expérimental distinct n'a pu être établie pour les suits et armes d'Odyssey", "Le montant exact du rebuy à pied n'a pas pu être confirmé", "Le plafond de 9 999 Merc Coin et l'allocation hebdomadaire de 1 000 ne sont corroborés par aucune annonce officielle", "La date du Kestrel Mk II (24 février 2026) n'est établie qu'avec une confiance moyenne", "L'association du Caspian Explorer à un plafonnement de l'ingénierie de combat à pied n'a pas pu être vérifiée dans les notes officielles"]
guides_lies: [0, 6, 9, 10, 13, 14, 18, 26]
---

# Guide complet de l'équipement à pied dans Elite Dangerous (Odyssey)

## En bref

L'équipement à pied d'Elite Dangerous introduit par Odyssey (19 mai 2021) repose sur quatre combinaisons (*suits*) : la
**Flight Suit** de départ, l'**Artemis** d'exobiologie livrée avec le **Genetic Sampler**, la **Maverick** polyvalente
à Arc Cutter, et la **Dominator** de combat, seule à porter deux armes principales. Chacune se monte du grade 1 au
grade 5 chez **Pioneer Supplies** en quatre paliers : 14 850 000 Cr au total, dont 2 850 000 pour atteindre le grade 3,
plus 12 Suit Schematic, 12 Health Monitor, 12 Manufacturing Instructions, 28 Graphene et 28 unités de blindage ;
chaque palier ouvre un emplacement de modification, quatre au maximum. Les armes viennent de **Kinematic Armaments**
(Karma P-15, AR-50), de **Manticore** (Executioner, Intimidator, Terminator) et de **Takada** ; il n'existe pas d'arme
de mêlée. Le jeu compte exactement six consommables, dont trois grenades et l'**E-Breach**. Treize **Engineers à pied**
appliquent des modifications **irréversibles** de 500 000 à 1 000 000 Cr, à recette fixe et propre au fabricant de
l'arme. À la mort, le sac à dos est perdu, le casier du vaisseau conservé.

## Périmètre de ce guide et renvois

> **Voir aussi** : ce guide se concentre sur l'équipement individuel (combinaisons, armes, outils, ingénierie). Pour le
> déroulement des missions et des raids de settlements eux-mêmes, voir [09-combat-a-pied.md](./09-combat-a-pied.md) et
> [13-operations.md](./13-operations.md) ; pour l'exobiologie approfondie (espèces, rangs), voir
> [10-exploration.md](./10-exploration.md) ; pour l'ingénierie des vaisseaux (mécanique générale, matériaux), voir
> [06-ingenieurs.md](./06-ingenieurs.md) ; pour toute date contestée dans ce document, la source d'arbitrage est
> [00-chronologie-canonique.md](./00-chronologie-canonique.md).

## Vue d'ensemble du gameplay à pied d'Odyssey : santé, oxygène et énergie de combinaison

Odyssey, sorti le **19 mai 2021** sur PC, a introduit pour la première fois dans Elite Dangerous la possibilité de
sortir de son vaisseau en combinaison spatiale et de se déplacer à pied : flottaison en apesanteur, propulsion via les
micro-propulseurs de la combinaison, marche magnétique sur la coque des vaisseaux, et exploration de stations,
avant-postes et installations planétaires à l'échelle humaine.

À pied, le commandant gère un jeu de ressources propre à la combinaison, distinct de celui du vaisseau :

- **Santé** — jauge de points de vie, régénérée par le repos ou soignée avec des consommables.
- **Oxygène** — réserve d'air de la combinaison, consommée en continu et plus rapidement à l'effort (sprint, saut
  assisté) ou en cas de brèche.
- **Énergie de combinaison (batterie)** — alimente le bouclier personnel, les outils et les capacités de mobilité
  (jetpack, sprint) ; elle se recharge automatiquement mais peut être vidée par un usage intensif des outils ou par les
  dégâts.

Cet équipement à pied sert quatre grandes familles d'activités :

- **Combat / mercenariat** — raids de colonies et de settlements, zones de conflit à pied (CZ, voir
  [glossaire](./00-glossaire.md)), missions d'assassinat ou de récupération armée.
- **Exploration / exobiologie** — échantillonnage de formes de vie extraterrestres sur les corps planétaires.
- **Infiltration / piratage** — vol de données, sabotage, missions furtives dans des installations gardées.
- **Vie sociale et logistique** — interactions dans les concourses de stations, achats auprès des vendeurs à pied
  (Pioneer Supplies, Vista Genomics, comptoirs de matériaux), missions à pied.

### La mise à jour « Operations » (4.4.0.0, 30 juin 2026) et le Nomad : ce qui est établi

Une version antérieure de ce guide tenait l'existence même d'une fonctionnalité multijoueur nommée **« Operations »**
pour non confirmée, faute d'avoir pu consulter les annonces officielles — les accès directs à elitedangerous.com et
aux forums Frontier ayant été bloqués (erreurs HTTP 403) pendant la vérification. Cette réserve n'a plus lieu d'être :
les annonces officielles de Frontier documentent la mise à jour de bout en bout, dates comprises.

| Date (UTC)       | Annonce officielle                | Ce qu'elle établit                                                                                            |
|------------------|-----------------------------------|---------------------------------------------------------------------------------------------------------------|
| 22 avril 2026    | « An Update on Operations »       | Report de la mise à jour, « which will now be arriving in June ».                                             |
| 2 juin 2026      | « Discover the Nomad »            | Premier dévoilement du Nomad, annoncé « in ARX Early Access alongside Operations on 30th June ».              |
| 1ᵉʳ juillet 2026 | « Operations Update »             | Notes de version complètes : « The Operations Update is here », six Operations, l'Operation Runner, le Nomad. |
| 9 juillet 2026   | « Operations Update \| Update 3 » | Correctifs, dont la restauration des inventaires à pied effacés après une Operation.                          |
| 2 septembre 2026 | « Rhino SRV Update »              | Ajout d'une septième Operation, « Under Siege », et du SRV Rhino.                                             |

La version du jeu passe à **4.4.0.0** le 30 juin 2026, en accès anticipé ARX, et à **4.4.0.3** au 9 juillet 2026.

**Ce que la fonctionnalité est**, dans les termes des notes officielles du 1ᵉʳ juillet 2026 : un cadre de jeu **en
escadre**, jusqu'à quatre commandants, lancé depuis les tableaux de missions en station, en Porte-Vaisseau ou en
Porte-Vaisseau d'escadron, avec un mode **Mercenary** sans conséquence et un mode **Powerplay** permettant de saper une
Puissance adverse. Une fois l'Operation lancée, l'escadre est transportée à bord de l'**Operation Runner**, vaisseau de
déploiement qui sert de point d'entrée, de réapparition et d'extraction. Les six scénarios de lancement sont
**Tactical Takedown**, **Firestorm Rescue**, **Reclamation Point**, **Biohazard Takedown**, **Rapid Response** et
**Terminal Prosecution** ; plusieurs se jouent en partie à pied — abordage de mégavaisseau, évacuation de station sous
le feu, assaut de base — ce qui en fait un débouché direct pour l'équipement décrit dans ce guide.

**Le Nomad, et ce qu'il change pour l'exobiologie à pied.** Dévoilé le 2 juin 2026, le Nomad est « a small and compact
ship-launched vessel which is built to explore planetary surfaces » : patins d'atterrissage étroits d'inspiration
hélicoptère, moteurs qui pivotent au posé, empreinte au sol réduite qui autorise à se poser sur un terrain accidenté.
C'est un **ship-launched vessel**, pas un vaisseau de chantier naval : il ne s'achète pas au shipyard et ne change rien
au décompte des vaisseaux pilotables du corpus. Les notes du 1ᵉʳ juillet 2026 précisent qu'il « can be deployed from a
compatible vessel bay, including MK I and MK II modules » et qu'il embarque « a specialised MK II Biological Scanner
for the detection of biological signals directly from the cockpit ». Conséquence pratique pour ce guide : la
**détection** des signaux biologiques peut désormais se faire depuis le cockpit, mais le **prélèvement** reste une
opération à pied, au Genetic Sampler de l'Artemis (voir plus loin). Pour la fiche complète du Nomad, de son module de
soute et du Rhino, voir [14-rhino-nomad.md](./14-rhino-nomad.md).

**Ne confondez pas cette mise à jour avec le mot « Opérations »** employé dans
[13-operations.md](./13-operations.md), qui désigne plus largement l'ensemble générique du gameplay au sol
(settlements, missions, zones de conflit) introduit dès le lancement d'Odyssey en 2021 — les deux sens coexistent dans
le corpus, et seul le premier renvoie à la mise à jour de 2026.

*Sourcage : flux d'annonces officielles Frontier relevé le 9 septembre 2026 (billets cités par titre et date dans la
table ci-dessus) ; arbitrage des dates du corpus dans
[00-chronologie-canonique.md](./00-chronologie-canonique.md#3-mode--operations---existence-version-4400-et-date-de-sortie-30-juin-2026).*

## Les combinaisons (Suits) d'Odyssey : Flight Suit, Artemis, Maverick, Dominator

Quatre types de combinaisons sont disponibles. Chacune peut ensuite être personnalisée par des modifications
d'ingénierie (voir plus loin) et achetée à différents **grades**.

| Combinaison              | Rôle principal                       | Points forts                                                                                                                    | Points faibles                                                           | Équipement de départ                  |
|--------------------------|--------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|---------------------------------------|
| **Flight Suit**          | Combinaison de base, point de départ | Aucune spécialisation, universelle                                                                                              | Pas de bonus particulier                                                 | Aucun outil/arme dédié                |
| **Artemis** ("Bio Suit") | Exploration / exobiologie            | Bonnes réserves d'oxygène et d'énergie ; conçue pour de longues sessions de scan                                                | Moins résistante et moins adaptée au pillage/scavenging que la Dominator | Genetic Sampler intégré               |
| **Maverick**             | Polyvalence / infiltration           | Grande capacité de sac à dos, bonne discrétion, adaptée à un usage « à tout faire » y compris les raids de factions/settlements | Moins spécialisée que Dominator ou Artemis sur leurs domaines respectifs | Découpeur plasma (Arc Cutter) intégré |
| **Dominator**            | Combat lourd                         | Deux emplacements d'armes principales, bouclier personnel à régénération renforcée, meilleure endurance au combat               | Moins de rangement (sac à dos réduit)                                    | —                                     |

### Flight Suit — combinaison de départ, sans spécialisation

La **Flight Suit** est la combinaison par défaut de tout commandant : basique, sans bonus ni outil dédié. Elle sert
surtout de point de départ avant d'investir dans une combinaison spécialisée.

### Artemis (Bio Suit) — combinaison d'exobiologie, Genetic Sampler intégré

Orientée exploration et **exobiologie**, l'Artemis est livrée d'origine avec le **Genetic Sampler**. Elle offre une
autonomie en oxygène et une gestion énergétique supérieures aux autres combinaisons, pensées pour de longues marches de
prospection. Elle est en revanche moins résistante et moins adaptée au pillage que la Dominator. Pour la mécanique de
scan complète et le détail des espèces, voir [10-exploration.md](./10-exploration.md).

Build recommandé par la communauté : « Artemis Bio Suit » avec **Night Vision**, **Improved Jump Assist** et **Increased
Sprint Duration**, pour couvrir rapidement de grandes zones à la recherche de faune et de flore.

### Maverick — combinaison polyvalente d'infiltration, Arc Cutter intégré

La **Maverick** est la combinaison **polyvalente** d'Odyssey, souvent recommandée pour débuter. Équipée par défaut d'un découpeur plasma (Arc Cutter)
utile pour l'infiltration et le sabotage, elle offre une grande capacité de sac à dos et une discrétion supérieure. Elle
est décrite par la communauté comme la mieux adaptée aux missions de raid de factions et de settlements grâce à sa
capacité d'emport.

Builds recommandés :

- **Maverick General Purpose** — Increased Sprint Duration, Extra Backpack Capacity, Improved Battery Capacity,
  Increased Air Reserves : un profil généraliste solide.
- **Maverick Farming Suit** — Reduced Tool Battery Consumption, pour prolonger les sessions de récolte de matériaux.
- **Maverick Infiltration Suit** — Night Vision, Increased Sprint Duration, Improved Jump Assist, Extra Backpack
  Capacity : jugée la meilleure configuration pour la furtivité.

### Dominator — combinaison de combat lourd, deux armes principales

La **Dominator** est la combinaison de **combat lourd** d'Odyssey, dotée de deux emplacements pour armes principales
et d'un bouclier personnel à régénération rapide, au prix d'une capacité de rangement réduite.

Builds recommandés :

- **Dominator General Combat Suit** — Faster Shield Regen, Extra Ammo Capacity, mobilité améliorée.
- **Dominator War Suit** — Night Vision et capacité de munitions accrue, pour tenir des zones de conflit prolongées.

### Grades des combinaisons et des armes : les cinq niveaux vendus par Pioneer Supplies

Suits et armes peuvent chacun être améliorés sur **cinq niveaux de grade** auprès des vendeurs **Pioneer Supplies**,
présents dans les concourses de la plupart des stations — une mécanique distincte de l'ingénierie (voir plus loin),
puisqu'elle ne passe pas par un Engineer et ne consomme aucun emplacement de modification. Elle n'est en revanche
**pas un simple achat** : chaque palier réclame des **crédits *et* des matériaux**, et le coût augmente fortement avec
le grade. Le détail chiffré palier par palier figure dans la section « Monter une combinaison en grade : la table de
référence » ci-dessous.

Deux précisions utiles :

- Le grade de la combinaison n'a **aucune incidence sur la qualité des scans d'exobiologie** — un grade 1 suffit pour
  cette activité.
- Il est possible de trouver dans le monde des combinaisons ou armes **déjà pré-améliorées** (grade 2 ou 3 appliqué)
  plutôt que de payer soi-même la montée en grade, notamment via des drops ou des récompenses de mission — ainsi que
  via les combinaisons « premium » de grade 2 à 5 que Pioneer Supplies met occasionnellement en vente (voir la section
  suivante).

### Monter une combinaison en grade : la table de référence

La montée en grade d'une combinaison ne se règle pas qu'en crédits : elle consomme aussi **cinq composants**,
toujours les mêmes, et s'effectue au comptoir **Pioneer Supplies**. Les trois combinaisons spécialisées partagent
**exactement** la même recette, à **un seul composant près** — celui de blindage : **Aerogel** pour l'Artemis,
**Carbon Fibre Plating** pour la Maverick, **Titanium Plating** pour la Dominator. Les trois listes se ressemblant à
s'y méprendre, c'est un piège classique : vérifiez le composant de blindage avant d'engager une récolte.

#### Les quatre paliers chiffrés : la table de l'Artemis, transposable à la Maverick et à la Dominator

| Palier            | Suit Schematic | Health Monitor | Manufacturing Instructions | Aerogel | Graphene |   Crédits (Cr) | Emplacements de modification (cumul) |
|-------------------|---------------:|---------------:|---------------------------:|--------:|---------:|---------------:|-------------------------------------:|
| G1 → G2           |              1 |              1 |                          1 |       2 |        2 |        600 000 |                                    1 |
| G2 → G3           |              2 |              2 |                          2 |       5 |        5 |      2 250 000 |                                    2 |
| G3 → G4           |              4 |              4 |                          4 |       9 |        9 |      4 500 000 |                                    3 |
| G4 → G5           |              5 |              5 |                          5 |      12 |       12 |      7 500 000 |                                    4 |
| **Total G1 → G5** |         **12** |         **12** |                     **12** |  **28** |   **28** | **14 850 000** |                                **4** |

La **Maverick** et la **Dominator** suivent la même table, la colonne *Aerogel* étant remplacée respectivement par
*Carbon Fibre Plating* et *Titanium Plating* : quantités, montants en crédits et emplacements sont identiques. Ce n'est
pas une extrapolation — les douze paliers (trois combinaisons × quatre paliers) figurent tous dans les données de
référence et ont été comparés un à un.

Deux détails que la progression rend faciles à mal anticiper :

- Les quantités de Goods et de Data suivent **1, 2, 4, 5** — et non 1, 2, 3, 4. Le palier G3 → G4 double la marche
  précédente au lieu de la prolonger.
- Les **emplacements de modification** suivent **0, 1, 2, 3, 4** du G1 au G5 : une combinaison de grade 1 n'accepte
  aucune modification d'ingénieur, et il faut atteindre le grade 5 pour en poser quatre.

#### Ce que coûte l'accès à chaque grade, cumul en main plutôt que palier par palier

La table des paliers donne le prix de chaque marche ; elle ne dit pas ce qu'il faut avoir dépensé pour se tenir sur
une marche donnée. Le tableau ci-dessous recalcule ce cumul à partir des mêmes données, parce que c'est lui qui décide
d'un budget : les montants sont en crédits, et un grade 3 — souvent présenté comme le bon compromis — coûte déjà
**2 850 000 Cr**, soit un peu moins d'un cinquième du parcours complet.

| Combinaison        | Matériau de blindage propre au modèle | G1 |      G2 |        G3 |        G4 |         G5 |
|--------------------|---------------------------------------|---:|--------:|----------:|----------:|-----------:|
| **Artemis Suit**   | Aerogel                               |  0 | 600 000 | 2 850 000 | 7 350 000 | 14 850 000 |
| **Maverick Suit**  | Carbon Fibre Plating                  |  0 | 600 000 | 2 850 000 | 7 350 000 | 14 850 000 |
| **Dominator Suit** | Titanium Plating                      |  0 | 600 000 | 2 850 000 | 7 350 000 | 14 850 000 |

Le profil de dépense est fortement **convexe** : le seul palier G4 → G5 pèse 7 500 000 Cr, c'est-à-dire **plus de la
moitié des 14 850 000 Cr** du parcours entier, et davantage que les trois premiers paliers réunis (7 350 000 Cr). Une
conséquence de budget qui se lit directement dans ces chiffres : pour le prix d'une seule combinaison menée au grade 5,
on en monte **deux au grade 4** et il reste 150 000 Cr. Les trois combinaisons partagent exactement la même grille, au
matériau de blindage près.

Les emplacements de modification, eux, progressent linéairement :

| Grade de la combinaison                  | G1 | G2 | G3 | G4 | G5 |
|------------------------------------------|---:|---:|---:|---:|---:|
| Emplacements de modification disponibles |  0 |  1 |  2 |  3 |  4 |

C'est ce décalage entre une dépense convexe et un gain linéaire qui fait du grade 4 le palier de bon rapport : le
quatrième emplacement de modification se paie au prix des trois premiers.

#### Où se procurer les cinq composants, et pourquoi le barman n'en revend que deux

| Composant                      | Catégorie Odyssey |    Valeur | Où le trouver                                                                                                                                                                                                                                                               |
|--------------------------------|-------------------|----------:|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Suit Schematic**             | Good              | 50 000 Cr | Settlements High Tech et Industrial, bâtiments CMD, PWR et STO. Récompense de mission.                                                                                                                                                                                      |
| **Health Monitor**             | Good              | 10 000 Cr | Settlements Industrial, bâtiments IND, MED, RES, HAB et CMD, dans des Lockers. Seul des cinq composants attesté aussi sur épave de surface. Récompense de mission.                                                                                                          |
| **Manufacturing Instructions** | Data              |  9 000 Cr | Data ports uniquement — settlements Industrial et Extraction (Industrial, Laboratory, Satellite, Extraction Data Port), plus Irregular Markers et Impact Sites. Jusqu'à 3 par data port, et seulement dans les bâtiments de production industrielle. Récompense de mission. |
| **Aerogel**                    | Asset             |    500 Cr | Salles LAB et PROC — donc bâtiments RES, IND, EXT et AGRI — via Industrial Locker (S) et Research Locker (L). Achetable au bartender : coût 9, valeur de cession 5.                                                                                                         |
| **Graphene**                   | Asset             |  1 300 Cr | Abondant dans les bâtiments Research ; aussi AGRI, HAB et SEC. Achetable au bartender : coût 23, valeur de cession 13.                                                                                                                                                      |

Conséquence directe pour qui prépare une montée en grade : le barman **ne troque que les *Assets***. Il rachète bien
les *Goods* et les *Data* contre crédits, mais n'en revend jamais. **Suit Schematic**, **Health Monitor** (Goods) et
**Manufacturing Instructions** (Data) ne s'obtiennent donc que par pillage ou par récompense de mission — et le Suit
Schematic, le plus cher des cinq à 50 000 Cr, ne doit jamais être cédé au barman pendant une montée en grade.

> **Application de la règle, et non donnée relevée.** Les sources ne chiffrent le tarif de comptoir que pour deux
> composants, l'**Aerogel** et le **Graphene**. Que le **Carbon Fibre Plating** et le **Titanium Plating** s'achètent
> eux aussi au barman est **déduit de leur type** — ce sont des *Assets*, et le barman revend les *Assets* — et non
> relevé : aucun coût d'acquisition ni valeur de cession ne leur est attribué. Relevez leur tarif au comptoir avant de
> bâtir une session de troc sur eux.

L'arithmétique du troc vaut d'être retenue : céder un Graphene rapporte 13, un Aerogel coûte 9. **Échanger du Graphene
contre de l'Aerogel est donc rentable ; l'inverse coûte cher.**

#### Catégorie officielle et identifiant de jeu des sept composants de montée en grade

Le tableau précédent classe les composants avec le vocabulaire du **comptoir de troc** — *Good*, *Data*, *Asset* —,
qui est celui que l'interface affiche au barman. Ce n'est pas le vocabulaire du **journal de jeu**, dont les quatre
catégories officielles sont *Item*, *Component*, *Data* et *Consumable* (voir plus bas la section sur l'ingénierie à
pied). Le tableau ci-dessous met les deux en regard et ajoute l'identifiant numérique que le jeu attribue à chaque
composant : c'est cet identifiant, et non le nom traduit, qui permet de retrouver un composant sans ambiguïté dans un
outil tiers, un journal de jeu ou une base de données.

| Composant                      | Catégorie officielle (journal) | Terme de l'UI de troc | Symbole interne           | Identifiant FDev |
|--------------------------------|--------------------------------|-----------------------|---------------------------|-----------------:|
| **Suit Schematic**             | Item                           | Good                  | suitschematic             |        128962609 |
| **Health Monitor**             | Item                           | Good                  | healthmonitor             |        128961566 |
| **Manufacturing Instructions** | Data                           | Data                  | manufacturinginstructions |        128972331 |
| **Aerogel**                    | Component                      | Asset                 | aerogel                   |        128961524 |
| **Carbon Fibre Plating**       | Component                      | Asset                 | carbonfibreplating        |        128961526 |
| **Titanium Plating**           | Component                      | Asset                 | titaniumplating           |        128961549 |
| **Graphene**                   | Component                      | Asset                 | graphene                  |        128064021 |

Deux enseignements pratiques. D'abord, le mot « Asset » du comptoir recouvre exactement la catégorie officielle
**Component** : les trois matériaux de blindage et le Graphene en font partie, ce qui confirme par la structure des
données ce que la section précédente ne pouvait que déduire — **Carbon Fibre Plating et Titanium Plating sont bien
de même nature que l'Aerogel**, donc du même ressort du barman, même si leur tarif de comptoir reste à relever.
Ensuite, **Suit Schematic et Health Monitor ne sont pas des « Goods » au sens du journal** mais des *Item*, et
**Manufacturing Instructions** est bien un *Data* : c'est cette dernière ligne qui explique pourquoi ce composant
échappe au troc, les *Data* n'étant pas échangeables au comptoir.

*Sourcage : EDCD/FDevIDs, `microresources.csv`, commit c35612952dd6 — colonnes `id`, `symbol`, `category` et
`English name`. Le fichier
recense 196 micro-ressources Odyssey : 43 *Item*, 114 *Data*, 33 *Component* et 6 *Consumable*.*

Le véritable goulot d'étranglement est **Manufacturing Instructions** : il n'est ni achetable ni vendable, et Rosa
Dayette en réclame **10** pour sa tâche de recommandation vers Yi Shen — la voie Night Vision de Colonia entre donc en
**concurrence directe** avec la montée en grade des combinaisons.

> **Application de la règle, et non donnée relevée.** Le chiffre de **56 recettes** souvent avancé pour ce composant
> est un calcul, pas un relevé : trois combinaisons et onze armes, quatre paliers chacune du grade 2 au grade 5, soit
> (3 + 11) × 4 = 56. L'arithmétique est juste, mais elle repose sur un catalogue de onze armes que ce guide n'a pas pu
> établir lui-même — la section « Catalogue d'armes à pied nommées par fabricant » ci-dessous n'en documente que cinq
> avec une source, et le relevé du 10 septembre 2026 n'a pas permis de refermer l'écart. Retenez donc l'ordre de
> grandeur, à savoir que ce composant alimente la montée en grade de **tout**
> l'équipement à pied, plutôt que le nombre exact.

#### Bouclier, points de vie, sac à dos, oxygène : les caractéristiques que ce chantier n'a pas pu chiffrer

La demande d'enrichissement portait aussi sur les caractéristiques défensives et logistiques des quatre combinaisons.
Le résultat est négatif et doit être écrit comme tel :

| Caractéristique visée                  | État dans les sources locales                                                                                                                                                    |
|----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Points de bouclier personnel par grade | **Non couvert par le jeu de données** — ni `assets/data/blueprints.json`, ni FDevIDs, ni coriolis-data ne portent de statistique de combinaison                                  |
| Points de vie du commandant            | **Non couvert par le jeu de données**                                                                                                                                            |
| Capacité du sac à dos (*backpack*)     | **Non couvert par le jeu de données** — seule la modification *Extra Backpack Capacity*, qui l'augmente, est documentée                                                          |
| Réserve d'oxygène                      | **Non couvert par le jeu de données** — seule la modification *Increased Air Reserves*, qui la double, est documentée                                                            |
| Nombre d'emplacements d'armes          | **Non couvert par le jeu de données** — la seule affirmation du corpus, deux emplacements principaux sur la Dominator, est de source communautaire et non chiffrée par un relevé |
| Emplacements de modification par grade | **Couvert** — voir le tableau ci-dessus                                                                                                                                          |
| Prix de la montée en grade             | **Couvert** — voir le tableau ci-dessus, sous la réserve qui pèse sur l'origine des crédits                                                                                      |

Autrement dit, le seul jeu de données local qui décrive les combinaisons décrit leur **progression**, pas leurs
**performances**. Pour comparer une Dominator et une Maverick sur le bouclier ou le sac à dos, il faut relever les
valeurs en jeu ou consulter une base communautaire ; ce guide ne les inventera pas.

*Sourcage : `assets/data/blueprints.json` du dépôt (édition 2026-08), champ `suits` — trois combinaisons, quatre
paliers chacune ;
cumuls et vérification de l'identité des trois grilles recalculés par script le 10 septembre 2026. La réserve sur
l'origine des montants en crédits, énoncée dans l'encart plus haut, reste entière : elle porte sur les paliers
comme sur leur cumul.*

> **Réserve sur les montants en crédits.** « Les montants en crédits des paliers de combinaison viennent du wiki
> Fandom seul ; Inara n'en liste aucun. À confirmer en jeu avant de s'y fier. » Les **quantités de matériaux**, en
> revanche, sont concordantes entre Inara (`equipment-blueprint/4`) et le wiki Fandom, et les données de référence du
> dépôt les reproduisent à l'identique.

#### Récompenses de mission, Merc Coin et combinaisons « premium » : les raccourcis qui existent

À noter également : depuis le **Type-8 Update (18.08, août 2024)**, les récompenses de mission couvrent les cinq
composants, avec des quantités de l'ordre de trois à quatre fois supérieures à l'avant ; sélectionner ses missions par
récompense est devenu plus efficace que piller, ce qui rend obsolètes les guides de farm de *Power Regulators* « pour
monter une combinaison ».

Les itinéraires de récolte proprement dits — settlements en système anarchie, autorisation de sécurité prise au
Command Centre, relog sur data port, rendement horaire — relèvent du farming et sont traités dans
[26-ingenierie-a-pied-avancee.md](./26-ingenierie-a-pied-avancee.md) ; la présente section reste la fiche de référence
de l'équipement.

Deux évolutions récentes changent la donne pour la récolte de ces composants. L'update *Vanguards* (4.2.0.0,
19 août 2025) autorise le **partage de matériaux à pied entre membres d'une escadre**, ce qui invalide l'affirmation
courante selon laquelle les matériaux Odyssey ne seraient pas transférables. Et l'update *Operations* (4.4.0.0,
30 juin 2026) introduit le **Merc Coin**, monnaie gagnée en menant des Operations à leur terme, assortie d'un bonus
hebdomadaire à la première réalisation de certaines activités et non achetable en ARX.

> **Ce que le Merc Coin achète, exactement — et ce qu'il n'achète pas.** Les notes officielles du 1ᵉʳ juillet 2026
> (« Operations Update ») listent nommément le catalogue **MercGear** payable en Merc Coin : deux blueprints
> d'ingénierie (Thermal Plasma Conversion, Scoop Rate Enhanced), huit armes de hardpoint livrées déjà modifiées, deux
> distributeurs de puissance et trois modules internes — **tous des modules de vaisseau**. L'annonce du 22 avril 2026
> le disait déjà : le Merc Coin sert à acheter « Ship Modules (including weapons, core internals, optional internals)
> and Engineering Blueprints ». **Aucune annonce officielle ne mentionne d'équipement à pied achetable en Merc Coin.**
> L'étude interne qui a servi de base à cette section avance pourtant un plafond de 9 999 Merc Coin, une allocation
> hebdomadaire de 1 000 et un échange « contre de l'équipement à pied » : les deux premiers chiffres ne sont
> corroborés par aucune annonce officielle — [13-operations.md](./13-operations.md) fait référence sur le Merc Coin et
> porte la même réserve — et le troisième est contredit par elles. Ne comptez donc pas sur le Merc
> Coin pour financer une montée en grade de combinaison.

Enfin, un raccourci souvent ignoré : **Pioneer Supplies vend occasionnellement des combinaisons « premium » de grade 2
à 5**, parfois déjà modifiées. C'est le seul moyen d'acheter un grade sans farmer ; l'inventaire est renouvelé chaque
semaine, et **Jameson Memorial** (Shinrarta Dezhra) ainsi qu'**i Sola Prospect** (Brestla) offrent la sélection la plus
large.

*Sourcage : données de référence du dépôt, édition 2026-08 — paliers de montée en grade (quantités, crédits,
emplacements de modification) et fiches des cinq composants (catégorie Odyssey, valeur, provenances de terrain), toutes
deux dérivées de l'étude interne `docs/faisabilite-spansh-temps-reel-materiaux.md` § 3.2. Sources amont déclarées :
Inara `equipment-blueprint/4` et wiki Fandom, concordants sur les matériaux ; wiki Fandom seul pour les crédits.*

## Les armes à pied d'Odyssey : catégories, fabricants et builds

### Catégories et fabricants d'armes à pied (Kinematic Armaments, Manticore, Takada)

Les armes à pied se répartissent en plusieurs catégories : **pistolets, mitraillettes (SMG), fusils à pompe,
lance-roquettes, grenades**, ainsi qu'un système d'attaque à mains nues.

Trois fabricants se partagent le catalogue, chacun avec ses propres recettes d'ingénierie (matériaux distincts par
fabricant, confirmé par les pages Engineer du wiki communautaire) :

- **Kinematic Armaments**
- **Manticore**
- **Takada**

Chaque commandant reçoit une arme de poing par défaut en descendant à pied — l'équivalent, pour le combat au sol, du
vaisseau de départ Sidewinder. Les lance-roquettes et les grenades sont les munitions les plus efficaces contre le
blindage et les véhicules ; il est également possible de partager munitions et armes entre coéquipiers au sol.

### Catalogue d'armes à pied nommées par fabricant (Terminator, Executioner, Karma P-15)

Ce que le corpus sait des armes à pied tient en trois choses : le nom de quelques modèles, leur
fabricant, et deux corrections d'attribution que les billets officiels de 2026 permettent enfin de trancher. Les
statistiques de combat, elles, ne sont portées par aucune source locale — la fin de cette section dit précisément
lesquelles manquent et pourquoi.

#### Deux corrections d'attribution levées par les billets officiels de 2026

Une version antérieure de ce guide portait deux erreurs d'attribution que les billets officiels de Frontier, relevés
par [09-combat-a-pied.md](./09-combat-a-pied.md) et [13-operations.md](./13-operations.md), permettent aujourd'hui de
trancher.

**Kinematic Armaments a bien des modèles nommés.** La mention « aucun modèle nommé n'a pu être identifié » est
caduque. Le billet officiel « Elite Dangerous | Kestrel Mk. II Update » du 24 février 2026, section *On-Foot Combat
Audio Rebalance*, énumère par leur nom les armes dont l'audio a été refondu : « Manticore Executioner et Intimidator,
Karma AR-50 et P-15 ». Le billet « Lynx Highliner Update Notes » du 28 avril 2026 nomme de nouveau le **Karma AR-50**
et le **P-15**. La **famille Karma** est donc attestée par la source la plus haute qui soit — l'éditeur du jeu.

**Le Karma P-15 appartient à Kinematic Armaments, et non à Takada.** L'attribution à Takada portée jusqu'ici par ce
guide provenait d'un guide de builds tiers (gamerant.com). Elle est contredite par deux fiches du corpus qui, elles,
rattachent explicitement la famille Karma à Kinematic Armaments : [09-combat-a-pied.md](./09-combat-a-pied.md) décrit
ce fabricant comme celui des « pistolets et fusils cinétiques (dont la famille Karma) », et
[13-operations.md](./13-operations.md) attribue nommément le Karma P15 Infiltrator et le Karma P15 Warfighter à
Kinematic Armaments. **L'arbitrage retenu est Kinematic Armaments** : deux fiches concordantes du corpus, adossées aux
billets officiels, l'emportent sur un guide de builds isolé. Aucun modèle nommé n'est en revanche rattaché à **Takada**
par une source consultable — c'est désormais ce fabricant-là, et non Kinematic Armaments, qui reste sans catalogue.

#### Les cinq armes à pied nommées par une source, avec leur fabricant corrigé

Le tableau ci-dessous ne retient que les modèles dont le nom apparaît dans une source citable, avec l'attribution
corrigée ci-dessus. Il ne prétend pas à l'exhaustivité : aucun des jeux de données locaux du dépôt ne porte de
catalogue d'armes à pied (voir la mise en garde méthodologique plus bas).

| Arme                      | Fabricant           | Type                      | Type de dégâts            | Source                                                                                                                                                       |
|---------------------------|---------------------|---------------------------|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Karma P-15**            | Kinematic Armaments | Pistolet                  | Cinétique                 | Billet officiel Frontier « Kestrel Mk. II Update » (24 février 2026), section *On-Foot Combat Audio Rebalance*, relayé par [09-combat-a-pied.md](./09-combat-a-pied.md)             |
| **Karma AR-50**           | Kinematic Armaments | Fusil d'assaut            | Cinétique                 | Billets officiels Frontier « Kestrel Mk. II Update » (24 février 2026) et « Lynx Highliner Update Notes » (28 avril 2026), relayés par [09-combat-a-pied.md](./09-combat-a-pied.md) |
| **Manticore Executioner** | Manticore           | Fusil de précision        | Plasma                    | Billets officiels Frontier des 24 février et 28 avril 2026, relayés par [09-combat-a-pied.md](./09-combat-a-pied.md) ; rôle confirmé par gamerant.com                               |
| **Manticore Intimidator** | Manticore           | Non précisé par la source | Non précisé par la source | Billet officiel Frontier « Kestrel Mk. II Update » (24 février 2026), relayé par [09-combat-a-pied.md](./09-combat-a-pied.md)                                                       |
| **Manticore Terminator**  | Manticore           | Fusil polyvalent          | Plasma                    | gamerant.com (guide de builds), relayé par [13-operations.md](./13-operations.md)                                                                                                |

**Ce que ce tableau ne dit pas.** Le **Manticore Intimidator** n'est cité par le billet officiel que dans une liste
d'armes retravaillées côté audio : ni son type ni son type de dégâts n'y figurent, et rien ne permet de les déduire
sans risque. Le nombre total d'armes du jeu n'est pas davantage établi : le calcul des 56 recettes reproduit plus haut
suppose onze armes, ce guide n'en documente que cinq, et aucune source locale ne permet de trancher entre les deux.

#### Statistiques de combat des armes à pied : ce qu'aucune source locale ne porte

Il faut le dire nettement plutôt que de le combler. Les colonnes qu'un catalogue d'armes devrait porter —
**dégâts par tir, cadence de tir, DPS, capacité du chargeur et de la réserve, portée nominale, efficacité relative
contre bouclier et contre blindage, prix par grade 1 à 5** — **ne figurent dans aucune des sources locales et
reproductibles de ce chantier**, et ce constat a été vérifié fichier par fichier :

| Source locale examinée                          | Ce qu'elle contient                                                                                                                                                                   | Armes à pied ?                                                                                                                                |
|-------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| EDCD/coriolis-data, commit 0db9234b5b9c         | 47 vaisseaux, modules `standard`, `internal` et `hardpoints`, blueprints d'ingénierie de vaisseau                                                                                     | **Non** — outil de build de vaisseaux ; ses `hardpoints` sont des armes de vaisseau, à ne surtout pas confondre avec les armes de combinaison |
| EDCD/FDevIDs, commit c35612952dd6               | `outfitting.csv` (modules de vaisseau, catégories `hardpoint`, `internal`, `mercgear`, `standard`, `utility`), `shipyard.csv`, `commodity.csv`, `microresources.csv`, tables de rangs | **Non** — aucune ligne de combinaison ni d'arme à pied ; seuls les micro-ressources et consommables Odyssey y figurent                        |
| `assets/data/blueprints.json` (édition 2026-08) | 5 blueprints d'ingénierie de vaisseau, plus les paliers de montée en grade des trois combinaisons                                                                                     | **Non** pour les armes                                                                                                                        |
| `assets/data/materials.json` (édition 2026-08)  | 115 matériaux de vaisseau et leurs provenances                                                                                                                                        | **Non**                                                                                                                                       |

Une table complète mais inventée serait pire qu'une table partielle et honnête : ces colonnes restent donc vides, et
c'est la conclusion du chantier, pas un oubli. Pour les obtenir, il faut une base communautaire qui relève les
statistiques en jeu (Inara, wiki Elite Dangerous), dont ce dépôt ne conserve pas de copie locale.

#### La portée des armes silencieuses, seule valeur d'arme chiffrée par une annonce officielle

Un unique chiffre d'arme à pied est adossé à une annonce officielle, et il vaut d'être retenu parce qu'il change un
choix de build : le billet « Elite Dangerous | Lynx Highliner Update Notes » du **28 avril 2026** fait passer la
**portée des armes silencieuses de 40 à 128 mètres**, soit une multiplication par **3,2**, pour les aligner sur les
autres armes — elle reste toutefois inférieure à celle des armes non silencieuses. Avant cette date, monter un
**Noise Suppressor** ou un **Audio Masking** revenait à accepter une arme utilisable à 40 mètres à peine ; depuis, le
compromis furtivité/portée est bien moins pénalisant pour les builds d'infiltration décrits plus bas.

*Sourcage : billets officiels Frontier « Elite Dangerous | Kestrel Mk. II Update » (24 février 2026, 12:21 UTC) et
« Elite Dangerous | Lynx Highliner Update Notes » (28 avril 2026, 13:11 UTC), relevés et cités par
[09-combat-a-pied.md](./09-combat-a-pied.md) ; attribution des fabricants recoupée dans
[13-operations.md](./13-operations.md). Absence de données d'armes à pied vérifiée par script dans
EDCD/coriolis-data commit 0db9234b5b9c, EDCD/FDevIDs commit c35612952dd6, `assets/data/blueprints.json` et
`assets/data/materials.json`. Instantané : 10 septembre 2026.*

### Pas d'arme de mêlée dédiée : le corps-à-corps à pied se fait à mains nues

Il n'existe pas d'arme de corps-à-corps à proprement parler : le combat rapproché se fait via une **attaque à mains
nues**, disponible quel que soit le loadout équipé. Cette mécanique reste améliorable par ingénierie : la modification
de combinaison **Added Melee Damage** (proposée par Jude Navarro et Kit Fowler) « augmente fortement les dégâts des
coups de poing et des attaques de corps-à-corps à l'arme », confirmant que le mêlée est un système à mains nues/à crosse
d'arme et non une arme séparée.

### Exemples de builds d'armes à pied nommés par la communauté

| Build                                | Arme de base            | Usage                                   | Modifications typiques                                                          |
|--------------------------------------|--------------------------|------------------------------------------|-----------------------------------------------------------------------------------|
| **Manticore Terminator**             | Fusil plasma polyvalent | Combat généraliste                      | Vitesse de rechargement, portée, précision, capacité du chargeur                |
| **Manticore Executioner**            | Fusil plasma sniper     | Élimination discrète à distance         | Dégâts à la tête, portée, suppression du bruit                                  |
| **Karma P15 Infiltrator**            | Pistolet cinétique      | Infiltration silencieuse                | Masquage audio + suppresseur, pour neutraliser des PNJ sans déclencher l'alarme |
| **Karma P15 Warfighter**             | Pistolet cinétique      | Achever des ennemis sans bouclier       | Visée rapide, portée, chargeur agrandi                                          |
| **Manticore Executioner Warfighter** | Fusil plasma sniper     | Zones de conflit à haut dégât           | Build offensif dédié aux CZ                                                      |
| **Lance-roquettes Warfighter**       | Lance-roquettes         | Dégâts de zone contre groupes d'ennemis | Portée, capacité de chargeur, rechargement en étui                              |

Pour une liste exhaustive de tous les modèles disponibles par fabricant, référez-vous à une base de données
communautaire à jour (Inara, wiki Elite Dangerous) — le catalogue complet évolue et n'est pas repris intégralement ici.

## Les outils à pied : Genetic Sampler, Arc Cutter, Wave Scanner, Profile Analyser, Compact Multi-Tool, E-Break

Les outils sont équipés dans l'emplacement dédié de la combinaison et consomment de l'énergie à l'usage. Le plus
documenté et le mieux maîtrisé par la communauté est le Genetic Sampler ; les autres remplissent des rôles
complémentaires de reconnaissance, de piratage et d'accès forcé, résumés ci-dessous à partir de leur fonction
généralement admise dans le jeu — pour les statistiques précises (portée, consommation de batterie), consultez Inara.cn
ou le wiki communautaire Elite Dangerous.

### Genetic Sampler (échantillonneur génétique)

Le **Genetic Sampler** est l'outil central de l'**exobiologie** à pied, livré par défaut avec la combinaison Artemis
et activable avec la touche **5**. Fonctionnement en deux temps :

1. Une **impulsion de détection** (scan pulse) colore les organismes détectés :
    - **bleu** — organisme génétiquement trop proche (même colonie clonale) : à éviter pour un nouvel échantillon ;
    - **vert** — même espèce mais diversité génétique suffisante : échantillon valide ;
    - **violet** — espèce différente.
2. Le Codex indique une **distance de colonie clonale** à respecter entre deux prélèvements, variable selon le type
   d'organisme (courte pour les touffes/buissons, plus longue pour les colonies bactériennes).

Il faut prélever **trois échantillons partiels** de la même espèce, suffisamment espacés géographiquement, pour obtenir
un échantillon complet. Prélever un échantillon d'une espèce différente en cours de route **réinitialise la
progression** de l'échantillon partiel en cours. Le grade de la combinaison Artemis n'a aucune incidence sur la qualité
du scan.

Pour repérer les zones biologiques avant d'atterrir, on utilise en complément le **Detailed Surface Scanner (DSS)** et
le **FSS** du vaisseau (des outils de scan spatial, pas des outils à pied). Le détail complet des espèces, rangs
d'exobiologiste et primes de première découverte est traité dans [10-exploration.md](./10-exploration.md) ; ce guide-ci
ne résume que la mécanique de l'outil lui-même.

Vente des échantillons aux comptoirs **Vista Genomics** dans les stations : de 50 000 à 1 000 000 Cr par échantillon
selon la rareté, avec une **prime doublée pour la première découverte** *(fourchette de prix instantanée capturée le
9 septembre 2026 — à revérifier sur Inara ou en jeu, ces valeurs pouvant évoluer avec les mises à jour économiques)*.
Selon un guide communautaire de 2025, une session sur deux planètes comportant huit espèces peut rapporter jusqu'à
environ 250 millions de crédits en deux heures grâce aux primes de première découverte, en particulier à plus de
1 500 années-lumière des zones peuplées où la faune découverte est plus susceptible d'être une première mondiale — ce
chiffre reste une estimation communautaire ponctuelle, pas une moyenne garantie.

### Arc Cutter (découpeur plasma) — ouverture forcée des accès

L'**Arc Cutter** est livré par défaut avec la combinaison Maverick ; il sert à découper des points d'accès, panneaux et portes verrouillées
par la force plutôt que par le piratage électronique — une alternative « brute » au Compact Multi-Tool, utile notamment
lorsque le piratage n'est pas souhaitable ou possible.

### Wave Scanner — outil de reconnaissance des points d'intérêt

Le **Wave Scanner** est un outil de reconnaissance à courte/moyenne portée : il émet une impulsion qui révèle sur le HUD les points d'intérêt
proches à l'intérieur d'une installation (terminaux, générateurs, personnel, conteneurs), permettant de repérer des
objectifs avant de s'en approcher.

### Profile Analyser — analyse des points d'accès avant piratage

Le **Profile Analyser** s'utilise sur les points d'accès électroniques (terminaux, panneaux de sécurité, ports de données) pour en analyser le
profil avant de tenter un piratage avec le Compact Multi-Tool — une étape de reconnaissance qui facilite ou sécurise la
tentative de bypass qui suit.

### Compact Multi-Tool — outil de piratage des panneaux et terminaux

Le **Compact Multi-Tool** est l'outil de piratage proprement dit, utilisé sur les panneaux d'accès et terminaux pour contourner leur sécurité
électronique (via un mini-jeu chronométré) et ainsi débloquer des portes, coffres ou données.

### E-Break (outil de forçage d'urgence) — accès sans alimentation

L'**E-Break** est l'outil de secours permettant de forcer l'ouverture d'une porte ou d'un panneau lorsque l'installation est privée
d'alimentation (par exemple lors d'une infiltration en coupant le courant/« silent running »), dans les cas où le
piratage électronique normal via le Profile Analyser et le Compact Multi-Tool n'est plus possible.

> **Son nom exact en jeu est « E-Breach ».** La table d'identifiants extraite du jeu le référence sous l'entrée
> `bypass`, identifiant **128961251**, nom affiché **E-Breach**, catégorie *Consumable* — et non *Item*. Aucune
> entrée « E-Break » n'y existe. L'orthographe « E-Break » est conservée dans les titres de cette section parce que
> d'autres guides du corpus y pointent par ancre, mais c'est « E-Breach » qu'il faut chercher dans un inventaire ou
> dans un outil tiers. Voir la section « Les six consommables du jeu, sous leur nom exact et leur identifiant »
> plus bas. *Sourcage : EDCD/FDevIDs, `microresources.csv`, commit c35612952dd6.*

### Modifications et montée en grade des outils à pied

| Outil                | Amélioration disponible                    | Effet documenté / attendu                                                                                  | Modification par un Engineer ?              |
|-----------------------|---------------------------------------------|---------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| **Wave Scanner**      | Montée en grade (achat Pioneer Supplies)    | Amélioration générale de la portée et/ou de la rapidité de détection des points d'intérêt                     | Non confirmée dans les sources consultées     |
| **Profile Analyser**  | Montée en grade (achat Pioneer Supplies)    | Amélioration de la portée et de la fiabilité d'analyse avant piratage                                          | Non confirmée dans les sources consultées     |
| **Compact Multi-Tool**| Montée en grade (achat Pioneer Supplies)    | Amélioration possible du temps ou de la marge de manœuvre du mini-jeu de piratage                              | Non confirmée dans les sources consultées     |
| **E-Break**           | Aucune montée en grade identifiée           | Outil de forçage de base ; aucune information de montée en grade ou de modification retrouvée                 | Non confirmée dans les sources consultées     |

**Limite de recherche** : à la différence des combinaisons et des armes (grades 1-5 achetés chez Pioneer Supplies,
puis modifications d'ingénierie chez les Engineers, voir la section suivante), la documentation communautaire
accessible pendant la rédaction de ce guide (edfieldmanual.com, starzen.space, gamingwithdaopa.ellatha.com — toutes
consultées le 9 septembre 2026) ne confirme ni l'existence de blueprints d'Engineer dédiés à ces quatre outils, ni le
détail exact de leurs paliers de grade. Si votre expérience en jeu diffère, ou si vous disposez d'une source à jour,
consultez et complétez ce tableau via Inara ou le wiki communautaire Elite Dangerous plutôt que de vous fier à des
valeurs non vérifiées.

## Les consommables à pied : Medkit, Energy Cell et grenades

Le commandant à pied dispose d'objets consommables pour soutenir sa survie et son efficacité au combat, obtenus par
pillage, par achat, ou fabriqués sur le terrain via le système de **synthèse** (une variante à pied de la synthèse
embarquée des vaisseaux, à partir de matériaux collectés).

### Les six consommables du jeu, sous leur nom exact et leur identifiant

La liste des consommables à pied n'est pas une approximation : la table d'identifiants extraite du jeu en recense
**exactement six**, ni plus ni moins. Les voici, avec le nom affiché en jeu — celui qu'il faut chercher dans un
inventaire — et l'identifiant numérique qui lève toute ambiguïté.

| Consommable (nom en jeu) | Symbole interne    | Identifiant FDev | Ce qu'il fait                                                                                  |
|--------------------------|--------------------|-----------------:|------------------------------------------------------------------------------------------------|
| **E-Breach**             | bypass             |        128961251 | Outil de forçage d'accès consommable : le nom exact est « E-Breach », et non « E-Break ».      |
| **Energy Cell**          | energycell         |        128941245 | Recharge la batterie de la combinaison (bouclier personnel, outils, mobilité).                 |
| **Frag Grenade**         | amm_grenade_frag   |        128951162 | Grenade à fragmentation : dégâts de zone contre l'infanterie.                                  |
| **Medkit**               | healthpack         |        128932270 | Rend des points de vie au commandant.                                                          |
| **Shield Disruptor**     | amm_grenade_emp    |        128951161 | Grenade anti-bouclier : c'est elle que la communauté appelle à tort « EMP Grenade ».           |
| **Shield Projector**     | amm_grenade_shield |        128951163 | Grenade déployant une bulle de bouclier — troisième grenade, absente de la plupart des guides. |

**Trois corrections de vocabulaire tombent de ce relevé**, et elles comptent parce que les guides communautaires
emploient massivement les mauvais noms :

- Il n'existe **aucun consommable appelé « EMP Grenade »**. La grenade anti-bouclier s'appelle **Shield Disruptor**
  en jeu, même si son symbole interne, `amm_grenade_emp`, trahit son ascendance électromagnétique. C'est ce nom que
  reprennent les notes officielles de refonte audio du 24 février 2026.
- Une **troisième grenade** existe, absente de la plupart des guides et de toutes les versions antérieures de
  celui-ci : le **Shield Projector** (`amm_grenade_shield`), qui déploie une bulle de bouclier au lieu d'en détruire
  une.
- L'outil de forçage d'accès s'appelle **E-Breach**, et non « E-Break » : le symbole interne `bypass` confirme qu'il
  s'agit d'un contournement d'accès. Le titre de la section « Les outils à pied » plus haut et son sous-titre
  conservent l'orthographe « E-Break » pour ne pas casser les liens entrants d'autres guides du corpus, mais
  **c'est bien « E-Breach » qu'il faut chercher en jeu**. Notez aussi que le jeu le classe en *Consumable*, et non
  comme un outil d'emplacement au même titre que le Genetic Sampler ou l'Arc Cutter.

Pour les recettes de synthèse exactes (matériaux requis, quantités produites), consultez le wiki communautaire ou
l'outil tiers **Elite Dangerous Odyssey Material Helper (EDOMH)** : la table d'identifiants du jeu nomme et compte les
consommables, mais ne porte aucune recette de synthèse.

*Sourcage : EDCD/FDevIDs, `microresources.csv`, commit c35612952dd6 — les six lignes de catégorie `Consumable`,
reproduites sans
sélection ni ajout. Décompte refait par script le 10 septembre 2026.*

## L'ingénierie à pied (Engineering) d'Odyssey : Engineers, blueprints et modifications irréversibles

### Mécanique générale de l'ingénierie à pied : Engineers physiques et modifications irréversibles

- Les modifications s'appliquent **chez des Engineers physiques**, dans des starports : il faut sortir de son vaisseau
  et se rendre à leur emplacement, contrairement à l'ingénierie des vaisseaux qui se fait depuis le vaisseau (mécanique
  générale de l'ingénierie de vaisseau détaillée dans [06-ingenieurs.md](./06-ingenieurs.md)).
- **Une modification appliquée ne peut ni être retirée ni remplacée** : la planification du build est cruciale avant
  d'engager des matériaux.
- Les matériaux à pied relèvent des quatre catégories officielles du journal de jeu : **Item, Component, Data,
  Consumable** — à ne pas confondre avec les catégories Raw/Manufactured/Encoded, réservées aux matériaux de vaisseau.
  Les termes **Chemical, Circuit et Tech**, employés par l'UI et la communauté, ne sont pas des catégories officielles
  mais une subdivision interne de `Component` : c'est entre ces trois sous-catégories, et elles seules, que l'échange
  se fait via les barmen des stations. Les **Data** ne sont pas échangeables et s'obtiennent uniquement via des
  missions ou des points de données in-game. La taxonomie complète et les règles d'échange sont arbitrées dans
  [26 — Ingénierie à pied avancée](./26-ingenierie-a-pied-avancee.md).
- La méthode principale de collecte de matériaux consiste à compléter des **missions** proposées aux terminaux à pied
  des stations — l'offre variant d'une station à l'autre, il est utile de vérifier plusieurs tablettes.
- Outil tiers recommandé par la communauté : **Elite Dangerous Odyssey Material Helper (EDOMH)**, pour suivre son
  inventaire de matériaux et planifier ses montées en grade.

### Les treize Engineers à pied : neuf dans la bulle Core, quatre à Colonia

Neuf Engineers sont présents dans la bulle « Core », répartis en trois chaînes de déblocage (chaque Engineer débloque
l'accès au suivant), auxquels s'ajoutent quatre Engineers dans la région de Colonia. Ces derniers suivent une structure
de déblocage différente : Baltanos, Eleanor Bresa et Rosa Dayette fonctionnent chacun de façon indépendante, et c'est en
complétant **les trois** tâches de recommandation qu'ils proposent (livraison de matériaux/données spécifiques à chacun)
que l'accès à Yi Shen à Einheriar s'ouvre — il ne s'agit donc pas d'une chaîne séquentielle mais d'une convergence des
trois vers un seul déblocage commun.

| Engineer        | Système   | Groupe          | Position dans la chaîne           | Spécialités suit                                                                     | Spécialités arme                                           |
|------------------|-----------|-----------------|-------------------------------------|-----------------------------------------------------------------------------------------|---------------------------------------------------------------|
| Hero Ferrari    | Sirius    | Chaîne 1 (Core) | 1er                               | Increased Air Reserves, Increased Sprint Duration, Improved Jump Assist              | Noise Suppressor, Faster Handling                          |
| Wellington Beck | Jolapa    | Chaîne 1 (Core) | 2e                                | Extra Backpack Capacity, Improved Battery Capacity, Reduced Tool Battery Consumption | Greater Range, Scope                                       |
| Uma Laszlo      | Xuane     | Chaîne 1 (Core) | 3e                                | Damage Resistance, Faster Shield Regen                                               | Headshot Damage, Reload Speed, Stowed Reloading            |
| Jude Navarro    | Aurai     | Chaîne 2 (Core) | 1er                               | Added Melee Damage, Extra Ammo Capacity                                              | Reload Speed, Magazine Size                                |
| Terra Velasquez | Shou Xing | Chaîne 2 (Core) | 2e                                | Combat Movement Speed, Increased Air Reserves, Increased Sprint Duration             | Improved Hip Fire Accuracy, Noise Suppressor               |
| Oden Geiger     | Candiaei  | Chaîne 2 (Core) | 3e                                | Improved Battery Capacity, Enhanced Tracking, Night Vision                           | Scope, Stability                                            |
| Domino Green    | Orishis   | Chaîne 3 (Core) | 1er                               | Extra Backpack Capacity, Reduced Tool Battery Consumption, Enhanced Tracking         | Greater Range, Stability                                    |
| Kit Fowler      | Capoya    | Chaîne 3 (Core) | 2e                                | Faster Shield Regen, Added Melee Damage, Extra Ammo Capacity                         | Stowed Reloading, Magazine Size                             |
| Yarden Bond     | Bayan     | Chaîne 3 (Core) | 3e                                | Combat Movement Speed, Improved Jump Assist, Quieter Footsteps                       | Improved Hip Fire Accuracy, Audio Masking, Faster Handling  |
| Baltanos        | Deriso    | Colonia         | Convergent → Yi Shen              | Improved Jump Assist, Increased Sprint Duration                                      | Non couvert par le jeu de données                          |
| Eleanor Bresa   | Desy      | Colonia         | Convergent → Yi Shen              | Non couvert par le jeu de données                                                    | Non couvert par le jeu de données                          |
| Rosa Dayette    | Kojeara   | Colonia         | Convergent → Yi Shen              | Improved Battery Capacity, Extra Backpack Capacity, Reduced Tool Battery Consumption | Non couvert par le jeu de données                          |
| Yi Shen         | Einheriar | Colonia         | Débloqué par les trois précédents | Night Vision                                                                         | Non couvert par le jeu de données                          |

*Les spécialités des Engineers de Colonia, laissées vides dans une version antérieure de ce tableau, sont ici
reconstituées par transposition de la table « modification → ingénieurs » de la note interne : celle-ci atteste
Rosa Dayette sur Improved Battery Capacity, Extra Backpack Capacity et Reduced Tool Battery Consumption, Baltanos sur
Improved Jump Assist et Increased Sprint Duration, et Yi Shen sur Night Vision — Oden Geiger et Yi Shen étant
« bien les deux seuls » à proposer cette dernière. Eleanor Bresa n'apparaît dans aucune des lignes vérifiées : ses
spécialités sont donc **non couvertes par le jeu de données**, et non « inexistantes ». Le volet armes des quatre
Engineers de Colonia n'est pas davantage couvert. Source : `docs/faisabilite-spansh-temps-reel-materiaux.md` § 3.2
(colonne « Vérifié » de la table des listes d'ingénieurs par modification).*

### Un « effet expérimental » à pied ? Précision méthodologique sur l'ingénierie Odyssey

Sur les vaisseaux, l'ingénierie des modules distingue un **effet primaire** (le blueprint gradué G1-G5) d'un **effet
expérimental** optionnel qui vient s'y ajouter (voir [06-ingenieurs.md](./06-ingenieurs.md)). Un audit de ce guide a
soulevé la question d'un mécanisme équivalent côté équipement à pied. Après vérification auprès des sources
communautaires accessibles (starzen.space, edfieldmanual.com), **aucune preuve d'un second emplacement d'effet
expérimental distinct n'a pu être établie pour les suits et les armes d'Odyssey** : le seul mécanisme confirmé est
qu'une combinaison ou une arme dispose d'un nombre de **emplacements de modification** (jusqu'à quatre selon le grade
de l'objet) dans lesquels on peut appliquer, une par une, les modifications listées dans les tables ci-dessous — sans
distinction primaire/expérimental. Les colonnes « Effet expérimental » ci-dessous sont donc conservées à titre
d'inventaire de vérification (elles indiquent « non applicable / non confirmé ») plutôt que remplies de valeurs
inventées ; si une source fiable vient confirmer l'existence d'un tel mécanisme, il faudra revenir compléter ces
tables.

### Modifications de combinaison (blueprints) : les quatorze effets et leurs Engineers

| Modification                     | Effet                                                                                   | Engineer(s) — source d'obtention                | Grade des matériaux                          | Effet expérimental        | Coût         |
|-----------------------------------|--------------------------------------------------------------------------------------------|----------------------------------------------------|-------------------------------------------------|-------------------------------|---------------|
| Damage Resistance                | −10 % de dégâts cinétiques, thermiques, plasma et explosifs (chacun)                    | Uma Laszlo (Xuane)                                 | Non détaillé par palier dans les sources consultées | Non confirmé (voir note ci-dessus) | 750 000 Cr   |
| Faster Shield Regen              | Environ +25 % de régénération du bouclier personnel                                     | Uma Laszlo (Xuane) / Kit Fowler (Capoya)           | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Extra Backpack Capacity          | Augmente la capacité d'inventaire et de consommables du sac à dos (Data/Component/Item) | Domino Green (Orishis) / Wellington Beck (Jolapa) / Rosa Dayette (Kojeara) | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Improved Battery Capacity        | +50 % de capacité énergétique                                                           | Wellington Beck (Jolapa) / Oden Geiger (Candiaei) / Rosa Dayette (Kojeara) | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Reduced Tool Battery Consumption | Réduit la consommation d'énergie des outils                                             | Domino Green (Orishis) / Wellington Beck (Jolapa) / Rosa Dayette (Kojeara) | Non détaillé par palier                          | Non confirmé                    | 500 000 Cr   |
| Enhanced Tracking                | Augmente la portée et la vitesse du scan de base de la combinaison                      | Domino Green (Orishis) / Oden Geiger (Candiaei)    | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Night Vision                     | Ajoute la vision nocturne                                                               | Oden Geiger (Candiaei) / Yi Shen (Einheriar) — les deux seuls | Non détaillé par palier                          | Non confirmé                    | 1 000 000 Cr |
| Added Melee Damage               | Augmente fortement les dégâts à mains nues et en corps-à-corps à l'arme                 | Jude Navarro (Aurai) / Kit Fowler (Capoya)         | Non détaillé par palier                          | Non confirmé                    | 500 000 Cr   |
| Extra Ammo Capacity              | +50 % de capacité de munitions                                                          | Jude Navarro (Aurai) / Kit Fowler (Capoya)         | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Combat Movement Speed            | Supprime le malus de vitesse en visée ADS                                               | Terra Velasquez (Shou Xing) / Yarden Bond (Bayan)  | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Increased Air Reserves           | Double les réserves d'oxygène d'urgence                                                 | Hero Ferrari (Sirius) / Terra Velasquez (Shou Xing)| Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Increased Sprint Duration        | Réduit la pénalité d'épuisement au sprint prolongé                                      | Hero Ferrari (Sirius) / Terra Velasquez (Shou Xing) / Baltanos (Deriso) | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Improved Jump Assist             | Allonge la durée du saut assisté (jetpack)                                              | Hero Ferrari (Sirius) / Yarden Bond (Bayan) / Baltanos (Deriso) | Non détaillé par palier                          | Non confirmé                    | 750 000 Cr   |
| Quieter Footsteps                | −50 % de portée audible des pas                                                         | Yarden Bond (Bayan)                                | Non détaillé par palier                          | Non confirmé                    | 1 000 000 Cr |

*Coûts capturés le 9 septembre 2026 sur les sources communautaires listées en fin de guide — à revérifier auprès du
Pioneer Supplies/Engineer local, ces montants pouvant être ajustés par Frontier au fil des patchs. La colonne « Grade
des matériaux » reste volontairement non chiffrée : aucune source accessible pendant la rédaction ne détaille de
palier G1-G5 par blueprint pour l'équipement à pied (contrairement aux modules de vaisseau) ; utilisez l'outil EDOMH
pour la liste précise des matériaux requis par modification.*

*Contrôle croisé : six de ces montants ont été revérifiés indépendamment et sont confirmés exacts — Improved Battery
Capacity, Extra Backpack Capacity, Improved Jump Assist et Increased Sprint Duration à 750 000 Cr, Reduced Tool
Battery Consumption à 500 000 Cr, Night Vision à 1 000 000 Cr. Les huit autres montants du tableau n'ont pas été
recoupés par cette source. Source : `docs/faisabilite-spansh-temps-reel-materiaux.md` § 3.2.*

### Modifications d'armes (blueprints)

Les matériaux requis varient selon le fabricant de l'arme (Kinematic Armaments, Manticore ou Takada) — par exemple,
pour la modification Headshot Damage, Uma Laszlo demande des matériaux totalement différents selon que l'arme provient
de Kinematic Armaments (Weapon Test Data, Medical Records, Chemical Catalyst, RDX, Weapon Component), de Manticore
(Chemical Experiment Data, Blood Test Results, Ion Battery, Electromagnet, Micro Supercapacitor) ou de Takada
(Spectral Analysis Data, Biometric Data, Ion Battery, Optical Lens, Scrambler).

| Modification               | Effet                                                                          | Engineer(s) — source d'obtention                     | Grade des matériaux | Effet expérimental |
|------------------------------|-------------------------------------------------------------------------------|----------------------------------------------------------|-------------------------|-------------------------|
| Headshot Damage            | Augmente les dégâts aux tirs à la tête                                         | Uma Laszlo (Xuane)                                       | Non détaillé par palier | Non confirmé (voir note) |
| Greater Range               | Jusqu'à +50 % de portée effective                                              | Wellington Beck (Jolapa) / Domino Green (Orishis)        | Non détaillé par palier | Non confirmé            |
| Scope                       | Ajoute ou améliore une optique de visée                                        | Wellington Beck (Jolapa) / Oden Geiger (Candiaei)        | Non détaillé par palier | Non confirmé            |
| Improved Hip Fire Accuracy | Jusqu'à +45 % de précision en tir de hanche                                    | Terra Velasquez (Shou Xing) / Yarden Bond (Bayan)        | Non détaillé par palier | Non confirmé            |
| Stability                   | Jusqu'à +30 % de stabilité, réduit le recul                                    | Domino Green (Orishis) / Oden Geiger (Candiaei)          | Non détaillé par palier | Non confirmé            |
| Noise Suppressor            | Réduit le bruit en environnement pressurisé                                    | Hero Ferrari (Sirius) / Terra Velasquez (Shou Xing)      | Non détaillé par palier | Non confirmé            |
| Audio Masking               | Réduit le bruit en environnement non pressurisé — essentiel pour la discrétion | Yarden Bond (Bayan)                                       | Non détaillé par palier | Non confirmé            |
| Faster Handling             | Réduit le temps de dégainage/rangement, améliore la visée ADS                  | Hero Ferrari (Sirius) / Yarden Bond (Bayan)              | Non détaillé par palier | Non confirmé            |
| Reload Speed                | Réduit le temps de rechargement                                                | Uma Laszlo (Xuane) / Jude Navarro (Aurai)                | Non détaillé par palier | Non confirmé            |
| Stowed Reloading            | Recharge automatique quand l'arme est rangée                                   | Uma Laszlo (Xuane) / Kit Fowler (Capoya)                 | Non détaillé par palier | Non confirmé            |
| Magazine Size               | Augmente la capacité du chargeur                                               | Jude Navarro (Aurai) / Kit Fowler (Capoya)               | Non détaillé par palier | Non confirmé            |

Noise Suppressor et Audio Masking sont respectivement facturés autour de 1 000 000 Cr *(capturé le 9 septembre 2026)*,
cohérent avec le tarif des modifications de discrétion côté combinaison.

#### Matrice des onze modifications d'armes par fabricant : les recettes réellement relevées

Une même modification d'arme ne demande pas les mêmes matériaux selon le fabricant de l'arme sur laquelle on
l'applique : onze modifications, trois fabricants, donc **trente-trois recettes distinctes**. La matrice ci-dessous
les pose toutes et remplit celles pour lesquelles une recette a été effectivement relevée — **six sur trente-trois**.
Les vingt-sept autres ne sont pas oubliées : elles ne sont couvertes par aucune source consultable, et c'est ce que
dit la cellule.

| Modification d'arme        | Kinematic Armaments                                                                     | Manticore                                                                                      | Takada                                                                                            |
|----------------------------|-----------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| Headshot Damage            | Weapon Test Data, Medical Records, Chemical Catalyst, RDX, Weapon Component             | Chemical Experiment Data, Blood Test Results, Ion Battery, Electromagnet, Micro Supercapacitor | Spectral Analysis Data, Biometric Data, Ion Battery, Optical Lens, Scrambler                      |
| Greater Range              | 10 Ballistics Data, 10 Topographical Surveys, 10 Metal Coil, 10 RDX, 5 Weapon Component | 10 Chemical Formulae, 15 Mineral Survey, 10 Motor, 10 Electromagnet, 5 Electrical Fuse         | 5 Stellar Activity Logs, 8 Risk Assessments, 8 Micro Transformer, 3 Optical Lens, 3 Circuit Board |
| Scope                      | Non couvert par les sources                                                             | Non couvert par les sources                                                                    | Non couvert par les sources                                                                       |
| Improved Hip Fire Accuracy | Non couvert par les sources                                                             | Non couvert par les sources                                                                    | Non couvert par les sources                                                                       |
| Stability                  | Non couvert par les sources                                                             | Non couvert par les sources                                                                    | Non couvert par les sources                                                                       |
| Noise Suppressor           | Non couvert par les sources                                                             | Non couvert par les sources                                                                    | Non couvert par les sources                                                                       |
| Audio Masking              | Non couvert par les sources                                                             | Non couvert par les sources                                                                    | Non couvert par les sources                                                                       |
| Faster Handling            | Non couvert par les sources                                                             | Non couvert par les sources                                                                    | Non couvert par les sources                                                                       |
| Reload Speed               | Non couvert par les sources                                                             | Non couvert par les sources                                                                    | Non couvert par les sources                                                                       |
| Stowed Reloading           | Non couvert par les sources                                                             | Non couvert par les sources                                                                    | Non couvert par les sources                                                                       |
| Magazine Size              | Non couvert par les sources                                                             | Non couvert par les sources                                                                    | Non couvert par les sources                                                                       |

Ce que la matrice rend visible d'un coup d'œil, et qu'aucune liste ne montrait : sur les deux lignes complètes, les
recettes d'un même effet **ne partagent presque aucun matériau** d'un fabricant à l'autre. Pour *Greater Range*, les
quinze matériaux des trois recettes sont tous distincts — aucun recoupement. Pour *Headshot Damage*, seul l'**Ion
Battery** apparaît deux fois, chez Manticore et chez Takada. Conséquence de terrain : **on ne prépare pas une session
de récolte pour un effet, on la prépare pour un effet **et** un fabricant. Un stock monté pour équiper un Karma en
*Greater Range* ne servira à rien sur un Manticore.

Trois recettes supplémentaires sont connues mais **sans attribution de fabricant** — la source les donne pour un
Engineer, sans préciser à quelle marque d'arme elles s'appliquent. Elles ne peuvent donc pas être placées dans la
matrice sans inventer une colonne :

| Modification d'arme | Ingénieur relevé         | Matériaux exacts relevés                                                                          | Coût         |
|---------------------|--------------------------|---------------------------------------------------------------------------------------------------|--------------|
| Scope               | Wellington Beck (Jolapa) | 5 Spectral Analysis Data, 3 Biometric Data, 5 Optical Lens, 3 Optical Fibre                       | 500 000 Cr   |
| Noise Suppressor    | Hero Ferrari (Sirius)    | 5 Atmospheric Data, 5 Mining Analytics, 8 Viscoelastic Polymer, 3 Weapon Component                | 1 000 000 Cr |
| Faster Handling     | Hero Ferrari (Sirius)    | 5 Operational Manual, 5 Combatant Performance, 5 Combat Training Material, 3 Viscoelastic Polymer | 500 000 Cr   |

Enfin, un point de méthode qui vaut pour toute la section : ces recettes sont **fixes et non graduées**. Il n'existe
pas de palier G1-G5 par blueprint côté équipement à pied, contrairement aux modules de vaisseau — la question n'a pas
une réponse manquante, elle n'a pas cette structure. La colonne « Grade des matériaux » des tableaux ci-dessus le
consigne pour cette raison, et non par lacune.

*Sourcage : recettes « Headshot Damage » relevées sur edfieldmanual.com (page Uma Laszlo, matériaux par fabricant)
et déjà portées par ce guide ; recettes « Greater Range », « Scope », « Noise Suppressor » et « Faster Handling »
relevées sur inara.cz (`engineer/28/` Hero Ferrari, `engineer/30/` Wellington Beck) et consignées dans
[26-ingenierie-a-pied-avancee.md](./26-ingenierie-a-pied-avancee.md#32-recettes-exactes-vérifiées-de-douze-blueprints-hero-ferrari-wellington-beck).
**Contrôle de cohérence exécuté le 10 septembre 2026 : les 32 noms de matériaux cités dans cette section ont été
comparés un à un à EDCD/FDevIDs, `microresources.csv`, commit c35612952dd6 — les 32 existent, avec l'orthographe
exacte du jeu, et aucun nom fantôme n'a été trouvé.** Ce contrôle valide l'orthographe et l'existence des matériaux,
pas les quantités, qui restent celles des sources amont.*

## Choisir son équipement selon le style de jeu

| Style de jeu                          | Combinaison                                        | Arme(s) recommandée(s)                                 | Modifications clés                                                                                                       |
|-----------------------------------------|-------------------------------------------------------|------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| **Combat**                            | Dominator (2 armes principales, bouclier renforcé) | Manticore Executioner / Terminator, ou lance-roquettes | Damage Resistance, Faster Shield Regen, Extra Ammo Capacity, Headshot Damage                                             |
| **Exploration / Exobiologie**         | Artemis (Genetic Sampler intégré)                  | Arme de secours uniquement                             | Night Vision, Improved Jump Assist, Increased Sprint Duration, Increased Air Reserves                                    |
| **Discrétion / Infiltration**         | Maverick (découpeur plasma intégré, bon rangement) | Karma P15 Infiltrator (silencieux)                     | Quieter Footsteps, Audio Masking, Night Vision, Increased Sprint Duration, Improved Jump Assist, Extra Backpack Capacity |
| **Polyvalent / Farming de matériaux** | Maverick                                           | Arme de poing par défaut                               | Reduced Tool Battery Consumption, pour prolonger les sessions de récolte                                                 |

### Combat : la Dominator et les armes à haut dégât

La **Dominator**, avec ses deux emplacements d'armes principales et son bouclier à régénération renforcée, est la
combinaison de référence pour les zones de conflit à pied et les raids de settlements. Elle s'associe bien à des armes à
haut dégâts (Manticore Executioner/Terminator, lance-roquettes) et à des modifications défensives (Damage Resistance,
Faster Shield Regen) et offensives (Extra Ammo Capacity, Headshot Damage). Pour le détail tactique du combat au sol
(couverture, détection, IA), voir [09-combat-a-pied.md](./09-combat-a-pied.md).

### Exploration et exobiologie à pied : la combinaison Artemis

L'**Artemis**, avec son Genetic Sampler intégré, ses réserves d'oxygène et sa gestion énergétique supérieures, reste le
choix par défaut pour l'exobiologie. Les modifications Night Vision, Improved Jump Assist, Increased Sprint Duration et
Increased Air Reserves permettent de couvrir efficacement de vastes zones planétaires ; rappelons que le grade de la
combinaison n'affecte pas la qualité des scans.

### Discrétion et infiltration : la Maverick et le Karma P15 Infiltrator

La **Maverick**, combinée à une arme silencieuse comme le Karma P15 Infiltrator et à des modifications ciblées (Quieter
Footsteps, Audio Masking, Night Vision), forme le combo de référence identifié par la communauté pour l'infiltration :
bruit réduit, bonne capacité de sac à dos pour transporter du matériel, et mobilité accrue (Increased Sprint Duration,
Improved Jump Assist) pour se déplacer rapidement entre deux points sans être repéré.

### L'alarme de settlement : une diversion, et trois termes qui n'existent pas

Trois expressions circulent dans les questions de commandants sans avoir la moindre existence dans la documentation du
jeu. Mieux vaut ne pas les reprendre, et savoir ce qu'elles désignent réellement.

| Terme employé                          | Ce qu'il en est                                                                                           |
|----------------------------------------|-------------------------------------------------------------------------------------------------------------|
| « Anonymous Access »                   | N'est documenté nulle part ; aucun mécanisme d'accès anonyme de ce nom n'existe à pied.                   |
| « Settlement Defence Personnel Alert » | N'existe pas davantage. Le mécanisme réel est l'**alarme de settlement**, décrite ci-dessous.             |
| « Alexandrite »                        | C'est une **commodité minière**, pas un type de conteneur à piller (voir [20-minage.md](./20-minage.md)). |

Le troisième point n'est qu'une correction de vocabulaire, mais le deuxième cache une mécanique utile. L'alarme d'un
settlement n'est pas seulement un accident à éviter : **déclenchée volontairement, elle sert de diversion** et vide un
bâtiment de ses gardes, qui se déplacent vers la source de l'alerte — de quoi piller au calme celui qu'ils viennent de
quitter. Deux garde-fous à connaître avant de s'y risquer : les téléchargements de données interdits sont **signalés en
violet** et déclenchent l'alarme d'eux-mêmes, souvent au mauvais moment ; et les gardes **n'entrent pas dans un
bâtiment dont ils n'ont pas le niveau d'accès**, ce qui donne un repli exploitable une fois l'alerte lancée. Les
itinéraires de récolte qui s'appuient sur cette mécanique, ainsi que l'autorisation de sécurité que l'on peut
s'octroyer depuis un terminal du Command Centre, sont traités dans
[26-ingenierie-a-pied-avancee.md](./26-ingenierie-a-pied-avancee.md).

*Sourcage : étude interne du dépôt `docs/faisabilite-spansh-temps-reel-materiaux.md` § 3.2, qui relève ces trois termes
comme absents de la documentation et identifie l'alarme de settlement comme le mécanisme réellement en jeu.*

### Polyvalent et farming de matériaux : la Maverick en Reduced Tool Battery Consumption

La **Maverick** équipée de Reduced Tool Battery Consumption prolonge les sessions de récolte de matériaux (utilisation
intensive d'outils sans recharge fréquente), un profil adapté à qui veut préparer ses futures montées en grade
d'ingénierie.

## Mort et rebuy à pied

Contrairement à la perte d'un vaisseau, la mort à pied du commandant a été délibérément conçue par Frontier pour rester
à **faible conséquence** — mais elle n'est pas totalement gratuite. Voici ce qui est confirmé par la FAQ officielle
citée sur les forums communautaires et corroboré par plusieurs retours concordants :

- **Ce qui est perdu** : le contenu du **sac à dos** (backpack) au moment de la mort — matériaux, Data, Items et
  Components non encore transférés — est perdu. La règle est la même en cas de mort en SRV. Citation de la FAQ
  officielle relayée par la communauté : « Anything that is not in the locker on the ship, and in the backpack of the
  player, is lost upon the event of death. »
- **Ce qui est conservé** : tout ce qui a été rangé au préalable dans le **casier du vaisseau** (ship locker) est
  épargné, quel que soit l'endroit où le commandant meurt. D'où le conseil pratique : videz régulièrement votre sac à
  dos vers le casier du vaisseau avant une session de raid ou de CZ à risque, en particulier si vous transportez des
  échantillons d'exobiologie ou des matériaux rares non encore vendus/utilisés.
- **Écran de rebuy** : la mort à pied ouvre un écran de rebuy à l'interface repensée par rapport à celui des vaisseaux,
  mais fonctionnellement proche — un coût d'assurance est bien appliqué. Un fil de discussion officiel des forums
  Frontier evoque une conception « aussi peu pénalisante que possible » de la mort à pied, ce qui suggère un coût
  d'assurance modéré, mais **le montant exact appliqué aux combinaisons et armes équipées au moment du décès n'a pas pu
  être confirmé avec certitude** via les sources consultées pendant la rédaction (accès direct à
  forums.frontier.co.uk bloqué par une erreur HTTP 403, Reddit inaccessible depuis cet environnement). Vérifiez le
  montant affiché en jeu au moment du décès, ou consultez le wiki communautaire pour une valeur à jour.
- **Réapparition** : le commandant est réanimé au point de réapparition disponible le plus proche (souvent son propre
  vaisseau ou une station), sans perte de personnage ni de progression de rang.

*Section basée sur l'état des mécaniques constaté le 9 septembre 2026 ; le coût de rebuy à pied étant un paramètre que
Frontier peut ajuster au fil des patchs, revérifiez-le sur le wiki communautaire ou en jeu avant de vous y fier pour du
contenu à enjeu élevé (raid de settlement de haute valeur, transport de gros volumes de matériaux rares).*

## Actualités récentes touchant l'équipement à pied (2025-2026)

- **Trailblazers (26 février 2025)** — introduction de la **colonisation de systèmes** en bêta, impliquant la
  construction de settlements et donc un terrain d'action à pied élargi (voir
  [18-colonisation.md](./18-colonisation.md) pour le détail de cette mécanique ; date corrigée par rapport à une
  version antérieure de ce guide qui indiquait le 25 février — voir
  [00-chronologie-canonique.md](./00-chronologie-canonique.md#2-colonisation-de-systèmes--dates-bêta-et-sortie-complète)).
- **Caspian Explorer (2 décembre 2025, Update 1 le 11 décembre 2025)** — il s'agit avant tout d'un **vaisseau**
  d'exploration longue distance (Zorgon Peterson), pas d'un patch d'équipement à pied à proprement parler ; pour sa
  fiche technique, voir [03-vaisseaux.md](./03-vaisseaux.md). Certains guides du corpus (dont
  [09-combat-a-pied.md](./09-combat-a-pied.md)) associent cette période à un plafonnement de l'ingénierie de combat à
  pied et à une refonte du comportement des PNJ au sol ; cette association temporelle est reprise ici par cohérence
  avec 09, mais n'a pas pu être vérifiée directement dans les notes de patch officielles pendant la rédaction
  (elitedangerous.com bloqué par une erreur 403) — à confirmer sur les notes de mise à jour officielles si vous vous en
  servez pour du contenu compétitif. **Cette date remplace la mention erronée « janvier 2025 »** trouvée dans une
  version antérieure de ce corpus (voir
  [00-chronologie-canonique.md](./00-chronologie-canonique.md#5-caspian-explorer--nature-vaisseau-dexploration-zorgon-peterson-et-date-de-sortie-2-décembre-2025)).
- **Kestrel Mk II (très probablement le 24 février 2026 — confiance moyenne)** — chasseur léger (petite plateforme
  d'atterrissage), accompagné d'une refonte de l'audio de combat pertinente pour le combat à pied (repérage sonore des
  tirs et explosions à distance). Cette date, corroborée indirectement par un commit du dépôt technique EDCD/FDevIDs
  daté du 25 février 2026, **remplace la mention erronée « février 2025 »** (probable erreur de transcription d'une
  année) trouvée dans une version antérieure de ce corpus — voir le détail et le niveau de confiance dans
  [00-chronologie-canonique.md](./00-chronologie-canonique.md#6-kestrel-mk-ii--date-de-sortie). Voir aussi
  [14-rhino-nomad.md](./14-rhino-nomad.md) pour le contexte complet de cette période.
- **Mise à jour « Operations » (4.4.0.0, 30 juin 2026 en accès anticipé ARX, notes de version le 1ᵉʳ juillet 2026)** —
  cadre de jeu en escadre dont plusieurs scénarios se jouent en partie à pied, et qui introduit le Merc Coin. La même
  mise à jour corrige plusieurs défauts du jeu au sol : zones de conflit à pied échouant malgré la victoire du joueur
  (Issue ID 80753), état incorrect à l'arrivée par Dropship (78904), et, par l'Update 3 du 9 juillet 2026, la
  restauration des inventaires à pied effacés à l'issue d'une Operation. Voir la section « La mise à jour "Operations"
  (4.4.0.0, 30 juin 2026) et le Nomad » en tête de ce guide.
- **Nomad (dévoilement le 2 juin 2026, sortie le 30 juin 2026)** — *ship-launched vessel* d'exploration de surface
  équipé d'un **Mk II Biological Scanner** qui détecte les signaux biologiques depuis le cockpit. Il déplace la phase
  de **repérage** de l'exobiologie vers le vaisseau sans rien changer au **prélèvement**, qui reste à pied ; voir
  [14-rhino-nomad.md](./14-rhino-nomad.md).
- **Véhicule terrestre « Rhino »** (SRV de minage de surface, sorti le 2 septembre 2026) — ajout lié au minage de
  surface plutôt qu'à l'équipement individuel à pied stricto sensu, mais pertinent pour le contexte du gameplay au sol.
  La même mise à jour ajoute l'Operation « Under Siege », qui demande de lever le blocus d'un settlement planétaire ;
  voir [14-rhino-nomad.md](./14-rhino-nomad.md) et [20-minage.md](./20-minage.md).
- Mises à jour mineures (numérotation 4.0.x à 4.4.1.1) — ajustements d'interface à pied, option d'aide à la visée pour
  les contrôles à pied, corrections de bugs de caméra à pied ; pour le détail précis de chaque patch, consultez les
  notes de mise à jour officielles.

## Ressources utiles pour l'équipement à pied : Pioneer Supplies, Vista Genomics, EDOMH

- **Pioneer Supplies** (en station) — achat et montée en grade des combinaisons et armes.
- **Vista Genomics** (en station) — vente des échantillons d'exobiologie.
- **Les Engineers à pied** (en station) — application des modifications d'ingénierie, irréversibles une fois posées.
- **Elite Dangerous Odyssey Material Helper (EDOMH)** — outil tiers pour suivre ses matériaux et planifier ses montées
  en grade et modifications.
- **Wiki communautaire et bases de données d'objets** (Inara, wiki Elite Dangerous) — pour le catalogue exhaustif des
  armes par fabricant et les valeurs numériques les plus à jour.

## Voir aussi

- [09-combat-a-pied.md](./09-combat-a-pied.md) — déroulement tactique du combat au sol (zones de conflit, IA, détection,
  mains nues), qui s'appuie directement sur l'équipement décrit ici.
- [13-operations.md](./13-operations.md) — le gameplay au sol générique (settlements, missions, piratage) au sens large
  du terme « Opérations », à ne pas confondre avec la mise à jour multijoueur du même nom de juin 2026.
- [14-rhino-nomad.md](./14-rhino-nomad.md) — fiches détaillées du Rhino et du Nomad, et chronologie de la mise à jour
  « Operations » évoquée plus haut.
- [10-exploration.md](./10-exploration.md) — exobiologie approfondie (espèces, rangs, primes de première découverte).
- [06-ingenieurs.md](./06-ingenieurs.md) — mécanique générale de l'ingénierie (vaisseaux), grades, effets expérimentaux.
- [26-ingenierie-a-pied-avancee.md](./26-ingenierie-a-pied-avancee.md) — taxonomie des matériaux à pied, règles
  d'échange au barman et itinéraires de récolte pour les paliers de combinaison décrits ici.
- [18-colonisation.md](./18-colonisation.md) — colonisation de systèmes et construction de settlements, contexte direct
  d'usage de l'équipement à pied depuis Trailblazers.
- [00-chronologie-canonique.md](./00-chronologie-canonique.md) — arbitrage de toutes les dates contestées citées dans ce
  guide.

## Sources

- Flux d'annonces officielles Frontier pour *Elite Dangerous*, relevé le 9 septembre 2026 — billets « An Update on
  Operations » (22 avril 2026, 14:02 UTC), « Discover the Nomad » (2 juin 2026, 13:03 UTC), « Operations Update »
  (1ᵉʳ juillet 2026, 14:01 UTC), « Operations Update | Update 3 » (9 juillet 2026, 10:24 UTC) et « Rhino SRV Update »
  (2 septembre 2026, 11:20 UTC) : source primaire des dates, du catalogue MercGear et des citations sur le Nomad.
- https://massivelyop.com/2026/01/11/elite-dangerous-drops-preliminary-details-about-its-raid-like-multiplayer-operations-instances/
- https://massivelyop.com/2025/11/05/elite-dangerous-announces-a-paid-station-a-new-ship-and-multi-step-operation-missions/
- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://gamingwithdaopa.ellatha.com/elitedangerous/engineer/domino-green/
- https://gamingwithdaopa.ellatha.com/elitedangerous/
- https://edfieldmanual.com/
- https://edfieldmanual.com/wiki/Engineers
- https://edfieldmanual.com/wiki/Uma_Laszlo
- https://edfieldmanual.com/wiki/Hero_Ferrari
- https://edfieldmanual.com/wiki/Wellington_Beck
- https://edfieldmanual.com/wiki/Jude_Navarro
- https://edfieldmanual.com/wiki/Terra_Velasquez
- https://edfieldmanual.com/wiki/Oden_Geiger
- https://edfieldmanual.com/wiki/Kit_Fowler
- https://edfieldmanual.com/wiki/Yarden_Bond
- https://edfieldmanual.com/wiki/Category:Odyssey
- https://edfieldmanual.com/wiki/Dominator_Suit
- https://edfieldmanual.com/wiki/Pioneer_Supplies
- https://www.starzen.space/t/elite-dangerous-odyssey-all-suits-explained-artemis-maverick-dominator-guide/32431
- https://www.starzen.space/t/guide-on-foot-engineering-upgrading-elite-dangerous-odyssey/37839
- https://gamerant.com/elite-dangerous-best-personal-weapon-builds/
- https://gamerant.com/elite-dangerous-best-space-suit-builds/
- https://k224p24mgt.wordpress.com/2025/05/11/elite-dangerous-exobiology-guide-how-to-discover-alien-life-and-make-a-fortune/
- https://www.mmorpg.com/news/elite-dangerous-details-how-on-foot-weapons-will-work-in-upcoming-odyssey-expansion-2000121151
- https://www.pilot-gaming.com/exobiology-guide-elite-dangerous/
- https://gameplay.tips/guides/11223-elite-dangerous.html
- https://justabout.com/elite-dangerous/37867/tell-us-how-to-get-into-exobiology-reward
- https://steamcommunity.com/sharedfiles/filedetails/?id=2516179683
- https://www.edsm.net/en/
- https://www.pcgamesn.com/elite-dangerous
- https://canonn.science/
- https://www.magicgameworld.com/elite-dangerous-odyssey-what-happens-if-i-die-while-on-foot/ (mécanique de mort à pied)
- https://steamcommunity.com/app/359320/discussions/0/3039355912932616546/ (perte de matériaux / sac à dos à la mort)
- ./00-chronologie-canonique.md (arbitrage des dates Operations, Trailblazers, Caspian Explorer, Kestrel Mk II)
- Données de référence du dépôt, édition 2026-08 — relevé des blueprints : matériaux, crédits et emplacements de
  modification des quatre paliers des trois combinaisons ; **source amont déclarée pour ce volet à pied :
  `docs/faisabilite-spansh-temps-reel-materiaux.md` § 3.2 et 3.3, et elle seule**. Le champ `sources` du fichier cite
  également EDCD/coriolis-data, mais explicitement « pour les quantités de chaque grade et de chaque effet
  expérimental », c'est-à-dire pour le **volet vaisseau** du même fichier : aucun chiffre de montée en grade de
  combinaison n'en provient, et la vérification par script du 10 septembre 2026 confirme que ce dépôt ne contient
  aucune occurrence de combinaison, d'arme ou d'outil à pied.
- Données de référence du dépôt, édition 2026-08 — relevé des matériaux : catégorie Odyssey, valeur en crédits et
  provenances de terrain des cinq composants de montée en grade ; sources amont déclarées : EDCD/FDevIDs et
  `docs/faisabilite-spansh-temps-reel-materiaux.md` § 3.2, 3.4 et 3.5.
- **EDCD/FDevIDs**, dépôt d'identifiants extraits du jeu, commit `c35612952dd6a547d1a7ac4cffab9c7051e86579` —
  `microresources.csv` : source primaire des six consommables à pied, de la catégorie officielle et de l'identifiant
  numérique des sept composants de montée en grade, et du contrôle d'existence des 32 noms de matériaux cités dans la
  section « Matrice des onze modifications d'armes par fabricant ». `outfitting.csv` et `shipyard.csv` ont été
  examinés et **ne contiennent aucune donnée d'équipement à pied**.
- **EDCD/coriolis-data**, commit `0db9234b5b9ce8c939ea84133d7ce336eea88e27` — examiné et écarté pour ce guide : ce
  dépôt couvre les vaisseaux et leurs modules (y compris les `hardpoints`, qui sont des armes de vaisseau) et **ne
  porte aucune donnée d'équipement à pied Odyssey**. Mention faite ici pour que la vérification n'ait pas à être
  refaite.
- `assets/data/blueprints.json` du dépôt, édition 2026-08, champ `suits` — paliers de montée en grade des trois
  combinaisons : matériaux, crédits et emplacements de modification ; cumuls par grade recalculés par script.
- `docs/faisabilite-spansh-temps-reel-materiaux.md`, étude interne du 19 août 2026, § 3.2 « Artemis : la table
  complète, sourcée » — table des paliers, sources des composants, listes d'ingénieurs vérifiées, réserve sur les
  crédits (wiki Fandom seul), combinaisons « premium » de Pioneer Supplies.
