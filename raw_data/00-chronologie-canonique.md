---
id: 00-chronologie-canonique
titre: "Chronologie canonique — Elite Dangerous"
domaine: transversal
entites: [Operations Update, Nomad, SRV Rhino, Kestrel Mk II, Lynx Highliner, Caspian Explorer, Panther Clipper Mk II, Powerplay 2.0, Thargoid War Epilogue, Vessel Hangar, Dodec Update, Colonia, Kickstarter, Horizons, Beyond, Odyssey, Fleet Carriers Update, Supercruise Overcharge, Ascendancy, registre d'incertitudes, MassivelyOP]
mots_cles_en: [operations update, nomad, rhino srv, vessel hangar, kestrel mk ii, lynx highliner, caspian explorer, thargoid war epilogue, powerplay 2.0, dodec update, patch notes, shipyard, kickstarter, horizons, beyond, odyssey, fleet carriers update, supercruise overcharge, version history, ascendancy]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-13
confiance_globale: haute
volatilite: moyenne
sources_primaires: [Steam News Frontier (App ID 359320), elitedangerous.com, EDCD/FDevIDs, EDCD/coriolis-data, Inara.cz, GalNet, Wayback Machine, Wikipédia, wiki Fandom mirroré (DarkSession/Elite-Dangerous-RAG-Knowledge), presse spécialisée d'époque (PC Gamer, Massively Overpowered, TheSixthAxis, Engadget)]
zones_incertaines: ["rattachement du numéro 4.4.0.3 au billet du 9 juillet 2026, plausible mais non prouvé — le billet se contredit sur son propre numéro", "date de fin d'accès anticipé ARX du Panther Clipper Mk II, non confirmée", "date exacte de destruction du Titan Raijin, antérieure au 5 décembre 2024 sans plus de précision", "baie Mk I ou Mk II exigée par le SRV Rhino, non tranchée par une source primaire", "plafond de 9 999 Merc Coins et allocation de 1 000 par semaine, de source communautaire seulement", "numéros de version 4.4.1.0 et 4.4.1.1 de septembre 2026, issus de pages officielles restées inaccessibles", "jour exact de la fin du Kickstarter (4 ou 5 janvier 2013 selon la source)", "terminologie exacte distinguant « Premium Beta » de « Beta 1 » en 2014", "retrait ou non du jeu des stores consoles après l'arrêt du développement, mars 2022 : non confirmé"]
guides_lies: [1, 3, 7, 13, 14, 15, 18, 19, 20, 25, 27]
---
# Chronologie canonique — Elite Dangerous

## En bref

Ce document arbitre les dates et faits d'*Elite Dangerous* sur lesquels les guides du dépôt se contredisaient : **quatorze faits** y sont tranchés, sourcés en priorité sur le flux **Steam News** de Frontier
(*Steam App ID 359320*), qui republie les annonces d'elitedangerous.com. Principales réponses :
**Powerplay 2.0** avec *Ascendancy* le **31 octobre 2024** ; bêta de la **Colonisation** (*Trailblazers*, 4.1.0.0) le
**26 février 2025**, sortie complète le **11 novembre 2025** (*Dodec Update*, 4.2.2.0) ; mise à jour **Operations**
(4.4.0.0) le **30 juin 2026**, avec le **Nomad**, premier *ship-launched vessel* (SLV) du jeu ; **Kestrel Mk II** le
24 février 2026 ; **Lynx Highliner** (Zorgon Peterson) le 28 avril 2026 ; **Caspian Explorer** le 2 décembre 2025 ;
**SRV Rhino** le 2 septembre 2026 ; **Thargoid War Epilogue** le **19 décembre 2024 à 15:00 UTC** ; fondation de
**Colonia** le 9 septembre 2016 ; *Fighter Hangar* renommé **Vessel Hangar** (Mk I sur 13 vaisseaux, Mk II sur 3) ; et
**48 vaisseaux jouables** au chantier naval (*shipyard*). En cas de conflit avec un autre fichier du dépôt, ce document prévaut.
Les sigles employés ici (SLV, PP, BGS...) sont développés dans le [Glossaire](./00-glossaire.md). Une **chronologie
complète du jeu** (Kickstarter 2012 → aujourd'hui, 43 jalons datés et sourcés) a été ajoutée le 13 septembre 2026 ; elle
corrige au passage trois dates qui circulaient ailleurs dans le corpus — le Fleet Carrier date du **9 juin 2020** (pas
le 9 avril, qui n'est que le début de sa première bêta), et le **Supercruise Overcharge** a été généralisé par les
**Updates 18.02 et 18.04** d'avril-mai 2024 (pas par Ascendancy ni par l'Update 17).

## Note d'usage — portée de ce document et règles d'arbitrage du corpus

Ce document fait **foi** pour toute date, tout nom de fabricant ou toute affirmation factuelle citée **ailleurs dans le dépôt** et qui serait contredite par ce qui suit. Sa portée n'est pas limitée aux guides markdown de `raw_data/` : elle couvre aussi les guides structurés livrés avec l'application Flutter (`assets/guides/*.json`) et les jeux de données qui les accompagnent (`assets/data/*.json`). Un même fait daté ne peut recevoir deux réponses selon le fichier qui le porte ; c'est cette table qui arbitre, quel que soit le corpus d'origine de la divergence. Le document a été produit par un travail de réconciliation croisant plusieurs sources primaires et secondaires (billets officiels Frontier Developments relayés sur Steam News, pages officielles elitedangerous.com, GalNet, bases communautaires Inara.cz et EDCD/FDevIDs, dépôts techniques EDCD, Wikipédia) afin de trancher des contradictions relevées entre différents guides.

Règles d'usage :

- **En cas de conflit** entre une date/un fait donné dans un autre fichier du dépôt — `raw_data/` ou `assets/` — et une entrée de la table ci-dessous, **c'est la réponse canonique de ce document qui prévaut**.
- La colonne **Confiance** indique le niveau de certitude de la réconciliation : *haute* (plusieurs sources primaires convergentes), *moyenne* (corroboration indirecte ou partielle), *non confirmé* (aucune source fiable trouvée — le fait d'origine est probablement erroné ou fabriqué, à traiter avec prudence plutôt qu'à corriger par une valeur de remplacement).
- Pour les entrées à confiance *non confirmé*, ne pas réintroduire l'une ou l'autre des dates contradictoires d'origine dans les guides : signaler plutôt l'absence de confirmation.
- Le détail des sources et du raisonnement complet pour chaque fait se trouve dans la section « Détails par fait » après la table.
- **Ce document est révisable, et il a déjà été révisé contre lui-même.** Une entrée *non confirmé* n'est pas un verdict d'inexistence : c'est l'état d'une recherche à une date donnée. Les faits 3 et 8 concluaient le 8 septembre 2026 à l'inexistence de la mise à jour « Operations » et du vaisseau « Nomad » ; une vérification du 9 septembre 2026 a établi que ces deux conclusions étaient fausses et que les guides applicatifs de `assets/guides/` avaient raison contre `raw_data/`. Les entrées ont été inversées. Aucune règle d'arbitrage du dépôt ne doit donc faire primer automatiquement ce document sur un autre corpus : c'est le sourçage produit, et non le fichier d'origine, qui tranche.

Règles de méthode, ajoutées le 9 septembre 2026 à la suite de cette révision :

- **L'absence d'une entité dans un catalogue ne vaut réfutation que si le catalogue est censé la contenir.** C'est la
  leçon centrale de l'épisode « Nomad » ; elle est formulée en procédure opposable dans la section
  « [Règle de méthode : ce que prouve une absence](#règle-de-méthode--ce-que-prouve-une-absence) » ci-dessous, qui
  doit être appliquée avant toute conclusion d'inexistence portée dans ce document.
- **Le silence d'une documentation technique n'est pas une réfutation lorsqu'il s'explique par l'implémentation.** `elite-journal.readthedocs.io` ne décrit aucun drapeau dédié aux SLV, et `EDCD/coriolis-data` ne connaît pas le Nomad : dans les deux cas c'est attendu (le Nomad réemploie le drapeau SRV existant, et Coriolis ne modélise ni SLF, ni SRV, ni SLV), donc non informatif.
- **Quand les sources primaires renvoient 403, utiliser le flux Steam News de Frontier comme point d'accès de repli.** L'endpoint `https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320&maxlength=0` republie intégralement, et sans blocage anti-bot, les annonces officielles publiées sur elitedangerous.com. `maxlength=0` renvoie le corps complet des billets (notes de version comprises) et non un extrait tronqué. Ce point d'accès aurait suffi à éviter l'erreur des faits 3 et 8 ; il est à interroger **avant** de conclure à une absence de source.
- Limite méthodologique générale : plusieurs domaines officiels (elitedangerous.com, forums.frontier.co.uk, community.elitedangerous.com) et certains wikis communautaires (fandom) ont renvoyé des erreurs HTTP 403/402 (blocage anti-bot) lors des vérifications. Les conclusions s'appuient donc, quand la source officielle directe n'était pas accessible, sur des mirroirs fiables et mutuellement cohérents (Steam News de Frontier, archives Wayback Machine, Inara.cz, EDCD/FDevIDs, Wikipédia).

## Relevé du flux d'annonces officielles Frontier (Steam News) — Elite Dangerous, année 2026

Relevé du 9 septembre 2026 sur le flux Steam News d'Elite Dangerous (Steam App ID 359320), interrogé via
`api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320&maxlength=0`, qui republie mot pour mot les annonces de
Frontier Developments. Douze billets y figurent pour l'année 2026, dont dix de Frontier et deux relais de presse. Les
horodatages sont ceux du flux, en UTC. Cette table sert de repère chronologique unique : chaque fait daté de 2026 cité
ailleurs dans le dépôt doit pouvoir s'y raccrocher.

### Les douze billets de 2026 relevés sur le flux Steam News

| Date (UTC)             | Billet                                                | Origine   | Ce qu'il établit                                                                                       |
|------------------------|-------------------------------------------------------|-----------|--------------------------------------------------------------------------------------------------------|
| 17 févr. 2026 10:06    | « Elite Dangerous \| Developer Log »                  | Frontier  | Dev log de février : annonce du premier vaisseau de l'année et point d'étape sur Operations.            |
| 20 févr. 2026 00:15    | Article PC Gamer sur les récits joueurs               | Presse    | Relais de presse, sans valeur chronologique pour le jeu.                                                |
| 24 févr. 2026 12:21    | « Elite Dangerous \| Kestrel Mk. II Update »          | Frontier  | « The Kestrel Mk II Update is now live » — sortie du Kestrel Mk II (fait 6).                            |
| 22 avr. 2026 14:02     | « Elite Dangerous \| An Update on Operations »        | Frontier  | Report d'Operations, « which will now be arriving in June » ; annonce du Lynx Highliner (faits 3 et 7). |
| 25 avr. 2026 17:50     | Article PCGamesN sur le report d'Operations           | Presse    | Corrobore le report ; source secondaire.                                                                |
| 28 avr. 2026 13:11     | « Elite Dangerous \| Lynx Highliner Update Notes »    | Frontier  | Sortie du Lynx Highliner, « crafted by the experts at Zorgon Peterson » (fait 7).                       |
| 2 juin 2026 13:03      | « Discover the Nomad »                                | Frontier  | Premier dévoilement du Nomad, sortie annoncée pour le 30 juin 2026 (fait 8).                            |
| 1ᵉʳ juil. 2026 14:01   | « Elite Dangerous \| Operations Update »              | Frontier  | Notes de version complètes de la sortie du 30 juin 2026 (faits 3, 8 et 13).                             |
| 9 juil. 2026 10:24     | « Elite Dangerous \| Operations Update \| Update 3 »  | Frontier  | Correctifs, dont deux nommant le Nomad ; restauration des données d'exploration perdues.                |
| 6 août 2026 14:19      | « Beneath the Surface: Your First Look at the Rhino » | Frontier  | Dévoilement du Rhino et du minage de surface ; le Nomad y sert de point de comparaison (fait 4).        |
| 27 août 2026 10:04     | « Elite Dangerous \| August Dev Log »                 | Frontier  | Premières images du Rhino, détails sur le minage de surface, aperçu de la prochaine opération.          |
| 2 sept. 2026 11:20     | « Elite Dangerous \| Rhino SRV Update »               | Frontier  | Sortie du Rhino, minage de surface, treize marchandises, opération « Under Siege » (faits 3 et 4).      |

### Versions du jeu établies pour 2026 : 4.4.0.0 et 4.4.0.3

Deux numéros de version seulement sont étayés pour l'été 2026 :

| Version     | Date               | Ce qui l'établit                                                                                             |
|-------------|--------------------|--------------------------------------------------------------------------------------------------------------|
| **4.4.0.0** | 30 juin 2026       | Page officielle `elitedangerous.com/news/updates/4-4-0-0` (« Operations - Available Now »), sortie du jour.  |
| **4.4.0.3** | 9 juillet 2026 (?) | Relevé dans un journal de jeu réel du 5 août 2026 ; rattachement à l'« Update 3 » plausible mais non prouvé. |

La correspondance entre 4.4.0.3 et le billet du 9 juillet 2026 repose sur la seule concordance du suffixe avec le mot
« Update 3 » du titre. Elle est fragilisée par une incohérence interne au billet lui-même : son titre annonce
« Update 3 » là où son corps écrit « The Operations Update 2 is now live ». Le numéro **4.4.0.3** est donc à citer comme
la dernière version attestée de l'été 2026, et non comme la version datée du 9 juillet. Aucun numéro n'est étayé pour
le Kestrel Mk II, le Lynx Highliner ni le *Rhino SRV Update* : les numéros 4.4.1.0 et 4.4.1.1 qui ont circulé pour
septembre 2026 proviennent de pages officielles restées inaccessibles (HTTP 403) et ne doivent pas être repris.

**Sources :**
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320&maxlength=0 (flux officiel Frontier
  Developments, corps complet des douze billets de 2026 ; relevé du 9 septembre 2026)
- https://www.elitedangerous.com/news/updates/4-4-0-0 (page officielle « Elite Dangerous: Operations - Available Now » ;
  URL et titre seuls, page non récupérée directement — HTTP 403 sur ce domaine)
- https://github.com/EDCD/EDDI/issues/2849 (journal de jeu réel du 5 août 2026 portant `gameversion` 4.4.0.3)

## Chronologie complète du jeu, du Kickstarter (2012) à aujourd'hui (2026)

Ajoutée le 13 septembre 2026. Les quatorze faits ci-dessous arbitrent des contradictions ponctuelles ; cette table
a un objet différent — situer chacun de ces faits, et tous les autres guides du corpus, sur un **axe unique et
continu** couvrant treize ans de développement. Elle a été construite par recherche croisée (au moins deux sources
indépendantes quand c'était possible), pas depuis la mémoire d'un modèle de langage : les dates antérieures à 2022
n'étaient pas vérifiables autrement, et trois d'entre elles corrigent une hypothèse antérieure du corpus (voir les
notes sous la table).

| Date réelle | Date in-jeu | Version | Mise à jour | Contenu structurant |
|---|---|---|---|---|
| 5 nov. 2012 | — | — | Lancement du Kickstarter | Objectif 1 250 000 £ |
| 4 janv. 2013 | — | — | Fin du financement | 25 681 souscripteurs, 1 578 316 £ (126 % de l'objectif) |
| 20 déc. 2013 | — | Alpha | Premier Alpha livré aux souscripteurs (250 £ et plus) | |
| 30 mai 2014 | — | Premium Beta | Sortie de l'Alpha, accès élargi | |
| 30 juil. 2014 | — | Beta 1 | | |
| 3 oct. 2014 | — | Beta 2 | | |
| 30 oct. 2014 | — | Beta 3 | | |
| 24 nov. 2014 | — | Gamma | Pré-lancement | |
| **16 déc. 2014** | fin 3300 | **1.0** | **Sortie officielle** | « Welcome to the Galaxy, CMDR » |
| 10 févr. 2015 | 3301 | 1.1 | Community Goals | |
| 10 mars 2015 | 3301 | 1.2 | Wings | Multijoueur en petit groupe |
| 5 juin 2015 | 3301 | 1.3 | Powerplay | 3 vaisseaux (Imperial Courier, Diamondback Scout/Explorer) |
| 6 oct. 2015 | 3301 | 1.4 | CQC | Arène PvP arcade, sortie simultanée Xbox One |
| 15 déc. 2015 | 3301 | **2.0 « Horizons »** | Planetary Landings | Premier atterrissage planétaire, SRV Scarab |
| 26 mai 2016 | 3302 | 2.1 | The Engineers | Système d'ingénierie |
| 25 oct. 2016 | 3302 | 2.2 | The Guardians | Passagers, chasseurs largables, premières ruines Guardian |
| 11 avr. 2017 | 3303 | 2.3 | The Commanders | Multicrew, Holo-Me |
| 26 sept. 2017 | 3303 | 2.4 | The Return | Retour officiel des Thargoïdes |
| 27 févr. 2018 | 3304 | **3.0 « Beyond » Ch. 1** | | Alliance Chieftain, refonte Crime & Punishment, 1ʳᵉ refonte de l'ingénierie |
| 28 juin 2018 | 3304 | 3.1 Beyond Ch. 2 | | **Krait Mk II**, Alliance Challenger |
| 28 août 2018 | 3304 | 3.2 Beyond Ch. 3 | | Chasseurs hybrides Guardian, **Guardian Beacons**, ingénieurs de Colonia |
| 11 déc. 2018 | 3304 | 3.3 Beyond Ch. 4 | | **Codex**, **FSS**, Squadrons, refonte complète du minage ; fin du support Mac |
| **13 janv. 2019** | 3305 | — | **Distant Worlds II** | Voir [01-lore.md §7.2](./01-lore.md) |
| **9 juin 2020** | 3306 | **3.7** | **Fleet Carriers Update** | Drake-Class Carrier (voir correction ci-dessous) |
| **19 mai 2021** | 3307 | **4.0 « Odyssey »** | Sortie PC seule | Combat et vie à pied |
| 10 mars 2022 | 3307 | — | Fin du développement console | Annulation du portage Xbox One/PS4, branche Legacy figée en v3.8 |
| 9 août 2022 | 3308 | Update 13 | Fusion des branches Horizons/Odyssey (Live 4.0+) | Conclut l'arc Salvation/Azimuth |
| 29 nov. 2022 | 3308 | Update 14 | Apparition des 8 Maelstroms | Début de la Seconde Guerre Thargoïde moderne |
| 9 mai 2023 | 3309 | Update 15 | Titans atteignables (Thargoid Pulse Neutraliser) | |
| 1er août 2023 | 3309 | Update 16 | Thargoïde Scythe, évacuations de passagers | |
| 16 oct. 2023 | 3309 | Update 17 | Minage des matériaux de Titan | *(n'introduit pas le SCO, voir correction)* |
| 26 févr. 2024 | 3310 | Update 18 | Guardian Nanite Torpedo Pylons | Permet la destruction du premier Titan (Taranis, 2 mars 2024) |
| 10 avr. 2024 | 3310 | Update 18.02 | Premiers FSD **SCO**, en nombre limité (notation C) | |
| 7 mai 2024 | 3310 | Update 18.04 | **Généralisation du SCO** à toutes tailles/notations | Sortie simultanée du Python Mk II |
| 7 août 2024 | 3310 | Update 18.08 | Refonte de l'ingénierie (rolls fixes par grade) | Vaisseau Type-8 Transporter |
| **31 oct. 2024** | 3310 | Update 19 « **Ascendancy** » | **Powerplay 2.0** | Vaisseau Mandalay (fait 1) |
| 5 déc. 2024 | 3310 | — | *Titan Presence In Sol* | Invasion de Sol par Cocijo (fait 12) |
| 12 déc. 2024 | 3310 | — | Cobra Mk V Update | 10ᵉ anniversaire du jeu |
| **19 déc. 2024** | 3310 | — | *Thargoid War Epilogue* | Fin de la Seconde Guerre Thargoïde (fait 11) |
| **26 févr. 2025** | 3311 | 4.1.0.0 « Trailblazers » | Bêta de la Colonisation (fait 2) | |
| 19 août 2025 | 3311 | — | « Vanguards » | Refonte des Squadrons (voir [15-roadmap.md](./15-roadmap.md)) |
| **11 nov. 2025** | 3311 | 4.2.2.0 « Dodec Update » | Fin de la bêta de Colonisation (fait 2) | |
| 2 déc. 2025 | 3311 | 4.3.0.0 | Caspian Explorer (fait 5) | |
| 24 févr. 2026 | 3311 | 4.3.1.0 | Kestrel Mk II (fait 6) | |
| 28 avr. 2026 | 3311 | 4.3.3.0 | Lynx Highliner (fait 7) | |
| **30 juin 2026** | 3312 | **4.4.0.0 « Operations »** | Nomad (faits 3, 8, 13) | |
| 2 sept. 2026 | 3312 | — | Rhino SRV Update | Rhino, minage de surface (fait 4) |

*Cases en gras : jalons majeurs (sorties, extensions payantes ou refontes structurantes). Dates in-jeu calculées par
le décalage constant de +1286 ans (voir « En bref ») ; laissées à « — » avant le lancement du jeu (2012-2014, années
purement réelles) ou quand aucune source datée en jeu n'a été retrouvée.*

### Trois corrections apportées par cette recherche, à ne pas réintroduire dans le corpus

1. **Le Fleet Carrier n'a pas été introduit le 9 avril 2020, mais le 9 juin 2020.** [19-fleet-carriers.md](./19-fleet-carriers.md)
   citait la phrase de l'article Wikipédia anglais « On 9 April 2020, Fleet Carriers were added to the game », corrigée
   par cette révision : le 9 avril 2020 est la date d'ouverture de la **première bêta fermée** (PC uniquement,
   7-20 avril 2020) ; une seconde bêta a suivi du 11 au 26 mai 2020 (PC/Xbox/PS4) ; la fonctionnalité n'a été livrée à
   tous les joueurs que le 9 juin 2020, avec la mise à jour v3.7 « Fleet Carriers Update ». Corrigé dans le guide cité.
2. **Le Supercruise Overcharge (SCO) n'a pas été introduit par Ascendancy, ni généralisé par l'Update 17.**
   [01-lore.md §1.9](./01-lore.md) attribuait par erreur au « Update 17 selon la documentation communautaire » la
   généralisation du SCO à toutes les Frame Shift Drives. L'Update 17 (16 octobre 2023) porte en réalité sur le minage
   des matériaux de Titan, sans rapport avec le SCO. Les premiers FSD SCO (nombre limité, notation C) datent de
   l'**Update 18.02** (10 avril 2024) ; la généralisation complète date de l'**Update 18.04** (7 mai 2024) — soit six
   mois avant Ascendancy (31 octobre 2024), qui introduit seulement un nouveau vaisseau nativement conçu pour cette
   technologie déjà généralisée (le Mandalay). Corrigé dans le guide cité.
3. **Le Full Spectrum Scanner (FSS) date de Beyond Chapter Four (11 décembre 2018), pas de Chapter Three.** Aucun
   guide du corpus n'affirmait le contraire au moment de cette recherche, mais le risque de confusion existait (les
   deux mises à jour Beyond de 2018 touchent toutes deux à l'exploration/à la découverte) : Chapter Three (28 août
   2018) introduit les chasseurs hybrides Guardian et les Guardian Beacons ; c'est Chapter Four qui fusionne les trois
   anciens scanners de découverte en un FSS unique, aux côtés du Codex, des Squadrons et de la refonte du minage.

### Limites de cette table

Les dates de 2012 à 2021 reposent sur des reprises secondaires convergentes (page « Version history » du wiki
communautaire, articles de presse spécialisée contemporains des sorties — PC Gamer, Engadget, TheSixthAxis,
Massively Overpowered, RoadToVR, Tom's Hardware) : `elitedangerous.com` a systématiquement renvoyé une erreur HTTP 403
aux tentatives d'accès direct pour cette période, comme pour le reste du corpus. Le contenu détaillé des Updates 15 et
16 n'a été vérifié que sur ses points saillants, pas ligne à ligne. Deux points mineurs restent non tranchés avec une
certitude absolue : le jour exact de la fin du Kickstarter (4 ou 5 janvier 2013 selon la source) et la terminologie
exacte distinguant « Premium Beta » de « Beta 1 » en 2014.

**Sources :**
- https://www.kickstarter.com/projects/1461411552/elite-dangerous (page de campagne, chiffres finaux)
- https://elite-dangerous.fandom.com/wiki/Version_history (miroir GitHub DarkSession/Elite-Dangerous-RAG-Knowledge — historique complet des versions 1.0 à 2.4)
- https://elite-dangerous.fandom.com/wiki/Elite_Dangerous:_Horizons et .../Elite_Dangerous:_Beyond et .../Elite_Dangerous:_Odyssey (miroirs GitHub — contenu détaillé de chaque saison)
- https://www.pcgamer.com/elite-dangerous-leaves-alpha-may-30-gets-shipped-to-premium-beta-backers/
- https://www.pcgamer.com/elite-dangerous-is-finally-getting-fleet-carriers-in-june-with-beta-tests-next-month/ (correction n°1 ci-dessus)
- https://massivelyop.com/2015/06/05/elite-dangerous-launches-the-powerplay-update/
- https://www.thesixthaxis.com/2017/09/15/the-thargoids-are-back-in-the-elite-dangerous-2-4-the-return-update/
- https://www.thesixthaxis.com/2018/06/28/elite-dangerous-beyond-chapter-two-launches-today/
- https://www.engadget.com/elite-dangerous-developer-cancels-further-console-development-to-focus-on-pc-091405266.html
- https://massivelyop.com/2022/08/03/elite-dangerous-confirms-update-13-for-august-9-outlines-merging-of-horizons-and-odyssey-code-for-pc/
- https://massivelyop.com/2022/11/23/elite-dangerous-confirms-update-14-for-november-29-along-with-live-and-legacy-versions-of-the-sandbox/
- https://massivelyop.com/2023/05/09/elite-dangerous-update-15-goes-live-today-here-are-the-patch-notes/
- https://massivelyop.com/2023/07/26/elite-dangerous-dates-update-16-for-august-1-releases-an-updated-launcher-and-halts-investigation-of-some-bugs/
- https://massivelyop.com/2023/10/16/elite-dangerous-update-17-brings-forth-another-laundry-list-of-fixes-and-continued-tease-of-louder-rumbling/
- https://massivelyop.com/2024/02/26/elite-dangerous-update-18-adds-new-weapon-multiple-bug-fixes-and-the-end-game-of-the-thargoid-war/
- https://steamcommunity.com/games/elitedangerous/announcements/detail/4182229294572405790 (Update 18.02, SCO limité, 10 avril 2024)
- https://steamdb.info/patchnotes/14241962/ (Update 18.04, généralisation du SCO, 7 mai 2024)
- https://forums.frontier.co.uk/threads/elite-dangerous-type-8-update-18-08-wednesday-7th-august.627151/ (Update 18.08, 7 août 2024)
- https://forums.frontier.co.uk/threads/elite-dangerous-cobra-mk-v-update-12-december-2024.631517/
- https://simulationdaily.com/news/elite-dangerous-ascendancy-release-patch-notes/

## Table de réconciliation des faits datés du corpus

### Faits 1 à 3 — mises à jour majeures et versions du jeu

| Fait | Réponse canonique | Confiance | Sources (voir détails) |
|---|---|---|---|
| **1 — Powerplay 2.0 / Ascendancy** | Sortie le **31 octobre 2024**, dans le cadre de l'extension "Elite Dangerous: Ascendancy". Le 26 février 2025 est une date réelle mais correspond à une mise à jour différente ("Trailblazers"), probablement confondue par erreur avec Powerplay 2.0. | Haute | Steam News Frontier (billets d'annonce, report, confirmation de sortie, suivi) — [détails](#1-powerplay-20--ascendancy--date-de-sortie) |
| **2 — Colonisation de systèmes — dates bêta/sortie** | Bêta lancée le **26 février 2025** (mise à jour "Trailblazers", v4.1.0.0) ; le 28 février 2025 est la date du "System Colonisation Guide" explicatif, pas du lancement. Sortie complète le **11 novembre 2025** via le "Dodec Update" (v4.2.2.0), nom officiel bien réel. | Haute | elitedangerous.com (patch notes 4-1-0-0 et 4-2-2-0), Wikipédia — [détails](#2-colonisation-de-systèmes--dates-bêta-et-sortie-complète) |
| **3 — Mode "Operations"** | **Réel.** Mise à jour "Operations", version **4.4.0.0**, sortie le **30 juin 2026** (annonce Steam publiée le 1er juillet 2026), après un report annoncé le 22 avril 2026. Six opérations au lancement, transport par l'*Operation Runner*, modes *Mercenary* et *Powerplay*, monnaie *Merc Coin* et boutique *MercGear*. Une septième opération, "Under Siege", est ajoutée le 2 septembre 2026 par le *Rhino SRV Update*. Dernière version attestée de l'été 2026 : **4.4.0.3**. **Cette entrée inverse la réponse "non confirmé" du 8 septembre 2026**, fondée sur des sources muettes par construction. La date "fin juin 2024" reste, elle, sans fondement. | Haute | Steam News Frontier (billets des 22/04, 01/07, 09/07 et 02/09/2026, corps complet), elitedangerous.com/news/updates/4-4-0-0, EDCD/FDevIDs — [détails](#3-mode--operations---existence-version-4400-et-date-de-sortie-30-juin-2026) |

### Faits 5, 6, 7 et 9 — vaisseaux de chantier naval : fabricants et dates de sortie

| Fait | Réponse canonique | Confiance | Sources (voir détails) |
|---|---|---|---|
| **5 — Caspian Explorer** | C'est un **vaisseau** (grande classe, exploration longue distance, fabriqué par Zorgon Peterson), pas une combinaison ni un patch. Sorti le **2 décembre 2025** via ARX Early Access. La date "janvier 2025" (citée comme date de "patch" dans un guide) est erronée : le vaisseau n'existait pas encore dans les communications officielles avant fin novembre 2025. | Haute | elitedangerous.com/news (flux JSON brut) — [détails](#5-caspian-explorer--nature-vaisseau-dexploration-zorgon-peterson-et-date-de-sortie-2-décembre-2025) |
| **6 — Kestrel Mk II — date de sortie** | Vaisseau de combat léger de **Core Dynamics**, sorti le **24 février 2026** en accès anticipé ARX, par la mise à jour « Kestrel Mk. II Update ». La date « février 2025 » est une erreur d'un an. **Confiance relevée de *moyenne* à *haute* le 9 septembre 2026** : le billet officiel de Frontier daté du 24 février 2026 12:21 UTC (« The Kestrel Mk II Update is now live ») a été lu en source primaire, là où la version précédente ne disposait que d'un commit EDCD du lendemain. | Haute | Steam News Frontier (billet du 24/02/2026, corps complet), EDCD/FDevIDs (`shipyard.csv`, commit du 25/02/2026) — [détails](#6-kestrel-mk-ii--date-de-sortie) |
| **7 — Lynx Highliner — fabricant et date** | Fabriqué par **Zorgon Peterson** (et non Saud Kruger). Premier vaisseau de croisière/paquebot de ce fabricant, habituellement associé à des vaisseaux de combat — d'où la confusion probable avec Saud Kruger, fabricant "attendu" pour ce type de vaisseau. Sorti le **28 avril 2026** (« Lynx Highliner Update Notes »), en édition Standard **directement achetable en crédits** au chantier naval — cas inhabituel, offert par Frontier en compensation du report d'Operations. Capacité annoncée : 225 passagers ; cabines *Mk II Business & Economy*. | Haute | Steam News Frontier (billets des 22/04 et 28/04/2026, corps complet), Inara.cz, page officielle elitedangerous.com/store, annonce forums Frontier — [détails](#7-lynx-highliner--fabricant-zorgon-peterson-et-date-de-sortie) |
| **9 — Panther Clipper Mk II — date de sortie** | Disponible en jeu depuis le **22 juillet 2025** (ARX Early Access). C'est la toute première incarnation jouable du "Panther Clipper" (le vaisseau original n'était que du lore/teasing jamais rendu jouable), et non une évolution "Mk II" d'un précédent vaisseau jouable. La date de fin d'accès anticipé (passage en achat crédits in-game pour tous) n'a pas pu être confirmée avec certitude (probablement automne 2025). | Moyenne | Wayback Machine (elitedangerous.com/panther-clipper), Wikipédia, Inara.cz — [détails](#9-panther-clipper-mk-ii--date-de-sortie) |

### Faits 4, 8, 13 et 14 — véhicules embarqués, module de baie et décompte des vaisseaux

| Fait | Réponse canonique | Confiance | Sources (voir détails) |
|---|---|---|---|
| **4 — SRV Rhino — date de sortie** | Sorti le **2 septembre 2026** ("Rhino SRV Update"), confirmé par Frontier ("now live") et par l'article GalNet in-univers daté du 3 septembre 3312 (= 3 septembre 2026 réel). SRV de minage de **Vodel**, le plus grand du jeu, à trois places, déployé depuis la **baie de véhicule** et non par la trappe à cargo comme le Scarab et le Scorpion. La même mise à jour introduit le **minage de surface planétaire**, **treize marchandises** nouvelles et l'opération « Under Siege ». La date "août 2025" d'un guide est erronée (antérieure de plus d'un an à toute mention officielle du Rhino) ; le teaser du 6 août 2026 annonçait une arrivée « later this month » qui a glissé de quelques jours. | Haute | Steam News Frontier (billets des 06/08, 27/08 et 02/09/2026, corps complet), GalNet officiel — [détails](#4-srv-rhino--date-de-sortie) |
| **8 — Vaisseau "Nomad"** | **Réel.** Premier *Ship-Launched Vessel* (SLV) du jeu : petit véhicule utilitaire lancé depuis un vaisseau porteur et destiné à l'exploration des surfaces planétaires. Annoncé le **2 juin 2026** ("Discover the Nomad"), sorti le **30 juin 2026** en ARX Early Access avec la mise à jour Operations. Nom interne dans le journal : `Lander01`. Se déploie depuis une *Vessel Bay* **Mk I ou Mk II** (voir le fait 13). **Cette entrée inverse la réponse "non confirmé" du 8 septembre 2026** : celle-ci reposait sur l'absence du Nomad dans des catalogues qui, par construction, ne recensent aucun SLV. | Haute | Steam News Frontier (billets des 02/06 et 01/07/2026, corps complet), EDCD/FDevIDs, EDCoPilot v1.11.726, EDCD/EDDI #2849, EDCD/EDMarketConnector #2689 — [détails](#8-vaisseau--nomad---premier-ship-launched-vessel-slv-du-jeu-sorti-le-30-juin-2026) |
| **13 — Vessel Hangar — modules Mk I et Mk II** | Le module *Fighter Hangar* a été renommé **Vessel Hangar** (les notes de version emploient aussi *Vessel Bay*) ; le renommage est vérifiable dans les données extraites du jeu. Le **Mk I** existe en classes 5 à 7 et équipe **13 vaisseaux** ; le **Mk II** (*Mk II Vessel Hangar*) est limité à **trois vaisseaux** : Caspian Explorer, Panther Clipper Mk II, Type-11 Prospector. Le Nomad se déploie depuis **l'un ou l'autre** : la restriction à trois vaisseaux porte sur le module Mk II, **pas** sur le Nomad. Les guides `assets/guides/exploration-exobiologie.json` et `assets/guides/protocole-milliard.json` affirment le contraire et sont fautifs sur ce point précis. | Haute | Notes de version 4.4.0.0 (Steam News, corps complet), EDCD/FDevIDs (`outfitting.csv`, `sku.csv`) — [détails](#13-vessel-hangar--modules-mk-i-et-mk-ii) |
| **14 — Nombre de vaisseaux jouables** | **48 châssis pilotables achetables au chantier naval**, décompte relevé le **10 septembre 2026** et qui **fait autorité pour le corpus**. Les trois chiffres qui circulaient ne portaient pas sur le même périmètre : **48** = catalogue de chantier naval (`inara.cz/elite/ships/` et `EDCD/FDevIDs/shipyard.csv`, listes nominalement identiques, Lynx Highliner compris) ; **47** = modèles de vaisseaux de `EDCD/coriolis-data`, soit les mêmes **moins le Lynx Highliner**, non encore modélisé — ce décompte se rapporte donc à Coriolis et **jamais** à Inara ; **52** = relevé non reproductible, écarté. Ni les SRV (Scarab, Scorpion, Rhino), ni les chasseurs embarqués (SLF), ni les *ship-launched vessels* (SLV, dont le Nomad) n'entrent dans aucun de ces décomptes. | Haute | Relevés directs du 10 septembre 2026 sur inara.cz, EDCD/FDevIDs et EDCD/coriolis-data — [détails](#14-nombre-de-vaisseaux-jouables--périmètre-des-décomptes-47-48-et-52) |

### Faits 10, 11 et 12 — événements de lore et jalons de la guerre thargoïde

| Fait | Réponse canonique | Confiance | Sources (voir détails) |
|---|---|---|---|
| **10 — Fondation de Colonia / 10e anniversaire** | Colonia (Colonia Hub) a été fondée le **9 septembre 2016** (date réelle ; 9 septembre 3302 en date in-jeu), et non en septembre 2015 comme l'indique un guide — erreur d'un an. Le 10e anniversaire (juillet-août 2026) est authentique et cohérent avec 2016 + 10 = 2026. | Haute | Inara.cz (GalNet mirroré), dépôts communautaires GitHub, Wikipédia FR — [détails](#10-fondation-de-colonia--10e-anniversaire) |
| **11 — Thargoid War Epilogue — fin de la Seconde Guerre Thargoïde** | Le billet officiel Frontier *Thargoid War Epilogue* est daté du **19 décembre 2024, 15:00 UTC** sur le flux Steam News : « The last Titan, Cocijo, has fallen. The war is over. » C'est **la date de référence réelle**. La mention « janvier 2025 » de 01-lore.md (section 3.6) est à considérer comme imprécise, ou comme un contenu GalNet complémentaire diffusé après l'annonce — elle ne doit pas servir de date de référence. La date in-fiction « 26 mai 3310 » relevée sur Wikipédia est une date de lore, sans valeur chronologique réelle. | Haute | Steam News Frontier (billet *Thargoid War Epilogue*, horodatage brut), Wikipédia (date in-fiction) — [détails](#11-thargoid-war-epilogue--fin-de-la-seconde-guerre-thargoïde) |
| **12 — Titan Presence In Sol — invasion de Sol par Cocijo** | Le billet officiel Frontier *Titan Presence In Sol* est daté du **5 décembre 2024, 12:01 UTC** sur le flux Steam News : l'avant-dernier Titan, **Raijin**, vient d'être détruit et le dernier Titan survivant, **Cocijo**, entame l'invasion de Sol. Sol n'a donc été envahi qu'à partir du 5 décembre 2024, quatorze jours avant la fin de la guerre. | Haute | Steam News Frontier (billet *Titan Presence In Sol*, horodatage brut) — [détails](#12-titan-presence-in-sol--invasion-de-sol-par-cocijo) |

## Détails par fait : sources et raisonnement de chaque arbitrage

### 1. Powerplay 2.0 / Ascendancy — date de sortie

**Réponse canonique : 31 octobre 2024.**

La mise à jour Powerplay 2.0 fait partie de l'extension majeure "Elite Dangerous: Ascendancy" (avec le nouveau vaisseau Mandalay), lancée par Frontier Developments le jeudi 31 octobre 2024 (maintenance à partir de 06:00 GMT, serveurs de nouveau en ligne vers 15:00 GMT). Cette date a été confirmée en plusieurs étapes par les annonces officielles de Frontier sur le canal Steam News du jeu (identique au contenu diffusé sur elitedangerous.com/GalNet) : une annonce initiale visant le 29 octobre 2024, un report à "la semaine du 28 octobre", puis une reprogrammation définitive au "jeudi 31 octobre", et enfin le message "Available Now!" confirmant la mise en ligne effective ce jour-là, avec la phrase "Featuring the all-new Powerplay 2.0 rework". Un billet de suivi publié le 21 novembre 2024 ("Ascendancy Update 1") confirme aussi que "Powerplay 2.0 has been out for a few weeks now", ce qui est cohérent avec un lancement fin octobre 2024.

Le 26 février 2025 est une date réelle dans l'historique d'Elite Dangerous, mais elle correspond à une mise à jour différente : "Trailblazers" (mécanique de colonisation de systèmes), annoncée via le billet officiel "Elite Dangerous | Trailblazers out now!" publié le 26 février 2025 (~15:46 UTC). Le guide communautaire donnant "26 février 2025" pour Powerplay 2.0/Ascendancy confond donc très probablement Powerplay 2.0 avec la mise à jour Trailblazers, sortie près de 4 mois plus tard.

Limite méthodologique : elitedangerous.com/update-notes et les forums Frontier (forums.frontier.co.uk) ont renvoyé une erreur HTTP 403 (blocage anti-bot) lors des tentatives d'accès direct, empêchant une citation littérale de la page officielle. La reconstitution s'appuie donc sur les billets officiels de Frontier Developments publiés sur le canal Steam News du jeu, qui reprennent verbatim les annonces faites sur le site officiel et sont mutuellement cohérents et convergents (annonce, report, reprogrammation, confirmation de sortie, suivi un mois après).

**Sources :**
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320 (flux officiel Frontier Developments pour Elite Dangerous, Steam App ID 359320)
- https://steamstore-a.akamaihd.net/news/externalpost/steam_community_announcements/6212245217911953485 ("Elite Dangerous: Ascendancy | New Release Date and Release Schedule", reprogrammation au jeudi 31 octobre 2024)
- https://steamstore-a.akamaihd.net/news/externalpost/steam_community_announcements/6146943657173903565 ("Elite Dangerous: Ascendancy | Available Now!", confirmation du lancement le 31 octobre 2024, mention explicite de Powerplay 2.0)
- https://steamstore-a.akamaihd.net/news/externalpost/steam_community_announcements/1783872411953157 ("Ascendancy Update 1 - 21st November", confirme que Powerplay 2.0 est sorti "a few weeks" avant le 21 novembre 2024)
- https://steamstore-a.akamaihd.net/news/externalpost/steam_community_announcements/1792751525978567 ("Trailblazers out now!", 26 février 2025 — met en évidence la mise à jour distincte probablement confondue avec Powerplay 2.0 par le second guide)
- https://en.wikipedia.org/wiki/Elite_Dangerous (consulté, ne mentionne pas Powerplay 2.0/Ascendancy explicitement)
- Tentatives infructueuses (403 Forbidden / blocage anti-bot) : https://www.elitedangerous.com/news, https://forums.frontier.co.uk

### 2. Colonisation de systèmes — dates bêta et sortie complète

**Réponse canonique : bêta le 26 février 2025 ; sortie complète le 11 novembre 2025 ("Dodec Update").**

Dates officielles confirmées directement sur elitedangerous.com (métadonnées CMS des pages de notes de mise à jour), corroborées par Wikipédia.

**Bêta (lancement) : 26 février 2025**, 11:00 UTC. La fonctionnalité "System Colonisation" est sortie en bêta dans le cadre de la mise à jour gratuite "Elite Dangerous: Trailblazers" (patch note "Elite Dangerous: Trailblazers – Available Now", publié le 2025-02-26T11:00:00+00:00, page https://www.elitedangerous.com/news/updates/4-1-0-0). La confusion avec le "28 février 2025" vient d'un article explicatif distinct, le "System Colonisation Guide", publié 2 jours plus tard (28 février 2025) sur le site officiel — ce n'est pas la date de lancement de la bêta elle-même, mais celle du guide qui l'accompagne. C'est cette double date (26 vs 28 février) qui a créé la contradiction, visible jusque dans l'article Wikipédia anglais lui-même qui cite les deux dans des phrases différentes.

**Lancement complet (sortie de bêta) : 11 novembre 2025**, 10:00 UTC, via la mise à jour officiellement nommée **"Elite Dangerous: Dodec Update"** (version 4.2.2.0, patch note publié le 2025-11-11T10:00:00+00:00, page https://www.elitedangerous.com/update-notes/4-2-2-0). Le texte officiel de Frontier dit explicitement : "The Dodec Update is now live. This update introduces the re-envisioned Dodec station via ARX early access, alongside a number of fixes and updates which signify the end of the System Colonisation Beta." Le nom "Dodec Update" est donc bien réel et officiel (contrairement à une première hypothèse d'invention communautaire) — il fait référence à la "Dodec station", une variante de station réintroduite avec cette mise à jour. Un correctif mineur "Dodec Update Patch 1" a suivi le 13 novembre 2025.

Résumé pour la base de connaissances : bêta = 26 février 2025 (le 28 février est la date du guide explicatif, pas du lancement) ; sortie complète = 11 novembre 2025 via le "Dodec Update" (v4.2.2.0), nom bien officiel malgré son caractère insolite.

**Sources :**
- https://www.elitedangerous.com/news/updates/4-1-0-0 (patch notes "Elite Dangerous: Trailblazers – Available Now", published-at 2025-02-26T11:00:00+00:00)
- https://www.elitedangerous.com/en-US/news/system-colonisation-guide ("System Colonisation Guide", published 28 February 2025 — explique la mise à jour Trailblazers)
- https://www.elitedangerous.com/update-notes/4-2-2-0 (redirige vers https://www.elitedangerous.com/news/updates/4-2-2-0, patch notes "Elite Dangerous: Dodec Update", published-at 2025-11-11T10:00:00+00:00, texte confirmant la fin de la bêta)
- https://en.wikipedia.org/wiki/Elite_Dangerous (article corroborant, avec citations vers les deux pages ci-dessus)

### 3. Mode « Operations » — existence, version 4.4.0.0 et date de sortie (30 juin 2026)

**Réponse canonique : mise à jour réelle. Version 4.4.0.0, sortie le 30 juin 2026.**

> **Révision du 9 septembre 2026 — cette entrée inverse la réponse précédente.** Jusqu'au 8 septembre 2026, ce document concluait ici : « Aucune source fiable ne confirme l'existence d'un mode multijoueur ou d'une fonctionnalité nommée "Operations" ». Cette conclusion était fausse. Elle reposait sur trois sources qui, par construction, ne pouvaient pas porter l'information (article Wikipédia généraliste, fil GalNet in-univers agrégé par Inara.cz, article Wikipédia consacré à Odyssey 2021) et sur des erreurs 403 sur les sources primaires — sans que le flux Steam News de Frontier, qui republie ces mêmes annonces sans blocage, ait été interrogé. Voir la règle de méthode correspondante dans la note d'usage ci-dessus, et le fait 8 pour l'erreur de catégorie jumelle.

#### Chronologie officielle d'Operations : du report d'avril 2026 à l'opération « Under Siege »

Les billets ci-dessous sont ceux de Frontier Developments, republiés intégralement sur le flux Steam News du jeu (Steam App ID 359320) :

- **22 avril 2026 — « Elite Dangerous | An Update on Operations »** : Frontier annonce le report de la mise à jour, « which will now be arriving in June », et décrit le système (jusqu'à 4 commandants, modes *Mercenary* et *Powerplay*, accès par les tableaux de missions).
- **2 juin 2026 — « Discover the Nomad »** : révélation du vaisseau qui accompagnera la mise à jour ; « The Nomad will launch in ARX Early Access alongside Operations on 30th June. » (voir le fait 8).
- **30 juin 2026 — sortie effective**, annoncée par le billet **« Elite Dangerous | Operations Update »** publié le 1er juillet 2026 sur le flux Steam News et contenant les notes de version complètes : « The Operations Update is here ». La page officielle correspondante est `elitedangerous.com/news/updates/4-4-0-0`, intitulée « Elite Dangerous: Operations - Available Now », ce qui fixe le numéro de version à **4.4.0.0**.
- **9 juillet 2026 — « Operations Update | Update 3 »** : correctifs, dont deux mentionnent nommément le Nomad. Ce billet restaure aussi les données d'exploration non vendues perdues lors de la maintenance du 2 juillet 2026, et annonce que les récompenses d'Operations manquantes seront attribuées rétroactivement. **Attention à une incohérence interne** : le titre annonce « Update 3 », le corps écrit « The Operations Update 2 is now live » — d'où la réserve sur le rattachement du numéro 4.4.0.3 à cette date (voir le relevé du flux d'annonces ci-dessus).
- **6 août et 27 août 2026** — dévoilement puis dev log du SRV Rhino : ces billets ne portent pas sur Operations, mais le premier confirme au passage un fait sur le Nomad (voir le fait 8).
- **2 septembre 2026 — « Rhino SRV Update »** : outre le SRV Rhino (fait 4), ce billet ajoute « New Operation "Under Siege" added » — une opération où l'escouade répond à l'appel de détresse d'un établissement planétaire, pour lever un blocus et neutraliser les forces qui tentent de s'en emparer. L'opération « Under Siege » est donc réelle et postérieure au lancement ; le corpus l'avait retirée comme non confirmée. Le même billet corrige plusieurs défauts d'Operations : plantage à la création d'une escouade Powerplay pendant un saut, discordances entre voix et texte dans *Rapid Response*, *Firestorm Rescue* et *Tactical Takedown*, refus d'accostage au mégavaisseau de *Reclamation Point*. Trois problèmes restent ouverts à cette date, dont l'un propre à Operations : « Under Siege Operation can sometimes complete early ».

#### Contenu d'Operations au lancement : six opérations, Operation Runner, Merc Coin et MercGear

D'après les notes de version du 1er juillet 2026, six opérations sont disponibles au lancement : **Tactical Takedown, Firestorm Rescue, Reclamation Point, Biohazard Takedown, Rapid Response, Terminal Prosecution**. L'équipe est transportée par un vaisseau dédié, l'**Operation Runner**. Deux modes de jeu, *Mercenary* et *Powerplay*, jusqu'à quatre commandants, matchmaking optionnel. La mise à jour introduit une monnaie, le **Merc Coin**, et une boutique associée, le **MercGear** (blueprints, points d'ancrage et modules pré-ingéniérés). Côté équipement, la section *outfitting* des notes indique « Nomad added to outfitting » et « Added Mk II Biological Scanner ».

#### Ce qui, dans Operations, reste non couvert par une source primaire Frontier

Le plafond de **9 999 Merc Coins avec une allocation de 1 000 par semaine** provient du wiki communautaire, et non d'une annonce Frontier : à conserver, mais à attribuer explicitement au wiki communautaire. Le guide `assets/guides/debuter-sans-combat.json` cite correctement le wiki comme source mais accompagne le chiffre d'un marqueur `[OFFICIEL]` qui est abusif et doit être rétrogradé.

#### Ce qui reste erroné sur Operations et ne doit pas être réintroduit

La date « fin juin 2024 » qui circulait dans le corpus ne correspond à rien et reste sans fondement — l'erreur d'origine était bien une erreur de date, doublée d'un doute injustifié sur l'existence même de la fonctionnalité. Par ailleurs, les noms d'opérations « Counter Attack » et « Burning Rescue », qui apparaissaient dans les communications d'avril 2026, étaient des intitulés provisoires : ils ont été remplacés au lancement par « Tactical Takedown » et « Firestorm Rescue ». En restaurant du contenu retiré, reprendre les notes de version du 1er juillet 2026, et non l'état pré-report d'avril 2026.

#### Conséquence pour le dépôt : sur Operations, `assets/guides/` avait raison contre `raw_data/`

Sur ce sujet, ce sont les guides de `assets/guides/` qui avaient raison sur le fond et `raw_data/` qui s'est trompé. Les fichiers de `raw_data/` qui affirment activement la non-existence d'« Operations » doivent être restaurés et corrigés, et non conservés en l'état : voir la liste au fait 8. Aucun contenu de `assets/guides/` ne doit être supprimé au motif que `raw_data/` le contredisait.

**Sources :**
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320&maxlength=0 (flux officiel Frontier Developments, corps complet des billets : « Elite Dangerous | An Update on Operations » du 22 avril 2026 ; « Discover the Nomad » du 2 juin 2026 ; « Elite Dangerous | Operations Update » du 1er juillet 2026, notes de version complètes ; « Operations Update | Update 3 » du 9 juillet 2026 ; « Elite Dangerous | Rhino SRV Update » du 2 septembre 2026, ajoutant l'opération « Under Siege »)
- https://www.elitedangerous.com/news/updates/4-4-0-0 (« Elite Dangerous: Operations - Available Now » — page officielle non récupérée directement, HTTP 403 attendu sur ce domaine ; l'URL et son titre confirment le numéro de version 4.4.0.0)
- https://elite-dangerous.fandom.com/wiki/Operations (wiki communautaire — source du plafond Merc Coin 9 999 / 1 000 par semaine, accès direct bloqué HTTP 402)
- Sources ayant produit la conclusion erronée du 8 septembre 2026, conservées ici pour mémoire méthodologique : https://en.wikipedia.org/wiki/Elite_Dangerous, https://en.wikipedia.org/wiki/Elite_Dangerous:_Odyssey, https://inara.cz/elite/news/ (fil GalNet in-univers, qui ne couvre pas les mises à jour techniques), https://forums.frontier.co.uk/forums/elite-dangerous.6/ (bloqué, HTTP 403), https://www.elitedangerous.com/ (bloqué, HTTP 403), https://elite-dangerous.fandom.com/ (bloqué, HTTP 402)

### 4. SRV Rhino — date de sortie

**Réponse canonique : 2 septembre 2026.**

Le SRV 'Rhino' d'Elite Dangerous est sorti le 2 septembre 2026 (mise à jour "Rhino SRV Update", annoncée par Frontier comme "now live" ce jour-là). Cette date est corroborée par le fil officiel GalNet in-univers, dont l'article "Vodel Reveals New SRV Rhino" est daté du 3 septembre 3312 — soit le 3 septembre 2026 en date réelle, compte tenu du décalage constant de +1286 ans utilisé depuis le lancement du jeu (2014 réel = année in-jeu 3300). Un teaser officiel du 6 août 2026 ("Beneath the Surface: Your First Look at the Rhino") annonçait une arrivée "plus tard ce mois-ci" (donc encore en août 2026), mais la sortie effective (mise en ligne du patch) a eu lieu début septembre 2026, pas en août. La date "2 septembre 2026" d'un guide communautaire est donc correcte ; la date "août 2025" d'un autre guide est erronée (elle précède de plus d'un an toute mention officielle connue du Rhino, dont la toute première trace publique est le teaser d'août 2026).

**Ce que la mise à jour apporte, d'après les notes de version du 2 septembre 2026.** Le Rhino est le SRV de minage de
**Vodel** : trois places en cockpit, blindage lourd, et trois modules propres — un **Planetary Mining Deposit Scanner**,
une **raffinerie** embarquée et un **Mining Rig Deployment Module**. Il inaugure une mécanique entière, le **minage de
surface planétaire** : le *Detailed Surface Scanner* détecte désormais des *Planetary Mining Locations* depuis l'orbite,
et **treize marchandises** nouvelles entrent en jeu (bastnäsite, deutérium, diamant, hélium, hélium-3, iridium,
magnésite, olivine, périclase dunite, quartz pyroxénite, rubis, saphir, thortveitite). Le billet livre en outre
l'opération « Under Siege » (fait 3) et quatre bundles ARX — *Rhino Standard* 16 520 ARX, *Rhino Stellar* 33 000 ARX,
*Rhino Galactic* 60 000 ARX, et un *Type-11 Prospector Galactic Mining Pack* à 100 000 ARX qui réunit le vaisseau et le
SRV. Trois problèmes connus sont signalés à la sortie, dont un de portée directe sur le minage : « Rhino is only
collecting 9 chunks from surface mining, this will be increased to 12 ».

**Le Rhino et la baie de véhicule.** Le teaser du 6 août 2026 pose un fait structurel que les notes de version ne
répètent pas : le Rhino est « the largest SRV which a Commander can deploy from their ship », et sa taille lui interdit
la trappe à cargo empruntée par le Scarab et le Scorpion — « Instead the Rhino is dropped from the new vehicle bay ».
La baie de véhicule introduite par la mise à jour Operations (fait 13) ne sert donc pas qu'au Nomad : elle est aussi la
condition de déploiement du Rhino. Le même billet précise que le Rhino, contrairement au Nomad, n'a **pas d'intérieur
accessible à pied**, son volume étant occupé par les matériaux extraits et l'équipement de forage.

**Sources :**
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320&maxlength=0 (flux officiel Frontier Developments, corps complet : « Beneath the Surface: Your First Look at the Rhino », 6 août 2026 14:19 UTC ; « Elite Dangerous | August Dev Log », 27 août 2026 10:04 UTC ; « Elite Dangerous | Rhino SRV Update », 2 septembre 2026 11:20 UTC, notes de version complètes)
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320&count=300&maxlength=1000&format=json (article officiel Frontier relayé sur Steam: 'Elite Dangerous | Rhino SRV Update', publié 2026-09-02T11:20:19Z, contenu: 'The Rhino SRV Update is now live')
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320 (article: 'Beneath the Surface: Your First Look at the Rhino', publié 2026-08-06, teaser annonçant une arrivée 'later this month')
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320 (article: 'Elite Dangerous | August Dev Log', publié 2026-08-27)
- https://community.elitedangerous.com/en/galnet (GalNet officiel Frontier: article 'Vodel Reveals New SRV Rhino', daté in-univers '03 SEP 3312' = 3 septembre 2026 date réelle)
- https://en.wikipedia.org/w/index.php?title=Elite_Dangerous&action=raw (confirme l'existence du SRV Rhino aux côtés du Scarab et du Scorpion, sans date de sortie précise)

### 5. Caspian Explorer — nature (vaisseau d'exploration Zorgon Peterson) et date de sortie (2 décembre 2025)

**Réponse canonique : vaisseau, sorti le 2 décembre 2025 (ARX Early Access).**

Le "Caspian Explorer" est un VAISSEAU (pas une combinaison ni un patch) : un vaisseau spatial de classe "large" dédié à l'exploration longue distance, fabriqué par Zorgon Peterson, dans la lignée du Mandalay. Fiche technique confirmée par Frontier : Frame Shift Drive de taille 8, 7 points d'ancrage (6 medium + 1 large), et 3 nouveaux modules MKII exclusifs (blindage pour piqués/approches orbitales, propulseurs optimisés pour le vol proche des planètes, et un module de suralimentation FSD pour le carburant auprès des étoiles à neutrons/naines blanches).

Chronologie officielle exacte (confirmée via les données JSON brutes de elitedangerous.com/news, non retraitées par un résumeur) :
- 25 novembre 2025 : révélation du vaisseau dans le "November Dev Blog" officiel ("Discover New Horizons: Meet the Caspian Explorer").
- 2 décembre 2025 : sortie effective, article officiel "Caspian Explorer – Available Now Via ARX Early Access" (publié le 2025-12-02T11:00:00Z) — le vaisseau devient achetable via ARX Early Access.
- 11 décembre 2025 : un correctif dédié est publié, "Elite Dangerous: Caspian Explorer Update 1".

Donc la date "2 décembre 2025" indiquée dans un des guides communautaires comme date de SORTIE est correcte et vérifiée sur la source officielle. La date "janvier 2025" mentionnée dans l'autre guide comme date de "patch" est erronée/non corroborée : aucune trace officielle (GalNet, elitedangerous.com/news, forums Frontier) ne relie le Caspian Explorer à janvier 2025 — le vaisseau n'existait même pas encore dans les communications officielles avant fin novembre 2025. Le seul "patch" réellement associé au Caspian Explorer est l'"Update 1" du 11 décembre 2025, soit 11 mois après la date erronée. Cette date de janvier 2025 doit donc être corrigée dans la base de connaissances communautaire.

Note méthodologique : une première tentative via un outil de récupération web automatisé (résumé par un petit modèle) a renvoyé un faux résultat affirmant que "Caspian Explorer" figurait dans la liste des vaisseaux d'Inara avec un prix précis — ce résultat n'a pas pu être reproduit en récupérant la page brute (qui renvoyait en réalité une page d'erreur anti-bot sans aucune mention de "Caspian"), et a donc été écarté comme probable hallucination de l'outil. La conclusion ci-dessus repose uniquement sur le contenu brut (JSON) du site officiel elitedangerous.com, jugé fiable.

**Sources :**
- https://www.elitedangerous.com/news (flux JSON brut consulté via curl, contenant les articles 'Caspian Explorer – Available Now Via ARX Early Access' publié 2025-12-02T11:00:00+00:00, 'November Dev Blog' publié 2025-11-25T17:00:00+00:00, et 'Elite Dangerous: Caspian Explorer Update 1' publié 2025-12-11T10:00:00+00:00)
- https://www.elitedangerous.com/news/caspian-explorer-available-now-arx-early-access
- https://www.elitedangerous.com/news/november-dev-blog
- https://www.elitedangerous.com/equipment/starships/caspian-explorer
- https://www.elitedangerous.com/store/ships/caspian_explorer

### 6. Kestrel Mk II — date de sortie

**Réponse canonique : 24 février 2026.**

> **Révision du 9 septembre 2026 — confiance relevée de *moyenne* à *haute*.** La version précédente ne disposait que
> d'une corroboration technique indirecte et concluait « très probablement ». La source primaire a depuis été lue : le
> billet officiel de Frontier **« Elite Dangerous | Kestrel Mk. II Update »**, daté du **24 février 2026 à 12:21 UTC**
> sur le flux Steam News, ouvre sur « The Kestrel Mk II Update is now live ». La date est donc établie, et non plus
> déduite. C'est un cas d'école de la cinquième règle de la procédure de méthode : le point d'accès de repli n'avait
> pas été interrogé.

**Ce que le billet officiel établit.** Le Kestrel Mk II est un vaisseau de combat de petit gabarit de **Core
Dynamics**, « designed for pilots who value agility, precision, and relentless firepower », disponible « via ARX early
access » le jour même. La mise à jour introduit avec lui deux modules propres — les **Mk II Agile Boost Thrusters**
(manœuvrabilité accrue sous *boost*, avec un gain marqué en poussée latérale et verticale) et le **Mk II Plasma Shock
Accelerator** (canon à tir en rafale, dégâts de type plasma, effet *plasma slug* intégré) — ainsi que trois bundles
préconstruits : *Standard* 16 520 ARX, *Stellar* 33 000 ARX, *Galactic* 60 000 ARX. Le reste du billet est consacré à
une refonte étendue de l'audio du combat à pied, sans rapport avec le vaisseau.

**La corroboration technique antérieure, conservée.** Le "Kestrel Mk II" est un vaisseau de combat léger (petite plateforme d'atterrissage) réellement présent dans Elite Dangerous — ce n'est pas une invention du corpus communautaire. D'après la base de données technique EDCD/FDevIDs (dépôt communautaire de référence qui extrait les identifiants et libellés exacts des fichiers du jeu de Frontier, et qui alimente en amont la quasi-totalité des outils tiers d'Elite Dangerous — EDDN, Coriolis, EDSY, Inara, etc.), l'entrée "Kestrel Mk II" (ID 129039241, symbole interne "SmallCombat01_NX", entitlement "ELITE_V_SMALL_COMBAT_01", vendu en accès anticipé sur la boutique Arx) a été ajoutée au fichier shipyard.csv par un commit intitulé "new ship with modules: Kestrel Mk II" (auteur Bernd Gollesch, mainteneur EDCD de longue date), daté du 25 février 2026. Ce type de commit est historiquement posté le jour même ou le lendemain de l'apparition du contenu dans le jeu (dès que les fichiers/journal du client sont mis à jour côté joueurs). Cela concorde très précisément avec la date du 24 février 2026 citée dans l'un des deux guides communautaires, et contredit la date de "février 2025" citée dans l'autre — laquelle est bien une erreur de transcription d'un an.

Cette corroboration reste utile : elle est désormais **redondante** avec l'annonce officielle, et les deux se
recoupent au jour près (billet du 24 février 2026, commit du 25 février 2026). Ce recoupement vaut au-delà de ce fait :
il mesure le décalage typique entre une sortie en jeu et l'entrée correspondante dans `shipyard.csv`, soit environ
vingt-quatre heures — ce qui autorise à traiter ces commits comme des indices de date fiables à un jour près lorsque
l'annonce officielle est indisponible.

**Sources :**
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320&maxlength=0 (flux officiel Frontier
  Developments, billet « Elite Dangerous | Kestrel Mk. II Update », 24 février 2026 12:21 UTC, corps complet)
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/shipyard.csv
- https://github.com/EDCD/FDevIDs/commit/779263a286c2bcdf4e2c0761eb16df63de01de61
- https://api.github.com/repos/EDCD/FDevIDs/commits?path=shipyard.csv&per_page=20
- https://en.wikipedia.org/wiki/Elite_Dangerous
- Sources restées inaccessibles lors de la vérification initiale du 8 septembre 2026 : elitedangerous.com et
  elite-dangerous.fandom.com (HTTP 403/402), Reddit, Wayback Machine

### 7. Lynx Highliner — fabricant (Zorgon Peterson) et date de sortie

**Réponse canonique : Zorgon Peterson (et non Saud Kruger).**

Le Lynx Highliner est fabriqué par Zorgon Peterson, et non par Saud Kruger. Il s'agit du premier vaisseau de Zorgon Peterson sur le marché des paquebots/liners de passagers (un fabricant jusque-là plutôt connu pour des vaisseaux de combat comme l'Adder, le Fer-de-Lance, le Krait Mk II/Phantom ou le Mamba) — d'où probablement la confusion dans le corpus communautaire, Saud Kruger étant le fabricant "attendu" pour ce type de vaisseau de croisière (Orca, Beluga Liner, Dolphin). La page produit officielle et l'annonce sur les forums Frontier utilisent la formule « Entering/Expanding into the passenger liner market, Zorgon Peterson presents/introduces the Lynx Highliner », et la base communautaire Inara confirme « Manufacturer: Zorgon Peterson ». Le guide affirmant "Saud Kruger" est donc erroné et doit être corrigé.

**Date de sortie, ajoutée le 9 septembre 2026 : 28 avril 2026.** Le billet officiel « Elite Dangerous | Lynx Highliner
Update Notes », daté du **28 avril 2026 à 13:11 UTC** sur le flux Steam News, annonce la mise en ligne du vaisseau et
tranche le fabricant en source primaire : « the new Lynx Highliner ship crafted by the experts at Zorgon Peterson ».
Il précise trois points que le corpus peut reprendre : le vaisseau est de **classe moyenne**, il accueille jusqu'à
**225 passagers**, et il est **« available now for credits at shipyards »** pour tout possesseur d'Odyssey. Cette
disponibilité immédiate en crédits est une exception au schéma habituel de Frontier — les nouveaux vaisseaux passent
d'ordinaire par plusieurs semaines d'accès anticipé ARX. Elle est assumée comme telle : le billet du **22 avril 2026**
annonçait que « the Standard edition of the latest Ship arriving to Elite Dangerous next week (28 April) will be
available for all Commanders immediately for in-game credits », en compensation du report d'Operations (fait 3). Seules
les éditions *Stellar* et *Galactic* passaient par l'ARX, à tarif réduit. La mise à jour introduit également les
cabines à passagers **Mk II Business & Economy** (capacité multipliée par 1,5) et de nouvelles missions d'évacuation
de passagers en nombre.

**Sources :**
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320&maxlength=0 (flux officiel Frontier
  Developments, corps complet : « An Update on Operations », 22 avril 2026 14:02 UTC, annonce de la sortie du 28 avril
  et de la gratuité de l'édition Standard ; « Elite Dangerous | Lynx Highliner Update Notes », 28 avril 2026 13:11 UTC,
  « crafted by the experts at Zorgon Peterson »)
- https://inara.cz/elite/ship/87/ (fetch direct, confirme "Manufacturer: Zorgon Peterson")
- https://inara.cz/elite/ships/ (liste des vaisseaux, confirme l'existence du Lynx Highliner)
- https://www.elitedangerous.com/store/ships/lynx-highliner (via proxy lecteur, page produit officielle: "Expanding into the passenger liner market, Zorgon Peterson presents the Lynx Highliner")
- https://forums.frontier.co.uk/threads/new-ship-zorgon-peterson-introduces-the-lynx-highliner.646822/ (via proxy lecteur, annonce officielle Frontier: "Entering into the passenger liner market for the first time, Zorgon Peterson introduces the Lynx Highliner")
- https://elite-dangerous.fandom.com/wiki/Lynx_Highliner (référencé via recherche, page wiki communautaire confirmant Zorgon Peterson, accès direct bloqué par la protection anti-bot du site)

### 8. Vaisseau « Nomad » — premier ship-launched vessel (SLV) du jeu, sorti le 30 juin 2026

**Réponse canonique : le Nomad existe. Premier *Ship-Launched Vessel* (SLV) du jeu, sorti le 30 juin 2026 en ARX Early Access avec la mise à jour Operations (4.4.0.0).**

> **Révision du 9 septembre 2026 — cette entrée inverse la réponse précédente.** Jusqu'au 8 septembre 2026, ce document concluait ici à une « probable prémisse fausse (fan-fiction, rumeur, ou confusion avec un autre jeu/mod) » et instruisait le reste du corpus de ne fournir « aucune date de sortie, aucun fabricant et aucune classification (SLV ou autre) » pour ce vaisseau. Cette conclusion était fausse, et elle l'était pour une raison de méthode identifiable — pas seulement par malchance d'accès. Elle est développée plus bas sous « Pourquoi la conclusion précédente était fausse ».

#### Ce que le Nomad est, d'après les annonces officielles Frontier (2 juin et 1ᵉʳ juillet 2026)

Le billet « Discover the Nomad », publié le **2 juin 2026**, le décrit ainsi : « The Nomad is a small and compact ship-launched vessel which is built to explore planetary surfaces » — patins d'atterrissage de type hélicoptère, moteurs pivotants. Le même billet annonce sa disponibilité : « The Nomad will launch in ARX Early Access alongside Operations on 30th June. » Les notes de version du 1er juillet 2026 confirment la sortie effective : « This update also brings with it the mighty Nomad! This compact, ship-launched utility vessel… », et leur section *outfitting* porte « Nomad added to outfitting » ainsi que « Added Mk II Biological Scanner ». Le Nomad est le premier véhicule de cette catégorie dans le jeu : ni chasseur embarqué (SLF), ni véhicule de surface (SRV), mais **vaisseau lancé depuis un vaisseau porteur (SLV)**.

#### Faits techniques établis sur le Nomad : date, prix ARX, nom interne `Lander01`, drapeau SRV

- **Date de sortie : 30 juin 2026**, en ARX Early Access, simultanément avec la mise à jour Operations (voir le fait 3).
- **Prix ARX** annoncés dans les notes de version : bundle *Nomad Standard* **16 520 ARX**, *Nomad Stellar* **33 000 ARX**, *Nomad Galactic* **60 000 ARX**.
- **Armement** : le Nomad est armé (lasers à impulsion en monture fixe).
- **Nom interne dans le journal du jeu : `Lander01`.** Attesté par des extraits de journal bruts : `{"event":"LoadGame",…,"Ship":"Lander01","Ship_Localised":"Nomad",…,"gameversion":"4.4.0.3","build":"r330683/r0"}` et `{"event":"DockSRV","SRVType":"lander01","SRVType_Localised":"Nomad","ID":173}`.
- **Le Nomad positionne le drapeau SRV dans `status.json`, et non le drapeau *fighter*.** C'est l'affirmation la plus falsifiable du dossier, et elle est vraie : l'outil communautaire EDCoPilot a publié la version **v1.11.726 le 1er juillet 2026**, jour de sortie, avec pour seule note « Nomad release 0 day fix - fix issue where flags in status.json were switching EDCoPilot's tracking back to being in an SRV (because the Nomad sets the SRV flag, not the fighter flag, in the status.json file). » Deux tickets indépendants documentent le même comportement : EDCD/EDDI n° 2849 (ouvert le 5 août 2026, « Nomad picked up as SRV and Fighter at the same time ») et EDCD/EDMarketConnector n° 2689 (ouvert le 18 juillet 2026, « EDMC incorrectly sets current ship to Nomad when renaming the SLV »).
- **Déploiement** : depuis une *Vessel Bay* **Mk I ou Mk II** — « The Nomad can be deployed from a compatible vessel bay, including MK I and MK II modules. » (notes de version 4.4.0.0). Le détail des modules et la liste des vaisseaux compatibles font l'objet du fait 13.
- **Correctif du 9 juillet 2026** (« Operations Update | Update 3 ») : « Resolved an issue where the fighter bay could clip through the Nomad ».
- **Fourchette de versions** : de **4.4.0.0** (30 juin 2026, jour de sortie) à **4.4.0.3**, cette dernière relevée dans un journal de jeu réel daté du 5 août 2026 et vraisemblablement livrée par l'« Update 3 » du 9 juillet 2026 — rattachement plausible mais non prouvé, le billet correspondant se contredisant sur son propre numéro. Voir le relevé du flux d'annonces en tête de document.
- **Le Rhino partage la baie du Nomad.** Le SRV Rhino, sorti le 2 septembre 2026, se déploie lui aussi depuis la baie de véhicule et non par la trappe à cargo (fait 4). Le Nomad n'est donc pas le seul occupant possible du module ; c'est le premier, pas l'unique.
- **Intérieur accessible à pied : confirmé en source primaire le 9 septembre 2026.** Ce point figurait auparavant parmi
  les éléments seulement communautaires. Il est établi par le billet **« Beneath the Surface: Your First Look at the
  Rhino » du 6 août 2026**, où le directeur artistique explique que le Rhino, lui, n'en a pas : « the rest of its
  interior space is needed to store the materials it gathers and its equipment so unlike the Nomad there is no
  accessible interior space ». La comparaison n'a de sens que si le Nomad en possède un ; c'est Frontier qui l'écrit.
  Le billet du 2 juin 2026 va dans le même sens en insistant sur les « accessible entry points » et sur la facilité à
  débarquer et rembarquer. Reste communautaire, en revanche, l'affirmation plus forte selon laquelle le Nomad serait le
  **premier** vaisseau pilotable du jeu doté d'un tel intérieur.

#### Éléments sur le Nomad corroborés par la communauté seulement (soute, fabricant, intérieur)

Éléments corroborés par la communauté, mais par aucune source primaire Frontier lue directement — à conserver, en les attribuant explicitement au wiki communautaire plutôt qu'à Frontier (confiance *moyenne*) : le Nomad n'a **pas de soute**, et ne peut donc récupérer ni matériaux ni marchandises ; les données d'exobiologie non déposées sont **perdues en cas de destruction** ; le fabricant serait **Faulcon DeLacy** ; le Nomad serait le **premier** vaisseau pilotable du jeu doté d'un intérieur praticable à pied (l'existence de cet intérieur, elle, est établie — voir ci-dessus).

#### Pourquoi la conclusion précédente sur le Nomad était fausse : une erreur de catégorie

La version du 8 septembre 2026 fondait sa conclusion négative sur deux constats : l'absence du Nomad dans la liste des vaisseaux d'Inara.cz et dans l'article Wikipédia. Le premier constat a été revérifié le 9 septembre 2026 et il est exact — la page `inara.cz/elite/ships/` ne contient aucun Nomad. Mais **ces listes ne recensent que les vaisseaux pilotables achetables au chantier naval** : elles ne contiennent ni les SRV (Scarab, Scorpion, Rhino), ni les chasseurs embarqués, ni les SLV. Y chercher un vaisseau lancé depuis un vaisseau porteur revient à chercher un SLF dans le catalogue Coriolis : l'absence n'y a aucune valeur probante, et le test est immédiat — le Scarab et le Rhino, dont personne ne conteste l'existence, en sont absents eux aussi. C'est cette erreur de catégorie, combinée aux blocages 403 sur elitedangerous.com, fandom et reddit, qui a produit un faux négatif. Pour la même raison, le silence de `elite-journal.readthedocs.io` (aucun drapeau dédié aux SLV dans la documentation du fichier de statut) et celui de `EDCD/coriolis-data` (aucune occurrence de « Nomad ») ne réfutent rien : le premier est la conséquence directe du réemploi du drapeau SRV existant — précisément le comportement documenté par EDCoPilot, EDDI et EDMC — et le second de ce que Coriolis ne modélise ni SLF, ni SRV, ni SLV.

#### Le décompte des catalogues de vaisseaux, tranché le 9 septembre 2026

*(Ce décompte a depuis été promu en fait autonome et recompté le 10 septembre 2026 : voir le [fait 14](#14-nombre-de-vaisseaux-jouables--périmètre-des-décomptes-47-48-et-52). Le présent bloc conserve le raisonnement d'origine.)*

Une réserve laissée ouverte par la révision
précédente opposait un décompte de **47** vaisseaux, avancé par trois guides, à un décompte de **52** relevé sur
Inara.cz lors d'une revérification. Les comptages ont été refaits en récupérant les catalogues eux-mêmes : les fiches
de la page Inara, les lignes de `shipyard.csv`, et les fichiers du répertoire `ships/` de `EDCD/coriolis-data`. Il n'y
avait pas de contradiction à arbitrer, mais **trois catalogues distincts confondus en un seul** :

| Catalogue                                  | Entrées | Périmètre                                                            |
|--------------------------------------------|---------|----------------------------------------------------------------------|
| `inara.cz/elite/ships/`                    | **48**  | Vaisseaux pilotables achetables au chantier naval.                   |
| `EDCD/FDevIDs`, `shipyard.csv`             | **48**  | Idem — liste nominalement identique à celle d'Inara.                 |
| `EDCD/coriolis-data`, modèles de vaisseaux | **47**  | Idem, **moins le Lynx Highliner**, non encore modélisé à cette date. |

Les deux premières listes coïncident nom pour nom, Kestrel Mk II, Caspian Explorer et Lynx Highliner compris ; la
troisième en compte 47, et le seul manquant est bien le **Lynx Highliner**, non encore modélisé par Coriolis. Le
décompte de **47** ne se rapporte donc pas à Inara mais à `EDCD/coriolis-data`, et les trois guides qui l'emploient
sont exacts dans leur propre contexte — c'est le rapprochement qui était fautif. Le décompte de **52** n'a pas été
reproduit : la page relevée le 9 septembre 2026 porte 48 fiches de vaisseau, sans doublon. **Le corpus retient donc
48 vaisseaux jouables**, chiffre inchangé par cet épisode, un SLV n'étant pas un vaisseau de chantier naval.

Le même relevé fournit l'objet témoin décrit dans la règle de méthode : la liste d'Inara ne contient **aucune**
occurrence de « Scarab », « Scorpion » ni « Rhino ». Trois SRV dont l'existence est certaine y sont donc absents,
exactement comme le Nomad. Le test se fait en une requête et il aurait suffi, le 8 septembre 2026, à disqualifier la
source avant qu'elle ne serve de preuve.

#### Divergence inter-corpus sur le Nomad : `raw_data/` contre `assets/guides/`

Les deux corpus du dépôt se contredisaient frontalement sur ce point. Les guides applicatifs `assets/guides/exploration-exobiologie.json`, `assets/guides/protocole-milliard.json`, `assets/guides/outils.json` et `assets/guides/debuter-sans-combat.json` décrivent le Nomad et la mise à jour Operations comme réels ; `raw_data/` avait conclu à l'inverse et retiré ces contenus de plusieurs guides. **La divergence est tranchée en faveur des guides applicatifs sur le fond.** Le détail de `outils.json` sur le drapeau `status.json` est confirmé mot pour mot par le correctif EDCoPilot du 1er juillet 2026.

Trois points restent néanmoins inexacts **dans les guides applicatifs**, et sont à corriger sans supprimer les blocs qui les portent :

1. **Restriction à trois vaisseaux.** `exploration-exobiologie.json` et `protocole-milliard.json` affirment que le Nomad ne se déploie que depuis un *Vessel Hangar Mk II*, module réservé à trois vaisseaux. Les notes officielles disent l'inverse : la baie Mk I convient aussi. La restriction à trois vaisseaux porte sur le module Mk II, pas sur le Nomad (fait 13). La phrase « Si vous volez en Mandalay, le Nomad ne vous concerne tout simplement pas » reste vraie — le Mandalay n'a aucune baie — mais son raisonnement est faux et doit être reformulé.
2. **Nom du module de détection.** Les guides écrivent « MK II Discovery Scanner » ; le nom officiel est **« Mk II Biological Scanner »** (« A pulse scanner that detects biological signatures »). La fonction décrite — repérage des signaux biologiques depuis le cockpit — est exacte.
3. **Marqueur de source sur le plafond Merc Coin.** Voir le fait 3 : le chiffre est communautaire, le marqueur `[OFFICIEL]` est abusif.

#### Conséquence pour `raw_data/` : la restauration du contenu Nomad, le 9 septembre 2026

Les fichiers qui portaient des affirmations de non-existence, ou qui avaient été amputés d'un contenu réel, ont été réécrits d'après les faits 3, 8 et 13 : [03-vaisseaux.md](./03-vaisseaux.md), [04-equipements.md](./04-equipements.md), [06-ingenieurs.md](./06-ingenieurs.md), [07-equipement-a-pied.md](./07-equipement-a-pied.md), [09-combat-a-pied.md](./09-combat-a-pied.md), [10-exploration.md](./10-exploration.md), [13-operations.md](./13-operations.md), [14-rhino.md](./14-rhino.md), [15-roadmap.md](./15-roadmap.md), [17-sources-donnees.md](./17-sources-donnees.md), [20-minage.md](./20-minage.md) et [README.md](./README.md). Ils ne se contentent pas de retirer les formules de non-confirmation : ils exposent ce que les annonces officielles établissent, en citant chaque billet par son titre et sa date. Deux garde-fous ont été appliqués : ne rien rétablir mécaniquement depuis l'état antérieur du corpus sans revérification — les intitulés d'opérations d'avril 2026 étaient provisoires, voir le fait 3 —, et ne supprimer aucun contenu de `assets/guides/` au motif que `raw_data/` le contredisait.

**Sources :**
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320&maxlength=0 (flux officiel Frontier Developments, corps complet : « Discover the Nomad », 2 juin 2026 ; « Elite Dangerous | Operations Update », 1er juillet 2026, notes de version complètes — description du Nomad, bundles ARX, *outfitting*, déploiement depuis une baie Mk I ou Mk II ; « Operations Update | Update 3 », 9 juillet 2026)
- https://github.com/Razzafrag/EDCoPilot-Installer/releases (version v1.11.726, publiée le 2026-07-01T04:31:28Z : « Nomad release 0 day fix […] because the Nomad sets the SRV flag, not the fighter flag, in the status.json file »)
- https://github.com/EDCD/EDDI/issues/2849 (ouvert le 5 août 2026 — extraits de journal bruts : `Ship` = `Lander01`, `Ship_Localised` = « Nomad », `DockSRV` avec `SRVType` = `lander01`, `InSRV:true`, `gameversion` 4.4.0.3, build r330683/r0)
- https://github.com/EDCD/EDMarketConnector/issues/2689 (ouvert le 18 juillet 2026 — `SetUserShipName` avec `Ship` = `lander01` ; casse aussi les liens EDSY et l'import Coriolis)
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/outfitting.csv (modules de baie, voir le fait 13)
- https://api.github.com/repos/EDCD/coriolis-data/contents/ships (répertoire `ships/`, 47 fichiers de vaisseau le 9 septembre 2026 — le Lynx Highliner est le seul absent par rapport aux 48 de `shipyard.csv` et d'Inara)
- https://elite-dangerous.fandom.com/wiki/Nomad (wiki communautaire — absence de soute, absence de FSD, fabricant Faulcon DeLacy, premier vaisseau pilotable doté d'un intérieur ; accès direct bloqué HTTP 402, contenu relevé via extraits de recherche : à traiter comme source communautaire)
- Sources ayant produit la conclusion erronée du 8 septembre 2026, conservées pour mémoire méthodologique : https://inara.cz/elite/ships/ (recomptée le 9 septembre 2026 : 48 vaisseaux, aucun Nomad — mais aucun Scarab, Scorpion ni Rhino non plus, donc absence non probante), https://raw.githubusercontent.com/EDCD/FDevIDs/master/shipyard.csv (48 vaisseaux, liste nominalement identique à celle d'Inara, même limite), https://en.wikipedia.org/wiki/Elite_Dangerous, https://elite-journal.readthedocs.io/en/latest/Status%20File.html (drapeaux 24 *In MainShip*, 25 *In Fighter*, 26 *In SRV* — aucun drapeau SLV, silence attendu)

### 9. Panther Clipper Mk II — date de sortie

**Réponse canonique : disponible depuis le 22 juillet 2025 (ARX Early Access) — première incarnation jouable du Panther Clipper.**

Le Panther Clipper Mk II (vaisseau cargo/multirôle du fabricant Zorgon Peterson) a été mis en vente/disponible dans Elite Dangerous à partir du 22 juillet 2025, en accès anticipé payant ARX (achat en monnaie réelle avant sa mise à disposition contre crédits in-game, comme c'est l'usage pour les nouveaux vaisseaux de Frontier Developments). Ce n'est PAS un vaisseau "Mk II" au sens d'une évolution d'un précédent Panther Clipper jouable : le "Panther Clipper" original était un vaisseau de lore/teasing jamais rendu jouable pendant des années ; c'est cette version "Mk II" qui constitue sa toute première incarnation réellement jouable dans le jeu.

Preuves concordantes :
- La page officielle du vaisseau (elitedangerous.com/panther-clipper) existe depuis au moins le 22 juillet 2025 (première capture Wayback Machine) et affiche déjà "Available Now" / mention d'ARX early access dès cette date.
- L'article d'actualité officiel associé ("New Ship Panther Clipper" / "New Ship from Zorgon Peterson") porte un champ de publication interne daté du 22 juillet 2025 à 11h00 UTC — valeur retrouvée identique en reconstruisant les données JSON intégrées dans deux captures d'archive indépendantes (22 juillet 2025 et 15 février 2026), ce qui exclut une coïncidence de rendu.
- Wikipédia (article anglais "Elite Dangerous") liste le Panther Clipper Mk II parmi les nouveaux vaisseaux sortis, en citant cette même page officielle (consultée le 4 septembre 2025).
- La base de données tierce inara.cz référence le Panther Clipper Mk II comme vaisseau existant et achetable, avec ses caractéristiques complètes (c'est bien un vaisseau réellement présent dans le jeu, pas seulement annoncé).
- Des notes de mise à jour officielles ultérieures (visibles via la même page archivée, assets datés mi-août 2025, version de build "4.2.0.0", saison de contenu "Vanguards") réitèrent : "The Panther Clipper Mk II is available now via ARX early access", confirmant qu'il restait disponible au moins jusqu'à mi-août 2025 sans indiquer de changement de statut.

Nuance/incertitude restante : il n'a pas été possible de confirmer directement, via une déclaration humaine lisible (article de presse daté classique), la date exacte à laquelle le vaisseau est sorti de l'accès anticipé ARX pour devenir achetable en crédits in-game par tous les joueurs (généralement 2-3 mois après l'accès anticipé selon le schéma habituel de Frontier) — cette date "de sortie complète" se situerait probablement autour de septembre-octobre 2025, mais elle n'a pas été vérifiée avec certitude. La date du 22 juillet 2025 concerne la première disponibilité en jeu (accès anticipé ARX), qui est la réponse la plus factuelle et la mieux étayée à "date de sortie" — d'où une confiance *moyenne* plutôt que *haute*.

**Sources :**
- https://www.elitedangerous.com/panther-clipper (page officielle, vérifiée via Wayback Machine : http://web.archive.org/web/20250722100617/https://www.elitedangerous.com/panther-clipper et http://web.archive.org/web/20260215225403/https://www.elitedangerous.com/panther-clipper)
- https://en.wikipedia.org/wiki/Elite_Dangerous (section Odyssey/développement, citation référence n°102 pointant vers elitedangerous.com/panther-clipper, consultée 2025-09-04)
- https://inara.cz/elite/starships/ (fiche Panther Clipper Mk II, statistiques complètes)
- http://web.archive.org/cdx/search/cdx?url=elitedangerous.com/panther-clipper (liste des captures Wayback confirmant la première capture au 22 juillet 2025)

### 10. Fondation de Colonia / 10e anniversaire

**Réponse canonique : Colonia fondée en septembre 2016 (pas 2015) ; 10e anniversaire en juillet-août 2026, authentique.**

La base de connaissances communautaire se trompe d'un an : l'année exacte de fondation est 2016, pas 2015. Le "10e anniversaire" prévu en juillet-août 2026 est authentique et cohérent (2016 + 10 = 2026) — ce n'est pas l'événement de 2015 qui est correct, c'est la date "septembre 2015" qui est fausse.

Détail chronologique (le jeu utilise un calendrier décalé de +1286 ans par rapport au réel, confirmé par les archives GalNet actuelles : année en jeu 3312 = année réelle 2026) :

1. Saut raté (l'incident fondateur) : le 19-21 mai 3302 (jeu) = mai 2016 (réel), la Jaques Station tente un saut longue distance depuis Gliese 1269 vers Beagle Point. Une cargaison de contrebande de capteurs Thargoïdes fait dérailler le FSD ; la station est éjectée de sa trajectoire et s'échoue dans le système alors nommé Eol Prou RS-T d3-94.
2. Découverte : la station est retrouvée le 29 juin 3302 (jeu) = 29 juin 2016 (réel) par le Cmdr Cly.
3. Fondation officielle de "Colonia" : le Colonia Hub (premier établissement permanent) est inauguré le 9 septembre 3302 (jeu) = 9 septembre 2016 (réel, et non 2015) ; c'est cet événement, qui donne son nom au système, qui est généralement cité comme la "date de naissance" de Colonia.

Le 10e anniversaire est bien réel et officiel : une série d'articles GalNet officiels (mirorés sur inara.cz) datés 16, 23, 27 et 30 juillet 3312, puis 6 et 20 août 3312 (= juillet-août 2026 en date réelle) annoncent et célèbrent "Colonia's Tenth Anniversary", ce qui est parfaitement cohérent avec une fondation en 2016 et confirme que le guide communautaire a raison sur la date de l'anniversaire (2026) mais que la date d'origine qu'il cite ailleurs ("septembre 2015") contient une erreur d'un an à corriger en "septembre 2016".

Note de transparence : plusieurs sources primaires (elitedangerous.com, community.elitedangerous.com, forums.frontier.co.uk, le wiki Fandom en accès direct, Reddit, Wayback Machine) étaient inaccessibles lors de la vérification (blocages HTTP 403/402 ou domaines bloqués). La conclusion s'appuie donc sur des mirroirs fiables et concordants entre eux (archive GalNet en direct sur inara.cz, contenu du wiki communautaire Fandom mirroré via des dépôts GitHub tiers, article de blog communautaire citant explicitement GalNet comme source), tous convergents sur les mêmes dates.

**Sources :**
- https://inara.cz/elite/starsystem/77690/ (fiche système Colonia, inara.cz)
- https://inara.cz/elite/station/53294/ (fiche Jaques Station, inara.cz)
- https://inara.cz/elite/galnet/?search=Colonia+anniversary (archive GalNet officielle mirorée sur inara.cz, articles datés 16/23/27/30 juil. et 6/20 août 3312)
- https://github.com/DarkSession/Elite-Dangerous-RAG-Knowledge (Wiki/Colonia.md et Wiki/Jaques-Station.md, contenu mirorant le wiki Fandom)
- https://github.com/elitedangereuse/LoreExplorer (notes sur 'Repairs Concluded', août 3302)
- https://github.com/ed-acfs/ed-acfs.github.io/blob/main/_posts/2026-08-20-colonia-dieci-anni.md (article communautaire du 20/08/2026 citant GalNet comme source)
- https://fr.wikipedia.org/wiki/Elite_Dangerous (confirmation générale de l'existence de Colonia)
- Sources tentées mais bloquées/inaccessibles : elitedangerous.com, community.elitedangerous.com, forums.frontier.co.uk, elite-dangerous.fandom.com (HTTP 402/403), reddit.com, web.archive.org, archive.ph, moteurs de recherche (CAPTCHA/403)

### 11. Thargoid War Epilogue — fin de la Seconde Guerre Thargoïde

**Réponse canonique : 19 décembre 2024, 15:00 UTC.**

Le billet officiel de Frontier Developments intitulé *Thargoid War Epilogue* est daté du **19 décembre 2024 à 15:00 UTC** sur le flux Steam News du jeu (Steam App ID 359320), horodatage brut relevé et vérifié en direct lors de la rédaction de [25-combat-ax.md](./25-combat-ax.md). Son texte proclame la victoire finale : « The last Titan, Cocijo, has fallen. The war is over. » — destruction de Cocijo à Sol, fin officielle de la Seconde Guerre Thargoïde et bascule narrative vers la reconstruction.

Trois dates circulent dans le corpus et dans les sources pour ce même événement ; elles ne sont pas équivalentes :

- **19 décembre 2024, 15:00 UTC** — date réelle de publication du billet Frontier du même nom, seule date sourcée sur un horodatage officiel. **C'est la date de référence à retenir** pour toute mention chronologique de l'Epilogue dans le corpus.
- **Janvier 2025** — date avancée par des révisions antérieures de [01-lore.md](./01-lore.md) (tableau-maître, sections 1.7 et 3.6). À traiter comme **imprécise**, ou comme la date d'un contenu GalNet complémentaire diffusé après l'annonce de décembre, et non comme celle de l'Epilogue lui-même. Elle ne doit pas être utilisée comme date de référence, et l'écart d'environ un mois avec le billet officiel ne justifie pas de déplacer l'événement. *(Alignement effectué le 10 septembre 2026 : 01-lore.md date désormais l'Epilogue du 19 décembre 2024 et renvoie ici.)*
- **26 mai 3310** — date relevée sur l'article anglais de Wikipédia pour la destruction de Cocijo. C'est une date **in-fiction** (calendrier GalNet), donc **sans valeur chronologique réelle** : elle ne doit être ni convertie en date réelle, ni opposée aux deux précédentes.

Cette entrée tranche la divergence explicitement signalée sous le tableau de dates de [25-combat-ax.md](./25-combat-ax.md), qui renvoyait la décision à ce document. Elle est cohérente avec le récit de [01-lore.md](./01-lore.md) (section 3.5), qui identifie lui aussi Cocijo comme le dernier Titan tombé à Sol en décembre 2024.

**Sources :**
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320 (flux officiel Frontier Developments, billet *Thargoid War Epilogue*, publié le 19 décembre 2024 à 15:00 UTC, contenant la phrase « The last Titan, Cocijo, has fallen. The war is over. »)
- https://en.wikipedia.org/wiki/Elite_Dangerous (date in-fiction « 26 mai 3310 » pour la destruction de Cocijo — lore, sans valeur chronologique réelle)
- [25-combat-ax.md](./25-combat-ax.md) (relevé de l'horodatage brut du flux Steam News et signalement de la divergence à trancher ici)
- [01-lore.md](./01-lore.md), sections 3.5 et 3.6 (récit cohérent en décembre 2024 ; mention « janvier 2025 » corrigée le 10 septembre 2026)

### 12. Titan Presence In Sol — invasion de Sol par Cocijo

**Réponse canonique : 5 décembre 2024, 12:01 UTC.**

Le billet officiel de Frontier Developments intitulé *Titan Presence In Sol* est daté du **5 décembre 2024 à 12:01 UTC** sur le flux Steam News du jeu, horodatage brut relevé et vérifié en direct lors de la rédaction de [25-combat-ax.md](./25-combat-ax.md). Il annonce que l'avant-dernier Titan, **Raijin**, vient d'être détruit, et que le dernier Titan survivant, **Cocijo**, entame contre toute attente l'invasion de **Sol**, berceau de l'humanité.

Cette date borne le début de l'invasion de Sol : **Sol n'a été envahi qu'à partir du 5 décembre 2024**, et la destruction de Cocijo — donc la fin de la guerre — intervient quatorze jours plus tard, le 19 décembre 2024 (voir le fait 11 ci-dessus). Toute chronologie du corpus plaçant l'invasion de Sol plus tôt, ou fusionnant les deux événements en une seule date, est à corriger sur ces deux bornes. La destruction de Raijin est antérieure au 5 décembre 2024, sans qu'une date exacte ait pu être établie.

**Sources :**
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320 (flux officiel Frontier Developments, billet *Titan Presence In Sol*, publié le 5 décembre 2024 à 12:01 UTC)
- [25-combat-ax.md](./25-combat-ax.md) (tableau de dates de la Seconde Guerre Thargoïde et relevé de l'horodatage brut du flux Steam News)

### 13. Vessel Hangar — modules Mk I et Mk II

**Réponse canonique : le module *Fighter Hangar* a été renommé *Vessel Hangar* ; la baie Mk I équipe 13 vaisseaux, la Mk II seulement 3, et le Nomad se déploie depuis l'une comme depuis l'autre.**

Entrée ajoutée le 9 septembre 2026 pour trancher une divergence entre les deux corpus du dépôt, relevée lors de la révision des faits 3 et 8.

#### Le renommage *Fighter Hangar* → *Vessel Hangar*, vérifiable dans les données du jeu

Dans `EDCD/FDevIDs/outfitting.csv` — dépôt communautaire qui extrait les identifiants et libellés exacts des fichiers du jeu, et qui alimente en amont la quasi-totalité des outils tiers — les modules `Int_FighterBay_Size5/6/7_Class1` portent désormais le libellé affiché **« Vessel Hangar »**. Deux correctifs du billet « Rhino SRV Update » du **2 septembre 2026** le mentionnent explicitement : « Resolved an instance where the vessel hangar was incorrectly referred to as a fighter hangar within the crew lounge » et « Resolved an issue where the pistons on the Vessel Hanger could clip through their housing during the launch animation ». *(Correction du 9 septembre 2026 : une version antérieure de cette entrée attribuait la ligne sur le* crew lounge *aux correctifs du 9 juillet 2026 ; elle figure bien dans le billet du 2 septembre 2026, et non dans l'« Update 3 ».)* Le symbole interne conserve, lui, la racine `FighterBay` : c'est un renommage d'interface, pas un nouveau module.

#### Vocabulaire du module : « Vessel Bay » dans les notes, « Vessel Hangar » dans l'interface

Les notes de version de Frontier écrivent « Vessel Bay » ; les données du jeu et l'interface écrivent « Vessel Hangar » / « Mk II Vessel Hangar ». Aucune des deux n'est fautive ; un guide gagne à mentionner les deux, faute de quoi une recherche sur l'une des formes ne trouve rien.

#### Le *Mk II Vessel Hangar* : existence, sku ARX et rattachement à la mise à jour Operations

`outfitting.csv` porte les entrées `Int_FighterBayMk2_Size5/6/7_Class1`, libellées **« Mk II Vessel Hangar »**, avec le sku `ELITE_V_MKIIFIGHTERBAY` et des variantes `_Free`. Le fichier `sku.csv` du même dépôt qualifie `ELITE_V_MKIIFIGHTERBAY` et `ELITE_V_MKIFIGHTERBAY_FREE` d'« early access purchase in the arx store ». Un commit unique du **3 juillet 2026**, intitulé « new commodity and modules for Operations & Nomad update », est le seul à toucher `outfitting.csv` entre juin et août 2026 — ce qui rattache sans ambiguïté ces modules à la mise à jour Operations (fait 3).

#### Vaisseaux compatibles avec la baie de véhicule : 13 pour la Mk I, 3 pour la Mk II

Treize vaisseaux acceptent une baie Mk I ; trois d'entre eux acceptent en outre la Mk II :

| Vaisseau              | Classes de baie Mk I | Classes de baie Mk II |
|-----------------------|----------------------|-----------------------|
| Alliance Crusader     | 5-6                  | —                     |
| Anaconda              | 5-7                  | —                     |
| Beluga Liner          | 5-6                  | —                     |
| Caspian Explorer      | 5-7                  | 5-7                   |
| Federal Corvette      | 5-7                  | —                     |
| Federal Gunship       | 5-6                  | —                     |
| Imperial Cutter       | 5-7                  | —                     |
| Keelback              | 5                    | —                     |
| Krait Mk II           | 5-6                  | —                     |
| Panther Clipper Mk II | 5-7                  | 5-7                   |
| Type-9 Heavy          | 5-7                  | —                     |
| Type-10 Defender      | 5-7                  | —                     |
| Type-11 Prospector    | 5-6                  | 5-6                   |

Soit **13 vaisseaux** pour la baie Mk I et **3** pour la Mk II. Le Mandalay ne figure dans aucune des deux colonnes : il n'a pas de baie du tout.

#### La baie de véhicule n'est pas réservée au Nomad : le SRV Rhino s'en sert aussi

Le SRV **Rhino**, sorti le 2 septembre 2026, s'en sert lui aussi : trop grand pour la trappe à cargo qu'empruntent le Scarab et le Scorpion, il est « dropped from the new vehicle bay » (billet « Beneath the Surface: Your First Look at the Rhino », 6 août 2026). Le module renommé accueille donc, à la date de ce relevé, trois catégories de véhicules — chasseurs embarqués, SLV et le plus grand des SRV —, ce qui achève d'expliquer l'abandon du mot « fighter ». **Point non tranché** : aucune source primaire lue ne dit si le Rhino exige la baie Mk II ou s'accommode de la Mk I. Les notes du 2 septembre 2026 ne le précisent pas, et la formule « the new vehicle bay » du 6 août 2026 ne distingue pas les deux modules. Ne pas transposer au Rhino la règle établie pour le Nomad, dans un sens ni dans l'autre, tant que ce point n'est pas vérifié.

#### Le point qui tranche la divergence inter-corpus sur le déploiement du Nomad

Les notes de version 4.4.0.0 énoncent : « The Nomad can be deployed from a compatible vessel bay, including MK I and MK II modules. » La restriction à trois vaisseaux porte donc sur **le module Mk II**, et non sur le Nomad. Les guides `assets/guides/exploration-exobiologie.json` (« Il ne se déploie que depuis un Vessel Hangar Mk II… seuls trois vaisseaux peuvent monter ce Mk II ») et `assets/guides/protocole-milliard.json` (« Le Mk II Vessel Hangar est exclusif au Caspian, au Panther Clipper Mk II et au Type-11 ») sont fautifs sur ce point précis et doivent être corrigés — sans que les blocs qui les portent soient supprimés, puisque tout le reste de leur contenu sur le Nomad est confirmé (fait 8). La conclusion pratique de ces guides pour le Mandalay reste exacte, mais pour une autre raison que celle qu'ils avancent : ce n'est pas l'exclusivité du Mk II, c'est l'absence de toute baie sur ce vaisseau.

**Sources :**
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320&maxlength=0 (notes de version 4.4.0.0 du 1er juillet 2026 : « The Nomad can be deployed from a compatible vessel bay, including MK I and MK II modules », listes des vaisseaux compatibles Mk I et Mk II ; « Beneath the Surface: Your First Look at the Rhino » du 6 août 2026 pour le déploiement du Rhino depuis la baie de véhicule ; « Elite Dangerous | Rhino SRV Update » du 2 septembre 2026 pour les deux correctifs nommant le *vessel hangar*, dont celui du *crew lounge*)
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/outfitting.csv (`Int_FighterBay_Size5/6/7_Class1` → « Vessel Hangar » ; `Int_FighterBayMk2_Size5/6/7_Class1` → « Mk II Vessel Hangar », sku `ELITE_V_MKIIFIGHTERBAY`, variantes `_Free`)
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/sku.csv (`ELITE_V_MKIIFIGHTERBAY`, `ELITE_V_MKIIFIGHTERBAY_FREE`, `ELITE_V_MKIFIGHTERBAY_FREE` : « early access purchase in the arx store »)
- https://api.github.com/repos/EDCD/FDevIDs/commits?path=outfitting.csv (commit unique du 3 juillet 2026, « new commodity and modules for Operations & Nomad update »)

### 14. Nombre de vaisseaux jouables — périmètre des décomptes 47, 48 et 52

**Réponse canonique : 48 vaisseaux jouables, entendus comme les châssis pilotables achetables au chantier naval.**

Entrée ajoutée le **10 septembre 2026**. Le fait 8 avait déjà tranché ce décompte, mais il l'avait fait à l'intérieur du
dossier « Nomad », où il restait difficile à retrouver. Il est promu ici en fait autonome, et les trois catalogues ont
été recomptés une seconde fois, en direct, le 10 septembre 2026.

**Ce que le mot « vaisseau jouable » recouvre, et ce qu'il exclut.** Un vaisseau jouable est un **châssis que le
commandant achète, possède et pilote depuis un chantier naval** (*shipyard*). Cette définition exclut par construction
trois familles de véhicules, qu'aucun des décomptes ci-dessous ne compte : les **SRV** (Scarab, Scorpion, **Rhino**),
les **chasseurs embarqués** (SLF) et les **vaisseaux lancés depuis un vaisseau** (SLV, dont le **Nomad**). C'est la
confusion de ces périmètres qui a produit l'erreur documentée au fait 8.

**Les trois décomptes, recomptés le 10 septembre 2026.**

| Catalogue                                       | Entrées | Périmètre réel du catalogue                                                    |
|-------------------------------------------------|---------|---------------------------------------------------------------------------------|
| `inara.cz/elite/ships/`                         | **48**  | Vaisseaux de chantier naval. Page unique, sans pagination ni doublon.           |
| `EDCD/FDevIDs`, `shipyard.csv`                  | **48**  | Idem — liste nominalement identique à celle d'Inara, nom pour nom.              |
| `EDCD/coriolis-data`, répertoire `ships/`        | **47**  | Idem, **moins le Lynx Highliner**, que Coriolis n'a toujours pas modélisé.      |

Les deux premières listes coïncident nom pour nom, Kestrel Mk II, Caspian Explorer et **Lynx Highliner** compris. La
troisième contient 47 fichiers de modèle de vaisseau (48 entrées de répertoire, dont un `index.js` qui n'est pas un
vaisseau), et le seul absent est bien le Lynx Highliner.

**Ce que cela tranche pour l'attribution du chiffre 47.** Le décompte de **47 ne se rapporte pas à Inara** : il se
rapporte à `EDCD/coriolis-data`. Toute formulation du corpus qui attribue 47 à Inara, ou qui présente le Lynx Highliner
comme manquant chez Inara, est fautive et doit être corrigée — le Lynx Highliner figure bien à l'inventaire d'Inara et
de `shipyard.csv`. À la date de cette entrée, les guides du corpus qui emploient le chiffre 47 le rattachent
correctement à EDCD/coriolis-data : voir [03-vaisseaux.md](./03-vaisseaux.md), qui pose 48 vaisseaux d'après Inara et
précise que Coriolis n'en référence que 47.

**Ce que cela tranche pour le chiffre 52.** Le décompte de **52** relevé lors d'une revérification antérieure de la page
Inara **n'a pas pu être reproduit**, ni le 9 ni le 10 septembre 2026. Le relevé du 10 septembre 2026 a été fait sur le
HTML brut de la page, en dénombrant les liens `/elite/ship/<n>/` distincts : il en donne exactement 48, sans pagination.
Le chiffre 52 est donc écarté ; il provient vraisemblablement d'un comptage incluant des lignes qui ne sont pas des
fiches de vaisseau. Conformément à la note d'usage, il ne doit pas être réintroduit dans les guides.

**Conséquence pour le corpus.** Le corpus retient **48 vaisseaux jouables**. Un guide qui cite 47 doit nommer
`EDCD/coriolis-data` comme périmètre et dire que le Lynx Highliner en est le seul absent. L'ajout du Nomad, du Rhino ou
de tout SLF ne modifie pas ce nombre : ces véhicules relèvent d'autres catégories (faits 4, 8 et 13). Ce décompte est
**volatil par nature** — chaque nouveau vaisseau l'incrémente — et doit être revérifié à chaque mise à jour introduisant
un châssis.

**Sources :**
- https://inara.cz/elite/ships/ (page récupérée en HTML brut le 10 septembre 2026, HTTP 200 : 48 liens `/elite/ship/<n>/`
  distincts, du Adder au Vulture, Lynx Highliner inclus ; aucune pagination, aucun Scarab, Scorpion ni Rhino)
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/shipyard.csv (relevé du 10 septembre 2026 : 48 lignes de
  vaisseau, liste nominalement identique à celle d'Inara)
- https://api.github.com/repos/EDCD/coriolis-data/contents/ships (relevé du 10 septembre 2026 : 47 fichiers de modèle de
  vaisseau plus `index.js` ; aucune occurrence de « lynx »)
- [Fait 8](#8-vaisseau--nomad---premier-ship-launched-vessel-slv-du-jeu-sorti-le-30-juin-2026) (premier arbitrage de ce décompte, le 9 septembre 2026) et
  [Règle de méthode : ce que prouve une absence](#règle-de-méthode--ce-que-prouve-une-absence)

---

## Registre d'incertitudes du corpus

Ajouté le 13 septembre 2026 (chantier 16). Ce document arbitrait déjà des **dates** contradictoires ; cette section
étend son rôle à toute **incertitude non datée** admise en prose par un guide, quelle que soit sa nature (prix,
mécanique, attribution, décompte). Trois cycles avaient laissé s'accumuler 174 aveux d'incertitude dispersés dans le
corpus, chacun noyé dans son propre paragraphe — un registre central permet de les revoir tous d'un coup après un
cycle, et de vérifier qu'un renvoi « à trancher » pointe encore vers une entrée qui existe.

Ce premier passage migre les admissions des cinq guides les plus denses en aveux d'incertitude, identifiés par
l'audit du cycle 3 : [07-equipement-a-pied.md](./07-equipement-a-pied.md) (30 entrées),
[27-debuter-et-progresser.md](./27-debuter-et-progresser.md) (18), [14-rhino.md](./14-rhino.md) (16),
[20-minage.md](./20-minage.md) (17) et [18-colonisation.md](./18-colonisation.md) (11) — **92 entrées** au total, contre
les ~81 estimées par l'audit ; l'écart vient d'un relevé plus fin que le comptage original, pas d'un ajout de contenu.
Les autres guides du corpus conservent leurs propres aveux d'incertitude en prose pour l'instant : les y migrer aussi
est un travail mécanique de même nature, non fait ici faute de temps, à reprendre pour les guides restants dans un
prochain chantier.

**Lecture de la colonne Confiance** : échelle à quatre valeurs de
[00-methodologie-sourcing.md §2](./00-methodologie-sourcing.md#2-échelle-de-confiance--quatre-valeurs-un-seul-vocabulaire).
La colonne « Ce qui manque pour trancher » fait aussi office de « source à consulter » quand l'aveu d'origine la
nomme : les deux se recoupaient presque toujours dans le texte source, et les séparer aurait dupliqué la même
information dans deux colonnes.

### 07-equipement-a-pied.md — 30 entrées (dernier examen : 2026-09-13)

| Question | Ce que le corpus retient | Confiance | Ce qui manque pour trancher |
|---|---|---|---|
| Le Carbon Fibre Plating / Titanium Plating s'achètent-ils au barman comme l'Aerogel ? | Achat au barman déduit par analogie de type (Asset) | Basse | Tarif de comptoir relevé pour ces deux composants |
| Le chiffre de 56 recettes de Manufacturing Instructions est-il vérifié ? | Calcul arithmétique (3+11)×4=56, ordre de grandeur retenu | Basse | Catalogue réel des onze armes supposées, jamais établi |
| Combien de points de bouclier personnel par grade de combinaison ? | Rien de chiffré, seule la progression par paliers est connue | Non confirmé | Toute donnée locale (blueprints.json, FDevIDs, coriolis-data) |
| Combien de points de vie possède le commandant ? | Aucune valeur avancée | Non confirmé | Statistique dans les jeux de données locaux |
| Quelle est la capacité de base du sac à dos par combinaison ? | Seule la modification qui l'augmente est documentée | Non confirmé | Valeur de base chiffrée |
| Quelle est la réserve d'oxygène de base par combinaison ? | Seule la modification qui la double est documentée | Non confirmé | Valeur de base chiffrée |
| Le nombre d'emplacements d'armes de la Dominator est-il chiffré par une source fiable ? | Deux emplacements principaux affirmés | Basse | Relevé chiffré ; l'affirmation reste communautaire |
| Les montants en crédits des paliers de combinaison sont-ils fiables ? | Chiffres repris du wiki Fandom, matériaux corroborés par Inara | Basse | Confirmation en jeu ; Inara n'en liste aucun |
| Le plafond de 9 999 Merc Coin et l'allocation hebdo de 1 000 sont-ils officiels ? | Chiffres avancés par une étude interne du dépôt | Basse | Corroboration par une annonce officielle Frontier |
| Takada a-t-il au moins un modèle d'arme nommé confirmé ? | Kinematic Armaments et Manticore ont des modèles confirmés | Non confirmé | Une source consultable rattachant un modèle à Takada |
| Quel est le type / type de dégâts du Manticore Intimidator ? | Nom et fabricant confirmés par un billet officiel | Non confirmé | Type d'arme et type de dégâts, non déductibles sans risque |
| Le jeu compte-t-il cinq ou onze armes à pied au total ? | Cinq armes documentées par une source citable | Non confirmé | Confirmation ou infirmation du chiffre de onze |
| Quelles sont les stats de combat (dégâts, cadence, DPS, portée) des armes à pied ? | Rien n'est chiffré localement, jugé préférable à l'invention | Non confirmé | Toute source locale reproductible |
| La fourchette de prix des échantillons du Genetic Sampler (50 000-1 000 000 Cr) est-elle à jour ? | Fourchette capturée le 9 septembre 2026 | Moyenne | Revérification sur Inara ou en jeu |
| Peut-on vraiment gagner ≈250 M Cr en deux heures d'exobiologie ? | Chiffre relayé d'un guide communautaire de 2025 | Basse | Une moyenne garantie plutôt qu'une estimation ponctuelle |
| La montée en grade améliore-t-elle Wave Scanner / Profile Analyser / Compact Multi-Tool ? | Effet attendu décrit (portée, fiabilité, marge de manœuvre) | Basse | Confirmation dans les sources consultées |
| Existe-t-il des blueprints d'Engineer dédiés aux quatre outils à pied ? | Rien n'infirme ni ne confirme leur existence | Non confirmé | Documentation communautaire à jour confirmant ou non |
| Quelles sont les spécialités suit d'Eleanor Bresa ? | Rien n'est reconstitué pour cet Engineer | Non confirmé | Toute ligne vérifiée la mentionnant |
| Quelles sont les spécialités arme des quatre Engineers de Colonia ? | Seules certaines spécialités suit ont pu être reconstituées | Non confirmé | Toute source sur le volet armes |
| Existe-t-il un effet expérimental distinct de l'effet primaire à pied ? | Seul un système d'emplacements de modification uniques est confirmé | Non confirmé | Toute preuve d'un second emplacement d'effet expérimental |
| Les modifications de combinaison ont-elles des paliers G1-G5 comme les modules de vaisseau ? | Colonne « Grade des matériaux » volontairement non chiffrée | Non confirmé | Toute source détaillant un tel palier à pied |
| Les quatorze coûts en crédits des mods de combinaison sont-ils tous vérifiés indépendamment ? | Six montants revérifiés et confirmés exacts | Moyenne | Recoupement indépendant pour les huit autres montants |
| Les modifications d'armes ont-elles des paliers de matériaux détaillés ? | Effet et Engineer(s) connus par modification | Non confirmé | Détail des paliers de matériaux |
| Un effet expérimental existe-t-il pour les modifications d'armes à pied ? | Renvoi à la note méthodologique générale | Non confirmé | Confirmation indépendante par modification |
| Les 33 recettes modification × fabricant sont-elles toutes connues ? | Six recettes sur trente-trois effectivement relevées | Basse | Source consultable pour les 27 autres cellules |
| À quel fabricant s'appliquent les recettes de Scope, Noise Suppressor et Faster Handling ? | Trois recettes précises connues (matériaux, coût) | Basse | Attribution à un fabricant d'arme précis |
| Les quantités de matériaux des recettes d'armes sont-elles vérifiées ? | Les 32 noms de matériaux existent, orthographe confirmée | Moyenne | Vérification indépendante des quantités |
| Quel est le montant exact du rebuy à la mort à pied ? | Un coût d'assurance modéré est bien appliqué | Non confirmé | Confirmation du montant exact (403 sur forums.frontier.co.uk) |
| Le Caspian Explorer est-il lié à un plafonnement de l'ingénierie de combat à pied ? | Association reprise par cohérence avec 09-combat-a-pied | Basse | Vérification directe dans les notes de patch (403) |
| Le Kestrel Mk II est-il sorti le 24 février 2026 ? | Date retenue, corroborée indirectement par un commit EDCD/FDevIDs | Moyenne | Confirmation directe par une source officielle datée — **tranché depuis par le [fait 6](#6-kestrel-mk-ii--date-de-sortie) de ce document, à confiance haute** |

### 27-debuter-et-progresser.md — 18 entrées (dernier examen : 2026-09-13)

| Question | Ce que le corpus retient | Confiance | Ce qui manque pour trancher |
|---|---|---|---|
| Les seuils numériques exacts de progression de rang ont-ils été publiés par Frontier ? | Rangs suivis via score/expérience approximative | Non confirmé | Toute publication officielle d'un barème chiffré |
| Le menu Pilot Training compte-t-il ≈9 simulations et ≈10 défis ? | Décompte relevé sur un guide communautaire récent | Basse | Confirmation par une page officielle (HTTP 403) |
| Combien de temps dure chaque scénario de Pilot Training ? | Estimation indicative de 10 à 20 minutes | Basse | Aucune durée officielle confirmée |
| La portée de saut stock du Hauler (12,1 al) est-elle à jour ? | Valeur reprise telle quelle de 03-vaisseaux.md | Moyenne | Recoupement par une recherche web indépendante |
| Existe-t-il des Cr/h fiables pour un vaisseau starter non ingénierié ? | Comparatif qualitatif proposé à la place de chiffres | Non confirmé | Source ayant confirmé des chiffres Cr/h fiables et à jour |
| Comment débloquer The Dweller (500 000 Cr ou 5 marchés noirs) ? | Deux conditions rapportées, sans trancher | Basse | Confirmation par 06-ingenieurs.md ou en jeu |
| Tod McQuinn exige-t-il 15 bons de prime + 100 000 Cr ? | Chiffres rapportés tels quels | Basse | Recoupement avec une source primaire |
| Lei Cheung exige-t-il 50 marchés visités + 200 unités d'or ? | Chiffres rapportés tels quels | Basse | Recoupement avec une source primaire |
| Les conditions de déblocage des Ingénieurs secondaires sont-elles corroborées par une 3ᵉ source ? | Seul le rang « Scout » de Farseer est corroboré en interne | Basse | Recoupement avec une troisième source primaire |
| Existe-t-il une échelle de paliers ordonnée pour le rang Mercenaire ? | Existence de la filière attestée | Non confirmé | Une source donnant l'échelle de paliers ordonnée |
| Connaît-on l'échelle complète et ordonnée des paliers de rang CQC ? | Inara montre les paliers hauts (Legend, Hero, Elite I/III/V) | Basse | Les paliers bas et intermédiaires |
| Le multiplicateur exact du score pondéré de rang de combat est-il connu ? | Principe du score pondéré par rang d'adversaire établi | Non confirmé | Le multiplicateur exact, jamais publié par Frontier |
| L'ordre exact des paliers du rang Exobiologiste est-il fiable ? | Ordre reconstitué à partir d'un seul article Canonn | Basse | Accès au wiki Fandom et aux forums officiels |
| Achat-revente, minerai et missions comptent-ils à parts égales pour le rang Commerce ? | Rang progresse selon le profit cumulé, sans plus de détail | Non confirmé | Confirmation du mécanisme exact par une source primaire |
| La contrebande (marché noir) fait-elle progresser le rang Commerce comme une vente standard ? | Rendement chiffré ailleurs dans le corpus (≈90 M Cr/h) | Non confirmé | Confirmation que le marché noir compte comme vente standard |
| La liste des quatre vaisseaux jouables en CQC est-elle sourcée ? | Liste reprise de 23-jeu-en-groupe.md | Basse | Une source citée ; risque de confusion F63 Condor/Multicrew |
| Quels sont le nom exact et le nombre de modes de jeu du CQC ? | Hypothèse Deathmatch / Team Deathmatch / Domination | Basse | Confirmation de cette hypothèse |
| Existe-t-il un horaire ou une fréquence recommandé pour trouver un match CQC ? | Aucune recommandation formulée | Non confirmé | Statistique de fréquentation du mode en 2025-2026 |

### 14-rhino.md — 16 entrées (dernier examen : 2026-09-12)

| Question | Ce que le corpus retient | Confiance | Ce qui manque pour trancher |
|---|---|---|---|
| Le constructeur Vodel est-il rattaché à Core Dynamics ? | Rattachement mentionné ailleurs dans le corpus | Basse | Confirmation officielle Frontier |
| Les numéros de version 4.4.1.0/4.4.1.1 attribués au Rhino sont-ils corrects ? | Numéros jugés plausibles mais non établis | Basse | Accès aux pages de notes de version officielles (HTTP 403) |
| Quelles sont les caractéristiques chiffrées du Rhino (vitesse, soute, blindage) ? | Aucune valeur retenue | Non confirmé | Communication officielle Frontier |
| Le hotfix portant la collecte de 9 à 12 fragments est-il déjà livré ? | Collecte considérée comme encore à 9 fragments | Non confirmé | Billet officiel confirmant le hotfix livré |
| La liste de 3 vaisseaux compatibles rapportée par massivelyop.com est-elle exhaustive ? | Sous-ensemble jugé incomplet du Mk I Vessel Bay | Basse | Liste officielle spécifique au Rhino |
| Quelle est la répartition réelle des trois sièges du Rhino ? | Répartition plausible déduite par le guide | Basse | Attribution officielle des rôles par Frontier |
| Le Rhino suit-il la règle générale d'absence de coût de rebuy des SRV ? | Probable par analogie, non confirmé | Basse | Confirmation explicite de Frontier |
| Le rééquilibrage du 2 sept. 2026 s'étend-il au minage d'astéroïdes ? | Guide limite la portée à la seule boucle de surface | Non confirmé | Source tranchant explicitement le périmètre |
| Les 13 nouvelles matières sont-elles des marchandises ou du matériel d'ingénierie ? | Terme « commodities » oriente vers marchandises | Basse | Vérification directe à l'écran de marché en jeu |
| Quels sont les prix de revente des 13 nouvelles matières du Rhino ? | Tableau laissé en « squelette à compléter » | Non confirmé | Relevé de prix (Inara, EDDB) |
| Le Rhino sera-t-il disponible à l'achat en crédits plus tard ? | Pratique habituelle de Frontier le suggère, sans engagement | Non confirmé | Annonce officielle documentée |
| La soute du Scorpion est-elle de 2 t ou de 30 t ? | Contradiction non tranchée, suspicion d'erreur d'affichage | Basse | Clarification officielle de l'écart |
| Le bouclier du Scarab est-il de 40 (officiel) ou 25 (wiki) ? | Valeur du site officiel retenue par défaut | Basse | Source expliquant l'écart wiki/officiel |
| Un second joueur peut-il rejoindre à distance le siège arrière d'un Scorpion déjà déployé ? | Mécanisme débattu par la communauté | Basse | Confirmation officielle Frontier |
| Les prix d'achat du Scarab (5 270 Cr) et du Scorpion (24 863 Cr) sont-ils fiables ? | Valeurs données, sourcées au seul wiki communautaire | Basse | Confirmation via inara.cz (resté inaccessible) |
| Existe-t-il un seuil chiffré officiel de dégâts de chute pour les SRV ? | Aucune valeur donnée | Non confirmé | Publication officielle de Frontier |

### 20-minage.md — 17 entrées (dernier examen : 2026-09-13)

| Question | Ce que le corpus retient | Confiance | Ce qui manque pour trancher |
|---|---|---|---|
| Quel est le rôle fonctionnel exact du Sub-Surface Extraction Missile ? | Existence et specs confirmées ; rôle précis non établi | Basse | Notes de patch descriptives |
| Quels vaisseaux/classes de module permettent d'embarquer un Rhino ? | Rien publié officiellement | Non confirmé | Liste officielle Frontier |
| Le Rhino sera-t-il vendu en crédits au chantier naval ? | Billets ne mentionnent que l'achat en Arx | Basse | Confirmation ou infirmation explicite |
| Quelle est la relation exacte entre une Location et un Deposit de minage ? | Deux échelles distinctes citées sans lien expliqué | Basse | Description explicite de Frontier |
| Le passage de 9 à 12 fragments est-il déjà déployé ? | Correction annoncée « dès que possible », non confirmée livrée | Non confirmé | Numéro de version / date du correctif |
| Quels prix de vente et usages en ingénierie pour les 13 nouvelles marchandises ? | Rien précisé par Frontier | Non confirmé | Établir en jeu ou via outil de marché vivant |
| Le rééquilibrage du 2 sept. 2026 touche-t-il aussi le minage d'astéroïdes ? | Tout indique un rééquilibrage limité à la surface | Non confirmé | Délimitation explicite du périmètre par Frontier |
| Existe-t-il un système hotspot confirmé pour le Platine ? | Aucun système précis confirmé | Non confirmé | Outils bloqués (CAPTCHA / résultats hors-sujet) |
| Existe-t-il un système reconnu spécifiquement pour les Low Temperature Diamonds seuls ? | Aucun trouvé ; « 17 Lyrae » infirmé par EDSM | Non confirmé | Vérification indépendante d'un système LTD dédié |
| Les étapes décrites pour Spansh Ring Finder correspondent-elles à l'interface actuelle ? | Étapes reposent sur le fonctionnement générique connu | Basse | Vérification directe (page 100 % JS dynamique) |
| La table de correspondance minerai × technique × anneau est-elle une donnée officielle ? | Synthèse de deux relevés communautaires distants de 7 ans | Basse | Table de distribution officielle Frontier |
| Quel est le type d'anneau des 16 marchandises sans donnée établie ? | Case laissée vide plutôt que devinée | Non confirmé | Source confirmant le mode d'obtention |
| Existe-t-il un seuil de réserve minimale conseillé par minéral ? | Seule règle générale établie (viser Pristine) | Non confirmé | Donnée chiffrée par minéral |
| Quel est le rendement en tonnes par minéral extrait ? | Seuls des Cr/h existent pour 5 métaux, pas de tonnage | Non confirmé | Source publiant un rendement en tonnes |
| Le chiffre de 3,5 Md Cr/cycle pour le wing mining PTN est-il fiable ? | Chiffre cité par la presse spécialisée, non confirmé par PTN | Basse | Statistique publiée par PTN lui-même |
| Les bonus miniers de Torval/Kaine (+45 %/+50 %) sont-ils toujours d'actualité ? | Taux anciens cités communautairement, non revérifiés | Basse | Accès complet aux fiches Power sur Inara.cz (accès partiel) |
| Le minage rapporte-t-il vraiment 25 000-75 000 mérites Powerplay/heure ? | Chiffre cité communautairement, non confirmé | Basse | Vérification au cas par cas |

### 18-colonisation.md — 11 entrées (dernier examen : 2026-09-13)

| Question | Ce que le corpus retient | Confiance | Ce qui manque pour trancher |
|---|---|---|---|
| Que devient la 3ᵉ faction héritée (13 %) si le joueur n'a pas d'escadron ? | Mécanisme non précisé pour ce cas | Non confirmé | Documentation officielle du cas sans escadron |
| Le problème de sniping des revendications a-t-il été résolu par le Dodec Update ? | Corrections d'interface mentionnées, disparition du sniping non confirmée | Basse | Confirmation explicite de Frontier |
| Quelle est l'ampleur exacte de chaque installation sur les statistiques système ? | Chevrons indicatifs seulement, effet non quantifié | Non confirmé | Documentation officielle détaillée |
| Quel est l'effet précis de la Richesse et du Niveau de vie sur un système ? | Effet qualitatif connu, non chiffré | Non confirmé | Confirmation officielle détaillée |
| Quelle est la capacité de fret réelle du Panther Clipper Mk II en colonisation ? | Non chiffrée dans ce guide | Non confirmé | Vérification/source pour ce vaisseau |
| Quelle portée de saut atteint un porteur de fret ingénieré (FSD amélioré) ? | Recommandation qualitative seulement | Non confirmé | Simulateur externe accessible (Coriolis/EDSY) pour un chiffrage exact |
| Le contrôleur de limpets collecteurs est-il vraiment utile en contexte de colonisation ? | Recommandation déduite de la mécanique générale | Basse | Témoignage communautaire direct sur ce point précis |
| Combien de « charges de Cutter » faut-il pour un avant-poste / un Orbis ? | Ordre de grandeur communautaire (29 / 267 charges) retenu | Basse | Configuration exacte (bouclier ou non) du Cutter de référence |
| Les noms anglais complets de SCCN et CTN sont-ils exacts ? | Traduction littérale du tchèque retenue par défaut | Basse | Confirmation du nom anglais officiel |
| Quelle est la formule exacte du revenu hebdomadaire et du facteur « Chance » ? | Formule communautaire non officielle avancée à titre indicatif | Non confirmé | Documentation officielle de Frontier |
| La pondération chiffrée du port primaire (Dodec Update) est-elle avérée ? | Chiffrage antérieur retiré du guide | Non confirmé | Source postérieure à juin 2025 confirmant un rééquilibrage chiffré |

**Test de non-régression.** Tout renvoi « trancher via 00-chronologie » ajouté dans l'un des 32 guides doit correspondre
à une entrée existante de ce registre ou de la table de réconciliation ci-dessus ; une entrée résolue doit être
retirée d'ici **et** de son guide d'origine dans le même geste, pour que les deux ne divergent jamais.

## Règle de méthode : ce que prouve une absence

Entrée ajoutée le 9 septembre 2026. Elle ne porte sur aucun fait du jeu : elle énonce la règle de raisonnement dont la
violation a produit les deux erreurs les plus coûteuses de ce document, et elle s'applique à toute révision future.

**Énoncé.** *Une absence dans une liste ne vaut preuve d'inexistence que si la liste a vocation à contenir l'objet
cherché.* Chercher un objet dans un catalogue qui, par construction, n'en recense pas la catégorie, puis conclure de
son absence qu'il n'existe pas, est une erreur de catégorie : le résultat négatif était garanti d'avance, quelle que
soit la réalité.

**Le cas qui a fondé la règle.** Le 8 septembre 2026, ce document a conclu à l'inexistence du vaisseau « Nomad » parce
qu'il ne figurait ni dans la liste des vaisseaux d'Inara.cz ni dans le fichier `shipyard.csv` d'EDCD. Or ces deux
catalogues ne recensent que les **vaisseaux pilotables achetables au chantier naval**. Ils ne contiennent ni les SRV
(Scarab, Scorpion, Rhino), ni les chasseurs embarqués (SLF), ni les vaisseaux lancés depuis un vaisseau (SLV) — donc
pas le Nomad, qu'il existe ou non. Le fait 3 relevait de la même famille d'erreur : un article encyclopédique
généraliste et un fil GalNet in-univers ne recensent pas les mises à jour techniques du jeu.

**Le test de contrôle, en une opération.** Avant de tirer argument d'une absence, interroger le même catalogue sur un
**objet témoin** : un objet de même nature dont l'existence n'est contestée par personne. Si le témoin est absent lui
aussi, le catalogue est hors périmètre et le résultat ne vaut rien. Appliqué ici le 9 septembre 2026, le test est
immédiat et sans appel : la liste des vaisseaux d'Inara ne contient **aucune** occurrence de « Scarab », « Scorpion »
ni « Rhino », alors que ces trois SRV existent depuis des années. L'absence du Nomad y était donc non informative.

**Procédure à suivre avant d'inscrire une réponse « non confirmé » dans la table.**

1. **Nommer la catégorie** de l'objet cherché (vaisseau de chantier naval, SRV, SLF, SLV, module, mise à jour,
   événement de lore) avant de choisir la source.
2. **Vérifier le périmètre déclaré** du catalogue interrogé, et non son nom : `shipyard.csv` dit « shipyard », pas
   « véhicules ».
3. **Passer le test de l'objet témoin.** Un catalogue qui rate le témoin est écarté du dossier, pas versé au
   raisonnement.
4. **Distinguer le silence attendu du silence informatif.** Un silence qui s'explique par l'implémentation ou par le
   périmètre de l'outil ne réfute rien (voir la deuxième règle de la note d'usage).
5. **Épuiser les points d'accès de repli avant de conclure.** Une série d'erreurs HTTP 403 sur les domaines officiels
   n'est pas une absence de source : le flux Steam News de Frontier republie ces mêmes annonces sans blocage.
6. **Consigner les sources écartées et le motif de leur écart**, afin qu'une révision ultérieure puisse rejuger le
   dossier au lieu de refaire la recherche.

**Corollaire pour la rédaction des guides.** Une entrée « non confirmé » autorise à signaler qu'une affirmation n'a pas
pu être étayée. Elle n'autorise jamais à écrire qu'un objet n'existe pas, ni à instruire le reste du corpus de taire
ses caractéristiques : c'est ce glissement du « non confirmé » à l'« inexistant » qui a fait retirer de onze guides du
contenu parfaitement réel.

## Historique des révisions de ce document

**Document établi le 8 septembre 2026. Révisé le 9 septembre 2026** : portée étendue au dépôt entier, faits 3 et 8
inversés, fait 13 ajouté, puis — dans une seconde passe le même jour, après restauration effective des guides —
relevé complet du flux d'annonces 2026 ajouté, faits 4, 6 et 7 renforcés sur source primaire, faits 3, 8 et 13
complétés et corrigés, décompte des catalogues de vaisseaux tranché, et règle de méthode sur la valeur probante d'une
absence formulée en section propre. **Révisé le 10 septembre 2026** : fait 14 ajouté (décompte des vaisseaux jouables
recompté en direct sur les trois catalogues et promu en fait autonome), table de réconciliation regroupée par thème et
numérotée, faits 3, 8 et 13 découpés en sous-sections, et règle de méthode déplacée en fin de document.
**Révisé le 13 septembre 2026** : chronologie complète du jeu ajoutée (43 jalons, Kickstarter 2012 → aujourd'hui),
avec deux corrections de dates propagées vers d'autres guides du corpus (Fleet Carrier : 9 juin 2020, pas le 9 avril ;
généralisation du SCO : Updates 18.02-18.04 d'avril-mai 2024, pas Ascendancy ni l'Update 17).
**Révisé une seconde fois le 13 septembre 2026** (chantier 16) : ajout du registre d'incertitudes du corpus (92
entrées migrées depuis 07-equipement-a-pied, 27-debuter-et-progresser, 14-rhino, 20-minage et 18-colonisation) ;
portée du présent document explicitement étendue à toute incertitude non datée, pas aux seuls faits chronologiques.
L'échelle de confiance à trois valeurs de ce document est désormais généralisée à quatre valeurs (ajout de *basse*)
dans [00-methodologie-sourcing.md](./00-methodologie-sourcing.md), document créé le même jour, qui tranche aussi la
fiabilité de MassivelyOP comme source de presse (P3, confirmée sur cinq articles relus en direct).
