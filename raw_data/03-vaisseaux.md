# Liste complète des vaisseaux d'Elite Dangerous

*Guide de référence — prix : Inara.cz, instantané daté du 9 septembre 2026 (les prix affichés par Inara fluctuent
légèrement dans le temps et doivent être revérifiés avant tout achat important). Emplacements, hardpoints et portée de
saut : jeu de données communautaire [EDCD/coriolis-data](https://github.com/EDCD/coriolis-data) (fichiers `ships/*.json`
et `modules/standard/*.json`), même instantané.*

> **Disclaimer stats** — Les valeurs chiffrées de ce guide (portée de saut, hardpoints, emplacements internes,
> vitesse, blindage, boucliers…) sont données en **configuration stock** (composants d'origine, sans fret). L'ingénierie
> (voir [Les ingénieurs](./06-ingenieurs.md)) peut les modifier significativement — parfois du simple au double pour la
> portée de saut.

## Vue d'ensemble

Elite Dangerous propose actuellement **48 vaisseaux** jouables recensés dans les tableaux ci-dessous (source :
Inara.cz), répartis en trois gabarits de plateforme d'atterrissage (**Small**, **Medium**, **Large**) et produits par
six constructeurs principaux : **Faulcon DeLacy**, **Core Dynamics**, **Gutamaya**, **Lakon Spaceways**, **Saud
Kruger** et **Zorgon Peterson**. Le jeu de données communautaire EDCD/coriolis-data, utilisé plus bas pour les
emplacements et hardpoints, référençait 47 de ces 48 vaisseaux à la date de rédaction — le **Lynx Highliner**, le plus
récent, n'y figurait pas encore (voir la note dans le tableau dédié).

Parmi ces 48, sept sont soumis à une **condition de rang de réputation** en plus de leur prix en crédits : **Imperial
Courier, Imperial Clipper, Imperial Cutter** (rang Empire), et **Federal Dropship, Federal Assault Ship, Federal
Gunship, Federal Corvette** (rang Fédération) — voir le tableau dédié plus bas. **Contrairement à une confusion
répandue, l'Imperial Eagle et les trois vaisseaux de la gamme Alliance (Chieftain, Crusader, Challenger) ne demandent
aucun rang** : ils s'achètent avec des crédits, comme n'importe quel autre vaisseau.

### Le Supercruise Overcharge (SCO) : disponible sur tout FSD, pas réservé à huit vaisseaux

Le **Supercruise Overcharge** (SCO — voir [glossaire](./00-glossaire.md)) est un **mode d'utilisation du FSD**, pas un
module à part : depuis la mise à jour **Update 17** (2024), n'importe quel vaisseau équipé d'un FSD standard peut
l'activer en supercroisière pour une accélération temporaire, au prix d'une accumulation de chaleur plus rapide.

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
vaisseaux les plus récents ne sont, au lancement, disponibles qu'en ARX. Dates de sortie confirmées pour certains
d'entre eux : Mandalay — 31 octobre 2024 (extension *Ascendancy*, Powerplay 2.0) ; Panther Clipper Mk II — 22 juillet
2025 (accès anticipé ARX) ; Caspian Explorer — 2 décembre 2025 (accès anticipé ARX) ; Kestrel Mk II — 24 février 2026
(date de sortie en jeu la plus probable, corroborée indirectement par un commit EDCD daté du 25 février 2026, mais non
confirmée par une annonce GalNet directe).

## Les constructeurs

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

## Tableau complet des vaisseaux et de leurs prix

Colonnes : **Portée de saut** = portée stock (configuration d'origine, réservoir plein, sans fret), calculée à partir
de la masse de coque et des composants standards par défaut d'EDCD/coriolis-data via la formule officielle de saut
FSD, suivie entre parenthèses d'un repère d'ingénierie **« G5 »** = portée stock × 1,5 (bonus moyen de masse optimale
du plan FSD *Increased Range* grade 5, +45 % à +55 % selon tirage d'après `modifications/blueprints.json`
d'EDCD/coriolis-data ; l'effet expérimental *Mass Manager* n'est pas inclus et améliore encore la portée réelle — voir
[Les ingénieurs](./06-ingenieurs.md)). **Hardpoints** inclut les emplacements utilitaires. **al** = années-lumière.

### Petits vaisseaux (plateforme Small)

| Vaisseau | Fabricant | Prix | Portée de saut | Hardpoints | Emplacements internes | Source | Date |
|---|---|---|---|---|---|---|---|
| Sidewinder Mk I | Faulcon DeLacy | 32 000 Cr | 9,2 al (≈13,8 G5) | 2 Small + 2 util. | 2×2 + 4×1 | Inara + EDCD | 9 sept. 2026 |
| Eagle Mk II | Core Dynamics | 44 800 Cr | 9,7 al (≈14,6 G5) | 3 Small + 1 util. | 1×3 + 1×2 + 4×1 | Inara + EDCD | 9 sept. 2026 |
| Hauler | Zorgon Peterson | 52 720 Cr | 12,1 al (≈18,1 G5) | 1 Small + 2 util. | 2×3 + 1×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Adder | Zorgon Peterson | 87 810 Cr | 10,6 al (≈15,9 G5) | 1 Medium + 2 Small + 2 util. | 2×3 + 2×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Imperial Eagle | Gutamaya | 110 830 Cr | 9,4 al (≈14,1 G5) | 1 Medium + 2 Small + 1 util. | 1×3 + 1×2 + 4×1 | Inara + EDCD | 9 sept. 2026 |
| Viper Mk III | Faulcon DeLacy | 142 930 Cr | 8,7 al (≈13,0 G5) | 2 Medium + 2 Small + 2 util. | 2×3 + 1×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Viper Mk IV | Faulcon DeLacy | 437 930 Cr | 10,8 al (≈16,2 G5) | 2 Medium + 2 Small + 2 util. | 2×4 + 1×3 + 2×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Cobra Mk III | Faulcon DeLacy | 349 720 Cr | 11,2 al (≈16,7 G5) | 2 Medium + 2 Small + 2 util. | 3×4 + 3×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Diamondback Scout | Lakon Spaceways | 564 330 Cr | 11,9 al (≈17,9 G5) | 2 Medium + 2 Small + 4 util. | 3×3 + 1×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Cobra Mk IV | Faulcon DeLacy | 764 720 Cr | 9,9 al (≈14,9 G5) | 2 Medium + 3 Small + 2 util. | 4×4 + 2×3 + 2×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Dolphin | Saud Kruger | 1 337 320 Cr | 12,4 al (≈18,7 G5) | 2 Small + 3 util. | 1×5 + 2×4 + 1×3 + 3×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Diamondback Explorer | Lakon Spaceways | 1 894 760 Cr | 16,3 al (≈24,5 G5) | 1 Large + 2 Medium + 4 util. | 2×4 + 2×3 + 2×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Cobra Mk V *(nouveau)* | Faulcon DeLacy | 1 989 460 Cr | 17,9 al (≈26,8 G5) | 3 Medium + 2 Small + 4 util. | 1×5 + 3×4 + 3×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Imperial Courier | Gutamaya | 2 542 930 Cr | 9,9 al (≈14,8 G5) | 3 Medium + 4 util. | 2×3 + 3×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Asp Scout | Lakon Spaceways | 3 961 160 Cr | 12,2 al (≈18,3 G5) | 2 Medium + 2 Small + 2 util. | 1×5 + 1×4 + 2×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Vulture | Core Dynamics | 4 925 620 Cr | 8,6 al (≈12,9 G5) | 2 Large + 4 util. | 1×5 + 1×4 + 1×2 + 4×1 | Inara + EDCD | 9 sept. 2026 |
| Kestrel Mk II *(nouveau)* | Core Dynamics | 14 273 820 Cr | 13,8 al (≈20,7 G5) | 3 Large + 2 Small + 4 util. | 1×5 + 1×4 + 1×3 + 3×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |

### Vaisseaux moyens (plateforme Medium)

| Vaisseau | Fabricant | Prix | Portée de saut | Hardpoints | Emplacements internes | Source | Date |
|---|---|---|---|---|---|---|---|
| Type-6 Transporter | Lakon Spaceways | 1 045 950 Cr | 13,1 al (≈19,6 G5) | 2 Small + 3 util. | 2×5 + 2×4 + 1×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Keelback | Lakon Spaceways | 3 126 150 Cr | 11,4 al (≈17,2 G5) | 2 Medium + 2 Small + 3 util. | 2×5 + 1×4 + 1×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Mandalay *(nouveau)* | Zorgon Peterson | 17 639 220 Cr | 22,0 al (≈33,0 G5) | 4 Medium + 2 Small + 4 util. | 1×6 + 1×5 + 2×4 + 2×3 + 1×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Federal Dropship | Core Dynamics | 14 314 210 Cr | 7,5 al (≈11,2 G5) | 1 Large + 4 Medium + 4 util. | 1×6 + 2×5 + 1×4 + 2×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Alliance Chieftain | Lakon Spaceways | 19 382 250 Cr | 9,8 al (≈14,7 G5) | 2 Large + 1 Medium + 3 Small + 4 util. | 1×6 + 1×5 + 1×4 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Federal Assault Ship | Core Dynamics | 19 814 210 Cr | 8,6 al (≈12,9 G5) | 2 Large + 2 Medium + 4 util. | 2×5 + 1×4 + 1×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Alliance Crusader | Lakon Spaceways | 22 866 340 Cr | 8,4 al (≈12,6 G5) | 1 Large + 2 Medium + 3 Small + 4 util. | 1×6 + 1×5 + 2×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Asp Explorer | Lakon Spaceways | 6 661 160 Cr | 13,9 al (≈20,9 G5) | 2 Medium + 4 Small + 4 util. | 1×6 + 1×5 + 3×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Alliance Challenger | Lakon Spaceways | 30 472 250 Cr | 9,0 al (≈13,5 G5) | 1 Large + 3 Medium + 3 Small + 4 util. | 2×6 + 2×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Federal Gunship | Core Dynamics | 35 814 210 Cr | 7,0 al (≈10,6 G5) | 1 Large + 4 Medium + 2 Small + 4 util. | 2×6 + 1×5 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Krait Phantom | Faulcon DeLacy | 37 472 250 Cr | 10,0 al (≈15,1 G5) | 2 Large + 2 Medium + 4 util. | 1×6 + 3×5 + 3×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Type-8 Transporter *(nouveau)* | Lakon Spaceways | 38 453 970 Cr | 24,1 al (≈36,1 G5) | 1 Medium + 5 Small + 4 util. | 1×7 + 3×6 + 2×5 + 1×4 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Krait Mk II | Faulcon DeLacy | 45 814 210 Cr | 9,2 al (≈13,9 G5) | 3 Large + 2 Medium + 4 util. | 2×6 + 2×5 + 1×4 + 2×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Fer-de-Lance | Zorgon Peterson | 51 567 040 Cr | 7,3 al (≈11,0 G5) | 1 Huge + 4 Medium + 6 util. | 1×5 + 2×4 + 1×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Mamba | Zorgon Peterson | 55 867 040 Cr | 6,9 al (≈10,4 G5) | 1 Huge + 2 Large + 2 Small + 6 util. | 1×5 + 1×4 + 1×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Python | Faulcon DeLacy | 56 978 180 Cr | 8,8 al (≈13,2 G5) | 3 Large + 2 Medium + 4 util. | 3×6 + 2×5 + 1×4 + 2×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Python Mk II *(nouveau)* | Faulcon DeLacy | 67 527 360 Cr | 19,4 al (≈29,1 G5) | 4 Large + 2 Medium + 6 util. | 1×6 + 1×4 + 1×3 + 1×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Type-11 Prospector *(nouveau)* | Lakon Spaceways | 67 861 850 Cr | 15,7 al (≈23,5 G5) | 1 Medium + 3 Small + 4 util. | 3×6 + 2×5 + 1×4 + 1×3 + 1×2 + 2×1 | Inara + EDCD | 9 sept. 2026 |
| Lynx Highliner *(nouveau)* | Zorgon Peterson | 69 289 470 Cr | *non disponible dans EDCD/coriolis-data au 9 sept. 2026* | *non disponible* | *non disponible* | Inara | 9 sept. 2026 |
| Corsair *(nouveau)* | Gutamaya | 79 304 750 Cr | 13,5 al (≈20,2 G5) | 3 Large + 3 Medium + 4 util. | 3×6 + 3×5 + 1×4 + 1×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |

### Grands vaisseaux (plateforme Large)

| Vaisseau | Fabricant | Prix | Portée de saut | Hardpoints | Emplacements internes | Source | Date |
|---|---|---|---|---|---|---|---|
| Type-7 Transporter | Lakon Spaceways | 17 472 250 Cr | 12,7 al (≈19,1 G5) | 4 Small + 4 util. | 3×6 + 3×5 + 2×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Imperial Clipper | Gutamaya | 22 295 860 Cr | 9,6 al (≈14,5 G5) | 2 Large + 2 Medium + 4 util. | 1×7 + 1×6 + 2×4 + 2×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Orca | Saud Kruger | 48 539 890 Cr | 12,2 al (≈18,3 G5) | 1 Large + 2 Medium + 4 util. | 1×6 + 3×5 + 1×4 + 1×3 + 2×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Type-9 Heavy | Lakon Spaceways | 76 555 840 Cr | 9,0 al (≈13,5 G5) | 3 Medium + 2 Small + 4 util. | 2×8 + 1×7 + 1×6 + 1×5 + 2×4 + 2×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Beluga Liner | Saud Kruger | 84 532 760 Cr | 10,8 al (≈16,2 G5) | 5 Medium + 6 util. | 4×6 + 2×5 + 1×4 + 4×3 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Type-10 Defender | Lakon Spaceways | 124 755 340 Cr | 6,7 al (≈10,1 G5) | 4 Large + 3 Medium + 2 Small + 8 util. | 1×8 + 1×7 + 1×6 + 1×5 + 2×4 + 2×3 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Anaconda | Faulcon DeLacy | 146 969 450 Cr | 9,8 al (≈14,7 G5) | 1 Huge + 3 Large + 2 Medium + 2 Small + 8 util. | 1×7 + 3×6 + 3×5 + 3×4 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Federal Corvette | Core Dynamics | 187 969 450 Cr | 6,7 al (≈10,0 G5) | 2 Huge + 1 Large + 2 Medium + 2 Small + 8 util. | 3×7 + 2×6 + 2×5 + 2×4 + 1×3 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Caspian Explorer *(nouveau)* | Zorgon Peterson | 194 861 290 Cr | 20,9 al (≈31,4 G5) | 1 Large + 6 Medium + 6 util. | 1×7 + 2×6 + 4×5 + 2×4 + 1×3 + 1×2 + 3×1 | Inara + EDCD | 9 sept. 2026 |
| Imperial Cutter | Gutamaya | 208 969 450 Cr | 9,0 al (≈13,4 G5) | 1 Huge + 2 Large + 4 Medium + 8 util. | 2×8 + 3×6 + 2×5 + 1×4 + 1×3 + 1×1 | Inara + EDCD | 9 sept. 2026 |
| Panther Clipper Mk II *(nouveau)* | Zorgon Peterson | 301 348 585 Cr | 12,3 al (≈18,4 G5) | 2 Large + 4 Medium + 4 Small + 6 util. | 1×8 + 1×7 + 3×6 + 2×5 + 1×4 + 1×2 + 1×1 | Inara + EDCD | 9 sept. 2026 |

## Emplacements et hardpoints — tableau de référence

Table dédiée, alphabétique, sourcée intégralement sur **EDCD/coriolis-data** (`ships/*.json`), pour consultation rapide
indépendamment du prix. Le nombre entre les tailles d'emplacements internes est le compte (ex. « 3×6 » = trois
emplacements optionnels de classe 6). « Chasseur embarqué » indique si le plus grand emplacement optionnel du vaisseau
est assez grand pour un Fighter Hangar (classe 5 minimum) — détail dans la section dédiée ci-dessous.

| Vaisseau | Plateforme | Hardpoints | Emplacements internes | Chasseur embarqué |
|---|---|---|---|---|
| Adder | Small | 1 Medium + 2 Small + 2 util. | 2×3 + 2×2 + 3×1 | Non |
| Alliance Challenger | Medium | 1 Large + 3 Medium + 3 Small + 4 util. | 2×6 + 2×3 + 2×2 + 1×1 | Oui (2 baies) |
| Alliance Chieftain | Medium | 2 Large + 1 Medium + 3 Small + 4 util. | 1×6 + 1×5 + 1×4 + 2×2 + 1×1 | Oui (2 baies) |
| Alliance Crusader | Medium | 1 Large + 2 Medium + 3 Small + 4 util. | 1×6 + 1×5 + 2×3 + 2×2 + 1×1 | Oui (2 baies) |
| Anaconda | Large | 1 Huge + 3 Large + 2 Medium + 2 Small + 8 util. | 1×7 + 3×6 + 3×5 + 3×4 + 1×2 + 1×1 | Oui (2 baies) |
| Asp Explorer | Medium | 2 Medium + 4 Small + 4 util. | 1×6 + 1×5 + 3×3 + 2×2 + 1×1 | Oui (2 baies) |
| Asp Scout | Medium | 2 Medium + 2 Small + 2 util. | 1×5 + 1×4 + 2×3 + 2×2 + 1×1 | Oui (1 baie) |
| Beluga Liner | Large | 5 Medium + 6 util. | 4×6 + 2×5 + 1×4 + 4×3 + 1×1 | Oui (2 baies) |
| Caspian Explorer | Large | 1 Large + 6 Medium + 6 util. | 1×7 + 2×6 + 4×5 + 2×4 + 1×3 + 1×2 + 3×1 | Oui (2 baies) |
| Cobra Mk III | Small | 2 Medium + 2 Small + 2 util. | 3×4 + 3×2 + 2×1 | Non |
| Cobra Mk IV | Small | 2 Medium + 3 Small + 2 util. | 4×4 + 2×3 + 2×2 + 2×1 | Non |
| Cobra Mk V | Small | 3 Medium + 2 Small + 4 util. | 1×5 + 3×4 + 3×3 + 1×2 + 1×1 | Oui (1 baie) |
| Corsair | Medium | 3 Large + 3 Medium + 4 util. | 3×6 + 3×5 + 1×4 + 1×3 + 1×2 + 1×1 | Oui (2 baies) |
| Diamondback Explorer | Small | 1 Large + 2 Medium + 4 util. | 2×4 + 2×3 + 2×2 + 2×1 | Non |
| Diamondback Scout | Small | 2 Medium + 2 Small + 4 util. | 3×3 + 1×2 + 2×1 | Non |
| Dolphin | Small | 2 Small + 3 util. | 1×5 + 2×4 + 1×3 + 3×2 + 2×1 | Oui (1 baie) |
| Eagle Mk II | Small | 3 Small + 1 util. | 1×3 + 1×2 + 4×1 | Non |
| Federal Assault Ship | Medium | 2 Large + 2 Medium + 4 util. | 2×5 + 1×4 + 1×3 + 2×2 + 1×1 | Oui (1 baie) |
| Federal Corvette | Large | 2 Huge + 1 Large + 2 Medium + 2 Small + 8 util. | 3×7 + 2×6 + 2×5 + 2×4 + 1×3 + 1×1 | Oui (2 baies) |
| Federal Dropship | Medium | 1 Large + 4 Medium + 4 util. | 1×6 + 2×5 + 1×4 + 2×3 + 1×2 + 1×1 | Oui (2 baies) |
| Federal Gunship | Medium | 1 Large + 4 Medium + 2 Small + 4 util. | 2×6 + 1×5 + 2×2 + 1×1 | Oui (2 baies) |
| Fer-de-Lance | Medium | 1 Huge + 4 Medium + 6 util. | 1×5 + 2×4 + 1×2 + 2×1 | Oui (1 baie) |
| Hauler | Small | 1 Small + 2 util. | 2×3 + 1×2 + 3×1 | Non |
| Imperial Clipper | Large | 2 Large + 2 Medium + 4 util. | 1×7 + 1×6 + 2×4 + 2×3 + 2×2 + 1×1 | Oui (2 baies) |
| Imperial Courier | Small | 3 Medium + 4 util. | 2×3 + 3×2 + 3×1 | Non |
| Imperial Cutter | Large | 1 Huge + 2 Large + 4 Medium + 8 util. | 2×8 + 3×6 + 2×5 + 1×4 + 1×3 + 1×1 | Oui (2 baies) |
| Imperial Eagle | Small | 1 Medium + 2 Small + 1 util. | 1×3 + 1×2 + 4×1 | Non |
| Keelback | Medium | 2 Medium + 2 Small + 3 util. | 2×5 + 1×4 + 1×3 + 2×2 + 1×1 | Oui (1 baie) |
| Kestrel Mk II | Small | 3 Large + 2 Small + 4 util. | 1×5 + 1×4 + 1×3 + 3×2 + 1×1 | Oui (1 baie) |
| Krait Mk II | Medium | 3 Large + 2 Medium + 4 util. | 2×6 + 2×5 + 1×4 + 2×3 + 1×2 + 1×1 | Oui (2 baies) |
| Krait Phantom | Medium | 2 Large + 2 Medium + 4 util. | 1×6 + 3×5 + 3×3 + 1×2 + 1×1 | Oui (2 baies) |
| **Lynx Highliner** | Medium | *non disponible dans EDCD/coriolis-data au 9 sept. 2026* | *non disponible* | *non disponible* |
| Mamba | Medium | 1 Huge + 2 Large + 2 Small + 6 util. | 1×5 + 1×4 + 1×3 + 2×2 + 1×1 | Oui (1 baie) |
| Mandalay | Medium | 4 Medium + 2 Small + 4 util. | 1×6 + 1×5 + 2×4 + 2×3 + 1×2 + 3×1 | Oui (2 baies) |
| Orca | Large | 1 Large + 2 Medium + 4 util. | 1×6 + 3×5 + 1×4 + 1×3 + 2×2 + 1×1 | Oui (2 baies) |
| Panther Clipper Mk II | Large | 2 Large + 4 Medium + 4 Small + 6 util. | 1×8 + 1×7 + 3×6 + 2×5 + 1×4 + 1×2 + 1×1 | Oui (2 baies) |
| Python | Medium | 3 Large + 2 Medium + 4 util. | 3×6 + 2×5 + 1×4 + 2×3 + 1×2 + 1×1 | Oui (2 baies) |
| Python Mk II | Medium | 4 Large + 2 Medium + 6 util. | 1×6 + 1×4 + 1×3 + 1×2 + 2×1 | Oui (2 baies) |
| Sidewinder Mk I | Small | 2 Small + 2 util. | 2×2 + 4×1 | Non |
| Type-10 Defender | Large | 4 Large + 3 Medium + 2 Small + 8 util. | 1×8 + 1×7 + 1×6 + 1×5 + 2×4 + 2×3 + 1×2 + 1×1 | Oui (2 baies) |
| Type-11 Prospector | Medium | 1 Medium + 3 Small + 4 util. | 3×6 + 2×5 + 1×4 + 1×3 + 1×2 + 2×1 | Oui (2 baies) |
| Type-6 Transporter | Medium | 2 Small + 3 util. | 2×5 + 2×4 + 1×3 + 2×2 + 1×1 | Oui (1 baie) |
| Type-7 Transporter | Large | 4 Small + 4 util. | 3×6 + 3×5 + 2×3 + 1×2 + 1×1 | Oui (2 baies) |
| Type-8 Transporter | Medium | 1 Medium + 5 Small + 4 util. | 1×7 + 3×6 + 2×5 + 1×4 + 1×2 + 1×1 | Oui (2 baies) |
| Type-9 Heavy | Large | 3 Medium + 2 Small + 4 util. | 2×8 + 1×7 + 1×6 + 1×5 + 2×4 + 2×3 + 1×2 + 1×1 | Oui (2 baies) |
| Viper Mk III | Small | 2 Medium + 2 Small + 2 util. | 2×3 + 1×2 + 3×1 | Non |
| Viper Mk IV | Small | 2 Medium + 2 Small + 2 util. | 2×4 + 1×3 + 2×2 + 3×1 | Non |
| Vulture | Small | 2 Large + 4 util. | 1×5 + 1×4 + 1×2 + 4×1 | Oui (1 baie) |

**Corrections apportées par ce tableau par rapport à des estimations de mémoire courantes dans le corpus communautaire**
(vérifiées directement sur les données EDCD/coriolis-data) : le Python Mk II a en réalité **4 hardpoints larges + 2
moyens** (6 au total, et non « 3 larges + 2 moyens » comme parfois avancé) ; le Corsair a **3 larges + 3 moyens** (6,
non 5) ; le Cobra Mk V a **3 moyens + 2 petits et 4 emplacements utilitaires** (et non « pas d'emplacement
utilitaire ») ; le Panther Clipper Mk II a **2 larges + 4 moyens + 4 petits** (10 hardpoints, non 9) ; le Caspian
Explorer a **1 large + 6 moyens et 6 emplacements utilitaires** (bien plus armé qu'on ne le croit parfois, et non «
aucun point utilitaire ») ; le Mandalay a **4 emplacements utilitaires** (et non « aucun ») ; le Type-11 Prospector a
**1 moyen + 3 petits** (4 hardpoints, non 6). Le détail par vaisseau est repris dans les fiches ci-dessous.

## Rangs de réputation requis

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
Mk II, Type-11 Prospector, Kestrel Mk II, Lynx Highliner) n'introduit de nouvelle condition de rang à ce jour.

