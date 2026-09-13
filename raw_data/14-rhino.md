---
id: 14-rhino
titre: "Le Rhino et le Nomad : le SRV de minage de surface et le premier vaisseau lancé depuis un vaisseau"
domaine: vaisseaux-equipement
entites: [Rhino, Nomad, Scarab, Scorpion, Vodel, baie de véhicule, Vessel Hangar, Mk II Biological Scanner,
  Planetary Mining Deposit Scanner, minage de surface planétaire, Operations Update, Under Siege, Lander01,
  Caspian Explorer, Wave Scanner]
mots_cles_en: [rhino srv, nomad, scarab srv, scorpion srv, ship-launched vessel, vessel bay, vessel hangar,
  surface mining, planetary mining location, planetary mining deposit scanner, mk ii biological scanner,
  mining rig, operations update, lander01, arx early access, wave scanner, drive assist]
version_jeu_couverte: "4.4.0.x (contenu du Rhino SRV Update du 2 septembre 2026 inclus ; numérotation 4.4.1.x non corroborée)"
branche: live
date_verification: 2026-09-12
confiance_globale: haute
volatilite: haute
sources_primaires: [Steam News Frontier (appid 359320), EDCoPilot v1.11.726, EDCD/EDDI ticket 2849, EDCD/FDevIDs outfitting.csv,
  massivelyop.com, "elite-dangerous.fandom.com (Scarab, Scorpion, Wave Scanner, Drive Assist, Skimmers, Defence Turrets, Synthesis, Redeployment, Planetary Vehicle Hangar)"]
zones_incertaines: ["numéros de version 4.4.1.0 et 4.4.1.1 attribués au Rhino, absents des billets officiels relevés",
  "hotfix portant la collecte du Rhino de 9 à 12 fragments, annoncé mais non confirmé livré",
  "caractéristiques chiffrées du Rhino (vitesse, tonnage de soute, résistance du blindage) jamais communiquées",
  "répartition des trois sièges du Rhino, déduction du guide et non donnée officielle",
  "absence de coût de rebuy propre au Rhino, jamais confirmée explicitement par Frontier — mais confirmée pour le Scarab et le Scorpion, voir §4",
  "rattachement du constructeur Vodel à Core Dynamics, affirmation communautaire non vérifiée",
  "prix de revente et grade d'ingénierie des treize nouvelles matières de surface, non relevés",
  "portée réelle des rééquilibrages du 2 septembre 2026 au-delà de la boucle de minage de surface",
  "disponibilité ultérieure du Rhino à l'achat en crédits, non documentée par un billet officiel",
  "capacité de soute du Scorpion : 2 t selon les notes de patch de 2021, 30 t selon le site boutique actuel (valeur identique à la masse, suspicion d'erreur d'affichage)",
  "prix d'achat du Scarab et du Scorpion, sourcés au seul wiki communautaire, inara.cz étant resté inaccessible",
  "mécanisme exact pour rejoindre le siège de tireur du Scorpion en multijoueur (télé-présence à distance ou « multicrew physique »), non tranché par les sources consultées"]
guides_lies: [3, 4, 13, 15, 16, 17, 20, 30, 31]
---

# Le Rhino et le Nomad : le SRV de minage de surface et le premier vaisseau lancé depuis un vaisseau

## En bref

*Elite Dangerous* a reçu à l'été 2026 deux véhicules d'un genre nouveau. Le **Nomad**, sorti le **30 juin 2026** avec
l'**Operations Update** (version 4.4.0.0), inaugure la catégorie du **vaisseau lancé depuis un vaisseau**
(*ship-launched vessel*) : compact, doté de patins inspirés de l'hélicoptère et de moteurs pivotants, il se pose là où
un gros vaisseau ne peut pas et embarque un **Mk II Biological Scanner** détectant les signaux biologiques depuis le
cockpit, plus des **Pulse Lasers** (lasers à impulsions). Le **Rhino**, SRV minier à six roues du constructeur **Vodel** sorti le
**2 septembre 2026**, accueille **3 occupants**, n'est pas armé, et ouvre la boucle du **minage de surface planétaire**
(*surface mining*) avec scanner de gisements, raffinerie embarquée et rigs de minage : il collecte **9 fragments** par
passage (12 annoncés après correctif) et débloque **treize nouvelles commodités** (Diamant, Rubis, Saphir, Hélium-3,
Deutérium, Bastnäsite, Iridium, Thortveitite…). Les deux se déploient depuis la **baie de véhicule** (*Vessel Bay* /
*Vessel Hangar*, Mk I sur treize vaisseaux, Mk II sur trois) et sont vendus en accès anticipé Arx à
16 520 / 33 000 / 60 000 Arx.

## Vue d'ensemble — le Rhino (SRV minier) et le Nomad (vaisseau lancé), été 2026

> **⚠️ Désambiguïsation** — La mise à jour **« Operations »** du 30 juin 2026, évoquée dans ce guide comme cadre de
> sortie du Nomad, est un **contenu multijoueur en escouade** (opérations scénarisées, Operation Runner, Merc Coin).
> Elle ne doit pas être confondue avec les **Opérations à pied d'Odyssey** (extension sortie le 19 mai 2021 : missions
> sur settlements, combat à pied, infiltration), un pan du jeu entièrement distinct malgré le nom proche. Pour ce
> second sujet, voir le guide **[13 — Opérations (gameplay à pied)](./13-operations.md)**.

Ce guide documente les deux véhicules ajoutés à *Elite Dangerous* au cours de l'été 2026 :

- le **Nomad**, premier **vaisseau lancé depuis un vaisseau** dédié à l'exploration de surface, sorti le
  **30 juin 2026** en accès anticipé Arx avec l'**Operations Update** ([section 3](#3-le-nomad-premier-vaisseau-lancé-depuis-un-vaisseau-30-juin-2026)) ;
