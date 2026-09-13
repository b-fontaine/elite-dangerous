---
id: 03-vaisseaux
titre: "Liste complète des vaisseaux d'Elite Dangerous"
domaine: vaisseaux-equipement
entites: [Panther Clipper Mk II, Lynx Highliner, Caspian Explorer, Kestrel Mk II, Mandalay, Nomad, Vessel Hangar,
  Frame Shift Drive (SCO), Federal Corvette, Imperial Cutter, Anaconda, Type-11 Prospector, Type-10 Defender,
  Sidewinder Mk I, Hauler, Viper Mk III, Cobra Mk V, Matrice Rôle × Budget]
mots_cles_en: [shipyard, hardpoints, optional internals, jump range, supercruise overcharge, vessel hangar,
  ship-launched fighter, ship-launched vessel, rebuy, Panther Clipper Mk II, Lynx Highliner, hull hardness,
  base armour, base shield strength, hull mass, mass lock, boost speed, heat capacity, reserve fuel capacity,
  hull cost, retail cost, role budget matrix]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-13
confiance_globale: haute
volatilite: haute
sources_primaires: ["Inara.cz", "EDCD/coriolis-data (commit 0db9234b5b9ce8c939ea84133d7ce336eea88e27)",
  "EDCD/FDevIDs (commit c35612952dd6a547d1a7ac4cffab9c7051e86579)", "Steam News Frontier (appid 359320)",
  "EDCD/EDDI ticket 2849", "Wikipedia EN", "presse spécialisée d'époque sur les Updates 17 et 18 (Massively Overpowered)"]
zones_incertaines: ["dureté de coque, mass lock, capacité thermique et coût de coque nue du Lynx Highliner absents des
    deux jeux de données EDCD, donc non documentés",
  "écart entre les valeurs de blindage et de bouclier des fiches individuelles (relevés Inara, équipement d'origine
    installé) et les valeurs de base d'EDCD/coriolis-data (châssis nu) : les deux séries ne mesurent pas la même chose",
  "portée de saut stock du Lynx Highliner non calculable, faute de masse de coque exploitable",
  "nombre d'emplacements utilitaires du Lynx Highliner non précisé par la source officielle",
  "capacité du Lynx Highliner à emporter deux baies de vaisseau déduite de ses emplacements, non confirmée",
  "fabricant, prix en crédits et gabarit de plateforme du Nomad non documentés par Frontier",
  "taux de rebuy d'environ 5 % de la valeur assurée donné comme ordre de grandeur, non comme valeur fixe",
  "prix Inara sujets à fluctuation, à revérifier avant tout achat important",
  "la matrice Rôle × Budget applique le facteur ×2,6 établi sur l'exemple de l'Anaconda à tous les autres vaisseaux : un ordre de grandeur, pas un devis exact par châssis"]
guides_lies: [0, 4, 6, 10, 13, 14, 18, 20, 25, 27, 29, 31, 33]
---

# Liste complète des vaisseaux d'Elite Dangerous

## En bref

Elite Dangerous propose **48 vaisseaux de chantier naval** (*shipyard*), répartis en trois gabarits — Small, Medium,
Large — et produits par six constructeurs : Faulcon DeLacy, Core Dynamics, Gutamaya, Lakon Spaceways, Saud Kruger et
Zorgon Peterson. Les prix de coque nue vont de **32 000 Cr** (Sidewinder Mk I) à **301 348 585 Cr** (Panther Clipper
Mk II) et les portées de saut stock de **6,7 al** à **24,1 al**. Deux tableaux de référence chiffrent les 47 châssis
publiés par EDCD/coriolis-data : masse de coque de **14 t** (Hauler) à **1 200 t**, vitesse de **130** à **320 m/s**,
bouclier de base jusqu'à **600 MJ** (Imperial Cutter) et **dureté de coque** — la valeur qui commande l'encaissement
des dégâts — de **20** (Sidewinder Mk I, Hauler) à **75** (Type-10 Defender). Sept châssis exigent un rang de
réputation ; **36 vaisseaux sur 48** ont un emplacement interne assez grand pour une baie embarquée (*Vessel Hangar*). Le prix affiché n'est que
celui de la coque nue : un Anaconda en *core internals* (modules internes standards obligatoires : réacteur,
propulseurs, FSD, support de vie, distributeur, capteurs, réservoir) de qualité A revient à ≈ **387 M Cr**, rebuy
(coût de remplacement du vaisseau) ≈ **19,4 M Cr**.

## Convention de lecture des valeurs chiffrées