## Chasseurs embarqués (Ship-Launched Fighters)

Un chasseur embarqué (*Ship-Launched Fighter*, SLF) se loge dans un **Fighter Hangar**, module qui n'existe qu'en
classe 5 (1 baie), 6 ou 7 (2 baies chacun) d'après `modules/internal/fighter_hangar.json` d'EDCD/coriolis-data. Un
vaisseau peut donc embarquer un chasseur dès lors qu'il dispose d'**au moins un emplacement optionnel de classe 5 ou
plus** — la condition ne dépend pas de la taille globale du vaisseau (un Cobra Mk V ou un Vulture, tous deux « petits
», qualifient) mais uniquement de la taille de cet unique emplacement, qu'il faut alors lui sacrifier entièrement, en
plus de disposer d'un membre d'équipage (joueur ou PNJ) pour le piloter.

**35 vaisseaux sur 47** référencés dans EDCD/coriolis-data qualifient (Lynx Highliner non vérifiable, donnée absente) :

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

## Vaisseaux récents (2024-2026) — fiches détaillées

Les dix vaisseaux suivants ont été ajoutés depuis 2024, dans la foulée de l'extension Odyssey et de la guerre contre les
Thargoïdes. *(Voir le disclaimer stats en tête de guide : ces caractéristiques sont en configuration stock.)*

