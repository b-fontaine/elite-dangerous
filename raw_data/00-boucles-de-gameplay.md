---
id: 00-boucles-de-gameplay
titre: "Carte des boucles de gameplay : rentabilité comparée et jalons de progression"
domaine: transversal
entites: [Cr/h, Fleet Carrier, Community Goal, Powerplay, BGS, Road to Riches, First Footfall, Combat Zone, Interceptor thargoïde, Architecte système, rebuy, Pilot Training, Robigo]
mots_cles_en: [credits per hour, cr/h, fleet carrier, community goal, powerplay merits, bgs influence, road to riches, first footfall, combat zone, thargoid interceptor, system architect, rebuy cost, pilot training, robigo run]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-13
confiance_globale: moyenne
volatilite: haute
sources_primaires: [guides internes du dépôt (27-debuter-et-progresser.md, 03-vaisseaux.md, 08-combat-spatial.md, 25-combat-ax.md, 12-transport.md, 10-exploration.md, 19-fleet-carriers.md, 18-colonisation.md, 20-minage.md, 21-bgs.md, 02-powerplay.md, 24-community-goals.md, 30-piraterie-et-pvp.md, 29-missions-reputation-et-rangs.md, 26-ingenierie-a-pied-avancee.md), GameRant "Elite Dangerous: 12 Best Ways To Make Money", Steam Community (discussions générales, forums Elite Dangerous), Anti-Xeno Initiative wiki (wiki.antixenoinitiative.com), Elite Dangerous Wiki (Fandom, Combat_Bond_Voucher et Exobiologist), Pilots Trade Network]
zones_incertaines: ["les quatre chiffres Cr/h ajoutés par ce document pour le combat AX, les primes/CZ, le transport de passagers et l'exobiologie sont des reconstitutions communautaires datées du 13 septembre 2026, non des barèmes Frontier officiels — ils sont marqués comme tels partout où ils apparaissent et devront être revérifiés à chaque rééquilibrage majeur", "le rendement horaire du minage subsurface et du core mining n'est toujours pas chiffré par le corpus (seulement qualitatif, « supérieur au laser par gisement »)", "la formule de revenu hebdomadaire de l'Architecte système (18-colonisation.md) reste non officielle", "le rapport de poids exact entre les cinq paliers de récompense de mission BGS-Tally n'est publié ni par Frontier ni par l'outil"]
guides_lies: [2, 3, 8, 10, 11, 12, 18, 19, 20, 21, 24, 25, 26, 27, 29, 30, 31]
---

# Carte des boucles de gameplay : rentabilité comparée et jalons de progression

## En bref

Ce document répond à la question la plus posée par les joueurs — « quelle boucle rapporte le plus, et avec quel
vaisseau » — qui n'avait jusqu'ici de réponse que fragmentaire : un comparatif qualitatif de quatre activités de
débutant en [27-debuter-et-progresser.md §1.2](./27-debuter-et-progresser.md), des chiffres Cr/h épars dans onze guides
différents, et **trois zones aveugles totales** (combat anti-Thargoïde, primes et Combat Zones, transport de
passagers) où aucune valeur en crédits n'existait nulle part dans le corpus. Un **tableau unique de 22 boucles** les
met désormais côte à côte : extension requise, capital d'entrée, Cr/h en fourchette datée, temps avant premier revenu,
rang(s) progressé(s) et guide de référence. Les quatre chiffres qui manquaient — AX (≈ 20 à 60 M Cr/h), primes/Combat
Zones (≈ 30 M Cr/h en HazRES, jusqu'à 200 M+ Cr en missions de massacre empilées), transport de passagers (≈ 50 à
100 M Cr/h, jusqu'à 90 M Cr/h sur la route historique Robigo → Sothis) et exobiologie (≈ 15 à 25 M Cr/h sans bonus,
bien plus sur un corps vierge) — sont des **reconstitutions communautaires datées**, pas des barèmes Frontier, et sont
signalées comme telles à chaque occurrence. Trois parcours-types chiffrés (0 → 100 M Cr, 100 M → 1 Md Cr, débloquer un
Porte-Vaisseau à 5 Md Cr) et une matrice croisant chaque boucle avec les systèmes qu'elle fait progresser (BGS,
Powerplay, ingénierie, rang) complètent la carte. Ce document est cité en tête du [README](../raw_data/README.md)
comme point d'entrée du corpus sur la question de la rentabilité.

