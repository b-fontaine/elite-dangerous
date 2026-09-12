# Plan d'enrichissement du corpus — cycle 3

> **Document de travail, hors corpus.** Ce fichier vit dans `docs/corpus-meta/` et doit être **exclu de
> l'ingestion RAG** : il décrit le corpus, il n'en fait pas partie. Idem pour
> [l'annexe des constats](./2026-09-constats.md) et pour `PLAN_ENRICHISSEMENT.md` (cycle 1), qui
> devrait être déplacé ici.

> **Note de suivi.** Ce plan prévoyait de déposer les documents de travail dans `raw_data/_meta/`. Ils ont
> finalement été placés dans `docs/corpus-meta/`, hors du répertoire du corpus : une exclusion qui repose sur une
> règle écrite finit par être oubliée, une séparation par arborescence tient toute seule.

Audit du 9 septembre 2026. **Méthode** : 10 dimensions d'audit indépendantes — couverture des boucles
de gameplay, lore, données référentielles, structure RAG, fraîcheur, questions joueur, écosystème
externe, cohérence interne, sourcing, pédagogie — chacune suivie d'une passe de **vérification
adverse** chargée de réfuter ses propres constats, puis d'une critique de complétude.

**Résultat** : 143 constats retenus — 40 manques totaux confirmés, 95 requalifiés par la vérification
en « partiellement couvert » et reformulés en conséquence, 8 issus de la critique de complétude.
Le détail par constat est en [annexe](./2026-09-constats.md).

Ce cycle succède à `PLAN_ENRICHISSEMENT.md` (cycle 1), dont les actions sont appliquées.

---

## Diagnostic

Le corpus n'est pas un brouillon : c'est une base de connaissances mûre, de 14 050 lignes réparties sur 29 guides, dont les deux cycles précédents ont fait un document qui sait ce qu'il ignore. Il possède un arbitre de contradictions (00-chronologie-canonique.md, avec échelle de confiance et règle de préséance), un maillage inter-fichiers dense (831 liens markdown), une politique assumée de non-figement des données volatiles, et des zones d'excellence réelles : les 15 tableaux d'exobiologie chiffrés espèce par espèce, la formule officielle de portée de saut avec ses constantes, le protocole de mesure BGS, les 12 blueprints à pied avec quantités et coûts. Ses défauts sont donc rarement des vides purs — le plus souvent, la connaissance existe mais n'est pas assemblée (la piraterie a toutes ses pièces documentées séparément et aucune procédure), pas nommée sous la forme que les gens cherchent (100 des 118 espèces d'exobiologie n'existent qu'en épithète, jamais en binôme), ou pas chiffrée alors que le corpus a le gabarit et la source (04-equipements.md ne contient pas une seule occurrence de « Cr » ni de « MW » sur 662 lignes, alors que 05-guardians chiffre ses trois armes depuis EDCD/coriolis-data). Trois manques sont en revanche des vides francs et structurants : la géographie galactique (Sagittarius A*, Hutton, Pléiades, Merope, bras spiraux : zéro occurrence, et le mot « Bulle » employé dans 13 fichiers sans jamais être défini), les procédures de pilotage et d'accostage (aucune règle de taille de pad par type de station), et les échelles de rang de superpuissance (9 paliers isolés sur 28, jamais ordonnés).

La découverte qui redéfinit ce troisième cycle est ailleurs, hors de raw_data : le dépôt héberge déjà, jamais cité par un seul guide, un catalogue d'exobiologie de 118 espèces avec valeurs et conditions chiffrées, 115 matériaux avec sources typées et conditions rédigées, des blueprints avec quantités exactes et grade maximum par ingénieur, et 96 Ko de note de recherche déjà rédigée dont les sections s'intitulent « la table complète, sourcée » et « la table exacte ». Le corpus déplore l'inaccessibilité des wikis (403, 402) pendant que la donnée dort à côté de lui, hors ligne, datée et sourcée. Le troisième cycle doit donc commencer par une transcription, pas par une recherche. Trois autres priorités le suivent immédiatement. D'abord la correction : le corpus contient une erreur d'un facteur 10 sur le prix du Federal Corvette, deux contradictions frontales où deux guides donnent la réponse inverse (services de Fleet Carrier, catégories de matériaux Odyssey), et une classification de module fausse dans le document que 18 guides citent — un RAG qui répond faux avec aplomb est pire qu'un RAG muet, et ces corrections coûtent une heure. Ensuite l'ingérabilité : zéro front-matter sur 31 fichiers, zéro ancre explicite, aucun index machine-lisible, et un test d'autosuffisance qui montre que la totalité des sections de genres d'exobiologie ne prononce jamais les mots « exobiologie » ni « Odyssey » — tout gain de connaissance des autres chantiers est plafonné tant que le chunk ne sait pas d'où il vient. Enfin le volume : reconstruire les référentiels chiffrés vaisseaux, modules et armes depuis un clone local d'EDCD/coriolis-data est le plus gros gisement de connaissance factuelle nouvelle du cycle, et le clone local est précisément ce qui immunise contre les blocages qui ont fait renoncer les cycles précédents.

---

## Vue d'ensemble des chantiers

| # | Chantier | Type | Effort | Impact |
|---|---|---|---|---|
| 1 | Absorber les données factuelles déjà présentes dans le dépôt (assets/data + docs/faisabilite) et réconcilier les deux corpus | donnees | faible | critique |
| 2 | Corriger les erreurs factuelles et les contradictions internes : un RAG qui répond faux est pire qu'un RAG muet | correction | faible | critique |
| 3 | Rendre le corpus ingérable : front-matter YAML, exclusions d'index, autosuffisance des chunks | structure-rag | moyen | critique |
| 4 | Reconstruire les référentiels chiffrés vaisseaux / modules / armes depuis un clone local d'EDCD-coriolis-data | donnees | eleve | critique |
| 5 | Chiffrer l'exploration spatiale : valeurs de scan, formule officielle, classes stellaires, boost et POI de surface | enrichissement | moyen | haut |
| 6 | Nouveau guide 28 — Référentiel des marchandises, denrées rares et minerais | nouveau-guide | eleve | haut |
| 7 | Nouveau guide 29 — Missions, réputation et rangs : le système de progression qui n'existe nulle part comme sujet | nouveau-guide | moyen | haut |
| 8 | Nouveau guide 30 — Piraterie, prédation et PvP subi : assembler la boucle dont toutes les pièces existent | nouveau-guide | moyen | haut |
| 9 | Nouveau guide 31 — Pilotage, navigation, stations, SRV et logistique de flotte | nouveau-guide | eleve | haut |
| 10 | Nouveau guide 32 — Géographie galactique, systèmes de référence et grands voyages | nouveau-guide | moyen | haut |
| 11 | Dossier thargoïde et Guardian non-combat : Pléiades, barnacles, Spires, structures, 28 logs et Codex | enrichissement | moyen | haut |
| 12 | Glossaire de résolution d'entités : doubler 00-glossaire de 27 sigles techniques à ~80 entrées incluant le lore | structure-rag | faible | haut |
| 13 | Lore vivant : combler le trou 3304-3306, cataloguer les mystères, documenter GalNet et le transmedia | enrichissement | eleve | haut |
| 14 | Chiffrer les boucles de farming : recettes de synthèse, taxonomie des USS, megaships et installations | enrichissement | moyen | haut |
| 15 | Carte transversale des boucles de gameplay, rentabilité comparée et jalons de progression | transversal | moyen | haut |
| 16 | Gouvernance du sourcing et instrumentation : méthodologie, registre d'incertitudes et jeu de questions de référence | transversal | moyen | haut |
| 17 | Maillage, lexique bilingue et index par question : rapprocher les chunks des requêtes réelles | structure-rag | moyen | moyen |
| 18 | Nouveau guide 33 — Client, éditions, branches Live/Legacy, périphériques et VR | nouveau-guide | moyen | moyen |

---

## Chantiers détaillés

### 1. Absorber les données factuelles déjà présentes dans le dépôt (assets/data + docs/faisabilite) et réconcilier les deux corpus

**Type** : donnees — **effort** : faible — **impact** : critique

**Fichiers** : Sources : dépôt : assets/data/{exobiology_catalog,materials,blueprints}.json, dépôt : docs/faisabilite-spansh-temps-reel-materiaux.md, dépôt : assets/guides/*.json. Cibles : dépôt : raw_data/{10-exploration.md, 06-ingenieurs.md, 26-ingenierie-a-pied-avancee.md, 17-sources-donnees.md, 07-equipement-a-pied.md, 04-equipements.md, README.md, 00-chronologie-canonique.md}

**Pourquoi ce rang**

C'est le meilleur rapport connaissance/effort du cycle, et de loin. Le dépôt héberge déjà, hors du périmètre de raw_data, des données collectées, datées ("edition": "2026-08") et sourcées que le corpus n'exploite pas : 118 espèces d'exobiologie avec valeur et conditions chiffrées, 115 matériaux Odyssey/vaisseau avec sources typées, des blueprints avec quantités exactes et grade max par ingénieur, et 96 Ko de note de recherche déjà rédigée. Aucun guide ne les cite (grep "assets/data|exobiology_catalog" sur raw_data/*.md = 0). Le corpus déplore par ailleurs l'inaccessibilité des wikis (403/402) alors que la donnée est disponible hors ligne, à portée de `python3`. Ce chantier ne demande aucune recherche web : c'est une transcription. Il traite en outre une contradiction inter-corpus dangereuse (le Nomad affirmé comme réel dans les guides JSON livrés à l'application, non confirmé dans raw_data).

**Ce qu'il faut produire**

1) EXOBIOLOGIE (10-exploration.md, partie 2) — depuis dépôt : assets/data/exobiology_catalog.json : (a) créer les 5 sous-sections de genre manquantes (Amphora Plant, Anemone, Crystalline Shard, Radicoida, Sinuous Tuber = 18 espèces avec valeur en Cr, vérifié par script) ; (b) réécrire la colonne « Espèce » des 15 tableaux existants avec le binôme complet (« Aleoida Arcus » et non « Arcus ») — 100 des 118 binômes n'existent nulle part dans le corpus, ce qui rend toute recherche lexicale aveugle ; (c) ajouter par espèce les colonnes Conditions issues du bloc `conditions` du JSON (classes de corps, atmosphères, volcanisme, bornes de température en K, gravité max, notes) — donnée aujourd'hui présente au seul niveau du genre ; (d) ajouter en tête de la partie 2 un tableau récapitulatif des 118 espèces trié par valeur décroissante, qui devient la réponse directe à « quelle plante rapporte le plus » ; (e) ajouter une sous-section « Le bonus de première empreinte (first footfall) » (multiplicateur, condition d'obtention, vérification avant atterrissage, incidence sur le choix d'itinéraire, cumul avec la vente groupée Vista Genomics) — 0 occurrence de « footfall » dans tout le corpus.
2) MATÉRIAUX (06-ingenieurs.md et 26-ingenierie-a-pied-avancee.md) — depuis assets/data/materials.json : table référentielle des 115 matériaux (Nom | type raw/manufactured/encoded | catégorie | grade | plafond de stockage par grade 300/250/200/150/100) ET, surtout, les 24 catégories avec leur bloc `sources` typé (kind : hge / salvage / mission / trader / datapoint / ship_scan / wake) et ses `conditions` rédigées — ex. la règle des data points par sets de quatre avec timer de reset et Data Point Intel Package, les économies High Tech/Military des traders Encoded, Gresley Dock (Nanomam). C'est exactement la granularité que 06-ingenieurs.md l.388-389 admet ne pas avoir.
3) BLUEPRINTS (06-ingenieurs.md) — depuis assets/data/blueprints.json : 5 blueprints entièrement chiffrés (fsd_increased_range, fsd_faster_boot, dss_expanded_probe, sensors_lightweight, thrusters_dirty) avec, par grade, les matériaux ET leurs quantités, le nombre de rolls à réputation 5, l'effet chiffré, la liste des ingénieurs avec leur `maxGrade`, la `purpose`, le `warning` et les effets expérimentaux compatibles. Cela fournit le gabarit exact du chantier 4 et amorce la matrice Ingénieur × Blueprint × Grade max. Reprendre aussi la note `rolls` (Update 18.08 du 7 août 2024 : résultat fixe, N rolls pour un grade N à réputation 5).
4) NOTE DE RECHERCHE — depuis dépôt : docs/faisabilite-spansh-temps-reel-materiaux.md (96 Ko) : absorber §3.2 « Artemis : la table complète, sourcée » vers 07/10, §3.3 « Portée du FSD : la table exacte » vers 04/06, §3.4 « Matériaux de vaisseau : les chiffres, et ce qui a changé » vers 06, §2.1-2.2 (sémantique des événements du journal) vers 17-sources-donnees.md, §1.1 (ce que Spansh publie réellement, dumps et endpoints) vers 17.
5) DÉCLARATION DES SOURCES INTERNES — ajouter à 17-sources-donnees.md une section « Jeux de données embarqués dans ce dépôt » déclarant les 3 JSON + la note de faisabilité comme sources internes datées, réutilisables hors ligne quand les wikis renvoient 403.
6) RÉCONCILIATION DES DEUX CORPUS — écrire dans README.md la règle de préséance (raw_data = base de connaissances de référence ; assets/guides = contenu produit pour l'application), un tableau de correspondance des recouvrements (exploration-exobiologie ↔ 10, artemis-suit ↔ 07, outils ↔ 16, debuter-sans-combat ↔ 27, protocole-milliard ↔ sans équivalent), et étendre explicitement la portée de 00-chronologie-canonique.md à l'ensemble du dépôt. Appliquer aux 4 guides JSON qui affirment les capacités du Nomad comme des faits la même décision documentaire que dans raw_data (requalification en « non confirmé »).

<details><summary>Constats couverts (8)</summary>

- Le dépôt contient déjà un catalogue d'exobiologie structuré (118 espèces, valeurs et conditions) que le corpus n'exploite pas : 5 genres et 18 espèces sont absents de 10-exploration
- Les noms binomiaux d'espèces exobiologiques ne sont jamais écrits en entier : 100 espèces sur 118 n'existent qu'en épithète dans un tableau par genre
- Le bonus « first footfall » (×5 sur la valeur exobio) est totalement absent du corpus, alors que toute l'optimisation de la boucle repose dessus
- Trois jeux de données structurés et une note de recherche de 96 Ko dorment dans le dépôt, jamais cités par le corpus qui déplore par ailleurs l'inaccessibilité des wikis
- Un second corpus francophone de 12 guides structurés (assets/guides/*.json) coexiste avec raw_data sans aucune réconciliation — et porte déjà le schéma de métadonnées que l'audit réclame
- Contradiction inter-corpus sur le « Nomad » : raw_data le déclare non confirmé, les guides livrés avec l'application en affirment les capacités comme des faits
- Les ~120 materiaux Odyssey ne sont jamais nommes : 4 noms dans tout le corpus
- Aucune matrice « quel Ingenieur monte quel blueprint jusqu'a quel grade »

</details>

### 2. Corriger les erreurs factuelles et les contradictions internes : un RAG qui répond faux est pire qu'un RAG muet

**Type** : correction — **effort** : faible — **impact** : critique

**Fichiers** : dépôt : raw_data/{08-combat-spatial.md, 06-ingenieurs.md, 00-glossaire.md, 07-equipement-a-pied.md, 01-lore.md, 00-chronologie-canonique.md, 03-vaisseaux.md, 13-operations.md, 14-rhino-nomad.md, 18-colonisation.md, 19-fleet-carriers.md, 24-community-goals.md, 25-combat-ax.md, 26-ingenierie-a-pied-avancee.md, 27-debuter-et-progresser.md, 09-combat-a-pied.md, 10-exploration.md, 12-transport.md, README.md}

**Pourquoi ce rang**

Le corpus contient au moins une erreur d'un facteur 10 sur un prix, deux contradictions frontales où deux guides donnent la réponse inverse sur la même question, et une classification de module fausse dans le document le plus lié du corpus. Ces défauts sont pires que des lacunes : une lacune produit un silence, une contradiction produit une réponse fausse énoncée avec aplomb, et le lecteur n'a aucun moyen de départager (la valeur fausse du Corvette porte le même horodatage « instantané au 9 septembre 2026 » que la valeur juste). Effort quasi nul, aucune recherche requise puisque la valeur correcte est déjà ailleurs dans le corpus. C'est le chantier à exécuter en premier en temps de calendrier, même s'il vient après le chantier 1 en volume de connaissance.

**Ce qu'il faut produire**

Passe de correction ciblée, 14 points, chacun vérifié :
1) 08-combat-spatial.md l.560 : « ≈ 18-20 M CR (Federal Navy) + rang fédéral Post Captain » → « ≈ 187 969 450 Cr (châssis nu, Inara + EDCD au 9 sept. 2026) + rang Federation Rear Admiral », conformément à 03-vaisseaux.md l.140 et l.223. Ajouter aux trois fiches de build (l.547, 560, 571) un renvoi « prix et rang : source unique [03 — Vaisseaux] » pour interdire la ressaisie manuelle.
2) 06-ingenieurs.md l.741-744 : retirer Material Trader et Technology Broker de la liste des services embarquables sur un Porte-Vaisseau (19-fleet-carriers.md l.255-259 les exclut avec confiance haute et deux sources vérifiées en direct) ; ne conserver que Shipyard/Outfitting, le stockage gratuit de modules et le transport de matériaux ; renvoyer vers 19 §IV.
3) 00-glossaire.md l.59 et l.71 : HRP et MRP passent de « module utilitaire » à « module interne optionnel (classes 1 à 5, notations D et E uniquement) », conformément à 04-equipements.md l.223 et l.245 — l'erreur actuelle fait construire un build impossible. Auditer au passage les autres entrées du glossaire qui classent un module (DSS, FSS).
4) 06-ingenieurs.md l.625 et 07-equipement-a-pied.md l.299-301 : aligner sur l'arbitrage de 26-ingenierie-a-pied-avancee.md l.35-48 (les 4 catégories du journal sont Items/Components/Consumables/Data ; Chemical/Circuit/Tech sont une subdivision de Component) et pointer vers cet arbitrage plutôt que de réaffirmer la taxonomie invalidée.
5) 01-lore.md l.38, l.40 et §7.2 (l.382-384) : Distant Worlds II n'a pas été lancée le 14 janvier 3302 / janvier 2016 (c'est DW1) mais en janvier 3305 / janvier 2019 ; corriger la ligne du tableau-maître, le corps de §7.2, remplacer « Expéditions Distant Worlds annuelles » (l.402) par la cadence réelle (2015-2016, 2019, 3ᵉ achevée mai 2026 selon 15-roadmap.md l.259) et ajouter une §7.7 sur DW3. Consigner l'arbitrage dans 00-chronologie-canonique.md.
6) 00-chronologie-canonique.md l.28, l.159, l.162 : le « 75 vaisseaux d'Inara » contredit les 47/48 de 03-vaisseaux, 13-operations et 14-rhino-nomad, tous sur la même source. Ajouter un fait tranché « Nombre de vaisseaux jouables » explicitant la différence de périmètre (châssis pilotables vs entrées de base incluant variantes) et corriger les trois occurrences. Corriger aussi l'attribution du chiffre 47 à Inara au lieu d'EDCD/coriolis-data (03 l.490, 13 l.54, 14 l.272).
7) 18-colonisation.md l.259 et l.351 : remplacer les deux encarts « non vérifié / non trouvé » par un tableau de 6 lignes chiffrées reprises de 19-fleet-carriers (5 Md Cr, 5 M Cr/sem + services, 25 000 t, réservoir 1 000 t de tritium, 500 al/saut, formule de consommation) avec renvoi ligne à ligne ; ajouter 19-fleet-carriers au « Voir aussi » de 18 (aujourd'hui 0 occurrence).
8) README.md l.126-127 : la divergence Wellington Beck est tranchée à 15 unités depuis 26-ingenierie-a-pied-avancee.md l.101 et l.402 ; corriger la notice.
9) 27-debuter-et-progresser.md l.66 et README.md l.32 : « cinq progressions de rang » contredit 01-lore.md l.186 (« six filières »). Retenir : six filières Pilots Federation (combat, commerce, exploration, exobiologie, mercenaire, CQC) + deux échelles de marine (Federal Navy, Imperial Navy) = huit progressions ; ajouter les colonnes manquantes au tableau §2.0.
10) 01-lore.md l.114 et l.234 : « Rajin » → « Raijin » (graphie de 25-combat-ax.md l.79) ; ajouter Taranis comme huitième Titan aux deux tableaux (01-lore §3.5 et 25-combat-ax §2.3, aujourd'hui 7 lignes pour « huit Titans » annoncés) avec son rôle (premier Titan détruit, février 2024) et une note « 8 Titans confirmés, tous listés ».
11) 00-chronologie-canonique.md : ajouter un fait « Thargoid War Epilogue — date réelle » tranchant sur le 19 décembre 2024 15:00 UTC (preuve Steam News citée par 25-combat-ax.md l.24), distinguant l'annonce du contenu GalNet de janvier 2025 ; corriger 01-lore.md l.51/118/244 ; remplacer l'encart de divergence de 25-combat-ax par un renvoi ; corriger les renvois sur-promettants de 24-community-goals.md l.109 et l.190 (Bataille de Sol / Cocijo).
12) Nomad : corriger le seul libellé réellement affirmatif, 09-combat-a-pied.md l.24 (« du vaisseau Nomad ») et la ligne README l.115-116 qui prétend un retrait non effectué ; harmoniser le développement du sigle SRV entre 14-rhino-nomad.md l.82 et 00-glossaire.md l.106.
13) 12-transport.md et 18-colonisation.md : remplacer les 6 occurrences « Panther Clipper Mk2 » par « Mk II » (graphie du reste du corpus) et uniformiser le superlatif sur « plus gros transporteur non-capital » (03 l.318/449, 11 l.510) ; vérifier que le « 1200 t » de 03 l.318 est bien lu comme masse de coque et non comme soute.
14) 24-community-goals.md l.214-223 : remplacer les 10 chemins absolus /Users/bfontaine/... par des liens relatifs ./NN-nom.md ; 10-exploration.md l.18/243/323 : convertir « 30/09/3311 » (date in-fiction) en « 30/09/2025 » comme date de relevé.

<details><summary>Constats couverts (21)</summary>

- ERREUR FACTUELLE : le prix et le rang du Federal Corvette sont faux dans 08-combat-spatial (facteur 10 sur le prix)
- Contradiction frontale entre 06 et 19 sur les services installables sur un Fleet Carrier
- Le glossaire classe HRP et MRP en « module utilitaire » alors que 04, 05 et 08 les classent en module interne
- Contradiction frontale sur les quatre catégories de matériaux Odyssey : 06/07 disent Chemicals/Circuits/Technology/Data, 26 dit que ces noms ne sont pas des catégories
- Erreur de date sur Distant Worlds II dans le tableau-maître de chronologie
- Erreur de date périmée sur Distant Worlds II, incohérente avec 15-roadmap qui documente déjà Distant Worlds 3
- Contradiction 75 vs 47 vaisseaux, les deux citant Inara.cz comme source unique — et le document canonique est du mauvais côté
- Trois décomptes de vaisseaux incompatibles issus de la MÊME source primaire (Inara), dont le mauvais dans le document qui « fait foi »
- 18-colonisation déclare « non trouvées » des données que 19-fleet-carriers documente avec confiance haute
- Le README affirme non résolue une divergence que 26 déclare résolue depuis (Wellington Beck, 15 vs 25 unités)
- Le README contredit un guide sur un point de fiabilité déjà tranché (Wellington Beck)
- Contradiction sur le nombre d'échelles de rang : cinq (27) contre six (01)
- Le Titan Taranis manque : « huit Titans » annoncés, sept listés, et deux orthographes pour Raijin
- Contradiction chronologique explicitement escaladée vers 00-chronologie et jamais tranchée
- Contradiction de date active et non tranchée sur le « Thargoid War Epilogue », avec renvoi vers une autorité muette
- Renvoi cassé : 24-community-goals cite la chronologie canonique pour une date qu'elle ne contient pas
- Le « Nomad » est encore présenté comme une chronologie sourcée dans 09 et 07, alors que le README affirme son retrait
- Traces résiduelles du « Nomad » dans des libellés de liens qui l'affirment comme un vaisseau réel
- Le Panther Clipper Mk II a trois capacités de fret différentes selon le guide, et son nom s'écrit « Mk2 » uniquement dans 12 et 18
- Dix chemins absolus de la machine du rédacteur (/Users/bfontaine/…) sont publiés dans les Sources de 24-community-goals
- La convention « instantané daté » n'est appliquée que dans 18 guides sur 29, et une date in-game sert de date de relevé

</details>

### 3. Rendre le corpus ingérable : front-matter YAML, exclusions d'index, autosuffisance des chunks

**Type** : structure-rag — **effort** : moyen — **impact** : critique

**Fichiers** : Les 31 fichiers de dépôt : raw_data/ ; nouveaux : raw_data/index.yaml, raw_data/_meta/2026-09-cycle1-plan.md ; en priorité 03-vaisseaux.md, 10-exploration.md, 18-colonisation.md, 19-fleet-carriers.md, 09-combat-a-pied.md, 13-operations.md, README.md

**Pourquoi ce rang**

Vérifié : aucun des 31 fichiers ne porte de front-matter (head -1 = H1 partout), aucune ancre explicite ({# = 0), aucun fichier .yaml/.json/.csv d'index. Tout le travail de connaissance des chantiers 1, 4 à 15 est plafonné par ce défaut : un chunk pris au milieu de 06-ingenieurs ne sait pas de quel guide il vient, ni de quelle date il date, ni s'il est fiable. Le test d'autosuffisance le confirme brutalement — 20 sections sur 40 dans 10-exploration (dont TOUS les genres d'exobiologie) et 10 sur 34 dans 18-colonisation ne contiennent nulle part le terme-clé de leur propre guide. Deuxième urgence du même ordre : PLAN_ENRICHISSEMENT.md est le SEUL endroit du corpus où « Faulcon DeLacy », « SLV » et « Merc Coins » apparaissent en position d'assertion positive, ce qui en fait le meilleur match lexical pour une requête « qui construit le Nomad ? » — un fichier à sortir de l'index, pas à corriger. Le schéma de métadonnées n'est même pas à inventer : les 12 guides JSON du dépôt le portent déjà (id, title, kicker, deck, edition, topics, sections, sources).

**Ce qu'il faut produire**

1) FRONT-MATTER, 31 fichiers, gabarit unique repris du schéma assets/guides/*.json : ---\nid: 19-fleet-carriers\ntitre: "Porte-vaisseaux de joueur (Fleet Carriers)"\ndomaine: economie   # lore | politique | vaisseaux-equipement | combat | exploration | economie | social | meta-outils | transversal\nentites: [Fleet Carrier, Porte-Vaisseau, FC, Tritium, Drydock]\nmots_cles_en: [fleet carrier, tritium, carrier jump, decommission]\nversion_jeu_couverte: "4.2.2.x"\nbranche: live        # live | legacy\ndate_verification: 2026-09-09\nconfiance_globale: haute\nvolatilite: haute     # prix/rendements = haute ; lore/mécaniques = basse\nsources_primaires: [EDCD/coriolis-data, elitedangerous.com/update-notes]\nzones_incertaines: [...]\nguides_lies: [11, 12, 18, 20, 22]\n---. Générer en même temps un index.yaml machine-lisible reprenant ces champs pour les 31 fichiers, utilisable comme routeur de requête avant la recherche vectorielle.
2) PRÉFIXE DE CONTEXTE À L'INDEXATION — configurer le chunker pour préfixer chaque chunk d'une ligne « [19-fleet-carriers · Porte-vaisseaux · economie · vérifié le 2026-09-09 · jeu v4.2.2.x] » plus le chemin hiérarchique des titres. C'est le seul mécanisme qui résout réellement l'autosuffisance et la fraîcheur : un en-tête de fichier ne voyage pas avec un chunk du milieu.
3) AUTOSUFFISANCE ÉDITORIALE sur les ~35 sections identifiées par script — renommer les titres pour porter l'entité : « #### Bacterium » → « #### Bacterium — genre d'exobiologie Odyssey (13 espèces, 1 M à 8,4 M Cr) » ; « ### Baies d'appontage » → « ### Baies d'appontage du Porte-Vaisseau (landing pads) » ; « ### Ports type colonie » → « ### Ports « type colonie » et ports spécialisés (colonisation) ». Ajouter une phrase d'ancrage en ouverture de chaque section orpheline de 18-colonisation (10 sections), 10-exploration (20), 19-fleet-carriers (5), 25-combat-ax (2).
4) SORTIE DU PÉRIMÈTRE D'INDEXATION — déplacer PLAN_ENRICHISSEMENT.md vers dépôt : raw_data/_meta/2026-09-cycle1-plan.md avec un en-tête « Document d'archive — plan du cycle 1, entièrement appliqué. Ne décrit pas l'état actuel du corpus. » ; déposer au même endroit le plan du cycle 3 ; documenter dans README.md la règle « seuls les fichiers NN-*.md et 00-*.md sont indexés ».
5) EXCLUSION DES SECTIONS SANS RÉPONSE — 69 sections « Sources » / « Voir aussi » / « Références » pour 11 102 mots cumulés (vérifié : 20-minage 583+411, 21-bgs 573, 24-community-goals 514+298). Les exclure à l'ingestion par filtre de titre `^#{2,6}\s*(Sources|Voir aussi|Ressources|Références|Notes? sur la fiabilité)` — les conserver dans les fichiers pour le lecteur et le graphe de liens. Uniformiser au préalable ces titres (deux fichiers en ont deux exemplaires : 09-combat-a-pied l.12/l.435 et 13-operations l.28/l.438 — transformer le bloc d'introduction en « Périmètre de ce guide » sans liste de liens).
6) GRANULARITÉ — scinder les 7 sections de plus de 700 mots, en priorité « ## Emplacements et hardpoints — tableau de référence » de 03-vaisseaux.md l.152 (1 611 mots, tableau de 50 lignes) en trois blocs Small/Medium/Large avec titre porteur, et faire répéter la ligne d'en-tête du tableau à chaque fragment. Traiter 00-glossaire.md comme un document non découpé.
7) EN-TÊTE « ## En bref » — après le H1 de chaque guide, 120 à 180 mots denses en chiffres et en entités (FR + EN), qui devient le chunk canonique pour les requêtes générales. Déplacer symétriquement en fin de guide les blocs « Note sur la fiabilité des données chiffrées » de 19-fleet-carriers (l.20-43, qui repousse le premier fait à la ligne 44), 09-combat-a-pied, 10-exploration, 14-rhino-nomad et 20-minage.
8) ANCRES ET NUMÉROTATION — ancre explicite ASCII sur tout titre cible d'un lien ({#fc-maintenance-hebdo}) ; convention de numérotation unique (décimale, déjà majoritaire) appliquée aux guides en romain (11, 19, 20) et sans numérotation.

<details><summary>Constats couverts (17)</summary>

- Aucun front-matter YAML : zéro métadonnée exploitable pour le filtrage et le re-ranking
- Aucun bloc de métadonnées machine-lisible : les dates ne sont pas exploitables par le pipeline RAG
- Aucune métadonnée machine-lisible : le RAG ne peut ni filtrer ni pondérer par fraîcheur/fiabilité
- PLAN_ENRICHISSEMENT.md pollue le corpus avec des faits explicitement rétractés (Nomad, Operations 2026)
- PLAN_ENRICHISSEMENT.md, périmé, est indexé dans le corpus et y injecte des affirmations fausses
- Sections non auto-suffisantes : des chunks entiers sans le terme-clé de leur propre guide
- 60 chunks « Sources » et « Voir aussi » quasi vides de contenu factuel vont concurrencer les vraies réponses
- Tailles de sections très hétérogènes : 140 micro-sections orphelines et des sections/tableaux trop longs pour un chunk
- Aucun résumé structuré en tête de guide : le premier chunk de chaque fichier est une introduction narrative
- Marqueur de fraîcheur et version de jeu absents de 22 guides sur 29 (action prescrite au cycle 2, non appliquée)
- 15 fichiers sur 31 n'affichent aucune date de production ou de vérification en tête
- L'en-tete de fraicheur prescrit par le cycle precedent n'a ete applique qu'a 1 guide sur 29
- Les guides les plus dépendants d'un état du jeu n'ont aucun ancrage temporel dans leur corps de texte
- Aucune ancre stable, deux titres dupliqués, et quatre schémas de numérotation de titres incompatibles
- 09 et 13 contiennent chacun deux sections « ## Voir aussi » quasi identiques, en tête et en pied de guide
- Le README est un journal de révision, pas un index sémantique — et aucun index machine-lisible n'existe
- 85 % des tableaux n'ont pas de colonne Source/Confiance : les mises en garde ne survivent pas au découpage en chunks

</details>

### 4. Reconstruire les référentiels chiffrés vaisseaux / modules / armes depuis un clone local d'EDCD-coriolis-data

**Type** : donnees — **effort** : eleve — **impact** : critique

**Fichiers** : dépôt : raw_data/{03-vaisseaux.md, 04-equipements.md, 06-ingenieurs.md, 07-equipement-a-pied.md, 08-combat-spatial.md, 05-guardians.md (gabarit)} ; sources locales : clones EDCD/coriolis-data et EDCD/FDevIDs

**Pourquoi ce rang**

C'est, en volume brut de connaissance factuelle nouvelle, le plus gros gisement du cycle : environ 48 vaisseaux × 11 caractéristiques, ~40 armes × 12 colonnes, ~15 familles de modules × 8 classes × 5 notations × 5 colonnes, ~100 blueprints × 5 grades. Vérifié : `grep -c "Cr" 04-equipements.md` = 0 sur 662 lignes, aucune occurrence de « MW » ; les tableaux d'armes de 04 et 08 sont purement qualitatifs (« DPS supérieur au Pulse Laser ») ; les 48 vaisseaux n'ont ni masse, ni vitesse, ni bouclier, ni cargo max. Trois questions élémentaires restent donc sans réponse : « combien coûte un Power Plant 6A », « quel est le vaisseau le plus rapide », « mon distributeur suffit-il pour ce build ». Le corpus dispose déjà du gabarit exact (table Guardian chiffrée de 05-guardians.md l.265-271, avec sa formule de DPS soutenu) et de la source (EDCD/coriolis-data, cité 11 fois). Décisif : cloner le dépôt en local rend la donnée insensible aux blocages 403 qui ont bloqué les cycles précédents.

**Ce qu'il faut produire**

Préalable : `git clone https://github.com/EDCD/coriolis-data` et `git clone https://github.com/EDCD/FDevIDs` en local ; citer le commit SHA comme preuve reproductible dans chaque note de source.
1) 03-vaisseaux.md — seconde table de référence alphabétique sur les 48 vaisseaux (≈48 lignes × 11 colonnes) : Masse de coque (t) | Vitesse / Boost (m/s) | Agilité (pitch/roll/yaw) | Blindage de base | Bouclier de base (MJ) | Réservoir (t) | Cargo max (t) | Mass lock factor | Sièges d'équipage | Taille de pad | Prix. Source ships/*.json, déjà exploité pour la table hardpoints. Cela lève l'incohérence du disclaimer l.8-11 qui annonce ces stats comme couvertes.
2) 04-equipements.md — table classe (1-8) × notation (A-E) pour chaque famille de module cœur (Power Plant, Thrusters, FSD, Life Support, Power Distributor, Sensors, Fuel Tank) et optionnel (Shield Generator, Cargo Rack, Fuel Scoop, AFMU, HRP/MRP, cabines, contrôleurs de limpets) : Masse (t) | Intégrité | Consommation ou capacité (MW) | Stat principale (MJ de bouclier, capacité, taux de recharge WEP/SYS/ENG en MW/s) | Prix (Cr). Source modules/standard/*.json et modules/internal/*.json. Volume : ~15 familles × ~30 combinaisons.
3) 04-equipements.md §2 — table maîtresse des ~40 armes × classe × notation × montage, colonnes calquées sur 05-guardians §265 : Dégâts par tir | Cadence | DPS brut | DPS soutenu (rechargement inclus, avec la formule) | Type de dégâts (thermique/cinétique/explosif/absolu) | Charge thermique | Conso distributeur (MW) | Munitions (chargeur/réserve) | Portée optimale et max + distance d'atténuation (falloff) | Pénétration de blindage | Masse | Prix. Source modules/hardpoints/*.json.
4) 08-combat-spatial.md — sous-section « Mécaniques cachées du calcul de dégâts » : ordre d'application (résistance de bouclier → dureté de coque → pénétration), confrontation armour piercing vs hull hardness (0 occurrence du couple dans le corpus), effet du type de dégâts contre coque vs bouclier, tableau de dureté de coque des vaisseaux courants. Remplacer le tableau qualitatif de bulkheads l.137-148 par un renvoi vers la table chiffrée de 04 §3.1 (politique de source unique).
5) 06-ingenieurs.md — coût matériaux avec QUANTITÉS exactes pour les ~25 blueprints les plus utilisés (Dirty/Clean Drives, Drive Strengthening, Increased Range, Faster Boot, Shielded FSD, Overcharged/Armoured/Low Emissions Power Plant, les 4 Power Distributor, Reinforced/Enhanced Low Power/Kinetic/Thermic Shield Generator, Heavy Duty/Resistance Augmented Shield Booster, HRP, Sensors, Overcharged/Efficient/Long Range/Rapid Fire/Sturdy sur armes) × 5 grades, plus une ligne de total G1→G5. Le gabarit existe déjà côté à pied (26-ingenierie §3.2, 12 blueprints avec quantités et coût en Cr) et côté vaisseau dans assets/data/blueprints.json (chantier 1). Ajouter la matrice Blueprint × Ingénieur × Grade max (~100 lignes : Blueprint | Module | Ingénieurs G1-G2 | G3-G4 | G5) et une colonne « grade max par spécialité » au tableau des 25 ingénieurs.
6) 06-ingenieurs.md §effets expérimentaux — passer la liste existante en table : Effet | Modules/armes compatibles (la matrice de compatibilité, jamais donnée malgré la phrase 04 l.173) | Effet chiffré | Matériaux et quantités | Ingénieurs le proposant. Source specials.json. Remplacer la liste tronquée de 10 entrées de 04 §2.8 et celle de 6 entrées de 08 l.234-243 par un renvoi (trois listes partielles coexistent aujourd'hui).
7) 07-equipement-a-pied.md — catalogue des ~19 armes à pied des 3 fabricants avec Dégâts/tir | Cadence | DPS | Type | Chargeur/réserve | Portée | Efficacité vs bouclier vs blindage | Prix par grade 1-5 ; table des 4 combinaisons × 5 grades (bouclier, PV, sac à dos, oxygène, emplacements d'armes et de mods, prix) ; matrice des 11 modifications × fabricant × matériaux. Corriger au passage la ligne « Kinematic Armaments : non confirmé » (l.161), démentie par 09 l.137 et 13 l.279, et l'attribution contradictoire du Karma P-15 (Takada en 07 l.157 vs Kinematic en 09/13).

<details><summary>Constats couverts (9)</summary>

- Aucune statistique chiffree d'arme spatiale dans tout le corpus (DPS, degats, charge thermique, conso, munitions)
- Aucune statistique chiffrée d'arme : ni dégâts, ni DPS, ni pénétration de blindage, ni atténuation en distance
- 04-equipements ne contient aucun prix, aucune consommation energetique et aucune masse par module : un build ne peut pas y être calcule
- Les 48 vaisseaux n'ont ni masse, ni vitesse, ni blindage, ni bouclier, ni agilite, ni cargo max en tableau
- Cout en materiaux par blueprint et par grade : un seul blueprint documente sur ~100, et sans quantites
- Effets experimentaux : liste complete dans 06, liste tronquee et contradictoire dans 04, et nulle part de cout ni de compatibilite
- Equipement a pied : 3 armes nommees sur ~19, un fabricant entier « non confirme », et aucune statistique de combinaison
- Deux tiers des sources sont non primaires, et l'inaccessibilité des wikis a conduit à dé-chiffrer les tableaux plutôt qu'à basculer sur les jeux de données primaires disponibles hors ligne
- Deux sujets d'activite restent au stade du catalogue de modules sans mode d'emploi : piraterie joueur et builds par vaisseau nomme

</details>

### 5. Chiffrer l'exploration spatiale : valeurs de scan, formule officielle, classes stellaires, boost et POI de surface

**Type** : enrichissement — **effort** : moyen — **impact** : haut

**Fichiers** : dépôt : raw_data/{10-exploration.md, 06-ingenieurs.md, 04-equipements.md, 18-colonisation.md}

**Pourquoi ce rang**

10-exploration.md est excellent sur l'exobiologie (15 tableaux d'espèces chiffrés) et vide sur l'exploration spatiale elle-même : §1.5 renvoie explicitement le lecteur à Inara et au wiki Fandom pour les barèmes et la formule — exactement ce qu'un RAG ne peut pas faire, il ne peut pas « aller voir Inara ». Vérifié : aucune table de classes stellaires nulle part, aucune mention de scoopabilité, aucun facteur de boost neutron malgré une section Neutron Highways, 0 occurrence de « crystalline ». Le précédent méthodologique est acquis dans le corpus : 06-ingenieurs.md l.549-562 intègre la formule officielle de portée de saut avec ses constantes ; il n'y a pas de raison de traiter la valeur de scan autrement. Cette asymétrie prive le corpus de toute la moitié spatiale de la boucle d'exploration, qui est la première activité de beaucoup de joueurs.

**Ce qu'il faut produire**

1) 10-exploration.md §1.5 — table « Type de corps | Valeur de scan de base (Cr) | Valeur si cartographié au DSS | Bonus first discovered | Bonus first mapped | Constante k » couvrant les ~20 types (ELW, WW, AW, HMC terraformable et non, géantes gazeuses classes I à V et sudarsky, mondes de glace, rocheux, étoiles, naines blanches, étoiles à neutrons, trous noirs), plus la formule communautaire officielle (valeur = f(k, masse) avec multiplicateurs terraformable, first-discovered, first-mapped, bonus d'efficacité DSS) et 3 exemples chiffrés complets. Source : wiki Fandom « Exploration » + code d'un calculateur open-source, méthode identique à celle appliquée pour la portée de saut.
2) 10-exploration.md §1.3 — table des classes stellaires : Classe | Scoopable (mnémonique KGBFOAM : K,G,B,F,O,A,M oui ; L,T,Y,D,N,H non) | Couleur/température | Rendement du fuel scoop | Fréquence dans la galaxie | Intérêt (boost FSD, exobiologie, Codex), en incluant les exotiques (Wolf-Rayet, T Tauri, Herbig Ae/Be, carbonées, naines brunes).
3) 10-exploration.md §1.4 — multiplicateur de boost par type d'étoile (neutron ×4, naine blanche ×1,5), géométrie du cône de supercharge, dégâts de coque encourus, articulation avec le Neutron Router de Spansh déjà documenté en §1.2.
4) 10-exploration.md, nouvelle section « Ce que révèle le DSS : signaux et points d'intérêt de surface » — tableau des catégories de signaux (Biological, Geological, Human, Guardian, Thargoid, Anomalous) et de ce que chacune débloque ; sous-section géologie (fumeroles, geysers de glace/eau/azote, lava spouts) avec les matériaux Raw obtenus et la procédure de récolte au SRV ; sous-section Crystalline Shards (0 occurrence dans le corpus) : conditions d'apparition, rendement en Raw de grade 4, méthode de recherche via Spansh/EDSM ; Notable Stellar Phenomena. Remplacer le renvoi vague de 06-ingenieurs.md l.253 à « un outil communautaire » par un lien vers cette section.
5) 10-exploration.md — plages de gravité et risque d'atterrissage (>1 G train endommagé, seuils de 2,7 G déjà cités pour la marche à pied), pour compléter la taxonomie de corps déjà présente en 18-colonisation l.125-135 plutôt que de la dupliquer.
6) 10-exploration.md — remplacer les 9 lignes vagues de §Distant Worlds par un tableau des expéditions majeures (Édition | Dates réelles | Dates in-game | Organisateur | Participants | Itinéraire | Waypoints), alimenté par la correction du chantier 2.

<details><summary>Constats couverts (4)</summary>

- Exploration : aucune valeur de scan par type de corps, aucune classe stellaire, aucun multiplicateur de boost neutron
- La formule de valeur des données d'exploration est explicitement renvoyée à l'extérieur du corpus
- Aucune taxonomie astrophysique : types d'étoiles et classes de planètes totalement absents
- Les points d'intérêt de surface et les signaux planétaires ne sont documentés dans aucun guide d'exploration

</details>

### 6. Nouveau guide 28 — Référentiel des marchandises, denrées rares et minerais

**Type** : nouveau-guide — **effort** : eleve — **impact** : haut

**Fichiers** : NOUVEAU dépôt : raw_data/28-marchandises.md ; modifications dans 11-commerce.md, 20-minage.md, 17-sources-donnees.md ; source : clone EDCD/FDevIDs (commodity.csv, rare_commodity.csv)

**Pourquoi ce rang**

11-commerce.md est le guide du commerce et ne nomme pas une seule marchandise : l'exemple de la l.231 est générique (« composants électroniques »), les ~130 denrées rares ont une section dédiée (l.108-115) sans qu'aucune ne soit nommée, et les 12-15 catégories officielles n'apparaissent nulle part. Un RAG ne peut donc répondre ni à « quelle catégorie pour les Progenitor Cells », ni à « cite-moi trois denrées rares », ni à « quelles marchandises sont illégales en Empire ». C'est une lacune de référentiel pur, sur le domaine économique qui est l'une des trois boucles principales du jeu. La source est identifiée dans le corpus lui-même (17-sources-donnees.md l.377-380 nomme commodity.csv et rare_commodity.csv d'EDCD/FDevIDs), donc le travail est mécanique — mais volumineux, d'où un nouveau fichier plutôt qu'une section.

**Ce qu'il faut produire**

Créer 28-marchandises.md, environ 500 lignes :
1) Tableau des 12-15 catégories officielles (Chemicals, Consumer Items, Foods, Industrial Materials, Legal Drugs, Machinery, Medicines, Metals, Minerals, Salvage, Slavery, Technology, Textiles, Waste, Weapons) : Catégorie | Exemples représentatifs | Économie productrice | Économie consommatrice | Statut légal par superpuissance (l'illégalité n'est aujourd'hui traitée que par famille et par type de système, jamais par superpuissance).
2) Tableau référentiel des ~380 marchandises : Nom EN | Nom FR | Catégorie | Économie productrice | Économie consommatrice | Fourchette d'achat (Cr/t) | Fourchette de vente | Illégale (oui/non/où). Source EDCD/FDevIDs commodity.csv en clone local. Conserver la politique éditoriale du corpus : fourchettes et ordres de grandeur datés, renvoi vers EDTools/Inara pour le prix instantané.
3) Tableau des ~130 Rare Goods : Nom | Système | Station | Allocation max par cycle | Distance optimale de revente | Usage particulier (déblocage d'Ingénieur, mission). Source rare_commodity.csv. Y intégrer les rares déjà utilisées ailleurs dans le corpus (Soontill Relics en 27 l.54) et celles requises par les déblocages d'ingénieurs.
4) Tableau des marchandises à forte valeur unitaire les plus échangées (Painite, Low Temperature Diamonds, Void Opals, Tritium, Platinum, Gold, Silver, Palladium, Progenitor Cells, Beryllium) avec renvoi vers 20-minage §IV.B pour les systèmes de référence déjà vérifiés (Borann, Paesia).
5) Table de référence des ~30 minerais et métaux minables, à ajouter en 20-minage.md §V : Minéral | Technique (laser / subsurface / core) | Type d'anneau (Glacé / Rocheux / Métallique / Métal riche — la donnée stable qui manque réellement, faute de quoi « dans quel anneau trouve-t-on du Benitoite » reste sans réponse) | Réserve minimale conseillée | Rendement typique par astéroïde | Économie de station acheteuse ; distinguer minerais bruts (Bertrandite, Indite, Gallite, Uraninite, Coltan), métaux raffinés et pierres précieuses core-only.
6) Renvois croisés : ajouter la piraterie comme cinquième entrée de la taxonomie « Les quatre types de commerce » de 11-commerce §II (l.116-218), d'où elle est absente, et lier vers le guide 30.

<details><summary>Constats couverts (4)</summary>

- Aucun catalogue des marchandises commerciales : le guide commerce ne nomme pas une seule commodité
- Aucun catalogue des marchandises alors que le commerce est le cœur du guide 11
- Aucune donnee nommee sur les marchandises et les denrees rares dans le guide du commerce
- Minage : les 13 mineraux sont cites comme couverture d'un outil tiers, jamais comme table de reference

</details>

### 7. Nouveau guide 29 — Missions, réputation et rangs : le système de progression qui n'existe nulle part comme sujet

**Type** : nouveau-guide — **effort** : moyen — **impact** : haut

**Fichiers** : NOUVEAU dépôt : raw_data/29-missions-reputation-et-rangs.md ; modifications dans 27-debuter-et-progresser.md (§2.0), 03-vaisseaux.md, 13-operations.md, 09-combat-a-pied.md, 21-bgs.md

**Pourquoi ce rang**

Trois lacunes convergent sur le même objet et se renforcent. (a) Les missions de vaisseau n'ont aucune typologie unique : 13-operations.md l.119-141 fait ce travail pour les missions au sol, rien d'équivalent côté spatial, et huit familles ne sont nommées nulle part (Boom Delivery, Source and Return, Salvage, Mining, Recon/Scan Datalink, Wetwork, Donation, Support). (b) Les deux échelles de rang de superpuissance (14 paliers chacune) n'apparaissent nulle part en entier : vérifié, seulement 9 paliers isolés dans tout le corpus, cités comme conditions d'achat, jamais comme échelle ordonnée — alors qu'elles conditionnent 7 vaisseaux et plusieurs ingénieurs. (c) L'échelle de réputation de faction (Hostile → Allied) n'est jamais donnée bien que 06-ingenieurs.md l.111 utilise le palier « Alliés » comme condition. Le guide 27, qui devrait être la référence, annonce « cinq échelles » et n'en parle pas. C'est la colonne vertébrale de la progression du joueur, absente en tant que telle.

**Ce qu'il faut produire**

Créer 29-missions-reputation-et-rangs.md :
1) Tableau des ~14 familles de missions de vaisseau, calqué sur celui de 13-operations l.119-141 : Nom FR/EN | Objectif | Prérequis vaisseau/module | Récompense typique | Risque | Guide de renvoi — en agrégeant par renvoi ce qui existe déjà (passagers et évacuation en 12-transport l.34-140, courrier de données en 11-commerce §II.B, assassinat/massacre en 08-combat-spatial §4.4) et en ajoutant les familles jamais nommées.
2) Génération et cycle de vie d'une mission : comment le tableau se peuple (réputation de faction, rang de pilote, états BGS du système, taille du vaisseau détecté), board flipping par relog, expiration, pénalité d'abandon, chaînes de missions, missions de wing, mission stacking et ses limites (renvoi vers 24-community-goals §4.3 qui porte déjà la règle du type de cible identique).
3) Échelle de réputation de faction mineure en 6 crans (Hostile → Unfriendly → Neutral → Cordial → Friendly → Allied) avec les effets concrets par cran : déblocage des missions à haute récompense, accès au marché noir, remises, missions illégales.
4) Les deux échelles de marine en entier : Federal Navy (None → Recruit → Cadet → Midshipman → … → Rear Admiral → Admiral, 14 paliers) et Imperial Navy (None → Outsider → Serf → Master → Squire → Knight → … → Baron → Duke → King, 14 paliers), avec pour chaque palier ce qu'il débloque (vaisseau, ingénieur, permis) et la méthode de montée (missions Navy déclenchées une fois Allied auprès d'une faction alignée, cadence réaliste, indépendance des deux marines). Positionner les 7 vaisseaux conditionnés déjà listés en 03-vaisseaux l.220-231.
5) Échelle du rang Mercenaire à pied (09-combat-a-pied.md ne cite aucun palier alors qu'il en fait une condition de déblocage) et seuils de progression, ou à défaut la mention explicite que Frontier ne publie pas de seuil, avec résolution du « non confirmé » de la colonne CQC de 27 §2.0.
6) Tableau des systèmes à permis : Système | Autorité | Condition exacte (rang Elite, rang Navy, Community Goal historique — le permis Alioth est documenté en 24-community-goals l.65/104, celui de Shinrarta en 01-lore l.188) | Intérêt du système | Permis désormais indisponibles ou automatiques. Couvrir au minimum Sol, Shinrarta Dezhra, Alioth, Achenar, Van Maanen's Star, Beta Hydri, CD-43 11917, Pilots Federation District, permis Powerplay. Signaler explicitement l'accès restreint là où Achenar et Alioth sont cités comme capitales sans mention (01-lore §2.2-2.3, 02-powerplay §1.2).
7) Récompenses non-crédits : matériaux, données encodées, modules pré-engineered, permis de système, remise sur vaisseau.
8) Ajouter à 13-operations §« Accéder aux opérations » les deux portes d'entrée Odyssey : Apex Interstellar (tarification par distance, temps de trajet, cas du joueur sans crédits, limites) et Frontline Solutions (0 occurrence dans le corpus — contrats de CZ au sol, choix du camp, grades de contrat et paie, prêt et restitution d'équipement), ce qui comble le trou de 13 §Zones de conflit au sol l.208-220 qui décrit les CZ sans dire comment on s'y engage.

<details><summary>Constats couverts (7)</summary>

- Aucune typologie des missions de vaisseau : le tableau de missions spatial n'est documenté nulle part
- Le système de missions n'existe nulle part comme sujet en soi
- Les echelles de rang Federation et Empire (14 paliers chacune) ne sont nulle part listees, et aucune echelle n'a de seuil
- Les rangs de superpuissance (Federation/Empire), les permis et la reputation de faction ne sont documentes nulle part
- Les échelles de rang Fédération, Empire et Mercenaire ne sont énumérées nulle part
- Systèmes à permis : un seul mentionné, aucune liste ni méthode de déblocage
- Apex Interstellar et Frontline Solutions : les deux portes d'entrée d'Odyssey sont absentes

</details>

### 8. Nouveau guide 30 — Piraterie, prédation et PvP subi : assembler la boucle dont toutes les pièces existent

**Type** : nouveau-guide — **effort** : moyen — **impact** : haut

**Fichiers** : NOUVEAU dépôt : raw_data/30-piraterie-et-pvp.md ; modifications dans 08-combat-spatial.md, 11-commerce.md (§II), 23-jeu-en-groupe.md, 21-bgs.md, 04-equipements.md

**Pourquoi ce rang**

Cas d'école de connaissance présente mais inutilisable : le corpus documente séparément chaque composant (Hatch Breaker et FSD Interdictor étiquetés « piraterie » en 04, Manifest Scanner en 06, mini-jeu d'interdiction sur 50 lignes en 08 §2.1 qui se rattache lui-même explicitement à la piraterie, mass lock comme tactique de piraterie, marchés noirs et systèmes Anarchy en 11 §II.C et 21, bonus marché noir d'Archon Delaine en 02) sans jamais les relier en une procédure jouable. Une requête « comment pirater un vaisseau » ne peut récupérer qu'un fragment de catalogue. Symétriquement, le versant défensif est incomplet : le ganking et les modes de jeu sont bien traités en 08 §6.2, mais le combat logging (0 occurrence), la fonction de blocage et les groupes privés PvE communautaires (0 occurrence de Mobius) manquent entièrement. Assembler ces deux versants coûte peu et transforme un catalogue en savoir-faire.

**Ce qu'il faut produire**

Créer 30-piraterie-et-pvp.md :
1) La chaîne opératoire complète : choix de cible (PNJ chargé type Type-9/Type-7, lecture du manifeste au Manifest Scanner AVANT interdiction) → interdiction propre (renvoi vers 08 §2.1) → mass lock → Hatch Breaker → récupération au Collector limpet → revente.
2) Tableau des 3 scanners (Cargo Scanner / Kill Warrant Scanner / Frame Shift Wake Scanner) plus le Manifest Scanner : portée, temps de scan, légalité par type de juridiction, usage.
3) Tableau « où pirater » : Resource Extraction Sites, lanes commerciales des systèmes en Boom/Industrial, convois PNJ, USS Convoy Dispersal Pattern, avec le lien vers la table d'USS du chantier 14.
4) Deux builds pirates chiffrés (Python et Krait Mk II : Interdictor 4A, 2 Hatch Breakers, 2 Collectors, soute, boucliers), en réutilisant le gabarit de 08 l.539-556 et en citant 03-vaisseaux pour prix et rang.
5) Statut légal du butin : cargo marqué volé, refus des marchés légaux, écoulement au marché noir (renvoi 11 §II.C l.164-189), conséquences (prime, notoriety non payable, saisie), Interstellar Factors et systèmes Anarchy.
6) Impact BGS de la piraterie et de la contrebande (renvoi 21 l.250-251) ; piraterie PvP vs PvE et étiquette communautaire.
7) Volet défensif « Survivre au PvP non consenti » : lieux de rassemblement à risque nommés comme tels (Deciat, Shinrarta Dezhra, Jameson Memorial, stations de CG, Colonia Bridge) — aujourd'hui présents dans le corpus mais jamais signalés comme dangereux ; procédure d'évasion pas à pas (boost + high wake immédiat, jamais de low wake sous mass lock, silent running, heat sink, chaff) ; builds de fuite pour vaisseaux de fret (renvoi 11 §VI) ; groupes privés PvE communautaires (Mobius et équivalents : à quoi ils servent, comment en rejoindre un) ; fonction de blocage d'un joueur et son effet sur l'instanciation ; signalement ; définition du combat logging (déconnexion réseau vs menu log) et son statut au regard des CGU de Frontier.
8) Ajouter à 23-jeu-en-groupe.md une section « Comment fonctionne le réseau » : architecture pair-à-pair des instances vs serveur d'état persistant, ordre de grandeur du nombre de joueurs par instance, critères de regroupement (même système, même zone, latence), causes d'échec d'instanciation et remèdes (NAT/UPnP, ports UDP), et l'articulation modes de jeu × BGS × Powerplay (état partagé entre les trois modes, conséquence stratégique du jeu en Solo pour un groupe BGS) — sujets à 0 occurrence.

<details><summary>Constats couverts (4)</summary>

- La piraterie joueur n'existe nulle part comme boucle de gameplay
- Le PvP subi (gankers, Open, combat logging, blocage) n'est traite nulle part alors que le corpus recommande l'Open
- Sécurité entre joueurs, ganking et étiquette : trois mentions en passant, aucune section
- Netcode, instancing et matchmaking : une seule sous-section descriptive, aucun modèle technique

</details>

### 9. Nouveau guide 31 — Pilotage, navigation, stations, SRV et logistique de flotte

**Type** : nouveau-guide — **effort** : eleve — **impact** : haut

**Fichiers** : NOUVEAU dépôt : raw_data/31-pilotage-navigation-et-stations.md ; modifications dans 03-vaisseaux.md, 04-equipements.md, 14-rhino-nomad.md (renommage), 18-colonisation.md, 19-fleet-carriers.md, 05-guardians.md (renvoi orphelin), 27-debuter-et-progresser.md, 20-minage.md

**Pourquoi ce rang**

Le corpus couvre le combat spatial en profondeur (Flight Assist, FA off, pips, interdiction, wakes, mass lock) mais pas la première heure de jeu : vérifié, aucune procédure d'accostage (demande d'autorisation, numéro de pad, mailslot, no-fire zone, délai de loitering), aucune procédure d'atterrissage planétaire (orbital cruise → glide → posé), et surtout aucune règle de taille de pad par type de station — « puis-je poser mon Type-9 sur un avant-poste ? » n'a aucune réponse dans les 31 fichiers (3 occurrences de « pad », aucune normative). S'y ajoutent deux vides logistiques complets : le transfert de vaisseau et de module à distance (0 occurrence), et la fiche véhicule consolidée du SRV — 14-rhino-nomad ne traite que le Rhino, et Scarab/Scorpion sont documentés par ricochet dans cinq guides sans jamais de caractéristiques comparées ni de lecture du wave scanner. Ce sont les questions les plus élémentaires du jeu, et le corpus n'y répond pas.

**Ce qu'il faut produire**

Créer 31-pilotage-navigation-et-stations.md :
1) Supercroisière : mécanique d'accélération/décélération, règle des 7 secondes / 75 % de poussée, freinage gravitationnel, Supercruise Assist, SCO et sa surchauffe (renvois vers 03 et 04 qui les documentent déjà).
2) Procédure d'accostage en 7 étapes : demande d'autorisation au contact station, portée de la demande, numéro de pad assigné, orientation et franchissement du mailslot, limite de vitesse et no-fire zone, délai de loitering avant amende puis tir de la sécurité, motifs de refus (prime en cours — déjà en 08 l.463/471), décollage. Variante avant-poste (pas de mailslot) et station planétaire.
3) Atterrissage planétaire : orbital cruise, cône et angle de glide, posé, gravité et dégâts au train, déploiement du SRV.
4) Tableau des types d'infrastructure × pad max × services : Coriolis, Orbis, Ocellus, Base d'astéroïde, Avant-poste, Port planétaire, Settlement Odyssey, Megaship, Porte-Vaisseau — colonnes Taille de pad max (S/M/L) | Amarrage interne/externe | Gravité simulée | Contexte d'apparition | Particularité. Plus une matrice Type de station × 15 services (Shipyard, Outfitting, Marché, Marché noir, Interstellar Factors, Material Trader Raw/Manufactured/Encoded, Technology Broker Humain/Guardian, Universal Cartographics, Vista Genomics, Pioneer Supplies, Crew Lounge, Mission Board, Refuel/Repair/Rearm) avec les règles réelles de disponibilité (Material Trader spécialisé selon l'économie du système, Interstellar Factors en Anarchy/basse sécurité, Vista Genomics et Pioneer Supplies uniquement en Concourse Odyssey). Consolider ce qui est aujourd'hui éclaté entre 18-colonisation l.88-89/163, 06-ingenieurs l.724-731, 19-fleet-carriers et 07.
5) Tableau taille de vaisseau → pad requis, avec la liste explicite des vaisseaux Large qui ne peuvent pas se poser sur un avant-poste.
6) Panneaux HUD gauche/droit/rôle, ciblage et ciblage de sous-système hors contexte thargoïde — corriger au passage le renvoi orphelin de 05-guardians.md l.358 qui pointe vers une section inexistante de 08.
7) Carburant : écope, portée réelle, panne sèche, procédure d'appel aux Fuel Rats (cités en 01 et 16 comme organisation, jamais comme procédure).
8) VÉHICULES DE SURFACE (partie consolidée, ou partie 4 de 14-rhino-nomad renommé) : tableau comparatif Scarab / Scorpion / Rhino (places, armement, soute, vitesse, coût, hangar requis, rôle) ; mécaniques de conduite (pips, drive assist, boost, saut, dégâts d'impact) ; lecture du wave scanner (signatures sonores et visuelles par type de POI) ; prospection Raw et tir sur les gisements ; combat SRV (skimmers, tourelles de settlement, mode tourelle télécommandé) ; synthèse SRV (carburant, munitions, réparation) et absence de rebuy. Renommer 14-rhino-nomad.md en 14-rhino.md ou 14-rhino-et-cas-non-confirmes.md — son titre actuel centré sur une rumeur non confirmée est un mauvais point d'entrée RAG.
9) GESTION DE FLOTTE (section dans 03-vaisseaux.md et 04-equipements.md) : transfert de vaisseau entre stations (formule de coût selon distance et valeur, délai d'acheminement, impossibilité en vol, restrictions Fleet Carrier), stockage de vaisseaux en station (quota, gratuité) et sur FC (40 emplacements, déjà en 19 l.238), transfert et stockage de modules (plafond de slots, coût), recherche d'un module par station via EDSM/Inara/Spansh, dépendance du shipyard/outfitting à l'économie et à la taille de la station, pratique du hub de flotte (Jameson Memorial, Deciat, Colonia).

<details><summary>Constats couverts (7)</summary>

- Le vol de base et l'amarrage — la premiere heure de jeu — ne sont expliques nulle part
- Pilotage, navigation et accostage : aucune couverture des mécaniques de vol de base
- Aucune procédure d'accostage, d'atterrissage ni de vol de base
- Aucune typologie des stations et de leurs services : impossible de savoir ou trouver un Material Trader ou un pad Large
- La logistique du commandant (transfert de vaisseau, stockage, recherche d'un module) est absente
- Gestion de flotte : transfert de vaisseaux et de modules, stockage et outfitting à distance jamais traités
- Le SRV comme système de jeu (Scarab, Scorpion) n'a jamais été documenté — seul le Rhino l'est

</details>

### 10. Nouveau guide 32 — Géographie galactique, systèmes de référence et grands voyages

**Type** : nouveau-guide — **effort** : moyen — **impact** : haut

**Fichiers** : NOUVEAU dépôt : raw_data/32-geographie-galactique.md ; modifications dans 10-exploration.md, 01-lore.md, 05-guardians.md, 19-fleet-carriers.md, 00-glossaire.md

**Pourquoi ce rang**

Le corpus n'a aucune carte mentale de la galaxie, alors que toute la communauté externe (EDSM, Spansh, wiki, expéditions) raisonne en géographie. Vérifié à zéro occurrence : Sagittarius A*, Hutton, Riedquat, Cubeo, Barnard, Pléiades, Merope, Inner Orion Spur, bras spiraux, DSSA. Beagle Point n'apparaît que 3 fois, jamais dans 10-exploration dont c'est pourtant le sujet. Plus grave pour un RAG : le mot « Bulle » est employé dans 13 fichiers et n'est jamais défini — ni rayon, ni nombre de systèmes, ni frontières —, et n'apparaît même pas dans 01-lore.md. Un lecteur ne peut donc situer aucun des lieux que le corpus cite, ni répondre à « où est Colonia », « combien de sauts jusqu'au centre de la galaxie », « où trouve-t-on des méta-alliages ». C'est le référentiel spatial manquant qui rend une grande partie du reste du corpus flottante.

**Ce qu'il faut produire**

Créer 32-geographie-galactique.md :
1) Définition chiffrée de la Bulle : rayon depuis Sol, ordre de grandeur du nombre de systèmes peuplés, frontières Fédération / Empire / Alliance / indépendants.
2) Gazetteer des ~30 systèmes fondateurs : Système | Allégeance | Rôle lore | Station emblématique | Permis (oui/non) — Sol, Achenar, Alioth, Shinrarta Dezhra, Lave, Diso, Riedquat, Nanomam, Facece, Cubeo, Beta Hydri, Tionisla, Synteini, Varati, Deciat, Maia, Merope, Delphi… en rapatriant ce qui est déjà épars (capitales en 01 §2.6-2.7 et 02 §1.5, Jameson Memorial, Thompson Dock/Varati pour Canonn en 05 l.540-551).
3) Destinations hors-Bulle avec distance en al depuis Sol : Colonia et Jaques Station (~22 000 al), Sagittarius A* (~25 900 al) et Explorer's Anchorage, Beagle Point (~65 279 al), Hutton Orbital et sa course de 0,22 al en supercroisière, nébuleuses Pléiades / Witch Head / California, Nébuleuse Guardian (déjà en 05 l.14-18).
4) Carte textuelle des bras spiraux (Inner Orion Spur, Sagittarius-Carina, Norma, Perseus, Outer Arm) et des 42 régions du Codex ; système de coordonnées galactiques x/y/z utilisé par EDSM et Spansh ; génération procédurale Stellar Forge et nomenclature des secteurs (Nom-Secteur AA-A h0 : code de masse, boxel) qui explique pourquoi les systèmes voisins se ressemblent — connaissance directement actionnable pour la prospection.
5) « Les grands voyages » : fiche Colonia (itinéraire, Colonia Bridge et ses stations relais, ce qu'on y trouve, les 4 ingénieurs Odyssey déjà listés en 07), fiche Sagittarius A* / centre galactique (prérequis de portée de saut), fiche Beagle Point / bord de la galaxie ; check-list d'expédition longue (AFMU, limpets de réparation, heat sinks, synthèse de carburant, marge, DSSA et Fleet Carriers relais, sauvegarde des données non vendues) ; renvoi vers le Neutron Router de Spansh déjà documenté en 10 §1.2 et vers 19-fleet-carriers pour la logistique.
6) Renvois : depuis 10-exploration §1.4, 01-lore, 05-guardians, 19-fleet-carriers ; alimente le glossaire d'entités du chantier 12 (entrée « Bulle »).

<details><summary>Constats couverts (3)</summary>

- Aucune géographie galactique : les lieux emblématiques du lore sont absents du corpus
- Géographie galactique absente : ni régions, ni bras, ni distances de référence
- Les grands voyages (Colonia, centre de la galaxie, Beagle Point) sont absents alors que ce sont les questions d'exploration les plus posees

</details>

### 11. Dossier thargoïde et Guardian non-combat : Pléiades, barnacles, Spires, structures, 28 logs et Codex

**Type** : enrichissement — **effort** : moyen — **impact** : haut

**Fichiers** : dépôt : raw_data/{25-combat-ax.md, 01-lore.md, 05-guardians.md, 06-ingenieurs.md, 10-exploration.md, 16-outils.md}

**Pourquoi ce rang**

Tout l'arc 3302-3307 de découverte des Thargoïdes est géographiquement ancré dans les Pléiades — et « Pléiades », « Pleiades », « Maia », « Merope », « Thargoid Structure » sont à zéro occurrence dans les 31 fichiers. « Barnacle » n'apparaît que 3 fois, toutes dans 01-lore, sans jamais définir l'objet ni dire où en récolter, alors que 06-ingenieurs exige 16 méta-alliages pour un déblocage en donnant pour seule source « sites Thargoïdes » : le joueur ne peut pas agir. Les Thargoid Spire Sites, une des boucles les plus rentables de 2024, tiennent en une phrase, et les Revenants qui les gardent sont à 0 occurrence. Le contraste avec le versant Guardian est frappant — 05-guardians.md fait 609 lignes avec obélisques, pylônes et boucle de reconnexion d'instance — et c'est précisément ce niveau de détail opératoire qui manque côté thargoïde. S'y ajoutent deux systèmes jamais expliqués : le contenu narratif des 28 logs Guardian (cités 4 fois, jamais restitués) et le Codex in-game, référencé comme fonctionnalité à 4 endroits mais jamais décrit — avec un piège RAG net, la confusion permanente entre « Codex du jeu » et « Codex de Canonn ».

**Ce qu'il faut produire**

1) 01-lore.md, nouvelle §3.4bis « Les Pléiades, berceau du contact thargoïde » : Maia, Merope 5 C, Delphi, Darnielle's Progress, Obsidian Orbital, chronologie du contact.
2) 25-combat-ax.md, nouvelle section « Sites thargoïdes non-combat » avec tableau Type de site | Systèmes connus | Ce qu'on y récolte | Risque : Thargoid Barnacles et Barnacle Forests (localisation Pleiades/Witch Head, procédure de récolte du méta-alliage au SRV avec tir sur les épines, nombre d'unités par récolte, cycle de repop, usage — déblocage de Professor Palin, réparation Guardian/anti-caustique) ; Thargoid Surface Structures (typologie, puzzle sonore d'activation, récompenses) ; sondes, capteurs et links (scan Codex, matériaux encodés spécifiques, outillage Canonn déjà recensé en 16 l.306) ; sites de crash thargoïdes et Interceptor crash sites.
3) 25-combat-ax.md, section dédiée aux Thargoid Spire Sites : qu'est-ce qu'un site Spire, où en trouver (systèmes des huit Maelstroms, corps planétaires), procédure d'extraction pas à pas (approche, désactivation, prélèvement au sol, gestion des nuages caustiques et des Revenants — ennemis exclusifs à 0 occurrence), tableau des composants récupérables (Titan Drive Components, Thargoid Titan Maw…) avec valeur de revente et lieux d'achat/vente, équipement recommandé (combinaison, Caustic Sink, décontamination), et statut de la boucle après la fin de la guerre le 19 décembre 2024, avec date de relevé.
4) 06-ingenieurs.md : remplacer « Meta-Alloys : sites Thargoïdes » (l.184, 186, 193) par une ligne d'acquisition chiffrée renvoyant à la procédure de récolte ci-dessus ; idem pour le Sensor Fragment (l.284).
5) 05-guardians.md, section « Ce que révèlent les 28 logs » : tableau Log n° | Thème | Révélation clé | Étape de la chronologie guardian, suivi d'une synthèse narrative de 1 à 2 pages (structure en castes — absente du corpus, expansion spatiale, création des Constructs, guerre contre les Thargoïdes, révolte, extinction) et d'une sous-section « Langage et glyphes guardian » (obélisques, tablettes, système de traduction — traités mécaniquement mais jamais sémantiquement). Répercuter en version courte dans 01-lore §4.2-4.3 et ajouter une chronologie interne datée de la chute.
6) 10-exploration.md (ou 01-lore §2.7bis), sous-section « Le Codex in-game » : les 4 branches et leur arborescence, découpage par région galactique (à articuler avec les 42 régions du guide 32), mécanisme de crédit de première découverte et sa valeur, rôle de journal de progression exobiologique, catégories xénologiques et civilisation qui portent du lore introuvable ailleurs, ce que le Codex NE fait PAS (il n'enregistre pas la première cartographie DSS), et une distinction explicite « Codex du jeu » vs « Codex de Canonn » — la confusion actuelle est un piège direct pour le RAG.

<details><summary>Constats couverts (6)</summary>

- La région thargoïde historique (Pléiades, Barnacles, Meta-Alloys) n'existe nulle part dans le corpus
- Les sites Spire thargoïdes : une phrase pour une des boucles les plus rentables de 2024
- La xéno-recherche non combattante (barnacles, méta-alliages, structures thargoïdes, sondes) n'est traitée que comme du lore
- Les 28 logs Guardian sont cités quatre fois mais leur contenu narratif n'est jamais restitué
- Le Codex in-game n'est jamais expliqué comme système, seul le « Codex Canonn » l'est
- Le Codex in-game n'est jamais expliqué comme fonctionnalité, seulement cité via les outils Canonn

</details>

### 12. Glossaire de résolution d'entités : doubler 00-glossaire de 27 sigles techniques à ~80 entrées incluant le lore

**Type** : structure-rag — **effort** : faible — **impact** : haut

**Fichiers** : dépôt : raw_data/00-glossaire.md et les 10 guides sans lien entrant : 00-chronologie-canonique.md, 02-powerplay.md, 18-colonisation.md, 19-fleet-carriers.md, 21-bgs.md, 22-squadrons.md, 23-jeu-en-groupe.md, 24-community-goals.md, 25-combat-ax.md, 27-debuter-et-progresser.md

**Pourquoi ce rang**

Le glossaire est le chunk le plus récupérable du corpus (18 guides le citent, jusqu'à 9 renvois depuis 08-combat-spatial) et il ne contient AUCUNE entité de lore : lecture intégrale confirmée, 27 entrées, toutes des sigles techniques. Ni Thargoïde, ni Guardian, ni Titan/Maelstrom, ni Barnacle, ni Meta-Alloy, ni Interceptor, ni Raxxla, ni Bulle, ni Colonia, ni Pilots Federation, ni Salvation. Pour un RAG, c'est précisément la couche de résolution d'entités qui manque : une requête « Maelstrom » ou « Barnacle » n'a aucun point d'ancrage court et faisant autorité, et aucune variante de graphie n'est réconciliée (Rajin/Raijin, Thargoïde/Thargoid, Guardians/Gardiens). Le défaut est aggravé par le contenu : l'entrée NMLA ne développe pas le sigle et le rattache à tort à l'INRA, contredisant 01-lore qui en fait une organisation terroriste. Et aucune entrée ne porte de lien sortant vers son guide de fond : le chunk « ### BGS » s'arrête sur 38 mots sans jamais pointer 21-bgs.md.

**Ce qu'il faut produire**

1) Ajouter une seconde partie « Entités, lieux et concepts » d'environ 50 entrées, gabarit augmenté de deux lignes : « **Variantes et graphies :** Raijin / Rajin ; Thargoïde / Thargoid ; Guardians / Gardiens » et « **Guide de référence :** [25 — Combat AX](../../raw_data/25-combat-ax.md) ». Couvrir au minimum : Thargoïde, Interceptor, Scout, Revenant, Titan, Maelstrom, Barnacle, Meta-Alloy, Guardian, Construct, Obélisque, Relic, Bulle, Colonia, Shinrarta Dezhra, Sagittarius A*, Beagle Point, Pilots Federation, Commandant, Powerplay, Power, Raxxla, Salvation, Salomé, AEGIS (à enrichir), Canonn, Codex, GalNet.
2) Ajouter les concepts de jeu récurrents absents, vérifiés : hotspot, wake (high/low), hardpoint, utility mount, rebuy, HGE, mass lock, Interdictor, bartender, Tritium, CP (Construction Point), SFN, honk, pips, boost, Drydock, Concourse, first footfall, first discovered / first mapped, notoriety, no-fire zone, mailslot, glide.
3) Corriger l'entrée NMLA (développement du sigle, rattachement à l'organisation terroriste de 01-lore l.100/354, retrait du lien inventé vers l'INRA) et sourcer les entrées de lore litigieuses (INRA, GalCop, AEGIS) ; ajouter une section Sources en fin de fichier (0 URL aujourd'hui).
4) Ajouter à CHAQUE entrée existante et nouvelle une ligne « Guide de référence » pour que le chunk glossaire devienne lui-même un routeur (BGS→21, CG→24, CZ→25/08, FC→19, PP→02, USS→06, SRV→31…).
5) Passe de liaison sur les 10 guides qui ne citent jamais le glossaire, vérifiés : 00-chronologie, 02-powerplay, 18-colonisation, 19-fleet-carriers, 21-bgs, 22-squadrons, 23-jeu-en-groupe, 24-community-goals, 25-combat-ax, 27-debuter — ce sont précisément les guides propriétaires des sigles que le README cite en exemple (BGS, CG, AX, FC). Lier la première occurrence de chaque sigle et ajouter le glossaire à leur « Voir aussi ».

<details><summary>Constats couverts (4)</summary>

- Le glossaire ne contient aucune entrée de lore : 27 sigles techniques, zéro entité narrative
- Le glossaire est orphelin : jamais cité par 10 guides, aucun lien sortant, et limité à 27 sigles
- Neuf guides ne lient jamais le glossaire, dont ceux qui portent précisément les sigles que le glossaire cite en exemple
- Le glossaire, référencé par tout le corpus, ne cite aucune source

</details>

### 13. Lore vivant : combler le trou 3304-3306, cataloguer les mystères, documenter GalNet et le transmedia

**Type** : enrichissement — **effort** : eleve — **impact** : haut

**Fichiers** : dépôt : raw_data/{01-lore.md, 00-chronologie-canonique.md, 17-sources-donnees.md, 02-powerplay.md, 15-roadmap.md, 23-jeu-en-groupe.md, 22-squadrons.md, 16-outils.md, 10-exploration.md}

**Pourquoi ce rang**

Le tableau-maître de chronologie de 01-lore saute de « 4 août 3303 — Fondation d'AEGIS » à « 1er janv. 3307 » : les années in-game 3304 à 3306 sont à zéro occurrence dans les 31 fichiers, alors que ce sont les années les plus denses du récit vivant (campagne terroriste NMLA et assassinat du prince Harold Duval, exode marliniste, captivité d'Arissa chez les Lords of Restoration, escalade thargoïde des Pléiades, campagne Kumo Crew). Symétriquement, la section « Mystères non résolus » tient en 21 lignes et 3 sous-sections : Formidine Rift, Dynasty Expeditions, Far God, Zurara, Marlinist Colonies, generation ships, « the Club » sont tous à 0 occurrence — ce qui laisse le portrait de Salomé (01-lore l.361) orphelin, évoquant « un épisode marquant » sans jamais nommer l'arc qui lui donne sens. Enfin GalNet, moteur du lore et source primaire utilisée par 00-chronologie, est à zéro occurrence dans les 63 Ko de 17-sources-donnees.md, qui documente pourtant neuf autres sources en détail : le corpus consomme GalNet sans jamais dire comment l'ingérer.

**Ce qu'il faut produire**

1) 01-lore.md — 8 à 12 lignes datées au tableau-maître pour 3304-3306 et une §1.6bis « L'entre-deux-guerres (3304-3306) » : campagne NMLA / Emperor's Dawn et ses attentats, exode marliniste et fondation des Marlinist Colonies, captivité d'Arissa Lavigny-Duval par les Lords of Restoration (dates de début et de fin), montée en puissance du Kumo Crew, escalade thargoïde dans les Pléiades. Chaque entrée avec sa date in-game ET sa date réelle, conformément à la convention +1286 du guide.
2) 01-lore.md §5 réécrite en catalogue de 8 à 10 mystères, gabarit constant : Nom | Première apparition (date in-game et réelle) | Faits établis | Hypothèses communautaires | Statut (ouvert / clos / abandonné) | Source. Ajouter au minimum : Formidine Rift et Dynasty Expeditions (avec le lien explicite vers Salomé §6.2), le culte du Far God, l'épave du Zurara, les generation ships dérivants, le Gnosis comme fil narratif (aujourd'hui présent seulement comme outil en 16 et 17), les Marlinist Colonies, « the Club », les Guardian Beacons ; étoffer Raxxla au-delà de ses 4 puces.
3) 17-sources-donnees.md — nouvelle section « 10. GalNet » sur le modèle des sections EDSM/Spansh : endpoint public des articles, schéma JSON d'un article (uid, title, body, date in-game), pagination, fréquence de publication, miroirs communautaires (inara.cz/elite/galnet, galnet.borann.fr), méthode d'archivage incrémental pour ingestion RAG. En parallèle, 01-lore §2.7bis « Galnet et le Codex : comment le lore est diffusé », distinguant les 4 canaux narratifs (articles GalNet, Codex in-game, Community Goals, missions/scénarios) et leur autorité canonique respective.
4) 01-lore.md, nouvelle section « 9. Sources canoniques et transmedia » : tableau des œuvres officielles (Titre | Auteur | Année | Support | Arc de lore couvert | Statut canonique), résumé de 5 à 10 lignes par œuvre majeure — en particulier celles couvrant l'arc Salomé / Formidine Rift et l'histoire pré-3300 — et une échelle d'autorité canonique explicite (patch notes et GalNet officiels > Codex in-game > romans sous licence > continuité des jeux antérieurs > recherche communautaire Canonn > spéculation), référencée depuis 00-chronologie-canonique.md qui n'arbitre aujourd'hui que les dates de patch.
5) 01-lore.md — portrait de Jerome Archer au format des 13 autres (seul des 12 Powers actives à n'en avoir aucun), portrait d'Arissa Lavigny-Duval étoffé (deux phrases aujourd'hui contre 8 à 12 lignes pour Torval, Antal ou Kaine), et ligne de métadonnées uniforme sur les 14 portraits : Naissance | Allégeance | Fonction | Systèmes contrôlés | Éthos Powerplay.
6) 01-lore.md §2 refondu avec un gabarit constant par superpuissance : Fondation | Institutions (bicaméralité du Congrès fédéral, composition et fonctionnement du Sénat impérial, mode de scrutin de l'Assemblée d'Alioth — tous absents) | Titres nobiliaires comme système | Échelle de rangs navals in-lore et son pendant en jeu (le pont lore↔mécanique qui explique pourquoi un rang conditionne un vaisseau, à articuler avec le guide 29) | Corpus juridique notable | Systèmes-capitales | Relations mutuelles.
7) 01-lore.md §1.10 « Le récit vivant 3311-3312 (2025-2026) » rapatriant les arcs déjà documentés ailleurs (campagnes Powerplay HIP 87621 et Colonia en 24 l.110-112, rééquilibrages de 02 §5.7, narration de la colonisation, 10ᵉ anniversaire de Colonia, DW3 en 15 l.259) — travail de synthèse, pas de recherche.
8) 01-lore.md §7.6 remplacée par « Le tissu communautaire » : tableau Groupe | Domaine | Fondation | Contact (Discord/site) | Service rendu | Encore actif (daté), couvrant Fuel Rats, Hull Seals, Operation Ida, Canonn Research, AXI, Hutton Orbital Truckers, DSSA, Buckyball Racing Club, Sagittarius Eye, PTN, FCOC, Rescue Rangers, Fleetcomm — dont 7 à 0 occurrence vérifiée. Ajouter dans 23-jeu-en-groupe.md une section « Activités communautaires organisées » : courses (Buckyball, SRV, canyon), expéditions et rôle des Fleet Carriers relais, devenir secouriste (build fuel scoop + Fuel Transfer / Repair limpets, procédure d'appel), lieux de rendez-vous et folklore (Hutton Orbital, Jameson Memorial, Colonia).
9) 00-chronologie-canonique.md — le renommer « 00-arbitrages-factuels.md » (sa vraie nature : 10 faits arbitrés, 0 occurrence de Thargoid, Titan, Fleet Carrier) OU y adosser une vraie table chronologique 2012→2026 : Date réelle | Date in-game | Version | Nom de la mise à jour | Contenu structurant | Guide de détail, couvrant Kickstarter (nov. 2012), sortie (16 déc. 2014), Horizons 2.0 à 2.4 (Planetary Landings, The Engineers mai 2016, The Guardians, The Return), Beyond Chapters 1 à 4 (3.0-3.3, dont Chapter Two 28 juin 2018 / Krait Mk II, Chapter Three 28 août 2018 / FSS, Chapter Four 11 déc. 2018 / minage refondu et Codex), Distant Worlds II (janv. 2019), Galactic Summit (3306), Fleet Carriers (9 avril 2020), Odyssey (19 mai 2021), fin du support console (10 mars 2022), Updates 14 à 18, guerre thargoïde et Titans, Powerplay 2.0 (31 oct. 2024), Colonisation (11 nov. 2025).

<details><summary>Constats couverts (13)</summary>

- Trou de 4 ans dans le récit vivant : rien entre août 3303 et janvier 3307
- Trou chronologique 2017-2020 : les années in-game 3305 et 3306 sont totalement absentes du corpus
- Les mystères non résolus se limitent à 3 sous-sections : Formidine Rift, Dynasty, Far God, Zurara, le Club sont absents
- Galnet, moteur du lore, n'est ni documenté comme média ni exposé comme source de données
- Le transmedia officiel (romans, héritage de la saga) n'est jamais documenté
- Jerome Archer figure au roster des Powers mais n'a aucun portrait, contrairement aux 12 autres
- Les institutions des trois superpuissances tiennent en 6 lignes chacune, sans structure politique ni rangs
- Les groupes de joueurs historiques sont absents ou réduits à une puce
- Les activités communautaires organisées (courses, expéditions, services d'entraide) sont absentes en tant que boucles
- Vingt mois de récit vivant 2025-2026 couverts par six puces : le lore récent est un squelette
- 00-chronologie-canonique.md n'est pas une chronologie : c'est une table d'arbitrage de 10 faits litigieux
- Aucun historique consolidé des versions et extensions du jeu (2014-2024)
- 13 guides ne citent jamais la chronologie canonique, dont ceux qui portent les faits qu'elle arbitre

</details>

### 14. Chiffrer les boucles de farming : recettes de synthèse, taxonomie des USS, megaships et installations

**Type** : enrichissement — **effort** : moyen — **impact** : haut

**Fichiers** : dépôt : raw_data/{06-ingenieurs.md, 07-equipement-a-pied.md, 13-operations.md, 08-combat-spatial.md, 10-exploration.md, 04-equipements.md, 12-transport.md, 25-combat-ax.md, 26-ingenierie-a-pied-avancee.md}

**Pourquoi ce rang**

Asymétrie flagrante : le corpus documente longuement comment farmer les matériaux (06 §matériaux, 26 en entier) et jamais comment les dépenser. Vérifié exhaustivement : aucune recette de synthèse nulle part, alors que quatre guides y renvoient et que deux d'entre eux (07 l.286-288, 13 l.303) envoient explicitement le lecteur vers un outil tiers — ce qu'un RAG ne peut pas suivre. Le lecteur sait donc farmer mais pas dépenser, et ignore les paliers du FSD Injection alors même que 10-exploration l.681 dit que le jumponium pousse la portée au-delà de 75-80 al. Deuxième pièce manquante du même appareil : la table canonique des USS, dont dépend tout le farming — le corpus a la méthode, admet lui-même sa lacune de granularité (06 l.388-389) et n'a pas la table. Troisième : les megaships et installations spatiales, boucle de matériaux et objectif de mission récurrent, dont la mécanique est à 0 occurrence alors que le Recon Limpet Controller est catalogué sans qu'aucun guide ne dise où l'employer.

**Ce qu'il faut produire**

1) 06-ingenieurs.md §Synthèse transformée en section complète — table des ~30 recettes × 3 niveaux : Recette | Niveau (Basic/Standard/Premium) | Matériaux et quantités exactes | Effet chiffré et durée | Nombre d'utilisations. Couvrir FSD Injection (+25/+50/+100 % de portée), munitions par famille d'arme, AFMU Refill, Limpets, Heat Sinks, Chaff, Life Support, SRV Refuel/Repair/Ammo, décontamination anti-caustique. Ajouter la note sur les matériaux jumponium (Polonium, Yttrium, Niobium, Arsenic, Vanadium, Germanium, Cadmium) et où les trouver, plus un lien croisé explicite depuis 10-exploration §1.4. Source : jeu de données de recettes EDCD, cohérent avec le sourcing du reste du guide.
2) 07-equipement-a-pied.md §Les consommables — recettes Odyssey (Medkit, Energy Cell, Frag/EMP/Shield Disruptor Grenade) avec leurs matériaux Odyssey, ce qui résout le renvoi orphelin de la l.286 vers EDOMH ; supprimer le même renvoi en 13 l.303.
3) 06-ingenieurs.md — table canonique unique des USS, à laquelle 10, 12, 25 et 26 pointeront au lieu de paraphraser : Nom EN | Nom FR | Contenu typique | Dépend de l'état BGS ? | Niveau de menace (Threat 0 à 9, à 0 occurrence dans le corpus) | Catégorie de matériau/commodité | Durée de vie du signal. Couvrir Degraded/Encoded/High Grade Emissions, Combat Aftermath, Convoy et Ship Dispersal Pattern, Weapons Fire, Distress Call, Anomaly, Mission Target, Ceremonial Comms, Non-Human Signal Source. Y adosser les deux mécaniques déterminantes jamais énoncées : la dépendance du type d'USS à l'état BGS et à l'économie du système (avec un tableau état Boom/Outbreak/Civil War/Famine → matériau G5) et l'affichage du seuil de menace avant l'entrée dans l'instance. Croiser avec le bloc `sources` typé de assets/data/materials.json absorbé au chantier 1.
4) 08-combat-spatial.md ou 29-missions — section « Megaships et installations spatiales » : typologie (Bulk Cargo Ship, Survey Vessel, Tanker, Rescue Vessel, installations militaires/scientifiques/agricoles/de communication), procédure de piratage du Ship Log Uplink et du Cargo Bay Hatch avec le Recon Limpet (portée, temps, nombre de limpets, alerte de sécurité déclenchée), tableau « quel type d'installation donne quel matériau/donnée », megaships mobiles et leur trajet hebdomadaire, renvois vers 04 (Recon Limpet l.383), 06 (matériaux encodés) et 21 (impact BGS).

<details><summary>Constats couverts (5)</summary>

- Aucune recette de synthese dans tout le corpus, alors que trois guides y renvoient
- La Synthèse (Synthesis) : un paragraphe pour un système de consommables complet
- Typologie des Unidentified Signal Sources jamais donnée, alors que tout le farming en dépend
- Taxonomie des sources de signal (USS) absente alors que le corpus en dépend pour le farming
- Megaships, installations spatiales et le loot par piratage à distance : boucle entièrement absente

</details>

### 15. Carte transversale des boucles de gameplay, rentabilité comparée et jalons de progression

**Type** : transversal — **effort** : moyen — **impact** : haut

**Fichiers** : NOUVEAU dépôt : raw_data/00-boucles-de-gameplay.md ; modifications dans 27-debuter-et-progresser.md, 03-vaisseaux.md, 25-combat-ax.md, 08-combat-spatial.md, 12-transport.md, 10-exploration.md, 19-fleet-carriers.md, 18-colonisation.md, 20-minage.md, 26-ingenierie-a-pied-avancee.md, README.md

**Pourquoi ce rang**

Le format existe déjà — 27 §1.2 compare quatre activités sur cinq colonnes et §2.3 met les trois Cr/h du corpus côte à côte, avec un refus méthodologique argumenté d'inventer des chiffres — mais il est enfoui dans la section 1.2 d'un guide pour débutants et ne couvre que les premières semaines. Conséquence : une requête « quelle boucle démarrer avec 10 millions de crédits » tombe entre le tableau débutant et les chiffres fin de partie de 11 et 20, et une douzaine de boucles ne sont jamais comparées à quoi que ce soit (exobiologie, Road to Riches, primes, CZ, CG, colonisation, Powerplay, AX). Vérifié : 25-combat-ax ne contient aucune valeur en crédits, 08-combat-spatial non plus pour les primes et les CZ, 12-transport aucune récompense de mission passagers. Un document transversal donne au RAG la table de routage qui lui manque pour la question la plus posée du jeu, et sert de point d'entrée unique.

**Ce qu'il faut produire**

1) Créer 00-boucles-de-gameplay.md, sur le modèle de 00-chronologie-canonique : (a) tableau unique des ~20 boucles — Boucle | Extension requise (base/Horizons/Odyssey) | Vaisseau et équipement minimal | Capital d'entrée | Cr/h ordre de grandeur en fourchette basse/haute avec configuration supposée (débutant vs ingénieré) et date de relevé sourcée | Temps avant premier revenu | Rang(s) progressé(s) | Guide propriétaire ; (b) parcours-types chiffrés (0 → 100 M Cr, 100 M → 1 Md, débloquer un Fleet Carrier) ; (c) matrice boucle × système structurant (laquelle génère de l'influence BGS, des mérites Powerplay, des matériaux d'ingénierie, du rang, de la réputation) ; (d) faire de ce document le point d'entrée cité en tête de README.
2) Chiffrer les trois zones aveugles : AX (25-combat-ax, aucune valeur en Cr), primes et Combat Zones (08-combat-spatial), missions de passagers (12-transport) ; et dériver un Cr/h réaliste pour l'exobiologie à partir des valeurs par espèce du chantier 1 × une cadence de scan documentée. Conserver la règle du corpus : fourchette assumée et datée plutôt qu'un point unique, et mention explicite des lignes calibrées fin de partie.
3) 27-debuter-et-progresser.md — section « Trois horizons » : ~10 h (accoster sans amende, 1 M Cr, Cobra Mk III, un ingénieur déverrouillé), ~100 h (50-200 M Cr, FSD G5 Farseer, un vaisseau spécialisé, un rang à mi-échelle), ~1000 h (Corvette/Cutter, Fleet Carrier, Guardian FSD Booster, exploration lointaine ou Powerplay soutenu). Pour chaque horizon : capital cible et achats à prévoir rebuy inclus, en consolidant les chiffres déjà éclatés (échelle de prix 27 §1.1, coût réel d'un vaisseau équipé 03 l.505-540 avec son facteur 2,6, prix et entretien du FC 19 §II-III, revenu d'un système colonisé 18 l.300).
4) 27-debuter-et-progresser.md — section « Les erreurs qui coûtent le plus cher » : agréger les 25 à 30 pièges déjà dispersés (11 l.30/459/309, 23 l.86, 08 l.585, 20 l.372, 26 l.231, 09 l.333, 06 l.102, 03 l.505-540) et ajouter les trois réellement absents : panne sèche loin de tout et recours aux Fuel Rats, perte des rolls d'ingénierie à la revente d'un module, achat d'un Fleet Carrier sans provision d'entretien alors que 19 documente le décommissionnement pour impayé. Format Piège | Conséquence chiffrée | Comment l'éviter, avec un encart de 4 à 6 entrées en fin de chaque guide d'activité (03, 06, 11, 18, 19, 20, 10).
5) Check-lists au format de 09 l.421 (aujourd'hui la seule du corpus) en fin de 10-exploration (expédition longue), 20-minage (session), 19-fleet-carriers (achat + premier saut + provision), 18-colonisation (claim → première livraison), 25-combat-ax (sortie Interceptor — aucune liste de préparation aujourd'hui), 26 (session de farming) : 6 à 10 puces, chacune renvoyant à la section qui la justifie.
6) 03-vaisseaux.md — matrice « Rôle × palier de budget » : 6 rôles × 4 paliers (< 5 M / 5-50 M / 50-300 M / > 300 M Cr, coque + équipement fonctionnel), recommandation principale et alternative par case, coût total équipé et rebuy. Ajouter les configurations de référence manquantes pour les châssis les plus joués et jamais configurés — Krait Mk II en tête (présent uniquement en données brutes), Krait Phantom, Python Mk II, Alliance Chieftain, Mandalay. Ajouter un arbre de décision textuel dans 27 : « Quel est votre objectif ? → gagner des crédits vite / explorer loin / combattre / jouer en groupe / construire ».
7) 27-debuter-et-progresser.md — sous-section 1.0 « Avant la première sortie » nommant et décrivant les scénarios Pilot Training du menu principal (vol de base, accostage, voyage, combat, SRV, chasseur embarqué, à pied) : ce que chacun enseigne, durée, ordre recommandé, jouables hors ligne — aujourd'hui à 0 occurrence, alors que 08 l.76 recommande déjà « la zone de simulation de combat » sans jamais l'expliquer. Enchaîner sur la procédure d'accostage du guide 31, puis sur le CQC de §2.4.

<details><summary>Constats couverts (8)</summary>

- Aucune vue transversale comparant les boucles de gameplay entre elles (rentabilité, prérequis, temps de mise en route)
- Aucun tableau comparatif transversal de rentabilité (Cr/h) par activité
- Pas de comparatif transversal "gagner des credits" alors que c'est la question numero un des joueurs
- Aucun jalon de progression chiffré (10 h / 100 h / 1000 h) ni budget par étape
- Aucune section « erreurs fréquentes », pièges et coûts cachés
- Une seule check-list actionnable dans les 29 guides
- Aucun arbre de décision ni matrice « quel vaisseau pour quel objectif à quel budget »
- Les tutoriels intégrés du jeu (Pilot Training) ne sont jamais mentionnés

</details>

### 16. Gouvernance du sourcing et instrumentation : méthodologie, registre d'incertitudes et jeu de questions de référence

**Type** : transversal — **effort** : moyen — **impact** : haut

**Fichiers** : NOUVEAUX : dépôt : raw_data/00-methodologie-sourcing.md, dépôt : EVALUATION.md, dépôt : eval/questions-reference.json, dépôt : CHANGELOG.md ; modifications dans 00-chronologie-canonique.md, README.md et les 27 sections Sources du corpus

**Pourquoi ce rang**

C'est le point aveugle méthodologique de trois cycles successifs : on enrichit sans instrument de mesure. Vérifié, le corpus n'a aucun fichier d'évaluation, aucun jeu de questions de référence, aucun périmètre déclaré, et son historique git tient en un commit unique — il est donc impossible de savoir si un cycle a amélioré ou dégradé quoi que ce soit, ni de détecter une régression. Corollaire : un « manque » ne peut être jugé que par intuition, exactement ce que la règle de vérification adverse cherche à éviter. À cela s'ajoute une gouvernance de sourcing à moitié posée : l'échelle de confiance est définie en 00-chronologie l.12-13 mais n'est appliquée qu'à une poignée de guides, 395 puces de bibliographie sur 699 sont des URL nues sans annotation, et 174 aveux d'incertitude en prose sont dispersés sans registre central alors que le format d'agrégation existe déjà. Ce chantier n'ajoute pas de connaissance mais rend tous les autres mesurables et durables.

**Ce qu'il faut produire**

1) Créer 00-methodologie-sourcing.md : hiérarchie de sources opposable (P1 = patch notes Frontier, journal du jeu, EDCD coriolis-data/FDevIDs ; P2 = base communautaire vivante recoupée par deux sources — Inara, EDSM, Spansh, Canonn ; P3 = presse spécialisée ; P4 = estimation ou connaissance non revérifiée ; interdit : sites de contenu généré), notation courte [P1]…[P4], échelle de confiance normalisée reprise et généralisée depuis 00-chronologie l.12, règle de format de date (relevé au format réel ISO AAAA-MM-JJ ; date in-univers notée « 3311-09-30 (in-game) » et jamais utilisée comme date de vérification), règle des URL (date de consultation sur la même ligne, sous-section distincte « Sources tentées sans succès (NE PAS CITER) » avec marqueur inline [ÉCHEC 403]), règle « aucun chemin absolu », et politique de source unique (un fait chiffré vit dans un seul guide, les autres renvoient).
2) Trancher la politique MassivelyOP : le corpus cite ce site 36 fois comme source positive (dont 26 dans 12-transport et le tableau de vaisseaux de 14 l.135-137) mais n'évalue jamais les 5 articles MassivelyOP « Operations » que ses propres bibliographies listent (14 l.345/347, 07 l.522, 12 l.450) avant de conclure à la non-existence du mode. Lire réellement ces 5 articles, en extraire dates et noms de scénarios, et trancher entre CONFIRMÉ / ANNONCÉ NON SORTI / NON CONFIRMÉ dans 00-chronologie-canonique.md, avec un paragraphe « pourquoi telle source a été retenue ou écartée ». Cohérence exigée : si MassivelyOP date la sortie du Type-8, il vaut pour Operations, sinon retirer les 36 citations.
3) Étendre 00-chronologie-canonique.md en registre d'incertitudes couvrant tout le corpus (pas seulement les dates) : Question | Ce que le corpus retient | Confiance P1-P4 | Ce qui manque pour trancher | Source à consulter | Guide(s) concerné(s) | Date du dernier examen. Y migrer les incertitudes les plus denses (07 : 34 occurrences, 27 : 16, 14 : 13, 20 : 9, 18 : 9) et remplacer chaque aveu en prose par un renvoi court. Ajouter un test de non-régression : tout renvoi « trancher via 00-chronologie » doit correspondre à une section existante.
4) Normaliser les 27 sections Sources sur le format déjà pratiqué par 21-bgs, 19-fleet-carriers, 20-minage, 26 et 27 : `- <clé> | <URL> | primaire/secondaire/tertiaire | consulté le JJ/MM/AAAA | confirme : X, Y | ne confirme pas : Z`. Priorité aux 11 guides à 100 % d'URL nues, vérifiés : 16-outils (42/42), 12-transport (33/33), 01-lore (57/62), 10-exploration (38/40), 02-powerplay (34/36), 07-equipement-a-pied (31/33), 18-colonisation (13/14), 09-combat-a-pied (8/8), 23-jeu-en-groupe (7/7), 13-operations (6/6), 08-combat-spatial (4/4). Ajouter des clés de citation courtes [EDCD-2026-09-09], [FDEV-4.2.2.0], [INARA-2026-09-09] résolues par un registre en fin de guide, en visant d'abord 11-commerce (3 attributions pour 77 lignes de tableau) et 02-powerplay.
5) Ajouter une colonne terminale `Fiab.` (P/C/E/N) aux tableaux chiffrés des 4 guides où aucun tableau ne porte trace d'attribution : 01-lore (75 lignes), 22-squadrons (25), 12-transport (51), 18-colonisation (81) — le code voyage avec la ligne et survit au chunking.
6) Créer EVALUATION.md et eval/questions-reference.json : 60 à 100 questions en français, formulées comme un joueur les pose, mélangeant termes FR et EN, au format {question, réponse attendue en une phrase, fichier + section attendus, difficulté}. Y inclure systématiquement les cas connus comme fragiles : « combien coûte un Federal Corvette », « quelle plante rapporte le plus », « puis-je installer un Material Trader sur mon Fleet Carrier », « quel ingénieur monte le FSD en G5 », « puis-je faire de la colonisation sur PS5 », « dans quel type d'anneau trouve-t-on du Benitoite », « quel rang pour la Cutter », « où récolter des méta-alliages ». Rejouer après chaque cycle et consigner le résultat.
7) Ajouter en tête de README.md une section « Périmètre et non-objectifs » : ce que le corpus doit savoir répondre, ce qu'il délègue explicitement aux outils live (prix instantanés, routes), ce qu'il refuse. Sans elle, un « manque » reste une question d'intuition.
8) Créer CHANGELOG.md listant les trois cycles avec date, portée et fichiers touchés ; poser la règle « tout item résolu dans la section incertitudes d'un guide déclenche la mise à jour de sa notice README ».

<details><summary>Constats couverts (9)</summary>

- Aucun dispositif d'évaluation du corpus : ni jeu de questions de référence, ni périmètre déclaré, ni test de non-régression documentaire
- Sur-correction du mode « Operations » : le corpus a supprimé du contenu que sa propre bibliographie documente
- Le taux de sourcing inline des affirmations chiffrées est de 22,6 % et va de 0 % à 58 % selon le guide
- Les bibliographies sont des listes d'URL nues (56 %) non rattachées aux affirmations qu'elles étayent
- La convention de niveau de confiance existe mais n'est appliquée que par un guide sur vingt-neuf, avec un vocabulaire non normalisé
- Les 174 aveux d'incertitude du corpus sont du bruit non exploitable : dispersés, non standardisés, sans registre central
- Seules 9,4 % des URL portent une date de consultation, et 58 mentions d'échec d'accès cohabitent avec les sources valides
- Les sections Sources sont des listes d'URL nues, sans date de consultation ni statut d'accès
- Données transitoires figées sans date de péremption : une CG « en cours » et un teaser Canonn de 2025 sans suite

</details>

### 17. Maillage, lexique bilingue et index par question : rapprocher les chunks des requêtes réelles

**Type** : structure-rag — **effort** : moyen — **impact** : moyen

**Fichiers** : NOUVEAUX : dépôt : raw_data/34-lexique-fr-en.md, dépôt : raw_data/00-faq.md ; modifications dans README.md et les 29 guides, en priorité 14-rhino-nomad.md, 27-debuter-et-progresser.md, 20-minage.md, 01-lore.md, 17-sources-donnees.md, 21-bgs.md, 18-colonisation.md, 06-ingenieurs.md, 07-equipement-a-pied.md

**Pourquoi ce rang**

Trois défauts de rappel se cumulent sans qu'aucun ne demande de recherche. (a) Le corpus est massivement hyperlié entre fichiers (831 liens) mais 130 à 180 renvois numériques intra-fichier (« voir section 3 ») restent en clair et deviennent des pointeurs morts dès qu'un chunk est isolé. (b) Le jeu est en anglais, les joueurs cherchent en anglais, et l'équivalence bilingue existe (75 gloses inline) mais dispersée et asymétrique : « hardpoint » dans 12 guides contre « point d'emport » à 0, « hotspot » dans 8 contre « point chaud » 1, « Heat Sink » dans 5 contre « dissipateur » 1 — aucun point d'entrée centralisé et indexable. (c) 6 titres interrogatifs seulement sur ~1 050 titres, aucune FAQ interne, et un README qui indexe par domaine et non par intention. Ces corrections sont mécaniques, mais elles ne valent que posées APRÈS les chantiers de contenu : reformuler en question un guide qui ne contient pas la réponse n'améliore rien.

**Ce qu'il faut produire**

1) Créer 34-lexique-fr-en.md : tableau de ~200 lignes `| Terme in-game (EN) | Terme FR utilisé dans le corpus | Synonymes et abréviations communauté | Guide de référence |`, couvrant modules (Heat Sink / puits thermique, Fuel Scoop, Power Distributor, Shield Cell Bank, Point Defence, Chaff Launcher, FSD Interdictor, Hatch Breaker), lieux et services (Passenger Lounge, Mission Board, Interstellar Factors, Universal Cartographics, Material Trader, Technology Broker, Nav Beacon, Compromised Nav Beacon, USS, Concourse), mécaniques (wake / sillage, hardpoint / point d'emport, boost, silent running, mass lock, pips, glide, first footfall) et entités (Thargoid/Thargoïde, Guardian/Gardien, Titan/Maelstrom). Double valeur : réponse directe aux requêtes de traduction, et enrichissement du rappel par le lexique injecté à l'indexation. Ajouter la glose manquante à la première occurrence dans chaque guide, et alimenter le champ `mots_cles_en` du front-matter (chantier 3).
2) Créer 00-faq.md : 80 à 120 questions réelles regroupées par intention (débuter, gagner des crédits, s'équiper, explorer, combattre, jouer à plusieurs, construire, comprendre l'univers, outils), chacune avec une réponse autoportante de 2 à 5 lignes (chiffre + source, donc utilisable telle quelle comme chunk) et un lien vers la section qui développe. Y intégrer systématiquement la variante anglaise du terme clé. Ce fichier est aussi le meilleur véhicule d'injection des synonymes du lexique.
3) Ajouter à chaque guide une section terminale « ## Questions fréquentes » de 8 à 12 paires Q/R, question posée exactement comme un joueur la taperait — pour 19-fleet-carriers : « Combien coûte un Fleet Carrier ? » (5 Md Cr), « Combien coûte l'entretien hebdomadaire ? » (5 M Cr + services + 100 k Cr/saut), « Quelle est la portée maximale d'un carrier ? » (500 al), « Peut-on installer un Material Trader dessus ? » (non). Reformuler en question les titres de sous-sections des guides les plus consultés (03, 06, 11, 27) et ajouter une ligne « Répond à : … » listant les formulations courantes.
4) Passe mécanique de conversion des renvois numériques intra-fichier en liens d'ancre `[Nom réel de la section](#ancre-stable)` (ancres définies au chantier 3), en priorisant les 5 fichiers les plus touchés (14-rhino-nomad 24, 27-debuter 11, 20-minage 10, 01-lore 10, 17-sources 8). Quand le renvoi porte sur une valeur chiffrée courte, dupliquer la valeur sur place plutôt que renvoyer.
5) Corriger les liens manquants : lier 26-ingenierie-a-pied-avancee depuis le « Voir aussi » de 06, 07, 09 et 13 (et depuis 06 §ingénierie à pied en corps de texte, puisque 26 arbitre la taxonomie que 06 contredit) ; lier 27-debuter depuis 03, 06, 08, 10, 11, 12, 20 et 23 — aujourd'hui aucun guide thématique ne les cite, seul le README le fait. Enrichir le « Voir aussi » de 21-bgs (4 sorties pour 10 entrées) avec 11-commerce, 08-combat-spatial, 16-outils et 22-squadrons, et lier BGS-Tally vers 16-outils à sa première occurrence (16 mentions, 0 lien). Normaliser les 15 liens de 18-colonisation en `./NN-nom.md` et y ajouter 00-chronologie et 00-glossaire.
6) README.md : réécrire les 29 descriptions en 2 lignes orientées question (« Répond à : combien coûte un Fleet Carrier, quel entretien hebdomadaire, quelle portée de saut, comment le décommissionner ») et reléguer l'historique éditorial du cycle précédent dans une section « Historique des cycles » en fin de fichier, où il ne concurrencera plus les vraies réponses.

<details><summary>Constats couverts (8)</summary>

- Aucun lexique bilingue FR↔EN : le jeu est en anglais, les joueurs cherchent en anglais, et le corpus répond en français
- Aucune section FAQ / question-réponse : 6 titres interrogatifs pour 1 019 sections
- Le corpus est ecrit en style encyclopedique alors que les requetes RAG arrivent sous forme de questions
- Aucune couche d'index par question ou cas d'usage pour le RAG
- 187 renvois « voir section N » non hyperliés deviennent des pointeurs morts une fois le chunk isolé
- Deux guides orphelins : 26 et 27 ne sont cités par AUCUN autre guide du corpus
- 21-bgs est sous-lié (4 sorties pour 10 entrées) et cite BGS-Tally trois fois sans jamais renvoyer vers 16-outils qui le documente
- 18-colonisation est le seul fichier du corpus à écrire ses liens sans « ./ » et le seul à ne citer aucun des deux documents transversaux

</details>

### 18. Nouveau guide 33 — Client, éditions, branches Live/Legacy, périphériques et VR

**Type** : nouveau-guide — **effort** : moyen — **impact** : moyen

**Fichiers** : NOUVEAU dépôt : raw_data/33-client-editions-peripheriques-et-vr.md ; modifications dans 27-debuter-et-progresser.md, 15-roadmap.md, 17-sources-donnees.md, 16-outils.md, 13-operations.md, 06-ingenieurs.md, 03-vaisseaux.md

**Pourquoi ce rang**

C'est la couche « avant le jeu » entièrement absente, et elle porte un risque de réponse fausse spécifique : depuis la scission du client, un joueur peut lancer une version (Legacy 3.8) où la Colonisation, Powerplay 2.0, l'exobiologie et l'ingénierie à pied n'existent pas — or aucun guide ne dit à quelle branche s'appliquent ses contenus, et la scission n'est décrite que dans 17-sources-donnees comme un problème de format du champ `gameversion` pour EDDN. Le corpus peut donc affirmer une mécanique qui n'existe pas dans la partie qu'a le lecteur sous les yeux. S'y ajoutent des vides matériels complets (config PC, HOTAS/HOSAS, bindings, VR, accessibilité : 0 occurrence utile) et une synthèse acheteur jamais faite, alors que les faits sont là mais éparpillés et formulés du point de vue technique.

**Ce qu'il faut produire**

Créer 33-client-editions-peripheriques-et-vr.md :
1) « Sur quelle version jouez-vous ? » — distinction Live 4.0 / Legacy 3.8, comment le vérifier au lancement, tableau des fonctionnalités indisponibles en Legacy (Odyssey, jeu à pied, exobiologie, Colonisation, Powerplay 2.0, vaisseaux récents), état des versions console et absence de transfert de compte, statut actuel de la branche Legacy. Croiser avec 17-sources-donnees l.339-366 qui la documente côté données. Alimente le champ `branche: live|legacy` du front-matter (chantier 3).
2) Synthèse acheteur : tableau Édition | Contenu inclus | Statut commercial actuel | Ce qu'elle débloque dans le corpus (quels guides deviennent pertinents), couvrant jeu de base, Horizons (statut payant ou inclus aujourd'hui — la question n'a aucune réponse dans le corpus) et Odyssey ; plateformes (PC développé activement ; abandon PS4/Xbox One le 10 mars 2022, déjà daté en 06 l.766 et 13 l.399) ; liaison des comptes Frontier / Steam / Epic.
3) Configuration PC minimale et recommandée ; réglages à fort impact FPS (supersampling, ombres, blur, terrain quality, HMD quality).
4) Périphériques : tableau comparatif des 4 schémas de contrôle (clavier+souris, manette, HOTAS mono-stick, HOSAS) avec avantages, limites, budget indicatif, courbe d'apprentissage ; structure et sauvegarde du fichier de bindings ; liste des ~25 bindings réellement indispensables groupés par contexte (vol, supercruise, combat, FSS/DSS, SRV, à pied : pips, chaff/heat sink, cargo scoop, train, silent running, mode analyse) ; head-tracking et TrackIR.
5) VR : casques compatibles, ce qui fonctionne (vaisseau, SRV) et ce qui reste en écran plat sous Odyssey à pied, overlays déjà recensés en 16-outils l.243 (Oculus Dash, Desktop+, OVRDrop, OVRToolkit), options de confort.
6) Accessibilité réellement présente dans le jeu (remappage, options visuelles et sonores).
7) ARX : compléter 15-roadmap §ARX du taux de gain (ARX crédités par tranche de temps de jeu et par activité), du moment du reset hebdomadaire, d'un tableau « combien de semaines de jeu pour un pack donné » adossé à la grille de prix déjà présente en 14 l.233-246, et de la liste de ce qui est achetable en ARX vs exclu ; renvoyer depuis 27 et 03 (accès anticipé des vaisseaux).
8) Renvois vers 16-outils (overlays, EDCoPilot, VoiceAttack/BindED) et 17-sources-donnees (Status.json, flags HOTAS/Stream Deck).

<details><summary>Constats couverts (5)</summary>

- Aucune couverture des contrôles, périphériques et VR
- Aucune reponse aux questions "hors-jeu" : plateformes, editions, config PC, HOTAS, VR, performances, accessibilite
- Le fork Live 4.0 / Legacy 3.8 et l'arrêt du support console ne sont expliqués nulle part du point de vue du joueur : la seule mention est un champ de métadonnée dans le guide des sources de données
- Structure du produit (éditions, DLC, plateformes) jamais expliquée du point de vue de l'acheteur
- Les ARX ne sont documentés que comme monnaie à acheter, jamais comme boucle de gain en jeu

</details>

---

## Nouveaux guides à créer

### `28-marchandises.md` — Référentiel des marchandises, denrées rares et minerais

*Priorité 1.*

**Périmètre**

Les 12-15 catégories officielles de commodités avec économie productrice/consommatrice et statut légal par superpuissance ; tableau référentiel des ~380 marchandises (Nom EN/FR, catégorie, fourchettes de prix, légalité) ; les ~130 Rare Goods avec système, station, allocation par cycle et distance optimale de revente ; les marchandises à forte valeur unitaire ; renvoi vers 20-minage pour les minerais et vers les outils live pour le prix instantané.

**Justification**

11-commerce.md, guide de référence du commerce, ne nomme AUCUNE marchandise réelle : l'exemple de la l.231 est générique, la section « denrées rares » l.108-115 n'en cite pas une seule, et les catégories officielles sont absentes. Le RAG ne peut répondre ni à « quelle catégorie pour les Progenitor Cells », ni à « cite-moi trois denrées rares », ni à « quelles marchandises sont illégales en Empire ». Volume trop important pour une section : justifie un fichier dédié. Source identifiée par le corpus lui-même (17-sources-donnees l.377-380 : commodity.csv et rare_commodity.csv d'EDCD/FDevIDs).

### `29-missions-reputation-et-rangs.md` — Missions, réputation et rangs de superpuissance

*Priorité 2.*

**Périmètre**

Typologie des ~14 familles de missions de vaisseau ; génération et cycle de vie du tableau de missions (réputation, états BGS, board flipping, stacking, expiration, abandon, missions de wing) ; échelle de réputation de faction en 6 crans avec effets ; les deux échelles de marine en entier (Federal Navy et Imperial Navy, 14 paliers chacune) avec déblocages et méthode de montée ; rang Mercenaire ; tableau des systèmes à permis ; récompenses non-crédits.

**Justification**

Trois lacunes convergentes sur la colonne vertébrale de la progression. 13-operations.md l.119-141 fait le tableau typologique pour les missions au sol, rien d'équivalent côté spatial et huit familles ne sont nommées nulle part. Les deux échelles de rang de superpuissance n'apparaissent nulle part en entier (vérifié : 9 paliers isolés, jamais ordonnés) alors qu'elles conditionnent 7 vaisseaux et plusieurs ingénieurs. L'échelle de réputation Hostile→Allied n'est jamais donnée bien que 06-ingenieurs l.111 utilise le palier « Alliés » comme condition. Et 27, le guide de progression, annonce « cinq échelles » en ignorant les deux marines.

### `30-piraterie-et-pvp.md` — Piraterie, prédation et survie au PvP non consenti

*Priorité 3.*

**Périmètre**

Chaîne opératoire complète de la piraterie (scan de manifeste, interdiction, mass lock, Hatch Breaker, Collector, revente) ; tableau des scanners ; où trouver des cibles ; deux builds pirates chiffrés ; statut légal du butin, notoriety, marché noir, impact BGS ; volet défensif (lieux à risque nommés, procédure d'évasion, builds de fuite, groupes privés PvE, blocage, signalement, combat logging).

**Justification**

Toutes les briques sont documentées séparément — Hatch Breaker et FSD Interdictor étiquetés « piraterie » en 04, mini-jeu d'interdiction sur 50 lignes en 08 §2.1 qui se rattache lui-même explicitement à la piraterie, mass lock présenté comme tactique de piraterie, marchés noirs et Anarchy en 11 et 21 — mais jamais assemblées en procédure jouable, et la piraterie manque à la taxonomie « les quatre types de commerce » de 11 §II. Côté défensif, combat logging, fonction de blocage et groupes privés PvE communautaires sont à 0 occurrence vérifiée.

### `31-pilotage-navigation-et-stations.md` — Pilotage, navigation, stations, SRV et gestion de flotte

*Priorité 4.*

**Périmètre**

Supercroisière et règle de décélération ; procédure d'accostage en 7 étapes et atterrissage planétaire (orbital cruise, glide) ; tableau des types de station × taille de pad max × services ; taille de vaisseau → pad requis ; HUD et ciblage de sous-système ; carburant et procédure Fuel Rats ; fiche véhicule consolidée Scarab/Scorpion/Rhino avec wave scanner et synthèse SRV ; transfert et stockage de vaisseaux et de modules.

**Justification**

Le corpus couvre le combat spatial en profondeur mais pas la première heure de jeu : aucune procédure d'accostage, aucune procédure d'atterrissage, et surtout aucune règle de taille de pad par type de station — « puis-je poser mon Type-9 sur un avant-poste » n'a aucune réponse (3 occurrences de « pad », aucune normative). Le transfert de vaisseau et de module à distance est à 0 occurrence. Le SRV n'est traité que par ricochet dans cinq guides, et 14-rhino-nomad ne couvre que le Rhino. Ce sont les questions les plus élémentaires du jeu.

### `32-geographie-galactique.md` — Géographie galactique, systèmes de référence et grands voyages

*Priorité 5.*

**Périmètre**

Définition chiffrée de la Bulle ; gazetteer des ~30 systèmes fondateurs (allégeance, rôle lore, station emblématique, permis) ; destinations hors-Bulle avec distances en al depuis Sol ; bras spiraux et 42 régions du Codex ; coordonnées galactiques x/y/z, Stellar Forge et nomenclature des secteurs procéduraux ; fiches Colonia, Sagittarius A*, Beagle Point ; check-list d'expédition longue.

**Justification**

Vérifié à zéro occurrence sur les 31 fichiers : Sagittarius, Hutton, Riedquat, Cubeo, Barnard, Pléiades, Merope, Inner Orion Spur, bras spiraux, DSSA. Beagle Point n'apparaît que 3 fois, jamais dans 10-exploration dont c'est le sujet. Plus grave : le mot « Bulle » est employé dans 13 fichiers et jamais défini, ni dans 01-lore ni au glossaire. Sans référentiel spatial, une grande partie du reste du corpus reste flottante — le lecteur ne peut situer aucun lieu cité ni répondre à « où est Colonia » ou « où trouve-t-on des méta-alliages ».

### `33-client-editions-peripheriques-et-vr.md` — Client, éditions, branches Live/Legacy, périphériques et VR

*Priorité 6.*

**Périmètre**

Distinction Live 4.0 / Legacy 3.8 et tableau des fonctionnalités indisponibles en Legacy ; synthèse acheteur (jeu de base, Horizons, Odyssey, plateformes, liaison de comptes) ; configuration PC et réglages à fort impact FPS ; comparatif des 4 schémas de contrôle et bindings essentiels ; VR (casques, ce qui fonctionne ou non sous Odyssey à pied) ; accessibilité ; boucle de gain des ARX.

**Justification**

Couche « avant le jeu » entièrement absente, avec un risque de réponse fausse spécifique : un joueur en Legacy 3.8 n'a ni Colonisation, ni Powerplay 2.0, ni exobiologie, ni ingénierie à pied, et aucun guide ne dit à quelle branche s'appliquent ses contenus — la scission n'est décrite que dans 17-sources-donnees comme un problème de format `gameversion`. Vérifié à zéro : config PC, GPU, RAM, fps, accessibilité, daltonisme ; « HOTAS » n'apparaît qu'une fois, comme consommateur de Status.json.

### `34-lexique-fr-en.md` — Lexique bilingue français ↔ anglais

*Priorité 7.*

**Périmètre**

Tableau de ~200 lignes : Terme in-game (EN) | Terme FR du corpus | Synonymes et abréviations communauté | Guide de référence. Modules, lieux et services, mécaniques, entités.

**Justification**

Le jeu est en anglais et les joueurs cherchent en anglais, mais le corpus répond en français avec une équivalence dispersée (75 gloses inline) et asymétrique — vérifié : « hardpoint » dans 12 guides contre « point d'emport » 0, « hotspot » dans 8 contre « point chaud » 1, « Heat Sink » dans 5 contre « dissipateur » 1, « puits thermique » et « Passenger Lounge » à 0. Un chunk isolé ne bénéficie de l'équivalence que si la glose s'y trouve par hasard ; un fichier dédié pose chaque paire sur une ligne indexable et alimente le champ `mots_cles_en` du front-matter.

### `00-boucles-de-gameplay.md` — Carte des boucles de gameplay et rentabilité comparée

*Priorité 8.*

**Périmètre**

Tableau unique des ~20 boucles (extension requise, vaisseau minimal, capital d'entrée, Cr/h en fourchette avec configuration supposée et date, temps avant premier revenu, rangs progressés, guide propriétaire) ; parcours-types 0→100 M, 100 M→1 Md, Fleet Carrier ; matrice boucle × système structurant (BGS, Powerplay, matériaux, rang).

**Justification**

Le format existe (27 §1.2 et §2.3) mais est enfoui dans un guide pour débutants et ne couvre que quatre activités et les premières semaines : « quelle boucle avec 10 M Cr » tombe entre le tableau débutant et les chiffres fin de partie. Une douzaine de boucles ne sont comparées à rien, et trois zones sont à zéro chiffre vérifié (AX, primes et CZ, missions de passagers). Préfixe 00- cohérent avec 00-glossaire et 00-chronologie : c'est un document transversal de routage, destiné à être le point d'entrée cité en tête de README.

### `00-faq.md` — Index par question et cas d'usage

*Priorité 9.*

**Périmètre**

80 à 120 questions réelles regroupées par intention (débuter, gagner des crédits, s'équiper, explorer, combattre, jouer à plusieurs, construire, comprendre l'univers, outils), chacune avec une réponse autoportante de 2 à 5 lignes utilisable telle quelle comme chunk, la variante anglaise du terme clé, et un lien vers la section qui développe.

**Justification**

Vérifié : 6 titres interrogatifs seulement sur ~1 050 titres, aucune FAQ interne (les 3 fichiers contenant « FAQ » désignent celle de Frontier ou de roguey.co.uk), et un README qui indexe par domaine et non par intention. À produire APRÈS les chantiers de contenu — reformuler en question un guide qui ne contient pas la réponse n'améliore rien.

### `00-methodologie-sourcing.md` — Méthodologie de sourcing, échelle de confiance et registre d'incertitudes

*Priorité 10.*

**Périmètre**

Hiérarchie de sources P1-P4 avec critère de preuve exigible ; échelle de confiance normalisée ; règles de format (dates ISO réelles vs in-game, URL avec date de consultation, sous-section des sources en échec, interdiction des chemins absolus) ; politique de source unique ; schéma du front-matter ; procédure de mise à jour d'un cycle.

**Justification**

L'échelle de confiance est définie en 00-chronologie l.12-13 mais appliquée par une poignée de guides seulement, avec un vocabulaire non aligné ; 395 puces de bibliographie sur 699 sont des URL nues ; 174 aveux d'incertitude en prose sont dispersés sans registre. Un document de méthode opposable est ce qui empêche le cycle 4 de reproduire les mêmes divergences, et il documente le schéma du front-matter introduit au chantier 3.

---

## Quick wins

Corrections à effort quasi nul, chacune vérifiée dans le corpus, dont la valeur correcte est le plus
souvent déjà présente ailleurs. À exécuter en premier en temps de calendrier.

1. Corriger 08-combat-spatial.md l.560 : « ≈ 18-20 M CR + rang Post Captain » → « ≈ 187 969 450 Cr + rang Rear Admiral » (valeurs déjà présentes en 03-vaisseaux.md l.140 et l.223). Erreur d'un facteur ~9,4 sur un budget d'achat, présentée avec le même horodatage que la valeur juste.
2. Retirer Material Trader et Technology Broker de 06-ingenieurs.md l.741-744 : 19-fleet-carriers.md l.255-259 les exclut explicitement avec confiance haute et deux sources vérifiées en direct — et 06 renvoie déjà vers 19 pour se justifier, alors que 19 dit l'inverse.
3. Corriger 00-glossaire.md l.59 et l.71 : HRP et MRP sont des modules INTERNES optionnels (classes 1-5, notations D/E), pas des modules utilitaires — 04-equipements.md l.223 et l.245 font autorité. L'erreur actuelle, dans le fichier que 18 guides citent, fait construire un build impossible.
4. Déplacer PLAN_ENRICHISSEMENT.md vers raw_data/_meta/2026-09-cycle1-plan.md avec en-tête d'archive : c'est le SEUL endroit du corpus où « Faulcon DeLacy », « SLV » et « Merc Coins » apparaissent en position d'assertion positive, donc le meilleur match lexical pour « qui construit le Nomad ? ». Ajouter la règle d'exclusion au README.
5. Corriger la date de Distant Worlds II dans 01-lore.md (l.40 du tableau-maître et §7.2 l.382-384) : janvier 3305 / janvier 2019, et non 14 janvier 3302 / janvier 2016 qui est la date de DW1, correctement datée deux lignes plus haut. Remplacer aussi « expéditions annuelles » (l.402) par les trois expéditions réelles.
6. Corriger README.md l.126-127 : la divergence Wellington Beck (15 vs 25 unités) est tranchée à 15 depuis 26-ingenierie-a-pied-avancee.md l.101 et l.402. L'index du corpus fait aujourd'hui répondre « on ne sait pas » sur une question résolue.
7. Harmoniser « Rajin » → « Raijin » dans 01-lore.md l.114 et l.234 (graphie de 25-combat-ax.md l.79) et ajouter Taranis comme huitième Titan aux deux tableaux, qui n'en listent que sept pour « huit Titans » annoncés.
8. Aligner 06-ingenieurs.md l.625 et 07-equipement-a-pied.md l.299-301 sur l'arbitrage de 26-ingenierie-a-pied-avancee.md l.35-48 : les 4 catégories du journal sont Items/Components/Consumables/Data, et Chemical/Circuit/Tech en sont une subdivision — et y pointer plutôt que réaffirmer la taxonomie invalidée.
9. Remplacer les deux encarts « non vérifié / non trouvé » de 18-colonisation.md l.259 et l.351 par les six valeurs chiffrées de 19-fleet-carriers, et ajouter 19 au « Voir aussi » de 18 (aujourd'hui 0 occurrence de « 19-fleet » dans 18).
10. Corriger « cinq progressions de rang » dans 27-debuter-et-progresser.md l.66 et README.md l.32 : six filières Pilots Federation (01-lore l.186) + deux échelles de marine = huit progressions.
11. Ajouter à 00-chronologie-canonique.md un fait « Thargoid War Epilogue » tranchant sur le 19 décembre 2024 15:00 UTC (preuve Steam News déjà citée en 25-combat-ax l.24) : l'escalade y est demandée depuis un cycle et le fichier ne contient aucune occurrence de « thargoid ».
12. Trancher le décompte de vaisseaux dans 00-chronologie-canonique.md (l.28, 159, 162 disent 75 contre 47/48 partout ailleurs, sur la même source Inara) et corriger l'attribution du chiffre 47 à Inara au lieu d'EDCD/coriolis-data (03 l.490, 13 l.54, 14 l.272).
13. Injecter les binômes complets d'espèces exobiologiques dans les 15 tableaux de 10-exploration.md par script depuis assets/data/exobiology_catalog.json : 100 des 118 binômes n'existent nulle part dans le corpus, ce qui rend toute recherche lexicale aveugle. Une transformation de colonne, zéro recherche.
14. Ajouter les 5 genres d'exobiologie manquants (Amphora Plant, Anemone, Crystalline Shard, Radicoida, Sinuous Tuber = 18 espèces chiffrées) depuis le même JSON, dont les Crystalline Shards, cible classique à 0 occurrence dans le corpus.
15. Convertir « 30/09/3311 » en « 30/09/2025 » dans 10-exploration.md l.18, l.243 et l.323 : une date in-fiction y sert de date de relevé, à l'endroit exact où une date réelle est requise.
16. Remplacer les 10 chemins absolus /Users/bfontaine/... des Sources de 24-community-goals.md l.214-223 par des liens relatifs — fuite d'arborescence personnelle et bruit non cliquable dans un corpus destiné à être servi.
17. Corriger le libellé affirmatif de 09-combat-a-pied.md l.24 (« chronologie sourcée du vaisseau Nomad ») et l'affirmation README l.115-116 qui prétend un retrait non effectué.
18. Poser la règle d'exclusion à l'ingestion des sections `^#{2,6}\s*(Sources|Voir aussi|Ressources|Références)` : 69 sections, 11 102 mots qui couvrent lexicalement tout le corpus sans porter aucune réponse. Filtre par titre, aucune réécriture.
19. Fusionner les doubles « ## Voir aussi » de 09-combat-a-pied.md (l.12 et l.435) et 13-operations.md (l.28 et l.438) — seuls fichiers du corpus dans ce cas, et c'est ce doublon qui a laissé passer deux fois la formulation fautive sur le Nomad.
20. Lier 26-ingenierie-a-pied-avancee et 27-debuter-et-progresser depuis les guides thématiques (06, 07, 09, 13 pour le premier ; 03, 06, 08, 10, 11, 12, 20, 23 pour le second) : seul le README les cite aujourd'hui, ce qui prive notamment 26 de son rôle d'arbitre sur la taxonomie des matériaux Odyssey.
21. Lier BGS-Tally vers 16-outils.md à sa première occurrence dans 21-bgs.md (16 mentions dans le guide, 0 lien, alors que 16 pointe vers 21) et compléter le « Voir aussi » de 21 avec 11-commerce, 08-combat-spatial et 22-squadrons.

