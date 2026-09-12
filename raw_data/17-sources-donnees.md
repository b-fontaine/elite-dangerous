---
id: 17-sources-donnees
titre: "Sources de données disponibles pour Elite Dangerous"
domaine: meta-outils
entites: [Player Journal, Status.json, EDDN, Companion API (CAPI), EDSM, Inara, Spansh, EDCD/FDevIDs, EDCD/coriolis-data, Canonn Research, Ardent Insight, Elite BGS, blueprints.json, specials.json, outfitting.csv, shipyard.csv, commodity.csv, rare_commodity.csv, commit épinglé]
mots_cles_en: [player journal, Status.json, EDDN, Companion API, EDSM, Inara, Spansh, galaxy dump, nightly dumps, FDevIDs, coriolis-data, ScanOrganic, blueprints.json, specials.json, outfitting.csv, shipyard.csv, bulkheads, pinned commit, commit SHA, shallow clone]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-10
confiance_globale: haute
volatilite: haute
sources_primaires: [étude interne de faisabilité du 19 août 2026, EDCD/EDDN, elite-journal.readthedocs.io, Journal Manual v38 de Frontier, edsm.net (api-v1 à api-logs-v1), docs.spansh.co.uk, EDCD/FDevIDs (commit c35612952dd6a547d1a7ac4cffab9c7051e86579), EDCD/coriolis-data (commit 0db9234b5b9ce8c939ea84133d7ce336eea88e27), Steam News Frontier (appid 359320)]
zones_incertaines: ["aucune source Frontier consultable ne confirme la date d'arrêt définitif des serveurs Legacy", "le contrat exact des routes d'API de Spansh est reconstitué par sondage, sans garantie de stabilité publiée", "divergence de domaine pour l'API Inara entre la documentation (inara.cn) et l'endpoint sondé (inara.cz)", "aucune limite de débit chiffrée n'est publiée pour Inara, Spansh et la CAPI", "la signification du booléen ScanOrganic.WasLogged, absent du manuel v38, reste une hypothèse", "la cadence réelle de mise à jour de EDCD/coriolis-data et de EDCD/FDevIDs n'est pas mesurable : les clones utilisés sont superficiels et ne portent que leur commit de tête", "EDCD/FDevIDs ne publie aucun fichier de licence, ce qui laisse indéterminé le statut de réutilisation de ses tables d'identifiants"]
guides_lies: [3, 4, 6, 10, 16, 18, 19, 20, 21, 28]
---

# Sources de données disponibles pour Elite Dangerous

## En bref

Elite Dangerous n'expose **aucune API publique officiellement documentée** : son écosystème de données repose sur trois
piliers et une couche d'agrégateurs communautaires. Le **Player Journal** est un fichier local *append-only*, une ligne
JSON autonome par événement, avec rotation à **500 000 lignes**, accompagné de **dix fichiers d'état** dont
`Status.json` et ses bitfields `Flags` (32 bits) et `Flags2`. **EDDN** (*Elite Dangerous Data Network*), bus pub/sub
maintenu par EDCD, relaie ces journaux en temps réel — POST HTTPS vers `eddn.edcd.io:4430`, écoute ZeroMQ sur le port
9500, messages plafonnés à **1 MiB compressé** — sans jamais rien archiver. La **Companion API** (*CAPI*) de Frontier,
non documentée, donne accès en OAuth2 aux données d'un commandant identifié. Par-dessus, **EDSM** (**360
requêtes/heure**), **Inara**, **Spansh** (quatorze dumps dont `galaxy.json.gz` à **115,8 Go**) et **Canonn Research**
republient des vues dérivées. Le chiffre vient de deux dépôts EDCD : `coriolis-data` — 47 vaisseaux, 89 familles
de modules, 81 blueprints, 91 effets expérimentaux — et `FDevIDs`, 27 tables d'identifiants extraites du jeu. Clonés
en local et cités par leur commit, ils restent lisibles quand tout le reste répond HTTP 403.

## Vue d'ensemble de l'écosystème de données d'Elite Dangerous — journal, EDDN, CAPI

