# Base de connaissances Elite Dangerous

Cette base de connaissances rassemble une collection de guides de référence en français sur Elite Dangerous, pensés pour
alimenter un système de RAG (Retrieval-Augmented Generation). Chaque guide couvre un domaine du jeu en profondeur, avec
des informations à jour incluant les évolutions les plus récentes (2025-2026).

Cette édition fait suite à un cycle d'enrichissement majeur : les 17 guides existants ont été révisés en profondeur
(corrections factuelles croisées, données chiffrées vérifiées auprès de sources primaires, comblement de zones
d'ombre) et 8 nouveaux guides ont été créés pour couvrir des pans du jeu jusque-là absents (Colonisation, Fleet
Carriers, Minage, BGS, Squadrons, jeu en groupe, Community Goals, combat anti-Thargoïde approfondi). Deux documents
transversaux assurent la cohérence de l'ensemble du corpus.

Un second cycle d'enrichissement ciblé a depuis complété trois guides existants avec des méthodes actionnables et
chiffrées (farming des matériaux d'Engineering et de la boucle Guardian, logistique de transport pour la
Colonisation), et ajouté deux nouveaux guides : l'ingénierie avancée de l'équipement à pied (farming, échange,
optimisation) et un guide transversal sur les premiers pas et la progression de rang du nouveau Commandant.

Un troisième cycle, mené le 9 septembre 2026, a été de nature différente : c'est une **réparation**. Le corpus avait
conclu la veille que le vaisseau « Nomad » et la mise à jour « Operations » de 2026 n'existaient pas, et il avait
retiré ce contenu de onze guides en leur interdisant d'en donner date, fabricant ou classification. La conclusion
était fausse : elle reposait sur la recherche d'un vaisseau lancé depuis un vaisseau porteur dans des catalogues de
chantier naval, qui n'en recensent aucun. Le contenu retiré a été rétabli à partir des annonces officielles de
Frontier, et les guides concernés exposent désormais ce que ces annonces établissent, chaque fait étant rattaché à un
billet daté. La leçon de méthode est consignée en section propre dans
[00-chronologie-canonique.md](./00-chronologie-canonique.md).

Un quatrième cycle, mené le 10 septembre 2026, n'a pas touché aux faits : il a rendu le corpus **ingérable** par un
pipeline de RAG. Chaque guide porte désormais un front-matter YAML décrivant ce qu'il contient et ce qu'il ne sait
pas, un encart « En bref » qui répond à lui seul à la question générale du guide, et des titres de section qui restent
compréhensibles une fois extraits de leur fichier. [`index.yaml`](./index.yaml) agrège ces métadonnées en un routeur
de requête, et les *Notes d'ingestion RAG* en fin de document spécifient comment s'en servir.

Un cinquième cycle, mené le même jour, a comblé le manque de vocabulaire le plus visible du corpus : le catalogue des
marchandises. Le nouveau guide [28-marchandises.md](./28-marchandises.md) nomme et classe les 270 commodités et les
142 denrées rares du jeu, que les guides d'économie ne faisaient jusqu'ici qu'effleurer, et porte le corpus à
**28 guides thématiques**. Il déclare en propre les colonnes qu'aucune source consultée n'établit — prix, légalité,
allocation par cycle —, plutôt que de les combler.

Un sixième cycle, mené le 12 septembre 2026, a assemblé la colonne vertébrale de la progression du joueur, jusque-là
traitée activité par activité sans jamais l'être en tant que sujet. Le nouveau guide
[29-missions-reputation-et-rangs.md](./29-missions-reputation-et-rangs.md) documente pour la première fois en entier
les deux échelles de marine de superpuissance (Federal Navy et Imperial Navy, quinze paliers chacune), la typologie du
tableau de missions de vaisseau, l'échelle de réputation de faction en six paliers, un tableau des systèmes à permis
et les deux services Odyssey — Apex Interstellar et Frontline Solutions — qui donnent accès au combat organisé sans y
poser son propre vaisseau, et porte le corpus à **29 guides thématiques**. Comme les cycles précédents, il signale
plutôt qu'il ne tranche les divergences rencontrées entre sources — notamment sur la date du Community Goal associé
au permis Alioth et sur un mécanisme de prêt d'équipement Frontline Solutions qui n'a pas pu être confirmé.

Un septième cycle, mené le même jour, a assemblé une boucle de gameplay dont toutes les pièces existaient déjà
séparément dans le corpus : la piraterie. Le nouveau guide [30-piraterie-et-pvp.md](./30-piraterie-et-pvp.md) relie en
procédure jouable le scan de cargaison, l'interdiction, le mass lock, le Hatch Breaker et l'écoulement au marché noir,
avec deux builds pirates chiffrés, et traite pour la première fois le PvP subi (lieux à risque, groupes privés PvE,
blocage, combat logging) et l'architecture réseau du jeu (ajoutée à
[23-jeu-en-groupe.md](./23-jeu-en-groupe.md)), portant le corpus à **30 guides thématiques**. Il corrige au passage une
confusion du corpus lui-même : le « Manifest Scanner » n'est pas un quatrième scanner distinct du Cargo Scanner, mais
son nom actuel.

Un huitième cycle, mené le même jour, a documenté la première heure de jeu — vol de base et accostage — jamais
couverte malgré 31 guides existants. Le nouveau guide
[31-pilotage-navigation-et-stations.md](./31-pilotage-navigation-et-stations.md) détaille la supercroisière,
l'accostage en sept étapes (avec ses variantes avant-poste et Surface Port — et non « Coriolis au sol », qui n'existe
pas), l'atterrissage planétaire, une matrice de neuf types de station × quinze services avec les seuils officiels de
Trailblazers, le HUD hors combat anti-Thargoïde et le carburant. La logistique de flotte (transfert et stockage de
vaisseaux et de modules) a été ajoutée directement dans [03-vaisseaux.md](./03-vaisseaux.md) et
[04-equipements.md](./04-equipements.md) plutôt que dans un guide séparé, et le comparatif Scarab/Scorpion/Rhino dans
[14-rhino.md](./14-rhino.md), désormais renommé (son ancien nom, `14-rhino-nomad.md`, faisait du terme « Nomad » —
longtemps traité comme un vaisseau non confirmé avant la réparation du troisième cycle — un mauvais point d'entrée
RAG). Le corpus compte désormais **31 guides thématiques**.

Un neuvième cycle, mené le même jour, a donné au corpus le référentiel spatial qui lui manquait entièrement. Le
nouveau guide [32-geographie-galactique.md](./32-geographie-galactique.md) définit enfin la **Bulle** (≈200 al de
rayon, plus de 20 000 systèmes peuplés, aucune frontière territoriale fixe), employée sans définition dans 13
fichiers depuis le premier cycle, avec un gazetteer de 31 systèmes fondateurs, les distances de référence des
grandes destinations (Colonia, Sagittarius A\*, Beagle Point, Hutton Orbital), la structure en bras spiraux et
régions du Codex, et la nomenclature Stellar Forge des secteurs procéduraux. Une entrée « Bulle » a été ajoutée au
[glossaire](./00-glossaire.md). Le corpus compte désormais **32 guides thématiques**.

Un dixième cycle, mené le 12 septembre 2026, n'a ajouté aucun guide mais comblé le plus grand vide géographique et
narratif restant côté xéno : les **Pléiades**, où se concentrent les tout premiers signes du retour thargoïde moderne
(premier Barnacle découvert à Merope 5 C le 15 janvier 3302) et les systèmes Maia, Delphi et Darnielle's Progress,
jusqu'ici jamais situés ([01-lore.md §3.4bis](./01-lore.md)). [25-combat-ax.md](./25-combat-ax.md) documente
désormais la récolte de Meta-Alloys sur les Barnacles, les structures de surface à puzzle sonore, les sondes/
capteurs/liens thargoïdes et les épaves d'Intercepteurs, ainsi qu'un dossier complet sur les **Thargoid Spire
Sites** — en corrigeant au passage une confusion répandue : un Spire Site n'est pas situé dans le système d'un
Maelstrom, et les nuages caustiques ne sont pas un mécanisme de ces sites, mais du Maelstrom lui-même ; la boucle est
désactivée depuis la fin de la guerre. [05-guardians.md](./05-guardians.md) restitue pour la première fois le
contenu des **28 Guardian Logs** (répartition thématique et synthèse narrative — société en clans, Monolith Network,
Constructs, extinction) et une sous-section sur le langage et les glyphes guardian, distincts des glyphes thargoïdes.
[10-exploration.md](./10-exploration.md) explique enfin le **Codex in-jeu** (introduit le 11 décembre 2018, 4
onglets, 42 régions galactiques) et le distingue explicitement du « Codex Canonn », un piège de confusion fréquent
que ce cycle referme. Le corpus reste à **32 guides thématiques**.

