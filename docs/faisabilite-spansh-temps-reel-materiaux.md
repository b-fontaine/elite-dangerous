# Trois pistes d'évolution : données galactiques, journal en temps réel, matériaux

> Étude de faisabilité — **19 août 2026**
> Toutes les mesures réseau datées ci-dessous ont été prises le 19/08/2026 ; les
> dumps concernés sont régénérés chaque nuit et **croissent de façon monotone** :
> aucune de ces tailles ne doit être codée en dur.

## Où en est la mise en œuvre — 20 août 2026

L'étude a été écrite avant tout code. Ce qui en a été tiré depuis :

| # de l'[ordre de mise en œuvre](#ordre-de-mise-en-œuvre) | État |
|---|---|
| 1 — `Genuses[]` de `SAASignalsFound` | ✅ fait, avec la table jeton → genre (les identifiants ne se calculent pas) |
| 2 — `systemAddress` sur `CommanderPosition` | ✅ fait |
| 3 — inventaire indexé sur `Name` | ✅ fait, étendu aux 108 matériaux de vaisseau |
| 4 — tri des fichiers journal par nom analysé | ✅ fait |
| 5 — `Died` et `Resurrect` | ✅ fait — `Died` est le déclencheur, `Resurrect` le filet |
| 6 — `materials.json`, `blueprints.json`, `MaterialPlan` | ✅ fait, avec l'écran qui va avec |
| 7 — veille du journal et onglet Dashboard | ✅ fait — onglet « Terrain », relecture toutes les 10 s, sans observateur de fichiers |
| 8 — `FSSDiscoveryScan` et compagnie | ✅ fait — plus `FSSAllBodiesFound`, `SAAScanComplete`, et `ScanType`/`WasDiscovered`/`WasMapped` sur `Scan` |
| 9 — client Spansh en lecture | ✅ fait — `/api/dump` et `/api/body`, cache sur `id64`, à la demande seulement |
| 10 — localisateur de trader et d'achat de Meta-Alloys | ⬜ à faire |
| 11 — routeur d'exobiologie | ⬜ facultatif |

Deux défauts de position sans rapport avec cette étude ont été corrigés au
passage : `Disembark` en station était traité comme un atterrissage planétaire,
et un vaisseau rappelé ou congédié à distance déplaçait le commandant avec lui.

Le lot 7 a demandé une correction qui n'était pas prévue par l'étude : le
journal était reparsé en entier à chaque fusion, deux fois. Acceptable pour une
synchronisation manuelle, intenable toutes les dix secondes — soixante mille
lignes de JSON pour en ajouter quatre. Le dépôt garde désormais le journal
analysé en mémoire et ne le reconstruit que lorsque le magasin est réécrit par
l'avant, c'est-à-dire au franchissement du plafond de lignes.

Trois lectures de `Status.json` que l'étude n'avait pas anticipées se sont
révélées nécessaires à l'usage : le fichier est tronqué et réécrit plusieurs
fois par seconde, il vaut `{"Flags":0}` au menu principal, et il n'a pas de
`Flags2` sur un client Horizons.

Le lot 9 a corrigé l'étude sur quatre points, tous relevés en interrogeant la
vraie API plutôt qu'en lisant le schéma :

1. **Les deux endpoints sont enveloppés**, ce que le schéma passe sous silence :
   `/api/dump/{id64}` répond `{"system": {…}}` et `/api/body/{id64}` répond
   `{"record": {…}}`. Un mappeur écrit d'après le schéma seul lit un objet vide
   et n'échoue nulle part.
2. **`/api/bodies/field_values/landmarks` existe et publie l'exhaustif** :
   347 sous-types, **64 types** et 24 variantes de couleur. C'est la source qui
   permet de trier la vie du reste par liste blanche — les 22 genres
   échantillonnables — plutôt que par liste noire. Sans elle, `Mollusc`,
   `Peduncle Pod` et `Gyre Tree` seraient passés pour des organismes récoltables
   et auraient reçu un prix.
3. **Le champ d'invalidation ne s'appelle pas pareil des deux côtés** :
   `signals.updateTime` dans le dump, `signals_updated_at` dans la fiche de
   corps. C'est la même date, et c'est bien elle qui périme une liste
   d'espèces.
4. **`signals.genuses` est parfois absent plutôt que vide** sur un corps qui
   porte des signaux non biologiques — Vénus et la Terre en sont deux exemples
   dans Sol.

Un cinquième point, celui-là à l'avantage de l'étude : les noms d'espèces de
Spansh (`Bacterium Tela`, `Roseum Brain Tree`, `Crystalline Shards`) sont
**exactement** ceux du catalogue embarqué. Valeur, portée de colonie et
conditions s'y accrochent sans traduction.

