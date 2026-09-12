---
id: 25-combat-ax
titre: "Combat anti-Thargoïde (AX) approfondi"
domaine: combat
entites: [Thargoïdes, Interceptor, Scout thargoïde, Titan, Maelstrom, Shutdown Field Neutraliser, Guardian Gauss Cannon, Caustic Sink Launcher, Nuage caustique, Aegis, AXI, Zone de Combat Anti-Xéno]
mots_cles_en: [thargoid, interceptor, hydra, caustic cloud, shutdown field neutraliser, guardian gauss cannon, anti-xeno combat zone, non-human signal source, maelstrom, titan]
version_jeu_couverte: "4.4.0.x — contenu thargoïde inchangé depuis fin 2024, recoupé sur le flux d'annonces 2025-2026"
branche: live
date_verification: 2026-09-09
confiance_globale: moyenne
volatilite: moyenne
sources_primaires: [Flux Steam News officiel de Frontier Developments, Wikipédia EN Elite Dangerous, codex Maelstrom de Canonn, Inara, Massively OP]
zones_incertaines: ["Le nombre exact de cœurs par classe d'Interceptor n'a pas pu être recoupé sur source accessible", "La durée de la fenêtre de tir après shutdown (15 à 20 secondes) est une valeur indicative non vérifiée", "L'absence de sous-classes nommées de Scouts n'a pas pu être recoupée sur wiki", "Les valeurs de dégâts et de DPS des builds AX ne sont pas vérifiées et évoluent avec l'équilibrage", "La chronologie d'Aegis (3303, 3308, 3309) est reprise du corpus sans source primaire indépendante", "L'absence de mise à jour thargoïde depuis fin 2024 repose sur les titres et résumés du flux Steam News, pas sur les changelogs complets", "Le statut du domaine axi.info n'a pas pu être testé"]
guides_lies: [0, 1, 4, 5, 8, 16, 24]
---

# Combat anti-Thargoïde (AX) approfondi

## En bref

Le combat anti-Thargoïde (AX, *anti-xeno*) oppose les Commandants aux vaisseaux organiques des Thargoïdes : les
**Scouts**, capables d'hyperdiction, et quatre classes d'**Interceptors** — Cyclops (1 cœur), Basilisk (2), Medusa (3)
et Hydra (4), du niveau de menace modéré à extrême. Abattre un Interceptor suppose de fragiliser son bouclier organique
aux tirs AX, de le désactiver au **Shutdown Field Neutraliser (SFN)**, puis de détruire ses cœurs (*hearts*) pendant une
fenêtre d'une quinzaine de secondes, au **Guardian Gauss Cannon**, en nettoyant l'essaim au *Remote Release Flak
Launcher* et en purgeant les stacks caustiques au *Caustic Sink Launcher*. La Seconde Guerre Thargoïde est close : le
dernier des huit **Titans** (*Maelstroms*), **Cocijo**, est tombé à Sol le 19 décembre 2024 à 15:00 UTC, après Raijin
et Taranis (2 mars 2024). En 2026, le combat AX se pratique encore en **Non-Human Signal Sources (NHSS)** et en **Zones
de Combat Anti-Xéno (AXCZ)**, pour la réputation **Aegis**, les matériaux du Technology Broker et l'entraînement.

## Introduction au combat anti-Thargoïde (AX) dans Elite Dangerous

Le **combat anti-Thargoïde (AX)** est la branche de gameplay la plus exigeante d'Elite Dangerous en matière de combat spatial : elle oppose les Commandants à une biotechnologie extraterrestre hostile, les **Thargoïdes**, dont les vaisseaux organiques ne se détruisent pas comme un châssis humain classique. Ce guide approfondit les bases posées dans [08-combat-spatial.md](./08-combat-spatial.md) (section 4.5) et le contexte narratif de [01-lore.md](./01-lore.md) (section 3) : taxonomie complète des vaisseaux thargoïdes, anatomie détaillée d'un Interceptor, mécanique des nuages caustiques, archétypes de builds AX, organisations Aegis/AXI, et état du combat AX en 2026, après la conclusion officielle de la Seconde Guerre Thargoïde fin 2024.

