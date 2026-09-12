---
id: 28-marchandises
titre: "Les marchandises d'Elite Dangerous : catalogue des 270 commodités et des 142 denrées rares"
domaine: economie
entites: [Commodity Market, Gold, Silver, Palladium, Platinum, Osmium, Bertrandite, Indite, Gallite, Coltan, Uraninite, Lepidolite, Rutile, Painite, Void Opal, Low Temperature Diamonds, Tritium, Imperial Slaves, Onionhead, Soontill Relics, Hutton Orbital, Limpets]
mots_cles_en: [commodity, commodities, commodity market, rare goods, rare commodities, minerals, metals, salvage, machinery, technology, chemicals, industrial materials, foods, legal drugs, consumer items, medicines, textiles, weapons, waste, slavery, produced by, consumed by, illegal goods, prohibited, ring type, metallic ring, metal rich ring, icy ring, rocky ring, market id]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-10
confiance_globale: moyenne
volatilite: moyenne
sources_primaires: ["EDCD/FDevIDs commit c35612952dd6a547d1a7ac4cffab9c7051e86579 (commodity.csv, rare_commodity.csv, economy.csv, rings.csv)", "EDSM FAQ Commodities (15 pages de catégories)", "API Spansh /api/station/<market_id>", "API EDSM /api-system-v1/stations/market", "guides communautaires Steam sur le minage (Devilish Dave, Yousseff., Edwyndham)"]
zones_incertaines: ["aucun prix d'achat ni de vente du commerce courant n'est établi : commodity.csv n'en porte aucun et aucune source stable n'a pu être retenue", "les économies productrices et consommatrices ne sont documentées que pour 133 marchandises sur 270, dont zéro des 96 marchandises de la catégorie Salvage", "la légalité n'est documentée que pour 12 marchandises sur 270 et aucune matrice marchandise par superpuissance ou par type de gouvernement n'a pu être consultée", "le type d'anneau reste inconnu pour 16 des 63 marchandises des catégories Minéraux et Métaux et repose partout ailleurs sur des guides de joueurs, jamais sur une source Frontier", "la réserve minimale conseillée par minéral n'est établie par aucune source : seule existe la règle générale de viser une réserve Pristine", "l'allocation par cycle des denrées rares et la distance optimale de revente ne sont établies par aucune source ; les prix et stocks relevés sont un instantané du 10 septembre 2026", "la colonne Nom français est une glose de lecture produite pour ce corpus, et non la localisation officielle du client français du jeu", "la position de la station Heart of Taurus (méga-vaisseau) repose sur un relevé de marché du 9 août 2022"]
guides_lies: [6, 11, 12, 16, 17, 19, 20, 27]
---

# Les marchandises d'Elite Dangerous : catalogue des 270 commodités et des 142 denrées rares

## En bref

*Elite Dangerous* tient deux catalogues de marchandises distincts. Le premier compte **270 commodités** réparties en
**16 catégories** officielles, dominées par la Récupération (96 entrées), les Minéraux (39), les Machines (24) et les
Métaux (24). Le second compte **142 denrées rares**, chacune produite en lot limité par une station unique, réparties
sur **139 stations** — trois d'entre elles en produisent deux. Ce référentiel donne, pour les 270 commodités, le nom
affiché en jeu, une glose française, la catégorie et le symbole interne que le journal de jeu émet ; pour 133 d'entre
elles, les économies productrices et consommatrices relevées ; pour les 63 marchandises des catégories Minéraux et
Métaux, la technique d'extraction et le type d'anneau lorsqu'une source les documente — la **Bertrandite**, par
exemple, se mine au laser en anneau **métallique** et **riche en métaux**. Pour les 142 denrées rares, il nomme le
système, la station et le type de station où les acheter. Les prix courants, la légalité par superpuissance et
l'allocation par cycle ne sont pas couverts : aucune source consultée ne les établit.

## Ce que couvre ce référentiel, et ce qu'il ne couvre pas

Le marché des marchandises (*commodity market*) est le socle de toute l'économie du jeu : c'est là que se lisent les
noms que les Commandants saisissent dans un outil de routage, que se comptent les tonnes d'une cargaison et que se
décide la légalité d'un chargement. Avant ce chantier — état recompté par script sur le commit `2632672` du corpus,
vingt-neuf guides plus `README.md` et `index.yaml` — le corpus ne nommait que **59 des 270 marchandises** du jeu, et
une seule des 142 denrées rares. Gold, Silver, Palladium, Bertrandite, Indite, Gallite, Coltan, Uraninite, Lepidolite
et Rutile n'y figuraient nulle part.

Ce guide est un **référentiel** : il nomme, classe et localise. Il ne réexplique pas les mécaniques, qui sont
documentées ailleurs — la formation des prix et les économies de station dans [Commerce](./11-commerce.md), les
techniques d'extraction dans [Le Minage](./20-minage.md), le transport en volume dans
[Porte-vaisseaux](./19-fleet-carriers.md) et le fret dans [Transport](./12-transport.md).

> **Avertissement de lecture.** Plusieurs des colonnes que l'on attendrait d'un tel référentiel n'ont aucune source
> vérifiable et restent donc vides. Les économies ne sont documentées que pour 133 marchandises sur 270, la légalité
> pour 12 sur 270, le type d'anneau pour 30 des 63 marchandises minables. **Aucun prix du commerce courant n'est écrit
> ici** ; les seuls prix qui figurent dans ce guide sont les relevés de marché horodatés des denrées rares, en
> section 7.3. Une case vide signifie « non établi », jamais « aucun » ni « zéro ». La section 8 dresse la liste des
> manques et dit où il faudrait aller les chercher.

## 1. Comment lire ce référentiel : noms anglais, gloses françaises et symboles internes

### Pourquoi les noms de marchandises restent en anglais dans tout le corpus

Les noms de marchandises sont donnés en anglais parce que ce sont les libellés affichés en jeu, donc ceux qu'un
Commandant saisit dans une barre de recherche, dans EDTools, Inara ou Spansh. La colonne « Nom français » des tableaux
qui suivent est une **glose de lecture produite pour ce corpus** ; ce n'est **pas** la localisation officielle du
client français du jeu, qui n'a pas pu être consultée. Un lecteur qui chercherait « Opale du vide » dans le marché
d'une station ne trouverait rien : le libellé en jeu est *Void Opal*. Là où aucun équivalent français n'a d'usage
établi, le nom anglais est conservé tel quel — Coltan, Painite, Bertrandite, Taaffeite, Nanobreakers, Onionhead,
Limpets, Pod, Spire.

### Le symbole interne, clé du journal de jeu et des API communautaires

La colonne « Symbole interne » reproduit le champ `symbol` de `commodity.csv`. C'est la chaîne que l'on retrouve dans
les fichiers `Journal*.log` du jeu, sur les événements `MarketBuy`, `MarketSell` et `Cargo`, et dans les API
communautaires. Elle ne coïncide pas toujours avec le nom affiché, et c'est précisément ce qui la rend utile :
`Opal` désigne Void Opal, `BasicNarcotics` désigne Narcotics, `AtmosphericExtractors` désigne Atmospheric Processors,
`HeliostaticFurnaces` désigne Microbial Furnaces, `MarineSupplies` désigne Marine Equipment,
`TerrainEnrichmentSystems` désigne Land Enrichment Systems, `Drones` désigne Limpets, `MuTomImager` désigne Muon
Imager et `UnknownArtifact` désigne Thargoid Sensor.

Quatre symboles portent une **faute de frappe d'origine**, conservée telle quelle parce qu'elle est ce que le jeu
émet : `EncriptedDataStorage`, `ComercialSamples`, `SkimerComponents` et `UnocuppiedEscapePod`. Deux entrées
présentent en outre une inversion apparente dans la source — `S_TissueSample_Surface` correspond à *Pod Dead Tissue*
et `S_TissueSample_Core` à *Pod Surface Tissue* — reproduite sans correction, la source faisant foi.

### La catégorie NonMarketable et son entrée unique, les Limpets

`NonMarketable` est une catégorie à **une seule entrée** : *Limpets*, de symbole interne `Drones`. Ce sont les drones
consommables pilotés par les contrôleurs de limpets que le corpus documente déjà dans [Le Minage](./20-minage.md) et
[Équipements](./04-equipements.md). Le libellé de la catégorie signale que ces drones ne relèvent pas du commerce
ordinaire : ils apparaissent au marché des marchandises mais ne constituent pas une cargaison négociable comme les
269 autres. Leur prix d'achat et leur revendabilité éventuelle n'ont **pas** pu être établis par une source fiable et
ne sont donc pas écrits ici.

## 2. Les 16 catégories officielles de marchandises et leurs effectifs

Relevé intégral de `commodity.csv` (EDCD/FDevIDs, commit `c356129`), dénombré par script sur le fichier lui-même. Les
effectifs ci-dessous sont un **comptage**, pas une lecture : la somme de la colonne est recalculée et vaut bien
270.

| Catégorie (EN)       | Catégorie (FR)        | Nombre de marchandises | Exemples représentatifs                                         |
|----------------------|-----------------------|------------------------|-----------------------------------------------------------------|
| Salvage              | Récupération          | 96                     | Black Box, Occupied Escape Pod, Guardian Relic, Thargoid Sensor |
| Minerals             | Minéraux              | 39                     | Bertrandite, Painite, Void Opal, Low Temperature Diamonds       |
| Machinery            | Machines              | 24                     | Power Generators, Crop Harvesters, Modular Terminals            |
| Metals               | Métaux                | 24                     | Gold, Silver, Palladium, Platinum                               |
| Technology           | Technologie           | 17                     | Robotics, Auto-Fabricators, Advanced Catalysers                 |
| Chemicals            | Produits chimiques    | 15                     | Water, Explosives, Tritium, Pesticides                          |
| Industrial Materials | Matériaux industriels | 10                     | Polymers, Semiconductors, Meta-Alloys                           |
| Foods                | Denrées alimentaires  | 9                      | Grain, Fish, Coffee, Food Cartridges                            |
| Legal Drugs          | Drogues légales       | 7                      | Beer, Wine, Tobacco, Narcotics                                  |
| Consumer Items       | Biens de consommation | 6                      | Clothing, Domestic Appliances, Consumer Technology              |
| Medicines            | Médicaments           | 6                      | Basic Medicines, Advanced Medicines, Progenitor Cells           |
| Textiles             | Textiles              | 5                      | Leather, Natural Fabrics, Military Grade Fabrics                |
| Weapons              | Armes                 | 5                      | Personal Weapons, Battle Weapons, Landmines                     |
| Waste                | Déchets               | 4                      | Biowaste, Toxic Waste, Scrap                                    |
| Slavery              | Esclavage             | 2                      | Slaves, Imperial Slaves                                         |
| NonMarketable        | Non commercialisable  | 1                      | Limpets                                                         |
| **Total**            |                       | **270**                |                                                                 |

La catégorie **Récupération (Salvage)** représente à elle seule **96 entrées, soit 35,6 % du catalogue** — plus
du tiers. Ce n'est donc en aucun cas une catégorie marginale, et c'est pourtant celle sur laquelle on dispose du moins
d'information économique : aucune des 96 n'a d'économie productrice documentée, parce qu'elles ne se produisent pas.
Elles se récupèrent — épaves, signaux non identifiés, missions, sites Guardian, carcasses thargoïdes.

## 3. Référentiel complet des 270 marchandises : nom en jeu, glose française, catégorie et symbole interne

Ce tableau est la table de référence du guide. Il est trié par catégorie, dans l'ordre de la chaîne économique (métaux
et minéraux d'abord, récupération et non commercialisable en dernier), puis par ordre alphabétique du nom anglais.
Les colonnes « Nom (EN) », « Catégorie » et « Symbole interne » sont **relevées intégralement** dans `commodity.csv` ;
la colonne « Nom français » est une **traduction produite pour ce corpus**, comme expliqué en section 1.

