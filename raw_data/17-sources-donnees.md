# Sources de données disponibles pour Elite Dangerous

## Vue d'ensemble de l'écosystème

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

### Nature et emplacement

À chaque session de jeu, le client Elite Dangerous écrit un fichier texte **append-only** dans le dossier de sauvegarde
du joueur, nommé selon le motif `Journal.<timestamp>.<part>.log`. Un nouveau fichier est créé à chaque lancement du jeu,
avec une rotation possible en cours de session (le jeu peut démarrer un nouveau fichier `.log` en cours de route).
Chaque ligne du fichier est un objet **JSON complet et autonome**, terminé par un retour à la ligne : un événement par
ligne, ce qui rend le format trivialement « streamable » ligne par ligne (pas besoin de parser un document JSON global).

### Format d'un événement

Chaque ligne contient au minimum deux champs communs à tous les événements :

- `"timestamp"` : horodatage au format ISO 8601 (exemple : `2016-06-10T14:31:00Z`) ;
- `"event"` : le type d'événement (chaîne de caractères identifiant le schéma des champs qui suivent).

Le reste des champs dépend du type d'événement. Le format inclut également, pour de nombreux champs textuels, une
variante `_Localised` en parallèle du champ canonique — un texte déjà traduit dans la langue du client de jeu. Ces
champs `_Localised` doivent être ignorés ou retirés par tout outil qui republie les données : c'est d'ailleurs une règle
imposée par EDDN à ses émetteurs.

#### Exemple concret : une ligne de journal (`FSDJump`)

L'exemple ci-dessous est illustratif (valeurs plausibles, structure conforme au format documenté) : une seule ligne de
`Journal.<timestamp>.<part>.log`, un objet JSON complet, à copier telle quelle pour tester un parseur :

```json
{"timestamp":"2024-05-12T18:42:11Z","event":"FSDJump","StarSystem":"Wyrd","SystemAddress":908440887131,"StarPos":[130.65625,-46.09375,-52.90625],"SystemAllegiance":"Independent","SystemEconomy":"$economy_HighTech;","SystemEconomy_Localised":"High Tech","SystemSecondEconomy":"$economy_Industrial;","SystemSecondEconomy_Localised":"Industrial","SystemGovernment":"$government_Democracy;","SystemGovernment_Localised":"Democracy","SystemSecurity":"$SYSTEM_SECURITY_high;","SystemSecurity_Localised":"High Security","Population":15000000,"Body":"Wyrd A","BodyID":1,"BodyType":"Star","JumpDist":18.421,"FuelUsed":4.032156,"FuelLevel":28.451234}
```

Un pipeline d'ingestion doit, avant de republier ou de stocker cette ligne, retirer les champs `_Localised`
(`SystemEconomy_Localised`, `SystemSecondEconomy_Localised`, `SystemGovernment_Localised`, `SystemSecurity_Localised`
ci-dessus) s'il republie vers EDDN.

### Historique et versioning du format

