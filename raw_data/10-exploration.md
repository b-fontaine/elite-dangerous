---
id: 10-exploration
titre: "Guide complet de l'exploration et de l'exobiologie dans Elite Dangerous"
domaine: exploration
entites: ["Exobiologie", "Vista Genomics", "Universal Cartographics", "Canonn Research", "FSS", "DSS", "Combinaison
  Artemis", "Nomad", "Stratum Tectonicas", "Fonticulua Fluctus", "Neutron Highway", "First Logged", "EDDiscovery",
  "BioScan", "Earth-like World", "Crystalline Shards", "Notable Stellar Phenomena", "Distant Worlds", "Beagle Point",
  "Pallaeni", "Codex", "Codex Voucher", "Galactic Region"]
mots_cles_en: ["exobiology", "Vista Genomics", "Universal Cartographics", "Full Spectrum System Scanner", "Detailed
  Surface Scanner", "Artemis suit", "first logged", "first footfall", "neutron highway", "Road to Riches", "scan
  value", "Earth-like World", "star class", "FSD supercharge", "jet cone boost", "surface signal", "SAASignalsFound",
  "geological signal", "Crystalline Shards", "Notable Stellar Phenomena", "Lagrange Cloud", "surface gravity",
  "landable body", "Distant Worlds", "Beagle Point", "codex", "codex voucher", "galactic region", "rumoured reported
  discovered"]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-12
confiance_globale: haute
volatilite: haute
sources_primaires: ["Canonn Research", "wiki Elite Dangerous", "EDDiscovery/EliteDangerousCore (commit
  f21533ba1609d309fd6a96b9b3bb488df178a36e)", "EDDiscovery/EDDiscovery (commit 7b4726f3, 43 journaux de scan réels)",
  "catalogue d'exobiologie compilé du corpus (édition 2026-08)", "EDCD/coriolis-data", "EDCD/FDevIDs",
  "Silarn/EDMC-BioScan (commit 5f0d2e44)", "Steam News Frontier", "Spansh", "EDSM", "distantworlds3.space",
  "wiki Fandom mirroré (DarkSession/Elite-Dangerous-RAG-Knowledge)", "Massively Overpowered (couverture Beyond
  Chapitre Quatre, décembre 2018)"]
zones_incertaines: ["valeur de 952 296 Cr de Radicoida Unica : observation unique en jeu, à reconfirmer", "distance
  minimale de 15 m pour Radicoida, relevée en jeu contre 100 m au catalogue compilé", "contrainte des 2 500 Ls de
  Clypeus Speculumi, non confirmée par télémétrie", "intitulés et ordre exacts des paliers des rangs Explorateur et
  Exobiologiste : reconstitution communautaire", "valeurs de scan de la partie 1 : calculées par l'implémentation de
  référence d'EDDiscovery, jamais confrontées à un montant observé en jeu", "k du corps riche en métaux et du trou
  noir supermassif : déclarés « not confirmed in game » dans le code", "multiplicateur ×6 de supercharge du Mk II
  Supercharge Optimised FSD : relevé chez EDDiscovery, non chiffré par Frontier", "scoopabilité par classe stellaire :
  dérivée du mnémonique KGBFOAM, non confirmée par une source de données", "43 des 109 espèces du catalogue 2.4 sont
  sans fréquence d'observation publiée", "fiches d'habitat de Bark Mound et Brain Tree absentes du catalogue 2.4",
  "taux de rencontre supérieurs prêtés aux secteurs Sinuefai, Sinuefe et Wredguia, non recoupés", "portées et temps de
  scan du Discovery Scanner, du FSS et du DSS, à confirmer sur une source à jour", "les 100 000 000 Cr d'une
  Fonticulua Fluctus en First Logged sont un calcul, non un montant relevé", "ce que désigne la catégorie de signal
  $SAA_SignalType_Other; : inconnu, deux occurrences relevées et aucune source", "aucun signal Guardian, Thargoid ni
  Anomalous dans les 43 journaux de test : ces catégories ne sont attestées que par le code", "aucun champ Genuses
  rempli et aucun événement JetConeBoost dans les journaux de test : structure attestée, contenu jamais observé",
  "correspondance entre les 15 volcanismes de l'énumération EDVolcanism et les 23 entrées de codex géologiques : non
  tabulée", "conditions d'apparition des Crystalline Shards : divergence non arbitrée avec 06-ingenieurs.md sur la
  classe S, le seuil de distance et le Water Giant", "conditions d'apparition des nuages de Lagrange et valeur de
  vente des organismes des Notable Stellar Phenomena : non établies", "seuil de gravité endommageant le train
  d'atterrissage : non établi, le journal n'expose qu'un booléen LandingGear", "seuil de gravité modifiant le
  comportement du SRV ou du Nomad : non établi sur source accessible", "pénalité de mobilité à pied au-delà de 1 G :
  non chiffrée, seul le marquage « haute gravité » de BioScan est établi", "organisateur de Distant Worlds II : non
  établi, les fiches EDSM ne portent pas ce champ", "date de départ, effectifs et itinéraire de Distant Worlds 3 : non
  établis, compteurs du site officiel remplis côté client", "bornes de la première expédition Distant Worlds : la
  fiche EDSM donne 14 janvier - 5 juin 2016, plus large que le « fin 2015 - début 2016 » de 01-lore.md", "structure
  exacte en 3 ou 4 catégories de l'onglet Discoveries du Codex : documentée pour 2018-2021, non revérifiée sur une
  version 2026 du jeu", "montants du Codex Voucher (50 000 / 2 500 Cr) : datés du lancement de la fonctionnalité en
  2018, probablement obsolètes", "absence de tout état « cartographié » dans la taxonomie du Codex : inférence bien
  étayée mais non énoncée mot pour mot par une source officielle"]
guides_lies: [0, 1, 4, 5, 6, 7, 13, 14, 16, 17, 18, 19, 20, 21, 23, 24, 25, 27, 32]
---

# Guide complet de l'exploration et de l'exobiologie dans Elite Dangerous

## En bref

L'exploration dans *Elite Dangerous* consiste à quitter la Bulle pour scanner des systèmes inconnus au Discovery
Scanner, au FSS (*Full Spectrum System Scanner*) puis au DSS (*Detailed Surface Scanner*), et à vendre ces données aux
comptoirs Universal Cartographics. Ce guide chiffre la valeur de scan corps par corps — 283 628 Cr pour un monde de
type terrestre au simple scan, 3 546 696 Cr en première découverte et première cartographie, 500 Cr au plancher —
détaille les 53 classes stellaires du journal de bord et la supercharge du FSD (×4 sur étoile à neutrons, ×1,5 sur
naine blanche, ×6 avec un seul module du jeu). Il recense aussi ce qu'un scan de surface révèle : huit catégories de
signaux, 23 sites géologiques au codex Canonn, les champs de Crystalline Shards et les Notable Stellar Phenomena. Le
**Codex in-jeu** — introduit le 11 décembre 2018, 4 onglets, entrées réparties sur les 42 régions galactiques — est
expliqué en 1.6bis, avec sa distinction impérative d'avec le « Codex Canonn » cité ci-dessus.
Depuis Odyssey s'y ajoute l'exobiologie : prélever à pied, en combinaison **Artemis**, trois échantillons d'une même
espèce pour les vendre à **Vista Genomics**. Le catalogue compte **118 espèces**, de 952 296 Cr à 20 000 000 Cr, avec
un multiplicateur **First Logged ×5**.

## Introduction à l'exploration spatiale et à l'exobiologie

L'exploration spatiale est l'une des activités fondatrices d' *Elite Dangerous* : elle consiste à quitter la Bulle (la
région densément peuplée autour de Sol) pour cartographier des systèmes stellaires inconnus, en tirer des données
scientifiques monnayables auprès des comptoirs Universal Cartographics. Depuis l'extension **Odyssey**, cette activité
s'est enrichie d'un volet de terrain : l' **exobiologie**, qui consiste à se poser sur des planètes et lunes pour y
prélever, à pied, des échantillons d'organismes vivants et les revendre à la société Vista Genomics.

Ce guide couvre les deux disciplines de bout en bout : planification de route, scan des systèmes, exploration profonde
(Road to Riches, Neutron Highways, Distant Worlds), vente des données ; puis taxonomie complète de la vie exobiologique,
procédure de scan/échantillonnage, localisation des espèces les plus rentables, rangs de progression et builds de
vaisseau/équipement dédiés.

**Voir aussi dans ce corpus** — l'exploration recoupe plusieurs autres activités documentées séparément :
[Colonisation](./18-colonisation.md) (utiliser les données d'exploration pour choisir un système à coloniser),
[Fleet Carriers](./19-fleet-carriers.md) (base mobile pour les expéditions longue distance),
[Ingénieurs](./06-ingenieurs.md) (modifications de FSD et de combinaison citées dans ce guide),
[Équipement à pied](./07-equipement-a-pied.md) (détail des combinaisons Odyssey),
[Combat anti-Thargoïde (AX)](./25-combat-ax.md) (sites de ruines et structures inconnues croisés en exploration),
[BGS](./21-bgs.md) (influence des factions dans les systèmes ciblés pour la colonisation),
[Le Rhino et le Nomad](./14-rhino.md) (le véhicule de surface introduit en 2026 pour approcher les organiques,
présenté en 2.2), et le [Glossaire](./00-glossaire.md) pour tous les sigles.

---

## Partie 1 — Exploration spatiale : scan, routes et vente des données

### 1.1 Bref historique de la découverte de la vie extraterrestre (3302 à Odyssey)

L'exploration de surface a connu plusieurs ères successives :

- **En 3302**, les toutes premières découvertes de vie (Bark Mounds, Anémones, Brain Trees, Bernacles Thargoïdes) se
  faisaient à l'œil nu : les commandants survolaient des heures durant les surfaces planétaires à la recherche de
  minuscules points contrastant avec le terrain. Les Bernacles Thargoïdes et d'autres vestiges liés aux Thargoïdes
  restent aujourd'hui documentés plus en détail dans le guide dédié au [combat AX](./25-combat-ax.md).
- **En 3304**, l'amélioration des scanners de vaisseau a facilité la détection à distance des sites d'intérêt.
- **Avec Odyssey**, l'atterrissage à pied est devenu possible sur les planètes à atmosphère fine, donnant naissance à
  l'exobiologie de terrain moderne. La société fictive **Vista Genomics** s'est mise à verser des primes pour tout
  échantillon prélevé avec l'Organic Scanner de la combinaison **Artemis** (voir la mise au point sur les combinaisons
  Odyssey en 2.2 et dans [Équipement à pied](./07-equipement-a-pied.md)).

### 1.2 Planification de route d'exploration : EDSM et Spansh

Deux outils communautaires dominent la planification de trajet :

#### EDSM (Elite Dangerous Star Map — edsm.net) : carte galactique et route planner

- Propose une **Galactic Map** complète avec un **Route Planner** intégré.
- Tient un **flight log** personnel (historique des systèmes visités par le commandant) et un classement des **« systems
  discovered first »**.
- Publie des statistiques globales sur l'état de la découverte galactique. Le nombre de systèmes enregistrés progresse
  en continu à mesure que la communauté explore, mais il ne représente qu'une fraction infime des quelque 400 milliards
  d'étoiles que compte la galaxie du jeu — un ordre de grandeur à garder en tête plutôt qu'un chiffre figé, à consulter
  directement sur la page de statistiques d'EDSM pour une valeur à jour.

#### Spansh (spansh.co.uk) : les quatre calculateurs de route de la communauté

Spansh héberge les calculateurs de route de référence de la communauté :

| Outil Spansh                             | Fonction                                                                          |
|------------------------------------------|-----------------------------------------------------------------------------------|
| **Galaxy Plotter**                       | Route A→B optimisée en nombre de sauts                                            |
| **Exact Plotter**                        | Trajet précis avec contraintes de carburant et de portée de saut                  |
| **Road to Riches**                       | Itinéraire optimisé pour maximiser les gains d'exobiologie sur une zone donnée    |
| **Neutron Router** (Fuel Neutron Router) | Chaîne de sauts le long des étoiles à neutrons pour maximiser la portée effective |

Spansh est largement adopté par la communauté d'explorateurs, y compris par les contributeurs de Canonn Research, pour
tracer les « neutron highways » utilisées lors des grandes traversées de la galaxie.

### 1.3 Scan des systèmes en exploration : Discovery Scanner, FSS, DSS

Trois outils de scan s'utilisent en cascade, du plus grossier au plus précis :

#### Le Discovery Scanner (« honk ») — révélation passive des corps du système

Scanner passif de découverte : il révèle automatiquement l'existence de tous les corps célestes du système dès
l'arrivée, sans action fine du pilote (d'où le surnom de « honk »).

#### Le FSS (Full Spectrum System Scanner) — identification des corps à distance

