# Porte-vaisseaux de joueur (Fleet Carriers)

Le **Porte-Vaisseau de joueur** (*Fleet Carrier*, souvent abrégé **FC**) est une méga-structure mobile privée, achetée
par un Commandant (ou financée collectivement par un [escadron](./22-squadrons.md)), capable de sauter de système en
système avec sa propre soute, son propre marché et une partie des services habituellement réservés aux stations. Il a
été introduit le **9 avril 2020** (confirmé directement sur l'article Wikipédia dédié au jeu : « On 9 April 2020,
Fleet Carriers were added to the game, allowing players to own what are essentially mobile space stations for private
use »), puis considérablement enrichi depuis (commerce de denrées rares, services Odyssey). Ce guide couvre l'achat,
l'entretien hebdomadaire, la capacité de soute, le carburant Tritium, les services embarqués, le décommissionnement,
et les usages spécialisés (commerce, minage, colonisation, ingénierie, Powerplay) — avec, pour chaque chiffre, un
niveau de confiance explicite lorsque les sources divergent ou n'ont pas pu être recoupées.

> **Voir aussi.** Ce guide fait foi comme référence unique sur le fonctionnement des Porte-Vaisseaux, cité en passant
> dans de nombreux autres guides du corpus : [Commerce](./11-commerce.md), [Transport](./12-transport.md),
> [Le Minage](./20-minage.md), [La Colonisation](./18-colonisation.md), [Ingénieurs](./06-ingenieurs.md),
> [Powerplay](./02-powerplay.md), [Équipements](./04-equipements.md) et [Combat spatial](./08-combat-spatial.md). Pour
> l'infrastructure statique propre à une Power (le *Stronghold Carrier*, non pilotable par un joueur), voir la
> sous-section dédiée de la section VI ci-dessous et le guide [Powerplay](./02-powerplay.md).

## Note sur la fiabilité des données chiffrées

Les sites officiels (elitedangerous.com, forums.frontier.co.uk) et elite-dangerous.fandom.com ont renvoyé de façon
systématique des erreurs anti-robot (403/402) lors de la rédaction et de la relecture de ce guide, y compris via des
tentatives d'archive et de moteur de recherche (budget de recherche épuisé lors de la vérification finale). En
revanche, un accès direct a bien pu être obtenu, lors de la relecture de vérification, sur les pages suivantes, ce qui
a permis de **confirmer directement** — et non plus seulement par recoupement indirect — plusieurs chiffres clés :
**roguey.co.uk** (pages principale, coûts et services), le guide **Pilots Trade Network** (PTN) *Fleet Carrier
Owner's Guide*, la documentation **elite-journal.readthedocs.io** (champs bruts du journal de jeu), l'article
**Wikipédia** consacré au jeu, et le dépôt communautaire **FC-Fuel-Estimator** sur GitHub (calculateur qui documente
explicitement la formule de consommation de Tritium qu'il implémente). Sont ainsi confirmés en confiance haute par un
accès direct : le prix d'achat, le coût de base hebdomadaire et le coût par saut, les coûts des services optionnels,
la capacité de soute et du dépôt de Tritium, la portée maximale de saut, les frais de décommissionnement, l'absence de
Material Trader et de Technology Broker parmi les services installables, et la structure de la formule de
consommation de Tritium (base de 10 t, convergente entre le calculateur GitHub et les deux citations de forums —
contre une seule source divergente, math.edomh.nl, indiquant une base de 5 t).

Trois points précis n'ont pas pu être confirmés par un accès direct et restent signalés comme tels dans le texte : les
coûts hebdomadaires exacts des services Odyssey, la date précise et le caractère « discret » (*stealth change*) du
déblocage du commerce de denrées rares sur un Porte-Vaisseau (repose sur une seule citation de thread
forums.frontier.co.uk, non re-vérifiable en direct à cause du blocage anti-robot), et une deuxième source totalement
indépendante de roguey.co.uk pour la répartition des baies d'appontage (roguey.co.uk reste la seule source trouvée à
documenter ce détail, sur plusieurs de ses propres pages). Ces chiffres sont un **instantané capturé le 9 septembre
2026** : la maintenance, les frais de décommissionnement et les coûts de service ont déjà évolué par le passé (voir
section V) et peuvent être révisés par Frontier — à revérifier dans le panneau d'administration du Porte-Vaisseau en
jeu avant toute décision financière importante.

