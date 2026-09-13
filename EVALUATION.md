# Évaluation du corpus `raw_data/`

Ce document manquait à trois cycles d'enrichissement successifs : le corpus s'enrichissait sans instrument de mesure,
si bien qu'il était impossible de savoir si un cycle donné avait amélioré ou dégradé quoi que ce soit, ni de détecter
une régression avant qu'un lecteur ne la remarque. Créé le 13 septembre 2026, au chantier 16 du
[plan de cycle 3](./docs/corpus-meta/2026-09-plan-cycle3.md).

## Ce que ce document n'est pas

Il n'existe **aucun pipeline d'ingestion RAG** dans ce dépôt à ce jour — voir la section « Notes d'ingestion RAG » de
[raw_data/README.md](./raw_data/README.md). Ce jeu de questions ne peut donc pas être rejoué contre un moteur de
recherche vectorielle : il se rejoue aujourd'hui **par lecture directe du corpus**, en vérifiant à la main que chaque
réponse attendue est toujours présente au fichier et à la section indiqués. Le jour où un pipeline existera, c'est le
même jeu de questions qui servira à le mesurer — le format a été choisi pour ça (une question posée comme un joueur la
tape, une réponse attendue en une phrase, un fichier et une section cibles).

## Le jeu de questions

[`eval/questions-reference.json`](./eval/questions-reference.json) : 72 questions couvrant les 32 guides thématiques
et les documents transversaux, en français avec les termes anglais réellement utilisés en jeu quand c'est l'usage
(« Federal Corvette », « First Footfall », « Material Trader »...). Chaque entrée porte :

| Champ | Contenu |
|---|---|
| `question` | Formulée comme un joueur la poserait |
| `reponse_attendue` | Une phrase, chiffrée quand le corpus chiffre |
| `fichier_attendu` | Le guide qui doit porter la réponse |
| `section_attendue` | La zone du guide à vérifier en priorité |
| `difficulte` | `facile` / `moyen` / `difficile` |
| `categorie` | Domaine du guide (reprend `domaine` du front-matter) |
| `fragile` | `true` pour les huit cas explicitement identifiés comme sensibles (voir ci-dessous) |
| `raison_fragilite` | Pourquoi la question est un test de non-régression, quand `fragile` est vrai |

### Les huit cas fragiles

Cités nommément par l'audit du cycle 3 comme les questions que le corpus ne pouvait pas trancher avant les chantiers
correctifs, et qui servent maintenant de sentinelles contre toute régression :

1. Combien coûte un Federal Corvette ? (Q001 — sentinelle contre le retour de l'erreur de prix d'un facteur 10)
2. Quelle plante d'exobiologie rapporte le plus ? (Q002)
3. Puis-je installer un Material Trader sur mon Fleet Carrier ? (Q003 — sentinelle contre la contradiction 06/19)
4. Quel ingénieur monte le FSD en G5 ? (Q004)
5. Puis-je faire de la colonisation sur PS5 ? (Q005 — seule question qui exige une synthèse inter-fichiers, voir sa note)
6. Dans quel type d'anneau trouve-t-on du Benitoite ? (Q006)
7. Quel rang faut-il pour l'Imperial Cutter ? (Q007)
8. Où récolter des méta-alliages ? (Q008)

## Méthode de notation

Pour chaque question, un examen attribue l'un de ces quatre statuts :

- **OK** — la réponse attendue est trouvable telle quelle (ou à une reformulation près) dans le fichier et la zone
  indiqués.
- **DÉGRADÉ** — elle a disparu, s'est contredite avec un autre guide, ou a changé de fichier sans que cette entrée
  soit mise à jour. Un DÉGRADÉ sur une question non marquée `fragile` est un signal de régression à traiter en
  priorité, avant toute nouvelle fonctionnalité de contenu.
- **AMÉLIORÉ** — le corpus répond désormais avec un chiffre plus précis, une source plus solide, ou une contradiction
  en moins par rapport à l'état où la question a été écrite.
- **SANS OBJET** — le fichier ou la section cible a été restructuré au point que la question doit être réécrite ; ne
  pas laisser ce statut sans mettre à jour l'entrée correspondante dans `eval/questions-reference.json`.

Consigner le résultat global (nombre de OK/DÉGRADÉ/AMÉLIORÉ/SANS OBJET) dans [CHANGELOG.md](./CHANGELOG.md) à la fin
de chaque cycle d'enrichissement.

## Relevé de référence — 13 septembre 2026 (état après le chantier 16)

72 questions écrites, 72 vérifiées au moment de l'écriture (chaque réponse attendue a été confirmée dans le corpus
avant d'être figée dans le fichier JSON, en s'appuyant sur les greps et lectures faites pendant ce chantier — voir en
particulier Q001, Q003, Q004, Q006, Q007 et Q008, vérifiées directement sur les fichiers sources pendant l'écriture de
ce jeu). Statut initial : **72 OK, 0 DÉGRADÉ.** C'est la ligne de base contre laquelle tout cycle futur se compare.

## Ce qui reste à faire

- Étendre le jeu de questions aux guides sous-représentés dans cette première version (05-guardians, 04-equipements,
  09-combat-a-pied, 24-community-goals, 26-ingenierie-a-pied-avancee n'ont pas de question dédiée dans cette édition).
- Écrire un script qui automatise la vérification (recherche du fichier/section, correspondance approximative de la
  réponse attendue) plutôt qu'une relecture manuelle, une fois qu'un format de chunk stable existe.
- Rejouer ce jeu à la fin de chaque chantier futur et reporter systématiquement le delta dans
  [CHANGELOG.md](./CHANGELOG.md), y compris quand le delta est nul.