| Nom (EN)                        | Nom français                                    | Catégorie                                    | Symbole interne                 |
|---------------------------------|-------------------------------------------------|----------------------------------------------|---------------------------------|
| Aluminium                       | Aluminium                                       | Métaux (Metals)                              | `Aluminium`                     |
| Beryllium                       | Béryllium                                       | Métaux (Metals)                              | `Beryllium`                     |
| Bismuth                         | Bismuth                                         | Métaux (Metals)                              | `Bismuth`                       |
| Cobalt                          | Cobalt                                          | Métaux (Metals)                              | `Cobalt`                        |
| Copper                          | Cuivre                                          | Métaux (Metals)                              | `Copper`                        |
| Gallium                         | Gallium                                         | Métaux (Metals)                              | `Gallium`                       |
| Gold                            | Or                                              | Métaux (Metals)                              | `Gold`                          |
| Hafnium 178                     | Hafnium 178                                     | Métaux (Metals)                              | `Hafnium178`                    |
| Indium                          | Indium                                          | Métaux (Metals)                              | `Indium`                        |
| Iridium                         | Iridium                                         | Métaux (Metals)                              | `Iridium`                       |
| Lanthanum                       | Lanthane                                        | Métaux (Metals)                              | `Lanthanum`                     |
| Lithium                         | Lithium                                         | Métaux (Metals)                              | `Lithium`                       |
| Osmium                          | Osmium                                          | Métaux (Metals)                              | `Osmium`                        |
| Palladium                       | Palladium                                       | Métaux (Metals)                              | `Palladium`                     |
| Platinum                        | Platine                                         | Métaux (Metals)                              | `Platinum`                      |
| Praseodymium                    | Praséodyme                                      | Métaux (Metals)                              | `Praseodymium`                  |
| Samarium                        | Samarium                                        | Métaux (Metals)                              | `Samarium`                      |
| Silver                          | Argent                                          | Métaux (Metals)                              | `Silver`                        |
| Steel                           | Acier                                           | Métaux (Metals)                              | `Steel`                         |
| Tantalum                        | Tantale                                         | Métaux (Metals)                              | `Tantalum`                      |
| Thallium                        | Thallium                                        | Métaux (Metals)                              | `Thallium`                      |
| Thorium                         | Thorium                                         | Métaux (Metals)                              | `Thorium`                       |
| Titanium                        | Titane                                          | Métaux (Metals)                              | `Titanium`                      |
| Uranium                         | Uranium                                         | Métaux (Metals)                              | `Uranium`                       |
| Alexandrite                     | Alexandrite                                     | Minéraux (Minerals)                          | `Alexandrite`                   |
| Bastnasite                      | Bastnäsite                                      | Minéraux (Minerals)                          | `Bastnasite`                    |
| Bauxite                         | Bauxite                                         | Minéraux (Minerals)                          | `Bauxite`                       |
| Benitoite                       | Bénitoïte                                       | Minéraux (Minerals)                          | `Benitoite`                     |
| Bertrandite                     | Bertrandite                                     | Minéraux (Minerals)                          | `Bertrandite`                   |
| Bromellite                      | Bromellite                                      | Minéraux (Minerals)                          | `Bromellite`                    |
| Coltan                          | Coltan                                          | Minéraux (Minerals)                          | `Coltan`                        |
| Cryolite                        | Cryolithe                                       | Minéraux (Minerals)                          | `Cryolite`                      |
| Deuterium                       | Deutérium                                       | Minéraux (Minerals)                          | `Deuterium`                     |
| Diamond                         | Diamant                                         | Minéraux (Minerals)                          | `Diamond`                       |
| Gallite                         | Gallite                                         | Minéraux (Minerals)                          | `Gallite`                       |
| Goslarite                       | Goslarite                                       | Minéraux (Minerals)                          | `Goslarite`                     |
| Grandidierite                   | Grandidiérite                                   | Minéraux (Minerals)                          | `Grandidierite`                 |
| Haematite                       | Hématite                                        | Minéraux (Minerals)                          | `Haematite`                     |
| Indite                          | Indite                                          | Minéraux (Minerals)                          | `Indite`                        |
| Jadeite                         | Jadéite                                         | Minéraux (Minerals)                          | `Jadeite`                       |
| Lepidolite                      | Lépidolite                                      | Minéraux (Minerals)                          | `Lepidolite`                    |
| Lithium Hydroxide               | Hydroxyde de lithium                            | Minéraux (Minerals)                          | `LithiumHydroxide`              |
| Low Temperature Diamonds        | Diamants basse température                      | Minéraux (Minerals)                          | `LowTemperatureDiamond`         |
| Magnesite                       | Magnésite                                       | Minéraux (Minerals)                          | `Magnesite`                     |
| Methane Clathrate               | Clathrate de méthane                            | Minéraux (Minerals)                          | `MethaneClathrate`              |
| Methanol Monohydrate Crystals   | Cristaux de monohydrate de méthanol             | Minéraux (Minerals)                          | `MethanolMonohydrateCrystals`   |
| Moissanite                      | Moissanite                                      | Minéraux (Minerals)                          | `Moissanite`                    |
| Monazite                        | Monazite                                        | Minéraux (Minerals)                          | `Monazite`                      |
| Musgravite                      | Musgravite                                      | Minéraux (Minerals)                          | `Musgravite`                    |
| Olivine                         | Olivine                                         | Minéraux (Minerals)                          | `Olivine`                       |
| Painite                         | Painite                                         | Minéraux (Minerals)                          | `Painite`                       |
| Periclase Dunite                | Dunite à périclase                              | Minéraux (Minerals)                          | `PericlaseDunite`               |
| Pyrophyllite                    | Pyrophyllite                                    | Minéraux (Minerals)                          | `Pyrophyllite`                  |
| Quartz Pyroxenite               | Pyroxénite à quartz                             | Minéraux (Minerals)                          | `QuartzPyroxenite`              |
| Rhodplumsite                    | Rhodplumsite                                    | Minéraux (Minerals)                          | `Rhodplumsite`                  |
| Ruby                            | Rubis                                           | Minéraux (Minerals)                          | `Ruby`                          |
| Rutile                          | Rutile                                          | Minéraux (Minerals)                          | `Rutile`                        |
| Sapphire                        | Saphir                                          | Minéraux (Minerals)                          | `Sapphire`                      |
| Serendibite                     | Sérendibite                                     | Minéraux (Minerals)                          | `Serendibite`                   |
| Taaffeite                       | Taaffeite                                       | Minéraux (Minerals)                          | `Taaffeite`                     |
| Thortveitite                    | Thortveitite                                    | Minéraux (Minerals)                          | `Thortveitite`                  |
| Uraninite                       | Uraninite                                       | Minéraux (Minerals)                          | `Uraninite`                     |
| Void Opal                       | Opale du vide                                   | Minéraux (Minerals)                          | `Opal`                          |
| Agronomic Treatment             | Traitement agronomique                          | Produits chimiques (Chemicals)               | `AgronomicTreatment`            |
| Explosives                      | Explosifs                                       | Produits chimiques (Chemicals)               | `Explosives`                    |
| Helium                          | Hélium                                          | Produits chimiques (Chemicals)               | `Helium`                        |
| Helium-3                        | Hélium-3                                        | Produits chimiques (Chemicals)               | `Helium3`                       |
| Hydrogen Fuel                   | Carburant à hydrogène                           | Produits chimiques (Chemicals)               | `HydrogenFuel`                  |
| Hydrogen Peroxide               | Peroxyde d'hydrogène                            | Produits chimiques (Chemicals)               | `HydrogenPeroxide`              |
| Liquid oxygen                   | Oxygène liquide                                 | Produits chimiques (Chemicals)               | `LiquidOxygen`                  |
| Mineral Oil                     | Huile minérale                                  | Produits chimiques (Chemicals)               | `MineralOil`                    |
| Nerve Agents                    | Agents neurotoxiques                            | Produits chimiques (Chemicals)               | `NerveAgents`                   |
| Pesticides                      | Pesticides                                      | Produits chimiques (Chemicals)               | `Pesticides`                    |
| Rockforth Fertiliser            | Engrais Rockforth                               | Produits chimiques (Chemicals)               | `RockforthFertiliser`           |
| Surface Stabilisers             | Stabilisateurs de surface                       | Produits chimiques (Chemicals)               | `SurfaceStabilisers`            |
| Synthetic Reagents              | Réactifs synthétiques                           | Produits chimiques (Chemicals)               | `SyntheticReagents`             |
| Tritium                         | Tritium                                         | Produits chimiques (Chemicals)               | `Tritium`                       |
| Water                           | Eau                                             | Produits chimiques (Chemicals)               | `Water`                         |
| CMM Composite                   | Composite CMM                                   | Matériaux industriels (Industrial Materials) | `CMMComposite`                  |
| Ceramic Composites              | Composites céramiques                           | Matériaux industriels (Industrial Materials) | `CeramicComposites`             |
| Curated Commodity Package       | Lot de marchandises sélectionnées               | Matériaux industriels (Industrial Materials) | `CuratedCommodity`              |
| Insulating Membrane             | Membrane isolante                               | Matériaux industriels (Industrial Materials) | `InsulatingMembrane`            |
| Meta-Alloys                     | Méta-alliages                                   | Matériaux industriels (Industrial Materials) | `MetaAlloys`                    |
| Micro-weave Cooling Hoses       | Tuyaux de refroidissement micro-tissés          | Matériaux industriels (Industrial Materials) | `CoolingHoses`                  |
| Neofabric Insulation            | Isolant néotextile                              | Matériaux industriels (Industrial Materials) | `NeofabricInsulation`           |
| Polymers                        | Polymères                                       | Matériaux industriels (Industrial Materials) | `Polymers`                      |
| Semiconductors                  | Semi-conducteurs                                | Matériaux industriels (Industrial Materials) | `Semiconductors`                |
| Superconductors                 | Supraconducteurs                                | Matériaux industriels (Industrial Materials) | `Superconductors`               |
| Articulation Motors             | Moteurs d'articulation                          | Machines (Machinery)                         | `ArticulationMotors`            |
| Atmospheric Processors          | Processeurs atmosphériques                      | Machines (Machinery)                         | `AtmosphericExtractors`         |
| Building Fabricators            | Fabricateurs de bâtiments                       | Machines (Machinery)                         | `BuildingFabricators`           |
| Crop Harvesters                 | Moissonneuses                                   | Machines (Machinery)                         | `CropHarvesters`                |
| Emergency Power Cells           | Cellules d'énergie de secours                   | Machines (Machinery)                         | `EmergencyPowerCells`           |
| Energy Grid Assembly            | Assemblage de grille énergétique                | Machines (Machinery)                         | `PowerGridAssembly`             |
| Exhaust Manifold                | Collecteur d'échappement                        | Machines (Machinery)                         | `ExhaustManifold`               |
| Geological Equipment            | Équipement géologique                           | Machines (Machinery)                         | `GeologicalEquipment`           |
| HN Shock Mount                  | Support antichoc HN                             | Machines (Machinery)                         | `HNShockMount`                  |
| Heatsink Interlink              | Interconnexion de dissipateur                   | Machines (Machinery)                         | `HeatsinkInterlink`             |
| Ion Distributor                 | Distributeur d'ions                             | Machines (Machinery)                         | `IonDistributor`                |
| Magnetic Emitter Coil           | Bobine d'émission magnétique                    | Machines (Machinery)                         | `MagneticEmitterCoil`           |
| Marine Equipment                | Équipement marin                                | Machines (Machinery)                         | `MarineSupplies`                |
| Microbial Furnaces              | Fours microbiens                                | Machines (Machinery)                         | `HeliostaticFurnaces`           |
| Mineral Extractors              | Extracteurs de minerai                          | Machines (Machinery)                         | `MineralExtractors`             |
| Modular Terminals               | Terminaux modulaires                            | Machines (Machinery)                         | `ModularTerminals`              |
| Power Converter                 | Convertisseur de puissance                      | Machines (Machinery)                         | `PowerConverter`                |
| Power Generators                | Générateurs d'énergie                           | Machines (Machinery)                         | `PowerGenerators`               |
| Power Transfer Bus              | Bus de transfert de puissance                   | Machines (Machinery)                         | `PowerTransferConduits`         |
| Radiation Baffle                | Déflecteur de radiations                        | Machines (Machinery)                         | `RadiationBaffle`               |
| Reinforced Mounting Plate       | Plaque de montage renforcée                     | Machines (Machinery)                         | `ReinforcedMountingPlate`       |
| Skimmer Components              | Composants de skimmer                           | Machines (Machinery)                         | `SkimerComponents`              |
| Thermal Cooling Units           | Unités de refroidissement thermique             | Machines (Machinery)                         | `ThermalCoolingUnits`           |
| Water Purifiers                 | Purificateurs d'eau                             | Machines (Machinery)                         | `WaterPurifiers`                |
| Advanced Catalysers             | Catalyseurs avancés                             | Technologie (Technology)                     | `AdvancedCatalysers`            |
| Animal Monitors                 | Moniteurs animaliers                            | Technologie (Technology)                     | `AnimalMonitors`                |
| Aquaponic Systems               | Systèmes aquaponiques                           | Technologie (Technology)                     | `AquaponicSystems`              |
| Auto-Fabricators                | Auto-fabricateurs                               | Technologie (Technology)                     | `AutoFabricators`               |
| Bioreducing Lichen              | Lichen bioréducteur                             | Technologie (Technology)                     | `BioReducingLichen`             |
| Computer Components             | Composants informatiques                        | Technologie (Technology)                     | `ComputerComponents`            |
| H.E. Suits                      | Combinaisons d'environnement hostile            | Technologie (Technology)                     | `HazardousEnvironmentSuits`     |
| Hardware Diagnostic Sensor      | Capteur de diagnostic matériel                  | Technologie (Technology)                     | `DiagnosticSensor`              |
| Land Enrichment Systems         | Systèmes d'enrichissement des sols              | Technologie (Technology)                     | `TerrainEnrichmentSystems`      |
| Medical Diagnostic Equipment    | Équipement de diagnostic médical                | Technologie (Technology)                     | `MedicalDiagnosticEquipment`    |
| Micro Controllers               | Microcontrôleurs                                | Technologie (Technology)                     | `MicroControllers`              |
| Muon Imager                     | Imageur à muons                                 | Technologie (Technology)                     | `MuTomImager`                   |
| Nanobreakers                    | Nanobreakers                                    | Technologie (Technology)                     | `Nanobreakers`                  |
| Resonating Separators           | Séparateurs résonants                           | Technologie (Technology)                     | `ResonatingSeparators`          |
| Robotics                        | Robotique                                       | Technologie (Technology)                     | `Robotics`                      |
| Structural Regulators           | Régulateurs structurels                         | Technologie (Technology)                     | `StructuralRegulators`          |
| Telemetry Suite                 | Suite de télémétrie                             | Technologie (Technology)                     | `TelemetrySuite`                |
| Algae                           | Algues                                          | Denrées alimentaires (Foods)                 | `Algae`                         |
| Animal Meat                     | Viande animale                                  | Denrées alimentaires (Foods)                 | `Animalmeat`                    |
| Coffee                          | Café                                            | Denrées alimentaires (Foods)                 | `Coffee`                        |
| Fish                            | Poisson                                         | Denrées alimentaires (Foods)                 | `Fish`                          |
| Food Cartridges                 | Cartouches alimentaires                         | Denrées alimentaires (Foods)                 | `FoodCartridges`                |
| Fruit and Vegetables            | Fruits et légumes                               | Denrées alimentaires (Foods)                 | `FruitAndVegetables`            |
| Grain                           | Céréales                                        | Denrées alimentaires (Foods)                 | `Grain`                         |
| Synthetic Meat                  | Viande synthétique                              | Denrées alimentaires (Foods)                 | `SyntheticMeat`                 |
| Tea                             | Thé                                             | Denrées alimentaires (Foods)                 | `Tea`                           |
| Conductive Fabrics              | Tissus conducteurs                              | Textiles (Textiles)                          | `ConductiveFabrics`             |
| Leather                         | Cuir                                            | Textiles (Textiles)                          | `Leather`                       |
| Military Grade Fabrics          | Tissus de qualité militaire                     | Textiles (Textiles)                          | `MilitaryGradeFabrics`          |
| Natural Fabrics                 | Tissus naturels                                 | Textiles (Textiles)                          | `NaturalFabrics`                |
| Synthetic Fabrics               | Tissus synthétiques                             | Textiles (Textiles)                          | `SyntheticFabrics`              |
| Clothing                        | Vêtements                                       | Biens de consommation (Consumer Items)       | `Clothing`                      |
| Consumer Technology             | Technologie grand public                        | Biens de consommation (Consumer Items)       | `ConsumerTechnology`            |
| Domestic Appliances             | Appareils électroménagers                       | Biens de consommation (Consumer Items)       | `DomesticAppliances`            |
| Evacuation Shelter              | Abri d'évacuation                               | Biens de consommation (Consumer Items)       | `EvacuationShelter`             |
| Survival Equipment              | Équipement de survie                            | Biens de consommation (Consumer Items)       | `SurvivalEquipment`             |
| Trinkets of Hidden Fortune      | Babioles de fortune cachée                      | Biens de consommation (Consumer Items)       | `TrinketsOfFortune`             |
| Advanced Medicines              | Médicaments avancés                             | Médicaments (Medicines)                      | `AdvancedMedicines`             |
| Agri-Medicines                  | Médicaments agricoles                           | Médicaments (Medicines)                      | `AgriculturalMedicines`         |
| Basic Medicines                 | Médicaments de base                             | Médicaments (Medicines)                      | `BasicMedicines`                |
| Combat Stabilisers              | Stabilisateurs de combat                        | Médicaments (Medicines)                      | `CombatStabilisers`             |
| Performance Enhancers           | Stimulants de performance                       | Médicaments (Medicines)                      | `PerformanceEnhancers`          |
| Progenitor Cells                | Cellules progénitrices                          | Médicaments (Medicines)                      | `ProgenitorCells`               |
| Beer                            | Bière                                           | Drogues légales (Legal Drugs)                | `Beer`                          |
| Bootleg Liquor                  | Alcool de contrebande                           | Drogues légales (Legal Drugs)                | `BootlegLiquor`                 |
| Liquor                          | Spiritueux                                      | Drogues légales (Legal Drugs)                | `Liquor`                        |
| Narcotics                       | Stupéfiants                                     | Drogues légales (Legal Drugs)                | `BasicNarcotics`                |
| Onionhead Gamma Strain          | Onionhead, souche gamma                         | Drogues légales (Legal Drugs)                | `OnionHeadC`                    |
| Tobacco                         | Tabac                                           | Drogues légales (Legal Drugs)                | `Tobacco`                       |
| Wine                            | Vin                                             | Drogues légales (Legal Drugs)                | `Wine`                          |
| Battle Weapons                  | Armes de guerre                                 | Armes (Weapons)                              | `BattleWeapons`                 |
| Landmines                       | Mines terrestres                                | Armes (Weapons)                              | `Landmines`                     |
| Non-Lethal Weapons              | Armes non létales                               | Armes (Weapons)                              | `NonLethalWeapons`              |
| Personal Weapons                | Armes personnelles                              | Armes (Weapons)                              | `PersonalWeapons`               |
| Reactive Armour                 | Blindage réactif                                | Armes (Weapons)                              | `ReactiveArmour`                |
| Biowaste                        | Déchets organiques                              | Déchets (Waste)                              | `Biowaste`                      |
| Chemical Waste                  | Déchets chimiques                               | Déchets (Waste)                              | `ChemicalWaste`                 |
| Scrap                           | Ferraille                                       | Déchets (Waste)                              | `Scrap`                         |
| Toxic Waste                     | Déchets toxiques                                | Déchets (Waste)                              | `ToxicWaste`                    |
| Imperial Slaves                 | Esclaves impériaux                              | Esclavage (Slavery)                          | `ImperialSlaves`                |
| Slaves                          | Esclaves                                        | Esclavage (Slavery)                          | `Slaves`                        |
| AI Relics                       | Reliques d'IA                                   | Récupération (Salvage)                       | `AiRelics`                      |
| Ancient Artefact                | Artefact ancien                                 | Récupération (Salvage)                       | `USSCargoAncientArtefact`       |
| Ancient Key                     | Clé antique                                     | Récupération (Salvage)                       | `AncientKey`                    |
| Anomaly Particles               | Particules d'anomalie                           | Récupération (Salvage)                       | `P_ParticulateSample`           |
| Antimatter Containment Unit     | Unité de confinement d'antimatière              | Récupération (Salvage)                       | `AntimatterContainmentUnit`     |
| Antique Jewellery               | Bijoux anciens                                  | Récupération (Salvage)                       | `AntiqueJewellery`              |
| Antiquities                     | Antiquités                                      | Récupération (Salvage)                       | `Antiquities`                   |
| Assault Plans                   | Plans d'assaut                                  | Récupération (Salvage)                       | `AssaultPlans`                  |
| Black Box                       | Boîte noire                                     | Récupération (Salvage)                       | `USSCargoBlackBox`              |
| Bone Fragments                  | Fragments d'os                                  | Récupération (Salvage)                       | `ThargoidBoneFragments`         |
| Caustic Tissue Sample           | Échantillon de tissu caustique                  | Récupération (Salvage)                       | `ThargoidGeneratorTissueSample` |
| Commercial Samples              | Échantillons commerciaux                        | Récupération (Salvage)                       | `ComercialSamples`              |
| Coral Sap                       | Sève de corail                                  | Récupération (Salvage)                       | `CoralSap`                      |
| Cyst Specimen                   | Spécimen de kyste                               | Récupération (Salvage)                       | `ThargoidCystSpecimen`          |
| Damaged Escape Pod              | Capsule de sauvetage endommagée                 | Récupération (Salvage)                       | `DamagedEscapePod`              |
| Data Core                       | Cœur de données                                 | Récupération (Salvage)                       | `DataCore`                      |
| Diplomatic Bag                  | Valise diplomatique                             | Récupération (Salvage)                       | `DiplomaticBag`                 |
| Earth Relics                    | Reliques terrestres                             | Récupération (Salvage)                       | `EarthRelics`                   |
| Encrypted Correspondence        | Correspondance chiffrée                         | Récupération (Salvage)                       | `EncryptedCorrespondence`       |
| Encrypted Data Storage          | Stockage de données chiffrées                   | Récupération (Salvage)                       | `EncriptedDataStorage`          |
| Experimental Chemicals          | Produits chimiques expérimentaux                | Récupération (Salvage)                       | `USSCargoExperimentalChemicals` |
| Fossil Remnants                 | Restes fossiles                                 | Récupération (Salvage)                       | `FossilRemnants`                |
| Gene Bank                       | Banque génétique                                | Récupération (Salvage)                       | `GeneBank`                      |
| Geological Samples              | Échantillons géologiques                        | Récupération (Salvage)                       | `GeologicalSamples`             |
| Guardian Casket                 | Coffret Guardian                                | Récupération (Salvage)                       | `AncientCasket`                 |
| Guardian Orb                    | Orbe Guardian                                   | Récupération (Salvage)                       | `AncientOrb`                    |
| Guardian Relic                  | Relique Guardian                                | Récupération (Salvage)                       | `AncientRelic`                  |
| Guardian Tablet                 | Tablette Guardian                               | Récupération (Salvage)                       | `AncientTablet`                 |
| Guardian Totem                  | Totem Guardian                                  | Récupération (Salvage)                       | `AncientTotem`                  |
| Guardian Urn                    | Urne Guardian                                   | Récupération (Salvage)                       | `AncientUrn`                    |
| Hostages                        | Otages                                          | Récupération (Salvage)                       | `Hostage`                       |
| Impure Spire Mineral            | Minerai de Spire impur                          | Récupération (Salvage)                       | `UnknownMineral`                |
| Large Survey Data Cache         | Grande archive de données de relevé             | Récupération (Salvage)                       | `LargeExplorationDataCash`      |
| Military Intelligence           | Renseignement militaire                         | Récupération (Salvage)                       | `MilitaryIntelligence`          |
| Military Plans                  | Plans militaires                                | Récupération (Salvage)                       | `USSCargoMilitaryPlans`         |
| Mollusc Brain Tissue            | Tissu cérébral de mollusque                     | Récupération (Salvage)                       | `M_TissueSample_Nerves`         |
| Mollusc Fluid                   | Fluide de mollusque                             | Récupération (Salvage)                       | `M_TissueSample_Fluid`          |
| Mollusc Membrane                | Membrane de mollusque                           | Récupération (Salvage)                       | `M3_TissueSample_Membrane`      |
| Mollusc Mycelium                | Mycélium de mollusque                           | Récupération (Salvage)                       | `M3_TissueSample_Mycelium`      |
| Mollusc Soft Tissue             | Tissu mou de mollusque                          | Récupération (Salvage)                       | `M_TissueSample_Soft`           |
| Mollusc Spores                  | Spores de mollusque                             | Récupération (Salvage)                       | `M3_TissueSample_Spores`        |
| Mysterious Idol                 | Idole mystérieuse                               | Récupération (Salvage)                       | `MysteriousIdol`                |
| Occupied Escape Pod             | Capsule de sauvetage occupée                    | Récupération (Salvage)                       | `OccupiedCryoPod`               |
| Organ Sample                    | Échantillon d'organe                            | Récupération (Salvage)                       | `ThargoidOrganSample`           |
| Personal Effects                | Effets personnels                               | Récupération (Salvage)                       | `PersonalEffects`               |
| Pod Core Tissue                 | Tissu de cœur de Pod                            | Récupération (Salvage)                       | `S_TissueSample_Cells`          |
| Pod Dead Tissue                 | Tissu mort de Pod                               | Récupération (Salvage)                       | `S_TissueSample_Surface`        |
| Pod Mesoglea                    | Mésoglée de Pod                                 | Récupération (Salvage)                       | `S6_TissueSample_Mesoglea`      |
| Pod Outer Tissue                | Tissu externe de Pod                            | Récupération (Salvage)                       | `S6_TissueSample_Cells`         |
| Pod Shell Tissue                | Tissu de coque de Pod                           | Récupération (Salvage)                       | `S6_TissueSample_Coenosarc`     |
| Pod Surface Tissue              | Tissu de surface de Pod                         | Récupération (Salvage)                       | `S_TissueSample_Core`           |
| Pod Tissue                      | Tissu de Pod                                    | Récupération (Salvage)                       | `S9_TissueSample_Shell`         |
| Political Prisoners             | Prisonniers politiques                          | Récupération (Salvage)                       | `PoliticalPrisoner`             |
| Precious Gems                   | Pierres précieuses                              | Récupération (Salvage)                       | `PreciousGems`                  |
| Prohibited Research Materials   | Matériel de recherche interdit                  | Récupération (Salvage)                       | `ProhibitedResearchMaterials`   |
| Protective Membrane Scrap       | Fragment de membrane protectrice                | Récupération (Salvage)                       | `UnknownSack`                   |
| Prototype Tech                  | Technologie prototype                           | Récupération (Salvage)                       | `USSCargoPrototypeTech`         |
| Rare Artwork                    | Œuvre d'art rare                                | Récupération (Salvage)                       | `USSCargoRareArtwork`           |
| Rebel Transmissions             | Transmissions rebelles                          | Récupération (Salvage)                       | `USSCargoRebelTransmissions`    |
| SAP 8 Core Container            | Conteneur de cœur SAP 8                         | Récupération (Salvage)                       | `SAP8CoreContainer`             |
| Scientific Research             | Recherche scientifique                          | Récupération (Salvage)                       | `ScientificResearch`            |
| Scientific Samples              | Échantillons scientifiques                      | Récupération (Salvage)                       | `ScientificSamples`             |
| Semi-Refined Spire Mineral      | Minerai de Spire semi-raffiné                   | Récupération (Salvage)                       | `UnknownRefinedMineral`         |
| Small Survey Data Cache         | Petite archive de données de relevé             | Récupération (Salvage)                       | `SmallExplorationDataCash`      |
| Space Pioneer Relics            | Reliques de pionniers de l'espace               | Récupération (Salvage)                       | `SpacePioneerRelics`            |
| Tactical Data                   | Données tactiques                               | Récupération (Salvage)                       | `TacticalData`                  |
| Technical Blueprints            | Plans techniques                                | Récupération (Salvage)                       | `USSCargoTechnicalBlueprints`   |
| Thargoid Basilisk Tissue Sample | Échantillon de tissu de Basilisk thargoïde      | Récupération (Salvage)                       | `ThargoidTissueSampleType2`     |
| Thargoid Biological Matter      | Matière biologique thargoïde                    | Récupération (Salvage)                       | `UnknownBiologicalMatter`       |
| Thargoid Cyclops Tissue Sample  | Échantillon de tissu de Cyclops thargoïde       | Récupération (Salvage)                       | `ThargoidTissueSampleType1`     |
| Thargoid Glaive Tissue Sample   | Échantillon de tissu de Glaive thargoïde        | Récupération (Salvage)                       | `ThargoidTissueSampleType6`     |
| Thargoid Heart                  | Cœur thargoïde                                  | Récupération (Salvage)                       | `ThargoidHeart`                 |
| Thargoid Hydra Tissue Sample    | Échantillon de tissu d'Hydra thargoïde          | Récupération (Salvage)                       | `ThargoidTissueSampleType4`     |
| Thargoid Link                   | Lien thargoïde                                  | Récupération (Salvage)                       | `UnknownArtifact3`              |
| Thargoid Medusa Tissue Sample   | Échantillon de tissu de Medusa thargoïde        | Récupération (Salvage)                       | `ThargoidTissueSampleType3`     |
| Thargoid Orthrus Tissue Sample  | Échantillon de tissu d'Orthrus thargoïde        | Récupération (Salvage)                       | `ThargoidTissueSampleType5`     |
| Thargoid Probe                  | Sonde thargoïde                                 | Récupération (Salvage)                       | `UnknownArtifact2`              |
| Thargoid Resin                  | Résine thargoïde                                | Récupération (Salvage)                       | `UnknownResin`                  |
| Thargoid Scout Tissue Sample    | Échantillon de tissu de Scout thargoïde         | Récupération (Salvage)                       | `ThargoidScoutTissueSample`     |
| Thargoid Scythe Tissue Sample   | Échantillon de tissu de Scythe thargoïde        | Récupération (Salvage)                       | `ThargoidTissueSampleType7`     |
| Thargoid Sensor                 | Capteur thargoïde                               | Récupération (Salvage)                       | `UnknownArtifact`               |
| Thargoid Technology Samples     | Échantillons de technologie thargoïde           | Récupération (Salvage)                       | `UnknownTechnologySamples`      |
| Time Capsule                    | Capsule temporelle                              | Récupération (Salvage)                       | `TimeCapsule`                   |
| Titan Deep Tissue Sample        | Échantillon de tissu profond de Titan           | Récupération (Salvage)                       | `ThargoidTissueSampleType9a`    |
| Titan Drive Component           | Composant de propulsion de Titan                | Récupération (Salvage)                       | `ThargoidTitanDriveComponent`   |
| Titan Maw Deep Tissue Sample    | Échantillon de tissu profond de Gueule de Titan | Récupération (Salvage)                       | `ThargoidTissueSampleType10a`   |
| Titan Maw Partial Tissue Sample | Échantillon de tissu partiel de Gueule de Titan | Récupération (Salvage)                       | `ThargoidTissueSampleType10c`   |
| Titan Maw Tissue Sample         | Échantillon de tissu de Gueule de Titan         | Récupération (Salvage)                       | `ThargoidTissueSampleType10b`   |
| Titan Partial Tissue Sample     | Échantillon de tissu partiel de Titan           | Récupération (Salvage)                       | `ThargoidTissueSampleType9c`    |
| Titan Tissue Sample             | Échantillon de tissu de Titan                   | Récupération (Salvage)                       | `ThargoidTissueSampleType9b`    |
| Trade Data                      | Données commerciales                            | Récupération (Salvage)                       | `USSCargoTradeData`             |
| Unclassified Relic              | Relique non classée                             | Récupération (Salvage)                       | `AncientRelicTG`                |
| Unoccupied Escape Pod           | Capsule de sauvetage inoccupée                  | Récupération (Salvage)                       | `UnocuppiedEscapePod`           |
| Unstable Data Core              | Cœur de données instable                        | Récupération (Salvage)                       | `UnstableDataCore`              |
| Wreckage Components             | Composants d'épave                              | Récupération (Salvage)                       | `WreckageComponents`            |
| Xenobiological Prison Pod       | Capsule-prison xénobiologique                   | Récupération (Salvage)                       | `ThargoidPod`                   |
| Limpets                         | Limpets (drones utilitaires)                    | Non commercialisable (NonMarketable)         | `Drones`                        |