Le FSS effectue un balayage détaillé des **signatures de fréquence** de chaque corps du système, permettant de les
identifier individuellement (type de planète ou d'étoile, présence de vie, anomalies) sans avoir à s'en approcher
physiquement. C'est l'outil de reconnaissance à distance par excellence, et il est utilisé par Canonn comme véritable
instrument scientifique :

- La page *« Ghost Rings »* documente une recherche sur les anneaux planétaires invisibles à partir de données FSS
  (rayon interne/externe, masse) croisées sur **plus de 4 000 observations** : les anneaux de largeur supérieure à 1,6
  million de km et de densité inférieure à 0,06 Mt/km² s'avèrent invisibles, de même que les anneaux de moins de 6 km de
  large.
- La page *« IEA Helium-Rich Gas Giant Guide »* explique comment repérer au FSS les géantes gazeuses riches en hélium
  (plus de 30 % d'hélium atmosphérique) : signature en forme de « H », nombre anormalement élevé de corps dans le
  système, et effet de **« boxel »** — les systèmes voisins partageant le même code de masse ont des propriétés
  similaires, si bien qu'une géante riche en hélium en signale souvent d'autres à proximité.

#### Le DSS (Detailed Surface Scanner) — cartographie de surface par sondes

Tiré en survol sous forme de sonde, le DSS cartographie la surface d'un corps : il révèle les ressources géologiques et
biologiques exploitables et complète le statut « mapped » qui majore la valeur de revente des données. Sur la carte DSS,
les zones favorables à la vie apparaissent en teinte **sarcelle / vert clair**.

> Les valeurs précises de portée et de temps de scan de ces trois instruments sont globalement stables depuis plusieurs
> versions du jeu. Il est recommandé de les confirmer sur le wiki Fandom ou Inara.cn en cas de doute.

#### Les 8 catégories de signaux de surface d'un corps scanné

Un corps scanné peut porter des **signaux de surface**. Le journal du jeu les inscrit sous deux événements distincts :
`FSSBodySignals`, produit par le balayage au FSS, et `SAASignalsFound`, produit par une cartographie au DSS. Le
référentiel d'EDDiscovery classe ces signaux en **8 catégories**, chacune reconnue à un jeton de chaîne et rattachée à
un prédicat de code. Le tableau ci-dessous les recense toutes — 8 lignes, recomptées sur son contenu — et donne pour
chacune le nombre d'occurrences relevées dans les 43 journaux de test dépouillés pour ce guide.

| Catégorie        | Jeton de journal                 | Prédicat EDDiscovery | Ce qu'elle désigne                                                         | Ce qu'elle débloque                                          | Occurrences relevées (DSS / FSS) |
|------------------|----------------------------------|----------------------|----------------------------------------------------------------------------|--------------------------------------------------------------|----------------------------------|
| Biological       | `$SAA_SignalType_Biological;`    | IsBio                | Formes de vie exobiologiques à la surface                                  | Prélèvement Artemis (3 échantillons) et vente Vista Genomics | 0 / 8                            |
| Geological       | `$SAA_SignalType_Geological;`    | IsGeo                | Sites volcaniques de surface (fumerolles, geysers, gas vents, lava spouts) | Matériaux bruts au SRV et entrées de codex                   | 13 / 4                           |
| Human            | `$SAA_SignalType_Human;`         | IsHuman              | Implantations et épaves humaines                                           | Data points, récupération, missions                          | 90 / 0                           |
| Guardian         | `$SAA_SignalType_Guardian;`      | IsGuardian           | Sites Guardians de surface                                                 | Ruines et structures Guardians                               | 0 / 0                            |
| Thargoid         | `$SAA_SignalType_Thargoid;`      | IsThargoid           | Sites Thargoids de surface                                                 | Barnacles, spires, Thargoid Links                            | 0 / 0                            |
| Anomalous        | `$SAA_SignalType_PlanetAnomaly;` | IsThargoid           | Anomalies planétaires                                                      | Codex ; classé avec Thargoid par EDDiscovery                 | 0 / 0                            |
| Other            | `$SAA_SignalType_Other;`         | IsOther              | Non précisé par les sources lues                                           | Non établi                                                   | 2 / 0                            |
| Planetary mining | `$PlanetaryMiningLocation_Name;` | IsPlanetaryMining    | Emplacements de minage planétaire                                          | Minage au sol (Rhino SRV, 2 sept. 2026)                      | 0 / 0                            |

Trois précisions, sans lesquelles ce tableau se lit de travers :

- **« Anomalous » n'est pas une catégorie indépendante** dans le référentiel lu : son jeton est rattaché au même
  prédicat que Thargoid, le code expliquant que l'anomalie planétaire est associée aux interactions thargoïdes. Le
  compte exact est donc celui-ci : 8 jetons distincts, mais 7 prédicats seulement. La communauté cite couramment six
  catégories de surface ; ce logiciel-là en reconnaît 8 et n'isole pas l'anomalie.
- **La catégorie « Other » n'est documentée nulle part.** Elle existe, elle est relevée deux fois dans les journaux de
  test — sur la Lune et sur Europa, une unité chacune — et aucune source consultée ne dit ce qu'elle désigne. Le trou
  est signalé plutôt que comblé.
- **Les emplacements de minage planétaire passent par le même événement**, sous un jeton qui ne commence pas par
  `$SAA_SignalType`. Ils sont arrivés avec la mise à jour Rhino SRV du 2 septembre 2026, qui étend le DSS à leur
  détection (voir [Équipements](./04-equipements.md) et [Le Rhino et le Nomad](./14-rhino.md)).

Un même événement `SAASignalsFound` sert par ailleurs à deux usages que rien ne distingue à la lecture : cartographier
un **anneau** ne rend pas une catégorie mais des **noms de matériaux**, que le code range en « non catégorisés »
précisément parce que leur jeton ne commence pas par `$SAA_SignalType`. Les journaux de test en portent 13, avec leurs
effectifs :

| Jeton de signal d'anneau relevé | Occurrences | Somme des `Count` |
|---------------------------------|-------------|-------------------|
| Alexandrite                     | 10          | 14                |
| Benitoite                       | 7           | 16                |
| Bromellite                      | 4           | 4                 |
| Grandidierite                   | 3           | 5                 |
| LowTemperatureDiamond           | 2           | 4                 |
| Monazite                        | 5           | 8                 |
| Musgravite                      | 1           | 9                 |
| Opal                            | 1           | 1                 |
| Painite                         | 1           | 2                 |
| Rhodplumsite                    | 2           | 2                 |
| Serendibite                     | 8           | 16                |
| Tritium                         | 1           | 1                 |
| tritium                         | 1           | 1                 |

La ligne `tritium` en minuscules n'est pas une coquille de ce guide : les deux graphies figurent telles quelles dans
les journaux. Ces signaux d'anneau relèvent du [Minage](./20-minage.md), et non de l'exobiologie.

#### Ce que le FSS annonce et ce que seul le DSS ajoute : le genre biologique

La différence entre les deux instruments est structurelle, et elle se lit dans la définition même des classes du
référentiel : celle qui porte l'événement du FSS n'a **aucun** champ `Genuses`, alors que celle du DSS en porte un,
annoté « 4.0v13+ ».

| Événement de journal | Classe EDDiscovery       | Champ `Signals` | Champ `Genuses`               | Occurrences relevées |
|----------------------|--------------------------|-----------------|-------------------------------|----------------------|
| `FSSBodySignals`     | `JournalFSSBodySignals`  | oui             | **non** (absent de la classe) | 12                   |
| `SAASignalsFound`    | `JournalSAASignalsFound` | oui             | oui (4.0v13+)                 | 117                  |

Autrement dit, et c'est la réponse exacte à « qu'apporte le DSS ? » : le FSS annonce **combien** de signaux
biologiques porte un corps ; seul le DSS annonce **quels genres** s'y trouvent. La formule courante selon laquelle le
DSS « révèle les ressources géologiques et biologiques exploitables » est vraie mais imprécise — le comptage, le FSS
le donne déjà.

Réserve de méthode, à connaître avant de citer ce tableau : sur les 117 événements `SAASignalsFound` des journaux de
test, 15 portent la clé `Genuses` et **aucun** ne la remplit. L'échantillon vient très majoritairement de la Bulle
habitée — 90 signaux Human contre 0 signal biologique côté DSS — et il ne contient aucun signal Guardian, Thargoid ni
Anomalous. Ces journaux attestent la structure du champ, pas son contenu : le lien « DSS → liste des genres » est
établi sur le code, jamais sur une observation.

#### Géologie de surface : volcanisme du corps, signal de géologie, point d'intérêt

Trois notions distinctes se cachent derrière le mot « géologie », et le corpus les emploie déjà toutes les trois. Les
séparer évite l'essentiel des contresens :

- **Le volcanisme du corps** est une propriété planétaire, énumérée dans le code du jeu. C'est elle que citent les
  fiches d'habitat d'exobiologie de la partie 2, sous les intitulés « magma ferreux », « geysers de CO2 » et leurs
  voisins.
- **Le signal géologique** est un comptage de sites, rendu aussi bien par le FSS que par le DSS.
- **Le point d'intérêt de surface** est le site lui-même, avec son entrée de codex et ses dépôts de matériaux.

L'énumération du volcanisme porte **15 valeurs de volcanisme actif**, réparties en 8 magmas et 7 geysers :

| Famille                | Nombre de valeurs | Valeurs de l'énumération `EDVolcanism`                                                                                             |
|------------------------|-------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Magma                  | 8                 | Water Magma, Sulphur Dioxide Magma, Ammonia Magma, Methane Magma, Nitrogen Magma, Silicate Magma, Metallic Magma, Rocky Magma      |
| Geysers                | 7                 | Water Geysers, Carbon Dioxide Geysers, Ammonia Geysers, Methane Geysers, Nitrogen Geysers, Helium Geysers, Silicate Vapour Geysers |
| Total volcanisme actif | 15                | —                                                                                                                                  |

Le troisième niveau, celui des points d'intérêt, se compte sur le référentiel de codex de Canonn : **23 entrées** de
géologie de surface, pour 222 898 relevés cumulés au 10 septembre 2026. Les distances ci-dessous sont DÉRIVÉES PAR
CALCUL — ce sont des normes euclidiennes sur les coordonnées galactiques publiées par Canonn, Sol étant à l'origine ;
les effectifs sont des comptages sur le dump.

| Entrée de codex (nom anglais) | Famille      | Relevés Canonn | Systèmes distincts | Distance du plus proche à Sol (al) | Système le plus proche |
|-------------------------------|--------------|----------------|--------------------|------------------------------------|------------------------|
| Sulphur Dioxide Fumarole      | Fumarole     | 30 694         | 30 667             | 4,4                                | Alpha Centauri         |
| Silicate Magma Lava Spout     | Lava Spout   | 25 848         | 25 827             | 6,6                                | Luhman 16              |
| Silicate Vapour Gas Vent      | Gas Vent     | 25 381         | 25 360             | 4,4                                | Alpha Centauri         |
| Sulphur Dioxide Gas Vent      | Gas Vent     | 25 180         | 25 163             | 4,4                                | Alpha Centauri         |
| Silicate Vapour Fumarole      | Fumarole     | 22 860         | 22 837             | 6,6                                | Luhman 16              |
| Water Ice Geyser              | Ice Geyser   | 19 241         | 19 230             | 0,0                                | Sol                    |
| Water Ice Fumarole            | Ice Fumarole | 15 578         | 15 567             | 0,0                                | Sol                    |
| Iron Magma Lava Spout         | Lava Spout   | 15 180         | 15 170             | 10,7                               | Lacaille 9352          |
| Nitrogen Ice Geyser           | Ice Geyser   | 7 195          | 7 191              | 7,2                                | WISE 0855-0714         |
| Carbon Dioxide Ice Geyser     | Ice Geyser   | 7 042          | 7 041              | 12,1                               | YZ Ceti                |
| Carbon Dioxide Ice Fumarole   | Ice Fumarole | 6 343          | 6 340              | 12,1                               | YZ Ceti                |
| Nitrogen Ice Fumarole         | Ice Fumarole | 5 399          | 5 397              | 7,2                                | WISE 0855-0714         |
| Methane Ice Geyser            | Ice Geyser   | 4 616          | 4 614              | 16,2                               | DEN 0255-4700          |
| Methane Ice Fumarole          | Ice Fumarole | 3 602          | 3 602              | 16,2                               | DEN 0255-4700          |
| Ammonia Ice Geyser            | Ice Geyser   | 2 612          | 2 610              | 19,7                               | Wolf 1481              |
| Ammonia Ice Fumarole          | Ice Fumarole | 2 322          | 2 321              | 19,7                               | Wolf 1481              |
| Water Gas Vent                | Gas Vent     | 1 323          | 1 322              | 0,0                                | Sol                    |
| Water Fumarole                | Fumarole     | 723            | 722                | 59,3                               | Matet                  |
| Water Geyser                  | Geyser       | 701            | 700                | 59,3                               | Matet                  |
| Silicate Vapour Ice Fumarole  | Ice Fumarole | 435            | 435                | 50,8                               | Ross 584               |
| Carbon Dioxide Gas Vent       | Gas Vent     | 346            | 346                | 42,5                               | LHS 1650               |
| Sulphur Dioxide Ice Fumarole  | Ice Fumarole | 267            | 266                | 17,4                               | Flousop                |
| Carbon Dioxide Fumarole       | Fumarole     | 10             | 10                 | 6 446,9                            | Hypiae Aihm NQ-Y d30   |

Ces 23 entrées se répartissent en **6 familles de site** :

| Famille de site géologique | Nombre d'entrées de codex |
|----------------------------|---------------------------|
| Ice Fumarole               | 7                         |
| Ice Geyser                 | 5                         |
| Fumarole                   | 4                         |
| Gas Vent                   | 4                         |
| Lava Spout                 | 2                         |
| Geyser                     | 1                         |
| **Total**                  | 23                        |

Quatre enseignements, tous DÉRIVÉS de ces comptages :

- **Le nom de la famille ne se déduit pas du volcanisme.** « Sulphur Dioxide Fumarole » repose sur un magma et « Water
  Geyser » sur des geysers, mais le jeu forme aussi « Ammonia Ice Fumarole » à partir de geysers d'ammoniac. La
  correspondance entre les 15 volcanismes et les 23 entrées de codex se tabule, elle ne se calcule pas — et aucune
  source lue ne la donne en entier.
- **La rareté est très inégale.** Sulphur Dioxide Fumarole totalise 30 694 relevés, Carbon Dioxide Fumarole en
  totalise 10 : un facteur supérieur à 3 000 entre la première et la dernière des 23 entrées.
- **Une seule des 23 entrées a son relevé le plus proche hors de la Bulle** : Carbon Dioxide Fumarole, à 6 446,9 al de
  Sol, contre moins de 60 al pour les 22 autres. Pour un chasseur de codex, c'est le fait le plus actionnable du
  tableau.
- **Trois entrées ont un relevé dans Sol même** — Water Ice Geyser, Water Ice Fumarole, Water Gas Vent —, ce que
  recoupe le journal de test, où Europa porte deux signaux géologiques.

Ce que rapportent ces sites relève de l'ingénierie plus que de l'exploration, et le corpus le documente déjà : un
*outcrop* rend 3 unités par morceau ; les dépôts volcaniques suivent une échelle de grade — Piceous Cobble en G1,
Crystalline Fragments en G2-G3, Crystalline Cluster en G3-G4, Needle Crystals en G4 et uniquement sur les sites *Lava
Spout* ; chaque corps atterrissable porte une composition **fixe** de 11 matériaux — 5 G1, 3 G2, 2 G3 et 1 G4 — qu'un
DSS à 90 % de couverture révèle définitivement, les signaux devenant alors des points d'atterrissage sélectionnables.
Le détail figure dans [Ingénieurs](./06-ingenieurs.md) et n'est pas repris ici.

Une conséquence DÉRIVÉE de ces deux relevés, et vérifiable sur place : puisqu'un corps n'a qu'un seul matériau de
grade 4, tous les dépôts G4 d'un même corps rendent le même matériau. La boucle de récolte au SRV — approcher le
dépôt, le fragmenter au répéteur à plasma, ramasser au collecteur de cargaison, attendre la phase dormante d'un geyser
actif plutôt que de se faire projeter — est en revanche **communautaire** : aucune source primaire consultée ne la
décrit.

#### Crystalline Shards : un site de récolte classé « Biological » au codex

Le même nom recouvre trois choses, et le corpus en a déjà tranché deux. *Crystal Shards* est un matériau manufacturé
de grade 1 ; les *Crystalline Shards* sont un site de récolte de matériaux bruts. La mise au point complète est dans
[Ingénieurs](./06-ingenieurs.md) et n'est pas répétée ici. Le troisième statut n'était relié nulle part : dans le
référentiel de codex de Canonn, **Crystalline Shards** est classé en catégorie *Biology*, sous-catégorie *Organic
Structures* — ce qui est cohérent avec la partie 2 de ce guide, qui en fait un genre d'exobiologie hors famille
Odyssey à 1 628 800 Cr. Le même objet est donc à la fois une espèce à scanner pour Vista Genomics et un site à
récolter au SRV. Conséquence pratique, convergente entre les sources communautaires : sur la carte du DSS, c'est le
filtre **Biological** qui fait apparaître les champs d'aiguilles, et non le filtre Geological.

Reste la distance, et elle est décourageante. Le dump de codex de Canonn du 10 septembre 2026 porte 4 482 relevés
répartis sur **3 826 systèmes distincts**. Le plus proche de Sol est à 1 426,2 al — le chiffre que le corpus annonçait
déjà — et il porte un nom que le corpus ne donnait pas :

| Rang | Système                 | Distance à Sol (al) |
|------|-------------------------|---------------------|
| 1    | Oochorrs SB-J d10-5     | 1 426,2             |
| 2    | Oochorrs AC-T c20-2     | 1 429,9             |
| 3    | Outotz TA-M c21-2       | 1 469,0             |
| 4    | Col 69 Sector GR-V d2-7 | 1 477,2             |
| 5    | Outotz GZ-M c21-0       | 1 478,8             |

Les quatre suivants tiennent dans un mouchoir de poche, entre 1 429,9 et 1 478,8 al. La distribution complète dit le
reste :

| Distance à Sol     | Systèmes à Crystalline Shards | Part    |
|--------------------|-------------------------------|---------|
| 0 à 2 000 al       | 97                            | 2,5 %   |
| 2 000 à 5 000 al   | 374                           | 9,8 %   |
| 5 000 à 10 000 al  | 480                           | 12,5 %  |
| 10 000 à 20 000 al | 628                           | 16,4 %  |
| 20 000 à 40 000 al | 761                           | 19,9 %  |
| plus de 40 000 al  | 1 486                         | 38,8 %  |
| **Total**          | 3 826                         | 100,0 % |

Soit 2,5 % des systèmes à Crystalline Shards à moins de 2 000 al de Sol, et 38,8 % au-delà de 40 000 al : ce n'est pas
une sortie du week-end, et le corpus a raison de le dire.

**Les conditions d'apparition ne sont pas les mêmes des deux côtés du corpus, et ce guide ne tranche pas.** La fiche
d'habitat de la partie 2 demande une étoile primaire de classe A, F, G, K ou M, une température de 20 à 250 K et une
distance supérieure à 10 000 ls de l'étoile d'arrivée. [Ingénieurs](./06-ingenieurs.md) admet en plus la classe S,
retient 0 à 273 K, place le seuil à 12 000 Ls et accepte le *Water Giant* parmi les mondes déclencheurs du système.
Trois écarts, donc : la classe stellaire S, le seuil de distance et le *Water Giant*. Aucune source primaire consultée
ne permet de départager les deux relevés ; en attendant un arbitrage, la lecture prudente consiste à chercher sur les
conditions les plus larges et à n'affirmer que sur les plus étroites.

Le rendement, lui, est **communautaire** : une aiguille brisée rendrait environ 3 unités du matériau de grade 4 du
corps, et un champ dense remplirait un casier — plafond de 150 unités — en quelques minutes, en visant la jonction
entre l'aiguille et son socle, le socle lui-même ne rendant rien. Pour trouver un site précis, deux sources se
croisent sans se remplacer : l'API de repères de surface (*landmarks*) de Spansh expose les sites **avec leur latitude
et leur longitude**, ce qui mène droit au terrain ; le dump de codex de Canonn donne les systèmes et leurs coordonnées
galactiques, mais aucune coordonnée de surface. Les deux outils sont présentés en 1.2 et 1.6.

#### Notable Stellar Phenomena : des signaux de système, et non de surface

Les **Notable Stellar Phenomena** sont souvent rangés avec les signaux de surface ; ils n'en sont pas. Le référentiel
d'EDDiscovery en fait une **classe de signal système**, reconnue à un nom de signal commençant par
`$Fixed_Event_Life`, dotée de sa propre entrée d'énumération et d'une durée de validité d'un an — contre quatorze
jours pour un porte-vaisseaux ou une zone de conflit. Ils ne relèvent donc pas du DSS : ils apparaissent au FSS, se
pointent en survitesse et se parcourent en vol normal. Ce sont les nuages de Lagrange et ce qu'ils abritent.

Le référentiel de codex de Canonn compte **133 entrées** classées « Cloud » : 12 pour les nuages eux-mêmes —
les six couleurs Caeruleum, Croceum, Luteolum, Roseum, Rubicundum et Viride, des variantes « Storm » et le
Proto-Lagrange Cloud — et
121 pour les organismes qui y vivent.

| Contenu d'un Notable Stellar Phenomenon                               | Entrées de codex |
|-----------------------------------------------------------------------|------------------|
| Nuages de Lagrange eux-mêmes (sous-catégorie *Geology and Anomalies*) | 12               |
| Organismes de type *Mollusc* (sous-catégorie *Organic Structures*)    | 49               |
| Organismes de type *Pod* (sous-catégorie *Organic Structures*)        | 36               |
| Organismes de type *Crystals* (sous-catégorie *Organic Structures*)   | 18               |
| Organismes de type *Tree* (sous-catégorie *Organic Structures*)       | 11               |
| Organismes de type *Plates* (sous-catégorie *Organic Structures*)     | 4                |
| Organismes de type *Spheres* (sous-catégorie *Organic Structures*)    | 2                |
| Organismes de type *Heart* (sous-catégorie *Organic Structures*)      | 1                |
| **Total des entrées classées « Cloud »**                              | 133              |

Pour l'exobiologiste, la conclusion tient en une phrase : les Notable Stellar Phenomena sont la troisième source de
scans d'organismes, à côté des surfaces planétaires d'Odyssey et des structures organiques posées hors atmosphère. Ce
guide n'en dit pas davantage, et c'est délibéré : ni les conditions d'apparition des nuages, ni la valeur de vente de
leurs organismes, ni l'utilité d'un DSS sur place ne sont établies sur une source consultable.

#### Les 53 classes stellaires du journal de bord : identité, couleur, collecte de carburant, fréquence

Le journal du jeu désigne chaque étoile par la valeur du champ `StarType` d'un événement `Scan` : ce sont ces chaînes
exactes qu'un commandant retrouve dans ses propres fichiers et dans les API tierces. Le tableau ci-dessous les recense
toutes — 53 classes — avec le libellé affiché en jeu, le sous-type employé par Spansh et EDSM (c'est lui qui porte la
couleur), l'aptitude à la collecte de carburant et le poids de la classe dans la base EDSM au 10 septembre 2026.

| `StarType` au journal   | Libellé en jeu                                    | Sous-type Spansh/EDSM (couleur)       | Collecte de carburant | Corps EDSM | Part EDSM |
|-------------------------|---------------------------------------------------|---------------------------------------|-----------------------|-----------:|----------:|
| `K`                     | Orange K class star                               | K (Yellow-Orange) Star                | Oui                   | 21 272 414 |  18,679 % |
| `G`                     | Yellow G class star                               | G (White-Yellow) Star                 | Oui                   |  7 383 997 |   6,484 % |
| `B`                     | Luminous Blue B class star                        | B (Blue-White) Star                   | Oui                   |  1 426 927 |   1,253 % |
| `F`                     | White F class star                                | F (White) Star                        | Oui                   |  9 424 348 |   8,275 % |
| `O`                     | Luminous Hot O class star                         | O (Blue-White) Star                   | Oui                   |    170 262 |   0,150 % |
| `A`                     | Bluish-White A class star                         | A (Blue-White) Star                   | Oui                   |  4 671 937 |   4,102 % |
| `M`                     | Red M class star                                  | M (Red dwarf) Star                    | Oui                   | 40 980 718 |  35,985 % |
| `L`                     | Dark Red L class star                             | L (Brown dwarf) Star                  | Non                   | 11 892 112 |  10,442 % |
| `T`                     | Methane Dwarf T class star                        | T (Brown dwarf) Star                  | Non                   |  5 583 893 |   4,903 % |
| `Y`                     | Brown Dwarf Y class star                          | Y (Brown dwarf) Star                  | Non                   |  3 088 927 |   2,712 % |
| `D`                     | White Dwarf D class star                          | White Dwarf (D) Star                  | Non                   |         14 |   0,000 % |
| `DA`                    | White Dwarf DA class star                         | White Dwarf (DA) Star                 | Non                   |    123 884 |   0,109 % |
| `DAB`                   | White Dwarf DAB class star                        | White Dwarf (DAB) Star                | Non                   |     55 152 |   0,048 % |
| `DAO`                   | White Dwarf DAO class star                        | —                                     | Non                   |     absent |    absent |
| `DAZ`                   | White Dwarf DAZ class star                        | White Dwarf (DAZ) Star                | Non                   |      2 670 |   0,002 % |
| `DAV`                   | White Dwarf DAV class star                        | White Dwarf (DAV) Star                | Non                   |     14 138 |   0,012 % |
| `DB`                    | White Dwarf DB class star                         | White Dwarf (DB) Star                 | Non                   |     22 338 |   0,020 % |
| `DBZ`                   | White Dwarf DBZ class star                        | White Dwarf (DBZ) Star                | Non                   |        722 |   0,001 % |
| `DBV`                   | White Dwarf DBV class star                        | White Dwarf (DBV) Star                | Non                   |      4 202 |   0,004 % |
| `DO`                    | White Dwarf DO class star                         | —                                     | Non                   |     absent |    absent |
| `DOV`                   | White Dwarf DOV class star                        | —                                     | Non                   |     absent |    absent |
| `DQ`                    | White Dwarf DQ class star                         | White Dwarf (DQ) Star                 | Non                   |         22 |   0,000 % |
| `DC`                    | White Dwarf DC class star                         | White Dwarf (DC) Star                 | Non                   |    188 323 |   0,165 % |
| `DCV`                   | White Dwarf DCV class star                        | White Dwarf (DCV) Star                | Non                   |     16 077 |   0,014 % |
| `DX`                    | White Dwarf DX class star                         | —                                     | Non                   |     absent |    absent |
| `N`                     | Neutron Star                                      | Neutron Star                          | Non                   |  3 586 557 |   3,149 % |
| `H`                     | Black Hole                                        | Black Hole                            | Non                   |    455 817 |   0,400 % |
| `SuperMassiveBlackHole` | Super Massive Black Hole                          | Supermassive Black Hole               | Non                   |          1 |   0,000 % |
| `W`                     | Wolf-Rayet W class star                           | Wolf-Rayet Star                       | Non                   |         84 |   0,000 % |
| `WN`                    | Wolf-Rayet WN class star                          | Wolf-Rayet N Star                     | Non                   |      9 782 |   0,009 % |
| `WNC`                   | Wolf-Rayet WNC class star                         | Wolf-Rayet NC Star                    | Non                   |      9 920 |   0,009 % |
| `WC`                    | Wolf-Rayet WC class star                          | Wolf-Rayet C Star                     | Non                   |     14 196 |   0,012 % |
| `WO`                    | Wolf-Rayet WO class star                          | Wolf-Rayet O Star                     | Non                   |     31 494 |   0,028 % |
| `TTS`                   | T Tauri star                                      | T Tauri Star                          | Non                   |  2 911 142 |   2,556 % |
| `AeBe`                  | Herbig Ae/Be class star                           | Herbig Ae Be Star / Herbig Ae/Be Star | Non                   |    156 931 |   0,138 % |
| `CS`                    | Carbon CS class star                              | —                                     | Non                   |     absent |    absent |
| `C`                     | Carbon C class star                               | C Star                                | Non                   |        203 |   0,000 % |
| `CN`                    | Carbon CN class star                              | CN Star                               | Non                   |     18 750 |   0,016 % |
| `CJ`                    | Carbon CJ class star                              | CJ Star                               | Non                   |      2 855 |   0,003 % |
| `CHd`                   | Carbon CHd class star                             | —                                     | Non                   |     absent |    absent |
| `MS`                    | Intermediate low Zirconium Monoxide MS class star | MS-type Star                          | Non                   |     25 758 |   0,023 % |
| `S`                     | Cool Giant Zirconium Monoxide rich S class star   | S-type Star                           | Non                   |     26 897 |   0,024 % |
| `A_BlueWhiteSuperGiant` | A Blue White Super Giant                          | A (Blue-White super giant) Star       | Oui                   |     18 148 |   0,016 % |
| `B_BlueWhiteSuperGiant` | B Blue White Super Giant                          | B (Blue-White super giant) Star       | Oui                   |     15 373 |   0,013 % |
| `F_WhiteSuperGiant`     | F White Super Giant                               | F (White super giant) Star            | Oui                   |      8 738 |   0,008 % |
| `G_WhiteSuperGiant`     | G White Super Giant                               | G (White-Yellow super giant) Star     | Oui                   |      7 031 |   0,006 % |
| `K_OrangeGiant`         | K Orange Giant                                    | K (Yellow-Orange giant) Star          | Oui                   |     53 769 |   0,047 % |
| `M_RedGiant`            | M Red Giant                                       | M (Red giant) Star                    | Oui                   |    204 311 |   0,179 % |
| `M_RedSuperGiant`       | M Red Super Giant                                 | M (Red super giant) Star              | Oui                   |      3 035 |   0,003 % |
| `X`                     | Exotic                                            | —                                     | inconnu               |     absent |    absent |
| `Nebula`                | Nebula                                            | —                                     | sans objet            |     absent |    absent |
| `RoguePlanet`           | Rogue Planet                                      | —                                     | sans objet            |     absent |    absent |
| `StellarRemnantNebula`  | Stellar Remnant Nebula                            | —                                     | sans objet            |     absent |    absent |

Recomptes sur le tableau ci-dessus : 53 lignes, dont 14 classes marquées scoopables, 35 non scoopables, 1 inconnue et
3 sans objet (les trois valeurs de l'énumération qui ne désignent pas une étoile). Les 14 classes scoopables cumulent
75,200 % des corps stellaires du relevé EDSM.

Trois avertissements de lecture, tous les trois importants :

- **La colonne « collecte de carburant » est DÉRIVÉE, pas relevée.** Aucune des sources consultées n'expose
  d'indicateur de scoopabilité par classe. La colonne applique à la lettre le mnémonique **KGBFOAM** que documente
  déjà [Équipements](./04-equipements.md) à propos du collecteur de carburant (*Fuel Scoop*) : est marquée scoopable
  toute classe dont la lettre spectrale appartient à K, G, B, F, O, A ou M, géantes et supergéantes de ces mêmes
  lettres comprises, et rien d'autre. Deux pièges en découlent : `MS` et `S` sont des valeurs d'énumération
  **distinctes** de `M` — une étoile `MS` n'est pas une étoile M — et `W` (Wolf-Rayet) n'appartient pas au mnémonique.
  La classe `X` (« Exotic ») n'ayant jamais été confirmée dans un journal réel, son cas est noté « inconnu » et non
  « non ». [Équipements](./04-equipements.md) renvoie explicitement à ce guide pour le rendement « classe stellaire
  par classe stellaire » : la réponse honnête est que la seule donnée établie est **binaire**. Aucune source
  accessible — dépôts EDDiscovery, coriolis-data, FDevIDs — ne publie de débit ni de coefficient de collecte par
  classe d'étoile ; le débit en kg/s que documente ce corpus caractérise le **module**, pas l'étoile.
- **La colonne « part EDSM » n'est PAS une fréquence galactique.** C'est le poids de chaque sous-type dans les
  113 883 869 étoiles enregistrées par EDSM, réparties en 43 sous-types dont les effectifs se somment exactement au
  total affiché. Ce relevé mesure ce que les commandants ont rapporté, avec au moins deux biais connus et non
  quantifiables : sur-représentation de la Bulle et des routes fréquentées, et sur-représentation des étoiles à
  neutrons, que les *neutron highways* font journaliser en masse. Les 3,149 % d'étoiles à neutrons se lisent « 3,149 %
  des étoiles enregistrées par les joueurs », en aucun cas « 3,149 % des étoiles de la galaxie ».
- **10 classes n'ont aucun sous-type Spansh/EDSM correspondant**, et donc aucun effectif : `DAO`, `DO`, `DOV`, `DX`,
  `CS`, `CHd`, `X`, `Nebula`, `RoguePlanet`, `StellarRemnantNebula`. Le code source de correspondance signale lui-même
  ces manques.

#### Températures et masses relevées sur 62 étoiles de journaux réels (échantillon, et non bornes de classe)

Le tableau suivant est un RELEVÉ brut, dépouillé par script sur les 43 fichiers de journal de scan du jeu de test
d'EDDiscovery. Il donne un ordre de grandeur crédible, mais il ne définit **aucune** frontière de classe : il ne
couvre que 11 des 53 classes de l'énumération, 42 classes n'y apparaissant pas une seule fois, et les effectifs par
classe vont de 1 à 18. Rien n'y interdit qu'une K existe en jeu à 3 500 K ou à 5 200 K.

| `StarType` | Corps relevés | T min (K) | T médiane (K) | T max (K) | Masse (masses solaires) |
|------------|--------------:|----------:|--------------:|----------:|------------------------:|
| `K`        |            14 |     3 803 |         4 370 |     5 063 |           0,516 – 0,902 |
| `G`        |             5 |     5 395 |         5 590 |     5 942 |           0,891 – 1,051 |
| `F`        |             2 |     6 253 |         6 274 |     6 295 |           1,051 – 1,102 |
| `A`        |             3 |     7 904 |         8 299 |     8 884 |           1,574 – 2,039 |
| `M`        |            18 |     2 008 |         3 024 |     3 657 |           0,191 – 0,465 |
| `L`        |             6 |     1 445 |         1 659 |     1 862 |           0,121 – 0,168 |
| `T`        |             6 |       929 |           986 |     1 140 |           0,047 – 0,082 |
| `Y`        |             3 |       460 |           526 |       614 |           0,020 – 0,027 |
| `DA`       |             2 |    19 194 |        21 540 |    23 887 |           0,293 – 0,406 |
| `N`        |             1 | 2 456 499 |     2 456 499 | 2 456 499 |           0,746 – 0,746 |
| `H`        |             2 |         0 |             0 |         0 |          3,195 – 31,539 |

Deux singularités du journal méritent d'être signalées, parce qu'elles ressemblent à des erreurs sans en être : les
trous noirs y déclarent une température de surface de 0 K, et l'unique étoile à neutrons du relevé en déclare
2 456 499. Les bornes de température par classe, elles, ne sont établies par aucune source accessible : les seuils que
l'on trouve dans le code d'EDDiscovery (5 500 / 8 000 / 14 000 K pour les naines blanches, par exemple) sont des
seuils de **choix d'icône** dans un outil tiers, pas des bornes de classe de Frontier.

La valeur marchande de ces étoiles est traitée plus bas, en 1.5 : depuis la version 3.3, elle ne dépend plus que de
quatre constantes et de la masse.

### 1.4 Exploration profonde : Neutron Highways, Road to Riches, Distant Worlds

#### Neutron Highways — surcharge du FSD sur étoile à neutrons

Le terme désigne l'usage de la **surcharge (« supercharge »)** du Frame Shift Drive à proximité d'une étoile à neutrons,
qui permet de démultiplier temporairement la portée de saut. En enchaînant les sauts le long d'une chaîne de neutron
stars pré-calculée (via le Neutron Router de Spansh, notamment), un commandant peut parcourir des distances
considérables très rapidement, ramenant des trajets qui prendraient des milliers de sauts en ligne droite à une fraction
de ce nombre. Même les pulsars à rotation lente permettent ce « supercharge ». Sur le plan scientifique, Canonn
documente également les étoiles à neutrons elles-mêmes : relation masse/rayon proche de la limite de
Tolman-Oppenheimer-Volkoff, diagramme de période de rotation, et vitesse tangentielle pouvant atteindre **0,192c** à
l'équateur d'un pulsar rapide.

À l'intérieur d'un système, le module **SCO** (Supercruise Overcharge — voir le [Glossaire](./00-glossaire.md))
accélère considérablement les déplacements en survitesse et l'approche des corps planétaires ; il complète utilement
les neutron highways pour la phase de trajet intra-système d'une expédition longue distance.

#### Ce que multiplie exactement une supercharge de FSD — et l'exception à la règle du ×4

Le multiplicateur de portée appliqué au saut suivant est RELEVÉ dans le référentiel d'EDDiscovery et confirmé par le
format du journal de jeu. Il n'a pas la même valeur selon la source de la surcharge :

| Source de la surcharge                             | Multiplicateur de portée | Portée du chiffre                             | Où il est relevé                                                                                 |
|----------------------------------------------------|-------------------------:|-----------------------------------------------|--------------------------------------------------------------------------------------------------|
| Étoile à neutrons (`N`)                            |                       ×4 | Tous les FSD du référentiel sauf un           | `FSDSpec.cs` (« neutron (4) ») ; `BoostUsed = 4` au journal                                      |
| Étoile à neutrons, FSD Mk II Supercharge Optimised |                       ×6 | Ce seul module                                | `ModuleList.cs` (`FSDNeutronMultiplier = 6`), champ saisi à la main par les outils d'EDDiscovery |
| Naine blanche (classes `D*`)                       |                     ×1,5 | Non différencié par module dans la source lue | `FSDSpec.cs` (« jet cone (1.5) »)                                                                |
| Injection de synthèse, qualité basique             |                    ×1,25 | Sans étoile                                   | `JournalFSDJumpCarrierJump.cs` (`BoostUsed = 1`)                                                 |
| Injection de synthèse, qualité standard            |                     ×1,5 | Sans étoile                                   | `JournalFSDJumpCarrierJump.cs` (`BoostUsed = 2`)                                                 |
| Injection de synthèse, qualité premium             |                       ×2 | Sans étoile                                   | `JournalFSDJumpCarrierJump.cs` (`BoostUsed = 3`)                                                 |

**La règle « une supercharge sur étoile à neutrons multiplie la portée par 4 » comporte une exception, et elle est
nommée.** Le référentiel de modules d'EDDiscovery porte 72 Frame Shift Drives ; sur les 67 qui renseignent le
multiplicateur de supercharge, 66 valent 4 et **un seul** vaut 6 : le module d'identifiant 129038968, dont le
catalogue EDCD/FDevIDs donne le nom de chantier naval **Mk II Supercharge Optimised Frame Shift Drive (SCO)**, de
taille 8 et de note A. Les notes de mise à jour 4.3.0.0 de Frontier (*Caspian Explorer Update*, 2 décembre 2025)
confirment l'existence de ce module et sa fonction — il amplifie l'effet de la supercharge — mais **ne chiffrent aucun
gain** : le ×6 vient d'EDDiscovery, et le champ qui le porte y est annoté comme saisi à la main par les outils du
projet. Formuler la règle sans son exception, ou attribuer le ×6 à Frontier, serait faux dans les deux cas. Deuxième
nuance sur le même référentiel : 5 FSD ne portent aucun multiplicateur, et ce sont exactement les cinq FSD classiques
de taille 8 (notes E à A) — c'est un trou du référentiel, pas une propriété du jeu, et rien ne permet d'en conclure
qu'ils ne se superchargent pas.

Un piège de vocabulaire, à connaître pour lire les sources : le code appelle « jet cone » le cas de la **naine
blanche** et « neutron » celui de l'étoile à neutrons, alors que le cône de jet est le dispositif physique commun aux
deux. L'événement de journal `JetConeBoost` est émis dans les deux cas.

Trois points solides, parce qu'ils tiennent à la structure même du journal ou du code :

- **Pas de cumul avec une injection de carburant.** Le champ `BoostUsed` d'un saut est un entier unique, valant 1, 2
  ou 3 pour les injections de synthèse et 4 pour la surcharge sur étoile à neutrons : un saut ne peut donc porter
  qu'un seul boost. Que ce soit « le plus fort qui l'emporte » est en revanche une affirmation de forum, non établie.
- **La supercharge use un module, pas la coque.** Le jeu émet un événement `JetConeDamage` dont le seul champ utile
  nomme le **module** endommagé. L'usure d'environ 1 % d'intégrité de FSD par supercharge, et la réparation à l'AFMU
  toutes les vingtaines de supercharges, sont des chiffres communautaires que ce guide ne peut pas étayer sur une
  source primaire. Les dégâts de coque et l'échauffement massif relèvent, eux, de l'avarie : tomber en vol normal à
  l'intérieur du jet, ou entrer dans la zone d'exclusion de l'étoile.
- **Le multiplicateur est un paramètre du vaisseau, pas une constante du routeur.** Le Neutron Router de Spansh (voir
  1.2) reçoit un paramètre de multiplicateur de supercharge alimenté par les caractéristiques du FSD embarqué, et le
  Galaxy Plotter reçoit en plus deux drapeaux de supercharge. Deux commandants ne routent donc pas sur la même grille
  s'ils n'ont pas le même FSD.

Ce qui reste **communautaire** : la géométrie du cône (viser son extrémité large, loin de l'étoile, entrer
tangentiellement à vitesse réduite, couper les moteurs, attendre une dizaine de secondes), le fait que la charge se
conserve jusqu'au saut suivant sans minuteur, et le danger particulier de la naine blanche — zone d'exclusion large
rapportée à la taille du cône, donc risque réel de sortie de survitesse tout près de l'étoile.

Deux réserves de méthode, enfin. Les 43 journaux de test dépouillés pour ce guide ne contiennent **aucun** événement
`JetConeBoost` : le ×4 et le ×1,5 sont établis par le code d'EDDiscovery et par le wiki communautaire, jamais par une
observation de journal. Et dans le modèle de portée d'EDDiscovery, le bonus plat du [Guardian FSD
Booster](./05-guardians.md) est ajouté **avant** la multiplication par le boost, donc lui aussi multiplié — c'est une
conséquence de l'écriture du code, qu'aucune source primaire ne confirme, et le code lui-même signale que sa formule
est probablement incorrecte pour le boost.

#### Road to Riches — cibler les systèmes à espèces exobiologiques de valeur

Méthode consistant à cibler les systèmes contenant des espèces exobiologiques à haute valeur avant de s'y rendre, plutôt
que de se poser au hasard :

1. Recherche avancée sur **EDSM** (ou sur les listes croisées EDAstro/Canonn) pour repérer les systèmes contenant des
   espèces à haute valeur (ex. *Stratum Tectonicas*) dans un rayon donné (ex. moins de 10 000 années-lumière de Sol).
2. Filtrage des espèces au-delà d'un seuil de valeur (ex. > 400 000 Cr — seuil indicatif cité par le commandant Canonn
   *JJGoldberg* dans son parcours vers le rang Exobiology Elite V, à ajuster selon l'objectif).
3. Traçage d'une route optimisée sur la liste de systèmes obtenue, à l'aide d'un outil dédié (edtools, ou directement
   l'outil **Road to Riches** de Spansh qui automatise l'ensemble de la méthode).

#### Distant Worlds — expéditions communautaires vers les confins de la galaxie

Les expéditions **Distant Worlds** sont des voyages communautaires massifs et organisés depuis la Bulle jusqu'aux
confins de la galaxie, et plus précisément jusqu'à **Beagle Point**. Elles sont documentées dans les archives Canonn
(« Distant Worlds 2 » citée comme community goal, « Distant Worlds 3302 » dans les actualités Canonn), relèvent de la
mécanique générique des **Community Goals** (voir [Community Goals](./24-community-goals.md)) et se déroulent le plus
souvent en **Wing** organisé (voir [Wings, Multicrew et CQC](./23-jeu-en-groupe.md)). Leur récit et leur place dans la
chronologie figurent dans [Lore](./01-lore.md) ; ce qui suit en donne la logistique vérifiable, telle que
l'enregistrent les fiches d'expédition d'EDSM et le site officiel de la dernière édition. Les distances de route
listées ci-dessous (parcours réel, en sauts successifs) ne doivent pas être confondues avec la distance **en ligne
droite** entre Sol et Beagle Point (≈ 65 279 al, toujours inférieure à une distance de route) — voir
[32-geographie-galactique.md §3 et §5.3](./32-geographie-galactique.md), qui donne aussi le référentiel spatial
complet (rayon de la Bulle, Sagittarius A*, Colonia) absent jusqu'ici de ce guide.

Trois éditions ont eu lieu. Le tableau les recense — 3 lignes, recomptées sur son contenu —, et distingue
systématiquement les grandeurs qui circulent sous le même mot :

| Édition                     | Dates réelles                              | Dates in-game                   | Organisateur                     | Participants                                                                                              | Itinéraire                                                                                      | Waypoints                                                         |
|-----------------------------|--------------------------------------------|---------------------------------|----------------------------------|-----------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| **Distant Worlds** (DW1)    | 14 janv. 2016 → 5 juin 2016                | 14 janv. 3302 → 5 juin 3302     | CMDR Erimus Kamzel               | 911 sur le suivi EDSM (dont 446 comptes EDSM) ; « plus de 1 000 commandants » selon [Lore](./01-lore.md)  | Pallaeni (camp de base *Brooks Point*, sur Pallaeni A 1) → Beagle Point ; 81 129,92 al estimées | 24 étapes listées ; le champ « Waypoints » de la fiche affiche 22 |
| **Distant Worlds II** (DW2) | 13 janv. 2019 → 14 juin 2019               | 13 janv. 3305 → 14 juin 3305    | Non établi sur source accessible | 4 380 sur le suivi EDSM (1 727 abandons, 2 647 réussites) ; « environ 10 000 » selon [Lore](./01-lore.md) | Pallaeni → Beagle Point ; 73 107,27 al estimées                                                 | 12 étapes listées ; le champ « Waypoints » de la fiche affiche 10 |
| **Distant Worlds 3** (DW3)  | Départ non établi → achevée le 18 mai 2026 | Départ non établi → 18 mai 3312 | CMDR Erimus Kamzel               | Non établi                                                                                                | Non établi                                                                                      | Non établi                                                        |

Cinq mises en garde accompagnent ce tableau, et aucune n'est cosmétique :

- **Les effectifs ne sont pas comparables entre eux.** Trois grandeurs distinctes circulent : les inscrits au suivi
  EDSM (911 pour DW1, 4 380 pour DW2), les comptes EDSM parmi eux (446 pour DW1), et les estimations globales de
  participation reprises par [Lore](./01-lore.md) (« plus de 1 000 » et « environ 10 000 »). Substituer l'une à
  l'autre fausse tout.
- **Les colonnes d'EDSM ne partitionnent pas le total.** Pour DW2, 1 727 abandons et 2 647 réussites font 4 374, soit
  6 inscrits sans statut enregistré sur 4 380 ; pour DW1, 132 et 329 font 461 sur 911, soit 450 sans statut. Écrire
  « x commandants ont abandonné, les autres ont réussi » serait donc faux.
- **Le champ « Waypoints » d'EDSM ne compte pas ce que compte sa propre table.** DW1 annonce 22 waypoints pour
  24 lignes, DW2 en annonce 10 pour 12 : un écart de +2 dans les deux cas, qui suggère que le système de départ et le
  système d'arrivée ne sont pas comptés. La lecture est cohérente sur les deux fiches examinées, mais elle reste une
  inférence sur deux cas : le tableau reporte les deux valeurs sans trancher.
- **Les durées annoncées et les durées enregistrées ne mesurent pas la même chose.** DW2 est décrite comme un voyage
  de 18 semaines — la durée annoncée du programme —, alors que l'écart entre les deux bornes du tracker vaut
  151 jours, soit 21,6 semaines. Les deux chiffres sont justes ; ils ne répondent pas à la même question. DW1, sur les
  mêmes bornes EDSM, a duré 142 jours (20,3 semaines).
- **DW3 n'a pas de logistique publiable.** Le site officiel affiche bien le statut « Complete », l'organisateur et
  l'actualité de clôture, mais ses compteurs de participants et son libellé de prochain waypoint sont des conteneurs
  remplis côté client : ils sont vides à la capture. L'expédition n'a par ailleurs aucune fiche EDSM. Et son
  « Expedition Timer » ne permet pas de reconstituer une date : rapporté à la date de coupure affichée sur la même
  page, il remonte au 14 mai 2026 en comptant des mois de 30 jours et au 11 mai 2026 en comptant des mois de 31 jours,
  alors que l'écart réel entre le 18 mai 2026 et le 10 septembre 2026 est de 115 jours. Il ne recale sur aucune
  hypothèse.

Le détail des étapes de DW2, tel que l'enregistre sa fiche EDSM, donne une idée de l'échelle d'une telle expédition —
**12 étapes** recomptées sur la table, du départ de Pallaeni à l'arrivée à Beagle Point :

| #  | Système (points d'intérêt)                                                      | Distance depuis le départ |
|----|---------------------------------------------------------------------------------|---------------------------|
| 1  | Pallaeni                                                                        | — (système de départ)     |
| 2  | Omega Sector VE-Q b5-15 (Omega Mining Operation)                                | 5 421,59 al               |
| 3  | Pru Aescs NC-M d7-192                                                           | 9 133,81 al               |
| 4  | Clooku EW-Y c3-197                                                              | 13 182,44 al              |
| 5  | Boewnst KS-S c20-959 (Polo Harbour / The Grand Formation / The Venetian Nebula) | 17 772,05 al              |
| 6  | Dryau Ausms KG-Y e3390 (DSSA Buurian Anchorage / The Dryau Awesomes)            | 24 435,33 al              |
| 7  | Stuemeae KM-W c1-342 (Armstrong Landing)                                        | 29 772,77 al              |
| 8  | Hypiae Phyloi LR-C d22 ('Lower' Goliath's Rest)                                 | 36 988,92 al              |
| 9  | Phroi Bluae QI-T e3-3454 (DSSA HSRC Limpet's Call / Cerulean Tranquility)       | 41 905,80 al              |
| 10 | Bleethuae NI-B d674 (Morphenniel Nebula)                                        | 45 133,02 al              |
| 11 | Smootoae QY-S d3-202 (Luna's Shadow)                                            | 59 589,34 al              |
| 12 | Beagle Point (DSSA Distant Worlds 'Endeavour')                                  | 73 107,27 al              |

Deux réserves sur ce tableau. D'une part, rien ne garantit que la table d'EDSM reproduise la route officielle validée
par les organisateurs : ces listes sont à lire comme un relevé de tracker, pas comme un itinéraire officiel. D'autre
part, ce guide et [Lore](./01-lore.md) ne datent pas la première expédition de la même façon : le guide de lore
retient « fin 2015 - début 2016 », là où la fiche EDSM enregistre un départ le 14 janvier 2016 et une arrivée le
5 juin 2016. Le départ concorde ; la borne de fin, non. La divergence est signalée ici et laissée à l'arbitrage du
guide concerné.

Le détail logistique évolue d'une édition à l'autre : il reste conseillé de consulter les canaux officiels de la
communauté avant de s'engager sur une expédition en cours.

### 1.5 Vendre ses données d'exploration aux comptoirs Universal Cartographics

Les données de scan — relevés FSS et cartographies DSS — se vendent aux comptoirs **Universal Cartographics** dans les
stations. Un bonus de **« première découverte »** (*first discovered*) et de **« première cartographie »** (*first
mapped*) — c'est-à-dire un corps jamais rapporté par un autre commandant — majore significativement la valeur de la
vente. Les sous-sections qui suivent chiffrent ce barème corps par corps, donnent les deux formules de calcul et
disent d'où viennent ces nombres — ainsi que ce qu'ils ne prouvent pas.

#### Cas particulier : mondes remarquables (Earth-like Worlds et Water Worlds), les corps les mieux valorisés

Deux catégories de corps planétaires se distinguent systématiquement par la valeur de leurs données d'exploration, bien
au-delà de la moyenne des autres types de planète :

- **Earth-like World (ELW)** : planète tellurique à atmosphère respirable proche de celle de la Terre. C'est le type de
  corps le plus recherché par les explorateurs de données, et l'un des plus rares de la galaxie.
- **Water World (WW)** : planète à hydrosphère liquide en surface, sans atmosphère respirable. Moins rare qu'un ELW mais
  toujours nettement plus valorisée qu'une planète rocheuse ou une géante gazeuse classique.

Les deux types partagent des propriétés utiles à connaître :

- Ils sont détectables **avant même le scan DSS complet**, dès le passage au FSS : leur signature de fréquence présente
  une forme caractéristique différente des autres corps telluriques, ce qui permet à un explorateur entraîné de les
  repérer à l'oreille/à l'œil sur l'interface FSS sans attendre l'analyse complète.
- Leur valeur de vente aux comptoirs Universal Cartographics ne dépend, dans l'implémentation de référence de la
  communauté, que de **deux entrées** : une constante attachée au type de corps et la masse de celui-ci. Ni le rayon,
  ni la distance parcourue depuis la dernière station n'y interviennent, contrairement à ce que répètent beaucoup de
  guides — voir le barème chiffré et ses réserves ci-dessous. Un monde de type terrestre d'une masse terrestre vaut
  283 628 Cr au scan seul, et 3 546 696 Cr en première découverte suivie d'une première cartographie sous Odyssey ;
  un monde océanique de même masse, 101 520 Cr au scan seul, et 283 628 Cr s'il est terraformable — soit exactement
  la valeur d'un monde de type terrestre.
- Ils sont également des cibles privilégiées pour la **colonisation** (voir 1.7 ci-dessous) : un ELW ou un WW dans un
  système autrement éligible en fait une cible de choix pour un projet d'implantation à vocation agricole ou
  touristique.

#### Combien vaut le scan d'un corps : les deux formules de valeur (version 3.3 et suivantes)

Ce guide reproduit ci-dessous le barème complet, avec une réserve qu'il faut lire avant les chiffres : **ces valeurs
sont celles que calcule l'implémentation de référence de la communauté** — le fichier `EstimatedValues.cs` du projet
ouvert EDDiscovery — et non un barème publié par Frontier. L'événement `Scan` du journal ne porte aucun montant en
crédits, et aucun test du dépôt n'assortit un scan d'une valeur attendue : dans les sources accessibles, il n'existe
donc **aucune valeur observée en jeu** à laquelle confronter ce barème. Ce qui suit est vérifié comme calcul, pas
comme relevé de caisse.

Le calcul retenu dépend de l'horodatage du scan, et non de la version du jeu installée. Tout scan postérieur au
11 décembre 2018 à 9 h 00 UTC relève de la branche « 3.3 et suivantes », la seule qui s'applique aujourd'hui. Les deux
branches antérieures servent uniquement à revaloriser de vieilles entrées de journal et ne doivent jamais être citées
comme « les valeurs du jeu ». La distinction n'est pas cosmétique : la plus ancienne des trois n'est pas une formule
mais une table de **relevés** de terrain, dont le code conserve en commentaire les fourchettes observées en jeu ; les
deux autres sont des formules. Confondre les deux, c'est présenter un relevé comme un calcul.

**Formule stellaire** — `valeur = k + (m × k / 66,25)`, où `m` est la masse stellaire en masses solaires (champ
`StellarMass` du journal ; 1,0 si le champ manque). Ni plancher, ni plafond.

**Formule planétaire** — `valeur = max( k + k × m^0,2 × 0,56591828 , 500 )`, où `m` est la masse en masses terrestres
(champ `MassEM` ; 1,0 par défaut). Le plancher de 500 Cr est réel, et il mord.

Dans les deux cas, `k` est une constante attachée au type de corps, et la valeur publiée est **tronquée** vers zéro,
pas arrondie. Ni le rayon du corps, ni la distance parcourue depuis la dernière station n'interviennent dans ces
formules.

#### Barème de la valeur de scan d'une planète, type par type

Les 19 types planétaires de l'énumération du jeu se répartissent en **7 valeurs de k seulement** : les types qui
partagent la même valeur sont regroupés sur une même ligne. La colonne « k retenu » est RELEVÉE dans le code ; les
quatre colonnes de valeur sont DÉRIVÉES PAR CALCUL, à la masse de référence de **1 masse terrestre**, pour un corps
**non terraformable**, bonus Odyssey **actif** (c'est le cas courant : l'indicateur est levé dès que la version du jeu
commence par 4).

| Type de corps (types de valeur k identique regroupés)                                                                                                                       | k retenu | Scan seul | Première découverte | Cartographié au DSS | 1re découverte + 1re cartographie |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------:|----------:|--------------------:|--------------------:|----------------------------------:|
| Monde de type terrestre (Earth-like world)                                                                                                                                  |  181 126 |   283 628 |             737 434 |           1 229 056 |                         3 546 696 |
| Monde d'ammoniac (Ammonia world)                                                                                                                                            |   96 932 |   151 787 |             394 647 |             657 746 |                         1 898 061 |
| Monde océanique (Water world)                                                                                                                                               |   64 831 |   101 520 |             263 952 |             439 920 |                         1 269 480 |
| Corps riche en métaux (Metal-rich body)                                                                                                                                     |   21 790 |    34 121 |              88 715 |             147 859 |                           426 678 |
| Corps à haute teneur en métaux (High metal content body) et géante gazeuse de classe II (Sudarsky class II gas giant)                                                       |    9 654 |    15 117 |              39 305 |              65 508 |                           189 038 |
| Géante gazeuse de classe I (Sudarsky class I gas giant)                                                                                                                     |    1 656 |     2 593 |               6 742 |              11 237 |                            32 426 |
| Branche par défaut : les 12 autres types (corps rocheux, glacé, rocheux et glacé, géantes gazeuses de classes III, IV et V, géantes d'eau, géantes à vie, géantes d'hélium) |      300 |       500 |               1 300 |               2 221 |                             6 252 |

Sans le bonus Odyssey — c'est-à-dire pour un scan journalisé par un client antérieur à la 4.0 — seules les deux
colonnes de cartographie changent :

| Type de corps (types de valeur k identique regroupés)                                                                                                                       | k retenu | Scan seul | Première découverte | Cartographié au DSS | 1re découverte + 1re cartographie |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------:|----------:|--------------------:|--------------------:|----------------------------------:|
| Monde de type terrestre (Earth-like world)                                                                                                                                  |  181 126 |   283 628 |             737 434 |             945 428 |                         2 728 227 |
| Monde d'ammoniac (Ammonia world)                                                                                                                                            |   96 932 |   151 787 |             394 647 |             505 958 |                         1 460 047 |
| Monde océanique (Water world)                                                                                                                                               |   64 831 |   101 520 |             263 952 |             338 400 |                           976 523 |
| Corps riche en métaux (Metal-rich body)                                                                                                                                     |   21 790 |    34 121 |              88 715 |             113 737 |                           328 213 |
| Corps à haute teneur en métaux (High metal content body) et géante gazeuse de classe II (Sudarsky class II gas giant)                                                       |    9 654 |    15 117 |              39 305 |              50 391 |                           145 414 |
| Géante gazeuse de classe I (Sudarsky class I gas giant)                                                                                                                     |    1 656 |     2 593 |               6 742 |               8 643 |                            24 943 |
| Branche par défaut : les 12 autres types (corps rocheux, glacé, rocheux et glacé, géantes gazeuses de classes III, IV et V, géantes d'eau, géantes à vie, géantes d'hélium) |      300 |       500 |               1 300 |               1 666 |                             4 809 |

**Terraformabilité.** Trois types sur 19 ne réagissent pas à l'indicateur terraformable : le monde de type terrestre,
dont le bonus est déjà compris dans son k ; le monde d'ammoniac et la géante gazeuse de classe I, où l'indicateur
n'est tout simplement pas lu. Pour les 16 autres types, le bonus s'ajoute à k **avant** tout calcul — d'où les 4
lignes suivantes, bonus Odyssey actif :

| Type de corps (types de valeur k identique regroupés)                                                                                                                       | k retenu | Scan seul | Première découverte | Cartographié au DSS | 1re découverte + 1re cartographie |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------:|----------:|--------------------:|--------------------:|----------------------------------:|
| Monde océanique (Water world)                                                                                                                                               |  181 126 |   283 628 |             737 434 |           1 229 056 |                         3 546 696 |
| Corps riche en métaux (Metal-rich body)                                                                                                                                     |   87 421 |   136 894 |             355 924 |             593 207 |                         1 711 823 |
| Corps à haute teneur en métaux (High metal content body) et géante gazeuse de classe II (Sudarsky class II gas giant)                                                       |  110 331 |   172 769 |             449 200 |             748 667 |                         2 160 432 |
| Branche par défaut : les 12 autres types (corps rocheux, glacé, rocheux et glacé, géantes gazeuses de classes III, IV et V, géantes d'eau, géantes à vie, géantes d'hélium) |   93 628 |   146 613 |             381 195 |             635 326 |                         1 833 365 |

Une conséquence directe de la construction du code : un monde océanique terraformable vaut **exactement** autant qu'un
monde de type terrestre, puisque le k du second est posé comme la somme du k du premier et de son bonus de
terraformabilité. Les deux lignes portent les mêmes chiffres, et ce n'est pas une coïncidence.

**Effet de la masse.** Il est réel mais lent, la masse intervenant à la puissance 0,2. Les deux colonnes ci-dessous
sont DÉRIVÉES, pour un corps non terraformable, hors bonus Odyssey :

| Masse (masses terrestres) | Monde de type terrestre — scan seul | Corps glacé — scan seul |
|--------------------------:|------------------------------------:|------------------------:|
|                      0,01 |                             221 932 |                     500 |
|                      0,10 |                             245 800 |                     500 |
|                      1,00 |                             283 628 |                     500 |
|                     10,00 |                             343 581 |                     569 |
|                    100,00 |                             438 600 |                     726 |
|                  1 000,00 |                             589 195 |                     975 |

Ce petit tableau montre au passage que le plancher de 500 Cr n'est pas décoratif : un corps glacé y est encore collé à
1 masse terrestre et ne s'en détache qu'entre 1 et 10 masses terrestres. Toute la branche par défaut — 12 types sur 19
— plafonne au plancher tant que le corps est léger.

#### Les 8 valeurs possibles d'un même corps : multiplicateurs, bonus Odyssey et ordre des opérations

Six multiplicateurs seulement interviennent, tous RELEVÉS dans le code :

| Multiplicateur                                                       | Valeur                  | S'applique à                   | Variable ou motif dans le code      | Ligne |
|----------------------------------------------------------------------|-------------------------|--------------------------------|-------------------------------------|------:|
| Première découverte (*first discovered*)                             | ×2,6                    | Étoiles et planètes            | `firstdiscovery`                    |    81 |
| Première découverte **et** première cartographie                     | ×3,699622554, puis ×2,6 | Planètes seules                | `mapmultforfirstdiscoveredmapped`   |   130 |
| Première cartographie seule                                          | ×8,0956                 | Planètes seules                | `mapmultforfirstmappedonly`         |   131 |
| Corps déjà découvert et cartographié, que l'on cartographie soi-même | ×3,3333333              | Planètes seules                | `mapmultforalreadymappeddiscovered` |   132 |
| Cartographie efficace (objectif de sondes tenu)                      | ×1,25                   | Planètes seules                | `effmapped`                         |   128 |
| Bonus Odyssey                                                        | +30 %, plancher 555 Cr  | Cartographie de planètes seule | `Math.Max(v * 0.3, 555)`            |   154 |

Leur combinaison produit 8 valeurs distinctes pour un même corps, selon ce que le commandant a fait et selon ce que
d'autres avaient déjà fait avant lui. Le tableau ci-dessous les donne toutes, DÉRIVÉES PAR CALCUL, pour deux corps de
référence à 1 masse terrestre : un monde de type terrestre et un corps glacé.

| Situation du commandant                                         | Propriété du code                                     | Terrestre, sans Odyssey | Terrestre, avec Odyssey | Corps glacé, sans Odyssey | Corps glacé, avec Odyssey |
|-----------------------------------------------------------------|-------------------------------------------------------|------------------------:|------------------------:|--------------------------:|--------------------------:|
| Scan seul, corps déjà découvert et déjà cartographié            | `EstimatedValueBase`                                  |                 283 628 |                 283 628 |                       500 |                       500 |
| Scan seul, première découverte                                  | `EstimatedValueFirstDiscovered`                       |                 737 434 |                 737 434 |                     1 300 |                     1 300 |
| Cartographié au DSS, corps déjà découvert et cartographié       | `EstimatedValueMapped`                                |                 945 428 |               1 229 056 |                     1 666 |                     2 221 |
| Idem, cartographie efficace                                     | `EstimatedValueMappedEfficiently`                     |               1 181 785 |               1 536 321 |                     2 083 |                     2 777 |
| Première cartographie seule (corps déjà découvert par un autre) | `EstimatedValueFirstMapped`                           |               2 296 143 |               2 984 985 |                     4 047 |                     5 262 |
| Première cartographie seule, efficace                           | `EstimatedValueFirstMappedEfficiently`                |               2 870 178 |               3 731 232 |                     5 059 |                     6 577 |
| Première découverte + première cartographie                     | `EstimatedValueFirstDiscoveredFirstMapped`            |               2 728 227 |               3 546 696 |                     4 809 |                     6 252 |
| Idem, cartographie efficace                                     | `EstimatedValueFirstDiscoveredFirstMappedEfficiently` |               3 410 284 |               4 433 370 |                     6 011 |                     7 815 |

Trois conséquences de l'ordre des opérations, qui sont des dérivations et non des relevés :

1. **Le bonus Odyssey ne s'applique qu'aux valeurs de cartographie.** Ni la valeur de base, ni la valeur de première
   découverte ne passent par la fonction qui l'applique. Scanner un corps sans le cartographier ne rapporte pas un
   crédit de plus sous Odyssey — les deux premières lignes du tableau le montrent, identiques d'une colonne à l'autre.
2. **Sur la colonne « première découverte + première cartographie », le plancher Odyssey vaut 1 443 Cr et non 555.**
   Le bonus y est appliqué **avant** le ×2,6, qui le multiplie à son tour.
3. **Le ×1,25 de cartographie efficace est appliqué après le bonus Odyssey**, dont il majore donc aussi les 30 %. Il
   ne multiplie jamais la valeur de base seule.

Le bonus Odyssey ne vaut d'ailleurs pas toujours +30 % : c'est le plus grand des deux termes qui l'emporte. Sur un
corps glacé d'une masse terrestre, la cartographie d'un corps déjà connu passe de 1 666 à 2 221 Cr, soit exactement
+555 Cr — le plancher — et non les +499 Cr qu'aurait donnés une hausse de 30 %.

Enfin, la « cartographie efficace » désigne le fait de boucler la cartographie au sondeur de surface détaillé sans
dépasser l'objectif de sondes que le jeu associe au corps. Le fichier de référence porte **uniquement** le
multiplicateur : ni l'objectif de sondes par corps, ni la règle qui décide si le bonus est acquis ne s'y trouvent.
Écrire « il faut n sondes » sur la foi de cette source serait une invention.

#### Valeur de scan d'une étoile : quatre constantes seulement, et aucune cartographie

Depuis la version 3.3, le jeu ne différencie plus la valeur de scan des classes stellaires principales. Une O, une B,
une A, une F, une G, une K, une M, une naine brune, une Wolf-Rayet, une carbonée, une T Tauri, une géante ou une
supergéante partagent toutes le même k. Il n'existe que **4 valeurs de k** en tout : 18 classes sur 53 en reçoivent
une spécifique, les 35 autres retombent sur le k par défaut. Il n'existe donc **pas** de table de valeur par classe
stellaire : la liste détaillée classe par classe que l'on trouve encore dans d'anciens guides appartient à la branche
antérieure à 2017, qui ne concerne plus aucun scan actuel.

| Groupe de classes (version 3.3 et suivantes)                                                                                   |       k | Scan seul à 1 masse solaire | Première découverte (×2,6) |
|--------------------------------------------------------------------------------------------------------------------------------|--------:|----------------------------:|---------------------------:|
| Naines blanches : les 15 classes `D*`                                                                                          |  14 057 |                      14 269 |                     37 099 |
| Étoile à neutrons `N` et trou noir `H`                                                                                         |  22 628 |                      22 969 |                     59 720 |
| Trou noir supermassif `SuperMassiveBlackHole` (chiffre non fiable, voir les trous ci-dessous)                                  | 33,5678 |                          34 |                         88 |
| Branche par défaut : les 35 autres classes (`O`, `B`, `A`, `F`, `G`, `K`, `M`, naines brunes, Wolf-Rayet, carbonées, géantes…) |   1 200 |                       1 218 |                      3 167 |

Conséquence, contre-intuitive mais directe : à masse égale, une O massive ne rapporte pas plus qu'une naine rouge M.
L'écart observé en jeu entre les deux vient uniquement du terme de masse, comme le montre ce tableau DÉRIVÉ :

| Masse (masses solaires) | Classe ordinaire (k = 1 200) | Naine blanche | Étoile à neutrons ou trou noir |
|------------------------:|-----------------------------:|--------------:|-------------------------------:|
|                     0,1 |                        1 201 |        14 078 |                         22 662 |
|                     0,5 |                        1 209 |        14 163 |                         22 798 |
|                     1,0 |                        1 218 |        14 269 |                         22 969 |
|                     2,0 |                        1 236 |        14 481 |                         23 311 |
|                    10,0 |                        1 381 |        16 178 |                         26 043 |
|                    60,0 |                        2 286 |        26 787 |                         43 121 |

Trois précisions propres aux étoiles, qu'il ne faut pas transposer depuis les planètes : **une étoile ne se
cartographie pas** — la branche stellaire du code ne renseigne aucune des propriétés de cartographie —, le **bonus
Odyssey ne s'y applique pas**, et les multiplicateurs ×3,699622554, ×8,0956, ×3,3333333 et ×1,25 sont exclusivement
planétaires. Seul le ×2,6 de première découverte vaut aussi pour les étoiles.

#### Ce que ce barème ne dit pas : les trous à connaître

- **Aucune valeur de référence relevée en jeu.** C'est le trou principal. Les chiffres ci-dessus sont « ce que calcule
  l'implémentation de référence d'EDDiscovery », pas « ce que Frontier paie ». Aucun test unitaire du dépôt, aucun
  événement `SellExplorationData` ou `MultiSellExplorationData` des journaux disponibles ne permet le recoupement par
  le total encaissé.
- **Deux constantes sont déclarées non confirmées par les auteurs du code eux-mêmes** : le k du corps riche en métaux
  (21 790) et celui du trou noir supermassif (33,5678) portent tous deux en commentaire la mention *not confirmed in
  game*. Les lignes correspondantes des tableaux en héritent.
- **La valeur d'un trou noir supermassif n'est pas exploitable.** Son k produit 34 Cr à une masse solaire, moins
  qu'une étoile banale ; or toute la valeur d'un tel objet vient de sa masse, et aucune source accessible ici ne donne
  la masse typique d'un trou noir supermassif du jeu. Le chiffre est exact au regard de la formule et dénué de sens en
  jeu : il ne doit pas être cité comme la valeur d'un trou noir supermassif réel.
- **La condition d'obtention du bonus de cartographie efficace n'est pas dans la source**, seul le multiplicateur
  l'est.
- **Ni la prime de découverte du système au « honk » et au FSS, ni les primes de première empreinte (*first
  footfall*), ni les bonus liés à la cartographie complète d'un système ne relèvent de ce barème** : ils ne figurent
  pas dans le fichier de référence et ne sont donc pas chiffrés ici.
- **Un cas de journal reste inexpliqué** : celui d'un corps marqué non découvert mais déjà cartographié. Le code lui
  attribue alors la valeur de base ou la valeur « déjà cartographié », jamais celle de première découverte, sans que
  la raison pour laquelle le jeu produit cet état soit documentée dans les sources lues.

#### Provenance des constantes du barème, ligne à ligne

Le tableau ci-dessous donne, pour chaque constante et chaque règle citée plus haut, le motif exact recherché dans le
fichier source et le numéro de ligne où il se trouve. Fichier :
`EliteDangerousCore/EliteDangerous/FrontierData/Enumerations/EstimatedValues.cs`, dépôt
EDDiscovery/EliteDangerousCore, commit `f21533ba1609d309fd6a96b9b3bb488df178a36e` (7 septembre 2026), 825 lignes. Les
21 motifs ont été retrouvés par recherche littérale, aucun n'est ressorti introuvable.

| Constante ou règle                                       | Motif exact dans le code              | Ligne |
|----------------------------------------------------------|---------------------------------------|------:|
| Naines blanches, les 15 classes `D*`                     | `kValue = 14057;`                     |    63 |
| Étoile à neutrons `N` et trou noir `H`                   | `kValue = 22628;`                     |    68 |
| Trou noir supermassif                                    | `kValue = 33.5678;`                   |    73 |
| Toute autre classe stellaire (branche par défaut)        | `kValue = 1200;`                      |    77 |
| Corps riche en métaux                                    | `kValue = 21790;`                     |    99 |
| Corps riche en métaux, bonus terraformable               | `kValue += 65631;`                    |   100 |
| Monde d'ammoniac                                         | `kValue = 96932;`                     |   103 |
| Géante gazeuse de classe I                               | `kValue = 1656;`                      |   106 |
| Haute teneur en métaux et géante de classe II            | `kValue = 9654;`                      |   110 |
| Haute teneur en métaux et classe II, bonus terraformable | `kValue += 100677;`                   |   111 |
| Monde océanique                                          | `kValue = 64831;`                     |   114 |
| Monde océanique, bonus terraformable                     | `kValue += 116295;`                   |   115 |
| Monde de type terrestre (océanique + son bonus)          | `kValue = 64831 + 116295;`            |   119 |
| Tout autre type planétaire (branche par défaut)          | `kValue = 300;`                       |   122 |
| Branche par défaut, bonus terraformable                  | `kValue += 93328;`                    |   123 |
| Formule stellaire                                        | `return k + (m * k / 66.25);`         |   159 |
| Constante q de la formule planétaire                     | `const double q = 0.56591828;`        |   164 |
| Plancher planétaire de 500 Cr                            | `Math.Pow(m, 0.2) * q)), 500);`       |   165 |
| Bonus Odyssey : +30 %, plancher 555 Cr                   | `Math.Max(v * 0.3, 555)`              |   154 |
| Bascule vers la branche « ED 2.2 »                       | `utc < EliteReleaseDates.Release_2_2` |    25 |
| Bascule vers la branche « ED 3.2 »                       | `utc < EliteReleaseDates.Release_3_3` |    31 |

### 1.6 Boîte à outils du commandant explorateur : les sites Canonn Research

En complément d'EDSM et Spansh, l'écosystème **Canonn Research** propose des outils spécialisés :

| Outil                  | Adresse                                | Fonction                                                                                                |
|------------------------|----------------------------------------|---------------------------------------------------------------------------------------------------------|
| Signals                | signals.canonn.tech                    | Affiche le contenu (biologie/géologie) détecté dans un système                                          |
| Bioforge               | bioforge.canonn.tech                   | Moteur de recherche et d'affichage des données système/corps scannables (biologie), par genre ou espèce |
| Codex-Regions          | canonn-science.github.io/Codex-Regions | Carte des éléments du Codex localisés                                                                   |
| Undiscovered-Codex     | —                                      | Éléments du Codex non encore scannés par le commandant connecté                                         |
| EDMC-Canonn            | github.com/canonn-science/EDMC-Canonn  | Plugin EDMC officiel : capture les événements de jeu et alimente les bases Canonn                       |
| Bifrost                | ruins.canonn.tech                      | Catalogue et visualise les sites de ruines Gardiennes (Guardian)                                        |
| Unknown Structures Map | map.canonn.tech                        | Carte 3D des sites de structures Thargoïdes — voir aussi [Combat AX](./25-combat-ax.md)                 |

### 1.6bis Le Codex in-game : mécanisme, branches et limites

Le tableau de la section 1.6 cite déjà deux outils Canonn qui exploitent ou complètent le **Codex** (Codex-Regions,
Undiscovered-Codex), sans que ce guide n'ait jamais expliqué ce système lui-même — une lacune d'autant plus risquée
que le nom « Codex » désigne **deux choses distinctes** dans le corpus (voir l'encart de désambiguïsation en fin de
sous-section).

**Origine et structure.** Le Codex est une fonctionnalité intégrée au client du jeu, introduite le **11 décembre
2018** avec la mise à jour *Elite Dangerous: Beyond — Chapitre Quatre* (version 3.3), présentée à sa sortie comme
« une base de données en réseau… initiative conjointe de la Pilots Federation et d'Universal Cartographics ». Il se
compose de **4 onglets** : **Commander** (statistiques personnelles, et une **Archive** de logs audio/texte trouvés
sur le terrain — voir plus bas), **Discoveries** (le journal de découvertes proprement dit, détaillé ci-dessous),
**Knowledge Base** (hub de lore : superpuissances, figures clés, organisations, histoire thargoïde) et **Pilot's
Handbook** (guide in-fiction des activités du jeu).

**Organisation par région galactique.** À l'intérieur de l'onglet Discoveries, la galaxie est découpée en **42
régions galactiques** — exactement le découpage détaillé en
[32-geographie-galactique.md §4](./32-geographie-galactique.md) — et chaque région affiche ses entrées réparties
en trois catégories documentées (Stellar Bodies ; Biological and Geological ; Civilisations, cette dernière
regroupant Guardian, Thargoïde et sites humains). *Cette répartition en 3 catégories est celle documentée au
lancement de la fonctionnalité (2018-2021) ; elle n'a pas pu être revérifiée sur une version 2026 du jeu lors de
cette révision — à confirmer en jeu avant de l'affirmer comme la structure actuelle.* Chaque entrée progresse en
trois états : **Rumoured** (indice non confirmé), **Reported** (un autre commandant l'a trouvée en premier, visible
pour tous dans la région) puis **Discovered** (scannée personnellement) — ce qui fait du Codex, de facto, une
**checklist de complétion** par région et par catégorie.

**Crédit de première découverte.** Le mécanisme originel (2018) attribuait un « Codex Voucher » — 50 000 Cr pour un
premier type de corps stellaire, une première espèce biologique ou une première découverte xénologique dans une
région, 2 500 Cr pour les scans suivants d'une même catégorie — à encaisser en station, sans quoi il se perd à la
destruction du vaisseau. *Ces montants datent du lancement de la fonctionnalité et n'ont pas été reconfirmés comme
actuels ; ne pas les citer comme un tarif 2026.* Le bonus **exobiologie** documenté ailleurs dans ce guide
(« First Logged », multiplicateur ×5 retenu par ce guide, voir 2.5) est très probablement la déclinaison moderne et
spécifique-à-la-biologie de ce même principe de « première mondiale en région » plutôt qu'un système entièrement
distinct : dans les deux cas, le **log Codex** est instantané et gratuit dès le scan, alors que le **crédit** ne se
touche qu'à la vente/l'encaissement en station. Une lecture agrégée de fils communautaires (hors de ce guide)
rapporte parfois un multiplicateur ×4 concurrent pour ce même bonus : ce guide retient ×5, conformément à sa propre
section 2.5, plutôt que de trancher entre les deux ici.

### 1.6ter Ce que le Codex ne fait pas, et sa distinction avec le Codex Canonn

**Ce que le Codex NE fait PAS.** Aucune des trois catégories de Discoveries ne porte d'état « cartographié » : le
Codex logge des **types** de découvertes (tel corps stellaire, telle espèce, tel site), pas la cartographie
individuelle d'une planète. Le bonus de **première cartographie** (*first mapped*, au DSS — voir section 1.5) est un
système de paiement distinct, propre à la vente de données d'exploration à Universal Cartographics, suivi
indépendamment du Codex — une inférence bien étayée par l'absence de tout état « mapped » dans la taxonomie
documentée, mais qu'aucune source consultée n'énonce mot pour mot.

**Lore exclusif au Codex.** L'onglet Commander → Archive conserve les logs audio/texte trouvés en jeu (colonies
abandonnées, vaisseaux-générations, ruines Guardian) — c'est le cas des **28 Guardian Logs** de Ram Tah (voir
[05-guardians.md §11](./05-guardians.md#11-ce-que-révèlent-les-28-logs-guardian)), un contenu narratif qui n'existe
nulle part ailleurs (ni article GalNet, ni page officielle) que dans cette archive in-jeu, transcrit ensuite par la
communauté à titre de référence.

> **Désambiguïsation impérative : Codex du jeu vs Codex Canonn.** Le **Codex in-jeu**, décrit ci-dessus, est une
> fonctionnalité first-party de Frontier Developments, intégrée au client. Le **« Codex Canonn »**
> (canonn.science/codex/) est un **site communautaire** tenu par le groupe de recherche Canonn, organisé en quatre
> départements **définis par la communauté** — Archéologie & Histoire, Cartographie & Exploration, Géologie &
> Organismes de Surface, Technologie Xéno (voir [05-guardians.md](./05-guardians.md) et
> [16-outils.md §4](./16-outils.md)) — qui complète le Codex officiel avec de la recherche et des logs transcrits par
> les joueurs, sans être affilié à Frontier ni s'y substituer. Les deux portent le même nom par hommage/convergence,
> mais ne doivent jamais être cités l'un pour l'autre dans une réponse.

### 1.7 Exploration et colonisation : repérer un système éligible à l'implantation

Depuis l'ajout de la **colonisation de systèmes** (mécanique introduite en bêta le 26 février 2025 avec la mise à jour
« Trailblazers », puis sortie de bêta le 11 novembre 2025 avec le « Dodec Update » — voir
[Colonisation](./18-colonisation.md) pour la mécanique complète et à jour), l'exploration a gagné un débouché
supplémentaire : **repérer, en amont, des systèmes éligibles à la colonisation** avant qu'un autre commandant ou une
autre organisation ne s'y installe.

Les outils déjà présentés dans ce guide servent directement à cet usage :

- Le **FSS** et le **DSS** permettent d'évaluer, sans se poser, si un système candidat contient des corps
  intéressants pour un projet d'implantation : présence d'un Earth-like World ou d'un Water World (voir 1.5),
  richesse en ressources minières exploitables (anneaux, hotspots — voir [Minage](./20-minage.md)), gravité et
  température des corps envisagés comme site d'atterrissage.
- **EDSM** et **Spansh** permettent de vérifier la distance du système candidat aux systèmes déjà peuplés ou déjà
  revendiqués, un critère central de l'éligibilité à la colonisation.
- L'état de contrôle et d'influence des factions locales (BGS — voir [BGS](./21-bgs.md)) conditionne également quels
  systèmes sont librement disponibles à la revendication.

Les critères précis d'éligibilité (portée maximale depuis un système déjà colonisé, quotas de revendication, étapes de
construction) ont évolué entre la version bêta et la sortie complète de la fonctionnalité ; ils ne sont donc **pas**
reproduits ici pour éviter toute donnée obsolète — se reporter systématiquement à
[Colonisation](./18-colonisation.md), qui constitue la source de référence de ce corpus sur le sujet, et à
[Fleet Carriers](./19-fleet-carriers.md) pour le rôle du porte-vaisseaux dans l'acheminement des matériaux de
construction vers un système nouvellement revendiqué.

---

## Partie 2 — Exobiologie (Odyssey) : prélever et vendre le vivant à Vista Genomics

L'exobiologie est la seconde grande activité de l'explorateur : repérer, approcher à pied et échantillonner les
organismes de surface pour les revendre à Vista Genomics. Les sections qui suivent détaillent la mécanique (2.1),
l'équipement (2.2), la procédure de terrain (2.3), le catalogue complet genre par genre (2.4) et les stratégies de
rentabilité (2.5).

### Les 118 espèces d'exobiologie classées par valeur de vente Vista Genomics

Les quatre tableaux ci-dessous recensent ensemble **les 118 espèces** connues du catalogue d'exobiologie de ce
corpus, **triées par valeur décroissante** ; ils découpent un seul et même classement continu en quatre tranches de
valeur, chacune reprenant la ligne d'en-tête. C'est la réponse directe à la question « quelle espèce rapporte le
plus » ; les **conditions d'apparition détaillées** de chacune (classe de corps, atmosphère, volcanisme,
température, gravité) figurent en **2.4**, genre par genre.

Les montants indiqués sont les **valeurs de base Vista Genomics, hors bonus** : ils ne tiennent compte ni du
multiplicateur *First Logged* (×5, voir 2.5) ni d'aucune prime de rang ou de faction. Ils ne dépendent pas non plus de
la variante de couleur : une *Bacterium Aurasus* verte et une bleue se vendent le même prix.

Deux genres de ce classement — **Bark Mound** et **Brain Tree** — ne sont pas détaillés en 2.4 : ils y sont recensés
(1 espèce pour le premier, 8 pour le second, soit les 9 espèces qui séparent les 109 du catalogue 2.4 des 118
ci-dessous), mais ce guide ne dispose pas encore de leur fiche d'habitat rédigée.

Une seule ligne s'écarte du catalogue compilé : *Radicoida Unica*, portée ici à sa **valeur observée en jeu** de
952 296 Cr et non aux 119 037 Cr du catalogue. Le raisonnement est détaillé en 2.4, sous le genre Radicoida. La
correction ne déplace pas la ligne : à 952 296 Cr, l'espèce reste la dernière du classement.

#### Exobiologie — espèces à 10 M Cr et plus (18 espèces, de 20 M à 10,3 M Cr)

| Espèce                          | Genre             | Valeur (Cr) |
|---------------------------------|-------------------|-------------|
| Fonticulua Fluctus              | Fonticulua        | 20 000 000  |
| Concha Biconcavis               | Concha            | 19 010 800  |
| Fonticulua Segmentatus          | Fonticulua        | 19 010 800  |
| Stratum Tectonicas              | Stratum           | 19 010 800  |
| Tussock Stigmasis               | Tussock           | 19 010 800  |
| Cactoida Vermis                 | Cactoida          | 16 202 800  |
| Clypeus Speculumi               | Clypeus           | 16 202 800  |
| Fumerola Extremus               | Fumerola          | 16 202 800  |
| Recepta Deltahedronix           | Recepta           | 16 202 800  |
| Stratum Cucumisis               | Stratum           | 16 202 800  |
| Recepta Conditivus              | Recepta           | 14 313 700  |
| Tussock Virgam                  | Tussock           | 14 313 700  |
| Aleoida Gravis                  | Aleoida           | 12 934 900  |
| Osseus Discus                   | Osseus            | 12 934 900  |
| Recepta Umbrux                  | Recepta           | 12 934 900  |
| Clypeus Margaritus              | Clypeus           | 11 873 200  |
| Tubus Cavas                     | Tubus             | 11 873 200  |
| Frutexa Flammasis               | Frutexa           | 10 326 000  |

#### Exobiologie — espèces de 3 M à 10 M Cr (38 espèces, de 9,74 M à 3,11 M Cr)

| Espèce                          | Genre             | Valeur (Cr) |
|---------------------------------|-------------------|-------------|
| Osseus Pellebantus              | Osseus            | 9 739 000   |
| Bacterium Informem              | Bacterium         | 8 418 000   |
| Clypeus Lacrimam                | Clypeus           | 8 418 000   |
| Bacterium Volu                  | Bacterium         | 7 774 700   |
| Concha Aureolas                 | Concha            | 7 774 700   |
| Frutexa Acus                    | Frutexa           | 7 774 700   |
| Tubus Compagibus                | Tubus             | 7 774 700   |
| Tussock Triticum                | Tussock           | 7 774 700   |
| Fumerola Nitris                 | Fumerola          | 7 500 900   |
| Aleoida Arcus                   | Aleoida           | 7 252 500   |
| Tussock Capillum                | Tussock           | 7 025 800   |
| Aleoida Coronamus               | Aleoida           | 6 284 600   |
| Electricae Pluma                | Electricae        | 6 284 600   |
| Electricae Radialem             | Electricae        | 6 284 600   |
| Fumerola Aquatis                | Fumerola          | 6 284 600   |
| Fumerola Carbosis               | Fumerola          | 6 284 600   |
| Frutexa Sponsae                 | Frutexa           | 5 988 000   |
| Tussock Pennata                 | Tussock           | 5 853 800   |
| Fonticulua Upupam               | Fonticulua        | 5 727 600   |
| Tubus Sororibus                 | Tubus             | 5 727 600   |
| Bacterium Nebulus               | Bacterium         | 5 289 900   |
| Bacterium Scopulum              | Bacterium         | 4 934 500   |
| Bacterium Omentum               | Bacterium         | 4 638 900   |
| Concha Renibus                  | Concha            | 4 572 400   |
| Tussock Serrati                 | Tussock           | 4 447 100   |
| Osseus Fractus                  | Osseus            | 4 027 800   |
| Bacterium Verrata               | Bacterium         | 3 897 000   |
| Fungoida Bullarum               | Fungoida          | 3 703 200   |
| Cactoida Cortexum               | Cactoida          | 3 667 600   |
| Cactoida Pullulanta             | Cactoida          | 3 667 600   |
| Tussock Caputus                 | Tussock           | 3 472 400   |
| Aleoida Laminiae                | Aleoida           | 3 385 200   |
| Aleoida Spica                   | Aleoida           | 3 385 200   |
| Fungoida Gelata                 | Fungoida          | 3 330 300   |
| Tussock Albata                  | Tussock           | 3 252 500   |
| Tussock Ventusa                 | Tussock           | 3 227 700   |
| Osseus Pumice                   | Osseus            | 3 156 300   |
| Fonticulua Lapida               | Fonticulua        | 3 111 000   |

#### Exobiologie — espèces de 1,5 M à 3 M Cr (42 espèces, de 2,79 M à 1,51 M Cr)

| Espèce                          | Genre             | Valeur (Cr) |
|---------------------------------|-------------------|-------------|
| Stratum Laminamus               | Stratum           | 2 788 300   |
| Fungoida Stabitis               | Fungoida          | 2 680 300   |
| Stratum Frigus                  | Stratum           | 2 637 500   |
| Tubus Rosarium                  | Tubus             | 2 637 500   |
| Cactoida Lapis                  | Cactoida          | 2 483 600   |
| Cactoida Peperatis              | Cactoida          | 2 483 600   |
| Stratum Araneamus               | Stratum           | 2 448 900   |
| Stratum Excutitus               | Stratum           | 2 448 900   |
| Tubus Conifer                   | Tubus             | 2 415 500   |
| Osseus Spiralis                 | Osseus            | 2 404 700   |
| Concha Labiata                  | Concha            | 2 352 400   |
| Bacterium Tela                  | Bacterium         | 1 949 000   |
| Tussock Ignis                   | Tussock           | 1 849 000   |
| Frutexa Flabellum               | Frutexa           | 1 808 900   |
| Fonticulua Digitos              | Fonticulua        | 1 804 100   |
| Tussock Catena                  | Tussock           | 1 766 600   |
| Tussock Cultro                  | Tussock           | 1 766 600   |
| Tussock Divisa                  | Tussock           | 1 766 600   |
| Bacterium Cerbrus               | Bacterium         | 1 689 800   |
| Fungoida Setisis                | Fungoida          | 1 670 100   |
| Bacterium Alcyoneum             | Bacterium         | 1 658 500   |
| Frutexa Collum                  | Frutexa           | 1 639 800   |
| Frutexa Fera                    | Frutexa           | 1 632 500   |
| Frutexa Metallicum              | Frutexa           | 1 632 500   |
| Amphora Plant                   | Amphora Plant     | 1 628 800   |
| Crystalline Shards              | Crystalline Shard | 1 628 800   |
| Aureum Brain Tree               | Brain Tree        | 1 593 700   |
| Gypseeum Brain Tree             | Brain Tree        | 1 593 700   |
| Lindigoticum Brain Tree         | Brain Tree        | 1 593 700   |
| Lividum Brain Tree              | Brain Tree        | 1 593 700   |
| Ostrinum Brain Tree             | Brain Tree        | 1 593 700   |
| Puniceum Brain Tree             | Brain Tree        | 1 593 700   |
| Roseum Brain Tree               | Brain Tree        | 1 593 700   |
| Viride Brain Tree               | Brain Tree        | 1 593 700   |
| Albidum Sinuous Tubers          | Sinuous Tuber     | 1 514 500   |
| Blatteum Sinuous Tubers         | Sinuous Tuber     | 1 514 500   |
| Caeruleum Sinuous Tubers        | Sinuous Tuber     | 1 514 500   |
| Lindigoticum Sinuous Tubers     | Sinuous Tuber     | 1 514 500   |
| Prasinum Sinuous Tubers         | Sinuous Tuber     | 1 514 500   |
| Roseum Sinuous Tubers           | Sinuous Tuber     | 1 514 500   |
| Violaceum Sinuous Tubers        | Sinuous Tuber     | 1 514 500   |
| Viride Sinuous Tubers           | Sinuous Tuber     | 1 514 500   |

#### Exobiologie — espèces sous 1,5 M Cr (20 espèces, de 1 499 900 à 952 296 Cr)

| Espèce                          | Genre             | Valeur (Cr) |
|---------------------------------|-------------------|-------------|
| Blatteum Bioluminescent Anemone | Anemone           | 1 499 900   |
| Croceum Anemone                 | Anemone           | 1 499 900   |
| Luteolum Anemone                | Anemone           | 1 499 900   |
| Prasinum Bioluminescent Anemone | Anemone           | 1 499 900   |
| Puniceum Anemone                | Anemone           | 1 499 900   |
| Roseum Anemone                  | Anemone           | 1 499 900   |
| Roseum Bioluminescent Anemone   | Anemone           | 1 499 900   |
| Rubeum Bioluminescent Anemone   | Anemone           | 1 499 900   |
| Osseus Cornibus                 | Osseus            | 1 483 000   |
| Bark Mounds                     | Bark Mound        | 1 471 900   |
| Stratum Limaxus                 | Stratum           | 1 362 000   |
| Stratum Paleas                  | Stratum           | 1 362 000   |
| Bacterium Bullaris              | Bacterium         | 1 152 500   |
| Bacterium Acies                 | Bacterium         | 1 000 000   |
| Bacterium Aurasus               | Bacterium         | 1 000 000   |
| Bacterium Vesicula              | Bacterium         | 1 000 000   |
| Fonticulua Campestris           | Fonticulua        | 1 000 000   |
| Tussock Pennatis                | Tussock           | 1 000 000   |
| Tussock Propagito               | Tussock           | 1 000 000   |
| Radicoida Unica                 | Radicoida         | 952 296     |

> **Sourçage de ces quatre tableaux** : catalogue d'exobiologie compilé embarqué par ce corpus (édition 2026-08), qui déclare
> pour sources amont Canonn Research (*Vista Genomics price list*), le wiki *Elite Dangerous* (*Exobiologist*,
> *Vista Genomics*) et les critères biologiques du projet SrvSurvey. Ses montants coïncident au crédit près avec les
> valeurs relevées en jeu à la vente pour les espèces vérifiées (*Stratum Tectonicas* 19 010 800 Cr, *Frutexa Acus*
> 7 774 700 Cr, *Tubus Conifer* 2 415 500 Cr, *Bacterium Aurasus* 1 000 000 Cr), à la seule exception de
> *Radicoida Unica* signalée ci-dessus.

### 2.1 Mécanique générale de l'exobiologie : genres, espèces et variantes de couleur

Depuis Odyssey, la taxonomie exobiologique moderne (famille dite **« Odyssey »**) compte **15 genres** : Aleoida,
Bacterium, Cactoida, Clypeus, Concha, Electricae, Fonticulua, Frutexa, Fumerola, Fungoida, Osseus, Recepta, Stratum,
Tubus, Tussock. Chaque genre se subdivise en espèces, elles-mêmes déclinées en variantes de couleur. À ces 15 genres
s'ajoutent **5 genres supplémentaires**, hors famille Odyssey — Amphora Plant, Anemone, Crystalline Shard, Radicoida et
Sinuous Tuber — eux aussi documentés en 2.4, soit **20 genres** au total dans ce guide sur les 22 que recense le
catalogue compilé (voir la note de sourçage en 2.4).

- Le genre **Tussock** est l'un des plus diversifiés, avec **15 espèces** recensées par Canonn Research (Albata,
  Capillum, Caputus, Catena, Cultro, Divisa, Ignis, Pennata, Pennatis, Propagito, Serrati, Stigmasis, Triticum,
  Ventusa, Virgam), déclinées en de nombreuses variantes de couleur selon la classe stellaire de l'étoile hôte.
