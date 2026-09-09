# Ingénierie avancée de l'équipement à pied : farming, échange et optimisation

> **Voir aussi** — ce guide est un complément avancé, centré sur le *farming*, l'échange et l'optimisation des
> matériaux d'ingénierie de l'équipement individuel. Il ne reprend pas les tableaux déjà établis ailleurs dans le
> corpus : pour la liste complète des blueprints de combinaison et d'arme (effets, Engineers, coûts en crédits), voir
> [07-equipement-a-pied.md](./07-equipement-a-pied.md#lingénierie-à-pied-engineering) ; pour la mécanique générale de
> l'ingénierie côté vaisseaux (grades, matériaux Raw/Manufactured/Encoded, effets expérimentaux) et pour la référence
> de ce que « effet expérimental » signifie dans ce jeu, voir [06-ingenieurs.md](./06-ingenieurs.md). Ce document
> suppose que vous avez déjà lu au moins l'un des deux.

## Vue d'ensemble : ce que ce guide ajoute

Le corpus existant décrit *quoi* modifier (07) et *comment fonctionne* l'ingénierie en général (06), mais laissait
plusieurs questions pratiques ouvertes : quelles sont les règles exactes d'échange entre catégories de matériaux à
pied, où et comment farmer efficacement, dans quel ordre débloquer les Engineers, et quels outils communautaires
utiliser pour piloter tout ça. C'est l'objet de ce guide, construit à partir d'une recherche ciblée sur ces points
précis (Manuel officiel du Journal Frontier, pages Engineer d'Inara, forums Frontier, schémas de journal EDOMH,
dépôt GitHub d'EDOMH, guides Inara Logbook), puis d'une **passe de vérification adversariale** qui a testé les
affirmations les plus spécifiques du texte contre des sources vivantes avant publication (voir encadrés « Vérifié »
et « Non confirmé » ci-dessous, et le détail en fin de document).

Deux clarifications structurantes ressortent de cette recherche et conditionnent tout le reste du guide :

1. **La terminologie des catégories de matériaux à pied est plus précise que ce que l'UI laisse penser** (voir
   section 1) — un point qui change concrètement ce qu'on peut espérer échanger contre quoi.
2. **L'exobiologie (Genetic Sampler) n'alimente pas l'ingénierie à pied** — une hypothèse plausible à première vue,
   mais infirmée par les sources consultées (voir section 2.7). Le matériau « Biological Sample », dont le nom prête
   à confusion, provient en réalité des settlements et non du scan de faune.

## 1. Catégories de matériaux à pied et règles d'échange

### 1.1 Les catégories officielles vs le regroupement communautaire

Le **Manuel officiel du Journal Frontier** (v32, PDF publié sur `hosting.zaonce.net`) définit le champ `Category` des
événements de journal on-foot avec exactement quatre valeurs : **`Item`, `Component`, `Data`, `Consumable`** (les
valeurs `Encoded`/`Raw`/`Manufactured` restant réservées aux matériaux de vaisseau, voir
[06-ingenieurs.md](./06-ingenieurs.md)).

**Point vérifié lors de la révision de ce guide** : une hypothèse adverse suggérait que le champ `Category` compterait
en réalité six valeurs natives (`Chemical`, `Circuit`, `Consumable`, `Data`, `Item`, `Tech`), ce qui aurait invalidé
tout le paragraphe ci-dessus. Vérification faite sur le schéma communautaire EDOMH de l'événement `ShipLocker`
(`schemas.edomh.nl/ShipLocker.html`, qui documente la structure réelle du fichier `ShipLocker.json` généré par le
jeu) : celui-ci définit bien **quatre tableaux de haut niveau et quatre seulement — `Items`, `Components`,
`Consumables`, `Data`** — sans trace de `Chemical`, `Circuit` ou `Tech` comme catégories de premier niveau. Ce
recoupement confirme la version à quatre catégories retenue ici plutôt que l'hypothèse à six valeurs.

Autrement dit, **« Chemical », « Circuit » et « Tech » ne sont pas des catégories officielles au sens du journal** :
ce sont une subdivision interne de la catégorie `Component`, que l'UI et la communauté regroupent sous le nom
générique **« Assets »**. Ce point n'est pas qu'une curiosité terminologique : c'est cette subdivision précise (et
elle seule) qui détermine ce qui est échangeable au bartender (section 1.3).

| Terme communautaire (UI) | Catégorie officielle du journal (`Category`) | Contenu                                                   | Échangeable au bartender ? |
|---------------------------|------------------------------------------------|------------------------------------------------------------|-------------------------------|
| **Goods**                | `Item`                                          | Biens divers (données imprimées, objets physiques variés) | Non documenté comme tel        |
| **Assets**                | `Component`, subdivisé en **Chemical / Circuit / Tech** | Composants manufacturés à pied                     | **Oui, entre les trois sous-catégories Assets uniquement** |
| **Data**                  | `Data`                                          | Données encodées (rapports, journaux, relevés)             | **Non**, sauf remise ciblée en quête (voir 1.4) |
| **Consumables**           | `Consumable`                                    | Medkits, grenades, etc. — hors ingénierie                  | Non concerné                   |

