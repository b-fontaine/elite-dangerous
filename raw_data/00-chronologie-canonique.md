# Chronologie canonique — Elite Dangerous

**Document établi le 8 septembre 2026.**

## Note d'usage

Ce document fait **foi** pour toute date, tout nom de fabricant ou toute affirmation factuelle citée ailleurs dans ce corpus de guides et qui serait contredite par ce qui suit. Il a été produit par un travail de réconciliation croisant plusieurs sources primaires et secondaires (billets officiels Frontier Developments relayés sur Steam News, pages officielles elitedangerous.com, GalNet, bases communautaires Inara.cz et EDCD/FDevIDs, Wikipédia) afin de trancher des contradictions relevées entre différents guides du corpus.

Règles d'usage :

- **En cas de conflit** entre une date/un fait donné dans un autre fichier du corpus et une entrée de la table ci-dessous, **c'est la réponse canonique de ce document qui prévaut**.
- La colonne **Confiance** indique le niveau de certitude de la réconciliation : *haute* (plusieurs sources primaires convergentes), *moyenne* (corroboration indirecte ou partielle), *non confirmé* (aucune source fiable trouvée — le fait d'origine est probablement erroné ou fabriqué, à traiter avec prudence plutôt qu'à corriger par une valeur de remplacement).
- Pour les entrées à confiance *non confirmé*, ne pas réintroduire l'une ou l'autre des dates contradictoires d'origine dans les guides : signaler plutôt l'absence de confirmation.
- Le détail des sources et du raisonnement complet pour chaque fait se trouve dans la section « Détails par fait » après la table.
- Limite méthodologique générale : plusieurs domaines officiels (elitedangerous.com, forums.frontier.co.uk, community.elitedangerous.com) et certains wikis communautaires (fandom) ont renvoyé des erreurs HTTP 403/402 (blocage anti-bot) lors des vérifications. Les conclusions s'appuient donc, quand la source officielle directe n'était pas accessible, sur des mirroirs fiables et mutuellement cohérents (Steam News de Frontier, archives Wayback Machine, Inara.cz, EDCD/FDevIDs, Wikipédia).

## Table de réconciliation

