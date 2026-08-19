# Configuration du client_id Frontier par `.env`

Statut : validé le 2026-08-19, prêt pour le plan d'implémentation.

## Problème

Le `client_id` Frontier se saisit aujourd'hui à la main dans *Réglages → Compte
Frontier* et vit dans le trousseau système. Ce modèle datait d'une contrainte
réelle : le projet n'avait pas de client enregistré, et emprunter celui d'un
autre outil aurait fait apparaître l'application sous le nom de cet outil dans
la liste des applications autorisées du joueur.

Cette contrainte est levée : le projet dispose désormais de son propre
`client_id`, délivré par Frontier. On veut donc le compiler dans les builds
officiels, sans jamais le committer dans un dépôt public.

## Décisions

| Question | Décision | Raison |
|---|---|---|
| Le `.env` remplace-t-il la saisie ? | **Défaut compilé + override possible** | Un build depuis les sources sans `.env` reste utilisable, et un commandant garde la possibilité d'utiliser son propre client. |
| Où la valeur compilée entre-t-elle ? | **Repli dans `AuthLocalDataSource`** | `readClientConfig()` a **quatre** appelants dans `AuthRepositoryImpl` — `currentStatus()` (l. 54), `clientConfig()` (l. 70), `signIn()` (l. 100) et `refresh()` (l. 201). Un repli posé là les couvre tous, et un cinquième appel ajouté plus tard en hériterait. |
| Format du fichier de tâches | **`Taskfile.yml` (go-task)** | Demandé explicitement. À installer : `sudo snap install task --classic`. |

### Mécanisme écarté

Lire un `.env` au démarrage de l'application (`flutter_dotenv` ou lecture
disque) n'est pas viable : sur Android et iOS aucun emplacement n'est
accessible au commandant pour y déposer un fichier, et l'embarquer en asset
oblige à le déclarer dans `pubspec.yaml`, donc casse le build quand il manque —
exactement le cas d'une compilation depuis les sources publiques. La valeur
resterait par ailleurs tout aussi extractible.

Le mécanisme retenu est `--dart-define-from-file=.env`, supporté nativement au
format `CLÉ=valeur` par Flutter 3.47, et accepté aussi bien par `flutter run`
que par `flutter build`.

## Architecture

### 1. La valeur compilée

Nouveau `lib/core/config/build_config.dart` :

```dart
@lazySingleton
class BuildConfig {
  const BuildConfig();

  static const String frontierClientIdKey = 'FRONTIER_CLIENT_ID';

  /// Compiled in by `--dart-define-from-file=.env`; empty in a build made
  /// without one, which is the normal case for a checkout of the sources.
  String get frontierClientId =>
      const String.fromEnvironment(frontierClientIdKey);
}
```

Le nom de clé est exposé en constante pour que le test de `.env.template`
compare au code plutôt qu'à un littéral recopié. La classe est injectée plutôt
que consultée statiquement : une constante de compilation ne se falsifie pas
dans un test, un objet injecté oui.

### 2. Le repli

`AuthLocalDataSource` reçoit `BuildConfig` en troisième paramètre de
constructeur. `readClientConfig()` renvoie la valeur du trousseau si elle
existe, la valeur compilée sinon :

```dart
final String saved = await _secureStore.read(StorageKeys.oauthClientId) ?? '';
final bool isBuildDefault = saved.isEmpty && _build.frontierClientId.isNotEmpty;
return OAuthClientConfig(
  clientId: saved.isEmpty ? _build.frontierClientId : saved,
  redirectUri: await _keyValueStore.readString(StorageKeys.oauthRedirectUri) ?? '',
  clientIdIsBuildDefault: isBuildDefault,
);
```

Le quatrième appelant, `refresh()`, est celui qui rend ce placement décisif :
il rejoue toutes les 4 h et échouerait sur `AuthConfigurationFailure` pour tout
commandant n'ayant jamais rien saisi, si le repli était posé ailleurs.

Le commentaire de classe, qui affirme aujourd'hui que « le client id vit dans
`SecureStore` », est réécrit : la responsabilité devient « résoudre la
configuration effective », pas « la stocker ».

### 3. Revenir au défaut compilé

Sans ce point, un override serait sans retour : une fois un client_id saisi,
rien ne permettrait de revenir à celui du build. Vider le champ et enregistrer
écrit une chaîne vide dans le trousseau, donc la lecture retombe sur la valeur
compilée. Aucune plomberie supplémentaire n'est nécessaire côté stockage.

Le comportement ne dépend pas de la façon dont l'implémentation de `SecureStore`
traite l'écriture d'une chaîne vide : qu'elle stocke `''` ou qu'elle supprime la
clé, `read()` renvoie ensuite `''` ou `null`, et le `?? ''` suivi du test
`isEmpty` mène au repli dans les deux cas.

En revanche `AuthRepositoryImpl.saveClientConfig()` rejette aujourd'hui tout
client_id vide par une `ValidationFailure`. Nouvelle règle : rejeter le vide
**seulement** si le build n'a pas de défaut, avec le message actuel inchangé
dans ce cas. `BuildConfig` est donc aussi injecté dans le repository, pour
cette seule condition.

### 4. Les fichiers de configuration

`.env.template`, committé, porte les commandes en commentaire et une clé vide :

```
# Copier en `.env` (ignoré par git), puis compiler avec :
#   task run:linux        (le drapeau est ajouté automatiquement)
#   flutter run --dart-define-from-file=.env
#
# client_id délivré par Frontier après validation manuelle :
# https://user.frontierstore.net → Developer Zone → Create Client
FRONTIER_CLIENT_ID=
```