- Le genre **Bacterium** est également très diversifié, avec **13 espèces** recensées (voir tableau complet en 2.4).
- Le genre **Electricae** est l'un des plus restreints : seulement **2 espèces** (Pluma et Radialem).
- L'apparition d'un genre/espèce dépend du **type de corps planétaire**, de l' **atmosphère** et de la **température de
  surface** — la combinaison la plus fréquente étant : corps rocheux + atmosphère de CO2 + température de 150-200 K.
- La **couleur de la variante** dépend le plus souvent (~70 % des espèces) de la **classe stellaire de l'étoile hôte**
  (ex. jaune chez les étoiles de type O, gris pâle chez les naines blanches pour *Aleoida*), ou plus rarement de la
  présence de **matériaux rares spécifiques** dans la croûte planétaire (ex. l'yttrium donne une couleur « Mulberry »
  chez *Electricae Pluma* mais « Green » chez *Radialem*).

**Tolérances physiologiques extrêmes relevées par genre** (Canonn, *Odyssey Family: Appendices*, données au
30/09/2025) :

| Paramètre              | Extrême observé                                                                                                                                       |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| Température            | *Aleoida* : plage très restreinte (152-196 K) — à l'opposé, *Bacterium* tolère 20-631 K, avec *Bacterium Tela* seule capable de survivre à 500-650 K  |
| Pression atmosphérique | *Fonticulua* et *Bacterium* tolèrent jusqu'à 1 492 atm dans certains cas ; la plupart des autres genres restent limités à des atmosphères très ténues |
| Gravité                | La majorité des genres tolèrent 0,03-0,28 G ; *Bacterium* jusqu'à 1,18 G ; *Stratum* jusqu'à 0,61 G                                                   |
| Répartition            | *Bacterium* représente à lui seul **94,23 %** de tous les organismes enregistrés dans la bande de température 0-50 K                                  |

