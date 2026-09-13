---
id: 16-outils
titre: "Elite Dangerous : le guide des outils communautaires"
domaine: meta-outils
entites: [EDDN, Frontier Companion API (CAPI), EDMC, EDSM, Inara, Spansh, EDDiscovery, EDDI, Coriolis, EDSY, BGS-Tally, Fuel Rats, Link Decoder, Codex Canonn]
mots_cles_en: [eddn, edmc, journal files, companion api, edsm, inara, spansh, coriolis, edsy, bgs-tally, trade dangerous, fuel rats, ratsignal, link decoder, aurvandil, canonn codex]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-12
confiance_globale: haute
volatilite: haute
sources_primaires: ["dépôts GitHub EDCD (EDDN, EDMarketConnector, coriolis, EDDI)", "edsm.net", "inara.cz", "spansh.co.uk", "canonn.science", "fuelrats.com", "tools.canonn.tech"]
zones_incertaines: ["le détail exact des fonctionnalités de colonisation annoncées par Spansh, son site étant une SPA non récupérable par un simple fetch", "le niveau d'activité réel des forks communautaires d'EDEngineer", "le contenu du guide de secours officiel wiki.fuelrats.com, page indisponible au moment du contrôle", "l'erreur HTTP 410 de la page inara.cz/elite/powerplay-stats est probablement une URL obsolète, sans confirmation"]
guides_lies: [0, 5, 6, 10, 17, 18, 19, 21, 22, 25, 33]
---
# Elite Dangerous : le guide des outils communautaires

## En bref

L'écosystème d'outils communautaires d'*Elite Dangerous* repose sur l'**Elite Dangerous Data Network (EDDN)**, un bus de
messages qui redistribue en temps réel les événements des fichiers de journal (*Journal files*) que le jeu écrit sur le
disque du commandant, complété par la **Frontier Companion API (CAPI)** pour le profil, la cargaison, le marché et le
chantier naval. Sur le poste du joueur, **E:D Market Connector (EDMC)** est la brique de base à installer en premier :
c'est le socle de plugins de l'écosystème (BGS-Tally, EDMC-Canonn, trackers Powerplay), aux côtés d'EDDiscovery (carte
3D, EDDLite) et d'EDDI (synthèse vocale, Monitors et Responders). Côté web, **EDSM** couvre la cartographie et le journal
de vol, **Inara** le volet social, le Powerplay et l'engineering (l'ingénierie des modules) — EDDB, longtemps la
référence, est morte — et
**Spansh** la planification de route (plotter neutron, Road to Riches, Fleet Carrier). **Coriolis** et **EDSY** dominent
la construction de vaisseaux, Trade Dangerous le calcul d'itinéraires commerciaux, ED Odyssey Materials Helper la gestion
des matériaux, et les **Fuel Rats** le secours d'urgence par *ratsignal* (appel de détresse).

## Vue d'ensemble : un écosystème bâti sur EDDN

Contrairement à beaucoup de jeux en ligne, Elite Dangerous ne propose aucune carte galactique complète côté officiel,
aucun optimiseur de route intégré digne de ce nom, et aucun suivi détaillé de la progression d'engineering. Cette lacune
volontaire de Frontier Developments a été comblée par une communauté d'outils tiers remarquablement mature, presque tous
bâtis sur une même fondation technique : l' **Elite Dangerous Data Network (EDDN)**.

EDDN (`github.com/EDCD/EDDN`) est un bus de messages qui redistribue en temps réel les événements des fichiers de
journal (*Journal files*) que le jeu écrit sur le disque de chaque commandant. Il ne stocke rien lui-même : ce sont des
services tiers comme EDSM, Inara, Spansh, Coriolis ou EDSY qui écoutent ce flux pour construire et tenir à jour leurs
bases de données. Sur PC, les « capteurs » qui alimentent EDDN sont des applications compagnons qui tournent en tâche de
fond pendant que vous jouez — au premier rang desquelles **E:D Market Connector (EDMC)**, mais aussi EDDI ou
EDDiscovery. Sur console, où l'accès aux fichiers de journal est plus restreint, les joueurs dépendent d'outils
spécifiques comme le *console updater* (outil de synchronisation du journal sur consoles) d'EDSM ou Journal Limpet.