Le format du journal est **versionné et documenté par un changelog** (jusqu'à la version 37, documentée en mai 2023),
avec des ajouts continus à chaque mise à jour majeure du jeu — par exemple la restauration de l'événement `CarrierJump`,
l'ajout de paramètres liés aux Thargoids sur les événements de saut, ou l'ajout de `SupercruiseDestinationDrop`. Le
format continue d'évoluer au rythme des extensions du jeu : Odyssey (voyage à pied) puis la fonctionnalité de
**Colonisation** (voir [Colonisation](./18-colonisation.md), bêta le 26 février 2025, sortie complète le 11 novembre
2025) ont chacune ajouté de nouveaux événements. Tout pipeline d'ingestion doit donc être conçu comme tolérant à des
événements et des champs inconnus plutôt que reposer sur un schéma figé.

### Catégories principales d'événements

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

### Le fichier `Status.json`

En complément du journal append-only, le jeu maintient un fichier `Status.json` **réécrit en continu** : ce n'est pas un
flux d'événements mais un **instantané de l'état courant** du vaisseau ou du personnage — position, carburant, cargo,
pips d'énergie, mode actif (vaisseau / à pied / véhicule), ainsi que des champs `Flags`/`Flags2` sous forme de bitfields.
Ce fichier est la source privilégiée des overlays, HUD externes et intégrations HOTAS/Stream Deck qui ont besoin de
l'état instantané du jeu sans avoir à parser l'intégralité du journal.

#### Table des bitfields `Flags`

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

#### Table des bitfields `Flags2` (Odyssey, à pied)

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

### Bonnes pratiques d'ingestion du journal

- Lire le journal en mode **« tail »** : suivre la fin du fichier `.log` le plus récent du dossier de sauvegarde.
- Gérer la **rotation de fichier** à chaque (re)lancement du jeu (un nouveau fichier `Journal.<timestamp>.<part>.log`
  apparaît).
- Traiter chaque ligne comme un **événement idempotent et horodaté** — un système d'ingestion robuste doit pouvoir
  rejouer ou dédupliquer un événement sans effet de bord.
- **Ignorer ou valider** les lignes malformées, en particulier la dernière ligne d'un fichier en cours d'écriture (le
  jeu peut être en train d'écrire une ligne au moment de la lecture).

## 2. EDDN (Elite Dangerous Data Network)

### Principe et architecture

EDDN est un **bus pub/sub communautaire**, maintenu par EDCD. Son principe fondamental, énoncé explicitement dans sa
documentation : *le service EDDN lui-même ne stocke aucune donnée et ne met à disposition aucune archive ni « état
courant »* — c'est un pur relais temps réel entre les joueurs qui publient (via des outils comme E:D Market Connector,
EDDI, EDDiscovery, Elite Log Agent) et les consommateurs qui s'abonnent au flux (EDSM, Inara, Spansh, et tout projet
tiers).

### Les trois environnements (Live, Beta, Dev)

EDDN expose trois environnements distincts, chacun avec son propre couple URL d'upload / listener ZeroMQ :

| Environnement | URL d'upload (POST)                      | Listener (ZeroMQ)               |
|---------------|------------------------------------------|---------------------------------|
| Live          | `https://eddn.edcd.io:4430/upload/`      | `tcp://eddn.edcd.io:9500/`      |
| Beta          | `https://beta.eddn.edcd.io:4431/upload/` | `tcp://beta.eddn.edcd.io:9510/` |
| Dev           | `https://dev.eddn.edcd.io:4432/upload/`  | `tcp://dev.eddn.edcd.io:9520/`  |

### Publication (upload)

La publication se fait par **POST HTTPS/1.1 obligatoire** (HTTP/2 non supporté) vers l'URL d'upload, avec un **slash
final obligatoire**. Le corps de la requête est un objet JSON composé de :

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

### Abonnement (listener)

L'abonnement se fait par une connexion **ZeroMQ** à `tcp://eddn.edcd.io:9500`. Les messages reçus sont compressés en
**zlib** et doivent être décompressés côté client pour obtenir le JSON. Le filtrage par sujet (topic) n'est **pas
supporté côté serveur** avec la version actuelle de ZeroMQ utilisée par EDDN : le filtrage (par exemple ne garder que
les événements `commodity`) doit donc être effectué **côté client**, après réception de l'ensemble du flux.

### Gestion des erreurs et limites

| Code HTTP | Signification                                                                 | Action recommandée                                        |
|-----------|-------------------------------------------------------------------------------|-------------------------------------------------------------|
| 400       | JSON malformé, échec de validation du schéma, ou erreur de décompression zlib | Corriger avant de réessayer — ne jamais renvoyer tel quel  |
| 413       | Charge utile trop grosse (limite actuelle : **1 MiB compressé**)              | Réessayer plus tard avec une charge réduite                |
| 426       | Schéma obsolète                                                               | Mettre à jour le logiciel émetteur                         |

Règle générale documentée : **attendre au minimum 1 minute** avant de réessayer après un échec.

### Schémas disponibles

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

### Écosystème logiciel