Elite Dangerous, développé par Frontier Developments, ne propose pas d'API publique officiellement documentée au sens
classique du terme (pas de portail développeur, pas de clé d'API grand public, pas de SLA). Malgré cette absence de
support officiel, un écosystème tiers très riche s'est construit depuis plus d'une décennie autour de trois piliers
complémentaires :

1. **Le Player Journal** — des fichiers texte JSON écrits localement par le client de jeu sur la machine du joueur.
   C'est la source la plus riche, la plus complète et la plus fiable, mais elle est strictement locale : il faut un
   logiciel tournant sur la machine du joueur pour l'exploiter ou la republier.
2. **EDDN (Elite Dangerous Data Network)** — un bus pub/sub communautaire, maintenu par EDCD (Elite Dangerous Community
   Developers), qui agrège en temps quasi réel les journaux de milliers de joueurs volontaires ayant installé un outil
   compatible.
3. **La Frontier Companion API (CAPI)** — une API HTTP non documentée officiellement par Frontier, conçue à l'origine
   pour l'application mobile « Cmdr's Companion App », mais réutilisée (tolérée, non garantie contractuellement) par les
   outils tiers via OAuth2.

Autour de ces trois piliers gravitent des **agrégateurs communautaires** qui republient des données dérivées via leurs
propres API publiques : EDSM (Elite Dangerous Star Map), Inara, Spansh (successeur de fait d'EDDB), ainsi que des
projets thématiques spécialisés comme Canonn Research pour les ruines Guardian et l'exobiologie, ou des outils de niche
comme Ardent Insight (marché) et Elite BGS (BGS, voir [glossaire](./00-glossaire.md)).

Pour un projet tiers, le choix de la ou des sources dépend essentiellement de trois questions : a-t-on besoin de temps
réel ou un chargement périodique suffit-il ? a-t-on besoin de données privées liées à un commandant identifié
(nécessitant une authentification) ou seulement de données publiques agrégées ? et quel volume de données faut-il
ingérer et stocker (quelques événements par session de jeu, ou des centaines de millions d'enregistrements
galactiques) ?

## 1. Le journal de jeu local (Player Journal)

### Player Journal : nature et emplacement des fichiers écrits par le jeu

À chaque session de jeu, le client Elite Dangerous écrit un fichier texte **append-only** dans le dossier de sauvegarde
du joueur, nommé selon le motif `Journal.<timestamp>.<part>.log`. Un nouveau fichier est créé à chaque lancement du jeu,
avec une rotation possible en cours de session (le jeu peut démarrer un nouveau fichier `.log` en cours de route).
Chaque ligne du fichier est un objet **JSON complet et autonome**, terminé par un retour à la ligne : un événement par
ligne, ce qui rend le format trivialement « streamable » ligne par ligne (pas besoin de parser un document JSON global).

### Player Journal : nommage, rotation et lecture concurrente du fichier

Les éléments de cette sous-section proviennent de l'étude interne
`docs/faisabilite-spansh-temps-reel-materiaux.md` (§ 2.1, étude datée du **19 août 2026**), qui les a établis en
croisant le *Journal Manual v38* de Frontier — publié en mai 2026, dernière version disponible, les révisions
ultérieures renvoyant une erreur 404 — et le code des trois lecteurs de référence de l'écosystème : E:D Market
Connector (EDMC), EDDI et EliteJournalReader. Le manuel est catégorique sur la structure du fichier et **muet sur tout
le reste** : il ne mentionne ni vidage de tampon, ni verrouillage de fichier. Tout ce qui suit relève donc de la
convergence observée entre les implémentations, non d'une garantie de l'éditeur.

**Deux motifs de nom coexistent** dans un même dossier de sauvegarde :

```
Journal.220315152335.01.log          ← ancien motif (Horizons / Legacy)
Journal.2022-03-15T152503.01.log     ← motif actuel, depuis Odyssey Update 11 (15 mars 2022)
```

Les préfixes `JournalAlpha` et `JournalBeta` existent également, pour les clients de test.

Conséquence pratique fréquemment sous-estimée : **un tri lexical sur le nom de fichier est faux** dès qu'un commandant
a joué avant et après mars 2022, puisque `Journal.22…` se classe avant `Journal.2022-…` (le caractère `2` l'emporte sur
`0` en troisième position). Le fichier désigné comme « le plus récent » est alors un fichier de 2022. EDMC a corrigé
exactement ce défaut dans ses versions **5.3.3 et 5.3.4**. Trois stratégies de référence coexistent : EDMC retient la
date de création la plus élevée ; EDDI trie par date de dernière écriture décroissante, en forçant un rafraîchissement
du cache de métadonnées du système de fichiers ; EliteJournalReader analyse le nom (les deux motifs), regroupe les
fichiers par session, puis ordonne les parts **numériquement**. La troisième est la plus robuste, avec repli sur la
date de modification lorsque l'analyse du nom échoue.

**Deux causes seulement ouvrent un nouveau fichier** : le démarrage du client — la première ligne est alors un
événement `Fileheader` portant `part`, `odyssey`, `gameversion`, `build` et `language` — et le franchissement de
**500 000 lignes**, seul seuil de rotation documenté, exprimé en lignes et non en octets, signalé par un événement
`Continued` qui porte le numéro de la part suivante.

**Le fichier n'est pas verrouillé** pendant que le jeu tourne. Les trois lecteurs de référence l'ouvrent en partage
lecture + écriture (`FileShare.ReadWrite` côté .NET, `open(logfile, 'rb', 0)` non tamponné côté Python) et sa taille
progresse de façon observable : EDDI ne détecte les ajouts que par delta de la longueur du fichier, toutes les 100 ms.

**Le risque de ligne incomplète est réel mais bien cerné.** Un lecteur qui suit la fin du fichier peut tomber sur une
ligne à moitié écrite. La parade éprouvée consiste à ne valider l'offset de lecture que jusqu'au **dernier retour à la
ligne**, à conserver les octets en attente entre deux passes, et à gérer le BOM UTF-8 ainsi que le retour chariot :
c'est le rôle du `JournalRecordFramer` ajouté à EliteJournalReader en août 2026, qui ne transmet que des
enregistrements complets terminés par un saut de ligne. EDMC, à l'inverse, ne traite pas ce cas et perd la ligne
concernée — ce qui, sur un flux d'exobiologie, revient à perdre un `ScanOrganic` de temps à autre.

### Player Journal : format d'un événement (`timestamp`, `event`, champs `_Localised`)

Chaque ligne du Player Journal contient au minimum deux champs communs à tous les événements :

- `"timestamp"` : horodatage au format ISO 8601 (exemple : `2016-06-10T14:31:00Z`) ;
- `"event"` : le type d'événement (chaîne de caractères identifiant le schéma des champs qui suivent).

Le reste des champs dépend du type d'événement. Le format inclut également, pour de nombreux champs textuels, une
variante `_Localised` en parallèle du champ canonique — un texte déjà traduit dans la langue du client de jeu. Ces
champs `_Localised` doivent être ignorés ou retirés par tout outil qui republie les données : c'est d'ailleurs une règle
imposée par EDDN à ses émetteurs.

#### Exemple concret : une ligne de Player Journal (`FSDJump`)

L'exemple ci-dessous est illustratif (valeurs plausibles, structure conforme au format documenté) : une seule ligne de
`Journal.<timestamp>.<part>.log`, un objet JSON complet, à copier telle quelle pour tester un parseur :

```json
{"timestamp":"2024-05-12T18:42:11Z","event":"FSDJump","StarSystem":"Wyrd","SystemAddress":908440887131,"StarPos":[130.65625,-46.09375,-52.90625],"SystemAllegiance":"Independent","SystemEconomy":"$economy_HighTech;","SystemEconomy_Localised":"High Tech","SystemSecondEconomy":"$economy_Industrial;","SystemSecondEconomy_Localised":"Industrial","SystemGovernment":"$government_Democracy;","SystemGovernment_Localised":"Democracy","SystemSecurity":"$SYSTEM_SECURITY_high;","SystemSecurity_Localised":"High Security","Population":15000000,"Body":"Wyrd A","BodyID":1,"BodyType":"Star","JumpDist":18.421,"FuelUsed":4.032156,"FuelLevel":28.451234}
```

Un pipeline d'ingestion doit, avant de republier ou de stocker cette ligne, retirer les champs `_Localised`
(`SystemEconomy_Localised`, `SystemSecondEconomy_Localised`, `SystemGovernment_Localised`, `SystemSecurity_Localised`
ci-dessus) s'il republie vers EDDN.

### Player Journal : historique et versioning du format (Journal Manual v38, mai 2026)

Le format du journal est **versionné et documenté par un changelog** (la version 37 a été documentée en mai 2023 ; la
dernière révision publiée du *Journal Manual* est la **v38**, de mai 2026, couvrant Odyssey jusqu'à l'update 26 — les
révisions ultérieures renvoient une erreur 404, constat de l'étude interne du 19 août 2026),
avec des ajouts continus à chaque mise à jour majeure du jeu — par exemple la restauration de l'événement `CarrierJump`,
l'ajout de paramètres liés aux Thargoids sur les événements de saut, ou l'ajout de `SupercruiseDestinationDrop`. Le
format continue d'évoluer au rythme des extensions du jeu : Odyssey (voyage à pied) puis la fonctionnalité de
**Colonisation** (voir [Colonisation](./18-colonisation.md), bêta le 26 février 2025, sortie complète le 11 novembre
2025) ont chacune ajouté de nouveaux événements. Tout pipeline d'ingestion doit donc être conçu comme tolérant à des
événements et des champs inconnus plutôt que reposer sur un schéma figé.

### Player Journal : catégories principales d'événements

| Catégorie                   | Exemples d'événements                                                                                                                                                        |
|-----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Démarrage / session         | `Fileheader`, `LoadGame`, `Rank`, `Progress`, `Location`                                                                                                                     |
| Navigation / voyage         | `FSDJump`, `StartJump`, `SupercruiseExit`, `SupercruiseDestinationDrop`, `CarrierJump`, `CarrierJumpRequest`, `CarrierJumpCancelled`, `NavRouteClear`                        |
| Station                     | `Docked`, `Undocked`, `DockingRequested`, `DockingGranted`, `DockingDenied`                                                                                                  |
| Exploration / scan          | `Scan`, `ScanOrganic` (exobiologie), `SellExplorationData`, `SellOrganicData`, `CodexEntry`, `FSSDiscoveryScan`, `FSSAllBodiesFound`, `FSSBodySignals`, `ApproachSettlement` |
| Ravitaillement / réparation | `RefuelAll`, `RepairAll`                                                                                                                                                     |
| Combat                      | `Interdicted`, `EscapeInterdiction`, `FactionKillBond`, `Bounty`                                                                                                             |
| Missions                    | `MissionAccepted`, `MissionCompleted`, `MissionFailed`                                                                                                                       |
| Odyssey (à pied)            | `Touchdown`, `Liftoff`, `Backpack`, `BackpackChange`, `SuitLoadout`, `UpgradeSuit`, `UpgradeWeapon`, `BookTaxi`                                                              |
| Équipage                    | `CrewMemberJoins`, `CrewMemberQuits`, `CrewLaunchFighter`, `KickCrewMember`                                                                                                  |
| Économie / légal            | `PayFines`, `PayBounties`, `ClearImpound`, `RedeemVoucher`, `CargoTransfer`, `FCMaterials` (Fleet Carrier, voir [Fleet Carriers](./19-fleet-carriers.md))                    |

### Player Journal : sémantique des événements, les règles non triviales

Connaître la liste des événements ne suffit pas ; leur sémantique réserve plusieurs pièges qui font qu'un parseur
« naïf » produit des données fausses sans jamais échouer. Les règles ci-dessous sont reprises de l'étude interne
`docs/faisabilite-spansh-temps-reel-materiaux.md` (§ 2.2, 19 août 2026), qui les a vérifiées sur sources primaires
(manuel Frontier, code d'EDMC, d'EDDI et d'EliteJournalReader, journaux réels).

#### Localisation et corps courant dans le Player Journal : les quatre règles contre-intuitives

**Le système courant ne vient que de trois événements** — `FSDJump`, `CarrierJump` et `Location`. C'est la règle
normative qu'EDDN impose à ses contributeurs : les coordonnées `StarPos` d'un message doivent provenir du dernier
`FSDJump`, `CarrierJump` ou `Location`. En conséquence, `FSSBodySignals`, `SAASignalsFound`, `SAAScanComplete` et
`ScanOrganic` **ne portent que `SystemAddress`, jamais le nom du système** : un consommateur doit mémoriser le contexte
de localisation lui-même.

**`Location` est écrit à chaque démarrage** (ou lors d'une résurrection en station), **mais pas après une rotation de
fichier**. Un lecteur qui n'ouvre que le fichier le plus récent perd donc système et corps jusqu'au saut suivant.

**Le suivi du corps courant obéit à des règles contre-intuitives**, documentées dans le code d'EDMC : `ApproachBody`
pose le corps courant, `LeaveBody` l'enlève, `SupercruiseExit` **ne change rien** (il n'indique aucun changement de
présence à proximité d'un corps), et `SupercruiseEntry` **ne libère pas** le corps sauf s'il s'agissait d'une station —
parce qu'aucun nouvel `ApproachBody` ne sera émis si le pilote ne quitte pas la croisière orbitale avant de se reposer.
La seule vérification fiable passe par le champ `BodyName` de `Status.json`.

**`CarrierLocation` est un piège absent de la documentation.** Sa charge utile réelle ressemble à
`{"event":"CarrierLocation","CarrierID":3705689344,"StarSystem":"HR 3635","SystemAddress":1694121347427,"BodyID":1}` :
elle décrit la position **du porte-vaisseaux**, pas celle du joueur. Un parseur qui raisonne « cet événement porte
`StarSystem` et `SystemAddress`, donc c'est mon système » téléporte le commandant à tort. `CarrierJump`, lui, désigne
bien le joueur (voir [Fleet Carriers](./19-fleet-carriers.md)).

#### Exobiologie dans le Player Journal : rattacher, valoriser et ne pas compter deux fois un échantillon

**`ScanOrganic.Body` contient un entier qui est le `BodyID`**, et non un nom de corps — EDDI le signale explicitement.
La jointure avec les autres événements passe donc par le couple `(SystemAddress, BodyID)`.

**`SellOrganicData` porte `MarketID` à la racine**, pas dans son tableau `BioData[]`, et **ne porte aucun
`SystemAddress`** : il est impossible de rattacher une vente à un système à partir de ce seul événement. Une vente
réelle contient couramment plus de quarante entrées.

**Le champ `Bonus` vaut exactement 4 × `Value`** lorsqu'il est non nul — soit un paiement total de 5 × `Value` —, et il
s'applique **par échantillon, pas par espèce** : une même espèce peut apparaître deux fois dans le même événement, une
fois avec `Bonus: 0` et une fois avec un bonus. Voir [Exploration](./10-exploration.md) pour la mécanique de vente des
données d'exobiologie.

**Le journal ne contient aucune table de prix.** La valeur d'un échantillon n'apparaît qu'au moment de la vente. Pour
estimer la valeur de données biologiques non encore vendues, il faut une table externe **par espèce** (les variantes de
couleur partagent la même valeur) — d'où l'intérêt du catalogue hors ligne décrit en section 12.

**Aucun événement ne signale la perte des données biologiques à la mort.** Il faut l'inférer de la séquence `Died` puis
`Resurrect`, en filtrant sur `Resurrect.Option ∈ {escape, recover, rejoin}` : c'est la stratégie retenue par BioScan,
le plugin d'exobiologie de référence, qui persiste des tables de morts et de résurrections et compare leurs
horodatages à ceux des ventes. Sans cela, un cumul de « données collectées non vendues » enfle indéfiniment avec des
organismes perdus en mourant.

#### Deux pièges de forme du Player Journal à traiter dès le parseur (`Signals[].Type`, `Variant`)

Ces deux pièges tiennent à la forme des valeurs elles-mêmes, et non à la sémantique des événements :

1. **`Signals[].Type` prend deux formes incompatibles.** Les six catégories de signaux de surface sont préfixées
   (`$SAA_SignalType_Biological;` et consorts), mais le **même** événement `SAASignalsFound` émis sur un **anneau**
   rend des noms de minerais non préfixés. Exemples réels :

   ```json
   {"Type":"LowTemperatureDiamond","Type_Localised":"Low Temperature Diamonds","Count":1}
   {"Type":"Alexandrite","Count":1}
   ```

   Le second n'a même pas de jumeau `_Localised`. Il faut filtrer sur le préfixe exact et ignorer silencieusement le
   reste (voir [Minage](./20-minage.md) pour les minerais concernés).
2. **`Variant` n'est pas toujours distinct de `Species`.** Pour les organiques « sans genre » (Bark Mounds, Brain
   Trees, Anemones, Amphora Plant, Crystalline Shards, Radicoida), `Genus == Species == Variant`. Et le suffixe de
   variante n'est pas toujours une lettre : on rencontre `$Codex_Ent_Bacterial_10_Antimony_Name;`, `_Ruthenium_Name;`
   ou `_Tellurium_Name;` à côté de `_A_Name;`, `_F_Name;` et `_M_Name;`.

#### Champs et événements du Player Journal à surveiller, faute d'autre source

Les entrées ci-dessous portent une information qu'**aucune autre source ne donne** :

| Événement / champ                     | Ce qu'il apporte                                                                              |
|---------------------------------------|-----------------------------------------------------------------------------------------------|
| `SAASignalsFound.Genuses[]`           | La liste des **genres réellement présents** sur un corps, sans passer par un service tiers    |
| `FSSDiscoveryScan` + `FSSAllBodiesFound` | Savoir si le système est **entièrement découvert**, donc s'il reste du travail au FSS       |
| `SAAScanComplete`                     | Corps **cartographié**, avec `ProbesUsed` et `EfficiencyTarget`                               |
| `Scan.WasDiscovered` / `Scan.WasMapped` | Savoir si le corps était **déjà découvert ou cartographié** avant vous (prime de première)   |
| `CodexEntry`                          | Première du commandant (`IsNewEntry`), avec `Region`, latitude et longitude                   |
| `Died` + `Resurrect`                  | Distinguer les données biologiques **vendues** de celles **perdues à la mort**                |
| `Continued`                           | Suivre proprement la rotation de fichier à 500 000 lignes                                     |

**Un ajout récent à guetter** : `ScanOrganic` porte désormais un booléen optionnel **`WasLogged`**, observé dans un
journal réel du **17 janvier 2026**. Il est absent du manuel v38, d'EDMC et d'EliteJournalReader, mais lu par BioScan.
S'il signifie bien « cette espèce était-elle déjà enregistrée par ce commandant », il évite de rejouer des années de
journaux pour déterminer si une découverte est une première — ce qui reste aujourd'hui le seul moyen de le savoir,
puisque le jeu n'exporte jamais l'état du codex.

### Le fichier `Status.json` — instantané de l'état courant du vaisseau ou du personnage

En complément du journal append-only, le jeu maintient un fichier `Status.json` **réécrit en continu** : ce n'est pas un
flux d'événements mais un **instantané de l'état courant** du vaisseau ou du personnage — position, carburant, cargo,
pips d'énergie, mode actif (vaisseau / à pied / véhicule), ainsi que des champs `Flags`/`Flags2` sous forme de bitfields.
Ce fichier est la source privilégiée des overlays, HUD externes et intégrations HOTAS/Stream Deck qui ont besoin de
l'état instantané du jeu sans avoir à parser l'intégralité du journal.

#### `Status.json` : cadence d'écriture, champs utiles et pièges de lecture

Précisions sur `Status.json` relevées par l'étude interne `docs/faisabilite-spansh-temps-reel-materiaux.md`
(§ 2.1, 19 août 2026) :

- Le fichier entier est **tronqué puis réécrit** à chaque changement, sur une **seule ligne** portant
  `"event":"Status"`. Frontier annonce une réécriture « toutes les quelques secondes » ; EliteJournalReader mesure en
  pratique de l'ordre d'une fois par seconde.
- Champs utiles au-delà des bitfields : `BodyName`, `Latitude` / `Longitude` / `Altitude` / `Heading` (présents
  seulement sur ou près d'une planète), `Destination{System, Body, Name}`, `Fuel`, `Balance`, `LegalState`, et à pied
  `Oxygen`, `Health`, `Temperature`, `Gravity`.
- Les **seuils de déclenchement positionnels sont chiffrés** : une réécriture est provoquée à partir de **0,02° de
  latitude ou de longitude en vol**, et **0,0005° en SRV**.
- **Piège 1 — le fichier peut être lu vide ou partiel**, précisément parce qu'il est tronqué puis réécrit en place.
  EDMC teste la non-vacuité du contenu avant de le décoder ; EliteJournalReader réessaie jusqu'à cinq fois sur erreur
  d'entrée/sortie **et** sur erreur d'analyse JSON ; EDDI attend simplement la passe suivante. Un échec de lecture sur
  un tick n'est pas une anomalie, c'est le fonctionnement normal.
- **Piège 2 — le fichier est partagé entre le client bêta et le client live.** EDMC s'en protège en filtrant sur
  l'horodatage de l'événement, qui doit être postérieur au `LoadGame` de la session en cours.
- Deux comportements supplémentaires, relevés en conditions réelles lors de la mise en œuvre (retour du 20 août 2026
  consigné dans la même étude) : le fichier vaut **`{"Flags":0}` au menu principal**, et il **ne comporte pas de champ
  `Flags2` sur un client Horizons** — un parseur doit donc traiter `Flags2` comme facultatif.

#### Les dix fichiers d'état du dossier de sauvegarde d'Elite Dangerous

`Status.json` n'est pas seul : le jeu maintient **dix fichiers d'état** dans le même dossier que le journal, chacun
associé à un événement déclencheur littéral écrit dans le journal au moment où le fichier est rafraîchi.

| Fichier           | Événement déclencheur dans le journal                            |
|-------------------|------------------------------------------------------------------|
| `Status.json`     | aucun (réécrit en continu)                                       |
| `Cargo.json`      | `Cargo`                                                          |
| `Market.json`     | `Market`                                                         |
| `Outfitting.json` | `Outfitting`                                                     |
| `Shipyard.json`   | `Shipyard`                                                       |
| `NavRoute.json`   | `NavRoute` (vidé sur `NavRouteClear`)                            |
| `ModulesInfo.json`| `ModuleInfo` (événement au singulier, fichier au pluriel)        |
| `ShipLocker.json` | `ShipLocker`                                                     |
| `Backpack.json`   | `Backpack` et `Resupply`                                         |
| `FCMaterials.json`| `FCMaterials` (Fleet Carrier, voir [Fleet Carriers](./19-fleet-carriers.md)) |

Deux conséquences importantes pour un consommateur :

- **L'événement ne remplace pas le fichier.** Le cas le plus piégeux est `ShipLocker` : le manuel précise que la liste
  complète de l'inventaire à pied n'est écrite dans l'événement **qu'au démarrage et à l'embarquement** ; le reste du
  temps l'événement n'est qu'un marqueur et le contenu réel n'est que dans `ShipLocker.json`. EDMC note même que
  **depuis la version 4.0.0.400 le jeu écrit un événement `ShipLocker` vide**. Un outil qui ne lit que le journal voit
  donc un inventaire figé en cours de session (voir [Équipement à pied](./07-equipement-a-pied.md) pour l'inventaire
  concerné).
- **Il existe un décalage entre l'événement et le fichier annexe** : l'événement arrive avant que le fichier soit à
  jour. EDMC réessaie **11 fois** pour `NavRoute` et `FCMaterials` en rejetant tout écart supérieur à **5 secondes**,
  et **5 fois avec 10 ms de pause** pour `ShipLocker`, en attrapant à la fois l'absence de fichier et l'erreur
  d'analyse JSON.

À l'inverse, un point favorable : le jeu **réécrit `Statistics`, `EngineerProgress`, `Loadout`, `Reputation`,
`ShipLocker` et `Powerplay` à chaque démarrage de session**. Un outil qui surveille le journal récupère donc
gratuitement l'état courant du commandant dès que le pilote lance le jeu, sans avoir à interroger la CAPI.

#### Table des bitfields `Flags` de `Status.json` (32 bits, état du vaisseau)

`Flags` encode l'état général du vaisseau/personnage sur 32 bits (source : documentation communautaire du journal,
« Elite Dangerous Journal Manual », section *Status File*) :

| Bit | Valeur (déc.) | Hex         | Signification                                  |
|-----|---------------|-------------|-------------------------------------------------|
| 0   | 1             | 0000 0001   | Docked (amarré, sur un pad)                     |
| 1   | 2             | 0000 0002   | Landed (posé sur une surface planétaire)        |
| 2   | 4             | 0000 0004   | Landing Gear Down (train d'atterrissage sorti)  |
| 3   | 8             | 0000 0008   | Shields Up (boucliers actifs)                   |
| 4   | 16            | 0000 0010   | Supercruise                                     |
| 5   | 32            | 0000 0020   | FlightAssist Off                                |
| 6   | 64            | 0000 0040   | Hardpoints Deployed                             |
| 7   | 128           | 0000 0080   | In Wing                                         |
| 8   | 256           | 0000 0100   | LightsOn                                        |
| 9   | 512           | 0000 0200   | Cargo Scoop Deployed                            |
| 10  | 1 024         | 0000 0400   | Silent Running                                  |
| 11  | 2 048         | 0000 0800   | Scooping Fuel                                   |
| 12  | 4 096         | 0000 1000   | SRV Handbrake                                   |
| 13  | 8 192         | 0000 2000   | SRV using Turret view                           |
| 14  | 16 384        | 0000 4000   | SRV Turret retracted (proche du vaisseau)       |
| 15  | 32 768        | 0000 8000   | SRV DriveAssist                                 |
| 16  | 65 536        | 0001 0000   | FSD MassLocked                                  |
| 17  | 131 072       | 0002 0000   | FSD Charging                                    |
| 18  | 262 144       | 0004 0000   | FSD Cooldown                                    |
| 19  | 524 288       | 0008 0000   | Low Fuel (< 25 %)                                |
| 20  | 1 048 576     | 0010 0000   | Overheating (> 100 %)                           |
| 21  | 2 097 152     | 0020 0000   | Has Lat/Long                                    |
| 22  | 4 194 304     | 0040 0000   | Is In Danger                                    |
| 23  | 8 388 608     | 0080 0000   | Being Interdicted                               |
| 24  | 16 777 216    | 0100 0000   | In Main Ship                                    |
| 25  | 33 554 432    | 0200 0000   | In Fighter                                      |
| 26  | 67 108 864    | 0400 0000   | In SRV                                          |
| 27  | 134 217 728   | 0800 0000   | HUD in Analysis mode                            |
| 28  | 268 435 456   | 1000 0000   | Night Vision                                    |
| 29  | 536 870 912   | 2000 0000   | Altitude from Average radius (voir note ci-dessous) |
| 30  | 1 073 741 824 | 4000 0000   | FSD Jump                                        |
| 31  | 2 147 483 648 | 8000 0000   | SRV High Beam                                   |

Si le bit 29 est actif, la valeur `Altitude` est calculée à partir du rayon moyen de la planète (utilisé en haute
altitude) ; s'il est inactif, elle provient d'un raycast vers la surface réelle sous le vaisseau/SRV.

#### Le piège du Nomad dans `Status.json` : trois véhicules pour deux bits d'état

Les bits 24, 25 et 26 de la table `Flags` ci-dessus (« In Main Ship », « In Fighter », « In SRV ») ont été conçus
quand il n'existait que trois situations possibles. Depuis la mise à jour Operations, il en existe une quatrième :
le **Nomad**, vaisseau lancé depuis un vaisseau (*ship-launched vessel*), « déployable depuis
une baie de vaisseau compatible, y compris les modules MK I et MK II » (« Elite Dangerous | Operations Update »,
1er juillet 2026, 14:01 UTC). Aucun bit ne lui a été attribué : **le Nomad lève le bit 26 (« In SRV ») et non le bit
25 (« In Fighter »)**. Un parseur qui déduit du seul bit 26 « le commandant conduit un SRV » se trompe donc de
véhicule, et un parseur qui suit le bit 25 pour détecter un véhicule lancé depuis le vaisseau ne verra jamais le
Nomad. Côté journal, le véhicule se reconnaît à son **identifiant interne `Lander01`** : l'événement `DockSRV` porte
`"SRVType": "lander01"` avec `"SRVType_Localised": "Nomad"`, et `LoadGame` porte `"Ship": "Lander01"` avec
`"Ship_Localised": "Nomad"`. *(Ce comportement n'est pas documenté par Frontier. Il est établi par deux corroborations
d'outils communautaires : la note de version 1.11.726 d'EDCoPilot, du 1er juillet 2026, qui corrige explicitement le
basculement erroné de son suivi en mode SRV « parce que le Nomad lève le drapeau SRV, et non le drapeau fighter, dans
`Status.json` » ; et l'issue `EDCD/EDDI` n° 2849 du 5 août 2026, dont le journal brut joint porte les deux événements
ci-dessus en `gameversion` 4.4.0.3.)*

#### Table des bitfields `Flags2` de `Status.json` (Odyssey, à pied)

| Bit | Valeur (déc.) | Hex       | Signification                                                  |
|-----|---------------|-----------|------------------------------------------------------------------|
| 0   | 1             | 0001      | On Foot                                                          |
| 1   | 2             | 0002      | In Taxi (ou navette/dropship)                                    |
| 2   | 4             | 0004      | In Multicrew (dans le vaisseau d'un autre commandant)            |
| 3   | 8             | 0008      | On Foot In Station                                               |
| 4   | 16            | 0010      | On Foot On Planet                                                |
| 5   | 32            | 0020      | Aim Down Sight                                                   |
| 6   | 64            | 0040      | Low Oxygen                                                       |
| 7   | 128           | 0080      | Low Health                                                       |
| 8   | 256           | 0100      | Cold                                                              |
| 9   | 512           | 0200      | Hot                                                               |
| 10  | 1 024         | 0400      | Very Cold                                                        |
| 11  | 2 048         | 0800      | Very Hot                                                         |
| 12  | 4 096         | 1000      | Glide Mode                                                       |
| 13  | 8 192         | 2000      | On Foot In Hangar                                                |
| 14  | 16 384        | 4000      | On Foot Social Space                                             |
| 15  | 32 768        | 8000      | On Foot Exterior                                                 |
| 16  | 65 536        | 0001 0000 | Breathable Atmosphere                                            |
| 17  | 131 072       | 0002 0000 | Telepresence Multicrew                                           |
| 18  | 262 144       | 0004 0000 | Physical Multicrew                                               |
| 19  | 524 288       | 0008 0000 | FSD Hyperdrive Charging                                          |
| 20  | 1 048 576     | 0010 0000 | Supercruise Overdrive (SCO, voir [glossaire](./00-glossaire.md)) Active |
| 21  | 2 097 152     | 0020 0000 | Supercruise Assist (SCA) active (alignée et à pleine allure en zone bleue) |

Exemple documenté : `"Flags": 16842765` (soit `0x0101000D`) correspond aux bits 24, 16, 3, 2 et 0 combinés — c'est-à-dire
« dans le vaisseau principal, FSD mass-locked, boucliers actifs, train sorti, amarré ».

### Bonnes pratiques d'ingestion du Player Journal

- Lire le journal en mode **« tail »** : suivre la fin du fichier `.log` le plus récent du dossier de sauvegarde.
- Gérer la **rotation de fichier** à chaque (re)lancement du jeu (un nouveau fichier `Journal.<timestamp>.<part>.log`
  apparaît).
- Traiter chaque ligne comme un **événement idempotent et horodaté** — un système d'ingestion robuste doit pouvoir
  rejouer ou dédupliquer un événement sans effet de bord.
- **Ignorer ou valider** les lignes malformées, en particulier la dernière ligne d'un fichier en cours d'écriture (le
  jeu peut être en train d'écrire une ligne au moment de la lecture).

#### Lire le Player Journal : polling ou observateur de fichiers ?

La réponse de l'écosystème est nette : **le polling est la stratégie de référence**, l'observateur de fichiers venant
au mieux en complément. Cadences relevées dans le code des trois lecteurs (étude interne, § 2.1, 19 août 2026) :

| Lecteur              | Journal                                                                                                                                 | `Status.json`                             |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------|
| **EDMC**             | Observateur (watchdog) **uniquement pour détecter un nouveau fichier** ; le contenu est toujours lu en « tail » à **1 s** (`_POLL = 1`, `_INACTIVE_POLL = 10` quand le jeu ne tourne pas) | Watchdog **seulement sur Windows** ; polling 1 s ailleurs |
| **EDDI**             | **Aucun observateur.** Polling pur : **100 ms** si le jeu tourne, 5 s sinon                                                              | Polling 250 ms / 5 s                      |
| **EliteJournalReader** | `FileSystemWatcher` **plus** polling de croissance à **500 ms** **plus** redécouverte du répertoire à 5 s                              | S'appuie sur l'événement `Changed` de l'observateur |

La raison invoquée par EDMC — deux fois dans son code — est que les événements du système de fichiers sont peu fiables,
voire inexistants, sur un montage réseau sous Linux ; comme un programme ne peut pas déterminer facilement qu'un chemin
pointe vers un tel montage, EDMC désactive l'observateur dès que l'utilisateur configure un répertoire personnalisé
hors Windows, et se rabat sur le polling. Un outil tiers visant Linux ou Proton doit donc considérer le polling comme
le mode nominal, et non comme un repli dégradé.

Aucun des trois lecteurs ne **persiste son offset** entre deux exécutions : ils relisent le fichier courant depuis le
début. Un outil qui souhaite reprendre exactement où il s'était arrêté doit gérer lui-même le couple (fichier, offset),
et savoir dédupliquer.

## 2. EDDN (Elite Dangerous Data Network)

### EDDN : principe et architecture (bus pub/sub sans stockage ni archive)

EDDN est un **bus pub/sub communautaire**, maintenu par EDCD. Son principe fondamental, énoncé explicitement dans sa
documentation : *le service EDDN lui-même ne stocke aucune donnée et ne met à disposition aucune archive ni « état
courant »* — c'est un pur relais temps réel entre les joueurs qui publient (via des outils comme E:D Market Connector,
EDDI, EDDiscovery, Elite Log Agent) et les consommateurs qui s'abonnent au flux (EDSM, Inara, Spansh, et tout projet
tiers).

### Les trois environnements EDDN (Live, Beta, Dev) et leurs URLs

EDDN expose trois environnements distincts, chacun avec son propre couple URL d'upload / listener ZeroMQ :

| Environnement | URL d'upload (POST)                      | Listener (ZeroMQ)               |
|---------------|------------------------------------------|---------------------------------|
| Live          | `https://eddn.edcd.io:4430/upload/`      | `tcp://eddn.edcd.io:9500/`      |
| Beta          | `https://beta.eddn.edcd.io:4431/upload/` | `tcp://beta.eddn.edcd.io:9510/` |
| Dev           | `https://dev.eddn.edcd.io:4432/upload/`  | `tcp://dev.eddn.edcd.io:9520/`  |

### EDDN : publier un message (POST HTTPS, `header` et `message`)

La publication d'un message sur EDDN se fait par **POST HTTPS/1.1 obligatoire** (HTTP/2 non supporté) vers l'URL
d'upload, avec un **slash final obligatoire**. Le corps de la requête est un objet JSON composé de :

- un `header`, contenant :
    - `uploaderID` : le pseudo du commandant, obfusqué côté relais pour éviter tout tracking à long terme ;
    - `softwareName` et `softwareVersion` : nom et version uniques identifiant l'outil émetteur ;
    - `gameversion` : dérivé du champ `Fileheader`/`LoadGame` du journal, ou au format `"CAPI-[Live|Legacy]-[endpoint]"`
      lorsque la donnée provient de la CAPI plutôt que du journal (voir plus bas, section 3, la sous-section sur la fin
      des serveurs Legacy et son impact sur ce champ) ;
    - `gamebuild` : recopié tel quel depuis le journal ou la CAPI.
- un `message` conforme au schéma référencé par `$schemaRef`.

La **compression gzip** est acceptée (en-tête `Content-Encoding: gzip`) ; l'envoi en formulaire encodé
(`application/x-www-form-urlencoded`) n'est plus supporté depuis **juin 2022**. Toute donnée personnelle identifiant un
commandant est interdite dans le corps du message (à l'exception de l'`uploaderID` et des indicateurs Horizons/Odyssey),
et les champs `_Localised` doivent être systématiquement retirés avant publication.

#### Exemple concret : un message EDDN complet (`commodity-v3.0`)

L'exemple ci-dessous est illustratif (structure conforme au schéma `commodity-v3.0` documenté dans `EDCD/EDDN`), prêt à
être copié pour tester un client de publication ou un consommateur EDDN :

```json
{
  "$schemaRef": "https://eddn.edcd.io/schemas/commodity/3",
  "header": {
    "uploaderID": "be6c5a4f1f3a2e8d9c0b1a2f3e4d5c6b7a8f9e0d",
    "softwareName": "E:D Market Connector [Windows]",
    "softwareVersion": "5.12.2",
    "gatewayTimestamp": "2024-05-12T18:43:02Z"
  },
  "message": {
    "systemName": "Wyrd",
    "stationName": "Ray Gateway",
    "marketId": 3228948992,
    "timestamp": "2024-05-12T18:42:55Z",
    "commodities": [
      {
        "name": "gold",
        "meanPrice": 9203,
        "buyPrice": 0,
        "sellPrice": 9450,
        "demand": 0,
        "demandBracket": 0,
        "stock": 187,
        "stockBracket": 2,
        "statusFlags": []
      },
      {
        "name": "tea",
        "meanPrice": 1585,
        "buyPrice": 1602,
        "sellPrice": 0,
        "demand": 0,
        "demandBracket": 0,
        "stock": 943,
        "stockBracket": 3,
        "statusFlags": ["Producer"]
      }
    ]
  }
}
```

Un tel message est envoyé tel quel (compressé en gzip en pratique) en `POST` vers l'URL d'upload Live ci-dessus ; côté
listener, les abonnés reçoivent le même objet compressé en zlib.

### EDDN : s'abonner au flux (listener ZeroMQ, messages compressés en zlib)

L'abonnement se fait par une connexion **ZeroMQ** à `tcp://eddn.edcd.io:9500`. Les messages reçus sont compressés en
**zlib** et doivent être décompressés côté client pour obtenir le JSON. Le filtrage par sujet (topic) n'est **pas
supporté côté serveur** avec la version actuelle de ZeroMQ utilisée par EDDN : le filtrage (par exemple ne garder que
les événements `commodity`) doit donc être effectué **côté client**, après réception de l'ensemble du flux.

### EDDN : gestion des erreurs HTTP (400, 413, 426) et limites de taille

| Code HTTP | Signification                                                                 | Action recommandée                                        |
|-----------|-------------------------------------------------------------------------------|-------------------------------------------------------------|
| 400       | JSON malformé, échec de validation du schéma, ou erreur de décompression zlib | Corriger avant de réessayer — ne jamais renvoyer tel quel  |
| 413       | Charge utile trop grosse (limite actuelle : **1 MiB compressé**)              | Réessayer plus tard avec une charge réduite                |
| 426       | Schéma obsolète                                                               | Mettre à jour le logiciel émetteur                         |

Règle générale documentée : **attendre au minimum 1 minute** avant de réessayer après un échec.

### EDDN : les schémas de message disponibles (`commodity-v3.0`, `journal-v1.0`…)

Chaque type de message publié sur EDDN est validé contre un schéma JSON versionné, publié dans le dépôt `EDCD/EDDN`
(dossier `schemas/`) :

- `approachsettlement-v1.0`
- `blackmarket-v1.0`
- `codexentry-v1.0`
- `commodity-v3.0` (prix et quantités du marché d'une station)
- `dockingdenied-v1.0` / `dockinggranted-v1.0`
- `fcmaterials_capi-v1.0` / `fcmaterials_journal-v1.0` (matériaux de Fleet Carrier)
- `fssallbodiesfound-v1.0`
- `fssbodysignals-v1.0`
- `fssdiscoveryscan-v1.0`
- `fsssignaldiscovered-v1.0`
- `journal-v1.0` (générique — transporte un large sous-ensemble d'événements du journal jugés non sensibles)
- `navbeaconscan-v1.0`
- `navroute-v1.0`
- `outfitting-v2.0`
- `scanbarycentre-v1.0`
- `shipyard-v2.0`

Le versionnage explicite des schémas (`commodity-v3.0`, `outfitting-v2.0`, `shipyard-v2.0`…) permet à un consommateur de
détecter une rupture de compatibilité simplement en observant le champ `$schemaRef`.

### EDDN : écosystème logiciel émetteur et consommateur (EDMC, EDDI, EDSM, Spansh)

- **Émission** (PC uniquement) : E:D Market Connector (EDMC), EDDI, EDDiscovery, Elite Log Agent.
- **Consommation** : EDSM, Inara, Spansh et des outils de niche comme Ardent Insight (voir section 9) construisent une
  part importante de leurs bases de données à partir du flux EDDN.
- **Support communautaire** : canal Discord `#eddn` et forum développeurs Frontier.

## 3. API Frontier (Companion App / Cmdr's API / CAPI)

### CAPI Frontier : statut non officiel et fragilité assumée

La CAPI **n'est pas** une API publique officiellement documentée par Frontier. Conçue à l'origine pour l'application
mobile « Cmdr's Companion App » (iOS/Android), elle est aujourd'hui « tolérée » (sans garantie contractuelle) pour des
outils tiers sur PC. La documentation d'E:D Market Connector le formule ainsi : *« This app uses the 'Companion' web API
that Frontier originally supplied for their Elite Dangerous iOS app and now support for third-party apps. If that API
ceases to function in the future then much of this application's functionality will be curtailed. »* Cette citation
illustre bien la dépendance fragile de tout l'écosystème tiers vis-à-vis de cette API non garantie.

### CAPI Frontier : authentification OAuth2 (`auth.frontierstore.net`)

L'accès à la CAPI repose sur un flux **OAuth2 de type authorization code**, contre le serveur d'identité Frontier
(`auth.frontierstore.net` pour l'autorisation et l'échange de jeton). Un outil tiers doit obtenir un `client_id`
enregistré auprès de Frontier. Une fois authentifié, les données (marché station, chantier naval, profil commandant,
données de Fleet Carrier) sont récupérées sur le domaine `companion.orerve.net`. Le dépôt `EDCD/FDevIDs` documente ce
flux OAuth2 ainsi que les tables de correspondance des identifiants renvoyés par la CAPI.

### Fin des serveurs Legacy d'Elite Dangerous et impact sur le format `gameversion` d'EDDN

Depuis le lancement d'Odyssey (2021), le jeu a coexisté sous **deux branches distinctes** côté serveur : la branche
**« Live »** (4.0, avec Odyssey) et la branche **« Legacy »** (3.8, sans Odyssey, maintenue pour les joueurs qui ne
souhaitaient pas migrer). Cette coexistence est directement visible dans le format du champ `gameversion` envoyé à EDDN
(voir section 2) : lorsque la donnée provient de la CAPI plutôt que du journal, EDDN attend un identifiant au format
`"CAPI-Live-<endpoint>"` ou `"CAPI-Legacy-<endpoint>"` (par exemple `CAPI-Legacy-market`, `CAPI-Legacy-shipyard`,
`CAPI-Legacy-journal`), afin que les consommateurs du flux puissent distinguer la provenance exacte des données et ne
pas mélanger, par exemple, des prix de marché issus des deux branches dans une même série temporelle.

Plusieurs signaux communautaires convergent vers un **déclin puis un arrêt de la branche Legacy** : la documentation
d'E:D Market Connector indique qu'à partir de sa version **5.6.0**, l'effort de développement s'est recentré sur les
seuls joueurs « Live », et le format `CAPI-Legacy-*` reste documenté dans les schémas EDDN essentiellement pour des
raisons de rétrocompatibilité et d'archivage plutôt que pour un usage courant.

**Point de vigilance pour un pipeline d'ingestion** : à la date de rédaction, aucune source officielle Frontier
directement consultable n'a pu être vérifiée dans le cadre de cet audit pour confirmer une **date précise** d'arrêt
définitif des serveurs Legacy (les notes de version officielles sur `elitedangerous.com/update-notes` et les forums
Frontier renvoyaient une erreur d'accès au moment de la recherche). Un projet tiers qui ingère encore des données
taguées `CAPI-Legacy-*` devrait donc :

- vérifier la date d'arrêt effective directement dans les annonces les plus récentes de Frontier ou sur le forum
  développeurs EDCD avant de bâtir une logique dépendante de cette branche ;
- continuer à **tolérer** la présence historique de ce tag dans des données déjà archivées (dumps EDSM/Spansh anciens,
  journaux d'ingestion passés) même après un arrêt effectif côté serveurs de jeu, puisque les données déjà publiées sur
  EDDN ne disparaissent pas rétroactivement des bases tierces qui les ont ingérées ;
- éviter de coder en dur une hypothèse « il n'existe plus que `Live` » dans un schéma de stockage, pour ne pas casser le
  parsing d'anciens exports contenant encore la valeur `Legacy`.

### Données de référence associées à la CAPI : le dépôt `EDCD/FDevIDs`

Le dépôt `EDCD/FDevIDs` (https://github.com/EDCD/FDevIDs) fournit une collection de fichiers **CSV** qui traduisent les
identifiants internes renvoyés par la CAPI et par le journal de jeu en libellés lisibles :

| Fichier                                                        | Contenu                                |
|----------------------------------------------------------------|------------------------------------------|
| `shipyard.csv`                                                 | Identifiants des vaisseaux             |
| `outfitting.csv`                                               | Modules d'équipement                   |
| `commodity.csv`                                                | Marchandises                           |
| `material.csv`                                                 | Matériaux d'ingénierie                 |
| `microresources.csv`                                           | Micro-ressources (Odyssey)             |
| `rare_commodity.csv`                                           | Marchandises rares                     |
| `combatrank.csv`, `traderank.csv`, `explorationrank.csv`, etc. | Rangs du commandant                    |
| `economy.csv`                                                  | Types d'économie des systèmes/stations |
| `government.csv`                                               | Formes de gouvernement                 |
| `security.csv`                                                 | Niveaux de sécurité                    |
| `factionstate.csv`                                             | États de faction                       |
| `factionids.csv`                                               | Identifiants de faction                |
| `engineers.csv`                                                | Ingénieurs (voir [Ingénieurs](./06-ingenieurs.md)) |
| `crimes.csv`                                                   | Types de délits                        |
| `rings.csv`                                                    | Anneaux planétaires                    |
| `passengers.csv`                                               | Types de passagers                     |

Le dépôt précise que ces valeurs correspondent aux libellés affichés **en anglais** dans le jeu, et reste explicitement
**incomplet** sur certains objets cosmétiques. Pour les **valeurs chiffrées** des vaisseaux et modules eux-mêmes (au-delà
des simples identifiants/libellés), voir la section 8 ci-dessous (`EDCD/coriolis-data`).

#### Le périmètre de `shipyard.csv`, et l'erreur de catégorie qu'il induit

`shipyard.csv` n'énumère que les **vaisseaux pilotables achetables au chantier naval**. Il ne contient **ni les SRV**
(Scarab, Scorpion, Rhino), **ni les chasseurs embarqués** (SLF), **ni les vaisseaux lancés depuis un vaisseau** (SLV)
comme le **Nomad**. La liste des vaisseaux d'Inara a le même périmètre, pour la même raison : elle décrit ce qu'un
commandant peut acheter au chantier naval. Sur ces véhicules eux-mêmes, voir
[14-rhino.md](./14-rhino.md) et [04-equipements.md](./04-equipements.md) §13.

Il en découle une règle de lecture qu'il vaut mieux poser explicitement : **l'absence d'un véhicule de `shipyard.csv`
ou de la liste Inara ne prouve rien sur son existence en jeu**. Y chercher un SLF ou un SLV revient à chercher un
chasseur embarqué dans Coriolis. Ces véhicules apparaissent ailleurs :

| Où chercher                    | Ce qu'on y trouve                                                                                                       |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| `outfitting.csv`               | Le **module porteur** — la baie qui embarque le véhicule                                                                 |
| Journal de jeu / `Status.json` | Les **événements de déploiement** et les drapeaux d'état (voir section 1, et le cas du Nomad)                            |
| Notes de version de Frontier   | L'**annonce** du véhicule, sa date de sortie et sa catégorie                                                              |

L'illustration la plus nette est le renommage qui accompagne l'arrivée du Nomad. Depuis un commit du **3 juillet 2026**
libellé « new commodity and modules for Operations & Nomad update », `outfitting.csv` libelle les entrées
`Int_FighterBay_Size5/6/7_Class1` **« Vessel Hangar »** et ajoute `Int_FighterBayMk2_Size5/6/7_Class1` **« Mk II Vessel
Hangar »** — les notes officielles parlant, elles, de « Mk I Vessel Bay » et « Mk II Vessel Bay » (« Elite Dangerous |
Operations Update », 1er juillet 2026, 14:01 UTC). L'identifiant interne, lui, n'a pas bougé : un consommateur qui
filtre sur `Int_FighterBay*` continue de fonctionner, mais un consommateur qui affiche « baie de chasseur » à
l'utilisateur ment désormais sur le contenu de la baie. C'est le cas d'école du **libellé qui change alors que
l'identifiant reste** — exactement ce que `FDevIDs` sert à absorber.

### CAPI Frontier : limites connues (aucune documentation, aucun SLA, ruptures fréquentes)

Les réserves suivantes s'appliquent à la Companion API de Frontier, et conditionnent toute décision d'architecture qui
en dépend :

- Pas de documentation officielle publique de l'API.
- Aucune garantie de stabilité : la CAPI **casse régulièrement** lors des grosses mises à jour du jeu — cela s'est
  notamment produit au lancement d'Odyssey.
- Pas de rate limit officiellement publié ; un usage raisonnable est de facto imposé par convention entre outils
  communautaires.
- Usage historiquement restreint côté conditions d'utilisation Frontier : les outils « read-only » sont tolérés, mais
  l'automatisation d'actions de jeu via cette API est explicitement interdite.

### CAPI Frontier : usage typique par les outils tiers

Récupérer le profil du commandant, l'état exact du marché ou du chantier naval de la station où il est amarré (ce qui
complète les données EDDN, qui ne couvrent que les ventes déclenchées par un scan volontaire du marché en jeu), et,
depuis les mises à jour récentes, les données de Fleet Carrier (matériaux stockés, cargo — voir
[Fleet Carriers](./19-fleet-carriers.md)).

## 4. EDSM (Elite Dangerous Star Map)

EDSM propose plusieurs familles d'API REST distinctes, plus des exports en masse (« dumps »).

### EDSM : API Système (`api-v1` / `api-system-v1`)

| Endpoint                     | Fonction                                         |
|------------------------------|--------------------------------------------------|
| `GET /api-v1/system`         | Un système donné                                 |
| `GET /api-v1/systems`        | Plusieurs systèmes (par nom ou plage temporelle) |
| `GET /api-v1/sphere-systems` | Recherche par sphère (rayon max **100 al**)      |
| `GET /api-v1/cube-systems`   | Recherche par cube (**arête** max **200 al**)    |

Les réponses JSON incluent le nom, les coordonnées (x, y, z), l'allégeance/gouvernement/faction, le type de l'étoile
primaire et son caractère « scoopable », la population, le niveau de sécurité. La page `api-system-v1` documente aussi
des endpoints complémentaires : `bodies`, `estimated-value`, `stations`, `market`, `shipyard`, `outfitting`, `factions`,
`traffic`, `deaths`. Aucun rate limit n'est documenté sur ces endpoints système — bonne pratique recommandée : throttler
soi-même les appels et mettre en cache côté serveur tiers.

#### Sondages datés des endpoints système d'EDSM (19 août 2026)

Mesures du **19 août 2026** (étude interne `docs/faisabilite-spansh-temps-reel-materiaux.md`, annexe A) — instantané
daté, à revérifier puisque la base grossit en continu :

- `sphere-systems` rend **172 systèmes dans un rayon de 25 al autour de Sol** ;
- `cube-systems` rend **14 772 systèmes pour environ 864 Ko** de réponse, et **écrête silencieusement** une arête
  demandée au-delà de 200 al au lieu de renvoyer une erreur — un client qui ne vérifie pas croit couvrir un volume plus
  grand qu'il ne l'est ;
- les endpoints par système (`bodies`, `stations`, `factions`) **ne comportent aucun champ biologique** : EDSM n'est
  pas une source d'exobiologie, contrairement à Spansh (voir section 6) ;
- ces endpoints renvoient un en-tête CORS permissif (`*`), ce qui les rend appelables directement depuis un
  navigateur — contrairement à ceux de Spansh, qui n'en renvoient aucun.

**Accès à la documentation** : les pages de documentation d'EDSM sont servies derrière Cloudflare et répondent **HTTP
403 aux clients automatisés** ; les endpoints eux-mêmes, en revanche, répondent normalement. C'est exactement le type
de blocage qui a motivé la constitution des jeux de données hors ligne décrits en section 12.

### EDSM : API d'écriture Journal (`api-journal-v1`)

`POST https://www.edsm.net/api-journal-v1` est le point d'entrée que les outils clients (EDMC, etc.) utilisent pour
renvoyer le contenu brut du journal du joueur vers EDSM.

- Authentification obligatoire par `commanderName` + `apiKey` (générée dans les paramètres du compte EDSM).
- Paramètres logiciels obligatoires : `fromSoftware`, `fromSoftwareVersion`.
- Depuis **novembre 2022**, `fromGameVersion` et `fromGameBuild` sont devenus **obligatoires** pour distinguer les
  versions LIVE et Legacy du jeu (voir section 3 pour le contexte de cette distinction côté CAPI).
- Le paramètre `message` transporte la ligne de journal brute (le batch, plusieurs lignes à la fois, est supporté).
- Des paramètres optionnels préfixés par `_` (par exemple `_systemAddress`, `_systemName`, `_marketId`) permettent de
  fournir du contexte manquant à certains événements.
- Plus de 50 codes d'erreur HTTP sont documentés (exemples : 202 = clé API absente, 205 = logiciel mis en liste noire,
  208 = version de jeu trop ancienne).

### EDSM : API Commandant (`api-commander-v1`) — rangs, crédits, matériaux

- `get-ranks` : rangs Combat/Trade/Explore/CQC/factions et leur progression.
- `get-credits` : solde, emprunts, historique sur 7 jours/1/3/6 mois via le paramètre `period`.
- `get-materials` : matériaux, données encodées, cargo.

Une clé API est requise pour les données privées ; l'accès public reste limité sans clé.

### EDSM : API Logs (`api-logs-v1`) — position, historique de vol, 360 requêtes/heure

- `get-position` : dernière position connue (publique si le profil l'autorise).
- `get-logs` : historique de vol (identifiant de vaisseau, système, identifiant de système, date de première
  découverte) — la plage `startDateTime`/`endDateTime` est **limitée à 1 semaine maximum**.
- `set-comment` / `get-comment` / `get-comments` : annotations par système.

**Rate limit explicitement documenté : 360 requêtes par heure, soit environ 1 requête toutes les 10 secondes ; au-delà,
le code d'erreur HTTP 429 est renvoyé.** C'est la seule limite de débit clairement chiffrée trouvée dans la
documentation EDSM — à retenir comme référence prudente pour l'ensemble de l'API EDSM en l'absence d'autre indication
publiée.

### EDSM : dumps nocturnes (nightly dumps) et leurs tailles

EDSM publie chaque jour des exports complets de sa base, au format **JSON gzippé**, librement téléchargeables. Les
tailles ci-dessous sont un **instantané daté** (capturé le 9 septembre 2026, d'après la documentation communautaire
consultée) — elles croissent en continu et doivent être revérifiées sur `https://www.edsm.net/en/nightly-dumps` avant
de dimensionner un pipeline de chargement :

| Export                                       | Taille approximative |
|----------------------------------------------|-----------------------|
| Systèmes avec coordonnées (dump complet)     | ~3,41 Go               |
| Systèmes avec coordonnées (7 derniers jours) | ~5,64 Mo               |
| Systèmes sans coordonnées                    | ~15,45 Mo              |
| Systèmes peuplés                             | ~481 Mo                |
| Stations                                     | ~2,58 Go               |
| Entrées Codex                                | ~359 Mo                |
| Corps célestes (7 derniers jours)            | ~230,68 Mo             |
| Systèmes PowerPlay                           | ~3,43 Mo               |

**Absence à connaître** : le dump complet des corps célestes d'EDSM (`bodies.json.gz`) **a été retiré vers 2020** ; il
ne subsiste que l'incrémental « 7 derniers jours » listé ci-dessus. L'URL historique renvoie une erreur 404 (constat de
l'étude interne du 19 août 2026). Un pipeline qui a besoin d'un référentiel complet de corps célestes doit donc se
tourner vers les dumps galaxie de Spansh (voir section 6), qui, eux, contiennent les corps.

Ces dumps sont l'équivalent fonctionnel de ce que proposait autrefois EDDB pour le chargement en masse (batch) d'une
base locale, sans avoir à interroger l'API requête par requête. La seule taille du dump « systèmes avec coordonnées »
(plusieurs gigaoctets, régénéré quotidiennement) donne une mesure concrète de l'échelle atteinte par les bases
communautaires alimentées par EDDN.

## 5. Inara.cz — base communautaire de profils, marchés et ingénieurs
**Avertissement** : Inara utilise un modèle d'API différent des autres agrégateurs, et sa documentation officielle
(`https://inara.cn/elite/inara-api-docs/`) mérite d'être revérifiée directement avant toute implémentation en
production.

### Inara : un modèle d'API « événements » (POST JSON, tableau `events`)

L'API Inara est de type **« événements »** (à la différence d'EDSM/Spansh, qui exposent des endpoints REST classiques).
Chaque requête est un **POST JSON** contenant :

- un `header` : nom et version de l'application cliente, clé API (`APIkey`), indicateur `isDeveloped`, identité
  optionnelle du commandant ;
- un tableau `events`, chaque événement portant un `eventName` (par exemple `setCommanderTravelLocation`,
  `addCommanderTravelDock`, `setCommanderCredits`, `getCommanderProfile`, `setCommanderRankPilot`) et des `eventData`
  spécifiques.

### Inara : authentification par clé API personnelle de commandant

Une **clé API personnelle par commandant**, générée depuis le profil Inara, doit être transmise dans chaque requête.
Inara exige une identification claire de l'application tierce (nom, version) et distingue les applications « en
développement » des applications de production.

### Inara : usage typique (profil, rangs, position, réseau social et escadrons)

Synchronisation du profil et des rangs du commandant, de sa position et de son inventaire de matériaux, et surtout —
spécificité forte d'Inara par rapport à EDSM/Spansh — de son réseau social/squadron en jeu (wings, escadrons, voir
[Escadrons](./22-squadrons.md), et [jeu en groupe](./23-jeu-en-groupe.md) pour le multicrew). C'est ce qui en fait une
référence pour les outils communautaires de coordination : Canonn utilise notamment l'intégration wing d'Inara pour ses
opérations de recherche.

### Inara : bonnes pratiques rapportées par la communauté

- Respecter un débit de requêtes modéré (aucun chiffre officiel confirmé dans les sources consultées pour cette
  section).
- Regrouper plusieurs événements dans une seule requête plutôt qu'enchaîner des appels unitaires — le tableau `events`
  est justement conçu pour ça.
- Ne jamais exposer la clé API d'un utilisateur final côté client : elle doit rester côté serveur si l'outil tiers est
  un service web.

### Inara : sondage daté de l'endpoint de production (19 août 2026)

L'étude interne `docs/faisabilite-spansh-temps-reel-materiaux.md` (annexe A, 19 août 2026) relève l'endpoint de
production sous la forme `POST https://inara.cz/inapi/v1/` — noter la divergence de domaine avec l'URL de documentation
citée plus haut, à trancher en consultant Inara directement. Trois constats de ce sondage, à connaître avant
d'envisager Inara comme source de données :

- l'accès ne dépend pas seulement d'une clé : Inara pratique en plus une **mise en liste blanche manuelle** des
  applications tierces ;
- sur les **49 événements** du protocole, **deux seulement sont des lectures** — l'API est conçue pour *pousser* l'état
  d'un commandant vers Inara, pas pour en extraire des données ;
- **aucun endpoint ne renvoie de données de stations**. Pour du référentiel station/marché, il faut se tourner vers
  EDSM, Spansh ou Ardent Insight (voir sections 4, 6 et 9).

## 6. Spansh.co.uk — calculateurs d'itinéraires et dumps de la galaxie
**Avertissement** : le site principal spansh.co.uk est une application JavaScript côté client (SPA) ; le contrat exact
de l'API REST publique doit être revérifié avant implémentation. **Correction datée du 19 août 2026** : l'URL
`spansh.co.uk/api` ne sert pas de documentation — elle renvoie une erreur 404. Le descripteur OpenAPI officiel est
servi par `docs.spansh.co.uk` et ne couvre que quatre endpoints ; tout le reste est non documenté. Voir la sous-section
« Ce que la documentation couvre réellement » plus bas.

### Spansh : calculateur de routes et successeur de fait d'EDDB

Spansh s'est imposé comme le principal **calculateur de routes** et moteur de recherche de systèmes/corps/stations de la
communauté (planification de saut longue distance, recherche de fret optimisée, routes d'exobiologie et de
neutron-boost), et surtout comme le **successeur de fait d'EDDB** pour la mise à disposition de dumps de données
complets.

### Spansh : le dump galaxie (`galaxy.json.bz2`)

Le fichier `galaxy.json.bz2`, téléchargeable à `https://downloads.spansh.co.uk/galaxy.json.bz2`, est régénéré
régulièrement à partir de l'ingestion du flux EDDN — c'est le successeur direct du fameux dump EDDB. Le dépôt
`Spansh/galaxy-spatial` fournit un outil en C++ pour construire une base de données spatiale locale à partir de ce dump.

### Spansh : les quatorze dumps publiés, leurs tailles et leur cadence

`spansh.co.uk/dumps` publie **exactement quatorze fichiers `.json.gz`**, chacun décrit par un JSON Schema hébergé sur
`docs.spansh.co.uk` et miroité sur GitHub sous licence MIT. Les cadences de régénération diffèrent par famille :

- famille *galaxy* : régénérée vers **05:38 GMT** ;
- familles *systems* et *factions* : régénérées vers **08:08 GMT** ;
- `galaxy_stations.json.gz` fait exception : il est annoncé comme rafraîchi **au moins toutes les heures**, ce que deux
  en-têtes `Last-Modified` intra-horaires observés le même jour confirment.

> **Instantané daté — ne pas coder ces tailles en dur.** Les tailles ci-dessous sont des tailles **compressées**,
> mesurées par requête `HEAD` sur `downloads.spansh.co.uk` le **19 août 2026** (étude interne
> `docs/faisabilite-spansh-temps-reel-materiaux.md`, § 1.1). L'étude le formule elle-même comme une réserve
> normative : ces dumps sont régénérés chaque nuit et **croissent de façon monotone**, aucune de ces tailles ne doit
> être codée en dur. Elles servent à dimensionner un ordre de grandeur, pas à écrire une assertion de test.

| Fichier                    | Taille compressée | Contenu                                                                         |
|----------------------------|------------------:|---------------------------------------------------------------------------------|
| `galaxy.json.gz`           |      **115,8 Go** | Toute la galaxie, corps et stations compris                                     |
| `galaxy_1month.json.gz`    |           5,88 Go | Systèmes dont *une* information a changé sous 32 jours                          |
| `galaxy_7days.json.gz`     |           2,94 Go | idem, 7 jours                                                                   |
| `galaxy_1day.json.gz`      |           1,21 Go | idem, 24 h                                                                      |
| `galaxy_populated.json.gz` |           4,32 Go | Systèmes peuplés uniquement                                                     |
| `galaxy_stations.json.gz`  |           4,29 Go | Stations (rafraîchi < 1 h)                                                      |
| `systems.json.gz`          |           6,24 Go | `id64`, `name`, `mainStar`, `coords`, `updateTime` — **sans corps ni stations** |
| `systems_6months.json.gz`  |            688 Mo | delta 6 mois                                                                    |
| `systems_neutron.json.gz`  |            178 Mo | systèmes à étoile principale à neutrons                                         |
| `systems_1month.json.gz`   |            120 Mo | delta 1 mois                                                                    |
| `systems_2weeks.json.gz`   |             55 Mo | delta 2 semaines                                                                |
| `systems_1week.json.gz`    |             26 Mo | delta 1 semaine                                                                 |
| `systems_1day.json.gz`     |       **3,15 Mo** | delta 24 h                                                                      |
| `factions.json.gz`         |           16,4 Mo | factions                                                                        |

Deux prémisses répandues sont fausses et coûtent du temps : **`systems.csv` n'existe pas** (404 sur `systems.csv`,
`systems.csv.gz` et `galaxy.csv.gz` — Spansh ne publie pas de CSV), et le dump complet des corps d'EDSM
(`bodies.json.gz`) a été retiré vers 2020 (voir section 4). Autre piège de nommage : le delta hebdomadaire de la
famille *galaxy* s'appelle `galaxy_7days.json.gz`, et non `galaxy_1week.json.gz`, qui renvoie une 404.

Le delta quotidien donne une idée du débit réel de la galaxie : `systems_1day.json.gz`, à 3,15 Mo, contenait
**91 243 systèmes mis à jour** pour la journée du 18 août 2026, sans aucun doublon, avec un champ `updateTime` bien
borné sur environ 24 heures.

### Spansh : le format des dumps, « un système par ligne » mais pas du JSONL

Détail de format qui conditionne toute stratégie de chargement : ces fichiers sont des **tableaux JSON « pretty
printed » à raison d'un système par ligne**. La première ligne est `[`, chaque système occupe ensuite une ligne de la
forme `\t{…},`, et la dernière ligne est `]`. Le schéma officiel le mentionne explicitement.

Conséquence pratique : on peut les parser **en flux, ligne à ligne**, sans jamais décoder le fichier entier — il suffit
de sauter la première et la dernière ligne, de retirer la tabulation initiale et la virgule finale. Mais ce n'est
**pas** du JSONL au sens littéral, et une bibliothèque qui attend du JSONL strict échouera. Dimensionnement mesuré le
19 août 2026 : la ligne la plus longue observée fait **1 289 376 caractères** — il faut prévoir un tampon d'environ
2 Mo par ligne.

Enfin, `downloads.spansh.co.uk` renvoie un en-tête `accept-ranges: bytes` et un CORS permissif (`*`) : un
échantillonnage par plage d'octets est donc possible sans télécharger l'intégralité d'un dump.

### Spansh : outillage open-source associé (`a-star-router`, schémas de données)

- `Spansh/a-star-router` : routeur A* en C++ pour le calcul d'itinéraires.
- `Spansh/elite_dangerous_schemas` : schémas de données Elite Dangerous en JavaScript.
- `Spansh/elite-dangerous-issues` : suivi de bugs du site.

### Spansh : API publique, table des endpoints reconstitués

Faute de documentation statique exploitable sur le site lui-même (l'URL `spansh.co.uk/api` renvoie une 404, et le
descripteur OpenAPI hébergé sur `docs.spansh.co.uk` ne couvre que quatre routes), le tableau ci-dessous a été
reconstitué par **inspection directe du bundle JavaScript de production** du
site (endpoints présents dans le code client) et par sondage direct des réponses d'erreur de chaque route — instantané
capturé le 9 septembre 2026, à revérifier avant implémentation car Spansh ne publie pas de garantie de stabilité sur ces
routes :

| Endpoint                          | Fonction                                                             |
|------------------------------------|-----------------------------------------------------------------------|
| `GET /api/systems`                 | Auto-complétion de noms de systèmes                                  |
| `POST /api/systems/search`         | Recherche de systèmes par critères (allégeance, économie, sécurité…) |
| `POST /api/bodies/search`          | Recherche de corps célestes par critères                             |
| `POST /api/stations/search`        | Recherche de stations par service/produit disponible                 |
| `GET /api/dump/<id64>`             | Système complet, corps compris, avec `signals.genuses` — **enveloppe `system`** |
| `GET /api/system/<id>`             | Détail d'un système par `id64`/`SystemAddress`                       |
| `GET /api/body/<id>`               | Détail d'un corps céleste — **enveloppe `record`**, tableau `landmarks` |
| `GET /api/station/<id>`            | Détail d'une station                                                  |
| `GET /api/ship/<id>`               | Détail d'un vaisseau référencé                                        |
| `POST /api/route`                  | Route de saut simple point A → point B (paramètres `from`, `to`, `range`) — **corps en formulaire, asynchrone**, voir ci-dessous |
| `POST /api/generic/route`          | Route multi-étapes (plusieurs systèmes à visiter dans l'ordre)        |
| `POST /api/exobiology/route`       | Route d'exobiologie (paramètres `from`, `range`, `radius`, `max_results`) — **formulaire, asynchrone** |
| `POST /api/riches/route`           | Route « Road to Riches » (corps riches en exobiologie à forte valeur) — **formulaire, asynchrone** |
| `POST /api/trade/route`            | Route commerciale (paramètres `system`, `station`)                    |
| `POST /api/tourist/route`          | Route touristique (points d'intérêt/Codex)                            |
| `POST /api/fleetcarrier/route`     | Plotter de route pour Fleet Carrier (voir [Fleet Carriers](./19-fleet-carriers.md)) |
| `POST /api/colonisation/route`     | Route liée à la Colonisation de systèmes (voir [Colonisation](./18-colonisation.md)) |
| `POST /api/engineer/route`         | Route optimisée pour visiter des ingénieurs (voir [Ingénieurs](./06-ingenieurs.md)) |
| `POST /api/nearest`                | Système le plus proche de coordonnées galactiques (`x`, `y`, `z`) — également disponible en `GET /api/nearest?x=&y=&z=`, synchrone |
| `GET /api/results/<job>`           | Récupération du résultat d'une route asynchrone (identifiant renvoyé avec le HTTP 202) |
| `GET /api/{bodies,stations,systems}/field_values/<champ>` | Énumération des valeurs possibles d'un champ de filtre |

Chaque endpoint de recherche/route renvoie, en l'absence des paramètres requis, une erreur JSON explicite (par exemple
`{"error":"from, to and range are required"}` pour `/api/route`), ce qui permet de retrouver empiriquement le contrat
d'entrée en l'absence de documentation statique.

### Spansh : ce que la documentation couvre réellement, et ce qu'elle passe sous silence

Précisions et corrections issues de sondages directs de l'API, datés du **19 août 2026** (étude interne
`docs/faisabilite-spansh-temps-reel-materiaux.md`, § 1.1, § 1.3 et annexe A). Comme pour les tailles de dumps, ce sont
des constats datés : Spansh ne publie aucune garantie de stabilité sur ces routes.

#### Spansh : la documentation OpenAPI réelle, et les deux enveloppes de réponse non documentées

**Où se trouve la documentation.** Il n'existe pas de page de documentation à `spansh.co.uk/api` : cette URL, comme
`/api/docs` et `/api/openapi.json`, renvoie une **erreur 404**. Le descripteur OpenAPI existe bel et bien, mais il est
servi par un autre hôte : `api.openapi.json`, en **version 2.3.2**, sur `docs.spansh.co.uk`. Il ne décrit que
**quatre** endpoints, tous en `GET` :

```
GET https://spansh.co.uk/api/dump/{id64}      # le système complet, corps compris
GET https://spansh.co.uk/api/system/{id64}
GET https://spansh.co.uk/api/body/{id64}
GET https://spansh.co.uk/api/station/{marketId}
```

**Le point d'articulation avec le journal de jeu** : `id64` est exactement le `SystemAddress` que le journal écrit dans
`Location`, `FSDJump` et `CarrierJump` (voir section 1). Une requête suffit donc pour obtenir un système et ses corps à
partir d'un événement de journal, sans recherche par nom. Attention toutefois : pour `/api/body/{id64}`, l'identifiant
attendu est celui **du corps**, pas celui du système.

**Deux enveloppes que le schéma ne mentionne pas.** Les réponses ne sont pas l'objet attendu, mais un objet enveloppe :
`/api/dump/{id64}` répond `{"system": {…}}` en `camelCase`, et `/api/body/{id64}` répond `{"record": {…}}` en
`snake_case`. Un mappeur écrit d'après le seul schéma lit un objet vide **sans échouer nulle part** — c'est le genre de
défaut qui ne se voit qu'à l'exécution. Une ressource absente répond `{"error": "…"}`.

**`/api/body/{id64}` va plus loin qu'annoncé** : il rend un tableau **`landmarks`** qui nomme l'**espèce**, sa
**variante de couleur**, sa **valeur** et sa **latitude/longitude** — c'est-à-dire une information d'exobiologie qu'aucun
autre agrégateur généraliste ne publie. Vérification faite sur le corps « 36 Ophiuchi C 4 » : 45 entrées, dont 23
`{type: 'Bacterium', subtype: 'Bacterium Tela', variant: 'Yellow', value: 1949000}` et 20
`{type: 'Stratum', subtype: 'Stratum Tectonicas', variant: 'Lime', value: 19010800}`, plus deux entrées **non
biologiques** de type `Surface Station` qu'il faut filtrer.

#### Spansh : les endpoints de recherche non documentés (`bodies/search`, `field_values`)

**Les endpoints de recherche ne sont pas documentés**, mais existent et sont stables en pratique :

```
POST https://spansh.co.uk/api/bodies/search       # corps, filtrables et triables
POST https://spansh.co.uk/api/stations/search     # stations, par service
POST https://spansh.co.uk/api/systems/search
GET  https://spansh.co.uk/api/{bodies|stations|systems}/field_values/{champ}
GET  https://spansh.co.uk/api/nearest?x=&y=&z=    # synchrone
```

Un corps de requête `bodies/search` combine `filters`, `sort`, `size`, `page` et `reference_system` ; exemple vérifié le
19 août 2026 :

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

Notes de comportement relevées sur ces routes :

- `bodies/search` **plafonne son compteur de résultats à 10 000** ;
- `stations/search` est la **seule source publique du type de material trader** (`material_trader`), utile pour
  localiser un revendeur de matériaux (voir [Ingénieurs](./06-ingenieurs.md)) ; ses réponses pèsent 100 à 130 Ko par
  station, ce qui impose de restreindre la page ;
- `field_values/{champ}` accepte notamment `genuses`, `signals`, `landmarks`, `materials`, `state`, `services` et
  `material_trader`. La variante `bodies/field_values/landmarks` publie l'énumération exhaustive et rend une structure
  `{min_max, values:{subtype, type, variant}}` comptant **347 sous-types, 64 types et 24 variantes de couleur** — c'est
  la référence qui permet de trier la vie du reste **par liste blanche** plutôt que par liste noire, et donc d'éviter
  de traiter `Mollusc`, `Peduncle Pod` ou `Gyre Tree` comme des organismes récoltables auxquels on attribuerait un prix ;
- **l'énumération des genres de Spansh n'est pas exhaustive** : le genre `Radicoida`, présent en jeu, n'y figure pas.
  Un filtre par genre le manquera silencieusement.

#### Spansh : routes asynchrones, absence de CORS et pièges des signaux biologiques

**Les routes sont asynchrones et refusent le JSON.** C'est la correction la plus lourde de conséquences pour un client :
`/api/route`, `/api/exobiology/route`, `/api/riches/route` et `/api/tourist/route` attendent un corps **encodé en
formulaire** (`application/x-www-form-urlencoded`) et **rejettent un corps JSON**. Elles répondent **HTTP 202** avec un
identifiant de tâche (`job`), qu'il faut ensuite interroger par `GET /api/results/{job}` jusqu'à obtention du résultat.
Durée mesurée le 19 août 2026 sur une route de test : **environ 145 secondes**.

**Aucun en-tête CORS** n'est renvoyé par les endpoints d'API de `spansh.co.uk` : ils ne sont pas appelables depuis un
navigateur sans relais côté serveur. Seul `downloads.spansh.co.uk` renvoie un CORS permissif.

**Deux pièges sur les signaux biologiques**, à connaître avant de bâtir une logique d'invalidation :

1. **Le champ de fraîcheur ne porte pas le même nom des deux côtés** : c'est `signals.updateTime` dans le dump de
   système, et `signals_updated_at` dans la fiche de corps. C'est la même date, et c'est bien elle qui périme une liste
   d'espèces.
2. **`signals.genuses` est parfois absent plutôt que vide** sur un corps qui porte des signaux non biologiques — Vénus
   et la Terre en sont deux exemples. Un client doit distinguer « aucun genre » de « champ non renseigné ».

## 7. EDDB (arrêté) et son successeur, Ardent Industry
EDDB.io (Elite Dangerous DataBase), qui fut pendant des années la référence pour les dumps massifs (systèmes, stations,
listings de marché) consommés hors-ligne par de nombreux outils tiers, **a cessé son activité vers 2021**. Aucun
successeur unique ne reproduit exactement son périmètre, mais deux services se partagent son rôle :

- **Spansh** a repris le rôle de fournisseur de **dump galaxie complet** (`galaxy.json.bz2`), alimenté par EDDN, avec en
  plus des capacités de calcul de route qu'EDDB n'offrait pas.
- **EDSM** a repris — et même étoffé — le rôle de fournisseur de **dumps nocturnes segmentés** (systèmes, stations,
  corps, Codex, PowerPlay), avec une API REST interrogeable en direct en complément.

Pour un projet tiers qui migrerait un ancien pipeline basé sur EDDB, le remplacement recommandé par la communauté
combine :

1. **Spansh** (dump galaxie brut, requêtes de route) ;
2. **EDSM** (dumps segmentés + API temps quasi réel) ;
3. un **abonnement EDDN direct**, si l'on veut du temps réel sans dépendre de la fraîcheur des dumps tiers.

## 8. EDCD/coriolis-data (référentiel de stats vaisseaux/modules)

Le dépôt `EDCD/coriolis-data` (https://github.com/EDCD/coriolis-data) est le **référentiel de données de vaisseaux et
de modules** qui alimente Coriolis, l'outil de fitting de vaisseaux le plus utilisé par la communauté (comparable à un
« configurateur » de vaisseau en ligne).

### `EDCD/coriolis-data` : contenu et structure du dépôt

Le dépôt `EDCD/coriolis-data` contient des fichiers **JSON** organisés par domaine :

- `ships/` : caractéristiques de base de chaque vaisseau (coque, emplacements de modules, agilité, etc.) ;
- `modules/` : caractéristiques de chaque module d'équipement (masse, consommation d'énergie, effets) ;
- `modifications/` : effets des modifications d'ingénierie (voir [Ingénieurs](./06-ingenieurs.md)) sur ces valeurs de
  base ;
- `spec/` : fichiers de spécification/validation des données.

Les versions compilées de ces données sont exposées publiquement sous `https://coriolis.io/data/` et
`https://beta.coriolis.io/data/`. Le workflow de contribution documenté consiste à modifier les fichiers JSON source
puis à exécuter `npm start` (regénération des fichiers de distribution) et `npm test` (lint + tests unitaires) ; les
rapports de bug applicatifs sont à ouvrir sur le dépôt principal `coriolis` plutôt que sur ce dépôt de données.

### `EDCD/coriolis-data` : pourquoi c'est une source pertinente pour un projet tiers

Le dépôt `EDCD/coriolis-data` est la source la plus utilisée par l'écosystème tiers pour obtenir des **valeurs chiffrées fiables et
maintenues par la communauté** sur les vaisseaux et modules (portée de saut, blindage, capacité de cargo, DPS des
armes, etc.), en complément des simples identifiants/libellés fournis par `EDCD/FDevIDs` (voir section 3). C'est ce même
référentiel, ou des données dérivées de celui-ci, que consultent également EDSY (Elite Dangerous Shipyard) et d'autres
outils de fitting concurrents de Coriolis.

> **Pour les fiches détaillées des vaisseaux et de leurs emplacements/portées de saut, voir [Vaisseaux](./03-vaisseaux.md)
> ; pour le détail des modules d'équipement (armes, boucliers, utilitaires), voir [Équipements](./04-equipements.md).**
> Ce guide ne republie pas ces valeurs afin d'éviter toute duplication qui deviendrait obsolète — `EDCD/coriolis-data`
> reste la source de vérité technique pour qui construit un outil de fitting, tandis que 03/04 restent la référence
> narrative/pédagogique de ce corpus.
>
> **Rappel disclaimer stats** : les valeurs chiffrées de ce type de référentiel sont données en **configuration stock**
> ; l'ingénierie (voir [Ingénieurs](./06-ingenieurs.md)) peut les modifier significativement.

## 9. Canonn Research (Guardians et exobiologie) et autres agrégateurs de niche

Canonn Interstellar Research se présente, dans le lore du jeu, comme la plus grande communauté scientifique de la Bulle
(fondée en avril 3301 par le Dr Arcanonn, fictivement basée à Thompson Dock, système Varati). Dans les faits, c'est un
collectif de joueurs qui mène un travail collaboratif de **rétro-ingénierie du lore et des mécaniques de jeu réelles** :
ruines Guardian, technologie xéno, Unknown Artefacts, et plus récemment l'exobiologie (classification des espèces,
cartographie des biomes propices à chaque genre/espèce).

### Canonn Research : ressources pour développeurs tiers

- Un **« Information Codex »** — base de recherche organisée par domaines (archéologie/histoire,
  cartographie/exploration, géologie/organismes de surface, xéno-technologie).
- Une **intégration avec le système de wings d'Inara** pour coordonner les opérations de terrain.
- Des **plugins EDMC** de reconnaissance biologique, feuilles de calcul et bases collaboratives.

Canonn ne propose pas d'API REST propre et documentée : il fonctionne comme une **base de connaissances** et un ensemble
d'outils communautaires plutôt que comme un service d'API au sens strict — à considérer comme une source de référentiel
(valeurs de vente d'exobiologie, localisation des sites Guardian) plutôt que comme un flux de données temps réel.

#### Canonn Research : deux endpoints cloud non documentés mais joignables

Nuance à apporter au constat ci-dessus : si Canonn ne publie pas de contrat d'API, deux fonctions cloud répondent bel
et bien, et sont exploitables. Relevé daté du **19 août 2026** (étude interne
`docs/faisabilite-spansh-temps-reel-materiaux.md`, annexe A) :

| Endpoint                                                                     | Contenu                                                                              |
|------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| `GET us-central1-canonn-api-236217.cloudfunctions.net/query/codex/ref`       | **1 072 entrées** de codex, chacune assortie d'une URL de dump CSV géolocalisé       |
| `GET …/query/biostats`                                                       | **9,5 Mo** : contraintes d'**atmosphère et de composition par espèce** (exobiologie) |

Ces deux endpoints renvoient un CORS permissif (`*`), donc sont appelables depuis un navigateur. En revanche, le
domaine `api.canonn.tech`, encore cité par de vieux guides, **ne répond plus** (délai d'attente dépassé au moment du
sondage). Aucun de ces endpoints n'est documenté ni garanti : ils relèvent du même statut « toléré » que le reste de
l'écosystème.

### Canonn Research : le projet « Gnosis », fait notable de mobilisation communautaire

Le projet communautaire **« Gnosis »** (construction collaborative d'un méga-vaisseau de classe Asimov, ~9 400
commandants mobilisés, 35 millions de tonnes livrées en moins de 3 jours) illustre la capacité de mobilisation de cette
communauté, souvent citée en exemple pour les opérations de collecte de données à grande échelle en jeu.

### Autres agrégateurs de niche : Ardent Insight (ex-Ardent Industry) et Elite BGS

Au-delà des trois grands agrégateurs généralistes (EDSM, Inara, Spansh), deux outils plus spécialisés méritent d'être
connus d'un projet tiers ciblant le commerce ou le BGS (voir [glossaire](./00-glossaire.md)) :

- **Ardent Insight** (anciennement connu sous le nom **« Ardent Industry »**, le domaine `ardent-industry.com`
  redirigeant désormais vers `ardent-insight.com`) se présente comme *« the leading provider of open trade data in the
  galaxy »* : un agrégateur spécialisé sur les **données de marché** (prix, ordres d'achat/vente, disponibilité par
  station et par Fleet Carrier), lui aussi alimenté par le flux EDDN, avec une fraîcheur annoncée de l'ordre des
  dernières 24 heures. Le site expose sa propre version de plateforme (« Ardent OS » — **version 2.9.0 constatée le 9
  septembre 2026**, à revérifier avant toute intégration car ce type de numéro de version évolue au fil des déploiements)
  ; il est pertinent pour un projet tiers qui a spécifiquement besoin de données de marché agrégées sans reconstruire
  tout un pipeline EDDN. Deux routes de son API v2 ont été sondées le **19 août 2026** (étude interne, annexe A) :
  `GET api.ardent-insight.com/v2/system/name/<système>/nearest/<service>` couvre **10 services**, renvoie **20
  résultats au maximum** et **ignore le paramètre `maxDistance`** ; la route
  `GET api.ardent-insight.com/v2/commodity/name/<marchandise>/imports`, en revanche, honore bien `maxDistance` — c'est
  celle à privilégier pour une recherche de débouché sur une marchandise (voir [Commerce](./11-commerce.md)). L'API
  reflète l'`Origin` de l'appelant dans son en-tête CORS, donc reste utilisable depuis un navigateur.
- **Elite BGS** (`elitebgs.app`) est un agrégateur **spécialisé sur le BGS** : il republie, via une API REST publique
  versionnée (**EBGS v5**, constatée le 9 septembre 2026 par inspection du bundle JavaScript du site — à revérifier),
  des données de factions, systèmes, stations et tops (« ticks » du BGS) sous forme d'endpoints tels que
  `GET /api/ebgs/v5/factions`, `GET /api/ebgs/v5/systems`, `GET /api/ebgs/v5/stations` et `GET /api/ebgs/v5/ticks`.
  C'est une alternative plus légère à EDSM/Inara pour un outil qui ne s'intéresse qu'au suivi des états de faction et de
  l'influence — voir [BGS](./21-bgs.md) pour la mécanique elle-même.

Ces deux outils illustrent un point plus général : au-delà des trois agrégateurs « historiques », l'écosystème compte de
nombreux services de niche construits par la communauté sur le même socle EDDN, chacun optimisé pour un cas d'usage
précis (marché, BGS, exploration, combat AX, etc.) plutôt que pour une couverture généraliste.

## 10. Évolutions récentes pertinentes pour les sources de données

- **Colonisation des systèmes** : cette fonctionnalité majeure, annoncée le 20 octobre 2024, est entrée en **bêta le 26
  février 2025** dans le cadre de la mise à jour gratuite « Elite Dangerous: Trailblazers » (le 28 février 2025, souvent
  cité par erreur comme date de lancement, correspond en réalité à la publication du guide explicatif officiel qui a
  suivi la bêta de deux jours). Elle a permis aux joueurs de revendiquer des systèmes inhabités, d'y construire des
  colonies et de devenir « architecte système ». La **sortie complète** (fin de bêta) a eu lieu le **11 novembre 2025**
  via la mise à jour officielle « Dodec Update » (version 4.2.2.0). Voir [Colonisation](./18-colonisation.md) pour le
  détail de la mécanique. Cette fonctionnalité a introduit mécaniquement de nouveaux types d'événements dans le journal
  de jeu (construction, contribution de cargo aux dépôts de colonisation, gestion économique de la colonie). Tout
  pipeline d'ingestion EDDN/journal doit prévoir une **tolérance aux champs et événements inconnus** plutôt qu'un schéma
  figé.
- **Nouveaux vaisseaux SCO** (voir [glossaire](./00-glossaire.md)) : plusieurs vaisseaux dédiés à cette technologie (dont
  le Python Mk II et le Cobra Mk V) ont été introduits — pertinent pour les référentiels de type FDevIDs/coriolis-data
  (voir sections 3 et 8), qui doivent être tenus à jour côté outils tiers.
- **Fin des serveurs Legacy** : voir la sous-section dédiée en section 3, qui détaille l'impact sur le format
  `gameversion` des messages EDDN issus de la CAPI.
- **Échelle des bases de données communautaires** : les dumps nocturnes publiés par EDSM (voir section 4) donnent une
  mesure concrète de l'ampleur atteinte par les bases tierces alimentées par EDDN — plusieurs gigaoctets de données sur
  les systèmes, stations et corps célestes, régénérés quotidiennement, et une croissance continue au rythme de
  l'exploration des joueurs. Cela illustre la nécessité, pour tout projet tiers d'envergure, de concevoir dès le départ
  une architecture de stockage capable d'absorber des volumes de plusieurs centaines de millions d'enregistrements.

## 11. Bonnes pratiques pour enregistrer et exploiter ces données côté serveur

### Modèle de données : séparer événements bruts et état agrégé

Modéliser séparément :

- **(a) les événements bruts horodatés** (journal/EDDN) — une table append-only, indexée par (identifiant obfusqué de
  l'émetteur, timestamp, type d'événement, payload JSON) ;
- **(b) l'état agrégé/matérialisé** (dernier prix de marché par station-marchandise, dernière position connue d'un
  système, etc.), reconstruit par **projection** des événements.

C'est le pattern « event sourcing », naturellement suggéré par la nature du flux EDDN. Il est recommandé de s'inspirer
des schémas JSON publiés dans le dépôt `EDCD/EDDN` (`schemas/*.json`) comme contrat d'entrée, et du dépôt
`Spansh/elite_dangerous_schemas` pour un schéma déjà formalisé côté consommateur.

### Temps réel ou batch : choisir entre le flux EDDN et les dumps EDSM/Spansh

| Source        | Mode                                                                                                             | Usage recommandé                                    |
|---------------|--------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------|
| EDDN          | Temps réel (latence de l'ordre de la seconde, sous réserve que le joueur utilise un outil compatible comme EDMC) | Maintenir un état de marché ou de trafic « vivant »   |
| EDSM / Spansh | Batch (dumps périodiques) + API REST pour du delta ponctuel                                                      | Chargement initial ou périodique d'une base locale     |

La combinaison recommandée pour un nouveau projet : **bootstrap** de la base via un dump batch (`galaxy.json.bz2` de
Spansh, ou dumps nocturnes EDSM), puis **maintien à jour via un abonnement EDDN en continu**, avec un mécanisme de «
resync » périodique (par exemple hebdomadaire) contre les dumps pour rattraper les données manquées ou corrompues.

### Rate limits à respecter par source (EDDN, EDSM, CAPI, Inara, Spansh)

| Source          | Limite documentée                                                                                                                                                                                                                                       |
|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| EDDN            | Taille de message max **1 MiB compressé** (HTTP 413 sinon) ; délai minimal **d'1 minute** avant retry sur erreur                                                                                                                                        |
| EDSM (API logs) | **360 requêtes/heure** (≈1 toutes les 10 secondes), HTTP 429 au-delà — à réutiliser par prudence comme plafond par défaut sur l'ensemble de l'API EDSM faute d'autre indication publiée                                                                 |
| CAPI Frontier   | Aucune limite officielle documentée, mais casse fréquemment lors des mises à jour majeures du jeu — prévoir un mécanisme de repli gracieux (retry exponentiel, cache de la dernière réponse valide) plutôt que de dépendre de sa disponibilité continue |
| Inara           | Aucune limite chiffrée publiée dans les sources consultées — regrouper les événements par requête plutôt que multiplier les appels unitaires                                                                                                            |
| Spansh          | Aucune limite officielle publiée dans les sources consultées ; les endpoints de recherche/route renvoient un message d'erreur explicite en cas de paramètres invalides plutôt qu'un simple rejet muet                                                  |

### Robustesse d'un parseur face à l'évolution du format journal et des schémas EDDN

Le journal de jeu et les schémas EDDN évoluent à chaque mise à jour majeure (Odyssey, puis la Colonisation en sont des
exemples récents — voir [Colonisation](./18-colonisation.md)). Un parseur de production doit **ignorer silencieusement**
les champs et événements inconnus plutôt que d'échouer, et **versionner son propre schéma de stockage** en conséquence —
les schémas EDDN sont eux-mêmes versionnés (`commodity-v3.0`, `outfitting-v2.0`, `shipyard-v2.0`), ce qui permet de
détecter une rupture de compatibilité via le champ `$schemaRef`.

### Confidentialité des données de commandant republiées (`uploaderID`, `_Localised`)

- Ne jamais republier d'identifiant de commandant en clair au-delà de ce qu'EDDN autorise (l'`uploaderID` doit rester
  obfusqué).
- Retirer systématiquement les champs `_Localised`.
- Pour un serveur qui agrège des données de commandants identifiés (via OAuth CAPI ou clés API EDSM/Inara), traiter ces
  identifiants comme des **données personnelles** nécessitant un consentement explicite et une politique de rétention
  claire.

### Complémentarité des sources de données d'Elite Dangerous

| Source                | Ce qu'elle apporte                                                                                                                      | Ce qu'elle exige en contrepartie                                                                |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| EDDN                  | Événements que les joueurs choisissent de partager (marché, exploration, combat déclaratif), en temps réel                              | Dépend du volontariat et de la couverture des outils clients                                       |
| CAPI                  | Données que le joueur n'a pas besoin de « publier » volontairement (état exact du chantier naval/marché de la station où il est amarré) | Authentification OAuth par utilisateur ; stabilité non garantie                                    |
| EDSM / Inara / Spansh | Vues déjà agrégées et nettoyées, pratiques pour un bootstrap rapide                                                                     | Fraîcheur dépendante de leur propre pipeline d'ingestion (généralement basé eux-mêmes sur EDDN)     |
| EDCD/coriolis-data    | Valeurs chiffrées de référence pour vaisseaux/modules, maintenues par la communauté                                                     | Pas un flux temps réel ; nécessite de suivre les mises à jour du dépôt à chaque nouveau vaisseau    |
| Ardent Insight / Elite BGS | Vues de niche déjà spécialisées (marché, BGS) sans avoir à reconstruire tout un pipeline EDDN                                     | Périmètre plus étroit qu'EDSM/Inara/Spansh ; stabilité et SLA non garantis                          |

Un projet tiers ambitieux combine typiquement les trois strates : **EDDN pour le flux**, **CAPI pour les données
propriétaire-au-joueur**, et **un ou plusieurs agrégateurs pour le bootstrap et la validation croisée**.

### URLs mortes recensées : les 404 à ne pas chercher

Un temps considérable se perd à traquer des ressources qui n'existent plus ou n'ont jamais existé, parce que d'anciens
guides continuent de les citer. Liste de sondages négatifs datés du **19 août 2026** (étude interne
`docs/faisabilite-spansh-temps-reel-materiaux.md`, annexe A) :

| Ressource citée par d'anciens guides                                   | Statut au 19 août 2026                                     |
|-------------------------------------------------------------------------|-------------------------------------------------------------|
| `spansh.co.uk/api`, `/api/docs`, `/api/openapi.json`                    | 404 — le descripteur est sur `docs.spansh.co.uk`           |
| `spansh.co.uk` : `systems.csv`, `systems.csv.gz`, `galaxy.csv.gz`       | 404 — Spansh ne publie aucun CSV                            |
| `galaxy_1week.json.gz`                                                  | 404 — le fichier s'appelle `galaxy_7days.json.gz`           |
| `edsm.net/dump/bodies.json.gz`                                          | 404 — retiré vers 2020, seul l'incrémental 7 jours subsiste |
| `edtools.cc/mat`, `edtools.cc/hge`, `edtools.cc/station`                | 404                                                         |
| `api.canonn.tech`                                                       | délai d'attente dépassé — voir les fonctions cloud, section 9 |

Comme toujours dans ce guide, il s'agit d'un **instantané daté** : une ressource peut réapparaître, et une ressource
vivante aujourd'hui peut disparaître demain. La leçon durable n'est pas la liste elle-même mais le réflexe : sonder
avant de coder, et ne jamais supposer qu'une URL citée dans un tutoriel de 2019 répond encore.

## 12. Sources hors ligne : quatre instantanés datés

Les sources décrites dans les sections 1 à 11 sont toutes **externes** : elles supposent un réseau disponible, un
service en ligne et une politique d'accès accueillante. Aucune de ces trois conditions n'est acquise — les pages de
documentation d'EDSM répondent HTTP 403 aux clients automatisés (section 4), les wikis communautaires et les forums
Frontier bloquent régulièrement les clients automatisés par le même mécanisme, et des endpoints historiques
disparaissent sans préavis (voir la liste des 404 ci-dessus).

Ce corpus s'appuie donc aussi sur quatre jeux de données **hors ligne**, datés et sourcés, qui restent lisibles quand
tout le reste renvoie une erreur d'accès. Ce qui intéresse un lecteur de ce guide n'est pas leur format, mais les
**sources amont** qu'ils déclarent — celles vers lesquelles il faut revenir à chaque révision :

| Jeu de données (édition)                  | Contenu                                                                       | Sources amont déclarées                                                                                                          |
|-------------------------------------------|-------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| Catalogue d'exobiologie (édition 2026-08) | 22 genres, 118 espèces, 857 variantes de couleur, avec valeur de vente par espèce | Canonn Research (liste de prix Vista Genomics) ; wiki Elite Dangerous (Exobiologist, Vista Genomics) ; `njthomson/SrvSurvey` (critères biologiques) |
| Catalogue de matériaux (édition 2026-08)  | 115 matériaux, 24 catégories, 2 sites de collecte (Dav's Hope, Jameson Crash Site) | `EDCD/FDevIDs` `material.csv` ; étude interne du 19 août 2026 (§ 3.2, 3.4, 3.5)                                                  |
| Catalogue de blueprints (édition 2026-08) | 5 blueprints chiffrés et 3 combinaisons Odyssey, paliers G1 → G5, ingénieurs   | `EDCD/coriolis-data` (`modifications/blueprints.json`, `specials.json`) ; étude interne du 19 août 2026 (§ 3.2, 3.3)             |
| Étude de faisabilité du 19 août 2026      | 1 481 lignes de sondages directs (dumps Spansh, endpoints, sémantique du journal, cadences des lecteurs, 404) | Sondages réseau datés du 19/08/2026 — mesures directes des API, et non lecture de leurs schémas                  |

Deux réserves valent d'être retenues. Ce sont des **instantanés** : ils ne remplacent pas les sources amont mais en
donnent une photographie prise à un moment où celles-ci étaient joignables, et une édition qui n'a pas bougé depuis
plusieurs mises à jour du jeu doit être tenue pour suspecte plutôt que pour stable. Et **une valeur relevée en jeu
prime sur eux** : pour `Radicoida Unica`, l'étude du 19 août 2026 (§ 2.2) rapporte une **valeur observée de 952 296
Cr** — qui sort du schéma habituel des valeurs rondes — et une distance d'échantillonnage de **15 m** ; ce sont ces
chiffres-là qui font foi, et non ceux que reprend le catalogue hors ligne.

Face à un HTTP 403 sur un wiki ou sur la documentation d'un agrégateur, une donnée locale datée et sourcée vaut donc
mieux qu'une absence de donnée — à condition de citer son édition et de dire qu'il s'agit d'un instantané.

## 13. Les deux dépôts EDCD dont sortent les chiffres de ce corpus, et pourquoi ils sont cités par commit

Les sections 3 et 8 présentent `EDCD/FDevIDs` et `EDCD/coriolis-data` pour ce qu'ils apportent à un projet tiers :
des libellés lisibles en face des identifiants internes pour le premier, des statistiques de vaisseaux et de modules
pour le second. Ils remplissent un second rôle, propre à ce corpus : ce sont **les deux sources dont proviennent les
valeurs chiffrées** que les guides publient sur les vaisseaux, les modules, les armes, les blindages et les
modifications d'ingénierie — prix, masses, consommations électriques, dégâts, cadences, portées, résistances,
composants exigés par un blueprint. Cette section déclare ce que chacun contient, sous quelle licence, à quelle
cadence il bouge, et selon quelle méthode il est cité.

Les deux dépôts sont **clonés en local** avant tout relevé, et chaque valeur écrite dans un guide cite le dépôt, le
chemin du fichier et le **commit** dont elle sort. Les commits de référence de la révision du 10 septembre 2026 sont
`0db9234b5b9ce8c939ea84133d7ce336eea88e27` pour `EDCD/coriolis-data` (commit daté du 24 avril 2026) et
`c35612952dd6a547d1a7ac4cffab9c7051e86579` pour `EDCD/FDevIDs` (5 septembre 2026).

### Contenu relevé de `EDCD/coriolis-data`, fichier par fichier

Décompte du 10 septembre 2026, obtenu par lecture directe du dépôt cloné au commit
`0db9234b5b9ce8c939ea84133d7ce336eea88e27`. Chaque nombre est un décompte de fichiers ou d'enregistrements,
reproductible à l'identique sur ce même commit. Une « variante » est une combinaison de classe et de notation d'une
même famille de modules — le Power Plant classe 4 notation A en est une.

| Emplacement                                                              | Contenu relevé au commit `0db9234b5b9c`                                                                                                                                                                                                                 |
|--------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `ships/*.json`                                                           | **47 fiches de vaisseau** : `properties` (`speed`, `boost`, `hullMass`, `baseArmour`, `baseShieldStrength`, `hardness`, `heatCapacity`, `masslock`, `pitch`, `roll`, `yaw`, `crew`, `hullCost`), `retailCost` et `slots`                                |
| `bulkheads` (dans chaque fiche de `ships/`)                              | **5 grades de blindage de coque** par vaisseau — coût, masse, résistances caustique, explosive, cinétique et thermique, bonus de coque — pour 46 châssis ; **6 pour le Caspian Explorer** (`explorer_nx.json`), qui ajoute une gamme « Mk II Ablative » |
| `modules/standard/*.json`                                                | **7 familles de modules cœur** — `frame_shift_drive`, `fuel_tank`, `life_support`, `power_distributor`, `power_plant`, `sensors`, `thrusters` — soit **297 variantes**                                                                                  |
| `modules/internal/*.json`                                                | **39 familles de modules optionnels**, soit **458 variantes**                                                                                                                                                                                           |
| `modules/hardpoints/*.json`                                              | **43 types d'armes et d'utilitaires montés**, soit **215 variantes**                                                                                                                                                                                    |
| `modifications/blueprints.json`                                          | **81 blueprints d'ingénierie**, **387 paliers** au total, chacun avec ses composants exigés et les bornes basse et haute de ses effets                                                                                                                  |
| `modifications/specials.json`                                            | **91 effets expérimentaux**, chacun avec ses composants exigés et son effet chiffré                                                                                                                                                                     |
| `modifications/modules.json`                                             | **87 groupes de modules** avec, pour chacun, les blueprints et effets expérimentaux admissibles et les ingénieurs qui les proposent                                                                                                                     |
| `modifications/modifications.json`, `modifications/modifierActions.json` | **59 modificateurs** nommés et **165 règles** d'application aux champs d'*outfitting*                                                                                                                                                                   |
| `spec/`                                                                  | Fichiers de spécification et de validation du schéma des données                                                                                                                                                                                        |

Un écart mérite d'être signalé, parce qu'il se voit dès le décompte : `ships/` porte **47** vaisseaux là où
`shipyard.csv` de `EDCD/FDevIDs` en porte **48**. Le châssis absent de `coriolis-data` est le **Lynx Highliner**, le
transporteur de passagers de Zorgon Peterson. `coriolis-data` n'est pas une extraction du jeu mais un jeu de données
tenu à la main par la communauté : un vaisseau récent peut y manquer, et c'est le cas ici.

### Contenu relevé de `EDCD/FDevIDs`, fichier par fichier

Décompte du 10 septembre 2026 au commit `c35612952dd6a547d1a7ac4cffab9c7051e86579`. Le dépôt compte **27 fichiers
CSV** ; les nombres ci-dessous sont des lignes de données, en-tête exclu.

| Fichier              | Lignes | Contenu                                                |
|----------------------|-------:|--------------------------------------------------------|
| `outfitting.csv`     |  1 236 | Modules d'équipement, avec leur libellé affiché en jeu |
| `commodity.csv`      |    270 | Marchandises                                           |
| `microresources.csv` |    196 | Micro-ressources d'*Odyssey*                           |
| `rare_commodity.csv` |    142 | Marchandises rares                                     |
| `material.csv`       |    137 | Matériaux d'ingénierie                                 |
| `shipyard.csv`       |     48 | Vaisseaux achetables au chantier naval                 |
| `engineers.csv`      |     38 | Ingénieurs                                             |

Les **20 fichiers restants** sont des tables d'identifiants courtes : six tables de rang du commandant
(`combatrank`, `TradeRank`, `ExplorationRank`, `CQCRank`, `FederationRank`, `EmpireRank`), les types d'économie
(`economy`), de gouvernement (`government`) et de sécurité (`security`), les états, identifiants et humeur des
factions (`factionstate`, `factionids`, `happiness`), l'allégeance des systèmes (`systemallegiance`), les délits
(`crimes`), les anneaux planétaires (`rings`), les catégories de passagers (`passengers`), l'état de terraformation
(`terraformingstate`), les motifs de refus d'amarrage (`dockingdeniedreasons`) et les références de boutique
(`bundles`, `sku`).

#### Les quatre tables du marché des marchandises, et ce qu'elles ne portent pas

Le catalogue des marchandises de [28-marchandises.md](./28-marchandises.md) est bâti sur quatre de ces fichiers, relevés
au même commit `c35612952dd6a547d1a7ac4cffab9c7051e86579` :

| Fichier              | Colonnes                                | Lignes de données | Ce qu'on en tire                                                      |
|----------------------|-----------------------------------------|------------------:|-----------------------------------------------------------------------|
| `commodity.csv`      | `id, symbol, category, name`            |               270 | Les 270 marchandises et leurs **16 catégories** officielles           |
| `rare_commodity.csv` | `id, symbol, market_id, category, name` |               142 | Les 142 denrées rares et le **`market_id`** de leur station d'origine |
| `economy.csv`        | `id, name`                              |                17 | Les 17 types d'économie de système et de station                      |
| `rings.csv`          | `id, name`                              |                 4 | Les quatre classes d'anneau : Icy, Metallic, Metal Rich, Rocky        |

Ces quatre tables sont des **référentiels de nommage**, et rien de plus. Il faut le dire explicitement, car c'est ce qui
détermine ce qu'un consommateur peut en attendre : elles ne portent **aucun prix** d'achat ni de vente, **aucune
économie productrice ou consommatrice** par marchandise, **aucune légalité** par superpuissance ni par gouvernement, et
**aucun rattachement d'un minerai à une classe d'anneau** — `commodity.csv` et `rings.csv` ne se croisent nulle part.
Le `market_id` de `rare_commodity.csv` est un entier nu : il n'y a ni nom de station, ni système, ni allocation par
cycle, ni distance optimale de revente. Résoudre ce `market_id` suppose d'interroger un agrégateur, Spansh
(`/api/station/<market_id>`, section 6) ou EDSM (section 4), avec les réserves de disponibilité qui y sont posées. Le
corpus tient ces colonnes pour non couvertes plutôt que de les inventer, et
[28-marchandises.md](./28-marchandises.md) en dresse la liste en propre.

### Licence et cadence de mise à jour des deux dépôts

**`EDCD/coriolis-data` sépare explicitement le code des données.** Son `LICENSE.md` place le code de Coriolis.io
(JavaScript, CSS, HTML, SVG) sous licence MIT, mais déclare que **les données et les fichiers JSON associés sont la
propriété intellectuelle de Frontier Developments plc** et relèvent des conditions générales de l'éditeur. Republier
ces chiffres, c'est donc republier de la donnée de jeu, pas de l'open data : le dépôt en est le véhicule, non le
titulaire des droits.

**`EDCD/FDevIDs` ne porte aucun fichier de licence.** Son `README.md` pose en revanche trois réserves d'usage qui
valent d'être retenues : les collections sont **explicitement incomplètes** — des objets Powerplay manquent
d'`outfitting.csv` —, les objets cosmétiques propres au joueur (livrées, décalcomanies, figurines, kits) en sont
**délibérément retirés**, et la colonne `name` porte le **libellé affiché en anglais dans le jeu**, qui n'est pas
toujours la chaîne renvoyée par la Companion API ni celle qui circule sur EDDN.

**La cadence n'est pas mesurable sur les clones utilisés ici** : ce sont des clones superficiels, qui ne contiennent
que le commit de tête. Ce qui est observable est la date de ce commit — 24 avril 2026 pour `coriolis-data`,
5 septembre 2026 pour `FDevIDs` — et un fait déjà relevé en section 3 : `FDevIDs` suit les mises à jour du jeu de
près, son commit du 3 juillet 2026 ayant intégré les libellés d'*Operations* deux jours après les notes de version.
L'écart de quatre mois entre les deux commits de tête va dans le même sens que l'absence du Lynx Highliner : les deux
dépôts ne vieillissent pas au même rythme, et c'est `coriolis-data` qui traîne.

### Citer un commit plutôt qu'une URL : la pratique de sourçage retenue par ce corpus

La méthode tient en trois gestes : **cloner le dépôt en local**, **relever les valeurs par script** plutôt qu'à la
main, et **citer le commit** dans le guide, sous la forme employée partout dans le corpus —
« source : EDCD/coriolis-data, `modules/hardpoints/pulse_laser.json`, commit `0db9234b5b9c` ».

Trois raisons, dont la première est purement pratique. **Elle immunise contre les blocages d'accès.** Des révisions
antérieures de ce corpus ont renoncé à chiffrer faute de pouvoir lire leurs sources : les pages de documentation des
agrégateurs, les wikis communautaires et les forums Frontier répondent HTTP 403 aux clients automatisés (sections 4
et 12). Un dépôt Git se clone une fois et se relit indéfiniment hors ligne. **Elle nomme un état immuable.** Une URL
vers la branche par défaut d'un dépôt désigne une cible mouvante : le chiffre lu aujourd'hui n'est pas forcément celui
que le lecteur trouvera demain, et rien ne le lui dira. Un SHA désigne un arbre de fichiers qui ne changera jamais.
**Elle rend le chiffre re-vérifiable.** Un lecteur muni du nom du dépôt, du chemin du fichier et du SHA reconstitue
l'état exact d'où sort la valeur par un `git clone` suivi d'un `git checkout`, et la recompare — dans dix ans comme
aujourd'hui, y compris si le dépôt a depuis changé d'avis.

Une limite, enfin, pour ne pas prêter à ces chiffres plus qu'ils ne portent. Un commit épinglé reste un
**instantané**, au même titre que les jeux de données hors ligne de la section 12 : il dit ce que le jeu de données
communautaire contenait ce jour-là, pas ce que le jeu contient aujourd'hui. Et `coriolis-data` n'est pas une
extraction du client : c'est un référentiel tenu à la main, dont le Lynx Highliner manquant rappelle qu'il peut
retarder sur une mise à jour. Une valeur relevée en jeu prime donc sur lui, exactement comme elle prime sur les
instantanés hors ligne.

## Tableau de synthèse des sources de données d'Elite Dangerous

| Source         | Type d'accès                                | Temps réel / batch        | Authentification                                            | Rate limit documenté         |
|----------------|-----------------------------------------------|------------------------------|-----------------------------------------------------------------|---------------------------------|
| Player Journal | Fichiers locaux JSON                        | Flux local continu        | Aucune (accès disque local)                                 | Sans objet                   |
| EDDN           | Bus pub/sub (HTTP upload + ZeroMQ listener) | Temps réel                | Aucune pour l'écoute ; identifiant logiciel pour l'émission | 1 MiB/message, retry ≥ 1 min |
| CAPI Frontier  | API HTTP non officielle                     | Temps réel (à la demande) | OAuth2 (client_id Frontier)                                 | Non documenté                |
| EDSM           | API REST + dumps                            | Les deux                  | Clé API pour données privées                                | 360 req/h (API logs)         |
| Inara          | API JSON « événements »                     | Temps réel (à la demande) | Clé API par commandant                                      | Non chiffré publiquement     |
| Spansh         | API REST + dump galaxie                     | Les deux                  | Aucune pour la lecture publique                             | Non documenté                |
| EDCD/coriolis-data | Dépôt Git de fichiers JSON              | Batch (mises à jour par commit) | Aucune (dépôt public)                                  | Sans objet                   |
| Ardent Insight | API/site web (marché)                       | Temps réel (via EDDN)     | Non documentée publiquement                                 | Non documenté                |
| Elite BGS      | API REST (`/api/ebgs/v5/*`)                 | Les deux                  | Aucune pour la lecture publique                             | Non documenté                |
| Jeux de données hors ligne | Fichiers locaux datés (voir section 12) | Instantané daté, hors ligne | Aucune (lecture disque)                        | Sans objet                   |

## Conclusion — un écosystème communautaire mature, mais sans aucune garantie

L'écosystème de données d'Elite Dangerous repose sur un équilibre singulier : **aucune API officielle stable**, mais un
ensemble de standards communautaires (au premier rang desquels EDDN et le format du journal de jeu) suffisamment matures
et largement adoptés pour soutenir des projets tiers d'envergure — jusqu'à des bases de données de centaines de millions
d'enregistrements comme celles bâties par EDSM ou Spansh à partir du flux EDDN. La contrepartie de cette maturité
communautaire est une **fragilité intrinsèque** (CAPI non garantie, absence de rate limits officiels sur plusieurs
services, évolution continue du format du journal au gré des mises à jour du jeu, branches Live/Legacy qui se
distinguent puis finissent par disparaître) qu'un projet tiers sérieux doit anticiper dès la conception de son
architecture : tolérance aux schémas inconnus, repli gracieux en cas d'indisponibilité, et combinaison de plusieurs
sources pour la redondance et la validation croisée.

Une leçon supplémentaire s'est imposée à l'usage, et elle vaut autant pour un projet logiciel que pour un corpus
documentaire : **une donnée locale, datée et sourcée vaut mieux qu'une source en ligne indisponible**. Les jeux de
données hors ligne de la section 12 existent pour cette raison — ils ne prétendent pas remplacer EDSM, Spansh ou
Canonn, mais ils restent lisibles quand ceux-ci répondent 403, et ils portent leur édition, ce qui permet de savoir
exactement ce que l'on cite et à quelle date.

Une seconde leçon, tirée d'une erreur commise par ce corpus lui-même, mérite d'être posée à côté de la première :
**une liste ne prouve que ce qu'elle prétend énumérer**. Chercher le Nomad dans `shipyard.csv` ou dans la liste des
vaisseaux d'Inara, puis conclure de son absence qu'il n'existe pas, revient à confondre « catalogue de chantier
naval » et « inventaire des véhicules du jeu » (voir section 3). Quand les sites communautaires répondent 403 et que
les référentiels consultables ont un périmètre plus étroit qu'on ne le croit, le réflexe qui sauve est d'aller
chercher la **source primaire** — ici, les notes de version publiées par Frontier, republiées mot pour mot sur le flux
d'annonces Steam du jeu (appid 359320), joignable sans authentification via
`api.steampowered.com/ISteamNews/GetNewsForApp/v2/` quand `elitedangerous.com` et les forums ne le sont pas.

## Voir aussi

- [Chronologie canonique](./00-chronologie-canonique.md) — pour dater précisément les évolutions de format évoquées ici
  (Odyssey, Colonisation, etc.).
- [Glossaire](./00-glossaire.md) — pour les sigles utilisés dans ce guide (BGS, SCO…).
- [Vaisseaux](./03-vaisseaux.md) et [Équipements](./04-equipements.md) — pour les fiches détaillées de vaisseaux/modules
  dont `EDCD/coriolis-data` et `EDCD/FDevIDs` fournissent les données brutes.
- [Ingénieurs](./06-ingenieurs.md) — pour l'effet de l'ingénierie sur les valeurs stock republiées par ces référentiels.
- [Outils](./16-outils.md) — pour les logiciels tiers (EDMC, EDDiscovery…) qui exploitent concrètement ces sources.
- [Colonisation](./18-colonisation.md) — pour la mécanique dont les nouveaux événements journal/EDDN sont issus.
- [Fleet Carriers](./19-fleet-carriers.md) — pour les données de Fleet Carrier exposées via CAPI/EDDN/Spansh.
- [Exploration](./10-exploration.md) — pour la mécanique d'exobiologie dont les événements `ScanOrganic`,
  `SellOrganicData` et `SAASignalsFound` sont la trace, et pour la vente des données.
- [Équipement à pied](./07-equipement-a-pied.md) — pour l'inventaire que `ShipLocker.json` et `Backpack.json`
  reflètent.
- [Commerce](./11-commerce.md) — pour l'usage des routes de marché d'Ardent Insight.
- [Minage](./20-minage.md) — pour l'exploitation des données de marché (Ardent Insight, EDDN) côté ressources minées,
  et pour les minerais qui apparaissent sans préfixe dans `SAASignalsFound` sur un anneau.
- [Marchandises](./28-marchandises.md) — pour le catalogue bâti sur `commodity.csv`, `rare_commodity.csv`,
  `economy.csv` et `rings.csv`, et pour la liste des colonnes que ces fichiers ne permettent pas de remplir.
- [BGS](./21-bgs.md) — pour la mécanique suivie par Elite BGS et par les événements de faction du journal.
- [Escadrons](./22-squadrons.md) et [Jeu en groupe](./23-jeu-en-groupe.md) — pour les données sociales exposées par
  Inara.
- [Community Goals](./24-community-goals.md) — pour un autre type d'événement suivi par les mêmes agrégateurs.
- [Combat AX](./25-combat-ax.md) — pour un exemple de cas d'usage de niche comparable à Ardent Insight/Elite BGS.

## Sources

### Sources hors ligne, datées

- Catalogue d'exobiologie hors ligne — édition 2026-08 (22 genres, 118 espèces, 857 variantes) ; sources amont
  déclarées : Canonn Research (liste de prix Vista Genomics), wiki Elite Dangerous (Exobiologist, Vista Genomics),
  SrvSurvey bio-criteria.
- Catalogue de matériaux hors ligne — édition 2026-08 (115 matériaux, 24 catégories, 2 sites) ; sources amont
  déclarées : `EDCD/FDevIDs` `material.csv`, et l'étude interne de faisabilité (§ 3.2, 3.4 et 3.5).
- Catalogue de blueprints hors ligne — édition 2026-08 (5 blueprints chiffrés, 3 combinaisons) ; sources amont
  déclarées : `EDCD/coriolis-data` (`modifications/blueprints.json`, `specials.json`) et l'étude interne de
  faisabilité (§ 3.2 et 3.3).
- Étude interne de faisabilité du 19 août 2026 — 1 481 lignes, avec suivi de mise en œuvre du 20 août 2026 ; sections
  exploitées ici : § 1.1 (dumps Spansh), § 1.3 (endpoints), § 2.1 (ce que le jeu écrit et comment le lire), § 2.2
  (sémantique des événements et valeur observée de `Radicoida Unica`), annexe A (aide-mémoire des endpoints). Mesures
  réseau prises le 19/08/2026, à traiter comme un instantané.

### Dépôts de référence clonés en local, cités par leur commit

Relevés du 10 septembre 2026, obtenus par lecture directe des dépôts clonés aux commits ci-dessous (voir section 13) :

- `EDCD/coriolis-data`, commit `0db9234b5b9ce8c939ea84133d7ce336eea88e27` (24 avril 2026) — `ships/` (47 fiches et
  leurs `bulkheads`), `modules/standard/`, `modules/internal/`, `modules/hardpoints/`, `modifications/blueprints.json`,
  `modifications/specials.json`, `modifications/modules.json`, `modifications/modifications.json`,
  `modifications/modifierActions.json`, `LICENSE.md` et `README.md`.
- `EDCD/FDevIDs`, commit `c35612952dd6a547d1a7ac4cffab9c7051e86579` (5 septembre 2026) — les 27 fichiers CSV du dépôt,
  dont `shipyard.csv`, `outfitting.csv`, `commodity.csv`, `material.csv`, `microresources.csv`, `rare_commodity.csv`
  et `engineers.csv`, ainsi que le `README.md` qui énonce les réserves d'usage et l'absence de fichier de licence.

### Notes de version officielles de Frontier

Relevées le 9 septembre 2026 sur le flux d'annonces Steam d'Elite Dangerous (appid 359320), qui republie les annonces
de Frontier mot pour mot et reste joignable sans authentification via
`api.steampowered.com/ISteamNews/GetNewsForApp/v2/` — utile quand `elitedangerous.com` et les forums Frontier
répondent HTTP 403 :

- « Elite Dangerous | An Update on Operations », 22 avril 2026, 14:02 UTC — report d'Operations en juin.
- « Discover the Nomad », 2 juin 2026, 13:03 UTC — dévoilement du Nomad, vaisseau lancé depuis un vaisseau ; sortie
  annoncée au 30 juin en accès anticipé ARX aux côtés d'Operations.
- « Elite Dangerous | Operations Update », 1er juillet 2026, 14:01 UTC — notes de version complètes : six operations,
  l'Operation Runner, le Nomad, son Mk II Biological Scanner, et le déploiement « depuis une baie de vaisseau
  compatible, y compris les modules MK I et MK II ».
- « Elite Dangerous | Operations Update | Update 3 », 9 juillet 2026, 10:24 UTC — correctifs.
- « Elite Dangerous | Rhino SRV Update », 2 septembre 2026, 11:20 UTC — Rhino SRV de Vodel, minage de surface,
  nouvelles marchandises, opération « Under Siege ».

### Corroborations communautaires (non republiées par Frontier)

- Note de version **EDCoPilot v1.11.726**, 1er juillet 2026 — correctif du suivi de véhicule : le Nomad lève le
  drapeau SRV, et non le drapeau fighter, dans `Status.json`.
- Issue `EDCD/EDDI` n° 2849, 5 août 2026 — journal brut joint portant `DockSRV` avec `"SRVType": "lander01"` /
  `"SRVType_Localised": "Nomad"` et `LoadGame` avec `"Ship": "Lander01"` / `"Ship_Localised": "Nomad"`, en
  `gameversion` 4.4.0.3.
- `EDCD/FDevIDs` `outfitting.csv`, commit du 3 juillet 2026 « new commodity and modules for Operations & Nomad
  update » — libellés « Vessel Hangar » et « Mk II Vessel Hangar » sur les entrées `Int_FighterBay*`.

### Sources externes

- https://elite-journal.readthedocs.io/en/latest/
- https://elite-journal.readthedocs.io/en/latest/Status%20File.html
- https://github.com/EDCD/EDDN
- https://github.com/EDCD/EDDN/blob/live/docs/Developers.md
- https://github.com/EDCD/EDDN/tree/live/schemas
- https://www.edsm.net/en/api-v1
- https://www.edsm.net/en/api-journal-v1
- https://www.edsm.net/en/api-system-v1
- https://www.edsm.net/en/api-commander-v1
- https://www.edsm.net/en/api-logs-v1
- https://www.edsm.net/en/nightly-dumps
- https://canonn.science/
- https://github.com/EDCD/EDMarketConnector
- https://github.com/EDCD/EDMarketConnector/wiki
- https://github.com/EDCD
- https://github.com/Spansh
- https://github.com/EDCD/FDevIDs
- https://github.com/EDCD/coriolis-data
- https://spansh.co.uk/ (endpoints reconstitués par inspection du bundle JS de production, 9 septembre 2026)
- https://ardent-insight.com/ (anciennement ardent-industry.com) ; API sondée : `api.ardent-insight.com/v2/*`,
  19 août 2026
- Journal Manual v38 de Frontier (mai 2026, dernière révision publiée), hébergé sur `hosting.zaonce.net`
- https://docs.spansh.co.uk/ (descripteur `api.openapi.json`, v2.3.2) et https://downloads.spansh.co.uk/
- Fonctions cloud Canonn : `us-central1-canonn-api-236217.cloudfunctions.net/query/codex/ref` et `…/query/biostats`
  (non documentées, sondées le 19 août 2026)
- https://github.com/EDCD/EDDI et EliteJournalReader — lecteurs de journal de référence dont le comportement est cité
  en section 1
- https://github.com/njthomson/SrvSurvey — critères biologiques utilisés par le catalogue d'exobiologie embarqué
- https://elitebgs.app/ (endpoints reconstitués par inspection du bundle JS de production, 9 septembre 2026)
- https://en.wikipedia.org/wiki/Elite_Dangerous