### 2.2 Équipement nécessaire à l'exobiologie : combinaison Artemis, scanners, BioScan

Pour pratiquer l'exobiologie de terrain, le commandant doit s'équiper de :

- Une **combinaison Artemis** (Exploration Suit) équipée de l' **Organic Scanner** (« Genetic Sampler »), l'outil qui
  permet le prélèvement effectif d'échantillons.
  > **Correction** : la combinaison Artemis et la combinaison **Maverick** sont deux tenues Odyssey **distinctes**, et
  > non deux noms pour la même chose. L'Artemis est la combinaison d'exploration (Genetic Sampler, Composition
  > Scanner) ; le Maverick est une combinaison tactique/légère orientée combat à pied, sans rapport avec
  > l'exobiologie. Voir [Équipement à pied](./07-equipement-a-pied.md) pour le comparatif complet des combinaisons
  > Odyssey (Artemis, Dominator, Maverick) et de leurs emplacements de modules.
- Un **Composition Scanner** : outil complémentaire crucial pour affiner l'identification de l'espèce et de la variante
  précise *avant* le prélèvement complet.
- Le **FSS** puis le **DSS** du vaisseau, utilisés en amont pour repérer à distance les zones à forte probabilité de vie
  sur un corps (teinte sarcelle sur la carte DSS).