- **Émission** (PC uniquement) : E:D Market Connector (EDMC), EDDI, EDDiscovery, Elite Log Agent.
- **Consommation** : EDSM, Inara, Spansh et des outils de niche comme Ardent Insight (voir section 9) construisent une
  part importante de leurs bases de données à partir du flux EDDN.
- **Support communautaire** : canal Discord `#eddn` et forum développeurs Frontier.

## 3. API Frontier (Companion App / Cmdr's API / CAPI)

### Statut et fragilité assumée

La CAPI **n'est pas** une API publique officiellement documentée par Frontier. Conçue à l'origine pour l'application
mobile « Cmdr's Companion App » (iOS/Android), elle est aujourd'hui « tolérée » (sans garantie contractuelle) pour des
outils tiers sur PC. La documentation d'E:D Market Connector le formule ainsi : *« This app uses the 'Companion' web API
that Frontier originally supplied for their Elite Dangerous iOS app and now support for third-party apps. If that API
ceases to function in the future then much of this application's functionality will be curtailed. »* Cette citation
illustre bien la dépendance fragile de tout l'écosystème tiers vis-à-vis de cette API non garantie.

### Authentification OAuth2

L'accès à la CAPI repose sur un flux **OAuth2 de type authorization code**, contre le serveur d'identité Frontier
(`auth.frontierstore.net` pour l'autorisation et l'échange de jeton). Un outil tiers doit obtenir un `client_id`
enregistré auprès de Frontier. Une fois authentifié, les données (marché station, chantier naval, profil commandant,
données de Fleet Carrier) sont récupérées sur le domaine `companion.orerve.net`. Le dépôt `EDCD/FDevIDs` documente ce
flux OAuth2 ainsi que les tables de correspondance des identifiants renvoyés par la CAPI.

### Fin des serveurs Legacy et impact sur le format `gameversion`

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

### Données de référence associées : FDevIDs

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

### Limites connues

- Pas de documentation officielle publique de l'API.
- Aucune garantie de stabilité : la CAPI **casse régulièrement** lors des grosses mises à jour du jeu — cela s'est
  notamment produit au lancement d'Odyssey.
- Pas de rate limit officiellement publié ; un usage raisonnable est de facto imposé par convention entre outils
  communautaires.
- Usage historiquement restreint côté conditions d'utilisation Frontier : les outils « read-only » sont tolérés, mais
  l'automatisation d'actions de jeu via cette API est explicitement interdite.

### Usage typique par les outils tiers

Récupérer le profil du commandant, l'état exact du marché ou du chantier naval de la station où il est amarré (ce qui
complète les données EDDN, qui ne couvrent que les ventes déclenchées par un scan volontaire du marché en jeu), et,
depuis les mises à jour récentes, les données de Fleet Carrier (matériaux stockés, cargo — voir
[Fleet Carriers](./19-fleet-carriers.md)).

## 4. EDSM (Elite Dangerous Star Map)

EDSM propose plusieurs familles d'API REST distinctes, plus des exports en masse (« dumps »).

### API Système (`api-v1` / `api-system-v1`)

| Endpoint                     | Fonction                                         |
|------------------------------|--------------------------------------------------|
| `GET /api-v1/system`         | Un système donné                                 |
| `GET /api-v1/systems`        | Plusieurs systèmes (par nom ou plage temporelle) |
| `GET /api-v1/sphere-systems` | Recherche par sphère (rayon max **100 al**)      |
| `GET /api-v1/cube-systems`   | Recherche par cube (volume max **200 al**)       |

Les réponses JSON incluent le nom, les coordonnées (x, y, z), l'allégeance/gouvernement/faction, le type de l'étoile
primaire et son caractère « scoopable », la population, le niveau de sécurité. La page `api-system-v1` documente aussi
des endpoints complémentaires : `bodies`, `estimated-value`, `stations`, `market`, `shipyard`, `outfitting`, `factions`,
`traffic`, `deaths`. Aucun rate limit n'est documenté sur ces endpoints système — bonne pratique recommandée : throttler
soi-même les appels et mettre en cache côté serveur tiers.

### API d'écriture Journal (`api-journal-v1`)

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

### API Commandant (`api-commander-v1`)