## 4. Quelles économies produisent et consomment quoi : 133 marchandises sur 270 documentées

### 4.1 Ce que la donnée « économies » couvre, et ce qu'elle laisse de côté

La source de cette section est la **FAQ communautaire Commodités d'EDSM**, dont les quinze pages de catégories ont été
récupérées en HTML brut le 10 septembre 2026 puis analysées par script. Elle reprend pour l'essentiel les descriptions
des marchandises telles qu'affichées en jeu, mais elle ne porte ni numéro de version ni date de mise à jour : ce
n'est **pas** un fichier officiel comme `commodity.csv`, et tout ce qui en vient doit être attribué « selon la FAQ
communautaire EDSM », jamais « selon les données officielles du jeu ».

Une marchandise n'est comptée comme couverte que si sa fiche porte effectivement les deux lignes *Produced by* et
*Consumed by*. Les 137 marchandises non couvertes ont, pour la plupart, une fiche purement littéraire.

| Catégorie                                    | Marchandises | Couvertes par EDSM | Couverture |
|----------------------------------------------|--------------|--------------------|------------|
| Métaux (Metals)                              | 24           | 21                 | 88 %       |
| Minéraux (Minerals)                          | 39           | 20                 | 51 %       |
| Produits chimiques (Chemicals)               | 15           | 10                 | 67 %       |
| Matériaux industriels (Industrial Materials) | 10           | 6                  | 60 %       |
| Machines (Machinery)                         | 24           | 22                 | 92 %       |
| Technologie (Technology)                     | 17           | 15                 | 88 %       |
| Denrées alimentaires (Foods)                 | 9            | 9                  | 100 %      |
| Textiles (Textiles)                          | 5            | 5                  | 100 %      |
| Biens de consommation (Consumer Items)       | 6            | 5                  | 83 %       |
| Médicaments (Medicines)                      | 6            | 6                  | 100 %      |
| Drogues légales (Legal Drugs)                | 7            | 6                  | 86 %       |
| Armes (Weapons)                              | 5            | 4                  | 80 %       |
| Déchets (Waste)                              | 4            | 3                  | 75 %       |
| Esclavage (Slavery)                          | 2            | 1                  | 50 %       |
| Récupération (Salvage)                       | 96           | 0                  | 0 %        |
| Non commercialisable (NonMarketable)         | 1            | 0                  | 0 %        |
| **Total**                                    | **270**      | **133**            | **49 %**   |

### 4.2 Synthèse des économies par catégorie, par dénombrement

Ce tableau est un **dénombrement d'occurrences** sur les seules lignes couvertes, pas une règle du jeu. La mention
« toutes ou presque » agrège les valeurs « All » et « All except … » de la source. La deuxième colonne rappelle
combien de lignes de la catégorie sont effectivement documentées : lire une proportion sur les autres colonnes sans
elle donnerait un résultat faux.

| Catégorie                                    | Lignes couvertes | Économies productrices citées (occurrences)                                                                                  | Économies consommatrices citées (occurrences)                                                                                                                                               |
|----------------------------------------------|------------------|------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Métaux (Metals)                              | 21/24            | Refinery (16/21), minage uniquement (4/21), Extraction (4/21)                                                                | High Tech (14/21), Industrial (13/21), toutes ou presque (4/21), Military (4/21), Terraforming (1/21)                                                                                       |
| Minéraux (Minerals)                          | 20/39            | Extraction (11/20), minage uniquement (6/20), minage planétaire (3/20)                                                       | Refinery (13/20), High Tech (7/20), Tourism (3/20), Service (3/20), toutes ou presque (1/20), Industrial (1/20), Colony (1/20)                                                              |
| Produits chimiques (Chemicals)               | 10/15            | Refinery (5/10), Agriculture (2/10), High Tech (2/10), Extraction (1/10), toutes ou presque (1/10), minage uniquement (1/10) | toutes ou presque (3/10), Refinery (2/10), Military (2/10), High Tech (2/10), Industrial (2/10), Extraction (1/10), Agriculture (1/10)                                                      |
| Matériaux industriels (Industrial Materials) | 6/10             | Refinery (6/6)                                                                                                               | Industrial (6/6), High Tech (4/6), Military (3/6), Terraforming (3/6)                                                                                                                       |
| Machines (Machinery)                         | 22/24            | Industrial (19/22), Refinery (6/22), Extraction (5/22), High Tech (2/22)                                                     | High Tech (12/22), Military (8/22), Extraction (4/22), toutes ou presque (3/22), Agriculture (3/22), Colony (3/22), Tourism (2/22), Industrial (2/22), Refinery (1/22), Terraforming (1/22) |
| Technologie (Technology)                     | 15/17            | High Tech (13/15), Industrial (3/15), Refinery (1/15)                                                                        | Military (5/15), Industrial (4/15), Extraction (3/15), Refinery (3/15), Agriculture (3/15), High Tech (2/15), Terraforming (2/15), toutes ou presque (1/15), Service (1/15)                 |
| Denrées alimentaires (Foods)                 | 9/9              | Agriculture (7/9), Industrial (1/9), High Tech (1/9)                                                                         | toutes ou presque (8/9), Industrial (1/9), Military (1/9)                                                                                                                                   |
| Textiles (Textiles)                          | 5/5              | Agriculture (2/5), Refinery (2/5), Industrial (1/5)                                                                          | Industrial (4/5), High Tech (1/5), Military (1/5)                                                                                                                                           |
| Biens de consommation (Consumer Items)       | 5/6              | Industrial (3/5), High Tech (2/5)                                                                                            | toutes ou presque (5/5)                                                                                                                                                                     |
| Médicaments (Medicines)                      | 6/6              | High Tech (6/6), Industrial (1/6)                                                                                            | Agriculture (2/6), Extraction (1/6), Industrial (1/6), Military (1/6), Colony (1/6), Refinery (1/6), toutes ou presque (1/6)                                                                |
| Drogues légales (Legal Drugs)                | 6/7              | Agriculture (5/6), Industrial (2/6), High Tech (1/6), récupération d'épaves (1/6), Refinery (1/6)                            | toutes ou presque (5/6), Extraction (1/6), Industrial (1/6), Refinery (1/6)                                                                                                                 |
| Armes (Weapons)                              | 4/5              | Military (4/4), High Tech (3/4), Industrial (1/4)                                                                            | toutes ou presque (3/4), Extraction (1/4), Colony (1/4), High Tech (1/4), Refinery (1/4)                                                                                                    |
| Déchets (Waste)                              | 3/4              | toutes ou presque (1/3), aucune (1/3), Industrial (1/3), Military (1/3), Colony (1/3), High Tech (1/3)                       | Refinery (2/3), Agriculture (1/3)                                                                                                                                                           |
| Esclavage (Slavery)                          | 1/2              | Agriculture (1/1)                                                                                                            | toutes ou presque (1/1)                                                                                                                                                                     |
| Récupération (Salvage)                       | 0/96             | — (non couvert)                                                                                                              | — (non couvert)                                                                                                                                                                             |
| Non commercialisable (NonMarketable)         | 0/1              | — (non couvert)                                                                                                              | — (non couvert)                                                                                                                                                                             |

### 4.3 Les 17 économies de station face au catalogue des marchandises

Les 17 types d'économie sont relevés intégralement dans `economy.csv`, avec leur identifiant interne. Les deux
colonnes chiffrées sont un **comptage** effectué sur les 133 marchandises couvertes ; les clauses d'exclusion
(« sauf … ») n'y sont pas comptées.

| Économie (economy.csv) | Identifiant interne      | Citée comme productrice | Citée comme consommatrice | Rôle commercial relevé |
|------------------------|--------------------------|-------------------------|---------------------------|------------------------|
| Agriculture            | `$economy_Agri;`         | 17                      | 10                        | oui                    |
| Colony                 | `$economy_Colony;`       | 1                       | 6                         | oui                    |
| Extraction             | `$economy_Extraction;`   | 21                      | 11                        | oui                    |
| High Tech              | `$economy_HighTech;`     | 31                      | 43                        | oui                    |
| Industrial             | `$economy_Industrial;`   | 32                      | 35                        | oui                    |
| Military               | `$economy_Military;`     | 5                       | 25                        | oui                    |
| None                   | `$economy_None;`         | 0                       | 0                         | non                    |
| Refinery               | `$economy_Refinery;`     | 37                      | 24                        | oui                    |
| Service                | `$economy_Service;`      | 0                       | 4                         | oui                    |
| Terraforming           | `$economy_Terraforming;` | 0                       | 7                         | oui                    |
| Tourism                | `$economy_Tourism;`      | 0                       | 5                         | oui                    |
| Prison                 | `$economy_Prison;`       | 0                       | 0                         | non                    |
| Damaged                | `$economy_Damaged;`      | 0                       | 0                         | non                    |
| Rescue                 | `$economy_Rescue;`       | 0                       | 0                         | non                    |
| Repair                 | `$economy_Repair;`       | 0                       | 0                         | non                    |
| Private Enterprise     | `$economy_Carrier;`      | 0                       | 0                         | non                    |
| Engineering            | `$economy_Engineer;`     | 0                       | 0                         | non                    |

**Correction à porter dans [Commerce](./11-commerce.md).** Ce guide y range aujourd'hui *Service* et
*Terraforming* parmi les économies « sans rôle commercial direct pour le joueur ». Le relevé ci-dessus l'infirme pour
les deux. **Terraforming consomme 7 marchandises relevées** — Polymers, Semiconductors, Superconductors, Aquaponic
Systems, Land Enrichment Systems, Atmospheric Processors et Osmium — et **Service en consomme 4** — Moissanite,
Taaffeite, Jadeite et Medical Diagnostic Equipment. Les économies réellement sans rôle commercial relevé sont au
nombre de **7** : None, Prison, Damaged, Rescue, Repair, Private Enterprise (Carrier) et Engineering. Autrement dit,
**10 économies sur 17** ont un rôle commercial relevé, et non huit. Cette phrase doit être corrigée là où elle
subsiste dans le corpus ; ce guide-ci ne la recopie pas.

