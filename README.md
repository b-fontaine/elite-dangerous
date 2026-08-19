# Codex Exobiologique

Application Flutter de suivi de commandant **Elite Dangerous**, centrée sur
l'exploration et l'exobiologie. Téléphone, tablette et ordinateur.

Elle répond à une question : **« qu'est-ce que je fais maintenant ? »** — en
tenant compte de ce que le commandant possède déjà.

---

## Ce que fait l'application

| | |
|---|---|
| **Poste de pilotage** | Qui est le commandant, **les trois prochaines étapes**, six chiffres clés, et cinq portes vers le détail : carrière, flotte, équipement à pied, ingénieurs, matériaux. Court par construction — il tient sur un écran de téléphone, le détail est à un geste. |
| **Feuille de route priorisée** | 23 règles encodées depuis les guides fournis, évaluées sur l'état réel du commandant — profil Frontier, journaux importés et saisie manuelle confondus. Chaque étape dit *quoi faire*, *pourquoi maintenant*, *ce que ça rapporte* et *ce qui la bloque*. |
| **Identification d'espèces** | Saisis ce que le FSS affiche : l'app déduit les espèces possibles, leur valeur, leur Colony Range, et montre **quel critère reste invérifié**. |
| **Catalogue** | Les 118 organiques connus, leurs valeurs Vista Genomics, leurs conditions et leurs variantes de couleur. Hors ligne. |
| **Journal de bord** | Synchronisation depuis la Companion API de Frontier **ou** import des fichiers `Journal.*.log` du jeu — cette seconde voie ne demande aucun compte. La synchronisation remonte du plus récent au plus ancien, jusqu'à 90 jours. |
| **Guides** | Les cinq guides sources convertis en contenu structuré et navigable (260 Ko), rendus avec le même design system que le reste. |
| **Profil** | Profil Frontier lu en entier — flotte, équipement du vaisseau piloté et son ingénierie, combinaisons, armes, rangs, services de la station — complété par le journal, qui fournit seul le rebuy exact, la portée de saut, les ingénieurs débloqués, les matériaux à pied et l'allégeance Powerplay. La saisie manuelle ne sert plus qu'à corriger. |

Aucune partie serveur. Tout est embarqué ou stocké sur l'appareil ; le seul
appel réseau possible est vers la Companion API de Frontier, à la demande.

---

## Démarrer

```bash
task setup                           # flutter pub get
task gen                             # DI, Retrofit, JSON, tests BDD
task run:linux                       # ou run:android / run:web / run:macos …
task check                           # analyse statique + tests
```

`task --list` détaille les cibles disponibles ; `Taskfile.yml` est le fichier
de référence. L'outil s'installe avec `sudo snap install task --classic` ou
`brew install go-task`. Rien n'oblige à s'en servir — les commandes `flutter`
équivalentes fonctionnent — mais les tâches ajoutent seules le
`--dart-define-from-file=.env` décrit plus bas, qui est facile à oublier.

### Prérequis système — bureau Linux uniquement

Les jetons OAuth Frontier sont stockés dans le trousseau du système. Sur Linux
c'est **libsecret** qui l'expose, et le plugin en réclame les en-têtes à la
compilation :

```bash
sudo apt install libsecret-1-dev        # Debian / Ubuntu
sudo dnf install libsecret-devel        # Fedora
sudo pacman -S libsecret                # Arch
```

Sans ce paquet, `flutter run -d linux` s'arrête sur :

```
The following required packages were not found:
 - libsecret-1>=0.18.4
```

Un service de trousseau doit aussi tourner à l'exécution (`gnome-keyring` ou
`kwallet` avec son greffon libsecret) — c'est le cas par défaut sur GNOME et
KDE. Aucune autre cible n'est concernée : Android, iOS, macOS, Windows et le web
utilisent leur propre coffre.

> **Après avoir installé libsecret, lance `flutter clean`.**
>
> Sinon la compilation échoue autrement, sur un message trompeur :
>
> ```
> file INSTALL cannot copy file ".../elite_dangerous"
> to "/usr/local/elite_dangerous": Permission denied.
> ```
>
> `linux/CMakeLists.txt` ne redirige l'installation vers `build/` que si
> `CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT` est vrai, ce qui n'est le cas
> qu'à la **première** configuration. La première tentative s'étant arrêtée sur
> l'erreur libsecret *avant* d'atteindre cette ligne, le cache garde `/usr/local`
> pour toujours. Purger le cache est le seul remède.