- `get-ranks` : rangs Combat/Trade/Explore/CQC/factions et leur progression.
- `get-credits` : solde, emprunts, historique sur 7 jours/1/3/6 mois via le paramètre `period`.
- `get-materials` : matériaux, données encodées, cargo.

Une clé API est requise pour les données privées ; l'accès public reste limité sans clé.

### API Logs (`api-logs-v1`)

- `get-position` : dernière position connue (publique si le profil l'autorise).
- `get-logs` : historique de vol (identifiant de vaisseau, système, identifiant de système, date de première
  découverte) — la plage `startDateTime`/`endDateTime` est **limitée à 1 semaine maximum**.
- `set-comment` / `get-comment` / `get-comments` : annotations par système.

**Rate limit explicitement documenté : 360 requêtes par heure, soit environ 1 requête toutes les 10 secondes ; au-delà,
le code d'erreur HTTP 429 est renvoyé.** C'est la seule limite de débit clairement chiffrée trouvée dans la
documentation EDSM — à retenir comme référence prudente pour l'ensemble de l'API EDSM en l'absence d'autre indication
publiée.

### Dumps nocturnes (nightly dumps)

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

Ces dumps sont l'équivalent fonctionnel de ce que proposait autrefois EDDB pour le chargement en masse (batch) d'une
base locale, sans avoir à interroger l'API requête par requête. La seule taille du dump « systèmes avec coordonnées »
(plusieurs gigaoctets, régénéré quotidiennement) donne une mesure concrète de l'échelle atteinte par les bases
communautaires alimentées par EDDN.

## 5. Inara

**Avertissement** : Inara utilise un modèle d'API différent des autres agrégateurs, et sa documentation officielle
(`https://inara.cn/elite/inara-api-docs/`) mérite d'être revérifiée directement avant toute implémentation en
production.

### Modèle

L'API Inara est de type **« événements »** (à la différence d'EDSM/Spansh, qui exposent des endpoints REST classiques).
Chaque requête est un **POST JSON** contenant :

- un `header` : nom et version de l'application cliente, clé API (`APIkey`), indicateur `isDeveloped`, identité
  optionnelle du commandant ;
- un tableau `events`, chaque événement portant un `eventName` (par exemple `setCommanderTravelLocation`,
  `addCommanderTravelDock`, `setCommanderCredits`, `getCommanderProfile`, `setCommanderRankPilot`) et des `eventData`
  spécifiques.

### Authentification

Une **clé API personnelle par commandant**, générée depuis le profil Inara, doit être transmise dans chaque requête.
Inara exige une identification claire de l'application tierce (nom, version) et distingue les applications « en
développement » des applications de production.

### Usage typique

Synchronisation du profil et des rangs du commandant, de sa position et de son inventaire de matériaux, et surtout —
spécificité forte d'Inara par rapport à EDSM/Spansh — de son réseau social/squadron en jeu (wings, escadrons, voir
[Escadrons](./22-squadrons.md), et [jeu en groupe](./23-jeu-en-groupe.md) pour le multicrew). C'est ce qui en fait une
référence pour les outils communautaires de coordination : Canonn utilise notamment l'intégration wing d'Inara pour ses
opérations de recherche.

### Bonnes pratiques rapportées par la communauté

- Respecter un débit de requêtes modéré (aucun chiffre officiel confirmé dans les sources consultées pour cette
  section).
- Regrouper plusieurs événements dans une seule requête plutôt qu'enchaîner des appels unitaires — le tableau `events`
  est justement conçu pour ça.
- Ne jamais exposer la clé API d'un utilisateur final côté client : elle doit rester côté serveur si l'outil tiers est
  un service web.

## 6. Spansh

**Avertissement** : le site principal spansh.co.uk est une application JavaScript côté client (SPA) ; le contrat exact
de l'API REST publique doit être consulté directement sur `spansh.co.uk/api` avant implémentation.

### Rôle

Spansh s'est imposé comme le principal **calculateur de routes** et moteur de recherche de systèmes/corps/stations de la
communauté (planification de saut longue distance, recherche de fret optimisée, routes d'exobiologie et de
neutron-boost), et surtout comme le **successeur de fait d'EDDB** pour la mise à disposition de dumps de données
complets.