## Deux corpus dans le même dépôt : règle de préséance

Le dépôt héberge deux ensembles de contenu francophone qui se recouvrent partiellement et n'avaient jamais été
réconciliés. Cette section pose la règle qui les départage.

- **`raw_data/`** — 34 fichiers markdown (32 guides thématiques et 2 documents transversaux) : la base de
  connaissances de référence sur **le jeu**, écrite pour alimenter le RAG. C'est le présent répertoire. Chaque guide
  porte un front-matter YAML et un encart « En bref » ; [`index.yaml`](./index.yaml) en agrège les métadonnées et sert
  de routeur de requête. Le gabarit du front-matter et l'usage de l'index sont spécifiés dans les *Notes d'ingestion
  RAG* en fin de document.
- **`assets/guides/`** — 12 guides structurés au format JSON, livrés avec **l'application** Flutter et énumérés par
  `index.json` : cinq guides de jeu issus de sources externes (`exploration-exobiologie`, `artemis-suit`, `outils`,
  `protocole-milliard`, `debuter-sans-combat` — édition 2026-08) et sept modes d'emploi de l'application elle-même
  (`app-prise-en-main`, `app-alimenter`, `app-terrain`, `app-exobiologie`, `app-releve`, `app-routes`,
  `app-materiaux` — édition 2026-09).
- **`assets/data/`** — trois jeux de données structurés livrés avec l'application, édition 2026-08 :
  `exobiology_catalog.json` (22 genres, 118 espèces), `materials.json` (115 matériaux, 24 catégories) et
  `blueprints.json` (5 blueprints, 3 combinaisons). Chacun déclare ses sources amont dans un champ `sources` ; toute
  transcription vers `raw_data/` doit citer le fichier **et** son édition.

### Qui fait autorité, et sur quoi

**1. Par domaine.** Sur le fonctionnement de l'application — écrans, sources d'alimentation, états du suivi — les
guides `app-*.json` font autorité, et `raw_data/` n'a rien à en dire. Sur le jeu, `raw_data/` est le corpus de
référence : c'est lui qui est indexé, lui qui porte les renvois croisés, lui qui doit rester exhaustif. Les cinq
guides de jeu de `assets/guides/` sont, eux, du contenu produit **pour l'application** : ils sélectionnent et
ordonnent en vue d'un parcours joueur, là où `raw_data/` documente pour répondre à une question quelconque.

**2. Par sourçage, en cas de divergence factuelle sur le jeu.** Le répertoire d'origine ne tranche pas ; le sourçage
tranche. Ordre décroissant d'autorité : (a) source primaire Frontier datée — notes de version, billet officiel,
GalNet ; (b) donnée extraite du jeu — EDCD/FDevIDs, journal du client ; (c) base communautaire de référence — Inara,
EDSM, Spansh, wiki ; (d) affirmation non sourcée. À qualité de source égale, la vérification la plus récente
l'emporte, et sa date doit être citée. Une donnée livrée dans `assets/data/` est à traiter selon les sources qu'elle
déclare, pas selon son emplacement.