`.gitignore` reçoit `.env`, sans négation `!.env.template` : le motif `.env` ne
matche pas `.env.template`, la négation serait du bruit.

### 5. L'interface

`OAuthClientConfig` gagne un booléen `clientIdIsBuildDefault`, renseigné par le
data source, inclus dans les `props` d'Equatable, défaut `false` pour ne casser
aucun site de construction existant.

Le champ CLIENT ID de `frontier_connection_page.dart` l'utilise pour un texte
d'aide : « Valeur par défaut de ce build — une saisie la remplace sur cet
appareil » quand elle vient du `.env`, rien de plus quand elle vient de
l'appareil.

C'est le point le plus discutable du design — une propriété d'entité de domaine
au service d'un texte d'aide. Il se défend parce que « d'où vient cette valeur »
est une propriété réelle de la configuration résolue, pas une préoccupation
d'affichage.

### 6. `Taskfile.yml`

Le drapeau `--dart-define-from-file=.env` est ajouté automatiquement quand le
fichier existe, via une variable dynamique :

```yaml
vars:
  DEFINES:
    sh: test -f .env && printf -- '--dart-define-from-file=.env' || true
```

Les tâches spécifiques à un système portent la clé `platforms:` de go-task
(`[linux]`, `[darwin]`, `[windows]`), pour que `build:all` ne construise que ce
que l'hôte sait construire au lieu d'échouer.

Tâches : `setup`, `gen` (build_runner), `analyze`, `test`, `check`
(analyze + test), `run:linux|android|ios|macos|windows|web`,
`build:apk|appbundle|ios|linux|macos|windows|web`, `build:all`.

**`test` ne reçoit délibérément pas les defines.** La suite doit rester
honnête : aucun test ne peut dépendre d'un vrai client_id, ce qui est
précisément la raison pour laquelle `BuildConfig` est injecté.

Deux points ajoutés à l'implémentation, absents de la première version de ce
document :

- `analyze` passe `--fatal-infos`. Sans ce drapeau `dart analyze` sort en 0
  malgré des lints de niveau *info*, et `check` verdissait sur du code que
  l'analyseur désapprouve — constaté en écrivant les tests.
- La variable `DEFINES` utilise `printf '%s'` et non `printf --`.
  L'interpréteur shell intégré à go-task lit le `--` comme chaîne de format et
  n'émettait que lui, produisant `flutter run -d linux --`.

## Fichiers touchés

**Nouveaux**

- `lib/core/config/build_config.dart`
- `.env.template`
- `Taskfile.yml`
- `test/fixtures/in_memory_stores.dart` — faux `SecureStore` et `KeyValueStore`
- `test/features/auth/data/auth_local_data_source_test.dart`
- `test/features/auth/data/auth_repository_client_config_test.dart`
- `test/core/config/env_template_test.dart`

**Modifiés**

- `lib/features/auth/data/datasources/auth_local_data_source.dart`
- `lib/features/auth/data/repositories/auth_repository_impl.dart`
- `lib/features/auth/domain/entities/oauth_client_config.dart`
- `lib/features/auth/presentation/pages/frontier_connection_page.dart`
- `lib/core/di/injection.config.dart` — régénéré par build_runner
- `.gitignore`
- `README.md`

## Tests

`AuthLocalDataSource` n'est couvert par aucun test aujourd'hui et il n'existe
aucun faux pour `SecureStore` / `KeyValueStore` ; les deux sont écrits en
mémoire dans `test/fixtures/`.

1. **Le repli** — valeur enregistrée prioritaire sur la valeur compilée ;
   valeur compilée servie quand le trousseau est vide ; résultat vide quand les
   deux manquent ; `clientIdIsBuildDefault` vrai dans le seul cas attendu.
2. **La validation** — soumettre un champ vide efface l'override quand un
   défaut existe et réussit ; échoue avec le message actuel quand il n'y en a
   pas.
3. **Le texte d'aide** — `clientIdHelperText()` est une fonction pure testée
   directement. Elle prouve la règle, pas le rendu : rien ne vérifie que le
   `TextField` l'affiche vraiment, parce que monter la page réclamerait le
   graphe DI complet et le canal de plateforme du trousseau.
4. **`.env.template`** — déclare exactement les clés que le code lit
   (comparaison à `BuildConfig.frontierClientIdKey`, pas à un littéral), se
   parse en `CLÉ=valeur`, et **ne contient aucune valeur**. Ce dernier point
   empêche qu'un client_id parte un jour dans le dépôt public par un `git add`
   distrait.

## Hors périmètre

- **CI** : le dépôt n'a pas de `.github/workflows`. Le jour où il en aura un,
  le `client_id` viendra d'un secret de dépôt écrit dans un `.env` éphémère
  avant le build — hors de ce design.
- **Migration de données** : aucune. Un commandant ayant déjà saisi son
  client_id garde exactement le comportement actuel, sa valeur restant
  prioritaire.

## Risque assumé

Un client_id compilé est **extractible du binaire**. Ce n'est pas un secret au
sens OAuth — le flux est en PKCE et la « Shared Key » n'est jamais utilisée —
mais quelqu'un peut le récupérer et publier un outil qui s'annonce sous le nom
de ce projet auprès de Frontier. C'est le prix de l'option retenue, et le
modèle qu'EDMC applique déjà.
