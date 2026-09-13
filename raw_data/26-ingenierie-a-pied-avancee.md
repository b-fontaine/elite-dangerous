---
id: 26-ingenierie-a-pied-avancee
titre: "Ingénierie avancée de l'équipement à pied : farming, échange et optimisation"
domaine: vaisseaux-equipement
entites: [Bartender, Ship Locker, Manufacturing Instructions, Suit Schematic, Power Regulator, Data point, Dav's Hope, Jameson Crash Site, EDOMH, Domino Green, Jude Navarro, Rosa Dayette]
mots_cles_en: [bartender, ship locker, manufacturing instructions, suit schematic, on-foot materials, settlement raid, data point, power regulator, odyssey engineers, EDOMH]
version_jeu_couverte: "mécaniques Odyssey inchangées depuis le Type-8 Update d'août 2024 ; données de référence édition 2026-08, non revues pour la 4.4.0.x"
branche: live
date_verification: 2026-09-13
confiance_globale: haute
volatilite: haute
sources_primaires: [Manuel officiel du Journal Frontier v32, Inara.cz pages Engineer et Logbook, schemas.edomh.nl, forums Frontier, EDCD/FDevIDs, EDCD/coriolis-data, "Pilots Trade Network — Odyssey Beginner's Guide, consulté le 13 septembre 2026 (absence de synthèse à pied)"]
zones_incertaines: ["Les valeurs de score de troc au bartender ne sont connues que pour le Graphene et l'Aerogel", "Le plafond du casier de bord de 1000 unités par catégorie n'a pas pu être reconfirmé sur une source primaire", "Le comportement du plafond de stockage sur Fleet Carrier n'est pas tranché", "La limite de stock du bartender lui-même n'est documentée nulle part", "Le tableau complet des quantités par blueprint n'existe plus en ligne", "L'URL et le statut actuel de l'Odyssey Mapping Guide sont inconnus, le site répondant en erreur 521", "Les montants en crédits des paliers de combinaison viennent du wiki Fandom seul", "Le tarif au comptoir du Carbon Fibre Plating et du Titanium Plating n'est relevé par aucune source", "Les coordonnées de Selenium Farm ne sont couvertes par aucune donnée de référence", "Le contenu de Falcon's Guide n'a pas pu être vérifié, Reddit étant bloqué"]
guides_lies: [0, 6, 7, 9, 10, 13, 18]
---

# Ingénierie avancée de l'équipement à pied : farming, échange et optimisation

## En bref

L'ingénierie avancée de l'équipement à pied porte sur le farming, le troc et l'ordre de déblocage des Engineers. Le
journal du jeu ne connaît que quatre catégories de matériaux — `Item`, `Component`, `Data`, `Consumable` — et
« Chemical », « Circuit » et « Tech » n'en sont qu'une subdivision interne, regroupée sous le nom d'**Assets** : seuls
ces Assets s'échangent entre eux au comptoir du **bartender**, selon un score de troc cumulatif dont l'excédent est
perdu (Graphene : coût 23, cession 13 ; Aerogel : 9 et 5). Le bartender achète les *Goods* et les *Data* sans jamais en
revendre, si bien que **Suit Schematic**, **Health Monitor** et **Manufacturing Instructions** ne s'obtiennent que par
pillage de settlement ou récompense de mission ; le troisième est le goulot d'étranglement, avec 22 unités à réunir
entre une montée en grade complète et le parrainage de Rosa Dayette. Les missions de réactivation en système
*Infrastructure Failure* restent la méthode reine ; **Dav's Hope** (50.5426 | 137.415) et le **Jameson Crash Site**
(-54.375358 | -50.353342) sont les deux sites fixes. L'exobiologie n'alimente pas cette ingénierie.

## Périmètre de ce guide et renvois

> **Voir aussi** — ce guide est un complément avancé, centré sur le *farming*, l'échange et l'optimisation des
> matériaux d'ingénierie de l'équipement individuel. Il ne reprend pas les tableaux déjà établis ailleurs dans le
> corpus : pour la liste complète des blueprints de combinaison et d'arme (effets, Engineers, coûts en crédits), voir
> [07-equipement-a-pied.md](./07-equipement-a-pied.md#lingénierie-à-pied-engineering-dodyssey--engineers-blueprints-et-modifications-irréversibles) ; pour la mécanique générale de
> l'ingénierie côté vaisseaux (grades, matériaux Raw/Manufactured/Encoded, effets expérimentaux) et pour la référence
> de ce que « effet expérimental » signifie dans ce jeu, voir [06-ingenieurs.md](./06-ingenieurs.md). Ce document
> suppose que vous avez déjà lu au moins l'un des deux.

## Vue d'ensemble : ce que ce guide ajoute à l'ingénierie à pied d'Odyssey

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
3. **Une partie des lacunes ci-dessus est comblée hors ligne par un jeu de données de référence daté et sourcé** —
   ajout postérieur à la recherche initiale. Là où le guide constatait l'inaccessibilité des wikis en ligne, ces
   données donnent les provenances de terrain des composants et les conditions qui s'y attachent, les coordonnées des
   deux sites fixes de récolte, et les paliers chiffrés des trois combinaisons. Les sections **1.2**, **1.3**, **1.5**,
   **2.8**, **2.9** et **3.4** en sont issues et le signalent chacune par une ligne de sourcage.

## 1. Catégories de matériaux à pied et règles d'échange

### 1.1 Les quatre catégories officielles du journal vs le regroupement communautaire Goods/Assets/Data

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

**Deux tarifs de comptoir connus (lacune partiellement comblée).** Cette lacune n'est plus totale : le coût
d'acquisition et la valeur de cession sont chiffrés pour deux des sept composants de combinaison, ce qui donne les
deux seules valeurs de score réellement connues du corpus.

| Matériau     | Coût d'acquisition au comptoir | Valeur de cession | Lecture pratique                                                     |
|--------------|-------------------------------:|------------------:|----------------------------------------------------------------------|
| **Graphene** |                             23 |                13 | La monnaie de troc la plus généreuse des deux à la cession            |
| **Aerogel**  |                              9 |                 5 | Le moins cher des deux à l'acquisition                                |

On en tire une règle directement actionnable : céder un Graphene rapporte 13 et un Aerogel coûte 9, donc **échanger
du Graphene contre de l'Aerogel est rentable et l'inverse coûteux**. Autrement dit, un seul Graphene cédé
finance un Aerogel avec 4 points de reste — alors qu'il faut en céder cinq (5 × 5 = 25 points) pour couvrir le coût
d'un seul Graphene (23), en perdant au passage les 2 points excédentaires, conformément au principe énoncé plus
haut. **Les cinq autres composants ne sont couverts par aucune source sur ce point** : ni coût d'acquisition, ni
valeur de cession.

*Sourcage : données de référence du dépôt, édition 2026-08 ; sources amont déclarées, EDCD/FDevIDs et l'étude interne
`docs/faisabilite-spansh-temps-reel-materiaux.md` § 3.2, 3.4 et 3.5.*

### 1.3 Ce qui est échangeable au comptoir du bartender, ce qui ne l'est pas

| Situation                                                             | Échangeable au bartender ?                              | Confirmé par |
|------------------------------------------------------------------------|-------------------------------------------------------------|--------------|
| Chemical ↔ Circuit ↔ Tech (entre les trois sous-catégories d'Assets)  | **Oui**                                                      | 3 sources indépendantes (sites.google.com/view/elite-materials, guide Steam « Goods, Assets, Data », fil Frontier « three classes ») + témoignage relu en révision confirmant qu'une seule classe est réellement échangeable |
| Data ↔ n'importe quelle autre catégorie                               | **Non**                                                      | Absence de toute mention contraire ; un fil Reddit demandant cette fonctionnalité (« Bartenders should be able to trade on foot data materials ») confirme par son existence même qu'elle n'existe pas. À ne pas confondre avec l'**Encoded Material Trader** des matériaux de vaisseau (Raw/Manufactured/Encoded, voir [06-ingenieurs.md](./06-ingenieurs.md)) : ce dernier est un service totalement distinct, réservé aux matériaux d'ingénierie de vaisseau, et ne concerne pas le `Data` à pied de ce guide |
| Item/Goods ↔ Assets ou Data                                            | Non documenté comme praticable                                | — |
| Remise ciblée de Data pour valider une condition de déblocage/parrainage d'Engineer | **Oui, mais ce n'est pas un troc matériau-contre-matériau** — voir 1.4 | Pages Engineer Inara + fil Frontier « Which Items to keep, trade & sell with bartender » |

**Précision décisive : le comptoir est asymétrique.** La règle se formule sans ambiguïté — le bartender ne revend que
les *Assets* ; il achète les *Goods* et les *Data* contre crédits, mais n'en revend jamais. Trois conséquences que le
tableau ci-dessus ne disait pas explicitement :

1. Les **Goods** et les **Data** ne sont pas hors de portée du comptoir : le bartender les **achète contre crédits**.
   Ce qu'il ne fait jamais, c'est en **fournir** en échange de quoi que ce soit.
2. **Suit Schematic**, **Health Monitor** (Goods) et **Manufacturing Instructions** (Data) ne s'obtiennent donc
   **que par pillage de settlement ou par récompense de mission** — aucun raccourci par le comptoir n'existe.
3. Corollaire pratique pendant une montée en grade de combinaison (section 3.4) : ne vendez surtout pas ces trois
   composants au bartender pour faire des crédits, vous ne pourrez pas les racheter. L'avertissement vaut nommément
   pour le **Suit Schematic**, le plus cher des cinq à 50 000 Cr : ne jamais le céder au comptoir pendant une montée
   en grade.

*Sourcage : données de référence du dépôt, édition 2026-08, fiche de la catégorie « Composants de combinaison » et de
sa provenance « comptoir bartender ».*

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

### 1.5 Limites de stock des matériaux à pied (Ship Locker, Fleet Carrier)

| Niveau de stockage                              | Plafond                                                | Statut de confirmation |
|---------------------------------------------------|-----------------------------------------------------------|---------------------------|
| Casier de bord du vaisseau — *Ship Locker*, structure confirmée par le schéma journal (par catégorie `Items`/`Components`/`Data`, séparément) | **Rapporté par la communauté à 1000 unités par catégorie** | **Non retrouvé dans une source primaire lors de la révision** — le schéma `ShipLocker` confirme la structure en catégories séparées, mais aucun document Frontier ni fil consulté cette fois-ci n'a pu reconfirmer le chiffre précis de 1000 ; à vérifier en jeu (l'écran d'inventaire affiche le plafond courant) avant de s'y fier pour planifier un farming de masse |
| Fleet Carrier                                       | Comportement différent signalé par des joueurs (plafond potentiellement partagé entre les 3 catégories) | **Non tranché** — sujet à débat/bug reporté par la communauté, à vérifier en jeu avant de s'y fier |
| Stock du bartender NPC lui-même (quantité qu'il peut offrir par visite) | —                                                       | **Non documenté** dans les sources consultées, y compris lors de la révision |

Contrairement aux matériaux de vaisseau, dont les plafonds de stockage sont documentés par grade dans
[06-ingenieurs.md](./06-ingenieurs.md#plafonds-de-stockage-des-matériaux-dengineering-300-unités-au-grade-1-100-au-grade-5), le plafond à pied ne dépend pas d'un
grade individuel mais s'appliquerait globalement par catégorie dans le **casier de bord** (`ShipLocker`, distinct du
sac à dos du personnage et de la soute à cargaison classique) — la valeur de 1000 unités reste une donnée communément
rapportée mais **non reconfirmée par une source primaire** au moment de cette révision.

**Ce que les données de référence confirment, et ce qu'elles ne couvrent pas.** Elles portent un plafond de stockage
par grade pour les matériaux de vaisseau — **300 unités au grade 1, 250 au grade 2, 200 au grade 3, 150 au grade 4 et
100 au grade 5** — appliqué aux 108 matériaux Raw, Manufactured et Encoded (le détail relève de
[06-ingenieurs.md](./06-ingenieurs.md#plafonds-de-stockage-des-matériaux-dengineering-300-unités-au-grade-1-100-au-grade-5)). En revanche, les **sept composants de
combinaison** ne portent ni plafond ni grade : **le plafond de stockage des matériaux à pied n'est couvert par aucune
source**. Ce silence ne confirme ni n'infirme le chiffre de
1000 unités par catégorie — il confirme seulement que le modèle « plafond par grade » des matériaux de vaisseau **ne
s'applique pas** à l'équipement à pied, ce qui est cohérent avec le paragraphe ci-dessus.

### 1.6 Ne pas confondre le bartender avec le Tech Broker

Le **Tech Broker** (service distinct, vérifié sur sites.google.com/view/elite-materials/others/tech-broker) ne
concerne **pas** les matériaux Odyssey à pied : c'est un service dédié aux armes Guardian hybrides et aux modules de
vaisseau utilisant des matériaux Guardian (par exemple les Sirius Heatsinks). Si vous cherchez un contact d'échange
pour vos matériaux à pied, c'est le **bartender** de la section 1.2-1.3 qu'il vous faut, pas le Tech Broker — les deux
sont des PNJ de station totalement distincts avec des inventaires sans rapport.

### 1.7 Ni avec la synthèse : elle n'existe pas à pied

Troisième confusion à écarter, plus fondamentale que les deux précédentes : **il n'existe aucune synthèse à pied**
(fabrication d'un consommable à partir de matériaux Odyssey), contrairement à la synthèse embarquée du vaisseau
détaillée dans [06 — Ingénieurs](./06-ingenieurs.md). Les six consommables à pied (Medkit, Energy Cell, Frag
Grenade, Shield Disruptor, Shield Projector, E-Breach) se réapprovisionnent uniquement par achat au comptoir Pioneer
Supplies ou par butin — jamais en consommant des matériaux Odyssey via un menu de fabrication. Ce que ce guide décrit
sous le nom d'**ingénierie** (Engineering, sections 3 et 4) est un système entièrement différent : des modifications
irréversibles de combinaison/arme payées en matériaux chez un Engineer physique, sans rapport avec le
réapprovisionnement des consommables. Voir [07 — Équipement à pied](./07-equipement-a-pied.md) pour le détail de ce
réapprovisionnement.

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

### 2.8 Lieux de farming cités par la communauté (Iah Bulu, Dav's Hope, Jameson Crash Site)

**À vérifier sur place** : la génération procédurale et les mises à jour de Frontier peuvent faire évoluer ou
disparaître des settlements nommés au fil du temps — traitez ce tableau comme un point de départ, pas une garantie.
Nuance importante entre les quatre entrées : **Dav's Hope** et le **Jameson Crash Site** sont des sites uniques,
fixes et placés à la main par Frontier (non régénérés proceduralement, contrairement à un settlement ordinaire), donc
plus stables dans le temps que les stations économiques nommées d'**Iah Bulu** ou le settlement d'**Friedrich
Industrial Silo**, qui sont des installations procédurales ordinaires et peuvent réellement évoluer.

| Lieu                                                    | Intérêt principal                                                                  |
|-----------------------------------------------------------|----------------------------------------------------------------------------------|
| **Iah Bulu** (système)                                     | Cité comme le plus populaire pour le farming toutes catégories, regroupe trois économies proches : *Arai's Mine* (Extraction), *Bhule Engineering Hub* (Industriel), *Mitchell Resort* (Tourisme) |
| **Jameson Crash Site** (HIP 12099 1 B, coord. -54.375358 \| -50.353342) | Data encodées, via scan des balises de données + relog (méthode 2.5), sans combat ; site fixe non procédural |
| **Dav's Hope** (Hyades Sector DR-V c2-23 A 5, coord. Live 50.5426 \| 137.415) | Settlement abandonné, parcouru en SRV, matériaux manufacturés variés ; cité aussi comme meilleure source précoce de Chemical Processors ; site fixe non procédural |
| **Selenium Farm** (HR 3230 3AA, coord. 52.6000 \| -165.8786) | Matériaux bruts au SRV — pertinent surtout pour l'ingénierie de vaisseau, moins pour l'équipement à pied |
| **Friedrich Industrial Silo** (HIP 7869)                    | Pad de données SEC à ~20 m de l'entrée, spécifiquement pour farmer les Settlement Defence Plans (spawn rare, environ une fois tous les 20 cycles ; il en faut 15 pour un déblocage complet, soit environ 10h de répétition selon l'auteur du guide) |

#### Coordonnées Live de Dav's Hope et du Jameson Crash Site — et le piège des coordonnées Legacy

Les coordonnées de ces deux sites sont connues, ainsi que le repère (*landmark*) qui permet de vérifier que l'on a
atterri au bon endroit :

| Site                   | Système                  | Corps | Latitude   | Longitude  | Ce qu'on y récolte                                | Repère de contrôle |
|------------------------|--------------------------|-------|-----------:|-----------:|---------------------------------------------------|--------------------|
| **Dav's Hope**         | Hyades Sector DR-V c2-23 | A 5   |    50.5426 |    137.415 | Raw et Manufactured, boucle en SRV                 | *Abandoned Base*   |
| **Jameson Crash Site** | HIP 12099                | 1 B   | -54.375358 | -50.353342 | Encoded G3, G4 et G5 sur environ neuf data points   | *Wrecked Ship*     |

> **Avertissement à lire avant de programmer un atterrissage sur Dav's Hope.** La mise en garde est explicite :
> « Les coordonnées de tous les vieux guides sont celles de Legacy (44.8180, -31.3893) et vous feront atterrir au
> mauvais endroit. Celles-ci sont les coordonnées Live (4.x), confirmées par le landmark *Abandoned Base*. »
> Si un guide, une vidéo ou un signet vous propose 44.8180 / -31.3893, il est périmé : ces coordonnées désignent
> l'emplacement du site dans le client Legacy, pas dans le client Live. Contrôlez le repère *Abandoned Base* après
> l'atterrissage plutôt que de faire confiance au chiffre seul.

Une **seconde épave** est par ailleurs rattachée au Jameson Crash Site, repérée par le landmark *Crashed Ship*, aux
coordonnées **-55.431073 / -49.255156** — utile pour prolonger une boucle de scan de data points. Le corps qui la porte
n'est pas précisé : contrôlez le landmark à l'arrivée.

**Contrôle effectué sur les autres coordonnées déjà présentes dans ce guide** : la seule autre paire de coordonnées
citée plus haut est celle de **Selenium Farm** (HR 3230 3AA, 52.6000 | -165.8786). Ce site **n'est couvert par aucune
donnée de référence** : seuls Dav's Hope et le Jameson Crash Site le sont. Il n'est donc pas possible
de confirmer ni d'infirmer hors ligne que cette paire est bien une coordonnée Live — vérifiez-la sur place avant de
vous y fier, comme le veut l'avertissement en tête de cette section.

*Sourcage : données de référence du dépôt, édition 2026-08, relevé des sites fixes de récolte.*

### 2.9 Les sept composants de combinaison : provenance, conditions et goulot d'étranglement

Sept matériaux, et sept seulement, alimentent la montée en grade des combinaisons ; ils forment à eux seuls la
catégorie « Composants de combinaison ». Tous les autres matériaux d'ingénierie du jeu — les 108 matériaux Raw,
Manufactured et Encoded — relèvent des vaisseaux et sont traités dans [06-ingenieurs.md](./06-ingenieurs.md),
conformément au principe d'une source de vérité unique par sujet.

#### 2.9.1 Les sept composants de combinaison : catégorie Odyssey, valeur et provenance exacte

Ces sept matériaux sont ceux qui alimentent la **montée en grade des combinaisons** (section 3.4). Ils sont typés avec
la terminologie *Good / Data / Asset* de la section 1.1, ce qui recoupe indépendamment le regroupement communautaire
retenu dans ce guide.

| Composant                      | Catégorie Odyssey | Valeur (Cr) | Où le trouver à pied                                                                                                                                                                                                                                 | Achetable au comptoir bartender ?                                                             |
|--------------------------------|-------------------|------------:|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| **Suit Schematic**             | Good              |      50 000 | Settlements High Tech et Industrial, bâtiments CMD, PWR et STO.                                                                                                                                                                                      | **Non** — le bartender achète les Goods et les Data contre crédits, mais n'en revend jamais |
| **Health Monitor**             | Good              |      10 000 | Settlements Industrial, bâtiments IND, MED, RES, HAB et CMD, dans des Lockers. Seul des sept attesté aussi sur **épave de surface**.                                                                                                                                                                       | **Non** — le bartender achète les Goods et les Data contre crédits, mais n'en revend jamais |
| **Manufacturing Instructions** | Data              |       9 000 | Data ports uniquement — settlements Industrial et Extraction (Industrial, Laboratory, Satellite, Extraction Data Port), plus Irregular Markers et Impact Sites. Jusqu'à 3 par data port, et seulement dans les bâtiments de production industrielle. | **Non** — le bartender achète les Goods et les Data contre crédits, mais n'en revend jamais |
| **Graphene**                   | Asset             |       1 300 | Abondant dans les bâtiments Research ; aussi AGRI, HAB et SEC.                                                                                                                                                                                       | **Oui** — coût 23, valeur de cession 13                                                     |
| **Aerogel**                    | Asset             |         500 | Salles LAB et PROC — donc bâtiments RES, IND, EXT et AGRI — via Industrial Locker (S) et Research Locker (L).                                                                                                                                        | **Oui** — coût 9, valeur de cession 5                                                       |
| **Carbon Fibre Plating**       | Asset             |         500 | Comme l'Aerogel, dont il tient la place dans la recette de la combinaison Maverick.                                                                                                                                                                  | Non relevé — *Asset*, donc revendu au comptoir par application de la règle, mais sans tarif chiffré |
| **Titanium Plating**           | Asset             |         500 | Comme l'Aerogel, dont il tient la place dans la recette de la combinaison Dominator.                                                                                                                                                                 | Non relevé — *Asset*, donc revendu au comptoir par application de la règle, mais sans tarif chiffré |

Deux enseignements que ce tableau rend visibles d'un coup d'œil :

- **Manufacturing Instructions est le goulot d'étranglement de toute la progression à pied.** Il n'est ni achetable
  ni vendable, et Rosa Dayette en réclame **10** pour sa recommandation vers Yi Shen. La chaîne de parrainage vers Yi
  Shen — celle qui mène à Night Vision, voir section 4.2 — est donc **en concurrence directe** avec la montée en grade
  des combinaisons pour la même ressource. Il n'existe aucun moyen d'en acheter : seuls les data ports et les
  récompenses de mission en fournissent. *(Le chiffre de « 56 recettes » parfois cité pour ce composant est un calcul
  et non un relevé — voir la mise au point dans
  [07-equipement-a-pied.md](./07-equipement-a-pied.md#monter-une-combinaison-en-grade--la-table-de-référence).)*
- **La valeur en crédits n'est pas un indicateur de rareté utile** : le Suit Schematic vaut 50 000 Cr, soit cent fois
  l'Aerogel, mais c'est le Manufacturing Instructions à 9 000 Cr qui bloquera votre progression.

*Sourcage : données de référence du dépôt, édition 2026-08, fiches des sept composants de combinaison ; sources amont
déclarées, EDCD/FDevIDs et l'étude interne `docs/faisabilite-spansh-temps-reel-materiaux.md` § 3.2, 3.4 et 3.5.*

#### 2.9.2 Les trois provenances communes aux sept composants de combinaison, et leurs conditions

Chaque provenance est typée et assortie de conditions rédigées. Trois d'entre elles valent pour les sept composants de
combinaison sans exception ; deux composants en ajoutent une pour leur compte propre, ce que la section 2.9.4 détaille.

| Provenance                 | Ce qu'elle donne                                                                                                                                                                                                          | Conditions attachées                                                                                                                                                                                                                                                                        |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Pillage de settlement** | Les settlements contrôlés par une faction **Anarchy** n'infligent **aucune amende** : c'est le terrain de farm à privilégier.                                                                            | On peut s'octroyer une **autorisation de sécurité de niveau 3** depuis un terminal du **Command Centre** — le **niveau 2 suffit à éteindre les tourelles** — et **les gardes n'entrent pas dans un bâtiment dont ils n'ont pas le niveau d'accès**. **Rétablir le courant d'abord empêche les scavengers d'apparaître.** |
| **Récompense de mission**  | Depuis le **Type-8 Update (août 2024)**, les récompenses de mission couvrent **les cinq composants de combinaison**, avec des quantités **trois à quatre fois supérieures** à l'avant.                     | Aucune condition attachée. Conséquence directe : **sélectionner ses missions par récompense est devenu plus efficace que piller.**                                                                                                                                            |
| **Comptoir bartender**     | Le bartender **ne revend que les Assets**. Il achète les Goods et les Data contre crédits mais n'en revend jamais.                                                                                          | Aucune condition attachée. Conséquence : Suit Schematic, Health Monitor et Manufacturing Instructions s'obtiennent **uniquement** par pillage ou par mission.                                                                                                                                   |

**Ce que cela change par rapport à la section 2.1.** Les trois conditions de la ligne « pillage » recoupent et
précisent la méthode décrite en 2.1 sur trois points concrets : le niveau d'autorisation 3 peut s'**obtenir sur
place** depuis un terminal du Command Centre (et pas seulement être fourni par une mission de réactivation) ; le
**niveau 2 suffit** si l'objectif se limite à neutraliser les tourelles ; et le comportement des gardes — qui
n'entrent pas dans un bâtiment dont ils n'ont pas le niveau d'accès — donne une règle de repli exploitable en cas
d'alerte. La priorité donnée en 2.1 au rétablissement du courant est, elle, confirmée telle quelle.

**Une correction de calendrier à intégrer à la section 2.1.** La « méthode reine » décrite en 2.1 reste valable, mais
un rééquilibrage daté en déplace le centre de gravité : depuis le **Type-8 Update d'août 2024**, la
**récompense** de la mission pèse plus lourd que le **butin** ramassé pendant son exécution. Lisez donc le libellé des
missions avant de les accepter, plutôt que de les choisir uniquement pour le settlement où elles vous emmènent.

#### 2.9.3 La règle des data points : par sets de quatre

Les *data points* — ces terminaux que l'on scanne pour en télécharger des données — obéissent à une règle de groupe
que ce guide n'énonçait pas jusqu'ici :

> « Les data points vont par **sets de quatre**, avec un **timer de reset rechargé à chaque scan réussi** ; compléter
> le set rend un **Data Point Intel Package** en crédits. Plus la sécurité du site est haute, plus les données sont
> rares — et les défenses fortes. »

Trois conséquences pour la méthode de farming de la section 2.5 :

1. **Le set de quatre est l'unité de travail, pas le point individuel.** Interrompre une boucle après deux scans
   laisse le set incomplet et vous prive du **Data Point Intel Package**, la récompense en crédits versée à la
   complétion du set.
2. **Le timer de reset se recharge à chaque scan réussi** : enchaîner les scans sans temps mort prolonge la fenêtre
   utile, alors qu'une pause la laisse s'épuiser. C'est un argument pour repérer les quatre points avant de scanner
   le premier plutôt que de les chercher un par un.
3. **La sécurité du site est un curseur à double tranchant** : plus elle est haute, plus les données obtenues sont
   rares, mais plus les défenses sont fortes. C'est la contrepartie exacte de la méthode furtive de la section 2.6,
   qui privilégie au contraire les sites civils peu défendus.

Les données de référence précisent en outre que les data points exploitables comprennent les **Private Data Beacons**
des *Degraded* et *Encoded Emissions*, les **satellites**, les **Planetary Outposts** scannés au *Data Link Scanner*
du SRV — **les
Starports ne comptent pas** — et les **missions de scan de surface**, qui rendent souvent des données rares. Pour le
seul composant à pied concerné, **Manufacturing Instructions**, la restriction est plus étroite encore : **data ports
uniquement**, dans les settlements **Industrial** et **Extraction** (types *Industrial*, *Laboratory*, *Satellite* et
*Extraction Data Port*), plus les *Irregular Markers* et les *Impact Sites*, à raison de **3 unités au maximum par
data port** et **seulement dans les bâtiments de production industrielle**. Un point de sécurité utile s'y ajoute :
**les téléchargements interdits sont signalés en violet et déclenchent l'alarme.**

*Sourcage : données de référence du dépôt, édition 2026-08, provenances de type « point de données » des catégories
Encoded et de la fiche Manufacturing Instructions.*

#### 2.9.4 Les matériaux de vaisseau : renvoi, et un décompte à corriger

Les matériaux de vaisseau se procurent par un éventail de provenances bien plus large que ceux de l'équipement à pied.
Une version antérieure de cette section en donnait le décompte suivant : « huit types de source » côté vaisseau, dont
« la catégorie à pied n'en utilise que trois ». **Les deux chiffres sont faux.** Le comptage refait donne **onze** types
de source côté vaisseau et **cinq** côté à pied.

L'erreur vient d'un piège de lecture qui vaut pour tout le corpus : une provenance peut être déclarée au niveau d'une
**catégorie** de matériaux — elle vaut alors pour tous les matériaux qu'elle contient — ou au niveau d'un **matériau**
particulier, et elle ne vaut alors que pour lui. Ne compter que les premières fait disparaître les secondes.

| Niveau de déclaration                    | Côté vaisseau                                                                                                                                                   | Côté à pied                                                              |
|------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| Déclarées au niveau de la **catégorie**  | **8** — émissions de haut grade, récupération d'épave, récompense de mission, comptoir d'échange (*material trader*), scan de vaisseau, sillage (*wake*), prospection de surface, point de données | **3** — pillage de settlement, récompense de mission, comptoir bartender  |
| Ajoutées au niveau d'un **matériau**     | **3 de plus** — minage d'astéroïdes, type de corps planétaire, site fixe                                                                                        | **2 de plus** — point de données, récupération d'épave                    |
| **Total de types distincts**             | **11**                                                                                                                                                          | **5**                                                                     |

Le « trois » de la version antérieure n'était donc exact que pour les provenances déclarées au niveau de la catégorie
« Composants de combinaison » (celles de la section 2.9.2), présentées à tort comme le total. Deux composants ajoutent
en effet pour leur compte propre une provenance que ce décompte faisait disparaître : le **Manufacturing Instructions**
avec les **points de données**, et le **Health Monitor** avec la **récupération sur épave de surface** — la seule des
sept fiches à porter cette provenance, comme le signale déjà le tableau de la section 2.9.1.

**Le détail des provenances côté vaisseau n'est pas repris ici** — économies des material traders, taux de conversion,
comportement des High Grade Emissions, composition fixe des corps atterrissables : il relève de
[06-ingenieurs.md](./06-ingenieurs.md), qui en est la source de vérité pour le corpus. Retenez seulement, pour éviter
la confusion la plus fréquente à pied, que le **material trader** (Raw / Manufactured / Encoded, matériaux de vaisseau)
et le **bartender** (Goods / Assets / Data, matériaux à pied) sont deux services distincts, aux inventaires disjoints —
voir déjà la section 1.6 pour la distinction d'avec le Tech Broker.

*Sourcage : décompte refait par script le 9 septembre 2026 sur les données de référence du dépôt (édition 2026-08), en
additionnant les provenances déclarées au niveau des catégories et celles déclarées au niveau des matériaux.*

## 3. Quantités de matériaux par palier de modification

### 3.1 Pourquoi il n'y a pas de paliers G1-G5 côté équipement à pied

Cette recherche confirme ce que [07-equipement-a-pied.md](./07-equipement-a-pied.md#modifications-de-combinaison-blueprints--les-quatorze-effets-et-leurs-engineers)
signalait déjà comme lacune : **contrairement aux modules de vaisseau** (dont les blueprints sont gradués G1-G5, voir
[06-ingenieurs.md](./06-ingenieurs.md)), **chaque modification d'équipement à pied a une seule recette fixe de
matériaux**, non graduée. Il n'existe donc pas de tableau « palier 1 → palier 5 » à produire pour ces blueprints : la
question n'a pas de réponse plus détaillée à trouver, elle n'a simplement pas cette structure côté Odyssey.

**Nuance à ne pas manquer : deux choses différentes portent le mot « grade » côté Odyssey.** Ce paragraphe vaut pour
les **modifications** (Extra Backpack Capacity, Noise Suppressor, Night Vision…), qui ont bien une recette unique et
non graduée. Il ne vaut **pas** pour la **montée en grade de la combinaison elle-même** (Grade 1 → Grade 5), qui est,
elle, parfaitement graduée en quatre paliers chiffrés — matériaux, crédits et emplacements de modification gagnés.
Cette table existe : elle figure dans
[07-equipement-a-pied.md](./07-equipement-a-pied.md#monter-une-combinaison-en-grade--la-table-de-référence), et la
section 3.4 ci-dessous n'en retient que les volumes à préparer avant une session de récolte. La distinction est
structurante : on **améliore la combinaison** par paliers pour gagner des emplacements, puis on **remplit ces
emplacements** avec des modifications à recette fixe.

### 3.2 Recettes exactes vérifiées de douze blueprints (Hero Ferrari, Wellington Beck)

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

### 3.3 Où trouver la liste exhaustive et à jour des recettes de blueprints à pied

Une feuille Google Sheets communautaire (« Odyssey Engineer Upgrade Cheat Sheet », référencée sur les forums
Frontier, censée agréger tous les blueprints) **n'est plus accessible** (erreur HTTP 410 Gone constatée au moment de
la recherche) : ne cherchez pas cette ressource, elle n'existe plus.

**Recommandation pour ne pas dépendre d'un tableau qui deviendra obsolète** : consultez les pages Engineer
individuelles d'**Inara.cz** (`inara.cz/elite/engineer/<id>/`) et/ou l'outil **EDOMH** (section 5) pour la liste
exhaustive et à jour des quantités par blueprint, plutôt qu'un tableau figé dans ce guide.

### 3.4 Montée en grade de la combinaison : ce que la récolte doit préparer

Contrairement aux modifications (section 3.1), la **montée en grade de la combinaison** est graduée : quatre paliers
mènent du Grade 1 au Grade 5, chacun consommant cinq composants et des crédits, et chacun débloquant un **emplacement
de modification** supplémentaire.

> **La table chiffrée de ces quatre paliers — matériaux palier par palier, montants en crédits, emplacements gagnés, et
> la réserve qui pèse sur les crédits — appartient à
> [07-equipement-a-pied.md](./07-equipement-a-pied.md#monter-une-combinaison-en-grade--la-table-de-référence)**, guide
> de référence de l'équipement à pied, et n'est pas reproduite ici. La présente section ne retient que ce qui commande
> une session de récolte.

**Les volumes à connaître avant de partir farmer.** Une combinaison menée du Grade 1 au Grade 5 consomme, quel que
soit le modèle, **12 Suit Schematic, 12 Health Monitor et 12 Manufacturing Instructions**, plus **28 unités de
Graphene** et **28 unités du matériau de blindage** propre au modèle — Aerogel pour l'Artemis, Carbon Fibre Plating
pour la Maverick, Titanium Plating pour la Dominator.

- **Le blindage et le Graphene dominent le volume** : 28 unités de chacun contre 12 pour les trois autres composants.
  Ce sont aussi les deux seuls composants de type *Asset* de la recette, donc les seuls que le comptoir bartender
  puisse fournir (section 1.3) — c'est là, et là seulement, que le troc a un intérêt réel pendant une montée en grade.
  Pour l'**Artemis**, dont le blindage est l'Aerogel, ce sont exactement les deux matériaux dont le tarif de troc est
  chiffré (section 1.2) ; pour la Maverick et la Dominator, le tarif du blindage reste à relever au comptoir.
- **Le palier G3 → G4 est celui qui casse un plan de récolte** : il double la marche précédente au lieu de la
  prolonger. C'est là que l'on se retrouve typiquement à court de **Manufacturing Instructions**, le goulot
  d'étranglement identifié en 2.9.1 — un matériau qui ne s'achète nulle part et ne se ramasse que sur data port
  (méthode 2.5) ou en récompense de mission.
- **Planifiez la montée en grade et le parrainage de Rosa Dayette ensemble.** Les 12 Manufacturing Instructions d'une
  montée complète et les 10 qu'elle réclame pour sa recommandation vers Yi Shen (section 2.9.1) font **22 unités** d'un
  même matériau introuvable au comptoir. Les découvrir l'une après l'autre, par surprise, coûte une session entière.
- **Sur le seul critère du blindage, la Maverick est la plus rapide à monter** : le **Carbon Fibre Plating** est
  précisément l'un des matériaux que la boucle furtive de la section 2.6 apprend à ramasser sans engager de combat,
  dans les settlements d'extraction de taille moyenne. C'est aussi la combinaison recommandée en 2.1 pour les missions
  de réactivation : les deux méthodes s'alimentent l'une l'autre.

**Ne confondez pas les deux barèmes.** Les coûts de modification cités en section 3.2 (500 000, 750 000 ou
1 000 000 Cr selon le blueprint) relèvent d'un barème entièrement distinct de celui des paliers de grade : on améliore
la combinaison par paliers pour gagner des emplacements, puis on remplit ces emplacements avec des modifications à
recette fixe, facturées séparément.

*Sourcage : volumes recalculés à partir des données de référence du dépôt (édition 2026-08, douze paliers couvrant les
trois combinaisons), dont les sources amont déclarées sont EDCD/coriolis-data et l'étude interne
`docs/faisabilite-spansh-temps-reel-materiaux.md` § 3.2 et 3.3.*

## 4. Ordre de progression recommandé pour débloquer les Engineers à pied

### 4.1 Effort de déblocage des trois Engineers de départ

| Engineer            | Condition de déblocage                                           | Effort relatif                                                                 |
|-----------------------|-------------------------------------------------------------------|---------------------------------------------------------------------------------|
| **Domino Green**      | Voyager 100 années-lumière en navette/taxi (Apex)                | **Le plus rapide et le plus facile — zéro combat.**                          |
| **Jude Navarro**      | 10 missions de restauration/réactivation de settlement           | Effort modéré ; **ce grind sert en même temps de méthode principale de farming de matériaux** (section 2.1) — double bénéfice |
| **Hero Ferrari**      | 10 zones de conflit de surface (combat)                          | **Le plus long/difficile pour un joueur non orienté combat**, mais nécessaire tôt si l'objectif est le combat ; existence et spécialité reconfirmées en révision (voir 3.2) |
| **Terra Velasquez** (2ᵉ maillon de la chaîne Jude Navarro) | 6 Covert Heists + 6 Covert Thefts | Signalé comme le maillon le plus long à débloquer toutes chaînes confondues |

*Pour la liste complète des neuf Engineers Core et des quatre Engineers de Colonia (positions dans les chaînes,
spécialités), voir le tableau déjà établi dans
[07-equipement-a-pied.md](./07-equipement-a-pied.md#les-treize-engineers-à-pied--neuf-dans-la-bulle-core-quatre-à-colonia) — non reproduit ici.*

### 4.2 Priorité de déblocage des Engineers selon l'objectif de jeu

| Objectif                              | Ordre recommandé                                                                         | Justification |
|------------------------------------------|-------------------------------------------------------------------------------------------|----------------|
| **Polyvalent / early game**             | Domino Green → Jude Navarro                                                              | Les deux chaînes les moins coûteuses à démarrer ; le grind Jude Navarro finance déjà le farming de matériaux (2.1) ; couvrent à elles deux Extra Backpack Capacity, Enhanced Tracking, Reload Speed, Extra Ammo Capacity |
| **Combat**                              | Hero Ferrari en priorité, malgré son coût plus élevé                                    | Ses mods et ceux de sa chaîne (Wellington Beck, Uma Laszlo) couvrent Faster Handling, Damage Resistance, Faster Shield Regen, Headshot Damage, Reload Speed — pertinent dès que le joueur engage des zones de conflit de toute façon |
| **Exploration / exobiologie**           | Domino Green → Kit Fowler → Yarden Bond, et/ou Hero Ferrari → Terra Velasquez → Oden Geiger | Couvrent Improved Jump Assist, Increased Air Reserves/Sprint Duration, Night Vision — cohérent avec le tableau playstyle de [07-equipement-a-pied.md](./07-equipement-a-pied.md#exploration-et-exobiologie-à-pied--la-combinaison-artemis) |
| **Discrétion / infiltration**           | Jude Navarro → Terra Velasquez → Oden Geiger, et Domino Green → Kit Fowler → Yarden Bond   | Nécessaires pour Quieter Footsteps, Audio Masking, Night Vision — mais Terra Velasquez impose la barrière la plus lourde (6 covert heists + 6 covert thefts, voir 4.1) : à planifier en dernier ou en parallèle d'un farming déjà lancé, pas comme premier objectif isolé |

### 4.3 Un ordre de déblocage alternatif (« Falcon's Guide »), à ne pas citer comme consensus

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

### 5.2 Alternatives et compléments à EDOMH (EDEngineer, OMG, Inara Logbook, EDSM)

| Outil                                  | Rôle                                                                                       | Statut de vérification |
|-------------------------------------------|---------------------------------------------------------------------------------------------|----------------------------|
| **EDEngineer**                           | Tracker de matériaux plus ancien et plus généraliste (toutes catégories confondues, y compris vaisseau) ; déjà cité pour ses plafonds de stockage vaisseau dans [06-ingenieurs.md](./06-ingenieurs.md#plafonds-de-stockage-des-matériaux-dengineering-300-unités-au-grade-1-100-au-grade-5) | Confirmé comme outil existant, mais moins spécialisé que EDOMH pour l'à-pied |
| **Odyssey Mapping Guide (OMG)**          | Localiser, pour chacune des 28 variantes de layout de settlement, l'emplacement du bâtiment CMD, du régulateur d'énergie (PWR) et de la console d'alarme | **Non vérifié** — site source (newp.io) indisponible (erreur serveur 521) pendant la recherche initiale, toujours non testé lors de la révision faute de nouvelle piste ; à re-vérifier avant de s'y fier |
| **Inara.cz — Logbook**                   | Guides de farming communautaires détaillés et datés (inara.cz/elite/logbook/) — bonne source de veille continue | Confirmé, sources principales de la section 2 de ce guide |
| **EDSM — recherche de stations**         | Recherche de stations par service, incluant « Material Trader » (edsm.net/en/search/stations/index/service/71) — utile pour localiser un bartender proche | Confirmé (service EDSM existant) |

## Lacunes de recherche à garder à l'esprit sur l'ingénierie à pied

Ce guide assume explicitement ces limites plutôt que de les combler par des chiffres inventés :

1. **Valeurs exactes du « score de troc » par matériau** au bartender (section 1.2) — **partiellement comblée
   depuis** : le **Graphene** (coût 23, cession 13) et l'**Aerogel** (coût 9, cession 5) sont chiffrés, seuls des
   sept composants de combinaison à l'être. Les **cinq autres ne sont couverts par aucune source**, et rien ne donne
   encore le score des matériaux de
   modification. Le principe reste celui décrit en 1.2 (score cumulatif, perte de l'excédent, une seule classe
   réellement échangeable).
2. **Plafond exact du casier de bord (Ship Locker)** : la structure en catégories séparées est confirmée par le
   schéma journal, mais le chiffre de 1000 unités par catégorie, largement rapporté par la communauté, **n'a pas pu
   être reconfirmé par une source primaire lors de la révision** — traitez-le comme une estimation communautaire non
   garantie, à vérifier en jeu. Les données de référence **ne couvrent pas ce point** : elles donnent bien un plafond
   par grade pour les matériaux de vaisseau (300/250/200/150/100), mais n'en attribuent aucun aux sept composants de
   combinaison (section 1.5).
3. ~~Nombre exact d'unités requises pour débloquer Wellington Beck~~ — résolu depuis : **15 unités**, confirmé par
   relecture directe de la page Engineer d'Inara.cz le 9 septembre 2026 (voir section 1.4).
4. **Limite de stock du bartender NPC lui-même** (par opposition au plafond de stockage joueur — point 2 ci-dessus)
   — non documentée dans les sources consultées, initiales comme en révision.
5. **Tableau complet des quantités par blueprint**, au-delà des douze exemples de la section 3.2 — la ressource qui
   prétendait l'agréger (Google Sheet communautaire) n'est plus en ligne ; utilisez Inara.cz ou EDOMH en lien vivant.
6. **URL exacte et statut actuel de l'Odyssey Mapping Guide (OMG)** (section 5.2) — site source indisponible au
   moment de la recherche initiale et non retesté en révision.
7. **Coût en crédits des paliers de montée en grade des combinaisons** — les montants proviennent du **wiki Fandom
   seul**, **Inara n'en listant aucun** : une source unique face au silence d'une autre, **à confirmer en jeu au
   terminal d'amélioration** avant de bâtir un plan de trésorerie dessus. Les **quantités de matériaux** des mêmes
   paliers ne sont pas concernées par cette réserve. Les montants eux-mêmes, et la réserve dans sa forme complète,
   figurent dans
   [07-equipement-a-pied.md](./07-equipement-a-pied.md#monter-une-combinaison-en-grade--la-table-de-référence).
8. **Tarif au comptoir des composants Carbon Fibre Plating et Titanium Plating** (section 2.9.1) — ce sont des
   *Assets*, donc revendus par le bartender sur le principe énoncé en 1.3, mais aucune source ne leur attribue de coût
   d'acquisition ni de valeur de cession. Le chiffre exact reste à relever au comptoir.

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

Données de référence du dépôt, hors ligne, exploitées pour les sections 1.2, 1.3, 1.5, 2.8, 2.9 et 3.4 (**édition
2026-08** pour les deux) :

- Relevé des matériaux — provenances de terrain typées et leurs conditions rédigées, plafonds de stockage par grade
  côté vaisseau, coordonnées et landmarks des deux sites fixes de récolte (Dav's Hope, Jameson Crash Site). Sources
  amont déclarées : EDCD/FDevIDs pour les identifiants, catégories et grades, et l'étude interne
  `docs/faisabilite-spansh-temps-reel-materiaux.md` § 3.2, 3.4 et 3.5 pour les sources de terrain.
- Relevé des blueprints — quatre paliers de montée en grade pour chacune des trois combinaisons (matériaux, crédits,
  emplacements de modification), assortis de la réserve explicite sur l'origine des montants en crédits. Sources amont
  déclarées : EDCD/coriolis-data et `docs/faisabilite-spansh-temps-reel-materiaux.md` § 3.2 et 3.3.

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