> **Disclaimer stats** — Les valeurs chiffrées de ce guide (portée de saut, hardpoints, emplacements internes,
> vitesse, blindage, boucliers…) sont données en **configuration stock** (composants d'origine, sans fret). L'ingénierie
> (voir [Les ingénieurs](./06-ingenieurs.md)) peut les modifier significativement — parfois du simple au double pour la
> portée de saut.

## Vue d'ensemble — 48 vaisseaux de chantier naval, six constructeurs, trois gabarits

Elite Dangerous propose actuellement **48 vaisseaux** jouables recensés dans les tableaux ci-dessous (source :
Inara.cz), répartis en trois gabarits de plateforme d'atterrissage (**Small**, **Medium**, **Large**) et produits par
six constructeurs principaux : **Faulcon DeLacy**, **Core Dynamics**, **Gutamaya**, **Lakon Spaceways**, **Saud
Kruger** et **Zorgon Peterson**. Le jeu de données communautaire EDCD/coriolis-data, utilisé plus bas pour les
emplacements et hardpoints, référençait 47 de ces 48 vaisseaux à la date de rédaction — le **Lynx Highliner**, le plus
récent, n'y figurait pas encore (voir la note dans le tableau dédié).

Ce décompte de 48 ne recense que les **vaisseaux de chantier naval** : les châssis que le commandant achète, possède et
pilote depuis un shipyard. Il exclut par construction les véhicules embarqués, qui relèvent d'une autre catégorie —
les **SRV** (Scarab, Scorpion, Rhino), les **chasseurs embarqués (SLF)** et, depuis le 30 juin 2026, le **Nomad**,
premier **vaisseau embarqué (*ship-launched vessel*, SLV)** du jeu. Aucun de ces véhicules n'apparaît dans la liste des
vaisseaux d'Inara ni dans le `shipyard.csv` d'EDCD, et cette absence ne dit rien de leur existence : elle traduit
seulement le périmètre de ces catalogues. Voir plus bas la section
« [Le cas du Nomad](#le-cas-du-nomad--vaisseau-embarqué-slv-absent-des-catalogues-de-chantier-naval) » ainsi que
[Le Rhino et le Nomad](./14-rhino.md).

Parmi ces 48, sept sont soumis à une **condition de rang de réputation** en plus de leur prix en crédits : **Imperial
Courier, Imperial Clipper, Imperial Cutter** (rang Empire), et **Federal Dropship, Federal Assault Ship, Federal
Gunship, Federal Corvette** (rang Fédération) — voir le tableau dédié plus bas. **Contrairement à une confusion
répandue, l'Imperial Eagle et les trois vaisseaux de la gamme Alliance (Chieftain, Crusader, Challenger) ne demandent
aucun rang** : ils s'achètent avec des crédits, comme n'importe quel autre vaisseau.

### Le Supercruise Overcharge (SCO) : disponible sur tout FSD, pas réservé à huit vaisseaux

*Répond à : « Quels vaisseaux ont le SCO (Supercruise Overcharge) d'origine ? », « C'est quoi le Frame Shift Drive
(SCO) ? », « Which ships have SCO by default? »*

Le **Supercruise Overcharge** (SCO — voir [glossaire](./00-glossaire.md)) est un **mode d'utilisation du FSD**, pas un
module à part : depuis sa généralisation par les **Updates 18.02 et 18.04** (avril-mai 2024 — *correction du
13 septembre 2026, une version antérieure de ce guide citait à tort l'Update 17, qui porte en réalité sur le minage
des matériaux de Titan ; voir [00-chronologie-canonique.md](./00-chronologie-canonique.md)*), n'importe quel vaisseau
équipé d'un FSD standard peut l'activer en supercroisière pour une accélération temporaire, au prix d'une
accumulation de chaleur plus rapide.

Ce qui est réellement propre à huit vaisseaux — **Python Mk II, Type-8 Transporter, Mandalay, Caspian Explorer, Cobra
Mk V, Corsair, Panther Clipper Mk II et Type-11 Prospector** — c'est qu'ils sont livrés **d'origine** avec une variante
dédiée du FSD, littéralement nommée **« Frame Shift Drive (SCO) »** dans les données du jeu (symbole interne
`Int_Hyperdrive_Overcharge_SizeX_ClassY`, distinct du `Int_Hyperdrive_SizeX_ClassY` classique), optimisée pour un usage
prolongé du mode SCO. Confirmation directe dans EDCD/coriolis-data (`modules/standard/frame_shift_drive.json`) : ces
huit vaisseaux référencent bien un identifiant de module distinct des FSD classiques de même taille/classe, alors que
tous les autres vaisseaux du jeu embarquent par défaut un FSD classique — qui reste malgré tout capable d'utiliser le
mode SCO. Un cas particulier : le **Caspian Explorer** a besoin d'un FSD de taille 8 pour son emplacement
standard, et EDCD/coriolis-data ne référence **aucun** FSD classique de taille 8 (seule la variante SCO existe à cette
taille) — le SCO y est donc de facto obligatoire, encore un signe qu'il s'est banalisé bien au-delà de ces huit
vaisseaux.

Plusieurs de ces nouveaux vaisseaux (Type-8, Type-9, Panther Clipper Mk II, Type-11 Prospector) jouent également un
rôle économique central dans le système de **[Colonisation](./18-colonisation.md)** — la construction de starports et
d'avant-postes par les joueurs, passée en bêta le **26 février 2025** (et non le 28, date d'un simple article-guide
publié deux jours plus tard) via la mise à jour gratuite *Trailblazers*, puis sortie en version complète le
**11 novembre 2025** via le *Dodec Update* (v4.2.2.0). Voir le guide dédié pour le détail de cette mécanique.

Depuis mi-2024, chaque nouveau vaisseau bénéficie par ailleurs d'une période d'accès anticipé d'environ trois mois via
la monnaie premium ARX, avant de devenir achetable en crédits standards — ce qui explique pourquoi certains des
vaisseaux les plus récents ne sont, au lancement, disponibles qu'en ARX. Ces montants ARX s'achètent en argent réel,
mais se gagnent aussi gratuitement en jouant (jusqu'à 400 ARX/semaine) : voir
[33-client-editions-peripheriques-et-vr.md §7](./33-client-editions-peripheriques-et-vr.md#7-la-boucle-de-gain-gratuit-des-arx)
pour ce mécanisme et un tableau du nombre de semaines nécessaires par palier. Dates de sortie confirmées pour certains
d'entre eux : Mandalay — 31 octobre 2024 (extension *Ascendancy*, Powerplay 2.0) ; Panther Clipper Mk II — 22 juillet
2025 (accès anticipé ARX) ; Caspian Explorer — 2 décembre 2025 (accès anticipé ARX) ; Kestrel Mk II — **24 février
2026**, date désormais confirmée par une source primaire (billet officiel Frontier « Elite Dangerous | Kestrel Mk. II
Update », 24 février 2026 12:21 UTC : *« The Kestrel Mk II Update is now live »*, avec mise à disposition « via ARX
early access »).

**Le Lynx Highliner fait exception à cette règle d'accès anticipé.** Sorti le **28 avril 2026** (billet « Elite
Dangerous | Lynx Highliner Update Notes », 28 avril 2026 13:11 UTC), il a été mis en vente **directement en crédits
aux chantiers navals** pour tous les possesseurs d'Odyssey, sa formule Standard étant offerte à 0 ARX ; seuls les
paliers cosmétiques Stellar et Galactic passaient par la monnaie ARX, à tarif réduit. Frontier présentait explicitement
ce geste comme une compensation du report du contenu *Operations* (billet « An Update on Operations », 22 avril 2026
14:02 UTC : la mise à jour, initialement attendue en avril, *« will now be arriving in June »*).

## Les six constructeurs de vaisseaux d'Elite Dangerous

- **Faulcon DeLacy** — vaisseaux polyvalents et multi-rôles (Sidewinder, Viper, Cobra, Krait, Python, Anaconda).
- **Core Dynamics** — vaisseaux de combat (Eagle, Vulture, Kestrel Mk II, gamme Federal).
- **Gutamaya** — vaisseaux impériaux élégants et rapides (Imperial Eagle/Courier/Clipper/Cutter, Corsair).
- **Lakon Spaceways** — cargos et vaisseaux d'exploration (Type-6/7/8/9/10/11, Diamondback, Asp, gamme Alliance).
- **Saud Kruger** — vaisseaux de transport de passagers (Dolphin, Orca, Beluga Liner).
- **Zorgon Peterson** — vaisseaux de combat rapide et, plus récemment, de gros tonnage (Hauler, Adder, Fer-de-Lance,
  Mamba, Mandalay, Caspian Explorer, **Lynx Highliner**, Panther Clipper Mk II). Le Lynx Highliner marque l'entrée de
  Zorgon Peterson — jusque-là plutôt un fabricant de vaisseaux de combat — sur le marché des paquebots de passagers,
  d'où une confusion fréquente avec Saud Kruger (fabricant historique de ce créneau) : le Lynx Highliner est bien un
  Zorgon Peterson.

## Tableau complet des 48 vaisseaux : prix, portée de saut, hardpoints et emplacements

Colonnes : **Portée de saut** = portée stock (configuration d'origine, réservoir plein, sans fret). C'est un
**relevé**, pas un calcul : la colonne « Source » de chaque ligne dit « Inara + EDCD », Inara fournissant le prix et
la portée constatés au chantier naval, EDCD/coriolis-data la masse de coque et les caractéristiques de module.

> **Ce que ces valeurs ne sont pas.** La formule de saut FSD que le corpus publie au §11.2 d'[Équipements et
> modules](./04-equipements.md) — (`maxfuel` / `fuelmul`)^(1 / `fuelpower`) × `optmass` ÷ (masse + carburant) — ne
> reproduit **aucune** des valeurs ci-dessous. Vérification faite sur le commit `0db9234b5b9c` : 8 des 47 châssis ne
> sont pas calculables (leur FSD (SCO) d'origine est référencé par identifiant de module et non par classe et
> notation), et sur les 35 châssis restants comparables au tableau, **0 valeur** est reproduite à ±0,05 al près, que
> l'on compte la masse des seuls sept modules standard d'origine (écart de −4,4 à −6,9 al) ou qu'on y ajoute les
> internes et hardpoints d'origine (écart jusqu'à −4,9 al). L'écart est systématique et de même signe : la
> configuration réellement vendue au chantier naval est plus lourde que le jeu de défauts de coriolis-data. Ces
> valeurs sont donc à traiter comme des relevés, et toute tentative de les recalculer donnera des chiffres plus
> optimistes que le jeu.

Suit entre parenthèses un repère d'ingénierie **« G5 »**. Cette colonne est **dérivée** de la précédente, et non
relevée : c'est la **portée stock imprimée × 1,5, arrondie au dixième d'année-lumière, moitié vers le haut**
(ROUND_HALF_UP, la même règle qu'au §11.2.1 d'[Équipements et modules](./04-equipements.md)) — ses 47 cellules sont
reproductibles par script à partir de la seule colonne de portée stock. Le facteur 1,5 est le bonus moyen de masse
optimale du plan FSD *Increased Range* grade 5 (+45 % à +55 % selon tirage d'après `modifications/blueprints.json`
d'EDCD/coriolis-data) ; l'effet expérimental *Mass Manager* n'est pas inclus et améliore encore la portée réelle — voir
[Les ingénieurs](./06-ingenieurs.md). **Hardpoints** (points d'ancrage d'armes) inclut les emplacements utilitaires. **al** = années-lumière.

### Petits vaisseaux (plateforme Small) — 17 châssis, du Sidewinder Mk I (32 000 Cr) au Kestrel Mk II (14,3 M Cr)

| Vaisseau | Fabricant | Prix | Portée de saut | Hardpoints | Emplacements internes | Source | Date |
|---|---|---|---|---|---|---|---|
| Sidewinder Mk I | Faulcon DeLacy | 32 000 Cr | 9,2 al (≈13,8 G5) | 2 Small + 2 util. | 2×2 + 4×1 | Inara + EDCD | 9 sept. 2026 |
| Eagle Mk II | Core Dynamics | 44 800 Cr | 9,7 al (≈14,6 G5) | 3 Small + 1 util. | 1×3 + 1×2 + 4×1 | Inara + EDCD | 9 sept. 2026 |
| Hauler | Zorgon Peterson | 52 720 Cr | 12,1 al (≈18,2 G5) | 1 Small + 2 util. | 2×3 + 1×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Adder | Zorgon Peterson | 87 810 Cr | 10,6 al (≈15,9 G5) | 1 Medium + 2 Small + 2 util. | 2×3 + 2×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Imperial Eagle | Gutamaya | 110 830 Cr | 9,4 al (≈14,1 G5) | 1 Medium + 2 Small + 1 util. | 1×3 + 1×2 + 4×1 | Inara + EDCD | 9 sept. 2026 |
| Viper Mk III | Faulcon DeLacy | 142 930 Cr | 8,7 al (≈13,1 G5) | 2 Medium + 2 Small + 2 util. | 2×3 + 1×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Viper Mk IV | Faulcon DeLacy | 437 930 Cr | 10,8 al (≈16,2 G5) | 2 Medium + 2 Small + 2 util. | 2×4 + 1×3 + 2×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Cobra Mk III | Faulcon DeLacy | 349 720 Cr | 11,2 al (≈16,8 G5) | 2 Medium + 2 Small + 2 util. | 3×4 + 3×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Diamondback Scout | Lakon Spaceways | 564 330 Cr | 11,9 al (≈17,9 G5) | 2 Medium + 2 Small + 4 util. | 3×3 + 1×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Cobra Mk IV | Faulcon DeLacy | 764 720 Cr | 9,9 al (≈14,9 G5) | 2 Medium + 3 Small + 2 util. | 4×4 + 2×3 + 2×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Dolphin | Saud Kruger | 1 337 320 Cr | 12,4 al (≈18,6 G5) | 2 Small + 3 util. | 1×5 + 2×4 + 1×3 + 3×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Diamondback Explorer | Lakon Spaceways | 1 894 760 Cr | 16,3 al (≈24,5 G5) | 1 Large + 2 Medium + 4 util. | 2×4 + 2×3 + 2×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Cobra Mk V *(nouveau)* | Faulcon DeLacy | 1 989 460 Cr | 17,9 al (≈26,9 G5) | 3 Medium + 2 Small + 4 util. | 1×5 + 3×4 + 3×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Imperial Courier | Gutamaya | 2 542 930 Cr | 9,9 al (≈14,9 G5) | 3 Medium + 4 util. | 2×3 + 3×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Asp Scout | Lakon Spaceways | 3 961 160 Cr | 12,2 al (≈18,3 G5) | 2 Medium + 2 Small + 2 util. | 1×5 + 1×4 + 2×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Vulture | Core Dynamics | 4 925 620 Cr | 8,6 al (≈12,9 G5) | 2 Large + 4 util. | 1×5 + 1×4 + 1×2 + 4×1 | Inara + EDCD | 9 sept. 2026 |
| Kestrel Mk II *(nouveau)* | Core Dynamics | 14 273 820 Cr | 13,8 al (≈20,7 G5) | 3 Large + 2 Small + 4 util. | 1×5 + 1×4 + 1×3 + 3×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |

### Vaisseaux moyens (plateforme Medium) — prix, portée de saut et emplacements
| Vaisseau | Fabricant | Prix | Portée de saut | Hardpoints | Emplacements internes | Source | Date |
|---|---|---|---|---|---|---|---|
| Type-6 Transporter | Lakon Spaceways | 1 045 950 Cr | 13,1 al (≈19,7 G5) | 2 Small + 3 util. | 2×5 + 2×4 + 1×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Keelback | Lakon Spaceways | 3 126 150 Cr | 11,4 al (≈17,1 G5) | 2 Medium + 2 Small + 3 util. | 2×5 + 1×4 + 1×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Mandalay *(nouveau)* | Zorgon Peterson | 17 639 220 Cr | 22,0 al (≈33,0 G5) | 4 Medium + 2 Small + 4 util. | 1×6 + 1×5 + 2×4 + 2×3 + 1×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Federal Dropship | Core Dynamics | 14 314 210 Cr | 7,5 al (≈11,3 G5) | 1 Large + 4 Medium + 4 util. | 1×6 + 2×5 + 1×4 + 2×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Alliance Chieftain | Lakon Spaceways | 19 382 250 Cr | 9,8 al (≈14,7 G5) | 2 Large + 1 Medium + 3 Small + 4 util. | 1×6 + 1×5 + 1×4 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Federal Assault Ship | Core Dynamics | 19 814 210 Cr | 8,6 al (≈12,9 G5) | 2 Large + 2 Medium + 4 util. | 2×5 + 1×4 + 1×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Alliance Crusader | Lakon Spaceways | 22 866 340 Cr | 8,4 al (≈12,6 G5) | 1 Large + 2 Medium + 3 Small + 4 util. | 1×6 + 1×5 + 2×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Asp Explorer | Lakon Spaceways | 6 661 160 Cr | 13,9 al (≈20,9 G5) | 2 Medium + 4 Small + 4 util. | 1×6 + 1×5 + 3×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Alliance Challenger | Lakon Spaceways | 30 472 250 Cr | 9,0 al (≈13,5 G5) | 1 Large + 3 Medium + 3 Small + 4 util. | 2×6 + 2×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Federal Gunship | Core Dynamics | 35 814 210 Cr | 7,0 al (≈10,5 G5) | 1 Large + 4 Medium + 2 Small + 4 util. | 2×6 + 1×5 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Krait Phantom | Faulcon DeLacy | 37 472 250 Cr | 10,0 al (≈15,0 G5) | 2 Large + 2 Medium + 4 util. | 1×6 + 3×5 + 3×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Type-8 Transporter *(nouveau)* | Lakon Spaceways | 38 453 970 Cr | 24,1 al (≈36,2 G5) | 1 Medium + 5 Small + 4 util. | 1×7 + 3×6 + 2×5 + 1×4 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Krait Mk II | Faulcon DeLacy | 45 814 210 Cr | 9,2 al (≈13,8 G5) | 3 Large + 2 Medium + 4 util. | 2×6 + 2×5 + 1×4 + 2×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Fer-de-Lance | Zorgon Peterson | 51 567 040 Cr | 7,3 al (≈11,0 G5) | 1 Huge + 4 Medium + 6 util. | 1×5 + 2×4 + 1×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Mamba | Zorgon Peterson | 55 867 040 Cr | 6,9 al (≈10,4 G5) | 1 Huge + 2 Large + 2 Small + 6 util. | 1×5 + 1×4 + 1×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Python | Faulcon DeLacy | 56 978 180 Cr | 8,8 al (≈13,2 G5) | 3 Large + 2 Medium + 4 util. | 3×6 + 2×5 + 1×4 + 2×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Python Mk II *(nouveau)* | Faulcon DeLacy | 67 527 360 Cr | 19,4 al (≈29,1 G5) | 4 Large + 2 Medium + 6 util. | 1×6 + 1×4 + 1×3 + 1×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Type-11 Prospector *(nouveau)* | Lakon Spaceways | 67 861 850 Cr | 15,7 al (≈23,6 G5) | 1 Medium + 3 Small + 4 util. | 3×6 + 2×5 + 1×4 + 1×3 + 1×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Lynx Highliner *(nouveau)* | Zorgon Peterson | 69 289 470 Cr | *non calculable (absent d'EDCD/coriolis-data)* | 1 Large + 4 Medium (util. non précisés) | 3×6 + 2×5 + 2×4 + 1×3 + 1×2 + 1×1 | Inara + Frontier | 9 sept. 2026 |
| Corsair *(nouveau)* | Gutamaya | 79 304 750 Cr | 13,5 al (≈20,3 G5) | 3 Large + 3 Medium + 4 util. | 3×6 + 3×5 + 1×4 + 1×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |

### Grands vaisseaux (plateforme Large) — prix, portée de saut et emplacements
| Vaisseau | Fabricant | Prix | Portée de saut | Hardpoints | Emplacements internes | Source | Date |
|---|---|---|---|---|---|---|---|
| Type-7 Transporter | Lakon Spaceways | 17 472 250 Cr | 12,7 al (≈19,1 G5) | 4 Small + 4 util. | 3×6 + 3×5 + 2×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Imperial Clipper | Gutamaya | 22 295 860 Cr | 9,6 al (≈14,4 G5) | 2 Large + 2 Medium + 4 util. | 1×7 + 1×6 + 2×4 + 2×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Orca | Saud Kruger | 48 539 890 Cr | 12,2 al (≈18,3 G5) | 1 Large + 2 Medium + 4 util. | 1×6 + 3×5 + 1×4 + 1×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Type-9 Heavy | Lakon Spaceways | 76 555 840 Cr | 9,0 al (≈13,5 G5) | 3 Medium + 2 Small + 4 util. | 2×8 + 1×7 + 1×6 + 1×5 + 2×4 + 2×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Beluga Liner | Saud Kruger | 84 532 760 Cr | 10,8 al (≈16,2 G5) | 5 Medium + 6 util. | 4×6 + 2×5 + 1×4 + 4×3 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Type-10 Defender | Lakon Spaceways | 124 755 340 Cr | 6,7 al (≈10,1 G5) | 4 Large + 3 Medium + 2 Small + 8 util. | 1×8 + 1×7 + 1×6 + 1×5 + 2×4 + 2×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Anaconda | Faulcon DeLacy | 146 969 450 Cr | 9,8 al (≈14,7 G5) | 1 Huge + 3 Large + 2 Medium + 2 Small + 8 util. | 1×7 + 3×6 + 3×5 + 3×4 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Federal Corvette | Core Dynamics | 187 969 450 Cr | 6,7 al (≈10,1 G5) | 2 Huge + 1 Large + 2 Medium + 2 Small + 8 util. | 3×7 + 2×6 + 2×5 + 2×4 + 1×3 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Caspian Explorer *(nouveau)* | Zorgon Peterson | 194 861 290 Cr | 20,9 al (≈31,4 G5) | 1 Large + 6 Medium + 6 util. | 1×7 + 2×6 + 4×5 + 2×4 + 1×3 + 1×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Imperial Cutter | Gutamaya | 208 969 450 Cr | 9,0 al (≈13,5 G5) | 1 Huge + 2 Large + 4 Medium + 8 util. | 2×8 + 3×6 + 2×5 + 1×4 + 1×3 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Panther Clipper Mk II *(nouveau)* | Zorgon Peterson | 301 348 585 Cr | 12,3 al (≈18,5 G5) | 2 Large + 4 Medium + 4 Small + 6 util. | 1×8 + 1×7 + 3×6 + 2×5 + 1×4 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |

## Emplacements et hardpoints des 48 vaisseaux — tableau de référence

Table dédiée, sourcée intégralement sur **EDCD/coriolis-data** (`ships/*.json`), pour consultation rapide
indépendamment du prix. Elle est présentée en trois blocs — plateforme Small, Medium puis Large —, chaque bloc étant
classé par ordre alphabétique et reprenant la même ligne d'en-tête. Le nombre entre les tailles d'emplacements
internes est le compte (ex. « 3×6 » = trois emplacements optionnels de classe 6). « Chasseur embarqué » indique si le
plus grand emplacement optionnel du vaisseau est assez grand pour un Fighter Hangar (classe 5 minimum) — module
renommé **Vessel Hangar** dans les données du jeu depuis la mise à jour *Operations* du 1ᵉʳ juillet 2026 ; détail dans
la section dédiée ci-dessous.

#### Petits vaisseaux (plateforme Small) — emplacements, hardpoints et éligibilité à la baie embarquée

Châssis de plateforme Small, par ordre alphabétique. Seuls le Cobra Mk V, le Dolphin, le Kestrel Mk II et le Vulture
y atteignent la classe 5 d'emplacement optionnel exigée par une baie embarquée.

| Vaisseau | Plateforme | Hardpoints | Emplacements internes | Chasseur embarqué |
|---|---|---|---|---|
| Adder | Small | 1 Medium + 2 Small + 2 util. | 2×3 + 2×2 + 3×1 | Non |
| Cobra Mk III | Small | 2 Medium + 2 Small + 2 util. | 3×4 + 3×2 + 2×1 | Non |
| Cobra Mk IV | Small | 2 Medium + 3 Small + 2 util. | 4×4 + 2×3 + 2×2 + 2×1 | Non |
| Cobra Mk V | Small | 3 Medium + 2 Small + 4 util. | 1×5 + 3×4 + 3×3 + 1×2 + 1×1 | Oui (1 baie) |
| Diamondback Explorer | Small | 1 Large + 2 Medium + 4 util. | 2×4 + 2×3 + 2×2 + 2×1 | Non |
| Diamondback Scout | Small | 2 Medium + 2 Small + 4 util. | 3×3 + 1×2 + 2×1 | Non |
| Dolphin | Small | 2 Small + 3 util. | 1×5 + 2×4 + 1×3 + 3×2 + 2×1 | Oui (1 baie) |
| Eagle Mk II | Small | 3 Small + 1 util. | 1×3 + 1×2 + 4×1 | Non |
| Hauler | Small | 1 Small + 2 util. | 2×3 + 1×2 + 3×1 | Non |
| Imperial Courier | Small | 3 Medium + 4 util. | 2×3 + 3×2 + 3×1 | Non |
| Imperial Eagle | Small | 1 Medium + 2 Small + 1 util. | 1×3 + 1×2 + 4×1 | Non |
| Kestrel Mk II | Small | 3 Large + 2 Small + 4 util. | 1×5 + 1×4 + 1×3 + 3×2 + 1×1 | Oui (1 baie) |
| Sidewinder Mk I | Small | 2 Small + 2 util. | 2×2 + 4×1 | Non |
| Viper Mk III | Small | 2 Medium + 2 Small + 2 util. | 2×3 + 1×2 + 3×1 | Non |
| Viper Mk IV | Small | 2 Medium + 2 Small + 2 util. | 2×4 + 1×3 + 2×2 + 3×1 | Non |
| Vulture | Small | 2 Large + 4 util. | 1×5 + 1×4 + 1×2 + 4×1 | Oui (1 baie) |

#### Vaisseaux moyens (plateforme Medium) — emplacements, hardpoints et éligibilité à la baie embarquée

Châssis de plateforme Medium, par ordre alphabétique, Lynx Highliner compris (ses données proviennent de la
spécification Frontier et non d'EDCD/coriolis-data).

| Vaisseau | Plateforme | Hardpoints | Emplacements internes | Chasseur embarqué |
|---|---|---|---|---|
| Alliance Challenger | Medium | 1 Large + 3 Medium + 3 Small + 4 util. | 2×6 + 2×3 + 2×2 + 1×1 | Oui (2 baies) |
| Alliance Chieftain | Medium | 2 Large + 1 Medium + 3 Small + 4 util. | 1×6 + 1×5 + 1×4 + 2×2 + 1×1 | Oui (2 baies) |
| Alliance Crusader | Medium | 1 Large + 2 Medium + 3 Small + 4 util. | 1×6 + 1×5 + 2×3 + 2×2 + 1×1 | Oui (2 baies) |
| Asp Explorer | Medium | 2 Medium + 4 Small + 4 util. | 1×6 + 1×5 + 3×3 + 2×2 + 1×1 | Oui (2 baies) |
| Asp Scout | Medium | 2 Medium + 2 Small + 2 util. | 1×5 + 1×4 + 2×3 + 2×2 + 1×1 | Oui (1 baie) |
| Corsair | Medium | 3 Large + 3 Medium + 4 util. | 3×6 + 3×5 + 1×4 + 1×3 + 1×2 + 1×1 | Oui (2 baies) |
| Federal Assault Ship | Medium | 2 Large + 2 Medium + 4 util. | 2×5 + 1×4 + 1×3 + 2×2 + 1×1 | Oui (1 baie) |
| Federal Dropship | Medium | 1 Large + 4 Medium + 4 util. | 1×6 + 2×5 + 1×4 + 2×3 + 1×2 + 1×1 | Oui (2 baies) |
| Federal Gunship | Medium | 1 Large + 4 Medium + 2 Small + 4 util. | 2×6 + 1×5 + 2×2 + 1×1 | Oui (2 baies) |
| Fer-de-Lance | Medium | 1 Huge + 4 Medium + 6 util. | 1×5 + 2×4 + 1×2 + 2×1 | Oui (1 baie) |
| Keelback | Medium | 2 Medium + 2 Small + 3 util. | 2×5 + 1×4 + 1×3 + 2×2 + 1×1 | Oui (1 baie) |
| Krait Mk II | Medium | 3 Large + 2 Medium + 4 util. | 2×6 + 2×5 + 1×4 + 2×3 + 1×2 + 1×1 | Oui (2 baies) |
| Krait Phantom | Medium | 2 Large + 2 Medium + 4 util. | 1×6 + 3×5 + 3×3 + 1×2 + 1×1 | Oui (2 baies) |
| **Lynx Highliner** | Medium | 1 Large + 4 Medium (util. non précisés par la source) | 3×6 + 2×5 + 2×4 + 1×3 + 1×2 + 1×1 | Oui (2 baies, déduit) |
| Mamba | Medium | 1 Huge + 2 Large + 2 Small + 6 util. | 1×5 + 1×4 + 1×3 + 2×2 + 1×1 | Oui (1 baie) |
| Mandalay | Medium | 4 Medium + 2 Small + 4 util. | 1×6 + 1×5 + 2×4 + 2×3 + 1×2 + 3×1 | Oui (2 baies) |
| Python | Medium | 3 Large + 2 Medium + 4 util. | 3×6 + 2×5 + 1×4 + 2×3 + 1×2 + 1×1 | Oui (2 baies) |
| Python Mk II | Medium | 4 Large + 2 Medium + 6 util. | 1×6 + 1×4 + 1×3 + 1×2 + 2×1 | Oui (2 baies) |
| Type-11 Prospector | Medium | 1 Medium + 3 Small + 4 util. | 3×6 + 2×5 + 1×4 + 1×3 + 1×2 + 2×1 | Oui (2 baies) |
| Type-6 Transporter | Medium | 2 Small + 3 util. | 2×5 + 2×4 + 1×3 + 2×2 + 1×1 | Oui (1 baie) |
| Type-8 Transporter | Medium | 1 Medium + 5 Small + 4 util. | 1×7 + 3×6 + 2×5 + 1×4 + 1×2 + 1×1 | Oui (2 baies) |

#### Grands vaisseaux (plateforme Large) — emplacements, hardpoints et éligibilité à la baie embarquée

Châssis de plateforme Large, par ordre alphabétique. Tous disposent d'au moins un emplacement optionnel de classe 6
et peuvent donc emporter une baie embarquée à deux baies.

| Vaisseau | Plateforme | Hardpoints | Emplacements internes | Chasseur embarqué |
|---|---|---|---|---|
| Anaconda | Large | 1 Huge + 3 Large + 2 Medium + 2 Small + 8 util. | 1×7 + 3×6 + 3×5 + 3×4 + 1×2 + 1×1 | Oui (2 baies) |
| Beluga Liner | Large | 5 Medium + 6 util. | 4×6 + 2×5 + 1×4 + 4×3 + 1×1 | Oui (2 baies) |
| Caspian Explorer | Large | 1 Large + 6 Medium + 6 util. | 1×7 + 2×6 + 4×5 + 2×4 + 1×3 + 1×2 + 3×1 | Oui (2 baies) |
| Federal Corvette | Large | 2 Huge + 1 Large + 2 Medium + 2 Small + 8 util. | 3×7 + 2×6 + 2×5 + 2×4 + 1×3 + 1×1 | Oui (2 baies) |
| Imperial Clipper | Large | 2 Large + 2 Medium + 4 util. | 1×7 + 1×6 + 2×4 + 2×3 + 2×2 + 1×1 | Oui (2 baies) |
| Imperial Cutter | Large | 1 Huge + 2 Large + 4 Medium + 8 util. | 2×8 + 3×6 + 2×5 + 1×4 + 1×3 + 1×1 | Oui (2 baies) |
| Orca | Large | 1 Large + 2 Medium + 4 util. | 1×6 + 3×5 + 1×4 + 1×3 + 2×2 + 1×1 | Oui (2 baies) |
| Panther Clipper Mk II | Large | 2 Large + 4 Medium + 4 Small + 6 util. | 1×8 + 1×7 + 3×6 + 2×5 + 1×4 + 1×2 + 1×1 | Oui (2 baies) |
| Type-10 Defender | Large | 4 Large + 3 Medium + 2 Small + 8 util. | 1×8 + 1×7 + 1×6 + 1×5 + 2×4 + 2×3 + 1×2 + 1×1 | Oui (2 baies) |
| Type-7 Transporter | Large | 4 Small + 4 util. | 3×6 + 3×5 + 2×3 + 1×2 + 1×1 | Oui (2 baies) |
| Type-9 Heavy | Large | 3 Medium + 2 Small + 4 util. | 2×8 + 1×7 + 1×6 + 1×5 + 2×4 + 2×3 + 1×2 + 1×1 | Oui (2 baies) |

**Corrections apportées par ce tableau par rapport à des estimations de mémoire courantes dans le corpus communautaire**
(vérifiées directement sur les données EDCD/coriolis-data) : le Python Mk II a en réalité **4 hardpoints larges + 2
moyens** (6 au total, et non « 3 larges + 2 moyens » comme parfois avancé) ; le Corsair a **3 larges + 3 moyens** (6,
non 5) ; le Cobra Mk V a **3 moyens + 2 petits et 4 emplacements utilitaires** (et non « pas d'emplacement
utilitaire ») ; le Panther Clipper Mk II a **2 larges + 4 moyens + 4 petits** (10 hardpoints, non 9) ; le Caspian
Explorer a **1 large + 6 moyens et 6 emplacements utilitaires** (bien plus armé qu'on ne le croit parfois, et non «
aucun point utilitaire ») ; le Mandalay a **4 emplacements utilitaires** (et non « aucun ») ; le Type-11 Prospector a
**1 moyen + 3 petits** (4 hardpoints, non 6). Le détail par vaisseau est repris dans les fiches ci-dessous.

## Caractéristiques chiffrées des vaisseaux — masse, vitesse, agilité, blindage, boucliers et dureté de coque

Le tableau « [Emplacements et hardpoints](#emplacements-et-hardpoints-des-48-vaisseaux--tableau-de-référence) »
ci-dessus dit **ce que l'on peut monter** sur un vaisseau ; celui-ci dit
**ce que vaut le châssis lui-même**, coque nue et sans aucun module optionnel. Il couvre les **47 vaisseaux**
référencés par EDCD/coriolis-data, par ordre alphabétique, et il est scindé en deux tableaux qui partagent la même
colonne « Vaisseau » : le premier pour la mobilité et la survie, le second pour la logistique et le prix. Source
unique des deux tableaux : **EDCD/coriolis-data, `ships/*.json`, commit 0db9234b5b9c** — champs `properties`
(`manufacturer`, `class`, `hullMass`, `speed`, `boost`, `pitch`, `roll`, `yaw`, `baseArmour`, `baseShieldStrength`,
`hardness`, `crew`, `masslock`, `heatCapacity`, `reserveFuelCapacity`, `hullCost`) et `retailCost`, complétés par
`modules/standard/fuel_tank.json` du même dépôt pour la capacité du réservoir d'origine.

**Trois précisions de lecture, pour éviter de comparer ce qui ne se compare pas.**

1. **Ces valeurs sont celles du châssis nu.** Le blindage et le bouclier indiqués sont les valeurs *de base* : le
   blindage effectif s'obtient en leur appliquant le multiplicateur du blindage de coque installé (`hullboost`,
   de 0,8 pour un Lightweight Alloy à 2,5 pour un composite militaire sur un Anaconda), et le bouclier effectif
   dépend entièrement du générateur monté. Les chiffres de blindage et de bouclier des fiches individuelles plus
   bas — relevés sur Inara.cz, avec l'équipement d'origine installé — s'en écartent donc, à la hausse comme à la
   baisse : les deux séries ne mesurent pas la même chose. Le détail des multiplicateurs de blindage par vaisseau
   est traité dans [Équipements et modules](./04-equipements.md).
2. **L'agilité est donnée en trois axes séparés**, en degrés par seconde (tangage / roulis / lacet), et non sous
   la forme de l'indice composite unique qu'affiche Inara (« agilité 163 » pour le Mandalay, par exemple).
   EDCD/coriolis-data ne publie pas cet indice : le reconstituer reviendrait à inventer une formule.
3. **Deux prix coexistent dans la source.** `hullCost` est le coût de la coque seule ; `retailCost` est le prix
   effectivement affiché au chantier naval, composants standards d'origine compris. C'est `retailCost` qui
   correspond aux prix des tableaux plus haut de ce guide : comparé aux 47 relevés Inara du 9 septembre 2026,
   l'écart maximal est de **6 Cr**, un simple arrondi. Les deux colonnes figurent dans le second tableau.

### Mobilité et survie des 47 vaisseaux — masse, vitesse, boost, agilité, blindage, bouclier et dureté de coque

Ordre alphabétique. **Dureté de coque** (`hardness`) est la résistance du châssis à la pénétration du blindage :
elle se lit face à la pénétration (`piercing`) des armes, publiée par le même jeu de données dans
`modules/hardpoints/*.json`. Plus la dureté d'une cible dépasse la pénétration d'une arme, moins celle-ci délivre
ses dégâts nominaux ; EDCD/coriolis-data publie les deux valeurs mais pas la formule qui les relie — voir
[Combat spatial](./08-combat-spatial.md) pour le calcul de dégâts lui-même. **Agilité** = tangage / roulis / lacet
en °/s. **Blindage** et **bouclier** sont les valeurs de base du châssis, avant tout module.

| Vaisseau | Constructeur | Gabarit | Masse de coque (t) | Vitesse (m/s) | Boost (m/s) | Agilité (°/s) | Blindage de base | Bouclier de base (MJ) | Dureté de coque |
|---|---|---|---|---:|---:|---|---:|---:|---:|
| Adder | Zorgon Peterson | Small | 35 | 220 | 320 | 38 / 100 / 14 | 90 | 60 | 35 |
| Alliance Challenger | Lakon Spaceways | Medium | 450 | 204 | 310 | 32 / 90 / 16 | 300 | 220 | 65 |
| Alliance Chieftain | Lakon Spaceways | Medium | 400 | 230 | 330 | 39 / 92 / 16 | 280 | 200 | 65 |
| Alliance Crusader | Lakon Spaceways | Medium | 500 | 180 | 300 | 32 / 80 / 16 | 300 | 200 | 65 |
| Anaconda | Faulcon DeLacy | Large | 400 | 180 | 240 | 25 / 60 / 10 | 525 | 350 | 65 |
| Asp Explorer | Lakon Spaceways | Medium | 280 | 250 | 340 | 38 / 100 / 10 | 210 | 140 | 52 |
| Asp Scout | Lakon Spaceways | Medium | 150 | 220 | 300 | 40 / 110 / 15 | 180 | 120 | 52 |
| Beluga Liner | Saud Kruger | Large | 950 | 200 | 280 | 25 / 60 / 17 | 280 | 280 | 60 |
| Caspian Explorer | Zorgon Peterson | Large | 950 | 210 | 290 | 30 / 75 / 14 | 345 | 500 | 60 |
| Cobra Mk III | Faulcon DeLacy | Small | 180 | 280 | 400 | 40 / 100 / 10 | 120 | 80 | 35 |
| Cobra Mk IV | Faulcon DeLacy | Small | 210 | 200 | 300 | 30 / 90 / 10 | 120 | 120 | 35 |
| Cobra Mk V | Faulcon DeLacy | Small | 150 | 291 | 412 | 45,61 / 121,62 / 33,45 | 180 | 160 | 40 |
| Corsair | Gutamaya | Medium | 265 | 280 | 355 | 26 / 80 / 10 | 270 | 235 | 65 |
| Diamondback Explorer | Lakon Spaceways | Small | 260 | 260 | 340 | 35 / 90 / 13 | 150 | 150 | 42 |
| Diamondback Scout | Lakon Spaceways | Small | 170 | 280 | 380 | 42 / 100 / 15 | 120 | 120 | 40 |
| Dolphin | Saud Kruger | Small | 140 | 250 | 350 | 30 / 100 / 20 | 110 | 110 | 35 |
| Eagle Mk II | Core Dynamics | Small | 50 | 240 | 350 | 50 / 120 / 18 | 40 | 60 | 28 |
| Federal Assault Ship | Core Dynamics | Medium | 480 | 210 | 350 | 38 / 90 / 19 | 300 | 200 | 60 |
| Federal Corvette | Core Dynamics | Large | 900 | 200 | 260 | 28 / 75 / 8 | 370 | 555 | 70 |
| Federal Dropship | Core Dynamics | Medium | 580 | 180 | 300 | 30 / 80 / 14 | 300 | 200 | 60 |
| Federal Gunship | Core Dynamics | Medium | 580 | 170 | 280 | 25 / 80 / 18 | 350 | 250 | 60 |
| Fer-de-Lance | Zorgon Peterson | Medium | 250 | 260 | 350 | 38 / 90 / 12 | 225 | 300 | 70 |
| Hauler | Zorgon Peterson | Small | 14 | 200 | 300 | 36 / 100 / 14 | 100 | 50 | 20 |
| Imperial Clipper | Gutamaya | Large | 400 | 300 | 380 | 40 / 80 / 18 | 270 | 180 | 60 |
| Imperial Courier | Gutamaya | Small | 35 | 280 | 380 | 38 / 90 / 16 | 80 | 200 | 30 |
| Imperial Cutter | Gutamaya | Large | 1 100 | 200 | 320 | 18 / 45 / 8 | 400 | 600 | 70 |
| Imperial Eagle | Gutamaya | Small | 50 | 300 | 400 | 40 / 100 / 15 | 60 | 80 | 28 |
| Keelback | Lakon Spaceways | Medium | 180 | 200 | 300 | 27 / 100 / 15 | 270 | 135 | 45 |
| Kestrel Mk II | Core Dynamics | Small | 190 | 271 | 360 | 51,4 / 123,36 / 24,67 | 70 | 225 | 55 |
| Krait Mk II | Faulcon DeLacy | Medium | 320 | 240 | 330 | 26 / 90 / 10 | 220 | 220 | 55 |
| Krait Phantom | Faulcon DeLacy | Medium | 270 | 250 | 350 | 26 / 90 / 10 | 180 | 200 | 55 |
| Mamba | Zorgon Peterson | Medium | 250 | 310 | 380 | 27 / 80 / 10 | 230 | 270 | 70 |
| Mandalay | Zorgon Peterson | Medium | 230 | 280 | 350 | 35 / 96 / 28 | 230 | 220 | 55 |
| Orca | Saud Kruger | Large | 290 | 300 | 380 | 25 / 55 / 18 | 220 | 220 | 55 |
| Panther Clipper Mk II | Zorgon Peterson | Large | 1 200 | 181 | 250 | 18 / 20 / 10 | 620 | 350 | 70 |
| Python | Faulcon DeLacy | Medium | 350 | 230 | 300 | 29 / 90 / 10 | 260 | 260 | 65 |
| Python Mk II | Faulcon DeLacy | Medium | 450 | 256 | 345 | 37,72 / 92,76 / 12,74 | 280 | 335 | 70 |
| Sidewinder Mk I | Faulcon DeLacy | Small | 25 | 220 | 320 | 42 / 110 / 16 | 60 | 40 | 20 |
| Type-10 Defender | Lakon Spaceways | Large | 1 200 | 179 | 219 | 20 / 20 / 8 | 580 | 320 | 75 |
| Type-11 Prospector | Lakon Spaceways | Medium | 320 | 272 | 367 | 25 / 37,5 / 22 | 350 | 275 | 58 |
| Type-6 Transporter | Lakon Spaceways | Medium | 155 | 220 | 350 | 30 / 100 / 17 | 180 | 90 | 35 |
| Type-7 Transporter | Lakon Spaceways | Large | 350 | 180 | 300 | 22 / 60 / 22 | 340 | 155 | 54 |
| Type-8 Transporter | Lakon Spaceways | Medium | 400 | 200 | 340 | 28 / 60 / 18 | 440 | 228 | 58 |
| Type-9 Heavy | Lakon Spaceways | Large | 850 | 130 | 200 | 20 / 20 / 8 | 480 | 240 | 65 |
| Viper Mk III | Faulcon DeLacy | Small | 50 | 320 | 400 | 35 / 90 / 15 | 70 | 105 | 35 |
| Viper Mk IV | Faulcon DeLacy | Small | 190 | 270 | 340 | 30 / 90 / 12 | 150 | 150 | 35 |
| Vulture | Core Dynamics | Small | 230 | 210 | 340 | 42 / 110 / 17 | 160 | 240 | 55 |

### Logistique et prix des 47 vaisseaux — carburant, équipage, mass lock, capacité thermique et coût

Ordre alphabétique, mêmes 47 châssis que le tableau précédent. **Réservoir d'origine** = capacité du Fuel Tank
monté par défaut au chantier naval (`defaults.standard`, dernière position), en tonnes de carburant ; **réserve** =
`reserveFuelCapacity`, le réservoir interne non remplaçable qui alimente le réacteur. **Sièges d'équipage** =
`crew`, pilote compris. **Mass lock** = facteur de verrouillage de masse que le vaisseau impose à ses voisins.
**Capacité thermique** = `heatCapacity`, l'inertie thermique du châssis. **Coque nue** = `hullCost` ; **prix
chantier** = `retailCost`, celui des tableaux de prix plus haut.

| Vaisseau | Réservoir d'origine (t) | Réserve (t) | Sièges d'équipage | Mass lock | Capacité thermique | Coque nue `hullCost` (Cr) | Prix chantier `retailCost` (Cr) |
|---|---:|---:|---:|---:|---:|---:|---:|
| Adder | 8 | 0,36 | 2 | 7 | 170 | 40 833 | 87 808 |
| Alliance Challenger | 16 | 0,77 | 2 | 13 | 316 | 29 569 804 | 30 472 252 |
| Alliance Chieftain | 16 | 0,77 | 2 | 13 | 289 | 18 612 476 | 19 382 252 |
| Alliance Crusader | 16 | 0,77 | 4 | 13 | 316 | 22 096 565 | 22 866 341 |
| Anaconda | 32 | 1,07 | 4 | 23 | 334 | 142 456 440 | 146 969 451 |
| Asp Explorer | 32 | 0,63 | 2 | 11 | 272 | 6 145 793 | 6 661 154 |
| Asp Scout | 16 | 0,47 | 2 | 8 | 210 | 3 819 823 | 3 961 154 |
| Beluga Liner | 128 | 0,81 | 4 | 18 | 283 | 79 694 761 | 84 532 764 |
| Caspian Explorer | 128 | 1,14 | 4 | 19 | 250 | 189 326 510 | 194 861 290 |
| Cobra Mk III | 16 | 0,49 | 2 | 8 | 225 | 208 372 | 349 718 |
| Cobra Mk IV | 16 | 0,51 | 2 | 8 | 228 | 623 374 | 764 720 |
| Cobra Mk V | 16 | 0,49 | 3 | 8 | 245 | 1 477 085 | 1 989 461 |
| Corsair | 32 | 0,41 | 2 | 17 | 230 | 76 884 160 | 79 304 750 |
| Diamondback Explorer | 32 | 0,52 | 1 | 10 | 351 | 1 638 277 | 1 894 760 |
| Diamondback Scout | 16 | 0,49 | 1 | 8 | 346 | 463 926 | 564 329 |
| Dolphin | 16 | 0,5 | 1 | 9 | 165 | 1 117 906 | 1 337 323 |
| Eagle Mk II | 4 | 0,34 | 1 | 6 | 165 | 10 947 | 44 800 |
| Federal Assault Ship | 16 | 0,72 | 2 | 14 | 286 | 19 111 109 | 19 814 210 |
| Federal Corvette | 32 | 1,13 | 4 | 24 | 333 | 183 156 068 | 187 969 450 |
| Federal Dropship | 16 | 0,83 | 2 | 14 | 331 | 13 510 106 | 14 314 210 |
| Federal Gunship | 16 | 0,82 | 2 | 14 | 325 | 34 814 912 | 35 814 210 |
| Fer-de-Lance | 8 | 0,67 | 2 | 12 | 224 | 51 242 363 | 51 567 040 |
| Hauler | 4 | 0,25 | 1 | 6 | 123 | 30 308 | 52 720 |
| Imperial Clipper | 16 | 0,74 | 2 | 12 | 304 | 21 116 895 | 22 295 860 |
| Imperial Courier | 8 | 0,41 | 1 | 7 | 230 | 2 484 137 | 2 542 931 |
| Imperial Cutter | 64 | 1,16 | 4 | 27 | 327 | 200 493 413 | 208 969 451 |
| Imperial Eagle | 4 | 0,37 | 1 | 6 | 163 | 73 023 | 110 830 |
| Keelback | 16 | 0,39 | 2 | 8 | 215 | 2 946 463 | 3 126 154 |
| Kestrel Mk II | 16 | 0,57 | 1 | 10 | 237 | 13 776 380 | 14 273 820 |
| Krait Mk II | 32 | 0,63 | 3 | 16 | 300 | 44 160 710 | 45 814 205 |
| Krait Phantom | 32 | 0,63 | 2 | 14 | 300 | 35 741 519 | 37 472 252 |
| Mamba | 8 | 0,5 | 2 | 12 | 165 | 55 442 918 | 55 867 040 |
| Mandalay | 32 | 0,52 | 2 | 11 | 250 | 16 527 192 | 17 639 220 |
| Orca | 32 | 0,79 | 2 | 16 | 262 | 47 800 723 | 48 539 887 |
| Panther Clipper Mk II | 128 | 1,16 | 4 | 27 | 250 | 286 905 678 | 301 348 586 |
| Python | 32 | 0,83 | 2 | 17 | 300 | 55 324 684 | 56 978 179 |
| Python Mk II | 16 | 0,83 | 2 | 17 | 316 | 64 743 724 | 67 527 359 |
| Sidewinder Mk I | 2 | 0,3 | 1 | 6 | 140 | 4 588 | 32 000 |
| Type-10 Defender | 64 | 0,77 | 4 | 26 | 335 | 121 334 619 | 124 755 342 |
| Type-11 Prospector | 32 | 0,77 | 3 | 16 | 289 | 66 346 710 | 67 861 850 |
| Type-6 Transporter | 16 | 0,39 | 1 | 8 | 179 | 866 622 | 1 045 945 |
| Type-7 Transporter | 32 | 0,52 | 1 | 10 | 226 | 16 783 094 | 17 472 252 |
| Type-8 Transporter | 32 | 0,52 | 1 | 18 | 226 | 34 820 576 | 38 453 970 |
| Type-9 Heavy | 64 | 0,77 | 4 | 16 | 289 | 72 116 858 | 76 555 842 |
| Viper Mk III | 4 | 0,41 | 1 | 7 | 195 | 96 733 | 142 931 |
| Viper Mk IV | 16 | 0,46 | 1 | 7 | 209 | 312 797 | 437 931 |
| Vulture | 8 | 0,57 | 2 | 10 | 237 | 4 692 214 | 4 925 615 |

### Les extrêmes du chantier naval, lus dans ces deux tableaux

Toutes les valeurs ci-dessous sont extraites des deux tableaux précédents, sans autre calcul que la recherche du
minimum et du maximum sur les 47 châssis.

- **Châssis le plus dur** — 75 : Type-10 Defender.
- **Châssis le moins dur** — 20 : Hauler et Sidewinder Mk I.
- **Coque la plus lourde** — 1 200 t : Panther Clipper Mk II et Type-10 Defender.
- **Coque la plus légère** — 14 t : Hauler.
- **Vitesse de pointe la plus élevée** — 320 m/s : Viper Mk III.
- **Vitesse de pointe la plus basse** — 130 m/s : Type-9 Heavy.
- **Boost le plus rapide** — 412 m/s : Cobra Mk V.
- **Blindage de base le plus élevé** — 620 : Panther Clipper Mk II.
- **Bouclier de base le plus élevé** — 600 MJ : Imperial Cutter.
- **Mass lock le plus élevé** — 27 : Imperial Cutter et Panther Clipper Mk II.
- **Capacité thermique la plus élevée** — 351 : Diamondback Explorer.

### Le 48ᵉ vaisseau absent de ces deux tableaux : le Lynx Highliner

Ces deux tableaux comptent **47 lignes** alors que le guide documente **48 vaisseaux** : le **Lynx Highliner**
(Zorgon Peterson, sorti le 28 avril 2026) n'est pas référencé par EDCD/coriolis-data au commit 0db9234b5b9c, et
aucune de ses caractéristiques n'a donc pu être reprise ici sans l'inventer. Le décompte de 48 reste le bon : c'est
le jeu de données amont qui accuse un retard, pas le corpus. Les chiffres connus du Lynx Highliner — vitesse
293 m/s, boost 360 m/s, bouclier 228 MJ, armure 630, agilité composite 97, masse de coque 260 t, équipage 2 —
proviennent d'Inara.cz et de la spécification Frontier du 22 avril 2026 et figurent dans sa fiche individuelle plus
bas. Sa **dureté de coque, son mass lock, sa capacité thermique et son coût de coque nue restent, eux, non couverts
par le jeu de données** : ni EDCD/coriolis-data ni EDCD/FDevIDs ne les publient, et aucune valeur n'est donc avancée
ici pour ces quatre champs.

Quelques écarts de nomenclature méritent enfin d'être signalés, car ils font échouer une recherche naïve dans le
jeu de données amont : EDCD/coriolis-data nomme ces châssis **Eagle**, **Viper** et **Sidewinder** là où le jeu et
ce guide écrivent **Eagle Mk II**, **Viper Mk III** et **Sidewinder Mk I**, et abrège **Lakon Spaceways** en
**Lakon**. Les tableaux ci-dessus retiennent la graphie du jeu. De même, les fichiers sources portent des noms de
code hérités : `asp.json` pour l'Asp Explorer, `explorer_nx.json` pour le Caspian Explorer, `python_nx.json` pour
le Python Mk II, `imperial_corsair.json` pour le Corsair, `panther_clipper.json` (clé interne `panthermkii`) pour
le Panther Clipper Mk II.

## Rangs de réputation requis — les sept vaisseaux Fédération et Empire sous condition de rang

*Répond à : « Quel rang faut-il pour le Federal Corvette / l'Imperial Cutter ? », « What rank do I need for the
Corvette? », « Est-ce que l'Imperial Eagle demande un rang ? »*

Sept vaisseaux à accès conditionné, avec le rang exact (texte relevé directement sur les fiches Inara de chaque
vaisseau, instantané du 9 septembre 2026 — un rang de réputation ne varie pas dans le temps comme un prix, mais reste à
revérifier en cas de changement d'équilibrage) :

| Vaisseau | Puissance | Rang requis |
|---|---|---|
| Federal Dropship | Fédération | Midshipman |
| Federal Assault Ship | Fédération | Chief Petty Officer |
| Federal Gunship | Fédération | Ensign |
| Federal Corvette | Fédération | Rear Admiral |
| Imperial Courier | Empire | Master |
| Imperial Clipper | Empire | Baron |
| Imperial Cutter | Empire | Duke |

L'ordre des rangs Fédération croît bien avec la puissance du vaisseau (Midshipman < Chief Petty Officer < Ensign < ...
< Rear Admiral dans l'échelle de la Federal Navy), de même côté Empire (Master < Baron < Duke). Aucun autre vaisseau du
jeu — **Imperial Eagle et gamme Alliance incluse** — ne demande de rang : seuls les crédits comptent. Aucun des huit
vaisseaux les plus récents (Python Mk II, Type-8, Mandalay, Caspian Explorer, Cobra Mk V, Corsair, Panther Clipper
Mk II, Type-11 Prospector, Kestrel Mk II, Lynx Highliner) n'introduit de nouvelle condition de rang à ce jour. Pour
l'échelle complète des deux marines (quinze paliers chacune, dont les paliers intermédiaires qui ne conditionnent
aucun vaisseau) et leur mécanisme de promotion, voir
[29-missions-reputation-et-rangs.md §3](./29-missions-reputation-et-rangs.md#3-les-deux-échelles-de-marine-de-superpuissance).

## Chasseurs embarqués (Ship-Launched Fighters)

*Répond à : « Quels vaisseaux peuvent embarquer un chasseur (fighter bay) ? », « Mon vaisseau peut-il avoir un
Vessel Hangar ? », « Which ships can carry a fighter? »*

Un chasseur embarqué (*Ship-Launched Fighter*, SLF) se loge dans un **Fighter Hangar**, module qui n'existe qu'en
classe 5 (1 baie), 6 ou 7 (2 baies chacun) d'après `modules/internal/fighter_hangar.json` d'EDCD/coriolis-data. Un
vaisseau peut donc embarquer un chasseur dès lors qu'il dispose d'**au moins un emplacement optionnel de classe 5 ou
plus** — la condition ne dépend pas de la taille globale du vaisseau (un Cobra Mk V ou un Vulture, tous deux « petits
», qualifient) mais uniquement de la taille de cet unique emplacement, qu'il faut alors lui sacrifier entièrement, en
plus de disposer d'un membre d'équipage (joueur ou PNJ) pour le piloter.

**35 vaisseaux sur 47** référencés dans EDCD/coriolis-data qualifient. Le **Lynx Highliner**, absent de ce jeu de
données, qualifie lui aussi d'après la spécification officielle publiée par Frontier (billet « An Update on
Operations », 22 avril 2026 14:02 UTC : trois emplacements optionnels de classe 6) — soit **36 vaisseaux sur 48**.

**2 baies possibles** (emplacement optionnel de classe 6 ou plus) : Alliance Challenger, Alliance Chieftain, Alliance
Crusader, Anaconda, Asp Explorer, Beluga Liner, Caspian Explorer, Corsair, Federal Corvette, Federal Dropship, Federal
Gunship, Imperial Clipper, Imperial Cutter, Krait Mk II, Krait Phantom, Mandalay, Orca, Panther Clipper Mk II, Python,
Python Mk II, Type-10 Defender, Type-11 Prospector, Type-7 Transporter, Type-8 Transporter, Type-9 Heavy.

**1 baie possible** (plus grand emplacement optionnel : classe 5 tout juste) : Asp Scout, Cobra Mk V, Dolphin, Federal
Assault Ship, Fer-de-Lance, Keelback, Kestrel Mk II, Mamba, Type-6 Transporter, **Vulture** (fait souvent méconnu : ce
petit chasseur de combat dispose bien d'un emplacement de classe 5 et peut donc embarquer un chasseur, malgré son
faible tonnage).

Tous les autres vaisseaux (Sidewinder, Eagle, Hauler, Adder, Imperial Eagle, Viper III/IV, Cobra Mk III/IV,
Diamondback Scout/Explorer, Imperial Courier) n'ont aucun emplacement optionnel assez grand.

### Du Fighter Hangar au Vessel Hangar : le renommage de juillet 2026

La mise à jour *Operations* du **1ᵉʳ juillet 2026** a élargi la fonction de la baie embarquée, qui n'accueille plus
seulement des chasseurs, et le module a été renommé en conséquence dans les données du jeu. Dans le référentiel
communautaire `outfitting.csv` d'EDCD/FDevIDs, les modules `Int_FighterBay_Size5/6/7_Class1` s'intitulent désormais
**« Vessel Hangar »**, et les `Int_FighterBayMk2_Size5/6/7_Class1` **« Mk II Vessel Hangar »** ; le commit
correspondant, daté du **3 juillet 2026**, porte le libellé *« new commodity and modules for Operations & Nomad
update »*. Le symbole interne, lui, n'a pas changé : un outil communautaire qui filtre sur `Int_FighterBay*` continue
donc de fonctionner, alors qu'un outil qui filtre sur le libellé « Fighter Hangar » ne trouve plus rien.

Frontier confirme le renommage de deux façons dans ses propres billets : les notes d'*Operations* parlent de « Mk I
Vessel Bay » et de « Mk II Vessel Bay » dans la section outfitting, et le billet « Rhino SRV Update » du **2 septembre
2026 11:20 UTC** liste parmi ses correctifs la résolution d'un cas *« where the vessel hangar was incorrectly referred
to as a fighter hangar within the crew lounge »*. Les deux graphies (« bay » dans les notes, « hangar » dans le nom de
module) coexistent donc dans les sources officielles ; le corpus retient **Vessel Hangar** comme nom du module, en
signalant l'équivalence.

Là où le corpus déduisait l'éligibilité au Fighter Hangar de la seule taille d'emplacement (classe 5 minimum), les
notes d'*Operations* du 1ᵉʳ juillet 2026 publient pour les baies de vaisseau une **liste explicite de châssis**, avec
pour chacun les classes disponibles :

| Module | Classes | Vaisseaux compatibles (liste officielle, avec classes disponibles) |
|---|---|---|
| **Mk I Vessel Hangar** | 5 à 7 | Alliance Crusader (5-6), Anaconda (5-7), Beluga Liner (5-6), Caspian Explorer (5-7), Federal Corvette (5-7), Federal Gunship (5-6), Imperial Cutter (5-7), Keelback (5), Krait Mk II (5-6), Panther Clipper Mk II (5-7), Type-9 Heavy (5-7), Type-10 Defender (5-7), Type-11 Prospector (5-6) — **13 vaisseaux** |
| **Mk II Vessel Hangar** | 5 à 7 | Caspian Explorer (5-7), Panther Clipper Mk II (5-7), Type-11 Prospector (5-6) — **3 vaisseaux** |

Les classes indiquées correspondent aux emplacements optionnels réellement disponibles sur chaque châssis, mais la
liste est plus restrictive que la règle de taille : plusieurs vaisseaux disposant pourtant d'un emplacement de
classe 5 ou plus (Asp Explorer, Corsair, Krait Phantom, Mandalay, Orca, Python, Python Mk II, Type-7, Type-8,
Federal Dropship…) n'y figurent pas. **Attention à une erreur répandue** : la restriction aux trois seuls Caspian
Explorer, Panther Clipper Mk II et Type-11 Prospector porte sur le **Mk II** uniquement. Le Nomad, lui, se déploie
depuis l'une ou l'autre baie — les notes officielles sont explicites : *« The Nomad can be deployed from a compatible
vessel bay, including MK I and MK II modules. »*

### Vaisseaux embarqués (Ship-Launched Vessels) : le Nomad

Le **Nomad** inaugure une catégorie distincte du chasseur embarqué : le **vaisseau embarqué** (*ship-launched vessel*,
SLV). Il se loge dans un Vessel Hangar comme un SLF dans son ancienne baie, mais son rôle n'est pas le combat : c'est
un appareil d'exploration de surface planétaire, décrit et détaillé dans **[Le Rhino et le Nomad](./14-rhino.md)**.
Il n'a pas de prix en crédits ni de place au chantier naval : il s'acquiert en **ARX**. Voir la section
« [Le cas du Nomad](#le-cas-du-nomad--vaisseau-embarqué-slv-absent-des-catalogues-de-chantier-naval) » plus bas pour
la taxonomie complète.

## Vaisseaux récents (2024-2026) — fiches détaillées

Les dix vaisseaux suivants ont été ajoutés depuis 2024, dans la foulée de l'extension Odyssey et de la guerre contre les
Thargoïdes. *(Voir le disclaimer stats en tête de guide : ces caractéristiques sont en configuration stock.)*

### Mandalay — vaisseau moyen d'exploration Zorgon Peterson (17,6 M Cr, ≈ 22,0 al stock)

- **Constructeur :** Zorgon Peterson
- **Gabarit :** Moyen — 230 t
- **Sortie :** 31 octobre 2024, avec l'extension *Ascendancy* (Powerplay 2.0)
- **Rôle principal :** exploration planétaire et long-courrier
- **Points forts :** portée de saut exceptionnelle (≈ 22,0 al stock, ≈ 33 al en repère d'ingénierie G5 — la meilleure
  du segment Medium), micro-propulseurs avancés, stabilisateurs de FSD supérieurs, coque en composite polymère
  renforcé, FSD (SCO) d'origine
- **Points faibles :** vitesse modérée (285 m/s, boost 357 m/s)
- **Caractéristiques :** équipage 2, bouclier de base 269 MJ, armure 414, agilité 163, mass-lock factor 11, hardpoints
  4 moyens + 2 petits (6 au total) + 4 emplacements utilitaires (et non « aucun point utilitaire » comme parfois
  avancé — voir tableau
  « [Emplacements et hardpoints](#emplacements-et-hardpoints-des-48-vaisseaux--tableau-de-référence) »)
- **Prix :** 17 639 220 Cr — disponible en crédits (Odyssey) ou via ARX

### Corsair — multi-rôle moyen Gutamaya (79,3 M Cr, 6 hardpoints)

- **Constructeur :** Gutamaya
- **Gabarit :** Moyen — 265 t
- **Rôle principal :** multi-rôle polyvalent conçu pour équipage multiple
- **Points forts :** 6 compartiments internes optionnels, capacité de fret importante, bonne vitesse en ligne droite
  (288 m/s, boost 366 m/s), très bonne agilité (116), profil équilibré dans tous les rôles, FSD (SCO) d'origine
- **Points faibles :** surclassé par les vaisseaux spécialisés dans chaque rôle pris individuellement
- **Caractéristiques :** équipage 2, bouclier de base 264 MJ, armure 486, mass-lock 17, hardpoints **3 larges + 3
  moyens (6 au total)** + 4 emplacements utilitaires (et non « 3 larges + 2 moyens » comme parfois avancé)
- **Prix :** 79 304 750 Cr — disponible en crédits (Odyssey), sans ARX requis

### Type-8 Transporter — cargo moyen Lakon (38,5 M Cr, ≈ 24,1 al stock, meilleure portée Medium)

- **Constructeur :** Lakon Spaceways
- **Gabarit :** Moyen — 400 t
- **Rôle principal :** cargo/commerce, positionné entre le Type-6/Keelback et les gros cargos ; voir aussi
  [Colonisation](./18-colonisation.md) pour son rôle logistique
- **Points forts :** vaste capacité de chargement (7 baies internes principales), meilleure portée de saut du segment
  Medium (≈ 24,1 al stock, ≈ 36,2 al en repère G5), gestion supérieure du FSD surchargé (SCO d'origine)
- **Points faibles :** agilité limitée (106), armement plus fourni qu'il n'y paraît en nombre (1 moyen + 5 petits, 6
  au total) mais chaque point reste de faible puissance de feu unitaire ; 4 emplacements utilitaires (et non « aucun
  point utilitaire » comme parfois avancé)
- **Caractéristiques :** vitesse 201 m/s (boost 342 m/s), bouclier 122 MJ, armure 792, équipage 1, mass-lock 18
- **Prix :** 38 453 970 Cr

### Python Mk II — vaisseau de combat moyen Faulcon DeLacy (67,5 M Cr, 4 hardpoints larges)

- **Constructeur :** Faulcon DeLacy
- **Gabarit :** Moyen — 450 t
- **Rôle principal :** refonte de combat du Python, maniabilité et puissance de feu renforcées
- **Points forts :** **4 hardpoints larges + 2 moyens (6 au total, et non « 3 larges + 2 moyens »)** + 6 emplacements
  utilitaires, agilité supérieure (144), bouclier de base 316 MJ, armure 504, FSD (SCO) d'origine
- **Points faibles :** espace interne et capacité de fret réduits par rapport au Python original
- **Caractéristiques :** vitesse 261 m/s (boost 352 m/s), équipage 2, mass-lock 17, 6 compartiments internes optionnels
- **Prix :** 67 527 360 Cr

### Panther Clipper Mk II — grand cargo Zorgon Peterson (301,3 M Cr, plus gros transporteur non-capital)

- **Constructeur :** Zorgon Peterson
- **Gabarit :** Grand — **masse de coque 1 200 t** (masse à vide du châssis relevée sur Inara.cz, à ne pas confondre
  avec une capacité de soute, qui dépend des Cargo Racks installés) ; c'est le **plus gros transporteur non-capital**
  du jeu
- **Rôle principal :** transport de cargo lourd avec capacités défensives
- **Points forts :** plus gros transporteur non-capital du jeu, nombreux hardpoints — **2 larges + 4
  moyens + 4 petits (10 au total, et non « 3 larges + 2 moyens + 4 petits »)** + 6 emplacements utilitaires, blindage
  très robuste (1116), FSD (SCO) d'origine
- **Points faibles :** maniabilité très limitée (agilité 46), mass-lock élevé (27)
- **Caractéristiques :** vitesse 182 m/s (boost 252 m/s), bouclier de base 245 MJ, équipage 4
- **Prix :** 301 348 585 Cr — disponible en crédits (Odyssey) ou via ARX, sorti en accès anticipé ARX le 22 juillet 2025

### Cobra Mk V — petit multi-rôle Faulcon DeLacy (2,0 M Cr, agilité 198)

- **Constructeur :** Faulcon DeLacy
- **Gabarit :** Petit — 250 t
- **Rôle principal :** multi-rôle équilibré (exploration/commerce/combat), successeur spirituel des Cobra Mk III/IV
- **Points forts :** excellente maniabilité (agilité 198), vitesse respectable (294 m/s, boost 415 m/s), FSD (SCO)
  d'origine, bonne portée de saut pour un petit vaisseau (≈ 17,9 al stock, ≈ 26,9 al en repère G5)
- **Points faibles :** blindage modéré (324), capacité de fret limitée
- **Caractéristiques :** bouclier de base 235 MJ, équipage 3 (multi-équipage), réacteur/moteurs/FSD 4E, hardpoints
  **3 moyens + 2 petits (5 au total)** + **4 emplacements utilitaires** (et non « pas d'emplacement utilitaire » comme
  parfois avancé) ; assez d'espace optionnel (classe 5) pour un Fighter Hangar 1 baie
- **Prix :** 1 989 460 Cr

### Kestrel Mk II — petit vaisseau de combat Core Dynamics (14,3 M Cr, sorti le 24 février 2026)

- **Constructeur :** Core Dynamics
- **Gabarit :** Petit — 190 t
- **Sortie :** **24 février 2026**, date confirmée par une source primaire — billet officiel Frontier
  « Elite Dangerous | Kestrel Mk. II Update », 24 février 2026 12:21 UTC : *« The Kestrel Mk II Update is now live »*,
  avec mise à disposition « via ARX early access ». La réserve « non confirmée par une annonce directe » d'une version
  antérieure de ce guide est donc levée ; le commit EDCD du 25 février 2026 n'était qu'une corroboration indirecte.
- **Rôle principal :** combat aérien rapide, interception, frappe rapide
- **Points forts :** vitesse exceptionnelle (278 m/s, boost 370 m/s), agilité supérieure (194), FSD (SCO) d'origine
- **Points faibles :** protection limitée (bouclier 338 MJ, armure 135), cargo minimal, pas de multi-équipage
- **Caractéristiques :** 3 hardpoints larges + 2 petits (5 au total) + 4 emplacements utilitaires, réacteur/moteurs 5E,
  FSD 4E, 5 compartiments internes ; assez d'espace optionnel (classe 5) pour un Fighter Hangar 1 baie
- **Modules introduits avec lui** (mêmes notes officielles) : **Mk II Agile Boost Thrusters** — maniabilité accrue en
  boost, avec une hausse marquée de la poussée latérale et verticale — et **Mk II Plasma Shock Accelerator**, canon à
  choc en tir par rafales, à dégâts de type plasma et fonction *plasma slug* intégrée. La même mise à jour embarquait
  une refonte étendue de l'audio de **combat à pied** (voir [Combat à pied](./09-combat-a-pied.md)), et non de l'audio
  de vol.
- **Prix :** 14 273 820 Cr — disponible en crédits (Odyssey) ou via ARX

### Caspian Explorer — grand vaisseau d'exploration Zorgon Peterson (194,9 M Cr, ≈ 20,9 al stock)

- **Constructeur :** Zorgon Peterson
- **Gabarit :** Grand — 950 t
- **Sortie :** 2 décembre 2025, en accès anticipé ARX (révélé le 25 novembre 2025 lors du *November Dev Blog*,
  billet de blog mensuel des développeurs)
- **Rôle principal :** exploration galactique longue distance avec capacités polyvalentes
- **Points forts :** excellente autonomie de saut (≈ 20,9 al stock, ≈ 31,4 al en repère G5 — la meilleure du segment
  Large), 7 compartiments internes optionnels, bonne capacité de fret, assistance amarrage/approche automatique,
  armement en réalité plus fourni qu'il n'y paraît — **1 large + 6 moyens (7 au total)** + **6 emplacements
  utilitaires** (et non « 3 hardpoints seulement, aucun point utilitaire » comme parfois avancé), FSD (SCO) d'origine
  — c'est d'ailleurs le seul FSD de classe 8 disponible dans le jeu, la variante classique n'existant pas à cette
  taille
- **Points faibles :** masse importante nuisant à la manœuvrabilité (agilité 113), puissance de feu par point d'ancrage
  limitée malgré leur nombre
- **Caractéristiques :** vitesse 205 m/s (boost 283 m/s), équipage 4, blindage 621, bouclier 196 MJ, mass-lock 21
- **Prix :** 194 861 290 Cr — réservé aux propriétaires d'Odyssey

### Lynx Highliner — paquebot moyen Zorgon Peterson (69,3 M Cr, 225 passagers, sorti le 28 avril 2026)

- **Constructeur :** Zorgon Peterson (et non Saud Kruger, malgré une confusion fréquente — voir la section
  « [Les six constructeurs](#les-six-constructeurs-de-vaisseaux-delite-dangerous) » plus haut)
- **Gabarit :** Moyen — 260 t
- **Sortie :** **28 avril 2026** (billet officiel Frontier « Elite Dangerous | Lynx Highliner Update Notes »,
  28 avril 2026 13:11 UTC), **directement en crédits aux chantiers navals** pour tous les possesseurs d'Odyssey —
  formule Standard à 0 ARX, paliers Stellar (16 480 ARX) et Galactic (43 480 ARX) à tarif réduit. Frontier a présenté
  cette mise à disposition immédiate comme une compensation du report d'*Operations* (« An Update on Operations »,
  22 avril 2026 14:02 UTC).
- **Rôle principal :** paquebot de passagers — jusqu'à **225 passagers**, avec cabines Economy et Business et
  possibilité de **cabines Mk II** (capacité passagers multipliée par 1,5 par rapport aux cabines de génération
  précédente, d'après les mêmes notes de mise à jour)
- **Points forts :** capacité de cabines élevée, défenses solides pour son rôle (bouclier 228 MJ, armure 630) — les
  notes officielles le positionnent comme le paquebot le plus sûr alors disponible, capable de repousser un agresseur
  jusqu'à l'arrivée de renforts ; style volontairement utilitaire, à rebours des paquebots de luxe Saud Kruger
- **Points faibles :** agilité modérée (97) ; armement honorable pour un paquebot (1 large + 4 moyens) mais sans
  commune mesure avec un vaisseau de combat de même gabarit
- **Caractéristiques :** vitesse 293 m/s (boost 360 m/s), équipage 2 ; **1 hardpoint large + 4 moyens** (et non « 3
  hardpoints, 2 lasers pulse » comme l'indiquait une version antérieure de ce guide) ; core internals réacteur 5,
  propulseurs 6, FSD 5, support de vie 6, distributeur 5, capteurs 3, réservoir 5 ; emplacements optionnels
  3×6 + 2×5 + 2×4 + 1×3 + 1×2 + 1×1 — soit assez de place pour un Vessel Hangar 2 baies
- **Prix :** 69 289 470 Cr
- **Note méthodologique :** absent d'EDCD/coriolis-data à la date de rédaction (9 septembre 2026). Les hardpoints,
  les core internals et les emplacements optionnels listés ci-dessus proviennent donc de la **spécification technique
  officielle** publiée par Frontier dans le billet « An Update on Operations » du 22 avril 2026 14:02 UTC, et non de la
  méthode EDCD employée pour les 47 autres vaisseaux ; le nombre d'emplacements utilitaires n'y est pas précisé, et la
  portée de saut « stock » reste **non calculable** faute de masse de coque dans un jeu de données exploitable. Les
  chiffres de vitesse, bouclier, armure et agilité restent ceux d'Inara.cz, sans recoupement indépendant.

### Type-11 Prospector — vaisseau minier moyen Lakon (67,9 M Cr, seul châssis minier dédié)

- **Constructeur :** Lakon Spaceways
- **Gabarit :** Moyen — 320 t, construit sur la plateforme du Type-8
- **Rôle principal :** exploitation minière dédiée — voir [Le Minage](./20-minage.md) pour l'équipement et les
  techniques associées
- **Points forts :** capacité de fret exceptionnelle (6 compartiments de classe 6 principalement), modules miniers
  spécialisés, gestion supérieure du FSD surchargé (SCO d'origine), blindage robuste (630)
- **Points faibles :** agilité limitée (84), vitesse modérée (271 m/s), hardpoints en nombre modeste — **1 moyen + 3
  petits (4 au total, et non « 1 large + 4 moyens + 1 petit »)** + 4 emplacements utilitaires
- **Caractéristiques :** équipage 3, bouclier 271 MJ, 6 emplacements internes principaux dont trois de classe 6
- **Prix :** 67 861 850 Cr — réservé aux propriétaires d'Odyssey

## Tableaux par catégorie de rôle

Beaucoup de vaisseaux sont polyvalents et peuvent apparaître dans plusieurs catégories selon leur équipement
(outfitting) ; le classement ci-dessous reflète leur rôle principal annoncé. Pour l'ordre dans lequel franchir ces
paliers en début de carrière, plutôt que pour le rôle de chaque châssis, voir
[27 — Débuter et progresser](./27-debuter-et-progresser.md), qui détaille le cheminement du Sidewinder Mk I au premier
multirôle.

### Vaisseaux de combat dédié, du Eagle Mk II au Federal Corvette

| Vaisseau             | Constructeur    | Gabarit | Points forts                                                 | Points faibles                                        |
|----------------------|-----------------|---------|--------------------------------------------------------------|-------------------------------------------------------|
| Eagle Mk II          | Core Dynamics   | Petit   | Agile, très bon marché                                       | Fragile, cargo quasi nul                              |
| Imperial Eagle       | Gutamaya        | Petit   | Rapide, agile, bon bouclier pour sa taille, aucun rang requis | Cargo minime                                          |
| Viper Mk III         | Faulcon DeLacy  | Petit   | Très agile, rapide, peu coûteux                              | Faible cargo, coque fragile                           |
| Viper Mk IV          | Faulcon DeLacy  | Petit   | Plus de hardpoints et de blindage que le Mk III              | Moins agile, plus cher                                |
| Vulture              | Core Dynamics   | Petit   | 2 hardpoints larges (fort potentiel de dégâts), bon blindage, peut embarquer un chasseur (1 baie) | Lent, cargo faible, courte portée de saut |
| Kestrel Mk II        | Core Dynamics   | Petit   | Vitesse et agilité de pointe                                 | Protection limitée, pas de multi-équipage             |
| Imperial Courier     | Gutamaya        | Petit   | Très rapide et agile, bon bouclier                           | Cargo minimal, rang Empire (Master) requis            |
| Federal Assault Ship | Core Dynamics   | Moyen   | Bien blindé                                                  | Agilité et cargo faibles, rang Fédération (Chief Petty Officer) requis |
| Alliance Crusader    | Lakon Spaceways | Moyen   | Bon armement et blindage, aucun rang requis, baie de chasseur (2 baies) | Peu agile                    |
| Federal Gunship      | Core Dynamics   | Moyen   | Armement lourd                                               | Agilité faible, mass-lock élevé, rang Fédération (Ensign) requis |
| Python Mk II         | Faulcon DeLacy  | Moyen   | 6 hardpoints puissants (4 larges + 2 moyens), agilité élevée | Cargo réduit                                          |
| Fer-de-Lance         | Zorgon Peterson | Moyen   | Rapide, agile, très puissant                                 | Coûteux, cargo modéré                                 |
| Mamba                | Zorgon Peterson | Moyen   | Extrêmement rapide et agile                                  | Blindage faible, cargo limité                         |
| Federal Corvette     | Core Dynamics   | Grand   | Hardpoints et boucliers parmi les plus puissants du jeu      | Rang Fédération élevé requis (Rear Admiral), cargo faible, très cher |

### Vaisseaux d'exploration, du Sidewinder au Caspian Explorer

| Vaisseau             | Constructeur    | Gabarit | Points forts                                                 | Points faibles                |
|----------------------|-----------------|---------|--------------------------------------------------------------|--------------------------------|
| Sidewinder Mk I      | Faulcon DeLacy  | Petit   | Gratuit, robuste pour débuter                                | Portée et confort limités     |
| Diamondback Scout    | Lakon Spaceways | Petit   | Agile, bonne gestion thermique                               | Faible capacité interne       |
| Diamondback Explorer | Lakon Spaceways | Petit   | Excellente portée de saut et gestion thermique               | Combat et cargo limités       |
| Asp Scout            | Lakon Spaceways | Petit   | Bonne visibilité, portée correcte, moins cher que l'Explorer | Capacité interne réduite      |
| Asp Explorer         | Lakon Spaceways | Moyen   | Excellente visibilité et portée de saut, très polyvalent     | Moins agile qu'un chasseur    |
| Mandalay             | Zorgon Peterson | Moyen   | Meilleure portée de saut du segment Medium (≈ 22 al stock)   | Peu de hardpoints (6, mais pas « aucun utilitaire ») |
| Krait Mk II          | Faulcon DeLacy  | Moyen   | Bon équilibre cargo/combat/portée                            | Agilité moyenne               |
| Anaconda             | Faulcon DeLacy  | Grand   | Portée de saut correcte pour un très gros vaisseau, très polyvalent, baie de chasseur (2 baies) | Accélération lente, très cher, portée stock modeste sans FSD amélioré |
| Caspian Explorer     | Zorgon Peterson | Grand   | Meilleure portée de saut du segment Large (≈ 21 al stock), 7 compartiments optionnels, plus armé qu'il n'y paraît | Peu agile |

### Vaisseaux de commerce et de fret, du Hauler au Panther Clipper Mk II

| Vaisseau              | Constructeur    | Gabarit | Points forts                      | Points faibles                     |
|-----------------------|-----------------|---------|------------------------------------|-------------------------------------|
| Hauler                | Zorgon Peterson | Petit   | Très bon rapport cargo/prix       | Lent, quasiment sans arme          |
| Adder                 | Zorgon Peterson | Petit   | Bonne portée de saut pour le prix | Combat faible                      |
| Type-6 Transporter    | Lakon Spaceways | Moyen   | Bon rapport cargo/prix            | Défenses faibles                   |
| Keelback              | Lakon Spaceways | Moyen   | Fret armé, baie de chasseur (1)   | Peu maniable en combat             |
| Type-8 Transporter    | Lakon Spaceways | Moyen   | 7 baies de fret, meilleure portée de saut du segment Medium, rôle clé en [Colonisation](./18-colonisation.md) | Armement modeste par point |
| Alliance Chieftain    | Lakon Spaceways | Moyen   | Hardpoints puissants (2 larges), aucun rang requis, baie de chasseur (2 baies) | Cargo limité |
| Type-7 Transporter    | Lakon Spaceways | Grand   | Excellent rapport cargo/coût      | Faible agilité et défense          |
| Type-9 Heavy          | Lakon Spaceways | Grand   | Capacité de fret énorme           | Très peu agile, boucliers faibles  |
| Type-10 Defender      | Lakon Spaceways | Grand   | Fret armé et blindé               | Agilité très faible, cher          |
| Panther Clipper Mk II | Zorgon Peterson | Grand   | Plus gros transporteur non-capital du jeu, 10 hardpoints | Maniabilité très limitée   |

### Vaisseaux de transport de passagers (Dolphin, Lynx Highliner, Orca, Beluga Liner)

| Vaisseau       | Constructeur    | Gabarit | Points forts                                   | Points faibles                     |
|----------------|-----------------|---------|--------------------------------------------------|-------------------------------------|
| Dolphin        | Saud Kruger     | Petit   | Compact, bonne portée, agile pour sa catégorie | Fragile, cargo limité              |
| Lynx Highliner | Zorgon Peterson | Moyen   | 225 passagers, cabines Mk II, défenses solides  | Agilité modérée (97)              |
| Orca           | Saud Kruger     | Grand   | Rapide, élégant, bonne portée                  | Combat faible, cargo réduit        |
| Beluga Liner   | Saud Kruger     | Grand   | Plus grande capacité de cabines du jeu         | Combat faible, taille peu maniable |

### Vaisseaux multi-rôles, du Cobra Mk III à l'Imperial Cutter

| Vaisseau            | Constructeur    | Gabarit | Points forts                                     | Points faibles                                       |
|---------------------|-----------------|---------|----------------------------------------------------|--------------------------------------------------------|
| Cobra Mk III        | Faulcon DeLacy  | Petit   | Polyvalent, agile, bonne portée                  | Aucune spécialité marquée                             |
| Cobra Mk IV         | Faulcon DeLacy  | Petit   | Plus d'internes et de hardpoints que le Mk III   | Plus lourd, moins agile                               |
| Cobra Mk V          | Faulcon DeLacy  | Petit   | Très agile, FSD (SCO) d'origine, baie de chasseur (1) | Fret et blindage limités                        |
| Federal Dropship    | Core Dynamics   | Moyen   | Hybride combat/transport robuste, baie de chasseur (2) | Agilité moyenne, rang Fédération (Midshipman) requis |
| Krait Phantom       | Faulcon DeLacy  | Moyen   | Bien protégé, bonne portée                       | Cargo réduit par rapport au Krait Mk II               |
| Corsair             | Gutamaya        | Moyen   | Équilibré, 6 hardpoints (3 larges + 3 moyens), 6 compartiments optionnels | Surclassé par les vaisseaux spécialisés |
| Alliance Challenger | Lakon Spaceways | Moyen   | Bien blindé, aucun rang requis                   | Moins agile                                           |
| Python              | Faulcon DeLacy  | Moyen   | Boucliers et puissance de feu solides, bon cargo | Coût élevé, agilité moyenne                           |
| Imperial Clipper    | Gutamaya        | Grand   | Rapide, boucliers puissants                      | Maniabilité à basse vitesse, rang Empire (Baron) requis |
| Imperial Cutter     | Gutamaya        | Grand   | Boucliers et armement au sommet, bon cargo       | Rang Empire élevé requis (Duke), très cher, maniement lourd |

### Vaisseaux de minage (Type-11 Prospector, Type-9 Heavy, Type-10 Defender)

Voir [Le Minage](./20-minage.md) pour l'équipement minier détaillé (limpets, lasers miniers, raffineries) ; tableau de
sélection de vaisseau ci-dessous.

| Vaisseau                             | Constructeur                               | Gabarit               | Points forts                                                                                   | Points faibles                                  |
|--------------------------------------|--------------------------------------------|-----------------------|--------------------------------------------------------------------------------------------------|---------------------------------------------------|
| Type-11 Prospector                   | Lakon Spaceways                            | Moyen                 | Seul vaisseau conçu nativement pour le minage : fret exceptionnel (6 emplacements dont trois de classe 6), FSD (SCO) | Agilité limitée, seulement 4 hardpoints |
| Type-9 Heavy                         | Lakon Spaceways                            | Grand                 | Très grande capacité de soutes minières (en configuration adaptée)                             | Peu agile                                       |
| Type-10 Defender                     | Lakon Spaceways                            | Grand                 | Fret minier protégé                                                                            | Coûteux                                         |
| Python / Anaconda / Imperial Clipper | Faulcon DeLacy / Faulcon DeLacy / Gutamaya | Moyen / Grand / Grand | Polyvalents, capables en configuration minière                                                 | Non spécialisés, moins efficaces que le Type-11 |

## Matrice Rôle × Budget : quel vaisseau pour quel rôle et quel budget

*Répond à : « Quel vaisseau acheter avec X millions de crédits ? », « Best ship for my budget? », « Quel vaisseau
choisir pour débuter en combat/exploration/commerce ? »*

Les tableaux ci-dessus classent par rôle ; celui-ci classe par **budget total** — coque **et** équipement
fonctionnel, pas le seul prix de coque affiché au chantier naval. La méthode reprend le facteur **≈ 2,6×** déjà établi
plus loin dans ce guide (voir « [Le coût réel d'un vaisseau équipé](#le-coût-réel-dun-vaisseau-équipé-rebuy-inclus) »,
calculé sur l'exemple de l'Anaconda en core internals de qualité A) : chaque cellule applique ce facteur au prix de
coque du tableau de prix pour estimer un budget total réaliste, arrondi. Ce n'est pas un devis exact par vaisseau —
l'ingénierie, les armes et les modules optionnels varient le total réel — mais un ordre de grandeur suffisant pour
choisir un palier. Quatre paliers, repris de la pratique communautaire : **< 5 M Cr**, **5-50 M Cr**, **50-300 M Cr**,
**> 300 M Cr**, chacun avec une recommandation principale et une alternative.

| Rôle | < 5 M Cr | 5-50 M Cr | 50-300 M Cr | > 300 M Cr |
|---|---|---|---|---|
| Combat | Viper Mk III (≈ 0,37 M Cr équipé) — alt. Eagle Mk II | Vulture (≈ 12,8 M Cr) — alt. Viper Mk IV (≈ 1,1 M Cr, entrée basse) | Fer-de-Lance (≈ 134 M Cr) — alt. Python Mk II (≈ 176 M Cr) | **Federal Corvette** (≈ 489 M Cr, rang Rear Admiral requis) — alt. Imperial Cutter (≈ 543 M Cr, rang Duke requis, plus polyvalent) |
| Exploration | Diamondback Scout (≈ 1,5 M Cr) — alt. Sidewinder Mk I (≈ 0,08 M Cr) | Asp Explorer (≈ 17,3 M Cr) — alt. Diamondback Explorer (≈ 4,9 M Cr, entrée basse) | Krait Phantom (≈ 97 M Cr) — alt. Krait Mk II (≈ 119 M Cr) | **Anaconda** (≈ 382 M Cr) — alt. Caspian Explorer (≈ 507 M Cr, meilleure portée Large) |
| Commerce / fret | Hauler (≈ 0,14 M Cr) — alt. Adder (≈ 0,23 M Cr) | Keelback (≈ 8,1 M Cr) — alt. Type-7 Transporter (≈ 45 M Cr, entrée haute) | Type-8 Transporter (≈ 100 M Cr) — alt. Type-9 Heavy (≈ 199 M Cr) | **Panther Clipper Mk II** (≈ 784 M Cr) — alt. Type-10 Defender (≈ 324 M Cr, fret armé) |
| Transport de passagers | Dolphin (≈ 3,5 M Cr) — pas d'alternative dédiée à ce palier | *Aucun vaisseau à cabines dédié dans ce palier* — un Adder/Cobra Mk III avec cabine en soute peut dépanner | Orca (≈ 126 M Cr) — alt. Beluga Liner (≈ 220 M Cr) | *Aucun vaisseau à cabines dédié ne dépasse 300 M Cr équipé* — au-delà, on ajoute des cabines à un Type-9 Heavy ou un Panther Clipper Mk II |
| Minage | *Aucun vaisseau minier dédié à ce palier* — un Hauler/Adder avec laser minier basique peut démarrer | *Aucun vaisseau minier dédié à ce palier* — un Cobra Mk III/Asp Explorer équipé en minage basique convient en attendant | **Type-11 Prospector** (≈ 176 M Cr) — alt. Type-9 Heavy (≈ 199 M Cr) | Type-10 Defender (≈ 324 M Cr) — au-delà, un Anaconda ou un Imperial Cutter reconvertis restent moins efficaces que le Type-11 |
| Multi-rôle | Cobra Mk III (≈ 0,91 M Cr) — alt. Cobra Mk IV (≈ 2,0 M Cr) | Cobra Mk V (≈ 5,2 M Cr) — alt. Imperial Clipper (≈ 58 M Cr, entrée haute) | Python Mk II (≈ 176 M Cr) — alt. Corsair (≈ 206 M Cr) | **Imperial Cutter** (≈ 543 M Cr, rang Duke requis) — seule option à ce palier |

*Les rôles en gras dans une cellule signalent le vaisseau le plus souvent cité par la communauté comme référence du
palier — pas un jugement absolu. Voir l'arbre de décision « quel objectif, quel vaisseau » en
[27-debuter-et-progresser.md §3.1](./27-debuter-et-progresser.md) pour partir de l'objectif plutôt que du budget.*

### Configurations de référence pour les cinq châssis les plus joués et jamais configurés

Cinq vaisseaux récents n'ont, ailleurs dans ce guide, que des données brutes (masse, prix, hardpoints) ou une fiche
descriptive sans orientation de build. Ce qui suit est une **orientation qualitative** — rôle et priorité
d'équipement — et non un plan de modules module par module : pour un build chiffré précis, croiser cette orientation
avec un outil de configuration (Coriolis, EDSY) reste nécessaire, comme pour tout vaisseau de ce guide.

| Vaisseau | Palier budgétaire | Rôle recommandé | Priorité d'équipement |
|---|---|---|---|
| Krait Mk II | 50-300 M Cr | Exploration/commerce hybride — meilleur équilibre cargo/combat/portée du segment Medium | FSD Increased Range en premier, puis Shield Generator + 2 Hull Reinforcement Package avant tout hardpoint offensif |
| Krait Phantom | 50-300 M Cr | Exploration ou combat léger — mieux protégé que le Krait Mk II, moins de cargo | FSD Increased Range, puis Shield Booster ; hardpoints en Multi-cannon si combat, en Fuel Scoop/DSS si exploration |
| Python Mk II | 50-300 M Cr | Combat moyen ou multi-rôle — 4 hardpoints larges, agilité élevée | Power Distributor en premier (soutient les 4 hardpoints larges), puis Shield Generator classe A |
| Alliance Chieftain | 5-50 M Cr | Combat léger sans rang requis — 2 hardpoints larges, baie de chasseur | Thrusters et Power Plant en priorité (masse élevée pour un Medium), puis boucliers |
| Mandalay | 5-50 M Cr | Exploration pure — meilleure portée de saut du segment Medium (≈ 22 al stock) | FSD Increased Range en tout premier ; le gain de portée du Mandalay dépend directement de ce module |

## Le cas du Nomad — vaisseau embarqué (SLV) absent des catalogues de chantier naval

*Répond à : « Le Nomad existe-t-il vraiment ? », « Comment obtenir le Nomad (SLV) ? », « Pourquoi le Nomad
n'apparaît pas dans la liste des vaisseaux ? », « Is the Nomad a real ship? »*

Le **Nomad** existe. Il est sorti le **30 juin 2026** et est bel et bien en jeu. Mais **ce n'est pas un vaisseau de
chantier naval** : c'est le premier **vaisseau embarqué** (*ship-launched vessel*, SLV) d'Elite Dangerous. Cette
distinction de taxonomie est la clé de tout le dossier, et c'est elle qui a été manquée dans une version antérieure de
ce guide.

### Nomad : ce que disent les billets officiels Frontier des 2 juin et 1ᵉʳ juillet 2026

Deux billets officiels Frontier, relevés sur le flux Steam News de l'éditeur (appid 359320), suffisent à l'établir :

- « **Discover the Nomad** », **2 juin 2026 13:03 UTC** — premier dévoilement : *« The Nomad is a small and compact
  ship-launched vessel which is built to explore planetary surfaces. »* Le billet décrit des patins d'atterrissage
  d'inspiration hélicoptère, plus étroits que le train classique et donc capables de se poser sur un terrain
  accidenté, ainsi que des moteurs qui **pivotent à l'atterrissage** pour venir se placer juste au-dessus du sol. Il
  annonce une sortie « in ARX Early Access alongside Operations on 30th June ».
- « **Operations Update** », **1ᵉʳ juillet 2026 14:01 UTC** — notes de version complètes : *« This update also brings
  with it the mighty Nomad! »* Le Nomad y est qualifié de *« compact, ship-launched utility vessel »*, conçu pour
  explorer et se déplacer en terrain planétaire ; ses propulseurs vifs, sa faible empreinte au sol et sa mise en route
  rapide en font un appareil qui se pose vite, même en terrain difficile. Il embarque *« a specialised MK II
  Biological Scanner for the detection of biological signals directly from the cockpit »*, et il est explicitement
  précisé que *« The Nomad can be deployed from a compatible vessel bay, including MK I and MK II modules. »*

Les mêmes notes du 1ᵉʳ juillet 2026 ajoutent à l'outfitting deux modules propres au Nomad : le **Mk II Biological
Scanner**, scanner à impulsion qui détecte les signatures biologiques, et des **Pulse Lasers** montés en position fixe
— le Nomad n'est donc pas totalement désarmé, même si son rôle est l'exploration.

Le report d'*Operations* — et donc du Nomad — d'avril à juin 2026 est lui-même documenté par le billet « An Update
on Operations » du **22 avril 2026 14:02 UTC** (*« which will now be arriving in June »*). Version du jeu au lancement :
**4.4.0.0** le 30 juin 2026, portée à **4.4.0.3** au 9 juillet 2026 après les correctifs « Operations Update | Update
3 » (9 juillet 2026 10:24 UTC).

### Nomad : pourquoi il est absent d'Inara et de shipyard.csv — et pourquoi cela ne prouve rien

La liste des vaisseaux d'Inara et le fichier `shipyard.csv` d'EDCD/FDevIDs ne recensent **que les vaisseaux pilotables
achetables au chantier naval**. Ils ne contiennent ni les SRV — Scarab, Scorpion et **Rhino**, dont personne ne
conteste l'existence —, ni les chasseurs embarqués (SLF), ni les SLV. Y chercher le Nomad revient à chercher un
chasseur embarqué dans Coriolis : l'absence n'y a **aucune valeur probante**. Combinée à l'inaccessibilité en HTTP 403
de elitedangerous.com, du wiki Fandom et de Reddit lors de la vérification précédente, cette erreur de catégorie a
produit un faux négatif, et le corpus a conclu à tort à l'inexistence du Nomad et du mode *Operations*.

**Conséquence sur le décompte : aucune.** Les **48 vaisseaux** recensés dans les tableaux de ce guide restent le bon
chiffre, et le Nomad ne s'y ajoute pas — pas plus que le Scarab, le Scorpion, le Rhino ou un SLF. Le Nomad n'a d'ailleurs
ni prix en crédits, ni fiche de chantier naval : il s'acquiert en **ARX**, par formules pré-équipées, aux paliers
habituels du jeu — **Nomad Standard** (16 520 ARX), **Nomad Stellar** (33 000 ARX) et **Nomad Galactic** (60 000 ARX),
toutes trois livrées avec le Mk II Biological Scanner. Le contenu détaillé de ces trois formules, la conception du
véhicule et ses conditions de déploiement sont documentés par [14-rhino.md](./14-rhino.md), qui fait
référence sur ce sujet.

### Nomad : ce que le corpus ne peut pas affirmer (fabricant, prix en crédits, gabarit)

Les billets officiels **ne donnent pas de fabricant** pour le Nomad (contrairement au Rhino, explicitement attribué à
**Vodel** dans le billet « Rhino SRV Update » du 2 septembre 2026 11:20 UTC), **ni de prix en crédits**, **ni de
gabarit de plateforme d'atterrissage** — cette dernière notion n'ayant pas de sens pour un vaisseau embarqué. Ces trois
champs doivent rester vides dans le corpus.

### Nomad : corroborations techniques communautaires (EDCoPilot, EDDI, EDCD/FDevIDs)

Trois traces techniques, hautement falsifiables, confirment le déploiement effectif du Nomad en jeu. Elles relèvent de
la **documentation communautaire** et non de la source primaire, et sont signalées comme telles :

- **EDCoPilot v1.11.726** (1ᵉʳ juillet 2026) — note de version : *« Nomad release 0 day fix — fix issue where flags in
  status.json were switching EDCoPilot's tracking back to being in an SRV (because the Nomad sets the SRV flag, not the
  fighter flag, in the status.json file) »*. Le Nomad occupe donc, dans le journal du jeu, l'emplacement de statut du
  SRV et non celui du chasseur — une signature technique qui distingue le SLV du SLF.
- **EDCD/EDDI, ticket #2849** (5 août 2026) — journal brut d'un joueur montrant un événement `DockSRV` portant
  `SRVType` = `"lander01"` et `SRVType_Localised` = `"Nomad"`, ainsi qu'un `LoadGame` portant `Ship` = `"Lander01"`,
  `Ship_Localised` = `"Nomad"` et `gameversion` = `"4.4.0.3"`. Le **nom interne du Nomad est donc `Lander01`**.
- **EDCD/FDevIDs, `outfitting.csv`** — les modules `Int_FighterBay_Size5/6/7_Class1` sont renommés « Vessel Hangar » et
  les `Int_FighterBayMk2_Size5/6/7_Class1` « Mk II Vessel Hangar » ; commit du 3 juillet 2026 : *« new commodity and
  modules for Operations & Nomad update »*. Voir la section
  [Du Fighter Hangar au Vessel Hangar](#du-fighter-hangar-au-vessel-hangar--le-renommage-de-juillet-2026) ci-dessus.

Pour la fiche complète du Nomad — équipement, usage en exploration, place aux côtés du SRV Rhino —, voir
**[Le Rhino et le Nomad](./14-rhino.md)**. Pour le mode de jeu qui l'accompagne, voir
**[Opérations](./13-operations.md)**.

## Le coût réel d'un vaisseau équipé (rebuy inclus)

*Répond à : « Combien coûte vraiment un Anaconda tout équipé ? », « C'est quoi le rebuy et combien ça coûte ? »,
« How much does it really cost to outfit a ship? »*

Le prix affiché dans les tableaux ci-dessus n'est que le prix de la **coque nue** : c'est rarement le vrai coût
d'entrée dans un vaisseau. Deux postes s'y ajoutent systématiquement :

1. **Les modules** — remplacer les composants standards d'origine (médiocres, voir le tableau des prix ci-dessus où la
   portée de saut « stock » est nettement inférieure au potentiel du vaisseau) par des modules de qualité A a un coût
   qui peut dépasser celui de la coque elle-même sur les gros vaisseaux, avant même d'ajouter armes, boucliers ou
   modules optionnels.
2. **Le rebuy** (assurance) — en cas de destruction, reconstruire le vaisseau coûte environ **5 %** de sa « valeur
   assurée » (coque + modules installés, hors cargo), un mécanisme d'assurance standard bien connu de la communauté ;
   ce pourcentage n'est pas donné ici comme fixe au centime près et peut varier légèrement selon le type d'assurance.

**Exemple chiffré, entièrement vérifiable sur les données brutes EDCD/coriolis-data** — un **Anaconda** (146 969 450 Cr
la coque) rééquipé avec seulement ses **7 modules de core internals en qualité A** (Power Plant 8A, Thrusters 7A, FSD
6A, Life Support 5A, Power Distributor 8A, Sensors 8A, réservoir de carburant classe 5), sans aucun bouclier, arme ou
module optionnel :

| Poste | Coût (Cr) |
|---|---|
| Coque nue | 146 969 450 |
| Power Plant 8A | 116 739 873 |
| Thrusters 7A | 51 289 112 |
| FSD 6A | 16 179 531 |
| Life Support 5A | 1 241 317 |
| Power Distributor 8A | 27 249 391 |
| Sensors 8A | 27 249 391 |
| Réservoir de carburant classe 5 | 97 754 |
| **Total core internals A** | **240 046 369** |
| **Total coque + core internals A** | **≈ 387 015 819** |
| **Rebuy (≈ 5 % de la valeur assurée)** | **≈ 19 350 791** |

Rien qu'en qualité A sur les **seuls modules standards obligatoires** — avant tout bouclier, toute arme, tout module
optionnel — le budget réel est déjà **2,6 fois** le prix affiché de la coque, et le rebuy à lui seul (≈ 19,4 M Cr)
dépasse le prix d'achat de nombreux vaisseaux Medium du tableau ci-dessus. Un Anaconda de combat ou d'exploration
pleinement équipé (boucliers, armes, module de piratage/scan, etc.) coûte en pratique significativement plus que ce
sous-total. Voir [Les ingénieurs](./06-ingenieurs.md) pour la suite logique : une fois ces modules achetés,
l'ingénierie les améliore encore sans changer leur coût d'achat initial.

## Gestion de flotte : transférer et stocker un vaisseau

Sujet à zéro occurrence avant ce cycle : posséder plusieurs vaisseaux répartis dans la galaxie soulève des questions
de logistique que le corpus ne documentait pas.

**Transfert entre deux stations.** Formule communautaire (non officielle, datée de 2019 et non revérifiée depuis,
mais dont la partie « délai » reste corroborée par des témoignages récents de transferts vers Colonia) :

- **Coût** ≈ (0,00006 × Valeur totale × Distance en al) + (0,0002 × Valeur totale) + 1 000 Cr, où la valeur totale
  inclut la coque et les modules installés. Exemple indicatif : un vaisseau à 20 M Cr transféré sur 500 al coûterait
  environ 605 000 Cr — un calcul, pas un tarif garanti.
- **Délai** ≈ 300 secondes + 10 secondes par année-lumière (soit 5 minutes de base). Un transfert bulle → Colonia/
  Jaques Station (≈ 22 000 al) prend ainsi environ 61 heures, cohérent avec les retours de joueurs.
- Le transfert ne peut se déclencher qu'à quai, dans une station dotée du service Chantier Naval — impossible en vol
  ou en supercroisière.
- Vers un **Porte-Vaisseau**, le tarif standard s'applique toujours (aucune gratuité), et la disponibilité dépend du
  réglage d'accès du propriétaire ; celui-ci peut en revanche stocker et transférer ses propres vaisseaux sans avoir
  à acheter le service Chantier Naval, réservé à l'accueil des visiteurs — voir
  [19-fleet-carriers.md](./19-fleet-carriers.md).

**Stockage.** Un Chantier Naval standard plafonne à **40 vaisseaux stockés par station**, gratuitement et sans limite
de durée — un commandant peut répartir un surplus sur plusieurs stations, chacune plafonnée à 40 également. C'est le
même chiffre que les 40 emplacements gratuits d'un Porte-Vaisseau (déjà documentés en
[19-fleet-carriers.md](./19-fleet-carriers.md)), simple coïncidence de plafond et non une règle unifiée énoncée comme
telle. Un plafond global de 250 vaisseaux par commandant, toutes stations confondues, a été signalé en 2015 comme
source de bugs au-delà : aucune source datée de 2024-2026 ne confirme s'il existe toujours.

Pour le transfert et le stockage des **modules**, ainsi que les outils de recherche de station et la pratique des
hubs de flotte, voir [04-equipements.md, « Gestion de flotte — modules »](./04-equipements.md). Pour la procédure
d'accostage elle-même, voir [31-pilotage-navigation-et-stations.md](./31-pilotage-navigation-et-stations.md).

## Notes sur la fiabilité des données chiffrées de ce guide

*Méthode générale de ce guide — prix : Inara.cz, instantané daté du 9 septembre 2026 (les prix affichés par Inara
fluctuent légèrement dans le temps et doivent être revérifiés avant tout achat important). Emplacements, hardpoints et
portée de saut : jeu de données communautaire [EDCD/coriolis-data](https://github.com/EDCD/coriolis-data) (fichiers
`ships/*.json` et `modules/standard/*.json`), même instantané. Les dates de sortie, les spécifications du Lynx
Highliner et tout ce qui concerne les baies de vaisseau et le Nomad proviennent des billets officiels Frontier relayés
sur le flux Steam News du jeu (voir Sources), chacun cité inline avec son titre et son horodatage UTC.*

- Les prix en crédits proviennent de la page de référence Inara (inara.cz/elite/ships/) et fluctuent dans le temps
  (ajustements d'équilibrage, événements en jeu) ; ils doivent être revérifiés avant toute décision d'achat importante.
- Les hardpoints, emplacements internes et portées de saut proviennent du jeu de données communautaire
  EDCD/coriolis-data (`ships/*.json`, `modules/standard/*.json`, `modules/internal/fighter_hangar.json`,
  `modifications/blueprints.json`), un instantané daté du 9 septembre 2026 ; 47 des 48 vaisseaux du jeu y étaient
  référencés à cette date (Lynx Highliner absent).
- La portée de saut « stock » est **calculée**, pas relevée directement dans le jeu : masse de coque + composants
  standards par défaut (y compris réservoir plein), sans fret ni module optionnel, via la formule officielle de saut
  FSD. Elle peut donc différer légèrement d'un relevé en jeu si un joueur a par exemple installé des modules
  optionnels supplémentaires qui alourdissent le vaisseau.
- Les caractéristiques détaillées (vitesse, bouclier, blindage, agilité, mass-lock) ne sont indiquées en fiche
  individuelle que pour les dix vaisseaux ajoutés depuis 2024 ; le tableau
  « [Emplacements et hardpoints](#emplacements-et-hardpoints-des-48-vaisseaux--tableau-de-référence) » couvre en
  revanche les 47 vaisseaux disponibles dans EDCD/coriolis-data, plus le Lynx Highliner d'après la spécification
  officielle Frontier du 22 avril 2026.
- **Un catalogue de chantier naval ne recense que les vaisseaux de chantier naval.** Ni Inara, ni `shipyard.csv`
  d'EDCD/FDevIDs ne listent les SRV (Scarab, Scorpion, Rhino), les chasseurs embarqués (SLF) ou les vaisseaux embarqués
  (SLV, dont le **Nomad**). L'absence d'un véhicule de ces catégories dans ces sources ne constitue donc **jamais** une
  preuve de sa non-existence — c'est précisément l'erreur de catégorie qui avait conduit une version antérieure de ce
  guide à nier l'existence du Nomad. Pour ces véhicules, les référentiels pertinents sont `outfitting.csv`
  (modules associés), les journaux du jeu (`status.json`, événements `DockSRV`/`LoadGame`) et les notes de version
  officielles.
- Les rangs de réputation requis ont été relevés directement (citations exactes) sur les fiches individuelles Inara de
  chaque vaisseau, le 9 septembre 2026.
- Le **Vulture** est fabriqué par **Core Dynamics**, le **Corsair** par **Gutamaya** et le **Lynx Highliner** par
  **Zorgon Peterson** (et non Saud Kruger) ; ces attributions sont corroborées par EDCD/coriolis-data.

## Pièges fréquents et coûts cachés à l'achat d'un vaisseau

| Piège | Conséquence chiffrée | Comment l'éviter |
|---|---|---|
| Ne budgéter que le prix de coque affiché au chantier naval | Coût réel ≈ 2,6× le prix de coque une fois équipé en qualité A (Anaconda : ≈ 387 M Cr contre 147 M Cr de coque) | Utiliser la matrice Rôle × Budget ci-dessus, qui compte déjà l'équipement |
| Confondre la masse de coque du Panther Clipper Mk II (1 200 t) avec une capacité de fret | Aucune tonne de cargo garantie par ce chiffre — la soute dépend des Cargo Racks installés | Vérifier la capacité réelle en Cargo Rack dans le panneau du vaisseau, pas la masse de coque |
| Viser un Federal Corvette ou un Imperial Cutter sans le rang requis | Achat bloqué faute de rang Rear Admiral (Fédération) ou Duke (Empire) | Vérifier son rang de marine avant de viser ces vaisseaux (voir [29-missions-reputation-et-rangs.md §3](./29-missions-reputation-et-rangs.md)) |
| Décoller sans avoir vérifié le coût de rebuy | Vaisseau perdu et rebuy à payer sans réserve en cas de destruction | Vérifier le rebuy affiché au panneau du vaisseau avant chaque sortie risquée |
| Changer de vaisseau sans utiliser le transfert de flotte | Perte de temps ou frais de transfert mal anticipés (≈ 0,00006 × valeur totale × distance + 0,0002 × valeur totale + 1 000 Cr) | Calculer le coût de transfert avant de décider entre acheter neuf et faire venir un vaisseau déjà possédé |

## Questions fréquentes

**Combien y a-t-il de vaisseaux jouables dans Elite Dangerous ?**
Le jeu compte **48 vaisseaux de chantier naval** (*shipyard*), répartis en trois gabarits (Small, Medium, Large) et
produits par six constructeurs (Faulcon DeLacy, Core Dynamics, Gutamaya, Lakon Spaceways, Saud Kruger, Zorgon
Peterson). Ce chiffre exclut les SRV, les chasseurs embarqués (SLF) et le Nomad (SLV), qui relèvent d'autres
catégories de véhicules. Voir
[Vue d'ensemble](#vue-densemble--48-vaisseaux-de-chantier-naval-six-constructeurs-trois-gabarits).

**Quel est le vaisseau le moins cher pour débuter (starter ship) ?**
Le Sidewinder Mk I, à 32 000 Cr chez Faulcon DeLacy, avec une portée de saut stock de 9,2 al ; c'est le vaisseau de
départ classique du jeu. Le Hauler (52 720 Cr) et l'Eagle Mk II (44 800 Cr) suivent parmi les moins chers. Voir le
[tableau complet des prix](#tableau-complet-des-48-vaisseaux--prix-portée-de-saut-hardpoints-et-emplacements).

**Quel vaisseau a la meilleure portée de saut (jump range) en configuration stock ?**
Le Type-8 Transporter, avec ≈ 24,1 al stock (≈ 36,2 al en repère d'ingénierie G5) — la meilleure portée de toute la
flotte, qui s'étend de 6,7 al à 24,1 al. Le Mandalay (≈ 22,0 al) domine le segment Medium et le Caspian Explorer
(≈ 20,9 al) le segment Large. Voir le
[tableau complet des prix et portées](#tableau-complet-des-48-vaisseaux--prix-portée-de-saut-hardpoints-et-emplacements).

**Combien coûte réellement un Anaconda entièrement équipé, rebuy compris ?**
Rien qu'en *core internals* de qualité A (sans arme ni bouclier), le budget grimpe à ≈ 387 M Cr contre 147 M Cr pour
la seule coque, soit 2,6 fois le prix affiché au chantier naval. Le rebuy (coût de remplacement en cas de
destruction, environ 5 % de la valeur assurée) s'élève alors à ≈ 19,4 M Cr. Voir
[Le coût réel d'un vaisseau équipé](#le-coût-réel-dun-vaisseau-équipé-rebuy-inclus).

**Quels vaisseaux demandent un rang de réputation (rank) pour être achetés ?**
Sept vaisseaux : côté Fédération, Federal Dropship (Midshipman), Federal Assault Ship (Chief Petty Officer), Federal
Gunship (Ensign) et Federal Corvette (Rear Admiral) ; côté Empire, Imperial Courier (Master), Imperial Clipper
(Baron) et Imperial Cutter (Duke). L'Imperial Eagle et toute la gamme Alliance ne demandent aucun rang. Voir
[Rangs de réputation requis](#rangs-de-réputation-requis--les-sept-vaisseaux-fédération-et-empire-sous-condition-de-rang).

**Quels vaisseaux ont le Supercruise Overcharge (SCO) d'origine ?**
Le SCO est un mode utilisable par tout FSD standard depuis les Updates 18.02/18.04, mais huit vaisseaux sont livrés
d'origine avec un FSD (SCO) dédié : Python Mk II, Type-8 Transporter, Mandalay, Caspian Explorer, Cobra Mk V,
Corsair, Panther Clipper Mk II et Type-11 Prospector. Voir
[Le Supercruise Overcharge (SCO)](#le-supercruise-overcharge-sco--disponible-sur-tout-fsd-pas-réservé-à-huit-vaisseaux).

**Quels vaisseaux peuvent embarquer un chasseur (fighter bay / Vessel Hangar) ?**
36 vaisseaux sur 48 (35 des 47 vaisseaux référencés par EDCD, plus le Lynx Highliner) ont un emplacement optionnel
assez grand — classe 5 minimum — pour un Vessel Hangar (ex-Fighter Hangar) ; le Vulture, malgré son faible tonnage,
en fait partie avec 1 baie. Voir [Chasseurs embarqués](#chasseurs-embarqués-ship-launched-fighters).

**C'est quoi le Nomad et comment l'obtenir ?**
Le Nomad est le premier vaisseau embarqué (*ship-launched vessel*, SLV) du jeu, sorti le 30 juin 2026. Ce n'est pas
un vaisseau de chantier naval : il ne s'achète qu'en ARX (formules Standard 16 520 ARX, Stellar 33 000 ARX, Galactic
60 000 ARX) et sert à l'exploration de surfaces planétaires. Voir
[Le cas du Nomad](#le-cas-du-nomad--vaisseau-embarqué-slv-absent-des-catalogues-de-chantier-naval).

**Quel est le vaisseau le plus gros ou le plus cher du jeu ?**
Le Panther Clipper Mk II, à 301 348 585 Cr, avec une masse de coque de 1 200 t (à égalité avec le Type-10 Defender) ;
c'est le plus gros transporteur non-capital du jeu. Voir
[Les extrêmes du chantier naval](#les-extrêmes-du-chantier-naval-lus-dans-ces-deux-tableaux).

**Quel vaisseau choisir pour miner (mining ship) ?**
Le Type-11 Prospector est le seul vaisseau conçu nativement pour le minage : 6 emplacements internes dont trois de
classe 6, FSD (SCO) d'origine. Le Type-9 Heavy et le Type-10 Defender restent des alternatives capables mais moins
spécialisées. Voir
[Vaisseaux de minage](#vaisseaux-de-minage-type-11-prospector-type-9-heavy-type-10-defender).

**Combien coûte un transfert de vaisseau entre deux stations, et combien de temps ça prend ?**
Coût indicatif ≈ (0,00006 × valeur totale × distance en al) + (0,0002 × valeur totale) + 1 000 Cr ; délai ≈ 300
secondes + 10 secondes par année-lumière. Un transfert bulle → Colonia (≈ 22 000 al) prend ainsi environ 61 heures,
et chaque station stocke gratuitement jusqu'à 40 vaisseaux. Voir
[Gestion de flotte](#gestion-de-flotte--transférer-et-stocker-un-vaisseau).

**Quel vaisseau acheter selon mon rôle et mon budget ?**
Le guide croise quatre paliers de budget (< 5 M Cr, 5-50 M Cr, 50-300 M Cr, > 300 M Cr) et six rôles (combat,
exploration, commerce/fret, transport de passagers, minage, multi-rôle) : par exemple en combat, le Viper Mk III
(≈ 0,37 M Cr équipé) pour débuter puis le Federal Corvette (≈ 489 M Cr, rang Rear Admiral requis) au sommet. Voir
[Matrice Rôle × Budget](#matrice-rôle--budget--quel-vaisseau-pour-quel-rôle-et-quel-budget).

## Voir aussi

- [Équipements et modules](./04-equipements.md) — détail des modules installés dans les emplacements listés ci-dessus.
- [Les ingénieurs](./06-ingenieurs.md) — comment améliorer concrètement la portée de saut, les boucliers, le blindage
  (blueprint *Increased Range*, effets expérimentaux…).
- [Combat spatial](./08-combat-spatial.md) — mise en œuvre des hardpoints et des chasseurs embarqués en combat.
- [Exploration](./10-exploration.md) — choix de vaisseau et configuration pour l'exploration longue distance.
- [Commerce](./11-commerce.md) et [Transport](./12-transport.md) — vaisseaux cargo et de passagers en usage.
- [Le Rhino et le Nomad](./14-rhino.md) — fiche complète du Nomad (premier SLV du jeu, 30 juin 2026), du SRV Rhino de
  Vodel (2 septembre 2026), et comparatif Scarab/Scorpion/Rhino.
- [Opérations](./13-operations.md) — le mode d'escouade sorti le 1ᵉʳ juillet 2026, avec lequel le Nomad a été livré.
- [La Colonisation](./18-colonisation.md) — rôle du Type-8, Type-9 et Type-11 Prospector dans l'économie de
  colonisation.
- [Le Minage](./20-minage.md) — vaisseaux et équipements miniers en détail.
- [Combat anti-Thargoïde (AX)](./25-combat-ax.md) — vaisseaux et configurations adaptés au combat AX.
- [Débuter et progresser](./27-debuter-et-progresser.md) — dans quel ordre franchir les paliers de vaisseau quand on
  démarre (Sidewinder Mk I, puis un spécialisé bon marché, puis un premier multirôle) et quels rangs viser pour
  débloquer les châssis Fédération/Empire listés ci-dessus.
- [Pilotage, navigation et stations](./31-pilotage-navigation-et-stations.md) — accostage, tailles de pad par
  vaisseau, et logistique de flotte vue côté modules.
- [Carte des boucles de gameplay](./00-boucles-de-gameplay.md) — matrice Rôle × Budget reprise dans la carte
  transversale, et parcours-types chiffrés (0 → 100 M Cr → 1 Md Cr → Porte-Vaisseau) qui s'appuient sur le coût réel
  d'un vaisseau équipé documenté ci-dessus.

## Sources

- https://inara.cz/elite/ships/
- https://inara.cz/elite/ship/29/
- https://inara.cz/elite/ship/7/
- https://inara.cz/elite/ship/86/ (Caspian Explorer)
- https://inara.cz/elite/ship/87/
- https://inara.cz/elite/ship/68/
- https://inara.cz/elite/ship/67/
- https://inara.cz/elite/ship/44/
- https://inara.cz/elite/ship/41/
- https://inara.cz/elite/ship/61/
- https://inara.cz/elite/ship/85/ (Panther Clipper Mk II)
- https://inara.cz/elite/ship/88/
- https://inara.cz/elite/ship/80/ (Federal Corvette — rang requis)
- https://inara.cz/elite/ship/75/ (Imperial Cutter — rang requis)
- https://inara.cz/elite/ship/52/ (Federal Gunship — rang requis)
- https://inara.cz/elite/ship/45/ (Imperial Clipper — rang requis)
- https://inara.cz/elite/ship/50/ (Federal Dropship — rang requis)
- https://inara.cz/elite/ship/51/ (Federal Assault Ship — rang requis)
- https://inara.cz/elite/ship/32/ (Imperial Courier — rang requis)
- https://inara.cz/elite/ship/48/, /49/, /47/ (Alliance Chieftain/Challenger/Crusader — absence de rang requis vérifiée)
- https://inara.cz/elite/ship/6/ (Imperial Eagle — absence de rang requis vérifiée)
- https://github.com/EDCD/coriolis-data (`ships/*.json`, `modules/standard/*.json`, `modules/internal/fighter_hangar.json`,
  `modifications/blueprints.json`) — les tableaux « Caractéristiques chiffrées » sont établis sur le commit
  `0db9234b5b9ce8c939ea84133d7ce336eea88e27`, ce qui les rend re-vérifiables ligne à ligne.
- https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=359320 — flux Steam News officiel d'Elite Dangerous,
  qui republie verbatim les annonces de Frontier (relevé du 9 septembre 2026). Billets cités dans ce guide :
  « Elite Dangerous | Kestrel Mk. II Update » (24 février 2026 12:21 UTC), « Elite Dangerous | An Update on
  Operations » (22 avril 2026 14:02 UTC — spécification technique du Lynx Highliner), « Elite Dangerous | Lynx
  Highliner Update Notes » (28 avril 2026 13:11 UTC), « Discover the Nomad » (2 juin 2026 13:03 UTC), « Elite
  Dangerous | Operations Update » (1ᵉʳ juillet 2026 14:01 UTC — Nomad, Mk I/Mk II Vessel Bay), « Elite Dangerous |
  Operations Update | Update 3 » (9 juillet 2026 10:24 UTC), « Elite Dangerous | Rhino SRV Update » (2 septembre 2026
  11:20 UTC).
- https://github.com/EDCD/FDevIDs (`outfitting.csv` — renommage « Vessel Hangar » / « Mk II Vessel Hangar », commit du
  3 juillet 2026 ; `shipyard.csv` — catalogue de chantier naval, hors SRV/SLF/SLV) — relevé sur le commit
  `c35612952dd6a547d1a7ac4cffab9c7051e86579`.
- https://github.com/EDCD/EDDI/issues/2849 (journal brut : `SRVType` « lander01 » / `SRVType_Localised` « Nomad »,
  `gameversion` 4.4.0.3 — corroboration communautaire)
- https://en.wikipedia.org/wiki/Elite_Dangerous