---

## 1. État de la guerre thargoïde en 2026 : un conflit clos, un gameplay pérenne

### 1.1 Chronologie vérifiée de la fin de la Seconde Guerre Thargoïde

Le flux Steam News officiel de Frontier Developments (API `ISteamNews`, identique au contenu GalNet in-jeu) a été interrogé directement pour cette révision, et son horodatage brut (Unix time) décodé pour lever toute ambiguïté de fuseau horaire :

| Date/heure réelle (UTC, vérifiée) | Titre du billet | Contenu clé |
|---|---|---|
| 5 décembre 2024, 12:01 | *Titan Presence In Sol* | L'avant-dernier Titan, **Raijin**, vient d'être détruit ; le dernier Titan survivant, **Cocijo**, entame contre toute attente l'invasion de Sol, berceau de l'humanité. |
| 19 décembre 2024, 15:00 | *Thargoid War Epilogue* | « The last Titan, Cocijo, has fallen. The war is over. » Cocijo est détruit à Sol : fin officielle de la Seconde Guerre Thargoïde, bascule narrative vers la reconstruction. |

Ces deux dates et la citation du second billet ont été **vérifiées directement cette session** sur l'horodatage brut du flux Steam News officiel : **Sol n'a été envahi qu'à partir du 5 décembre 2024, 12:01 UTC**, et **la victoire finale a été proclamée le 19 décembre 2024, 15:00 UTC**. Cette séquence est cohérente avec le récit déjà présent dans [01-lore.md](./01-lore.md) (section 3.5), qui identifie également Cocijo comme dernier Titan tombé à Sol en décembre 2024.