### 4.4 Économies productrices et consommatrices, marchandise par marchandise

Les noms d'économie restent en anglais, comme dans `economy.csv` et comme dans le tableau des économies de
[Commerce](./11-commerce.md). Les **137 marchandises non couvertes sont volontairement absentes** de ce tableau :
aucune source consultée n'en documente l'économie, et une ligne vide y serait lue comme une absence d'économie.

Deux normalisations de vocabulaire ont été opérées et doivent être déclarées. La source écrit « Agricultural » et
« Tourist » là où `economy.csv` écrit « Agriculture » et « Tourism » : les libellés d'`economy.csv` ont été retenus.
En revanche « Mining only », « Planetary Mining », « Salvage », « Nowhere » et les qualificatifs « (Surface) »,
« (Space) » et « Orbital » ne correspondent à **aucune** entrée d'`economy.csv` : ce sont des mentions hors
référentiel, traduites ici par « minage uniquement », « minage planétaire », « récupération d'épaves », « aucune »,
« au sol » et « orbital », sans prétendre qu'il s'agisse d'économies de station. Les mentions « près de <système> » qui
apparaissent pour douze composants d'ingénierie signalent des marchandises produites dans une poignée de systèmes
seulement, autour du système nommé.

| Marchandise (EN)              | Catégorie             | Économie productrice                       | Économie consommatrice                                                                          |
|-------------------------------|-----------------------|--------------------------------------------|-------------------------------------------------------------------------------------------------|
| Aluminium                     | Métaux                | Refinery                                   | Industrial et Military                                                                          |
| Beryllium                     | Métaux                | Refinery                                   | High Tech et Industrial                                                                         |
| Bismuth                       | Métaux                | Refinery (au sol)                          | High Tech                                                                                       |
| Cobalt                        | Métaux                | Extraction et Refinery                     | High Tech et Industrial                                                                         |
| Copper                        | Métaux                | Refinery                                   | Industrial                                                                                      |
| Gallium                       | Métaux                | Refinery                                   | High Tech et Industrial                                                                         |
| Gold                          | Métaux                | Extraction et Refinery                     | Toutes sauf Agriculture, Refinery, Extraction et Military                                       |
| Indium                        | Métaux                | Refinery                                   | High Tech et Industrial                                                                         |
| Lanthanum                     | Métaux                | Refinery (au sol)                          | High Tech                                                                                       |
| Lithium                       | Métaux                | Refinery                                   | High Tech et Industrial                                                                         |
| Osmium                        | Métaux                | Minage uniquement (aucun marché vendeur)   | High Tech, Industrial, Military et Terraforming                                                 |
| Palladium                     | Métaux                | Extraction                                 | Toutes sauf Agriculture, Refinery, Extraction et Military                                       |
| Platinum                      | Métaux                | Minage uniquement (aucun marché vendeur)   | Toutes sauf Agriculture, Refinery, Extraction et Military                                       |
| Praseodymium                  | Métaux                | Minage uniquement (aucun marché vendeur)   | High Tech et Industrial                                                                         |
| Samarium                      | Métaux                | Minage uniquement (aucun marché vendeur)   | High Tech et Industrial                                                                         |
| Silver                        | Métaux                | Extraction et Refinery                     | Toutes sauf Agriculture, Refinery, Extraction et Military                                       |
| Tantalum                      | Métaux                | Refinery                                   | High Tech et Industrial                                                                         |
| Thallium                      | Métaux                | Refinery (au sol)                          | High Tech                                                                                       |
| Thorium                       | Métaux                | Refinery (au sol)                          | High Tech et Military                                                                           |
| Titanium                      | Métaux                | Refinery                                   | Industrial et Military                                                                          |
| Uranium                       | Métaux                | Refinery                                   | High Tech et Industrial                                                                         |
| Bauxite                       | Minéraux              | Extraction                                 | Refinery                                                                                        |
| Bertrandite                   | Minéraux              | Extraction                                 | Refinery                                                                                        |
| Bromellite                    | Minéraux              | Minage uniquement (aucun marché vendeur)   | High Tech                                                                                       |
| Coltan                        | Minéraux              | Extraction                                 | Refinery                                                                                        |
| Cryolite                      | Minéraux              | Extraction (au sol)                        | High Tech et Refinery                                                                           |
| Gallite                       | Minéraux              | Extraction                                 | High Tech et Refinery                                                                           |
| Goslarite                     | Minéraux              | Extraction (au sol)                        | Refinery                                                                                        |
| Indite                        | Minéraux              | Extraction                                 | Refinery                                                                                        |
| Jadeite                       | Minéraux              | Minage planétaire                          | Service (orbital) et Tourism                                                                    |
| Lepidolite                    | Minéraux              | Extraction                                 | Refinery                                                                                        |
| Lithium Hydroxide             | Minéraux              | Minage uniquement (aucun marché vendeur)   | High Tech et Refinery                                                                           |
| Low Temperature Diamonds      | Minéraux              | Minage uniquement (aucun marché vendeur)   | Toutes                                                                                          |
| Methane Clathrate             | Minéraux              | Minage uniquement (aucun marché vendeur)   | Refinery                                                                                        |
| Methanol Monohydrate Crystals | Minéraux              | Minage uniquement (aucun marché vendeur)   | Colony, High Tech et Industrial                                                                 |
| Moissanite                    | Minéraux              | Minage planétaire                          | Service (orbital) et Tourism                                                                    |
| Painite                       | Minéraux              | Minage uniquement (aucun marché vendeur)   | Toutes sauf Terraforming, Extraction et Military                                                |
| Pyrophyllite                  | Minéraux              | Extraction (au sol)                        | High Tech et Refinery                                                                           |
| Rutile                        | Minéraux              | Extraction                                 | High Tech et Refinery                                                                           |
| Taaffeite                     | Minéraux              | Minage planétaire                          | Service (orbital) et Tourism                                                                    |
| Uraninite                     | Minéraux              | Extraction                                 | Refinery                                                                                        |
| Explosives                    | Produits chimiques    | High Tech (au sol) et Refinery             | Extraction                                                                                      |
| Hydrogen Fuel                 | Produits chimiques    | Toutes                                     | Toutes                                                                                          |
| Hydrogen Peroxide             | Produits chimiques    | Minage uniquement (aucun marché vendeur)   | Refinery et Industrial                                                                          |
| Liquid oxygen                 | Produits chimiques    | Refinery                                   | Industrial                                                                                      |
| Mineral Oil                   | Produits chimiques    | Agriculture                                | Refinery                                                                                        |
| Nerve Agents                  | Produits chimiques    | Refinery (au sol)                          | High Tech (au sol) et Military                                                                  |
| Pesticides                    | Produits chimiques    | High Tech                                  | Agriculture                                                                                     |
| Surface Stabilisers           | Produits chimiques    | Refinery (au sol)                          | Toutes (au sol) sauf Refinery                                                                   |
| Synthetic Reagents            | Produits chimiques    | Refinery (au sol)                          | High Tech et Military                                                                           |
| Water                         | Produits chimiques    | Agriculture et Extraction (au sol)         | Toutes sauf Agriculture et Extraction (au sol)                                                  |
| CMM Composite                 | Matériaux industriels | Refinery (au sol)                          | High Tech, Industrial et Military                                                               |
| Ceramic Composites            | Matériaux industriels | Refinery (au sol)                          | Industrial et High Tech                                                                         |
| Insulating Membrane           | Matériaux industriels | Refinery (orbital)                         | High Tech, Industrial et Military                                                               |
| Polymers                      | Matériaux industriels | Refinery                                   | Military, Terraforming et Industrial                                                            |
| Semiconductors                | Matériaux industriels | Refinery                                   | Terraforming et Industrial                                                                      |
| Superconductors               | Matériaux industriels | Refinery                                   | Terraforming, High Tech et Industrial                                                           |
| Atmospheric Processors        | Machines              | Industrial                                 | Terraforming et Agriculture                                                                     |
| Building Fabricators          | Machines              | Industrial                                 | Colony (au sol), Extraction (au sol), High Tech (au sol), Military (au sol) et Tourism (au sol) |
| Crop Harvesters               | Machines              | Industrial                                 | Agriculture                                                                                     |
| Emergency Power Cells         | Machines              | High Tech/Refinery près d'Akhenaten        | High Tech, Industrial et Military                                                               |
| Energy Grid Assembly          | Machines              | Industrial/Refinery près de Stafkarl       | High Tech et Military                                                                           |
| Exhaust Manifold              | Machines              | Industrial/Refinery près de Run            | High Tech                                                                                       |
| Geological Equipment          | Machines              | Industrial                                 | Colony (au sol), Extraction (au sol), Military (au sol) et High Tech (au sol)                   |
| HN Shock Mount                | Machines              | Industrial                                 | High Tech et Military                                                                           |
| Heatsink Interlink            | Machines              | Industrial/Refinery près de Myrbat         | High Tech                                                                                       |
| Ion Distributor               | Machines              | Industrial/Extraction près de 70 Tauri     | High Tech (au sol) et Military (au sol)                                                         |
| Magnetic Emitter Coil         | Machines              | Industrial/Refinery près de Leesti         | High Tech                                                                                       |
| Marine Equipment              | Machines              | Industrial                                 | Agriculture                                                                                     |
| Microbial Furnaces            | Machines              | High Tech                                  | Refinery                                                                                        |
| Mineral Extractors            | Machines              | Industrial                                 | Extraction                                                                                      |
| Power Converter               | Machines              | Industrial/Extraction près de Lakota       | High Tech                                                                                       |
| Power Generators              | Machines              | Industrial                                 | Toutes sauf Industrial                                                                          |
| Power Transfer Bus            | Machines              | Industrial/Extraction près de Cilbien Zu   | High Tech (au sol)                                                                              |
| Radiation Baffle              | Machines              | Industrial/Extraction près de Heget        | Military                                                                                        |
| Reinforced Mounting Plate     | Machines              | Extraction/Refinery près d'Eurybia         | Industrial (au sol)                                                                             |
| Skimmer Components            | Machines              | Industrial                                 | Toutes (au sol) sauf Industrial (au sol)                                                        |
| Thermal Cooling Units         | Machines              | Industrial                                 | Colony (au sol), Extraction (au sol), High Tech (au sol), Military (au sol) et Tourism (au sol) |
| Water Purifiers               | Machines              | Industrial                                 | Toutes sauf Industrial                                                                          |
| Advanced Catalysers           | Technologie           | High Tech                                  | Refinery                                                                                        |
| Animal Monitors               | Technologie           | High Tech                                  | Agriculture                                                                                     |
| Aquaponic Systems             | Technologie           | High Tech                                  | Terraforming et Agriculture                                                                     |
| Auto-Fabricators              | Technologie           | High Tech                                  | Industrial                                                                                      |
| Bioreducing Lichen            | Technologie           | High Tech                                  | Extraction                                                                                      |
| Computer Components           | Technologie           | Industrial                                 | High Tech et Military                                                                           |
| H.E. Suits                    | Technologie           | High Tech                                  | Industrial, Refinery, Extraction et Military                                                    |
| Hardware Diagnostic Sensor    | Technologie           | Industrial/Refinery près de Lei Jing       | High Tech et Military                                                                           |
| Land Enrichment Systems       | Technologie           | High Tech                                  | Terraforming et Agriculture                                                                     |
| Medical Diagnostic Equipment  | Technologie           | High Tech                                  | Service                                                                                         |
| Micro Controllers             | Technologie           | High Tech                                  | Industrial et Military                                                                          |
| Muon Imager                   | Technologie           | Industrial (au sol) et High Tech (au sol)  | Extraction (au sol) et Military (au sol)                                                        |
| Resonating Separators         | Technologie           | High Tech                                  | Refinery                                                                                        |
| Robotics                      | Technologie           | High Tech                                  | Industrial                                                                                      |
| Structural Regulators         | Technologie           | High Tech (au sol)                         | Toutes (au sol) sauf High Tech                                                                  |
| Algae                         | Denrées alimentaires  | Agriculture                                | Industrial et Military                                                                          |
| Animal Meat                   | Denrées alimentaires  | Agriculture                                | Toutes sauf Agriculture                                                                         |
| Coffee                        | Denrées alimentaires  | Agriculture                                | Toutes sauf Agriculture                                                                         |
| Fish                          | Denrées alimentaires  | Agriculture                                | Toutes sauf Agriculture                                                                         |
| Food Cartridges               | Denrées alimentaires  | Industrial                                 | Toutes sauf Agriculture et Industrial                                                           |
| Fruit and Vegetables          | Denrées alimentaires  | Agriculture                                | Toutes                                                                                          |
| Grain                         | Denrées alimentaires  | Agriculture                                | Toutes sauf Agriculture                                                                         |
| Synthetic Meat                | Denrées alimentaires  | High Tech                                  | Toutes sauf High Tech et Agriculture                                                            |
| Tea                           | Denrées alimentaires  | Agriculture                                | Toutes sauf Agriculture                                                                         |
| Conductive Fabrics            | Textiles              | Refinery                                   | High Tech et Industrial                                                                         |
| Leather                       | Textiles              | Agriculture                                | Industrial                                                                                      |
| Military Grade Fabrics        | Textiles              | Industrial                                 | Military                                                                                        |
| Natural Fabrics               | Textiles              | Agriculture                                | Industrial                                                                                      |
| Synthetic Fabrics             | Textiles              | Refinery                                   | Industrial                                                                                      |
| Clothing                      | Biens de consommation | Industrial                                 | Toutes                                                                                          |
| Consumer Technology           | Biens de consommation | High Tech                                  | Toutes sauf High Tech                                                                           |
| Domestic Appliances           | Biens de consommation | Industrial                                 | Toutes                                                                                          |
| Evacuation Shelter            | Biens de consommation | High Tech                                  | Toutes (au sol) sauf High Tech                                                                  |
| Survival Equipment            | Biens de consommation | Industrial                                 | Toutes (au sol) sauf Industrial                                                                 |
| Advanced Medicines            | Médicaments           | High Tech                                  | Toutes sauf High Tech                                                                           |
| Agri-Medicines                | Médicaments           | High Tech                                  | Agriculture                                                                                     |
| Basic Medicines               | Médicaments           | High Tech et Industrial                    | Toutes sauf High Tech et Industrial                                                             |
| Combat Stabilisers            | Médicaments           | High Tech                                  | Toutes sauf High Tech                                                                           |
| Performance Enhancers         | Médicaments           | High Tech                                  | Colony, Agriculture, Industrial, Refinery, Extraction et Military                               |
| Progenitor Cells              | Médicaments           | High Tech                                  | Toutes sauf High Tech et Terraforming                                                           |
| Beer                          | Drogues légales       | Agriculture                                | Toutes                                                                                          |
| Bootleg Liquor                | Drogues légales       | Récupération d'épaves et Refinery (au sol) | Extraction (orbital), Industrial et Refinery                                                    |
| Liquor                        | Drogues légales       | Agriculture et Industrial                  | Toutes                                                                                          |
| Narcotics                     | Drogues légales       | Agriculture, High Tech et Industrial       | Toutes sauf High Tech et Industrial                                                             |
| Tobacco                       | Drogues légales       | Agriculture                                | Toutes                                                                                          |
| Wine                          | Drogues légales       | Agriculture                                | Toutes                                                                                          |
| Landmines                     | Armes                 | Military (au sol)                          | Colony (au sol), Extraction (au sol), High Tech (au sol) et Refinery (au sol)                   |
| Non-Lethal Weapons            | Armes                 | High Tech et Military                      | Toutes                                                                                          |
| Personal Weapons              | Armes                 | High Tech, Industrial et Military          | Toutes                                                                                          |
| Reactive Armour               | Armes                 | High Tech et Military                      | Toutes                                                                                          |
| Biowaste                      | Déchets               | Toutes sauf Agriculture                    | Agriculture                                                                                     |
| Chemical Waste                | Déchets               | Aucune                                     | Refinery                                                                                        |
| Scrap                         | Déchets               | Colony, High Tech, Military et Industrial  | Refinery                                                                                        |
| Imperial Slaves               | Esclavage             | Agriculture                                | Toutes                                                                                          |

### 4.5 Cinq généralisations fausses sur les économies, et leurs contre-exemples

Ces cinq énoncés paraissent naturels et sont contredits par le tableau ci-dessus. Ils sont listés ici parce qu'un
moteur de recherche documentaire remonte volontiers la phrase qui introduit un tableau plutôt que le tableau lui-même.

1. **« Les métaux se produisent en économie Extraction. »** Faux. Sur les 21 métaux couverts, *Refinery* est cité
   **16 fois** comme producteur et *Extraction* seulement **4 fois** ; quatre métaux — Platinum, Osmium,
   Praseodymium, Samarium — ne se produisent **nulle part** et s'obtiennent au minage. Le partage que fait FDevIDs
   entre `Metals` et `Minerals` recoupe en réalité la chaîne Extraction → Refinery : les Minerals sont le minerai
   brut extrait, les Metals le produit raffiné.
2. **« Les minéraux se vendent en Refinery. »** Faux. Jadeite, Moissanite et Taaffeite se vendent en économies
   *Service* (orbitale) et *Tourism*, pas du tout en *Refinery*. Painite se vend « partout sauf Terraforming,
   Extraction et Military ».
3. **« Chaque marchandise a une économie productrice. »** Faux. Les **96 marchandises de la catégorie Salvage** n'en
   ont aucune. Chemical Waste est explicitement produit « nulle part » et pourtant consommé en *Refinery*.
4. **« Service et Terraforming n'ont pas de rôle commercial. »** Faux — voir la correction en 4.3.
5. **« Salvage est une catégorie marginale. »** Faux : 96 entrées, plus du tiers du catalogue.

## 5. La légalité des marchandises : ce qui est documenté, et pourquoi ce n'est pas une table de légalité

### 5.1 La règle qui s'applique réellement

**La légalité d'une marchandise dépend de la faction mineure qui contrôle la station.** Elle se lit dans la liste
`Prohibited` du panneau latéral de la station, sur la carte du système, et elle **varie d'un système à l'autre**.
C'est la mécanique documentée, et c'est la seule réponse fiable à la question « telle marchandise est-elle légale ? ».
Pour la contrebande, les marchés noirs et les conséquences d'un chargement illégal, voir
[Commerce](./11-commerce.md).