**Frontier Companion API (CAPI).** En complément d'EDDN, une partie des outils — au premier rang desquels EDMC et EDDI
— s'appuie aussi sur la **Frontier Companion API**, plus connue sous son abréviation **CAPI**. À la différence d'EDDN,
il ne s'agit pas d'un bus alimenté par la communauté mais d'une API HTTP appartenant à Frontier Developments elle-même,
à laquelle un outil s'authentifie par OAuth2 au nom du commandant qui l'autorise explicitement. Une fois l'autorisation
donnée, la CAPI expose des données que le fichier de journal ne fournit pas toujours au même niveau de détail : profil
du commandant, cargaison, inventaire de matériaux, état des missions, ainsi que le marché, l'outfitting et le chantier
naval (*shipyard*) de la station où le commandant est amarré — c'est par exemple ce canal qu'EDMC utilise pour
récupérer les prix de marché d'une station avant de les redistribuer vers EDDN. La CAPI n'est pas une API
officiellement documentée par Frontier à destination des développeurs tiers : son usage communautaire repose sur une
tolérance de fait et sur une rétro-ingénierie collective (dépôts comme `EDCD/FDevIDs`, qui cataloguent les identifiants
qu'elle renvoie). Le guide [Sources de données et API](./17-sources-donnees.md) de ce corpus détaille son
fonctionnement technique, ses limites et son articulation précise avec EDDN — ce n'est pas dupliqué ici.

Un repère utile pour situer l'histoire de cet écosystème : le README d'EDDN décrit lui-même Inara comme « a popular
alternative to the now defunct EDDB ». Elite Dangerous Database (EDDB), longtemps une référence, est donc officiellement
morte et a été remplacée dans l'usage communautaire par Inara et Spansh.

Ce guide passe en revue, catégorie par catégorie, les outils que la communauté utilise aujourd'hui : bases de données
web, applications compagnons locales, assistants vocaux, outils scientifiques, outils de commerce, de gestion de
matériaux, de Powerplay et de colonisation, d'engineering, et d'entraide entre joueurs.

---

## 1. Bases de données et plateformes web communautaires (EDSM, Inara, Spansh)

### EDSM — Elite Dangerous Star Map

**Description et utilité principale.** EDSM (`edsm.net`) est le plus ancien des grands projets communautaires. Né comme
un simple répertoire de coordonnées de systèmes stellaires, il est devenu une plateforme complète offrant :

- une carte stellaire de la galaxie construite collaborativement ;
- un suivi de journal de vol et de flotte (vaisseaux possédés, historique des trajets) ;
- un carnet de bord personnel avec commentaires sur les systèmes explorés ;
- le suivi des rangs de commandant ;
- une recherche de commodités et de vaisseaux disponibles en station.

**Ampleur des données.** EDSM publie sur sa page de statistiques un compteur en temps réel du nombre de systèmes
enregistrés, de corps célestes cartographiés et d'entrées de journal reçues via EDDN ; ces compteurs progressent en
continu, de plusieurs dizaines de millions d'unités pour les systèmes et de plusieurs centaines de millions pour les
corps célestes. Quelle que soit la valeur exacte à un instant donné, la proportion couverte reste infime au regard des
quelque 400 milliards d'étoiles de la galaxie du jeu — un rappel de l'échelle proprement astronomique d'Elite Dangerous.

**Écosystème.** EDSM expose une API v1 documentée ainsi que des dumps nocturnes de sa base et des widgets embarquables.
Elle sert de source de référence à de nombreux logiciels tiers, dont EDDiscovery, EDMC-Canonn ou EDDLite.

**Statut de maintenance.** Actif, alimenté en continu par le flux EDDN.

### Inara (inara.cz) — base de données communautaire et volet social

**Description et utilité principale.** Inara (`inara.cz`, hébergé en République tchèque — à ne pas confondre avec un
domaine `.cn`) est une base de données et wiki non officiel, explicitement non affilié à Frontier. Son périmètre est
plus large et plus « social » que celui d'EDSM :

- commerce : routes lucratives, prix des matières premières ;
- exploration : recherche de systèmes, de stations, de factions mineures les plus proches ;
- équipement et modules de vaisseaux ;
- profils de commandants et de squadrons (voir [Escadrons de joueurs](./22-squadrons.md)), avec classements ;
- Powerplay : suivi de la rivalité entre puissances ;
- guerre contre les Thargoïdes ;
- engineering : ingénieurs disponibles, plans (*blueprints*), effets expérimentaux, synthèse de matériaux ;
- journaux de bord multilingues et galerie communautaire.

**Positionnement face à EDSM.** Le README d'EDDN qualifie Inara de remplaçant populaire d'EDDB, avec « beaucoup de
fonctionnalités propres ». Dans la pratique communautaire, EDSM reste perçu comme l'outil de référence pour
l'exploration et la cartographie brute, tandis qu'Inara domine sur le volet social, le Powerplay et l'engineering.

**Actualité et statut.** Le site suit la timeline de contenu Frontier en direct (au moment du contrôle, les news Galnet
affichées portaient sur le lancement du SRV « Rhino » du constructeur Vodel, sorti le 2 septembre 2026, et sur des
essais de minage de surface de Wreaken Corporation). Le site est actif.

> **Point de vigilance.** La page dédiée aux statistiques Powerplay testée (`inara.cz/elite/powerplay-stats/`) renvoyait
> un statut HTTP 410 Gone au moment du contrôle. Il s'agit très probablement d'une URL obsolète plutôt que d'un abandon de
> la fonctionnalité — le Powerplay reste couvert ailleurs sur le site, notamment via les fiches de puissances et de
> systèmes. Comme pour tout classement de Powers ou statistique en temps réel : instantané du 8 septembre 2026, à
> revérifier directement sur Inara.

### Spansh (spansh.co.uk) — planification de route et Road to Riches

**Description et utilité principale.** Spansh (`spansh.co.uk`) est devenu la référence pour la planification de route en
exploration longue distance. Sa suite d'outils comprend notamment :

- un **plotter neutron**, qui exploite les « autoroutes à étoiles à neutrons » (utilisation du supercharge FSD, la
  surcharge du FSD) pour calculer les trajets les plus rapides entre systèmes éloignés ;
- un plotter galactique classique ;
- **Road to Riches**, un générateur d'itinéraires optimisés pour la première découverte et la première cartographie de
  corps célestes (lucratif en exploration) ;
- un plotter dédié aux [Fleet Carriers](./19-fleet-carriers.md) ;
- une recherche de corps et de stations spécifiques ;
- des outils plus récents liés au commerce et à la colonisation de systèmes (voir la sous-section
  [Outils de planification de colonisation](#outils-de-planification-de-colonisation) plus bas et
  [Colonisation](./18-colonisation.md) pour la mécanique elle-même).

Le site étant une application monopage (SPA) construite en Ember.js, son contenu dynamique n'est pas directement
accessible par un simple récupérateur de page statique ; sa description ci-dessus s'appuie sur la documentation croisée
(dépôts GitHub, plugins tiers qui l'intègrent) plutôt que sur un rendu direct. Le détail exact des fonctionnalités de
colonisation ajoutées côté Spansh n'a pas pu être confirmé au-delà de cette mention croisée — à vérifier directement sur
le site.

**Développeur et écosystème.** Le compte GitHub « spansh » est aussi un contributeur historique de l'écosystème EDCD
(Elite Dangerous Community Developers) : il a possédé une version antérieure du dépôt EDMarketConnector et maintient
EDCD.github.io.

**Statut de maintenance.** Actif. Le dépôt `spansh/elite_dangerous_schemas` a été mis à jour le 23 juillet 2026.
Plusieurs plugins EDMC qui s'appuient sur l'API Spansh ont été mis à jour début septembre 2026, preuve indirecte de
vitalité de l'API (instantané du 8 septembre 2026, à revérifier sur les dépôts) :

| Plugin EDMC        | Auteur      | Fonction                                                 | Dernière mise à jour connue |
|--------------------|-------------|----------------------------------------------------------|-----------------------------|
| EDMC-NeutronDancer | dwomble     | Plotter de routes neutron/Spansh avancé                  | v2.0.1, 29 août 2026        |
| EDMC-SpanshTools   | wuuthradd   | Routing, visualisation de route, import/export, overlays | 27 juillet 2026             |
| EDMC_SpanshRouter  | CMDR-Kiel42 | Ancien plugin de routing Spansh                          | **Archivé depuis 2023**     |

*Numéros de version indiqués à titre d'instantané du 8 septembre 2026 — vérifiez toujours la dernière release sur le
dépôt de chaque plugin.*

---

## 2. Applications compagnons locales (Journal Watchers)

Ces applications tournent en tâche de fond pendant que le jeu s'exécute, lisent les fichiers de journal en direct et
redistribuent leur contenu vers EDDN et vers d'autres services.

### EDMC — Elite Dangerous Market Connector

**Description et utilité principale.** EDMC (`github.com/EDCD/EDMarketConnector`) est l'application compagnon de
référence de tout l'écosystème. Elle lit les *Journal files*, télécharge les données de marché et de station (via la
CAPI, voir plus haut), les redistribue vers EDDN ainsi que vers des outils de trading en ligne et hors ligne, et sert
surtout de **socle de plugins** pour la quasi-totalité des utilitaires communautaires (Canonn, BGS-Tally, trackers
Powerplay, overlays [affichages superposés en jeu], synthèse vocale, etc.), via un système de plugins Python documenté
officiellement (dossier
`plugins`, fichier `load.py`).

**Statut de maintenance.** Très actif. Instantané pris le 8 septembre 2026 (à revérifier sur le dépôt
`EDCD/EDMarketConnector` plutôt que de se fier durablement à ces chiffres) : environ 1 266 étoiles GitHub, 108 issues
ouvertes, dernier commit le 2 septembre 2026, dernière release stable observée 6.1.2 (29 janvier 2026 — une version plus
récente a pu sortir depuis).

**Roadmap.** Deux jalons ouverts sur GitHub témoignent d'un développement actif (instantané du 8 septembre 2026) :

- **6.2.0** : 22 issues ouvertes, 13 fermées — décrit comme le contenu de la prochaine mise à jour.
- **Post-6.2 Changes** : 45 issues ouvertes, changements triés mais non encore planifiés pour une version précise.

**Principaux plugins de l'écosystème EDMC :**

| Plugin                               | Auteur         | Fonction                                                                                                                               | Statut / dernière mise à jour                                        |
|--------------------------------------|----------------|----------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| **BGS-Tally**                        | aussig         | Suivi et rapport de l'activité [BGS](./00-glossaire.md), Colonisation, Powerplay et guerre Thargoïde ; post automatique sur Discord    | Extrêmement actif — release v5.6.0 et dernier commit le 31 août 2026  |
| **EDMC-Canonn** (« Project Athens ») | canonn-science | Collecte scientifique automatisée (signaux, glyphes Thargoïdes, ruines)                                                                | Très actif — v7.8.0 « Seven Dwarfs Ride a Rhino », 6 septembre 2026   |
| EDMC-Ruins                           | canonn-science | Rapport des types de ruines Guardian                                                                                                   | Janvier 2025                                                          |
| EDMC-RingSurvey                      | canonn-science | Relevé des anneaux planétaires                                                                                                         | Novembre 2024                                                         |
| EDMC-Glyph                           | canonn-science | Capture des données de glyphes Thargoïdes                                                                                              | Mai 2023                                                              |
| EDMC-Solar-Sweep                     | canonn-science | Relevé solaire                                                                                                                          | 2017 (le plus ancien du groupe)                                       |
| EDMC-NeutronDancer                   | dwomble        | Plotter neutron/Spansh avancé                                                                                                           | v2.0.1, 29 août 2026                                                  |
| EDMC-SpanshTools                     | wuuthradd      | Intégration routing Spansh                                                                                                              | 27 juillet 2026                                                       |

*Numéros de version et compteurs indiqués à titre d'instantané du 8 septembre 2026 — vérifiez toujours la dernière
release sur le dépôt de chaque plugin avant de vous y fier.*

### EDDiscovery — carnet de bord, carte stellaire 3D et EDDLite

**Description et utilité principale.** Officiellement décrit comme « *Captain's log and 3D star map for Elite
Dangerous* », EDDiscovery (`github.com/EDDiscovery/EDDiscovery`) est une alternative complète à EDMC intégrant une carte
stellaire 3D, un journal de bord enrichi, et un module plus léger, **EDDLite**, qui connecte directement Inara, EDSM,
EDDN, Coriolis et EDSY.

**Statut de maintenance.** Très actif : dernière release observée « **19.1.10 — Rhino Additions** » (2 septembre 2026),
apportant notamment des améliorations des packs vocaux, un nouveau plugin CANONN, une refonte du routing Spansh et un
suivi des mérites Powerplay (instantané du 8 septembre 2026, à revérifier sur le dépôt — le numéro de mérites suivi peut
lui-même changer d'une version à l'autre). Le nom même de la release référence le nouveau SRV « Rhino » ajouté au jeu,
preuve d'une synchronisation rapide avec le contenu de Frontier. EDDLite, plus jeune, a été mis à jour le 25 juillet
2025.

**Roadmap.** Contrairement à EDMC, les jalons GitHub existants (« Long term », « Possible future work », « 9.0 ») sont
tous actuellement clos, sans issue ouverte — aucune roadmap publique active n'a été identifiée au moment du contrôle.

### EDDI — application compagnon vocale (TTS, Monitors et Responders)

**Description et utilité principale.** EDDI (`github.com/EDCD/EDDI`) est l'application compagnon la plus ancienne
dédiée à l'intégration vocale/TTS de la communauté, historiquement couplée à VoiceAttack pour la synthèse vocale et les
annonces contextuelles. Son architecture interne, organisée en **Monitors** (un par domaine du journal : cargaison,
commandant, crime, Fleet Carrier, Galnet, matériaux, missions, navigation, vaisseau, statut) et en **Responders**
(`EDDNResponder`, `EDSMResponder`, `InaraResponder`, `SpeechResponder`, `VoiceAttackResponder`), en fait à la fois un
consommateur des événements du journal et de la CAPI (module `CompanionAppService`) et un redistributeur vers EDDN,
EDSM, Inara et Spansh — un rôle proche de celui d'EDMC, avec une couche vocale en plus.

**Fonctionnalités réelles :**

- synthèse vocale (TTS) via plusieurs moteurs : Amazon Polly, Azure Speech Services, ainsi que les voix natives du
  système ;
- plus de 275 types d'événements documentés, des actions simples (accostage, décollage) aux scénarios complexes
  (opérations de Fleet Carrier, combat, actualités Galnet) ;
- un moteur de scripting basé sur le langage de gabarits **Cottle**, étendu de fonctions personnalisées pour composer
  des annonces contextuelles ;
- des **personnalités** (fichiers de configuration JSON) permettant de personnaliser le ton, le vocabulaire et le
  comportement de l'assistant sans toucher au code ;
- des fonctions de routage : recherche de systèmes proches répondant à des critères donnés, utile pour la navigation
  vocale assistée.

**Écosystème de plugins.** Contrairement à EDMC, dont les plugins sont majoritairement des dépôts tiers indépendants,
l'extensibilité d'EDDI passe surtout par ses propres **Responders** internes (listés ci-dessus) et par des packs de
**personnalités et de scripts Cottle** partagés par la communauté (voix, styles d'annonces, comportements). Elle reste
malgré tout interopérable avec l'écosystème EDMC via les données qu'elle redistribue vers EDDN, EDSM et Inara.

**Statut de maintenance.** Actif : dernier commit observé le 7 septembre 2026, environ 525 étoiles GitHub (instantané du
8 septembre 2026, à revérifier sur le dépôt).

---

## 3. Commandes vocales et retour audio : EDCoPilot et VoiceAttack

### EDCoPilot — tableau de bord externe et assistant vocal piloté par IA

> **Correction de domaine importante.** L'ancien domaine `edcopilot.com` redirige désormais (301) vers un site sans
> rapport (`educopilot.com`, une plateforme éducative). Le site officiel actuel, retrouvé via le dépôt GitHub de
> l'installeur, est **razzafrag.com**, avec un wiki de configuration hébergé sur `razzserver.com/dokuwiki`.

**Description et utilité principale.** EDCoPilot est une application gratuite, exclusivement PC, qui ajoute un tableau
de bord de vaisseau externe et un assistant vocal piloté par IA. Ses fonctionnalités principales :

- navigation avec signets et tracé automatique d'itinéraires ;
- recherche de stations, commodités, modules et marchands de matériaux ;
- plus de 40 panneaux d'information (inventaire, statistiques, plans d'engineering) ;
- annonces vocales de haute qualité, avec Microsoft Edge TTS par défaut et des options payantes/tierces (Amazon Polly,
  Google Cloud, Azure, ElevenLabs) ;
- intégration complète avec VoiceAttack pour les commandes vocales ;
- support multi-écran et tablette (SpaceDesk) ;
- support VR (Oculus Dash, Desktop+, OVRDrop, OVRToolkit) — pour l'état général de la VR dans le jeu lui-même
  (casques compatibles, jeu à pied resté en écran plat, options de confort), voir
  [33-client-editions-peripheriques-et-vr.md §5](./33-client-editions-peripheriques-et-vr.md#5-vr--casques-compatibles-ce-qui-fonctionne-et-le-confort).

**Version observée.** v1.11.748 (instantané du 8 septembre 2026 — le projet n'a pas de dépôt GitHub public permettant de
vérifier facilement une version plus récente ; se référer au site officiel razzafrag.com ou au Discord de l'auteur).

**Modèle économique.** Gratuit, avec dons/Patreon facultatifs pour soutenir le développement.

**Gouvernance et écosystème.** L'auteur demande explicitement de ne pas ouvrir d'issues ni de pull requests sur GitHub,
tout le support communautaire passant par un Discord officiel — signe d'un projet à développeur unique, actif, mais à
gouvernance fermée. Un écosystème satellite existe néanmoins :

- **EDCopilotDialogueLibrary** : bibliothèque de répliques additionnelles, mise à jour mars 2026 ;
- **EDCoPilot_GermanVoicelines** : voix allemandes ;
- **EDCoPTER** : reproduit l'interface d'EDCoPilot dans un navigateur web local, mis à jour septembre 2025 ;
- un serveur MCP expérimental (`GWLlosa/elite-dangerous-local-ai-tie-in-mcp`) reliant EDCoPilot à un assistant IA de
  type Claude Desktop.

### VoiceAttack et les profils Elite Dangerous

VoiceAttack est un logiciel commercial générique de reconnaissance vocale, non spécifique à Elite Dangerous. La
communauté produit des « profils » (fichiers de configuration de commandes) dédiés au jeu, mais sans projet central
fédérateur — contrairement à EDMC ou EDDiscovery. Le paysage est donc fragmenté :

| Profil                               | Auteur      | Dernière mise à jour | Statut                                                                |
|--------------------------------------|-------------|----------------------|-----------------------------------------------------------------------|
| EDVA                                 | ArNeo-VR    | 11 octobre 2025      | Actif                                                                 |
| VoiceAttack-VAP-for-EliteDangerousV4 | DawnTreader | 28 janvier 2026      | Actif — recommande explicitement de coupler EDDI, BindED et EDCoPilot |
| SweetyVolty (profil)                 | SweetyVolty | 2016–2021            | Non maintenu                                                          |
| vaped (profil)                       | vaped       | 2016–2021            | Non maintenu                                                          |
| ED-VoiceAttack                       | —           | 2016–2021            | Non maintenu                                                          |

**Conclusion pour ce segment.** Les profils VoiceAttack pour Elite Dangerous forment un écosystème fragmenté, largement
porté par des projets individuels, sans standard communautaire dominant. En pratique, EDCoPilot et EDDI ont repris une
bonne partie de ce rôle avec un support natif plus riche et mieux maintenu.

---

## 4. Canonn Research — exobiologie, sites Guardian, Thargoïdes

**Présentation.** Canonn Interstellar Research se décrit, dans la fiction du jeu, comme fondée en avril 3301 par le Dr
Arcanonn, et se présente comme la plus grande communauté de recherche scientifique active in-game. Ses domaines de
recherche couvrent :

- l'archéologie et les sites abandonnés ;
- la cartographie des étoiles à neutrons ;
- la géologie et les organismes de surface — **exobiologie**, dont la famille Radicoida introduite avec Odyssey ;
- la xéno-technologie : sites **Guardian** et **Thargoïdes** (voir aussi [Combat anti-Thargoïde (AX)](./25-combat-ax.md)
  pour le volet militaire de cette guerre).

**Fait marquant communautaire.** Le vaisseau-laboratoire *Gnosis*, mégastructure explorant la galaxie avec l'aide des
commandants, est un point de ralliement récurrent pour la communauté scientifique, Canonn en tête, qui y a organisé
plusieurs campagnes de collecte de données et de ravitaillement au fil des années. L'ampleur précise (nombre de
participants, tonnage livré) varie selon les campagnes et n'est pas reprise ici faute de chiffre unique et vérifiable ;
elle reste néanmoins citée comme l'un des grands exemples de mobilisation logistique communautaire d'Elite Dangerous.

**Statut.** Actif, opérant depuis Thompson Dock (système Varati), avec des publications continues (les plus récentes
observées au moment du contrôle portaient sur les étoiles à neutrons, février 2026).

**Outils concrets** (organisation GitHub `canonn-science`, tous vérifiés actifs sauf mention contraire) :

| Outil                                            | Fonction                                                                                                                                                                                                                                                                                          | Statut / dernière mise à jour                                        |
|---------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| **EDMC-Canonn** (« Project Athens »)             | Plugin EDMC phare : collecte automatique de données scientifiques (signaux, glyphes Thargoïdes, ruines), indicateur visuel de complétion Spansh sur la galaxy map, export CSV, overlay in-game, système de POI (patrouilles Canonn, sites Thargoïdes/Guardian proches, Galactic Mapping Project) | Très actif — v7.8.0 « Seven Dwarfs Ride a Rhino », 6 septembre 2026    |
| **tools.canonn.tech** (monorepo `canonn-tools`)  | Regroupe Codex-Router (routage pour le Gnosis via des entrées Codex), Link Decoder/Aurvandil (décodage des liens Thargoïdes), Signals (visualisation des signaux EDMC-Canonn), Thargoid Glyphs/Valknut (composeur de combinaisons de glyphes pour partage)                                       | Mis à jour 23 mars 2026                                                 |
| **GR-RuinsComboMap**                             | Carte interactive des sites de ruines Guardian                                                                                                                                                                                                                                                    | Mis à jour 16 août 2026                                                 |
| EDMC-Ruins                                       | Rapport des types de ruines                                                                                                                                                                                                                                                                       | Janvier 2025                                                            |
| EDMC-RingSurvey                                  | Relevé des anneaux                                                                                                                                                                                                                                                                                 | Novembre 2024                                                           |
| EDMC-Glyph                                       | Capture de glyphes Thargoïdes                                                                                                                                                                                                                                                                      | Mai 2023                                                                |
| EDMC-Solar-Sweep                                 | Relevé solaire                                                                                                                                                                                                                                                                                     | 2017                                                                    |
| EDDCanonn                                        | Plugin natif EDDiscovery (équivalent Canonn)                                                                                                                                                                                                                                                       | 2022, plus ancien                                                       |

*Numéros de version indiqués à titre d'instantané du 8 septembre 2026 — vérifiez toujours la dernière release sur le
dépôt de chaque outil.*

**Pour l'exobiologie précisément**, Canonn fournit surtout les données de référence (Codex, classification des
organismes), qui sont ensuite consommées par des outils plus orientés « aide en jeu », au premier rang desquels l'ED
Odyssey Materials Helper ([voir la section dédiée](#6-gestion-des-matériaux--ed-odyssey-materials-helper)) via son
onglet biologie.

**Ce que fait précisément Link Decoder/Aurvandil.** Ce n'est pas un simple visualiseur : l'outil calcule, à partir
du signal audio livré par un **Thargoid Link** déployé dans l'espace, les distances triangulées vers le système
cible du prochain site de surface thargoïde à visiter — voir la procédure complète (structures de surface, puzzle
sonore, sondes et liens) en [25-combat-ax.md §8.2-8.3](./25-combat-ax.md). Les « glyphes thargoïdes » que compose
Thargoid Glyphs/Valknut sont un sujet distinct des sites Guardian (obélisques, langage) traités en
[05-guardians.md §11](./05-guardians.md) — ne pas confondre les deux dans une réponse.

**Le « Codex » cité au fil de ce tableau** désigne le **Codex Canonn** (canonn.science/codex/), un site communautaire
distinct de la fonctionnalité **Codex** intégrée au client du jeu — voir
[10-exploration.md §1.6bis](./10-exploration.md) pour la désambiguïsation complète entre les deux et le
fonctionnement du Codex in-jeu (onglets, régions galactiques, crédit de première découverte).

---

## 5. Outils de commerce : Trade Dangerous

**Description et utilité principale.** Trade Dangerous (`github.com/eyeonus/Trade-Dangerous`) est un outil en ligne de
commande écrit en Python, dédié à l'optimisation d'itinéraires commerciaux. Plus ancien et davantage orienté « puissance
de calcul brute » que les planificateurs web grand public, il permet des calculs d'arbitrage multi-sauts avec de
nombreuses contraintes fines (capacité de soute, budget, nombre de sauts maximum, etc.) difficiles à obtenir sur des
interfaces en ligne.

**Statut de maintenance.** Actif — dernière release observée v13.1.0 (1er juillet 2026), dernier commit au dépôt le 23
août 2026 (instantané du 8 septembre 2026, à revérifier sur le dépôt).

**Écosystème.** Le plugin EDMC précise lui-même servir de source de données pour « tous les outils de trading en ligne
et hors ligne populaires » ; Trade Dangerous est l'un des principaux consommateurs historiques de ces exports pour
l'usage hors ligne.

---

## 6. Gestion des matériaux : ED Odyssey Materials Helper

**Description et utilité principale.** ED Odyssey Materials Helper (`jixxed/ed-odyssey-materials-helper`) est une
application desktop dédiée à la gestion des matériaux d'engineering et de biologie sous Odyssey : suivi d'inventaire,
guides de synthèse, données de mission (par exemple le suivi des marchandes de missions Merc Seeker).

**Statut de maintenance.** Extrêmement actif — release observée v3.15.5 (8 septembre 2026), environ 394 étoiles GitHub
(instantané du 8 septembre 2026, à revérifier sur le dépôt).

**Point de gouvernance à noter.** Le code source du dépôt est publié sous licence **MIT** classique. En revanche,
d'après le fichier `NOTICE` du projet, les **binaires officiels compilés** distribués par le projet embarquent des
composants et assets tiers propriétaires qui, eux, ne sont pas couverts par la licence MIT : ils sont distribués sous
des termes séparés qui interdisent la rétro-ingénierie, la redistribution et la réutilisation sans autorisation du
détenteur des droits. C'est une nuance à connaître par rapport à EDMC, EDDiscovery ou Trade Dangerous, dont le code et
les binaires restent open source de façon classique de bout en bout.

**Distribution.** Auto-updaters MSI pour Windows, paquets deb/rpm et zip portable pour Linux, DMG pour macOS (les
binaires macOS ne sont pas signés et nécessitent une commande `xattr` pour lever la quarantaine Gatekeeper).

---

## 7. Outils Powerplay et colonisation de systèmes

Le **Powerplay 2.0** (refonte du système de rivalité entre puissances galactiques, introduite le 31 octobre 2024 avec
la mise à jour *Ascendancy*) et la **Colonisation de systèmes** (mécanique distincte, sortie en bêta le 26 février 2025
avec la mise à jour *Trailblazers*, puis en version complète le 11 novembre 2025 via le *Dodec Update* — voir
[Colonisation](./18-colonisation.md) pour le détail de cette mécanique) sont deux fonctionnalités indépendantes, mais
souvent suivies par les mêmes outils communautaires, à des niveaux de maturité très différents.

### Outils Powerplay (BGS-Tally, Inara, powerplayplanner, powerplay-parser)

| Outil                            | Portée                                                                                                                      | Statut / dernière mise à jour                                                                                    |
|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| **BGS-Tally**                    | Suivi combiné Powerplay + [BGS](./00-glossaire.md) + Colonisation, avec overlay dédié, suivi de progression, publication automatique sur Discord | Outil dominant de la catégorie — release v5.6.0 et dernier commit au dépôt le 31 août 2026 |
| **Inara**                         | Pages Powerplay dédiées (rivalité entre puissances, classements) intégrées à sa base plus large                             | Site actif ; page « powerplay-stats » testée en 410 Gone au moment du contrôle (probable restructuration d'URL)    |
| **powerplayplanner** (vanderaj)  | Outil de planification Powerplay, projet individuel de portée restreinte                                                     | Mis à jour 2 juin 2026                                                                                               |
| **powerplay-parser** (Celegast)  | Extraction OCR de données Powerplay depuis des captures d'écran                                                              | Mis à jour 7 septembre 2026                                                                                          |

*Numéros de version et classements indiqués à titre d'instantané du 8 septembre 2026 — un classement de Powers change en
continu, vérifiez toujours la valeur du jour sur Inara ou en jeu.*

### Outils de planification de colonisation

La Colonisation de systèmes étant une mécanique récente (sortie complète le 11 novembre 2025 seulement), son
écosystème d'outils est jeune et évolue vite ; pour la mécanique de jeu elle-même (dépôts de construction, chaîne
d'approvisionnement, choix de site), voir le guide dédié [Colonisation](./18-colonisation.md). Côté outils, on trouve
notamment :

- **BGS-Tally** (déjà présenté ci-dessus) suit désormais la contribution d'un commandant aux projets de colonisation en
  plus du BGS et du Powerplay.
- **SrvSurvey** (`njthomson/SrvSurvey`) : overlay contextuel pendant le jeu, orienté exploration et colonisation — aide
  à repérer les corps colonisables et à préparer un site. Environ 170 étoiles GitHub (instantané du 8 septembre 2026, à
  revérifier sur le dépôt).
- **Raven Colonial** (`ravencolonial.com`, dépôt web `njthomson/RavenColonialWeb`) : outil web dédié au suivi de la
  construction d'un système en cours de colonisation (liste des marchandises encore nécessaires à chaque dépôt,
  avancement du projet). Il est relié à plusieurs plugins EDMC tiers qui remontent automatiquement la progression
  depuis le jeu, dont `ravencolonial_edmc` (toemaus313) et `EDRavenColonialAgent` (mcjohnso, qui fusionne cette
  intégration avec l'overlay de colonisation de SrvSurvey). Environ 14 étoiles GitHub pour le dépôt web principal
  (instantané du 8 septembre 2026, à revérifier sur le dépôt).
- Un grand nombre de petits projets individuels existent par ailleurs (par exemple `ed-colonisation-planner`,
  `EDColonisationAsst`, ou des outils de sélection de systèmes candidats pour une faction mineure comme
  `anthonylangsworth/Colonisation`) : le paysage rappelle celui des profils VoiceAttack (voir la section
  [3. Commandes vocales et retour audio](#3-commandes-vocales-et-retour-audio--edcopilot-et-voiceattack)) — fragmenté,
  sans outil unique qui fasse consensus au-delà de BGS-Tally et de Raven Colonial.

**Point de méthode.** Spansh annonce disposer d'outils liés à la colonisation (voir la section
[1. Bases de données et plateformes web communautaires](#1-bases-de-données-et-plateformes-web-communautaires-edsm-inara-spansh)),
mais leur détail exact n'a pas pu être confirmé directement (site en SPA non récupérable par un simple fetch) ; à
vérifier sur place.

---

## 8. Outils Engineering : construire un vaisseau

Deux « ship-builders » web dominent cette catégorie, à un niveau de maturité comparable.

### Coriolis (coriolis.edcd.io) — le ship-builder de référence de la communauté

**Description et utilité principale.** Coriolis (`github.com/EDCD/coriolis`, `coriolis.edcd.io`) est LE ship-builder
historique de référence de la communauté, désormais maintenu directement sous l'organisation officielle **EDCD**
(Elite Dangerous Community Developers). Il permet de construire et d'exporter des configurations de vaisseau, avec
simulation des modules d'engineering (plans, effets expérimentaux — voir [Les ingénieurs](./06-ingenieurs.md) pour le
détail de cette mécanique) et de leur impact sur les statistiques du vaisseau.

**Statut de maintenance.** Actif — dernier commit observé le 29 avril 2026 (instantané du 8 septembre 2026, à
revérifier sur le dépôt). Il sert de standard de facto pour le partage de builds ; de nombreux dépôts communautaires de
« builds » Coriolis existent en parallèle.

### EDSY (edsy.org) — simulateur d'outillage de vaisseau, alternative à Coriolis

**Description et utilité principale.** EDSY (`edsy.org`, dépôt `github.com/taleden/EDSY`) est un simulateur
d'outillage de vaisseau web, alternative indépendante à Coriolis. Il permet de gérer des configurations de chantier
naval, d'appliquer des plans d'engineering, de calculer des coûts, de générer des rapports de retrofit (la liste des
achats et changements nécessaires pour passer d'une configuration à une autre), et de personnaliser les modules par
catégorie (armes, utilitaires, composants du noyau, etc.). Le site précise utiliser des assets et de l'imagerie du jeu
« avec la permission de Frontier Developments plc, à des fins non commerciales », et n'est pas endossé par Frontier.
EDDLite (voir la section [2. Applications compagnons locales](#2-applications-compagnons-locales-journal-watchers))
connecte d'ailleurs Coriolis et EDSY côte à côte, signe que les deux sont traités comme équivalents par l'écosystème.

**Gouvernance et écosystème.** Maintenu par un développeur unique (pseudonyme GitHub `taleden`), joignable via Discord,
forums et Reddit — une gouvernance plus proche d'EDCoPilot que de Coriolis, mais avec un code source public.

**Statut de maintenance.** Actif — dépôt ouvert sur GitHub, environ 37 étoiles, dernier commit observé début septembre
2026 (instantané du 8 septembre 2026, à revérifier sur le dépôt `taleden/EDSY`).

### Autres outils Engineering (EDEngineer, Inara, ED Odyssey Materials Helper)

| Outil                                                         | Description                                                                                                                                                                                                                                                                                                                                   | Statut                                                                                                                                                                                                                                                                                                                                                                              |
|-----------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **EDEngineer** (`msarilar/EDEngineer`)                        | Tracker historique de matériaux d'engineering                                                                                                                                                                                                                                                                                                 | Dépôt original **archivé** (fin de maintenance active côté auteur d'origine). Des forks communautaires existent (RealMaxing/EDEngineer, PhilipG0ISW/EDEngineer) mais leur niveau d'activité réel n'a pas pu être confirmé en détail. La communauté s'est largement reportée vers ED Odyssey Materials Helper (qui couvre Horizons et Odyssey) et vers les pages Engineering d'Inara |
| **Inara**                                                     | Pages Engineering détaillées : ingénieurs disponibles, plans, effets expérimentaux, synthèse de matériaux                                                                                                                                                                                                                                     | Actif                                                                                                                                                                                                                                                                                                                                                                               |
| **ED Odyssey Materials Helper**                               | Volet engineering et biologie combiné, suivi d'inventaire                                                                                                                                                                                                                                                                                     | Actif (v3.15.5, 8 septembre 2026)                                                                                                                                                                                                                                                                                                                                                   |

> **Note sur les statistiques de vaisseaux.** Coriolis et EDSY affichent des valeurs de blindage, portée de saut,
> vitesse ou capacité de soute *pour une configuration donnée*. Ces valeurs sont données en configuration stock ou
> engineered selon les modules choisis dans l'outil ; l'ingenierie (voir [Les ingénieurs](./06-ingenieurs.md)) peut les
> modifier significativement par rapport à la fiche stock du vaisseau.

---

## 9. Entraide en jeu : Fuel Rats

**Présentation.** The Fuel Rats (`fuelrats.com`) sont une organisation de joueurs bénévoles fournissant un service de
secours d'urgence : ravitaillement en carburant et, plus largement, assistance en cas de panne de FSD, de dégâts
critiques ou d'échouage, pour tout commandant en détresse — gratuitement, sans jugement, quelle que soit son allégeance
ou son ancienneté. Le dépôt GitHub de leur site officiel les décrit comme « *Elite: Dangerous's premier emergency
refueling service* ».

**Fonctionnement : ratsignal et dispatch.** Un commandant en panne lance un appel de détresse — un **ratsignal** —
généralement sur le Discord officiel de l'organisation (historiquement sur IRC). Ce signal est pris en charge par un
bot de dispatch (de répartition des secours), aujourd'hui appelé **Mecha** (alias historiques : *Mechasqueak*,
*SPARK*), qui ouvre un dossier de secours (« case »), y attache les informations pertinentes (système, CMDR,
plateforme) et alerte les « rats » (bénévoles) disponibles pour qu'ils se rendent sur place livrer le carburant ou
l'assistance nécessaire.

**Écosystème technique.** Le bot de dispatch a connu plusieurs générations : `pipsqueak3` (Python, dépôt désormais
archivé) a été remplacé par une réécriture en Swift, `SwiftSqueak` (dépôt actif — dernier commit observé fin août 2026,
environ 8 étoiles GitHub ; instantané du 8 septembre 2026, à revérifier sur le dépôt `FuelRats/SwiftSqueak`).
L'organisation maintient aussi son propre site (`fuelrats.com`), une API (`api.fuelrats.com`) et des outils annexes
(tableau de dispatch web, système de file d'attente des secours).

**Où le trouver.** Discord officiel des Fuel Rats, ou canal IRC historique ; le site `fuelrats.com` détaille la
procédure exacte pour envoyer un ratsignal.

**Point de méthode.** Le contenu détaillé du guide de secours officiel (`wiki.fuelrats.com`) n'a pas pu être récupéré
directement au moment de la rédaction (page indisponible côté serveur). Les informations ci-dessus s'appuient sur les
dépôts GitHub officiels de l'organisation, jugés fiables sur le fonctionnement technique du bot, mais moins complets sur
le détail exact de la procédure de secours — à confirmer sur le site officiel avant une intervention réelle.

---

## 10. Tableau récapitulatif de l'écosystème d'outils Elite Dangerous

| Outil                        | Catégorie                          | Plateforme                       | Utilité principale                                        | Statut au 8 septembre 2026             |
|-------------------------------|--------------------------------------|-------------------------------------|--------------------------------------------------------------|--------------------------------------------|
| EDDN                          | Infrastructure de données          | Serveur (backend communautaire)   | Bus de messages redistribuant les événements de journal     | Actif — dernier commit 12 juillet 2026    |
| CAPI (Frontier Companion API) | Infrastructure de données          | API HTTP (Frontier)               | Données de compte/marché non couvertes par le journal        | Actif, non officiellement documenté       |
| EDSM                          | Base de données web                | Web / API                         | Carte stellaire, journal de vol, rangs                        | Actif                                       |
| Inara                         | Base de données web                | Web                                | Commerce, exploration, social, Powerplay, engineering         | Actif                                       |
| Spansh                        | Planification de route             | Web (SPA)                          | Plotter neutron, Road to Riches, Fleet Carrier, colonisation  | Actif                                       |
| EDMC                          | Application compagnon              | Desktop (Windows/macOS/Linux)      | Lecture de journal, socle de plugins, alimentation EDDN        | Très actif                                  |
| EDDiscovery                   | Application compagnon              | Desktop (Windows)                  | Carnet de bord, carte 3D, EDDLite                              | Très actif                                  |
| EDDI                          | Application compagnon              | Desktop (Windows)                  | Moteur d'intégration vocale/TTS, monitors et responders        | Actif                                       |
| EDCoPilot                     | Assistant vocal / tableau de bord   | Desktop (Windows)                  | Navigation, annonces vocales IA, VR                            | Actif                                       |
| VoiceAttack + profils ED      | Commandes vocales                  | Desktop (Windows)                  | Reconnaissance vocale de commandes                             | Hétérogène (fragmenté)                     |
| Canonn / EDMC-Canonn          | Recherche scientifique             | Desktop + web                      | Exobiologie, sites Guardian, Thargoïdes                        | Très actif                                  |
| Trade Dangerous               | Commerce                           | CLI (Python)                       | Optimisation d'itinéraires commerciaux                         | Actif                                       |
| ED Odyssey Materials Helper   | Gestion de matériaux               | Desktop (Windows/macOS/Linux)      | Inventaire d'engineering et de biologie                        | Extrêmement actif                           |
| BGS-Tally                     | Powerplay / BGS / Colonisation      | Plugin EDMC                        | Suivi et rapport BGS/Powerplay/Colonisation                     | Extrêmement actif                           |
| SrvSurvey / Raven Colonial    | Colonisation                       | Desktop (overlay) + Web            | Aide à la survey et au suivi de construction de colonies        | Actif (écosystème jeune)                   |
| Coriolis                      | Engineering / ship-building        | Web                                 | Construction et export de configurations de vaisseau            | Actif (organisation officielle EDCD)       |
| EDSY                          | Engineering / ship-building        | Web                                 | Simulateur d'outillage de vaisseau, alternative à Coriolis       | Actif                                        |
| EDEngineer                    | Engineering                        | Desktop                            | Tracker de matériaux d'engineering                              | Archivé (dépôt original)                    |
| Fuel Rats (Mecha)             | Entraide / secours                 | Discord/IRC + backend web          | Dispatch de bénévoles pour ravitaillement d'urgence              | Actif                                        |

---

## 11. Comment choisir ses outils selon son profil de jeu

- **Explorateur longue distance** : Spansh (plotter neutron, Road to Riches) en complément d'EDSM pour le suivi de
  découvertes, avec EDDiscovery ou EDMC comme application compagnon pour alimenter EDDN.
- **Commerçant** : Inara pour les routes lucratives en ligne, Trade Dangerous pour des calculs d'arbitrage plus poussés
  en ligne de commande.
- **Ingénieur/optimiseur de build** : Coriolis ou EDSY pour la conception de vaisseau, Inara ou ED Odyssey Materials
  Helper pour le suivi des matériaux et des ingénieurs.
- **Joueur BGS/Powerplay/Colonisation** : BGS-Tally, plugin EDMC incontournable pour ces trois activités, complété par
  les pages dédiées d'Inara et, pour la logistique fine d'un projet de colonisation, par SrvSurvey ou Raven Colonial
  (voir [Colonisation](./18-colonisation.md)).
- **Exobiologiste et chasseur de sites Guardian/Thargoïdes** : les outils Canonn (EDMC-Canonn en particulier), avec ED
  Odyssey Materials Helper pour la gestion des échantillons, et [Combat anti-Thargoïde (AX)](./25-combat-ax.md) pour le
  volet militaire.
- **Joueur en immersion/VR/multi-écran** : EDCoPilot pour le tableau de bord externe et les annonces vocales,
  éventuellement couplé à VoiceAttack et à un profil communautaire actif comme EDVA ou
  VoiceAttack-VAP-for-EliteDangerousV4.
- **Joueur en détresse** (panne de carburant, FSD endommagé, échoué loin de toute aide) : ce n'est pas un outil logiciel
  à proprement parler, mais rejoindre le Discord des Fuel Rats et lancer un ratsignal.

Dans presque tous les cas, **EDMC reste la brique de base à installer en premier** : c'est le point d'entrée le plus
largement supporté par l'écosystème de plugins, et il garantit que vos propres données (marchés, exploration)
contribuent au flux EDDN dont dépendent tous les autres outils.

---

## Questions fréquentes

**Comment fonctionne EDDN (Elite Dangerous Data Network) ?**

EDDN est un bus de messages qui redistribue en temps réel les événements des *Journal files* que le jeu écrit sur le
disque de chaque commandant ; il ne stocke rien lui-même, ce sont des services tiers comme EDSM, Inara, Spansh,
Coriolis ou EDSY qui l'écoutent pour construire leurs bases de données. Sur PC, les « capteurs » qui l'alimentent sont
des applications compagnons tournant en tâche de fond (EDMC en tête, mais aussi EDDI ou EDDiscovery) ; sur console,
l'accès aux fichiers de journal est plus restreint et passe par des outils dédiés comme le *console updater* d'EDSM.
Voir [Applications compagnons locales](#2-applications-compagnons-locales-journal-watchers).

**Quel outil installer en premier pour utiliser les outils communautaires (EDMC) ?**

Dans presque tous les cas, **E:D Market Connector (EDMC)** est la brique de base à installer en premier : il lit les
fichiers de journal, récupère les données de marché via la CAPI, les redistribue vers EDDN, et sert de socle de
plugins pour la quasi-totalité des utilitaires communautaires (BGS-Tally, EDMC-Canonn, trackers Powerplay...).
Installer EDMC garantit aussi que vos propres données de jeu contribuent au flux EDDN dont dépendent tous les autres
outils. Voir [Applications compagnons locales](#2-applications-compagnons-locales-journal-watchers).

**Quelle est la différence entre EDSM et Inara ?**

EDSM (Elite Dangerous Star Map) est perçu comme l'outil de référence pour l'exploration et la cartographie brute :
carte stellaire collaborative, suivi de journal de vol et de flotte, carnet de bord, rangs de commandant. Inara couvre
un périmètre plus large et social : commerce, squadrons, Powerplay, guerre Thargoïde et engineering (ingénieurs,
plans, effets expérimentaux). Le README d'EDDN qualifie d'ailleurs Inara de remplaçant populaire de l'ancien EDDB,
aujourd'hui mort. Voir [Bases de données et plateformes web communautaires](#1-bases-de-données-et-plateformes-web-communautaires-edsm-inara-spansh).

**Quel est le meilleur outil pour planifier une route en exploration longue distance (route plotter) ?**

**Spansh** est devenu la référence pour la planification de route longue distance : un plotter neutron exploitant les
autoroutes à étoiles à neutrons (supercharge FSD) pour calculer les trajets les plus rapides, un plotter galactique
classique, Road to Riches pour optimiser la première découverte et la première cartographie, et un plotter dédié aux
Fleet Carriers. Voir [Bases de données et plateformes web communautaires](#1-bases-de-données-et-plateformes-web-communautaires-edsm-inara-spansh).

**Qu'est-ce que la Frontier Companion API (CAPI) et est-elle officielle ?**

La CAPI est une API HTTP appartenant à Frontier Developments, à laquelle un outil s'authentifie par OAuth2 au nom du
commandant qui l'autorise ; elle expose des données que le journal ne fournit pas toujours (profil, cargaison,
matériaux, missions, ainsi que le marché, l'outfitting et le chantier naval de la station). Elle n'est pas
officiellement documentée par Frontier pour les développeurs tiers : son usage communautaire repose sur une
tolérance de fait et sur une rétro-ingénierie collective (dépôt `EDCD/FDevIDs`). Voir
[Sources de données et API](./17-sources-donnees.md) pour le détail technique complet.

**Quel plugin EDMC utiliser pour suivre le BGS et le Powerplay (BGS-Tally) ?**

**BGS-Tally** (auteur aussig) est l'outil dominant de la catégorie : il suit le Background Simulation (BGS), le
Powerplay et la Colonisation, avec overlay dédié, suivi de progression et publication automatique sur Discord. Sa
release la plus récente observée est v5.6.0, avec un dernier commit au dépôt le 31 août 2026 (instantané du 8
septembre 2026). Voir [Outils Powerplay et colonisation de systèmes](#7-outils-powerplay-et-colonisation-de-systèmes).

**Coriolis ou EDSY : quel ship-builder choisir pour construire un vaisseau ?**

Les deux sont traités comme équivalents par l'écosystème (EDDLite les connecte d'ailleurs côte à côte) : **Coriolis**
est le ship-builder historique désormais maintenu sous l'organisation officielle EDCD, tandis qu'**EDSY** est une
alternative indépendante maintenue par un développeur unique (pseudonyme `taleden`), avec des rapports de retrofit et
une gestion de configurations de chantier naval. Les deux simulent l'impact des plans d'engineering sur les
statistiques du vaisseau. Voir [Outils Engineering : construire un vaisseau](#8-outils-engineering--construire-un-vaisseau).

**Comment appeler les Fuel Rats en cas de panne de carburant (ratsignal) ?**

Un commandant en détresse lance un **ratsignal**, généralement sur le Discord officiel des Fuel Rats (historiquement
sur IRC) ; le bot de dispatch **Mecha** ouvre alors un dossier de secours (« case »), y attache les informations
pertinentes (système, CMDR, plateforme) et alerte les « rats » bénévoles disponibles pour livrer carburant ou
assistance, gratuitement et sans jugement, quelle que soit l'allégeance ou l'ancienneté du commandant. Voir
[Entraide en jeu : Fuel Rats](#9-entraide-en-jeu--fuel-rats).

**EDDB (Elite Dangerous Database) fonctionne-t-il encore ?**

Non : le README d'EDDN décrit lui-même Inara comme « a popular alternative to the now defunct EDDB ». EDDB, longtemps
une référence, est donc officiellement mort et a été remplacé dans l'usage communautaire par Inara et Spansh. Voir
[Bases de données et plateformes web communautaires](#1-bases-de-données-et-plateformes-web-communautaires-edsm-inara-spansh).

**Quels outils suivre pour la colonisation de systèmes ?**

**BGS-Tally** suit désormais la contribution d'un commandant aux projets de colonisation, en plus du BGS et du
Powerplay ; **SrvSurvey** (environ 170 étoiles GitHub) est un overlay contextuel qui aide à repérer les corps
colonisables ; **Raven Colonial** (`ravencolonial.com`) suit la construction d'un système en cours de colonisation, et
se relie à des plugins EDMC comme `ravencolonial_edmc` et `EDRavenColonialAgent`. Ce sont, avec BGS-Tally, les deux
outils qui font consensus dans un paysage par ailleurs fragmenté. Voir
[Outils de planification de colonisation](#outils-de-planification-de-colonisation).

**EDEngineer est-il toujours maintenu ?**

Non : le dépôt original `msarilar/EDEngineer` est archivé (fin de maintenance active côté auteur d'origine). Des forks
communautaires existent (RealMaxing/EDEngineer, PhilipG0ISW/EDEngineer) mais leur niveau d'activité réel n'a pas pu
être confirmé en détail. La communauté s'est largement reportée vers **ED Odyssey Materials Helper** (qui couvre
Horizons et Odyssey) et vers les pages Engineering d'Inara. Voir
[Outils Engineering : construire un vaisseau](#8-outils-engineering--construire-un-vaisseau).

---

## Voir aussi

- [Sources de données et API](./17-sources-donnees.md) — détail technique d'EDDN et de la Frontier Companion API (CAPI)
- [Colonisation](./18-colonisation.md) — la mécanique de colonisation de systèmes suivie par BGS-Tally, SrvSurvey et
  Raven Colonial
- [Porte-vaisseaux de joueur (Fleet Carriers)](./19-fleet-carriers.md) — couverts par le plotter dédié de Spansh
- [Le Background Simulation (BGS)](./21-bgs.md) — la mécanique suivie par BGS-Tally et les pages dédiées d'Inara
- [Escadrons de joueurs (Squadrons)](./22-squadrons.md) — profils et classements suivis par Inara
- [Combat anti-Thargoïde (AX) approfondi](./25-combat-ax.md) — le volet militaire complémentaire des outils Canonn,
  et la mécanique des sondes/liens thargoïdes que décode Link Decoder/Aurvandil (§8.2-8.3)
- [Guardians](./05-guardians.md) — le lore que documente le Codex Canonn, dont les 28 logs Guardian (§11)
- [Exploration et exobiologie](./10-exploration.md) — le Codex in-jeu (§1.6bis), à ne pas confondre avec le Codex
  Canonn cité dans ce guide
- [Les ingénieurs](./06-ingenieurs.md) — la mécanique d'engineering modélisée par Coriolis, EDSY et EDEngineer
- [Glossaire](./00-glossaire.md) — sigles courants (BGS et autres) utilisés dans ce guide

---

## Sources

Format normalisé selon [00-methodologie-sourcing.md §9](./00-methodologie-sourcing.md#9-format-normalisé-dune-section-sources) ;
voir aussi [11-commerce.md](./11-commerce.md) et [02-powerplay.md](./02-powerplay.md), premiers guides normalisés selon ce
gabarit.

- https://www.edsm.net/en/ | secondaire | consulté le 12/09/2026 | confirme : le périmètre fonctionnel d'EDSM (carte stellaire collaborative, suivi de journal de vol/flotte, carnet de bord, rangs de commandant, recherche de commodités/vaisseaux), son API v1 documentée et ses dumps nocturnes | ne confirme pas : la valeur exacte des compteurs de systèmes/corps célestes cités, qui progressent en continu et ne sont pas figés à une date donnée
- https://inara.cz/elite/ | secondaire | consulté le 12/09/2026 | confirme : le périmètre fonctionnel d'Inara (commerce, exploration, équipement, squadrons, Powerplay, guerre thargoïde, engineering, journaux de bord multilingues) et son statut de site actif suivant l'actualité Frontier en direct | ne confirme pas : les statistiques Powerplay en temps réel (voir la ligne powerplay-stats/ ci-dessous)
- https://inara.cz/elite/powerplay-stats/ | secondaire | consulté le 12/09/2026 | confirme : uniquement l'échec d'accès lui-même (HTTP 410 Gone) au moment du contrôle | ne confirme pas : le contenu des statistiques Powerplay attendu à cette URL — probablement une URL obsolète plutôt qu'un abandon de la fonctionnalité, le Powerplay restant couvert ailleurs sur le site (fiches de puissances et de systèmes, voir la section [1. Bases de données et plateformes web communautaires](#1-bases-de-données-et-plateformes-web-communautaires-edsm-inara-spansh) et `zones_incertaines`)
- https://canonn.science/ | secondaire | consulté le 12/09/2026 | confirme : la présentation de Canonn Interstellar Research (fondation fictive en avril 3301, domaines de recherche archéologie/étoiles à neutrons/exobiologie/xéno-technologie), son statut actif et le Codex Canonn (canonn.science/codex/) | ne confirme pas : l'ampleur précise des campagnes de ravitaillement du Gnosis (nombre de participants, tonnage livré), faute de chiffre unique vérifiable
- https://www.spansh.co.uk/ | secondaire | consulté le 12/09/2026 | confirme : l'existence de Spansh et sa vocation générale (plotter neutron, plotter galactique, Road to Riches, plotter Fleet Carrier, recherche de corps/stations) | ne confirme pas : le détail exact des fonctionnalités de colonisation ajoutées côté Spansh — site en SPA Ember.js non récupérable par un simple fetch (voir `zones_incertaines`)
- https://github.com/EDCD/EDMarketConnector | primaire | consulté le 12/09/2026 | confirme : le rôle d'EDMC comme application compagnon de référence (lecture des Journal files, données via CAPI, redistribution vers EDDN, socle de plugins) et son système de plugins Python (dossier `plugins`, fichier `load.py`) | ne confirme pas : les compteurs d'étoiles/issues et dates de commit cités en instantané du 8 septembre 2026, qui évoluent en continu
- https://github.com/EDCD/EDMarketConnector/wiki/Plugins | primaire | consulté le 12/09/2026 | confirme : la documentation officielle du système de plugins d'EDMC | ne confirme pas : la liste exhaustive à jour des plugins tiers, dont beaucoup sont hébergés hors de ce wiki
- https://github.com/EDCD/EDMarketConnector/wiki/Frontier-Authentication | primaire | consulté le 12/09/2026 | confirme : le fonctionnement de l'authentification OAuth2 d'EDMC auprès de la Frontier Companion API (CAPI) | ne confirme pas : une documentation officielle de la CAPI par Frontier elle-même, qui n'existe pas
- https://github.com/EDDiscovery/EDDiscovery | primaire | consulté le 12/09/2026 | confirme : la description officielle d'EDDiscovery (« Captain's log and 3D star map for Elite Dangerous »), son rôle d'alternative complète à EDMC et son module EDDLite | ne confirme pas : le détail des jalons de roadmap (voir la ligne release ci-dessous)
- https://github.com/EDDiscovery/EDDiscovery/releases/tag/Release_19.1.10 | primaire | consulté le 12/09/2026 | confirme : la release « 19.1.10 — Rhino Additions » (2 septembre 2026) et son contenu (packs vocaux, plugin CANONN, refonte du routing Spansh, suivi des mérites Powerplay) | ne confirme pas : le numéro de mérites suivi à une date ultérieure, qui peut changer d'une version à l'autre
- https://github.com/eyeonus/Trade-Dangerous | primaire | consulté le 12/09/2026 | confirme : la nature de Trade Dangerous (CLI Python d'optimisation d'itinéraires commerciaux) et le rôle du plugin EDMC comme source de données pour les outils de trading en ligne et hors ligne | ne confirme pas : des chiffres de rentabilité commerciale en jeu (hors périmètre de ce guide, voir [Commerce](./11-commerce.md))
- https://github.com/eyeonus/Trade-Dangerous/releases/tag/v13.1.0 | primaire | consulté le 12/09/2026 | confirme : la release v13.1.0 (1er juillet 2026) et le dernier commit observé le 23 août 2026 | ne confirme pas : une activité plus récente que cet instantané du 8 septembre 2026
- https://github.com/jixxed/ed-odyssey-materials-helper | primaire | consulté le 12/09/2026 | confirme : la nature de l'outil (gestion des matériaux d'engineering et de biologie sous Odyssey), la release v3.15.5 (8 septembre 2026), la licence MIT du code et la clause du fichier `NOTICE` sur les composants tiers propriétaires des binaires officiels | ne confirme pas : un compteur d'étoiles GitHub à une date ultérieure à cet instantané
- https://github.com/canonn-science/EDMC-Canonn | primaire | consulté le 12/09/2026 | confirme : la nature du plugin (« Project Athens », collecte scientifique automatisée : signaux, glyphes thargoïdes, ruines) et sa version v7.8.0 « Seven Dwarfs Ride a Rhino » (6 septembre 2026) | ne confirme pas : une version plus récente publiée après cet instantané
- https://github.com/canonn-science/canonn-tools | primaire | consulté le 12/09/2026 | confirme : le contenu du monorepo `canonn-tools` (Codex-Router, Link Decoder/Aurvandil, Signals, Thargoid Glyphs/Valknut) et sa mise à jour du 23 mars 2026 | ne confirme pas : le détail interne du calcul de triangulation de Link Decoder/Aurvandil au-delà de sa description fonctionnelle
- https://github.com/aussig/BGS-Tally | primaire | consulté le 12/09/2026 | confirme : le périmètre de BGS-Tally (suivi BGS + Powerplay + Colonisation, overlay, publication Discord automatique) et sa release v5.6.0/dernier commit le 31 août 2026 | ne confirme pas : une version plus récente publiée après cet instantané du 8 septembre 2026
- https://github.com/dwomble/EDMC-NeutronDancer | primaire | consulté le 12/09/2026 | confirme : la fonction du plugin (plotter de routes neutron/Spansh avancé) et sa version v2.0.1 (29 août 2026) | ne confirme pas : son niveau d'adoption réel par la communauté
- https://github.com/wuuthradd/EDMC-SpanshTools | primaire | consulté le 12/09/2026 | confirme : la fonction du plugin (routing, visualisation de route, import/export, overlays) et sa mise à jour du 27 juillet 2026 | ne confirme pas : son niveau d'adoption réel par la communauté
- https://github.com/vanderaj/powerplayplanner | primaire | consulté le 12/09/2026 | confirme : l'existence de l'outil de planification Powerplay et sa mise à jour du 2 juin 2026 | ne confirme pas : une adoption large au-delà d'un projet individuel de portée restreinte
- https://github.com/Celegast/powerplay-parser | primaire | consulté le 12/09/2026 | confirme : la fonction de l'outil (extraction OCR de données Powerplay depuis des captures d'écran) et sa mise à jour du 7 septembre 2026 | ne confirme pas : sa précision d'OCR ou son taux d'adoption réel
- https://github.com/EDCD/coriolis | primaire | consulté le 12/09/2026 | confirme : le statut de Coriolis comme ship-builder maintenu sous l'organisation officielle EDCD et son dernier commit observé le 29 avril 2026 | ne confirme pas : une activité de commit plus récente que cet instantané du 8 septembre 2026
- https://edsy.org/ | primaire | consulté le 12/09/2026 | confirme : la nature d'EDSY (simulateur d'outillage de vaisseau web) et l'usage déclaré d'assets/imagerie du jeu « avec la permission de Frontier Developments plc, à des fins non commerciales » | ne confirme pas : un rattachement officiel à Frontier — le site précise explicitement ne pas être endossé par Frontier
- https://github.com/taleden/EDSY | primaire | consulté le 12/09/2026 | confirme : le dépôt ouvert d'EDSY (environ 37 étoiles, dernier commit observé début septembre 2026) et sa gouvernance à développeur unique (`taleden`) | ne confirme pas : une activité plus récente que cet instantané du 8 septembre 2026
- https://github.com/msarilar/EDEngineer | primaire | consulté le 12/09/2026 | confirme : le statut archivé du dépôt original d'EDEngineer (fin de maintenance active côté auteur d'origine) | ne confirme pas : le niveau d'activité réel des forks communautaires (RealMaxing/EDEngineer, PhilipG0ISW/EDEngineer), non confirmé en détail (voir `zones_incertaines`)
- https://github.com/EDCD/EDDI | primaire | consulté le 12/09/2026 | confirme : l'architecture d'EDDI (Monitors et Responders), ses fonctionnalités (TTS multi-moteurs, plus de 275 types d'événements documentés, moteur Cottle, personnalités JSON) et son statut actif (dernier commit observé le 7 septembre 2026, environ 525 étoiles) | ne confirme pas : un compteur d'étoiles/commit plus récent que cet instantané du 8 septembre 2026
- https://github.com/EDCD/EDDI/wiki | primaire | consulté le 12/09/2026 | confirme : la documentation des Monitors et Responders d'EDDI | ne confirme pas : le détail exhaustif des plus de 275 types d'événements listés un par un dans ce guide
- https://github.com/EDCD/EDDN | primaire | consulté le 12/09/2026 | confirme : la description officielle d'EDDN comme bus de messages redistribuant les événements de journal, et la formule du README qualifiant Inara de « a popular alternative to the now defunct EDDB » | ne confirme pas : le dernier commit cité au tableau récapitulatif (12 juillet 2026) — à revérifier séparément sur le dépôt
- https://github.com/EDCD/FDevIDs | primaire | consulté le 12/09/2026 | confirme : le rôle de `EDCD/FDevIDs` comme catalogue des identifiants renvoyés par la CAPI, issu d'une rétro-ingénierie collective | ne confirme pas : une documentation officielle de la CAPI par Frontier elle-même, qui n'existe pas
- https://www.razzafrag.com/ | primaire | consulté le 12/09/2026 | confirme : le site officiel actuel d'EDCoPilot (après la redirection de l'ancien domaine `edcopilot.com`) et son modèle économique gratuit avec dons/Patreon facultatifs | ne confirme pas : un numéro de version plus récent que l'instantané v1.11.748 du 8 septembre 2026 — pas de dépôt GitHub public pour vérifier facilement
- https://razzserver.com/dokuwiki/doku.php?id=getting_started | primaire | consulté le 12/09/2026 | confirme : l'existence du wiki de configuration d'EDCoPilot hébergé sur `razzserver.com/dokuwiki` | ne confirme pas : le détail exhaustif des plus de 40 panneaux d'information cités dans ce guide
- https://github.com/Razzafrag/EDCoPilot-Installer | primaire | consulté le 12/09/2026 | confirme : le domaine officiel actuel d'EDCoPilot (razzafrag.com), retrouvé via ce dépôt d'installeur | ne confirme pas : le code source de l'application elle-même, EDCoPilot n'ayant pas de dépôt public pour l'application
- https://github.com/BielefeldJ/EDCopilotDialogueLibrary | primaire | consulté le 12/09/2026 | confirme : l'existence de la bibliothèque de répliques additionnelles EDCopilotDialogueLibrary et sa mise à jour de mars 2026 | ne confirme pas : son niveau d'adoption par les utilisateurs d'EDCoPilot
- https://github.com/markhollingworth-worthit/edcopter | primaire | consulté le 12/09/2026 | confirme : l'existence d'EDCoPTER (interface d'EDCoPilot reproduite dans un navigateur web local) et sa mise à jour de septembre 2025 | ne confirme pas : son niveau d'adoption ou de maintenance après cette date
- https://github.com/ArNeo-VR/EDVA | primaire | consulté le 12/09/2026 | confirme : l'existence du profil VoiceAttack EDVA, sa dernière mise à jour (11 octobre 2025) et son statut actif | ne confirme pas : le contenu exhaustif des commandes couvertes par le profil
- https://github.com/DawnTreader/VoiceAttack-VAP-for-EliteDangerousV4 | primaire | consulté le 12/09/2026 | confirme : l'existence du profil, sa dernière mise à jour (28 janvier 2026) et la recommandation explicite de coupler EDDI, BindED et EDCoPilot | ne confirme pas : le contenu exhaustif des commandes couvertes par le profil
- https://www.fuelrats.com/ | primaire | consulté le 12/09/2026 | confirme : le fonctionnement général du ratsignal et la procédure d'appel de détresse | ne confirme pas : le détail exact du guide de secours officiel (`wiki.fuelrats.com`, page indisponible au moment du contrôle — voir la section [9. Entraide en jeu : Fuel Rats](#9-entraide-en-jeu--fuel-rats) et `zones_incertaines`)
- https://github.com/FuelRats/fuelrats.com | primaire | consulté le 12/09/2026 | confirme : la description du site officiel par son propre dépôt GitHub (« Elite: Dangerous's premier emergency refueling service ») | ne confirme pas : le contenu du wiki de procédure (dépôt distinct, non consulté avec succès)
- https://github.com/FuelRats/pipsqueak3 | primaire | consulté le 12/09/2026 | confirme : l'existence de la génération précédente du bot de dispatch (Python), aujourd'hui archivée | ne confirme pas : une maintenance active au-delà de l'archivage
- https://github.com/FuelRats/SwiftSqueak | primaire | consulté le 12/09/2026 | confirme : la réécriture en Swift du bot de dispatch (aujourd'hui **Mecha**), dépôt actif (dernier commit observé fin août 2026, environ 8 étoiles) | ne confirme pas : une activité plus récente que cet instantané du 8 septembre 2026
- https://github.com/njthomson/SrvSurvey | primaire | consulté le 12/09/2026 | confirme : la nature de SrvSurvey (overlay contextuel orienté exploration et colonisation) et son compteur d'environ 170 étoiles GitHub | ne confirme pas : une activité plus récente que cet instantané du 8 septembre 2026
- https://github.com/njthomson/RavenColonialWeb | primaire | consulté le 12/09/2026 | confirme : le dépôt web principal de Raven Colonial et son compteur d'environ 14 étoiles GitHub | ne confirme pas : le détail des plugins EDMC tiers qui s'y connectent (`ravencolonial_edmc`, `EDRavenColonialAgent`, dépôts distincts)
- https://ravencolonial.com/ | primaire | consulté le 12/09/2026 | confirme : l'existence de l'outil web Raven Colonial, dédié au suivi de la construction d'un système en cours de colonisation | ne confirme pas : le détail des plugins EDMC tiers qui alimentent automatiquement sa progression depuis le jeu