> **Date tranchée par le corpus.** La date de référence de l'Epilogue est le **19 décembre 2024, 15:00 UTC**, celle
> du billet Frontier « The last Titan, Cocijo, has fallen. The war is over. », relevée sur l'horodatage brut du flux
> Steam News officiel. La mention « janvier 2025 » de [01-lore.md](./01-lore.md) (section 3.6) est traitée comme
> imprécise, et le « 26 mai 3310 » de l'article anglais de Wikipédia est une date **in-fiction** (calendrier GalNet),
> sans valeur chronologique réelle : voir le fait tranché en
> [00-chronologie-canonique.md](./00-chronologie-canonique.md#11-thargoid-war-epilogue--fin-de-la-seconde-guerre-thargoïde).
> Ce guide retient donc exclusivement les dates réelles vérifiées via Steam News (5 et 19 décembre 2024) pour toute
> référence temporelle.

### 1.2 Aucune évolution majeure du contenu Thargoïde documentée depuis fin 2024

Le flux Steam News officiel de Frontier ne fait apparaître, dans les mois qui suivent l'Epilogue, **aucune mise à jour majeure dédiée aux Thargoïdes** : les mises à jour successives de 2025-2026 (Trailblazers, Corsair Update, Vanguards, Dodec Update, Caspian Explorer, Type-11 Prospector, Rhino SRV, Operations Update, Lynx Highliner, Kestrel Mk II) n'introduisent, pour ce qui touche aux Thargoïdes, que des correctifs cosmétiques ou résiduels (par exemple des ajustements de pièces de kit visuel « Thargoid Bleached » ou de placement de débris de Titans). *Ce point s'appuie sur une lecture des titres et résumés du flux Steam News plutôt que sur une citation exacte de chaque correctif, laquelle n'a pas pu être recoupée mot pour mot cette session ; à confirmer via le changelog complet d'un patch avant citation dans un contexte critique.*

Ce constat confirme deux points utiles pour un pilote AX en 2026 :

1. les **champs de débris de Titans** (notamment à Sol) restent des éléments d'environnement visitables après-guerre, sans être un contenu jouable actif ;
2. **aucune nouvelle classe d'Interceptor ni mécanique Thargoïde inédite** n'a été introduite depuis la fin 2024, à la connaissance de cette révision.

### 1.3 Le combat AX aujourd'hui : un contenu « evergreen »

En 2026, la guerre thargoïde est un **événement historique conclu** dans le lore, mais le combat AX reste un pan de gameplay pleinement actif et pérenne :

- les **Non-Human Signal Sources (NHSS)** continuent d'apparaître dans les systèmes ayant connu une présence thargoïde, avec des Scouts et occasionnellement des Interceptors isolés ;
- les **Zones de Combat Anti-Xéno (AXCZ)**, pendant thargoïde des Combat Zones classiques décrites en [08-combat-spatial.md](./08-combat-spatial.md) (section 4.3), restent disponibles comme terrain d'entraînement et de farming de récompenses/matériaux ;
- les carcasses de Titans, dont celle de Sol, demeurent des **vestiges explorables**, sans mécanique de combat actif associée à ce jour.

Ce combat AX pérenne sert avant tout à l'entraînement, à la collecte de matériaux pour le Human/Guardian Technology Broker (voir section 6 et [04-equipements.md](./04-equipements.md) section 2.6), et au maintien d'une communauté active en cas de résurgence future — le lore officiel ne présente pas les Thargoïdes comme éradiqués, seulement repoussés lors de ce cycle de conflit (voir [01-lore.md](./01-lore.md), section 3.6).

---

## 2. Taxonomie des vaisseaux thargoïdes

### 2.1 Scouts — les plus petits vaisseaux thargoïdes, capables d'hyperdiction

Les **Scouts** sont les plus petits vaisseaux thargoïdes, rencontrés principalement dans les NHSS et les systèmes en état d'alerte ou d'invasion. Points clés :

- **Menace individuelle faible**, mais dangereux en essaim ou à haut niveau de menace ;
- capables d'**hyperdiction** : ils peuvent forcer un vaisseau non préparé (notamment les gros cargos commerciaux) à sortir de la supercroisière ;
- peuvent perturber les capteurs et modules du vaisseau ciblé ;
- servent traditionnellement d'**introduction au combat AX** avant de passer aux Interceptors, plus dangereux.

Contrairement aux Interceptors, il n'existe pas de sous-classification formelle et largement consensuelle des Scouts au-delà du terme générique « Scout » — seule leur **échelle de niveau de menace** (généralement notée de façon croissante) distingue les rencontres les plus anodines des plus dangereuses. *Point à traiter avec prudence : cette absence de sous-classes nommées n'a pas pu être recoupée sur wiki cette session (accès bloqué) ; à confirmer si une taxonomie plus fine existe côté communauté.*

### 2.2 Interceptors : les quatre classes nommées (Cyclops, Basilisk, Medusa, Hydra)

Les **Interceptors** sont la classe de vaisseaux de combat lourds thargoïdes rencontrés dans les AXCZ et les NHSS de haute menace. Quatre variantes nommées sont documentées, de la moins à la plus dangereuse — cette progression et les niveaux de menace sont cohérents avec le tableau déjà présent en [01-lore.md](./01-lore.md) (section 3.4) :

| Classe | Niveau de menace | Nombre de « cœurs » (non vérifié cette session) | Particularité notable |
|---|---|---|---|
| **Cyclops** | Modéré | 1 | Premier Interceptor rencontré en progression normale ; sert d'introduction au combat de cœurs. |
| **Basilisk** | Élevé | 2 | Capacités offensives renforcées par rapport au Cyclops. |
| **Medusa** | Très élevé | 3 | Usage intensif de projectiles/mines caustiques (voir section 4). |
| **Hydra** | Extrême | 4 | Le plus dangereux ; capacités de brouillage étendues, tirs les plus destructeurs, rencontré dans les zones de guerre de haute intensité et à proximité des Maelstroms/Titans. |

> Cette table complète le tableau déjà présent en [01-lore.md](./01-lore.md) (section 3.4, qui ne détaille pas le nombre de cœurs) en y ajoutant le nombre de cœurs par classe. **Le nombre exact de cœurs par classe n'a pas pu être vérifié via les sources accessibles cette session** (Wikipédia, Inara et Canonn ont été consultés mais ne détaillent pas ce point ; le wiki communautaire dédié était inaccessible) — il s'agit d'une donnée de connaissance de jeu largement citée par la communauté depuis les mises à jour « Thargoid War » 2020-2022, à confirmer en jeu ou via un wiki à jour avant toute utilisation dans un contexte critique (guide de raid, calcul de DPS requis, etc.).

### 2.3 Titans (Maelstroms) : les huit méga-vaisseaux de l'invasion thargoïde

Les **Titans** (également désignés « Maelstroms ») sont des super-vaisseaux stationnaires ayant servi de base d'opérations et de point de contrôle territorial pendant la Seconde Guerre Thargoïde. **Huit Titans ont été construits** (confirmé par l'article Wikipédia sur *Elite Dangerous*), et les huit sont désormais nommés — voir [01-lore.md](./01-lore.md), section 3.5, qui fait autorité sur cette liste :