- Le **SRV**, dont le mode tourelle/scan peut servir à repérer des colonies de bactéries invisibles à l'œil nu dans
  l'obscurité.
- Le plugin communautaire **BioScan** (github.com/Silarn/EDMC-BioScan, extension d'EDMC), largement recommandé : il
  prédit les genres/espèces possibles à partir du type de corps, de la position galactique et des étoiles proches
  (biologie « Horizons » et « Odyssey »), affiche en temps réel la distance minimale requise et la distance actuelle
  au dernier échantillon, place des repères de navigation (cap, distance) pour les échantillons restants, et marque
  les corps « haute gravité » (**≥ 1 G**) ou « gravité extrême » (**au-delà de 2,69 G**, seuil où la sortie à pied
  devient impossible) — voir la mise au point ci-dessous.

#### Gravité, atterrissage et sortie à pied : les seuils réellement étayés

Le seuil de gravité que rencontre l'exobiologiste n'est pas une règle publiée par Frontier : c'est une constante lue
dans un plugin communautaire, qui rapporte une règle du jeu sans l'implémenter. La source primaire disponible — le
schéma du journal et du fichier d'état, qui expose bien la gravité courante du commandant à pied — n'énonce, elle,
**aucun** seuil. Trois précautions s'imposent donc avant de citer un chiffre.

**La borne codée n'est pas celle qu'annonce la documentation.** Le fichier de lecture de BioScan écrit « Extreme
gravity is 2.7G or greater », mais son code teste une gravité **strictement supérieure à 2,69 G**. Ce n'est pas la
même condition : en rejouant la fonction isolément, 2,6901 G et 2,695 G lèvent le drapeau de gravité extrême sans être
« supérieurs ou égaux à 2,7 G », tandis que 2,69 G exactement ne le lève pas. La formulation exacte est donc « au-delà
de 2,69 G ». Le cas dépasse ce guide : une règle arrondie dans un fichier de documentation n'est pas la règle
qu'applique le code, et présenter l'une pour l'autre est exactement le défaut que ce corpus s'interdit.

**Le seuil de 1 G ne dit rien de la mobilité.** Il est bien codé, et la documentation du plugin le confirme, mais
l'outil se contente de marquer le corps « haute gravité » : aucune source accessible ne chiffre une pénalité de
déplacement, de saut ou d'autonomie de jetpack au-delà. Les révisions antérieures de ce guide glosaient ce seuil en
« marche pénible » ; la glose n'était étayée nulle part et a été retirée.

**Aucun plafond de gravité n'empêche de poser le vaisseau.** La contrainte des 2,69 G porte sur le débarquement du
commandant à pied, pas sur l'atterrissage du vaisseau ni sur le déploiement d'un véhicule de surface. Le corps
`KOI 1701 1`, un corps riche en métaux, est déclaré atterrissable par EDSM avec une gravité de 45,32 G, soit
16,85 fois le seuil de sortie à pied. Pour la taxonomie des types de corps célestes eux-mêmes, ce guide renvoie à
[Colonisation](./18-colonisation.md#héritage-de-léconomie-de-base-par-type-de-corps-céleste) plutôt que de la
dupliquer.

Le tableau ci-dessous rassemble les 7 lignes de seuil qu'il a été possible d'établir : 5 portent un chiffre,
2 déclarent un trou. Les valeurs en G sont RELEVÉES ; leurs conversions en m/s² sont DÉRIVÉES PAR CALCUL, au taux de
9,80665 m/s² par G lu dans le référentiel d'EDDiscovery.

| Seuil                                 | Conséquence documentée                                                                                                                                                                     | Statut                              | Source                                                                                                                                                       |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **> 2,69 G** (soit > 26,38 m/s²)      | Sortie du vaisseau à pied (*Disembark*) indisponible : le corps est marqué « gravité extrême »                                                                                             | Relevé (constante lue dans le code) | BioScan `body_data/util.py` l. 61 — `if g_gravity > 2.69` ; README l. 56-57 : « Extreme gravity is 2.7G or greater which makes it impossible to go on foot » |
| **≥ 1,00 G** (soit ≥ 9,80665 m/s²)    | Corps marqué « haute gravité » par l'outil. Aucune source accessible ne chiffre la dégradation de mobilité correspondante                                                                  | Relevé (constante lue dans le code) | BioScan `body_data/util.py` l. 63 — `if g_gravity >= 1.0` ; README l. 56 : « High gravity is currently considered 1G or greater »                            |
| **≥ 3,00 G**                          | Seuil de la requête intégrée « Landable with High G » d'EDDiscovery — critère de tri d'un outil tiers, sans effet de jeu                                                                   | Relevé (constante lue dans le code) | EDDiscovery `History/Queries/Queries.cs` l. 96                                                                                                               |
| **> 4 G** (repère de prudence)        | « you should not try to land on planets while exploring that have more than 4g gravity as it is extremely dangerous » — conseil de pilotage, non un seuil mécanique                        | Relevé (guide communautaire)        | elitedangerous.net, *Planetary Landings Guide*, consulté le 10/09/2026                                                                                       |
| **45,32 G**                           | Gravité du corps atterrissable la plus élevée relevée pendant cette vérification (KOI 1701 1, *Metal-rich body*) : poser le vaisseau reste possible très au-delà du seuil de sortie à pied | Relevé (donnée de scan)             | EDSM, `api-system-v1/bodies?systemName=KOI 1701`, consulté le 10/09/2026                                                                                     |
| Train d'atterrissage (*landing gear*) | Aucun seuil de gravité déclenchant des dégâts n'a pu être établi : le journal du jeu n'expose qu'un booléen `LandingGear`, sans valeur associée                                            | Non établi                          | EDDiscovery, *Event List September 2025*, l. 9331 (`UIEvent: UILandingGear`) — champ booléen                                                                 |
| SRV et Nomad                          | Aucun seuil de gravité modifiant le comportement du véhicule ou interdisant son déploiement n'a pu être établi sur source accessible                                                       | Non établi                          | —                                                                                                                                                            |

Les deux dernières lignes méritent d'être lues comme des trous et non comme des absences d'effet. Aucune source
accessible ne donne de gravité à partir de laquelle le train d'atterrissage est endommagé — le journal n'expose qu'un
booléen, sans valeur associée, et les guides communautaires rattachent ces dégâts à la vitesse verticale d'impact
plutôt qu'à un seuil de gravité. Aucune ne donne davantage de seuil modifiant le comportement du SRV ou du Nomad, ni
interdisant leur déploiement : l'existence d'un corps atterrissable à 45,32 G rend plausible l'absence de limite, mais
la plausibilité n'est pas une source.

#### Le Nomad, véhicule de surface dédié à l'exobiologie (Operations, 30 juin 2026)

Depuis la mise à jour **Operations**, sortie le 30 juin 2026, le SRV n'est plus le seul véhicule de terrain de
l'explorateur : le **Nomad** vient s'y ajouter. Frontier le décrit comme « a small and compact ship-launched vessel
which is built to explore planetary surfaces », dont « rugged shape and design is perfect for getting up close with
organics » (billet officiel *Discover the Nomad*, 02/06/2026 13:03 UTC). Le même billet en explicite l'intérêt pour
l'exobiologie : plutôt que de poser un gros vaisseau d'exploration, le commandant peut le **laisser en orbite** et
descendre au Nomad pour atteindre les organiques les plus difficiles d'accès. Ses patins d'atterrissage étroits,
d'inspiration hélicoptère, et ses moteurs qui pivotent à l'atterrissage lui donnent une empreinte au sol réduite et lui
permettent de se percher sur des terrains accidentés où un vaisseau classique ne peut se poser.

Trois points concernent directement la procédure décrite en 2.3 :

- **Un scanner biologique embarqué.** Le Nomad « comes equipped with a specialised MK II Biological Scanner for the
  detection of biological signals directly from the cockpit », et les notes de version ajoutent le module à
  l'équipement sous la description « a pulse scanner that detects biological signatures » (billet officiel
  *Operations Update*, 01/07/2026 14:01 UTC). La détection des signaux biologiques ne dépend donc plus uniquement du
  DSS du vaisseau et du repérage à pied.
- **Un module porteur dédié, distinct du hangar SRV.** « The Nomad can be deployed from a compatible vessel bay,
  including MK I and MK II modules » (même billet). Les notes de version détaillent un **Mk I Vessel Bay** et un
  **Mk II Vessel Bay** ; le référentiel ouvert EDCD/FDevIDs les publie sous les libellés *Vessel Hangar* et *Mk II
  Vessel Hangar*. Le Mk I est disponible sur treize châssis, parmi lesquels l'**Anaconda** (classes 5 à 7), seul
  vaisseau du comparatif de 2.7 à pouvoir emporter un Nomad ; le Mk II est réservé à trois châssis seulement. Le
  détail des disponibilités figure dans [Le Rhino et le Nomad](./14-rhino.md).
- **Ce n'est pas un vaisseau de chantier naval.** Le Nomad est un *ship-launched vessel*, au même titre qu'un SRV ou
  qu'un chasseur SLF : il ne s'achète pas au shipyard et n'entre pas dans le décompte des vaisseaux pilotables du
  corpus. Il est sorti en accès anticipé ARX le 30 juin 2026, « in ARX Early Access alongside Operations »
  (*Discover the Nomad*, 02/06/2026).

Voir [Operations](./13-operations.md) pour la mise à jour qui l'introduit et
[Le Rhino et le Nomad](./14-rhino.md) pour la fiche complète du véhicule.

### 2.3 Procédure de scan et d'échantillonnage exobiologique (3 prélèvements par espèce)

1. **Repérer** les patches de vie à distance grâce au DSS avant l'atterrissage, en privilégiant la face diurne de la
   planète pour une meilleure visibilité.
2. **Prélever 3 échantillons complets** d'une même espèce : c'est le nombre requis pour pouvoir la vendre ensuite à
   Vista Genomics.
3. Respecter une **distance minimale entre chaque prélèvement** (variable selon le genre — voir tableau ci-dessous) afin
   de garantir une diversité génétique suffisante ; un échantillon trop proche du précédent est refusé par le jeu.
4. Un seul jeu d'échantillons partiels peut être conservé en mémoire à la fois : impossible de collecter deux espèces en
   parallèle sans finaliser l'une des deux au préalable.
5. Attendre la **confirmation du 3ᵉ échantillon** avant de redécoller.

**Distances minimales de séparation entre échantillons, par genre** (« Minimum Colonial Separation », Canonn Research —
tableau complet pour les 15 genres de la famille Odyssey, complété par les 5 genres supplémentaires documentés en 2.4,
soit les 20 genres de ce guide) :

| Genre             | Distance minimale |
|-------------------|-------------------|
| Aleoida           | 150 m             |
| Amphora Plant     | 100 m             |
| Anemone           | 100 m             |
| Bacterium         | 500 m             |
| Cactoida          | 300 m             |
| Clypeus           | 150 m             |
| Concha            | 150 m             |
| Crystalline Shard | 100 m             |
| Electricae        | 1 000 m           |
| Fonticulua        | 500 m             |
| Frutexa           | 150 m             |
| Fumerola          | 100 m             |
| Fungoida          | 300 m             |
| Osseus            | 800 m             |
| Radicoida         | 15 m              |
| Recepta           | 150 m             |
| Sinuous Tuber     | 100 m             |
| Stratum           | 500 m             |
| Tubus             | 800 m             |
| Tussock           | 200 m             |

*Ces valeurs correspondent à la distance minimale documentée par genre sur le Codex Canonn ; celles des cinq genres
hors famille Odyssey (Amphora Plant, Anemone, Crystalline Shard, Radicoida, Sinuous Tuber) sont celles du catalogue
compilé cité en note de sourçage à la fin de 2.4 — à l'exception de **Radicoida**, dont les 15 m sont une valeur
relevée en jeu, retenue contre les 100 m du catalogue (voir le détail sous le genre Radicoida en 2.4). Certaines
espèces individuelles peuvent avoir une distance légèrement différente de celle de leur genre — le plugin BioScan
affiche dans tous les cas la valeur exacte en temps réel pour l'espèce identifiée.*

Un défi communautaire Canonn, le **« Speed Scanning Challenge »**, illustre les marges de progression possibles pour un
commandant entraîné et bien équipé. Les enseignements clés de ce défi :

- Cartographier au préalable le **chevauchement des zones** entre espèces pour minimiser les déplacements.
- Repérer les emplacements sans déclencher le chronomètre du scanner avant d'être réellement prêt.
- Le plugin BioScan (v2.7 et suivantes) peut afficher ces informations directement en surimpression (overlay) à l'écran
  de jeu.

### 2.4 Catalogue d'exobiologie : 20 genres, 109 espèces, habitats et valeurs de vente

Valeurs en crédits (Cr) et fréquences d'observation (% de la population enregistrée par la communauté Canonn), données
Canonn Research au 30/09/2025.

Ce catalogue documente **20 genres**, soit **109 espèces**, présentés par ordre alphabétique de genre. Cinq d'entre eux
— Amphora Plant, Anemone, Crystalline Shard, Radicoida et Sinuous Tuber — n'appartiennent pas à la famille Odyssey
décrite en 2.1 ; leurs conditions d'apparition sont reprises du catalogue d'exobiologie compilé cité en note de
sourçage à la fin de cette section, qui recense 22 genres au total.

**Lecture des tableaux.** Les vingt genres partagent désormais un même jeu de colonnes : **Espèce**, **Valeur (Cr)**,
**Fréquence**, **Corps**, **Atmosphère**, **Volcanisme**, **Température (K)** et **Gravité (G)**. Les cinq dernières
colonnes sont renseignées espèce par espèce, et non au niveau du genre : ce sont elles qui permettent de répondre à
« puis-je trouver telle espèce sur ce corps ? ». Conventions :

- **Corps** emploie les abréviations du jeu : Rocky, HMC (High Metal Content), Metal-Rich, Icy, Rocky Ice.
- **Atmosphère** : « Aucune » signifie corps sans atmosphère, et non donnée manquante.
- **Volcanisme** : « Aucun » signifie corps sans volcanisme, et non donnée manquante.
- **Température (K)** et **Gravité (G)** rendent les bornes publiées : `175-180` pour un intervalle, `≥ 160` ou
  `≤ 143` quand une seule borne est connue.
- Un tiret « — » signale une donnée **absente des sources**, jamais une valeur nulle.
- La colonne **Gravité (G)** donne le plafond toutes classes de corps confondues. Quand ce plafond varie selon la
  classe du corps, le détail figure soit dans une colonne dédiée (Sinuous Tuber), soit dans les précisions par espèce
  sous le tableau.
- Les colonnes propres à certains genres sont conservées telles quelles à la suite du tronc commun : *Étoile primaire*
  (Anemone), *Corrélation* (Electricae), *Type de volcanisme* et *Terrain* (Fumerola), *Gravité max (Rocky / HMC)* et
  *Régions Canonn* (Sinuous Tuber). Pour Bacterium, le déterminant de la variante de couleur fait l'objet d'un second
  tableau sous le tableau d'habitat.

**Où la colonne Fréquence est vide, et pourquoi.** Les pourcentages d'observation proviennent exclusivement des relevés
de population de Canonn Research ; le catalogue compilé qui fournit les conditions d'apparition ne les reprend pas.
Sur les 109 espèces de cette section, **43 sont donc sans fréquence publiée**, réparties en deux cas distincts :

| Cas                                                  | Genres et espèces concernés                                                                                                           | Espèces |
|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|---------|
| Genre entier sans relevé de fréquence                | Amphora Plant (1), Anemone (8), Bacterium (13), Crystalline Shard (1), Radicoida (1), Sinuous Tuber (8)                               | 32      |
| Espèces isolées dans un genre par ailleurs documenté | Fonticulua — Digitos, Lapida, Segmentatus, Upupam ; Frutexa — Collum, Fera, Sponsae ; Stratum — Araneamus, Frigus, Laminamus, Limaxus | 11      |

La seconde ligne est le point de vigilance : voir une fréquence chez *Fonticulua Campestris* mais un tiret chez
*Fonticulua Segmentatus* ne signifie pas que la seconde est absente des relevés, seulement que sa part de population
n'y est pas chiffrée dans la même colonne. Deux d'entre elles portent malgré tout une part de population dans leurs
précisions par espèce (*Fonticulua Segmentatus*, 1,17 % du genre ; *Stratum Araneamus*, 0,3 %).

La ligne d'habitat en italique qui ouvre chaque genre reste un **résumé au niveau du genre** (données Canonn) : quand
elle diverge du tableau — par exemple sur la liste des atmosphères ou des classes de corps acceptées — c'est la ligne
de l'espèce qui fait foi, parce qu'elle est plus fine.

Sous chaque tableau, la liste **« Précisions par espèce »** détaille terrain, pression minimale, régions galactiques,
plafonds de gravité par classe de corps et branches thermiques. Aucune de ces conditions n'est confirmée par Frontier :
toutes sont des relevés communautaires, au même niveau de fiabilité.

> **Sourçage de cette section** : valeurs Vista Genomics et fréquences d'observation issues de **Canonn Research**
> (relevés arrêtés au 30/09/2025) ; conditions d'apparition par espèce issues du catalogue d'exobiologie compilé
> embarqué par ce corpus (édition 2026-08), qui déclare pour sources amont Canonn Research, le wiki *Elite Dangerous*
> et les critères biologiques du projet SrvSurvey.

#### Aleoida — genre d'exobiologie Odyssey (5 espèces, 3,4 M à 12,9 M Cr)

*Habitat : corps rocheux ou à haute teneur métallique, atmosphère ammoniac ou CO2 ; feuillage cireux, hiberne en
conditions défavorables.*

| Espèce            | Valeur (Cr) | Fréquence | Corps      | Atmosphère | Volcanisme                          | Température (K) | Gravité (G) |
|-------------------|-------------|-----------|------------|------------|-------------------------------------|-----------------|-------------|
| Aleoida Coronamus | 6 284 600   | 28,9 %    | Rocky, HMC | CO2        | Aucun                               | 180-190         | ≤ 0,276     |
| Aleoida Laminiae  | 3 385 200   | 24,2 %    | Rocky, HMC | Ammoniac   | Aucun, Eau                          | —               | ≤ 0,276     |
| Aleoida Arcus     | 7 252 500   | 21,5 %    | Rocky, HMC | CO2        | Aucun                               | 175-180         | ≤ 0,276     |
| Aleoida Spica     | 3 385 200   | 13,6 %    | Rocky, HMC | Ammoniac   | Aucun, Magma ferreux, Eau, Silicaté | ≥ 170           | ≤ 0,276     |
| Aleoida Gravis    | 12 934 900  | 11,8 %    | Rocky, HMC | CO2        | Aucun                               | 190-197         | ≤ 0,276     |

*Précisions par espèce :*

- **Aleoida Coronamus** — Terrain vallonné, pression >= 0,0244 atm, plafond de gravité 0,238 G sur Rocky et 0,276 G
  sur HMC.
- **Aleoida Laminiae** — Terrain vallonné, uniquement dans Sagittarius-Carina Arm, Orion-Cygnus Arm et Galactic
  Centre-Left, avec pression <= 0,008 atm sur HMC.
- **Aleoida Arcus** — Plaines plates de mondes Rocky (97 %) ou HMC à CO2, pression >= 0,0161 atm, avec un plafond de
  gravité plus bas (0,238 G) sur les corps Rocky.
- **Aleoida Spica** — Terrain quasi-montagneux, absente de Sagittarius-Carina et d'Orion-Cygnus (contrairement à
  Laminiae, sa jumelle de prix).
- **Aleoida Gravis** — Terrain plat, pression >= 0,0544 atm, forte proportion de HMC (35 %) ou le plafond de gravité
  monte à 0,276 G contre 0,238 G sur Rocky.

#### Amphora Plant — genre d'exobiologie hors famille Odyssey (1 espèce, 1,63 M Cr)

*Habitat : mondes à haute teneur métallique (Metal-Rich) sans atmosphère, volcanisme de magma ferreux, rocheux ou
silicaté, 1 000-1 800 K, gravité ≥ 0,04 G ; étoile primaire de classe A et système comportant au moins un monde
Earth-like, un monde à ammoniac, une géante gazeuse à vie ou une géante d'eau. Observé dans les bras Scutum-Centaurus
et Sagittarius-Carina. Séparation minimale 100 m (voir 2.3).*

| Espèce        | Valeur (Cr) | Fréquence | Corps      | Atmosphère | Volcanisme                       | Température (K) | Gravité (G) |
|---------------|-------------|-----------|------------|------------|----------------------------------|-----------------|-------------|
| Amphora Plant | 1 628 800   | —         | Metal-Rich | Aucune     | Magma ferreux, Rocheux, Silicaté | 1 000-1 800     | ≥ 0,04      |

*Précisions par espèce :*

- **Amphora Plant** — Étoile primaire de classe A et système contenant au moins un ELW, Ammonia World, Gas Giant à vie
  ou Water Giant ; régions Scutum-Centaurus / Sagittarius-Carina.

*Fréquences d'observation Canonn non disponibles pour ce genre.*

#### Anemone — genre d'exobiologie hors famille Odyssey (8 espèces, 1,50 M Cr chacune)

*Habitat : corps sans atmosphère — rocheux, à haute teneur métallique (HMC), Metal-Rich ou glacés selon l'espèce — le
plus souvent à volcanisme silicaté, rocheux ou de magma ferreux. L'espèce présente dépend avant tout de la **classe de
l'étoile primaire** du système. Séparation minimale 100 m (voir 2.3).*

| Espèce                          | Valeur (Cr) | Fréquence | Corps                  | Atmosphère | Volcanisme                       | Température (K) | Gravité (G) | Étoile primaire                   |
|---------------------------------|-------------|-----------|------------------------|------------|----------------------------------|-----------------|-------------|-----------------------------------|
| Blatteum Bioluminescent Anemone | 1 499 900   | —         | HMC, Metal-Rich        | Aucune     | Rocheux, Silicaté, Magma ferreux | 220-6 000       | —           | O, B, K, à neutrons, trou noir    |
| Croceum Anemone                 | 1 499 900   | —         | Rocky                  | Aucune     | Silicaté, Magma ferreux          | 200-440         | ≤ 0,42      | B ou A                            |
| Luteolum Anemone                | 1 499 900   | —         | Rocky                  | Aucune     | Silicaté, Magma ferreux, Rocheux | 200-440         | ≤ 1,6       | B ou A                            |
| Prasinum Bioluminescent Anemone | 1 499 900   | —         | Rocky, HMC, Metal-Rich | Aucune     | —                                | 110-4 000       | ≤ 1,9       | O, B, A, Herbig Ae/Be, Wolf-Rayet |
| Puniceum Anemone                | 1 499 900   | —         | Icy                    | Aucune     | Aucun                            | 75-800          | 0,1-2,6     | O ou Wolf-Rayet                   |
| Roseum Anemone                  | 1 499 900   | —         | Rocky                  | Aucune     | Silicaté, Magma ferreux          | 200-440         | ≤ 0,386     | B (luminosité I à III)            |
| Roseum Bioluminescent Anemone   | 1 499 900   | —         | HMC, Metal-Rich        | Aucune     | Rocheux, Silicaté, Magma ferreux | 400-5 000       | ≥ 0,24      | B, A, trou noir                   |
| Rubeum Bioluminescent Anemone   | 1 499 900   | —         | HMC, Metal-Rich        | Aucune     | Rocheux, Silicaté, Magma ferreux | 164-1 800       | —           | O, B, A, F, à neutrons, trou noir |

*Précisions par espèce :*

- **Blatteum Bioluminescent Anemone** — Étoile primaire O, B, K, étoile à neutrons ou trou noir ; 220–999 K sur HMC et
  800–6000 K sur Metal-Rich.