## Note de méthode : ce qui est un chiffre du corpus, ce qui est une reconstitution, ce qui reste non calibré

Trois régimes de fiabilité coexistent dans le tableau ci-dessous, distingués par une lettre en fin de cellule Cr/h :

- **[C]** — chiffre déjà établi et sourcé ailleurs dans le corpus (ex. minage laser optimisé, contrebande façon
  Robigo, mérites Powerplay par activité) : voir le guide propriétaire pour le sourçage complet.
- **[R]** — reconstitution communautaire ajoutée par ce document pour combler une zone aveugle (AX, primes/CZ,
  passagers, exobiologie), datée du **13 septembre 2026**, bâtie sur des valeurs unitaires vérifiables (primes par
  classe d'Interceptor, temps de neutralisation de bouclier, valeurs de vente Vista Genomics) plutôt que sur une
  moyenne globale invérifiable. Ce n'est **pas** un chiffre Frontier ; il se dégradera au premier rééquilibrage.
- **[N]** — non calibré : le corpus et la recherche communautaire ne fournissent aucune base chiffrable fiable
  (minage subsurface/core, farming BGS, farming à pied et à bord). Traité comme tel plutôt que comblé par une
  estimation arbitraire — c'est la même règle que celle déjà appliquée à la cadence de scan exobiologique
  ([10-exploration.md §2.5](./10-exploration.md)) et à l'INF/heure du BGS ([21-bgs.md §5.7](./21-bgs.md)).

Aucune valeur codée **[R]** ou **[C]** de ce document ne doit être recopiée dans un autre guide sans son marqueur de
fiabilité : c'est ce marqueur, pas le chiffre seul, qui permet à un lecteur (ou à un pipeline RAG) de calibrer sa
confiance.

## Tableau unique des boucles de gameplay comparées

Vingt-deux boucles, classées par domaine d'activité. « Capital d'entrée » compte le vaisseau/l'équipement minimal
requis en plus de ce que possède déjà un Commandant ayant terminé le didacticiel. « Temps avant premier revenu »
suppose un joueur qui sait déjà où aller (routes, systèmes, contacts déjà identifiés par le guide propriétaire).

| Boucle | Extension | Vaisseau/équipement minimal | Capital d'entrée | Cr/h (fourchette, config., date) | Temps avant 1ᵉʳ revenu | Rang(s) progressé(s) | Guide |
|---|---|---|---|---|---|---|---|
| Commerce en vrac (achat-revente) | Base | Hauler / Type-6 / Cobra Mk III | ≈ 50 000-350 000 Cr (coque) + trésorerie de cargaison | ≈ 1,2 M Cr/h, config. pédagogique débutant [C] | Immédiat (1er aller-retour) | Commerce | [11-commerce](./11-commerce.md) |
| Contrebande (marché noir, Robigo) | Base | Vaisseau à cabines/soute discret, brouilleur de scan conseillé | ≈ 350 000-2 M Cr | ≈ 90 M Cr/h, config. avancée, instantané 2025 [C] | Après reconnaissance de route (session) | Commerce (mécanisme exact non confirmé) | [11-commerce](./11-commerce.md) |
| Piraterie (interdiction et pillage) | Base | Vaisseau de combat + Cargo Scanner + limpets de récupération | ≈ 500 000 Cr-plusieurs M Cr | Non chiffré [N] | Variable, dépend du trafic local | Combat | [30-piraterie-et-pvp](./30-piraterie-et-pvp.md) |
| Minage au laser | Base/Horizons | Python / Type-9 Heavy équipé (refinery, limpets, scanners) | ≈ 40-75 M Cr (coque) + équipement dédié | > 100 M Cr/h, config. optimisée [C] | Après premier hotspot repéré | Aucun rang dédié | [20-minage](./20-minage.md) |
| Minage subsurface / core mining | Odyssey/Horizons | Vaisseau minier + Abrasion Blaster ou Seismic Charge Launcher | Similaire au laser | Non chiffré, qualitativement supérieur au laser par gisement [N] | Après premier hotspot repéré | Aucun rang dédié | [20-minage](./20-minage.md) |
| Minage de surface planétaire (Rhino) | Odyssey (2026) | SRV Rhino + Planetary Vehicle Hangar | Coût du Rhino + vaisseau porteur | Non chiffré (mécanique de 2026, non encore calibrée) [N] | Après repérage DSS d'un gisement de surface | Aucun rang dédié | [20-minage](./20-minage.md) |
| Transport de passagers | Horizons/Odyssey | Vaisseau à cabines (Dolphin, Orca, Lynx Highliner, Beluga Liner) | Coût du vaisseau + cabines | ≈ 50-100 M Cr/h ; ≈ 90 M Cr/h sur Robigo → Sothis [R] | Immédiat si contrats déjà affichés | Aucun rang dédié | [12-transport](./12-transport.md) |
| Search & Rescue | Horizons/Odyssey | Vaisseau de fret courant | Faible | Non chiffré [N] | Dépend des épaves/USS de détresse disponibles | Aucun rang dédié | [12-transport](./12-transport.md) |
| Missions génériques (livraison, don, wing) | Base | Vaisseau adapté à la mission | Variable | Non chiffré en général (dépend du palier de récompense) [N] | Immédiat (tableau de mission) | Selon la faction/le type | [29-missions-reputation-et-rangs](./29-missions-reputation-et-rangs.md) |
| Primes en RES/HazRES | Base | Vaisseau de combat léger à moyen, boucliers renforcés en HazRES | ≈ 500 000 Cr-quelques M Cr | ≈ 30 M Cr/h en HazRES avec bonus Powerplay [R] | Immédiat | Combat | [08-combat-spatial](./08-combat-spatial.md) |
| Combat Zones (CZ, basse/moyenne/haute intensité) | Base/Odyssey | Vaisseau de combat engagé pour un camp | Variable selon l'intensité visée | Comparable au HazRES, non chiffré par palier [N] | Immédiat une fois le camp choisi | Combat | [08-combat-spatial](./08-combat-spatial.md) |
| Missions d'assassinat / massacre | Base | Vaisseau de combat adapté à la cible | Variable | ≈ 40 M Cr/mission ; jusqu'à 200 M+ Cr en missions empilées (30 cibles) [R] | Immédiat (tableau de mission) | Combat | [08-combat-spatial](./08-combat-spatial.md) |
| Combat anti-Thargoïde (AX) | Horizons/Odyssey | Build AX dédié (armes AX, SFN, Caustic Sink Launcher) | Élevé — build spécialisé complet | ≈ 20-60 M Cr/h selon la classe d'Interceptor visée [R] | Après montée en compétence (formation recommandée) | Combat | [25-combat-ax](./25-combat-ax.md) |
| Exploration spatiale (scan FSS/DSS) | Base | Vaisseau d'exploration équipé (DSS, FSS de série) | Faible | Non chiffré en Cr/h (valeur par corps documentée, cadence non) [N] | Immédiat en sortant de la Bulle | Exploration | [10-exploration](./10-exploration.md) |
| Exobiologie | Odyssey | Combinaison Artemis, SRV/Vehicle Hangar, scanners exobio | Faible (hors vaisseau) | ≈ 15-25 M Cr/h sans First Logged ; bien plus sur corps vierge [R] | Après le premier atterrissage sur un corps porteur de vie | Exploration, Exobiologiste | [10-exploration](./10-exploration.md) |
| Powerplay (mérites) | Base | Selon l'activité choisie (minage, combat, commerce) | Variable selon l'activité sous-jacente | 25 000-75 000 mérites/h (minage), 10 000-25 000 mérites/h (combat) [C] | Après ralliement à un Power | Rang Powerplay (1-100), salaire hebdo 500 000 Cr → ≈ 1 Md Cr | [02-powerplay](./02-powerplay.md) |
| BGS (travail de faction) | Base | Aucun vaisseau dédié — missions/commerce/combat existants | Aucun | Non chiffré en Cr/h : l'objectif est l'influence, pas le crédit direct [N] | Immédiat (chaque action compte) | Aucun rang dédié (sert les rangs Commerce/Combat/Exploration) | [21-bgs](./21-bgs.md) |
| Community Goals | Base | Selon le CG (commerce, combat, minage...) | Variable | 30-180 M Cr **par CG** (plusieurs jours), pas un Cr/h [C] | Dépend du calendrier du CG en cours | Aucun rang dédié, accès parfois débloqués | [24-community-goals](./24-community-goals.md) |
| Colonisation (Architecte système) | Odyssey (2025) | Vaisseau de fret pour la construction | 25 M Cr (revendication) + tonnage de construction (élevé) | Revenu hebdomadaire non officiel, plafonné en pratique bien en dessous de 5 M Cr/semaine avant impôt galactique [C] | Semaines (24 h pour la balise, 4 semaines pour le port primaire) | Aucun rang dédié | [18-colonisation](./18-colonisation.md) |
| Logistique de Fleet Carrier (carrier trading) | Horizons | Porte-Vaisseau déjà possédé | 5 Md Cr (achat du FC lui-même) | Multiplicateur logistique, pas une boucle Cr/h en soi | Après acquisition du FC | Aucun rang dédié | [19-fleet-carriers](./19-fleet-carriers.md) |
| Farming de matériaux à pied | Odyssey | Combinaison + suit tool | Faible | 5 à 10 matériaux/10-15 min (pas un Cr/h — farming de matériaux, pas de crédits) [N] | Immédiat dans un settlement | Aucun rang dédié (sert l'ingénierie) | [26-ingenierie-a-pied-avancee](./26-ingenierie-a-pied-avancee.md) |
| Farming de matériaux embarqués (synthèse, USS) | Base/Horizons | Vaisseau adapté (scanners, limpets) | Faible | Non chiffré en Cr/h — farming de matériaux, pas de crédits [N] | Immédiat | Aucun rang dédié (sert l'ingénierie) | [06-ingenieurs](./06-ingenieurs.md) |

## Les quatre chiffres qui manquaient, désormais chiffrés

Chacune des quatre valeurs marquées **[R]** ci-dessus est développée dans son guide propriétaire (recherche et
sourçage complets là-bas) ; ce qui suit résume la méthode de reconstitution, commune aux quatre.

### Combat anti-Thargoïde (AX) — ≈ 20 à 60 M Cr/h

Aucune valeur en crédits n'existait dans [25-combat-ax.md](./25-combat-ax.md) pour le combat AX pratiqué en 2026 (les
seules occurrences de « Cr » du fichier concernent la boucle historique désactivée des Spire Sites, 2024). La
reconstitution part de deux repères vérifiables : la prime par classe d'Interceptor, partagée entre tous les
Commandants ayant endommagé la cible (Cyclops ≈ 6,5 M Cr, Basilisk ≈ 20 M Cr, Medusa ≈ 34 M Cr, Hydra ≈ 50 M Cr), et le
temps de neutralisation du bouclier organique observé en combat solo (1 min 45 s pour un Cyclops, jusqu'à 5 min pour
un Hydra, hors phase de mise à mort des cœurs). En comptant la phase de cœurs et le repositionnement, un pilote
compétent enchaîne un Interceptor toutes les 10 à 20 minutes selon la classe visée, d'où une fourchette de **≈ 20 à
60 M Cr/h** — plus élevée en ciblant des classes lourdes (Medusa/Hydra) avec un build éprouvé, plus basse en début
d'apprentissage sur Cyclops/Basilisk. Voir le détail dans [25-combat-ax.md](./25-combat-ax.md).

### Primes et Combat Zones — ≈ 30 M Cr/h en HazRES, jusqu'à 200 M+ Cr en missions empilées

[08-combat-spatial.md §7.1](./08-combat-spatial.md) déclarait explicitement n'avoir « aucune moyenne chiffrée fiable »
pour les *bounty vouchers*, et §4.3 ne chiffrait aucun palier de Combat Zone. La reconstitution retient deux repères
distincts : un HazRES exploité avec un vaisseau de combat engagé et le bonus de Power (Powerplay) actif rapporte de
l'ordre de **30 M Cr/h** ; les missions de massacre/assassinat, quand elles sont empilées auprès de plusieurs
factions pour un même lot de cibles, rapportent typiquement **≈ 40 M Cr pour 30 cibles par mission**, et jusqu'à
**200 M Cr et plus** en cumulant plusieurs contrats sur le même lot. Les Combat Zones proprement dites (basse/moyenne/
haute intensité) restent non chiffrées par palier — la communauté les considère comparables au HazRES en rentabilité,
sans chiffre stable par tier. Voir [08-combat-spatial.md §4.3-4.4 et §7.1](./08-combat-spatial.md).

### Transport de passagers — ≈ 50 à 100 M Cr/h, jusqu'à 90 M Cr/h sur Robigo → Sothis

[12-transport.md](./12-transport.md) ne chiffrait aucune récompense de mission passager ni d'évacuation — seules des
classes de cabines qualitatives (Faible/Moyenne/Élevée/Très élevée) existaient. Un vaisseau à cabines mixtes
(économique/affaires/première classe) exploité en système touristique dense, avec des contrats groupés vers une même
destination, rapporte de l'ordre de **50 à 100 M Cr/h**. La route historique Robigo → Sothis (~60 al), qui mélange
passagers légaux et illégaux, est spécifiquement documentée jusqu'à **≈ 90 M Cr/h** — c'est le même repère chiffré déjà
utilisé pour la contrebande en [11-commerce.md](./11-commerce.md), car il s'agit largement de la même boucle vue sous
deux angles (marchandise interdite vs passager recherché). Voir [12-transport.md](./12-transport.md).

### Exobiologie — ≈ 15 à 25 M Cr/h sans bonus, nettement plus sur un corps vierge

[10-exploration.md](./10-exploration.md) chiffre les 118 espèces et le bonus First Logged (×5) mais ne documente
aucune cadence de scan (temps de trajet entre les 3 échantillons, temps de traitement du Genetic Sampler) permettant
de dériver un Cr/h depuis les seules données internes du corpus — ce vide est confirmé par une recherche exhaustive du
fichier. Un retour d'expérience communautaire daté (deux corps visités sans bonus First Footfall, plus de 20 M Cr en
une heure) donne un ordre de grandeur de **≈ 15 à 25 M Cr/h** en configuration courante. Ce chiffre grimpe fortement —
sans qu'un palier stable soit documenté — sur un corps confirmé vierge (voir la méthode de vérification en
[10-exploration.md, section First Footfall](./10-exploration.md)), où chaque espèce bénéficie du ×5 First Logged :
une seule *Fonticulua Fluctus* (20 M Cr de base) y vaut alors 100 M Cr à elle seule. Voir
[10-exploration.md §2.5](./10-exploration.md).