### Dump galaxie

Le fichier `galaxy.json.bz2`, téléchargeable à `https://downloads.spansh.co.uk/galaxy.json.bz2`, est régénéré
régulièrement à partir de l'ingestion du flux EDDN — c'est le successeur direct du fameux dump EDDB. Le dépôt
`Spansh/galaxy-spatial` fournit un outil en C++ pour construire une base de données spatiale locale à partir de ce dump.

### Outillage open-source associé

- `Spansh/a-star-router` : routeur A* en C++ pour le calcul d'itinéraires.
- `Spansh/elite_dangerous_schemas` : schémas de données Elite Dangerous en JavaScript.
- `Spansh/elite-dangerous-issues` : suivi de bugs du site.

### API publique — table des endpoints

Le site officiel `spansh.co.uk/api` étant lui-même rendu en JavaScript (SPA Ember, pas de documentation statique
crawlable), le tableau ci-dessous a été reconstitué par **inspection directe du bundle JavaScript de production** du
site (endpoints présents dans le code client) et par sondage direct des réponses d'erreur de chaque route — instantané
capturé le 9 septembre 2026, à revérifier avant implémentation car Spansh ne publie pas de garantie de stabilité sur ces
routes :

| Endpoint                          | Fonction                                                             |
|------------------------------------|-----------------------------------------------------------------------|
| `GET /api/systems`                 | Auto-complétion de noms de systèmes                                  |
| `POST /api/systems/search`         | Recherche de systèmes par critères (allégeance, économie, sécurité…) |
| `POST /api/bodies/search`          | Recherche de corps célestes par critères                             |
| `POST /api/stations/search`        | Recherche de stations par service/produit disponible                 |
| `GET /api/system/<id>`             | Détail d'un système par `id64`/`SystemAddress`                       |
| `GET /api/body/<id>`               | Détail d'un corps céleste                                             |
| `GET /api/station/<id>`            | Détail d'une station                                                  |
| `GET /api/ship/<id>`               | Détail d'un vaisseau référencé                                        |
| `POST /api/route`                  | Route de saut simple point A → point B (paramètres `from`, `to`, `range`) |
| `POST /api/generic/route`          | Route multi-étapes (plusieurs systèmes à visiter dans l'ordre)        |
| `POST /api/exobiology/route`       | Route d'exobiologie (paramètres `from`, `range`, `radius`, `max_results`) |
| `POST /api/riches/route`           | Route « Road to Riches » (corps riches en exobiologie à forte valeur) |
| `POST /api/trade/route`            | Route commerciale (paramètres `system`, `station`)                    |
| `POST /api/tourist/route`          | Route touristique (points d'intérêt/Codex)                            |
| `POST /api/fleetcarrier/route`     | Plotter de route pour Fleet Carrier (voir [Fleet Carriers](./19-fleet-carriers.md)) |
| `POST /api/colonisation/route`     | Route liée à la Colonisation de systèmes (voir [Colonisation](./18-colonisation.md)) |
| `POST /api/engineer/route`         | Route optimisée pour visiter des ingénieurs (voir [Ingénieurs](./06-ingenieurs.md)) |
| `POST /api/nearest`                | Système le plus proche de coordonnées galactiques (`x`, `y`, `z`)     |

Chaque endpoint de recherche/route renvoie, en l'absence des paramètres requis, une erreur JSON explicite (par exemple
`{"error":"from, to and range are required"}` pour `/api/route`), ce qui permet de retrouver empiriquement le contrat
d'entrée en l'absence de documentation statique.

## 7. EDDB et son successeur

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

### Contenu et structure

Le dépôt contient des fichiers **JSON** organisés par domaine :

- `ships/` : caractéristiques de base de chaque vaisseau (coque, emplacements de modules, agilité, etc.) ;
- `modules/` : caractéristiques de chaque module d'équipement (masse, consommation d'énergie, effets) ;
- `modifications/` : effets des modifications d'ingénierie (voir [Ingénieurs](./06-ingenieurs.md)) sur ces valeurs de
  base ;