> **Ne vide jamais `build/` à la main : utilise `task clean`.**
>
> Supprimer `build/` en laissant `.dart_tool/` donne :
>
> ```
> file INSTALL cannot find ".../build/native_assets/linux": No such file
> or directory.
> ```
>
> Le répertoire est produit par la cible `InstallCodeAssets` du système de build
> Flutter, qui est incrémentale et consulte ses empreintes dans
> `.dart_tool/flutter_build/`. Celles-ci survivent à la suppression de `build/`,
> la cible est donc sautée, et `install(DIRECTORY)` de `linux/CMakeLists.txt`
> échoue sur une source absente — le répertoire est vide en l'absence de native
> assets, mais CMake exige qu'il existe. `flutter clean` efface les deux.

Vérification complète :

```bash
task check              # dart analyze --fatal-infos puis flutter test
flutter test            # 479 tests
flutter build web       # compile la chaîne complète, y compris le code généré
```

> `dart analyze` exclut les fichiers générés : lancer un `flutter build` ou le
> test `test/app/dependency_injection_test.dart` fait partie de la vérification,
> pas du confort.

### Connecter un compte Frontier

Frontier ne délivre un `client_id` qu'après une **demande validée à la main**,
via <https://user.frontierstore.net> → Developer Zone. Il n'existe aucune
inscription automatique, et l'application **refuse d'emprunter celui d'un autre
outil** : elle apparaîtrait sous le nom de cet outil dans la liste des
applications autorisées du joueur.

Le projet dispose du sien. Il n'est pas committé — un dépôt public n'est pas un
endroit pour ça — mais compilé depuis un fichier local :

```bash
cp .env.template .env                # puis y coller le client_id
task run:linux                       # le drapeau est ajouté automatiquement
flutter run --dart-define-from-file=.env      # sans task
```

Dans l'application, *Réglages → Compte Frontier* fait les deux choses
séparément : « Connecter » lance directement l'autorisation dans le navigateur
avec le client déjà configuré, et « Configurer l'authentification » ouvre
l'écran qui sert à en changer.

Une compilation faite **sans `.env` reste utilisable** : le champ CLIENT ID de
cet écran accepte alors n'importe quel client_id, et c'est la voie normale pour
qui compile depuis les sources avec sa propre inscription Frontier. Une valeur
saisie là est toujours prioritaire sur celle du build ; vider le champ revient
au défaut compilé.

Ce champ est **masqué**, et la valeur compilée n'y est jamais pré-remplie : elle
n'est pas passée à l'interface du tout, laisser le champ vide suffit à la
conserver. Un `client_id` compilé reste **extractible du binaire** — ce n'est pas
un secret au sens OAuth, et c'est le modèle qu'EDMC applique déjà — mais
quelqu'un peut le récupérer et publier un outil s'annonçant sous ce nom auprès
de Frontier, alors autant ne pas l'offrir à une capture d'écran.

La « Shared Key », elle, n'est jamais nécessaire : l'échange utilise PKCE.

Contraintes héritées de Frontier, visibles dans l'interface :