- **Croceum Anemone** — Étoile primaire de classe B ou A (typiquement B VI / A III) sur corps rocheux.
- **Luteolum Anemone** — Étoile primaire de classe B ou A (typiquement B IV–B V) sur corps rocheux.
- **Prasinum Bioluminescent Anemone** — Étoile primaire O, B, A, Herbig Ae/Be ou Wolf-Rayet ; le plafond de 1,9 G
  n'est connu que sur Rocky (110–999 K), 250–2400 K sur HMC et 1000–4000 K sur Metal-Rich.
- **Puniceum Anemone** — Étoile primaire de classe O ou Wolf-Rayet, sur corps glacé sans volcanisme.
- **Roseum Anemone** — Étoile primaire de classe B (luminosité I à III) sur corps rocheux.
- **Roseum Bioluminescent Anemone** — Étoile primaire B, A ou trou noir ; sur HMC 400–999 K avec g ≥ 0,24, sur
  Metal-Rich 1000–5000 K.
- **Rubeum Bioluminescent Anemone** — Étoile primaire O, B, A, F, étoile à neutrons ou trou noir ; 164–999 K sur HMC
  et 1000–1800 K sur Metal-Rich.

*Les plages de température couvrent plusieurs types de corps : pour les espèces bioluminescentes, la borne haute
correspond aux corps Metal-Rich (au-delà de 1 000 K), la borne basse aux corps HMC ou rocheux. Fréquences d'observation
Canonn non disponibles pour ce genre.*

#### Bacterium — genre d'exobiologie Odyssey (13 espèces, 1 M à 8,4 M Cr)

*Habitat : corps glacés, rocheux ou à haute teneur métallique, atmosphère ammoniac/CO2/SO2, gravité < 0,62 G, terrain
plat ; extrêmophiles quasi omniprésents. Genre le plus répandu de la galaxie (voir tolérances extrêmes en 2.1).*

Les 3 premières espèces ci-dessous doivent leur variante de couleur à la **classe stellaire** de l'étoile hôte ; les 10
suivantes la doivent à un **matériau spécifique** présent dans la croûte de la planète.

| Espèce              | Valeur (Cr) | Fréquence | Corps                      | Atmosphère                    | Volcanisme      | Température (K) | Gravité (G) |
|---------------------|-------------|-----------|----------------------------|-------------------------------|-----------------|-----------------|-------------|
| Bacterium Alcyoneum | 1 658 500   | —         | Rocky, HMC, Rocky Ice      | Ammoniac                      | —               | ≥ 160,7         | —           |
| Bacterium Aurasus   | 1 000 000   | —         | Rocky, HMC                 | CO2                           | —               | 145-400         | —           |
| Bacterium Cerbrus   | 1 689 800   | —         | HMC, Rocky, Rocky Ice      | SO2, Eau                      | —               | ≥ 132           | —           |
| Bacterium Acies     | 1 000 000   | —         | Icy, Rocky Ice             | Néon                          | —               | —               | —           |
| Bacterium Bullaris  | 1 152 500   | —         | Icy, Rocky, HMC, Rocky Ice | Méthane                       | —               | ≤ 143           | —           |
| Bacterium Informem  | 8 418 000   | —         | Icy, HMC, Rocky, Rocky Ice | Azote                         | —               | ≤ 151           | —           |
| Bacterium Nebulus   | 5 289 900   | —         | Icy                        | Hélium                        | —               | —               | —           |
| Bacterium Omentum   | 4 638 900   | —         | Icy                        | Néon, Argon, Méthane, Hélium  | Azote, Ammoniac | ≤ 197           | —           |
| Bacterium Scopulum  | 4 934 500   | —         | Icy, Rocky Ice             | Néon, Méthane, Argon, Hélium  | CO2, Méthane    | 35-146          | —           |
| Bacterium Tela      | 1 949 000   | —         | HMC, Icy, Rocky            | —                             | —               | —               | —           |
| Bacterium Verrata   | 3 897 000   | —         | Icy, Rocky Ice, Rocky      | Néon, Argon, Hélium, Ammoniac | Eau             | —               | —           |
| Bacterium Vesicula  | 1 000 000   | —         | Icy, Rocky Ice, HMC, Rocky | Argon                         | —               | ≤ 267           | —           |
| Bacterium Volu      | 7 774 700   | —         | Icy, Rocky Ice, HMC, Rocky | Oxygène                       | —               | —               | —           |

##### Bacterium — précisions d'habitat, espèce par espèce (13 espèces)

*Précisions par espèce :*

- **Bacterium Alcyoneum** — Plaines de mondes Rocky ou HMC à ammoniac ; couleur donnée par la classe de l'étoile
  parente.
- **Bacterium Aurasus** — Plaines de mondes Rocky ou HMC à CO2, très large fenêtre thermique ; couleur donnée par la
  classe stellaire.
- **Bacterium Cerbrus** — Principalement HMC à SO2 (T >= 132 K), la branche eau/water-rich exigeant des mondes bien
  plus chauds (T >= 390 K).
- **Bacterium Acies** — Mondes glacés à atmosphère néon, sur plaines près des cratères ; aucune contrainte de gravité
  (invisible en night vision, chercher les flaques sombres depuis 200 m).
- **Bacterium Bullaris** — Surtout sur mondes glacés à méthane ; le plafond descend à 129 K en atmosphère Méthane-rich
  contre 143 K en Méthane.
- **Bacterium Informem** — Mondes à atmosphère d'azote, surtout glacés ; la limite thermique tombe à 83 K sur les
  corps Rocky.
- **Bacterium Nebulus** — Exclusivement mondes glacés à atmosphère d'hélium, extrêmement froids (observé 20,0 - 20,8
  K).
- **Bacterium Omentum** — Uniquement mondes glacés (surtout néon) avec magma mineur d'azote ou d'ammoniac obligatoire,
  branche froide 20 - 61 K.
- **Bacterium Scopulum** — Mondes glacés exigeant des geysers de dioxyde de carbone ou un magma de méthane mineur ;
  fenêtres thermiques par branche (35-50, 56-146, 61-71 K).
- **Bacterium Tela** — Espèce passe-partout, toutes atmosphères et presque tous les corps, souvent près des sites
  géologiques mais aussi trouvée sans volcanisme.
- **Bacterium Verrata** — Mondes glacés avec volcanisme exclusivement aqueux (magma ou geysers d'eau, majeur ou
  mineur), atmosphère néon dans 74 % des cas.
- **Bacterium Vesicula** — Surtout mondes glacés à argon ; le plafond thermique varie selon le type de corps (148,
  149, 245 ou 267 K).
- **Bacterium Volu** — Rare atmosphère d'oxygène, majoritairement sur mondes glacés (observé entre 143,8 et 245,8 K).

##### Bacterium — déterminant de la variante de couleur (classe stellaire ou matériau de croûte)

**Déterminant de la variante de couleur, par espèce** (données Canonn Research, 30/09/2025). Les noms de couleur sont
rendus en français ; « Vert citron » correspond à la teinte *Lime* du Codex, à ne pas confondre avec le *Green* rendu
ici par « Vert ». Un tiret « — » marque une cellule **sans objet**, jamais une donnée manquante : chez *Bacterium
Alcyoneum*, *Bacterium Aurasus* et *Bacterium Cerbrus*, la couleur suit la classe de l'étoile hôte et non un matériau
de la croûte (voir 2.1), si bien qu'il n'y a pas de palette par matériau à énumérer pour elles.

| Espèce              | Déterminant de couleur | Variantes de couleur                                    |
|---------------------|------------------------|---------------------------------------------------------|
| Bacterium Alcyoneum | Classe stellaire       | —                                                       |
| Bacterium Aurasus   | Classe stellaire       | —                                                       |
| Bacterium Cerbrus   | Classe stellaire       | —                                                       |
| Bacterium Acies     | Matériau               | Cyan, Magenta, Cobalt, Vert citron, Blanc, Aigue-marine |
| Bacterium Bullaris  | Matériau               | Cobalt, Jaune, Aigue-marine, Or, Vert citron, Rouge     |
| Bacterium Informem  | Matériau               | Rouge, Vert citron, Or, Aigue-marine, Jaune, Cobalt     |
| Bacterium Nebulus   | Matériau               | Magenta, Or, Orange, Cyan, Vert, Cobalt                 |
| Bacterium Omentum   | Matériau               | Vert citron, Blanc, Aigue-marine, Pêche, Rouge, Bleu    |
| Bacterium Scopulum  | Matériau               | Blanc, Pêche, Vert citron, Rouge, Mûre, Aigue-marine    |
| Bacterium Tela      | Matériau               | Or, Orange, Jaune, Magenta, Cobalt, Vert                |
| Bacterium Verrata   | Matériau               | Pêche, Rouge, Blanc, Mûre, Bleu, Vert citron            |
| Bacterium Vesicula  | Matériau               | Cyan, Orange, Mûre, Or, Rouge, Vert citron              |
| Bacterium Volu      | Matériau               | Rouge, Aigue-marine, Cobalt, Vert citron, Cyan, Or      |

*Informem est l'espèce la plus chère du genre.*

#### Cactoida — genre d'exobiologie Odyssey (5 espèces, 2,5 M à 16,2 M Cr)

*Habitat : corps rocheux, atmosphères diverses. Séparation minimale 300 m (voir 2.3).*

| Espèce              | Valeur (Cr) | Fréquence | Corps      | Atmosphère | Volcanisme                                   | Température (K) | Gravité (G) |
|---------------------|-------------|-----------|------------|------------|----------------------------------------------|-----------------|-------------|
| Cactoida Cortexum   | 3 667 600   | 24,3 %    | Rocky, HMC | CO2        | Aucun                                        | 180-197         | ≤ 0,276     |
| Cactoida Lapis      | 2 483 600   | 34,8 %    | Rocky, HMC | Ammoniac   | Aucun, Silicaté, Magma ferreux, Rocheux, Eau | ≥ 160           | ≤ 0,276     |
| Cactoida Peperatis  | 2 483 600   | 13,3 %    | Rocky, HMC | Ammoniac   | Aucun                                        | ≥ 160           | ≤ 0,276     |
| Cactoida Pullulanta | 3 667 600   | 10,2 %    | Rocky, HMC | CO2        | Aucun                                        | 180-195,41      | ≤ 0,276     |
| Cactoida Vermis     | 16 202 800  | 17,3 %    | Rocky, HMC | Eau, SO2   | Aucun, Eau, Silicaté, Magma ferreux          | ≥ 160           | ≤ 0,276     |

*Précisions par espèce :*

- **Cactoida Cortexum** — Bras Orion-Cygnus et Centre-Left ; terrain plat à légèrement ondulé ; gravité limitée à
  0,238 G sur corps Rocky.
- **Cactoida Lapis** — Bras Sagittarius-Carina et Centre-Left ; terrain plat à légèrement ondulé.
- **Cactoida Peperatis** — Bras Scutum-Centaurus et Centre-Left ; pousse sur les collines et flancs de montagne
  (magmas mineurs tolérés sur Rocky).
- **Cactoida Pullulanta** — Bras de Persée et Centre-Top ; terrain plat à légèrement ondulé ; gravité limitée à 0,238
  G sur corps Rocky.
- **Cactoida Vermis** — Branche Water (T >= 390 K, gravité très basse <= 0,064 G) ou branche rare SO2 (160-207 K, g >=
  0,26).

*Vermis est à la fois l'espèce la plus chère et la plus tolérante à la chaleur du genre.*

#### Clypeus — genre d'exobiologie Odyssey (3 espèces, 8,4 M à 16,2 M Cr)

*Habitat : corps à haute teneur métallique ou rocheux, atmosphère CO2 ou eau, gravité < 0,28 G, plaines rocailleuses.
Séparation minimale 150 m (voir 2.3).*

| Espèce             | Valeur (Cr) | Fréquence | Corps | Atmosphère | Volcanisme | Température (K) | Gravité (G) |
|--------------------|-------------|-----------|-------|------------|------------|-----------------|-------------|
| Clypeus Lacrimam   | 8 418 000   | 54,2 %    | Rocky | CO2, Eau   | Aucun, Eau | ≥ 190           | ≤ 0,276     |
| Clypeus Margaritus | 11 873 200  | 28,1 %    | HMC   | CO2, Eau   | Aucun      | ≥ 190           | ≤ 0,276     |
| Clypeus Speculumi  | 16 202 800  | 17,7 %    | Rocky | CO2, Eau   | Aucun, Eau | ≥ 190           | ≤ 0,238     |

*Précisions par espèce :*

- **Clypeus Lacrimam** — Uniquement sur Rocky : branche CO2 190-199 K (g <= 0,238) ou branche Water T >= 390 K, sur
  plaines caillouteuses.
- **Clypeus Margaritus** — Uniquement sur HMC : branche CO2 190-195 K ou branche Water T >= 390 K, sur plaines
  caillouteuses et bas de collines.
- **Clypeus Speculumi** — Uniquement sur Rocky à plus de 2 500 Ls de l'étoile parente (contrainte communautaire non
  confirmée par télémétrie) ; branche Water limitée à 0,056 G.

#### Concha — genre d'exobiologie Odyssey (4 espèces, 2,4 M à 19,0 M Cr)

*Habitat : corps à haute teneur métallique ou rocheux, atmosphère ammoniac/CO2/azote/eau, gravité < 0,28 G, séparation
minimale 150 m.*

| Espèce            | Valeur (Cr) | Fréquence | Corps      | Atmosphère                  | Volcanisme | Température (K) | Gravité (G) |
|-------------------|-------------|-----------|------------|-----------------------------|------------|-----------------|-------------|
| Concha Labiata    | 2 352 400   | 47,4 %    | Rocky, HMC | CO2                         | Aucun      | 150-195,41      | ≤ 0,276     |
| Concha Aureolas   | 7 774 700   | 15,0 %    | Rocky, HMC | Ammoniac                    | —          | —               | ≤ 0,276     |
| Concha Renibus    | 4 572 400   | 36,9 %    | Rocky, HMC | CO2, Eau, Ammoniac, Méthane | —          | ≥ 79            | ≤ 0,276     |
| Concha Biconcavis | 19 010 800  | 0,74 %    | Rocky, HMC | Azote                       | Aucun      | ≤ 52            | ≤ 0,276     |

*Précisions par espèce :*

- **Concha Labiata** — Vallées et zones ondulées ; gravité limitée à 0,238 G sur corps Rocky.
- **Concha Aureolas** — Vallées et zones ondulées au pied des collines ; température seulement observée 152-177 K,
  sans borne dure.
- **Concha Renibus** — Branches CO2 180-195 K, Water T >= 390 K, Méthane 79-104 K et Ammonia T >= 174 K, avec une
  gravité de 0,05 à 0,238 G selon la branche. Le résumé d'habitat de Canonn se contente ici de la mention « sources de
  chaleur » ; le tableau ci-dessus est plus fin, avec ses quatre branches atmosphériques.
- **Concha Biconcavis** — Plafond thermique de 50 K sur corps Rocky (52 K sur HMC) ; vallées et zones ondulées au pied
  des reliefs.

*Biconcavis est très rare et particulièrement recherchée.*

#### Crystalline Shard — genre d'exobiologie hors famille Odyssey (1 espèce, 1,63 M Cr)

*Habitat : corps glacés, rocheux, rocheux-glacés ou à haute teneur métallique (HMC) sans atmosphère, volcanisme mineur
obligatoire (ammoniac, CO2, méthane, azote, eau, magma ferreux, rocheux ou silicaté), 20-250 K, à plus de 10 000 ls de
l'étoile d'arrivée ; étoile primaire de classe A, F, G, K ou M et système comportant un monde Earth-like, un Water
World, un Ammonia World ou une géante gazeuse à vie. Séparation minimale 100 m (voir 2.3).*

| Espèce             | Valeur (Cr) | Fréquence | Corps                      | Atmosphère | Volcanisme                                                           | Température (K) | Gravité (G) |
|--------------------|-------------|-----------|----------------------------|------------|----------------------------------------------------------------------|-----------------|-------------|
| Crystalline Shards | 1 628 800   | —         | Icy, Rocky, Rocky Ice, HMC | Aucune     | Ammoniac, CO2, Méthane, Azote, Eau, Magma ferreux, Rocheux, Silicaté | 20-250          | ≤ 1,45      |

*Précisions par espèce :*

- **Crystalline Shards** — Étoile primaire A, F, G, K ou M et système contenant un ELW, Water World, Ammonia World ou
  Gas Giant à vie ; volcanisme mineur obligatoire et plafond 1,45 G réservé aux HMC (0,19–0,24 G sur Icy/Rocky/Rocky
  Ice). Corps situé à plus de 10 000 ls de l'étoile d'arrivée.

*Le plafond de 1,45 G ne vaut que sur les corps HMC ; sur les corps glacés, rocheux ou rocheux-glacés, la fourchette
observée est de 0,19 à 0,24 G. Fréquences d'observation Canonn non disponibles pour ce genre.*

> **Divergence signalée.** Ces conditions d'apparition ne coïncident pas exactement avec celles que retient
> [Ingénieurs](./06-ingenieurs.md) pour le même site de récolte : ce guide-là admet en plus la classe stellaire S,
> retient 0 à 273 K, place le seuil à 12 000 Ls et accepte le *Water Giant* parmi les mondes déclencheurs. Aucune
> source primaire consultée ne départage les deux relevés ; voir la mise au point de la partie 1.

#### Electricae — genre d'exobiologie Odyssey (2 espèces, 6,28 M Cr chacune)

*Habitat : mondes de glace extrêmes exclusivement, atmosphère argon, séparation minimale 1 000 m, gravité 0,03-0,28 G,
environ 20-150 K.*

| Espèce              | Valeur (Cr) | Fréquence | Corps | Atmosphère           | Volcanisme | Température (K) | Gravité (G) | Corrélation                                    |
|---------------------|-------------|-----------|-------|----------------------|------------|-----------------|-------------|------------------------------------------------|
| Electricae Pluma    | 6 284 600   | 27,3 %    | Icy   | Argon, Néon          | —          | ≤ 150           | ≤ 0,276     | Étoiles A, naines blanches, étoiles à neutrons |
| Electricae Radialem | 6 284 600   | 72,7 %    | Icy   | Argon, Néon, Méthane | —          | ≤ 150           | ≤ 0,276     | Proximité de nébuleuses                        |

*Précisions par espèce :*

- **Electricae Pluma** — Exige une étoile parente de classe O, B, A, Ae/Be, Wolf-Rayet, naine blanche, étoile à
  neutrons ou trou noir ; plaines glacées près des lacs gelés.
- **Electricae Radialem** — À moins de 150 ly du centre d'une nébuleuse ; plaines glacées près des lacs gelés et des
  fissures.

#### Fonticulua — genre d'exobiologie Odyssey (6 espèces, 1 M à 20 M Cr)

*Habitat : mondes de glace exclusivement, gravité < 0,29 G, séparation minimale 500 m.*

| Espèce                 | Valeur (Cr)    | Fréquence | Corps          | Atmosphère   | Volcanisme | Température (K) | Gravité (G) |
|------------------------|----------------|-----------|----------------|--------------|------------|-----------------|-------------|
| Fonticulua Campestris  | 1 000 000      | 59,1 %    | Icy, Rocky Ice | Argon        | —          | ≤ 151           | ≤ 0,276     |
| Fonticulua Digitos     | 1 804 100      | —         | Icy, Rocky Ice | Méthane      | —          | —               | ≤ 0,276     |
| Fonticulua Fluctus     | **20 000 000** | très rare | Icy            | Oxygène, CO2 | —          | 143-200         | ≤ 0,276     |
| Fonticulua Lapida      | 3 111 000      | —         | Icy, Rocky Ice | Azote        | —          | ≤ 81            | ≤ 0,276     |
| Fonticulua Segmentatus | 19 010 800     | —         | Icy            | Néon         | —          | 50-75           | ≤ 0,276     |
| Fonticulua Upupam      | 5 727 600      | —         | Icy, Rocky Ice | Argon        | —          | ≤ 124           | ≤ 0,276     |

*Précisions par espèce :*

- **Fonticulua Campestris** — Plaines glacées doucement ondulées ; plafond de température 132 K sur Icy et 151 K sur
  Rocky Ice, et 59 % de la population du genre.
- **Fonticulua Digitos** — Seule Fonticulua qui tolère un terrain plus rugueux que les plaines ondulées, avec une
  gravité observée très basse (0,06 G).
- **Fonticulua Fluctus** — Espèce la plus chère du jeu (0,42 % de la population), exclusivement sur corps Icy en
  oxygène, avec une branche secondaire CO₂-rich à 170–180 K.
- **Fonticulua Lapida** — Plaines glacées très froides, avec un plafond de température de 70 K sur Icy et 81 K sur
  Rocky Ice.
- **Fonticulua Segmentatus** — Uniquement sur corps Icy : Néon entre 50 et 56,1 K, Néon-rich entre 56,2 et 75 K, pour
  1,17 % de la population du genre.
- **Fonticulua Upupam** — Exige une atmosphère Argon-rich (et non Argon simple), avec un plafond de 80 K sur Icy et
  124 K sur Rocky Ice.

*Fluctus est l'espèce la plus chère recensée dans l'ensemble de ce catalogue ; elle n'existe que sur des mondes de glace
à atmosphère riche en oxygène, une combinaison peu répandue, ce qui explique sa rareté.*

#### Frutexa — genre d'exobiologie Odyssey (7 espèces, 1,6 M à 10,3 M Cr)

*Habitat : corps à haute teneur métallique ou rocheux, gravité < 0,29 G, séparation minimale 150 m.*

| Espèce             | Valeur (Cr) | Fréquence | Corps      | Atmosphère                  | Volcanisme | Température (K) | Gravité (G) |
|--------------------|-------------|-----------|------------|-----------------------------|------------|-----------------|-------------|
| Frutexa Acus       | 7 774 700   | 33,2 %    | Rocky      | CO2                         | —          | 146-195,41      | ≤ 0,238     |
| Frutexa Collum     | 1 639 800   | —         | Rocky, HMC | SO2                         | —          | ≤ 211           | ≤ 0,276     |
| Frutexa Fera       | 1 632 500   | —         | Rocky      | CO2                         | —          | 146-195,41      | ≤ 0,238     |
| Frutexa Flabellum  | 1 808 900   | 21,8 %    | Rocky, HMC | Ammoniac, CO2               | —          | 152-195,41      | ≤ 0,276     |
| Frutexa Flammasis  | 10 326 000  | 8,7 %     | Rocky      | Ammoniac                    | —          | —               | ≤ 0,276     |
| Frutexa Metallicum | 1 632 500   | 22,5 %    | HMC        | Ammoniac, CO2, Méthane, Eau | Aucun      | —               | ≤ 0,276     |
| Frutexa Sponsae    | 5 988 000   | —         | Rocky      | Eau                         | —          | ≥ 390           | ≤ 0,276     |

*Précisions par espèce :*

- **Frutexa Acus** — Plaines et flancs rocheux, uniquement dans le bras Orion-Cygnus et la région Galactic Centre-Left
  (jumelle de Frutexa Fera).
- **Frutexa Collum** — Sans contrainte régionale, avec une plage de 132–211 K sur HMC contre un simple plafond de 151
  K sur Rocky.
- **Frutexa Fera** — Plaines et flancs rocheux, uniquement dans l'Outer Arm et la région Galactic Centre-Right
  (jumelle de Frutexa Acus).
- **Frutexa Flabellum** — Absente du bras Scutum-Centaurus et de la région Galactic Centre-Left, principalement en
  ammoniac avec une branche secondaire CO₂.
- **Frutexa Flammasis** — Restreinte au bras Scutum-Centaurus et à la région Galactic Centre-Left, sur flancs rocheux.
- **Frutexa Metallicum** — Uniquement sur HMC sans volcanisme, avec des branches CO₂ 146–195,41 K, Water T ≥ 390 K (g
  ≤ 0,052) et Méthane 100–102 K.
- **Frutexa Sponsae** — Corps rocheux très chauds (T ≥ 390 K) en atmosphère d'eau, à gravité observée très faible
  (0,04–0,06 G).

#### Fumerola — genre d'exobiologie Odyssey (4 espèces, 6,3 M à 16,2 M Cr)

*Habitat : zones volcaniques actives (environ 4 espèces). Séparation minimale 100 m (voir 2.3) — la plus courte de
toutes, cohérente avec la nécessité de rester à proximité immédiate des évents actifs.*

| Espèce            | Valeur (Cr) | Fréquence | Corps                 | Atmosphère                                | Volcanisme                       | Température (K) | Gravité (G) | Type de volcanisme | Terrain        |
|-------------------|-------------|-----------|-----------------------|-------------------------------------------|----------------------------------|-----------------|-------------|--------------------|----------------|
| Fumerola Aquatis  | 6 284 600   | 30,4 %    | Icy, Rocky, Rocky Ice | Argon, SO2, Ammoniac, Azote, Eau, Oxygène | Eau                              | —               | 0,03-0,276  | Aquatique          | Mondes glacés  |
| Fumerola Carbosis | 6 284 600   | 23,9 %    | Icy, Rocky Ice        | Méthane, Argon, SO2, Azote                | CO2, Méthane                     | —               | 0,03-0,276  | Carboné            | Mondes glacés  |
| Fumerola Extremus | 16 202 800  | 13,8 %    | Rocky, Rocky Ice, HMC | Méthane, Ammoniac, SO2, Argon             | Silicaté, Rocheux, Magma ferreux | —               | 0,04-0,276  | Vapeur de silicate | Mondes rocheux |
| Fumerola Nitris   | 7 500 900   | 31,9 %    | Icy                   | Argon, Méthane                            | Ammoniac, Azote                  | —               | 0,03-0,276  | Azoté              | Mondes glacés  |

*Précisions par espèce :*

- **Fumerola Aquatis** — Pousse exclusivement sur les fumerolles à geysers ou magma d'eau, sur les rochers des zones
  plates repérées au DSS géologique.
- **Fumerola Carbosis** — Fumerolles à geysers de dioxyde de carbone ou magma de méthane mineur, surtout sur corps
  Icy.
- **Fumerola Extremus** — Fumerolles à geysers de vapeur de silicate ou magma rocheux/métallique, majoritairement sur
  corps Rocky.
- **Fumerola Nitris** — Fumerolles à magma mineur d'ammoniac ou d'azote sur corps Icy, avec 2 % des relevés sur
  d'autres atmosphères qu'Argon ou Methane.

#### Fungoida — genre d'exobiologie Odyssey (4 espèces, 1,7 M à 3,7 M Cr)

*Habitat : organismes souterrains chimio/thermosynthétiques, terrain montagneux, séparation minimale 300 m.*

| Espèce            | Valeur (Cr) | Fréquence | Corps                 | Atmosphère                         | Volcanisme | Température (K) | Gravité (G) |
|-------------------|-------------|-----------|-----------------------|------------------------------------|------------|-----------------|-------------|
| Fungoida Setisis  | 1 670 100   | 50,2 %    | Rocky, HMC, Rocky Ice | Ammoniac, Méthane, CO2             | —          | —               | ≤ 0,276     |
| Fungoida Gelata   | 3 330 300   | 22,9 %    | Rocky, HMC            | CO2, Eau, Ammoniac, Argon, Méthane | —          | —               | ≤ 0,276     |
| Fungoida Stabitis | 2 680 300   | 18,1 %    | Rocky, HMC            | CO2, Eau, Ammoniac, Argon, Méthane | —          | —               | ≤ 0,276     |
| Fungoida Bullarum | 3 703 200   | 8,9 %     | Rocky Ice, Rocky, HMC | Argon, Azote                       | Aucun      | ≤ 133           | ≤ 0,276     |