- `spec/` : fichiers de spécification/validation des données.

Les versions compilées de ces données sont exposées publiquement sous `https://coriolis.io/data/` et
`https://beta.coriolis.io/data/`. Le workflow de contribution documenté consiste à modifier les fichiers JSON source
puis à exécuter `npm start` (regénération des fichiers de distribution) et `npm test` (lint + tests unitaires) ; les
rapports de bug applicatifs sont à ouvrir sur le dépôt principal `coriolis` plutôt que sur ce dépôt de données.

### Pourquoi c'est une source pertinente pour un projet tiers

Ce dépôt est la source la plus utilisée par l'écosystème tiers pour obtenir des **valeurs chiffrées fiables et
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

### Ressources pour développeurs tiers

- Un **« Information Codex »** — base de recherche organisée par domaines (archéologie/histoire,
  cartographie/exploration, géologie/organismes de surface, xéno-technologie).
- Une **intégration avec le système de wings d'Inara** pour coordonner les opérations de terrain.
- Des **plugins EDMC** de reconnaissance biologique, feuilles de calcul et bases collaboratives.

Canonn ne propose pas d'API REST propre et documentée : il fonctionne comme une **base de connaissances** et un ensemble
d'outils communautaires plutôt que comme un service d'API au sens strict — à considérer comme une source de référentiel
(valeurs de vente d'exobiologie, localisation des sites Guardian) plutôt que comme un flux de données temps réel.

### Fait notable

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
  tout un pipeline EDDN.
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

### Temps réel vs batch

| Source        | Mode                                                                                                             | Usage recommandé                                    |
|---------------|--------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------|
| EDDN          | Temps réel (latence de l'ordre de la seconde, sous réserve que le joueur utilise un outil compatible comme EDMC) | Maintenir un état de marché ou de trafic « vivant »   |
| EDSM / Spansh | Batch (dumps périodiques) + API REST pour du delta ponctuel                                                      | Chargement initial ou périodique d'une base locale     |

La combinaison recommandée pour un nouveau projet : **bootstrap** de la base via un dump batch (`galaxy.json.bz2` de
Spansh, ou dumps nocturnes EDSM), puis **maintien à jour via un abonnement EDDN en continu**, avec un mécanisme de «
resync » périodique (par exemple hebdomadaire) contre les dumps pour rattraper les données manquées ou corrompues.

### Rate limits à respecter

| Source          | Limite documentée                                                                                                                                                                                                                                       |
|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| EDDN            | Taille de message max **1 MiB compressé** (HTTP 413 sinon) ; délai minimal **d'1 minute** avant retry sur erreur                                                                                                                                        |
| EDSM (API logs) | **360 requêtes/heure** (≈1 toutes les 10 secondes), HTTP 429 au-delà — à réutiliser par prudence comme plafond par défaut sur l'ensemble de l'API EDSM faute d'autre indication publiée                                                                 |
| CAPI Frontier   | Aucune limite officielle documentée, mais casse fréquemment lors des mises à jour majeures du jeu — prévoir un mécanisme de repli gracieux (retry exponentiel, cache de la dernière réponse valide) plutôt que de dépendre de sa disponibilité continue |
| Inara           | Aucune limite chiffrée publiée dans les sources consultées — regrouper les événements par requête plutôt que multiplier les appels unitaires                                                                                                            |
| Spansh          | Aucune limite officielle publiée dans les sources consultées ; les endpoints de recherche/route renvoient un message d'erreur explicite en cas de paramètres invalides plutôt qu'un simple rejet muet                                                  |

### Robustesse face à l'évolution du format

Le journal de jeu et les schémas EDDN évoluent à chaque mise à jour majeure (Odyssey, puis la Colonisation en sont des
exemples récents — voir [Colonisation](./18-colonisation.md)). Un parseur de production doit **ignorer silencieusement**
les champs et événements inconnus plutôt que d'échouer, et **versionner son propre schéma de stockage** en conséquence —
les schémas EDDN sont eux-mêmes versionnés (`commodity-v3.0`, `outfitting-v2.0`, `shipyard-v2.0`), ce qui permet de
détecter une rupture de compatibilité via le champ `$schemaRef`.

### Confidentialité

- Ne jamais republier d'identifiant de commandant en clair au-delà de ce qu'EDDN autorise (l'`uploaderID` doit rester
  obfusqué).
- Retirer systématiquement les champs `_Localised`.
- Pour un serveur qui agrège des données de commandants identifiés (via OAuth CAPI ou clés API EDSM/Inara), traiter ces
  identifiants comme des **données personnelles** nécessitant un consentement explicite et une politique de rétention
  claire.

### Complémentarité des sources

| Source                | Ce qu'elle apporte                                                                                                                      | Ce qu'elle exige en contrepartie                                                                |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| EDDN                  | Événements que les joueurs choisissent de partager (marché, exploration, combat déclaratif), en temps réel                              | Dépend du volontariat et de la couverture des outils clients                                       |
| CAPI                  | Données que le joueur n'a pas besoin de « publier » volontairement (état exact du chantier naval/marché de la station où il est amarré) | Authentification OAuth par utilisateur ; stabilité non garantie                                    |
| EDSM / Inara / Spansh | Vues déjà agrégées et nettoyées, pratiques pour un bootstrap rapide                                                                     | Fraîcheur dépendante de leur propre pipeline d'ingestion (généralement basé eux-mêmes sur EDDN)     |
| EDCD/coriolis-data    | Valeurs chiffrées de référence pour vaisseaux/modules, maintenues par la communauté                                                     | Pas un flux temps réel ; nécessite de suivre les mises à jour du dépôt à chaque nouveau vaisseau    |
| Ardent Insight / Elite BGS | Vues de niche déjà spécialisées (marché, BGS) sans avoir à reconstruire tout un pipeline EDDN                                     | Périmètre plus étroit qu'EDSM/Inara/Spansh ; stabilité et SLA non garantis                          |

Un projet tiers ambitieux combine typiquement les trois strates : **EDDN pour le flux**, **CAPI pour les données
propriétaire-au-joueur**, et **un ou plusieurs agrégateurs pour le bootstrap et la validation croisée**.

## Tableau de synthèse des sources

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

## Conclusion

L'écosystème de données d'Elite Dangerous repose sur un équilibre singulier : **aucune API officielle stable**, mais un
ensemble de standards communautaires (au premier rang desquels EDDN et le format du journal de jeu) suffisamment matures
et largement adoptés pour soutenir des projets tiers d'envergure — jusqu'à des bases de données de centaines de millions
d'enregistrements comme celles bâties par EDSM ou Spansh à partir du flux EDDN. La contrepartie de cette maturité
communautaire est une **fragilité intrinsèque** (CAPI non garantie, absence de rate limits officiels sur plusieurs
services, évolution continue du format du journal au gré des mises à jour du jeu, branches Live/Legacy qui se
distinguent puis finissent par disparaître) qu'un projet tiers sérieux doit anticiper dès la conception de son
architecture : tolérance aux schémas inconnus, repli gracieux en cas d'indisponibilité, et combinaison de plusieurs
sources pour la redondance et la validation croisée.

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
- [Minage](./20-minage.md) — pour l'exploitation des données de marché (Ardent Insight, EDDN) côté ressources minées.
- [BGS](./21-bgs.md) — pour la mécanique suivie par Elite BGS et par les événements de faction du journal.
- [Escadrons](./22-squadrons.md) et [Jeu en groupe](./23-jeu-en-groupe.md) — pour les données sociales exposées par
  Inara.
- [Community Goals](./24-community-goals.md) — pour un autre type d'événement suivi par les mêmes agrégateurs.
- [Combat AX](./25-combat-ax.md) — pour un exemple de cas d'usage de niche comparable à Ardent Insight/Elite BGS.

## Sources

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
- https://ardent-insight.com/ (anciennement ardent-industry.com)
- https://elitebgs.app/ (endpoints reconstitués par inspection du bundle JS de production, 9 septembre 2026)
- https://en.wikipedia.org/wiki/Elite_Dangerous