- jeton d'accès valable **4 h**, jeton de rafraîchissement **tourné à chaque usage** ;
- **re-autorisation obligatoire tous les 25 jours**, quoi qu'il arrive ;
- **une requête par minute** environ (un intercepteur l'applique) ;
- redirection : schéma d'URL natif sur mobile, serveur local éphémère sur
  ordinateur — la stratégie d'EDMC. **Le web n'est pas supporté pour la
  connexion** : un navigateur ne peut pas enregistrer de schéma custom, et les
  en-têtes CORS des hôtes Frontier ne sont pas documentés.

La fiche du client, dans le Developer Zone, propose une liste **ENDPOINTS** qui
n'accepte que des URL en `https://` : **la laisser vide**. Frontier ne vérifie
pas le `redirect_uri` — ni le schéma natif ni le loopback ne pourraient y être
déclarés de toute façon, et l'autorisation aboutit sans qu'aucun endpoint n'y
figure.

Sans compte, l'application reste complète : import de journaux locaux et saisie
manuelle.

### Où vit le journal

Dans un fichier, `journal.jsonl`, sous le répertoire de données de
l'application — pas dans les préférences, où il tenait jusqu'ici.

Un journal n'est pas un réglage : c'est un corpus de dizaines de milliers de
lignes JSON qui ne fait que croître. Rangé derrière `KeyValueStore`, il formait
un unique tableau JSON, réencodé et réécrit en entier à chaque synchronisation,
et résident en mémoire pour toute la vie du processus — **26,9 Mio** au plafond
de 60 000 lignes, mesuré. Porter la fenêtre de synchronisation à quatre-vingt-dix
jours rendait ce plafond atteignable.

Un `LineStore` écrit des lignes. Une synchronisation n'ajoute plus que les
lignes réellement neuves, en fin de fichier : son coût suit la taille de
l'import, plus celle de l'historique. La réécriture complète ne subsiste que
pour franchir le plafond, seul cas où les lignes les plus anciennes doivent
partir, et elle passe par un fichier temporaire renommé — un processus tué en
cours d'écriture ne doit pas laisser un journal tronqué, puisqu'il n'en existe
pas d'autre copie.

Un journal écrit par une version antérieure est déplacé au premier accès, puis
la clé de préférences est supprimée. Le web, qui n'a pas de système de fichiers
et ne peut de toute façon pas se connecter à Frontier, garde l'ancien
comportement.

### Remonter le journal aussi loin que possible

Frontier n'expose pas de plage : `/journal/{année}/{mois}/{jour}` rend une
journée, et rien ne documente combien de temps il les garde. La synchronisation
compose avec ça.

Elle remonte **du plus récent au plus ancien**, et c'est ce qui la rend
utilisable : `Statistics`, `EngineerProgress`, `ShipLocker`, `Loadout` et
`Reputation` sont réécrits à chaque démarrage de session, donc la dernière
journée jouée porte déjà l'état courant du commandant. Une requête suffit
souvent, là où un parcours chronologique aurait traversé toute la période avant
d'y arriver.

Elle s'arrête d'elle-même. Frontier répond `204` aussi bien pour une journée
sans partie que pour une journée qu'il ne conserve plus, sans permettre de les
distinguer — après trois semaines de silence d'affilée, les deux appellent la
même réponse : arrêter. Un `206` (« je n'ai pas tout rassemblé ») est resollicité
plus tard, comme Frontier le demande. Un `401` ou un `429` interrompt le
parcours au lieu de le répéter quatre-vingt-dix fois.

Enfin, une journée **passée** qui a répondu `200` ou `204` ne peut plus changer :
elle est mémorisée et jamais redemandée. Le jour courant, lui, ne l'est jamais —
la session peut encore tourner. Une deuxième synchronisation large ne coûte donc
que les journées neuves.

Le compte rendu dit jusqu'où le parcours est allé et pourquoi il s'est arrêté,
ce qui est la seule façon de savoir si relancer trouverait autre chose.

> **Le budget de requêtes est par famille d'endpoint, pas par URL.** `/journal`
> prend la date dans son chemin : compter par chemin complet donnerait à chaque
> journée son propre quota, et une synchronisation de quatre-vingt-dix jours
> partirait en une seule rafale — précisément ce que Frontier limite.
> `CapiThrottleInterceptor` regroupe donc les journées sous `/journal`, avec un
> espacement propre à cette famille : une minute par journée serait inexploitable,
> une rafale serait refusée.

### Inspecter ce que renvoie la synchronisation

*Réglages → Diagnostic → Inspecter la synchronisation* montre les charges utiles
brutes, avant que l'application n'en tire quoi que ce soit — et les compte.

C'est nécessaire parce que la documentation ne suffit pas. La référence CAPI de
la communauté affirme que `ships` porte « le même format que `ship` », modules
compris, alors que tous les outils qui importent un build n'importent jamais que
le vaisseau piloté ; et `suit`, `suits`, `loadout`, `loadouts` n'apparaissent
dans aucun document de Frontier — ils n'existent que dans le code d'EDMC.
L'écran tranche sur un vrai compte : combien de vaisseaux stockés portent un
bloc `modules`, combien d'armes portent leur grade `class`.

Côté journal, il dénombre chaque type d'événement rencontré et dit lequel
l'application lit déjà — treize sur la quarantaine qu'une session écrit. Les
événements dont dépend la suite (`Statistics`, `EngineerProgress`, `ShipLocker`,
`Loadout`, `Reputation`, `Powerplay`…) sont listés même absents : une absence est
un résultat, elle dit jusqu'où la synchronisation doit remonter.

Lire ce qui est déjà sur l'appareil ne coûte rien ; « Récupérer » dépense une
requête. « Copier » et « Exporter » emportent la capture entière — l'aperçu à
l'écran est tronqué, un `/profile` pèse des centaines de kilo-octets et une
journée de journal plusieurs méga-octets.

#### Ce qu'une vraie capture a tranché

`test/fixtures/capi_profile_capture.dart` est un `/profile` réel, anonymisé,
d'un compte Odyssey à huit vaisseaux. Les tests qui le lisent verrouillent six
constats qu'aucune documentation ne donne :

| Constat | Conséquence |
|---|---|
| **Aucun vaisseau stocké ne porte ses `modules`** — 0 sur 7 ; seul celui piloté les a | Une flotte s'affiche par type, nom, position et valeur ; pas par équipement. La référence communautaire, qui annonce « le même format que `ship` », a tort. |
| **`loadouts` existe, le grade des armes non** | Les armes à pied sont là, nommées et localisées, mais sans `class` ni `mods` ; Frontier écrit `"modifications": ["NYI"]`, son propre marqueur « pas encore implémenté ». |
| **`capabilities` contredit la charge utile qui le contient** | `Horizons` et `Odyssey` à `false` sur un compte possédant trois combinaisons Odyssey et deux VRS. À déduire des combinaisons et de `launchBays`, jamais à lire. |
| **`hull` vaut `0`** sur les coques récentes | Le rebuy dérivé de `hull + modules` est très en dessous du vrai. Le montant exact ne vient que de `Rebuy`, dans l'événement `Loadout` du journal. |
| **13 échelles de rang**, dont `builder` et `learner` | Frontier en ajoute sans prévenir ; l'écran nomme celles que l'application ne modélise pas. |
| **Un tiers des `modules` est de la décoration** | Peintures, décalcomanies, plaques, kits et COVAS occupent des emplacements comme n'importe quel module. Une fiche d'équipement qui ne les filtre pas est illisible. |

À l'inverse, `lastStarport.services` s'est révélé plus utile que prévu : il
indique `vistagenomics`, donc si la station où le commandant est amarré achète
les données organiques.

---

## Architecture

Clean Architecture / DDD, feature-first.

```
lib/
  core/             Result/Failure, stockage, réseau, temps, responsive, DI
  design_system/    tokens, formes, composants (transcrits des guides HTML)
  features/<nom>/
    domain/         entités, ports (repositories), services, cas d'usage
    data/           DTO, sources de données, implémentations, modules DI
    presentation/   BLoC, pages, widgets
```

**Règles tenues :**

- le **domaine n'importe ni Flutter, ni Dio, ni un client HTTP** — seulement
  `equatable` et le `Result` du projet ;
- tout ce qui peut échouer renvoie `Future<Result<T>>` (`sealed class`, pas de
  dépendance FP externe) ;
- **BLoC uniquement**, jamais Cubit ;
- la présentation ne touche jamais un repository, seulement des cas d'usage ;
- les services de domaine sont enregistrés par des `@module` du data layer,
  pour qu'aucune entité ne porte d'annotation de framework. Les cas d'usage,
  eux, portent `@injectable` : ils sont la couche applicative.

**Anti-corruption layer** : le moteur de roadmap est une fonction pure de
`CommanderSnapshot`. `CommanderSnapshotAdapter` est le seul endroit qui sait
assembler cet instantané depuis trois sources hétérogènes — profil CAPI,
saisie manuelle, progression enregistrée.

### Stack

`flutter_bloc` · `injectable` + `get_it` · `dio` + `retrofit` ·
`go_router` · `shared_preferences` + `flutter_secure_storage` ·
`bdd_widget_test` + `bloc_test` + `mocktail`.

### Adaptation aux formats

`WindowSizeClass` (compact / medium / expanded / large) pilote tout :
barre de navigation basse sur téléphone, rail replié sur tablette, rail étendu
et vues à deux panneaux sur ordinateur. Les textes longs passent par
`ReadableWidth`, les tableaux larges défilent horizontalement.
`test/app/responsive_shell_test.dart` et
`test/features/guides/presentation/guide_detail_page_test.dart` vérifient les
trois formats.

---

## Tests

Pilotage par les tests, deux niveaux :

- **TDD** — 470 tests unitaires et widget. Le domaine (moteur de roadmap,
  matcher d'espèces, parser de journal, agrégateur) est couvert en premier
  parce qu'il porte toute la connaissance du jeu.
- **BDD** — scénarios Gherkin en français dans `test/features_bdd/`, générés
  par `bdd_widget_test`, exécutés contre le **vrai graphe de dépendances** et
  les vrais widgets :

```gherkin
Scenario: Les données non vendues passent avant tout le reste
  Given le commandant transporte {60000000} crédits de données non vendues
  When j'ouvre la feuille de route
  Then la première étape est {'discipline.sell_run'}
```

Trois tests protègent des données qui n'ont pas d'autre filet :
`exobiology_catalog_asset_test.dart` et `guide_assets_test.dart` valident le
contenu embarqué, `dependency_injection_test.dart` résout tout le graphe DI.

---

## Le poste de pilotage

Il répond d'abord à « qu'est-ce que je fais maintenant ? », puis laisse
consulter le dossier complet.

- **Trois étapes**, pas une. La première est mise en avant : c'est elle la
  réponse. Les deux suivantes sont du contexte — les crier toutes les trois ne
  dirait rien.
- **Neuf chiffres clés** : système, corps, station, solde, valeur nette, profit
  exobiologique de carrière, rang Exobiologist, portée de saut, rebuy. Chacun
  dit d'où il vient quand ça change son sens — « total de carrière, énoncé par
  le jeu » n'est pas « estimé depuis ce qui a été importé ».
- **Six cartes** ouvrant chacune une page de détail.

### Où se trouve le commandant

Le système et la station viennent de `/profile` ; **le corps ne vient que du
journal**. La Companion API n'a aucune notion de corps céleste, et elle ne se
rafraîchit qu'à l'amarrage — un commandant en orbite depuis deux heures y est
toujours à sa dernière station.

Le journal, lui, le dit à l'instant : `FSDJump` nomme le système et l'étoile,
`ApproachBody` la planète, `Touchdown` et `Disembark` la surface, `Docked` la
station. Ces événements sont **fusionnés** plutôt que pris en bloc :
`ApproachBody` ne répète pas toujours le système, `FSDJump` efface le corps.
Appliquer chacun tel quel viderait la moitié de la position à chaque ligne.

Deux règles méritent d'être dites, parce qu'elles se lisent mal autrement :
s'amarrer **abandonne le corps** — une station n'est pas une planète, même
planétaire, et garder le corps se lirait comme « toujours à la surface » ; et
`LeaveBody` comme `StartJump` l'effacent sans toucher au système.

### La station

`/profile` en donne le nom, la faction, la faction mineure et **vingt-six
services**. Une liste plate de vingt-six clés ne répond à aucune question, donc
ils sont groupés par ce qu'on va y faire — exobiologie, à pied, ingénierie et
échange, vaisseau, autres — avec Vista Genomics en tête, puisque c'est la seule
qui décide si les données organiques se vendent ici. Les services qu'une future
mise à jour de Frontier ajouterait apparaissent sous « non classés » plutôt que
d'être perdus.

L'événement `Docked` du journal complète : type de station, distance à
l'étoile, économies, gouvernement, allégeance et nombre de plateformes par
taille — rien de tout cela n'étant dans la Companion API.

### L'équipement d'un vaisseau

Les emplacements sont groupés en quatre catégories — points d'emport, points
utilitaires, modules internes principaux et optionnels — déduites du nom de
l'emplacement. La **taille**, elle, se lit dans le symbole du module et non
dans ce nom : une capture réelle porte `MediumHardpoint5` contenant une arme
*Small*, et sept emplacements Large/Medium sur un vaisseau qui n'en a que six.
La numérotation de Frontier est décorrélée du plan réel du vaisseau.

Les emplacements **vides** n'existent pas dans la charge utile : Frontier
n'envoie que ce qui est monté. Ils sont donc repérés par les trous de
numérotation — `Slot05` et `Slot08` présents, `Slot06` et `Slot07` absents. Ce
procédé a deux limites, dites à l'écran plutôt que tues : la taille d'un
emplacement vide est **bornée** par celle du précédent, jamais connue
exactement ; et rien ne trahit un emplacement vide situé après le dernier
emplacement occupé. Le savoir demanderait une table des plans de chaque
vaisseau, que l'application n'embarque pas.

### Les noms que Frontier ne traduit pas

La Companion API renvoie tantôt une vraie traduction (`Scarabée VRS`), tantôt
la clé de localisation brute (`lander01_name`). La clé est pire qu'inutile à
l'écran, mais la rejeter laisse le symbole — et `lander01` ne dit rien du
**Nomad** garé dans le hangar.

Une petite table comble ces trous, vérifiée plutôt que devinée : Frontier vend
le Nomad sous la référence `FORC_FDEV_V_LANDER01_BUNDLE_001`, et il se lance
depuis un hangar à vaisseaux (`Int_FighterBayMk2`) et non depuis une soute à
véhicules planétaires — ce n'est donc pas un VRS. Les noms de configuration
(`lander01_loadout_advanced_name` → « Avancé ») suivent la même règle.

Chaque page de détail, quand elle n'a rien à montrer, **dit pourquoi et ce qui
la remplirait** : la Companion API n'expose pas les ingénieurs, le grade des
armes n'existe nulle part, un vaisseau stocké n'a pas de fiche d'équipement. Un
panneau vide se lit comme un bug ; une phrase se lit comme une instruction.

`/commandant` a perdu ses rangs, ses combinaisons et ses finances — les pages de
détail les portent mieux, et deux écrans qui affichent les mêmes chiffres sont
deux écrans qui divergent. Il ne répond plus qu'à la question dont il est le
seul dépositaire : **cette valeur vient-elle de Frontier, du journal, ou de
moi ?**

## Ce que la synchronisation donne, et ce qu'elle ne donnera pas

Les deux sources se complètent exactement là où l'autre est muette.

| | `/profile` | Journal |
|---|---|---|
| Identité, solde, position, rangs | ✅ 13 échelles, dont `builder` et `learner` sans paliers publiés | ✅ avec le **pourcentage** vers le rang suivant (`Progress`) |
| Flotte | ✅ 8 vaisseaux : type, nom, position, valeur | ✅ `StoredShips`, avec le prix de transfert, sans compte Frontier |
| Équipement d'un vaisseau | ⚠️ **le vaisseau piloté uniquement** — 41 emplacements, dont l'ingénierie posée avec blueprint, grade et modificateurs | ✅ `Loadout`, le vaisseau piloté |
| Rebuy | ❌ `hull` vaut `0` sur les coques récentes : le calcul est faux d'un ordre de grandeur | ✅ `Rebuy`, exact |
| Portée de saut | ❌ | ✅ `MaxJumpRange`, à pleine charge |
| Combinaisons | ✅ possédées et équipée, grade dans le suffixe `_classN` | ✅ `SuitLoadout` |
| Armes à pied | ⚠️ présentes et nommées, **sans grade ni modifications** — Frontier renvoie `["NYI"]` | ⚠️ idem |
| Profit exobiologie de carrière | ❌ | ✅ `Statistics`, le chiffre exact que compte l'échelle |
| Ingénieurs | ❌ | ✅ `EngineerProgress` : statut et rang, pour tous |
| Réputations | ❌ | ✅ `Reputation`, −100 à +100 |
| Matériaux à pied | ❌ | ✅ `ShipLocker`, aux noms lisibles du barman |
| Powerplay | ❌ | ✅ `Powerplay` — dont la majoration de 30 % de Pranav Antal |
| Meta-Alloy en soute | ❌ | ✅ `Cargo` |
| Services de la station | ✅ dont `vistagenomics` : la station achète-t-elle les données organiques | ❌ |
| Horizons / Odyssey | ❌ `capabilities` **ment** : `false` sur un compte qui possède trois combinaisons Odyssey et deux VRS | déduit des combinaisons et du hangar planétaire |

Conséquence directe : `ManualCommanderOverrides` ne sert plus qu'à **corriger**.
Portée de saut, matériaux, ingénieurs débloqués, Meta-Alloy, allégeance
Powerplay et détecteur de surface sont désormais dérivés. Une valeur saisie
reste prioritaire — l'application ne voit jamais qu'une partie d'une
sauvegarde — mais plus rien n'oblige à remplir le formulaire.

Les événements que Frontier réécrit **à chaque démarrage de session**
(`Statistics`, `EngineerProgress`, `ShipLocker`, `Loadout`, `Reputation`,
`Materials`, `Powerplay`) sont des instantanés, pas des incréments : replier
deux mois de journal doit rendre le plus récent, jamais une somme. C'est aussi
ce qui fait qu'**une seule journée jouée suffit** à connaître l'état courant.

## Données : ce qui a été corrigé

Les guides fournis sont bons, mais trois de leurs chiffres étaient périmés ou
faux. Les sources ont été recoupées (Canonn Research, wiki Fandom, SrvSurvey,
code d'EDMC, doc `fd-api`) et l'application retient les valeurs vérifiées :

| Sujet | Guides fournis | Retenu | Pourquoi |
|---|---|---|---|
| **Rangs Exobiologist** | 1,5 M / 5,3 M / 12,8 M / … / 520 M | 22,5 M / 83,5 M / 210,6 M / … / 8,425 Md | Table d'avant l'Update 14.01 (déc. 2022). L'ancienne table place le commandant quatre rangs trop haut. |
| **Le bonus ×5** | « First Footfall ×5 » | **First Logged** ×5 ; First Footfall ne rapporte **rien** | Le ×5 récompense le premier à *vendre* une espèce depuis un corps. Le First Footfall n'inscrit qu'un nom sur la carte. Les deux sont liés en pratique — un corps jamais foulé donne le First Logged — mais ce n'est pas la même mécanique. |
| **Concha Biconcavis / Fonticulua Fluctus** | 16 777 215 Cr | 19 010 800 / 20 000 000 Cr | 16 777 215 = 2²⁴−1, artefact de troncature répandu dans les tables communautaires. Un test l'interdit désormais dans le catalogue. |

Le catalogue embarqué contient **118 espèces** (117 + `Radicoida Unica`, ajoutée
en novembre 2025), leurs valeurs, conditions et variantes, ainsi que les
**15 Colony Range** par genre, vérifiés sur deux sources.

Chaque étape de la feuille de route cite ses sources, et les chiffres portent
les mêmes étiquettes de fiabilité que les guides — **OFF** (Frontier),
**COM** (communauté), **EST** (estimation).

---

## Ajouter un guide

Les guides sont du contenu, pas du code : un fichier JSON dans
`assets/guides/`, déclaré dans `assets/guides/index.json`. Le schéma est décrit
par les entités de `lib/features/guides/domain/entities/guide.dart` — paragraphe,
titre, liste, étapes, tableau, encadré, citation, verdict, paires clé/valeur.
`guide_assets_test.dart` valide tout nouveau fichier.

## Ajouter une règle à la feuille de route

Implémenter `RoadmapRule` dans
`lib/features/exobiology/domain/services/exobiology_roadmap_rules.dart` et
l'ajouter à `exobiologyRoadmapRules`. Une règle est une fonction pure de
`CommanderSnapshot` ; le moteur se charge des prérequis, du tri et des cases
cochées manuellement. Le même moteur accepte un jeu de règles différent : c'est
ainsi qu'une feuille de route « minage » ou « commerce » se grefferait.

---

## État

Fonctionnel de bout en bout : `dart analyze` propre sur `lib/` et `test/`,
479 tests verts, `flutter build web` réussi.

La boucle est fermée : importer un journal met immédiatement à jour le profit
de carrière, le rang Exobiologist, les données à risque en soute et donc l'ordre
des étapes de la feuille de route. Le journal est **dérivé**, jamais recopié
dans la progression — réimporter le même jour ne double rien
(`commander_snapshot_adapter_test.dart` le vérifie).

Non implémenté à ce stade :

- sélecteur de dossier natif pour l'import (le chemin se saisit, les
  emplacements par défaut de chaque plateforme sont proposés) ;
- surveillance en temps réel du dossier de journaux pendant une partie ;
- connexion Frontier sur la cible web (schéma d'URL impossible dans un
  navigateur, en-têtes CORS des hôtes Frontier non documentés) — l'import de
  journaux et la saisie manuelle y fonctionnent.
