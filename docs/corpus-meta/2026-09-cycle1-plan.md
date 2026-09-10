# Plan d'enrichissement du corpus Elite Dangerous (17 guides)

> **Document de travail, hors corpus — archive du cycle 1.** Ce fichier vit dans `docs/corpus-meta/` et doit être
> **exclu de l'ingestion RAG** : il décrit un plan de travail, il ne documente pas le jeu. Les actions qu'il liste
> ont été **entièrement appliquées** ; il ne décrit donc pas l'état actuel du corpus. Les pistes qu'il formule à
> l'affirmatif (dont le vaisseau « Nomad », son constructeur, sa classification, et le mode multijoueur
> « Operations » 2026) ont été **retirées du corpus faute de source fiable** — voir
> [14-rhino-nomad.md](../../raw_data/14-rhino-nomad.md) et [00-chronologie-canonique.md](../../raw_data/00-chronologie-canonique.md), qui
> font foi. Voir aussi le [plan de cycle 3](./2026-09-plan-cycle3.md) et
> [l'annexe des constats](./2026-09-constats.md).

Document de travail issu de l'audit critique des 17 guides existants et de l'audit des systèmes de jeu majeurs absents du corpus. Objectif : combler les lacunes de contenu, corriger les incohérences factuelles inter-guides, et renforcer la cohérence RAG (liens croisés, fraîcheur des données, format des tableaux).

---

## 1. Nouveaux guides à créer

Classés par ordre d'importance/impact décroissant.

### 1. `18-colonisation.md` — La Colonisation de systèmes
**Périmètre** : mécanique de revendication d'un système inhabité, construction (avant-poste → starport Coriolis/Orbis/Ocellus → installation planétaire), choix de l'orientation économique, tonnage de commodités requis par palier, interface du contact System Colonisation (distance de claim, suivi de livraison, abandon/démolition), chronologie officielle (bêta 26-28 février 2025, lancement complet 11 novembre 2025 « Dodec Update »). Doit trancher et devenir la référence unique citée par 02, 03, 04, 05, 07, 09, 10, 11, 12, 13, 15, 16, 17 qui l'évoquent tous partiellement sans jamais la documenter en propre.

### 2. `19-fleet-carriers.md` — Porte-vaisseaux de joueur (Fleet Carriers)
**Périmètre** : achat (prix, formule de maintenance hebdomadaire), capacité de soute par baie, carburant tritium (consommation/saut, portée max ~500 al, cooldown), services embarqués (Drydock, Refuel/Repair/Rearm, marché d'achat/vente, Cartographie Universelle, Vente de denrées rares), décommissionnement, usage en commerce/minage/colonisation/ingénierie/Powerplay. Cité en passant dans 6 guides, jamais expliqué comme système.

### 3. `20-minage.md` — Le Minage (Mining)
**Périmètre** : les trois techniques (laser mining, core mining, subsurface/deep core), équipement dédié (limpet controllers Prospector/Collector, canon d'abrasion, missile de déplacement sous-terrain, charge sismique, raffinerie), hotspots et outils de repérage, minage de surface planétaire (Rhino), rendements chiffrés et revente. Une des quatre boucles de gameplay fondamentales du jeu, actuellement éclatée entre 11-commerce, 14-rhino-nomad et 02-powerplay.

### 4. `21-bgs.md` — Le Background Simulation (BGS)
**Périmètre** : états de faction (Boom/Bust/Famine/Outbreak/Guerre civile/État de guerre/Élection), mécanique d'expansion/rétraction des factions mineures, influence, comment un joueur ou un groupe influence le BGS (missions, ventes, assassinats), et son articulation avec Powerplay, la Colonisation et les Community Goals. Système sous-jacent central, mentionné en une ou deux phrases seulement dans 3 guides.

### 5. `22-squadrons.md` — Escadrons de joueurs (Squadrons)
**Périmètre** : création, rôles/permissions, rattachement à une faction mineure, Squadron Carrier, Squadron Bank, classements, et refonte de la saison Vanguards (19 août 2025). Structure sociale persistante remaniée récemment mais jamais expliquée en tant que système.

### 6. `23-jeu-en-groupe.md` — Wings, Multicrew et CQC
**Périmètre** : Wings (nav-lock partagé, bounties/XP partagés, missions et balise de wing), Multicrew (rôles pilote/tourelleur/chasseur embarqué en télé-présence, partage des revenus), et CQC (Close Quarters Combat, mode arène dédié avec son propre rang Pilots Federation). Trois mécaniques de coopération/compétition regroupées en un seul guide compact plutôt que trois guides trop minces.

### 7. `24-community-goals.md` — Community Goals (mécanique générique)
**Périmètre** : fonctionnement générique (objectifs à paliers, suivi de contribution individuelle/collective, cycles hebdomadaires, récompenses typiques en crédits/matériaux/blueprints/paint jobs), comment les repérer (Inara, tableau des missions), et un tableau des CG marquants 2015-2026. Actuellement traité uniquement comme événements historiques ponctuels dans 01-lore et 10-exploration.

### 8. `25-combat-ax.md` — Combat anti-Thargoïde (AX) approfondi
**Périmètre** : taxonomie complète des vaisseaux thargoïdes (Scouts, Basilisk/Medusa/Hydra/Cyclops, Titans), anatomie d'un Interceptor (sous-systèmes à détruire), nuages caustiques, builds AX chiffrés, ressources AXI/Aegis, état de la guerre thargoïde en 2026 (post-« Thargoid War Epilogue »). Lacune la plus fine identifiée : la matière existe déjà en germe dans 08-combat-spatial, 04-equipements, 05-guardians et 01-lore — ce guide agrège et approfondit plutôt que de combler un vide total. Priorité la plus basse des 8.

---

## 2. Améliorations transversales

| # | Problème transversal | Action concrète |
|---|---|---|
| 1 | Liens croisés manquants de façon quasi systématique (chaque guide audité en liste 6 à 9) | Ajouter un encart « Voir aussi » standardisé en tête ou fin de chaque section concernée, et faire une passe dédiée de bidirectionnalisation (si A renvoie vers B, vérifier que B renvoie vers A) sur les ~140 liens manquants recensés dans les critiques. |
| 2 | Incohérences chronologiques graves entre guides sur les mêmes événements (Ascendancy : 31/10/2024 dans 02-powerplay vs 26/02/2025 dans 01-lore ; « Operations » : fin juin 2024 dans 09 vs 1er juillet 2026 dans 14/15 ; Rhino : août 2025 dans 09 vs 2 septembre 2026 dans 14 ; Caspian Explorer : janvier 2025 (patch) dans 09 vs 2 décembre 2025 (vaisseau) dans 14 ; Kestrel Mk II : février 2025 dans 09 vs 24 février 2026 dans 14 ; Lynx Highliner : Saud Kruger dans 12 vs Zorgon Peterson dans 03) | Créer une table de vérité unique (voir aussi le futur `18-colonisation.md` pour son propre cas) — un fichier `00-chronologie-canonique.md` ou une section pivot dans 15-roadmap — sourcée exclusivement sur elitedangerous.com/update-notes et Galnet, puis répercuter les corrections dans chaque guide concerné en une passe de réconciliation dédiée avant toute autre édition. |
| 3 | Chiffres volatils présentés comme définitifs (rangs GitHub, versions de plugins, classements Powers, prix ARX, mérites/heure) sans date de relevé | Adopter partout la convention déjà utilisée par endroits : « instantané daté » (« capturé le JJ/MM/AAAA, à revérifier sur [source] ») au lieu d'un chiffre nu, et ajouter un en-tête de fraîcheur (« Dernière vérification : JJ/MM/AAAA ») en tête de chaque guide. |
| 4 | Absence de glossaire commun pour les sigles récurrents (NMLA, INRA, GalCop, SCO, BGS, HRP/MRP, AX, CZ, RES, CG) | Créer un glossaire transversal (nouveau fichier ou section dans un guide d'index) référencé par tous les guides plutôt que de laisser chacun définir — ou pas — les sigles localement. |
| 5 | Disclaimer « stats hors ingénierie » inconsistant (présent dans certains guides, absent dans 03-vaisseaux et 04-equipements) | Uniformiser un encart standard « Ces valeurs sont données en configuration stock ; l'ingénierie (voir 06-ingenieurs) peut les modifier significativement » sur toute section de statistiques chiffrées. |
| 6 | Duplication de contenu à risque de désynchronisation (modules Powerplay dans 04 vs 02 ; description d'EDDN dans 16 vs 17 ; ressources Guardian/Canonn dans 05 vs 16/17 ; classement Powers dans 12 vs 02) | Politique « une seule source de vérité + renvoi » : identifier pour chaque sujet dupliqué le guide propriétaire et remplacer les autres occurrences par un renvoi court plutôt qu'une redite. |
| 7 | Format de tableaux hétérogène d'un guide à l'autre (colonnes différentes pour des données comparables : vaisseaux, matériaux, blueprints) | Définir un gabarit de colonnes standard par type de donnée (ex. vaisseaux : Nom \| Fabricant \| Prix \| Portée de saut \| Hardpoints \| Emplacements internes \| Source \| Date) et le réappliquer aux tableaux existants lors de leur prochaine édition. |
| 8 | Sourcing inégal : certains guides (06, 10, 17) citent systématiquement leur source inline, d'autres (13, 15) restent vagues (« un guide communautaire de 2025 ») | Exiger dans chaque guide une section ou un encart « Note sur la fiabilité des données chiffrées » (déjà présent dans 07 et 09) comme standard minimal du corpus. |
| 9 | Aucun point d'entrée global au corpus pour orienter le lecteur ou un système RAG vers le bon guide | Créer un `00-index.md` avec la liste des 17 (bientôt 25) guides, un résumé d'une ligne chacun, et une carte des recoupements thématiques majeurs (Colonisation, Operations, Powerplay) pour réduire le risque de contradictions futures. |

---

## 3. Plan par guide existant

### 01-lore
1. Ajouter une sous-section 2.7 « La Pilots Federation » (organisation neutre, rebuy, licence des Commandants) avec renvoi vers 08-combat-spatial.
2. Ajouter une sous-section 3.7 « AEGIS et Salvation » : structure d'AEGIS, Arek Vandevar, arc Salvation/Azimuth Biotech, lien explicite avec les technologies SCO listées en 1.8.
3. Étoffer les portraits de Yuri Grom, Zemina Torval, Pranav Antal, Nakato Kaine (6.2) au niveau des autres figures politiques.
4. Trancher l'incohérence de date Ascendancy/Colonisation avec 02-powerplay (26/02/2025 vs 31/10/2024) via les patch notes officiels, et ajouter une sous-section « Trailblazers » de transition avant 1.8.
5. Ajouter un tableau-maître de chronologie consolidée en tête de section 1 (Année in-game / Date réelle / Événement / Catégorie).
6. Combler le vide narratif 2382-3230 avec 3-4 jalons vérifiés.

### 02-powerplay
1. Résoudre et sourcer officiellement l'incohérence de date Ascendancy (31/10/2024 ici vs 26/02/2025 dans 01-lore) avant toute publication.
2. Ajouter une sous-section 5.8 « Powerplay et Colonisation » expliquant comment les systèmes colonisés entrent dans la carte Powerplay.
3. Construire un tableau complet de progression de rang (mérites cumulés par palier) avec estimation d'heures pour rang 100.
4. Ajouter une matrice éthos par Power (12 lignes x 4 catégories) pour rendre le choix de Power actionnable.
5. Ajouter une sous-section 7.5 « Basculer ou quitter un Power » (perte/conservation des modules, cooldown de re-pledge).
6. Dater le tableau « Systèmes Bastion » (capturé le JJ/MM/AAAA) et renvoyer vers 16-outils au lieu de dupliquer la liste d'outils tiers.

### 03-vaisseaux
1. Corriger l'incohérence interne 47 vs 48 vaisseaux et clarifier le SCO (disponible sur tout FSD depuis Update 17, pas réservé à 8 vaisseaux).
2. Ajouter un tableau unique « Emplacements et hardpoints » pour les 48 vaisseaux, sourcé sur EDCD/coriolis-data.
3. Ajouter une colonne « Portée de saut » (stock + référence ingéniée) à chaque tableau de prix.
4. Ajouter une section « Rangs de réputation requis » (tableau) pour les 11 vaisseaux à accès conditionné.
5. Ajouter une section « Chasseurs embarqués (Ship-Launched Fighters) » avec la liste des vaisseaux dotés d'une baie.
6. Nommer explicitement 14-rhino-nomad dans « Le cas du Nomad » et ajouter un exemple chiffré de « coût réel d'un vaisseau équipé » (rebuy inclus).

### 04-equipements
1. Ajouter une section « Contrôleurs de limpets » (Collector, Prospector, Hatch Breaker, Fuel Transfer, Repair, Recon, Decontamination) en tableau.
2. Ajouter une section « Coque et blindage (Bulkheads) » avec les 5 grades et leurs résistances en %.
3. Ajouter les Hull/Module Reinforcement Packages standards (non-Guardian).
4. Ajouter un encart « Priorité d'alimentation des modules » (power priority 1-5).
5. Ajouter des données chiffrées : portée FSD par classe/notation, résistances de bouclier et rendement décroissant des Shield Boosters empilés.
6. Ajouter une section « Chasseurs embarqués » (Fighter Hangar, 4 modèles) avec renvoi vers 03-vaisseaux.

### 05-guardians
1. Ajouter un tableau « Sites Guardian de référence » (système, distance depuis la Bulle, particularité) pour au moins 5-8 sites nommés.
2. Ajouter un tableau chiffré du Guardian FSD Booster par classe (1-5) et préciser la règle « un seul par vaisseau ».
3. Créer une sous-section « Le puzzle des obélisques » (distincte du puzzle de pylônes).
4. Ajouter un tableau de stats de combat pour les trois armes Guardian (DPS, dégâts alpha, charge thermique).
5. Corriger la datation de la Colonisation (2025, pas fin 2024) et retirer/reformuler le lien spéculatif entre le teaser Canonn du 30/08/2025 et les Guardians (il mène en réalité à HIP 87621/exobiologie).
6. Ajouter une sous-section « Ingénierie des armes Guardian » et une sous-section « Volet à pied (Odyssey) ».

### 06-ingenieurs
1. Ajouter une section « Ingénierie de l'équipement Odyssey » (blueprints/effets pour les 13 ingénieurs à pied), avec renvoi vers 07-equipement-a-pied.
2. Ajouter un tableau « Plafonds de stockage des matériaux » par grade (Raw/Manufactured/Encoded).
3. Scinder clairement Guardian Technology Broker et Human Technology Broker avec leurs unlocks respectifs.
4. Remplacer l'exemple unique de coût FSD par 2-3 builds chiffrés complets et sourcés (exports Coriolis/EDSY).
5. Revérifier l'impact de Powerplay 2.0 sur les conditions de déblocage historiquement liées à un rang de puissance.
6. Corriger les blueprints douteux (« Shielded » Fuel Scoop, « FastBoot » FSD non confirmés).

### 07-equipement-a-pied
1. Résoudre la contradiction majeure sur « Operations » (trois chronologies mutuellement exclusives avec 09 et 13) en vérifiant contre les sources primaires et en harmonisant les trois guides.
2. Ajouter une table « Modifications d'outils » (Wave Scanner, Profile Analyser, Compact Multi-Tool, E-Break).
3. Ajouter une colonne « Effet expérimental » aux tables de modifications suit/arme (second slot d'ingénierie actuellement absent).
4. Créer un tableau catalogue d'armes nommées par fabricant (Kinematic Armaments, Manticore, Takada).
5. Ajouter une section « Mort et rebuy à pied » (perte du sac à dos, coût d'assurance).
6. Enrichir les Actualités avec les patchs Caspian Explorer (2/12/2025) et Kestrel Mk II (24/02/2026) correctement datés, en cohérence avec 09 et 14.

### 08-combat-spatial
1. Ajouter une section « Interdiction et évasion » (mini-jeu, mass lock, low/high wake).
2. Ajouter une sous-section « Renforts et blindage » (HRP/MRP, bulkheads) et un tableau de résistances aux dégâts chiffré.
3. Ajouter 2-3 builds entièrement chiffrés par archétype (section 5), sourcés.
4. Ajouter une section « Rang de combat et modes de jeu » (échelle Harmless→Elite, Open/Groupe privé/Solo, mention du CQC).
5. Ajouter une section « Crime, primes et notoriety » (bounty vouchers, Interstellar Factors, niveaux de sécurité).
6. Étoffer 3.5 (AX) : anatomie d'un Interceptor, nuages caustiques, état de la guerre thargoïde en 2026 avec lien vers 01-lore.

### 09-combat-a-pied
1. Réécrire entièrement la table « Historique des évolutions récentes » en la recoupant avec 07 et 14 (Kestrel Mk II → 24/02/2026, Caspian Explorer → 02/12/2025, Rhino → 02/09/2026, Operations → 01/07/2026).
2. Ajouter un tableau d'armes nommées par fabricant en renvoyant à 07-equipement-a-pied.
3. Ajouter un tableau condensé d'ingénierie de combat avec les Engineers nommés (source : 07).
4. Ajouter une sous-section « Détection et infiltration » détaillée (mécanique de suspicion/confinement, lien 13-operations).
5. Ajouter une sous-section sur le combat à mains nues (Added Melee Damage).
6. Ajouter des renvois « voir aussi » explicites en tête vers 07, 13, 14, 02 pour éviter la duplication contradictoire actuelle.

### 10-exploration
1. Ajouter une sous-section « Exploration et Colonisation » (repérage de systèmes éligibles, renvoi vers 18-colonisation).
2. Corriger l'erreur factuelle : Artemis ≠ « Maverick suit » (deux combinaisons distinctes) — renvoyer vers 07-equipement-a-pied.
3. Compléter les tableaux Bacterium et Tussock (actuellement tronqués à quelques espèces sur 13-14).
4. Ajouter une sous-section « Rangs Explorateur et Exobiologiste » (échelle Aimless Wanderer → Elite V).
5. Ajouter un build chiffré complet en §2.6 (portée de saut engineered vs stock).
6. Compléter le tableau des distances minimales de séparation (8 genres manquants) et ajouter une sous-section Earth-like/Water Worlds.

### 11-commerce
1. Ajouter le Panther Clipper Mk2 au tableau comparatif de vaisseaux (absent alors que disponible depuis ~octobre 2025).
2. Ajouter une sous-section « Mécanique des prix » (offre/demande, types d'économie de station, états Famine/Outbreak/Guerre civile).
3. Ajouter un exemple chiffré complet de route de commerce légal en vrac (actuellement absent malgré le sujet central du guide).
4. Ajouter une section « Fleet Carrier et commerce » et une section « Community Goals ».
5. Ajouter une sous-section « Rang de commerce » (9 paliers, seuils, avantages).
6. Ajouter le Type-8 Transporter et le Keelback dans la progression de vaisseaux, et un encart EDMC/BGS-Tally.

### 12-transport
1. Corriger la contradiction sur le Lynx Highliner (fabricant et gabarit divergents entre 12 et 03).
2. Ajouter une sous-section « Fleet Carriers » (renvoi vers le futur 19-fleet-carriers).
3. Ajouter une section « Sauvetage et transport de survivants (Search & Rescue) » avec les bonus Powerplay associés.
4. Réconcilier ou retirer le tableau « Classement des Puissances (novembre 2024) », en désaccord frontal avec 02-powerplay.
5. Ajouter un tableau numérique de capacité de cabines par taille de module (classe 1-6).
6. Ajouter un tableau « Marchandises et tonnage de la colonisation » (renvoi vers 18-colonisation).

### 13-operations
1. Ajouter une section « Le mode Opérations multijoueur (2026) » désambiguïsant explicitement le titre du guide (6 scénarios, Operation Runner, Nomad, Merc Coins) avec renvoi vers 09 et 15.
2. Ajouter un tableau d'Engineers à pied nommés mappés aux archétypes de mission (source 07/06).
3. Remplacer les 4 puces de « Récompenses » par un tableau chiffré par niveau de menace.
4. Ajouter une sous-section « Powerplay et missions d'Opérations » (cycle Acquisition/Renforcement/Sape).
5. Remplacer le paragraphe spéculatif sur la colonisation par une section « Colonisation et sécurité des installations » factuelle.
6. Nommer les armes par fabricant/archétype de mission (cohérence avec 07/09).

### 14-rhino-nomad
1. Réécrire intégralement §3.3 avec les données réelles du Nomad (constructeur Faulcon DeLacy, classification SLV, tableau de compatibilité des soutes Mk I/Mk II) tirées de 15-roadmap.
2. Corriger §2.3 : le hotfix 4.4.1.1 (3/09/2026) a déjà livré le passage 9→12 fragments, ce n'est plus une annonce future.
3. Ouvrir une réconciliation sourcée sur la date de lancement d'Operations avec 09-combat-a-pied (juin 2024 vs juillet 2026) et sur la composition initiale des six opérations (Under Siege).
4. Ajouter un encadré de désambiguïsation en tête de §3.2 : « Ne pas confondre avec les Opérations à pied d'Odyssey (2021), voir guide 13 ».
5. Ajouter un tableau économique de valorisation des 13 nouvelles matières (renvoi vers 11-commerce/06-ingenieurs).
6. Ajouter une sous-section sur l'armement/la sécurité du Rhino (répartition des rôles, coût de rebuy).

### 15-roadmap
1. Ajouter des renvois explicites vers 13-operations et 14-rhino-nomad pour éviter la duplication superficielle actuelle et laisser la profondeur technique aux guides dédiés.
2. Revérifier la date du 10e anniversaire de Colonia (« juillet-août 2026 » semble décalée d'un an par rapport à l'arrivée de Jaques Station en septembre 2015).
3. Ajouter une sous-section « Suivi de la Colonisation de systèmes (2025-2026) » avec les patchs d'équilibrage successifs.
4. Ajouter une section « Community Goals » (renvoi vers le futur 24-community-goals).
5. Transformer « Contenu annoncé mais pas encore sorti » en tableau de suivi daté avec statut et prochaine vérification.
6. Ajouter un tableau de conversion ARX → monnaie réelle pour contextualiser les prix du Nomad.

### 16-outils
1. Ajouter un paragraphe « Frontier Companion API (CAPI) » dans la vue d'ensemble (source de données structurante omise).
2. Donner à EDSY (edsy.org) un paragraphe propre, au même niveau que Coriolis.
3. Ajouter une sous-section « Outils de planification de colonisation » (renvoi vers 18-colonisation).
4. Étoffer la sous-section EDDI (fonctionnalités réelles, écosystème de plugins) actuellement disproportionnée par rapport à EDCoPilot.
5. Ajouter une entrée « Fuel Rats » (bot Mecha, dispatch ratsignal).
6. Remplacer les chiffres figés (étoiles GitHub, versions précises) par une convention « vérifier la dernière release sur le dépôt ».

### 17-sources-donnees
1. Ajouter une sous-section sur la fin des serveurs Legacy et son impact sur le format `gameversion` de la CAPI.
2. Ajouter un tableau d'endpoints Spansh API (symétrie avec le tableau EDSM déjà détaillé).
3. Créer une section dédiée « EDCD/coriolis-data » (référentiel de stats vaisseaux/modules), avec renvoi vers 03 et 04.
4. Ajouter une table des bitfields `Flags`/`Flags2` de Status.json (actuellement reconnue comme lacune par le texte lui-même).
5. Ajouter une sous-section « Ardent Industry et Elite BGS » (agrégateurs de niche non couverts).
6. Ajouter deux exemples concrets copiables (une ligne de journal, un message EDDN complet) pour rendre le guide actionnable pour un développeur.

---

## 4. Priorisation globale — Top 10 actions

1. **Créer `18-colonisation.md`.** Système de jeu majeur (bêta fév. 2025, lancement complet nov. 2025) totalement absent en tant que guide dédié alors qu'il est mentionné partiellement dans 10 des 17 guides existants — la lacune la plus large et la plus transversale du corpus.
2. **Réconcilier les incohérences chronologiques critiques inter-guides** (date d'Ascendancy, date de lancement d'« Operations », dates du Rhino/Nomad/Caspian Explorer/Kestrel Mk II). Ces contradictions actives entre guides du même corpus menacent directement la fiabilité de toute réponse RAG citant une date.
3. **Créer `19-fleet-carriers.md`.** Infrastructure de jeu citée dans 6 guides différents comme prérequis logistique (commerce, minage, colonisation, ingénierie) mais jamais expliquée en tant que système — un trou d'information à fort taux de consultation probable.
4. **Créer `20-minage.md`.** Une des quatre boucles de gameplay fondamentales du jeu (avec combat, commerce, exploration), actuellement éclatée sans traitement autonome.
5. **Harmoniser le mode « Operations » (2026) à travers 07, 09, 13, 14, 15** et le désambiguïser explicitement du terme « Opérations » à pied d'Odyssey (2021) — collision terminologique documentée qui affecte au moins 4 guides simultanément.
6. **Ajouter le tableau « Emplacements et hardpoints » + portée de saut dans `03-vaisseaux`.** Données de référence les plus consultées pour ce type de contenu et pourtant absentes pour la quasi-totalité des 48 vaisseaux du guide central du corpus.
7. **Créer `21-bgs.md`.** Système sous-jacent qui conditionne Powerplay, la Colonisation et les Community Goals, mentionné seulement en une ou deux phrases dans tout le corpus malgré son rôle structurant.
8. **Enrichir `01-lore` avec la Pilots Federation et l'arc AEGIS/Salvation.** Piliers de lore fondamentaux (statut du joueur, origine des technologies SCO) absents d'un guide qui se présente comme la référence narrative du corpus.
9. **Combler les données chiffrées manquantes de `04-equipements`** (limpets, bulkheads, résistances de bouclier, priorité d'alimentation) : guide de référence équipement sans aucune valeur chiffrée exploitable pour un calcul de build réel.
10. **Mettre en place la politique de liens croisés systématiques + glossaire commun.** Amélioration transversale à faible coût unitaire mais fort effet cumulé : chaque guide audité recense 6 à 9 renvois manquants, un défaut structurel qui limite la valeur du corpus comme base RAG cohérente.