| Titan | Statut connu |
|---|---|
| **Taranis** | Premier des huit Titans détruit par les commandants, le 2 mars 2024 (2 mars 3310 en temps de jeu) |
| Indra | Un des Titans ayant atteint les Systèmes du Cœur |
| Leigong | idem |
| Oya | idem |
| Thor | idem |
| Hadad | idem |
| **Raijin** | Avant-dernier Titan détruit (avant le 5 décembre 2024, d'après le billet Frontier *Titan Presence In Sol*, confirmé cette session) |
| **Cocijo** | Dernier Titan, envahisseur de Sol (5 déc. 2024), détruit le 19 décembre 2024 — fin de la guerre |

*Le huitième Titan, longtemps non nommé dans ce corpus, est **Taranis** : la liste complète des huit Maelstroms est
confirmée par le codex du groupe communautaire [Canonn](https://canonn.science/codex/maelstrom/) (consulté le
9 septembre 2026), qui retient également la graphie **Raijin** relevée ci-dessus. La date de sa destruction provient
de la couverture presse de l'événement
([Massively OP](https://massivelyop.com/2024/03/04/elite-dangerous-players-successfully-destroy-the-first-thargoid-titan/),
4 mars 2024), les pages officielles Frontier étant inaccessibles lors de cette révision (HTTP 403). Les huit Titans
portent tous le nom d'une divinité de l'orage.*

Chaque Titan était dissimulé dans un **Maelstrom** (nébuleuse rouge/violet visible à grande distance) et sa neutralisation suivait une progression en plusieurs phases — connaissance de jeu établie, cohérente avec [08-combat-spatial.md](./08-combat-spatial.md) (section 4.5), mais non re-détaillée sur wiki cette session :

1. **Sites « Spire »** au sol : opérations à pied (façon Odyssey, voir [05-guardians.md](./05-guardians.md) pour la mécanique de sites similaire, et [09-combat-a-pied.md](./09-combat-a-pied.md) pour le combat FPS générique) visant à affaiblir la grille de défense du Titan depuis la surface d'un corps voisin.
2. **AXCZ orbitales** autour du Maelstrom, pour réduire les défenses spatiales du Titan.
3. **Mise à nu des cœurs du Titan**, à détruire en séquence — le **Guardian Nanite Torpedo Pylon** (voir section 5 et [04-equipements.md](./04-equipements.md) section 2.6), arme hybride combinant matériaux Guardian et Thargoïdes, a été ajouté spécifiquement pour empêcher un Titan d'évacuer sa chaleur pendant cette phase d'assaut.
4. **Neutralisation finale** du cœur central, entraînant la destruction du Titan.

La récompense post-guerre la plus notable issue de la recherche sur la technologie des Titans est la technologie **Supercruise Overcharge (SCO)**, aujourd'hui intégrée aux mécaniques de propulsion courantes du jeu (voir [01-lore.md](./01-lore.md), section 3.7, et [08-combat-spatial.md](./08-combat-spatial.md)/[03-vaisseaux.md](./03-vaisseaux.md) pour son usage).

---

## 3. Anatomie d'un Interceptor : sous-systèmes à détruire

Un Interceptor thargoïde ne se traite pas comme un vaisseau humain classique : il faut désactiver son bouclier organique par une procédure spécifique avant de pouvoir viser ses points faibles internes. Cette section détaille la mécanique déjà résumée en [08-combat-spatial.md](./08-combat-spatial.md) (section 4.5).

### 3.1 Le bouclier organique et le Shutdown Field Neutraliser (SFN)

- Le bouclier d'un Interceptor est **organique** et ne se réduit pas comme un bouclier humain classique sous de simples dégâts de bouclier.
- Il doit d'abord être **fragilisé** par des tirs conventionnels/AX jusqu'à un certain seuil.
- Il est ensuite **désactivé** via le module utilitaire dédié **Shutdown Field Neutraliser (SFN)**, lui-même préalablement chargé en le ciblant avec une arme « chargeuse » de SFN dédiée sur un hardpoint séparé.
- Une fois le bouclier neutralisé, une **fenêtre de tir limitée** (de l'ordre de 15 à 20 secondes, valeur indicative non vérifiée cette session) s'ouvre pour exposer les cœurs.

### 3.2 Les cœurs (« hearts ») d'un Interceptor thargoïde : la cible prioritaire

- Les **cœurs** sont des organes internes vulnérables, visibles sous forme de points lumineux une fois le bouclier abaissé (mécanique confirmée en [08-combat-spatial.md](./08-combat-spatial.md), section 4.5).
- Ils constituent la **cible prioritaire** : leur destruction inflige des dégâts catastrophiques au vaisseau et est nécessaire pour le vaincre.
- Le nombre de cœurs varie selon la classe d'Interceptor (voir tableau section 2.2) : de 1 (Cyclops) à 4 (Hydra), selon les connaissances de jeu établies non vérifiées via les sources accessibles cette session.
- Le tir sur les cœurs bénéficie particulièrement des armes à haut dégât d'alpha-strike et haute précision, comme le **Guardian Gauss Cannon** (voir section 5).

### 3.3 L'essaim de Thargons et les batteries caustiques des Interceptors

- Beaucoup d'Interceptors déploient un **essaim de petites unités autonomes** (parfois désignées « Thargons » dans la communauté) qui interceptent une partie des tirs destinés au vaisseau principal — un Flak Cannon ou un Remote Release Flak Launcher est généralement recommandé pour nettoyer cet essaim avant de se concentrer sur les cœurs.
- Les classes **Medusa** et **Hydra** disposent en outre de **batteries/lance-missiles caustiques**, projetant des mines ou missiles qui libèrent des nuages corrosifs à l'impact (voir section 4).

### 3.4 L'éruption terminale (« death cloud ») à la destruction d'un Interceptor

À sa destruction finale, un Interceptor libère une **explosion de résine/gaz caustique** à grand rayon. La règle de sécurité standard en combat AX consiste à **s'éloigner immédiatement** après le coup de grâce, pour éviter d'être pris dans ce nuage terminal.

---

## 4. Nuages caustiques : mécanique et contre-mesures

| Aspect | Détail |
|---|---|
| **Sources** | Missiles/mines de Medusa et Hydra ; éruption terminale (« death cloud ») à la mort d'un Interceptor ; zones endommagées autour des Titans et Maelstroms. |
| **Effet** | Dégâts continus (DoT) qui **contournent directement le bouclier** et attaquent la coque ; s'accumulent en « stacks » persistants, actifs même après avoir quitté la zone tant qu'ils ne sont pas neutralisés. |
| **Conséquences** | Peut déclencher des pannes de modules si la coque descend trop bas ; peut détruire un vaisseau mal préparé resté trop près d'une explosion terminale ou d'une zone caustique étendue (notamment près des Titans). |
| **Contre-mesure directe** | Module utilitaire **Caustic Sink Launcher**, qui neutralise les stacks caustiques déjà accumulés sur son propre vaisseau. |
| **Contre-mesure préventive** | **Remote Release Flak/Flechette Launcher** pour détruire les mines/missiles caustiques avant impact. |
| **Contre-mesure passive** | Renforts de coque (Hull Reinforcement Package) et **Guardian Shield Reinforcement Package** (voir [05-guardians.md](./05-guardians.md)), qui atténuent les dégâts globaux sans traiter spécifiquement la composante caustique. |
| **Contre-mesure comportementale** | S'éloigner immédiatement de la zone : cela stoppe l'accumulation de **nouveaux** stacks, mais ne retire pas les stacks déjà présents — seul le Caustic Sink Launcher ou une décontamination en station/installation adaptée y remédie. |

Cette mécanique est cohérente avec le résumé déjà présent en [08-combat-spatial.md](./08-combat-spatial.md), section 4.5.

---

## 5. Armement et builds AX chiffrés

### 5.1 Armement et modules dédiés au combat AX (AX Multi-Cannon, Guardian Gauss Cannon, SFN)

Cet armement se débloque via la réputation auprès d'**Aegis** et la fourniture de matériaux/commodités Thargoïdes ou Guardian (voir [04-equipements.md](./04-equipements.md), section 2.6 pour le détail des montages et tailles) :

| Équipement | Rôle | Type | Notes |
|---|---|---|---|
| **AX Multi-Cannon** (+ variante « Enhanced » V2) | Attrition de l'armure thargoïde | Arme | Inefficace contre les vaisseaux humains ; efficace spécifiquement contre l'armure thargoïde. |
| **AX Missile Rack** (+ variante « Enhanced » V2) / **Enzyme Missile Rack** | Missile spécialisé anti-armure thargoïde | Arme | — |
| **Guardian Gauss Cannon** | Heart-sniping | Arme hybride Guardian | Tir chargé à haut dégât d'alpha-strike et haute précision, idéal pendant la fenêtre de shutdown (voir 3.1-3.2). |
| **Guardian Nanite Torpedo Pylon** | Empêche l'évacuation thermique des Titans | Arme hybride Guardian/Thargoïde | Débloqué au Guardian Technology Broker ; utile principalement en phase d'assaut de Titan (voir 2.3). |
| **Shutdown Field Neutraliser (SFN)** | Désactivation du bouclier organique | Module utilitaire | Indispensable pour exposer les cœurs (voir 3.1). |
| **Thargoid Pulse Neutraliser** | Neutralisation des Scouts | Module utilitaire | Coupe les capacités offensives et d'hyperdiction des Scouts. |
| **Remote Release Flak Launcher / Flechette Launcher** | Nettoyage d'essaim et de projectiles caustiques | Module utilitaire | Voir 3.3 et section 4. |
| **Caustic Sink Launcher** | Neutralisation des stacks caustiques | Module utilitaire | Voir section 4. |

### 5.2 Archétype de build AX (structure générale)

Les valeurs exactes de dégâts/DPS n'ont pas pu être vérifiées via les sources accessibles cette session — elles évoluent au gré des correctifs d'équilibrage de Frontier. La **structure** d'un build AX compétitif reste en revanche stable et bien documentée par la communauté :

| Catégorie | Choix typiques |
|---|---|
| **Châssis recommandés** | Federal Corvette, Krait Mk II, Alliance Chieftain/Challenger, Anaconda, Vulture (voir fiches techniques en [03-vaisseaux.md](./03-vaisseaux.md)). |
| **Armement offensif principal** | 1 à 2 **Guardian Gauss Cannon** en emplacements fixes, dédiés au heart-sniping. |
| **Armement d'attrition** | **AX Multi-Cannons** et/ou **Enzyme Missile Racks**, pour l'usure de l'armure entre deux fenêtres de shutdown. |
| **Emplacements utilitaires** | 1 **Shutdown Field Neutraliser**, 1 à 2 **Caustic Sink Launcher**, 1 **Remote Release Flak/Flechette Launcher**, Shield Boosters, Hull Reinforcement Package, **Guardian Shield Reinforcement Package**. |
| **Gestion thermique** | Heat Sink Launcher, particulièrement recommandé pendant les phases d'assaut de Titan (chaleur élevée à proximité du cœur central). |

> Recommandation avant publication ou usage compétitif : confirmer ces slots et valeurs via un configurateur externe à jour (Coriolis, EDSY — voir [16-outils.md](./16-outils.md)) et via l'ingénierie appliquée aux modules concernés (voir [06-ingenieurs.md](./06-ingenieurs.md)), les stats stock présentées ici n'intégrant aucune modification G1-G5.

---

## 6. Ressources et organisations : Aegis et AXI

### 6.1 Aegis (organisation in-lore)

**Aegis** est le consortium in-lore de défense anti-Thargoïde. D'après [01-lore.md](./01-lore.md) (section 3.7), il a été fondé le **4 août 3303** conjointement par la Fédération, l'Empire et l'Alliance, dissous le 18 janvier 3308 puis reformé le 13 février 3309 ; ces dates n'ont pas pu être recoupées sur une source primaire indépendante cette session (Wikipédia, Inara et Canonn, consultés, ne détaillent pas la chronologie d'Aegis) et sont donc reprises telles quelles du corpus existant plutôt que re-vérifiées ici — voir [01-lore.md](./01-lore.md) (section 3.7) pour le détail complet de sa structure. Sur le plan du gameplay, Aegis :

- coordonne la **R&D des armes et modules AX et hybrides Guardian**, via ses chantiers navals et le **Human Technology Broker** ;
- octroie le déblocage de cet équipement contre de la **réputation**, gagnée en livrant des bons de combat et des matériaux/commodités thargoïdes récupérés en NHSS/AXCZ à ses installations dédiées (voir [04-equipements.md](./04-equipements.md), section 2.6).

*Les noms exacts des divisions et stations Aegis actuellement actives n'ont pas pu être revérifiés cette session au-delà de ce qui figure déjà dans [01-lore.md](./01-lore.md) — s'y référer plutôt que d'inventer un nom de station non confirmé.*

### 6.2 AXI (Anti Xeno Initiative)

L'**AXI (Anti Xeno Initiative)** est une organisation **communautaire de joueurs** (non officielle, non gérée par Frontier), historiquement dédiée à la formation et à la coordination du combat anti-xéno :

- recrutement et **formation de nouveaux pilotes AX** (bootcamps, wings d'entraînement) ;
- diffusion de **builds de vaisseaux recommandés** ;
- **coordination de flottes** lors des phases d'assaut majeures, notamment les sièges de Titans pendant la guerre.

Ce rôle communautaire est un fait bien établi et de longue date, mais le domaine de référence (axi.info) n'a pas pu être testé directement cette session ; à vérifier avant de le citer comme lien actif dans un contexte utilisateur final.

---

## 7. Où pratiquer le combat AX en 2026

Avec la guerre officiellement terminée depuis fin 2024, le combat AX reste accessible via :

- les **Non-Human Signal Sources (NHSS)**, dans les systèmes ayant connu une présence thargoïde active, pour affronter des Scouts et occasionnellement des Interceptors isolés ;
- les **Zones de Combat Anti-Xéno (AXCZ)**, pendant du RES/CNB classique décrit en [08-combat-spatial.md](./08-combat-spatial.md) (section 4.3), pour un entraînement structuré contre des Interceptors ;
- les **carcasses de Titans** (dont celle de Sol), à but essentiellement d'exploration et de tourisme post-guerre, sans mécanique de combat actif documentée à ce jour.

Comme le rappelle déjà [08-combat-spatial.md](./08-combat-spatial.md), la progression exacte du front (systèmes en alerte, en reconquête, etc.) évoluait au fil des campagnes tant que la guerre était active ; en 2026, ce point est devenu sans objet pour l'essentiel du territoire, la guerre étant conclue — consultez malgré tout le fil GalNet en jeu pour tout événement résiduel non couvert par cette révision.

---

## Note méthodologique sur la fiabilité des données de ce guide

> **Note méthodologique sur la fiabilité des données de cette révision.** Les sources communautaires habituelles pour la taxonomie Thargoïde — le wiki elite-dangerous.fandom.com, les forums officiels Frontier — se sont révélées inaccessibles lors de la rédaction (blocage anti-bot HTTP 402), comme déjà noté dans [08-combat-spatial.md](./08-combat-spatial.md). En revanche, cette révision a pu consulter directement le flux officiel **Steam News de Frontier Developments** (API `ISteamNews`, contenu identique aux billets GalNet/site officiel) ainsi que l'article anglais de Wikipédia sur *Elite Dangerous* et deux sites communautaires (Inara, Canonn) — voir la section [Sources](#sources) en fin de document. Cela permet de confirmer avec un niveau de confiance élevé la chronologie de fin de guerre (section 1.1), directement recoupée sur l'horodatage brut des billets Steam. En revanche, la taxonomie fine des vaisseaux (nombre exact de « cœurs » par classe d'Interceptor), l'anatomie précise des sous-systèmes et les valeurs chiffrées de dégâts/DPS des builds reposent sur des **connaissances de jeu établies et stables depuis les mises à jour « Thargoid War » de 2020-2022**, que les sources consultées cette session (Wikipédia, Inara, Canonn) ne détaillent pas au niveau requis pour les re-vérifier ; elles sont signalées comme telles au fil du guide. Avant de graver un build ou un chiffre dans un contexte critique, recoupez-le avec le fil GalNet en jeu, un wiki communautaire à jour, ou un configurateur externe (Coriolis, EDSY — voir [16-outils.md](./16-outils.md)).

---

## Voir aussi

- [Lore et chronologie](./01-lore.md) — contexte narratif complet de l'invasion thargoïde, chronologie des deux guerres, et structure détaillée d'Aegis (section 3.7).
- [Combat spatial](./08-combat-spatial.md) — mécaniques générales de combat (pips, énergie, Combat Zones) dont le combat AX est une branche spécialisée (section 4.5).
- [Équipements](./04-equipements.md) — détail des montages, tailles et conditions de déblocage de l'armement AX et Guardian (section 2.6-2.7).
- [Guardians](./05-guardians.md) — armes et modules hybrides Guardian utilisés en combat AX, et mécanique des sites de ruines applicable aux sites « Spire » de Titan.
- [Community Goals](./24-community-goals.md) — mécanique générique des campagnes communautaires, utilisée pendant la guerre pour la défense de systèmes et la collecte de matériaux anti-Titan.
- [Outils](./16-outils.md) — configurateurs externes (Coriolis, EDSY) pour vérifier tout build AX avant usage compétitif.

## Sources

- [https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320](https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320) — flux Steam News officiel de Frontier Developments (billets *Titan Presence In Sol* et *Thargoid War Epilogue*, horodatage brut vérifié).
- [https://en.wikipedia.org/wiki/Elite_Dangerous](https://en.wikipedia.org/wiki/Elite_Dangerous) — article anglais de Wikipédia sur *Elite Dangerous* (nombre de Titans, date in-fiction de la destruction de Cocijo).
- [https://inara.cz/elite/thargoidwar/](https://inara.cz/elite/thargoidwar/) — tableau de bord communautaire de la guerre thargoïde (consulté, contenu insuffisamment détaillé pour les points recherchés).
- [https://canonn.science](https://canonn.science) — site du groupe de recherche communautaire Canonn (consulté, contenu insuffisamment détaillé pour les points recherchés).
- https://elite-dangerous.fandom.com — wiki communautaire, tenté mais inaccessible cette session (HTTP 402).