### 5.2 Relevé partiel des marchandises dont la description en jeu mentionne une illégalité

Le tableau ci-dessous recense des marchandises dont la fiche EDSM porte une mention explicite d'illégalité. **Ce
relevé est partiel et n'a pas été mené sur les 270 fiches** : il a été constitué à partir des catégories les plus
exposées (Drogues légales, Armes, Médicaments) et d'un balayage des minéraux et denrées alimentaires. Une
vérification ultérieure a identifié au moins deux entrées manquantes portant pourtant la même formule —
*Performance Enhancers* et *Toxic Waste* — sans que le relevé exhaustif ait pu être refait faute d'accès à la
source. Ce n'est donc ni une table de légalité, ni un décompte : une **absence dans ce tableau ne prouve rien**. La colonne « Texte source » reproduit la phrase anglaise ; la colonne « Restriction
relevée » en est une traduction produite pour ce corpus.

| Marchandise (EN)    | Nom français             | Catégorie             | Restriction relevée                                                                                        | Texte source (EDSM, anglais)                                                |
|---------------------|--------------------------|-----------------------|------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| Uraninite           | Uraninite                | Minéraux              | Illégale dans certaines juridictions.                                                                      | Illegal in some jurisdictions.                                              |
| Animal Meat         | Viande animale           | Denrées alimentaires  | Illégale dans certaines juridictions.                                                                      | Illegal in some jurisdictions.                                              |
| Fish                | Poisson                  | Denrées alimentaires  | Illégal dans certaines juridictions.                                                                       | Illegal in some jurisdictions.                                              |
| Consumer Technology | Technologie grand public | Biens de consommation | Illégale dans les colonies pénitentiaires et les théocraties.                                              | Illegal in prison colonies and theocracies.                                 |
| Combat Stabilisers  | Stabilisateurs de combat | Médicaments           | Illégaux sur la plupart des marchés.                                                                       | Illegal in most markets.                                                    |
| Beer                | Bière                    | Drogues légales       | Illégale dans les colonies pénitentiaires et les théocraties fédérales.                                    | Illegal in prison colonies and Federal theocracies.                         |
| Liquor              | Spiritueux               | Drogues légales       | Illégaux dans les colonies pénitentiaires et les théocraties alignées sur la Fédération ou sur l'Alliance. | Illegal in prison colonies and Federal and Alliance aligned theocracies.    |
| Narcotics           | Stupéfiants              | Drogues légales       | Illégaux partout, sauf dans les anarchies et les dictatures.                                               | Illegal in all but anarchies and dictatorships.                             |
| Tobacco             | Tabac                    | Drogues légales       | Illégal dans de nombreuses juridictions.                                                                   | Illegal in many jurisdictions.                                              |
| Wine                | Vin                      | Drogues légales       | Illégal dans les colonies pénitentiaires et les théocraties alignées sur la Fédération.                    | Illegal in prison colonies and Federal aligned theocracies.                 |
| Battle Weapons      | Armes de guerre          | Armes                 | Illégales sur tous les marchés, sauf ceux gouvernés par un régime communiste ou une dictature.             | Illegal in all markets except those governed by communist or dictatorships. |
| Personal Weapons    | Armes personnelles       | Armes                 | Illégales ou strictement contrôlées dans de nombreuses juridictions.                                       | Illegal or highly controlled in many jurisdictions.                         |

**Ce que le tableau ne dit pas.** Une marchandise notoirement interdite peut n'avoir aucune mention dans sa fiche —
et une mention peut exister sans avoir été relevée ici. Les deux sens de l'écart sont ouverts. Le tableau illustre le
principe énoncé en 5.1, il ne le remplace pas, et la légalité effective se lit en jeu au marché de la station.

**Une proportion à ne pas arrondir.** Sur les 7 marchandises de la catégorie Drogues légales, **5 portent une
mention** — Beer, Wine, Liquor, Narcotics, Tobacco. Il ne faut donc pas écrire que toutes les drogues légales sont
interdites quelque part : Bootleg Liquor et Onionhead Gamma Strain n'ont, dans cette source, aucune mention.

## 6. Les 63 marchandises minables : technique d'extraction et type d'anneau

### 6.1 Les quatre types d'anneau reconnus par le jeu

Relevé intégral de `rings.csv` (FDevIDs), corroboré par l'énumération `RingClassEnum { Unknown, Rocky, Metallic, Icy,
MetalRich }` du code d'EliteDangerousCore. **Il n'existe que 4 types d'anneau** ; toute réponse qui en cite un
cinquième est fausse.

| Identifiant FDev       | Nom en jeu (anglais) | Nom français retenu | Remarque                                                                                 |
|------------------------|----------------------|---------------------|------------------------------------------------------------------------------------------|
| `eRingClass_Icy`       | Icy                  | Glacé               | —                                                                                        |
| `eRingClass_MetalRich` | Metal Rich           | Riche en métaux     | Type distinct de « Métallique » ; edtools.cc/hotspot ne le propose pas dans ses filtres  |
| `eRingClass_Metalic`   | Metallic             | Métallique          | Le journal de jeu écrit « Metalic » (une seule L) ; EDSM et Spansh écrivent « Metallic » |
| `eRingClass_Rocky`     | Rocky                | Rocheux             | —                                                                                        |

### 6.2 Périmètre de cette section, et un piège de découpage

Cette section couvre les **63 marchandises** des catégories `Minerals` (39) et `Metals` (24) de `commodity.csv`, ni
plus ni moins. Elle ne couvre donc **pas** le Tritium, l'Hydrogen Peroxide, le Liquid Oxygen ni la Water, qui sont
pourtant extraits en anneau glacé : le jeu les classe en `Chemicals`. Conclure de leur absence que le Tritium n'est
pas minable serait une erreur de lecture — le carburant des Porte-Vaisseaux se mine bel et bien, voir
[Porte-vaisseaux](./19-fleet-carriers.md) et [Le Minage](./20-minage.md).

**Aucune des colonnes « technique » et « type d'anneau » ne repose sur une source Frontier.** Frontier ne publie pas
la table de distribution des minéraux par type d'anneau. Ce qui suit est une **synthèse communautaire datée du
10 septembre 2026**, agrégée à partir de trois guides et discussions de joueurs, et présentée comme telle. Les clés de
source de la dernière colonne renvoient à la section « Sources » : `S1` guide Steam d'octobre 2025, `S2` guide Steam
de décembre 2018, `S3` discussion Steam d'octobre 2025, `S4` FAQ EDSM, `L1` le guide [Le Minage](./20-minage.md) de ce
corpus. Une case « — » signifie « non établi » ; la mention *sans objet (hors anneau)* signifie qu'une source atteste
que la marchandise s'obtient ailleurs qu'en anneau.

| Marchandise (EN)              | Nom français                        | Catégorie | Technique d'extraction | Type d'anneau                              | Clé de source                                     |
|-------------------------------|-------------------------------------|-----------|------------------------|--------------------------------------------|---------------------------------------------------|
| Aluminium                     | Aluminium                           | Métaux    | —                      | —                                          | S4                                                |
| Beryllium                     | Béryllium                           | Métaux    | —                      | —                                          | S4                                                |
| Bismuth                       | Bismuth                             | Métaux    | —                      | —                                          | S4                                                |
| Cobalt                        | Cobalt                              | Métaux    | Laser                  | Rocheux                                    | S1+S2                                             |
| Copper                        | Cuivre                              | Métaux    | —                      | —                                          | S4                                                |
| Gallium                       | Gallium                             | Métaux    | —                      | —                                          | S4                                                |
| Gold                          | Or                                  | Métaux    | Laser                  | Métallique, Riche en métaux *(?)*          | S1/S2 divergent                                   |
| Hafnium 178                   | Hafnium 178                         | Métaux    | —                      | —                                          | —                                                 |
| Indium                        | Indium                              | Métaux    | —                      | —                                          | S4                                                |
| Iridium                       | Iridium                             | Métaux    | Surface planétaire     | *sans objet (hors anneau)*                 | L1 §3.3.3                                         |
| Lanthanum                     | Lanthane                            | Métaux    | —                      | —                                          | S4                                                |
| Lithium                       | Lithium                             | Métaux    | —                      | —                                          | S4                                                |
| Osmium                        | Osmium                              | Métaux    | Laser                  | Métallique, Riche en métaux                | S1+S2                                             |
| Palladium                     | Palladium                           | Métaux    | Laser                  | Métallique                                 | S1+S2                                             |
| Platinum                      | Platine                             | Métaux    | Laser + noyau          | Métallique, Riche en métaux                | S1+S2                                             |
| Praseodymium                  | Praséodyme                          | Métaux    | Laser                  | Métallique, Riche en métaux                | S1+S2                                             |
| Samarium                      | Samarium                            | Métaux    | Laser                  | Métallique, Riche en métaux, Rocheux *(?)* | S1/S2 divergent                                   |
| Silver                        | Argent                              | Métaux    | Laser                  | Métallique, Riche en métaux                | S1+S2                                             |
| Steel                         | Acier                               | Métaux    | —                      | —                                          | —                                                 |
| Tantalum                      | Tantale                             | Métaux    | —                      | —                                          | S4                                                |
| Thallium                      | Thallium                            | Métaux    | —                      | —                                          | S4                                                |
| Thorium                       | Thorium                             | Métaux    | —                      | —                                          | S4                                                |
| Titanium                      | Titane                              | Métaux    | —                      | —                                          | S4                                                |
| Uranium                       | Uranium                             | Métaux    | —                      | —                                          | S4                                                |
| Alexandrite                   | Alexandrite                         | Minéraux  | Noyau (core)           | Glacé, Rocheux, Riche en métaux            | S1+S3                                             |
| Bastnasite                    | Bastnäsite                          | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | L1 §3.3.3                                         |
| Bauxite                       | Bauxite                             | Minéraux  | Laser                  | Rocheux                                    | S1+S2                                             |
| Benitoite                     | Bénitoïte                           | Minéraux  | Noyau (core)           | Rocheux, Riche en métaux *(?)*             | S1/S3 divergent                                   |
| Bertrandite                   | Bertrandite                         | Minéraux  | Laser                  | Métallique, Riche en métaux                | S1+S2                                             |
| Bromellite                    | Bromellite                          | Minéraux  | Laser + noyau          | Glacé                                      | S1+S2                                             |
| Coltan                        | Coltan                              | Minéraux  | Laser                  | Rocheux, Riche en métaux                   | S1+S2                                             |
| Cryolite                      | Cryolithe                           | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | S4                                                |
| Deuterium                     | Deutérium                           | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | L1 §3.3.3                                         |
| Diamond                       | Diamant                             | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | L1 §3.3.3                                         |
| Gallite                       | Gallite                             | Minéraux  | Laser                  | Rocheux, Métallique, Riche en métaux       | S1+S2                                             |
| Goslarite                     | Goslarite                           | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | S4                                                |
| Grandidierite                 | Grandidiérite                       | Minéraux  | Noyau (core)           | Glacé                                      | S1+S3                                             |
| Haematite                     | Hématite                            | Minéraux  | —                      | —                                          | —                                                 |
| Indite                        | Indite                              | Minéraux  | Laser                  | Rocheux, Métallique, Riche en métaux       | S1+S2                                             |
| Jadeite                       | Jadéite                             | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | S4                                                |
| Lepidolite                    | Lépidolite                          | Minéraux  | Laser                  | Rocheux, Riche en métaux                   | S1+S2                                             |
| Lithium Hydroxide             | Hydroxyde de lithium                | Minéraux  | Laser                  | Glacé                                      | S1+S2                                             |
| Low Temperature Diamonds      | Diamants basse température          | Minéraux  | Noyau + subsurface     | Glacé                                      | S1+S2+S3+S5                                       |
| Magnesite                     | Magnésite                           | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | L1 §3.3.3                                         |
| Methane Clathrate             | Clathrate de méthane                | Minéraux  | Laser                  | Glacé                                      | S1+S2                                             |
| Methanol Monohydrate Crystals | Cristaux de monohydrate de méthanol | Minéraux  | Laser                  | Glacé                                      | S1+S2                                             |
| Moissanite                    | Moissanite                          | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | S4                                                |
| Monazite                      | Monazite                            | Minéraux  | Noyau (core)           | Rocheux, Métallique, Riche en métaux       | S1 (S3 signale aussi du Monazite en anneau glacé) |
| Musgravite                    | Musgravite                          | Minéraux  | Noyau (core)           | Rocheux                                    | S1+S3                                             |
| Olivine                       | Olivine                             | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | L1 §3.3.3                                         |
| Painite                       | Painite                             | Minéraux  | Laser + noyau          | Métallique, Riche en métaux                | S1+S2+S3+S5                                       |
| Periclase Dunite              | Dunite à périclase                  | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | L1 §3.3.3                                         |
| Pyrophyllite                  | Pyrophyllite                        | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | S4                                                |
| Quartz Pyroxenite             | Pyroxénite à quartz                 | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | L1 §3.3.3                                         |
| Rhodplumsite                  | Rhodplumsite                        | Minéraux  | Noyau (core)           | Métallique, Riche en métaux                | S1+S3                                             |
| Ruby                          | Rubis                               | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | L1 §3.3.3                                         |
| Rutile                        | Rutile                              | Minéraux  | Laser                  | Rocheux                                    | S1+S2                                             |
| Sapphire                      | Saphir                              | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | L1 §3.3.3                                         |
| Serendibite                   | Sérendibite                         | Minéraux  | Noyau (core)           | Rocheux, Métallique, Riche en métaux       | S1+S3                                             |
| Taaffeite                     | Taaffeite                           | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | S4                                                |
| Thortveitite                  | Thortveitite                        | Minéraux  | Surface planétaire     | *sans objet (hors anneau)*                 | L1 §3.3.3                                         |
| Uraninite                     | Uraninite                           | Minéraux  | Laser                  | Rocheux, Riche en métaux                   | S1+S2                                             |
| Void Opal                     | Opale du vide                       | Minéraux  | Noyau (core)           | Glacé                                      | S1+S3                                             |

**Recomptage effectué sur le tableau ci-dessus**, et non sur les données d'entrée.

| Colonne du tableau ci-dessus | Renseignée | « Sans objet » | Vide (non établi) |
|------------------------------|-----------:|---------------:|------------------:|
| Type d'anneau                |    30 / 63 |             17 |                16 |
| Technique d'extraction       |    47 / 63 |              — |                16 |
| Réserve minimale conseillée  |     0 / 63 |              — |                63 |

Les 30 lignes à type d'anneau renseigné se répartissent en **22 minéraux et
8 métaux**. Les 16 lignes vides sont : Aluminium, Beryllium, Bismuth, Copper, Gallium, Hafnium 178, Indium, Lanthanum, Lithium, Steel, Tantalum, Thallium, Thorium, Titanium, Uranium, Haematite. Pour treize d'entre elles, EDSM indique une
production par économie `Refinery` ou `Refinery (Surface)`, ce qui rendrait plausible qu'elles ne soient pas extraites
d'astéroïde du tout — mais aucune source ne l'affirme, et ce n'est donc pas écrit ici comme un fait. Les trois
dernières — Hafnium 178, Steel, Haematite — n'ont strictement aucune donnée d'aucune sorte.

### 6.3 Que trouve-t-on dans chaque type d'anneau

Le décompte ci-dessous porte **uniquement sur les catégories Minéraux et Métaux**. La colonne « Nb » ne dit donc pas
combien de choses on peut miner dans un anneau, mais combien de marchandises de ces deux catégories y sont
documentées. Une même marchandise peut compter dans plusieurs anneaux : la somme des quatre lignes vaut
54 et n'est pas un effectif. La marque *(?)* signale qu'une seule des deux sources l'affirme, l'autre
l'infirmant ou restant muette (voir 6.5).

| Type d'anneau   | Nb (Minéraux + Métaux) | Marchandises documentées                                                                                                                                                                              |
|-----------------|-----------------------:|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Glacé           |                      8 | Alexandrite, Bromellite, Grandidierite, Lithium Hydroxide, Low Temperature Diamonds, Methane Clathrate, Methanol Monohydrate Crystals, Void Opal                                                      |
| Rocheux         |                     14 | Alexandrite, Bauxite, Benitoite, Cobalt, Coltan, Gallite, Indite, Lepidolite, Monazite, Musgravite, Rutile, Samarium *(?)*, Serendibite, Uraninite                                                    |
| Métallique      |                     14 | Bertrandite, Gallite, Gold, Indite, Monazite, Osmium, Painite, Palladium, Platinum, Praseodymium, Rhodplumsite, Samarium, Serendibite, Silver                                                         |
| Riche en métaux |                     18 | Alexandrite, Benitoite *(?)*, Bertrandite, Coltan, Gallite, Gold *(?)*, Indite, Lepidolite, Monazite, Osmium, Painite, Platinum, Praseodymium, Rhodplumsite, Samarium, Serendibite, Silver, Uraninite |

**Réponse directe à la question qui manquait au corpus.** La **Bertrandite** se mine **au laser**, dans les
anneaux **métalliques** et **riches en métaux**. Les deux sources indépendantes concordent, et aucune ne la place en
anneau glacé ni en anneau rocheux.

**Trois autres distinctions établies et non devinées.** Les minerais bruts au laser sont Bertrandite, Indite, Gallite,
Coltan, Uraninite, Lepidolite, Rutile et Bauxite : S1 (2025) et S2 (2018) s'accordent ligne pour ligne sur leurs types
d'anneau, et sept ans séparent ces deux relevés. Les métaux au laser en anneau métallique ou riche en métaux sont
Platinum, Palladium, Gold, Silver, Osmium, Praseodymium et Samarium — le **Cobalt fait exception**, en anneau
rocheux. Les gemmes du *core mining* sont les neuf que [Le Minage](./20-minage.md) nomme déjà, auxquelles S1 ajoute
Bromellite, Platinum et Painite comme accessibles aussi au noyau ; **la Bromellite n'est donc pas exclusivement
core-minable**, contrairement aux huit autres gemmes, et core-miner du Platinum ou de la Painite reste
contre-productif, ces deux-là étant bien plus efficaces au laser.

### 6.4 Les cinq niveaux de réserve d'un anneau, et pourquoi la colonne « réserve conseillée » est vide

**Aucune source ne donne de seuil de réserve par minéral**, et c'est un résultat, pas un oubli : la colonne
correspondante serait vide sur les 63 lignes, elle a donc été retirée du tableau plutôt que remplie « Pristine »
partout, ce qui aurait transformé un conseil global en donnée par minéral. Ce qui existe est une règle générale —
**viser les systèmes en réserve Pristine** — corroborée par trois sources indépendantes : le guide S2, l'outil
`edtools.cc/hotspot` qui se restreint de lui-même aux systèmes Pristine, et [Le Minage](./20-minage.md) qui confirme
par EDSM que les anneaux cités en exemple (Borann A 2 A Ring, Paesia 2 C et 5 A) sont en réserve Pristine.

| Niveau de réserve (nom en jeu) | Nom français | Ce que la source en dit                    |
|--------------------------------|--------------|--------------------------------------------|
| Pristine                       | Vierge       | Meilleur emplacement de minage             |
| Major                          | Majeure      | Correct, mais chercher plutôt une Pristine |
| Common                         | Commune      | Rendement jugé non rentable en temps       |
| Low                            | Faible       | Restes                                     |
| Depleted                       | Épuisée      | À éviter                                   |

### 6.5 Divergences entre sources sur les types d'anneau, non tranchées

Ces quatre désaccords ne sont pas masqués : ils sont reportés dans le tableau de 6.2 par la marque *(?)*.

| Marchandise | Ce que dit S1 (oct. 2025)                | Ce que dit l'autre source                            | Traitement retenu                     |
|-------------|------------------------------------------|------------------------------------------------------|---------------------------------------|
| Gold        | Métallique seul                          | S2 (2018) : Métallique **et** Riche en métaux        | « Riche en métaux » marqué *(?)*      |
| Samarium    | Métallique, Riche en métaux, **Rocheux** | S2 (2018) : Métallique et Riche en métaux seulement  | « Rocheux » marqué *(?)*              |
| Benitoite   | Rocheux **et** Riche en métaux           | S3 (oct. 2025) : anneaux rocheux                     | « Riche en métaux » marqué *(?)*      |
| Monazite    | Rocheux, Métallique, Riche en métaux     | S3 : rocheux surtout, mais **aussi** en anneau glacé | Glacé **non** ajouté : mention isolée |

### 6.6 Une contradiction à corriger dans deux guides du corpus

La section « Mining-to-trade » de [Commerce](./11-commerce.md) affirme, au 10 septembre 2026, que les minerais de
valeur sont « revendues sur des marchés spécialisés (économies de raffinage/extraction) », et [Le Minage](./20-minage.md)
reprend la même formule de ce guide. Le relevé EDSM dit **l'inverse** pour les marchandises que cette phrase nomme.

- Platinum, Gold, Palladium, Silver : « All except Agri, **Refinery**, **Extraction** and Military » — les économies
  de raffinage et d'extraction sont précisément celles qui ne les achètent pas.
- Painite : « Everywhere except Terraforming, **Extraction** and Military ».
- Osmium : « High Tech, Industrial, Military and Terraforming » — ni Refinery ni Extraction.
- Low Temperature Diamonds : « All » — seule des marchandises citées à inclure effectivement Refinery et Extraction.

Sur les 41 lignes à économie acheteuse renseignée dans les catégories Minéraux et Métaux, **zéro** nomme *Extraction*
comme acheteuse. Treize nomment explicitement *Refinery*, et ce sont toutes des minerais bruts ou des glaces à faible
valeur — Bauxite, Bertrandite, Coltan, Cryolite, Gallite, Goslarite, Indite, Lepidolite, Lithium Hydroxide, Methane
Clathrate, Pyrophyllite, Rutile, Uraninite —, jamais les gemmes. La logique du jeu est cohérente : une économie de
raffinage achète le minerai brut qu'elle va traiter, pas le métal déjà pur ni la gemme. La formule citée inverse cette
logique : elle doit être corrigée partout où elle subsiste dans le corpus, et ce guide-ci ne la recopie pas.

## 7. Les 142 denrées rares : catégorie, système d'origine et station d'achat

### 7.1 Comment les 142 identifiants de marché ont été résolus en système et station

`rare_commodity.csv` ne donne, pour chaque denrée rare, qu'un `market_id` numérique. Les 142 lignes portent
**139 identifiants distincts**, résolus un à un par le point d'entrée `https://spansh.co.uk/api/station/<market_id>`,
qui renvoie la fiche complète de la station : nom, système, type, distance d'arrivée, économie et marché. Les 139 ont
répondu, sans une seule erreur.

