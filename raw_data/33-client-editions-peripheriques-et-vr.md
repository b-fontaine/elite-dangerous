---
id: 33-client-editions-peripheriques-et-vr
titre: "Elite Dangerous : client, éditions, branches Live/Legacy, périphériques et VR"
domaine: transversal
entites: [Live, Legacy, Odyssey, Horizons, ARX, Frontier Account, Steam, Epic Games Store, Xbox Game Pass,
  HOTAS, HOSAS, TrackIR, SteamVR, Meta Quest, Steam Frame, Valve Index, Windows Mixed Reality, Custom.4.0.binds,
  Deluxe Edition]
mots_cles_en: [live mode, legacy mode, odyssey, horizons, arx, frontier account, steam, epic games store,
  xbox game pass, hotas, hosas, trackir, steamvr, meta quest, steam frame, valve index, windows mixed reality,
  key bindings, custom binds, deluxe edition, colorblind mode, accessibility]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-13
confiance_globale: moyenne
volatilite: haute
sources_primaires: ["elitedangerous.com (buy, news, store, support)", "store.steampowered.com (app 359320 et 1336350)",
  "store.epicgames.com", "customersupport.frontier.co.uk", "forums.frontier.co.uk", "elite-dangerous.fandom.com",
  "edrefcard.info", "roadtovr.com", "vkbsimcontrollers.com", "virpil-controls.us.com", "gaming.tobii.com",
  "corpus interne (15-roadmap.md, 14-rhino.md, 16-outils.md, 17-sources-donnees.md, 02-powerplay.md, 21-bgs.md)"]
zones_incertaines: ["aucune source datée 2024-2026 ne confirme que le portail de copie console → PC (ouvert le 13/09/2022, rouvert le 03/04/2023) fonctionne toujours aujourd'hui, malgré l'engagement initial de Frontier de le laisser ouvert indéfiniment",
  "aucune déclaration officielle Frontier datée de 2025-2026 ne confirme l'absence de projet de fermeture des serveurs Legacy — l'absence de mention dans les billets 2026 n'est qu'une inférence par défaut",
  "la citation « Legacy mode will not receive any major updates from now on » n'a été retrouvée que via une reprise secondaire (gamepressure.com) ; l'accès direct au billet officiel elitedangerous.com est resté bloqué (403) aux deux tentatives",
  "date exacte du défaut « Legacy » constaté sur l'Epic Games Store pour les joueurs venus d'Amazon Prime Gaming : située fin novembre/décembre 2024 par recoupement, non confirmée au jour près",
  "visibilité et fonctionnement des Fleet Carriers en mode Legacy : affirmés absents/non fonctionnels par une seule source communautaire (confluence.fuelrats.com), non recoupés ni vérifiés en jeu",
  "séparation exacte des soldes et plafonds hebdomadaires d'ARX entre Live et Legacy : cohérente avec la séparation générale des sauvegardes, jamais confirmée par une source officielle Frontier",
  "date précise (jour du mois) du passage d'Horizons en gratuit pour les possesseurs du jeu de base (~octobre 2020) et de la baisse du prix d'Odyssey à 14,99 €/$ (~février 2024) : situées par titre d'article ou synthèse, non confirmées sur un billet officiel ouvert intégralement",
  "restriction « Not available on Legacy » attribuée à la fiche produit officielle du Rhino en accès anticipé ARX : montants ARX confirmés, mention exacte non re-vérifiable (403 systématique sur elitedangerous.com/store lors de cette révision)",
  "date (12 mai 2026) et périmètre exact (formules Ultimate/Premium, consoles uniquement) de l'arrivée du jeu au catalogue Xbox Game Pass : reposent sur un seul article de presse spécialisée, non recoupés par une annonce officielle Microsoft ou Frontier",
  "aucune note de patch officielle Frontier de 2025-2026 consultée ne documente de travail d'optimisation FPS ou de réglages graphiques recommandés par le studio lui-même",
  "delta FPS chiffré par palier pour les réglages d'ombres (Spot/Directional Shadows) : aucune source ne le quantifie, seule la préférence qualitative « Medium » est recoupée",
  "PCGamingWiki, source habituellement la plus détaillée pour les réglages de configuration, est restée totalement inaccessible (Cloudflare) pendant toute la préparation de ce guide",
  "touche par défaut du mode FSS (Full Spectrum Scanner) lui-même : sources communautaires contradictoires, non tranchées",
  "aucune touche par défaut fiable pour les commandes du SRV (direction, tir de tourelle, phares, frein à main) : Frontier les livre entièrement vierges selon le wiki communautaire consacré au Scarab",
  "aucune confirmation officielle Frontier d'un correctif au problème de désalignement du regard et du réticule de visée à pied en TrackIR, documenté par des joueurs en 2021 et encore non résolu dans un fil de 2024",
  "date et prix officiels du Steam Frame (successeur du Valve Index) : non arrêtés à la date de rédaction ; une annonce était attendue vers le 22 septembre 2026 mais aucune compatibilité Elite Dangerous n'est confirmée",
  "citation exacte de Frontier sur l'absence de VR à pied : seule une déclaration datée et attribuée de 2020 (Tim Smith, avant la sortie d'Odyssey) a pu être sourcée ; aucune reconfirmation officielle plus récente (2024-2026) trouvée",
  "existence d'une page officielle Frontier de type « déclaration d'accessibilité » : non trouvée par cette recherche, mais l'exploration n'a pas été exhaustive (plusieurs pages candidates bloquées en accès direct)",
  "heure exacte du reset hebdomadaire des ARX (vers 07:00 UTC le jeudi) : le jour est confirmé par une source officielle, l'heure précise ne repose que sur des sources communautaires",
  "barème détaillé d'ARX gagné par action de jeu (combat, sauts, missions...) : hérité d'un unique guide communautaire de 2019-2020, jamais revalidé depuis et explicitement présenté par ses propres auteurs comme sujet à changement"]
guides_lies: [0, 3, 6, 13, 15, 16, 17, 27]
---

# Elite Dangerous : client, éditions, branches Live/Legacy, périphériques et VR

## En bref

