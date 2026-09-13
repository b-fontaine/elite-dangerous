# Historique des cycles d'enrichissement du corpus

Ce document retrace les trois cycles d'audit et d'enrichissement du corpus `raw_data/`, avec leur date, leur portée
et les fichiers touchés. Créé le 13 septembre 2026 au chantier 16 (voir
[docs/corpus-meta/2026-09-plan-cycle3.md](./docs/corpus-meta/2026-09-plan-cycle3.md)), qui posait ce manque comme l'un
des points aveugles méthodologiques du corpus : on l'enrichissait sans historique consultable en dehors de l'historique
Git et de la prose d'introduction de [raw_data/README.md](./raw_data/README.md).

**Règle qui accompagne ce fichier** : tout item marqué comme incertain ou non tranché dans le
[registre d'incertitudes](./raw_data/00-chronologie-canonique.md#registre-dincertitudes-du-corpus) qui se trouve
résolu par un cycle futur doit déclencher, dans le même geste, une mise à jour de sa notice README (ligne du guide
concerné) **et** une entrée dans ce fichier. Un fait résolu qui ne change que le corps du guide, sans toucher ni le
registre ni le CHANGELOG, se perd à la prochaine relecture.

## Cycle 1 — refonte initiale (date non consignée dans le corpus, antérieure au 8 septembre 2026)

**Portée** : révision des 17 guides fondateurs (corrections factuelles croisées, premières données chiffrées vérifiées
auprès de sources primaires) et création de 8 nouveaux guides couvrant des pans jusque-là absents : Colonisation,
Fleet Carriers, Minage, BGS, Squadrons, jeu en groupe, Community Goals, combat anti-Thargoïde approfondi. Plan archivé
dans [docs/corpus-meta/2026-09-cycle1-plan.md](./docs/corpus-meta/2026-09-cycle1-plan.md) (« ses actions ont été
entièrement appliquées ; il ne décrit donc pas l'état actuel du corpus »).

**Fichiers touchés** : les 17 guides `01-*.md` à `17-*.md`, création de `18-colonisation.md` à `25-combat-ax.md`.

**Limite constatée en écrivant ce changelog** : ce cycle n'a pas de date précise consignée dans le corpus lui-même —
seul son contenu (appliqué) et son plan (archivé) subsistent. Ne pas inventer de date : c'est le premier cas d'usage
réel de la règle « signaler l'absence plutôt qu'estimer » posée dans
[00-methodologie-sourcing.md](./raw_data/00-methodologie-sourcing.md).

## Cycle 2 — enrichissement ciblé (date non consignée, antérieur au 8 septembre 2026)

**Portée** : complément actionnable et chiffré de trois guides existants (farming des matériaux d'Engineering et de
la boucle Guardian, logistique de transport pour la Colonisation) et création de deux nouveaux guides :
`26-ingenierie-a-pied-avancee.md` et `27-debuter-et-progresser.md`.

**Fichiers touchés** : `06-ingenieurs.md`, `12-transport.md`, un troisième guide non identifié précisément par cette
relecture, plus la création de `26-ingenierie-a-pied-avancee.md` et `27-debuter-et-progresser.md`.

**Limite constatée** : aucun plan écrit propre à ce cycle n'a été retrouvé dans `docs/corpus-meta/` — seule la
synthèse en deux phrases de [raw_data/README.md](./raw_data/README.md) (§ introduction) en atteste. Contrairement au
cycle 1, il n'a pas laissé de document de travail archivé. À signaler comme une lacune de traçabilité plutôt qu'à
combler rétroactivement par une reconstitution non sourcée.

## Cycle 3 — audit à 10 dimensions et 18 chantiers (achevé, 9 → 13 septembre 2026)

**Portée** : audit du 9 septembre 2026 sur 10 dimensions indépendantes (couverture des boucles de gameplay, lore,
données référentielles, structure RAG, fraîcheur, questions joueur, écosystème externe, cohérence interne, sourcing,
pédagogie), chacune vérifiée de façon adverse puis complétée — 143 constats retenus, détaillés dans
[docs/corpus-meta/2026-09-constats.md](./docs/corpus-meta/2026-09-constats.md). Plan en 18 chantiers dans
[docs/corpus-meta/2026-09-plan-cycle3.md](./docs/corpus-meta/2026-09-plan-cycle3.md).

| # | Chantier | Statut au 13/09/2026 | Fichiers principaux touchés |
|---|---|---|---|
| 1 | Absorber les données factuelles du dépôt (assets/data, docs/faisabilite) | Fait — contenu constaté conforme (binômes d'espèces d'exobiologie complets, matériaux, blueprints), mais sans session dédiée identifiable dans l'historique narré de raw_data/README.md | 10-exploration.md, 06-ingenieurs.md, README.md |
| 2 | Corriger les erreurs factuelles et contradictions internes | Fait — 9 septembre 2026, « réparation » Nomad/Operations et 14 points de correction | 08-combat-spatial.md, 06-ingenieurs.md, 00-glossaire.md, 01-lore.md, 00-chronologie-canonique.md et 9 autres guides |
| 3 | Rendre le corpus ingérable (front-matter, index.yaml, autosuffisance) | Fait — 10 septembre 2026 | les 31 guides d'alors, `index.yaml` créé |
| 4 | Référentiels chiffrés vaisseaux/modules/armes depuis EDCD/coriolis-data | Fait — contenu constaté conforme (tables chiffrées de 04-equipements.md et 03-vaisseaux.md), statut d'exécution précis non retrouvé dans l'historique narré | 03-vaisseaux.md, 04-equipements.md |
| 5 | Chiffrer l'exploration spatiale (scan, classes stellaires, boost) | Non vérifié par ce chantier — à confirmer lors d'une prochaine revue | 10-exploration.md |
| 6 | Guide 28 — marchandises, denrées rares, minerais | Fait — 10 septembre 2026 | `28-marchandises.md` créé, 11-commerce.md, 20-minage.md |
| 7 | Guide 29 — missions, réputation et rangs | Fait — 12 septembre 2026 | `29-missions-reputation-et-rangs.md` créé |
| 8 | Guide 30 — piraterie, prédation, PvP subi | Fait — 12 septembre 2026 | `30-piraterie-et-pvp.md` créé, 23-jeu-en-groupe.md |
| 9 | Guide 31 — pilotage, navigation, stations, SRV | Fait — 12 septembre 2026 | `31-pilotage-navigation-et-stations.md` créé, 03-vaisseaux.md, 04-equipements.md |
| 10 | Guide 32 — géographie galactique | Fait — 12 septembre 2026 | `32-geographie-galactique.md` créé, 00-glossaire.md |
| 11 | Dossier thargoïde/Guardian non-combat (Pléiades, Barnacles, Spires, Logs) | Fait — 12 septembre 2026 | 01-lore.md, 25-combat-ax.md, 05-guardians.md, 10-exploration.md |
| 12 | Glossaire de résolution d'entités | Fait — 13 septembre 2026 | 00-glossaire.md |
| 13 | Lore vivant (trou 3304-3306, mystères, GalNet, transmedia) | Fait — 13 septembre 2026 | 01-lore.md |
| 14 | Chiffrer les boucles de farming (synthèse, USS, megaships) | Fait — 13 septembre 2026 | fichiers de farming concernés (voir commit `1190e25`) |
| 15 | Carte transversale des boucles de gameplay | Fait — 13 septembre 2026 | `00-boucles-de-gameplay.md` créé, 25-combat-ax.md, 08-combat-spatial.md, 12-transport.md, 10-exploration.md |
| 16 | Gouvernance du sourcing et instrumentation | Fait — 13 septembre 2026, en deux passes le même jour | `00-methodologie-sourcing.md` créé ; registre d'incertitudes de `00-chronologie-canonique.md` étendu aux 32 guides (451 entrées) ; `EVALUATION.md`, `eval/questions-reference.json` (72 questions), `CHANGELOG.md` créés ; format Sources normalisé sur 12 guides (11-commerce, 02-powerplay, 01-lore, 07-equipement-a-pied, 08-combat-spatial, 09-combat-a-pied, 10-exploration, 12-transport, 13-operations, 16-outils, 18-colonisation, 23-jeu-en-groupe) ; colonne `Fiab.` ajoutée sur 4 guides (01-lore, 12-transport, 18-colonisation, 22-squadrons, 227 lignes) |
| 17 | Maillage, lexique bilingue, index par question | Fait — 13 septembre 2026 | `34-lexique-fr-en.md` et `00-faq.md` créés ; sections « Questions fréquentes » et gloses bilingues sur les 32 guides existants ; index.yaml et README.md mis à jour (38 fichiers) |
| 18 | Guide 33 — client, éditions, branches Live/Legacy, périphériques et VR | Fait — 13 septembre 2026 | `33-client-editions-peripheriques-et-vr.md` créé ; 15-roadmap.md, 17-sources-donnees.md, 16-outils.md, 13-operations.md, 06-ingenieurs.md, 03-vaisseaux.md, 27-debuter-et-progresser.md, 00-glossaire.md, index.yaml et README.md mis à jour (39 fichiers) |

**Limite constatée pour les chantiers 5 et 1/4** : ce chantier de gouvernance n'a pas eu pour objet de ré-auditer le
contenu factuel des chantiers précédents. Les statuts « Fait » du tableau ci-dessus reposent sur la présence
constatée du contenu attendu dans les guides cibles (lu directement pendant ce chantier) ou sur la prose d'historique
de `raw_data/README.md` ; ils ne constituent pas une vérification exhaustive ligne à ligne. Le chantier 5 en
particulier n'a pu être ni confirmé ni infirmé dans le temps disponible : à vérifier en priorité lors d'une prochaine
session, avant de le supposer fait ou de le relancer en double.

## Relevé de l'instrument de mesure (chantier 16)

[EVALUATION.md](./EVALUATION.md) et [eval/questions-reference.json](./eval/questions-reference.json) : 72 questions
de référence, statut initial **72 OK, 0 DÉGRADÉ** au 13 septembre 2026. À rejouer et à consigner ici après chaque
cycle futur, y compris quand le delta est nul.