**Deux sources indépendantes, et elles concordent.** EDSM expose la même résolution par un autre chemin
(`api-system-v1/stations/market?marketId=`). Sur les 142 lignes, **le nom de station est identique chez Spansh et chez
EDSM dans 142 cas sur 142**, et le nom de système dans 141 cas sur 142. La seule divergence porte sur *Classified
Experimental Equipment* : Spansh place la station *Heart of Taurus* dans « Qarato », EDSM dans « HIP 22460 ». Les deux
nomment la même station et le même `market_id` ; il s'agit selon toute vraisemblance d'un renommage de système que
l'un des deux catalogues n'a pas suivi. Le tableau retient la forme Spansh.

**Une troisième confirmation, partielle.** Spansh marque d'un drapeau `is_home_station` l'entrée de marché d'une
denrée rare lorsqu'elle se trouve à sa station d'origine avec du stock. Ce drapeau confirme indépendamment
l'appariement pour **117 des 142 lignes**. Les 25 restantes, listées en 7.5, ne sont pas douteuses pour autant : leur
station est confirmée par les deux catalogues ; simplement, leur dernier relevé de marché a été pris stock épuisé.

### 7.2 Répartition des 142 denrées rares par catégorie

Recompté par script sur le tableau des 142 lignes de la section 7.3, catégories traduites depuis la colonne
`category` de `rare_commodity.csv`.

| Catégorie             | Denrées rares |        Part |
|-----------------------|--------------:|------------:|
| Denrées alimentaires  |            42 |      29,6 % |
| Drogues légales       |            29 |      20,4 % |
| Biens de consommation |            27 |      19,0 % |
| Médicaments           |            10 |       7,0 % |
| Textiles              |             8 |       5,6 % |
| Produits chimiques    |             5 |       3,5 % |
| Métaux                |             5 |       3,5 % |
| Armes                 |             5 |       3,5 % |
| Machines              |             4 |       2,8 % |
| Récupération          |             3 |       2,1 % |
| Technologie           |             3 |       2,1 % |
| Esclavage             |             1 |       0,7 % |
| **Total**             |       **142** | **100,0 %** |

### 7.3 Où acheter chacune des 142 denrées rares

Les colonnes « Denrée rare », « Catégorie » et « market_id » sont relevées dans `rare_commodity.csv` ; les colonnes
« Système », « Station », « Type », « Arrivée », « Achat relevé » et « Stock relevé » viennent des fiches Spansh
interrogées le 10 septembre 2026.

Trois avertissements avant de lire ce tableau. **« Arrivée (ls) » est la distance de l'étoile d'arrivée à la
station**, pas une distance en années-lumière depuis un point de départ : c'est ce qui décide du temps de trajet en
supercruise, et l'écart est brutal — *Hutton Orbital* est à 6 395 238 ls quand *Weyl Gateway* est à 15 ls, soit un
rapport de 1 à 426 000 à l'intérieur du même tableau. **Un tiret « — » signifie « aucun relevé exploitable », jamais
« zéro »**. Et **les colonnes « Achat relevé » et « Stock relevé » sont un instantané de marché daté du 10 septembre
2026**, pas des constantes de jeu : le prix d'achat d'une denrée rare monte à mesure que le stock baisse, si bien
qu'un Commandant arrivant à *Lave Station* ne paiera pas nécessairement les 3 500 Cr indiqués.