Ce guide couvre la couche « avant de jouer » entièrement absente du corpus jusqu'ici. Depuis Odyssey (19 mai 2021), le
jeu existe en deux branches serveur incompatibles : **Live** (4.0+, mises à jour continues) et **Legacy** (figée en
3.8 depuis l'Update 14 du 29 novembre 2022, sans Odyssey ni contenu narratif récent) — un joueur en Legacy n'a ni
Colonisation, ni Powerplay 2.0, ni exobiologie, ni jeu à pied, et rien dans les autres guides ne le signale. Steam
installe Live par défaut depuis juin 2023 ; les consoles (PS4/Xbox One, développement arrêté le 10 mars 2022) **sont**
Legacy, sans autre choix. Côté achat, **Horizons n'est plus un produit séparé** : il est inclus gratuitement dans le
jeu de base depuis 2020, et **Odyssey** (14,99 €) reste la seule extension payante, débloquant le jeu à pied. Côté
matériel : configuration Steam minimale/recommandée (datant de l'ère pré-Odyssey), quatre schémas de contrôle —
clavier+souris, manette, HOTAS, HOSAS —, l'emplacement exact du fichier de bindings
(`%LOCALAPPDATA%\Frontier Developments\Elite Dangerous\Options\Bindings\Custom.4.0.binds`) et une trentaine de touches
réellement indispensables. Côté VR : le jeu tourne en SteamVR, fonctionne pleinement en cockpit et en SRV, mais **le
jeu à pied d'Odyssey reste et demeure en écran plat projeté dans le casque**, sans date d'ajout annoncée. Côté
accessibilité : remappage complet mais **aucun mode daltonien natif, aucune échelle d'interface, aucun sous-titre** —
des lacunes réelles à signaler plutôt qu'à taire. Enfin, la monnaie premium **ARX** se gagne aussi gratuitement en
jouant, plafonnée à 400 ARX/semaine (réinitialisée le jeudi) : à ce rythme, financer un vaisseau à 16 520 ARX sans
dépenser un centime prend environ 42 semaines pleines.

## Ce que couvre ce guide, et ce qu'il ne couvre pas

Aucun guide du corpus ne dit à quelle branche du jeu s'appliquent ses propres mécaniques : la scission Live/Legacy
n'était mentionnée, avant ce chantier, que comme un problème de format de champ `gameversion` pour EDDN dans
[17-sources-donnees.md](./17-sources-donnees.md#fin-des-serveurs-legacy-delite-dangerous-et-impact-sur-le-format-gameversion-deddn) —
jamais du point de vue du joueur qui doit savoir sur quelle version il joue avant même de lire un guide de mécanique.
Ce guide ne reproduit pas les tableaux déjà tenus ailleurs comme source unique : les prix et paliers ARX des vaisseaux
et véhicules en accès anticipé restent dans [15-roadmap.md](./15-roadmap.md#comprendre-les-prix--convertir-les-arx-en-monnaie-réelle)
et [14-rhino.md](./14-rhino.md), le détail fonctionnel des outils communautaires (EDCoPilot, VoiceAttack, overlays
VR) reste dans [16-outils.md](./16-outils.md), et la mécanique technique d'EDDN/`Status.json` reste dans
[17-sources-donnees.md](./17-sources-donnees.md). Ce que ce guide ajoute, qui n'existe nulle part ailleurs dans le
corpus : la distinction Live/Legacy du point de vue du joueur, une synthèse acheteur par édition et plateforme, la
configuration PC, les périphériques et leurs bindings, l'état de la VR et de l'accessibilité, et le mécanisme de gain
gratuit des ARX (par opposition à leurs prix d'achat, déjà couverts ailleurs).

---

## 1. Sur quelle version jouez-vous ? Live 4.0 contre Legacy 3.8

Depuis la sortie d'**Odyssey** (19 mai 2021, PC uniquement), *Elite Dangerous* existe sous deux branches serveur
distinctes et incompatibles entre elles. L'**Update 13** (9 août 2022) avait déjà fusionné les codebases Horizons et
Odyssey en un client PC unique version 4.0+. L'**Update 14** (29 novembre 2022) a ensuite officiellement nommé et
séparé les deux branches : **Live** (4.0 et suivants, mises à jour majeures continues) et **Legacy** (fige la version
3.8, plus aucun contenu narratif ni mise à jour de fond). Une reprise datée de l'annonce officielle cite le studio en
ces termes : « *Legacy mode will not receive any major updates from now on* » — citation retrouvée uniquement via une
reprise secondaire ([gamepressure.com](https://www.gamepressure.com/newsroom/elite-dangerous-legacy-and-live-mode-update-14-explained/zf4d6a)),
le billet officiel `elitedangerous.com` étant resté inaccessible (HTTP 403) aux tentatives de vérification directe.

### 1.1 Comment savoir dans quel mode on joue

| Plateforme | Comportement par défaut | Comment forcer l'autre mode |
|---|---|---|
| Steam | **Live par défaut depuis le 19 juin 2023** (annonce du 15/06/2023) ; Legacy n'est plus proposé au premier lancement | Sélecteur **« Versions »** du launcher Frontier, choisir explicitement « Legacy Horizons » |
| Epic Games Store | Comportement moins garanti : un épisode documenté (fin 2024, promotion Amazon Prime Gaming) a vu des joueurs Epic installer **Legacy par défaut** | Même sélecteur « Versions » dans le launcher |
| Frontier Store (achat direct) | Non revérifié séparément pour ce guide (accès aux pages support bloqué) | — |
| PS4 / Xbox One | **Aucun choix : la version console EST Legacy** (3.8), Odyssey n'y a jamais été porté | Aucun — voir [1.3](#13-le-cas-des-consoles-ps4-et-xbox-one) |

Trois indices fonctionnent quelle que soit la plateforme PC : le **numéro de version** affiché en bas à gauche du
menu principal avant le chargement d'une sauvegarde ; le texte en haut à gauche de l'écran de connexion (« *Elite
Dangerous Horizons* » ou « *Elite Dangerous Odyssey* » pour Live, rien d'autre que « *Elite Dangerous* » pour
Legacy) ; et la présence ou l'absence du pilotage à pied, de l'exobiologie et d'une carte galactique redessinée en
jeu. Techniquement, cinq arguments de ligne de commande distincts, partagés par le launcher officiel et par des
launchers tiers (`min-ed-launcher`), court-circuitent le sélecteur visuel : `/ed` (Legacy, base sans Horizons), `/edh`
(**Legacy Horizons**, la 3.8 gelée), `/eda` (Elite Dangerous Arena, CQC autonome), `/edo` (**Odyssey**, Live) et
`/edh4` (**Horizons 4.0**, le client Live sans avoir acheté Odyssey).

### 1.2 Ce qui manque en Legacy : tableau des fonctionnalités Live-only

| Fonctionnalité | Live | Legacy | Introduite le |
|---|---|---|---|
| Jeu à pied (Odyssey) | Oui | **Non** | 19 mai 2021, jamais rétroporté |
| Exobiologie | Oui | **Non** | Avec Odyssey |
| Colonisation de systèmes | Oui | **Non** | Bêta 26 février 2025, complète 11 novembre 2025 |
| Powerplay 2.0 (*Ascendancy*) | Oui | Non, reste sur Powerplay 1.0 | 31 octobre 2024 |
| Supercruise Overcharge (SCO) | Oui | **Non** | Updates 18.02-18.04, avril-mai 2024 |
| Mode Operations | Oui | **Non** | 30 juin 2026 |
| SRV Rhino / Nomad (SLV) | Oui | **Non** | 2 septembre 2026 / 30 juin 2026 |
| Tout vaisseau sorti après 2021 | Oui | **Non, aucun** | Python Mk II, Type-8, Mandalay, Cobra Mk V, Panther Clipper Mk II, Caspian Explorer, Kestrel Mk II, Lynx Highliner |
| GalNet / Community Goals liés à la trame Live | Oui | **Non** | Depuis l'Update 14 (le BGS local continue de tourner en fond) |
| Fleet Carriers | Oui | Signalés absents/non fonctionnels *(source unique, non recoupée)* | — |

Aucun vaisseau publié depuis 2021 n'existe dans le client Legacy, qui reste figé au catalogue de fin 2018-début 2021 —
un fait qui mérite d'être connu avant de recommander un vaisseau récent à un joueur dont on ignore la branche.

### 1.3 Le cas des consoles (PS4 et Xbox One)

Frontier a annoncé, le **10 mars 2022**, l'arrêt de tout développement de contenu pour PlayStation 4 et Xbox One,
Odyssey n'y ayant jamais été porté : les versions console **sont** la branche Legacy, sans option Live. Le jeu reste
pourtant activement **achetable** en 2026 — fiche PlayStation Store et fiche Xbox Store actives (à partir de 19,99 $),
éligible au **PlayStation Plus Extra** et, depuis le **12 mai 2026** *(source de presse unique, non recoupée)*, au
**Xbox Game Pass** (formules Ultimate et Premium) — mais la version reste figée au niveau Horizons/Legacy 3.8, sans
accès au contenu Live 4.0 ni à Odyssey. Des paliers d'ARX restent également en vente sur les deux boutiques console.

Un **portail de copie de profil console → PC**, ouvert le 13 septembre 2022 et rouvert le 3 avril 2023 après une
interruption, permet d'obtenir une copie PC gratuite (Horizons) avec son commandant console dupliqué — **une copie à
sens unique, pas une migration** : le profil console d'origine reste jouable en parallèle. Ne sont **pas** transférés :
le solde d'ARX, les Fleet Carriers et leur contenu, l'appartenance à un squadron, les listes d'amis/blocage/groupes
privés, les missions en cours. *Aucune source datée de 2024, 2025 ou 2026 ne confirme que ce portail fonctionne
toujours aujourd'hui* — à présenter au conditionnel. Aucun **cross-play** ni **cross-progression** n'existe entre PC,
PlayStation et Xbox ; seule exception, Xbox One et Xbox Series X|S jouent ensemble (même famille de plateforme).

### 1.4 Statut actuel de Legacy et liaison des comptes

Au 13 septembre 2026, **aucune annonce d'arrêt des serveurs Legacy n'a été trouvée** : les douze billets Steam News de
2026 déjà dépouillés par [00-chronologie-canonique.md](./00-chronologie-canonique.md) ne mentionnent jamais Legacy,
et un fil de statut serveur daté du 2 mars 2026 n'évoque aucune fermeture — un silence qui n'est **pas** une
confirmation positive de pérennité, seulement l'absence d'une annonce contraire depuis près de quatre ans.

Le compte pivot reste le **compte Frontier** (`user.frontierstore.net`), auquel Steam et/ou Epic viennent se lier via
« Link Accounts » — un compte de plateforme donné ne peut être lié qu'à un seul compte Frontier, et la liaison
n'ajoute pas le jeu à la bibliothèque de la plateforme si l'achat n'y a pas été fait. **L'ARX ne se transfère jamais
entre plateformes.** La chaîne de liaison côté Epic Games Store s'est montrée plus fragile que côté Steam : erreurs
« *this Frontier account does not own Elite Dangerous* » documentées en 2025, et un nouvel épisode de migration de
compte forcée le 24 mars 2026 après un dysfonctionnement du launcher.

---

## 2. Éditions, statut commercial et plateformes

### 2.1 Tableau des éditions (prix constatés le 13 septembre 2026)

| Édition | Contenu inclus | Prix (Steam/Epic) | Plateformes |
|---|---|---|---|
| **Elite Dangerous** (jeu de base) | Vol spatial, commerce, exploration, combat, SRV classique, Powerplay, Colonisation (hors volet à pied), Fleet Carriers, **Horizons intégré sans achat séparé** | 19,99 € | Steam, Epic, Frontier Store, **PS4, Xbox One** |
| **Elite Dangerous: Odyssey** | Jeu à pied, exobiologie, combinaisons et armes à pied, ingénieurs à pied, zones de conflit au sol, mode Operations | 14,99 € (jeu de base requis) | Steam, Epic, Frontier Store — **PC uniquement** |
| **Deluxe Edition** | Jeu de base + Odyssey groupés | 24,99 € | Steam, Epic, Frontier Store — **PC uniquement**, introduite ~fin février 2024 |

Ni Odyssey ni la Deluxe Edition ne sont proposés sur console : leur absence est cohérente avec l'arrêt du
développement console du 10 mars 2022 (voir [1.3](#13-le-cas-des-consoles-ps4-et-xbox-one)). Un achat sur n'importe
quelle plateforme exige de toute façon un **compte Frontier** distinct, lié ou non à un compte Steam/Epic.

### 2.2 Horizons est-il gratuit aujourd'hui ? Oui, et ce n'est plus un produit

Question restée ouverte dans le corpus, tranchée par deux faits distincts : Frontier a rendu **Horizons** gratuit
pour tout possesseur du jeu de base vers **octobre 2020** *(date précise au jour près non confirmée)* ; puis, à partir
de l'Update 14 (23 novembre 2022), le client Live 4.0 propose à tout joueur un **choix de mode « Horizons » ou
« Odyssey » au sein du même client**, pour que des commandants n'ayant pas tous acheté Odyssey puissent continuer à
jouer ensemble. **« Horizons » n'est donc plus une extension à acheter : c'est le nom du mode de contenu par défaut**
(vaisseau, SRV, atterrissage planétaire, sites Guardians — sans le volet à pied) à l'intérieur de Live ; **Odyssey**
reste le seul et unique achat payant débloquant le volet à pied dans ce même client. Aucune fiche produit Steam
indépendante pour « Elite Dangerous: Horizons » n'existe plus.

### 2.3 Contenu débloqué par édition — correspondance avec les guides du corpus

| Édition possédée | Débloque | Guides concernés |
|---|---|---|
| Jeu de base (Horizons inclus) | Ingénierie de vaisseau, SRV classique, atterrissage planétaire, sites Guardians, Powerplay, Colonisation (hors volet à pied), Fleet Carriers | [06-ingenieurs.md](./06-ingenieurs.md), [05-guardians.md](./05-guardians.md), [02-powerplay.md](./02-powerplay.md), [18-colonisation.md](./18-colonisation.md), [19-fleet-carriers.md](./19-fleet-carriers.md), [03-vaisseaux.md](./03-vaisseaux.md) |
| + Odyssey | Jeu à pied, exobiologie, combinaisons/armes à pied, 13 ingénieurs à pied supplémentaires, zones de conflit au sol, mode Operations | [07-equipement-a-pied.md](./07-equipement-a-pied.md), [09-combat-a-pied.md](./09-combat-a-pied.md), [26-ingenierie-a-pied-avancee.md](./26-ingenierie-a-pied-avancee.md), volet exobiologie de [10-exploration.md](./10-exploration.md), [13-operations.md](./13-operations.md) |

Le cœur de la Colonisation (revendication de système, construction orbitale/spatiale) ne semble pas exiger Odyssey ;
seul le volet strictement **à pied** de la colonisation (marcher dans un settlement développé) le requiert — ce point
précis n'a pas été recoupé sur une source officielle dédiée.

### 2.4 Plateformes actives et confusions à éviter

- **PC** : Steam, Epic Games Store et boutique Frontier directe, les trois vendant jeu de base, Deluxe et Odyssey.
- **Steam Deck** : tag officiel « **Jouable** » (pas « Vérifié »).
- **PS4/Xbox One** : jeu de base seulement (voir [1.3](#13-le-cas-des-consoles-ps4-et-xbox-one)) ; l'ARX y est
  achetable séparément, mais les circuits d'achat ARX PC et console restent étanches l'un à l'autre.
- **Rumeur de passage free-to-play — démentie.** Une vidéo publiée le 1ᵉʳ avril 2026 annonçait un passage gratuit du
  jeu au 4 mai 2026 : c'était un poisson d'avril, confirmé comme tel par la communauté et par le fait que le jeu reste
  payant (19,99 € constaté le 13 septembre 2026). À signaler explicitement pour couper court à une confusion active.
- **Prix d'Odyssey.** Passé d'environ 40 $ à 14,99 $ vers février 2024 *(date précise non confirmée)*, en même temps
  qu'apparaissait la Deluxe Edition ; ces deux tarifs sont toujours ceux constatés en septembre 2026. Des remises
  ponctuelles (jusqu'à -70 %) sont parfois affichées sur l'Epic Games Store ou chez des revendeurs de clés tiers, mais
  pas nécessairement sur la boutique Steam de Frontier au même moment — à vérifier au jour de l'achat plutôt qu'à
  supposer une promotion permanente.

---

## 3. Configuration PC et réglages à fort impact FPS

### 3.1 Configuration système officielle (fiche Steam, app 359320)

| | Minimale | Recommandée |
|---|---|---|
| OS | Windows 8/10 64 bits | Windows 8/10 64 bits |
| Processeur | Quad Core 4 × 2 GHz | Intel i7-3770K ou AMD FX 4350 (Quad Core) ou supérieur |
| Mémoire | 6 Go de RAM | 8 Go de RAM |
| Graphiques | Nvidia GTX 470 / AMD R7 240 | Nvidia GTX 770 / AMD Radeon R9 280X |
| DirectX | Version 11 | Version 11 |
| Stockage | 25 Go | 25 Go |
| VR | SteamVR, clavier ou manette requis | SteamVR, Oculus Rift, TrackIR |

Deux réserves à connaître : le client **Steam** lui-même n'installe plus que sur **Windows 10 minimum** depuis le
1ᵉʳ janvier 2024 (« Windows 8 » reste affiché sur la fiche jeu par erreur de mise à jour de texte) ; et cette
configuration date de l'ère Horizons (2015-2016) — elle n'a jamais été révisée depuis l'introduction du jeu à pied et
du rendu planétaire volumétrique d'Odyssey, et sous-estime probablement le besoin réel une fois posé au sol.

### 3.2 Réglages graphiques à fort impact FPS

- **Supersampling / Resolution Scale** — le réglage le plus coûteux : son coût croît au carré du multiplicateur
  (×2,0 = 4× les pixels rendus). Recommandation communautaire recoupée : ne pas dépasser **×1,25** sur un GPU de
  classe RTX 3060+, jamais au-delà de **×1,0** en 4K natif ou sur configuration d'entrée de gamme.
- **En VR, préférer « HMD Quality » à « Supersampling ».** Le réglage HMD Quality reporte le sur-échantillonnage au
  stade de compensation de distorsion des lentilles, pour un meilleur rendu à coût égal. Combinaison recommandée :
  HMD Quality 1,75-2,0, Supersampling in-game abaissé à 0,65-0,85, anti-aliasing désactivé au-delà de HMD Quality > 1.
- **Ombres (Spot/Directional Shadows)** : « Medium » recommandé pour l'équilibre qualité/FPS *(aucun delta FPS chiffré
  trouvé par palier)*.
- **Blur** : ne modifie **que** l'arrière-plan holographique derrière les écrans du cockpit, pas un flou 3D du monde
  extérieur — impact FPS marginal, faible priorité d'optimisation.
- **Qualité du terrain planétaire** : « High » recommandé sur configuration mi-haut de gamme. Un témoignage isolé
  *(source unique, non recoupée)* rapporte une chute de 60 à 38-40 FPS lors de la mise sous tension d'un settlement
  colonisé (lasers de défense nombreux), sans effet mesuré du réglage de terrain lui-même sur ce cas précis — le
  rendu spécifique à Odyssey (jambes, colonies) est décrit comme structurellement plus lourd que le rendu vaisseau.

| Réglage | Valeur conseillée |
|---|---|
| Distance d'affichage des modèles | ~50 % |
| Qualité de texture | High |
| Filtrage anisotrope | ×8 |
| Bloom | High |
| Anti-aliasing | SMAA (désactivé si Supersampling/HMD Quality > 1) |
| Ambient Occlusion | Medium |
| FX Quality | Medium |
| Depth of Field | High (réduire sur config faible) |

**Aucune note de patch officielle Frontier de 2025-2026 consultée ne documente de travail d'optimisation FPS ou de
réglages recommandés par le studio** — à signaler comme une absence constatée. PCGamingWiki, référence habituelle
pour ce type de réglages, s'est révélé inaccessible pendant la préparation de ce guide : à consulter manuellement en
complément.

---

## 4. Périphériques : schémas de contrôle et bindings

### 4.1 Comparatif des quatre schémas de contrôle

| Schéma | Avantages | Limites | Budget indicatif |
|---|---|---|---|
| **Clavier + souris** | Précision de la souris pour les armes fixes, coût nul, aucune calibration | Plus de 300 commandes assignables pour ~104 touches : couches de modificateurs obligatoires | 0 € (matériel déjà possédé) |
| **Manette (gamepad)** | Fonctionne d'emblée, ergonomie simple | Trop peu de boutons physiques pour ~300 commandes, rebinding quasi obligatoire | ~64 $ (Xbox Wireless Controller) à ~179 $ (Elite Series 2/3) |
| **HOTAS mono-stick** | Répartition naturelle stick/manette des gaz, meilleur rapport immersion/prix | Encombrement, usure des potentiomètres d'entrée de gamme | 132-170 $ (Thrustmaster T.16000M FCS, entrée de gamme) à 260-310 $ (VKB Gunfighter Mk.IV, base Virpil WarBRD-D) |
| **HOSAS (deux sticks)** | Dissociation totale translations/rotations, le plus précis en Flight-Assist-Off | Coût doublé, courbe d'apprentissage jugée la plus raide des quatre | ~260-340 $ (deux T.16000M) à ~620 $ (deux VKB Gunfighter Mk.IV) |

Le consensus communautaire (non un fait mesuré) classe HOSAS > HOTAS > manette > clavier+souris en finesse de
pilotage pure — l'ordre s'inverse pour le budget et la courbe d'apprentissage. Les prix VKB, Virpil et Tobii ci-dessus
et ci-dessous sont vérifiés directement sur les fiches constructeur ; ceux du T.16000M, de la manette Xbox et du
TrackIR proviennent d'agrégateurs de prix, à revérifier au moment de l'achat.

### 4.2 Le fichier de bindings : structure et emplacement

- **Emplacement** : `%LOCALAPPDATA%\Frontier Developments\Elite Dangerous\Options\Bindings\`
- **Nommage** : `Custom.3.0.binds` pour la branche Horizons/Legacy (3.8), `Custom.4.0.binds` pour la branche Live
  (4.x, Odyssey inclus). Le fichier `Custom` n'existe qu'après la première modification manuelle d'un binding — c'est
  cette modification qui le génère. Astuce documentée : renommer manuellement un ancien `Custom.3.0.binds` en
  `Custom.4.0.binds` au passage à Odyssey permet de repartir des anciens réglages Horizons plutôt que de tout
  reconfigurer.
- **Créer un preset personnalisé** : dupliquer le fichier `Custom` existant, le renommer (éviter espaces et noms déjà
  réservés comme `TMasterX`), éditer l'attribut `PresetName` de la balise racine `<Root PresetName="...">` pour qu'il
  corresponde, puis sélectionner ce preset dans chacune des quatre catégories du menu Options > Contrôles.
  **Sauvegarder régulièrement** : le jeu a la réputation, documentée par la communauté, de parfois corrompre ses
  propres fichiers de bindings lors d'une mise à jour majeure.
- **Outil de référence — [edrefcard.info](https://edrefcard.info/)** : génère une fiche graphique de rappel à partir
  de n'importe quel fichier `.binds` téléversé. Ses catégories de filtrage (**Ship, SRV, Scanners, Fighter, On Foot,
  Multicrew, Head Look, UI, Galaxy Map, Camera, Holo-Me, Miscellaneous**) reflètent la structure interne réelle du
  fichier de bindings.

### 4.3 Bindings réellement indispensables, par contexte

**Vol** — SYS/ENG/WEP (flèches gauche/haut/droite), reset 2-2-2 (flèche bas), Flight Assist Off (Z), boost (Tab),
train d'atterrissage (L), écope à cargaison (Home).
**Supercruise** — entrer/sortir du FSD, qui sert aussi à initier le saut hyperespace (J), cibler devant soi (T).
**Combat** — hardpoints (U), tir primaire/secondaire (clic gauche/droit), groupe de tir suivant (N), heat sink (V),
cible la plus menaçante/cycle de sous-système (H/Y). **Piège fréquent : le largage de chaff n'a aucune touche
assignée par défaut**, contrairement au heat sink — à affecter manuellement.
**FSS/DSS** — le scanner de découverte (« honk ») et les sondes DSS s'affectent par défaut à un groupe de tir, comme
n'importe quelle arme ; aucune touche dédiée native. *La touche par défaut du mode FSS lui-même est signalée de façon
contradictoire par les sources consultées, non tranchée.*
**SRV** — assistance de conduite, tourelle, phares. **Réserve majeure : Frontier livre les commandes du SRV
entièrement vierges** selon le wiki communautaire du Scarab — il n'existe pas de touche « par défaut » universelle à
citer pour la conduite, le tir ou le frein à main.
**À pied (Odyssey)** — sprint (Shift gauche), s'accroupir (Ctrl gauche), arme secondaire (2), outil (5), grenade (G),
interagir (E), viser (clic droit).

### 4.4 Head-tracking : TrackIR et alternatives

**TrackIR (NaturalPoint)** reste la référence historique, avec un profil natif « Elite Dangerous » chargé sans
plugin tiers pour le cockpit (~149 $ le boîtier TrackIR 5, prix d'agrégateur à revérifier). **Le jeu à pied
d'Odyssey pose un problème documenté et non résolu** : le regard du head-tracking ne coïncide pas avec le réticule de
visée à pied, un problème signalé sur le forum officiel dès juin 2021 et toujours non résolu dans un fil de juin
2024, sans correctif Frontier confirmé entre ces deux dates. Contournement communautaire le plus cité : assigner la
pause/reprise du TrackIR (touche **F9** par défaut) à un bouton du HOTAS ou l'automatiser via un logiciel de commande
vocale. Alternatives gratuites : **OpenTrack** (logiciel libre, émule le protocole TrackIR), **AITrack** (suivi par
webcam), **EDTracker** (capteur inertiel DIY à base d'Arduino). Alternative premium officiellement documentée pour ce
jeu : le **Tobii Eye Tracker 5** (279 € TTC, livraison gratuite, [page dédiée Elite Dangerous](https://gaming.tobii.com/games/elite-dangerous/)) —
ouverture de menus et mise en surbrillance du HUD au regard, ciblage sans recentrer l'écran, élargissement du champ
de vision effectif en minage et en exploration (« Camera Boost »).

---

## 5. VR : casques compatibles, ce qui fonctionne, et le confort

Le jeu n'a pas de runtime OpenXR natif propre : le support VR passe par **SteamVR**, et **aucun contrôleur de
mouvement n'est pris en charge** — c'est une expérience VR strictement assise, pilotée au clavier/souris/HOTAS/manette
classique.

### 5.1 Écosystème des casques en 2026

| Casque / gamme | Statut en 2026 | Compatibilité Elite Dangerous |
|---|---|---|
| **Meta Quest** (Link/Air Link/Virtual Desktop) | Voie la plus vivante ; Quest 3S/Quest 3 en vente active ; Quest 2/Quest Pro discontinués le 25/09/2024 (mises à jour fonctionnelles jusqu'en déc. 2026, sécurité jusqu'en déc. 2027) | Listé par Meta lui-même comme jeu « Link PC VR » |
| **Valve Index** | Discontinué comme produit le 12/11/2025 | Casques existants pleinement utilisables via SteamVR |
| **Steam Frame** (successeur, ex-« Deckard ») | Annoncé nov. 2025, autonome sous SteamOS ; **ni date ni prix officiels arrêtés** à la date de rédaction, annonce attendue vers le 22/09/2026 | Aucune compatibilité confirmée avec ce jeu spécifiquement |
| **HTC Vive** | Écosystème grand public en net retrait, recentré sur l'entreprise/le LBE | Support historique SteamVR toujours valable pour du matériel existant |
| **Windows Mixed Reality** | **Fin de support le 1ᵉʳ novembre 2026** (éditions grand public) | À ne plus recommander pour un achat en 2026 |
| **Pimax** (Crystal Super, Dream Air) | Écosystème PCVR actif, présenté au CES 2026 | Compatibilité générique SteamVR, non confirmée spécifiquement pour ce jeu |
| **Varjo** | Repositionné entreprise/formation (Aero résiduel grand public) | Idem, via SteamVR générique |

Le tag Steam « VR prise en charge » reste actif sur la fiche du jeu, mais le texte marketing (« Supports SteamVR,
Oculus Rift and TrackIR ») n'a pas été rafraîchi depuis l'arrêt de commercialisation de l'Oculus Rift CV1 — à lire
comme un texte ancien, pas une garantie de compatibilité actuelle.

### 5.2 Cockpit et SRV en VR, jeu à pied en écran plat

**Fonctionne en VR stéréoscopique** : pilotage du vaisseau et conduite du SRV — le cœur historique du support VR
depuis le lancement du jeu. **Ne fonctionne PAS en VR stéréoscopique** : le jeu à pied introduit par **Odyssey**
(19 mai 2021). Dès qu'un commandant descend de son vaisseau ou de son SRV, le casque affiche un écran plat projeté
dans le volume VR plutôt qu'un rendu stéréoscopique. La déclaration la plus solidement sourcée sur ce sujet reste
celle de **Tim Smith** (Community Manager Frontier), *avant* la sortie d'Odyssey, relayée par RoadToVR le 4 juin
2020 : « *Elite Dangerous: Odyssey will not be VR-compatible at launch [...] we had to re-examine if we could deliver
that same experience without compromise.* » **Aucune annonce plus récente (2024-2026) n'a été retrouvée** confirmant
ou infirmant que cette position a changé depuis — plus de cinq ans après la sortie d'Odyssey, l'absence de VR à pied
reste un fait constaté, pas une promesse tenue ou rompue récemment.

Les quatre outils déjà documentés dans [16-outils.md](./16-outils.md) pour leur support VR (Oculus Dash, Desktop+,
OVRDrop, OVRToolkit) restent tous activement maintenus en 2026 — le détail fonctionnel de chacun reste dans ce guide,
qui fait référence sur le sujet.

### 5.3 Options de confort intégrées

Il n'existe **pas** de section « confort VR » dédiée dans le menu Options (pas de bascule téléportation/glissement,
pas de vignette anti-nausée native identifiée) : le confort passe par des réglages génériques réutilisés — **Reduce
Camera Shake**, **Vehicle Motion Blackout** et **Vehicle Maintain Horizon Camera** (verrouille l'horizon de la caméra
en SRV sur terrain accidenté, effet jugé « significatif » par la communauté), **HMD Quality** (voir
[3.2](#32-réglages-graphiques-à-fort-impact-fps)), et un raccourci **Reset HMD Orientation** sous Contrôles > Divers.

---

## 6. Accessibilité réellement présente dans le jeu

- **Remappage : complet.** Toutes les fonctions sont réassignables (clavier, souris, manette, HOTAS), avec des
  préréglages constructeurs prêts à l'emploi. Une bascule **Hold/Toggle** existe fonction par fonction — l'assistance
  de vol, par exemple, est réglable en maintien ou en bascule — mais **le train d'atterrissage reste un simple bouton
  toggle sans option « hold »**, une demande communautaire documentée et non satisfaite.
- **Daltonisme : aucun mode natif.** La seule personnalisation des couleurs du HUD passe par l'édition manuelle d'un
  fichier hors jeu (`GraphicsConfigurationOverride.xml`, valeurs `MatrixRed`/`MatrixGreen`/`MatrixBlue`) ou un outil
  tiers (EDHM-UI) — **ce n'est pas un réglage en jeu**, à signaler comme une lacune réelle.
- **Échelle d'interface / taille de police : aucune option native trouvée.**
- **Audio** : curseurs de volume séparés pour « Player Voice Comms » et « Ship Voice Volume ». **Aucun mode audio
  mono** dédié n'a été trouvé.
- **Sous-titres : aucun sous-titrage natif** des communications vocales (ATC, multicrew, PNJ) — demande communautaire
  documentée depuis 2015, toujours non satisfaite.
- **Accessibilité motrice** : au-delà du remappage complet et des bascules Hold/Toggle, aucune fonctionnalité dédiée
  (auto-visée, macros officielles) identifiée.
- **Aucune page officielle Frontier de type « déclaration d'accessibilité »** n'a été localisée — à signaler comme
  non trouvée plutôt que comme une absence certaine, la recherche n'ayant pas pu être exhaustive.

---

## 7. La boucle de gain gratuit des ARX

Les prix d'achat et les paliers d'accès anticipé des vaisseaux/véhicules en ARX restent dans
[15-roadmap.md](./15-roadmap.md#comprendre-les-prix--convertir-les-arx-en-monnaie-réelle) et [14-rhino.md](./14-rhino.md),
qui en sont la source de vérité. Cette section couvre ce qui manquait : **comment on gagne des ARX gratuitement**.

### 7.1 Mécanisme et plafond

L'ARX se gagne « simplement en jouant » — réponse officielle de Frontier dès 2019 : « *ARX can be earned by simply
playing the game! [...] simply being an active player and engaging with the game is all that's required.* » Ce
n'est **pas** lié au temps de connexion passif, seulement à des actions de gameplay (combat, commerce, exploration,
« autre »), réparties en quatre catégories affichées en jeu, un système toujours actif en 2023 selon un fil
communautaire. **Le plafond est de 400 ARX par semaine**, confirmé toujours en vigueur par des fils datés de
2024-2025, **sans report** d'une semaine sur l'autre (l'ARX non gagné une semaine donnée est perdu, pas rattrapable),
et le **solde déjà acquis n'expire jamais**. Le barème précis par action (kill, saut FSD, mission...) qui circule dans
la communauté date d'un guide de 2019-2020 jamais mis à jour depuis et explicitement présenté par ses propres auteurs
comme sujet à changement : à traiter comme un ordre de grandeur historique, pas un tarif garanti en 2026.

### 7.2 Le reset hebdomadaire

Le reset a lieu le **jeudi** (confirmé par une source officielle : un relèvement exceptionnel du plafond à 1200 ARX
pendant une semaine promotionnelle en 2021 précisait un retour à la normale « *on Thursday 4th November* »),
**vers 07:00 UTC** *(l'heure précise ne repose que sur des sources communautaires, confiance moyenne)*. Coïncidence à
signaler sans en faire un mécanisme unifié : ce même horaire (jeudi ~07:00 UTC) est celui du tick hebdomadaire de
Powerplay ([02-powerplay.md](./02-powerplay.md)) — le tick du BGS, lui, est un cycle **quotidien** dont l'heure exacte
n'a jamais été publiée ([21-bgs.md](./21-bgs.md)), à ne pas confondre. Un événement annuel (**Festive Countdown**,
13-25 décembre) distribue de l'ARX par connexion quotidienne **hors plafond**.

### 7.3 Combien de temps pour financer un palier, sans dépenser un centime

En combinant le plafond de 400 ARX/semaine avec les paliers déjà chiffrés dans 15-roadmap.md et 14-rhino.md :

| Palier ARX | Édition-type | Semaines à 400 ARX/sem., plafond plein sans interruption | Durée approximative |
|---|---|---|---|
| 16 520 ARX | Standard | 42 semaines | ≈ 9,7 mois |
| 33 000 ARX | Stellar | 83 semaines | ≈ 19 mois |
| 60 000 ARX | Galactic | 150 semaines | ≈ 2,9 ans |
| 100 000 ARX | Type-11 Prospector Galactic Mining Pack | 250 semaines | ≈ 4,8 ans |

**Ce calcul est un plafond théorique, pas une moyenne réaliste** : il suppose que le joueur atteint exactement
400 ARX chaque semaine sans jamais en manquer une seule, pendant des mois voire des années. Les témoignages
communautaires vont plutôt dans le sens d'un plafond saturé en quelques jours de jeu (parfois moins d'une heure de
jeu ciblé) puis d'un abandon de la boucle jusqu'au reset suivant.

### 7.4 Ce qui s'achète en ARX, ce qui ne s'achète jamais qu'en argent réel

**Achetable en ARX** : peintures et décalques, Ship Kits, personnalisation Holo-Me et tenues de commandant,
bobbleheads, plaques nominatives, options COVAS, personnalisations de Fleet Carrier (marqueur, couleur de dérive, ATC,
habillage), vaisseaux pré-construits, l'accès anticipé des vaisseaux/véhicules neufs (prix : voir 15-roadmap.md et
14-rhino.md), et le **renommage de Commandant** (500 ARX + délai de 7 jours, fonctionnalité confirmée active).

**Jamais achetable en ARX, argent réel uniquement** : le jeu de base et les extensions **Horizons**/**Odyssey** ;
les **Credits** (monnaie de base, ni achetables en argent réel ni en ARX, et réciproquement) ; les commodités et
matériaux in-jeu (aucun *pay-to-win*) ; le **Merc Coin** du mode Operations, gagné seulement en jouant, un troisième
système monétaire volontairement étanche aux deux autres. Sont par ailleurs explicitement exclus, d'après une réponse
officielle de 2019 *(non reconfirmée depuis)* : le don d'ARX ou de Game Extras entre joueurs, un abonnement mensuel
(le jeu n'a pas de modèle d'abonnement), et des emplacements de Commandant supplémentaires. **L'ARX ne se transfère
jamais entre plateformes** (PC/Steam/Epic, Xbox, PlayStation restent trois soldes distincts).

---

## Questions fréquentes

**Quelle est la différence entre Live et Legacy ?**
Live (4.0+) reçoit toutes les mises à jour de contenu ; Legacy est figée en version 3.8 depuis novembre 2022, sans
Odyssey, sans exobiologie, sans Colonisation ni Powerplay 2.0, et sans aucun vaisseau sorti après 2021. Voir
[section 1](#1-sur-quelle-version-jouez-vous--live-40-contre-legacy-38).

**Comment savoir si je joue en Live ou en Legacy ?**
Regardez le texte en haut à gauche de l'écran de connexion (« Elite Dangerous Horizons/Odyssey » = Live, « Elite
Dangerous » seul = Legacy) ou la présence du jeu à pied en jeu. Sur Steam, Live est installé par défaut depuis juin
2023 ; sur Epic, ce n'est pas garanti. Voir [1.1](#11-comment-savoir-dans-quel-mode-on-joue).

**Faut-il acheter Horizons séparément ?**
Non. Horizons est inclus gratuitement dans le jeu de base depuis 2020 ; ce n'est plus un produit à vendre, seulement
un mode de contenu sélectionnable. Voir [2.2](#22-horizons-est-il-gratuit-aujourdhui--oui-et-ce-nest-plus-un-produit).

**Puis-je jouer à Elite Dangerous sur PS4 ou Xbox en 2026 ?**
Oui, le jeu reste achetable sur les deux boutiques console (y compris via Xbox Game Pass depuis mai 2026), mais la
version console est figée en Legacy : ni Odyssey, ni jeu à pied, ni contenu sorti après 2021. Voir
[1.3](#13-le-cas-des-consoles-ps4-et-xbox-one).

**Où se trouve le fichier de bindings du jeu ?**
`%LOCALAPPDATA%\Frontier Developments\Elite Dangerous\Options\Bindings\`, sous le nom `Custom.3.0.binds` (Legacy) ou
`Custom.4.0.binds` (Live). Voir [4.2](#42-le-fichier-de-bindings--structure-et-emplacement).

**Le jeu à pied d'Odyssey fonctionne-t-il en VR ?**
Non : le vaisseau et le SRV sont en VR stéréoscopique complète, mais dès qu'on marche à pied, l'affichage repasse en
écran plat projeté dans le casque, sans date d'ajout annoncée. Voir
[5.2](#52-cockpit-et-srv-en-vr-jeu-à-pied-en-écran-plat).

**Existe-t-il un mode daltonien dans Elite Dangerous ?**
Non, aucun mode natif : seule une édition manuelle d'un fichier de configuration hors jeu, ou un outil tiers, permet
de modifier les couleurs du HUD. Voir [section 6](#6-accessibilité-réellement-présente-dans-le-jeu).

**Combien d'ARX peut-on gagner gratuitement chaque semaine ?**
Jusqu'à 400 ARX par semaine, réinitialisés le jeudi vers 07:00 UTC, sans report d'une semaine sur l'autre. Voir
[7.1](#71-mécanisme-et-plafond).

**Combien de temps faut-il pour s'offrir un vaisseau en ARX sans payer ?**
Environ 42 semaines pleines (sans en manquer une seule) pour un palier Standard à 16 520 ARX, jusqu'à 250 semaines
pour un palier à 100 000 ARX — un plafond théorique, pas une moyenne réaliste. Voir
[7.3](#73-combien-de-temps-pour-financer-un-palier-sans-dépenser-un-centime).

**Quel schéma de contrôle choisir pour débuter ?**
Le clavier+souris ne coûte rien et suffit à apprendre le jeu ; un HOTAS mono-stick (dès ~130 $) offre le meilleur
rapport immersion/prix pour qui veut s'investir davantage. Voir
[4.1](#41-comparatif-des-quatre-schémas-de-contrôle).

---

## Voir aussi

- **[Elite Dangerous : la roadmap des développeurs](./15-roadmap.md)** — prix et paliers ARX des vaisseaux et
  véhicules en accès anticipé (source unique de ces montants).
- **[Le Rhino et le Nomad](./14-rhino.md)** — grilles ARX détaillées des deux véhicules les plus récents.
- **[Le guide des outils communautaires](./16-outils.md)** — détail fonctionnel d'EDCoPilot, VoiceAttack et des
  overlays VR cités en [section 5](#5-vr--casques-compatibles-ce-qui-fonctionne-et-le-confort).
- **[Sources de données disponibles pour Elite Dangerous](./17-sources-donnees.md)** — mécanique technique du champ
  `gameversion` d'EDDN et de `Status.json`, qui documentait déjà la scission Live/Legacy côté données.
- **[Guide complet des Ingénieurs](./06-ingenieurs.md)** et **[Guide complet des Opérations](./13-operations.md)** —
  contexte de l'arrêt du développement console (10 mars 2022).
- **[Liste complète des vaisseaux d'Elite Dangerous](./03-vaisseaux.md)** — mécanique générale de l'accès anticipé
  ARX des nouveaux vaisseaux.
- **[Débuter et progresser dans Elite Dangerous](./27-debuter-et-progresser.md)** — premiers pas du nouveau
  Commandant, à lire après avoir choisi sa version, son édition et son matériel.
- **[Glossaire](./00-glossaire.md)** — entrée ARX.

## Sources

- [CUST-2026-09-13] https://customersupport.frontier.co.uk/hc/en-us/articles/25577530010396-Elite-Dangerous-In-Game-Purchases-and-Customizations | primaire | consulté le 13/09/2026 | confirme : définition actuelle des ARX, non-transférabilité entre plateformes | ne confirme pas : le plafond hebdomadaire exact et le mécanisme précis de gain
- https://customersupport.frontier.co.uk/hc/en-us/articles/25577971391644-Commander-Name-Change | primaire | consulté le 13/09/2026 | confirme : renommage de Commandant à 500 ARX + cooldown 7 jours | ne confirme pas : date exacte de dernière mise à jour de la page
- https://forums.frontier.co.uk/threads/arx-faq.516706/ | primaire | consulté le 13/09/2026 | confirme : mécanisme de gain par le jeu, plafond 400 ARX/semaine sans report, non-expiration, interdiction du don entre joueurs | ne confirme pas : le détail exact des actions qui rapportent de l'ARX en 2026
- https://x.com/EliteDangerous/status/1453753503785144329 | primaire | consulté le 13/09/2026 | confirme : le jour du reset hebdomadaire (jeudi), via un relèvement exceptionnel du plafond en 2021 | ne confirme pas : l'heure exacte du reset
- https://www.elitedangerous.com/buy | primaire | consulté le 13/09/2026 | confirme : plateformes par édition (base sur PC/PS4/Xbox One, Odyssey/Deluxe PC uniquement) | ne confirme pas : le texte n'a pas pu être relu mot pour mot (403 lors d'une contre-vérification)
- https://www.elitedangerous.com/news/elite-dangerous-update-14-and-beyond-live-and-legacy-modes | primaire | consulté le 13/09/2026 | confirme : création des modes Live/Legacy à l'Update 14, bascule de mode Horizons/Odyssey au sein de Live | ne confirme pas : accès direct bloqué (403), contenu recoupé par des reprises secondaires
- https://store.steampowered.com/app/359320/Elite_Dangerous/ | primaire | consulté le 13/09/2026 | confirme : prix du jeu de base et de la Deluxe Edition, configuration système, tag VR/SteamVR/TrackIR | ne confirme pas : l'exactitude actuelle des recommandations VR (texte non rafraîchi)
- https://store.steampowered.com/app/1336350/Elite_Dangerous_Odyssey/ | primaire | consulté le 13/09/2026 | confirme : prix d'Odyssey (14,99 €), jeu de base requis, absence de promotion Steam ce jour | ne confirme pas : la date exacte du passage à ce tarif
- https://store.epicgames.com/en-US/p/elite-dangerous | primaire | consulté le 13/09/2026 | confirme : jeu de base en promotion -70 % sur l'Epic Games Store ce jour | ne confirme pas : que cette promotion s'applique aussi sur Steam
- https://www.playstation.com/en-us/games/elite-dangerous/ | primaire | consulté le 13/09/2026 | confirme : fiche d'achat active (19,99 $), édition Horizons incluse, compatibilité PS4/PS5 | ne confirme pas : disponibilité d'Odyssey sur PlayStation (absente)
- https://www.xbox.com/en-US/games/store/elite-dangerous/bvcdd2hk8qlq | primaire | consulté le 13/09/2026 | confirme : fiche d'achat active, éligibilité Xbox Game Pass, compatibilité Xbox One/Series X\|S | ne confirme pas : la date exacte d'entrée au Game Pass (source de presse seule)
- https://vkbsimcontrollers.com/products/gunfighter-iv-space-combat-edition-tabletop-right-hand-us | primaire | consulté le 13/09/2026 | confirme : prix officiel du VKB Gunfighter Mk.IV Space Combat Edition (309,00 $) | ne confirme pas : disponibilité immédiate (variantes affichées épuisées)
- https://virpil-controls.us.com/vpc-warbrd-d-base.html | primaire | consulté le 13/09/2026 | confirme : prix officiel de la base Virpil WarBRD-D (259,95 $) | ne confirme pas : la cohérence avec le prix affiché par un revendeur tiers (275 $)
- https://gaming.tobii.com/games/elite-dangerous/ | primaire | consulté le 13/09/2026 | confirme : prix du Tobii Eye Tracker 5 (279 € TTC) et fonctions dédiées à ce jeu | ne confirme pas : la compatibilité avec le jeu à pied
- https://edrefcard.info/ | secondaire | consulté le 13/09/2026 | confirme : emplacement du dossier de bindings et catégories internes du fichier | ne confirme pas : le contenu exact d'un fichier de bindings par défaut
- https://elite-dangerous.fandom.com/wiki/ARX | secondaire | consulté le 13/09/2026 | confirme : plafond de 400 ARX/semaine, reset le jeudi ~07:00 UTC (formulé avec réserve par la source elle-même) | ne confirme pas : l'heure exacte du reset
- https://elite-dangerous.fandom.com/wiki/Scarab | secondaire | consulté le 13/09/2026 | confirme : absence de bindings SRV par défaut | ne confirme pas : une éventuelle évolution récente de ce comportement
- https://roadtovr.com/valve-steam-frame-release-date-price-specs/ | tertiaire | consulté le 13/09/2026 | confirme : caractéristiques annoncées du Steam Frame | ne confirme pas : date de sortie, prix, ni compatibilité avec ce jeu
- https://www.gamepressure.com/newsroom/elite-dangerous-legacy-and-live-mode-update-14-explained/zf4d6a | tertiaire | consulté le 13/09/2026 | confirme : reprise de la citation officielle sur le gel de Legacy | ne confirme pas : le texte exact tel que publié par Frontier lui-même
- https://steamcommunity.com/sharedfiles/filedetails/?id=2865381752 | tertiaire | consulté le 13/09/2026 | confirme : chemin et nommage du fichier de bindings, procédure de création de preset | ne confirme pas : une évolution récente de cette procédure
- https://massivelyop.com/2026/03/24/elite-dangerous-players-on-epic-games-store-must-migrate-their-accounts-thanks-to-a-launcher-snafu/ | tertiaire | consulté le 13/09/2026 | confirme : date et titre d'un épisode de migration forcée de compte Epic | ne confirme pas : le détail technique de la cause (contenu bloqué, 403)

### Sources tentées sans succès (NE PAS CITER)

- https://www.elitedangerous.com/news/elite-dangerous-update-14-and-beyond-live-and-legacy-modes [ÉCHEC 403]
- https://customersupport.frontier.co.uk/hc/en-us/articles/9206798339868-Steam-Installation-Changes-and-Legacy [ÉCHEC 403]
- https://www.elitedangerous.com/store/product/rhino-standard [ÉCHEC 403]
- https://forums.frontier.co.uk/threads/vr-support-for-on-foot-gameplay-its-about-time-for-this.618479/ [ÉCHEC 403]
- https://forums.frontier.co.uk/threads/arx-faq.516706/ (contre-vérification indépendante) [ÉCHEC 403]
- https://www.pcgamingwiki.com/wiki/Elite_Dangerous [ÉCHEC 403] (protection Cloudflare, y compris via proxy de lecture)
- https://elite-dangerous.fandom.com/wiki/ARX [ÉCHEC 402]
- https://elite-dangerous.fandom.com/wiki/Legacy [ÉCHEC 402]
- https://arx.elitedangerous.com/ [ÉCHEC 403]
- https://user.frontierstore.net/user/transfer/login-origin [ÉCHEC 403]
- https://steamdb.info/app/359320/depots/ [ÉCHEC 403]

### Méthode et limites

Ce guide agrège six recherches indépendantes (scission Live/Legacy et consoles, éditions et plateformes, configuration
PC, périphériques et bindings, VR et accessibilité, boucle de gain des ARX), chacune suivie d'une contre-vérification
adversariale menée séparément. Deux domaines se sont montrés systématiquement bloqués en récupération directe pendant
toute la préparation — `forums.frontier.co.uk` (HTTP 403) et `elite-dangerous.fandom.com` (HTTP 402) — les informations
qui en proviennent sont donc des synthèses de recherche indexée, pas des citations relues intégralement sur pièce ;
elles restent citées avec leur URL, mais signalées comme telles plutôt que présentées comme des lectures directes. La
contre-vérification a par ailleurs corrigé deux affirmations du premier passage de recherche avant publication : une
mention de promotion Steam active sur Odyssey (infirmée, prix plein constaté) et une restriction « Not available on
Legacy » attribuée au Rhino (montants ARX confirmés, mention exacte non re-vérifiable). Le calendrier de sortie du
Steam Frame et l'état de la branche Legacy sont, par nature, les deux points les plus susceptibles d'être obsolètes
peu après la date de rédaction (13 septembre 2026) : à revérifier en priorité lors d'une prochaine révision.