*Source : Manuel officiel du Journal Frontier v32 pour la colonne `Category` ; recoupement structurel via le schéma
`ShipLocker` d'EDOMH (`schemas.edomh.nl/ShipLocker.html`, quatre tableaux `Items/Components/Consumables/Data`) ;
regroupement Goods/Assets/Data recoupé via elite-dangerous.fandom (page *Assets*, consultée via extrait de
recherche uniquement — l'accès direct a systématiquement renvoyé une erreur HTTP 402, y compris lors de la révision)
et via un guide indépendant (popwave.ai, également inaccessible en fetch direct lors de la révision — connexion
refusée). Instantané au 9 septembre 2026.*

### 1.2 Le mécanisme du bartender : un score de troc, pas un taux fixe

L'échange se fait via l'événement de journal `TradeMicroResources` : un ou plusieurs matériaux « offerts »
(`Offered[]`, avec nom/catégorie/quantité) sont échangés contre un matériau « reçu » (`Received`), au comptoir
« bartender » d'une station.

Le mécanisme concret, décrit sur un fil des forums Frontier (« Can someone explain Bartering? »), repose sur un
**score de troc** : chaque objet possède une valeur de score ; pour obtenir un objet de score 20, il faut apporter un
ou plusieurs objets dont la somme des scores atteint au moins ce seuil (par exemple 4 objets de score 5 chacun).
**Les points excédentaires au-delà du seuil sont perdus** — il n'existe donc pas de ratio simple et fixe « X unités
contre Y unités » communiqué publiquement par Frontier. **Relu lors de la révision** (fil rouvert via proxy lecteur
r.jina.ai) : un témoignage y confirme explicitement qu'« only one [class of materials] is tradeable », c'est-à-dire
qu'une seule des classes de matériaux à pied est réellement échangeable — cohérent avec le tableau de la section
1.1/1.3 (Assets échangeables entre eux, Data non échangeable en troc libre).

**Lacune de recherche assumée : aucune source consultée, y compris lors de la révision, ne donne les valeurs de
score exactes par matériau.** Ne pas inventer de tableau de taux de conversion ici serait plus honnête que de
produire des chiffres plausibles mais non vérifiés — utilisez le comptoir en jeu (qui affiche le score requis au
moment de l'échange) ou un outil communautaire à jour (EDOMH, voir section 5) pour connaître le score exact d'un
matériau donné avant de vous déplacer.

### 1.3 Ce qui est échangeable, ce qui ne l'est pas

| Situation                                                             | Échangeable au bartender ?                              | Confirmé par |
|------------------------------------------------------------------------|-------------------------------------------------------------|--------------|
| Chemical ↔ Circuit ↔ Tech (entre les trois sous-catégories d'Assets)  | **Oui**                                                      | 3 sources indépendantes (sites.google.com/view/elite-materials, guide Steam « Goods, Assets, Data », fil Frontier « three classes ») + témoignage relu en révision confirmant qu'une seule classe est réellement échangeable |
| Data ↔ n'importe quelle autre catégorie                               | **Non**                                                      | Absence de toute mention contraire ; un fil Reddit demandant cette fonctionnalité (« Bartenders should be able to trade on foot data materials ») confirme par son existence même qu'elle n'existe pas. À ne pas confondre avec l'**Encoded Material Trader** des matériaux de vaisseau (Raw/Manufactured/Encoded, voir [06-ingenieurs.md](./06-ingenieurs.md)) : ce dernier est un service totalement distinct, réservé aux matériaux d'ingénierie de vaisseau, et ne concerne pas le `Data` à pied de ce guide |
| Item/Goods ↔ Assets ou Data                                            | Non documenté comme praticable                                | — |
| Remise ciblée de Data pour valider une condition de déblocage/parrainage d'Engineer | **Oui, mais ce n'est pas un troc matériau-contre-matériau** — voir 1.4 | Pages Engineer Inara + fil Frontier « Which Items to keep, trade & sell with bartender » |

### 1.4 Le cas particulier des quêtes de déblocage d'Engineer

Le bartender sert aussi de guichet de remise pour certaines conditions de quête, ce qui peut prêter à confusion avec
le troc général :

- **Wellington Beck** exige de « vendre » un total cumulé de **15 unités** de Multimedia Entertainment / Classic
  Entertainment / Cat Media aux bartenders pour valider son déblocage. *(Confirmé par relecture directe de la page
  Engineer d'Inara.cz le 9 septembre 2026 : un fil des forums Frontier consulté lors d'une révision précédente citait
  25 unités pour la même condition, mais cette divergence n'a pas résisté à une nouvelle lecture en direct de la page
  Inara — retenez 15.)*
- **Oden Geiger** exige de « vendre » un total de **20 unités cumulées** de Biological Sample / Employee Genetic
  Data / Genetic Research aux bartenders pour valider son parrainage. Ce chiffre est corroboré par deux sources
  indépendantes (pages Engineer Inara et fil Frontier relu en révision) qui s'accordent toutes deux sur 20.

Il ne s'agit **pas** d'un échange de matériau contre matériau au sens de la section 1.3, mais d'une remise ciblée qui
coche une case de quête — les matériaux remis ne reviennent pas sous une autre forme. Ne planifiez donc pas de
farming de ces matériaux dans l'idée de les revendre ensuite : gardez-en un compte large plutôt que de viser un total
au plus juste.

### 1.5 Limites de stock

| Niveau de stockage                              | Plafond                                                | Statut de confirmation |
|---------------------------------------------------|-----------------------------------------------------------|---------------------------|
| Casier de bord du vaisseau — *Ship Locker*, structure confirmée par le schéma journal (par catégorie `Items`/`Components`/`Data`, séparément) | **Rapporté par la communauté à 1000 unités par catégorie** | **Non retrouvé dans une source primaire lors de la révision** — le schéma `ShipLocker` confirme la structure en catégories séparées, mais aucun document Frontier ni fil consulté cette fois-ci n'a pu reconfirmer le chiffre précis de 1000 ; à vérifier en jeu (l'écran d'inventaire affiche le plafond courant) avant de s'y fier pour planifier un farming de masse |
| Fleet Carrier                                       | Comportement différent signalé par des joueurs (plafond potentiellement partagé entre les 3 catégories) | **Non tranché** — sujet à débat/bug reporté par la communauté, à vérifier en jeu avant de s'y fier |
| Stock du bartender NPC lui-même (quantité qu'il peut offrir par visite) | —                                                       | **Non documenté** dans les sources consultées, y compris lors de la révision |

Contrairement aux matériaux de vaisseau, dont les plafonds de stockage sont documentés par grade dans
[06-ingenieurs.md](./06-ingenieurs.md#plafonds-de-stockage-des-matériaux), le plafond à pied ne dépend pas d'un
grade individuel mais s'appliquerait globalement par catégorie dans le **casier de bord** (`ShipLocker`, distinct du
sac à dos du personnage et de la soute à cargaison classique) — la valeur de 1000 unités reste une donnée communément
rapportée mais **non reconfirmée par une source primaire** au moment de cette révision.

### 1.6 Ne pas confondre avec le Tech Broker

Le **Tech Broker** (service distinct, vérifié sur sites.google.com/view/elite-materials/others/tech-broker) ne
concerne **pas** les matériaux Odyssey à pied : c'est un service dédié aux armes Guardian hybrides et aux modules de
vaisseau utilisant des matériaux Guardian (par exemple les Sirius Heatsinks). Si vous cherchez un contact d'échange
pour vos matériaux à pied, c'est le **bartender** de la section 1.2-1.3 qu'il vous faut, pas le Tech Broker — les deux
sont des PNJ de station totalement distincts avec des inventaires sans rapport.

## 2. Farming efficace par matériau et par méthode

### 2.1 Méthode reine : missions de réactivation/restauration de settlement

C'est la méthode la plus documentée et la plus recommandée par la communauté (guides Inara Logbook #72929, #94819,
#73614 ; sites.google.com/view/elite-materials/collection/odyssey-loot) :

- **Où** : systèmes en état **Infrastructure Failure** (mission de *réactivation*) ou **Civil Unrest** (mission de
  *restauration*, un peu plus longue).
- **Combinaison recommandée** : Maverick, avec Arc Cutter + Energy Link.
- **Pourquoi c'est efficace** : la mission fournit un **niveau d'autorisation 3**, ce qui neutralise le risque de
  sécurité pendant son exécution (le settlement est considéré comme « désactivé »).
- **Méthode pratique** : atterrir à environ 100 m du settlement, foncer immédiatement rétablir le courant au bâtiment
  PWR (alimentation électrique) pour empêcher l'apparition de vagues de pillards (« scavengers »). Un témoignage
  communautaire rapporte de 0 à 20 pillards observés sur plus de 100 missions selon la rapidité d'exécution — une
  fois le courant rétabli, plus aucun pillard n'apparaît.
- **Astuce avancée (à vos risques) :** il est possible d'abandonner la mission après avoir reçu le régulateur
  d'énergie (Power Regulator) pour le garder — au prix d'une perte de réputation et d'une amende de **100 000 Cr**.
  Méthode dédiée si votre seul objectif est de farmer des Power Regulators.
- **Double bénéfice** : ce grind sert aussi à débloquer l'Engineer **Jude Navarro** (10 missions de
  réactivation/restauration requises, voir section 4.1) — le farming de matériaux et le déblocage d'Engineer avancent
  donc en parallèle.

### 2.2 Corrélation entre type d'économie du settlement et loot

| Type d'économie du settlement | Tendance de loot observée                                  |
|---------------------------------|-----------------------------------------------------------|
| Militaire                      | Plus de schémas d'armes et de combinaisons                |
| Tourisme / Hi-Tech             | Plus de Data, moins de schémas                             |
| Extraction                      | Plus d'Assets Tech, moins de schémas                       |
| Agricole / Industriel           | Répartition équilibrée entre catégories                   |

*Corrélation rapportée de façon concordante par les guides de farming Inara Logbook consultés ; à traiter comme une
tendance observée par la communauté plutôt qu'une règle codée en dur confirmée par Frontier.*

### 2.3 Niveaux de sécurité des settlements — ne pas confondre avec le niveau d'autorisation

Le niveau de **sécurité** d'un settlement est indiqué en jeu par une icône de bouclier accompagnée d'un texte entre
crochets :

| Icône observée      | Niveau de sécurité |
|-----------------------|------------------------|
| Bouclier vide         | **Low**                |
| Bouclier à moitié plein | **Medium**            |
| Bouclier plein         | **High**               |

*Confirmé par 3 sources indépendantes (Steam Community, Reddit, recoupements multiples).*

Deux précisions pour éviter les confusions fréquentes en forum :

- Les symboles **« + »** accolés au nom d'un settlement (ex. « Baldock Extraction Rigs ++ ») indiquent sa **taille**,
  pas son niveau de sécurité — ce sont deux systèmes d'information distincts affichés côte à côte.
- Le **niveau d'autorisation** (de 0 à 3, obtenu par piratage ou fourni automatiquement par certaines missions comme
  en 2.1) est encore un troisième système, propre à l'accès aux zones et aux casiers d'un settlement donné — il n'est
  pas une propriété du settlement lui-même mais de votre situation à un instant T.

### 2.4 Farming ciblé : schémas d'armes (Item/Goods) via missions de larcin

Missions type *« Larceny: seize [illegal good] from a hidden cache »* : elles mènent à un point d'intérêt marqué
« irregular marker » contenant trois grands conteneurs. Découpez-les à l'Arc Cutter en mode surcharge. Rendement
rapporté : **3 à 5 schémas d'arme par mission**, pour un risque faible (pas de combat nécessaire si le point d'intérêt
est isolé).

### 2.5 Farming ciblé : Data via l'astuce du relog sur balise

Méthode rapportée par plusieurs guides de farming communautaires :

1. Accepter une mission de salvage Odyssey demandant la récupération d'un micro transformer ou d'une carte de
   circuit (circuit board).
2. Localiser la balise de navigation crashée qui porte un point de données.
3. **Télécharger la donnée sans ramasser l'objet de mission physique.**
4. Se tenir sur la balise et **relog** (quitter/relancer le client) pour la faire réapparaître, puis répéter.

Rendement annoncé par un guide communautaire : de l'ordre de **100 unités en moins d'une heure** pour les Manufacturing
Instructions / Operational Instructions et des données secondaires (stellar activity logs, radioactivity data,
topological surveys, mineral surveys). Traitez ce chiffre comme une estimation ponctuelle d'un joueur, pas une
moyenne garantie — le rendement réel dépend de la vitesse d'exécution et de la fréquence de relog tolérée.

Boucle apparentée : missions Horizons *« Liberate n bootleg liquor »*, avec scan du point de données sur le skimmer
crashé sans ramasser l'objet de mission — certains témoignages signalent qu'il faut parfois 9 à 10 tentatives pour
tomber sur le bon point d'intérêt, donc un rendement moins prévisible que la méthode balise ci-dessus.

### 2.6 Farming furtif sans combat dans un settlement actif

Pour cibler spécifiquement Carbon Fibre Plating, Titanium Plating, Tungsten Carbide et Weapon Component sans engager
de combat (source : guide Inara Logbook #73614) :

- **Type de settlement ciblé** : settlements d'**extraction de taille moyenne** (marqués « ++ » dans leur nom,
  ex. Baldock Extraction Rigs, V848 Monocerotis), avec deux grands bâtiments de stockage et un personnel
  majoritairement civil.
- **Méthode** :
  1. Voler le profil de sécurité d'un PNJ extérieur de niveau 1 (scan par-derrière, en position accroupie).
  2. Entrer dans le bâtiment, scanner les PNJ civils intérieurs pour les repérer sur le radar.
  3. Piller les casiers sans être vu — sur le HUD, un **triangle** signale une ligne de vue directe avec un PNJ (zone
     à éviter), un **cercle** signale un PNJ qui vous a scanné hors ligne de vue (moins critique).
  4. Retourner au vaisseau, passer en survitesse (supercruise) puis l'annuler immédiatement pour réinitialiser le
     loot du settlement.
- **Rendement annoncé** : 5 à 10 matériaux par boucle de 10 à 15 minutes, sans combat.

### 2.7 Correction importante : l'exobiologie n'alimente pas l'ingénierie à pied

Une hypothèse de départ raisonnable — que l'échantillonnage exobiologique (Genetic Sampler de la combinaison
Artemis, voir [07-equipement-a-pied.md](./07-equipement-a-pied.md#genetic-sampler-échantillonneur-génétique))
alimente aussi des matériaux d'ingénierie — **est infirmée** par les sources consultées. Le guide officiel Odyssey de
Frontier, le Fandom (via extraits recoupés) et les forums communautaires confirment tous que les échantillons du
Genetic Sampler ne servent qu'à débloquer des entrées **Codex** et à être vendus contre des crédits à **Vista
Genomics** (voir [10-exploration.md](./10-exploration.md)) — ce n'est pas un matériau d'ingénierie.

Le matériau nommé **« Biological Sample »** (utilisé par exemple dans le parrainage d'Oden Geiger, section 1.4) est en
réalité obtenu **dans les settlements** — pas via le scan exobiologique. Il s'agit d'une simple coïncidence de
nommage thématique entre deux systèmes de jeu par ailleurs indépendants : ne planifiez pas une session
d'exobiologie dans l'espoir d'en tirer des matériaux d'ingénierie à pied.

### 2.8 Localisations spécifiques citées par la communauté

**À vérifier sur place** : la génération procédurale et les mises à jour de Frontier peuvent faire évoluer ou
disparaître des settlements nommés au fil du temps — traitez ce tableau comme un point de départ, pas une garantie.
Nuance importante entre les quatre entrées : **Dav's Hope** et le **Jameson Crash Site** sont des sites uniques,
fixes et placés à la main par Frontier (non régénérés proceduralement, contrairement à un settlement ordinaire), donc
plus stables dans le temps que les stations économiques nommées d'**Iah Bulu** ou le settlement d'**Friedrich
Industrial Silo**, qui sont des installations procédurales ordinaires et peuvent réellement évoluer.

| Lieu                                                    | Intérêt principal                                                                  |
|-----------------------------------------------------------|----------------------------------------------------------------------------------|
| **Iah Bulu** (système)                                     | Cité comme le plus populaire pour le farming toutes catégories, regroupe trois économies proches : *Arai's Mine* (Extraction), *Bhule Engineering Hub* (Industriel), *Mitchell Resort* (Tourisme) |
| **Jameson Crash Site** (HIP 12099 1 B)                      | Data encodées, via scan des balises de données + relog (méthode 2.5), sans combat ; site fixe non procédural |
| **Dav's Hope** (Hyades Sector DR-V c2-23 A 5)               | Settlement abandonné, parcouru en SRV, matériaux manufacturés variés ; cité aussi comme meilleure source précoce de Chemical Processors ; site fixe non procédural |
| **Selenium Farm** (HR 3230 3AA, coord. 52.6000 \| -165.8786) | Matériaux bruts au SRV — pertinent surtout pour l'ingénierie de vaisseau, moins pour l'équipement à pied |
| **Friedrich Industrial Silo** (HIP 7869)                    | Pad de données SEC à ~20 m de l'entrée, spécifiquement pour farmer les Settlement Defence Plans (spawn rare, environ une fois tous les 20 cycles ; il en faut 15 pour un déblocage complet, soit environ 10h de répétition selon l'auteur du guide) |

## 3. Quantités de matériaux par palier de modification

### 3.1 Pourquoi il n'y a pas de paliers G1-G5 côté équipement à pied

Cette recherche confirme ce que [07-equipement-a-pied.md](./07-equipement-a-pied.md#modifications-de-combinaison-blueprints)
signalait déjà comme lacune : **contrairement aux modules de vaisseau** (dont les blueprints sont gradués G1-G5, voir
[06-ingenieurs.md](./06-ingenieurs.md)), **chaque modification d'équipement à pied a une seule recette fixe de
matériaux**, non graduée. Il n'existe donc pas de tableau « palier 1 → palier 5 » à produire pour ces blueprints : la
question n'a pas de réponse plus détaillée à trouver, elle n'a simplement pas cette structure côté Odyssey.

### 3.2 Exemples de recettes exactes vérifiées

En revanche, il a été possible d'obtenir les **quantités exactes** de plusieurs blueprints précis, directement depuis
les pages Engineer individuelles d'Inara.cz (données à jour au moment de la recherche, **re-vérifiées lors de la
révision de ce guide** — une hypothèse adverse doutait de l'existence même de l'Engineer « Hero Ferrari » ; une
nouvelle consultation directe de `inara.cz/elite/engineer/28/` confirme qu'il s'agit bien d'un Engineer Odyssey réel,
spécialisé combat de surface et modifications de combinaison, basé à Nevermore Terrace dans le système Siris, et que
la ligne « Faster Handling » ci-dessous correspond exactement à la fiche consultée) :

| Modification                              | Ingénieur         | Matériaux exacts                                                                                   | Coût         |
|---------------------------------------------|--------------------|-------------------------------------------------------------------------------------------------------|---------------|
| Faster Handling (arme principale)          | Hero Ferrari       | 5 Operational Manual, 5 Combatant Performance, 5 Combat Training Material, 3 Viscoelastic Polymer   | 500 000 Cr   |
| Improved Jump Assist (suit)                | Hero Ferrari       | 5 G-Meds, 5 Topographical Surveys, 3 Micro Thrusters, 5 Motor                                        | 750 000 Cr   |
| Increased Air Reserves (suit)              | Hero Ferrari       | 3 Pharmaceutical Patents, 8 Air Quality Reports, 5 Oxygenic Bacteria, 8 pH Neutraliser               | 750 000 Cr   |
| Increased Sprint Duration (suit)           | Hero Ferrari       | 3 Troop Deployment Records, 3 Gene Sequencing Data, 3 Clinical Trial Records, 5 Oxygenic Bacteria, 8 Chemical Catalyst | 750 000 Cr |
| Noise Suppressor (arme principale)         | Hero Ferrari       | 5 Atmospheric Data, 5 Mining Analytics, 8 Viscoelastic Polymer, 3 Weapon Component                   | 1 000 000 Cr |
| Extra Backpack Capacity (suit)             | Wellington Beck    | 5 Weapon Inventory, 5 Chemical Inventory, 5 Digital Designs, 5 Epoxy Adhesive, 3 Memory Chip          | 750 000 Cr   |
| Greater Range (Kinematic Armaments)        | Wellington Beck    | 10 Ballistics Data, 10 Topographical Surveys, 10 Metal Coil, 10 RDX, 5 Weapon Component               | 500 000 Cr   |
| Greater Range (Manticore)                  | Wellington Beck    | 10 Chemical Formulae, 15 Mineral Survey, 10 Motor, 10 Electromagnet, 5 Electrical Fuse                | 500 000 Cr   |
| Greater Range (Takada)                     | Wellington Beck    | 5 Stellar Activity Logs, 8 Risk Assessments, 8 Micro Transformer, 3 Optical Lens, 3 Circuit Board     | 500 000 Cr   |
| Improved Battery Capacity (suit)           | Wellington Beck    | 5 Reactor Output Review, 8 Maintenance Logs, 3 Ion Battery, 5 Micro Supercapacitor, 5 Electrical Wiring | 750 000 Cr |
| Reduced Tool Battery Consumption (suit)    | Wellington Beck    | 5 Reactor Output Review, 3 Electrical Fuse, 5 Micro Transformer, 8 Electrical Wiring                  | 500 000 Cr   |
| Scope (arme principale)                    | Wellington Beck    | 5 Spectral Analysis Data, 3 Biometric Data, 5 Optical Lens, 3 Optical Fibre                            | 500 000 Cr   |

*Quantités capturées sur inara.cz/elite/engineer/28/ (Hero Ferrari) et inara.cz/elite/engineer/30/ (Wellington Beck)
le 9 septembre 2026 ; ligne Hero Ferrari / Faster Handling recontrôlée à l'identique lors de la révision du même
jour. On observe que les quantités par matériau varient typiquement entre 3 et 15 unités selon le blueprint — cette
fourchette est cohérente avec ce que rapporte la page Inara d'Uma Laszlo pour ses propres modifications, sans qu'un
détail exhaustif matériau par matériau ait pu en être extrait pendant la rédaction.*

Notez, en cohérence avec [07-equipement-a-pied.md](./07-equipement-a-pied.md#modifications-darmes-blueprints), que la
recette varie aussi **selon le fabricant de l'arme** (Kinematic Armaments, Manticore, Takada) pour un même effet —
c'est visible ci-dessus sur les trois lignes « Greater Range », dont les matériaux ne se recoupent quasiment pas d'un
fabricant à l'autre.

### 3.3 Où trouver la liste exhaustive et à jour

Une feuille Google Sheets communautaire (« Odyssey Engineer Upgrade Cheat Sheet », référencée sur les forums
Frontier, censée agréger tous les blueprints) **n'est plus accessible** (erreur HTTP 410 Gone constatée au moment de
la recherche) : ne cherchez pas cette ressource, elle n'existe plus.

**Recommandation pour ne pas dépendre d'un tableau qui deviendra obsolète** : consultez les pages Engineer
individuelles d'**Inara.cz** (`inara.cz/elite/engineer/<id>/`) et/ou l'outil **EDOMH** (section 5) pour la liste
exhaustive et à jour des quantités par blueprint, plutôt qu'un tableau figé dans ce guide.

## 4. Ordre de progression recommandé

### 4.1 Effort de déblocage des trois Engineers de départ

| Engineer            | Condition de déblocage                                           | Effort relatif                                                                 |
|-----------------------|-------------------------------------------------------------------|---------------------------------------------------------------------------------|
| **Domino Green**      | Voyager 100 années-lumière en navette/taxi (Apex)                | **Le plus rapide et le plus facile — zéro combat.**                          |
| **Jude Navarro**      | 10 missions de restauration/réactivation de settlement           | Effort modéré ; **ce grind sert en même temps de méthode principale de farming de matériaux** (section 2.1) — double bénéfice |
| **Hero Ferrari**      | 10 zones de conflit de surface (combat)                          | **Le plus long/difficile pour un joueur non orienté combat**, mais nécessaire tôt si l'objectif est le combat ; existence et spécialité reconfirmées en révision (voir 3.2) |
| **Terra Velasquez** (2ᵉ maillon de la chaîne Jude Navarro) | 6 Covert Heists + 6 Covert Thefts | Signalé comme le maillon le plus long à débloquer toutes chaînes confondues |

*Pour la liste complète des neuf Engineers Core et des quatre Engineers de Colonia (positions dans les chaînes,
spécialités), voir le tableau déjà établi dans
[07-equipement-a-pied.md](./07-equipement-a-pied.md#les-engineers-à-pied) — non reproduit ici.*

### 4.2 Priorité recommandée selon l'objectif

| Objectif                              | Ordre recommandé                                                                         | Justification |
|------------------------------------------|-------------------------------------------------------------------------------------------|----------------|
| **Polyvalent / early game**             | Domino Green → Jude Navarro                                                              | Les deux chaînes les moins coûteuses à démarrer ; le grind Jude Navarro finance déjà le farming de matériaux (2.1) ; couvrent à elles deux Extra Backpack Capacity, Enhanced Tracking, Reload Speed, Extra Ammo Capacity |
| **Combat**                              | Hero Ferrari en priorité, malgré son coût plus élevé                                    | Ses mods et ceux de sa chaîne (Wellington Beck, Uma Laszlo) couvrent Faster Handling, Damage Resistance, Faster Shield Regen, Headshot Damage, Reload Speed — pertinent dès que le joueur engage des zones de conflit de toute façon |
| **Exploration / exobiologie**           | Domino Green → Kit Fowler → Yarden Bond, et/ou Hero Ferrari → Terra Velasquez → Oden Geiger | Couvrent Improved Jump Assist, Increased Air Reserves/Sprint Duration, Night Vision — cohérent avec le tableau playstyle de [07-equipement-a-pied.md](./07-equipement-a-pied.md#exploration-et-exobiologie) |
| **Discrétion / infiltration**           | Jude Navarro → Terra Velasquez → Oden Geiger, et Domino Green → Kit Fowler → Yarden Bond   | Nécessaires pour Quieter Footsteps, Audio Masking, Night Vision — mais Terra Velasquez impose la barrière la plus lourde (6 covert heists + 6 covert thefts, voir 4.1) : à planifier en dernier ou en parallèle d'un farming déjà lancé, pas comme premier objectif isolé |

### 4.3 Un point de vue alternatif, à ne pas citer comme consensus

Un guide indépendant (« Falcon's Guide to Unlocking Odyssey Engineers », référencé sur Reddit mais dont le contenu
n'a pas pu être vérifié directement — Reddit étant intégralement bloqué au fetch, y compris via proxy, dans cet
environnement de recherche, à nouveau constaté lors de la révision) proposerait un ordre par temps d'investissement :
**Jude Navarro → Terra Velasquez → Hero Ferrari → Domino Green**. Cet ordre traite Domino Green en dernier alors
qu'il est objectivement le moins coûteux à débloquer (4.1) — il contredit donc partiellement la logique ci-dessus. Il
est mentionné ici comme point de vue alternatif existant dans la communauté, **pas** comme une vérité communautaire
unanime à suivre telle quelle.

## 5. Outils communautaires et suivi d'inventaire

### 5.1 EDOMH (Elite Dangerous Odyssey Materials Helper)

- **Nom complet** : Elite Dangerous Odyssey Materials Helper, auteur **Jixxed**, licence GPL-3.0, actif depuis le
  31 janvier 2023, écrit en Java.
- **Dépôt GitHub** : https://github.com/jixxed/ed-odyssey-materials-helper (394+ étoiles au moment de la recherche,
  mises à jour récentes).
- **Site officiel** : https://edomh.nl.
- **Fonctionnalités confirmées** :
  - Lecture des fichiers journal + API Frontier pour un suivi d'inventaire en temps réel.
  - Affichage des matériaux nécessaires par arme, suit, blueprint ou déblocage d'Engineer.
  - Éditeur de loadout avec prévisualisation des effets.
  - **Overlay in-game** affichant la pertinence des matériaux directement aux terminaux de données (« Bartender
    overlay », visible en capture d'écran sur le site officiel) — utile pour décider sur-le-champ si un matériau
    trouvé vaut la peine d'être ramassé.
  - Suivi de Fleet Carrier.
  - Import de wishlist depuis EDSY/Coriolis.
  - Son schéma de documentation des événements journal (`schemas.edomh.nl`), consulté pour ce guide, confirme au
    passage la structure en quatre catégories `Items/Components/Consumables/Data` du fichier `ShipLocker.json`
    (section 1.1).
- **A évolué pour couvrir aussi l'ingénierie de vaisseau**, pas seulement l'équipement à pied (confirmé par un fil
  d'annonce sur les forums Frontier) — un seul outil peut donc servir aux deux volets du corpus (celui-ci et
  [06-ingenieurs.md](./06-ingenieurs.md)).
- **Plateformes** : Windows et Linux.

### 5.2 Alternatives et compléments

| Outil                                  | Rôle                                                                                       | Statut de vérification |
|-------------------------------------------|---------------------------------------------------------------------------------------------|----------------------------|
| **EDEngineer**                           | Tracker de matériaux plus ancien et plus généraliste (toutes catégories confondues, y compris vaisseau) ; déjà cité pour ses plafonds de stockage vaisseau dans [06-ingenieurs.md](./06-ingenieurs.md#plafonds-de-stockage-des-matériaux) | Confirmé comme outil existant, mais moins spécialisé que EDOMH pour l'à-pied |
| **Odyssey Mapping Guide (OMG)**          | Localiser, pour chacune des 28 variantes de layout de settlement, l'emplacement du bâtiment CMD, du régulateur d'énergie (PWR) et de la console d'alarme | **Non vérifié** — site source (newp.io) indisponible (erreur serveur 521) pendant la recherche initiale, toujours non testé lors de la révision faute de nouvelle piste ; à re-vérifier avant de s'y fier |
| **Inara.cz — Logbook**                   | Guides de farming communautaires détaillés et datés (inara.cz/elite/logbook/) — bonne source de veille continue | Confirmé, sources principales de la section 2 de ce guide |
| **EDSM — recherche de stations**         | Recherche de stations par service, incluant « Material Trader » (edsm.net/en/search/stations/index/service/71) — utile pour localiser un bartender proche | Confirmé (service EDSM existant) |

## Lacunes de recherche à garder à l'esprit

Ce guide assume explicitement ces limites plutôt que de les combler par des chiffres inventés :

1. **Valeurs exactes du « score de troc » par matériau** au bartender (section 1.2) — introuvables malgré la
   recherche initiale et la relecture faite en révision ; seul le principe (score cumulatif, perte de l'excédent, et
   confirmation qu'une seule classe de matériaux est réellement échangeable) est confirmé.
2. **Plafond exact du casier de bord (Ship Locker)** : la structure en catégories séparées est confirmée par le
   schéma journal, mais le chiffre de 1000 unités par catégorie, largement rapporté par la communauté, **n'a pas pu
   être reconfirmé par une source primaire lors de la révision** — traitez-le comme une estimation communautaire non
   garantie, à vérifier en jeu.
3. ~~Nombre exact d'unités requises pour débloquer Wellington Beck~~ — résolu depuis : **15 unités**, confirmé par
   relecture directe de la page Engineer d'Inara.cz le 9 septembre 2026 (voir section 1.4).
4. **Limite de stock du bartender NPC lui-même** (par opposition au plafond de stockage joueur — point 2 ci-dessus)
   — non documentée dans les sources consultées, initiales comme en révision.
5. **Tableau complet des quantités par blueprint**, au-delà des douze exemples de la section 3.2 — la ressource qui
   prétendait l'agréger (Google Sheet communautaire) n'est plus en ligne ; utilisez Inara.cz ou EDOMH en lien vivant.
6. **URL exacte et statut actuel de l'Odyssey Mapping Guide (OMG)** (section 5.2) — site source indisponible au
   moment de la recherche initiale et non retesté en révision.

Si vous disposez d'une source fiable et à jour comblant l'une de ces lacunes, elle mérite de remplacer la mention
correspondante ci-dessus plutôt que d'être ajoutée à côté.

## Voir aussi

- [07-equipement-a-pied.md](./07-equipement-a-pied.md) — combinaisons, armes, outils et tableaux complets des
  blueprints à pied (effets, Engineers, coûts) dont ce guide ne reprend que des extraits ciblés.
- [06-ingenieurs.md](./06-ingenieurs.md) — mécanique générale de l'ingénierie (vaisseaux), grades, matériaux
  Raw/Manufactured/Encoded, plafonds de stockage, effets expérimentaux.
- [09-combat-a-pied.md](./09-combat-a-pied.md) — déroulement tactique du combat au sol, pertinent pour les missions
  de la section 2 impliquant un raid actif.
- [13-operations.md](./13-operations.md) — gameplay au sol générique (settlements, missions, piratage).
- [10-exploration.md](./10-exploration.md) — exobiologie complète (espèces, rangs, primes) ; voir la section 2.7 de
  ce guide pour la clarification sur ce qu'elle n'alimente pas.
- [18-colonisation.md](./18-colonisation.md) — colonisation de systèmes et construction de settlements, contexte
  direct de nombreux lieux de farming évoqués ici.
- [00-glossaire.md](./00-glossaire.md) — définitions des sigles utilisés (CZ, USS, RES, etc.).

## Sources

Sources consultées lors de la recherche initiale :

- https://hosting.zaonce.net/community/journal/v32/Journal_Manual-v32.pdf (Manuel officiel du Journal Elite Dangerous, Frontier Developments — champ `Category`)
- https://inara.cz/elite/engineers/
- https://inara.cz/elite/engineer/28/ (Hero Ferrari)
- https://inara.cz/elite/engineer/30/ (Wellington Beck)
- https://inara.cz/elite/engineer/32/ (Uma Laszlo)
- https://inara.cz/elite/engineer/34/ (Oden Geiger)
- https://inara.cz/elite/logbook/72929/ (guide de farming Odyssey)
- https://inara.cz/elite/logbook/94819/ (localisations de farming)
- https://inara.cz/elite/logbook/73614/ (farming Carbon Fibre/Titanium/Tungsten/Weapon Component)
- https://inara.cz/elite/logbook/72975/ (guide de priorité des mods de suit)
- https://inara.cz/elite/market-materials/
- https://edcodex.info/?m=tools&entry=582 (fiche EDOMH)
- https://edomh.nl (site officiel EDOMH)
- http://schemas.edomh.nl/ et http://schemas.edomh.nl/TradeMicroResources.html
- https://github.com/jixxed/ed-odyssey-materials-helper
- https://sites.google.com/view/elite-materials (et sous-pages : others/material-trading, others/tech-broker, engineering/odyssey, collection/odyssey-loot)
- https://www.edfieldmanual.com
- https://steamcommunity.com/sharedfiles/filedetails/?id=3180267811 (Ground Combat Modules)
- https://steamcommunity.com/sharedfiles/filedetails/?id=2564982187 (Best Tools and Resources)
- https://steamcommunity.com/app/359320/discussions/0/1637543304842416578/ (chemical processors)
- https://forums.frontier.co.uk/threads/can-someone-explain-bartering-bartender-in-the-concourse.577148/ (mécanisme du score de troc)
- https://forums.frontier.co.uk/threads/which-items-to-keep-trade-sell-with-bartender-list-to-highlight-engineer-weapon-suit-which-to-sell-trade-with-bartender.632434/
- https://forums.frontier.co.uk/threads/presenting-the-odyssey-engineer-upgrade-cheat-sheet-wip-it-shows-the-materials-required-for-suit-and-weapon-upgrades-materials-for-mods-etc.578437/ (ressource désormais HTTP 410 Gone)
- https://forums.frontier.co.uk/threads/guide-to-farming-settlement-defense-plans.599612/
- https://forums.frontier.co.uk/threads/the-definitive-guides-to-stealth-and-infiltration-in-odyssey.580069/
- https://www.elitedangerous.com/en-US/news/odyssey-guide (guide officiel Frontier)
- https://newp.io/ody-stealth (site indisponible au fetch direct — erreur 521)
- elite-dangerous.fandom.com/wiki/Assets, /wiki/Biological_Sample, /wiki/Vista_Genomics, /wiki/Genetic_Sampler, /wiki/Materials, /wiki/Goods (accès direct systématiquement bloqué HTTP 402, y compris lors de la révision)
- https://popwave.ai/down-to-earth-astronomy/blog/elite-dangerous-materials-guide (fetch direct impossible, y compris lors de la révision — connexion refusée)
- https://www.edsm.net/en/ (recherche de stations par service « Material Trader »)

Sources consultées spécifiquement lors de la passe de vérification adversariale (le 9 septembre 2026) :

- http://schemas.edomh.nl/ShipLocker.html (schéma du fichier `ShipLocker.json` — confirme les quatre catégories `Items`/`Components`/`Consumables`/`Data` et infirme l'hypothèse de six catégories natives incluant Chemical/Circuit/Tech)
- https://inara.cz/elite/engineer/28/ (recontrôle : confirme l'existence de Hero Ferrari, sa spécialité combat de surface/combinaison, sa localisation à Nevermore Terrace (Siris), et les quantités exactes du blueprint Faster Handling)
- https://r.jina.ai/https://forums.frontier.co.uk/threads/which-items-to-keep-trade-sell-with-bartender-list-to-highlight-engineer-weapon-suit-which-to-sell-trade-with-bartender.632434/ (cite 25 unités pour Wellington Beck et 20 pour Oden Geiger — en désaccord avec Inara sur le premier chiffre)
- https://r.jina.ai/https://forums.frontier.co.uk/threads/can-someone-explain-bartering-bartender-in-the-concourse.577148/ (confirme le principe du score de troc et qu'une seule classe de matériaux est réellement échangeable)
- https://elite-dangerous.fandom.com/wiki/Hero_Ferrari (tentative de recoupement — bloqué HTTP 402)
- https://elite-dangerous.fandom.com/wiki/Materials (tentative de recoupement — bloqué HTTP 402)
- https://elite-dangerous.fandom.com/wiki/Dav%27s_Hope (tentative de recoupement — bloqué HTTP 402)
- https://hosting.zaonce.net/community/journal/v32/Journal_Manual-v32.pdf (relecture — PDF fortement compressé, n'a pas permis d'extraire une liste explicite des valeurs du champ `Category`)
- https://github.com/EDCD/EDDN (tentative de recoupement du schéma journal EDCD — page introuvable, 404)
- https://sites.google.com/view/elite-materials/others/material-trading (tentative de confirmation du plafond de 1000 unités — aucune mention trouvée)