**3. L'arbitrage se fait dans [00-chronologie-canonique.md](./00-chronologie-canonique.md), dont la portée couvre le
dépôt entier** — `raw_data/` comme `assets/`. Mais ce document arbitre en produisant des sources, non par son statut :
**aucune règle du dépôt ne doit faire primer automatiquement `raw_data/` sur `assets/guides/`.** L'épisode du
9 septembre 2026 en fournit la démonstration, et elle est allée jusqu'au bout. Sur le vaisseau « Nomad » et la mise à
jour « Operations » (version 4.4.0.0, 30 juin 2026), `raw_data/` avait conclu à l'inexistence et supprimé du contenu
réel, tandis que les guides applicatifs avaient raison sur le fond. La divergence a été tranchée en leur faveur, puis
les guides de `raw_data/` ont été réécrits : ils décrivent aujourd'hui le mode Operations, ses sept opérations, le
Nomad, sa baie de déploiement et son nom interne `Lander01`, en citant les billets officiels qui les établissent. Voir
[00-chronologie-canonique.md](./00-chronologie-canonique.md), faits
[3](./00-chronologie-canonique.md#3-mode--operations---existence-version-4400-et-date-de-sortie-30-juin-2026),
[8](./00-chronologie-canonique.md#8-vaisseau--nomad---premier-ship-launched-vessel-slv-du-jeu-sorti-le-30-juin-2026) et
[13](./00-chronologie-canonique.md#13-vessel-hangar--modules-mk-i-et-mk-ii).

Les guides applicatifs conservent toutefois deux inexactitudes signalées par cet arbitrage et non corrigées ici, ce
répertoire n'ayant pas autorité sur `assets/` : ils restreignent le Nomad aux trois vaisseaux porteurs d'un *Vessel
Hangar Mk II* alors que la baie Mk I convient aussi et équipe treize vaisseaux, et ils nomment « MK II Discovery
Scanner » le module que Frontier appelle **Mk II Biological Scanner**. Les guides de `raw_data/` écrivent la version
correcte ; en cas de divergence sur ces deux points, c'est le fait
[13](./00-chronologie-canonique.md#13-vessel-hangar--modules-mk-i-et-mk-ii) qui tranche.

### Comment tracer une divergence

Une divergence constatée entre les deux corpus ne se règle pas en supprimant d'un côté. Elle se règle en trois temps :

1. **Ouvrir une entrée** dans la table de réconciliation de
   [00-chronologie-canonique.md](./00-chronologie-canonique.md) : réponse canonique, niveau de confiance (*haute*,
   *moyenne*, *non confirmé*), sources — puis une section « Détails par fait » exposant ce que chaque corpus
   affirmait, les sources tentées et celles qui ont abouti.
2. **Corriger les deux corpus** d'après cette entrée, chacun dans son format, en renvoyant vers elle par un lien
   ancré (`./00-chronologie-canonique.md#8-vaisseau--nomad---premier-ship-launched-vessel-slv-du-jeu-sorti-le-30-juin-2026`).
3. **Ne rien supprimer avant l'arbitrage.** Une entrée *non confirmé* est l'état d'une recherche à une date donnée,
   pas un verdict d'inexistence : elle autorise à signaler l'absence de confirmation, jamais à amputer l'autre corpus.

### Recouvrements entre les deux corpus

Relevé du 9 septembre 2026, établi par lecture des douze fichiers de `assets/guides/`.

| Guide `assets/guides/`    | Nature        | Recouvrement principal dans `raw_data/`                      | Recouvrements secondaires                                                                 |
|---------------------------|---------------|--------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| `exploration-exobiologie` | Guide de jeu  | [10-exploration.md](./10-exploration.md)                     | 03-vaisseaux, 19-fleet-carriers, 14-rhino                                           |
| `artemis-suit`            | Guide de jeu  | [07-equipement-a-pied.md](./07-equipement-a-pied.md)         | 26-ingenierie-a-pied-avancee, 10-exploration                                              |
| `outils`                  | Guide de jeu  | [16-outils.md](./16-outils.md)                               | 17-sources-donnees                                                                        |
| `debuter-sans-combat`     | Guide de jeu  | [27-debuter-et-progresser.md](./27-debuter-et-progresser.md) | 20-minage, 11-commerce, 18-colonisation, 19-fleet-carriers, 10-exploration, 13-operations |
| `protocole-milliard`      | Guide de jeu  | *aucun équivalent direct*                                    | 10-exploration, 06-ingenieurs, 07-equipement-a-pied, 03-vaisseaux, 14-rhino         |
| `app-prise-en-main`       | Mode d'emploi | *sans objet*                                                 | 17-sources-donnees (marginal)                                                             |
| `app-alimenter`           | Mode d'emploi | *sans objet*                                                 | 17-sources-donnees (journal, Companion API)                                               |
| `app-terrain`             | Mode d'emploi | *sans objet*                                                 | 17-sources-donnees (lecture du journal en direct)                                         |
| `app-releve`              | Mode d'emploi | *sans objet*                                                 | 17-sources-donnees, 10-exploration (Spansh)                                               |
| `app-routes`              | Mode d'emploi | *sans objet*                                                 | 10-exploration (planification de route)                                                   |
| `app-materiaux`           | Mode d'emploi | *sans objet*                                                 | 06-ingenieurs, 26-ingenierie-a-pied-avancee (réserves, traders)                           |
| `app-exobiologie`         | Mode d'emploi | *sans objet*                                                 | 10-exploration (genres et espèces)                                                        |

Deux précisions sur ce relevé :

- Les sept modes d'emploi `app-*` n'ont pas d'équivalent dans `raw_data/` et n'en attendent pas : ils décrivent une
  interface. Leurs recouvrements sont marginaux et portent sur des objets du jeu cités en passant (le journal du
  client et la Companion API pour `app-alimenter` et `app-terrain`, Spansh pour `app-releve` et `app-routes`, les
  réserves de matériaux et les *traders* pour `app-materiaux`, les genres d'exobiologie pour `app-exobiologie`). Ils
  ne font pas autorité sur le jeu, et le jeu ne fait pas autorité sur eux.
- `protocole-milliard` est le seul guide de jeu de `assets/guides/` sans homologue dans `raw_data/` : c'est un plan
  d'exécution chiffré et ordonné, pas un guide thématique. Son contenu se répartit sur cinq fichiers de `raw_data/`
  sans qu'aucun ne le recouvre entièrement.

Cette section porte sur l'**autorité éditoriale**, pas sur l'indexation : le périmètre de l'index vectoriel reste
celui défini par les *Notes d'ingestion RAG* en fin de document, qui n'indexe que les fichiers `NN-*.md` de
`raw_data/`, à l'exclusion de `README.md` et d'`index.yaml` — `assets/` en est entièrement exclu.

## Documents de référence transversaux

- [Chronologie canonique](./00-chronologie-canonique.md) — Tranche quatorze faits datés d'*Elite Dangerous* sur
  lesquels les fichiers du dépôt se contredisaient, en s'appuyant en priorité sur le flux **Steam News** de Frontier
  (*App ID 359320*) : Powerplay 2.0 avec *Ascendancy* le 31 octobre 2024, bêta de la Colonisation le 26 février 2025 et
  sortie complète le 11 novembre 2025, mise à jour **Operations** (4.4.0.0) le 30 juin 2026 avec le **Nomad**, Kestrel
  Mk II, Lynx Highliner, Caspian Explorer, SRV Rhino, fin de la Seconde Guerre Thargoïde le 19 décembre 2024,
  renommage du *Fighter Hangar* en **Vessel Hangar** et décompte de **48 vaisseaux** au chantier naval. En cas de
  divergence avec un autre fichier du dépôt — `raw_data/` comme `assets/` —, ce document prévaut : voir la règle de
  préséance ci-dessus.
- [Glossaire](./00-glossaire.md) — Vingt-sept sigles et termes techniques classés par ordre alphabétique, chacun
  développé puis défini : institutions et lore (AEGIS, GalCop, INRA, NMLA), mécaniques de fond (BGS, INF, PMF,
  Powerplay), formats de jeu (CG, CZ, RES, USS, PvE, PvP, NPC, CMDR) et matériel de bord (FSD et sa variante SCO, DSS,
  FSS, HRP, MRP, SRV, FC). Les entrées de modules précisent leur catégorie d'emplacement.

Les 32 guides thématiques sont regroupés ci-dessous par domaine.

## Débuter et progresser

- [Débuter et progresser dans Elite Dangerous : premiers pas et rangs](./27-debuter-et-progresser.md) — Répond aux
  deux questions que le reste du corpus traite activité par activité : par quoi commencer, puis comment monter en
  rang. Côté démarrage, la trajectoire Sidewinder Mk I gratuit → Hauler (52 720 Cr) → Adder (87 810 Cr) → Cobra Mk III
  (349 720 Cr), le réflexe du coût de *rebuy*, et l'ordre de priorité des Ingénieurs, **Felicity Farseer** en tête pour
  le FSD. Côté progression, les **huit échelles de rang indépendantes** — six filières Pilots Federation plus les
  marines fédérale et impériale, qui conditionnent l'achat de sept vaisseaux.
- [Missions, réputation et rangs de superpuissance](./29-missions-reputation-et-rangs.md) — Détaille pour la première
  fois les deux échelles de marine en entier — **Federal Navy** et **Imperial Navy**, quinze paliers chacune —, la
  typologie du tableau de missions de vaisseau (sept familles officieuses), l'échelle de réputation de faction en six
  paliers (Hostile à Allied, seuils à 15/35/75 %), un tableau des systèmes à permis, et les deux services Odyssey qui
  donnent accès au combat organisé sans y poser son propre vaisseau : **Apex Interstellar** et **Frontline
  Solutions**.

## Lore & Politique

- [Elite Dangerous : lore et histoire de l'univers](./01-lore.md) — Retrace le lore depuis la Troisième Guerre
  mondiale du XXIᵉ siècle jusqu'au présent du jeu, septembre 3312, soit septembre 2026 réel (décalage de **+1286
  ans**). Décrit les trois superpuissances — Fédération, Empire d'Achenar, Alliance —, la Sirius Corporation et la
  Pilots Federation, puis les deux civilisations extraterrestres du récit : les **Thargoïdes**, dont la Seconde Guerre
  s'achève le 19 décembre 2024 avec la chute de **Cocijo** à Sol, et les **Guardians**. Raxxla, les Barnacles et le
  « Nemesis Protocol » de Salvation y restent des énigmes ouvertes.

## Systèmes de jeu structurants (Powerplay, BGS, Colonisation, Community Goals)

- [Politique et Powerplay dans Elite Dangerous](./02-powerplay.md) — Douze **Powers** se disputent le contrôle
  territorial des systèmes depuis juin 2015, sur des règles entièrement refondues le 31 octobre 2024 par *Ascendancy*
  (« Powerplay 2.0 ») : mérites permanents, trois axes de jeu territorial (Acquisition, Renforcement, *Undermining*),
  états Exploité / Fortifié / Bastion selon le score de contrôle, bascules au tick hebdomadaire du jeudi 07:00 UTC.
  Détaille aussi les cent rangs d'engagement et les douze modules exclusifs qu'ils débloquent, dont les *Prismatic
  Shields*.
- [Le Background Simulation (BGS)](./21-bgs.md) — Décrit le moteur qui simule en permanence l'**influence** des
  **factions mineures** de chaque système peuplé — de 3 à 10 par système, pour une somme toujours égale à 100 % — et
  se met à jour une fois par cycle de 24 heures lors d'un **tick** dont l'horaire n'a jamais été publié. Couvre la
  faction contrôlante, les états économiques (Boom, Bust, Famine, Outbreak, Lockdown, Investment) et de conflit (War,
  Civil War, Election, Expansion, Retreat), et les leviers par lesquels un commandant ou un groupe pèse sur eux.
- [La Colonisation de systèmes](./18-colonisation.md) — Comment revendiquer, sans prérequis de rang et pour
  **25 000 000 Cr** non remboursables, un système inhabité situé à 15 années-lumière au maximum d'un contact
  *System Colonisation*, et en devenir l'**Architecte système** à titre permanent. Détaille la balise à déployer sous
  24 heures, le port primaire à achever sous 4 semaines, les trois **Tiers** de construction financés en Points de
  Construction, l'orientation économique héritée du corps céleste et les liens économiques, jusqu'au passage du
  système en « Uncontrolled Populated », immédiatement éligible au Powerplay et au BGS.
- [Community Goals (mécanique générique)](./24-community-goals.md) — Mécanique des objectifs temporaires publiés par
  Frontier sur GalNet et au tableau des missions, ouverts à tous les commandants quels que soient plateforme et mode de
  jeu, sur une fenêtre d'une à trois semaines. Explique la double mesure de la récompense — palier collectif atteint,
  puis tranche de contribution individuelle —, les barèmes observés (environ 30 à 180 M Cr), les récompenses annexes
  (modules pré-*engineered*, permis, ouverture d'un ingénieur) et le multiplicateur de prix ×2 à ×10 appliqué à la
  marchandise ciblée.

## Vaisseaux & Équipements

- [Liste complète des vaisseaux d'Elite Dangerous](./03-vaisseaux.md) — Catalogue les **48 vaisseaux de chantier
  naval** (*shipyard*), en trois gabarits de plateforme et six constructeurs — Faulcon DeLacy, Core Dynamics,
  Gutamaya, Lakon Spaceways, Saud Kruger, Zorgon Peterson —, avec les prix de coque nue de 32 000 Cr (Sidewinder Mk I)
  à 301 348 585 Cr (Panther Clipper Mk II) et les portées de saut stock de 6,7 al à 24,1 al. Deux tableaux de
  référence chiffrent les 47 châssis publiés par EDCD/coriolis-data : masse de coque de 14 t à 1 200 t, vitesse de
  130 à 320 m/s, bouclier de base jusqu'à 600 MJ, et **dureté de coque** — la valeur qui commande l'encaissement des
  dégâts — de 20 à 75. Précise les sept châssis conditionnés à un rang de réputation, les 36 vaisseaux pouvant
  emporter une baie embarquée (*Vessel Hangar*), et l'écart entre le prix affiché et le coût réel d'un vaisseau
  équipé : un Anaconda en core internals de qualité A revient à environ 387 M Cr, pour un rebuy de 19,4 M Cr.
- [Liste complète des équipements dans Elite Dangerous](./04-equipements.md) — Décrit comment un vaisseau se
  personnalise par ses **modules** (*outfitting*) : quatre familles d'emplacements, classes 1 à 8, notations A à E
  complétées par les notations F à I des modules restreints, hardpoints Small à Huge en montage fixe, gyrostabilisé ou
  tourelle. Porte le référentiel chiffré du corpus : **vingt et une tables de modules** donnant masse, intégrité,
  consommation en MW, statistique propre à la famille et prix en crédits, de la centrale électrique aux contrôleurs de
  limpets, et **huit tables d'armes** donnant dégâts par tir, cadence, DPS dérivé, charge thermique, portée,
  pénétration et prix — plus de mille lignes tirées d'EDCD/coriolis-data. Chiffre également les cinq grades de
  blindage de coque (*bulkheads*) pour les 47 châssis, les résistances natives d'un bouclier (+40 % cinétique, +50 %
  explosive, −20 % thermique), le Frame Shift Drive standard ou **SCO**, puis les quatre circuits d'acquisition —
  chantier naval, ingénieurs, Technology Brokers Guardian et Human, catalogue **MercGear** payé en **Merc Coin**.
- [Pilotage, navigation, stations et carburant](./31-pilotage-navigation-et-stations.md) — Documente la première
  heure de jeu : supercroisière (29,9 km/s à 2001c), accostage en sept étapes (demande à 7,5 km, mailslot de
  222 × 52 m, délai de flânerie de 5 minutes), atterrissage planétaire (Orbital Cruise puis Glide à 2 500 m/s), une
  matrice de **neuf types de station** × quinze services avec les seuils officiels de Trailblazers (niveau
  technologique 35 pour Chantier Naval et Équipement), le HUD hors combat anti-Thargoïde et la procédure d'appel aux
  Fuel Rats. Corrige au passage l'idée d'un « Coriolis au sol » : la station planétaire s'appelle Surface Port.

## Guardians & Ingénieurs

- [Guide complet des Guardians dans Elite Dangerous](./05-guardians.md) — Documente la civilisation Guardian, éteinte
  depuis un à deux millions d'années et découverte en 3302-3303 dans une trentaine de systèmes situés à plusieurs
  centaines d'années-lumière de la Bulle. Distingue les **Guardian Ruins** non défendues, où un puzzle de pylônes
  active une Relic Tower, des **Guardian Structures** gardées par des Sentinels, qui délivrent les Blueprint Segments.
  Détaille ce qu'on en tire au **Guardian Tech Broker** — Gauss Cannon, Plasma Charger, Shard Cannon, FSD Booster —
  et restitue le contenu des **28 Guardian Logs** décryptés par Ram Tah : répartition thématique, synthèse narrative
  (société en clans, Monolith Network, Constructs, extinction) et langage/glyphes guardian.
- [Guide complet des Ingénieurs (Engineers) dans Elite Dangerous](./06-ingenieurs.md) — Couvre l'**Engineering** ouvert
  par la mise à jour 2.1 « The Engineers » (mai 2016) : 38 Ingénieurs — 25 pour les modules de vaisseau, 13 Odyssey
  pour l'équipement à pied —, modifications (*blueprints*) payées en matériaux, un effet expérimental par module,
  accès par invitation puis cinq rangs de réputation, et rolls **déterministes** depuis l'Update 18.08, où un grade N
  coûte N applications à réputation 5. Chiffre les **81 blueprints** de modules sur **387 couples blueprint × grade** —
  matériaux, quantités, effet obtenu, coût total des 15 rolls d'une montée G1 → G5 —, publie la matrice **Blueprint ×
  Ingénieur × grade maximum** (186 lignes, 25 Ingénieurs) qui dit qui monte quel plan et jusqu'où, et donne aux
  **91 effets expérimentaux** leur matrice de compatibilité et leur coût en matériaux. Détaille les **115 matériaux**
  en 24 catégories et leurs plafonds de stockage, de 300 unités en grade 1 à 100 en grade 5, les High Grade Emissions
  et la règle d'allégeance qui gouverne leur contenu, les Material Traders, et les deux circuits parallèles que sont
  les **Technology Brokers** et le **Merc Coin / MercGear**.

## Combat spatial & AX

- [Guide complet du combat spatial](./08-combat-spatial.md) — Expose les quatre systèmes interdépendants du combat en
  vaisseau : la répartition des 4 pips du distributeur entre SYS, ENG et WEP, la gestion de la chaleur — dégâts de
  module au-delà de 100 %, destruction vers 150 % —, l'exploitation de l'inertie en **Flight Assist Off**, et le choix
  des montures d'armes (fixe, gyrostabilisée, tourelle). Détaille les trois filtres que franchit chaque impact : les
  résistances du bouclier, puis la **pénétration de blindage** de l'arme (*piercing*, de 1 à 140) confrontée à la
  **dureté de coque** de la cible (*hardness*, de 20 à 75), puis les résistances de coque au type de dégâts —
  thermique, cinétique, explosif ou absolu. Couvre la défense par *bulkheads*, HRP et MRP, la supercroisière
  (interdiction, *mass lock*, *wakes*), les terrains PvE (RES/HazRES, Compromised Nav Beacons, Combat Zones) et le
  régime des primes et de la *notoriety*.
- [Combat anti-Thargoïde (AX) approfondi](./25-combat-ax.md) — Traite l'affrontement avec les vaisseaux organiques
  thargoïdes : les **Scouts** capables d'hyperdiction et les quatre classes d'**Interceptors**, du Cyclops (1 cœur) à
  l'Hydra (4). Détaille la procédure d'abattage — fragiliser le bouclier organique, désactiver au **Shutdown Field
  Neutraliser**, détruire les cœurs au **Guardian Gauss Cannon**, nettoyer l'essaim au Flak et purger les stacks
  caustiques —, rappelle la fin de la Seconde Guerre Thargoïde le 19 décembre 2024, et décrit ce qui se pratique
  encore en 2026 : NHSS, zones AXCZ, réputation Aegis et matériaux du Technology Broker. Documente aussi le volet
  non-combat des Pléiades (Barnacles, structures de surface, sondes/liens, épaves) et un dossier sur les **Thargoid
  Spire Sites**, distincts du Maelstrom et désactivés depuis la fin de la guerre.
- [Piraterie, prédation et PvP subi](./30-piraterie-et-pvp.md) — Assemble en procédure jouable la chaîne opératoire de
  la piraterie (Manifest Scanner — le nom actuel du Cargo Scanner, pas un module distinct — interdiction, mass lock,
  Hatch Breaker, revente au marché noir), deux builds pirates chiffrés (Python, Krait Mk II) et les terrains de chasse
  (signaux Convoy Dispersal Pattern, RES, lanes en Boom). Traite symétriquement le PvP subi : lieux à risque
  documentés par la communauté (Deciat, Shinrarta Dezhra, stations de CG — mais pas le Colonia Bridge, hypothèse
  infirmée), groupes privés PvE (Mobius), blocage, signalement et combat logging.

## Combat et équipement à pied

- [Guide complet de l'équipement à pied dans Elite Dangerous (Odyssey)](./07-equipement-a-pied.md) — Décrit les quatre
  combinaisons d'*Odyssey* — Flight Suit de départ, Artemis d'exobiologie livrée avec le Genetic Sampler, Maverick
  polyvalente à Arc Cutter, Dominator de combat seule à porter deux armes principales —, et leur montée du grade 1 au
  grade 5 chez **Pioneer Supplies** en quatre paliers : **14 850 000 Cr** au total, dont 2 850 000 Cr jusqu'au
  grade 3, plus 12 Suit Schematic, 12 Health Monitor, 12 Manufacturing Instructions, 28 Graphene et 28 unités de
  blindage, chaque palier ouvrant un emplacement de modification, quatre au maximum. Couvre les armes des trois
  fabricants (Kinematic Armaments, Manticore, Takada), l'absence d'arme de mêlée, les six consommables du jeu dont
  trois grenades et l'**E-Breach**, les **treize Engineers à pied** et leurs modifications irréversibles à recette
  fixe facturées de 500 000 à 1 000 000 Cr, et la règle de perte du sac à dos à la mort, le casier du vaisseau
  restant conservé.
- [Guide complet du combat à pied dans Elite Dangerous](./09-combat-a-pied.md) — Couvre le combat *on-foot* arrivé
  avec **Odyssey** le 19 mai 2021 : ce qu'un commandant emporte (arme longue, arme de poing, outil non létal, trois
  grenades d'un même type, sac à dos), les quatre combinaisons et leurs cinq grades, l'ingénierie chez les neuf
  Engineers de la bulle Core, et les armes des trois fabricants. Signale les deux changements de 2026 — refonte de
  l'audio de combat le 24 février, portée des armes silencieuses passée de 40 à 128 mètres le 28 avril — et décrit les
  terrains : zones de conflit au sol, raids de settlement et mode Operations.
- [Elite Dangerous : Guide complet des Opérations (Odyssey)](./13-operations.md) — Sépare les deux contenus homonymes.
  Le **mode Operations** est une couche de gameplay en escouade sortie le 30 juin 2026 : jusqu'à 4 commandants
  enchaînent les étapes d'un scénario instancié desservi par l'**Operation Runner**, à travers **sept opérations**
  jouables en mode *Mercenary* ou *Powerplay*, rémunérées en crédits, matériaux, mérites et **Merc Coin**, monnaie
  d'accès au catalogue **MercGear**. Les **opérations au sol** désignent, elles, le gameplay à pied d'*Odyssey* :
  settlements classés par activité et par sécurité, huit familles de missions, infiltration et zones de conflit.
- [Ingénierie avancée de l'équipement à pied : farming, échange et optimisation](./26-ingenierie-a-pied-avancee.md) —
  Porte sur le farming, le troc et l'ordre de déblocage des Engineers à pied. Établit que le journal du jeu ne connaît
  que quatre catégories de matériaux et que « Chemical », « Circuit » et « Tech » n'en sont qu'une subdivision
  regroupée sous le nom d'**Assets**, seule monnaie d'échange au comptoir du **bartender**. Identifie le goulot
  d'étranglement des **Manufacturing Instructions**, détaille les missions de réactivation en système *Infrastructure
  Failure*, et donne les coordonnées des deux sites fixes, **Dav's Hope** et le **Jameson Crash Site**.

## Exploration

- [Guide complet de l'exploration et de l'exobiologie](./10-exploration.md) — Décrit la chaîne de scan Discovery
  Scanner → **FSS** → **DSS** et la vente des données à Universal Cartographics, avec les bonus de première découverte
  et de première cartographie, puis la planification de route sur EDSM et Spansh et la *neutron highway*. Couvre
  l'exobiologie d'*Odyssey* : prélèvement à pied en combinaison **Artemis**, trois échantillons d'une même espèce en
  respectant la distance minimale du genre, vente à **Vista Genomics**, catalogue de **118 espèces** allant de
  952 296 Cr à 20 000 000 Cr et multiplicateur *First Logged* ×5. Le **Nomad** et son *Mk II Biological Scanner* y
  complètent le SRV depuis le 30 juin 2026. Explique enfin le **Codex in-jeu** (11 décembre 2018, 4 onglets, 42
  régions galactiques, crédit de première découverte) et le distingue explicitement du « Codex Canonn » communautaire.
- [Géographie galactique, systèmes de référence et grands voyages](./32-geographie-galactique.md) — Donne au corpus
  le référentiel spatial qui lui manquait : la **Bulle** (≈200 al de rayon autour de Sol, plus de 20 000 systèmes
  peuplés, aucune frontière territoriale fixe), un gazetteer de **31 systèmes** fondateurs, les distances de
  référence (Colonia à 22 000 al, Sagittarius A\* à 25 900 al, Beagle Point à 65 279 al **en ligne droite**, Hutton
  Orbital à 0,22 al), les 42 régions du Codex et la nomenclature Stellar Forge des secteurs procéduraux.

## Économie (Commerce, Transport, Minage, Fleet Carriers, Marchandises)

- [Les marchandises d'Elite Dangerous : catalogue des 270 commodités et des 142 denrées rares](./28-marchandises.md) —
  Référentiel de nommage du marché : les **270 commodités** du jeu réparties en **16 catégories** officielles —
  Récupération (96 entrées), Minéraux (39), Machines (24), Métaux (24) —, chacune avec son nom affiché en jeu, une glose
  française et le **symbole interne** qu'émet le journal de jeu. Donne les économies productrices et consommatrices pour
  133 d'entre elles, et pour les 63 marchandises des catégories Minéraux et Métaux la technique d'extraction et le type
  d'anneau lorsqu'une source les documente — la **Bertrandite** se mine au laser en anneau métallique et riche en
  métaux —, puis localise les **142 denrées rares** par système, station et type de station, sur **139 stations** dont
  trois en produisent deux. Les prix du commerce courant, la légalité par superpuissance et l'allocation par cycle n'y
  figurent pas : aucune source consultée ne les établit, et le guide dit où il faudrait aller les chercher.
- [Guide complet du commerce dans Elite Dangerous](./11-commerce.md) — Explique le principe du *trading* — acheter là
  où une économie de station produit, revendre là où une autre consomme — et l'effet des états du BGS sur les prix,
  Boom, Famine et Outbreak en tête. Couvre les cinq familles de commerce (vrac, données, contrebande dont la
  **Robigo Run**, *mining-to-trade*, piraterie), les neuf paliers du **Trade Rank**, un exemple de route chiffré en Type-6, le
  haut de gamme du fret (Type-9 Heavy, Imperial Cutter, Type-10 Defender, Panther Clipper Mk II) et les calculateurs
  de route Spansh et Trade Dangerous.
- [Guide complet du transport dans Elite Dangerous](./12-transport.md) — Traite les quatre métiers du transport. Le
  **transport de passagers** repose sur des cabines de quatre conforts et des vaisseaux dédiés — Dolphin, Orca, Beluga
  Liner, puis le **Lynx Highliner** de Zorgon Peterson et ses 225 passagers, qui ramène les missions de stations en
  feu. Le **Search & Rescue** couvre Occupied Escape Pods, Black Boxes et Wreckage Components ; le **fret** sert
  Powerplay et surtout la colonisation, qui impose les gros porteurs et le relais par Fleet Carrier ; les
  **marchandises rares** se bonifient jusqu'à 150-200 al.
- [Le Minage (Mining) dans Elite Dangerous](./20-minage.md) — Couvre les trois techniques de minage d'anneau — laser,
  gisements de subsurface à l'Abrasion Blaster, et *core mining* au Pulse Wave Analyser, Sub-Surface Displacement
  Missile et Seismic Charge Launcher — avec leur équipement (limpets Prospector et Collector, Refinery, DSS) et le
  **Type-11 Prospector**, premier vaisseau entièrement dédié au minage. Traite ensuite le **minage de surface
  planétaire** ouvert le 2 septembre 2026 par le SRV **Rhino** et ses treize marchandises nouvelles, ainsi que les
  rendements en crédits et en mérites Powerplay.
- [Porte-vaisseaux de joueur (Fleet Carriers)](./19-fleet-carriers.md) — Documente la méga-structure mobile privée
  achetée **5 000 000 000 Cr** auprès d'un vendeur installé dans un système doté d'un *Drydock* : **5 000 000 Cr**
  d'entretien hebdomadaire à vide plus le coût de chaque service optionnel, **100 000 Cr** par saut, **25 000 tonnes**
  de soute mutualisée, 16 baies d'appontage, un dépôt de Tritium séparé de 1 000 tonnes et une portée fixe de
  **500 années-lumière**. Détaille la consommation de Tritium par saut, le cycle de charge et de *cooldown*, les
  services embarqués et le décommissionnement, qui restitue les 5 milliards moins 150 000 000 Cr de frais fixes.

## Jeu social (Squadrons, Wings, Multicrew, CQC)

- [Escadrons de joueurs (Squadrons)](./22-squadrons.md) — Décrit la structure sociale persistante qui regroupe jusqu'à
  **600 membres** et accepte 25 candidatures en attente, entièrement refondue par la saison **Vanguards** lancée le
  19 août 2025. Couvre le logo, la bannière et la devise personnalisés, le **Squadron Browser**, les
  **Leaderboards**, la **Squadron Bank**, les bonus sélectionnables et le **Squadron Carrier** collectif, le
  rattachement à une faction mineure du BGS, la succession automatique du leader après 90 jours d'inactivité, et la
  fenêtre de revendication élargie dont bénéficient les membres de l'escadron d'un Architecte système.
- [Wings, Multicrew et CQC : jouer à plusieurs dans Elite Dangerous](./23-jeu-en-groupe.md) — Distingue les trois
  façons de jouer à plusieurs. Le **Wing** réunit jusqu'à quatre joueurs, chacun dans son vaisseau, avec nav-lock
  partagé et primes versées à pleine valeur à chaque contributeur. Le **Multicrew**, livré le 11 avril 2017, place
  jusqu'à trois Commandants sur un même vaisseau, aux tourelles ou aux commandes d'un chasseur embarqué. Le **CQC**,
  décliné en produit autonome *Elite Dangerous: Arena* de février 2016 à février 2017, est une arène PvP hors du monde
  persistant, avec son rang propre.

## Nouveautés récentes

- [Guide complet du SRV Rhino et du Nomad](./14-rhino.md) — Traite les deux véhicules livrés à l'été 2026. Le
  **Nomad**, sorti le 30 juin 2026 avec l'*Operations Update*, inaugure la catégorie du **vaisseau lancé depuis un
  vaisseau** (*ship-launched vessel*) : compact, doté de patins et de moteurs pivotants, il embarque un **Mk II
  Biological Scanner** qui détecte les signaux biologiques depuis le cockpit. Le **Rhino**, SRV minier à six roues de
  **Vodel** sorti le 2 septembre 2026, accueille trois occupants, n'est pas armé, et ouvre la boucle du **minage de
  surface planétaire** avec ses treize commodités nouvelles. Les deux se déploient depuis la baie de véhicule et sont
  vendus en accès anticipé Arx.

## Roadmap

- [Elite Dangerous : la roadmap des développeurs (fin 2024 – septembre 2026)](./15-roadmap.md) — Décrit le modèle de
  jeu-service au format de version `4.x.y.z`, qui alterne grandes saisons gratuites et mises à jour intermédiaires
  centrées sur un véhicule. Retrace les quatre saisons livrées depuis fin 2024 — **Ascendancy**, **Trailblazers**,
  **Vanguards** et **Operations** — et les sorties intercalaires : Type-11 Prospector, Dodec Update, Caspian Explorer,
  Kestrel Mk II, Lynx Highliner et **Rhino SRV Update**. Documente aussi la grille stable des accès anticipés ARX,
  16 520 / 33 000 / 60 000 ARX.

## Outils & Données

- [Elite Dangerous : le guide des outils communautaires](./16-outils.md) — Décrit l'écosystème d'outils tiers,
  structuré autour de l'**EDDN**, bus de messages qui redistribue en temps réel les événements des fichiers de journal,
  et de la **Companion API** de Frontier. Côté poste du joueur, **E:D Market Connector** est la brique à installer en
  premier — socle de plugins de l'écosystème —, aux côtés d'EDDiscovery et d'EDDI. Côté web, **EDSM** couvre la
  cartographie, **Inara** le social et l'engineering, **Spansh** la planification de route ; **Coriolis** et **EDSY**
  dominent la construction de vaisseaux, et les **Fuel Rats** assurent le secours d'urgence.
- [Sources de données disponibles pour Elite Dangerous](./17-sources-donnees.md) — Établit qu'*Elite Dangerous*
  n'expose **aucune API publique officiellement documentée**, et décrit les trois piliers qui en tiennent lieu : le
  **Player Journal**, fichier local *append-only* d'une ligne JSON par événement, avec rotation et dix fichiers d'état
  dont `Status.json` et ses bitfields ; **EDDN**, bus pub/sub maintenu par EDCD qui relaie ces journaux sans rien
  archiver ; et la **Companion API** en OAuth2. Documente ensuite les agrégateurs qui republient des vues dérivées —
  EDSM, Inara, Spansh, Canonn Research —, quatre jeux de données hors ligne datés d'août 2026, et les deux dépôts d'où
  sortent les valeurs chiffrées du corpus : `EDCD/coriolis-data` (47 vaisseaux, 89 familles de modules, 81 blueprints,
  91 effets expérimentaux) et `EDCD/FDevIDs` (27 tables d'identifiants extraites du jeu), avec leur licence et la
  pratique de citation par commit qui rend chaque chiffre re-vérifiable quand un service répond HTTP 403.

## Notes d'ingestion RAG

Spécification opérationnelle destinée à qui construira le pipeline d'indexation de ce corpus. **Aucun pipeline
d'ingestion n'existe dans ce dépôt aujourd'hui** : c'est un projet Flutter, et rien ici ne lit `raw_data/` pour en
faire des vecteurs. Ce qui suit est donc un jeu de consignes à appliquer le jour où ce pipeline sera écrit, non la
description d'un existant. Ces règles s'appliquent **au moment de l'ingestion**, par chemin de fichier et par titre de
section : aucune ne demande de réécrire ni de supprimer quoi que ce soit dans les guides, qui restent lisibles tels
quels par un humain.

### Règle 1 — N'indexer que les guides

Indexer `raw_data/*.md` **à l'exclusion de `README.md`**, et ne pas indexer `raw_data/index.yaml`, qui n'est pas un
guide mais l'artefact de routage décrit à la règle 4. Le périmètre indexé est donc exactement les 34 fichiers dont le
nom correspond à `^\d{2}-.*\.md$` à la racine de `raw_data/`.

Ce glob doit rester **non récursif** et ignorer les répertoires cachés : `raw_data/` peut contenir un `.omc/`
d'état d'outillage — gitignoré, donc invisible à un contrôle par `git status` — dont les fichiers JSON n'ont rien à
faire dans un index de connaissances sur le jeu. Le motif `^\d{2}-.*\.md$` appliqué au seul premier niveau les
écarte par construction ; un balayage récursif de `raw_data/**` les ramènerait.

Les documents de travail du corpus — plans de cycle d'enrichissement, constats d'audit — ne relèvent pas de cette
règle : ils ne vivent plus dans `raw_data/`, mais dans [`docs/corpus-meta/`](../docs/corpus-meta/), hors du répertoire
du corpus. C'est délibéré, et c'est ce qui rend la règle 1 sûre. Ces documents décrivent le corpus au lieu de
documenter le jeu ; ils énoncent à l'affirmatif des pistes qui n'ont pas été retenues et consignent des états de
vérification intermédiaires, parfois ultérieurement invalidés — l'inexistence du « Nomad » et de la mise à jour
« Operations », conclue le 8 septembre 2026 et réfutée le lendemain, en est l'exemple. Indexés, ils constitueraient un
fort match lexical sur des questions dont ils ne portent pas la réponse à jour. Une exclusion qui repose sur une règle
écrite finit par être oubliée ; une séparation par arborescence tient toute seule.

### Règle 2 — Exclure les sections d'appareil bibliographique

Ignorer toute section dont le titre correspond à l'expression régulière suivante, ainsi que tout le contenu qu'elle
porte jusqu'au titre de même niveau ou de niveau supérieur qui la suit :

```
^#{2,6}[ \t]*(Sources|Voir aussi|Ressources|Références|References)\b.*$
```

Cette formulation remplace celle, ancrée sur `$`, qui figurait ici auparavant. Le cycle de mise en ingérabilité a
enrichi les titres de sections pour les rendre compréhensibles hors de leur guide, et l'ancien motif — qui exigeait un
titre réduit au seul mot-clé — ne reconnaissait plus `## Sources de ce guide (exploration et exobiologie)` ni
`## Voir aussi : autres guides du corpus liés à l'exploration`. Le motif retenu reconnaît le mot-clé **en tête de
titre**, quel que soit le complément qui suit.

Ce relâchement a un coût : un titre de contenu commençant par l'un de ces mots serait avalé à tort. Deux sections
étaient dans ce cas dans les révisions précédentes du corpus ; toutes deux ont depuis été renommées et ne commencent
plus par un mot-clé (`### Où trouver les marchandises de sauvetage…` dans
[12-transport.md](./12-transport.md), `### Canonn Research : ressources pour développeurs tiers` dans
[17-sources-donnees.md](./17-sources-donnees.md)). **La liste des exceptions est donc vide au 10 septembre 2026.**
Elle doit être ré-auditée après chaque révision de titres, en relisant les titres capturés par le motif et en
vérifiant qu'aucun ne porte de contenu.

Ces sections ne portent aucune réponse : ce sont des listes de liens et de renvois croisés dont le vocabulaire
recouvre lexicalement l'ensemble du corpus. Indexées, elles remontent en tête sur presque n'importe quelle requête et
évincent les passages qui contiennent réellement la réponse. Les renvois croisés utiles restent accessibles au lecteur
humain dans le fichier ; ils n'ont simplement pas leur place dans l'index vectoriel.

**Relevé du 12 septembre 2026, après l'ajout du guide de géographie galactique : 67 sections, 20 676 mots.**
Comptage : titres capturés par le motif ci-dessus dans les fichiers `NN-*.md`, contenu compté jusqu'au titre de
même niveau ou de niveau supérieur suivant, `split()` sur les espaces. Vingt-neuf guides
portent deux sections concernées (`## Voir aussi` et `## Sources`), trois en portent trois —
[05-guardians.md](./05-guardians.md), [07-equipement-a-pied.md](./07-equipement-a-pied.md) et
[10-exploration.md](./10-exploration.md), qui ajoutent chacun une section de ressources externes —, et deux n'en
portent aucune : [00-chronologie-canonique.md](./00-chronologie-canonique.md) et
[00-glossaire.md](./00-glossaire.md). Soit 29 × 2 + 3 × 3 + 2 × 0 = 67 sections pour 34 fichiers. Les blocs les plus
lourds sont les `## Sources` de [06-ingenieurs.md](./06-ingenieurs.md) (1 783 mots) et de
[20-minage.md](./20-minage.md) (1 776 mots), suivis de celui de
[10-exploration.md](./10-exploration.md) (788 mots) et de celui de
[28-marchandises.md](./28-marchandises.md) (749 mots) — aucun des guides suivants n'y figure, tous restant sous ce
seuil : [29-missions-reputation-et-rangs.md](./29-missions-reputation-et-rangs.md) (`## Voir aussi` 221 mots,
`## Sources` 548 mots), [30-piraterie-et-pvp.md](./30-piraterie-et-pvp.md) (`## Voir aussi` 143 mots, `## Sources`
364 mots), [14-rhino.md](./14-rhino.md) (`## Voir aussi` 290 mots, `## Sources` 532 mots),
[31-pilotage-navigation-et-stations.md](./31-pilotage-navigation-et-stations.md) (`## Voir aussi` 162 mots,
`## Sources` 275 mots), et [32-geographie-galactique.md](./32-geographie-galactique.md) (`## Voir aussi` 120 mots,
`## Sources` 269 mots).

Deux écarts avec le relevé précédent, publié le même jour et corrigés ici, méritent d'être signalés parce qu'ils
illustrent exactement le défaut que ce relevé est censé prévenir. Le décompte de **57 sections** était juste, mais la
phrase qui l'introduisait ne retombait pas dessus : elle annonçait vingt-cinq guides à deux sections et deux à trois,
soit 25 × 2 + 2 × 3 = 56 pour 29 fichiers. La répartition réelle sur ces 29 fichiers était vingt-quatre guides à deux
sections et **trois** à trois — [05-guardians.md](./05-guardians.md) porte lui aussi une section de ressources
externes, et avait été omis —, soit 24 × 2 + 3 × 3 = 57. Second écart : le bloc `## Sources` de
[06-ingenieurs.md](./06-ingenieurs.md) était annoncé à 1 336 mots alors que la méthode ci-dessous, appliquée à cette
même révision du fichier, en rend 1 783 ; d'où un total antérieur de 16 597 mots là où le recomptage de cette révision
en donne 16 778. Le chiffre publié doit être celui que le script rend, et la prose qui l'introduit doit se recompter
sur lui.

**Méthode de comptage, à reproduire à l'identique après toute révision.** Ces deux chiffres ne sont comparables dans
le temps que si la mesure l'est aussi. La convention retenue est la suivante :

1. **Périmètre** : les 34 fichiers du périmètre indexé défini à la règle 1 ; `README.md`, `index.yaml` et les
   sous-répertoires en sont exclus.
2. **Détection** : une section est retenue si sa ligne de titre correspond au motif ci-dessus et ne figure pas dans la
   liste des exceptions, vide à ce jour.
3. **Imbrication** : un titre retenu qui se trouve **à l'intérieur** de l'étendue d'un titre déjà retenu n'est pas
   compté séparément — il est déjà inclus dans le bloc de sa section parente. C'est le cas de tous les
   `### Sources primaires…`, `### Sources externes…` et `### Sources hors ligne…` placés sous un `## Sources`.
   Le front-matter YAML en tête de fichier n'est pas un titre et n'entre pas dans ce calcul.
4. **Étendue d'une section** : de sa ligne de titre incluse jusqu'à la dernière ligne précédant le titre suivant de
   même niveau ou de niveau supérieur, ou la fin du fichier.
5. **Unité de mot** : un mot est une suite de caractères séparée par des blancs, ligne de titre comprise — le comptage
   de `wc -w` appliqué au bloc entier. La syntaxe Markdown (tirets de puces, chevrons, URL) est donc comptée telle
   quelle ; c'est une mesure de volume de chunk, pas de prose.

Recompter après toute révision, et reporter la date du relevé en même temps que les deux chiffres : un nombre de mots
sans date de mesure ne dit rien.

### Règle 3 — Préfixer chaque chunk de son contexte à l'indexation

Un front-matter placé en tête de fichier ne voyage pas avec un chunk pris au milieu, et un titre de section pris seul
ne dit ni de quel guide ni de quel jeu il parle. Le préfixe de contexte est le seul mécanisme qui résout réellement
l'autosuffisance des chunks. Il **se calcule à l'ingestion et ne modifie pas les fichiers**.

Chaque chunk est préfixé de deux lignes, construites depuis le front-matter du fichier et le chemin hiérarchique des
titres au-dessus du chunk :

```
[19-fleet-carriers · Porte-vaisseaux de joueur · economie · vérifié le 2026-09-09 · jeu v4.4.0.x]
> 1. Achat et prix > Prix d'achat d'un Porte-Vaisseau — 5 000 000 000 Cr pour la coque nue
```

Composition, champ par champ :

1. **Première ligne**, entre crochets, cinq segments séparés par ` · ` : l'`id` du guide, son `titre` (tronqué à sa
   partie distinctive si le titre complet est long), son `domaine`, la mention `vérifié le ` suivie de
   `date_verification` au format ISO, et la mention `jeu v` suivie de `version_jeu_couverte`.
2. **Seconde ligne**, préfixée de `> ` : le chemin des titres de section qui dominent le chunk, du plus général au
   plus spécifique, séparés par ` > `, sans les croisillons Markdown. Un chunk situé sous le H1 seul n'a pas de
   seconde ligne.
3. Le texte du chunk suit, inchangé.

Ce préfixe est indexé avec le chunk. Il rattache un fragment isolé à son guide, à son domaine et à sa date de
vérification, et donne au moteur de similarité les termes du chemin de titres que le fragment lui-même n'énonce pas.
Il permet aussi de restituer une réponse en citant sa source exacte.

### Règle 4 — Router la requête sur `index.yaml` avant la recherche vectorielle

[`index.yaml`](./index.yaml) agrège le front-matter des 34 guides. Il est **généré** depuis ces front-matter et doit
être régénéré après toute modification de l'un d'eux ; il n'est **pas** indexé comme un guide.

Il s'emploie en amont de la recherche vectorielle, comme routeur de requête :

1. **Sélection des candidats.** Confronter la requête aux champs `entites` et `mots_cles_en` de chaque entrée, puis à
   `titre` et `domaine`. Le champ `mots_cles_en` est ce qui rattrape une requête formulée en anglais — le jeu est en
   anglais et les joueurs cherchent en anglais — quand le guide, lui, est rédigé en français : c'est lui qui relie
   « fleet carrier » à un guide intitulé « Porte-vaisseaux de joueur ». Retenir deux ou trois guides, puis ne lancer
   la recherche vectorielle que dans leurs chunks. Le champ `guides_lies` permet d'élargir d'un cran si la première
   passe ne rend rien de probant.
2. **Priorité de revalidation.** Le champ `volatilite` dit ce qui vieillit vite : `haute` pour les prix, rendements,
   classements et outils tiers, `basse` pour le lore et les mécaniques stables. Croisé avec `date_verification`, il
   désigne ce qu'il faut revérifier en priorité, et permet d'assortir une réponse d'une réserve d'ancienneté lorsque
   la donnée est volatile et le relevé ancien.
3. **Nuance de la réponse.** Le champ `zones_incertaines` liste les points que le guide reconnaît lui-même ne pas
   savoir. Si la question porte sur l'un d'eux, la réponse doit être nuancée plutôt qu'affirmative, et dire ce qui
   n'est pas établi. Le champ `confiance_globale` module de la même façon le ton d'une réponse tirée du guide.

### Le front-matter des guides

Chaque guide porte en toute première ligne un front-matter YAML, suivi de son titre H1 puis d'un encart `## En bref`
de 120 à 180 mots qui résume le guide à lui seul et constitue son chunk canonique. Gabarit, à respecter champ pour
champ et dans cet ordre :

```yaml
---
id: 19-fleet-carriers
titre: "Porte-vaisseaux de joueur (Fleet Carriers)"
domaine: economie
entites: [Fleet Carrier, Porte-Vaisseau, Tritium, Drydock, Stronghold Carrier]
mots_cles_en: [fleet carrier, tritium, carrier jump, decommissioning, drydock]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-09
confiance_globale: haute
volatilite: haute
sources_primaires: [roguey.co.uk, guide PTN, elite-journal.readthedocs.io, Wikipedia]
zones_incertaines: ["coûts hebdomadaires exacts des trois services Odyssey, non retrouvés dans les sources"]
guides_lies: [2, 4, 6, 11, 12, 18, 20, 22]
---
```

| Champ | Signification | Valeurs admises |
|---|---|---|
| `id` | Nom du fichier sans l'extension `.md` | `NN-nom-du-guide` |
| `titre` | Titre H1 du fichier, repris à l'identique | Chaîne entre guillemets droits |
| `domaine` | Domaine unique de rattachement, sert au filtrage grossier | `lore`, `politique`, `vaisseaux-equipement`, `combat`, `exploration`, `economie`, `social`, `meta-outils`, `transversal` |
| `entites` | Entités nommées que le guide documente en propre — noms propres, modules, mécaniques. Ce sont les termes sur lesquels on veut que ce guide remonte | Liste de chaînes ; viser 5 à 12, sans plafond dur — un guide transversal en porte légitimement davantage, et la recherche y gagne |
| `mots_cles_en` | Les mêmes notions telles qu'elles s'écrivent **en jeu**, en anglais. Ce n'est pas une traduction mot à mot : c'est le terme réellement employé par le jeu | Liste de chaînes |
| `version_jeu_couverte` | Version du jeu que le contenu reflète. La version courante est `4.4.0.x` | Chaîne entre guillemets droits |
| `branche` | Branche du jeu couverte | `live`, `legacy` |
| `date_verification` | Date réelle de dernière vérification du contenu, telle que le guide la documente | Date ISO `AAAA-MM-JJ` |
| `confiance_globale` | Qualité de sourçage réelle du guide : `haute` pour des sources primaires datées, `moyenne` pour de la connaissance générale non re-vérifiée | `haute`, `moyenne`, `basse` |
| `volatilite` | Vitesse de péremption attendue du contenu ; pilote la priorité de revalidation | `haute`, `moyenne`, `basse` |
| `sources_primaires` | Sources sur lesquelles le guide s'appuie réellement, telles que listées dans sa section Sources | Liste de chaînes |
| `zones_incertaines` | Points que le guide reconnaît lui-même ne pas savoir, résumés en une phrase chacun | Liste de chaînes, éventuellement vide |
| `guides_lies` | Numéros des guides que celui-ci cite le plus | Liste de nombres entiers |

Toute modification d'un front-matter impose de régénérer `index.yaml`. La régénération relit le front-matter de chaque
`raw_data/NN-*.md`, valide que les treize champs sont présents et dans l'ordre, que `domaine`, `branche`,
`confiance_globale` et `volatilite` prennent une valeur de leur énumération, que `date_verification` est une date
valide et que `guides_lies` ne cite que des numéros de guides existants, puis réécrit le fichier.

### Ne rien réécrire

Les exclusions des règles 1 et 2 se font par filtre de chemin et par filtre de titre de section au moment du découpage
en chunks ; le préfixe de la règle 3 se calcule à la volée. Le corpus source n'est pas modifié : un même fichier reste
complet sur disque et partiellement indexé.