| Fait | Réponse canonique | Confiance | Sources (voir détails) |
|---|---|---|---|
| **Powerplay 2.0 / Ascendancy** | Sortie le **31 octobre 2024**, dans le cadre de l'extension "Elite Dangerous: Ascendancy". Le 26 février 2025 est une date réelle mais correspond à une mise à jour différente ("Trailblazers"), probablement confondue par erreur avec Powerplay 2.0. | Haute | Steam News Frontier (billets d'annonce, report, confirmation de sortie, suivi) — [détails](#1-powerplay-20--ascendancy) |
| **Colonisation de systèmes — dates bêta/sortie** | Bêta lancée le **26 février 2025** (mise à jour "Trailblazers", v4.1.0.0) ; le 28 février 2025 est la date du "System Colonisation Guide" explicatif, pas du lancement. Sortie complète le **11 novembre 2025** via le "Dodec Update" (v4.2.2.0), nom officiel bien réel. | Haute | elitedangerous.com (patch notes 4-1-0-0 et 4-2-2-0), Wikipédia — [détails](#2-colonisation-de-systèmes--dates-bêta-et-sortie-complète) |
| **Mode "Operations"** | Aucune source fiable ne confirme l'existence d'un mode multijoueur ou d'une fonctionnalité nommée "Operations" dans Elite Dangerous, ni pour la date de fin juin 2024, ni pour celle du 1er juillet 2026. À traiter comme une entrée non fondée dans le corpus, et non comme une simple confusion entre deux dates réelles. | Non confirmé | Wikipédia (Elite Dangerous, Elite Dangerous: Odyssey), Inara.cz GalNet — [détails](#3-mode-operations) |
| **SRV Rhino — date de sortie** | Sorti le **2 septembre 2026** ("Rhino SRV Update"), confirmé par Frontier ("now live") et par l'article GalNet in-univers daté du 3 septembre 3312 (= 3 septembre 2026 réel). La date "août 2025" d'un guide est erronée (antérieure de plus d'un an à toute mention officielle du Rhino). | Haute | Steam News Frontier, GalNet officiel — [détails](#4-srv-rhino--date-de-sortie) |
| **Caspian Explorer** | C'est un **vaisseau** (grande classe, exploration longue distance, fabriqué par Zorgon Peterson), pas une combinaison ni un patch. Sorti le **2 décembre 2025** via ARX Early Access. La date "janvier 2025" (citée comme date de "patch" dans un guide) est erronée : le vaisseau n'existait pas encore dans les communications officielles avant fin novembre 2025. | Haute | elitedangerous.com/news (flux JSON brut) — [détails](#5-caspian-explorer) |
| **Kestrel Mk II — date de sortie** | Vaisseau de combat léger réel (pas une invention du corpus). Sorti très probablement le **24 février 2026** (et non "février 2025", erreur d'un an) — date corroborée indirectement par un commit EDCD/FDevIDs du 25 février 2026 ajoutant l'entrée au fichier `shipyard.csv`. Aucune source primaire officielle (GalNet, Frontier) n'a pu être consultée directement pour confirmer le jour exact. | Moyenne | EDCD/FDevIDs (`shipyard.csv`, commit du 25/02/2026) — [détails](#6-kestrel-mk-ii--date-de-sortie) |
| **Lynx Highliner — fabricant** | Fabriqué par **Zorgon Peterson** (et non Saud Kruger). Premier vaisseau de croisière/paquebot de ce fabricant, habituellement associé à des vaisseaux de combat — d'où la confusion probable avec Saud Kruger, fabricant "attendu" pour ce type de vaisseau. | Haute | Inara.cz, page officielle elitedangerous.com/store, annonce forums Frontier — [détails](#7-lynx-highliner--fabricant) |
| **Vaisseau "Nomad"** | Aucune source fiable ne confirme l'existence d'un vaisseau nommé "Nomad" dans Elite Dangerous. Absent de la liste complète des 75 vaisseaux d'Inara.cz et de l'article Wikipédia. La question posée par le corpus part probablement d'une prémisse fausse (fan-fiction, rumeur, ou confusion avec un autre jeu/mod). | Non confirmé | Inara.cz (liste des vaisseaux), Wikipédia — [détails](#8-vaisseau-nomad) |
| **Panther Clipper Mk II — date de sortie** | Disponible en jeu depuis le **22 juillet 2025** (ARX Early Access). C'est la toute première incarnation jouable du "Panther Clipper" (le vaisseau original n'était que du lore/teasing jamais rendu jouable), et non une évolution "Mk II" d'un précédent vaisseau jouable. La date de fin d'accès anticipé (passage en achat crédits in-game pour tous) n'a pas pu être confirmée avec certitude (probablement automne 2025). | Moyenne | Wayback Machine (elitedangerous.com/panther-clipper), Wikipédia, Inara.cz — [détails](#9-panther-clipper-mk-ii--date-de-sortie) |
| **Fondation de Colonia / 10e anniversaire** | Colonia (Colonia Hub) a été fondée le **9 septembre 2016** (date réelle ; 9 septembre 3302 en date in-jeu), et non en septembre 2015 comme l'indique un guide — erreur d'un an. Le 10e anniversaire (juillet-août 2026) est authentique et cohérent avec 2016 + 10 = 2026. | Haute | Inara.cz (GalNet mirroré), dépôts communautaires GitHub, Wikipédia FR — [détails](#10-fondation-de-colonia--10e-anniversaire) |

## Détails par fait

### 1. Powerplay 2.0 / Ascendancy

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

### 3. Mode "Operations"

**Réponse canonique : non confirmé — aucune date ne doit être retenue.**

Aucune source fiable ne confirme l'existence d'un mode multijoueur appelé "Operations" dans Elite Dangerous — ni sous la forme récente évoquée (juin 2024 / 1er juillet 2026), ni sous la forme de missions à pied "Operations" d'Odyssey (2021).

Vérifications effectuées :
- L'article Wikipédia sur Elite Dangerous (historique détaillé des mises à jour, y compris 2024-2026) ne mentionne aucune fonctionnalité ou mode nommé "Operations". La grande fonctionnalité de la période 2024-2025-2026 est la "System Colonisation" (annoncée le 20 octobre 2024, bêta le 26 février 2025, sortie complète le 11 novembre 2025) — rien à la date du 1er juillet 2026 ni fin juin 2024.
- L'article Wikipédia sur Elite Dangerous: Odyssey (sorti le 19 mai 2021, ajout du gameplay à pied) ne mentionne pas non plus de mission ou mode appelé "Operations" ; les types de missions à pied d'Odyssey documentés sont plutôt Mercenary, Covert Heist, Salvage, Rescue, Assassination, Exobiology, Ground Combat Zones, etc.
- Le fil d'actualités GalNet agrégé par Inara.cz (base de données communautaire de référence pour Elite Dangerous) ne contient aucune mention d'un mode "Operations" ; les actualités les plus récentes portent sur du contenu minier (SRV Rhino, "Surface Mining Research Initiative", etc.).
- Les tentatives d'accès direct au site officiel elitedangerous.com et aux forums officiels de Frontier (forums.frontier.co.uk) ont été bloquées (erreurs 403/402) et n'ont donc pas pu être consultées directement pour confirmer ou infirmer.

Conclusion : les deux dates données dans le corpus communautaire (fin juin 2024 et 1er juillet 2026) semblent toutes deux erronées ou fabriquées — elles ne correspondent à aucune fonctionnalité "Operations" documentée, multijoueur ou à pied, dans les sources consultées. Il ne s'agit donc probablement pas d'une simple confusion entre deux fonctionnalités réelles (le mode récent vs. les missions Odyssey 2021), mais d'une entrée sans fondement vérifiable dans les deux guides. Aucune date exacte de lancement d'un mode "Operations" ne peut être donnée, faute de toute source fiable l'attestant. Il faudrait qu'un humain consulte directement elitedangerous.com/news, le forum officiel Frontier ou le launcher/patch notes en jeu (inaccessibles depuis l'environnement de vérification) pour trancher définitivement.

**Sources :**
- https://en.wikipedia.org/wiki/Elite_Dangerous
- https://en.wikipedia.org/wiki/Elite_Dangerous:_Odyssey
- https://inara.cz/elite/news/
- https://forums.frontier.co.uk/forums/elite-dangerous.6/ (bloqué, HTTP 403)
- https://www.elitedangerous.com/ (bloqué, HTTP 403)
- https://elite-dangerous.fandom.com/ (bloqué, HTTP 402)

### 4. SRV Rhino — date de sortie

**Réponse canonique : 2 septembre 2026.**

Le SRV 'Rhino' d'Elite Dangerous est sorti le 2 septembre 2026 (mise à jour "Rhino SRV Update", annoncée par Frontier comme "now live" ce jour-là). Cette date est corroborée par le fil officiel GalNet in-univers, dont l'article "Vodel Reveals New SRV Rhino" est daté du 3 septembre 3312 — soit le 3 septembre 2026 en date réelle, compte tenu du décalage constant de +1286 ans utilisé depuis le lancement du jeu (2014 réel = année in-jeu 3300). Un teaser officiel du 6 août 2026 ("Beneath the Surface: Your First Look at the Rhino") annonçait une arrivée "plus tard ce mois-ci" (donc encore en août 2026), mais la sortie effective (mise en ligne du patch) a eu lieu début septembre 2026, pas en août. La date "2 septembre 2026" d'un guide communautaire est donc correcte ; la date "août 2025" d'un autre guide est erronée (elle précède de plus d'un an toute mention officielle connue du Rhino, dont la toute première trace publique est le teaser d'août 2026).

**Sources :**
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320&count=300&maxlength=1000&format=json (article officiel Frontier relayé sur Steam: 'Elite Dangerous | Rhino SRV Update', publié 2026-09-02T11:20:19Z, contenu: 'The Rhino SRV Update is now live')
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320 (article: 'Beneath the Surface: Your First Look at the Rhino', publié 2026-08-06, teaser annonçant une arrivée 'later this month')
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320 (article: 'Elite Dangerous | August Dev Log', publié 2026-08-27)
- https://community.elitedangerous.com/en/galnet (GalNet officiel Frontier: article 'Vodel Reveals New SRV Rhino', daté in-univers '03 SEP 3312' = 3 septembre 2026 date réelle)
- https://en.wikipedia.org/w/index.php?title=Elite_Dangerous&action=raw (confirme l'existence du SRV Rhino aux côtés du Scarab et du Scorpion, sans date de sortie précise)

### 5. Caspian Explorer

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

**Réponse canonique : très probablement le 24 février 2026 (confiance moyenne).**

Le "Kestrel Mk II" est un vaisseau de combat léger (petite plateforme d'atterrissage) réellement présent dans Elite Dangerous — ce n'est pas une invention du corpus communautaire. D'après la base de données technique EDCD/FDevIDs (dépôt communautaire de référence qui extrait les identifiants et libellés exacts des fichiers du jeu de Frontier, et qui alimente en amont la quasi-totalité des outils tiers d'Elite Dangerous — EDDN, Coriolis, EDSY, Inara, etc.), l'entrée "Kestrel Mk II" (ID 129039241, symbole interne "SmallCombat01_NX", entitlement "ELITE_V_SMALL_COMBAT_01", vendu en accès anticipé sur la boutique Arx) a été ajoutée au fichier shipyard.csv par un commit intitulé "new ship with modules: Kestrel Mk II" (auteur Bernd Gollesch, mainteneur EDCD de longue date), daté du 25 février 2026. Ce type de commit est historiquement posté le jour même ou le lendemain de l'apparition du contenu dans le jeu (dès que les fichiers/journal du client sont mis à jour côté joueurs). Cela concorde très précisément avec la date du 24 février 2026 citée dans l'un des deux guides communautaires, et contredit la date de "février 2025" citée dans l'autre. L'hypothèse de confusion d'année se confirme donc : la date correcte la plus probable est le 24 février 2026 (jour de sortie en jeu), et "février 2025" est très vraisemblablement une erreur de transcription d'un an.

Cette date exacte n'a toutefois pas pu être confirmée via une source primaire officielle (site elitedangerous.com et wiki communautaire fandom ont renvoyé des erreurs HTTP 403/402 pendant la recherche, Reddit et Wayback Machine étaient inaccessibles, budget de recherche web épuisé), donc la date précise "24 février" repose sur une corroboration technique indirecte (commit EDCD) plutôt que sur une annonce GalNet ou Frontier directement lue. D'où la confiance *moyenne* et non *haute* pour ce fait.

**Sources :**
- https://raw.githubusercontent.com/EDCD/FDevIDs/master/shipyard.csv
- https://github.com/EDCD/FDevIDs/commit/779263a286c2bcdf4e2c0761eb16df63de01de61
- https://api.github.com/repos/EDCD/FDevIDs/commits?path=shipyard.csv&per_page=20
- https://en.wikipedia.org/wiki/Elite_Dangerous

### 7. Lynx Highliner — fabricant

**Réponse canonique : Zorgon Peterson (et non Saud Kruger).**

Le Lynx Highliner est fabriqué par Zorgon Peterson, et non par Saud Kruger. Il s'agit du premier vaisseau de Zorgon Peterson sur le marché des paquebots/liners de passagers (un fabricant jusque-là plutôt connu pour des vaisseaux de combat comme l'Adder, le Fer-de-Lance, le Krait Mk II/Phantom ou le Mamba) — d'où probablement la confusion dans le corpus communautaire, Saud Kruger étant le fabricant "attendu" pour ce type de vaisseau de croisière (Orca, Beluga Liner, Dolphin). La page produit officielle et l'annonce sur les forums Frontier utilisent la formule « Entering/Expanding into the passenger liner market, Zorgon Peterson presents/introduces the Lynx Highliner », et la base communautaire Inara confirme « Manufacturer: Zorgon Peterson ». Le guide affirmant "Saud Kruger" est donc erroné et doit être corrigé.

**Sources :**
- https://inara.cz/elite/ship/87/ (fetch direct, confirme "Manufacturer: Zorgon Peterson")
- https://inara.cz/elite/ships/ (liste des vaisseaux, confirme l'existence du Lynx Highliner)
- https://www.elitedangerous.com/store/ships/lynx-highliner (via proxy lecteur, page produit officielle: "Expanding into the passenger liner market, Zorgon Peterson presents the Lynx Highliner")
- https://forums.frontier.co.uk/threads/new-ship-zorgon-peterson-introduces-the-lynx-highliner.646822/ (via proxy lecteur, annonce officielle Frontier: "Entering into the passenger liner market for the first time, Zorgon Peterson introduces the Lynx Highliner")
- https://elite-dangerous.fandom.com/wiki/Lynx_Highliner (référencé via recherche, page wiki communautaire confirmant Zorgon Peterson, accès direct bloqué par la protection anti-bot du site)

### 8. Vaisseau "Nomad"

**Réponse canonique : non confirmé — probable prémisse fausse.**

Aucune source fiable ne confirme l'existence d'un vaisseau nommé « Nomad » dans Elite Dangerous. La base de données communautaire Inara.cz (référence quasi-exhaustive des vaisseaux du jeu, 75 vaisseaux recensés, de la Sidewinder Mk I à la Panther Clipper Mk II) ne mentionne aucun vaisseau « Nomad ». L'article Wikipédia consacré à Elite Dangerous, qui liste les vaisseaux joueurs, les vaisseaux capitaux, les véhicules terrestres (SRV) et les fabricants (Core Dynamics, Gutamaya, Lakon Spaceways, Faulcon DeLacy, Zorgon Peterson, Saud Kruger, Brewer Corporation), n'en fait pas non plus mention. Aucune fiche officielle (site elitedangerous.com, GalNet) ni page dédiée n'a pu être localisée pour ce nom. Il est donc probable que le « fait » à l'origine de la contradiction dans la base de connaissances repose sur une confusion (fan-fiction, rumeur, faux leak, ou vaisseau d'un autre jeu/mod) plutôt que sur un vaisseau réellement présent dans Elite Dangerous. Par conséquent, aucune date de sortie, aucun fabricant et aucune classification (SLV ou autre) ne doivent être fournis pour ce vaisseau dans le corpus — la question part probablement d'une prémisse fausse et devrait être retirée ou explicitement marquée comme non vérifiée plutôt que tranchée par l'une des deux dates d'origine.

**Sources :**
- https://inara.cz/elite/ships/ (consulté via fetch — liste complète de 75 vaisseaux, pas de 'Nomad')
- https://en.wikipedia.org/wiki/Elite_Dangerous (consulté via fetch — liste des vaisseaux et fabricants, pas de 'Nomad')
- Tentatives infructueuses (bloquées/erreurs serveur, non concluantes en soi mais cohérentes avec l'absence de résultat) : elite-dangerous.fandom.com/wiki/Ships, elite-dangerous.fandom.com/wiki/Nomad, elite-dangerous.fandom.com/wiki/Category:Ships, elitedangerous.com/news, reddit.com/r/EliteDangerous (accès refusé), recherche Google (redirigée vers page de consentement, non résolue)

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