Trois points de la section [« ce qui reste à vérifier »](#ce-qui-reste-à-vérifier-avant-de-coder)
restent ouverts et sont signalés comme tels **dans l'application** plutôt que
tranchés : le coût en crédits d'un palier de combinaison, la fiche de Rosa
Dayette (ce qu'elle propose est vérifié, son système ne l'est pas), et le
chiffrage de la montée en réputation chez Farseer.

---

## Sommaire

- [Où en est la mise en œuvre](#où-en-est-la-mise-en-œuvre--20-août-2026)
- [Ce que l'application sait déjà faire](#ce-que-lapplication-sait-déjà-faire)
- [Question 1 — Une base de données de systèmes et des itinéraires maison](#question-1--une-base-de-données-de-systèmes-et-des-itinéraires-maison)
- [Question 2 — Le journal en temps réel et l'onglet « Dashboard »](#question-2--le-journal-en-temps-réel-et-longlet--dashboard-)
- [Question 3 — Le guide matériaux avancé](#question-3--le-guide-matériaux-avancé)
- [Ordre de mise en œuvre](#ordre-de-mise-en-œuvre)
- [Ce qui reste à vérifier avant de coder](#ce-qui-reste-à-vérifier-avant-de-coder)
- [Annexe A — Aide-mémoire des endpoints](#annexe-a--aide-mémoire-des-endpoints)
- [Annexe B — Sources](#annexe-b--sources)

---

## Ce que l'application sait déjà faire

Les trois questions ne partent pas de zéro. L'inventaire compte, parce qu'il
déplace le curseur : dans les trois cas, **la brique manquante est plus petite
que la question ne le laisse croire**.

| Brique existante | Où | Ce qu'elle apporte aux trois questions |
|---|---|---|
| `JournalEventParser` — **33 événements modélisés** | `lib/features/journal/domain/services/` | Y compris `ScanOrganic`, `SellOrganicData`, `FSSBodySignals`/`SAASignalsFound`, `Scan`, `ShipLocker`, `Materials`, et — ajoutés pendant que cette étude était en cours — les onze événements de position (`Location`, `FSDJump`, `CarrierJump`, `ApproachBody`, `LeaveBody`, `SupercruiseExit`, `StartJump`, `Docked`, `Undocked`, `Liftoff`, `Embark`). Ce qui manque encore : le tableau `Genuses[]` de `SAASignalsFound`, `FSSDiscoveryScan`, `FSSAllBodiesFound`, `SAAScanComplete`, `CodexEntry`, `Died`/`Resurrect`. |
| `JournalSessionAggregator` → `CommanderPosition` | `lib/features/journal/domain/` | Le système, le corps, la station et l'état (docké / posé / à pied) sont déjà dérivés du journal. **Il manque `systemAddress`** — la clé de toute requête Spansh. |
| `JournalFileDataSource` | `lib/features/journal/data/datasources/` | Sait déjà localiser les dossiers `Journal.*.log` sur Windows, macOS et Linux/Proton, et les lire en flux ligne à ligne. Il manque la **veille**, pas la lecture. |
| `ExobiologyActivityAggregator` | `lib/features/journal/domain/services/` | Calcule déjà `samplesInProgress` et `completedNotSold` — c'est-à-dire **exactement les données non vendues** que le « Dashboard » demandé doit afficher. Il manque le contexte « système courant ». |
| `assets/data/exobiology_catalog.json` | 118 espèces + 22 genres | Chaque espèce porte ses `conditions` : `planetClasses`, `atmospheres`, `volcanism`, `minTemperatureK`/`maxTemperatureK`, `maxGravityG`, plus la `colonyRangeMeters` du genre et les variantes par classe d'étoile. **C'est la moitié d'un routeur d'exobiologie** : il ne manque que les corps. |
| `SpeciesMatcher` + `BodyProfile` | `lib/features/exobiology/domain/` | Prend déjà un corps (classe, atmosphère, T°, gravité, volcanisme, nombre de signaux bio, classe de l'étoile parente) et rend les espèces possibles avec le critère resté invérifié. Alimenté aujourd'hui par le journal ou la saisie manuelle — **il accepterait n'importe quelle autre source de corps**. |
| `ExobiologyReferenceData.artemisGradeSteps` | `lib/features/exobiology/domain/services/` | Coûts matériaux Artemis G1→G5 déjà encodés. Il manque **où trouver chaque composant**. |
| `EngineerFsdIncreasedRangeRule` | `exobiology_roadmap_rules.dart` | Conseils génériques (Jameson, HGE, traders). **Aucune liste de matériaux par grade**, aucun localisateur. |
| `FileLineStore` (`journal.jsonl`) | `lib/core/storage/` | Append-only, plafonné, écriture atomique. Mais `events()` **re-parse tout le fichier** et `_merge()` le re-parse encore pour dédupliquer : un tick à 10 s coûterait O(historique). C'est le point à retoucher pour la Q2. |
| Couche réseau | `lib/core/network/` | Un seul hôte aujourd'hui (`companion.orerve.net`), throttlé à ~1 req/min par famille d'endpoint, avec `RetryInterceptor` et `DioErrorMapper`. La structure pour ajouter un second hôte existe (`NetworkModule` expose déjà deux `Dio` nommés). |

Deux contraintes structurantes, tirées du README et à ne pas perdre de vue :

1. **« Aucune partie serveur. »** Tout est embarqué ou sur l'appareil. Les trois
   réponses ci-dessous respectent cette règle, ou disent explicitement quand
   elles la mettent en cause.
2. **L'application est multi-plateforme**, téléphone compris — et le web ne
   peut ni lire de fichiers ni se connecter à Frontier. Toute fonctionnalité
   « temps réel » est donc, par construction, **une fonctionnalité de bureau**
   qui doit dégrader proprement ailleurs.

---

## Question 1 — Une base de données de systèmes et des itinéraires maison

> *« Ne peut-on pas partir de spansh/elite_dangerous_schemas et/ou de son API
> pour avoir une base de données à jour des systèmes et calculer nous-même les
> itinéraires pour la découverte et l'exobiologie ? »*

**Réponse courte : oui pour les itinéraires, non pour la base de données.** Et
il existe un troisième geste, plus petit que les deux, qui apporte l'essentiel
de ce que la question cherche.

### 1.1 Ce que Spansh publie réellement

`spansh.co.uk/dumps` publie **exactement 14 fichiers `.json.gz`**, chacun décrit
par un JSON Schema hébergé sur `docs.spansh.co.uk` et miroité sur GitHub
(licence MIT). Les dumps de la famille *galaxy* sont régénérés vers 05:38 GMT,
ceux de la famille *systems* et *factions* vers 08:08 GMT ;
`galaxy_stations.json.gz` est explicitement « updated at least every hour »
(deux `Last-Modified` intra-horaires observés le même jour le confirment).

Tailles **compressées**, mesurées par `HEAD` sur `downloads.spansh.co.uk` le
19/08/2026 :

| Fichier | Taille | Contenu |
|---|---:|---|
| `galaxy.json.gz` | **115,8 Go** | Toute la galaxie, corps et stations compris |
| `galaxy_1month.json.gz` | 5,88 Go | Systèmes dont *une* information a changé sous 32 jours |
| `galaxy_7days.json.gz` | 2,94 Go | idem, 7 jours |
| `galaxy_1day.json.gz` | 1,21 Go | idem, 24 h |
| `galaxy_populated.json.gz` | 4,32 Go | Systèmes peuplés uniquement |
| `galaxy_stations.json.gz` | 4,29 Go | Stations (rafraîchi < 1 h) |
| `systems.json.gz` | 6,24 Go | `id64`, `name`, `mainStar`, `coords`, `updateTime` — **sans corps ni stations** |
| `systems_6months.json.gz` | 688 Mo | delta 6 mois |
| `systems_neutron.json.gz` | 178 Mo | systèmes à étoile principale à neutrons |
| `systems_1month.json.gz` | 120 Mo | delta 1 mois |
| `systems_2weeks.json.gz` | 55 Mo | delta 2 semaines |
| `systems_1week.json.gz` | 26 Mo | delta 1 semaine |
| `systems_1day.json.gz` | **3,15 Mo** | delta 24 h |
| `factions.json.gz` | 16,4 Mo | factions |

Deux prémisses de la question sont obsolètes : **`systems.csv` n'existe pas**
(404 sur `systems.csv`, `systems.csv.gz`, `galaxy.csv.gz`), et le dump complet
des corps d'EDSM (`bodies.json.gz`) **a été retiré vers 2020** — il ne reste
qu'un incrémental 7 jours.

Le format est un détail qui compte : ce sont des **tableaux JSON « pretty
printed » à raison d'un système par ligne** — ligne 1 = `[`, puis `\t{…},` par
système, dernière ligne `]`. Le schéma officiel le dit explicitement
(« Pretty printed to show one system per line »). On peut donc les parser en
flux, ligne à ligne, sans jamais décoder le fichier entier — en sautant la
première et la dernière ligne, en retirant la tabulation initiale et la virgule
finale. Ce n'est **pas** du JSONL littéral. La ligne la plus longue mesurée fait
1 289 376 caractères : prévoir un tampon de ~2 Mo par ligne.

### 1.2 Pourquoi un miroir local est hors de portée

`galaxy.json.gz` seul pèse plus que le stockage total de la plupart des
téléphones. Même `systems.json.gz`, qui ne contient que les coordonnées
(6,24 Go compressés), exige un prétraitement que seule une machine dédiée peut
faire. **Aucun de ces fichiers ne doit être téléchargé par l'application.**

Cela ferme la porte à l'idée de « base de données à jour des systèmes »
embarquée — au moins à l'échelle galactique. Une variante réduite reste
possible, et j'y reviens en 1.5.

Ce qui *serait* entretenable, si l'on acceptait un serveur : `systems_1day.json.gz`
à 3,15 Mo/jour permet de maintenir un miroir des coordonnées de systèmes pour
un coût dérisoire (91 243 systèmes mis à jour dans le delta du 18/08/2026, zéro
doublon, `updateTime` bien borné sur ~24 h). Mais c'est un serveur, et le projet
n'en a pas.

### 1.3 Ce qui est vraiment exploitable depuis l'application

Quatre familles d'endpoints, dont une seule est documentée — et ce n'est pas la
plus utile.

**(a) La lecture unitaire — documentée, synchrone.**
`api.openapi.json` (v2.3.2, servi par `docs.spansh.co.uk`) décrit **quatre**
endpoints, tous en `GET` :

```
GET https://spansh.co.uk/api/dump/{id64}      # le système complet, corps compris
GET https://spansh.co.uk/api/system/{id64}
GET https://spansh.co.uk/api/body/{id64}
GET https://spansh.co.uk/api/station/{marketId}
```

C'est peu, et c'est beaucoup : **`id64` est exactement le `SystemAddress` que le
journal écrit dans `Location`, `FSDJump` et `CarrierJump`**. Une requête, un
système, ses corps.

Et `GET /api/body/{id64}` va plus loin que prévu : il rend un tableau
**`landmarks`** qui nomme l'**espèce**, sa **variante de couleur**, sa **valeur**
et sa **latitude/longitude**. Vérifié sur « 36 Ophiuchi C 4 » : 45 landmarks,
dont 23 × `{type: 'Bacterium', subtype: 'Bacterium Tela', variant: 'Yellow',
value: 1949000}` et 20 × `{type: 'Stratum', subtype: 'Stratum Tectonicas',
variant: 'Lime', value: 19010800}` — plus deux landmarks non biologiques
(`Surface Station`) à filtrer.

**(b) Les endpoints de recherche — non documentés, et c'est là que tout se joue.**

```
POST https://spansh.co.uk/api/bodies/search       # corps, filtrables et triables
POST https://spansh.co.uk/api/stations/search     # stations, par service
POST https://spansh.co.uk/api/systems/search
GET  https://spansh.co.uk/api/{bodies|stations|systems}/field_values/{champ}
GET  https://spansh.co.uk/api/nearest?x=&y=&z=    # synchrone
```

`bodies/search` accepte exactement le filtrage que la question appelle. Requête
vérifiée le 19/08/2026 :

```json
{"filters":{"is_landable":{"value":"true"},
            "atmosphere":{"value":["Thin Sulphur dioxide","No atmosphere"]},
            "gravity":{"min":"0.04","max":"0.6"},
            "surface_temperature":{"min":"150","max":"450"},
            "distance":{"min":"0","max":"80"},
            "genuses":{"value":["Stratum"]}},
 "sort":[{"distance":{"direction":"asc"}}],
 "size":3,"page":0,"reference_system":"Sol"}
```

→ `count: 59`, résultats tous dans les bornes, triés par distance depuis Sol.
Conventions : valeurs catégorielles en `{"value":[…]}`, plages numériques en
`{"min":…,"max":…}`, rayon via le filtre `distance` **plus** `reference_system`.
`field_values/landmarks` expose trois axes (81 `subtype`, 65 `type`, `variant`)
qui incluent `Crystalline Shards`, `Brain Tree`, `Bark Mounds`, `Crashed Ship`,
`Wrecked Ship`, `Guardian Ruin`, `Fumarole`, `Geyser`, `Lava Spout`,
`Abandoned Base` — **avec leurs latitudes et longitudes**. C'est la brique d'un
catalogue de lieux de terrain, et elle sert autant l'exobiologie (question 1)
que le farm de matériaux (question 3).

Trois pièges mesurés : le paramètre `fields` est **ignoré** (les 46 clés
reviennent toujours, dont le marché complet de chaque station : **100 à 130 Ko
par station**, 355 Ko pour trois) ; la forme du filtre varie d'un champ à
l'autre (`services` attend `[{"name":"…"}]`, `material_trader` attend
`{"value":["…"]}` — et une forme incorrecte est **silencieusement ignorée**, pas
rejetée) ; et `count` plafonne à 10 000.

**(c) Les routeurs — fonctionnels, non documentés, asynchrones.**
Le motif, vérifié en direct :

```
POST https://spansh.co.uk/api/route?efficiency=60&range=50&from=Sol&to=Colonia
  → 202 {"job":"B122CB4E-…","status":"queued"}
GET  https://spansh.co.uk/api/results/{job}
  → 202 {"state":"started"}     (tant que la file tourne)
  → 200 {"result":{"system_jumps":[…]}}
```

`POST /api/exobiology/route` suit le même motif, avec **une différence qui coûte
une soirée si on l'ignore : il refuse le JSON.** Un corps `application/json`,
même parfaitement valide, renvoie `400 {"error":"from, range, radius and
max_results are required"}` ; les mêmes paramètres en **form-encoded** rendent
`202`. Les neuf paramètres réellement acceptés, lus dans le code du site puis
vérifiés un par un : `from`, `range`, `radius`, `max_results` (obligatoires),
puis `to`, `max_distance`, `min_value` (défaut 10 000 000 Cr), `avoid_thargoids`,
`loop`. Tout paramètre inventé est **ignoré sans erreur**. Le résultat rend des
waypoints portant `bodies[]`, chaque corps ayant `estimated_scan_value`,
`estimated_mapping_value`, `landmark_value` et ses `landmarks` agrégés par
`count` (sans lat/lon, contrairement à `bodies/search`).

La latence est à connaître avant de dessiner une interface : **Sol → Colonia a
demandé 29 sondages, soit ~145 s.** Ce n'est pas un appel, c'est une tâche de
fond avec un écran d'attente.

**(d) Ce qui n'existe pas.** Aucun endpoint documenté au-delà des quatre `GET` :
`https://spansh.co.uk/api`, `/api/`, `/api/docs`, `/api/openapi.json` renvoient
tous 404. Aucun rate limit, aucune ToS, aucune politique de stabilité publiée.
Deux `502` nginx et un *read timeout* ont été observés en quelques minutes de
sondage : un client Dart doit traiter tout code ≠ 202/200 comme réessayable,
avec back-off et une échéance de plusieurs minutes.

> ⚠️ **Spansh n'émet aucun en-tête CORS.** Avec un `Origin` explicite, la
> réponse ne porte que `content-type` et `vary` ; le préflight `OPTIONS` rend
> `204` avec le seul `allow: GET, HEAD, POST`. **La cible web est donc exclue**
> pour tout ce qui précède — ce qui, dans ce projet, n'est pas un drame : le web
> ne peut déjà ni lire les journaux ni se connecter à Frontier. Mais cela impose
> que la couche Spansh soit optionnelle et remplaçable, et non un socle.

Enfin, une nuance sur les schémas : les deux copies décrivent les **mêmes 43
propriétés de corps** et 24 propriétés de système, mais **la copie
`docs.spansh.co.uk` n'est pas auto-suffisante** — ses 26 `$ref` pointent vers
un chemin `#/paths/…` absent du fichier (vestige d'une extraction depuis
`openapi.json`), donc **non résolvables tels quels**. Pour générer des modèles
Dart, utiliser **la copie GitHub** et ses `definitions` propres ; la copie
`docs` reste plus précise sur deux points (elle sépare `subType` en 18 valeurs
de planète et 43 d'étoile via `anyOf`, là où GitHub aplatit 61 valeurs). Des
URLs épinglables existent : `https://docs.spansh.co.uk/[version]/[fichier]`.


### 1.4 Les alternatives, et ce qu'elles ne donnent pas

| Source | Ce qu'elle est | Verdict pour ce projet |
|---|---|---|
| **EDDN** (`tcp://eddn.edcd.io:9500`) | Relais **live** ZeroMQ, sans TLS, sans persistance. Abonnement au topic vide `''`, filtrage côté client, décompression zlib de chaque message. Le README est catégorique : « does not store any data, and thus makes no archive or "current state" available to anyone ». | **Inexploitable depuis un client.** C'est un tuyau qu'il faut opérer et persister soi-même. |
| **EDSM — dumps nocturnes** | `bodies.json.gz` → **404** (retiré ~2020) ; seul `bodies7days.json.gz` existe (268 Mo). `systemsWithCoordinates.json.gz` 3,64 Go, `stations.json.gz` 2,72 Go, `codex.json.gz` 375 Mo. | Accumuler des deltas 7 jours **n'atteint jamais la complétude** sans la base 2020 retirée. |
| **EDSM — API** | `sphere-systems` rayon **max 100 al** (au-delà : corps vide, pas de clamp), `cube-systems` arête **max 200 al** (clamp silencieux au-delà), `/api-v1/systems` fenêtre incrémentale **3 jours max**. Les pages de doc sont derrière Cloudflare (403) mais les endpoints répondent à un `curl` nu. | **La seule primitive de moissonnage local raisonnable** : un cube de 200 al autour de Sol rend 14 772 systèmes en 864 Ko. Voir 1.5. |
| **EDSM — corps** | `api-system-v1/bodies` donne `gravity`, `surfaceTemperature`, `surfacePressure`, `atmosphereType`, `atmosphereComposition`, `volcanismType`, `solidComposition`, `materials`, `isLandable`… | **Aucun champ de signal biologique.** Vérifié sur quatre systèmes : aucune occurrence de `signal`, `bio`, `genus`, `species` ni `organic`. Suffisant pour le `SpeciesMatcher`, insuffisant pour savoir *s'il y a* de la biologie. |
| **Ardent Insight** (`api.ardent-insight.com/v2/`) | REST public, **entièrement anonyme**, versionné, AGPL-3.0, 193 161 786 systèmes, CORS qui renvoie l'`Origin` (donc Flutter Web fonctionne). Dix services « nearest », dont `material-trader`. | **La plus facile à consommer**, et la seule qui marche sur le web. Mais l'enregistrement système est minimal (nom, `systemAddress`, x/y/z, secteur) et **aucune donnée biologique** : son endpoint `/bodies` est un proxy EDSM à liste blanche de 38 champs, un champ `signals` ne pourrait structurellement pas remonter. Le README dit « does not *currently* enforce any rate limits » + « respectful use is appreciated » — à traiter comme une politesse, pas une garantie. |

### 1.5 Verdict et architecture proposée

Trois niveaux d'ambition, cumulables, du moins cher au plus cher.

**Niveau 0 — liens profonds, zéro réseau nouveau.**
Les étapes de la feuille de route pointent déjà vers Spansh et INARA en texte
(« Recalculer les routes sur Spansh », « INARA → Find Trade Offer »). En faire
des liens profonds pré-remplis avec l'état réel du commandant (système courant,
portée de saut lue dans `Loadout`) coûte quelques lignes et supprime la moitié
de la friction. **C'est le meilleur rapport valeur/risque du document.**

**Niveau 1 — un client Spansh en lecture, dans le domaine.**
Un `SpanshApi` Retrofit sur un troisième `Dio` nommé, et un
`SystemLookupRepository` qui expose `Future<Result<SystemSnapshot>> system(int id64)`.
Points d'attention, tous imposés par ce qui précède :

- **Un `Dio` séparé, jamais celui de Frontier.** `CapiThrottleInterceptor` est
  une règle Frontier (1 req/min par famille) : l'appliquer à Spansh serait
  absurde. Prévoir en revanche un throttle propre, un `User-Agent` qui identifie
  l'application (c'est la seule courtoisie disponible en l'absence de ToS), et
  un back-off qui traite 502 et timeout comme réessayables.
- **Le cache est obligatoire, pas optionnel.** Un système déjà interrogé ne
  change pas d'un jour sur l'autre pour ce qui nous intéresse (corps, atmosphère,
  gravité). Un `KeyValueStore` indexé par `id64`, ou un `LineStore` dédié,
  suffit.
- **La dégradation doit être un état de première classe**, pas un `catch`. Le
  `Result`/`Failure` du projet est déjà fait pour ça ; l'écran doit savoir dire
  « Spansh injoignable, voici ce que le journal sait ».

**Niveau 2 — un index de proximité local, borné.**
Si l'objectif est de *calculer soi-même* des itinéraires, il ne faut pas toute
la galaxie : il faut les coordonnées des systèmes de la zone de jeu. L'API
`cube-systems` d'EDSM en donne 14 772 en 864 Ko pour une arête de 200 al. Un
pavage de quelques cubes couvre la Bulle pour quelques mégaoctets — parfaitement
embarquable, et suffisant pour un routeur de saut maison (Dijkstra/A* sur un
graphe de portée). C'est réaliste, et c'est le seul chemin vers un calcul
d'itinéraire hors ligne.

Mais il faut être lucide sur ce que cela ne donne pas : **un routeur
d'exobiologie a besoin des corps, pas des systèmes.** Les corps ne sont
disponibles ni chez EDSM (pas de dump complet), ni chez Ardent (pas de signaux),
et chez Spansh seulement au prix des 115,8 Go — ou d'une requête unitaire par
système. Autrement dit : **le routage d'exploration pure (portée, étoiles à
neutrons) est faisable en local ; le routage d'exobiologie, non.** Pour ce
dernier, `POST /api/exobiology/route` de Spansh est la réponse, avec son job
asynchrone et son contrat non documenté.

### 1.6 Le geste qui rapporte le plus : le système courant, pas la galaxie

L'application possède déjà 118 espèces avec leurs conditions et un matcher qui
les applique à un corps. Ce qui lui manque, ce n'est pas une base galactique —
c'est *le corps devant elle*. Et depuis que le code suit la position du
commandant (`CommanderPosition`, ajouté en cours de route), la boucle se ferme
en une requête :

```
Journal local (Location / FSDJump / CarrierJump)  →  SystemAddress = id64
        │
        ├─ GET /api/dump/{id64}   (Spansh, documenté, synchrone, mis en cache)
        │        └→ les corps du système : landable, atmosphère, gravité,
        │           température, volcanisme, distance… ET signals.genuses
        │
        ├─ GET /api/body/{id64}   sur les corps intéressants
        │        └→ landmarks : ESPÈCE, variante, valeur, latitude/longitude
        │
        ├─ SpeciesMatcher (déjà écrit)  → en repli, quand Spansh ne répond pas
        │
        └─ ExobiologyActivityAggregator (déjà écrit)  → ce qui est déjà
                 échantillonné ou vendu ici
                          ↓
        « Dans ce système : 3 corps à signaux bio, Stratum Tectonicas sur A 3
          (19,0 M Cr, jamais vendue, lat -36,7 / long -99,0), 1 espèce
          échantillonnée 2/3 — valeur en attente 41 M Cr »
```

Une requête réseau par système visité, mise en cache, sur des endpoints dont le
principal est **documenté**. Pas de dump, pas de serveur, pas de base de
données. C'est la version réaliste de « calculer nous-même », et c'est ce que je
recommande de construire en premier.

Deux détails d'implémentation qui évitent des bugs :

- **`CommanderPosition` ne porte pas `systemAddress`**, alors que `LocationEvent`
  l'a. Or l'`id64` est la clé de *toutes* les requêtes Spansh. C'est un champ à
  ajouter, et c'est le seul prérequis de ce qui précède.
- **Deux conventions de nommage coexistent chez Spansh** : le dump et
  `/api/dump/{id64}` sont en `camelCase` (`atmosphereType`, `surfaceTemperature`,
  `isLandable`), tandis que `bodies/search` et `/api/body/{id64}` sont en
  `snake_case` (`atmosphere`, `surface_temperature`, `is_landable`). Deux modèles
  de désérialisation, donc — ou un mappeur explicite.
- **Deux formats de date coexistent aussi** : `updateTime` vaut
  `"2026-08-19 05:09:43+00"` (espace, pas de `T`) alors que le schéma le déclare
  `format: date-time` ; `DateTime.parse` de Dart accepte l'espace, mais un
  parseur ISO strict échouerait. Et `signals.updateTime` est **indépendant** de
  `body.updateTime` (9 jours d'écart mesurés) : c'est lui qui doit invalider un
  cache d'exobiologie.

### 1.7 Le verrou est levé : les signaux biologiques sont bien dans les données

C'était le point à trancher, et il est tranché — par lecture directe du schéma
et de données réelles.

Chaque corps porte un objet `signals` à trois propriétés, `additionalProperties:
false` :

```json
"signals": {
  "genuses": ["$Codex_Ent_Stratum_Genus_Name;"],
  "signals": {"$SAA_SignalType_Biological;": 1, "$SAA_SignalType_Human;": 1},
  "updateTime": "2026-08-10 19:38:53+00"
}
```

- **`genuses` est un enum fermé de 21 tokens** de codex. Sur une tranche réelle
  de 272 Mo de `galaxy_1day.json`, 19 tokens distincts apparaissent, **tous dans
  l'enum** — aucune violation. Les deux absents sont simplement les plus rares
  (`Tube_Name` → Sinuous Tubers, 6 773 corps ; `Vents_Name` → Amphora Plant, 693).
- **`signals.signals` n'est pas un enum** : c'est une map libre. Les clés
  observées sont `$SAA_SignalType_{Geological,Human,Biological,Thargoid,Other,
  Guardian};`. Celle qui compte est littéralement
  `"$SAA_SignalType_Biological;"`.
- **Le dump ne contient aucune donnée d'espèce** — seulement le genre. Sur les
  272 Mo : « Stratum Tectonicas » 0 occurrence, `landmarks` 0, `variant` 0. Les
  espèces n'existent que dans l'**API** (`landmarks`), pas dans les dumps.

Trois mises en garde à retenir :

1. **L'enum n'est pas exhaustif du jeu.** Un 22e genre,
   `$Codex_Ent_Ingensradices_Genus_Name;` (« Radicoida », espèce unique
   « Radicoida Unica »), existe en jeu depuis 2026 et **ne figure pas** dans
   l'enum Spansh. Le catalogue embarqué de l'application, qui compte 22 genres
   et 118 espèces, est donc lui aussi à compléter.
2. **Les tokens ne se déduisent pas des noms d'affichage.** Six correspondances
   sont contre-intuitives : `Sphere` → Anemones, `Brancae` → Brain Trees,
   `Cone` → Bark Mounds, `Ground_Struct_Ice` → Crystalline Shards, `Vents` →
   Amphora Plant, `Tube` → Sinuous Tubers. Aucune table officielle ne les
   publie : elles se tabulent, elles ne se calculent pas. Même problème pour les
   genres eux-mêmes (`Shrubs` → « Frutexa », `Cactoid` → « Cactoida »,
   `Fonticulus` → « Fonticulua »).
3. **Ne pas tester sur Sol ou Deciat.** Tous leurs corps porteurs de signaux ont
   `genuses: []` — la bulle habitée est saturée de signaux `Human` et
   `Geological` sans biologie. Un bon échantillon : 36 Ophiuchi
   (`id64 1865903245675`).

Reste une limite honnête : la physique planétaire du dump est peuplée à ~100 %
sur les corps porteurs de biologie (mesuré sur 100 corps : `is_landable`,
`atmosphere`, `gravity`, `surface_temperature`, `surface_pressure`,
`atmosphere_composition`, `subtype` tous à 100/100 — **sauf `volcanism_type`,
renseigné 9 fois sur 100**), mais rien ne prouve qu'elle suffise à discriminer
l'**espèce** à l'intérieur d'un genre. Ce que fait déjà le `SpeciesMatcher` reste
donc une prédiction ; l'API `landmarks`, elle, donne la réponse.


---

## Question 2 — Le journal en temps réel et l'onglet « Dashboard »

> *« Pourrait-on mettre à jour le journal à intervalles réguliers (toutes les
> 10 secondes) pour afficher l'emplacement actuel du pilote et s'il y a une
> découverte et de l'exobiologie à faire dans le système en cours, en tenant
> compte de ce qui a déjà été analysé ? Un onglet Dashboard avec les données
> non encore vendues. »*

**Oui, et 10 secondes est le bon ordre de grandeur.** Mais la lecture continue
du journal n'est pas « le même import, en boucle » : les trois lecteurs de
référence de l'écosystème (EDMC, EDDI, EliteJournalReader) ont chacun résolu une
demi-douzaine de pièges que l'implémentation actuelle n'a pas à connaître, parce
qu'elle importe un dossier figé.

### 2.1 Ce que le jeu écrit, et comment le lire

Source primaire : le **Journal Manual v38** de Frontier (mai 2026 — c'est la
dernière version publiée ; v39 et au-delà renvoient 404). Il est catégorique sur
la structure et **muet sur tout le reste** : pas une occurrence de « flush », de
« buffer » ni de « lock » au sens fichier. Tout ce qui est opérationnel vient du
code des lecteurs — et ils convergent.

**Nommage et rotation.** Deux motifs coexistent :

```
Journal.220315152335.01.log          ← ancien (Horizons / Legacy)
Journal.2022-03-15T152503.01.log     ← actuel, depuis Odyssey Update 11 (15/03/2022)
```

Les préfixes `JournalAlpha` et `JournalBeta` existent aussi. Un nouveau fichier
est ouvert **au démarrage du client** (avec une ligne d'en-tête `Fileheader`
portant `part`, `odyssey`, `gameversion`, `build`, `language`) et **à 500 000
lignes** — seul seuil de rotation documenté, exprimé en lignes et non en octets,
signalé par un événement `Continued` qui porte le numéro de la part suivante.

> ⚠️ **Un défaut présent dans le code actuel.** `JournalFileDataSource`
> classe les fichiers par `b.path.compareTo(a.path)`, c'est-à-dire un tri
> lexical décroissant. Dans un dossier contenant les deux motifs — le cas de
> tout commandant ayant joué avant et après mars 2022 — ce tri est **faux** :
> `"Journal.22…"` passe avant `"Journal.2022-…"` parce que `'2' > '0'` au
> troisième caractère. Le fichier annoncé comme « le plus récent » est alors un
> fichier de 2022. EDMC a corrigé exactement ce bug dans ses versions 5.3.3 et
> 5.3.4, avec le commentaire « So we can no longer use a naive sort ».
> Aujourd'hui l'impact est limité (l'import prend tous les fichiers, l'ordre ne
> sert qu'à l'affichage) ; pour une veille qui doit désigner *le* fichier
> courant, il devient bloquant.
>
> Les trois stratégies de référence : EDMC prend le `getctime` maximal ; EDDI
> trie par `LastWriteTime` décroissant en forçant un `Refresh()` du cache de
> métadonnées ; EliteJournalReader **analyse le nom** (les deux formats), groupe
> par session, puis ordonne les parts **numériquement**. La troisième est la plus
> juste, et c'est celle à porter : analyser le nom, retomber sur la date de
> modification en cas d'échec.

**Le fichier n'est pas verrouillé.** Les trois lecteurs l'ouvrent en partage
lecture+écriture pendant que le jeu tourne (`FileShare.ReadWrite` en .NET,
`open(logfile, 'rb', 0)` non tamponné en Python). Côté Dart,
`file.openRead(start, end)` fonctionne dans les mêmes conditions. La taille
progresse de façon observable : EDDI ne détecte les ajouts *que* par delta de
`FileInfo.Length`, toutes les 100 ms.

**Le risque de ligne incomplète est réel mais bien cerné.** EliteJournalReader
a ajouté (août 2026) un `JournalRecordFramer` qui ne valide l'offset que jusqu'au
**dernier `\n`**, conserve les octets en attente entre deux lectures, et gère le
BOM UTF-8 et le CR : « Only dispatches complete newline-terminated records and
never commits partial data ». EDMC, à l'inverse, ne traite pas le cas et perdrait
la ligne. C'est une dizaine de lignes de code, et c'est la seule chose qui
sépare une veille fiable d'une veille qui perd un `ScanOrganic` de temps en
temps : **à faire dès le premier jet.**

**Polling ou watcher ?** La réponse de l'écosystème est nette : **polling**, et
watcher au mieux en complément.

| Lecteur | Journal | Status.json |
|---|---|---|
| **EDMC** | Watchdog **uniquement pour détecter un nouveau fichier** ; le contenu est toujours lu par *tail* à **1 s** (`_POLL = 1`, `_INACTIVE_POLL = 10` quand le jeu ne tourne pas) | Watchdog **seulement sur Windows** ; polling 1 s partout ailleurs |
| **EDDI** | **Aucun watcher.** Polling pur : 100 ms si le jeu tourne, 5 s sinon | Polling 250 ms / 5 s |
| **EliteJournalReader** | `FileSystemWatcher` **plus** polling de croissance à 500 ms **plus** redécouverte du répertoire à 5 s | S'appuie sur l'événement `Changed` du watcher |

La raison est citée mot pour mot par EDMC, deux fois : « File system events are
unreliable/non-existent over network drives on Linux. We can't easily tell
whether a path points to a network drive, so assume any non-standard logdir
might be on a network drive and poll instead. » Sa règle effective : dès que
l'utilisateur configure un répertoire personnalisé hors Windows, le watcher est
désactivé — **exactement le cas de ce projet, où le chemin est saisi à la main
et où Linux/Proton est une cible de premier plan.**

Conclusion pour l'application : **un `Timer.periodic` de 10 s, sans watcher.**
C'est plus lent que les 100 ms d'EDDI, et c'est suffisant : l'objectif n'est pas
un HUD, c'est « dans quel système suis-je et qu'y a-t-il à faire ». Ajouter un
watcher n'apporterait que de la complexité et un mode de défaillance silencieux.

**Status.json est la meilleure source pour « où suis-je ».**
Le fichier entier est réécrit à chaque changement, sur une seule ligne portant
`"event":"Status"`, « every few seconds » selon Frontier, « approximately every
second » selon EliteJournalReader. Champs utiles ici : `BodyName`,
`Latitude`/`Longitude`/`Altitude`/`Heading` (« if on or near a planet »),
`Destination{System, Body, Name}`, `Flags`/`Flags2`, `Fuel`, `Balance`,
`LegalState`, et à pied `Oxygen`, `Health`, `Temperature`, `Gravity`. Les seuils
de déclenchement positionnels sont chiffrés : **0,02° de latitude/longitude en
vol, 0,0005° en SRV.**

Deux pièges, confirmés par les trois implémentations :

1. **Le fichier peut être lu vide ou partiel**, parce qu'il est tronqué puis
   réécrit en place. EDMC teste `if data:` avec le commentaire « Can be empty if
   polling while the file is being re-written » ; EliteJournalReader réessaie
   jusqu'à 5 fois sur `IOException` **et** `JsonException` (« it could be that we
   are trying to read at the exact same time the game is writing a new
   status.json ») ; EDDI attend simplement la passe suivante. **Un `Result` en
   échec sur un tick n'est pas une erreur, c'est le fonctionnement normal.**
2. **Le fichier est partagé entre client beta et client live.** EDMC filtre sur
   `entry_timestamp >= self.session_start` (le timestamp du `LoadGame`).

**Dix fichiers d'état coexistent** dans le même dossier, chacun avec un
événement déclencheur littéral : `Status.json` (sans événement), `Cargo.json` ←
`Cargo`, `Market.json` ← `Market`, `Outfitting.json` ← `Outfitting`,
`Shipyard.json` ← `Shipyard`, `NavRoute.json` ← `NavRoute` (vidé sur
`NavRouteClear`), `ModulesInfo.json` ← `ModuleInfo` (événement au singulier,
fichier au pluriel), `ShipLocker.json` ← `ShipLocker`, `Backpack.json` ←
`Backpack` et `Resupply`, `FCMaterials.json` ← `FCMaterials`.

> ⚠️ **Conséquence directe et importante pour ce projet.** L'application lit
> l'inventaire à pied dans l'événement `ShipLocker` du journal. Le manuel
> précise que la liste complète n'y est écrite **qu'au démarrage et à
> l'embarquement** ; le reste du temps l'événement est un simple marqueur et le
> contenu n'est que dans `ShipLocker.json`. EDMC note même que **depuis la
> version 4.0.0.400 le jeu écrit un événement `ShipLocker` vide**. Le parseur du
> projet a déjà vu venir la moitié du problème — `ShipLockerEvent.isEmpty`
> distingue « ne porte rien » de « n'a rien dit » — mais personne ne lit le
> fichier. La lecture actuelle fonctionne donc pour un import ou une
> synchronisation cAPI (qui attrapent le démarrage de session), mais **une veille
> ne verrait plus l'inventaire évoluer** : il faut lire `ShipLocker.json`. C'est aussi la
> condition pour que le guide matériaux de la question 3 soit à jour en cours de
> session.
>
> Et il y a un décalage à absorber : l'événement du journal arrive **avant** que
> le fichier annexe soit à jour. EDMC réessaie 11 fois pour `NavRoute` et
> `FCMaterials`, en rejetant l'écart au-delà de 5 secondes, et 5 fois avec 10 ms
> de pause pour `ShipLocker`, en attrapant `FileNotFoundError` **et**
> `JSONDecodeError`.

**Deux détails à connaître au démarrage de la veille.** Aucun des trois lecteurs
ne persiste son offset entre deux exécutions : ils relisent le fichier courant.
Cette application, qui persiste déjà son journal et sait dédupliquer, peut faire
mieux — mais elle doit alors gérer la reprise elle-même (fichier + offset). Et
comme le jeu réécrit `Statistics`, `EngineerProgress`, `Loadout`, `Reputation`,
`ShipLocker` et `Powerplay` à chaque démarrage de session, **la veille récupère
gratuitement l'état courant du commandant** dès que le pilote lance le jeu — ce
que la synchronisation cAPI va aujourd'hui chercher à 90 jours de distance.

### 2.2 La sémantique des événements : ce qui est déjà là, ce qui manque

Le parseur a beaucoup avancé pendant que cette étude était en cours : il modélise
désormais **33 événements**, dont `Location`, `FSDJump`, `CarrierJump`,
`ApproachBody`, `LeaveBody`, `SupercruiseExit`, `StartJump`, `Docked`,
`Undocked`, `Liftoff`, `Embark` — et `JournalSessionAggregator` en dérive une
`CommanderPosition`. Le trou de la localisation est comblé. Voici ce qui reste,
et les règles non triviales à respecter.

**Ce qui manque encore, par ordre de valeur :**

| Manque | Ce qu'il apporterait |
|---|---|
| **`Genuses[]` de `SAASignalsFound`** | La **liste des genres réellement présents** sur un corps, sans passer par Spansh. `FSSBodySignals` et `SAASignalsFound` partagent aujourd'hui le handler `_bodySignals`, qui ne lit que `BodyID`, `SystemAddress` et `Signals[]` — `grep -rn Genuses lib/` ne rend rien. **C'est le plus gros gain pour l'effort le plus faible de tout ce document.** |
| `FSSDiscoveryScan` + `FSSAllBodiesFound` | Savoir si le système est **entièrement découvert**, et donc s'il reste quelque chose à faire au FSS. |
| `SAAScanComplete` | Savoir qu'un corps vient d'être **cartographié**, avec `ProbesUsed` / `EfficiencyTarget`. |
| `Scan.WasDiscovered` / `Scan.WasMapped` | Savoir si un corps était **déjà découvert ou cartographié** avant vous — donc si la prime de première découverte est encore là. |
| `CodexEntry` | Savoir si l'espèce est une **première pour le commandant** (`IsNewEntry`), avec sa `Region`, sa latitude et sa longitude. |
| `Died` + `Resurrect` | Distinguer les données bio **vendues** de celles **perdues à la mort** — voir plus bas. |
| `Continued` | Suivre la rotation de fichier proprement. |

**Les règles non triviales, toutes vérifiées sur sources primaires :**

- **Le système courant ne vient que de trois événements** — `FSDJump`,
  `CarrierJump`, `Location`. C'est la règle normative qu'EDDN impose à tous ses
  contributeurs (« You MUST add a StarPos array containing the system
  co-ordinates from the last FSDJump, CarrierJump, or Location event »). En
  conséquence, `FSSBodySignals`, `SAASignalsFound`, `SAAScanComplete` et
  `ScanOrganic` **ne portent que `SystemAddress`, jamais le nom du système** : il
  faut le mémoriser. `CommanderPosition` fait déjà cela.
- **`Location` est bien écrit à chaque démarrage** (« at startup, or when being
  resurrected at a station »), mais **pas après une rotation de fichier** : un
  lecteur qui n'ouvre que le dernier fichier perd système et corps jusqu'au
  prochain saut.
- **Le suivi du corps courant a des règles contre-intuitives**, qu'EDMC
  documente dans son code : `ApproachBody` pose le corps, `LeaveBody` l'enlève,
  `SupercruiseExit` **ne change rien** (« does not indicate any change of
  presence near a Body »), et `SupercruiseEntry` **ne libère pas** le corps sauf
  s'il s'agissait d'une station — « because we won't get a fresh ApproachBody if
  we don't leave Orbital Cruise but land again ». Le commentaire d'EDMC est sans
  ambiguïté sur la conclusion : « The only way to check for this is to utilise
  the Body (name) present in Status.json. »
- ⚠️ **`CarrierLocation` est un piège**, et il n'est dans aucune documentation.
  Payload réel : `{"event":"CarrierLocation","CarrierID":3705689344,
  "StarSystem":"HR 3635","SystemAddress":1694121347427,"BodyID":1}`. Il décrit
  la position **du porte-vaisseaux**, pas celle du joueur. Tout parseur qui
  raisonne « cet événement porte `StarSystem` + `SystemAddress`, donc c'est mon
  système » se téléporte à tort. `CarrierJump`, lui, désigne bien le joueur.
- **`ScanOrganic.Body` contient un entier qui est le `BodyID`**, pas un nom —
  EDDI le commente explicitement. La jointure passe donc par
  `(SystemAddress, BodyID)`. Le parseur du projet fait déjà correctement
  `_int(json['Body']) ?? _int(json['BodyID'])`.
- **`SellOrganicData` porte `MarketID` à la racine**, pas dans `BioData[]`, et
  **ne porte aucun `SystemAddress`** : on ne peut pas rattacher une vente à un
  système depuis ce seul événement. Une vente réelle contient couramment plus de
  quarante entrées.
- **`Bonus` vaut exactement 4 × `Value`** quand il est non nul, donc un paiement
  total de 5 × `Value` — vérifié sur des dizaines d'entrées. Et il est **par
  échantillon, pas par espèce** : la même Stratum Tectonicas apparaît dans un
  même événement une fois avec `Bonus: 0` et une fois avec `Bonus: 76043200`.
  L'entité `SoldBioData` du projet modélise déjà cela correctement.
- **Le journal ne contient aucune table de prix.** La valeur n'apparaît qu'à la
  vente. Pour estimer la valeur des données **non encore vendues** — c'est-à-dire
  le cœur du Dashboard demandé — il faut une table externe **par espèce** (les
  variantes de couleur partagent la même valeur). Le catalogue embarqué de
  l'application la fournit déjà : ses `baseValueCr` coïncident au crédit près avec
  les `Value` observés en jeu (Stratum Tectonicas 19 010 800, Bacterium Aurasus
  1 000 000, Frutexa Acus 7 774 700, Tubus Conifer 2 415 500). **Rien à ajouter.**
- ⚠️ **Aucun événement ne signale la perte des données bio à la mort.** Il faut
  l'inférer de `Died` puis `Resurrect`, en filtrant sur
  `Resurrect.Option ∈ {escape, recover, rejoin}` — c'est exactement la stratégie
  de BioScan, le plugin d'exobiologie de référence, qui persiste des tables
  `Death` et `Resurrection` et compare leurs horodatages à ceux des ventes.
  **Sans cela, `completedNotSold` accumulera indéfiniment des organismes que le
  commandant a perdus en mourant** — et le Dashboard annoncera une valeur en
  attente fantôme. C'est le défaut le plus grave que la fonctionnalité demandée
  puisse avoir.

**Deux pièges de données, à traiter dès le parseur :**

1. **`Signals[].Type` prend deux formes incompatibles.** Les six catégories de
   surface sont préfixées (`$SAA_SignalType_Biological;` etc.), mais le **même
   événement** `SAASignalsFound` sur un **anneau** rend des noms de minerais non
   préfixés : `{"Type":"LowTemperatureDiamond","Type_Localised":"Low Temperature
   Diamonds","Count":1}`, et parfois `{"Type":"Alexandrite","Count":1}` — sans
   même de jumeau `_Localised`. Il faut filtrer sur le préfixe exact et ignorer
   silencieusement le reste.
2. **`Variant` n'est pas toujours distinct de `Species`.** Pour les organiques
   « sans genre » (Bark Mounds, Brain Trees, Anemones, Amphora Plant, Crystalline
   Shards, Radicoida), `Genus == Species == Variant`. Et le suffixe de variante
   n'est pas toujours une lettre : on trouve
   `$Codex_Ent_Bacterial_10_Antimony_Name;`, `_Ruthenium_Name;`,
   `_Tellurium_Name;` à côté de `_A_Name;`, `_F_Name;`, `_M_Name;`.

**Un ajout récent qui vaut la peine d'être guetté** : `ScanOrganic` porte
désormais un booléen optionnel **`WasLogged`**, observé dans un journal réel du
17 janvier 2026. Il est absent du manuel v38, d'EDMC et d'EliteJournalReader,
mais lu par BioScan. S'il signifie bien « cette espèce était-elle déjà loggée par
ce commandant », il évite de rejouer des années de journaux pour savoir si une
découverte est une première — ce qui est aujourd'hui le seul moyen, le jeu ne
dumpant jamais l'état du codex.

**Et un genre à ajouter au catalogue** : `$Codex_Ent_Ingensradices_Genus_Name;`
= « Radicoida », espèce unique « Radicoida Unica », valeur observée
**952 296 Cr** (noter qu'elle sort du schéma des valeurs rondes), distance
d'échantillonnage 15 m. Le catalogue embarqué compte 22 genres et 118 espèces :
il lui manque celui-là.

### 2.3 Ce qu'il faut changer dans le code existant

La veille ne peut pas réutiliser `importFiles` : trois choses la rendraient
inutilisable à 10 secondes.

| Obstacle | Où | Correctif |
|---|---|---|
| `_merge()` **re-parse tout le journal stocké** pour construire l'ensemble des `dedupeKey` (`journal_repository_impl.dart:223`) | `journal_repository_impl.dart` | Maintenir l'ensemble des clés en mémoire une fois, puis l'alimenter à l'ajout. Coût : O(nouvelles lignes) au lieu de O(historique) par tick. |
| `_merge()` **ré-émet la liste complète** parsée sur le `StreamController` (`:255`) | idem | Émettre le delta, ou tenir la liste parsée en mémoire et n'y ajouter que les nouveaux événements. Les agrégateurs, qui recalculent tout, sont alors à faire tourner sur un rythme plus lent que la veille. |
| Le plafond de 60 000 lignes de `JournalLocalStore` serait **consommé par le bruit** | `journal_local_store.dart:27` | Une session écrit une quarantaine de types d'événements dont l'application n'en modélise que 33 ; le reste (`Music`, `ReceiveText`, `FuelScoop`…) est stocké quand même, puisque le parseur rend un `UnknownJournalEvent` pour toute ligne horodatée. Trois options : filtrer à l'ingestion en veille (au prix de la règle « on garde ce qu'on ne comprend pas encore »), relever le plafond, ou tenir un second `LineStore` volatile pour la session en cours. **La troisième est la plus propre** : la session vivante n'a pas à rogner l'historique. |

Le reste s'ajoute sans rien casser :

- **Un `JournalTailDataSource`** à côté de `JournalFileDataSource` : résolution du
  fichier courant **par analyse du nom** (les deux motifs), lecture de `offset` à
  `length`, cadrage sur le dernier `\n`, détection de troncature et de
  remplacement, bascule sur `Continued` ou `Fileheader`.
- **Un `GameStateDataSource`** pour `Status.json` et `ShipLocker.json`, avec le
  motif « réessayer, un échec est normal ».
- **`systemAddress` dans `CommanderPosition`** — le prérequis de toute requête
  Spansh (voir 1.6).
- **Une plateforme, un comportement.** `JournalFileDataSource.isSupported` est
  déjà `!kIsWeb` ; la veille demande davantage — un dossier de jeu accessible,
  donc un poste de bureau. Sur téléphone, l'onglet Dashboard doit afficher le
  dernier état connu (import ou cAPI) **en le datant**, sans prétendre au direct.

### 2.4 L'onglet « Dashboard » : ce qu'il peut afficher

Tout est disponible, et l'essentiel est déjà calculé. Par ordre de certitude des
données :

| Bloc | Source | Certitude |
|---|---|---|
| **Où je suis** | `CommanderPosition` (journal) + `Status.json` pour le corps courant et les coordonnées de surface | Certain |
| **Valeur en attente** | `ExobiologyActivity.completedNotSold` × `baseValueCr` du catalogue | Certain — **une fois `Died`/`Resurrect` pris en compte** |
| **Échantillons en cours** | `ExobiologyActivity.samplesInProgress` (1/3, 2/3) + la distance minimale du genre | Certain |
| **Ce qu'il reste dans ce système** | `SAASignalsFound.Genuses[]` si le corps est cartographié ; sinon `FSSBodySignals.Count` + prédiction par le `SpeciesMatcher` | Certain après DSS, prédictif avant |
| **Système entièrement découvert ?** | `FSSAllBodiesFound.Count` comparé à `FSSDiscoveryScan.BodyCount` | Certain (événements à ajouter) |
| **Corps déjà cartographiés** | `Scan.WasMapped` **ou** `SAAScanComplete` — un OU logique obligatoire, car `WasMapped` est **figé à l'instant du scan** : si vous scannez puis cartographiez, la ligne `Scan` dira toujours `WasMapped: false` | Certain (à ajouter) |
| **Espèces et coordonnées exactes** | `GET /api/body/{id64}` de Spansh → `landmarks` | Dépend du réseau ; à mettre en cache |

Une nuance de conception qui vient directement de la mécanique du jeu : **le
nombre de signaux biologiques est connu dès le FSS, mais la liste des genres
n'arrive qu'après cartographie DSS.** Entre les deux, il faut prédire. C'est
exactement ce que fait BioScan (« Based on the properties of that planet […] the
scroll pane will display all possible genera and species », puis « After you've
mapped a planet […] it will then pare down the list to the detected genera »), et
c'est exactement ce que le `SpeciesMatcher` du projet sait déjà faire. Le
Dashboard doit donc afficher deux états visuellement distincts : **« possible »**
et **« confirmé »**.

Deux réserves à documenter dans l'interface plutôt qu'à masquer :

- **Un scan basique ne suffit pas à prédire.** Sans Detailed Surface Scanner, le
  `Scan` n'a ni atmosphère, ni volcanisme, ni pression, ni température de
  surface, ni matériaux — le matcher n'a alors presque rien à se mettre sous la
  dent.
- **`FSSDiscoveryScan.Progress` est ambigu.** Le manuel dit « how completely the
  system has been scanned » sans préciser le référentiel ; EDMC le supprime avant
  de l'envoyer à EDDN, ce qui suggère une valeur personnelle. À ne pas afficher
  comme un état galactique.


## Question 3 — Le guide matériaux avancé

> *« Un guide plus avancé pour la récupération de matériaux : afficher ce qu'il
> reste à trouver et comment trouver, exactement, chaque élément. Aujourd'hui je
> n'arrive pas à récupérer les matériaux pour la portée du FSD chez Felicity
> Farseer et je ne sais pas comment obtenir ceux de ma combinaison. »*

C'est la question la plus facile à satisfaire des trois : **aucune donnée
externe n'est nécessaire.** L'application connaît déjà l'inventaire du
commandant (`ShipLocker` et `Materials`) et les coûts de l'Artemis ; ce qui
manque est un **jeu de données de référence embarqué** — un `materials.json` au
même titre que `exobiology_catalog.json` — plus le calcul « requis − possédé ».

### 3.1 Trois défauts à corriger dans les données existantes

La recherche a validé les chiffres de l'application sur l'Artemis, et pris trois
choses en défaut.

**(a) Les noms de matériaux dépendent de la langue du jeu.**
`_namedCounts()` (`journal_event_parser.dart:501`) indexe l'inventaire sur
`Name_Localised ?? Name`. Or le manuel v38 §2.4 est explicite : la clé
`_Localised` est écrite **dans la langue du client** — et omise quand elle est
identique à l'original. Sur un client français, `onFootInventory` est donc
indexé en français, tandis que `artemisGradeSteps` compare à des noms anglais
(`'Health Monitor'`, `'Aerogel'`). Le panneau « prochaine amélioration »
**ne trouve rien** dans ce cas.
→ **Indexer sur `Name`**, le symbole interne, qui est stable et indépendant de
la langue ; garder `Name_Localised` pour l'affichage seul. Le même raisonnement
vaut pour `Materials` (matériaux de vaisseau), où le journal localise aussi.

**(b) « Les grades ne coûtent pas de crédits » est probablement faux.**
`ExobiologyReferenceData.gradesCostCredits = false` affirme que seuls les
matériaux comptent. Le wiki Fandom publie une colonne « Modification Cost » pour
chaque palier de l'Artemis : **600 000 CR (G1→G2), 2 250 000 CR (G2→G3),
4 500 000 CR (G3→G4), 7 500 000 CR (G4→G5)**, soit **14 850 000 CR** au total.
Inara, de son côté, ne liste aucun coût en crédits pour les paliers de grade —
c'est donc une source contre le silence d'une autre, pas deux sources
contradictoires. **À vérifier en jeu avant de corriger**, mais si c'est exact,
c'est une somme qui change l'ordre des étapes de la feuille de route pour un
commandant débutant.

**(c) Les listes d'ingénieurs par modification sont incomplètes.**

| Modification | Dans l'application | Vérifié |
|---|---|---|
| Improved Battery Capacity | Wellington Beck, Oden Geiger | + **Rosa Dayette** |
| Extra Backpack Capacity | Domino Green, Wellington Beck | + **Rosa Dayette** |
| Reduced Tool Battery Consumption | Domino Green, Wellington Beck | + **Rosa Dayette** |
| Improved Jump Assist | Yarden Bond, Baltanos | + **Hero Ferrari** |
| Increased Sprint Duration | Terra Velasquez, Baltanos | + **Hero Ferrari** |
| Night Vision | Oden Geiger, Yi Shen | ✅ exact — et ce sont bien les deux seuls |

Les six coûts en crédits de l'application (750 000 / 750 000 / 500 000 /
750 000 / 750 000 / 1 000 000) sont **exacts**, et les quantités de matériaux
de l'Artemis le sont aussi. Le commentaire du code attribue en revanche la
réforme à « Update 18 (août 2024) » : la mise à jour du 26 février 2024 est
l'Update 18 (FSD SCO), et le rééquilibrage d'ingénierie est le **Type-8 Update
(18.08), août 2024**. La baisse est estimée par la communauté à 60-70 %, pas
« environ un quart ». Enfin, il n'existe pas d'« Update 20 » : après la 19.0
(*Ascendancy*, 31 octobre 2024) Frontier est passé à des mises à jour nommées.

### 3.2 Artemis : la table complète, sourcée

Coûts par palier (Inara `equipment-blueprint/4` et wiki Fandom concordants sur
les matériaux ; crédits d'après le wiki seul) :

| Palier | Suit Schematic | Health Monitor | Manufacturing Instructions | Aerogel | Graphene | Crédits |
|---|---:|---:|---:|---:|---:|---:|
| G1 → G2 | 1 | 1 | 1 | 2 | 2 | 600 000 |
| G2 → G3 | 2 | 2 | 2 | 5 | 5 | 2 250 000 |
| G3 → G4 | 4 | 4 | 4 | 9 | 9 | 4 500 000 |
| G4 → G5 | 5 | 5 | 5 | 12 | 12 | 7 500 000 |
| **Total** | **12** | **12** | **12** | **28** | **28** | **14 850 000** |

Progression à noter : 1, 2, **4**, 5 — et non 1, 2, 3, 4. Les emplacements de
modification suivent 0, 1, 2, 3, 4 du G1 au G5.

Les trois combinaisons partagent **exactement** la même liste, à **un seul
composant** près : **Aerogel** pour l'Artemis, *Carbon Fibre Plating* pour la
Maverick, *Titanium Plating* pour la Dominator. Le commentaire du code qui
avertit contre la confusion est donc juste, et c'est le seul écart.

**Où trouver chacun des cinq — la réponse concrète à la question posée :**

| Composant | Catégorie | Valeur | Où, précisément |
|---|---|---:|---|
| **Suit Schematic** | Good | 50 000 CR | Settlements **High Tech** et **Industrial**, bâtiments **CMD**, **PWR**, **STO**. Récompense de mission. C'est le plus cher des cinq : **ne jamais le vendre au bartender** pendant une montée en grade. |
| **Health Monitor** | Good | 10 000 CR | Settlements **Industrial**, bâtiments **IND**, **MED**, **RES**, **HAB**, **CMD** ; dans des *Lockers*. Récompense de mission. Seul des cinq attesté aussi sur **épave de surface**. |
| **Manufacturing Instructions** | **Data** | 9 000 CR | **Data Ports** uniquement — settlements **Industrial** et **Extraction** (`Industrial`, `Laboratory`, `Satellite`, `Extraction Data Port`), plus *Irregular Markers* et *Impact Sites*. « Jusqu'à 3 par data port, et seulement dans les bâtiments de production industrielle ». Farmable en relog. |
| **Aerogel** | Asset (Chemicals) | 500 CR | Salles **LAB** et **PROC** (donc bâtiments RES, IND, EXT, AGRI), via *Industrial Locker (S)* et *Research Locker (L)*. **Achetable au bartender** : coût 9, valeur de cession 5. |
| **Graphene** | Asset (Chemicals) | 1 300 CR | Abondant dans les bâtiments **Research** ; aussi AGRI, HAB, SEC. **Achetable au bartender** : coût 23, valeur de cession 13. |

Trois conséquences pratiques qui répondent directement au « je ne sais pas
comment obtenir les matériaux de ma combinaison » :

1. **Seuls Aerogel et Graphene sont achetables.** Le bartender ne troque que les
   *Assets* ; il achète les *Goods* et les *Data* contre crédits mais n'en revend
   jamais. Suit Schematic, Health Monitor (Goods) et Manufacturing Instructions
   (Data) s'obtiennent donc **uniquement par pillage ou récompense de mission**.
   Arithmétique du troc : céder 1 Graphene rapporte 13 et un Aerogel coûte 9 —
   **échanger du Graphene contre de l'Aerogel est rentable, l'inverse coûteux.**
2. **Manufacturing Instructions est le vrai goulot d'étranglement** : il entre
   dans **56 recettes** (les trois combinaisons et les onze armes, grades 2 à 5),
   n'est ni achetable ni vendable, et Rosa Dayette en réclame 10 pour son
   referral vers Yi Shen — la voie Night Vision de Colonia est donc **en
   concurrence directe** avec la montée en grade.
3. **Depuis le Type-8 Update, les récompenses de mission couvrent les cinq
   composants**, avec des quantités « 3-4× supérieures » à l'avant. Sélectionner
   ses missions par récompense est devenu plus efficace que piller. C'est le
   conseil le plus utile que l'application puisse donner, et il rend obsolètes
   tous les guides de farm de *Power Regulators* « pour monter une combinaison ».

**Le terrain de farm, quand il faut piller.** Les settlements contrôlés par une
faction **Anarchy** n'infligent aucune amende — le wiki les désigne
explicitement comme « very useful for farming Assets, Goods, and Data ». Un
settlement d'**extraction moyen** (marqué `++`) en système anarchie donne une
boucle de 10-15 minutes rapportant 5 à 10 matériaux tech plus du graphene. Deux
mécaniques valent d'être connues : on peut **s'octroyer une autorisation de
sécurité de niveau 3** pour tout le settlement depuis un terminal du Command
Centre (CMD) — le niveau 2 suffit à éteindre les tourelles ; et les gardes
**n'entrent pas dans un bâtiment dont ils n'ont pas le niveau d'accès**, même
s'ils vous ont vu y entrer. Les settlements hors tension n'ont ni gardes ni
civils, mais des *scavengers* — et « Scavengers cannot spawn anymore once the
power is on », donc rétablir le courant d'abord sécurise le pillage. Les
téléchargements de données interdits sont **signalés en violet** et déclenchent
l'alarme : à savoir, puisque Manufacturing Instructions ne s'obtient que sur
data port.

Enfin, une correction de vocabulaire : trois termes de la question n'existent pas
dans la documentation. **« Anonymous Access »** n'est documenté nulle part ;
**« Settlement Defence Personnel Alert »** non plus — le mécanisme réel est
l'alarme de settlement, exploitable en diversion pour vider un bâtiment de ses
gardes ; et **« Alexandrite »** est une commodité minière, pas un type de
conteneur.

**Deux évolutions récentes qu'aucun guide antérieur ne mentionne** :
l'update *Vanguards* (4.2.0.0, 19 août 2025) autorise le **partage de matériaux
à pied entre membres d'une escadre** — ce qui invalide l'affirmation courante
selon laquelle les matériaux Odyssey ne sont pas transférables ; et l'update
*Operations* (4.4.0.0, 30 juin 2026) introduit les **Merc Coin** (plafond 9 999,
allocation hebdomadaire 1 000) échangeables contre de l'équipement à pied. Reste
à établir si cela couvre des composants de montée en grade ou seulement des
modifications.

Un dernier raccourci, souvent ignoré : **Pioneer Supplies vend occasionnellement
des combinaisons « premium » de grade 2 à 5**, parfois déjà modifiées. C'est le
seul moyen d'acheter un grade sans farmer ; l'inventaire est renouvelé chaque
semaine, et Jameson Memorial (Shinrarta Dezhra) et i Sola Prospect (Brestla) ont
la sélection la plus large.

### 3.3 Portée du FSD : pourquoi ça bloque, et la table exacte

C'est le point où la question dit « je n'arrive pas ». La cause est
identifiable : **quatre des dix matériaux du blueprint viennent d'une seule
source, le scanner de sillage** — et rien dans l'application ne le dit.

**Débloquer Felicity Farseer.** Deux conditions : atteindre le rang
d'exploration **Scout** (3ᵉ palier affiché, valeur `2` dans le journal sur une
échelle 0-8) et fournir **1 unité de Meta-Alloys**. Une seule. C'est une
**marchandise**, pas un matériau : elle occupe la cale et ne passe **pas** par
un material trader. L'application le dit déjà correctement.

Où en trouver aujourd'hui (instantané du 19/08/2026, données de marché
communautaires — donc volatiles) :

- **Darnielle's Progress** (Maia, avant-poste planétaire) : 246 598 Cr,
  **stock 5 t**. C'est la seule station classique fiable. Maia Point et Moni's
  Hub affichent un prix mais **stock 0** ; Obsidian Orbital n'a que de la
  demande — on y vend, on n'y achète pas.
- **Les Fleet Carriers** sont la vraie source : 58 porteurs avec du stock, dont
  un **dans Deciat même** (V4F-L3N, 1 t à 9 729 Cr). Mais les prix sont fixés
  par leur propriétaire et vont de ~9 700 Cr à plus de 19 M Cr la tonne.
- **Ne cherchez plus dans les settlements Odyssey** : l'Update 10 (25 janvier
  2022) a corrigé le fait qu'ils exportaient des Meta Alloys par erreur.

**Monter sa réputation.** Deux leviers documentés par Inara : *« Craft modules
for a major increase. Sell exploration data at Farseer Inc. »* — les données
d'exploration doivent être vendues **à sa station**, pas ailleurs.

> ⚠️ La règle `UnlockFelicityFarseerRule` de l'application affirme
> « ~24 M Cr de données au total ». **Aucune source consultée ne chiffre la
> montée en réputation** — ni les points par craft, ni par mission, ni par
> crédit de données vendues, ni les seuils des grades 1→5. Ce nombre est à
> retirer ou à marquer comme une estimation.

Et le grade de réputation n'est pas cosmétique : depuis l'**Update 18.08**
(7 août 2024), *« engineer rolls consistently give a fixed roll depending on the
grade of the recipe and the commander rank with the engineer »*. Frontier
précise : **au grade 5, il faut 1 roll pour un blueprint de grade 1, 2 pour un
grade 2, et ainsi de suite** ; en dessous, « it will be more spins, but it will
no longer be random ».

**La table exacte du blueprint « FSD — Increased Range »** (`FSD_LongRange`),
par roll — quantités identiques sur **cinq** jeux de données indépendants
(Inara, `EDCD/coriolis-data`, EDEngineer, EDSY, wiki) :

| Grade | Raw | Manufactured | Encoded | Effet (optimal mass) |
|---|---|---|---|---|
| **1** | — | — | 1× Atypical Disrupted Wake Echoes *(g1)* | +15 % |
| **2** | — | 1× Chemical Processors *(g2)* | 1× Atypical Disrupted Wake Echoes | +25 % |
| **3** | 1× Phosphorus *(g1)* | 1× Chemical Processors | 1× Strange Wake Solutions *(g3)* | +35 % |
| **4** | 1× Manganese *(g2)* | 1× Chemical Distillery *(g3)* | 1× Eccentric Hyperspace Trajectories *(g4)* | +45 % |
| **5** | 1× Arsenic *(g2)* | 1× Chemical Manipulators *(g4)* | 1× Datamined Wake Exceptions *(g5)* | +55 % |

**Total pour une montée G1→G5 à réputation 5** (15 rolls) : 3× Atypical
Disrupted Wake Echoes, 5× Chemical Processors, 3× Phosphorus, 3× Strange Wake
Solutions, 4× Manganese, 4× Chemical Distillery, 4× Eccentric Hyperspace
Trajectories, 5× Arsenic, 5× Chemical Manipulators, **5× Datamined Wake
Exceptions**.

Ce dernier est le goulot d'étranglement, et il explique le blocage : les
**quatre** matériaux encodés du blueprint appartiennent tous à la catégorie
**« Wake Scans »**, dont la seule source est le **Frame Shift Wake Scanner**
braqué sur des **sillages d'hyperespace (high energy wakes)**. Sans ce module —
un utility mount classe 0, notes E à A, 13 544 à 1 097 095 Cr, portée 2 à 4 km,
10 s de scan, à assigner à un groupe de tir — le blueprint est **impossible à
compléter**, quel que soit le temps passé à prospecter en SRV.

**Et il y a un raccourci que personne ne mentionne.** Le trader Encoded permet de
**descendre** dans la même catégorie à raison de 1 pour 3 par grade. Donc :

- 1× Datamined Wake Exceptions (g5) → **81× Atypical Disrupted Wake Echoes** (g1) ;
- ou, à l'inverse, 6 unités d'un grade donnent 1 unité du grade supérieur.

Autrement dit : **camper des sillages près d'une station très fréquentée et
récolter n'importe quel Wake Scan, puis convertir chez le trader**, plutôt que
d'espérer tomber sur le bon grade. C'est l'unique conseil qui débloque
réellement la situation.

**Le gain réel.** Le blueprint agit sur l'*optimal mass* du FSD, et la distance
de saut y est **linéaire** : `jump = (fuel/fuelmul)^(1/fuelpower) × fsdoptmass /
(masse + carburant) + bonus`. Un G5 complet donne donc **+55 % de portée brute**,
moins l'effet du **+30 % de masse** que le blueprint ajoute au module lui-même —
soit quelques points de pourcentage en moins selon le vaisseau. La règle de
l'application annonce « +10 à 15 LY » : c'est plausible pour un vaisseau moyen,
mais c'est un ordre de grandeur, pas une valeur.

**L'effet expérimental Mass Manager** : 5× Atypical Disrupted Wake Echoes + 3×
Galvanising Alloys *(manufactured g2)* + 1× Eccentric Hyperspace Trajectories,
pour **+4 % d'optimal mass et −8 % d'intégrité**. Farseer le pose. À noter :
**Deep Charge coûte exactement les mêmes matériaux** et donne +10 % de carburant
max par saut — ce qui, sur un long trajet, peut valoir plus que +4 % de portée.
Le choix mérite d'être présenté, pas tranché d'office.

**Ce que Farseer peut et ne peut pas faire** — utile pour ne pas faire voyager
le commandant pour rien : FSD au **grade 5** (Increased Range, Faster Boot
Sequence, Shielded), mais **Sensors, Thrusters et Detailed Surface Scanner
plafonnés au grade 3**, Power Plant et Shield Booster au **grade 1**. Pour
Lightweight Sensors G5 ou l'Expanded Probe Scanning Radius G5, il faut aller
ailleurs. Et Increased Range G5 est aussi posé par **Elvira Martuuk** et **Mel
Brandon** — les trois seuls à monter aux grades 4 et 5.

Deux corrections aux conseils actuels de l'application :

1. **« Fabriquer des Fast Boot FSD de grade 3 pour monter les grades vite »** est
   un conseil d'avant août 2024. Le blueprint reste le moins cher du jeu (G1 =
   **1× Grid Resistors**, le matériau le plus commun), mais les rolls étant
   désormais déterministes, « brûler » des rolls bon marché n'a plus le même
   intérêt. Il reste valable comme moyen de gagner de la réputation **sans
   consommer de Wake Scans** — ce qui, vu ce qui précède, est un argument
   sérieux.
2. **Le FSD SCO ne change rien au blueprint.** Increased Range s'applique aux
   deux familles de modules avec les mêmes matériaux ; en revanche les attributs
   propres au SCO (vitesse, accélération, chaleur, consommation en overcharge)
   **ne sont pas modifiables** par l'ingénierie. Réserve : ce point est établi
   via le mappage module→blueprints d'EDSY, qui porte lui-même un commentaire
   `// TODO verify`. Et Coriolis n'a **aucune** donnée SCO : pour planifier un
   build SCO ingénié, c'est EDSY, pas Coriolis.

### 3.4 Matériaux de vaisseau : les chiffres, et ce qui a changé

**L'inventaire réel** (comptage sur `EDCD/FDevIDs`, la source de données du jeu) :
**28 Raw, 50 Manufactured, 30 Encoded** = 108 matériaux échangeables, hors
Guardian et Thargoid qui ne le sont pas. Beaucoup de guides citent « 35
manufactured » : c'est faux. Et **il n'existe aucun matériau Raw de grade 5** —
les Raw s'arrêtent au grade 4.

**Plafonds de stockage, par matériau** : G1 = 300, G2 = 250, G3 = 200, G4 = 150,
G5 = 100. (La « réserve de données de 500 unités » qu'affiche encore la page wiki
*Encoded Materials* est un vestige d'avant décembre 2018.)

**Nouveau, et absent de tous les guides** : depuis le **Dodec Update
(11 novembre 2025)**, quand le plafond d'un matériau est atteint, **l'excédent
est converti en crédits** — G1 2 000 Cr, G2 4 000, G3 8 000, G4 16 000,
G5 32 000. Plus rien n'est perdu.

**Les material traders.** Trois traders distincts (Raw, Manufactured, Encoded) ;
**l'échange entre types est impossible**. À l'intérieur d'un type, on peut
changer de catégorie, mais cela **multiplie le coût par 6** :

| | Même catégorie | Catégorie différente |
|---|---|---|
| +1 grade | **6 → 1** | 36 → 1 |
| +2 grades | 36 → 1 | 216 → 1 |
| +3 grades | 216 → 1 | *impossible* |
| même grade | — | **6 → 1** |
| −1 grade | **1 → 3** | 2 → 1 |
| −2 grades | 1 → 9 | 2 → 3 |
| −3 grades | 1 → 27 | 2 → 9 |
| −4 grades | 1 → 81 | 2 → 27 |

Les conversions à 1296:1 et 7776:1 sont listées mais **physiquement
impossibles** : elles exigeraient de stocker plus d'unités que le plafond
n'autorise. Ces taux **n'ont pas changé depuis l'introduction des traders en
février 2018** (vérifié à la fois sur l'historique des révisions du wiki et sur
six ans de notes de patch).

Où ils s'installent : trader **Raw** dans les économies *Refinery* et
*Extraction*, **Manufactured** dans *Extraction* et *Industrial*, **Encoded** dans
*High Tech* et *Military* ; sécurité moyenne ou haute, population entre 1 et
22 millions, gouvernement non-Anarchy, station ni endommagée ni en lockdown.
Mais **ne déduisez pas le type du trader de l'économie de la station** : le test
sur les 30 traders à moins de 30 al de Sol donne deux candidats pour presque
toutes, et Gresley Dock (Nanomam) est un trader Encoded avec une économie
*Agriculture* qui ne correspond à aucune règle.

**Raw — la règle qui change tout** : chaque corps atterrissable a une composition
**fixe de 11 matériaux — 5 × G1, 3 × G2, 2 × G3, 1 × G4** — révélée par le
Detailed Surface Scanner. *Aucun autre matériau ne peut jamais y apparaître*,
quel que soit le lieu ou le moment de la prospection. Les 5 G1 de surface sont
toujours Carbon, Iron, Nickel, Phosphorus, Sulphur ; **Boron, Lead et Rhenium ne
s'obtiennent qu'en minage d'astéroïdes**.

Correspondance type de corps → matériau, mesurée sur les 50 meilleurs corps de la
galaxie par matériau :

- **Metal-rich body** (100 % du top 50) : Yttrium, Antimony, Technetium,
  Ruthenium, Mercury, Molybdenum, Cadmium, Niobium, Tungsten, Tin, Zirconium,
  Manganese, Chromium, Zinc.
- **Rocky body** : Arsenic, Tellurium, Germanium.
- **Icy body** : **Selenium** — ce qui contredit les guides qui envoient le
  chercher sur du High Metal Content.
- Mixtes : Polonium et Vanadium (majoritairement metal-rich, parfois icy).

Rendements de prospection : un **outcrop** donne **3 unités par morceau** ; les
protubérances volcaniques suivent une échelle de grade — *Piceous Cobble* G1,
*Crystalline Fragments* G2-G3, *Crystalline Cluster* G3-G4, *Needle Crystals* G4
(uniquement sur les sites *Lava Spout*). Les signaux géologiques sont révélés de
façon **permanente** par un DSS à ≥ 90 % de couverture, et deviennent des points
d'atterrissage sélectionnables.

La méthode haut de gamme moderne, ce sont les **Crystalline Shards**, avec des
conditions de spawn strictes : étoile mère A, F, G, K, M ou S ; corps entre 0 et
273 K, **sans atmosphère**, avec volcanisme ; **à plus de 12 000 Ls de
l'étoile** ; et le système doit contenir au moins un monde Earth-Like, Ammonia,
Water World, Water Giant ou une géante gazeuse à vie. Le plus proche de Sol est à
**1 426 ly** — ce n'est pas une sortie du week-end.

> ⚠️ **Dav's Hope fonctionne toujours, mais les coordonnées de tous les vieux
> guides sont fausses.** Système *Hyades Sector DR-V c2-23*, planète **A 5**.
> Legacy (3.8) : `44.8180, -31.3893`. **Live (4.x) : `50.5426, 137.4150`** —
> confirmé indépendamment par le landmark *Abandoned Base* remonté par les
> clients Live à `50.532878, 137.436019`. Tout guide citant les coordonnées
> Legacy vous fera atterrir au mauvais endroit.

Le **Jameson Crash Site** existe toujours : *HIP 12099*, planète **1 B**,
~9 data points, matériaux Encoded G3/G4/G5, à `-54.375358, -50.353342`
(landmark *Wrecked Ship*, et un second *Crashed Ship* à `-55.431073,
-49.255156`).

**Manufactured — les HGE, et la correction majeure.** Ce n'est **pas** l'état de
faction seul qui décide, c'est **l'allégeance qui domine** :

| Condition | Matériaux |
|---|---|
| Faction **fédérale** | Core Dynamics Composites, Proprietary Composites — *et rien d'autre* |
| Faction **impériale** | Imperial Shielding — *et rien d'autre* |
| *Civil Unrest* | Improvised Components |
| *War* / *Civil War* | Military Grade Alloys, Military Supercapacitors |
| *Boom* / *Expansion* | Proto Heat Radiators, Proto Light Alloys, Proto Radiolic Alloys |
| *Outbreak* + population > 1 M | Pharmaceutical Isolators |

La phrase clé du wiki : *« a Federation or Imperial faction will never have
anything other than composites or shielding, respectively »*. Conséquence
pratique : **chercher des Proto Heat Radiators dans un système fédéral en Boom
est une perte de temps** — il faut une faction indépendante ou Alliance. À
noter aussi : *Famine* **ne figure pas** dans la table actuelle, et **l'économie
du système n'est pas un critère** — contrairement à d'innombrables guides qui
exigent « High Tech + Boom ».

Deux mécaniques utiles : les HGE apparaissent en **deep space** (le plus vite :
voler 200 Ls hors du plan orbital), et **scanner le Nav Beacon du système peut
en faire apparaître** s'il n'y en a pas.

**Les HGE n'ont pas été nerfées** — c'est le contraire. L'Update 18.08 a
explicitement *« increased Material availability/payout at Grade 4/5 farming
locations »* (de 3-6 fragments par site à 30-100 microressources) et porté les
récompenses de mission **jusqu'à 24 unités**. Le même patch a rendu les rolls
**déterministes** : tout guide qui parle de « rerouler jusqu'à obtenir un bon
résultat » est périmé.

Et une source massive qu'aucun guide ancien ne connaît : **contribuer à la
reprise d'un système Thargoid** rend, à la complétion, des matériaux G4 Raw et G5
Encoded/Manufactured — **120 unités** pour le quartile supérieur, 60 pour le
suivant, 18 pour le dernier, réparties sur 2 matériaux tirés au hasard dans
chacune des trois catégories.

**Encoded — les data points.** Cinq sources : le scan de vaisseaux (automatique,
en supercruise comme en sub-light), les *Private Data Beacons* dans les
Degraded/Encoded Emissions, les satellites, les **Planetary Outposts** (pas les
Starports) scannés au Data Link Scanner du SRV, et les missions de scan de
surface — dont *« the data point scan will often produce rare and very rare
data »*. Mécanique à connaître : les data points vont **par sets de quatre**,
avec un timer de reset rechargé à chaque scan réussi ; compléter le set donne un
*Data Point Intel Package* en crédits **en plus** des matériaux. Plus la
sécurité du site est haute, plus les données sont rares — et les défenses fortes.

**À surveiller** : le dev log du 6 août 2026 annonce le SRV **Rhino** et le
**Surface Mining**, *« a new way of acquiring raw materials around geological
sites »*. Tous les guides de farm Raw en SRV seront à réécrire.

### 3.5 Le module « sources les plus proches » : ce qui est possible, honnêtement

La question « où, à moins de 25 al, puis-je obtenir ce matériau ? » n'a **pas une
seule réponse**, parce que « matériau » désigne trois classes disjointes dans
Elite Dangerous.

| Classe | Interrogeable ? |
|---|---|
| **Marchandises** (Meta-Alloys…) | **Oui, pleinement.** Couvertes par EDDN, donc requêtables en direct. `GET /v2/commodity/name/{c}/imports?maxDistance=25&systemName=X` chez Ardent répond en un appel, navigateur compris. C'est ce qui permet de dire au commandant **où acheter son Meta-Alloy**. |
| **Matériaux d'ingénierie** (Raw / Manufactured / Encoded) | **Non — et c'est structurel.** Ils ne s'échangent pas sur un marché : aucune source ne peut dire « où trouver du Zirconium ». On peut seulement localiser le **material trader** de la bonne catégorie, et s'appuyer sur des **tables statiques** (composition des corps, correspondance HGE, sites connus). |
| **Composants Odyssey** (Suit Schematic…) | **Non, et il n'existera pas** de jeu de données « quel settlement contient quel composant » : rien dans le journal ne décrit le contenu d'un conteneur. |

**Les missions sont hors de portée, définitivement.** La preuve est nette : les
19 schémas d'EDDN — le seul réseau public de données joueur — ne comportent
**aucun schéma mission**. Les tableaux de missions sont générés côté serveur, par
joueur, et ne sont jamais diffusés. Ni Inara, ni Spansh, ni EDSM ne peut donc
lister des missions. **La fonctionnalité « quelles missions à moins de 25 al
donnent ce matériau » est impossible** — c'est la seule partie de la demande à
laquelle il faut répondre non.

Les HGE le sont presque autant : elles *sont* diffusées sur EDDN
(`fsssignaldiscovered`, avec `SpawningState` et `SpawningFaction`), mais le
schéma **impose de retirer `TimeRemaining`**, et surtout **une USS est propre à
l'instance du joueur qui la voit** — un autre joueur ne peut pas y entrer. Aucun
catalogue de positions de HGE n'est donc possible, et aucun outil public n'en
propose.

**Ce qui marche, service par service :**

| Service | Ce qu'il donne | Verdict |
|---|---|---|
| **Spansh** `POST /api/stations/search` | **Le seul à donner la catégorie du trader** : champ `material_trader` valant `Raw` / `Manufactured` / `Encoded` (441 stations Encoded, 812 Manufactured, 373 Raw dans la galaxie). Filtrage par rayon en al **et** par catégorie. | **La bonne réponse** — mais sans CORS, donc hors web, et ~100-130 Ko par station. |
| **Spansh** `POST /api/bodies/search` | Filtrage par `materials` (25 matériaux prospectables en surface), par `landmarks.type`/`subtype` **avec latitude et longitude**, tri par pourcentage. Exemple validé : le meilleur Yttrium atterrissable à moins de 1 000 ly de Sol = *Col 285 Sector VQ-L c8-1 1*, 2,812 %, à 313 ly. | **La brique d'un vrai localisateur de farm.** Le filtre de *seuil* en pourcentage n'a pas été trouvé : trier, puis filtrer côté client. |
| **Spansh** `field_values/state` | Compteurs live par état de faction (Boom 3 890 systèmes, War 6 448, Outbreak 546…) — donc une chasse aux HGE programmable, croisée avec l'allégeance. | Utilisable. |
| **Ardent Insight** `/nearest/{service}` | 10 services dont `material-trader`, **CORS ouvert**, sans clé. | **La seule option web.** Mais **20 résultats maximum** et **`maxDistance` est ignoré** (Beagle Point rend des stations à 46 000 al) : filtrer les 25 al côté client. Et `materialTrader` est un **booléen** — pas de catégorie. |
| **EDSM** | CORS ouvert, `otherServices` contient bien `Material Trader`… mais **système par système**. Couvrir 25 al autour de Sol = 1 appel `sphere-systems` (172 systèmes) **+ 172 appels** `stations`. Aucune catégorie, aucune API de POI. | Pis-aller. |
| **INARA — API** | Un seul endpoint `POST /inapi/v1/`, **clé API + application whitelistée à la main** par l'auteur. Sur 49 events, **2 seulement sont des lectures**. Le guide développeur est explicite : *« It does not include markets, minor faction influences, star systems, stations, or similar outputs. »* | **Inutilisable pour cet usage.** |
| **INARA — page web** | `nearest-stations/?formbrief=1&ps1=Sol&pa1[]=25-12` **fonctionne** et donne la catégorie (`25-10` Raw, `25-11` Manufactured, `25-12` Encoded). Mais c'est du HTML de session, **sans doublon JSON**. | Bon **lien profond**, mauvaise API. |
| **EDTools** | **N'a plus aucune page material trader ni HGE** (404), aucun en-tête CORS, et renvoie explicitement vers Inara. Son outil *Selenium* est déclaré obsolète par son auteur. | À retirer des références. |
| **Canonn** | `api.canonn.tech` est **injoignable** (timeout). L'API vivante est l'hôte Cloud Functions, **CORS ouvert** : `/query/codex/ref` rend 1 072 entrées de codex, chacune avec l'URL d'un **dump CSV de relevés géolocalisés** (Crystalline Shards → 4 402 lignes ; Bark Mounds → 4 093) ; `/query/biostats` rend 9,5 Mo de contraintes d'atmosphère et de composition par espèce. | **Excellent pour l'exobiologie et la géologie** ; **rien** sur les matériaux d'ingénierie. Les CSV n'ont pas de lat/lon — à croiser avec les landmarks Spansh. |
| **Odyssey Materials Helper** | Ce n'est pas un plugin EDMC mais une **application JavaFX autonome** qui *« reads the journal files »*. Aucune API, aucun serveur, aucun jeu de données externe. | Confirme qu'il n'existe pas de source ouverte de loot de settlement : cet outil-là fait exactement ce que ce projet peut faire, à partir du journal seul. |

**Conclusion de conception.** Le module demandé est réalisable, à condition
d'accepter qu'il soit **majoritairement une table embarquée**, et seulement
marginalement un client réseau :

1. **Embarqué** (comme `exobiology_catalog.json`) : les 108 matériaux avec leur
   catégorie, leur grade et **leurs sources** ; les recettes des blueprints ; la
   correspondance HGE allégeance/état → matériaux ; la correspondance type de
   corps → matériaux Raw ; et un petit catalogue de sites de terrain (Dav's Hope,
   Jameson, avec les coordonnées **Live**). Rien de tout cela ne bouge d'un
   patch à l'autre, et rien n'exige de réseau.
2. **Réseau, optionnel** : Spansh pour « le trader Encoded le plus proche » et
   « les meilleurs corps à Yttrium autour de moi » ; Ardent pour « où acheter mon
   Meta-Alloy » (et comme repli web).
3. **Liens profonds** vers Inara pour ce que l'application ne fera pas
   elle-même.
4. **Et un « non » assumé** sur les missions, avec l'explication — c'est plus
   utile qu'une fonctionnalité qui ne trouverait jamais rien.

### 3.6 Modèle de données proposé

Deux fichiers d'assets, sur le modèle de `exobiology_catalog.json`, plus un
service de calcul dans le domaine :

```
assets/data/materials.json
  { edition, sources[],
    materials: [ { id, name, category: raw|manufactured|encoded,
                   subcategory, grade, storageCap,
                   sources: [ { kind: hge|outcrop|crystal|datapoint|wake|
                                       mission|trader|thargoid|settlement,
                                detail, conditions, coordinates? } ] } ] }

assets/data/blueprints.json
  { edition, sources[],
    blueprints: [ { id, name, module, engineerIds[], maxGrade,
                    grades: [ { grade, rollsAtRep5, materials: {id: qty},
                                effect } ] },
                  … ],
    suitGrades: […]   ← ce que porte déjà ExobiologyReferenceData
  }
```

Le calcul, lui, est trivial et purement fonctionnel — donc testable sans
plateforme :

```
MaterialPlan planFor(BlueprintId target, int fromGrade, int toGrade,
                     Map<String,int> owned)
  → { required: {id: qty}, missing: {id: qty},
      tradableFrom: [ {have, spend, get} ],   ← via les taux du trader
      sources: {id: [Source]} }
```

`owned` vient de `MaterialsEvent` (vaisseau) et `ShipLockerEvent` (à pied),
**indexés sur `Name` et non sur `Name_Localised`** (voir 3.1). Le reste — « il te
manque 3 Datamined Wake Exceptions, voici comment les obtenir, et voici le
trader Encoded le plus proche » — n'est plus que de l'affichage.

---

## Ordre de mise en œuvre

Trié par rapport valeur/effort, tel que je le ferais. Les cinq premiers points
n'ajoutent **aucune dépendance réseau** et se testent avec les fixtures
existantes.

| # | Quoi | Pourquoi d'abord | Effort |
|---|---|---|---|
| **1** | Lire **`Genuses[]`** de `SAASignalsFound` | Fait passer l'exobiologie de « espèces possibles » à « genres présents », sans réseau, sans nouvelle donnée. Le meilleur rapport du document. | Une heure |
| **2** | Ajouter **`systemAddress`** à `CommanderPosition` | Prérequis de toute requête Spansh. `LocationEvent` le porte déjà. | Minutes |
| **3** | Indexer l'inventaire sur **`Name`** et non `Name_Localised` | Corrige un défaut qui rend le panneau Artemis **inopérant sur un jeu en français**. | Une heure, plus un test |
| **4** | Trier les fichiers journal **par nom analysé** | Corrige le tri lexical, faux dès qu'un dossier mêle les deux motifs de nommage. Bloquant pour la veille. | Une heure |
| **5** | Modéliser **`Died`** et **`Resurrect`** | Sans eux, la « valeur en attente » du Dashboard comptera éternellement des données perdues à la mort. C'est la correction qui décide si le chiffre affiché veut dire quelque chose. | Une demi-journée |
| **6** | `materials.json` + `blueprints.json` + `MaterialPlan` | **Livre la question 3 en entier**, hors réseau : ce qu'il manque, où le trouver, quoi échanger. La partie 3.3 donne déjà la table du FSD, la 3.2 celle de l'Artemis. | Deux à trois jours, surtout du contenu |
| **7** | `JournalTailDataSource` + `GameStateDataSource` + onglet Dashboard | **Livre la question 2.** Dépend de 1, 2, 4 et 5. Poste de bureau uniquement, dégradation datée ailleurs. | Trois à quatre jours |
| **8** | `FSSDiscoveryScan`, `FSSAllBodiesFound`, `SAAScanComplete`, `Scan.WasMapped` | Complète le Dashboard : « système entièrement découvert », « corps déjà cartographié ». | Une journée |
| **9** | Client Spansh en lecture (`/api/dump/{id64}`, `/api/body/{id64}`) + cache | **Livre la partie utile de la question 1** : les espèces exactes et leurs coordonnées dans le système courant. | Deux jours |
| **10** | Localisateur : trader le plus proche (Spansh), achat de Meta-Alloys (Ardent), liens profonds Inara | Termine la question 3. | Un à deux jours |
| **11** | *Facultatif* : `POST /api/exobiology/route` | Un vrai routeur d'exobiologie, au prix d'un job asynchrone de ~2 min et d'un contrat non documenté. À faire en dernier, si l'envie est là. | Deux jours |

Sur la couche réseau, quatre règles à poser dès le premier commit, toutes
justifiées par des mesures de ce document : **un `Dio` nommé distinct** de celui
de Frontier (le throttle à 1 req/min est une règle Frontier, pas une règle
Spansh) ; un **`User-Agent` qui identifie l'application** (seule courtoisie
disponible en l'absence de ToS) ; un **back-off** qui traite 502 et timeout
comme réessayables ; et un **cache indexé sur `id64`**, invalidé sur
`signals.updateTime` et non sur `body.updateTime`.

---

## Ce qui reste à vérifier avant de coder

Rien de tout ceci n'est bloquant, mais chacun de ces points ferait écrire une
ligne fausse dans l'application.

**À trancher en jeu (une session suffit) :**

1. **Les grades de combinaison coûtent-ils des crédits ?** Le wiki dit oui
   (600 000 / 2 250 000 / 4 500 000 / 7 500 000 Cr) ; Inara ne mentionne rien.
   `ExobiologyReferenceData.gradesCostCredits = false` en dépend.
2. **Faut-il la réputation grade 5 pour débloquer un effet expérimental**
   (Mass Manager) ? L'idée est répandue, aucune source consultée ne la confirme.
3. **Increased Range s'applique-t-il au FSD (SCO) avec les mêmes matériaux ?**
   Établi seulement via le mappage d'EDSY, qui porte lui-même un
   `// TODO verify`.
4. **Le plafond de stockage des `Data` du ship locker** : 1 000 est confirmé pour
   les Assets et les Goods, jamais pour les Data.
5. **Un changement de mode (Open / Solo / Groupe) ouvre-t-il un nouveau fichier
   journal ?** Non documenté, non traité par les trois lecteurs de référence.

**À ne pas affirmer (non sourcé) :**

6. **Le nombre de rolls quand la réputation est inférieure au grade 5.** Frontier
   dit seulement « it will be more spins, but it will no longer be random ». La
   table 1/2/3/4/5 n'est valable qu'au grade 5.
7. **« ~24 M Cr de données d'exploration » pour monter Farseer au grade 5.**
   Aucune source ne chiffre la réputation. À retirer de la règle de la feuille de
   route ou à marquer comme estimation.
8. **Un rééquilibrage des valeurs d'exobiologie à l'Update 14.** Plausible, mais
   le changelog du manuel n'en dit rien et aucune valeur antérieure n'a pu être
   retrouvée pour comparer. Les valeurs actuelles, elles, sont vérifiées.
9. **La signification de `ScanOrganic.WasLogged`.** Le nom suggère « déjà loggé
   par ce commandant » ; une seule observation, sur `false`.
10. **Le contenu exact de la MercGear** (update *Operations*, juin 2026) :
    inclut-elle des composants de montée en grade, ou seulement des
    modifications ?

**Limites d'API à garder en tête :**

11. **Aucun rate limit, aucune ToS publiée** par Spansh ni par Ardent (« does
    not *currently* enforce any rate limits »). Le volume soutenable est
    inconnu : cacher agressivement.
12. **`bodies/search` : la liste complète des filtres, des opérateurs et des
    clés de tri est inconnue** (six filtres testés), et la nature du plafond
    `count = 10 000` — affichage ou pagination — n'a pas été caractérisée.
13. **Les correspondances token → nom d'affichage** (genres et types de signaux)
    ont été **déduites** en recoupant deux listes de 21 valeurs. Les six
    non triviales méritent confirmation corps par corps.
14. **`Radicoida` n'est pas dans l'enum Spansh** alors qu'il est en jeu : l'enum
    n'est donc pas exhaustif, et un filtre par genre le manquera.

---

## Annexe A — Aide-mémoire des endpoints

*Mesures et sondages du 19 août 2026. Les tailles de dumps figurent en 1.1.*

| Endpoint | Méthode | Doc ? | CORS | Notes |
|---|---|---|---|---|
| `spansh.co.uk/api/dump/{id64}` | GET | ✅ | ❌ | Système complet, corps + `signals.genuses`. `camelCase`, **racine `system`**. 404 = `{"error": "…"}`. |
| `spansh.co.uk/api/body/{id64}` | GET | ✅ | ❌ | **`landmarks` : espèce, variante, valeur, lat/lon.** `snake_case`, **racine `record`**. L'`id64` est celui **du corps**. |
| `spansh.co.uk/api/system/{id64}` · `/station/{marketId}` | GET | ✅ | ❌ | |
| `spansh.co.uk/api/bodies/search` | POST JSON | ❌ | ❌ | Filtres + `reference_system` + tri. `count` plafonné à 10 000. |
| `spansh.co.uk/api/stations/search` | POST JSON | ❌ | ❌ | **Seule source du type de trader** (`material_trader`). 100-130 Ko/station. |
| `spansh.co.uk/api/{…}/field_values/{champ}` | GET | ❌ | ❌ | `genuses`, `signals`, `landmarks`, `materials`, `state`, `services`, `material_trader`. `landmarks` rend `{min_max, values:{subtype, type, variant}}` — 347 / 64 / 24 valeurs. |
| `spansh.co.uk/api/nearest?x=&y=&z=` | GET | ❌ | ❌ | Synchrone. |
| `spansh.co.uk/api/route` · `/exobiology/route` · `/riches/route` · `/tourist/route` | POST **form** | ❌ | ❌ | 202 + `job`, puis `GET /api/results/{job}`. **Refuse le JSON.** ~145 s mesurés. |
| `downloads.spansh.co.uk/*.json.gz` | GET | — | `*` | `accept-ranges: bytes` — échantillonnage par plage possible. |
| `www.edsm.net/api-v1/sphere-systems` | GET | ✅* | `*` | Rayon **max 100 al**. 172 systèmes à 25 al de Sol. |
| `www.edsm.net/api-v1/cube-systems` | GET | ✅* | `*` | Arête **max 200 al**, clamp silencieux. 14 772 systèmes / 864 Ko. |
| `www.edsm.net/api-system-v1/{bodies,stations,factions}` | GET | ✅* | `*` | Système par système. Aucun champ biologique. |
| `api.ardent-insight.com/v2/system/name/{s}/nearest/{service}` | GET | ✅ | reflète l'`Origin` | 10 services. **20 résultats max**, `maxDistance` **ignoré**. |
| `api.ardent-insight.com/v2/commodity/name/{c}/imports` | GET | ✅ | idem | `maxDistance` **fonctionne** ici. La bonne réponse pour les marchandises. |
| `us-central1-canonn-api-236217.cloudfunctions.net/query/codex/ref` | GET | ❌ | `*` | 1 072 entrées + URL de dump CSV géolocalisé par entrée. |
| `…/query/biostats` | GET | ❌ | `*` | 9,5 Mo : contraintes d'atmosphère et de composition par espèce. |
| `inara.cz/inapi/v1/` | POST | ✅ | — | Clé + **whitelist manuelle**. 2 lectures sur 49 events. Pas de stations. |
| `eddn.edcd.io:9500` | ZeroMQ SUB | ✅ | — | Relais live, **sans persistance**. Topic `''`, zlib par message. |

*\* Documentation EDSM derrière Cloudflare (403 aux clients automatisés) ; les
endpoints eux-mêmes répondent normalement.*

**404 à ne pas chercher** : `spansh.co.uk/api`, `/api/docs`,
`/api/openapi.json`, `systems.csv`, `galaxy_1week.json.gz` (c'est
`galaxy_7days`) ; `edsm.net/dump/bodies.json.gz` (retiré ~2020) ;
`edtools.cc/mat`, `/hge`, `/station` ; `api.canonn.tech` (timeout).

---

## Annexe B — Sources

**Documentation primaire Frontier**
- `hosting.zaonce.net/community/journal/v38/Journal_Manual_v38.pdf` — dernière
  version publiée (« Odyssey up to update26 », mai 2026) ; v39+ → 404.
- Notes de patch officielles via l'API Steam News (`appid=359320`), balayage
  2020 → août 2026.

**Documentation communautaire**
- `elite-journal.readthedocs.io` — miroir du manuel, plus à jour sur `LegalState`
  et `Flags2`.
- `github.com/EDCD/EDDN` — schémas et règles normatives d'augmentation.
- `github.com/EDCD/FDevIDs` (`material.csv`, `outfitting.csv`) et
  `github.com/EDCD/coriolis-data` — données de jeu, plus fiables qu'un wiki.

**Lecteurs de journal de référence**
- `github.com/EDCD/EDMarketConnector` — `monitor.py`, `dashboard.py`,
  `journal_lock.py`, `plugins/eddn.py`.
- `github.com/MagicMau/EliteJournalReader` — `JournalWatcher.cs`,
  `JournalRecordFramer.cs`, `JournalSessionSelector.cs`, `StatusWatcher.cs`.
- `github.com/EDCD/EDDI` — `LogMonitor.cs`, `StatusService.cs`,
  `JournalMonitor.cs`, et ses payloads de test réels (jusqu'à janvier 2026).

**Exobiologie**
- `github.com/Silarn/EDMC-BioScan` et `EDMC-ExploData` — rulesets par genre,
  valeurs par espèce, gestion des morts et des ventes.
- `github.com/canonn-science/EDMC-Canonn` — distances d'échantillonnage.
- Canonn Research : `canonn.science`, API Cloud Functions.

**Données galactiques**
- `spansh.co.uk/dumps`, `downloads.spansh.co.uk`, `docs.spansh.co.uk`,
  `github.com/spansh/elite_dangerous_schemas` (MIT).
- `edsm.net` — dumps nocturnes et `api-v1` / `api-system-v1`.
- `github.com/iaincollins/ardent-api` (AGPL-3.0) et `api.ardent-insight.com`.

**Matériaux et ingénierie**
- `inara.cz/elite/blueprint/2/`, `/engineer/1/`, `/equipment-blueprint/4/`,
  `/componentitem/*`, `/component/*`.
- `elite-dangerous.fandom.com` — *Material Trader*, *Raw/Manufactured/Encoded
  Materials*, *High Grade Emissions*, *Dav's Hope*, *John Jameson*, *Artemis
  Suit*, *Settlement*, *Bartender*, *Pioneer Supplies*, *Redeployment*, et les
  pages des six modifications de combinaison.
- `github.com/msarilar/EDEngineer`, `edsy.org` (`eddb.js`, `edsy.js`).

**Guides identifiés comme faux aujourd'hui**
- `newp.io/ody-engineering` — liste encore les Power Regulators et surestime
  massivement les coûts (état d'avant août 2024).
- Tout guide citant les coordonnées Legacy de Dav's Hope (`44.8180, -31.3893`).
- Tout guide exigeant « High Tech + Boom » pour les HGE : l'économie n'est pas un
  critère, et l'allégeance domine l'état de faction.
- Tout guide budgétant des rolls de rattrapage aléatoires : ils sont
  déterministes depuis le 7 août 2024.