- le **Rhino**, **SRV** de **minage planétaire** à six roues, sorti le **2 septembre 2026** avec le **Rhino SRV
  Update** et la nouvelle boucle de gameplay du minage de surface ([section 2](#2-le-rhino-srv-de-minage-de-surface-planétaire-vodel-2-septembre-2026)).

Les deux véhicules partagent un même module de transport, la **baie de véhicule** (*vessel bay*) introduite par
l'Operations Update, et une même logique commerciale : sortie en accès anticipé Arx, en trois formules Standard /
Stellar / Galactic.

**Statut de vérification.** Les faits présentés ici sont tirés des annonces officielles de Frontier Developments
republiées sur le flux Steam News d'*Elite Dangerous* (appid 359320), relevé le 9 septembre 2026 — principalement les
billets « Discover the Nomad » (2 juin 2026, 13:03 UTC), « Elite Dangerous | Operations Update » (1er juillet 2026,
14:01 UTC), « Elite Dangerous | Operations Update | Update 3 » (9 juillet 2026, 10:24 UTC), « Beneath the Surface:
Your First Look at the Rhino » (6 août 2026, 14:19 UTC) et « Elite Dangerous | Rhino SRV Update » (2 septembre 2026,
11:20 UTC). Chaque affirmation notable est rattachée ci-dessous au billet qui l'étaye. Ce qui n'est corroboré que par
la communauté, par la presse spécialisée ou par des outils tiers est signalé comme tel à l'endroit où il est écrit.

> **Note de méthode — correction d'un faux négatif du corpus.** Une révision antérieure de ce guide concluait
> qu'« aucune source fiable » ne confirmait l'existence du Nomad ni de l'Operations Update, et avait retiré tout le
> volet correspondant. Cette conclusion était erronée : la vérification cherchait le Nomad dans la liste des vaisseaux
> d'Inara et dans le `shipyard.csv` d'EDCD, deux catalogues qui ne recensent **que les vaisseaux pilotables achetables
> au chantier naval**. Ils ne contiennent ni les SRV (Scarab, Scorpion, Rhino), ni les chasseurs SLF, ni les vaisseaux
> lancés depuis un vaisseau. Y chercher le Nomad revenait à chercher un chasseur SLF dans Coriolis : l'absence n'y a
> aucune valeur probante. Combinée à des erreurs HTTP 403 sur elitedangerous.com, sur Fandom et sur Reddit, cette
> erreur de catégorie a produit un faux négatif, désormais corrigé. Voir la [section 4](#4-loperations-update-du-30-juin-2026-cadre-de-sortie-du-nomad) pour la portée de cette
> correction sur le reste du corpus.

---

## 1. Contexte : la feuille de route 2026 de Frontier Developments

### 1.1 La feuille de route 2026 annoncée le 17 février 2026 (six véhicules)

Le 17 février 2026, Frontier Developments a publié son **Developer Log** de février (billet « Elite Dangerous |
Developer Log », 17 février 2026, 10:06 UTC), consacré à « ce qui arrive cette année », au dévoilement du premier
vaisseau de l'année, au bilan d'un an de Colonisation de systèmes et au point d'étape sur Operations. Un détail de
vocabulaire a été relevé par la presse spécialisée : l'annonce parlait de « vaisseaux » au sens large (*vessels*)
plutôt que strictement de « ships », laissant entendre que les ajouts de l'année ne seraient pas tous des vaisseaux
spatiaux classiques — ce qui s'est confirmé avec le Nomad, lancé depuis un vaisseau, puis avec le Rhino, véhicule
terrestre.

Le programme annoncé prévoyait **six sorties de véhicules** dans l'année, réparties par saison :

| Période         | Véhicule / contenu                                                                        | Statut                                                                                     |
|-----------------|-------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| 24 février 2026 | **Kestrel Mk II** — vaisseau de combat léger de Core Dynamics, propulseurs Mk II, Plasma Shock Accelerator | Sorti le 24 février 2026, accompagné d'une refonte du système audio du combat à pied           |
| Avril 2026      | **Lynx Highliner** — vaisseau passager de taille moyenne (jusqu'à 225 personnes)          | Sorti le 28 avril 2026, l'édition Standard étant offerte en crédits à tous les commandants     |
| 30 juin 2026    | **Operations Update** — contenu multijoueur en escouade, et le **Nomad** (voir [section 3](#3-le-nomad-premier-vaisseau-lancé-depuis-un-vaisseau-30-juin-2026)) | Sorti le 30 juin 2026 (version 4.4.0.0), après un report annoncé le 22 avril 2026              |
| Été 2026        | **Rhino** — véhicule de minage de surface (voir [section 2](#2-le-rhino-srv-de-minage-de-surface-planétaire-vodel-2-septembre-2026)) | Sorti le 2 septembre 2026, avec la nouvelle opération « Under Siege »                          |
| Automne 2026    | Véhicule non identifié                                                                    | Non annoncé à ce jour                                                                          |
| Hiver 2026      | Véhicule non identifié                                                                    | Non annoncé à ce jour                                                                          |

La même annonce évoquait aussi une **refonte** (« feature reboot ») d'un système ancien du jeu, promise pour l'automne
2026, sans détails supplémentaires disponibles à ce stade. Pour la chronologie complète des mises à jour 2024-2026,
voir [15-roadmap.md](./15-roadmap.md).

### 1.2 Rythme de sortie des vaisseaux Frontier avant 2026

Pour resituer le contexte, voici les sorties majeures précédant la feuille de route 2026 (dates recoupées avec
[00-chronologie-canonique.md](./00-chronologie-canonique.md)) :

| Date              | Ajout                         | Nature                                               |
|-------------------|-------------------------------|------------------------------------------------------|
| 22 juillet 2025   | Panther Clipper Mk II         | Gros vaisseau (accès anticipé Arx)                   |
| Août 2025         | Vanguards Patch 1             | Fonctionnalités d'escadron                           |
| 29 septembre 2025 | Type-11 Prospector            | Vaisseau minier + colonisation de systèmes           |
| 16 octobre 2025   | Type-11 Prospector — Update 2 | Ajout de la protection des claims                    |
| 2 décembre 2025   | Caspian Explorer              | Vaisseau d'exploration + IA ennemie à pied améliorée |
| 24 février 2026   | Kestrel Mk II                 | Vaisseau de combat léger                             |

Le Rhino est d'ailleurs vendu en bundle avec le Type-11 Prospector (voir [§2.7](#27-coût-et-disponibilité-du-rhino--bundles-arx-de-16-520-à-100-000-arx)), ce qui souligne la filiation
thématique « minage » entre ces deux ajouts. Symétriquement, le Nomad a été présenté comme le compagnon naturel d'un
gros vaisseau d'exploration comme le Caspian Explorer (voir [§3.4](#34-rôle-du-nomad--lexploration-organique-de-proximité-exobiologie)).

---

## 2. Le Rhino, SRV de minage de surface planétaire (Vodel, 2 septembre 2026)

### 2.1 Le Rhino en bref : SRV minier Vodel à six roues et trois occupants

Le **Rhino** est un nouveau **SRV** (*Surface Reconnaissance Vehicle*, véhicule de surface) à **six roues**,
entièrement dédié au **minage planétaire**. Ce n'est pas un vaisseau spatial : il se conduit à la surface des astres,
comme les SRV existants du jeu (Scarab et Scorpion), mais s'en distingue nettement par sa vocation purement minière.
Les notes de version officielles le désignent sous le nom de **« Vodel's Rhino SRV »** (billet « Rhino SRV Update »,
2 septembre 2026, 11:20 UTC) :

- **constructeur** : **Vodel** — le rattachement de ce constructeur à Core Dynamics, avancé ailleurs dans le corpus,
  n'est pas étayé par les billets officiels et doit être lu comme une affirmation communautaire non vérifiée ;
- **équipage** : jusqu'à **3 occupants** simultanément (contre 1 place pour le Scarab et 2 pour le Scorpion) — le plus
  gros SRV du jeu à ce jour, selon le billet « Beneath the Surface: Your First Look at the Rhino » (6 août 2026,
  14:19 UTC) : « the largest SRV which a Commander can deploy from their ship » ;
- **blindage** renforcé, décrit comme « heavily armoured » et pensé pour encaisser l'attention hostile pendant
  l'extraction (même billet) ;
- **volume interne** consacré au stockage des matières extraites et à l'équipement : contrairement au Nomad, le Rhino
  **n'offre aucun espace intérieur accessible à pied** (même billet).

### 2.2 Chronologie du Rhino : révélation du 6 août et sortie du 2 septembre 2026

| Date                | Événement                                                                                                                                                             |
|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| fin juillet 2026    | Teaser cryptique de Frontier sur le prochain véhicule, rappelé comme « last week's cryptic tease » par le billet du 6 août                                          |
| **6 août 2026**     | **Révélation officielle** — billet « Beneath the Surface: Your First Look at the Rhino » (14:19 UTC), avec le directeur artistique Chris Gregory ; sortie annoncée « later this month » |
| 27 août 2026        | **August Dev Log** (billet « August Dev Log », 10:04 UTC) : premières images en jeu du Rhino, premiers détails sur le minage de surface, aperçu de la prochaine opération |
| **2 septembre 2026**| **Lancement effectif** — billet « Rhino SRV Update » (11:20 UTC) : notes de version complètes, nouvelle boucle de minage de surface et opération « Under Siege » |

Deux écarts méritent d'être notés, la sortie ayant glissé de quelques jours par rapport à la communication initiale :
le billet du 6 août annonçait une arrivée « later this month » (donc en août), alors que la mise à jour est parue le
2 septembre. Par ailleurs, la révélation officielle date bien du **6 août** sur le flux Frontier, et non du 7 août
comme le rapportent certains relais de presse (massivelyop.com), qui publiaient le lendemain.

**Numérotation de version.** Les numéros **4.4.1.0** (sortie) et **4.4.1.1** (hotfix) associés au Rhino ailleurs dans
le corpus ne figurent dans aucun des billets officiels relevés : ils proviennent des pages de notes de version du site
officiel, inaccessibles lors de cette vérification (HTTP 403). Ils sont donc plausibles mais non corroborés par la
source primaire, et ne doivent pas être cités comme des faits établis. Les seuls numéros de version étayés pour l'été
2026 sont **4.4.0.0** (Operations, 30 juin) et **4.4.0.3** (Update 3, 9 juillet — voir [§3.8](#38-nom-interne--lander01--du-nomad-et-effets-de-bord-sur-les-outils-tiers)).

### 2.3 Équipements du Rhino : scanner de gisements, raffinerie et rigs de minage

Les caractéristiques chiffrées précises (vitesse, capacité de soute en tonnes, résistance du blindage) n'ont pas été
communiquées officiellement. Les éléments confirmés par le billet « Rhino SRV Update » (2 septembre 2026, 11:20 UTC)
sont les suivants :

- **six roues motrices**, blindage renforcé pour la conduite sur terrains planétaires accidentés ;
- **cockpit/habitacle pour 3 occupants** (multi-crew) ;
- **scanner de gisements minéraux planétaires** (*Planetary Mining Deposit Scanner*), qui localise les gisements
  exploitables au sol ;
- **raffinerie embarquée** (*Refinery*) ;
- **module de déploiement de foreuse / plateforme de minage** (*Mining Rig Deployment Module*).

La mise à jour a également passé une première vague d'équilibrage sur le temps de minage de base, la quantité maximale
extractible, le pourcentage de commodité par unité extraite, la fréquence des microressources additionnelles, les taux
de recharge d'efficacité, l'efficacité selon la densité du gisement, l'effet de la température sur le rendement des
rigs, ainsi que sur les statistiques du véhicule et des rigs eux-mêmes.

**Limite de collecte : problème connu à la sortie, correctif annoncé et non encore livré.** Les notes officielles du
2 septembre 2026 listent explicitement, parmi les trois problèmes connus de la mise à jour, le fait que « Rhino is only
collecting 9 chunks from surface mining, this will be increased to 12 » : le Rhino ne collecte que **9 fragments** au
lieu des **12** prévus, et Frontier annonce vouloir corriger ce point « as soon as possible ». Une révision antérieure
de ce guide présentait ce passage de 9 à 12 comme **déjà livré** par un hotfix 4.4.1.1 daté du 3 septembre 2026 :
aucun billet officiel relevé au 9 septembre 2026 ne confirme ce hotfix, et le dernier billet du flux reste celui du
2 septembre. La limite doit donc être considérée comme **encore à 9 fragments**, avec une correction annoncée, jusqu'à
vérification en jeu. Les deux autres problèmes connus listés sont la complétion parfois prématurée de l'opération
« Under Siege » et l'absence de l'interface d'escadrille à pied.

Le Rhino ne se déploie **pas par la trappe à cargo** utilisée par le Scarab et le Scorpion : « So big in fact that it
cannot be deployed through the regular cargo hatch like the other SRVs! Instead the Rhino is dropped from the new
vehicle bay » (billet « Beneath the Surface », 6 août 2026, 14:19 UTC). Il partage donc le module de baie de véhicule
introduit par l'Operations Update, dont la liste complète des vaisseaux porteurs est détaillée en **[§3.6](#36-déploiement-du-nomad--baie-de-véhicule-mk-i-13-vaisseaux-et-mk-ii-3-vaisseaux)**. Les billets
officiels ne redonnent pas de liste de vaisseaux compatibles spécifique au Rhino ; la liste restreinte à trois
vaisseaux (Type-9 Heavy, Alliance Crusader, Panther Clipper Mk II) rapportée par massivelyop.com est un sous-ensemble
de la liste officielle du Mk I Vessel Bay et doit être lue comme incomplète. Pour la fiche technique complète d'un
vaisseau porteur (soutes, hardpoints, portée de saut), voir [03-vaisseaux.md](./03-vaisseaux.md).

### 2.4 Le Rhino, véhicule utilitaire non armé : blindage, sièges et rebuy

Aucun billet officiel relevé ne mentionne de système d'armement offensif embarqué sur le Rhino, à la différence du
Scorpion (SRV de combat) ou du Nomad (doté de lasers à impulsion, voir [§3.5](#35-équipement-du-nomad--mk-ii-biological-scanner-et-pulse-lasers)). Le Rhino apparaît conçu comme un
véhicule **utilitaire non armé**, dont la survie sur le terrain repose sur son blindage renforcé (voir [§2.3](#23-équipements-du-rhino--scanner-de-gisements-raffinerie-et-rigs-de-minage)) plutôt
que sur une capacité de riposte propre — un choix cohérent avec le discours de Frontier sur un « utility vehicle,
armoured to protect it from the eyes of those seeking an easy pay day » (billet « Beneath the Surface », 6 août 2026,
14:19 UTC).

**Répartition des rôles (3 places) — hypothèse opérationnelle, non confirmée officiellement par Frontier :** aucun
billet consulté ne détaille l'attribution précise des trois sièges. À partir de la liste d'équipements confirmée
([§2.3](#23-équipements-du-rhino--scanner-de-gisements-raffinerie-et-rigs-de-minage)), une répartition plausible serait : un **pilote/conducteur** (navigation sur terrain accidenté), un
**opérateur de scanner/foreuse** (Planetary Mining Deposit Scanner et Mining Rig Deployment Module), et un troisième
équipier libre pour la logistique (raffinerie embarquée, gestion de la soute, ou vigilance en cas de menace). Cette
répartition reste une déduction du guide, à vérifier en jeu, et non une donnée officielle.

**Coût de rebuy : non communiqué spécifiquement pour le Rhino.** De façon générale dans *Elite Dangerous*, les SRV
déployés depuis un vaisseau n'ont historiquement **pas de coût de rebuy** propre (contrairement aux vaisseaux, soumis
à une franchise d'assurance) : un SRV détruit peut être rappelé gratuitement depuis le vaisseau tant que celui-ci
reste intact. Frontier n'a toutefois publié aucune confirmation explicite que le Rhino suive cette même règle plutôt
qu'un modèle de coût dédié, compte tenu de son statut de véhicule premium vendu exclusivement en Arx au lancement
([§2.7](#27-coût-et-disponibilité-du-rhino--bundles-arx-de-16-520-à-100-000-arx)). À vérifier directement en jeu avant toute session risquant sa perte en zone hostile.

### 2.5 Le minage de surface planétaire du Rhino : une nouvelle boucle de gameplay

Le Rhino SRV Update introduit une boucle de jeu entièrement nouvelle : le **minage de surface planétaire**, distinct du
minage d'astéroïdes existant. Son fonctionnement, tel que décrit par les notes officielles du 2 septembre 2026 :

1. le **Detailed Surface Scanner** (scanner de surface détaillé), mis à jour par ce patch, détecte désormais les
   **Planetary Mining Locations** (sites de minage) depuis l'orbite ;
2. une fois posé, le **Planetary Mining Deposit Scanner** du Rhino localise précisément les gisements exploitables au
   sol ;
3. la **raffinerie embarquée** et le **module de déploiement de rigs** permettent d'extraire et de traiter le minerai
   directement sur place (9 fragments par passage à la sortie, 12 annoncés après correctif — voir [§2.3](#23-équipements-du-rhino--scanner-de-gisements-raffinerie-et-rigs-de-minage)).

Un premier passage d'équilibrage porte sur la capacité des gisements selon leur niveau de densité, le temps de
reconstitution d'un gisement, la pondération des commodités par gisement, ainsi que la taille et le nombre des
Planetary Mining Deposits et Planetary Mining Locations.

Le billet énumère aussi les paramètres rééquilibrés — temps de minage de base, quantité maximale extraite, taux de
recharge d'efficacité, pourcentage d'une unité de commodité dans le contenu miné, statistiques du véhicule et des rigs.
Ces axes figurent sous la rubrique « Added Vodel's Rhino SRV » du billet : rien n'indique qu'ils portent au-delà de la
nouvelle boucle de surface, et [20-minage.md](./20-minage.md) retient la lecture inverse. En l'absence de source
tranchant ce point, ce guide ne l'étend pas au minage d'astéroïdes. Pour la boucle de minage complète (laser
mining, core mining, subsurface deep core, limpets, hotspots), voir le guide dédié **[20-minage.md](./20-minage.md)**,
qui fait référence pour ce sujet transversal ; ce guide-ci ne couvre que la spécificité « surface » apportée par le
Rhino.

### 2.6 Les treize nouvelles matières premières minables en surface avec le Rhino

La mise à jour introduit **treize nouvelles matières premières** exclusivement minables en surface, listées
nominativement dans les notes officielles du 2 septembre 2026 sous l'intitulé « Initial balance values for new
commodities » :

| Catégorie              | Matières                                                            |
|------------------------|---------------------------------------------------------------------|
| Minerais/gemmes        | Diamant (Diamond), Rubis (Ruby), Saphir (Sapphire)                  |
| Gaz/isotopes           | Hélium (Helium), Hélium-3 (Helium-3), Deutérium (Deuterium)         |
| Minéraux/roches        | Magnésite (Magnesite), Olivine, Periclase dunite, Quartz pyroxenite |
| Terres rares et métaux | Bastnäsite, Iridium, Thortveitite                                   |

Le terme employé par Frontier est **« commodities »**, ce qui oriente vers des marchandises revendables sur les
marchés plutôt que vers des matériaux d'ingénierie ; la mention est toutefois trop brève pour trancher définitivement,
et le point reste à vérifier dans l'écran de marché en jeu. Selon [15-roadmap.md](./15-roadmap.md), ces gisements sont
conçus comme une ressource **rare, à régénération très lente** — un choix délibéré des développeurs pour encourager
soit le partage communautaire des bons emplacements, soit au contraire leur dissimulation compétitive ; cette lecture
est cohérente avec l'équilibrage du temps de reconstitution des gisements évoqué en [§2.5](#25-le-minage-de-surface-planétaire-du-rhino--une-nouvelle-boucle-de-gameplay), mais la formulation
d'intention elle-même n'apparaît pas dans les billets relevés.

#### Valorisation des treize matières de surface — squelette à compléter (prix non relevés)

Les treize matières de surface introduites par le Rhino SRV Update sont trop récentes (une semaine à la date de
rédaction) pour figurer dans les tables détaillées
de [11-commerce.md](./11-commerce.md) (commerce de commodités) ou de [06-ingenieurs.md](./06-ingenieurs.md)
(référentiel des grades de matériaux d'ingénierie, lui-même construit sur `material.csv` d'EDCD). Le tableau ci-dessous
doit donc être lu comme un **squelette à compléter**, pas comme des valeurs vérifiées : aucun prix de revente n'a pu
être relevé pour cette révision.

| Matière            | Catégorie              | Grade (référentiel ingénierie)   | Source d'obtention                              | Valeur de revente indicative                        |
|---------------------|------------------------|----------------------------------|--------------------------------------------------|------------------------------------------------------|
| Diamant             | Minerai/gemme          | Non classée à ce jour — voir 06-ingenieurs.md | Minage de surface planétaire (Rhino) uniquement | Non relevée — vérifier sur Inara Trade Tool ou EDDB |
| Rubis               | Minerai/gemme          | Non classée à ce jour            | Minage de surface planétaire (Rhino) uniquement  | idem                                                 |
| Saphir              | Minerai/gemme          | Non classée à ce jour            | Minage de surface planétaire (Rhino) uniquement  | idem                                                 |
| Hélium              | Gaz/isotope            | Non classée à ce jour            | Minage de surface planétaire (Rhino) uniquement  | idem                                                 |
| Hélium-3            | Gaz/isotope            | Non classée à ce jour            | Minage de surface planétaire (Rhino) uniquement  | idem                                                 |
| Deutérium           | Gaz/isotope            | Non classée à ce jour            | Minage de surface planétaire (Rhino) uniquement  | idem                                                 |
| Magnésite           | Minéral/roche          | Non classée à ce jour            | Minage de surface planétaire (Rhino) uniquement  | idem                                                 |
| Olivine             | Minéral/roche          | Non classée à ce jour            | Minage de surface planétaire (Rhino) uniquement  | idem                                                 |
| Periclase dunite    | Minéral/roche          | Non classée à ce jour            | Minage de surface planétaire (Rhino) uniquement  | idem                                                 |
| Quartz pyroxenite   | Minéral/roche          | Non classée à ce jour            | Minage de surface planétaire (Rhino) uniquement  | idem                                                 |
| Bastnäsite          | Terre rare/métal       | Non classée à ce jour            | Minage de surface planétaire (Rhino) uniquement  | idem                                                 |
| Iridium             | Terre rare/métal       | Non classée à ce jour            | Minage de surface planétaire (Rhino) uniquement  | idem                                                 |
| Thortveitite        | Terre rare/métal       | Non classée à ce jour            | Minage de surface planétaire (Rhino) uniquement  | idem                                                 |

### 2.7 Coût et disponibilité du Rhino : bundles Arx de 16 520 à 100 000 Arx

Au lancement, le Rhino n'est disponible **qu'à l'achat en boutique payante (Arx)**, sous forme de véhicules
pré-construits, sans option d'achat en crédits in-game. Les formules et leur contenu, tels que listés dans les notes
officielles du 2 septembre 2026 :

| Formule                                 | Prix (Arx)  | Contenu                                                                                                          |
|------------------------------------------|-------------|-------------------------------------------------------------------------------------------------------------------|
| Rhino Standard                          | 16 520 Arx  | Véhicule de minage de surface + décalque « Owners Club »                                                          |
| Rhino Stellar                           | 33 000 Arx  | Véhicule + peinture « Excavation Yellow » + kit « Chase » + décalque « Owners Club »                              |
| Rhino Galactic                          | 60 000 Arx  | Tout le contenu Stellar + tenue « Motherlode Galactic Miner » + holo-kit « Proximity Yellow » + kits « Deflection » |
| Type-11 Prospector Galactic Mining Pack | 100 000 Arx | Type-11 Prospector haute spécification + Rhino Galactic + tout le contenu Stellar et Galactic des deux véhicules   |

*Prix Arx instantané capturé le 9 septembre 2026, à revérifier en boutique in-jeu.*

Une révision antérieure de ce guide affirmait que tout achat incluait la baie de véhicule et un scanner minéral
planétaire : les notes officielles ne listent, pour la formule Standard, que le véhicule et le décalque. La baie de
véhicule est un module d'équipement à part, à acheter et à monter sur le vaisseau porteur (voir [§3.6](#36-déploiement-du-nomad--baie-de-véhicule-mk-i-13-vaisseaux-et-mk-ii-3-vaisseaux)). De même,
l'annonce d'une disponibilité ultérieure en crédits, mentionnée ailleurs dans le corpus, n'apparaît dans aucun billet
relevé ; elle correspond à la pratique habituelle de Frontier (voir [15-roadmap.md](./15-roadmap.md)) mais n'est pas
un engagement documenté pour le Rhino.

### 2.8 Retours de la communauté sur le lancement du Rhino

Le lancement du Rhino a été relayé activement par des créateurs de contenu communautaires (chaîne YouTube *The Buur
Pit*) avant sa sortie officielle, signe d'un engagement notable de la communauté autour de l'annonce. Ce relais
anticipé est cohérent avec l'Elite Partner Program décrit dans [15-roadmap.md](./15-roadmap.md), qui donne à certains
créateurs un accès en avance de phase.

---

## 3. Le Nomad, premier vaisseau lancé depuis un vaisseau (30 juin 2026)

### 3.1 Ce qu'est le Nomad : la catégorie « vaisseau lancé depuis un vaisseau »

Le **Nomad** est un **vaisseau lancé depuis un vaisseau** (*ship-launched vessel*), petit et compact, « built to
explore planetary surfaces » (billet « Discover the Nomad », 2 juin 2026, 13:03 UTC). C'est une catégorie nouvelle dans
*Elite Dangerous*, à distinguer soigneusement des familles préexistantes :

| Famille                          | Exemples                | Milieu           | Déploiement                    | Achat au chantier naval |
|----------------------------------|-------------------------|------------------|--------------------------------|-------------------------|
| Vaisseau pilotable               | Anaconda, Krait Mk II   | Espace + surface | Aucun (vaisseau principal)     | Oui                     |
| Chasseur embarqué (SLF)          | Taipan, Condor          | Espace           | Fighter Hangar                 | Non                     |
| **Vaisseau lancé (Nomad)**       | **Nomad**               | **Vol de surface** | **Baie de véhicule ([§3.6](#36-déploiement-du-nomad--baie-de-véhicule-mk-i-13-vaisseaux-et-mk-ii-3-vaisseaux))**  | **Non**                 |
| Véhicule de surface (SRV)        | Scarab, Scorpion, Rhino | Surface (roues)  | Trappe à cargo / baie (Rhino)  | Non                     |

Frontier écrit « ship-launched vessel » et « ship-launched utility vessel » ; le sigle **SLV** employé ailleurs dans le
corpus est une commodité d'écriture communautaire, pas un terme officiel. Les notes du 1er juillet 2026 le décrivent
comme « This compact, ship-launched utility vessel [...] designed for exploring and navigating through planetary
terrain with exceptional manoeuvrability », doté de « nimble thrusters, responsive handling, small landing footprint
and rapid spool-up capability » — un vaisseau donc rapide à poser, y compris dans les environnements les plus
difficiles.

### 3.2 Chronologie du Nomad : dévoilement du 2 juin et sortie du 30 juin 2026

| Date                  | Événement                                                                                                                                                                    |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **22 avril 2026**     | Report d'Operations annoncé — billet « An Update on Operations » (14:02 UTC) : la mise à jour « will now be arriving in June »                                               |
| **2 juin 2026**       | **Premier dévoilement du Nomad** — billet « Discover the Nomad » (13:03 UTC) : concepts, design, sortie annoncée « in ARX Early Access alongside Operations on 30th June »   |
| **30 juin 2026**      | **Sortie** du Nomad en accès anticipé Arx, avec l'**Operations Update** (version 4.4.0.0)                                                                                    |
| **1er juillet 2026**  | Publication des notes de version complètes — billet « Operations Update » (14:01 UTC) : « This update also brings with it the mighty Nomad! »               |
| **9 juillet 2026**    | Correctifs — billet « Operations Update — Update 3 » (10:24 UTC), dont un défaut d'affichage de la baie de chasseurs traversant le Nomad au lancement et à l'appontage |
| 2 septembre 2026      | Correctif cosmétique complémentaire dans le Rhino SRV Update (11:20 UTC) : icônes de kits de vaisseau mal affichées lorsque des éléments étaient installés sur le Nomad       |

Le Nomad est donc, à la date de rédaction, un contenu **livré depuis plus de deux mois** et déjà suivi de plusieurs
vagues de correctifs.

### 3.3 Conception du Nomad : patins d'atterrissage et moteurs pivotants

Le billet « Discover the Nomad » (2 juin 2026, 13:03 UTC) détaille deux partis pris de conception, tous deux au
service du même objectif — se poser là où un gros vaisseau ne peut pas :

- **Des patins d'atterrissage inspirés de l'hélicoptère.** « These narrower helicopter-inspired landing skids give the
  Nomad a smaller landing profile, allowing it to perch on more uneven terrain where previously it would have been a
  challenge to land in a larger ship. » L'empreinte au sol est donc plus étroite que celle d'un train d'atterrissage
  classique, ce qui autorise l'appui sur un terrain accidenté.
- **Des moteurs qui pivotent à l'atterrissage.** « The engines will pivot upon landing, and naturally sit just above
  the ground » — les patins prenant alors le relais, ce qui « donne au commandant plus de liberté pour explorer
  différents emplacements à la surface ».

Le billet insiste également sur la silhouette : « Its rugged shape and design is perfect for getting up close with
organics and new discoveries. »

**Accès et circulation.** Les notes du 1er juillet 2026 ajoutent que « the Nomad features accessible entry points,
supporting both rapid disembarking and swift re-entry, allowing commanders to move around the vessel with ease » : le
vaisseau est conçu pour des sorties et des remontées rapides. Le billet consacré au Rhino confirme *a contrario* que
le Nomad dispose bien d'un **espace intérieur accessible**, absent du Rhino : « unlike the Nomad there is no
accessible interior space » (billet « Beneath the Surface », 6 août 2026, 14:19 UTC).

### 3.4 Rôle du Nomad : l'exploration organique de proximité (exobiologie)

Le Nomad crée « a new kind of exploration approach » (billet « Discover the Nomad », 2 juin 2026, 13:03 UTC) : plutôt
que de poser son gros vaisseau d'exploration à la surface, le commandant peut désormais **le laisser au-dessus de la
planète** et descendre en Nomad pour approcher les organiques difficiles d'accès. Frontier cite explicitement le
**Caspian Explorer** comme exemple de vaisseau porteur bénéficiant de cette souplesse nouvelle dans le scan des
organiques — sans en faire une exclusivité (voir [§3.6](#36-déploiement-du-nomad--baie-de-véhicule-mk-i-13-vaisseaux-et-mk-ii-3-vaisseaux) pour la liste réelle des porteurs).

Ce rôle s'articule directement avec l'exobiologie : pour la boucle complète de scan et de vente des données
biologiques (Composition Scanner, Genetic Sampler, distances minimales entre échantillons, primes de première
découverte), voir **[10-exploration.md](./10-exploration.md)**.

### 3.5 Équipement du Nomad : Mk II Biological Scanner et Pulse Lasers

Deux modules sont ajoutés à l'outfitting avec le Nomad, selon les notes du 1er juillet 2026 (rubrique « Nomad added to
outfitting ») :

| Module                        | Nom officiel                | Description officielle                                                    |
|-------------------------------|-----------------------------|---------------------------------------------------------------------------|
| Scanner biologique            | **Mk II Biological Scanner**| « A pulse scanner that detects biological signatures »                    |
| Armement                      | **Pulse Lasers**            | « A pulse laser weapon on a fixed mount »                                  |

Le texte d'annonce précise l'intérêt pratique du scanner : le Nomad « comes equipped with a specialised MK II
Biological Scanner for the detection of biological signals **directly from the cockpit** ». La détection des signaux
biologiques ne suppose donc plus de descendre à pied pour balayer la zone.

**Point de vigilance sur le nom du module.** La dénomination « MK II Discovery Scanner », que l'on rencontre dans
certaines reprises de seconde main, est erronée : elle confond ce module avec le Discovery Scanner d'exploration
classique. Le nom officiel est **Mk II Biological Scanner**, et c'est celui que le corpus doit employer.

### 3.6 Déploiement du Nomad : baie de véhicule Mk I (13 vaisseaux) et Mk II (3 vaisseaux)

Le Nomad **« can be deployed from a compatible vessel bay, including MK I and MK II modules »** (notes du 1er juillet
2026). Il n'est donc **pas** réservé à trois vaisseaux : c'est le module **Mk II** qui est limité à trois porteurs,
tandis que le module **Mk I** équipe treize vaisseaux. Les notes officielles listent nominativement les deux
ensembles, avec les classes de module disponibles :

| Vaisseau porteur          | Mk I Vessel Bay | Mk II Vessel Bay |
|---------------------------|-----------------|------------------|
| Alliance Crusader         | Classe 5-6      | —                |
| Anaconda                  | Classe 5-7      | —                |
| Beluga Liner              | Classe 5-6      | —                |
| **Caspian Explorer**      | Classe 5-7      | **Classe 5-7**   |
| Federal Corvette          | Classe 5-7      | —                |
| Federal Gunship           | Classe 5-6      | —                |
| Imperial Cutter           | Classe 5-7      | —                |
| Keelback                  | Classe 5        | —                |
| Krait Mk II               | Classe 5-6      | —                |
| **Panther Clipper Mk II** | Classe 5-7      | **Classe 5-7**   |
| Type-9 Heavy              | Classe 5-7      | —                |
| Type-10 Defender          | Classe 5-7      | —                |
| **Type-11 Prospector**    | Classe 5-6      | **Classe 5-6**   |

Autrement dit : **treize vaisseaux** peuvent embarquer un Nomad via le Mk I Vessel Bay ; seuls le **Caspian Explorer**,
le **Panther Clipper Mk II** et le **Type-11 Prospector** disposent en plus du **Mk II Vessel Bay**. Une formulation
courante mais fausse restreint le Nomad lui-même à ces trois vaisseaux : elle confond le vaisseau avec le seul module
Mk II, et ne doit pas être reprise.

**Renommage des Fighter Hangar en Vessel Hangar.** L'arrivée du Nomad s'accompagne d'un changement de vocabulaire dans
les données du jeu : les modules `Int_FighterBay_Size5/6/7_Class1` s'intitulent désormais **« Vessel Hangar »** et les
modules `Int_FighterBayMk2_Size5/6/7_Class1` **« Mk II Vessel Hangar »** dans le fichier `outfitting.csv` du dépôt
communautaire EDCD/FDevIDs, dont le commit du 3 juillet 2026 porte le message « new commodity and modules for
Operations & Nomad update ». Le module qui n'accueillait qu'un chasseur accueille donc désormais aussi un Nomad, d'où
l'abandon du terme « fighter ». Ce renommage est corroboré côté jeu par deux correctifs officiels : « Resolved an
instance where the vessel hangar was incorrectly referred to as a fighter hangar within the crew lounge » et
« Resolved an issue where the pistons on the Vessel Hanger could clip through their housing during the launch
animation » (billet « Rhino SRV Update », 2 septembre 2026, 11:20 UTC). Attention : les notes de version emploient
« Vessel Bay » et les données d'outfitting « Vessel Hangar » pour désigner le même module ; les deux formulations
coexistent dans les sources officielles.

Pour le référentiel des modules et des tailles d'emplacements, voir [04-equipements.md](./04-equipements.md) ; pour
les fiches des vaisseaux porteurs, voir [03-vaisseaux.md](./03-vaisseaux.md).

### 3.7 Coût et disponibilité du Nomad : bundles Arx de 16 520 à 60 000 Arx

Le Nomad est sorti en **accès anticipé Arx** le 30 juin 2026, sous forme de vaisseaux pré-construits. Formules et
contenu, tels que listés dans les notes du 1er juillet 2026 :

| Formule                | Prix (Arx)  | Contenu                                                                                                                  |
|------------------------|-------------|--------------------------------------------------------------------------------------------------------------------------|
| Nomad Standard Bundle  | 16 520 Arx  | Vaisseau standard + Mk II Biological Scanner + décalque « Owners Club »                                                   |
| Nomad Stellar Bundle   | 33 000 Arx  | Idem + peinture « Cliffhanger Orange » + kit « Strider »                                                                  |
| Nomad Galactic Bundle  | 60 000 Arx  | Tout le contenu Stellar + holo-kit « Signal Blue » + kits « Rambler » + kit « Internal Science » + décalque « Owners Club » |

*Prix Arx instantané capturé le 9 septembre 2026, à revérifier en boutique in-jeu.* La grille est identique à celle du
Rhino ([§2.7](#27-coût-et-disponibilité-du-rhino--bundles-arx-de-16-520-à-100-000-arx)) et à celle du Kestrel Mk II sorti en février 2026 : 16 520 / 33 000 / 60 000 Arx est le triptyque
standard de Frontier pour un accès anticipé. Pour la conversion indicative des Arx en euros, voir
[15-roadmap.md](./15-roadmap.md).

### 3.8 Nom interne « Lander01 » du Nomad et effets de bord sur les outils tiers

Le Nomad porte le nom interne **`Lander01`** dans les fichiers de jeu et dans le journal du joueur. Deux traces
techniques indépendantes, hautement falsifiables, le documentent :

| Source                         | Date          | Contenu                                                                                                                    |
|--------------------------------|---------------|----------------------------------------------------------------------------------------------------------------------------|
| EDCoPilot v1.11.726            | 1er juillet 2026 | « Nomad release 0 day fix — fix issue where flags in status.json were switching EDCoPilot's tracking back to being in an SRV (because the Nomad sets the SRV flag, not the fighter flag, in the status.json file) » |
| EDCD/EDDI, ticket n° 2849      | 5 août 2026   | Journal brut comportant un événement `DockSRV` avec `SRVType` = `lander01` et `SRVType_Localised` = `Nomad`, et un `LoadGame` avec `Ship` = `Lander01`, `Ship_Localised` = `Nomad`, `gameversion` = `4.4.0.3` |

Le point techniquement notable est que le Nomad **positionne le drapeau SRV, et non le drapeau chasseur**, dans
`status.json`, et qu'il émet un événement `DockSRV` : côté journal, le jeu le traite donc comme un véhicule de surface
plutôt que comme un chasseur embarqué. Cette convention a cassé le suivi d'état de plusieurs outils tiers au
lancement, d'où le correctif EDCoPilot publié le jour même de la sortie des notes. Elle explique aussi que les
catalogues de vaisseaux (Inara, `shipyard.csv` d'EDCD) ne référencent pas le Nomad : ces catalogues ne recensent que
les vaisseaux achetables au chantier naval.

Ces deux éléments sont des corroborations **techniques et communautaires**, pas des annonces de Frontier ; ils
confirment cependant l'existence du véhicule et sa version de jeu (4.4.0.3 au 5 août 2026) de façon difficilement
falsifiable. Pour les outils tiers et leur usage du journal, voir [16-outils.md](./16-outils.md) ; pour les jeux de
données EDCD, voir [17-sources-donnees.md](./17-sources-donnees.md).

### 3.9 Ce que le Nomad ne change pas : le décompte de 48 vaisseaux jouables

Le Nomad n'est **pas** un vaisseau de chantier naval : il ne s'achète pas en crédits au shipyard, n'apparaît pas dans
les catalogues de vaisseaux pilotables et se déploie depuis un vaisseau porteur. Le **décompte de 48 vaisseaux
jouables** recensé par [03-vaisseaux.md](./03-vaisseaux.md) n'est donc **pas** affecté par son existence, pas plus
qu'il ne l'est par celle des SRV (Scarab, Scorpion, Rhino) ou des chasseurs embarqués (Taipan, Condor, etc.).

---

## 4. L'Operations Update du 30 juin 2026, cadre de sortie du Nomad

Le Nomad n'est pas sorti seul : il accompagne l'**Operations Update**, contenu multijoueur en escouade livré le
30 juin 2026 (version 4.4.0.0) après un report annoncé le 22 avril 2026. Les faits utiles à ce guide, tirés des notes
officielles du 1er juillet 2026 (14:01 UTC) :

- **six opérations** au lancement : *Tactical Takedown*, *Firestorm Rescue*, *Reclamation Point*, *Biohazard
  Takedown*, *Rapid Response*, *Terminal Prosecution* ; une septième, **« Under Siege »**, a été ajoutée le
  2 septembre 2026 avec le Rhino ;
- l'**Operation Runner**, « a specialised deployment vessel » qui transporte l'escouade vers le système de l'opération
  et sert de point de réapparition et d'extraction ;
- une monnaie dédiée, le **Merc Coin**, dépensable en **MercGear** (blueprints et modules pré-ingénieurés) ;
- un déploiement en **Networking & Balancing Beta**, Frontier annonçant des ajustements réguliers côté serveurs.

Le détail de ces mécaniques n'est pas repris ici : voir **[13-operations.md](./13-operations.md)** et
**[15-roadmap.md](./15-roadmap.md)**. Deux points de vocabulaire méritent toutefois d'être notés pour le corpus :
les noms de scénarios annoncés le 22 avril 2026 (*Counter Attack*, *Burning Rescue*, *Megaship Massacre Reclaim*,
*Megaship Massacre Strike*, *Surface Rescue*, *Pirate Hunt*) sont des **noms de travail** renommés avant la sortie ;
et le billet du 9 juillet 2026, intitulé « Operations Update | Update 3 », annonce dans son corps que « The Operations
Update 2 is now live » — une incohérence de la communication officielle elle-même, à ne pas traiter comme deux mises à
jour distinctes.

**Portée de la correction.** Les sections de ce guide et du corpus qui présentaient le Nomad et Operations comme « non
confirmés » reposaient sur l'erreur de catégorie décrite dans la note de méthode en tête de guide. Les guides du
corpus qui portent encore des formules de non-confirmation sur ces deux sujets doivent être lus comme obsolètes sur ce
point, et alignés sur les billets officiels cités ici — voir [00-chronologie-canonique.md](./00-chronologie-canonique.md)
pour l'arbitrage consolidé.

---

## 5. Véhicules de surface : Scarab, Scorpion et Rhino comparés

Le corpus documentait le Rhino en détail (sections 2-2.8) mais jamais le Scarab ni le Scorpion, cités par ricochet
dans cinq guides sans fiche technique ni caractéristiques comparées. Cette section comble le vide.

### 5.1 Tableau comparatif

| | **Scarab** | **Scorpion** | **Rhino** |
|---|---|---|---|
| Places | 1 | 2 (conducteur + tireur) | 3 |
| Armement | Tourelle double répéteur à plasma (~8,3 coups/s, 800 m de portée max) | Surge Repeater (jusqu'à 10 tirs/s) + Aculeus Launcher (missile direct/verrouillage) | Aucun (utilitaire) |
| Soute | 4 t | 2 t selon les notes de patch 2021, **30 t** selon le site officiel actuel — contradiction non résolue, voir zones incertaines | Non chiffrée officiellement |
| Vitesse de pointe | 38 m/s, jets propulseurs (saut/glisse) | 32 m/s, pas de jets propulseurs | Non chiffrée officiellement |
| Blindage / Bouclier | 108 / 40 (site officiel ; 25 selon le wiki, écart non résolu) | 162 / 130 | « Heavily armoured », non chiffré |
| Wave Scanner | Oui (exclusif) | Non | Scanner de gisements dédié ([§2.3](#23-équipements-du-rhino--scanner-de-gisements-raffinerie-et-rigs-de-minage)), pas de Wave Scanner généraliste |
| Modifiable (ingénierie) | Non | Non | Non documenté, présumé non |
| Hangar requis | Planetary Vehicle Hangar (véhicule par défaut) | Planetary Vehicle Hangar + extension Odyssey, vente réservée aux économies Militaires | Baie de véhicule dédiée ([§2.3](#23-équipements-du-rhino--scanner-de-gisements-raffinerie-et-rigs-de-minage)), pas la trappe à cargo du Scarab/Scorpion |
| Coût d'achat | 5 270 Cr | 24 863 Cr | Vendu en Arx au lancement ([§2.7](#27-coût-et-disponibilité-du-rhino--bundles-arx-de-16-520-à-100-000-arx)), pas en crédits |
| Rôle | Exploration/reconnaissance légère | Combat et soutien au sol anti-personnel/anti-petit vaisseau | Minage de surface planétaire |

*(Sources : elite-dangerous.fandom.com — Scarab, Scorpion, Vehicles, Planetary Vehicle Hangar ; site officiel
elitedangerous.com/store/vehicles ; forums.frontier.co.uk — Elite Dangerous: Odyssey Update 9 Notes ; consultées le
12 septembre 2026. Rhino : [§2.1](#21-le-rhino-en-bref--srv-minier-vodel-à-six-roues-et-trois-occupants)-[§2.4](#24-le-rhino-véhicule-utilitaire-non-armé--blindage-sièges-et-rebuy) de ce guide.)*

### 5.2 Mécaniques de conduite communes

Les SRV utilisent le même système de **6 pips** (SYS/ENG/WEP) que les vaisseaux : SYS renforce le bouclier, ENG
accélère les déplacements et la recharge des jets/boost, WEP prolonge le tir avant surchauffe. Le **Drive Assist** (assistance de conduite) propose deux modes : activé, la SRV maintient la vitesse choisie (mais tourner fait déraper, le système compensant
en accélérant à fond) ; désactivé, le pilotage se fait « à l'ancienne » (accélérateur et frein progressifs). Le
**saut** (boost du Scarab uniquement, barre espace) active des jets propulseurs verticaux consommant l'énergie ENG,
pour sauter, planer brièvement en faible gravité ou se redresser — le Scorpion n'en dispose pas. Sur une planète à
moins de 1 g, les jets ajoutent une portance négative artificielle qui plafonne la gravité effective ressentie à un
minimum d'environ 0,5 g ; au-dessus de 1 g, aucune compensation. Le bouclier d'un SRV ne protège **pas** contre les
impacts de terrain (chutes, collisions), seulement contre les tirs ; aucun seuil chiffré officiel de dégâts de chute
n'est publié par Frontier.

### 5.3 Lecture du Wave Scanner

Le **Wave Scanner** (scanner de détection à courte portée, exclusif au Scarab) distingue **trois** catégories de signaux, pas quatre — il n'existe **aucune**
catégorie « biologique » : **natural** (fragments minables/minéraux, fréquence basse, son grave — inclut les cibles
de type geysers/fumerolles), **vessel** (vaisseaux et épaves, fréquence moyenne), **artificial** (points de données
et settlements, fréquence haute). La faune et la flore (exobiologie) n'y sont **pas** détectées : leur repérage
passe par le Detailed Surface Scanner du vaisseau puis des outils dédiés au sol, voir
[10-exploration.md](./10-exploration.md). Le scanner permet aussi de verrouiller des menaces (Skimmers) et des objets
au sol (cargo canisters).

### 5.4 Combat en SRV

Menaces documentées : les **Skimmers**, véhicules pilotés à distance non jouables (Stinger-2 sans arme à charge
suicide, S4 Sentry standard, S5LM Guardian et S9 Goliath en haute sécurité — neutralisables en détruisant leur base
ou leurs relais s'ils sont hors de portée) ; les **tourelles de settlement** (Anti-Ground portée ~300 m, Anti-Air qui
ciblent aussi les SRV, Defence Platform lourde dont la portée de détection dépend du niveau de sécurité du site,
~728 m à ~1,6 km) — toutes destructibles mais auto-réparables. **Le mode tourelle télécommandé** du Scorpion
n'existe pas « depuis le vaisseau » : un second joueur doit physiquement occuper le siège arrière du véhicule (par
télé-présence classique, un mécanisme distinct du rôle Gunner réservé aux tourelles de vaisseau) — le point précis
de savoir s'il peut rejoindre une SRV déjà déployée à distance reste débattu par la communauté, sans confirmation
officielle.

### 5.5 Maintenance : carburant, munitions, réparation, et l'absence de rebuy

La coque d'un SRV se répare **automatiquement et gratuitement** en réintégrant la baie du vaisseau porteur — mais
cela ne recharge ni le carburant ni les munitions, reconstituables sur le terrain par **Synthesis** (synthèse de consommables à partir de matériaux collectés) : « SRV Refuel »
(1 Sulphur + 1 Phosphorus), « SRV Ammo Restock » (2 Sulphur + 1 Phosphorus), « SRV Repair » (2 Iron + 1 Nickel),
chacune en versions Standard/Premium plus efficaces. **Confirmé : un SRV détruit n'a aucun coût de rebuy** — le
commandant reprend simplement le contrôle de son vaisseau sans passer par l'écran de **Redeployment** (rachat d'un véhicule détruit) ; il doit
seulement racheter un nouveau véhicule au prix plein pour en redéployer un, sans pénalité en pourcentage ni perte de
progression. Cette règle, déjà pressentie pour le Rhino sans confirmation officielle ([§2.4](#24-le-rhino-véhicule-utilitaire-non-armé--blindage-sièges-et-rebuy)), est ici confirmée pour
le Scarab et le Scorpion par la documentation générale des véhicules.

---

## Questions fréquentes

### Combien de places a le Rhino (Rhino SRV) ?

Le Rhino accueille jusqu'à **3 occupants** simultanément — contre 1 place pour le Scarab et 2 pour le Scorpion
(conducteur + tireur). Frontier le présente comme « the largest SRV which a Commander can deploy from their ship ».
Voir [§2.1](#21-le-rhino-en-bref--srv-minier-vodel-à-six-roues-et-trois-occupants).

### Le Rhino, c'est armé ou pas (armed) ?

Non : aucun billet officiel ne mentionne de système d'armement offensif sur le Rhino, à la différence du Scorpion
(SRV de combat) ou du Nomad (Pulse Lasers). C'est un véhicule utilitaire non armé dont la survie repose sur son
blindage renforcé plutôt que sur une capacité de riposte. Voir
[§2.4](#24-le-rhino-véhicule-utilitaire-non-armé--blindage-sièges-et-rebuy).

### Le Rhino coûte combien en Arx ?

Trois formules d'accès anticipé : **16 520 Arx** (Standard), **33 000 Arx** (Stellar) et **60 000 Arx** (Galactic) ;
un bundle combiné avec le Type-11 Prospector est vendu **100 000 Arx**. Aucune option d'achat en crédits n'existe au
lancement. Voir [§2.7](#27-coût-et-disponibilité-du-rhino--bundles-arx-de-16-520-à-100-000-arx).

### Le Rhino sort par la trappe à cargo comme les autres SRV ?

Non : trop volumineux, il ne peut pas être déployé par la trappe à cargo classique utilisée par le Scarab et le
Scorpion. Il est largué depuis la nouvelle **baie de véhicule** (Vessel Bay / Vessel Hangar), le même module que
celui du Nomad. Voir [§2.3](#23-équipements-du-rhino--scanner-de-gisements-raffinerie-et-rigs-de-minage).

### Le Rhino ramasse combien de fragments par minage de surface (surface mining) ?

À la sortie du 2 septembre 2026, seulement **9 fragments** par passage au lieu des **12** prévus : Frontier a listé
ce point comme un problème connu et promis une correction « as soon as possible », mais aucun billet officiel relevé
au 9 septembre 2026 ne confirme que ce correctif a été livré. Voir
[§2.3](#23-équipements-du-rhino--scanner-de-gisements-raffinerie-et-rigs-de-minage).

### Quelles sont les nouvelles matières minables avec le Rhino ?

**Treize** commodités exclusivement minables en surface : Diamant, Rubis, Saphir, Hélium, Hélium-3, Deutérium,
Magnésite, Olivine, Periclase dunite, Quartz pyroxenite, Bastnäsite, Iridium et Thortveitite. Aucun prix de revente
n'a encore été relevé pour ces treize matières. Voir
[§2.6](#26-les-treize-nouvelles-matières-premières-minables-en-surface-avec-le-rhino).

### Le Nomad (ship-launched vessel), il est sorti quand ?

Le **30 juin 2026**, en accès anticipé Arx, avec l'**Operations Update** (version 4.4.0.0) — après un dévoilement le
2 juin 2026 et un report annoncé le 22 avril 2026. Voir
[§3.2](#32-chronologie-du-nomad--dévoilement-du-2-juin-et-sortie-du-30-juin-2026).

### Sur quels vaisseaux peut-on embarquer un Nomad (vessel bay) ?

**Treize vaisseaux** disposent du Mk I Vessel Bay compatible (dont Anaconda, Imperial Cutter, Type-9 Heavy...) ; trois
d'entre eux — Caspian Explorer, Panther Clipper Mk II et Type-11 Prospector — disposent en plus du Mk II Vessel Bay.
Le Nomad lui-même n'est pas limité à ces trois vaisseaux, contrairement à une idée reçue. Voir
[§3.6](#36-déploiement-du-nomad--baie-de-véhicule-mk-i-13-vaisseaux-et-mk-ii-3-vaisseaux).

### C'est quoi le nom interne du Nomad dans les logs (Lander01) ?

**Lander01** : le journal du joueur enregistre un événement `DockSRV` avec `SRVType` = `lander01`, et le Nomad
positionne le drapeau SRV (pas le drapeau chasseur) dans `status.json` — ce qui a cassé le suivi de plusieurs outils
tiers à la sortie. Voir [§3.8](#38-nom-interne--lander01--du-nomad-et-effets-de-bord-sur-les-outils-tiers).

### Le Rhino, ça a un rebuy si je le perds ?

Pas confirmé spécifiquement pour le Rhino par Frontier. La règle générale des SRV lancés depuis un vaisseau — aucun
coût de rebuy, juste un rachat plein tarif pour en redéployer un — est en revanche bien confirmée pour le Scarab et
le Scorpion. À vérifier en jeu avant toute session risquée. Voir
[§2.4](#24-le-rhino-véhicule-utilitaire-non-armé--blindage-sièges-et-rebuy) et
[§5.5](#55-maintenance--carburant-munitions-réparation-et-labsence-de-rebuy).

### Le Rhino a un Wave Scanner comme le Scarab ?

Non : le Wave Scanner est exclusif au Scarab. Le Rhino dispose à la place d'un scanner de gisements dédié au minage
de surface (Planetary Mining Deposit Scanner), sans fonction de détection généraliste des vaisseaux ou des
settlements. Voir [§5.1](#51-tableau-comparatif).

### Qui construit le Rhino, c'est Core Dynamics ?

Le constructeur crédité par Frontier est **Vodel**. Un rattachement à Core Dynamics circule dans la communauté, mais
n'est étayé par aucun billet officiel relevé : c'est à ce stade une affirmation communautaire non vérifiée. Voir
[§2.1](#21-le-rhino-en-bref--srv-minier-vodel-à-six-roues-et-trois-occupants).

---

## Voir aussi

- **[00 — Chronologie canonique](./00-chronologie-canonique.md)** — arbitrage sourcé des dates et des contradictions
  chronologiques du corpus, dont celles concernant Operations, le Nomad et le Rhino.
- **[00 — Glossaire](./00-glossaire.md)** — définitions des sigles utilisés dans le corpus (SRV, SLF, CG, SCO, etc.).
- **[03 — Vaisseaux](./03-vaisseaux.md)** — fiches techniques des vaisseaux porteurs listés en [§3.6](#36-déploiement-du-nomad--baie-de-véhicule-mk-i-13-vaisseaux-et-mk-ii-3-vaisseaux), et décompte des
  vaisseaux jouables (non affecté par le Nomad, voir [§3.9](#39-ce-que-le-nomad-ne-change-pas--le-décompte-de-48-vaisseaux-jouables)).
- **[04 — Équipements](./04-equipements.md)** — référentiel des modules et des classes d'emplacements internes, pour
  situer le Vessel Hangar et le Mk II Biological Scanner ([§3.5](#35-équipement-du-nomad--mk-ii-biological-scanner-et-pulse-lasers) et [§3.6](#36-déploiement-du-nomad--baie-de-véhicule-mk-i-13-vaisseaux-et-mk-ii-3-vaisseaux)).
- **[06 — Ingénieurs](./06-ingenieurs.md)** — référentiel des grades de matériaux ; base pour situer (ou non) les
  treize nouvelles matières du Rhino ([§2.6](#26-les-treize-nouvelles-matières-premières-minables-en-surface-avec-le-rhino)).
- **[10 — Exploration](./10-exploration.md)** — boucle d'exobiologie complète, que le Nomad vient servir ([§3.4](#34-rôle-du-nomad--lexploration-organique-de-proximité-exobiologie)).
- **[13 — Opérations (gameplay à pied, Odyssey 2021)](./13-operations.md)** — le sujet homonyme visé par l'encadré de
  désambiguïsation, et point d'entrée pour le détail des opérations en escouade ([§4](#4-loperations-update-du-30-juin-2026-cadre-de-sortie-du-nomad)).
- **[15 — Roadmap](./15-roadmap.md)** — chronologie détaillée des mises à jour 2024-2026 et conversion des Arx.
- **[16 — Outils](./16-outils.md)** — outils tiers exploitant le journal du jeu, affectés par la convention
  `status.json` du Nomad ([§3.8](#38-nom-interne--lander01--du-nomad-et-effets-de-bord-sur-les-outils-tiers)).
- **[17 — Sources de données](./17-sources-donnees.md)** — jeux de données EDCD (`outfitting.csv`, `shipyard.csv`) et
  leur périmètre exact, au cœur de la correction décrite en tête de guide.
- **[20 — Minage](./20-minage.md)** — boucle de gameplay complète du minage (spatial et, désormais, de surface) ; ce
  guide ne couvre que la spécificité Rhino.
- **[30 — Piraterie et PvP](./30-piraterie-et-pvp.md)** — le Scorpion et son mode tourelle, utile en défense de
  settlement.
- **[31 — Pilotage, navigation et stations](./31-pilotage-navigation-et-stations.md)** — déploiement d'un SRV depuis
  le vaisseau, atterrissage planétaire et Planetary Vehicle Hangar.

---

## Note sur la fiabilité des données chiffrées du Rhino et du Nomad

Les prix (Arx), quantités de matières et statistiques de véhicules cités dans ce guide sont, sauf mention contraire,
un **instantané capturé le 9 septembre 2026** — à revérifier en jeu ou sur [Inara.cz](https://inara.cz) avant toute
décision d'achat, ces valeurs pouvant changer avec de futurs correctifs. Ces valeurs sont par ailleurs données en
**configuration stock** ; l'ingénierie (voir [06-ingenieurs.md](./06-ingenieurs.md)) peut les modifier
significativement lorsqu'elle s'applique aux modules concernés.

---

## Sources

### Sources primaires — annonces officielles de Frontier Developments

Relevées le 9 septembre 2026 sur le flux Steam News d'*Elite Dangerous* (appid 359320), via l'API publique
`api.steampowered.com/ISteamNews/GetNewsForApp/v2/`, qui republie mot pour mot les annonces de Frontier :

- « Elite Dangerous | Rhino SRV Update » — 2 septembre 2026, 11:20 UTC (sortie du Rhino, minage de surface, treize
  nouvelles commodités, opération « Under Siege », problèmes connus).
- « Elite Dangerous | August Dev Log » — 27 août 2026, 10:04 UTC (premières images en jeu du Rhino).
- « Beneath the Surface: Your First Look at the Rhino » — 6 août 2026, 14:19 UTC (révélation du Rhino, entretien avec
  le directeur artistique Chris Gregory).
- « Elite Dangerous | Operations Update | Update 3 » — 9 juillet 2026, 10:24 UTC (correctifs post-Operations).
- « Elite Dangerous | Operations Update » — 1er juillet 2026, 14:01 UTC (notes de version complètes : Nomad, modules,
  baies de véhicule Mk I et Mk II, bundles Arx, six opérations).
- « Discover the Nomad » — 2 juin 2026, 13:03 UTC (dévoilement du Nomad, conception, date de sortie).
- « Elite Dangerous | Lynx Highliner Update Notes » — 28 avril 2026, 13:11 UTC.
- « Elite Dangerous | An Update on Operations » — 22 avril 2026, 14:02 UTC (report d'Operations en juin).
- « Elite Dangerous | Kestrel Mk. II Update » — 24 février 2026, 12:21 UTC.
- « Elite Dangerous | Developer Log » — 17 février 2026, 10:06 UTC (feuille de route de l'année).

### Corroborations techniques indépendantes

- EDCoPilot, notes de version v1.11.726 (1er juillet 2026) — correctif du drapeau SRV positionné par le Nomad dans
  `status.json`.
- EDCD/EDDI, ticket n° 2849 (5 août 2026) — journal brut : `SRVType` = `lander01`, `SRVType_Localised` = `Nomad`,
  `Ship` = `Lander01`, `gameversion` = `4.4.0.3`.
- EDCD/FDevIDs, `outfitting.csv` — modules `Int_FighterBay_Size5/6/7_Class1` renommés « Vessel Hangar » et
  `Int_FighterBayMk2_Size5/6/7_Class1` « Mk II Vessel Hangar » ; commit du 3 juillet 2026 « new commodity and modules
  for Operations & Nomad update ».

### Relais de presse (secondaires)

- https://massivelyop.com/2026/09/03/elite-dangerous-launches-mining-updates-surface-mining-and-the-rhino-mining-vehicle/
- https://massivelyop.com/2026/08/27/elite-dangerous-takes-a-quick-look-at-the-rhino-vehicle-surface-mining-and-a-new-operation-arriving-september-2/
- https://massivelyop.com/2026/08/07/elite-dangerous-unveils-the-rhino-mining-buggy-and-hints-at-new-surface-mining-gameplay/
- https://massivelyop.com/2026/04/23/elite-dangerous-delays-dungeon-like-operations-to-june-makes-new-ship-available-for-credits-april-28/
- https://massivelyop.com/2026/02/17/elite-dangerous-plots-six-vessel-releases-group-based-operations-and-a-feature-reboot-in-2026-roadmap/
- https://twistedvoxel.com/elite-dangerous-rhino-srv-update-adds-surface-mining/

### Réserves de vérification

- Les pages de notes de version du site officiel (elitedangerous.com), Fandom et Reddit renvoient des erreurs HTTP 403
  depuis cette session : les numéros de version 4.4.1.0 et 4.4.1.1 attribués au Rhino n'ont pas pu y être vérifiés
  (voir [§2.2](#22-chronologie-du-rhino--révélation-du-6-août-et-sortie-du-2-septembre-2026)).
- Aucun prix de revente n'a pu être relevé pour les treize nouvelles matières de surface (voir [§2.6](#26-les-treize-nouvelles-matières-premières-minables-en-surface-avec-le-rhino)).

### Sources ajoutées le 12 septembre 2026 (section 5 — comparatif Scarab/Scorpion/Rhino)

- `elite-dangerous.fandom.com` — Scarab, Scorpion, Vehicles, Wave Scanner, Drive Assist, Skimmers, Defence Turrets,
  Synthesis, Redeployment, Planetary Vehicle Hangar, Multicrew.
- `www.elitedangerous.com/store/vehicles/scarab`, `/scorpion` — statistiques officielles actuelles, en écart mineur
  avec le wiki sur le bouclier et le carburant du Scarab (voir zones incertaines).
- `forums.frontier.co.uk` — Elite Dangerous: Odyssey Update 9 Notes (9 décembre 2021, soute et places du Scorpion),
  fils sur les pips en SRV et le « base jumping ».
- inara.cz est resté inaccessible (contrôle anti-robot) : les prix d'achat du Scarab et du Scorpion ne reposent que
  sur le wiki communautaire.
