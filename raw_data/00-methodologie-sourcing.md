---
id: 00-methodologie-sourcing
titre: "Méthodologie de sourcing et gouvernance du corpus"
domaine: transversal
entites: [hiérarchie de sources, P1, P2, P3, P4, échelle de confiance, clé de citation, registre d'incertitudes, ÉCHEC 403, politique de source unique, MassivelyOP]
mots_cles_en: [source hierarchy, confidence scale, citation key, single-source policy, uncertainty registry, primary source, dead link, press coverage]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-13
confiance_globale: haute
volatilite: basse
sources_primaires: ["00-chronologie-canonique.md (échelle de confiance haute/moyenne/non confirmé, l.42-43, généralisée ici)", "README.md (gabarit de front-matter, champ confiance_globale)", "pratique de sourçage déjà observée dans 21-bgs.md, 19-fleet-carriers.md, 20-minage.md, 26-ingenierie-a-pied-avancee.md et 27-debuter-et-progresser.md", "5 articles massivelyop.com relus directement le 13 septembre 2026 (voir §7)"]
zones_incertaines: ["le format de section Sources normalisé au §9 n'a été rétroactivement appliqué qu'à 11-commerce.md et 02-powerplay.md à ce jour ; les 9 autres guides à 100 % d'URL nues identifiés par l'audit restent à convertir", "les cinq guides cités comme pratiquant déjà « le format normalisé » par le plan de cycle 3 (21-bgs, 19-fleet-carriers, 20-minage, 26, 27) utilisent en réalité une prose annotée proche dans l'esprit mais pas dans la forme du gabarit à puces défini ici — voir la note du §9", "la colonne terminale « Fiab. » (P/C/E/N) prescrite par le chantier 16 pour les tableaux chiffrés de 01-lore.md, 22-squadrons.md, 12-transport.md et 18-colonisation.md n'a pas été ajoutée dans cette passe (232 lignes à trancher une par une, non fait faute de temps) — à traiter dans un prochain chantier plutôt qu'à bâcler ici", "le registre d'incertitudes de 00-chronologie-canonique.md ne couvre encore que 5 des 32 guides thématiques (les plus denses identifiés par l'audit) ; les aveux d'incertitude des 27 autres restent à y migrer"]
guides_lies: [0, 17]
---
# Méthodologie de sourcing et gouvernance du corpus

## En bref

Ce document fixe les règles de sourçage que les 35 autres fichiers de `raw_data/` doivent suivre, et que trois
cycles d'enrichissement ont appliquées sans jamais les écrire noir sur blanc : une **hiérarchie de sources** à quatre
paliers (P1 patch notes/journal/EDCD, P2 bases communautaires recoupées, P3 presse spécialisée, P4 estimation, et un
palier interdit), une **échelle de confiance** à quatre valeurs qui généralise et réconcilie les deux échelles
partielles déjà en usage (`confiance_globale` du front-matter et la colonne *Confiance* de
[00-chronologie-canonique.md](./00-chronologie-canonique.md)), une règle de date (réelle ISO vs in-jeu, jamais
confondues), une règle d'URL (date de consultation obligatoire, échecs consignés à part sous un marqueur `[ÉCHEC]`),
une convention de clé de citation courte, et la politique de **source unique** : un fait chiffré vit dans un seul
guide, les autres y renvoient. Le §7 tranche un point de gouvernance concret laissé ouvert par l'audit du cycle 3 : la
fiabilité de MassivelyOP comme source de presse, vérifiée sur cinq articles relus directement. Rien ici n'ajoute de
connaissance sur le jeu ; tout ce qui suit rend les 35 autres fichiers mesurables et comparables entre eux.

## 1. Hiérarchie de sources opposable

Quatre paliers, notés en abrégé `[P1]` à `[P4]` quand l'annotation inline est utile (voir §4) :

| Palier | Définition | Exemples dans ce corpus |
|---|---|---|
| **P1 — primaire** | Émis par Frontier Developments lui-même, ou extrait mécaniquement du jeu | Notes de version officielles, billets Steam News (App ID 359320), GalNet officiel, journal du jeu (Player Journal), `EDCD/coriolis-data`, `EDCD/FDevIDs` |
| **P2 — communautaire recoupée** | Base communautaire vivante, à jour, recoupée par au moins deux sources indépendantes | Inara.cz, EDSM, Spansh, Canonn Research, quand deux d'entre elles convergent |
| **P3 — presse spécialisée** | Article de presse dédiée au jeu vidéo, daté, signé | MassivelyOP, PC Gamer, TheSixthAxis, PCGamesN, Engadget, RoadToVR |
| **P4 — estimation** | Connaissance communautaire non recoupée, reconstruction, valeur non revérifiée | Un chiffre relevé sur un seul forum, une extrapolation faite par ce corpus lui-même (marquée `[R]` comme dans [00-boucles-de-gameplay.md](./00-boucles-de-gameplay.md)) |
| **Interdit** | Non citable comme source positive, quel que soit le palier apparent | Site de contenu généré sans rédaction humaine identifiable, agrégateur sans attribution, page dont le seul mérite est de bien référencer le mot-clé cherché |

Règle d'usage : à confiance de fait égale, un palier plus haut l'emporte ; deux sources P2 convergentes valent un P1
absent ; une seule source P3 ou P4 ne suffit jamais à trancher une contradiction (elle sert à corroborer un fait déjà
établi, ou à documenter une zone d'incertitude comme telle).

## 2. Échelle de confiance — quatre valeurs, un seul vocabulaire

Le corpus utilisait jusqu'ici deux échelles qui se recouvrent sans coïncider : la colonne *Confiance* de
[00-chronologie-canonique.md](./00-chronologie-canonique.md#note-dusage--portée-de-ce-document-et-règles-darbitrage-du-corpus)
(*haute*, *moyenne*, *non confirmé*) et le champ `confiance_globale` du front-matter (*haute*, *moyenne*, *basse*, sans
*non confirmé*). Les deux se généralisent dans l'échelle unique ci-dessous, à utiliser partout où une confiance doit
être exprimée — table de réconciliation, front-matter, registre d'incertitudes du §6 :

| Valeur | Définition | À ne pas confondre avec |
|---|---|---|
| **Haute** | Au moins une source P1, ou deux sources P2 convergentes | — |
| **Moyenne** | Une seule source P2, ou une source P1 partielle/indirecte | *Basse* : ici une source existe et est raisonnablement fiable, elle est seulement incomplète |
| **Basse** | Seulement du P3/P4, ou une source unique non recoupée | *Non confirmé* : ici une trace existe, mais fragile — à distinguer d'une absence totale |
| **Non confirmé** | Aucune source fiable trouvée après recherche réelle | Ne vaut jamais verdict d'inexistence — c'est l'état d'une recherche à une date donnée (voir l'épisode Nomad/Operations, [00-chronologie-canonique.md](./00-chronologie-canonique.md)) |

Les entrées déjà écrites du corpus qui n'utilisent que trois valeurs ne sont pas à retoucher rétroactivement pour ce
seul motif ; c'est l'échelle à quatre valeurs qui fait foi pour toute entrée nouvelle à partir de ce document.

## 3. Règle de date : réelle vs in-jeu

Toute date de vérification, de consultation ou de relevé est une **date réelle**, au format ISO `AAAA-MM-JJ`. Une date
in-univers (le calendrier du jeu, en avance de +1286 ans sur le calendrier réel — voir
[00-chronologie-canonique.md](./00-chronologie-canonique.md)) ne s'écrit jamais nue : elle porte systématiquement la
mention `(in-game)`, par exemple `3311-09-30 (in-game)`, et ne sert jamais de date de vérification. C'était l'erreur
corrigée au cycle 2 dans [10-exploration.md](./10-exploration.md) (une date « 30/09/3311 » lue comme un relevé réel) ;
la règle généralise cette correction ponctuelle.

## 4. Règle des URL et des échecs de consultation

Toute URL citée en source porte, sur la même ligne ou dans la même entrée, sa **date de consultation** réelle. Une
tentative de consultation qui échoue (403, 402, 404, 410, CAPTCHA, contenu insuffisant) n'est **pas** supprimée : elle
est déplacée dans une sous-section distincte, `### Sources tentées sans succès (NE PAS CITER)`, chaque ligne portant
le marqueur `[ÉCHEC <code>]` — par exemple `[ÉCHEC 403]`, `[ÉCHEC 402]`. Cette sous-section a deux fonctions :
documenter qu'une source a été réellement essayée (et non simplement ignorée), et empêcher qu'un chunk RAG cite un
lien mort comme une source positive. Précédent déjà pratiqué en prose dans
[21-bgs.md](./21-bgs.md#sources) et dans le corps de
[00-chronologie-canonique.md](./00-chronologie-canonique.md#3-mode--operations---existence-version-4400-et-date-de-sortie-30-juin-2026) ;
la présente règle le formalise en gabarit reproductible.

## 5. Interdiction des chemins absolus

Aucune source ni aucun lien interne ne cite un chemin de fichier absolu de la machine de rédaction
(`/Users/...`, `C:\Users\...`). Seuls les chemins relatifs (`./NN-nom.md`) et les URL publiques sont admis. Précédent :
correction des dix chemins `/Users/bfontaine/...` de
[24-community-goals.md](./24-community-goals.md), appliquée au cycle précédent.

## 6. Politique de source unique

Un fait chiffré (prix, date, quantité, barème) vit dans **un seul guide**, désigné comme sa source de vérité ; tout
autre guide qui en a besoin y **renvoie** plutôt que de le ressaisir. Ressaisir un chiffre dans deux fichiers, c'est
créer une contradiction future dès que l'un des deux est corrigé sans que l'autre le soit — c'est exactement le
mécanisme qui a produit l'erreur d'un facteur 10 sur le prix du Federal Corvette. Exemple déjà appliqué : le prix et
le rang d'achat de chaque vaisseau vivent dans [03-vaisseaux.md](./03-vaisseaux.md) ; 08-combat-spatial.md et les
autres guides qui mentionnent un vaisseau y renvoient au lieu de citer un prix en propre.

## 7. Étude de cas : la fiabilité de MassivelyOP comme source de presse

L'audit du cycle 3 relevait que MassivelyOP (`massivelyop.com`) est citée 54 fois dans le corpus — dans
[00-chronologie-canonique.md](./00-chronologie-canonique.md) (huit citations, dates de sorties Update 13 à 18 et
destruction du Titan Taranis), [01-lore.md](./01-lore.md), [07-equipement-a-pied.md](./07-equipement-a-pied.md),
[10-exploration.md](./10-exploration.md) et surtout [12-transport.md](./12-transport.md) et
[14-rhino.md](./14-rhino.md) (26 citations à elles deux, tout l'historique de la mise à jour Operations) — sans que
les cinq articles de sa propre bibliographie consacrés nommément à « Operations » aient jamais été relus. Ces cinq
articles ont été relus en direct le 13 septembre 2026 :

| Date | Titre | Ce qu'il annonce | Confirmé par la suite ? |
|---|---|---|---|
| 5 nov. 2025 | *Elite Dangerous announces a paid station, a new ship, and multi-step operation missions* | Premier dévoilement d'« operations » : missions répétables à 4 joueurs mêlant combat vaisseau et FPS, fenêtre visée « early 2026 » | Oui — la fenêtre a ensuite glissé deux fois (voir lignes suivantes), mais la nature de la fonctionnalité annoncée ici est exactement celle sortie le 30 juin 2026 |
| 11 janv. 2026 | *Elite Dangerous drops preliminary details about its 'raid-like' multiplayer operations instances* | « raid-like instanced events » accessibles depuis toute station habitée, mélange vaisseau/armes d'infanterie/SRV, exemple d'assaut de méga-vaisseau en apesanteur | Oui — méga-vaisseau *Reclamation Point* au lancement, accès par tableau de missions confirmés par les notes de version du 1ᵉʳ juillet 2026 |
| 17 févr. 2026 | *Elite Dangerous plots six vessel releases, group-based operations, and a feature reboot in 2026 roadmap* | Fenêtre resserrée à la mise à jour d'avril 2026 ; monnaie dédiée pour modules/blueprints ; variante Powerplay avec mérites et *undermining* | Oui pour la monnaie (Merc Coin) et la variante Powerplay ; la fenêtre d'avril a de nouveau glissé (ligne suivante) |
| 23 avr. 2026 | *Elite Dangerous delays dungeon-like operations to June, makes new ship available for credits April 28* | Troisième report, à juin 2026 ; **six opérations au lancement**, mode *Mercenary* par défaut et mode *Powerplay*, équipe de 4 via l'**Operation Runner**, monnaie **Merc Coin** non achetable | Oui — sortie effective le 30 juin 2026 avec exactement six opérations et l'Operation Runner, conformément à [00-chronologie-canonique.md, fait 3](./00-chronologie-canonique.md#3-mode--operations---existence-version-4400-et-date-de-sortie-30-juin-2026) |
| 27 août 2026 | *Elite Dangerous previews the Rhino, surface mining, and a new operation arriving September 2* | Septième opération, **Under Siege** : appel de détresse d'un avant-poste planétaire, dégagement des menaces aériennes puis combat FPS au sol, puis arrivée d'« une menace plus importante » ; sortie confirmée pour le 2 septembre 2026 | Oui — Under Siege sort bien le 2 septembre 2026 avec le Rhino, conformément au fait 3 ; le déroulé en deux temps (aérien puis FPS, puis menace additionnelle) n'était pas encore détaillé dans le corpus avant cette relecture |

**Verdict : CONFIRMÉ.** Sur cinq articles relus intégralement, aucun ne contient d'information ultérieurement
démentie ; chacun annonce correctement, à sa date, l'état d'avancement réel de la fonctionnalité — y compris ses deux
reports successifs, que MassivelyOP a rapportés au fur et à mesure sans jamais les présenter comme définitifs à tort.
Le même constat vaut pour les huit citations de `00-chronologie-canonique.md` sur les Updates 13 à 18 (2022-2024) :
chaque date qu'elles apportent est cohérente avec la chronologie établie par ailleurs. MassivelyOP est donc à traiter
comme une source **P3 fiable** : bonne pour corroborer une date ou un détail de contenu déjà établi par une source P1,
insuffisante à elle seule pour trancher une contradiction, mais jamais à écarter par principe. Les 54 citations sont
maintenues ; aucune n'est retirée par ce chantier. Un détail inédit relevé lors de cette relecture (le déroulé en deux
temps d'*Under Siege*) a été ajouté à [13-operations.md](./13-operations.md) avec cette même source en référence.

## 8. Convention de clé de citation courte

Une source citée plusieurs fois dans un même guide peut porter une clé courte `[CLÉ-AAAA-MM-JJ]` (ex. `[EDCD-2026-09-09]`,
`[FDEV-4.4.0.0]`, `[INARA-2026-09-13]`), résolue une seule fois dans un registre en fin de section Sources plutôt que
répétée en toutes lettres à chaque occurrence. Cette convention est **facultative** et réservée aux guides à forte
densité de citations répétées (typiquement les guides chiffrés : 03-vaisseaux, 04-equipements, 06-ingenieurs,
11-commerce, 28-marchandises) ; un guide à faible répétition n'en a pas besoin.

## 9. Format normalisé d'une section Sources

```
- [CLÉ-AAAA-MM-JJ] https://exemple.tld/page | primaire | consulté le 13/09/2026 | confirme : le prix du Fleet Carrier (5 Md Cr) | ne confirme pas : le coût exact des trois services Odyssey
```

Cinq champs séparés par ` | ` : clé (optionnelle, voir §8) et URL ; palier `primaire`/`secondaire`/`tertiaire` (soit
respectivement P1, P2 ou P3-P4 regroupés — la nuance P3/P4 reste dans le corps du guide si elle importe) ; date de
consultation au format `JJ/MM/AAAA` ; ce que la source **confirme** ; ce qu'elle **ne confirme pas**, c'est-à-dire ce
qui reste incertain malgré elle. Ce dernier champ est ce qui manque le plus aux bibliographies actuelles du corpus :
une URL nue ne dit jamais ce qu'elle a servi à établir, ni ce qu'elle a laissé ouvert.

**État d'adoption au 13 septembre 2026.** Ce gabarit est appliqué en entier à
[11-commerce.md](./11-commerce.md) et [02-powerplay.md](./02-powerplay.md), les deux guides désignés en priorité par
l'audit du cycle 3 (respectivement 3 attributions pour 77 lignes de tableau, et une bibliographie non annotée).
L'audit avait identifié onze guides à 100 % d'URL nues : 16-outils, 12-transport, 01-lore, 10-exploration,
02-powerplay, 07-equipement-a-pied, 18-colonisation, 09-combat-a-pied, 23-jeu-en-groupe, 13-operations,
08-combat-spatial. Neuf d'entre eux restent à convertir — travail mécanique mais volumineux (plusieurs centaines de
lignes cumulées), laissé en l'état pour un prochain chantier plutôt que bâclé ici. Les cinq guides que l'audit citait
comme pratiquant « déjà » un format proche — [21-bgs.md](./21-bgs.md),
[19-fleet-carriers.md](./19-fleet-carriers.md), [20-minage.md](./20-minage.md),
[26-ingenierie-a-pied-avancee.md](./26-ingenierie-a-pied-avancee.md) et
[27-debuter-et-progresser.md](./27-debuter-et-progresser.md) — méritent une précision : à la relecture, ils annotent
bien leurs sources d'une phrase disant ce qu'elles confirment ou non (21-bgs et 26 le font sérieusement), mais en
**prose libre**, pas dans le gabarit à puces ci-dessus, et 27 en particulier ne fait que lister des URL nues suivies
d'un seul paragraphe d'annotation collective. Ils ne sont donc pas de purs modèles à copier tels quels ; l'esprit
(dire ce qu'une source établit) y est déjà, la forme normalisée reste à appliquer.

## Voir aussi

[00-chronologie-canonique.md](./00-chronologie-canonique.md) (registre d'incertitudes du corpus entier, table de
réconciliation des faits datés), [README.md](./README.md) (gabarit de front-matter, règles d'ingestion RAG),
[17-sources-donnees.md](./17-sources-donnees.md) (écosystème des sources de données du jeu),
[EVALUATION.md](../EVALUATION.md) (jeu de questions de référence qui mesure l'effet des chantiers de contenu),
[CHANGELOG.md](../CHANGELOG.md) (historique des cycles).

## Sources

- [00-chronologie-canonique.md](./00-chronologie-canonique.md) | interne | consulté le 13/09/2026 | confirme : l'échelle de confiance à trois valeurs et la règle de méthode sur l'absence non probante | ne confirme pas : une échelle à quatre valeurs, généralisée ici
- [README.md](./README.md) | interne | consulté le 13/09/2026 | confirme : le gabarit de front-matter et le champ `confiance_globale` à trois valeurs | ne confirme pas : une politique de source unique explicite
- https://massivelyop.com/2025/11/05/elite-dangerous-announces-a-paid-station-a-new-ship-and-multi-step-operation-missions/ | tertiaire | consulté le 13/09/2026 | confirme : premier dévoilement d'Operations, fenêtre « early 2026 » | ne confirme pas : le contenu final au lancement
- https://massivelyop.com/2026/01/11/elite-dangerous-drops-preliminary-details-about-its-raid-like-multiplayer-operations-instances/ | tertiaire | consulté le 13/09/2026 | confirme : nature « raid-like », mélange vaisseau/FPS/SRV, exemple de méga-vaisseau | ne confirme pas : les noms des opérations au lancement
- https://massivelyop.com/2026/02/17/elite-dangerous-plots-six-vessel-releases-group-based-operations-and-a-feature-reboot-in-2026-roadmap/ | tertiaire | consulté le 13/09/2026 | confirme : monnaie dédiée, variante Powerplay, fenêtre d'avril 2026 | ne confirme pas : la fenêtre finale (reportée à nouveau)
- https://massivelyop.com/2026/04/23/elite-dangerous-delays-dungeon-like-operations-to-june-makes-new-ship-available-for-credits-april-28/ | tertiaire | consulté le 13/09/2026 | confirme : report à juin 2026, six opérations, Operation Runner, Merc Coin | ne confirme pas : le contenu narratif détaillé de chaque opération
- https://massivelyop.com/2026/08/27/elite-dangerous-takes-a-quick-look-at-the-rhino-vehicle-surface-mining-and-a-new-operation-arriving-september-2/ | tertiaire | consulté le 13/09/2026 | confirme : déroulé en deux temps de l'opération Under Siege, sortie le 2 septembre 2026 | ne confirme pas : le contenu de « la menace plus importante » évoquée en fin d'opération