*Précisions par espèce :*

- **Fungoida Setisis** — Sans contrainte régionale, sur flancs et sommets de montagnes, avec une branche Ammonia
  160–195,41 K, une branche Methane 67–108 K et une branche CO₂.
- **Fungoida Gelata** — Absente du bras Orion-Cygnus ; branche CO₂ à 180–195,41 K plafonnée à 0,238 G et branche Water
  à T ≥ 390 K, sur flancs de montagnes.
- **Fungoida Stabitis** — Restreinte au bras Orion-Cygnus et à la région Galactic Centre-Left ; branche CO₂ 180–195,41
  K plafonnée à 0,238 G et branche Water T ≥ 390 K.
- **Fungoida Bullarum** — Surtout sur Rocky Ice, sur flancs et sommets de montagnes, avec un plafond de température
  variable selon la branche (77, 90, 93 ou 133 K).

#### Osseus — genre d'exobiologie Odyssey (6 espèces, 1,5 M à 12,9 M Cr)

*Habitat : corps rocheux ou à haute teneur métallique, séparation minimale 800 m.*

| Espèce             | Valeur (Cr) | Fréquence | Corps                 | Atmosphère                    | Volcanisme | Température (K) | Gravité (G) |
|--------------------|-------------|-----------|-----------------------|-------------------------------|------------|-----------------|-------------|
| Osseus Cornibus    | 1 483 000   | 5,6 %     | Rocky, HMC            | CO2                           | Aucun      | 180-195,41      | ≤ 0,276     |
| Osseus Fractus     | 4 027 800   | 16,2 %    | Rocky, HMC            | CO2                           | Aucun      | 180-190         | ≤ 0,276     |
| Osseus Pellebantus | 9 739 000   | 4,7 %     | Rocky, HMC            | CO2                           | Aucun      | 191-195,41      | ≤ 0,276     |
| Osseus Spiralis    | 2 404 700   | 48,1 %    | Rocky, HMC, Rocky Ice | Ammoniac                      | —          | ≥ 160           | ≤ 0,276     |
| Osseus Discus      | 12 934 900  | 8,3 %     | Rocky, HMC, Rocky Ice | Eau, Méthane, Ammoniac, Argon | —          | —               | 0,05-0,276  |
| Osseus Pumice      | 3 156 300   | 16,9 %    | Rocky Ice, Rocky, HMC | Argon, Méthane, Azote         | —          | ≤ 134           | ≤ 0,276     |

*Précisions par espèce :*

- **Osseus Cornibus** — Pousse uniquement sur les zones rocheuses ; bras de Persée et région Centre-Top ; plafond réel
  0,238 G sur corps Rocky, 0,276 G sur HMC.
- **Osseus Fractus** — Pousse uniquement sur les zones rocheuses ; partout SAUF le bras de Persée et la région
  Centre-Top.
- **Osseus Pellebantus** — Pousse uniquement sur les zones rocheuses ; partout SAUF le bras de Persée et la région
  Centre-Top.
- **Osseus Spiralis** — Pousse uniquement sur les zones rocheuses ; aucune contrainte de région galactique.
- **Osseus Discus** — Pousse uniquement sur les zones rocheuses ; la branche Water exige T >= 390 K et la branche
  Méthane 78-109 K.
- **Osseus Pumice** — Pousse uniquement sur les zones rocheuses, surtout sur Rocky Ice ; le plafond de température
  varie de 51 K à 134 K selon l'atmosphère.

#### Radicoida — genre d'exobiologie hors famille Odyssey (1 espèce, 952 296 Cr, système HIP 87621)

*Habitat : corps à haute teneur métallique (HMC) ou rocheux, atmosphère CO2, sans volcanisme ou à volcanisme silicaté,
467-699 K, gravité 0,05-0,38 G. Genre à espèce unique, connu du seul système **HIP 87621** (accès sous permis) : le
signal est classé « Other » et n'apparaît pas dans la surimpression exobiologie du DSS, et seuls les arbres de taille
moyenne (environ 30 m) sont scannables. Séparation minimale 15 m (voir 2.3).*

| Espèce          | Valeur (Cr) | Fréquence | Corps      | Atmosphère | Volcanisme      | Température (K) | Gravité (G) |
|-----------------|-------------|-----------|------------|------------|-----------------|-----------------|-------------|
| Radicoida Unica | 952 296     | —         | HMC, Rocky | CO2        | Aucun, Silicaté | 467-699         | 0,05-0,38   |

*Précisions par espèce :*

- **Radicoida Unica** — Uniquement dans HIP 87621 (système permit-locked), signal classé « Other » sans overlay
  exobiologie au DSS, et seuls les arbres de taille moyenne (~30 m) sont scannables.

> **Divergence de valeur assumée.** Le catalogue compilé cité en 2.4 porte **119 037 Cr** pour cette espèce. Ce guide
> retient **952 296 Cr**, valeur **relevée en jeu à la vente** et consignée dans l'étude de faisabilité du 19/08/2026
> de ce corpus, qui note qu'elle « sort du schéma des valeurs rondes ». Une valeur observée en jeu prime sur une valeur
> de catalogue compilé : c'est le montant que le comptoir Vista Genomics verse réellement. Deux indices renforcent la
> correction. D'une part, sur les 118 espèces du catalogue compilé, *Radicoida Unica* est la **seule** dont la valeur
> ne soit pas un multiple de 100, ce qui la désigne comme l'anomalie plutôt que comme la règle. D'autre part, 119 037
> est exactement le huitième de 952 296, un rapport entier qui ressemble à une erreur de report plutôt qu'à un barème.
> Le montant observé reste néanmoins **une observation unique** : il mérite d'être reconfirmé sur une seconde vente.
> La même étude corrige au passage la **distance d'échantillonnage**, relevée à **15 m** en jeu là où le catalogue
> compilé porte 100 m ; c'est la valeur de 15 m qui figure dans le tableau de 2.3. Les deux divergences sont
> également consignées dans [Sources de données](./17-sources-donnees.md).

*Même corrigée, c'est l'espèce la moins rémunératrice du catalogue — la seule à passer sous les 1 000 000 Cr, valeur
plancher que partagent six autres espèces (Bacterium Acies, Bacterium Aurasus, Bacterium Vesicula, Fonticulua
Campestris, Tussock Pennatis, Tussock Propagito). Fréquences d'observation Canonn non disponibles pour ce genre.*

#### Recepta — genre d'exobiologie Odyssey (3 espèces, 12,9 M à 16,2 M Cr)

*Habitat : extrêmophiles SO2, mondes glacés ou rocheux, gravité < 0,29 G, séparation minimale 150 m.*

| Espèce                | Valeur (Cr) | Fréquence | Corps                      | Atmosphère         | Volcanisme | Température (K) | Gravité (G) |
|-----------------------|-------------|-----------|----------------------------|--------------------|------------|-----------------|-------------|
| Recepta Umbrux        | 12 934 900  | 51,6 %    | Icy, Rocky, Rocky Ice, HMC | SO2, CO2, Ammoniac | —          | ≤ 273           | ≤ 0,276     |
| Recepta Conditivus    | 14 313 700  | 30,0 %    | Icy, Rocky, Rocky Ice, HMC | SO2, CO2, Oxygène  | —          | ≤ 273           | ≤ 0,276     |
| Recepta Deltahedronix | 16 202 800  | 18,4 %    | Rocky, Icy, HMC, Rocky Ice | SO2, CO2, Oxygène  | —          | ≤ 272           | ≤ 0,276     |

*Précisions par espèce :*

- **Recepta Umbrux** — Terrain plat, légèrement ondulé ou en pente douce ; surtout sur corps Icy en atmosphère SO2.
- **Recepta Conditivus** — Terrain plat, légèrement ondulé ; très majoritairement sur corps Icy en atmosphère SO2.
- **Recepta Deltahedronix** — Terrain plat, légèrement ondulé ; majoritairement sur corps Rocky, certaines branches
  plafonnent à 0,238 G.

#### Sinuous Tuber — genre d'exobiologie hors famille Odyssey (8 espèces, 1,51 M Cr chacune)

*Habitat : corps rocheux ou à haute teneur métallique (HMC) sans atmosphère, volcanisme de magma ferreux, silicaté ou
rocheux, 200-500 K. Genre restreint à certaines régions Canonn du cœur galactique, chaque couleur correspondant à un
ensemble de régions distinct. Séparation minimale 100 m (voir 2.3).*

| Espèce                      | Valeur (Cr) | Fréquence | Corps      | Atmosphère | Volcanisme                       | Température (K) | Gravité (G) | Gravité max (Rocky / HMC) | Régions Canonn |
|-----------------------------|-------------|-----------|------------|------------|----------------------------------|-----------------|-------------|---------------------------|----------------|
| Albidum Sinuous Tubers      | 1 514 500   | —         | Rocky, HMC | Aucune     | Magma ferreux, Silicaté, Rocheux | 200-500         | ≤ 3         | 3 G / 0,3 G               | 9 à 11         |
| Blatteum Sinuous Tubers     | 1 514 500   | —         | Rocky, HMC | Aucune     | Magma ferreux, Silicaté, Rocheux | 200-500         | ≤ 3         | 3 G / 0,5 G               | 6 à 10, 18, 19 |
| Caeruleum Sinuous Tubers    | 1 514 500   | —         | Rocky, HMC | Aucune     | Rocheux, Silicaté                | 200-500         | ≤ 3         | 3 G / 0,7 G               | 1 à 5, 8 à 11  |
| Lindigoticum Sinuous Tubers | 1 514 500   | —         | Rocky, HMC | Aucune     | Magma ferreux, Silicaté, Rocheux | 200-500         | ≤ 2         | 2 G / 0,5 G               | 4 à 10, 18, 19 |
| Prasinum Sinuous Tubers     | 1 514 500   | —         | Rocky, HMC | Aucune     | Magma ferreux, Silicaté, Rocheux | 200-500         | ≤ 3         | 3 G / 0,3 G               | 1 à 5, 8 à 11  |
| Roseum Sinuous Tubers       | 1 514 500   | —         | Rocky, HMC | Aucune     | Rocheux, Silicaté, Magma ferreux | 200-500         | ≤ 4         | 4 G / 0,3 G               | 1 à 11, 18, 19 |
| Violaceum Sinuous Tubers    | 1 514 500   | —         | Rocky, HMC | Aucune     | Magma ferreux, Silicaté, Rocheux | 200-500         | ≤ 3         | 3 G / 0,5 G               | 2 à 10, 18, 19 |
| Viride Sinuous Tubers       | 1 514 500   | —         | Rocky, HMC | Aucune     | Rocheux, Magma ferreux, Silicaté | 200-500         | ≤ 2         | 2 G / 0,3 G               | 3 à 10, 18, 19 |

*Précisions par espèce :*

- **Albidum Sinuous Tubers** — Régions Canonn 9, 10 et 11 près du cœur galactique ; plafond 3 G sur Rocky mais
  seulement 0,3 G sur HMC.
- **Blatteum Sinuous Tubers** — Régions Canonn 6 à 10, 18 et 19 ; plafond 3 G sur Rocky mais seulement 0,5 G sur HMC.
- **Caeruleum Sinuous Tubers** — Régions Canonn 1 à 5 et 8 à 11, geysers majeurs Rocky/Silicate ; plafond 3 G sur
  Rocky mais 0,7 G sur HMC.
- **Lindigoticum Sinuous Tubers** — Régions Canonn 4 à 10, 18 et 19 ; plafond 2 G sur Rocky mais seulement 0,5 G sur
  HMC.
- **Prasinum Sinuous Tubers** — Régions Canonn 1 à 5 et 8 à 11 ; plafond 3 G sur Rocky mais seulement 0,3 G sur HMC.
- **Roseum Sinuous Tubers** — Présent dans tout le TubersBatch (régions 1 à 11, 18 et 19) ; plafond 4 G sur Rocky mais
  seulement 0,3 G sur HMC.
- **Violaceum Sinuous Tubers** — Régions Canonn 2 à 10, 18 et 19 ; plafond 3 G sur Rocky mais seulement 0,5 G sur HMC.
- **Viride Sinuous Tubers** — Régions Canonn 3 à 10, 18 et 19 ; plafond 2 G sur Rocky mais seulement 0,3 G sur HMC.

*Caeruleum et Prasinum exigent un volcanisme rocheux ou silicaté (geysers majeurs pour Caeruleum) ; les autres espèces
acceptent aussi le magma ferreux. Fréquences d'observation Canonn non disponibles pour ce genre.*

#### Stratum — genre d'exobiologie Odyssey (8 espèces, 1,4 M à 19,0 M Cr)

*Habitat : corps rocheux ou à haute teneur métallique. Séparation minimale 500 m (voir 2.3).*

| Espèce             | Valeur (Cr) | Fréquence | Corps | Atmosphère                       | Volcanisme | Température (K) | Gravité (G) |
|--------------------|-------------|-----------|-------|----------------------------------|------------|-----------------|-------------|
| Stratum Araneamus  | 2 448 900   | —         | Rocky | SO2                              | —          | 165-373         | 0,26-0,57   |
| Stratum Cucumisis  | 16 202 800  | 4,2 %     | Rocky | SO2, CO2, Oxygène                | —          | 191-373         | ≤ 0,59      |
| Stratum Excutitus  | 2 448 900   | 10,0 %    | Rocky | CO2, SO2, Oxygène                | —          | 165-190         | ≤ 0,49      |
| Stratum Frigus     | 2 637 500   | —         | Rocky | SO2, CO2, Oxygène                | —          | 191-372         | ≤ 0,56      |
| Stratum Laminamus  | 2 788 300   | —         | Rocky | Ammoniac                         | —          | ≥ 161           | ≤ 0,62      |
| Stratum Limaxus    | 1 362 000   | —         | Rocky | CO2, SO2, Oxygène                | —          | 165-190         | ≤ 0,48      |
| Stratum Paleas     | 1 362 000   | 36,9 %    | Rocky | Ammoniac, CO2, Eau, Oxygène      | —          | 165-447         | ≤ 0,6       |
| Stratum Tectonicas | 19 010 800  | 37,5 % *  | HMC   | SO2, CO2, Ammoniac, Eau, Oxygène | —          | 165-450         | ≤ 0,62      |

*Précisions par espèce :*

- **Stratum Araneamus** — Terrain plat ouvert, aucune contrainte de région ; espèce très rare (0,3 % de la population),
  seule la variante Emerald a été observée.
- **Stratum Cucumisis** — Terrain plat ouvert ; uniquement dans le bras Sagittarius-Carina et la région Centre-Left.
- **Stratum Excutitus** — Terrain plat ouvert ; uniquement dans le bras Orion-Cygnus et la région Centre-Left.
- **Stratum Frigus** — Terrain plat ouvert ; bras de Persée et régions 3 et 7.
- **Stratum Laminamus** — Terrain plat ouvert ; probablement bras Sagittarius-Carina et région Izanami.
- **Stratum Limaxus** — Terrain plat ouvert ; bras Scutum-Centaurus, hors Odin's Hold et Galactic Centre.
- **Stratum Paleas** — Terrain plat ouvert, aucune contrainte de région ; la branche Water exige T >= 390 K.
- **Stratum Tectonicas** — Terrain plat ouvert sur HMC uniquement, aucune contrainte de région ; la branche Water exige
  T >= 390 K.

*\* Canonn note que ce pourcentage est probablement surreprésenté, la forte valeur de Tectonicas attirant davantage de
chasseurs d'échantillons que les autres espèces du genre.*

#### Tubus — genre d'exobiologie Odyssey (5 espèces, 2,4 M à 11,9 M Cr)

*Habitat : gravité < 0,17 G, plaines ouvertes, atmosphère ammoniac ou CO2. Séparation minimale 800 m (voir 2.3).*

| Espèce           | Valeur (Cr) | Fréquence | Corps | Atmosphère    | Volcanisme | Température (K) | Gravité (G) |
|------------------|-------------|-----------|-------|---------------|------------|-----------------|-------------|
| Tubus Compagibus | 7 774 700   | 44,2 %    | Rocky | CO2           | Aucun      | 160-197         | ≤ 0,16      |
| Tubus Cavas      | 11 873 200  | 18,0 %    | Rocky | CO2           | Aucun      | 160-197         | ≤ 0,153     |
| Tubus Rosarium   | 2 637 500   | 14,2 %    | Rocky | Ammoniac      | —          | ≥ 160           | ≤ 0,164     |
| Tubus Conifer    | 2 415 500   | 14,1 %    | Rocky | CO2           | Aucun      | 160-195,41      | ≤ 0,152     |
| Tubus Sororibus  | 5 727 600   | 9,7 %     | HMC   | CO2, Ammoniac | Aucun      | 160-195,41      | ≤ 0,153     |

*Précisions par espèce :*

- **Tubus Compagibus** — Plaines ouvertes du bras Sagittarius-Carina et du Centre-Gauche galactique, pression >= 0,003
  atm.
- **Tubus Cavas** — Plaines ouvertes du bras Scutum-Centaurus et du Centre-Gauche galactique, pression >= 0,003 atm.
- **Tubus Rosarium** — Plaines ouvertes sans contrainte de région, toléré un volcanisme particulaire mineur.
- **Tubus Conifer** — Plaines ouvertes du bras Perseus et du Centre-Haut galactique, pression >= 0,003 atm.
- **Tubus Sororibus** — HMC uniquement, branche CO2 dominante (97 %) bornée à 195,41 K alors que la branche Ammoniac
  (3 %) n'a pas de plafond, pression >= 0,002 atm.

#### Tussock — genre d'exobiologie Odyssey (15 espèces, 1 M à 19,0 M Cr)

*Habitat : surface solide requise, gravité < 0,29 G, majoritairement CO2 mais aussi ammoniac/méthane/SO2/eau. Genre le
plus diversifié de la famille Odyssey avec Bacterium : 15 espèces recensées, désormais toutes listées ci-dessous.
Séparation minimale 200 m (voir 2.3).*

| Espèce            | Valeur (Cr) | Fréquence | Corps            | Atmosphère     | Volcanisme | Température (K) | Gravité (G) |
|-------------------|-------------|-----------|------------------|----------------|------------|-----------------|-------------|
| Tussock Albata    | 3 252 500   | 7,18 %    | Rocky, HMC       | CO2            | Aucun      | 175-180         | ≤ 0,276     |
| Tussock Capillum  | 7 025 800   | 3,36 %    | Rocky Ice, Rocky | Argon, Méthane | Aucun      | 80-129          | 0,22-0,276  |
| Tussock Caputus   | 3 472 400   | 8,03 %    | Rocky, HMC       | CO2            | Aucun      | 181-190         | ≤ 0,276     |
| Tussock Catena    | 1 766 600   | 4,89 %    | Rocky, HMC       | Ammoniac       | —          | —               | ≤ 0,276     |
| Tussock Cultro    | 1 766 600   | 16,78 %   | Rocky, HMC       | Ammoniac       | —          | —               | ≤ 0,276     |
| Tussock Divisa    | 1 766 600   | 6,28 %    | Rocky, HMC       | Ammoniac       | —          | —               | ≤ 0,276     |
| Tussock Ignis     | 1 849 000   | 13,22 %   | Rocky, HMC       | CO2            | Aucun      | 161-170         | ≤ 0,196     |
| Tussock Pennata   | 5 853 800   | 2,31 %    | Rocky, HMC       | CO2            | Aucun      | 145-154         | ≤ 0,79      |
| Tussock Pennatis  | 1 000 000   | 7,95 %    | Rocky, HMC       | CO2            | Aucun      | 146-195,41      | ≤ 0,276     |
| Tussock Propagito | 1 000 000   | 12,81 %   | Rocky, HMC       | CO2            | Aucun      | 145-195,41      | ≤ 0,276     |
| Tussock Serrati   | 4 447 100   | 5,14 %    | Rocky, HMC       | CO2            | Aucun      | 171-174         | ≤ 0,227     |
| Tussock Stigmasis | 19 010 800  | 0,88 %    | Rocky, HMC       | SO2            | Aucun      | 132-168         | ≤ 0,276     |
| Tussock Triticum  | 7 774 700   | 2,61 %    | Rocky, HMC       | CO2            | Aucun      | 191-195,41      | ≤ 0,276     |
| Tussock Ventusa   | 3 227 700   | 4,33 %    | Rocky, HMC       | CO2            | —          | 155-160         | ≤ 0,16      |
| Tussock Virgam    | 14 313 700  | 4,23 %    | Rocky, HMC       | Eau            | —          | ≥ 390           | ≤ 0,276     |

##### Tussock — précisions d'habitat, espèce par espèce (15 espèces)

*Précisions par espèce :*

- **Tussock Albata** — Plaines plates entre les montagnes, bras Sagittarius-Carina et Perseus, plafond ramené à 0,238
  G sur corps Rocky.
- **Tussock Capillum** — Quasi exclusivement sur Rocky Ice, seule Tussock à exiger une gravité minimale (0,22 G, voire
  0,269 G selon la branche), aucune contrainte de région.
- **Tussock Caputus** — Plaines plates des bras Sagittarius-Carina et Perseus, plafond ramené à 0,238 G sur corps
  Rocky.