## I. Achat et prix

### Où acheter un Porte-Vaisseau

Un Porte-Vaisseau ne s'achète pas depuis n'importe quelle station : il faut se rendre dans un système possédant une
installation spécifique, désignée familièrement par la communauté sous le nom de **« Drydock »** (chantier naval), qui
propose le vendeur de Porte-Vaisseaux. Ce n'est pas un service embarqué du Porte-Vaisseau lui-même une fois acheté —
une fois en votre possession, il n'existe aucun module « Drydock » dans son interface d'administration ; l'entretien et
la réparation des vaisseaux *visiteurs* sont couverts par le service **Repair** décrit en section IV. Le terme
« Drydock » désigne donc uniquement le **lieu d'achat**, pas une fonctionnalité du Porte-Vaisseau.

### Prix d'achat

| Élément                                   | Montant           | Confiance / source                                                  |
|--------------------------------------------|--------------------|----------------------------------------------------------------------|
| Prix d'achat (Porte-Vaisseau « nu »)      | **5 000 000 000 Cr** (5 milliards) | Haute — calculateur PTN et guide PTN *Fleet Carrier Owner's Guide*, concordants. |

Ce prix couvre uniquement la coque et les services par défaut non désactivables (voir section IV). Tout service
optionnel (Refuel, Repair, Shipyard, etc.) s'active séparément après l'achat et ajoute son propre coût hebdomadaire.

### Coût de maintenance hebdomadaire