### Mandalay

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
  avancé — voir tableau « Emplacements et hardpoints »)
- **Prix :** 17 639 220 Cr — disponible en crédits (Odyssey) ou via ARX

### Corsair

- **Constructeur :** Gutamaya
- **Gabarit :** Moyen — 265 t
- **Rôle principal :** multi-rôle polyvalent conçu pour équipage multiple
- **Points forts :** 6 compartiments internes optionnels, capacité de fret importante, bonne vitesse en ligne droite
  (288 m/s, boost 366 m/s), très bonne agilité (116), profil équilibré dans tous les rôles, FSD (SCO) d'origine
- **Points faibles :** surclassé par les vaisseaux spécialisés dans chaque rôle pris individuellement
- **Caractéristiques :** équipage 2, bouclier de base 264 MJ, armure 486, mass-lock 17, hardpoints **3 larges + 3
  moyens (6 au total)** + 4 emplacements utilitaires (et non « 3 larges + 2 moyens » comme parfois avancé)
- **Prix :** 79 304 750 Cr — disponible en crédits (Odyssey), sans ARX requis

### Type-8 Transporter

- **Constructeur :** Lakon Spaceways
- **Gabarit :** Moyen — 400 t
- **Rôle principal :** cargo/commerce, positionné entre le Type-6/Keelback et les gros cargos ; voir aussi
  [Colonisation](./18-colonisation.md) pour son rôle logistique