- **Tussock Catena** — Bras Scutum-Centaurus hors région du Centre Galactique, magmas mineurs tolérés.
- **Tussock Cultro** — Bras Orion-Cygnus et Centre-Gauche (Odin's Hold, Izanami, Inner Orion Spur), geysers de
  silicate majeurs et magma métallique mineur tolérés.
- **Tussock Divisa** — Bras Perseus (et région 3), géologie mineure tolérée.
- **Tussock Ignis** — Bras Sagittarius-Carina et Perseus, gravité très limitée (0,171 G sur Rocky, 0,196 G sur HMC).
- **Tussock Pennata** — Bras Sagittarius-Carina et Perseus, plafond de 0,09 G sur Rocky contre 0,79 G sur la branche
  HMC.
- **Tussock Pennatis** — Outer Arm et Centre-Droit galactique, plafond ramené à 0,238 G sur corps Rocky.
- **Tussock Propagito** — Bras Scutum-Centaurus et Centre-Gauche, plafond ramené à 0,238 G sur corps Rocky.
- **Tussock Serrati** — Bras Sagittarius-Carina et Perseus, fenêtre thermique très étroite, plafond 0,198 G sur Rocky
  et 0,227 G sur HMC.
- **Tussock Stigmasis** — Aucune contrainte de région, fenêtre 132-168 K sur HMC mais seulement <= 152 K sur corps
  Rocky.
- **Tussock Triticum** — Bras Sagittarius-Carina et Perseus, corps CO2 très chauds, plafond ramené à 0,238 G sur
  Rocky.
- **Tussock Ventusa** — Bras Sagittarius-Carina et Perseus, gravité très basse (0,13 G sur Rocky, 0,16 G sur HMC),
  geysers de CO2 mineurs tolérés.
- **Tussock Virgam** — Mondes brûlants à atmosphère d'eau sans contrainte de région, gravité réelle observée très
  basse (0,04-0,06 G), magma d'eau mineur toléré.

*Stigmasis est l'espèce la plus chère du genre, Virgam la deuxième.*

### 2.5 Où trouver les espèces d'exobiologie les plus rentables

En recoupant l'ensemble des valeurs du tableau 2.4, le classement des espèces exobiologiques les plus rentables se
présente ainsi :

| Rang | Espèce                 | Valeur (Cr) | Atmosphère / habitat         | Fréquence |
|------|------------------------|-------------|------------------------------|-----------|
| 1    | Fonticulua Fluctus     | 20 000 000  | Oxygène, mondes de glace     | très rare |
| 2    | Concha Biconcavis      | 19 010 800  | Azote                        | 0,74 %    |
| 2    | Fonticulua Segmentatus | 19 010 800  | Néon, mondes de glace        | —         |
| 2    | Stratum Tectonicas     | 19 010 800  | Haute teneur métallique      | 37,5 % *  |
| 2    | Tussock Stigmasis      | 19 010 800  | SO2                          | 0,88 %    |
| 6    | Cactoida Vermis        | 16 202 800  | Eau                          | 17,3 %    |
| 6    | Clypeus Speculumi      | 16 202 800  | CO2/eau                      | 17,7 %    |
| 6    | Fumerola Extremus      | 16 202 800  | Volcans à vapeur de silicate | 13,8 %    |
| 6    | Recepta Deltahedronix  | 16 202 800  | SO2                          | 18,4 %    |
| 6    | Stratum Cucumisis      | 16 202 800  | CO2/SO2                      | 4,2 %     |
| 11   | Recepta Conditivus     | 14 313 700  | SO2                          | 30,0 %    |
| 11   | Tussock Virgam         | 14 313 700  | Eau                          | 4,2 %     |
| 13   | Aleoida Gravis         | 12 934 900  | Ammoniac/CO2                 | 11,8 %    |
| 13   | Osseus Discus          | 12 934 900  | —                            | 8,3 %     |
| 13   | Recepta Umbrux         | 12 934 900  | SO2                          | 51,6 %    |

**Stratégie pratique** (méthode décrite par le commandant Canonn *JJGoldberg*, premier commandant à atteindre le rang
Exobiology Elite V, article *« The Road to Exobiology Elite V »*) :

- Combiner les bases **EDAstro**, **EDSM** et **Canonn** (recherche par espèce, valeur et distance) avec un traceur de
  route pour visiter en chaîne les systèmes contenant les espèces à plus forte valeur.
- Certains secteurs galactiques (**Sinuefai, Sinuefe, Wredguia**) offriraient, selon l'expérience de JJGoldberg, des
  taux de rencontre supérieurs pour les espèces à haute valeur — information à recouper avant de planifier un itinéraire
  sur cette seule base.
- Les genres **Fonticulua** et **Electricae** n'existent que sur les mondes de glace ; **Recepta** et
  **Cactoida/Concha** nécessitent des atmosphères spécifiques et plus rares (SO2, eau), ce qui explique leur rareté et
  donc leur valeur élevée.
- **Repérer précisément la composition atmosphérique via le FSS avant de se poser** est la clé pour cibler directement
  les espèces payantes plutôt que d'atterrir au hasard.
- L'outil **Road to Riches** de Spansh automatise l'essentiel de cette méthode en générant directement un itinéraire
  optimisé sur une zone donnée.

#### Le bonus de première empreinte (First Footfall) et le First Logged (×5) en exobiologie

Deux bonus distincts sont attachés au fait d'arriver le premier sur un corps, et **ils sont constamment confondus**, y
compris dans les guides communautaires — la distinction change pourtant la manière de planifier un itinéraire.

| Bonus              | Ce qu'il récompense                                                         | Ce qu'il rapporte                                                       |
|--------------------|-----------------------------------------------------------------------------|-------------------------------------------------------------------------|
| **First Logged**   | Premier commandant à faire enregistrer une espèce donnée sur un corps donné | Valeur de base **+ 400 %**, soit **×5**                                 |
| **First Footfall** | Premier être humain à poser le pied sur le corps                            | Aucun crédit : le nom du commandant est inscrit sur la carte du système |

Le multiplicateur du First Logged est de **×5** (base + 400 %). Le wiki *Elite Dangerous* l'énonce sans ambiguïté dans
*Exobiology Sample Values* : *« samples that qualify as "First Logged" will reward five times the amount listed
below »*, et trois sources internes concordantes de ce corpus le reprennent (voir la note de sourçage en fin de
sous-section). Concrètement, un *Stratum Tectonicas* passe de **19 010 800 Cr** à **95 054 000 Cr** — chiffre donné tel
quel par ces sources. Par le même calcul, une *Fonticulua Fluctus*, espèce la plus chère du catalogue à 20 000 000 Cr
de base, atteindrait 100 000 000 Cr ; cette seconde valeur est une application de la règle, non un montant relevé dans
une source.

**Le First Footfall lui-même ne verse rien.** C'est une inscription sur la carte du système, pas une prime. S'il pèse
malgré tout sur la planification, c'est par un raccourci logique : un corps que personne n'a jamais foulé est en
pratique un First Logged garanti sur **toutes** ses espèces. D'où la confusion, que reproduisent d'ailleurs plusieurs
guides communautaires en parlant de « prime First Footfall ×5 » là où le ×5 est celui du First Logged.

##### Condition exacte d'obtention du ×5 First Logged (couple espèce/corps, réclamé à la vente)

Le bonus du First Logged se joue par couple **(espèce, corps)**, une seule fois dans l'histoire du jeu, et il est
**réclamé à la vente, pas au scan**. Un autre commandant peut donc encore le prendre pendant que les données dorment,
non vendues, dans la soute. Corollaire déjà rappelé en 2.3 : une fois l'espèce vendue depuis un corps,
le jeu refuse tout nouveau prélèvement de cette espèce sur ce corps — il faut aller de l'avant, jamais planifier un
retour.

##### Vérifier qu'un corps d'exobiologie est vierge avant d'atterrir (quatre contrôles)

Aucun outil ne garantit qu'un corps est vierge — la grande majorité des joueurs n'uploadent pas leurs journaux, si
bien que les bases sous-estiment systématiquement ce qui a déjà été exploré. Les vérifications utiles, par ordre de
coût croissant :

1. **Carte galactique**, avant même de sauter : le système est-il marqué comme non découvert ?
2. **Carte du système**, une fois sur place : un nom de commandant associé à un corps ou à une espèce signifie que le
   ×5 est perdu pour ce couple.
3. **Spansh Body Search**, en amont : filtrer sur *Last Updated At* antérieur au **19 mai 2021** (sortie d'Odyssey)
   pour cibler des corps dont aucune donnée biologique n'a jamais été remontée.
4. **Règle de distance** : les planètes de la Bulle n'offrent aucune première empreinte — les colons NPC les ont
   foulées depuis des siècles. Au-delà d'environ **1 000 al de Sol**, les corps vierges redeviennent fréquents.

##### Incidence du First Logged sur le choix d'itinéraire : boucle près de la Bulle ou espace vierge

Deux stratégies d'itinéraire d'exobiologie s'opposent face au bonus First Logged, et ce corpus les documente toutes
les deux :

- **Boucle près de la Bulle** (« Bubble Billionaire ») : pas de ×5, mais un volume élevé de spécimens, des retours
  rapides et un risque quasi nul. C'est la stratégie d'apprentissage, celle qu'un itinéraire *Road to Riches* ou
  *Expressway to Exomastery* de Spansh (voir 1.4) sert directement.
- **Expédition en espace vierge** : viser **500 à 2 000 al** hors des routes fréquentées, en évitant l'axe
  Sol-Colonia-Sagittarius A\* et les corridors balisés par les expéditions type Distant Worlds, déjà ratissés. Le gain
  attendu est d'un ordre de grandeur, au prix du risque : découper l'expédition en sessions (trajet aller, quatre à
  cinq sessions d'exploitation, trajet retour et vente) et **ne jamais enchaîner plus de cinq à six sessions sans
  vendre**, le risque cumulé de perdre le vaisseau — et avec lui la totalité des données non vendues — devenant
  inacceptable.

##### Cumul du ×5 avec la vente chez Vista Genomics et effet sur la réputation de faction

Le ×5 s'applique ligne par ligne, au couple (espèce, corps) : une même vente groupée peut donc mêler des lignes à
valeur de base et des lignes à ×5, et la vente en gros n'ouvre droit à **aucun bonus de volume supplémentaire** :
aucune des sources internes consultées n'en documente. Ce que la vente groupée apporte est d'un autre ordre : elle
fait grimper la réputation auprès de la faction contrôlant la station, presque instantanément jusqu'au statut
*Allied*, ce qui rend le **choix du lieu de vente** significatif. Sur une longue expédition, installer un module
**Vista Genomics** à bord d'un Fleet Carrier (voir [Fleet Carriers](./19-fleet-carriers.md)) permet d'encaisser sur
place et de mettre les données à l'abri sans rentrer dans la Bulle.

> **Sources de cette sous-section** : quatre guides applicatifs internes à ce corpus (*exploration-exobiologie*,
> *protocole-milliard*, *outils* et *débuter sans combat*, édition 2026-08), consultés le 09/09/2026, qui citent
> eux-mêmes le wiki *Elite Dangerous* (*Exobiology Sample Values*), Frontier Developments, Spansh et Canonn Research.
> Le chiffre de ×5 est concordant entre ces sources ; en revanche, **aucune d'elles ne chiffre un gain propre au
> First Footfall**, ce qui est cohérent avec l'idée qu'il n'en verse aucun.

### 2.6 Rangs Explorateur et Exobiologiste : les paliers jusqu'à Elite V

Comme les autres activités du jeu (combat, commerce, CQC…), l'exploration et l'exobiologie disposent chacune d'une
échelle de progression propre, visible dans le panneau des rangs du commandant. L'échelle Explorateur comporte huit paliers avant le rang **Elite** ;
celle d'Exobiologiste n'en porte que sept dans les relevés dont dispose ce corpus, sans qu'aucune source consultée
n'ait permis de nommer un huitième. Le rang **Elite** est lui-même subdivisé, depuis la mise à jour Odyssey, en cinq
niveaux supplémentaires (**Elite I** à **Elite V**) au fur et à mesure de l'accumulation de mérites au-delà du seuil.

**Rang Explorateur** (progression basée sur la valeur cumulée des données d'exploration vendues) :

1. Aimless
2. Mostly Aimless
3. Scout
4. Surveyor
5. Trailblazer
6. Pathfinder
7. Ranger
8. Pioneer
9. Elite (puis Elite I → Elite V)

**Rang Exobiologiste** (progression basée sur la valeur cumulée des échantillons vendus à Vista Genomics) :

1. Directionless
2. Mostly Directionless
3. Taxonomist
4. Collector
5. Cataloguer
6. Surveyor
7. Ecologist
8. Elite (puis Elite I → Elite V)

> **Limite méthodologique** : les intitulés ci-dessus reposent sur la reconstitution communautaire la plus répandue
> (recoupée notamment avec l'article Canonn *« The Road to Exobiology Elite V »*, qui confirme explicitement les
> paliers Taxonomist, Ecologist, Elite puis Elite V dans cet ordre de progression). L'accès direct au wiki Fandom et
> aux forums officiels Frontier a cependant été bloqué (erreurs HTTP 402/403, anti-bot) pendant la rédaction de cette
> section, empêchant une vérification littérale de l'ordre exact des paliers intermédiaires sur une source primaire.
> **Avant de s'y fier pour un objectif de progression précis, vérifier l'intitulé exact et l'ordre des paliers
> directement dans le panneau des rangs en jeu ou sur le profil Inara du commandant.**

Atteindre Elite V dans l'une ou l'autre échelle est un objectif de très long terme : le commandant *JJGoldberg*, cité à
plusieurs reprises dans ce guide, est le premier commandant documenté par Canonn à avoir atteint le rang Exobiology
Elite V, au terme d'une progression méthodique combinant Road to Riches (1.4) et repérage ciblé des espèces à haute
valeur (2.5).

### 2.7 Builds spécialisés d'exploration et d'exobiologie (vaisseau et combinaison)

> **Disclaimer** : les valeurs de masse et de portée de saut présentées ci-dessous correspondent à des modules en
> **configuration stock** (achetés tels quels en boutique). L'ingénierie (voir [Ingénieurs](./06-ingenieurs.md)) peut
> les modifier significativement, dans un sens comme dans l'autre selon le blueprint choisi.

#### Comparatif des vaisseaux d'exploration/exobiologie (portée de saut stock, prix, emplacements)

Un vaisseau dédié à l'exploration et à l'exobiologie privilégie la portée de saut, l'autonomie et la visibilité du
cockpit plutôt que l'armement. Les châssis suivants sont les plus communément recommandés par la communauté pour ce rôle :

| Nom                  | Fabricant      | Prix (Cr)   | Portée de saut (stock, FSD classe A, sans cargo)* | Hardpoints      | Emplacements internes | Source                      | Date       |
|----------------------|----------------|-------------|---------------------------------------------------|-----------------|-----------------------|-----------------------------|------------|
| Diamondback Explorer | Lakon          | 1 894 760   | ≈ 40,8 al                                         | 3 (1×3, 2×2)    | 8                     | EDCD/coriolis-data (GitHub) | 09/09/2026 |
| Asp Explorer         | Lakon          | 6 661 154   | ≈ 36,5 al                                         | 6 (2×2, 4×1)    | 8                     | EDCD/coriolis-data (GitHub) | 09/09/2026 |
| Anaconda             | Faulcon DeLacy | 146 969 451 | ≈ 32,2 al                                         | 8 (jusqu'à 4×4) | 12 (+1 militaire)     | EDCD/coriolis-data (GitHub) | 09/09/2026 |
| Krait Phantom        | Faulcon DeLacy | 37 472 252  | ≈ 31,1 al                                         | 4 (2×3, 2×2)    | 9                     | EDCD/coriolis-data (GitHub) | 09/09/2026 |
| Type-8 Transporter   | Lakon          | 38 453 970  | ≈ 27,4 al                                         | 6 (1×2, 5×1)    | 9                     | EDCD/coriolis-data (GitHub) | 09/09/2026 |

*\* Portée calculée à partir des masses de coque et de modules publiées par le projet communautaire open-source
EDCD/coriolis-data (référentiel utilisé par les outils Coriolis et EDSY), avec FSD de la classe native du vaisseau en
qualité A, propulseurs/générateur/support de vie/distributeur/capteurs en qualité D (allègement standard d'un fit
exploration), sans soute ni armement. Ce sont des ordres de grandeur reproductibles avec la formule ci-dessous — pas
des valeurs figées : le fit exact (cargo, hangar SRV, AFMU, etc.) fait varier le résultat. Toujours revérifier un build
précis sur Coriolis ou EDSY avant de l'adopter tel quel.*

En complément du châssis, un vaisseau d'exploration/exobiologie privilégie :

| Priorité modules | Recommandation                                                                                       |
|------------------|------------------------------------------------------------------------------------------------------|
| FSD              | Classe A, complété par un **Guardian FSD Booster** pour maximiser la portée de saut                  |
| Blindage         | Léger, pour ne pas pénaliser la masse et donc la portée                                              |
| Carburant        | Fuel Scoop classe A pour un ravitaillement en vol illimité                                           |
| Maintenance      | **AFMU** (Auto Field-Maintenance Unit) pour réparer les modules à distance sans support              |
| Véhicule         | Hangar SRV pour les sites nécessitant un déplacement au sol rapide                                   |
| Véhicule (2)     | **Vessel Bay** Mk I ou Mk II pour emporter un **Nomad** (voir 2.2) — ici, seule l'Anaconda l'accepte |
| Habitabilité     | Compartiment de vie suffisant pour de longues expéditions                                            |

#### Build chiffré : portée de saut stock vs ingénierée du Diamondback Explorer (17,7 à 74 al)

Pour illustrer concrètement l'apport de l'ingénierie sur la portée de saut — le levier le plus déterminant pour un
build d'exploration — voici un calcul détaillé sur le châssis Diamondback Explorer (coque 260 t, emplacement FSD de
classe 5), en utilisant la formule de portée de saut publiée dans le code source ouvert de Coriolis
(`jumpRange = (min(carburant, carburant_max_par_saut) / fuelmul)^(1/fuelpower) × masse_optimale ÷ masse_totale + bonus
Guardian`) :

| Configuration                                                                                                                                     | Masse totale | Portée de saut max (1 saut, réservoir plein hors ce saut) |
|---------------------------------------------------------------------------------------------------------------------------------------------------|--------------|-----------------------------------------------------------|
| **Stock brut** (FSD 5E de série, aucune modification, sans arme ni cargo)                                                                         | ≈ 324 t      | **≈ 17,7 al**                                             |
| **Stock optimisé** (FSD 5A acheté en boutique, autres modules standards en qualité D, sans arme ni cargo)                                         | ≈ 302 t      | **≈ 40,8 al**                                             |
| **Ingénierée** (FSD 5A + blueprint *Increased Range* grade 5 à rouleau moyen + effet expérimental *Mass Manager* + Guardian FSD Booster classe 4) | ≈ 308 t      | **≈ 71-74 al**                                            |

Soit, entre la configuration stock brute et la configuration pleinement ingénierée, un **gain d'environ ×4** sur la
portée de saut maximale — l'écart typique que la communauté d'explorateurs cite pour justifier l'investissement en
matériaux d'ingénierie avant une expédition longue distance. Un rouleau d'ingénierie optimal (grade 5 au maximum de sa
plage) et une surcharge ponctuelle au FSD (« jumponium », consommables synthétisés) peuvent encore pousser ce chiffre
au-delà de 75-80 al pour ce châssis, au prix d'un temps de synthèse/farming plus important.

Pour la liste des matériaux requis par le blueprint *Increased Range* (Arsenic, Chemical Manipulators, Datamined Wake
Exceptions au grade 5) et par l'effet expérimental *Mass Manager*, ainsi que leurs grades de rareté et leurs sources
d'obtention détaillées, voir [Ingénieurs](./06-ingenieurs.md) — ce guide n'a pas vocation à dupliquer cette
information.

#### Équipement pilote et combinaison Artemis pour l'exobiologie à pied

- **Combinaison Artemis** (Exploration Suit) équipée en priorité de l' **Organic Scanner** (Genetic Sampler) et du
  **Composition Scanner** — à ne pas confondre avec la combinaison **Maverick** (voir la correction en 2.2 et
  [Équipement à pied](./07-equipement-a-pied.md)).
- Un fusil de secours léger ou une arme non létale pour la faune hostile, parfois recommandé sur certaines lunes.
- Modules de mobilité de la combinaison (jetpack amélioré, réserve d'oxygène étendue) pour couvrir rapidement de larges
  zones de recherche entre les patches de vie.
- Le plugin **BioScan** en overlay pour guider le déplacement entre échantillons et éviter les allers-retours inutiles
  (voir 2.2 et 2.3).

---

## Ressources complémentaires : sites et outils d'exploration et d'exobiologie

| Ressource          | Adresse                               | Usage principal                                               |
|--------------------|---------------------------------------|---------------------------------------------------------------|
| EDSM               | edsm.net                              | Route planner, flight log, recherche avancée de systèmes      |
| Spansh             | spansh.co.uk                          | Galaxy Plotter, Exact Plotter, Road to Riches, Neutron Router |
| Canonn Research    | canonn.science                        | Codex scientifique, données Vista Genomics par genre/espèce   |
| Bioforge           | bioforge.canonn.tech                  | Recherche de données biologiques par genre/espèce             |
| BioScan (EDMC)     | github.com/Silarn/EDMC-BioScan        | Prédiction et guidage en temps réel pendant l'échantillonnage |
| EDMC-Canonn        | github.com/canonn-science/EDMC-Canonn | Plugin de capture d'événements pour les bases Canonn          |
| EDCD/coriolis-data | github.com/EDCD/coriolis-data         | Données ouvertes des modules/vaisseaux (masses, FSD, prix)    |

## Voir aussi : autres guides du corpus liés à l'exploration

Guides du corpus en lien direct avec l'exploration et l'exobiologie :

- [Colonisation](./18-colonisation.md) — utiliser les données d'exploration pour repérer un système éligible (voir 1.7)
- [Lore](./01-lore.md) — récit et chronologie des trois expéditions Distant Worlds dont la partie 1 donne la
  logistique
- [Fleet Carriers](./19-fleet-carriers.md) — base mobile pour les expéditions longue distance et l'acheminement de
  matériaux vers un système en cours de colonisation
- [Minage](./20-minage.md) — anneaux et hotspots repérés lors des scans FSS/DSS
- [BGS](./21-bgs.md) — contrôle des factions dans les systèmes ciblés pour la colonisation
- [Wings, Multicrew et CQC](./23-jeu-en-groupe.md) — organisation en Wing pour les expéditions type Distant Worlds
- [Community Goals](./24-community-goals.md) — mécanique générique des expéditions/événements communautaires
- [Combat anti-Thargoïde (AX)](./25-combat-ax.md) — sites de ruines et structures inconnues croisés en exploration,
  et récolte de Meta-Alloys sur les Barnacles des Pléiades (§8.1)
- [Guardians](./05-guardians.md) — les 28 Guardian Logs, contenu Codex-exclusif détaillé en §11
- [Outils](./16-outils.md) — outils Canonn qui exploitent le Codex in-jeu (Codex-Regions, Undiscovered-Codex, §1.6)
- [Le Rhino et le Nomad](./14-rhino.md) — fiche complète du Nomad, du Mk II Biological Scanner et des modules
  Vessel Bay évoqués en 2.2
- [Operations](./13-operations.md) — la mise à jour du 30 juin 2026 qui introduit le Nomad
- [Ingénieurs](./06-ingenieurs.md) — matériaux, grades et blueprints cités dans les builds de ce guide
- [Équipement à pied](./07-equipement-a-pied.md) — comparatif complet des combinaisons Odyssey (Artemis, Dominator,
  Maverick)
- [Glossaire](./00-glossaire.md) — sigles utilisés dans ce guide (SCO, etc.)
- [Débuter et progresser](./27-debuter-et-progresser.md) — exploiter la Road to Riches pour monter les rangs
  d'exploration et d'exobiologie quand on débute, et situer l'exploration parmi les premières activités rentables

## Sources de ce guide (exploration et exobiologie)

- https://raw.githubusercontent.com/DarkSession/Elite-Dangerous-RAG-Knowledge/main/Wiki/Codex.md (structure du
  Codex in-jeu : onglets, catégories Discoveries, états Rumoured/Reported/Discovered, Codex Voucher — section 1.6bis)
- https://steamcommunity.com/games/elitedangerous/announcements/detail/1711828601535410336 (patch notes *Beyond —
  Chapitre Quatre* 3.3, 11 décembre 2018, date d'introduction du Codex — section 1.6bis)
- https://massivelyop.com/2018/12/11/elite-dangerous-beyond-chapter-four-is-live-today-with-exploration-background-sim-and-guilds/
  (catégories Stellar Bodies / Biological and Geological / Civilisations de l'onglet Discoveries — section 1.6bis)
- https://canonn.science/codex/ (auto-description du « Codex Canonn » en quatre départements communautaires —
  section 1.6bis)
- https://canonn.science/
- https://canonn.science/codex/
- https://canonn.science/codex/geology-organics/
- https://canonn.science/category/codex/geology/
- https://canonn.science/category/codex/geology/page/2/
- https://canonn.science/codex/odyssey-family-familia-odysseae/
- https://canonn.science/codex/appendices/
- https://canonn.science/codex/concha/
- https://canonn.science/codex/bacteria-2/
- https://canonn.science/codex/tussock/
- https://canonn.science/codex/electricae/
- https://canonn.science/codex/fonticulua/
- https://canonn.science/codex/osseus/
- https://canonn.science/codex/stratum/
- https://canonn.science/codex/tubus/
- https://canonn.science/codex/recepta/
- https://canonn.science/codex/fumerola/
- https://canonn.science/codex/aleoida-2/
- https://canonn.science/codex/cactoida/
- https://canonn.science/codex/clypeus/
- https://canonn.science/codex/frutexa/
- https://canonn.science/codex/fungoida/
- https://canonn.science/codex/surface-biology/
- https://canonn.science/codex/organic-scanning-guide/
- https://canonn.science/codex/speed-scanning-challenge/
- https://canonn.science/codex/a-secret-to-be-uncovered-a-trail-to-be-followed/
- https://canonn.science/codex/the-road-to-exobiology-elite-v/
- https://canonn.science/codex/neutron-stars/
- https://canonn.science/codex/cmdr-panpiper-a-brief-history-of-brain-trees/
- https://canonn.science/codex/the-guardians/
- https://canonn.science/codex/iea-helium-rich-gas-giant-guide/
- https://canonn.science/codex/cartographics/ghost-rings/
- https://canonn.science/resources/
- https://bioforge.canonn.tech/
- https://github.com/Silarn/EDMC-BioScan
- https://github.com/Spansh
- https://www.edsm.net/en/
- https://spansh.co.uk/
- https://github.com/EDCD/coriolis-data (données de modules/vaisseaux : masses, FSD, prix, blueprints — consultées le
  09/09/2026)
- https://github.com/EDCD/coriolis (formule de calcul de portée de saut, `src/app/shipyard/Calculations.js`)
- Annonces officielles Frontier republiées sur le flux Steam News d'*Elite Dangerous* (appid 359320), relevées via
  `api.steampowered.com/ISteamNews/GetNewsForApp/v2/` le 09/09/2026 — billets *Discover the Nomad* (02/06/2026
  13:03 UTC) et *Operations Update* (01/07/2026 14:01 UTC), cités en 2.2
- https://github.com/EDCD/FDevIDs (libellés des modules *Vessel Hangar* et *Mk II Vessel Hangar* ; `outfitting.csv`
  pour le nom de chantier naval du *Mk II Supercharge Optimised Frame Shift Drive (SCO)*, commit `c3561295`)
- https://github.com/EDDiscovery/EliteDangerousCore — implémentation de référence de la communauté, commit
  `f21533ba1609d309fd6a96b9b3bb488df178a36e` (07/09/2026), lue intégralement pour la partie 1 :
  `FrontierData/Enumerations/EstimatedValues.cs` (valeurs de scan, formules, multiplicateurs),
  `Enumerations/Stars.cs` et `Enumerations/Planets.cs` (énumérations `EDStar` et `EDPlanet`),
  `Enumerations/FSDSpec.cs` et `Items/ModuleList.cs` (multiplicateurs de supercharge),
  `3rdPartyInterfaces/Spansh/SpanshClassConvertEnums.cs` (sous-types Spansh/EDSM)
- https://github.com/EDDiscovery/EDDiscovery — `UnitTest/StarScans/` (43 journaux de scan réels, commit `7b4726f3`),
  utilisés pour les relevés de température et de masse stellaire
- https://www.edsm.net/en/statistics/bodies — effectifs et parts par sous-type stellaire, page capturée et dépouillée
  par script le 10/09/2026
- https://www.elitedangerous.com/update-notes/4-3-0-0 — notes de la mise à jour 4.3.0.0 (*Caspian Explorer Update*,
  02/12/2025), seule source primaire trouvée sur le Mk II Supercharge Optimised Frame Shift Drive (SCO)
- https://github.com/EDDiscovery/EliteDangerousCore — même commit `f21533ba1609d309fd6a96b9b3bb488df178a36e`, fichiers
  lus pour les signaux de surface et la gravité : `FrontierData/Enumerations/Signals.cs` (les huit prédicats de signal
  et la classification des Notable Stellar Phenomena), `JournalStatus/Events/JournalDiscoveryScans.cs`
  (`JournalSAASignalsFound` et `JournalFSSBodySignals`), `FrontierData/Enumerations/Planets.cs` (énumération
  `EDVolcanism`), `FrontierData/Enumerations/PhysicalConstants.cs` (1 G = 9,80665 m/s²), `History/Queries/Queries.cs`
  (seuil de la requête « Landable with High G »), `JournalStatus/UIScan/StatusReader.cs` (champ `Gravity` du fichier
  d'état)
- https://github.com/Silarn/EDMC-BioScan — plugin BioScan, commit `5f0d2e445a95681bf2e85223f883d5c552a7726b`
  (11/07/2026) : `src/bio_scan/body_data/util.py` (fonction `get_gravity_warning`, bornes de gravité) et `README.md`,
  cités en 2.2
- API de codex de Canonn Research (`query/codex/ref`, 1 072 entrées, et les dumps CSV par entrée), interrogée par
  script le 10/09/2026 : les 23 entrées de géologie de surface (222 898 relevés), les 4 482 relevés de Crystalline
  Shards et les 133 entrées classées « Cloud »
- https://www.edsm.net/en/expeditions/ — fiches « Distant Worlds Expedition (2016) » (identifiant 1) et « Distant
  Worlds 2 - A Voyage of Discovery » (identifiant 58), consultées le 10/09/2026 : dates, systèmes de départ et
  d'arrivée, participants, distances estimées et tables d'étapes
- https://www.edsm.net/api-system-v1/bodies — corps du système KOI 1701, consulté le 10/09/2026 : `KOI 1701 1`, corps
  riche en métaux déclaré atterrissable à 45,32 G
- https://distantworlds3.space/ — site officiel de Distant Worlds 3, capturé le 10/09/2026 : statut, organisateur et
  actualité de clôture ; compteurs de participants et libellé du prochain waypoint remplis côté client, donc vides à
  la capture
- https://www.elitedangerous.net/planetary-landings-guide.php — guide communautaire d'atterrissage planétaire (repère
  de prudence des 4 G), consulté le 10/09/2026

> **Note sur l'accès aux sources pendant la rédaction** : elitedangerous.com, forums.frontier.co.uk et le wiki Fandom
> (elite-dangerous.fandom.com) ont renvoyé des erreurs HTTP 402/403 (blocage anti-bot) lors des tentatives d'accès
> direct effectuées pour cette mise à jour du guide, en particulier pour la section 2.6 (rangs). Les données de
> modules/vaisseaux ont en revanche pu être vérifiées directement via le dépôt ouvert EDCD/coriolis-data, qui alimente
> les calculateurs de la communauté (Coriolis, EDSY) et fait autorité sur ces valeurs. Les annonces officielles de
> Frontier restent, elles, accessibles sans blocage via le flux Steam News du jeu, qui les republie mot pour mot : ce
> canal a servi de source primaire pour tout ce qui touche au Nomad en 2.2.

> **Avertissement méthodologique** : l'absence d'un véhicule dans un catalogue de chantier naval (liste des vaisseaux
> d'Inara, `shipyard.csv` d'EDCD) ne prouve rien à son sujet. Ces listes ne contiennent que les vaisseaux pilotables
> achetables au shipyard, et donc ni les SRV, ni les chasseurs SLF, ni les *ship-launched vessels* comme le Nomad. Y
> chercher un véhicule de cette catégorie ne peut produire qu'un faux négatif.

> **Note sur la fiabilité des données chiffrées d'exobiologie** : les valeurs chiffrées d'exobiologie (Vista Genomics)
> et les statistiques de fréquence citées dans ce guide proviennent des relevés communautaires de **Canonn Research**,
> arrêtés à la date du 30/09/2025. Ces valeurs peuvent évoluer avec les mises à jour du jeu ; il est recommandé de les
> recouper sur Inara.cn ou le wiki Fandom avant une session de farming intensif.