Un Porte-Vaisseau facture un entretien hebdomadaire prélevé automatiquement sur la trésorerie de son propriétaire (ou
sur la banque d'escadron si le Porte-Vaisseau appartient à un [escadron](./22-squadrons.md)). Le coût de base et le
coût par saut ont été **confirmés par accès direct** à la page « cost » de roguey.co.uk et au guide PTN, qui
concordent l'un et l'autre avec une troisième source (calculateur communautaire « ED Fleet Carrier Calculator » sur
GitHub Pages) ; un calculateur tiers (everycalculators.com) affichait une valeur aberrante de 25 000 000 Cr,
incompatible avec les autres sources, et a été écarté comme peu fiable.

| Poste                                                  | Coût de base            |
|----------------------------------------------------------|--------------------------|
| Coût de base (Porte-Vaisseau nu, aucun service optionnel actif) | **5 000 000 Cr/semaine** |
| Frais par saut (en plus du Tritium consommé, voir section III) | **100 000 Cr par saut** |

À ce socle s'ajoute le coût hebdomadaire de **chaque service optionnel installé**, qu'il soit activement utilisable ou
« suspendu » (installé mais désactivé temporairement — coûte moins cher qu'actif, mais reste facturé) :

| Service optionnel                          | Coût actif (semaine) | Coût suspendu (semaine) | Remarque                                    |
|----------------------------------------------|------------------------|----------------------------|----------------------------------------------|
| Refuel (ravitaillement Tritium des visiteurs) | 1,5 M Cr               | 0,75 M Cr                  |                                                |
| Repair                                        | 1,5 M Cr               | 0,75 M Cr                  |                                                |
| Rearm / Armoury (munitions)                   | 1,5 M Cr               | 0,75 M Cr                  |                                                |
| Redemption Office (primes, combat bonds)      | 1,85 M Cr              | 0,85 M Cr                  | Commission ≈ 25 % sur chaque encaissement.    |
| Universal Cartographics                       | 1,85 M Cr              | 0,7 M Cr                   | Commission ≈ 25 % sur les données vendues.    |
| Secure Warehouse (stockage sécurisé)          | 2 M Cr                 | 1,25 M Cr                  | Commission ≈ 25 % à l'usage.                  |
| Outfitting                                    | 5 M Cr                 | 1,5 M Cr                   | Stockage gratuit et illimité de modules.      |
| Shipyard                                      | **6,5 M Cr**           | 1,8 M Cr                   | Service optionnel le plus cher.               |

*(Source : table de coûts roguey.co.uk, consultée par accès direct. Confiance haute pour l'ensemble du tableau.)*

Les services Odyssey (Concourse/Bar, Vista Genomics, Pioneer Supplies) existent bien comme options installables
(confirmées par le guide PTN), mais leurs coûts hebdomadaires précis n'ont pas pu être retrouvés dans les sources
accessibles — **à vérifier en jeu** dans le panneau d'administration du Porte-Vaisseau si une confirmation exacte est
nécessaire.

**Formule récapitulative :**

```
Coût hebdomadaire total = 5 000 000 Cr (base)
                         + Σ(coûts des services optionnels actifs ou suspendus)
                         + (100 000 Cr × nombre de sauts effectués dans la semaine)
```

Des retours de joueurs (témoignages Steam) évoquent un entretien hebdomadaire typique de **10 à 20 millions de Cr**
pour une configuration avec plusieurs services actifs — un ordre de grandeur cohérent avec la formule ci-dessus une
fois quelques services additionnés au coût de base.

## II. Infrastructure et capacité de soute

### Capacité de soute

Un Porte-Vaisseau dispose d'un **pool unique de 25 000 tonnes**, mutualisé entre les marchandises stockées sur son
marché et le Tritium excédentaire au-delà du dépôt dédié (voir ci-dessous). Confirmé par accès direct à roguey.co.uk
(« The ship features a cargo capacity of 25,000 units, which can be used to store cargo, modules or extra fuel »),
concordant avec le champ brut `TotalCapacity: 25000` de l'événement `CarrierStats` du journal de jeu, documenté par
elite-journal.readthedocs.io (confiance haute). Contrairement à une attente répandue, cette capacité n'est **pas
subdivisée en baies chiffrées séparément** : aucune source ne documente de répartition en compartiments de soute
distincts — il s'agit d'un pool global, pas d'un ensemble de baies avec des tonnages individuels. Les vaisseaux et
modules stockés via les services Shipyard/Outfitting (jusqu'à 40 vaisseaux, voir section IV) **n'utilisent pas** cette
capacité de 25 000 t : c'est un stockage séparé, hors quota.

### Baies d'appontage (landing pads)

| Taille  | Nombre |
|---------|--------|
| Petite (Small)  | 4 |
| Moyenne (Medium) | 4 |
| Grande (Large)   | 8 |
| **Total**        | **16** |

*(Source : roguey.co.uk, confirmé par accès direct sur plusieurs pages du site (page principale et FAQ) ; confiance
moyenne à haute faute d'une deuxième source totalement indépendante retrouvée dans le temps imparti — roguey.co.uk
reste la seule source ayant documenté ce détail lors des recherches menées pour ce guide.)*

### Dépôt de Tritium (Tritium Depot)

Le Tritium destiné au FSD du Porte-Vaisseau est stocké dans un **réservoir séparé de la soute**, d'une capacité
maximale de **1 000 tonnes**, qui ne consomme donc pas le pool de 25 000 t (confirmé par accès direct à roguey.co.uk :
« Tritium is stored in its 1,000 unit fuel tank, making it possible to travel roughly 1,500ly before refuelling » —
confiance haute). Ce dépôt se ravitaille de deux façons :

- **En l'achetant** via le service Refuel actif (voir section IV) — le Tritium est alors acheté au prix courant.
- **Gratuitement**, en transférant directement du Tritium miné depuis la soute d'un vaisseau visiteur vers le dépôt via
  le panneau de transfert du Porte-Vaisseau — méthode confirmée par plusieurs threads forums.frontier.co.uk et
  discussions Steam, largement utilisée par les opérations de minage pour maintenir un Porte-Vaisseau approvisionné à
  coût nul (voir section VI, sous-section Minage).

## III. Carburant Tritium : consommation, portée, cooldown

### Portée maximale par saut

**500 années-lumière (al)**, une valeur **fixe et non améliorable par ingénierie** — contrairement au FSD d'un
vaisseau classique (voir [Ingénieurs](./06-ingenieurs.md)), celui d'un Porte-Vaisseau ne peut recevoir aucun blueprint.
Confirmé par accès direct à trois sources indépendantes : la FAQ roguey.co.uk (« Carriers can jump up-to 500ly per
jump, using Tritium fuel »), le guide PTN, et le champ brut `JumpRangeMax: 500` du journal de jeu documenté par
elite-journal.readthedocs.io (confiance haute).

### Formule de consommation de Tritium par saut

Deux citations littérales indépendantes de threads forums.frontier.co.uk (« Fleet Carrier Fuel Efficiency » et « Fleet
carrier fuel consumption question »), mathématiquement identiques une fois développées, donnent la formule suivante —
formule dont la structure a été **confirmée par un accès direct** au dépôt communautaire **FC-Fuel-Estimator** sur
GitHub, dont le README publie explicitement `F = ROUND(10 + (D / 4) × (1 + (Cargo + Tritium) / 25000))` comme la
formule qu'il implémente :

```
Tritium consommé (t) = ARRONDI( 10 + Distance(al) × [Cargo actuel(t) + Tritium en réserve(t) + 25 000] / (4 × 25 000) )
```

soit, sous une forme équivalente plus lisible :

```
Tritium consommé (t) = 10 + (Distance / 4) × [1 + (Cargo + Réserve) / 25 000]
```

Points pratiques à retenir :

- Un saut à **distance nulle** (repositionnement sur place) coûte un minimum plancher de **10 tonnes**.
- Un saut au **maximum (500 al)**, soute et réserve totalement vides, coûte environ **135 tonnes**.
- Un saut au **maximum (500 al)**, soute et réserve pleines (25 000 t cumulées), coûte environ **260 tonnes** — soit
  près du double.
- **Conclusion pratique** : plus le Porte-Vaisseau transporte de marchandises et de Tritium de réserve, plus chaque
  saut consomme de carburant à distance égale. Voyager à vide entre deux positions est nettement plus économe.

Une source (le calculateur math.edomh.nl) indique un minimum plancher de 5 t et une base légèrement différente ; face
à elle, **trois** sources convergent désormais sur une base de **10 t** — les deux citations littérales de forums et,
confirmation supplémentaire obtenue par accès direct, le calculateur GitHub FC-Fuel-Estimator qui documente
explicitement cette même base dans son code. C'est donc la valeur de **10 t** qu'il faut retenir (confiance haute).

### Autonomie pratique

Avec un plein de Tritium (1 000 t), roguey.co.uk avance un repère pratique d'environ **1 500 al** avant besoin de
ravitaillement pour un usage courant (confirmé par accès direct). Le calcul théorique avec la formule ci-dessus donne
une fourchette bien plus large selon le chargement : à vide, environ 7 sauts de 500 al sont possibles avant
épuisement du dépôt (~3 500 al au total) ; chargé, ce nombre chute fortement puisque chaque saut coûte alors davantage
de carburant. **À retenir** : la formule ci-dessus fait référence pour un calcul précis ; le chiffre de 1 500 al est
un ordre de grandeur prudent et réaliste pour une utilisation mixte, pas une valeur absolue.

### Cooldown et cycle de saut

| Étape                                                     | Durée                                     |
|--------------------------------------------------------------|---------------------------------------------|
| Charge-up (compte à rebours avant exécution du saut)          | Minimum ~**15 minutes** (jamais sous 15:06) |
| Verrouillage (saut non annulable en dessous de ce seuil)      | À partir de **3:20** restantes               |
| Cooldown après arrivée avant de pouvoir replanifier un saut   | ~**5 minutes**                               |
| **Cycle complet le plus rapide** (deux sauts de 500 al, carburant disponible) | ~**20 minutes** |

*(Confirmé par deux sources concordantes : guide PTN et FAQ roguey.co.uk, confiance haute.)*

## IV. Services embarqués

### Services par défaut (gratuits, non désactivables)

- **Bridge Crew** — équipage de base du Porte-Vaisseau.
- **Commodities Market** — marché de commodités paramétrable par le propriétaire (prix d'achat/vente définis
  manuellement, dans une fourchette autorisée).
- **Tritium Depot** — dépôt de carburant décrit en section II.

*(Les trois services par défaut, sans coût associé, sont confirmés par accès direct à la page « services » de
roguey.co.uk.)*

### Services optionnels payants

Coûts détaillés en section I. Description fonctionnelle de chacun :

| Service              | Fonction                                                                                          |
|-----------------------|----------------------------------------------------------------------------------------------------|
| **Refuel**            | Vend du Tritium aux vaisseaux visiteurs et alimente le dépôt.                                     |
| **Repair**            | Répare la coque des vaisseaux visiteurs (fait aussi office de « Drydock » embarqué, au sens usuel du terme). |
| **Rearm / Armoury**   | Réapprovisionne les visiteurs en munitions.                                                       |
| **Redemption Office** | Encaisse primes de chasse (bounties) et combat bonds ; commission ≈ 25 %.                          |
| **Shipyard**          | Achat et stockage de vaisseaux — jusqu'à **40 vaisseaux stockés gratuitement**, y compris ceux d'autres joueurs si le service est actif. |
| **Outfitting**        | Achat et stockage de modules — stockage gratuit et illimité, y compris pour d'autres joueurs.     |
| **Universal Cartographics** | Revente de données d'exploration et d'exobiologie ; commission ≈ 25 %.                       |
| **Secure Warehouse**  | Stockage sécurisé de marchandises ; commission ≈ 25 % à l'usage.                                   |
| **Concourse / Bar** *(Odyssey)*    | Trading de matériaux Odyssey entre visiteurs à pied.                                  |
| **Vista Genomics** *(Odyssey)*    | Revente de données d'exobiologie (échantillons génétiques).                            |
| **Pioneer Supplies** *(Odyssey)*  | Achat d'équipement à pied (armes, combinaisons, consommables).                          |

**Restriction importante côté Outfitting** : les modules **Guardian** et les modules **pré-ingénierés**
(*pre-engineered*) ne sont **pas** disponibles à l'achat via l'Outfitting d'un Porte-Vaisseau — seuls les modules stock
peuvent y être achetés (confirmé littéralement par le guide PTN). Un joueur peut en revanche y **stocker gratuitement**
ses propres modules déjà ingénierés pour les récupérer ailleurs.

**Aucun Ingénieur (PNJ) n'est présent à bord.** Un Porte-Vaisseau ne permet donc jamais d'appliquer un plan
d'ingénierie : son rôle vis-à-vis de l'[ingénierie](./06-ingenieurs.md) est purement **logistique** — stocker et
transporter matériaux bruts et modules à proximité d'une base d'Ingénieur, jamais réaliser l'application du blueprint
elle-même. **Point de vigilance corpus, confirmé par accès direct** : les listes de services publiées par le guide
PTN et par la page « services » de roguey.co.uk — toutes deux consultées spécifiquement pour vérifier ce point — ne
recensent **ni Material Trader ni Technology Broker** parmi les services installables sur un Porte-Vaisseau (confiance
haute) : ces deux services restent réservés aux stations dédiées. En cas de doute, vérifier directement le menu de
services en jeu.

### Vente de denrées rares

Jusqu'à la mise à jour **Trailblazers (bêta lancée le 26 février 2025**, date canonique du corpus — voir
[00-chronologie-canonique.md](./00-chronologie-canonique.md)), il **n'était pas possible** d'échanger des denrées rares
via le marché d'un Porte-Vaisseau. Un changement discret (*stealth change*) introduit avec cette mise à jour aurait
rendu cela possible, d'après une citation littérale relevée dans un thread forums.frontier.co.uk (« A stealth change
in Trailblazers that's worth discussing - you can trade rare goods on carriers now »).

**Confiance moyenne, non re-confirmée par accès direct** : ce point précis repose sur une seule citation de thread,
relevée via moteur de recherche lors de la recherche initiale ; forums.frontier.co.uk a systématiquement renvoyé une
erreur d'accès (403) lors des tentatives de vérification directe pour cette relecture, et le guide PTN actuel (par
ailleurs consulté directement) ne mentionne pas les denrées rares. La date et le mécanisme précis de ce changement
méritent donc une **vérification humaine directe en jeu** avant d'être présentés comme définitifs.

**Nuance non tranchée (confiance moyenne)** : sur le marché normal d'une station, le prix de vente d'une denrée rare
augmente avec la distance parcourue depuis le système d'origine (voir [Commerce](./11-commerce.md) et
[Transport](./12-transport.md)) jusqu'à un plafond situé autour de 150-200 al. Aucune source consultée ne confirme si
le marché d'un Porte-Vaisseau — dont les prix sont fixés manuellement par le propriétaire — réplique ce mécanisme de
bonus par distance. C'est probablement le cas contraire (le propriétaire fixant lui-même ses prix, indépendamment de
toute distance), mais ce point mérite une **vérification humaine directe en jeu** avant d'être présenté comme définitif.