| Denrée rare                        | Catégorie             | Système          | Station                   | Type          | Arrivée (ls) | Achat relevé (Cr) | Stock relevé |  market_id |
|------------------------------------|-----------------------|------------------|---------------------------|---------------|-------------:|------------------:|-------------:|-----------:|
| Borasetani Pathogenetics           | Armes                 | Borasetani       | Katzenstein Terminal      | Coriolis      |          230 |             8 200 |           12 | 3229638400 |
| Gilya Signature Weapons            | Armes                 | Gilya            | Bell Orbital              | Coriolis      |          458 |             7 582 |           18 | 3226857216 |
| HIP 118311 Swarm                   | Armes                 | HIP 118311       | Lubbock Market            | Orbis         |           89 |                 — |            — | 3223177472 |
| Holva Duelling Blades              | Armes                 | Holva            | Kreutz Orbital            | Coriolis      |       23 154 |             6 518 |            7 | 3222713088 |
| Kamorin Historic Weapons           | Armes                 | Kamorin          | Godwin Vision             | Coriolis      |          450 |             3 154 |           18 | 3221669632 |
| Alacarakmo Skin Art                | Biens de consommation | Alacarakmo       | Weyl Gateway              | Coriolis      |           15 |                 — |            — | 3231373824 |
| Altairian Skin                     | Biens de consommation | Altair           | Solo Orbiter              | Orbis         |          667 |                 — |            — |  128151032 |
| Anduliga Fire Works                | Biens de consommation | Anduliga         | Celsius Estate            | Avant-poste   |      626 407 |               882 |            — | 3230243584 |
| Buckyball Beer Mats                | Biens de consommation | Fullerene C60    | Rebuy Prospect            | Orbis         |          238 |                85 |           25 |  128745551 |
| Duradrives                         | Biens de consommation | Anima            | Cowper Dock               | Coriolis      |        1 094 |            16 250 |           12 | 3223453184 |
| Eleu Thermals                      | Biens de consommation | Eleu             | Finney Dock               | Orbis         |          334 |               864 |           13 | 3230624768 |
| Eshu Umbrellas                     | Biens de consommation | Eshu             | Shajn Terminal            | Coriolis      |        1 743 |             2 050 |            9 | 3222295552 |
| Havasupai Dream Catcher            | Biens de consommation | Havasupai        | Lovelace Port             | Ocellus       |      603 640 |             9 561 |            4 | 3221438976 |
| Jaques Quinentian Still            | Biens de consommation | Colonia          | Jaques Station            | Orbis         |        1 456 |                 — |            — |  128667761 |
| Jaradharre Puzzle Box              | Biens de consommation | Jaradharre       | Gohar Station             | Coriolis      |      525 136 |            12 775 |           24 | 3230754816 |
| Karetii Couture                    | Biens de consommation | Karetii          | Sinclair Platform         | Avant-poste   |          986 |             5 225 |            5 | 3227333120 |
| Kinago Violins                     | Biens de consommation | Kinago           | Fozard Ring               | Coriolis      |        1 725 |             7 279 |            — | 3227394304 |
| Leathery Eggs                      | Biens de consommation | Zaonce           | Ridley Scott              | Orbis         |          379 |            24 350 |            3 |  128164088 |
| Momus Bog Spaniel                  | Biens de consommation | Momus Reach      | Tartarus Point            | Coriolis      |          414 |                 — |            — |  128075256 |
| Nguna Modern Antiques              | Biens de consommation | Nguna            | Biggle Hub                | Coriolis      |        1 873 |             1 379 |           27 | 3221538304 |
| Njangari Saddles                   | Biens de consommation | Njangari         | Lee Hub                   | Ocellus       |       21 358 |               650 |           13 | 3222416896 |
| Ophiuch Exino Artefacts            | Biens de consommation | 36 Ophiuchi      | Katzenstein Dock          | Coriolis      |    4 216 455 |                 — |            — | 3228939264 |
| Rajukru Multi-Stoves               | Biens de consommation | Rajukru          | Snyder Terminal           | Ocellus       |          117 |                 — |            — | 3227512320 |
| Shan's Charis Orchid               | Biens de consommation | Arque            | Baird Gateway             | Coriolis      |          591 |                 — |            — |  128107768 |
| Soontill Relics                    | Biens de consommation | Ngurii           | Cheranovsky City          | Coriolis      |        1 274 |            17 000 |           80 | 3225348096 |
| Tauri Chimes                       | Biens de consommation | 39 Tauri         | Porta                     | Orbis         |          994 |             1 285 |           26 |  128134648 |
| The Hutton Mug                     | Biens de consommation | Alpha Centauri   | Hutton Orbital            | Avant-poste   |    6 395 238 |             1 408 |           68 | 3228728832 |
| Tiolce Waste2Paste Units           | Biens de consommation | Tiolce           | Gordon Terminal           | Coriolis      |          158 |             1 153 |            — | 3224141312 |
| Ultra-Compact Processor Prototypes | Biens de consommation | 17 Lyrae         | Langford Enterprise       | Orbis         |        2 200 |            19 350 |            3 | 3227172352 |
| Uzumoku Low-G Wings                | Biens de consommation | Uzumoku          | Sverdrup Ring             | Coriolis      |      505 462 |             8 435 |           14 | 3226474496 |
| Vidavantian Lace                   | Biens de consommation | Vidavanta        | Lee Mines                 | Avant-poste   |      517 519 |             7 025 |            8 | 3231082240 |
| Zeessze Ant Grub Glue              | Biens de consommation | Zeessze          | Nicollier Hangar          | Orbis         |          489 |                 — |            — |  128125432 |
| Aepyornis Egg                      | Denrées alimentaires  | 47 Ceti          | Glushko Station           | Ocellus       |      592 628 |             2 654 |            — | 3222560256 |
| Albino Quechua Mammoth Meat        | Denrées alimentaires  | Quechua          | Crown Ring                | Orbis         |          118 |             2 538 |           10 | 3222822912 |
| Any Na Coffee                      | Denrées alimentaires  | Any Na           | Libby Orbital             | Orbis         |          580 |             2 238 |           17 | 3229880064 |
| Arouca Conventual Sweets           | Denrées alimentaires  | Arouca           | Shipton Orbital           | Coriolis      |          393 |             1 191 |           12 |  128098040 |
| Azure Milk                         | Denrées alimentaires  | Leesti           | George Lucas              | Coriolis      |          274 |             4 123 |           14 |  128639992 |
| Baked Greebles                     | Denrées alimentaires  | 38 Virginis      | Bamford Ring              | Coriolis      |      525 564 |               445 |           34 | 3229378560 |
| Baltah'sine Vacuum Krill           | Denrées alimentaires  | Baltah'Sine      | Baltha'Sine Station       | Orbis         |          359 |               825 |            1 |  128088056 |
| CD-75 Kitten Brand Coffee          | Denrées alimentaires  | CD-75 661        | Kirk Dock                 | Orbis         |          339 |             2 729 |           18 | 3228566016 |
| Ceremonial Heike Tea               | Denrées alimentaires  | Heike            | Brunel City               | Orbis         |          410 |             1 824 |            8 | 3227417856 |
| Ceti Rabbits                       | Denrées alimentaires  | 47 Ceti          | Kaufmanis Hub             | Orbis         |      596 345 |             2 111 |           18 | 3222560000 |
| Chi Eridani Marine Paste           | Denrées alimentaires  | Chi Eridani      | Steve Masters             | Orbis         |        2 245 |               784 |            — |  128128760 |
| Coquim Spongiform Victuals         | Denrées alimentaires  | Coquim           | Hirayama Installation     | Ocellus       |          605 |             1 525 |           30 | 3223832576 |
| Deuringas Truffles                 | Denrées alimentaires  | Deuringas        | Shukor Hub                | Coriolis      |          802 |             1 892 |            7 | 3229713408 |
| Diso Ma Corn                       | Denrées alimentaires  | Diso             | Shifnalport               | Orbis         |          295 |               319 |           30 |  128161016 |
| Eden Apples of Aerial              | Denrées alimentaires  | Aerial           | Andrade Legacy            | Orbis         |          180 |             1 541 |           35 |  128083448 |
| Esuseku Caviar                     | Denrées alimentaires  | Esuseku          | Savinykh Orbital          | Orbis         |          275 |                 — |            — | 3226919680 |
| Ethgreze Tea Buds                  | Denrées alimentaires  | Ethgreze         | Bloch Station             | Coriolis      |          351 |                 — |            — | 3229524992 |
| Fujin Tea                          | Denrées alimentaires  | Fujin            | Futen Spaceport           | Coriolis      |          562 |             1 136 |           15 |  128134392 |
| Giant Irukama Snails               | Denrées alimentaires  | Irukama          | Blaauw City               | Orbis         |          326 |             1 810 |           16 | 3225345792 |
| Goman Yaupon Coffee                | Denrées alimentaires  | Goman            | Gustav Sporer Port        | Orbis         |          272 |             1 858 |           24 | 3224449792 |
| HIP 10175 Bush Meat                | Denrées alimentaires  | HIP 10175        | Stefanyshyn-Piper Station | Orbis         |        5 040 |             2 105 |           13 | 3223234816 |
| HIP Proto-Squid                    | Denrées alimentaires  | HIP 41181        | Andersson Station         | Orbis         |      536 378 |             1 414 |           14 | 3227995392 |
| HR 7221 Wheat                      | Denrées alimentaires  | HR 7221          | Veron City                | Orbis         |        1 895 |                 — |            — | 3226170880 |
| Haiden Black Brew                  | Denrées alimentaires  | Haiden           | Searfoss Enterprise       | Coriolis      |      563 283 |             1 332 |           14 | 3226557696 |
| Jaroua Rice                        | Denrées alimentaires  | Jaroua           | McCool City               | Orbis         |          142 |             1 180 |           41 | 3224698112 |
| Karsuki Locusts                    | Denrées alimentaires  | Karsuki Ti       | West Market               | Orbis         |           27 |             1 098 |           27 | 3225028096 |
| LTT Hyper Sweet                    | Denrées alimentaires  | LTT 9360         | Smeaton Orbital           | Ocellus       |    1 872 375 |               222 |           19 | 3224166400 |
| Live Hecate Sea Worms              | Denrées alimentaires  | Hecate           | RJH1972                   | Coriolis      |          527 |             1 714 |           20 |  128042496 |
| Mechucos High Tea                  | Denrées alimentaires  | Mechucos         | Brandenstein Port         | Avant-poste   |      534 627 |             1 345 |           16 | 3228398848 |
| Mokojing Beast Feast               | Denrées alimentaires  | Mokojing         | Noli Terminal             | Orbis         |      539 329 |             2 930 |           11 | 3229612800 |
| Mukusubii Chitin-os                | Denrées alimentaires  | Mukusubii        | Ledyard Dock              | Ocellus       |      505 143 |             1 008 |           23 | 3221719296 |
| Mulachi Giant Fungus               | Denrées alimentaires  | Mulachi          | Clark Terminal            | Orbis         |      594 345 |                85 |           22 | 3228892672 |
| Neritus Berries                    | Denrées alimentaires  | Neritus          | Toll Ring                 | Avant-poste   |          524 |               850 |           13 | 3228206080 |
| Ochoeng Chillies                   | Denrées alimentaires  | Ochoeng          | Roddenberry Gateway       | Orbis         |          485 |             1 468 |           21 | 3226719232 |
| Orrerian Vicious Brew              | Denrées alimentaires  | Orrere           | Sharon Lee Free Market    | Orbis         |          963 |               630 |           32 |  128166392 |
| Sanuma Decorative Meat             | Denrées alimentaires  | Sanuma           | Dunyach Gateway           | Coriolis      |        7 574 |               860 |           34 | 3230331136 |
| Tanmark Tranquil Tea               | Denrées alimentaires  | Tanmark          | Cassie-L-Peia             | Orbis         |          414 |                 — |            — |  128057866 |
| Uszaian Tree Grub                  | Denrées alimentaires  | Uszaa            | Guest Installation        | Orbis         |        4 350 |             1 248 |           21 |  128164856 |
| Utgaroar Millennial Eggs           | Denrées alimentaires  | Utgaroar         | Fort Klarix               | Coriolis      |          168 |             1 795 |           15 |  128037120 |
| Void Extract Coffee                | Denrées alimentaires  | LFT 1421         | Ehrlich Orbital           | Ocellus       |      774 374 |                 — |            — | 3229028864 |
| Wheemete Wheat Cakes               | Denrées alimentaires  | Wheemete         | Eisinga Enterprise        | Coriolis      |      551 751 |               260 |           19 | 3225032704 |
| Witchhaul Kobe Beef                | Denrées alimentaires  | Witchhaul        | Hornby Terminal           | Orbis         |          220 |             4 972 |           14 | 3223358720 |
| Apa Vietii                         | Drogues légales       | Upaniklis        | Forester's Choice         | Avant-poste   |       10 372 |             3 495 |           11 |  128958681 |
| Bast Snake Gin                     | Drogues légales       | Bast             | Hart Station              | Orbis         |          205 |             1 080 |           10 |  128086776 |
| Burnham Bile Distillate            | Drogues légales       | HIP 59533        | Burnham Beacon            | Avant-poste   |      530 332 |               806 |           16 | 3230224384 |
| Centauri Mega Gin                  | Drogues légales       | Alpha Centauri   | Hutton Orbital            | Avant-poste   |    6 395 238 |             3 861 |           21 | 3228728832 |
| Chateau De Aegaeon                 | Drogues légales       | Aegaeon          | Schweickart Station       | Coriolis      |        8 801 |             1 267 |           14 | 3228416768 |
| Crom Silver Fesh                   | Drogues légales       | Crom             | Chorel Survey             | Avant-poste   |        1 277 |                 — |            — | 3228463360 |
| Eranin Pearl Whisky                | Drogues légales       | Eranin           | Azeban City               | Coriolis      |          294 |                 — |            — |  128001536 |
| Geawen Dance Dust                  | Drogues légales       | Geawen           | Obruchev Legacy           | Avant-poste   |      461 933 |             1 022 |           30 | 3230954752 |
| Gerasian Gueuze Beer               | Drogues légales       | Geras            | Yurchikhin Port           | Coriolis      |    1 052 899 |               788 |           60 | 3228047360 |
| Harma Silver Sea Rum               | Drogues légales       | Harma            | Gabriel Enterprise        | Coriolis      |          258 |             4 480 |           90 | 3221575424 |
| Indi Bourbon                       | Drogues légales       | Epsilon Indi     | Mansfield Orbiter         | Orbis         |          143 |             1 836 |           36 |  128118520 |
| Kamitra Cigars                     | Drogues légales       | Kamitra          | Hammel Terminal           | Orbis         |           83 |             6 362 |           45 | 3225450752 |
| Kongga Ale                         | Drogues légales       | Kongga           | Laplace Ring              | Coriolis      |          254 |               585 |           16 | 3226978048 |
| Lavian Brandy                      | Drogues légales       | Lave             | Lave Station              | Coriolis      |          282 |             3 500 |           24 |  128106744 |
| Leestian Evil Juice                | Drogues légales       | Leesti           | George Lucas              | Coriolis      |          274 |               457 |           28 |  128639992 |
| Lucan Onionhead                    | Drogues légales       | Tanmark          | Cassie-L-Peia             | Orbis         |          414 |                 — |            — |  128057866 |
| Lyrae Weed                         | Drogues légales       | 16 Lyrae         | Budrys Ring               | Orbis         |        1 465 |             1 475 |           10 | 3226417152 |
| Motrona Experience Jelly           | Drogues légales       | Dea Motrona      | Pinzon Dock               | Avant-poste   |    1 758 977 |             7 420 |           16 | 3229750528 |
| Onionhead                          | Drogues légales       | Kappa Fornacis   | Harvestport               | Orbis         |          918 |               765 |            8 |  128129272 |
| Onionhead Alpha Strain             | Drogues légales       | Xelabara         | Navigator Market          | Orbis         |          303 |               765 |           10 | 3226977024 |
| Onionhead Beta Strain              | Drogues légales       | HIP 112974       | la Cosa City              | Orbis         |        8 774 |               765 |           10 | 3223027200 |
| Pavonis Ear Grubs                  | Drogues légales       | Delta Pavonis    | Hooper Relay              | Coriolis      |          196 |               804 |           45 |  128117240 |
| Rusani Old Smokey                  | Drogues légales       | Rusani           | Fernandes Market          | Orbis         |           73 |             5 810 |           10 | 3229255680 |
| Saxon Wine                         | Drogues légales       | 9 Aurigae        | Hunt Enterprise           | Coriolis      |       67 356 |             1 540 |           13 | 3227986432 |
| Tarach Spice                       | Drogues légales       | Tarach Tor       | Tranquillity              | Coriolis      |          359 |             1 231 |           16 |  128041984 |
| Thrutis Cream                      | Drogues légales       | Thrutis          | Kingsbury Dock            | Orbis         |          291 |               925 |            — | 3226522368 |
| Wolf Fesh                          | Drogues légales       | Wolf 1301        | Saunders's Dive           | Coriolis      |          408 |                 — |            — |  128084984 |
| Wuthielo Ku Froth                  | Drogues légales       | Wuthielo Ku      | Tarter Dock               | Orbis         |          174 |               420 |           17 | 3222155776 |
| Yaso Kondi Leaf                    | Drogues légales       | Yaso Kondi       | Wheeler Market            | Orbis         |          113 |             6 424 |            9 | 3223088640 |
| Master Chefs                       | Esclavage             | Viracocha        | Pataarcy Corporate        | Orbis         |          503 |                 — |            — |  128123640 |
| Giant Verrix                       | Machines              | Phiagre          | Greeboski's Outpost       | Orbis         |           85 |             6 644 |           36 |  128121336 |
| Non Euclidian Exotanks             | Machines              | LTT 8517         | Euclid Terminal           | Avant-poste   |      710 802 |               892 |           16 | 3224135424 |
| Volkhab Bee Drones                 | Machines              | Volkhab          | Vernadsky Dock            | Coriolis      |          414 |             3 262 |           12 | 3227831808 |
| Wulpa Hyperbore Systems            | Machines              | Wulpa            | Williams Gateway          | Coriolis      |           29 |             1 175 |           10 | 3221388032 |
| Aganippe Rush                      | Médicaments           | Aganippe         | Julian Market             | Orbis         |          119 |                 — |            — |  128012800 |
| Alya Body Soap                     | Médicaments           | Alya             | Malaspina Gateway         | Coriolis      |       52 065 |               454 |           16 | 3221638400 |
| Honesty Pills                      | Médicaments           | LP 375-25        | King Gateway              | Coriolis      |      513 835 |             1 510 |           39 | 3229561344 |
| Kachirigin Filter Leeches          | Médicaments           | Kachirigin       | Nowak Orbital             | Orbis         |          340 |               467 |           10 | 3221595648 |
| Nanomedicines                      | Médicaments           | Kuma             | Elion Dock                | Coriolis      |          363 |                 — |            — | 3226651904 |
| Pantaa Prayer Sticks               | Médicaments           | George Pantazis  | Zamka Platform            | Coriolis      |           46 |             2 357 |           54 | 3228824064 |
| Terra Mater Blood Bores            | Médicaments           | Terra Mater      | GR8Minds                  | Coriolis      |          488 |                 — |            — |  128051466 |
| The Waters of Shintara             | Médicaments           | Shinrarta Dezhra | Jameson Memorial          | Orbis         |          340 |                 — |            — |  128666762 |
| V Herculis Body Rub                | Médicaments           | V1090 Herculis   | Kaku Plant                | Avant-poste   |    1 238 672 |               160 |            — | 3228959232 |
| Vega Slimweed                      | Médicaments           | Vega             | Taylor City               | Orbis         |        1 083 |             2 550 |           42 |  128149240 |
| Cherbones Blood Crystals           | Métaux                | Cherbones        | Chalker Landing           | Avant-poste   |      577 871 |            12 504 |            — | 3229594624 |
| Helvetitj Pearls                   | Métaux                | Helvetitj        | Friend Orbital            | Orbis         |          445 |             3 818 |            9 | 3231094528 |
| Ngadandari Fire Opals              | Métaux                | Ngadandari       | Napier Terminal           | Avant-poste   |      501 358 |            15 905 |           12 | 3226127872 |
| Platinum Alloy                     | Métaux                | Nahuatl          | Artzybasheff Terminal     | Orbis         |          133 |            14 800 |           13 | 3223779840 |
| Sothis Crystalline Gold            | Métaux                | Sothis           | Newholm Station           | Orbis         |        1 841 |                 — |            — |  128668557 |
| Delta Phoenicis Palms              | Produits chimiques    | Delta Phoenicis  | Trading Post              | Orbis         |        3 711 |               890 |           26 |  128045312 |
| HIP Organophosphates               | Produits chimiques    | HIP 80364        | Stasheff Colony           | Coriolis      |        2 625 |               385 |           38 | 3227036160 |
| Koro Kung Pellets                  | Produits chimiques    | Korro Kung       | Lonchakov Orbital         | Ocellus       |      622 621 |               240 |            4 | 3228726272 |
| Medb Starlube                      | Produits chimiques    | Medb             | Vela Dock                 | Ocellus       |    1 687 048 |               416 |           34 | 3228762368 |
| Toxandji Virocide                  | Produits chimiques    | Toxandji         | Tsunenaga Orbital         | Coriolis      |        6 845 |               535 |           28 | 3230258688 |
| Crystalline Spheres                | Récupération          | Bento            | Snow Moon                 | Orbis         |          331 |             6 493 |           18 |  128059402 |
| Festive Gifts                      | Récupération          | Njambalba        | Frost Dock                | Avant-poste   |       32 336 |            11 638 |           24 | 3223105792 |
| Galactic Travel Guide              | Récupération          | LHS 3447         | Bluford Orbital           | Orbis         |        2 121 |                 — |            — |  128673074 |
| AZ Cancri Formula 42               | Technologie           | AZ Cancri        | Fisher Station            | Coriolis      |           16 |                 — |            — | 3228400128 |
| Classified Experimental Equipment  | Technologie           | Qarato           | Heart of Taurus           | Méga-vaisseau |        1 831 |                 — |            — |  128986325 |
| Xihe Biomorphic Companions         | Technologie           | Xihe             | Zhen Dock                 | Coriolis      |        1 939 |             4 666 |           40 | 3224133120 |
| Banki Amphibious Leather           | Textiles              | Banki            | Antonio de Andrade Vista  | Coriolis      |      531 812 |               625 |           18 | 3228346112 |
| Belalans Ray Leather               | Textiles              | Belalans         | Boscovich Ring            | Orbis         |           78 |               882 |            — | 3223537152 |
| Chameleon Cloth                    | Textiles              | LDS 883          | Smith Reserve             | Coriolis      |       54 087 |             1 664 |            — | 3223418880 |
| Damna Carapaces                    | Textiles              | Damna            | Nemere Market             | Orbis         |        2 987 |               315 |           15 | 3227751936 |
| Jotun Mookah                       | Textiles              | Jotun            | Icelock                   | Coriolis      |           80 |             1 252 |           16 |  128078840 |
| Rapa Bao Snake Skins               | Textiles              | Rapa Bao         | Flagg Gateway             | Orbis         |        2 358 |               550 |           11 | 3222875648 |
| Tiegfries Synth Silk               | Textiles              | Tiegfries        | Larbalestier Dock         | Avant-poste   |      563 094 |             1 161 |           45 | 3227726848 |
| Vanayequi Ceratomorpha Fur         | Textiles              | Vanayequi        | Clauss Hub                | Orbis         |           81 |               828 |           15 | 3227289856 |

### 7.4 Type et économie des 139 stations productrices

Les 142 denrées se répartissent sur **139 stations** : trois stations en produisent deux, ce qui est le contre-exemple
à retenir avant d'écrire « chaque station ne produit qu'une denrée rare ». La réciproque, elle, tient sur ce jeu de
données : **aucune denrée n'apparaît à deux stations**.

| Type de station | Stations | Denrées rares |
|-----------------|---------:|--------------:|
| Orbis           |       60 |            61 |
| Coriolis        |       51 |            52 |
| Avant-poste     |       17 |            18 |
| Ocellus         |       10 |            10 |
| Méga-vaisseau   |        1 |             1 |
| **Total**       |  **139** |       **142** |

L'économie ci-dessous est celle de la station **productrice**, relevée dans le champ `primary_economy` de
Spansh. Ce n'est **pas** l'économie consommatrice qui paierait le meilleur prix : cette dernière n'est établie par
aucune source consultée, et il ne faut donc rien déduire de ce tableau sur les acheteurs.

| Économie primaire de la station | Stations |        Part |
|---------------------------------|---------:|------------:|
| Agriculture                     |       65 |      46,8 % |
| Industrielle                    |       35 |      25,2 % |
| Haute technologie               |       13 |       9,4 % |
| Raffinage                       |       10 |       7,2 % |
| Extraction                      |       10 |       7,2 % |
| Terraformation                  |        3 |       2,2 % |
| Tourisme                        |        2 |       1,4 % |
| Service                         |        1 |       0,7 % |
| **Total**                       |  **139** | **100,0 %** |

### 7.5 Les trois stations qui produisent deux denrées rares, et les 25 lignes sans troisième confirmation

| Système        | Station        | Denrées rares                          |  market_id |
|----------------|----------------|----------------------------------------|-----------:|
| Alpha Centauri | Hutton Orbital | Centauri Mega Gin / The Hutton Mug     | 3228728832 |
| Leesti         | George Lucas   | Azure Milk / Leestian Evil Juice       |  128639992 |
| Tanmark        | Cassie-L-Peia  | Lucan Onionhead / Tanmark Tranquil Tea |  128057866 |

Pour les 25 denrées ci-dessous, système et station sont établis comme pour les 117 autres et concordent entre
Spansh et EDSM. Ce qui manque est la troisième confirmation, le drapeau `is_home_station`, qui n'apparaît que si le
relevé de marché a été pris alors que le stock n'était pas épuisé. Ce sont donc exactement les lignes dont les
colonnes de prix et de stock sont vides en 7.3 — à deux exceptions près, *HR 7221 Wheat* et *Shan's Charis Orchid*,
qui portent bien le drapeau mais avec un prix relevé nul, affiché « — » plutôt que « 0 ».

| Denrée rare                       | Système          | Station            |
|-----------------------------------|------------------|--------------------|
| Aganippe Rush                     | Aganippe         | Julian Market      |
| Alacarakmo Skin Art               | Alacarakmo       | Weyl Gateway       |
| Altairian Skin                    | Altair           | Solo Orbiter       |
| AZ Cancri Formula 42              | AZ Cancri        | Fisher Station     |
| Classified Experimental Equipment | Qarato           | Heart of Taurus    |
| Crom Silver Fesh                  | Crom             | Chorel Survey      |
| Eranin Pearl Whisky               | Eranin           | Azeban City        |
| Esuseku Caviar                    | Esuseku          | Savinykh Orbital   |
| Ethgreze Tea Buds                 | Ethgreze         | Bloch Station      |
| Galactic Travel Guide             | LHS 3447         | Bluford Orbital    |
| HIP 118311 Swarm                  | HIP 118311       | Lubbock Market     |
| Jaques Quinentian Still           | Colonia          | Jaques Station     |
| Lucan Onionhead                   | Tanmark          | Cassie-L-Peia      |
| Master Chefs                      | Viracocha        | Pataarcy Corporate |
| Momus Bog Spaniel                 | Momus Reach      | Tartarus Point     |
| Nanomedicines                     | Kuma             | Elion Dock         |
| Ophiuch Exino Artefacts           | 36 Ophiuchi      | Katzenstein Dock   |
| Rajukru Multi-Stoves              | Rajukru          | Snyder Terminal    |
| Sothis Crystalline Gold           | Sothis           | Newholm Station    |
| Tanmark Tranquil Tea              | Tanmark          | Cassie-L-Peia      |
| Terra Mater Blood Bores           | Terra Mater      | GR8Minds           |
| The Waters of Shintara            | Shinrarta Dezhra | Jameson Memorial   |
| Void Extract Coffee               | LFT 1421         | Ehrlich Orbital    |
| Wolf Fesh                         | Wolf 1301        | Saunders's Dive    |
| Zeessze Ant Grub Glue             | Zeessze          | Nicollier Hangar   |

### 7.6 Ce que le stock relevé dit, et ce qu'il ne dit pas

