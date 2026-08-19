# Codex Exobiologique

Application Flutter de suivi de commandant **Elite Dangerous**, centrée sur
l'exploration et l'exobiologie. Téléphone, tablette et ordinateur.

Elle répond à une question : **« qu'est-ce que je fais maintenant ? »** — en
tenant compte de ce que le commandant possède déjà.

---

## Ce que fait l'application

| | |
|---|---|
| **Feuille de route priorisée** | 23 règles encodées depuis les guides fournis, évaluées sur l'état réel du commandant — profil Frontier, journaux importés et saisie manuelle confondus. Chaque étape dit *quoi faire*, *pourquoi maintenant*, *ce que ça rapporte* et *ce qui la bloque*. |
| **Identification d'espèces** | Saisis ce que le FSS affiche : l'app déduit les espèces possibles, leur valeur, leur Colony Range, et montre **quel critère reste invérifié**. |
| **Catalogue** | Les 118 organiques connus, leurs valeurs Vista Genomics, leurs conditions et leurs variantes de couleur. Hors ligne. |
| **Journal de bord** | Synchronisation depuis la Companion API de Frontier **ou** import des fichiers `Journal.*.log` du jeu — cette seconde voie ne demande aucun compte. |
| **Guides** | Les cinq guides sources convertis en contenu structuré et navigable (260 Ko), rendus avec le même design system que le reste. |
| **Profil** | Profil Frontier + saisie manuelle de tout ce que l'API n'expose pas : grade de combinaison, ingénieurs débloqués, matériaux, Meta-Alloy. |

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
flutter test            # 307 tests
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

- **TDD** — 284 tests unitaires et widget. Le domaine (moteur de roadmap,
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
284 tests verts, `flutter build web` réussi.

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