- **Points forts :** vaste capacité de chargement (7 baies internes principales), meilleure portée de saut du segment
  Medium (≈ 24,1 al stock, ≈ 36,1 al en repère G5), gestion supérieure du FSD surchargé (SCO d'origine)
- **Points faibles :** agilité limitée (106), armement plus fourni qu'il n'y paraît en nombre (1 moyen + 5 petits, 6
  au total) mais chaque point reste de faible puissance de feu unitaire ; 4 emplacements utilitaires (et non « aucun
  point utilitaire » comme parfois avancé)
- **Caractéristiques :** vitesse 201 m/s (boost 342 m/s), bouclier 122 MJ, armure 792, équipage 1, mass-lock 18
- **Prix :** 38 453 970 Cr

### Python Mk II

- **Constructeur :** Faulcon DeLacy
- **Gabarit :** Moyen — 450 t
- **Rôle principal :** refonte de combat du Python, maniabilité et puissance de feu renforcées
- **Points forts :** **4 hardpoints larges + 2 moyens (6 au total, et non « 3 larges + 2 moyens »)** + 6 emplacements
  utilitaires, agilité supérieure (144), bouclier de base 316 MJ, armure 504, FSD (SCO) d'origine
- **Points faibles :** espace interne et capacité de fret réduits par rapport au Python original
- **Caractéristiques :** vitesse 261 m/s (boost 352 m/s), équipage 2, mass-lock 17, 6 compartiments internes optionnels
- **Prix :** 67 527 360 Cr

### Panther Clipper Mk II

- **Constructeur :** Zorgon Peterson
- **Gabarit :** Grand — 1200 t, le plus gros transporteur non-capital du jeu
- **Rôle principal :** transport de cargo lourd avec capacités défensives
- **Points forts :** capacité de fret maximale parmi les vaisseaux non-capitaux, nombreux hardpoints — **2 larges + 4
  moyens + 4 petits (10 au total, et non « 3 larges + 2 moyens + 4 petits »)** + 6 emplacements utilitaires, blindage
  très robuste (1116), FSD (SCO) d'origine
- **Points faibles :** maniabilité très limitée (agilité 46), mass-lock élevé (27)
- **Caractéristiques :** vitesse 182 m/s (boost 252 m/s), bouclier de base 245 MJ, équipage 4
- **Prix :** 301 348 585 Cr — disponible en crédits (Odyssey) ou via ARX, sorti en accès anticipé ARX le 22 juillet 2025

### Cobra Mk V

- **Constructeur :** Faulcon DeLacy
- **Gabarit :** Petit — 250 t
- **Rôle principal :** multi-rôle équilibré (exploration/commerce/combat), successeur spirituel des Cobra Mk III/IV
- **Points forts :** excellente maniabilité (agilité 198), vitesse respectable (294 m/s, boost 415 m/s), FSD (SCO)
  d'origine, bonne portée de saut pour un petit vaisseau (≈ 17,9 al stock, ≈ 26,8 al en repère G5)
- **Points faibles :** blindage modéré (324), capacité de fret limitée
- **Caractéristiques :** bouclier de base 235 MJ, équipage 3 (multi-équipage), réacteur/moteurs/FSD 4E, hardpoints
  **3 moyens + 2 petits (5 au total)** + **4 emplacements utilitaires** (et non « pas d'emplacement utilitaire » comme
  parfois avancé) ; assez d'espace optionnel (classe 5) pour un Fighter Hangar 1 baie
- **Prix :** 1 989 460 Cr

### Kestrel Mk II

- **Constructeur :** Core Dynamics
- **Gabarit :** Petit — 190 t
- **Sortie :** 24 février 2026 (date la plus probable, corroborée indirectement par un commit EDCD daté du lendemain ;
  non confirmée par une annonce GalNet directe à ce jour)
- **Rôle principal :** combat aérien rapide, interception, frappe rapide
- **Points forts :** vitesse exceptionnelle (278 m/s, boost 370 m/s), agilité supérieure (194), FSD (SCO) d'origine
- **Points faibles :** protection limitée (bouclier 338 MJ, armure 135), cargo minimal, pas de multi-équipage
- **Caractéristiques :** 3 hardpoints larges + 2 petits (5 au total) + 4 emplacements utilitaires, réacteur/moteurs 5E,
  FSD 4E, 5 compartiments internes ; assez d'espace optionnel (classe 5) pour un Fighter Hangar 1 baie
- **Prix :** 14 273 820 Cr — disponible en crédits (Odyssey) ou via ARX

### Caspian Explorer

- **Constructeur :** Zorgon Peterson
- **Gabarit :** Grand — 950 t
- **Sortie :** 2 décembre 2025, en accès anticipé ARX (révélé le 25 novembre 2025 lors du *November Dev Blog*)
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

### Lynx Highliner

- **Constructeur :** Zorgon Peterson (et non Saud Kruger, malgré une confusion fréquente — voir la section
  « Constructeurs » plus haut)
- **Gabarit :** Moyen — 260 t
- **Rôle principal :** paquebot de passagers
- **Points forts :** bonne capacité de cabines passagers, portée de saut correcte, défenses solides pour son rôle
  (bouclier 228 MJ, armure 630)
- **Points faibles :** armement limité (3 hardpoints, 2 lasers pulse), agilité modérée (97)
- **Caractéristiques :** vitesse 293 m/s (boost 360 m/s), équipage 2
- **Prix :** 69 289 470 Cr
- **Note méthodologique :** absent d'EDCD/coriolis-data à la date de rédaction (9 septembre 2026) — hardpoints détaillés,
  emplacements internes exacts et portée de saut calculée ne peuvent donc pas être vérifiés par la même méthode que le
  reste du guide ; les chiffres ci-dessus restent ceux d'Inara.cz, sans recoupement indépendant.

### Type-11 Prospector

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
(outfitting) ; le classement ci-dessous reflète leur rôle principal annoncé.

### Combat dédié

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

### Exploration

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

### Commerce / Fret

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
| Panther Clipper Mk II | Zorgon Peterson | Grand   | Capacité de fret maximale du jeu, 10 hardpoints  | Maniabilité très limitée           |

### Transport de passagers

| Vaisseau       | Constructeur    | Gabarit | Points forts                                   | Points faibles                     |
|----------------|-----------------|---------|--------------------------------------------------|-------------------------------------|
| Dolphin        | Saud Kruger     | Petit   | Compact, bonne portée, agile pour sa catégorie | Fragile, cargo limité              |
| Lynx Highliner | Zorgon Peterson | Moyen   | Bonne capacité de cabines, défenses correctes  | Armement limité                    |
| Orca           | Saud Kruger     | Grand   | Rapide, élégant, bonne portée                  | Combat faible, cargo réduit        |
| Beluga Liner   | Saud Kruger     | Grand   | Plus grande capacité de cabines du jeu         | Combat faible, taille peu maniable |

### Multi-rôle

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

### Minage

Voir [Le Minage](./20-minage.md) pour l'équipement minier détaillé (limpets, lasers miniers, raffineries) ; tableau de
sélection de vaisseau ci-dessous.

| Vaisseau                             | Constructeur                               | Gabarit               | Points forts                                                                                   | Points faibles                                  |
|--------------------------------------|--------------------------------------------|-----------------------|--------------------------------------------------------------------------------------------------|---------------------------------------------------|
| Type-11 Prospector                   | Lakon Spaceways                            | Moyen                 | Seul vaisseau conçu nativement pour le minage : fret exceptionnel (6 emplacements dont trois de classe 6), FSD (SCO) | Agilité limitée, seulement 4 hardpoints |
| Type-9 Heavy                         | Lakon Spaceways                            | Grand                 | Très grande capacité de soutes minières (en configuration adaptée)                             | Peu agile                                       |
| Type-10 Defender                     | Lakon Spaceways                            | Grand                 | Fret minier protégé                                                                            | Coûteux                                         |
| Python / Anaconda / Imperial Clipper | Faulcon DeLacy / Faulcon DeLacy / Gutamaya | Moyen / Grand / Grand | Polyvalents, capables en configuration minière                                                 | Non spécialisés, moins efficaces que le Type-11 |

## Le cas du Nomad

Le vaisseau **Nomad**, mentionné dans certaines communications récentes autour d'Elite Dangerous, ne figure pas dans la
liste des vaisseaux répertoriés sur Inara — liste quasi-exhaustive de 47 vaisseaux au 9 septembre 2026, de la
Sidewinder Mk I au Panther Clipper Mk II, incluant tous les ajouts récents comme Corsair, Python Mk II, Type-11
Prospector, Caspian Explorer, Kestrel Mk II, Lynx Highliner, Mandalay et Type-8 Transporter — ni dans
EDCD/coriolis-data, ni dans l'article Wikipédia consacré à Elite Dangerous ; une revérification en direct le 9
septembre 2026 confirme cette absence. Le guide **[14-rhino-nomad.md](./14-rhino-nomad.md)** — consacré au SRV Rhino
et au Nomad — rassemble ce qui circule à son sujet (chronologie d'annonce, contexte de la mise à jour « Operations »)
; s'y référer pour le détail. Aucune source fiable ne confirmant l'existence d'un vaisseau nommé « Nomad » ni d'un
mode multijoueur « Operations » aux dates avancées (fin juin 2024 ou 1ᵉʳ juillet 2026), il s'agit probablement d'une
fausse prémisse — confusion, fan-fiction, rumeur, faux leak, ou vaisseau d'un autre jeu/mod — plutôt que d'un vaisseau
réellement présent dans le jeu. Aucune date de sortie, aucun fabricant, aucun prix et aucune classification (SLV ou
autre) ne doivent être présentés comme des faits pour ce « vaisseau » dans le corpus.

## Le coût réel d'un vaisseau équipé (rebuy inclus)

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

## Notes sur la fiabilité des données

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
  individuelle que pour les dix vaisseaux ajoutés depuis 2024 ; le tableau « Emplacements et hardpoints » couvre en
  revanche les 47 vaisseaux disponibles dans EDCD/coriolis-data.
- Les rangs de réputation requis ont été relevés directement (citations exactes) sur les fiches individuelles Inara de
  chaque vaisseau, le 9 septembre 2026.
- Le **Vulture** est fabriqué par **Core Dynamics**, le **Corsair** par **Gutamaya** et le **Lynx Highliner** par
  **Zorgon Peterson** (et non Saud Kruger) ; ces attributions sont corroborées par EDCD/coriolis-data.

## Voir aussi

- [Équipements et modules](./04-equipements.md) — détail des modules installés dans les emplacements listés ci-dessus.
- [Les ingénieurs](./06-ingenieurs.md) — comment améliorer concrètement la portée de saut, les boucliers, le blindage
  (blueprint *Increased Range*, effets expérimentaux…).
- [Combat spatial](./08-combat-spatial.md) — mise en œuvre des hardpoints et des chasseurs embarqués en combat.
- [Exploration](./10-exploration.md) — choix de vaisseau et configuration pour l'exploration longue distance.
- [Commerce](./11-commerce.md) et [Transport](./12-transport.md) — vaisseaux cargo et de passagers en usage.
- [Le Rhino et le Nomad](./14-rhino-nomad.md) — le cas du Nomad développé en détail, et le SRV Rhino.
- [La Colonisation](./18-colonisation.md) — rôle du Type-8, Type-9 et Type-11 Prospector dans l'économie de
  colonisation.
- [Le Minage](./20-minage.md) — vaisseaux et équipements miniers en détail.
- [Combat anti-Thargoïde (AX)](./25-combat-ax.md) — vaisseaux et configurations adaptés au combat AX.

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
  `modifications/blueprints.json`)
- https://en.wikipedia.org/wiki/Elite_Dangerous