**Le stock relevé est un minorant de l'allocation, jamais l'allocation.** Un marché se réapprovisionne jusqu'à un
plafond ; le stock observé lui est donc inférieur ou égal. Le maximum observé sur l'ensemble du corpus est de
**90 unités** (*Harma Silver Sea Rum*), suivi de 80 (*Soontill Relics*) et 68 (*The Hutton Mug*). On peut écrire que
l'allocation de *Harma Silver Sea Rum* est d'**au moins** 90 unités ; on ne peut pas écrire qu'elle vaut 90.

**Fraîcheur des relevés.** Sur les 142 lignes, 121 relevés de marché datent de septembre 2026 et 20 d'août 2026. Un
seul est très ancien : *Heart of Taurus* (Qarato), dernier relevé le **9 août 2022**. C'est un **méga-vaisseau**, donc
une station mobile : ni sa position ni son marché ne peuvent être garantis, et c'est la seule ligne du tableau dont la
localisation elle-même est susceptible d'avoir changé.

**Une divergence de nomenclature à signaler.** `rare_commodity.csv` nomme la denrée `128672431` **« Festive Gifts »**,
pour un symbole `PersonalGifts`. Spansh et EDSM la nomment tous deux **« Personal Gifts »** à *Frost Dock*
(Njambalba). Le tableau conserve « Festive Gifts », valeur de la source de référence de ce corpus ; **« Personal
Gifts » est à retenir comme alias de recherche**.

**Ce que le corpus disait déjà.** Un balayage exact des 142 noms sur les vingt-neuf guides du commit `2632672` ne
trouve **qu'une seule denrée rare citée**, une seule fois : *Soontill Relics*, dans le tableau des jalons de
[Débuter et progresser](./27-debuter-et-progresser.md), comme condition de déblocage d'Elvira Martuuk (« 3 Soontill
Relics »). Le corpus affirmait donc qu'il en faut trois sans jamais dire où les acheter. La réponse est désormais dans
le tableau de 7.3 : **Cheranovsky City, système Ngurii**, station Coriolis à 1 274 ls de l'arrivée, où le relevé du
10 septembre 2026 donne 80 unités à 17 000 Cr pièce.

D'autres déblocages d'ingénieurs par denrée rare sont réputés exister dans la communauté — les noms de Didi
Vatermann, Zacariah Nemo et Lori Jameson reviennent, associés à Lavian Brandy, Xihe Biomorphic Companions et Kongga
Ale — mais **aucune source consultée ne porte ces associations ni les quantités correspondantes**. Ce sont des pistes,
pas des faits, et elles ne sont pas reprises dans les tableaux de ce guide.

## 8. Ce que ce référentiel n'établit pas, et où il faudrait aller le chercher

Ces manques sont mesurés, pas supposés. Ils sont listés ici parce qu'un trou déclaré est une information utile : il
évite qu'un lecteur croie disposer d'une donnée qui n'existe pas dans ce corpus.

### 8.1 Les données de référence incomplètes : économies, légalité, types d'anneau, localisation française

**1. Les économies de 137 marchandises sur 270.** Le tableau de 4.4 s'arrête à 133 lignes. Les manquantes se
concentrent sur Salvage (96 sur 96), les Minéraux (19, dont Alexandrite, Benitoite, Grandidierite, Monazite,
Musgravite, Rhodplumsite, Serendibite, Void Opal, Haematite, Bastnasite, Deuterium, Thortveitite, Quartz Pyroxenite,
Olivine, Periclase Dunite, Sapphire, Diamond, Ruby, Magnesite), les Produits chimiques (5), les Matériaux industriels
(4), les Métaux (3), les Machines (2), la Technologie (2), et une entrée chacun pour Drogues légales (Onionhead Gamma
Strain), Biens de consommation (Trinkets of Hidden Fortune), Armes (Battle Weapons), Déchets (Toxic Waste) et
Esclavage (Slaves). **Où chercher** : la page « Commodities/Supply and Demand » du wiki Fandom, inaccessible le
10 septembre 2026 (HTTP 402 puis 403 Cloudflare) ; une nouvelle tentative à une autre date, ou via un miroir,
pourrait aboutir.

**2. La légalité par superpuissance et par type de gouvernement.** Aucune matrice « marchandise × superpuissance » ni
« marchandise × gouvernement » n'existe dans les sources consultées. Le point aveugle le plus dangereux : Slaves,
Imperial Slaves, Onionhead Gamma Strain, Bootleg Liquor, Landmines, Nerve Agents, Prohibited Research Materials,
Political Prisoners et Hostages ne portent **aucune** mention, ce qui ne prouve évidemment pas leur légalité.
**Où chercher** : la page « Illegal Goods » du wiki Fandom, qui porte apparemment cette matrice ; le fichier
`crimes.csv` de FDevIDs, non exploré ; les fiches Inara par marchandise. Le fichier `government.csv` de FDevIDs donne
la liste officielle des types de gouvernement, mais **aucune interdiction associée**.

**3. Le type d'anneau de 16 marchandises sur 63**, et, pour les 30 renseignées, une source qui reste communautaire.
Trois lignes n'ont aucune donnée d'aucune sorte : Hafnium 178, Steel, Haematite. **Où chercher** : le wiki Fandom
page par marchandise, aujourd'hui inaccessible ; à défaut, un relevé en jeu. Rien de la section 6 n'a été vérifié en
jeu.

**4. La réserve minimale conseillée par minéral — 0 case sur 63.** Aucune source publique ne l'établit. La seule voie
honnête serait un relevé en jeu, ou l'exploitation statistique d'un dump EDDN des événements `ProspectedAsteroid`
croisés avec la classe de réserve de l'anneau.

**5. La localisation française officielle.** Les traductions de ce guide sont des gloses produites pour le corpus. Le
client français du jeu possède ses propres libellés, que les pages francophones d'EDSM ne reprennent pas — elles
conservent les noms anglais. **Où chercher** : les fichiers de localisation du jeu installé, ou une capture d'écran du
marché en client français.

### 8.2 Les données de marché absentes : prix, allocation par cycle, distance optimale de revente

**6. Les prix du commerce courant — aucun.** `commodity.csv` ne porte aucune colonne de prix, et le dépôt
EliteDangerousCore ne contient qu'un parseur de prix, pas de table. Inara et EDDN publient des prix moyens agrégés à
partir de relevés de joueurs, mais ce sont des agrégats volatils qui se périment en quelques semaines : les inscrire
ici les figerait en fausse vérité. Les prix se lisent **en jeu**, ou dans un outil vivant — voir
[Outils communautaires](./16-outils.md) et [Sources de données](./17-sources-donnees.md).

**7. Le rendement et le prix par minéral.** Le corpus a pris pour règle de ne pas figer les prix de minage par tonne,
et ce guide ne revient pas dessus. Le seul relevé trouvé est un instantané Inara du 3 octobre 2025, issu d'un guide
Steam à faible audience dont l'auteur signale lui-même deux valeurs possiblement gonflées par un Community Goal : il
n'est pas repris ici. **Où chercher** un relevé frais : `inara.cz/elite/commodities/` ou `edtools.cc/miner`, à
consulter juste avant usage et à horodater.

**8. L'allocation par cycle et la distance optimale de revente des denrées rares.** Ni `rare_commodity.csv`, ni
Spansh, ni EDSM n'exposent de champ d'allocation : ils ne remontent que le stock instantané, qui n'en est qu'un
minorant. Quant à la courbe prix/distance, une tentative de la dériver des 139 relevés de prix par denrée a **échoué
et été rejetée** : sur *Lavian Brandy*, le prix relevé vaut 2 801 Cr aussi bien à 5,2 al de l'origine qu'à 303,7 al,
et ne prend que 16 valeurs distinctes sur 139 points. Il aurait été facile d'ajuster une courbe sur ce nuage et
d'annoncer un seuil ; ce serait un chiffre inventé. **Où chercher** : les notes de version 2.1 et 3.0 de Frontier,
qui ont modifié cette mécanique ; à défaut, une mesure en jeu.

**9. L'économie qui paie le mieux une denrée rare donnée.** Le tableau de 7.4 donne l'économie de la station
*productrice*, ce qui n'est pas la question qui intéresse un commerçant. Aucune source consultée ne dit quelle
économie achète le mieux telle denrée rare.

**10. Le prix d'achat et la revendabilité des Limpets.** Aucune source fiable trouvée. Rien n'est écrit à ce sujet.

## 9. Note sur la fiabilité des sources de ce référentiel

Trois rangs de fiabilité coexistent dans ce guide, et il importe de ne pas les confondre.

**Rang 1 — les fichiers de référence FDevIDs.** `commodity.csv`, `rare_commodity.csv`, `economy.csv` et `rings.csv`
reprennent les identifiants internes du jeu. Ce sont eux qui fondent les noms, les catégories, les symboles internes,
les `market_id`, les 17 économies et les 4 types d'anneau. Aucune de ces valeurs n'a été retouchée, fautes de frappe
d'origine comprises.

**Rang 2 — les API communautaires interrogées directement.** Spansh et EDSM ont été appelés une fois par identifiant
de marché, et leurs 278 réponses brutes conservées. C'est ce qui permet d'affirmer une concordance mesurée
(142 stations sur 142, 141 systèmes sur 142) plutôt qu'une impression.

**Rang 3 — les ressources communautaires rédigées.** La FAQ Commodités d'EDSM, qui fonde les colonnes d'économies et
les mentions d'illégalité, n'affiche ni numéro de version ni date de mise à jour ; elle a été récupérée en HTML brut
et analysée par script, ce qui écarte toute paraphrase, mais elle doit être citée comme ressource communautaire. Les
guides Steam qui fondent la colonne « Type d'anneau » sont d'un rang encore inférieur : S1 est un guide de joueur à
faible audience (506 visiteurs uniques, « Not enough ratings ») dont le tableau de prix porte une coquille de date ;
S3 est publié dans le fil ouvert par l'auteur de S1, et n'en est donc pas totalement indépendant sur les prix ; S2
date de décembre 2018 et son auteur le reconnaissait périmé dès 2019 — sa valeur ici est de servir de contrôle
indépendant à sept ans de distance, jamais d'être cité seul.

**Sources restées inaccessibles le 10 septembre 2026.** `elite-dangerous.fandom.com` a renvoyé HTTP 402 via
récupération automatique et HTTP 403 (Cloudflare) en accès direct, y compris sur son `api.php` : les pages « Illegal
Goods », « Commodities/Supply and Demand », « Mining » et « Rare Goods » n'ont donc **pas** pu être lues, et rien n'en
a été retenu. Le forum Frontier est également resté inaccessible (403, puis 202 à corps vide). La page
`wiki.alioth.net/index.php/Economics` a été consultée puis **écartée** : elle traite d'Elite classique et d'Oolite,
pas d'*Elite Dangerous*.

## Voir aussi

- **[Le Commerce dans Elite Dangerous](./11-commerce.md)** — mécanique des prix, offre et demande, types d'économie,
  marchés noirs et contrebande, exemple chiffré d'une route commerciale. Ce guide-ci nomme et classe les
  marchandises ; celui-là explique comment leur prix se forme.
- **[Le Minage (Mining)](./20-minage.md)** — les quatre techniques d'extraction, l'équipement minier, les hotspots et
  les outils de repérage. Le référentiel de la section 6 y renvoie pour tout ce qui touche à la manière de miner.
- **[Transport et fret](./12-transport.md)** — missions de livraison, capacités de soute et logistique de cargaison.
- **[Porte-vaisseaux de joueur (Fleet Carriers)](./19-fleet-carriers.md)** — transport en volume, marché embarqué,
  Tritium comme marchandise de carburant.
- **[Le guide des outils communautaires](./16-outils.md)** — Inara, EDSM, Spansh, EDTools : où lire un prix courant,
  que ce guide ne fige volontairement pas.
- **[Sources de données](./17-sources-donnees.md)** — EDCD/FDevIDs, EDDN et les API communautaires dont proviennent
  les tableaux de ce guide.
- **[Débuter et progresser](./27-debuter-et-progresser.md)** — jalons de progression, dont le déblocage d'Elvira
  Martuuk contre 3 Soontill Relics, désormais localisées en section 7.3.
- **[Ingénieurs](./06-ingenieurs.md)** — les composants d'ingénierie qui apparaissent dans le catalogue des
  marchandises (Modular Terminals, Power Converter, Exhaust Manifold et les autres composants « près de <système> »).

## Sources

### Sources locales de rang 1 — dépôt EDCD/FDevIDs, commit `c35612952dd6a547d1a7ac4cffab9c7051e86579`

- `FDevIDs/commodity.csv` — 270 lignes de données, colonnes `id`, `symbol`, `category`, `name`. Source unique et
  exclusive des sections 2 et 3, et des colonnes de nom, de catégorie et de symbole interne partout ailleurs.
- `FDevIDs/rare_commodity.csv` — 142 lignes de données, colonnes `id`, `symbol`, `market_id`, `category`, `name`.
  Origine des colonnes « Denrée rare », « Catégorie » et « market_id » de la section 7.
- `FDevIDs/economy.csv` — 17 lignes de données. Source de la table des économies de la section 4.3.
- `FDevIDs/rings.csv` — 4 lignes de données. Source de la table des types d'anneau de la section 6.1.
- `FDevIDs/README.md` — source de l'affirmation selon laquelle la colonne `name` reproduit l'intitulé affiché en jeu
  en anglais, citée à propos de la divergence *Festive Gifts* / *Personal Gifts*.
- `EliteDangerousCore/EliteDangerous/FrontierData/Enumerations/Rings.cs` — énumération `RingClassEnum`, qui corrobore
  `rings.csv` et documente la coquille « Metalic » du journal de jeu. Ce dépôt ne contient **aucune** table de prix ni
  de distribution de minerais, et **aucune** table `market_id` → station : vérifié par recherche directe.

### Sources distantes, toutes consultées le 10 septembre 2026

- `https://www.edsm.net/en/faq/commodities` et les 15 pages de catégories `.../index/id/N/name/X` — 413 fiches de
  marchandises, récupérées en HTML brut puis analysées par script. Source unique des colonnes d'économies
  productrices et consommatrices (sections 4.2, 4.3, 4.4, 6.2) et des mentions d'illégalité (section 5.2). Ces pages
  ne portent ni numéro de version du jeu ni date de dernière modification.
- `https://spansh.co.uk/api/station/<market_id>` — 139 requêtes, une par identifiant de marché distinct, toutes en
  HTTP 200. Origine des colonnes « Système », « Station », « Type », « Arrivée », « Achat relevé » et « Stock relevé »
  de la section 7.3, ainsi que des tables 7.4 et 7.5.
- `https://www.edsm.net/api-system-v1/stations/market?marketId=<id>` — 139 requêtes, utilisées exclusivement comme
  contre-vérification indépendante des noms de système et de station.
- `https://inara.cz/elite/commodity/52/` (Bertrandite) — contrôle croisé ponctuel : confirme Extraction en production
  et Refinery en consommation, cohérent avec EDSM. Les prix moyens qu'affiche Inara sont des agrégats de relevés de
  joueurs, volatils ; ils n'ont pas été retenus.
- **S1** — `https://steamcommunity.com/sharedfiles/filedetails/?id=3579503571`, guide Steam *Best Commodities to Mine
  (Laser & Core)*, Devilish Dave, publié le 3 octobre 2025 et mis à jour le 6 octobre 2025. Types d'anneau de
  24 minéraux au laser et 12 au noyau.
- **S2** — `https://steamcommunity.com/sharedfiles/filedetails/?id=1594281413`, guide Steam *Mining 3.3 Update in
  progress for 4.0*, Yousseff., décembre 2018. Sections « Where to mine » (cinq niveaux de réserve) et « Ring types ».
- **S3** — `https://steamcommunity.com/app/359320/discussions/0/596287304340200947/`, discussion Steam *Mining
  Filter*, réponse d'Edwyndham du 1er octobre 2025.
- **S5** — `https://www.elitedangerous.net/mining.php` (PMC), dernière mise à jour du 15 juillet 2020.
- `https://edtools.cc/hotspot` et `https://edtools.cc/miner` — outils communautaires ; le premier déclare lui-même se
  restreindre aux anneaux glacés, rocheux et métalliques en systèmes Pristine, et ne propose donc pas le type
  « Metal Rich ».

### Sources du corpus relues pour ce guide, sans modification

- [Commerce](./11-commerce.md) — mécanique des économies de station et tableau produit/consomme par économie ; phrase
  sur Service et Terraforming à corriger (voir 4.3) ; phrase sur la revente des minerais de valeur à corriger
  (voir 6.6) ; section sur les denrées rares, qui ne cite ni nom, ni station, ni chiffre.
- [Le Minage](./20-minage.md) — les trois techniques d'anneau et les neuf gemmes du core mining, les treize
  marchandises du minage de surface planétaire, les réserves Pristine confirmées par EDSM, et la règle de ne pas
  figer les prix de minage.
- [Débuter et progresser](./27-debuter-et-progresser.md) — unique occurrence d'une denrée rare dans le corpus avant
  ce guide.

### Sources tentées et inaccessibles le 10 septembre 2026 — à ne pas retenter à l'identique

- `elite-dangerous.fandom.com` (pages *Illegal Goods*, *Commodities/Supply and Demand*, *Mining*, *Rare Goods*, et
  l'API `api.php`) — HTTP 402 en récupération automatique, HTTP 403 (Cloudflare) en accès direct. Aucun contenu
  retenu.
- `forums.frontier.co.uk` — HTTP 403, puis HTTP 202 à corps vide.
- `wiki.alioth.net/index.php/Economics` — accessible, mais **écartée** : traite d'Elite classique et d'Oolite, pas
  d'*Elite Dangerous*.
- `spansh.co.uk/riches` — ne renvoie qu'une coquille applicative JavaScript, sans donnée exploitable.

### Méthode de génération

Tous les tableaux de ce guide sont produits par script à partir des fichiers ci-dessus ; aucune ligne n'a été saisie
à la main. Les scripts de génération et les réponses brutes des API sont conservés hors du corpus, dans le répertoire
de travail de la session de rédaction, de sorte que chaque chiffre reste retraçable jusqu'à sa source.