## V. Décommissionnement

### Remboursement volontaire

Le remboursement (déclenché volontairement depuis l'interface d'administration du Porte-Vaisseau) rend l'intégralité
des 5 milliards de Cr du prix d'achat, **moins des frais fixes de décommissionnement**.

| Période                     | Montant des frais | Source / confiance                                                                        |
|-------------------------------|---------------------|-----------------------------------------------------------------------------------------------|
| Valeur historique (sources plus anciennes) | 125 000 000 Cr      | Posts Reddit/Steam antérieurs — probablement obsolète.                                       |
| **Valeur actuelle**            | **150 000 000 Cr**   | **Confirmé par accès direct** au guide PTN (« a 150 million credit fee for decommissioning »), concordant avec un thread Frontier forums intitulé « Question on current carrier decommissioning refund values » et un thread Steam. Confiance haute. |

Cette évolution (125 M → 150 M) est très probablement une augmentation tarifaire appliquée par Frontier au fil des
mises à jour, comme pour d'autres coûts du jeu — pas une erreur de source. **Retenir 150 000 000 Cr comme valeur
actuelle**, en gardant à l'esprit que ce montant peut encore évoluer.

### Ce qui n'est PAS remboursé automatiquement

- Le **Tritium restant** dans le dépôt.
- Les **marchandises stockées** dans la soute.
- La valeur des **services optionnels installés** (aucune restitution de leur coût d'installation).

Un thread Frontier (« Fleet carrier decommissioning demystified and the mistakes in the in-game Codex ») signale
explicitement que le Codex du jeu contient des erreurs sur ce processus. **Bonne pratique** : vendre ou retirer
manuellement cargo, Tritium et modules **avant** de décommissionner, pour ne pas en perdre la valeur.

### Décommissionnement involontaire (impayé)

En cas d'impayé de la maintenance hebdomadaire, le Porte-Vaisseau entre dans une phase de **« décommissionnement en
attente »**, avec un délai de grâce d'environ **une semaine** pour régulariser la dette. À défaut de paiement, Frontier
décommissionne/démantèle automatiquement le Porte-Vaisseau et **déduit la dette accumulée du remboursement**, au lieu
d'appliquer les frais fixes du décommissionnement volontaire.

## VI. Usages spécialisés

### Commerce

Voir [Commerce](./11-commerce.md) pour le détail complet. Le *carrier trading* fonctionne comme du loop-trading à
grande échelle : achat de commodités à bas prix via le marché du Porte-Vaisseau, remplissage de la soute (jusqu'à
25 000 t), puis saut vers une station qui paie mieux pour vendre en gros. Des réseaux communautaires organisés existent
spécifiquement autour de cette pratique — **Pilots Trade Network (PTN)** et **Fleet Carrier Owners Club (FCOC)** —
avec guides dédiés et coordination Discord pour maximiser les profits sur de gros volumes.

### Minage

Voir [Le Minage](./20-minage.md) pour l'équipement et les techniques. Le Porte-Vaisseau sert de **dépôt mobile**
positionné directement sur un point chaud (*hotspot*) de minage : les vaisseaux mineurs livrent leur minerai au marché
du Porte-Vaisseau sans aller-retour vers une station lointaine, et le propriétaire peut ensuite déplacer le
Porte-Vaisseau chargé vers le meilleur acheteur. Le Tritium peut lui-même être miné et déposé gratuitement dans le
dépôt (voir section II), rendant l'opération quasi autonome en carburant.

### Colonisation

Voir [La Colonisation](./18-colonisation.md) pour la mécanique complète. Bien que la colonisation de système soit
réalisable sans Porte-Vaisseau, en posséder un facilite grandement la préparation logistique : pré-chargement des
matériaux de construction requis, le Porte-Vaisseau servant de **dépôt avancé** près du site de construction pour
réduire les temps de trajet des *haulers*. Plusieurs outils communautaires tiers récents (« Raven Colonial »,
edcolony.com) sont spécifiquement conçus pour planifier ce pré-chargement de commodités de colonisation sur des
Porte-Vaisseaux et suivre la progression des chantiers.

### Ingénierie

Voir [Ingénieurs](./06-ingenieurs.md) pour le système complet. Rôle purement **logistique** : stockage gratuit de
modules (y compris déjà ingénierés) et transport de matériaux bruts à proximité d'une base d'Ingénieur — voir la mise
en garde de la section IV sur l'absence d'Ingénieur (PNJ) embarqué et l'absence confirmée de Material Trader/Technology
Broker parmi les services disponibles.

### Powerplay

Voir [Powerplay](./02-powerplay.md) pour le système complet. À distinguer du **Stronghold Carrier**, une installation
statique propre à une Power (mini Porte-Vaisseau non-joueur, accessible uniquement aux membres alliés à cette Power),
introduite avec **Powerplay 2.0 (31 octobre 2024)** — ce n'est **pas** un Porte-Vaisseau de joueur. En revanche, un
Porte-Vaisseau de **joueur** peut être utilisé en soutien de Powerplay 2.0 : par exemple transporter une pleine soute
d'une commodité stratégique (platine cité en exemple communautaire) pour renforcer/livrer au bénéfice de la Power du
joueur dans un système donné. Le lien entre Porte-Vaisseaux de joueur et Powerplay 2.0 reste, à ce stade, davantage un
sujet de discussion communautaire actif (des propositions circulent sur les forums Frontier pour renforcer cette
synergie) qu'une mécanique pleinement développée par Frontier — à formuler avec prudence.

## Voir aussi

- [Commerce](./11-commerce.md) — carrier trading, réseaux PTN/FCOC, denrées rares.
- [Transport](./12-transport.md) — Porte-Vaisseau comme base logistique mobile pour le fret.
- [Le Minage](./20-minage.md) — techniques et équipement de minage, dépôt mobile sur hotspot.
- [La Colonisation](./18-colonisation.md) — pré-chargement de matériaux de construction, dépôt avancé.
- [Ingénieurs](./06-ingenieurs.md) — logistique de matériaux et de modules, limites (pas d'Ingénieur embarqué).
- [Powerplay](./02-powerplay.md) — Stronghold Carrier et soutien logistique à Powerplay 2.0.
- [Équipements](./04-equipements.md) — Fuel Transfer Limpet et Repair Limpet utilisables en soutien de flotte.
- [Escadrons](./22-squadrons.md) — Porte-Vaisseau d'escadron, mutualisation des coûts.
- [00 — Chronologie canonique](./00-chronologie-canonique.md) — date de référence de la mise à jour Trailblazers (26 février 2025).

## Sources

- https://pilotstradenetwork.com/guides/fleet-carrier-owner/ (consultée par accès direct)
- https://pilotstradenetwork.com/tools/carrier-calculator/
- https://roguey.co.uk/elite-dangerous/fleet-carriers/ (consultée par accès direct)
- https://roguey.co.uk/elite-dangerous/fleet-carriers/services/ (consultée par accès direct)
- https://roguey.co.uk/elite-dangerous/fleet-carriers/faq/ (consultée par accès direct)
- https://roguey.co.uk/elite-dangerous/fleet-carriers/cost/ (consultée par accès direct)
- https://elite-journal.readthedocs.io/en/latest/Fleet%20Carriers.html (consultée par accès direct)
- https://en.wikipedia.org/wiki/Elite_Dangerous (consultée par accès direct)
- https://github.com/flatsix408/FC-Fuel-Estimator/blob/main/README.md (consultée par accès direct)
- https://math.edomh.nl/pages/fleet-carrier-jump/ (consultée par accès direct ; valeur de base 5t divergente, non retenue)
- forums.frontier.co.uk/threads/fleet-carrier-fuel-efficiency.549396/ (citation via moteur de recherche ; accès direct refusé — 403)
- forums.frontier.co.uk/threads/fleet-carrier-fuel-consumption-question.550636/ (citation via moteur de recherche)
- forums.frontier.co.uk/threads/question-on-current-carrier-decommissioning-refund-values.615490/ (citation via moteur de recherche)
- forums.frontier.co.uk/threads/fleet-carrier-decommissioning-demystified-and-the-mistakes-in-the-in-game-codex.565802/ (citation via moteur de recherche)
- forums.frontier.co.uk/threads/trading-rares-from-carriers.634397/ (citation via moteur de recherche ; accès direct refusé — 403)
- steamcommunity.com/app/359320/discussions/0/4353365620733038584/ (citation via moteur de recherche)
- steamcommunity.com/app/359320/discussions/0/3041605810444103240/ (citation via moteur de recherche)
- steamcommunity.com/app/359320/discussions/0/592885652759033156/ (citation via moteur de recherche)
- elite-dangerous.fandom.com/wiki/Fleet_Carrier_Outfitting_Service (citation via moteur de recherche, page non accessible directement)
- elite-dangerous.fandom.com/wiki/Fleet_Carrier_Shipyard (citation via moteur de recherche, page non accessible directement)
- 00-chronologie-canonique.md (corpus interne, date de référence Trailblazers/Colonisation)