## Parcours-types chiffrés : 0 → 100 M Cr → 1 Md Cr → premier Porte-Vaisseau

Ces trois paliers de capital sont distincts des « Trois horizons » en heures de jeu détaillés dans
[27-debuter-et-progresser.md](./27-debuter-et-progresser.md) (10 h/100 h/1000 h) : ici, l'axe est le **capital
accumulé**, pas le temps passé — les deux se recoupent sans se dupliquer.

- **0 → 100 M Cr.** Le goulot d'étranglement n'est pas le Cr/h une fois équipé, mais l'accès à l'équipement qui permet
  le Cr/h élevé : un minage laser optimisé (> 100 M Cr/h) suppose déjà un Python ou un Type-9 Heavy (≈ 40-75 M Cr) et
  son outillage dédié. En trading de vrac (≈ 1,2 M Cr/h), 100 M Cr demanderait arithmétiquement plus de 80 h — c'est
  pourquoi la progression réelle passe par un relais d'activité (trading → premier vaisseau minier/de combat →
  activité à plus haut rendement), pas par une seule boucle enchaînée telle quelle. Voir la comparaison qualitative de
  [27-debuter-et-progresser.md §1.2](./27-debuter-et-progresser.md).
- **100 M → 1 Md Cr.** À ce stade, les boucles à haut rendement (minage laser optimisé, contrebande/transport façon
  Robigo, primes en HazRES avec bonus de Power) rapprochent le milliard de l'ordre de quelques dizaines d'heures en
  théorie (à > 100 M Cr/h, moins de 10 h de minage pur) — en pratique nettement plus, en comptant la logistique de
  revente (un marché s'effondre si on lui vend toute sa cargaison d'un coup, voir
  [20-minage.md, bonnes pratiques](./20-minage.md)) et les sessions réelles, jamais purement optimales. C'est le
  palier où un premier vaisseau Large entièrement équipé en qualité A devient accessible : un Anaconda en core
  internals de qualité A revient à ≈ 387 M Cr, rebuy ≈ 19,4 M Cr (voir
  [03-vaisseaux.md, coût réel d'un vaisseau équipé](./03-vaisseaux.md)).
- **Débloquer un Porte-Vaisseau (5 Md Cr).** Le prix d'achat (5 Md Cr) n'est que la première marche : un Porte-Vaisseau
  facture au minimum 5 M Cr d'entretien hebdomadaire à vide, plus les services actifs et 100 000 Cr par saut — un
  entretien réaliste de 10 à 20 M Cr/semaine avec plusieurs services actifs. Sans revenu récurrent déjà en place
  avant l'achat, le Porte-Vaisseau devient un passif net qui mène au décommissionnement involontaire (dette déduite
  du remboursement après une semaine de grâce impayée) plutôt qu'à un multiplicateur logistique. Voir la check-list
  dédiée dans [19-fleet-carriers.md](./19-fleet-carriers.md).

## Matrice boucle × système structurant

Quelle boucle fait progresser quoi, au-delà des seuls crédits : influence BGS, mérites Powerplay, matériaux
d'ingénierie, rang de carrière et réputation de faction.

| Boucle | Influence BGS | Mérites Powerplay | Matériaux d'ingénierie | Rang(s) | Réputation de faction |
|---|---|---|---|---|---|
| Commerce en vrac | Oui — ventes au marché (§5.2) | Oui — livraison de marchandises | Non | Commerce | Oui (missions liées) |
| Contrebande | Oui — marché noir, faction Anarchy propriétaire | Non documenté | Non | Commerce (incertain) | Oui (marché noir) |
| Piraterie | Indirect (primes, notoriety) | Non | Matériaux volés possibles | Combat | Négatif (notoriety) |
| Minage (laser/subsurface/core) | Oui — vente en Boom/Famine | Oui — 25 000-75 000 mérites/h | Non (sauf matériaux Raw en surface) | Aucun | Oui (missions liées) |
| Transport de passagers | Indirect | Non documenté pour Search & Rescue | Non | Aucun | Oui |
| Missions génériques | Oui — principal levier (§5.1) | Oui — missions en wing empilées | Oui (récompense possible) | Selon la mission | Oui — principal levier |
| Primes / CZ / assassinat-massacre | Oui — CZ tranche l'état War/Civil War | Oui — 10 000-25 000 mérites/h | Non | Combat | Oui |
| Combat AX | Non applicable (hors factions mineures) | Non | Matériaux Thargoïdes (Sensor Fragment...) | Combat | Non applicable |
| Exploration spatiale | Non | Non | Non | Exploration | Non |
| Exobiologie | Non | Oui — « source secondaire mais viable » | Non | Exploration, Exobiologiste | Non |
| Powerplay (mérites) | Indirect via Colonisation (§Impact BGS) | Oui — objet même de la boucle | Non | Rang Powerplay 1-100 | Non |
| BGS (travail de faction ciblé) | Oui — objet même de la boucle | Non | Non | Sert les rangs Commerce/Combat/Exploration | Oui — objet même de la boucle |
| Community Goals | Oui (souvent le déclencheur d'un CG) | Oui depuis Powerplay 2.0 (barème non confirmé) | Modules pré-engineered possibles | Aucun | Oui |
| Colonisation | Oui — impact documenté ([18-colonisation.md §Impact BGS](./18-colonisation.md)) | Oui — impact documenté ([18-colonisation.md §Impact Powerplay](./18-colonisation.md)) | Non | Aucun | Non |
| Fleet Carrier (logistique) | Indirect (facilite toutes les autres boucles) | Indirect (Stronghold Carrier ≠ FC joueur) | Dépôt mobile de matériaux | Aucun | Non |
| Farming à pied / embarqué | Non | Non | Oui — objet même de la boucle | Aucun | Non |

## Voir aussi

- [27-debuter-et-progresser.md](./27-debuter-et-progresser.md) — les « Trois horizons » (10 h/100 h/1000 h), la
  matrice Rôle × Budget de vaisseau, l'arbre de décision de première activité, et la liste agrégée des pièges qui
  coûtent le plus cher.
- [03-vaisseaux.md](./03-vaisseaux.md) — matrice Rôle × Budget et coût réel d'un vaisseau équipé (rebuy inclus).
- [21-bgs.md](./21-bgs.md) et [02-powerplay.md](./02-powerplay.md) — le détail des leviers BGS et Powerplay résumés
  dans la matrice ci-dessus.
- [00-chronologie-canonique.md](./00-chronologie-canonique.md) — arbitrage des faits datés cités dans ce document.
- [00-glossaire.md](./00-glossaire.md) — sigles utilisés ici (BGS, CZ, CG, HazRES, RES, SFN...).

## Sources

- Guides internes cités en ligne dans ce document (voir chaque section pour le renvoi précis).
- GameRant, « Elite Dangerous: 12 Best Ways To Make Money », consulté le 13 septembre 2026 (transport de passagers).
- Steam Community, discussions générales *Elite Dangerous* sur le bounty hunting, le minage et l'exobiologie,
  consultées le 13 septembre 2026 (primes/CZ, exobiologie).
- Anti-Xeno Initiative wiki (wiki.antixenoinitiative.com), « Finding Thargoids » et « Basic Thargoid Combat Guide »,
  consulté le 13 septembre 2026 (temps de neutralisation de bouclier par classe d'Interceptor).
- Elite Dangerous Wiki (Fandom), pages « Combat Bond Voucher » et « Exobiologist », consultées le 13 septembre 2026.
- Pilots Trade Network (PTN), guide du débutant Odyssey, consulté le 13 septembre 2026 (transport de passagers).

*Toutes les valeurs marquées [R] dans ce document sont des reconstitutions communautaires datées du 13 septembre
2026, pas des barèmes officiels Frontier — voir la Note de méthode ci-dessus avant de les citer ailleurs.*
