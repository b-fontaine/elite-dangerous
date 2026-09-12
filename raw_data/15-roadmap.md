---
id: 15-roadmap
titre: "Elite Dangerous : la roadmap des développeurs (fin 2024 – septembre 2026)"
domaine: transversal
entites: [Ascendancy, Trailblazers, Vanguards, Operations Update, Rhino SRV Update, Nomad, Kestrel Mk II, Lynx Highliner, Dodec Update, ARX, Dev Log, GalNet]
mots_cles_en: [roadmap, update notes, ascendancy, trailblazers, vanguards, operations update, rhino srv, nomad, kestrel mk ii, lynx highliner, arx early access, dev log, known issues]
version_jeu_couverte: "4.4.0.x"
branche: live
date_verification: 2026-09-09
confiance_globale: haute
volatilite: haute
sources_primaires: [Steam News Frontier (appid 359320), elitedangerous.com/news, store.steampowered.com, inara.cz]
zones_incertaines: ["le numéro de version 4.4.1.0 attribué au Rhino SRV Update n'est pas attesté, les pages officielles de notes de version renvoyant une erreur HTTP 403", "le hotfix 4.4.1.1 du 3 septembre 2026 n'est confirmé par aucun billet officiel relevé", "le passage de 9 à 12 fragments pour le minage de surface du Rhino est annoncé mais non livré au 9 septembre 2026", "Frontier ne publie pas les valeurs des paramètres rééquilibrés du Surface Mining, ni le temps de reconstitution d'un gisement", "le contenu du « feature reboot » promis pour l'automne 2026 n'est pas détaillé", "les deux véhicules d'automne et d'hiver 2026 de la feuille de route annuelle ne sont pas identifiés"]
guides_lies: [0, 2, 12, 13, 14, 18, 20, 22, 24]
---
# Elite Dangerous : la roadmap des développeurs (fin 2024 – septembre 2026)

## En bref

*Elite Dangerous* suit un modèle de jeu-service au format de version `4.x.y.z`, alternant grandes saisons gratuites et
mises à jour intermédiaires centrées sur un vaisseau ou un véhicule. Quatre saisons ont été livrées depuis fin 2024 :
**Ascendancy** le 31 octobre 2024 (Powerplay 2.0 et vaisseau Mandalay), **Trailblazers** le 26 février 2025 (bêta de la
Colonisation de systèmes), **Vanguards** le 19 août 2025 (refonte des Squadrons) et **Operations** le 30 juin 2026
(version 4.4.0.0 : six opérations en escouade, Operation Runner, monnaie Merc Coin, catalogue MercGear), corrigée par
l'Update 3 du 9 juillet 2026 (version 4.4.0.3). Entre elles se sont intercalés le Type-11 Prospector, le Dodec Update
(fin de la bêta de Colonisation, 11 novembre 2025), le Caspian Explorer, le Kestrel Mk II, le Lynx Highliner et, le
2 septembre 2026, le **Rhino SRV Update**, qui ajoute la mécanique de Surface Mining, treize matières premières et
l'opération « Under Siege ». Chaque véhicule sort d'abord en accès anticipé ARX, selon une grille stable de
16 520 / 33 000 / 60 000 ARX.

## Vue d'ensemble — le modèle de sorties de Frontier Developments

Elite Dangerous, développé et édité par Frontier Developments, fonctionne depuis plusieurs années sur un modèle de «
jeu-service » gratuit pour ses mises à jour majeures : le studio publie régulièrement de grandes mises à jour nommées
(les « saisons »), entrecoupées de mises à jour plus ciblées centrées sur un nouveau vaisseau ou véhicule, elles-mêmes
suivies de patchs correctifs et de hotfixs. Cette synthèse dresse l'état de cette feuille de route au 9 septembre 2026,
à partir des communications officielles de Frontier (site officiel, Dev Logs mensuels, notes de mise à jour, GalNet).

Ce guide reste volontairement synthétique sur les sujets qui ont leur propre guide dédié dans le corpus : les
sections « Operations », « Nomad » et « Rhino » ci-dessous ne résument que ce qui concerne la feuille de route
(dates, versions, cadence), et renvoient vers [13-operations.md](./13-operations.md) et
[14-rhino-nomad.md](./14-rhino-nomad.md) pour l'analyse détaillée — y compris pour les points où ces guides,
plus fouillés, nuancent ou corrigent ce qui est dit ici.

Les dates et les intitulés retenus ci-dessous s'appuient en priorité sur les annonces officielles de Frontier
republiées sur le flux Steam News d'*Elite Dangerous* (appid 359320), relevé le 9 septembre 2026 ; chaque entrée
notable cite le billet qui l'étaye (titre et horodatage UTC).

> **Correction (9 septembre 2026)** : une révision antérieure de ce guide marquait la saison **Operations** et le
> vaisseau **Nomad** comme « non confirmés » et retirait leurs dates. Cette conclusion reposait sur une erreur de
> méthode (recherche d'un vaisseau lancé depuis un vaisseau dans des catalogues de chantier naval, qui ne recensent
> que les vaisseaux achetables) ; elle est corrigée ici. Les deux contenus sont sortis le **30 juin 2026** et sont
> documentés par les billets officiels cités dans ce guide — voir
> [14-rhino-nomad.md](./14-rhino-nomad.md) pour le détail de cette correction.

## Chronologie des mises à jour d'Elite Dangerous (fin 2024 – septembre 2026)

Le jeu suit un système de versions au format `4.x.y.z`. Trois niveaux de sorties se distinguent :

- **Les grandes mises à jour nommées** (« saisons »), gratuites, qui apportent une nouvelle fonctionnalité de gameplay
  structurante ;
- **Les mises à jour intermédiaires**, généralement centrées sur un nouveau vaisseau ou véhicule ;
- **Les patchs et hotfixs**, qui suivent chaque sortie majeure ou intermédiaire dans les jours ou semaines suivantes.

### Les grandes mises à jour nommées (Ascendancy, Trailblazers, Vanguards, Operations)

| Saison            | Date de sortie   | Contenu principal                                                                                                                                                                                                                                 |
|-------------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Ascendancy**    | 31 octobre 2024 | Refonte complète du Powerplay (**Powerplay 2.0**) et nouveau vaisseau **Mandalay**. Absente des premières versions de cette synthèse, qui commençaient à tort en février 2025 alors que le titre du guide couvre bien « fin 2024 » — voir [Powerplay](./02-powerplay.md). |
| **Trailblazers**  | 26 février 2025 | Introduction de la Colonisation de systèmes (*System Colonisation*) en bêta : les joueurs peuvent revendiquer et développer leurs propres systèmes stellaires (économie locale, hub commercial, port d'opérations). Voir le suivi dédié ci-dessous et [18-colonisation.md](./18-colonisation.md). |
| **Vanguards**     | 19 août 2025    | Refonte complète du système des Squadrons (escadrons) : Squadron Carrier dédié (voir [Fleet Carriers](./19-fleet-carriers.md)), Squadron Bank pour partager ressources et vaisseaux, navigateur d'escadron enrichi (bannières, devises, logos personnalisables) et nouveaux avantages collectifs — voir [Squadrons](./22-squadrons.md). |
| **Operations**    | 30 juin 2026    | Contenu multijoueur en escouade (version 4.4.0.0) : six opérations scénarisées, vaisseau de déploiement **Operation Runner**, monnaie **Merc Coin** et catalogue **MercGear**, lobby et matchmaking dédiés, mode Powerplay optionnel. La mise à jour amène également le **Nomad** (voir ci-dessous). Notes de version publiées le 1er juillet 2026 (billet « Operations Update », 14:01 UTC). Voir [13-operations.md](./13-operations.md) et la section dédiée plus bas. |

> **Correction (8 septembre 2026)** : la date de Trailblazers a été corrigée de « 25 février » à **26 février 2025**
> (date de lancement officielle de la bêta de la Colonisation, confirmée par les métadonnées de publication du site
> officiel). Le 28 février 2025 correspond en réalité à la date du « System Colonisation Guide » explicatif publié
> deux jours plus tard, et non à la date de sortie elle-même — une confusion fréquente, y compris sur Wikipédia
> anglophone. Voir [00-chronologie-canonique.md, point 2](./00-chronologie-canonique.md#2-colonisation-de-systèmes--dates-bêta-et-sortie-complète)
> pour le détail des sources.

La cadence observée s'est nettement allongée : Ascendancy → Trailblazers en un peu moins de 4 mois, Trailblazers →
Vanguards en un peu moins de 6 mois, puis Vanguards → Operations en un peu plus de 10 mois. Cet étirement s'explique
en partie par le report d'Operations, annoncé le 22 avril 2026 (« we have made the difficult decision to delay the
release of Operations, which will now be arriving in June », billet « An Update on Operations », 14:02 UTC) — un
report déjà consécutif à un précédent glissement, relevé à l'époque par la presse spécialisée. Aucune saison suivante
n'a été annoncée à ce jour.

### Les mises à jour intermédiaires (« vaisseau/véhicule ») et leurs patchs

| Version(s)        | Date(s)                     | Mise à jour               | Contenu                                                                                                                                                         |
|-------------------|-----------------------------|---------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 4.2.0.2 / 4.2.0.3 | 1er et 11 sept. 2025        | Patchs post-Vanguards     | Correctifs                                                                                                                                                      |
| 4.2.1.0 / .1 / .2 | 29 sept., 2 et 16 oct. 2025 | Type-11 Prospector Update | Nouveau vaisseau minier, le Type-11 Prospector, accompagné d'ajustements de la Colonisation (voir sous-section dédiée)                                          |
| 4.2.2.0 / .1      | 11 et 13 nov. 2025          | Dodec Update              | Station Dodec de la Brewer Corporation (entrée en pleine production confirmée en lore GalNet en mai 2026). Selon les notes de version officielles, cette mise à jour marque aussi la **fin de la bêta de la Colonisation de systèmes** (voir sous-section dédiée). |
| 4.3.0.0 / .1      | 2 et 11 déc. 2025           | Caspian Explorer Update   | Nouveau vaisseau d'exploration, le Caspian Explorer (Zorgon Peterson)                                                                                           |
| 4.3.1.0           | 24 fév. 2026                | Kestrel Mk II Update      | Vaisseau de combat léger de Core Dynamics, propulseurs Mk II Agile Boost et Mk II Plasma Shock Accelerator, accompagné d'une refonte massive de l'audio du combat à pied (voir détail plus bas) |
| 4.3.3.0           | 28 avril 2026               | Lynx Highliner Update     | Nouveau vaisseau de ligne pour passagers (Zorgon Peterson — et non Saud Kruger, malgré une confusion fréquente puisqu'il s'agit du premier paquebot de ce fabricant), pouvant accueillir jusqu'à 225 passagers |
| **4.4.0.0**       | **30 juin 2026**            | **Operations Update**     | Contenu multijoueur en escouade et sortie du **Nomad** en accès anticipé Arx ; notes de version publiées le 1er juillet 2026 (billet « Operations Update », 14:01 UTC) |
| 4.4.0.3           | 9 juillet 2026              | Operations Update 3       | Correctifs Operations (récompenses manquantes, données d'exploration perdues, inventaires à pied) — billet « Operations Update — Update 3 » (10:24 UTC) ; version attestée par les journaux de jeu (voir [14-rhino-nomad.md, §3.8](./14-rhino-nomad.md#38-nom-interne--lander01--du-nomad-et-effets-de-bord-sur-les-outils-tiers)) |
| 4.4.1.0 *(numéro non attesté)* | 2 sept. 2026   | Rhino SRV Update          | Nouveau SRV minier **Vodel's Rhino**, mécanique de Surface Mining, treize nouvelles commodités et opération « Under Siege » |

Entre chaque saison majeure s'intercale ainsi une mise à jour « vaisseau » tous les 1 à 3 mois, elle-même suivie d'un ou
deux patchs correctifs dans les semaines suivantes.

**Réserve sur la numérotation de septembre 2026.** Les numéros **4.4.1.0** (Rhino) et **4.4.1.1** (hotfix du
lendemain) circulaient dans une révision antérieure de ce guide ; ils proviennent des pages de notes de version du
site officiel, inaccessibles lors de la vérification du 9 septembre 2026 (HTTP 403). Le flux d'annonces officielles ne
comporte, après le 2 septembre, aucun billet de hotfix : la ligne « 4.4.1.1 » a donc été retirée de cette table (voir
« Ajustements annoncés après le lancement » plus bas). Les seuls numéros de version étayés pour l'été 2026 sont **4.4.0.0** et
**4.4.0.3**.

### Les mises à jour de vaisseaux de 2026 en détail (Kestrel Mk II, Lynx Highliner)

Les deux mises à jour de vaisseaux du premier semestre 2026 méritent d'être détaillées, chacune illustrant une facette
du modèle de sortie de Frontier.

**Kestrel Mk II Update — 24 février 2026** (billet « Kestrel Mk. II Update », 12:21 UTC). Core Dynamics livre un
vaisseau de combat de petit gabarit « designed for pilots who value agility, precision, and relentless firepower »,
disponible d'emblée en accès anticipé Arx. Deux modules inédits l'accompagnent : les **Mk II Agile Boost Thrusters**
(maniabilité accrue pendant le boost, avec un gain net de poussée latérale et verticale) et le **Mk II Plasma Shock
Accelerator** (canon à choc en tir par rafales, dommages de type plasma, effet plasma slug intégré). Formules Arx :
Standard 16 520, Stellar 33 000, Galactic 60 000 — le triptyque tarifaire que l'on retrouvera à l'identique pour le
Nomad et pour le Rhino. La mise à jour embarque surtout une **refonte massive de l'audio du combat à pied** (portée et
directionnalité des tirs, explosions et grenades, bruits de pas et de déplacement, réverbération intérieure,
occlusion), l'un des chantiers audio les plus larges de ces dernières années sur le jeu.

**Lynx Highliner Update — 28 avril 2026** (billet « Lynx Highliner Update Notes », 13:11 UTC). Zorgon Peterson entre
pour la première fois sur le marché des paquebots avec un vaisseau de classe moyenne accueillant jusqu'à
**225 passagers**, disponible **contre crédits au chantier naval** pour tous les possesseurs d'Odyssey — une exception
au modèle habituel, en compensation du report d'Operations annoncé six jours plus tôt. La formule **Standard est à
0 Arx** ; les upgrades Stellar (16 480 Arx) et Galactic (43 480 Arx) sont proposés à tarif réduit. Côté gameplay, la
mise à jour introduit les **cabines passagers Mk II** (Business et Economy, capacité multipliée par 1,5), de
nouvelles **missions d'évacuation de passagers en masse**, des variantes de missions passagers compatibles avec les
plateformes d'atterrissage moyennes, et une hausse du taux d'apparition des missions passagers dans les systèmes
colonisés. Pour le détail du gameplay passager, voir [12-transport.md](./12-transport.md).

### Suivi des jalons de la Colonisation de systèmes (2025)

La Colonisation de systèmes (*System Colonisation*) est la fonctionnalité structurante de cette période, annoncée le
20 octobre 2024. Ce guide ne détaille pas ses mécaniques de jeu (économie locale, construction, revenus par système,
BGS local) — voir le guide dédié [La Colonisation de systèmes](./18-colonisation.md) — mais retrace ici le fil des
jalons et patchs d'équilibrage successifs, tels que reconstitués à partir des tables de version ci-dessus :

| Date              | Version               | Étape                                                                                                    |
|-------------------|------------------------|-----------------------------------------------------------------------------------------------------------|
| 26 février 2025   | 4.1.0.0 (Trailblazers) | Lancement de la **bêta** de la Colonisation de systèmes                                                   |
| 29 septembre 2025 | 4.2.1.0                | Contenu lié à la Colonisation associé à la sortie du Type-11 Prospector (vaisseau minier)                 |
| 16 octobre 2025   | 4.2.1.2                | Ajout de la **protection des claims** (mesure anti-griefing sur les systèmes revendiqués)                 |
| 11 novembre 2025  | 4.2.2.0 (Dodec Update) | **Fin officielle de la bêta** : Frontier annonce que cette mise à jour « signif[ies] the end of the System Colonisation Beta » |
| 13 novembre 2025  | 4.2.2.1                | Correctif mineur post-sortie                                                                               |

Cette table recense les jalons visibles depuis l'historique de versions de ce guide ; elle n'a pas la prétention
d'être exhaustive sur les ajustements fins d'équilibrage (coûts de construction, rendement économique par système,
etc.). Pour le suivi détaillé et à jour de ces paramètres, se reporter à [18-colonisation.md](./18-colonisation.md).

## L'Operations Update et le Nomad (30 juin 2026)

### Le report d'Operations annoncé le 22 avril 2026

Le 22 avril 2026 (billet « An Update on Operations », 14:02 UTC), Frontier annonce le report d'Operations, « which
will now be arriving in June ». En compensation, le studio rend l'édition Standard du vaisseau suivant — le Lynx
Highliner, sorti six jours plus tard — immédiatement accessible en crédits in-jeu, les formules Stellar et Galactic
étant proposées en Arx à tarif réduit. Le même billet détaille par avance le contenu d'Operations : deux modes
(Mercenary et Powerplay), l'Operation Runner, la monnaie Merc Coin, et six scénarios alors désignés sous des noms de
travail (*Counter Attack*, *Burning Rescue*, *Megaship Massacre Reclaim*, *Megaship Massacre Strike*, *Surface
Rescue*, *Pirate Hunt*), tous renommés avant la sortie.

### La sortie de l'Operations Update le 30 juin 2026 (version 4.4.0.0)

L'**Operations Update** sort le **30 juin 2026** en version **4.4.0.0**, ses notes de version complètes étant publiées
le lendemain (billet « Operations Update », 1er juillet 2026, 14:01 UTC) : « The Operations Update is here. » Au
programme, pour le fil roadmap :

- **six opérations** au lancement : *Tactical Takedown*, *Firestorm Rescue*, *Reclamation Point*, *Biohazard
  Takedown*, *Rapid Response*, *Terminal Prosecution*, Frontier annonçant « more planned for future updates » ;
- l'**Operation Runner**, vaisseau de déploiement qui transporte l'escouade vers le système de l'opération et sert de
  point de réapparition et d'extraction ;
- la monnaie **Merc Coin** et le catalogue **MercGear** (blueprints et modules pré-ingénieurés) ;
- un déploiement en **Networking & Balancing Beta**, Frontier se réservant des ajustements serveurs fréquents ;
- des **ajustements de l'éclairage stellaire** (« Made adjustments to Stellar Lighting », Issue ID 45769) et du fond
  galactique, recalibré à partir d'images de référence réelles.

Le **Nomad**, premier vaisseau lancé depuis un vaisseau du jeu, sort le même jour en accès anticipé Arx : « This
update also brings with it the mighty Nomad! » Dévoilé le 2 juin 2026 (billet « Discover the Nomad », 13:03 UTC), il
est décrit comme « a small and compact ship-launched vessel which is built to explore planetary surfaces », équipé
d'un **Mk II Biological Scanner** détectant les signaux biologiques depuis le cockpit, et déployable « from a
compatible vessel bay, including MK I and MK II modules ». Sa conception (patins d'atterrissage de type hélicoptère,
moteurs pivotant à l'atterrissage), ses formules Arx, la liste des treize vaisseaux porteurs et son nom interne dans
le journal du jeu sont détaillés dans
[14-rhino-nomad.md, §3](./14-rhino-nomad.md#3-le-nomad-premier-vaisseau-lancé-depuis-un-vaisseau-30-juin-2026) plutôt que
dupliqués ici.

### L'Operations Update 3 du 9 juillet 2026 (version 4.4.0.3)

Le 9 juillet 2026 (billet « Operations Update — Update 3 », 10:24 UTC), un patch corrige les principaux défauts du
lancement : restitution des données d'exploration invendues antérieures à la maintenance du 2 juillet, bouton
« Resync Local Data » pour restaurer le cache des systèmes visités, réattribution différée des récompenses
d'Operations manquantes, restauration des inventaires à pied effacés. Cette version est **4.4.0.3**, numéro attesté
par les journaux de jeu (voir [14-rhino-nomad.md, §3.8](./14-rhino-nomad.md#38-nom-interne--lander01--du-nomad-et-effets-de-bord-sur-les-outils-tiers)).

Curiosité de communication à ne pas prendre pour deux mises à jour distinctes : le billet s'intitule « Operations
Update | Update 3 » mais son corps annonce que « The Operations Update 2 is now live » — une incohérence de la
communication officielle elle-même.

### Une septième opération, « Under Siege », le 2 septembre 2026

Le Rhino SRV Update (2 septembre 2026, 11:20 UTC) ajoute l'opération **« Under Siege »** : les commandants répondent à
un appel de détresse émis par un settlement planétaire, doivent lever un blocus et neutraliser les forces ennemies qui
tentent de s'en emparer. Elle figure au lancement parmi les problèmes connus, l'opération pouvant « sometimes complete
early ».

Ne pas confondre l'ensemble de ce contenu avec le mode « Opérations » à pied hérité d'Odyssey (missions de settlement,
infiltration, combat à pied), qui désigne un tout autre pan du jeu et fait l'objet d'un guide dédié :
[Guide complet des Opérations (Odyssey)](./13-operations.md).

## Le Rhino et le Surface Mining (2 septembre 2026)

Le **Rhino**, désigné « Vodel's Rhino SRV » par les notes officielles (billet « Rhino SRV Update », 2 septembre 2026,
11:20 UTC), est le premier nouveau SRV (véhicule de surface) depuis le Scorpion, sorti en 2021. Son rattachement au
constructeur Vodel est officiel ; la filiation de Vodel avec Core Dynamics, avancée ailleurs dans le corpus, n'est
étayée par aucun billet officiel. La fiche technique complète (déploiement, mécanique de minage détaillée, retours
communautaires) est disponible dans [14-rhino-nomad.md, §2](./14-rhino-nomad.md#2-le-rhino-srv-de-minage-de-surface-planétaire-vodel-2-septembre-2026) ;
cette section n'en reprend que le fil roadmap.

Le véhicule a été dévoilé le **6 août 2026** (billet « Beneath the Surface: Your First Look at the Rhino », 14:19 UTC)
pour une sortie alors annoncée « later this month » — elle est finalement intervenue le **2 septembre**.

### Caractéristiques du SRV Rhino

- Le plus gros SRV du jeu à ce jour, avec **3 places** (multi-crew jusqu'à trois occupants) ;
- Déployé non pas via la trappe à cargo classique, mais via la **baie de véhicule** (*vessel bay*) introduite par
  l'Operations Update — le même module que celui du Nomad, dont la liste de vaisseaux porteurs figure dans
  [14-rhino-nomad.md, §3.6](./14-rhino-nomad.md#36-déploiement-du-nomad--baie-de-véhicule-mk-i-13-vaisseaux-et-mk-ii-3-vaisseaux).

### La mécanique de Surface Mining introduite par le Rhino

Le Rhino introduit une mécanique entièrement nouvelle, le **Surface Mining** (minage de surface), distincte du minage
d'astéroïdes existant (voir [Le Minage](./20-minage.md) pour les mécaniques de minage classique) :

- Scanner de gisements planétaires intégré au véhicule ;
- Raffinerie embarquée ;
- Module de déploiement de « mining rigs » (installations de minage).

La mise à jour énumère par ailleurs une série de paramètres rééquilibrés (temps de minage de base, quantité extraite,
taux de recharge d'efficacité, densité des gisements). Frontier n'en publie pas les valeurs, et le billet ne dit pas si
ce rééquilibrage porte au-delà de la nouvelle boucle de surface — détail dans [14-rhino-nomad.md, §2.5](./14-rhino-nomad.md#25-le-minage-de-surface-planétaire-du-rhino--une-nouvelle-boucle-de-gameplay).

### Les treize nouvelles matières premières minables en surface

Le Rhino SRV Update introduit treize nouvelles matières premières exclusivement minables en surface (Bastnäsite, Deutérium,
Diamant, Hélium, Hélium-3, Iridium, Magnésite, Olivine, Periclase dunite, Quartz pyroxenite, Rubis, Saphir,
Thortveitite). La liste complète, classée par catégorie, est maintenue dans
[14-rhino-nomad.md, §2.6](./14-rhino-nomad.md#26-les-treize-nouvelles-matières-premières-minables-en-surface-avec-le-rhino) plutôt que dupliquée
ici.

Le billet cite le « temps de reconstitution d'un gisement » parmi les paramètres d'équilibrage, sans en publier la
valeur ni qualifier la rareté de ces gisements. Toute affirmation sur leur rythme de régénération ou sur l'intention de
Frontier en la matière reste donc à établir.

### Ajustements annoncés après le lancement du Rhino (problèmes connus)

Les notes officielles du 2 septembre 2026 listent trois **problèmes connus** que Frontier annonce vouloir corriger
« as soon as possible » :

| Problème connu au lancement                                          | Correctif annoncé                                   |
|-----------------------------------------------------------------------|------------------------------------------------------|
| Le Rhino ne collecte que **9 fragments** en minage de surface         | Passage à **12 fragments** (« this will be increased to 12 ») |
| L'opération « Under Siege » peut se terminer prématurément            | Hotfix annoncé, sans détail                          |
| L'interface d'escadrille en mode à pied est absente                   | Hotfix annoncé, sans détail                          |

Une révision antérieure de ce guide présentait le passage de 9 à 12 fragments comme **déjà livré** par un hotfix
4.4.1.1 daté du 3 septembre 2026. Aucun billet officiel relevé au 9 septembre 2026 ne confirme ce hotfix, le dernier
billet du flux restant celui du 2 septembre : la limite doit donc être considérée comme **encore à 9 fragments**,
avec une correction annoncée, jusqu'à vérification en jeu.

## Comprendre les prix : convertir les ARX en monnaie réelle

Les prix des vaisseaux et véhicules cités dans ce guide sont exprimés en **ARX**, la monnaie premium du jeu, achetable
en argent réel via la boutique intégrée ou la boutique Steam (jusqu'à 400 ARX/semaine peuvent aussi être obtenus
gratuitement en jouant). Les taux ne sont pas linéaires — les gros paquets sont proportionnellement moins chers — et
changent occasionnellement.

📸 **Instantané capturé le 8 septembre 2026** sur la boutique Steam d'*Elite Dangerous* (source :
[store.steampowered.com/itemstore/359320](https://store.steampowered.com/itemstore/359320/browse/)), à revérifier sur
la boutique officielle ou Steam avant tout achat :

| ARX     | Prix (EUR) | Prix approx. pour 1 000 ARX |
|---------|------------|------------------------------|
| 5 000   | 3,49 €     | ~0,70 €                      |
| 8 820   | 5,99 €     | ~0,68 €                      |
| 17 700  | 11,49 €    | ~0,65 €                      |
| 26 800  | 15,99 €    | ~0,60 €                      |
| 54 000  | 29,99 €    | ~0,56 €                      |
| 100 000 | 54,99 €    | ~0,55 €                      |

En appliquant à titre indicatif le taux du plus gros palier (~0,55 €/1000 ARX, le plus avantageux), les formules ARX
Early Access mentionnées plus haut représentent environ ce qui suit. La grille est identique pour le Kestrel Mk II
(février 2026), le Nomad (voir [14-rhino-nomad.md, §3.7](./14-rhino-nomad.md#37-coût-et-disponibilité-du-nomad--bundles-arx-de-16-520-à-60-000-arx)) et le Rhino
(voir [14-rhino-nomad.md, §2.7](./14-rhino-nomad.md#27-coût-et-disponibilité-du-rhino--bundles-arx-de-16-520-à-100-000-arx)) :

| Article                                  | Prix ARX    | Équivalent approximatif |
|-------------------------------------------|-------------|--------------------------|
| Édition Standard                          | 16 520 ARX  | ~9 €                     |
| Édition Stellar                           | 33 000 ARX  | ~18 €                    |
| Édition Galactic                          | 60 000 ARX  | ~33 €                    |
| Type-11 Prospector Galactic Mining Pack   | 100 000 ARX | ~55 €                    |
| Lynx Highliner Stellar (tarif réduit)     | 16 480 ARX  | ~9 €                     |
| Lynx Highliner Galactic (tarif réduit)    | 43 480 ARX  | ~24 €                    |

⚠️ Ces équivalents sont **indicatifs** : ils supposent l'achat du plus gros palier ARX (le plus rentable), ne tiennent
pas compte des ARX déjà en possession du joueur ni des variations de prix selon la devise ou la plateforme (Steam,
Epic, boutique Frontier).

## Community Goals et sorties de contenu (instantané de septembre 2026)

Les Community Goals ([CG](./00-glossaire.md)) rythment l'actualité du jeu en parallèle des grandes mises à jour
nommées et des sorties de véhicules décrites plus haut : ce sont des objectifs collectifs limités dans le temps,
proposés dans un système donné, auxquels tout commandant peut contribuer contre récompenses (crédits, décalques,
peintures exclusives) proportionnelles à son rang de contribution. Pour la mécanique générique des CG (paliers,
calcul des récompenses, historique), voir le guide dédié [Community Goals](./24-community-goals.md) — cette section
se limite à illustrer, avec un instantané daté, comment les CG s'articulent avec les sorties évoquées dans ce guide.

📸 **Instantané capturé le 8 septembre 2026** (source : [inara.cz/elite/community-goals](https://inara.cz/elite/community-goals/),
à revérifier en jeu ou sur Inara, la liste change en permanence) — deux CG étaient actives autour du lancement du
Rhino :

| CG                      | Système              | Progression         | Contributeurs | Récompense maximale                          |
|-------------------------|----------------------|----------------------|---------------|-----------------------------------------------|
| Laser Mining Support    | Metz Enterprise, Ega | Palier 1/9 (~14 %)   | ~10 570       | Jusqu'à 180 000 000 Cr + peintures exclusives |
| Surface Mining Support  | Metz Enterprise, Ega | Palier 4/9 (~29 %)   | ~3 944        | Jusqu'à 240 000 000 Cr + peintures et décalques |

Les deux CG invitaient les commandants à tester sur le terrain le nouveau rig de minage déployable et le SRV Rhino,
pour le compte de Wreaken Corporation et Vodel — un exemple typique de la manière dont Frontier articule ses CG avec
la sortie d'un nouveau contenu (ici le Rhino, voir plus haut) plutôt que de les traiter comme un système isolé.

Trois campagnes de distribution communautaire à Colonia venaient par ailleurs de s'achever (Carcosa et Randgnid à
100 %, Einheriar à 39,56 % avant clôture anticipée début août 2026), illustrant l'usage des CG également comme
habillage narratif du 10ᵉ anniversaire de Colonia (voir plus bas).

## Contenu annoncé mais pas encore sorti (au 9 septembre 2026)

| Contenu annoncé                                    | Annoncé le / depuis          | Statut au 9 septembre 2026                                                                                   | Prochaine vérification                                                    |
|-----------------------------------------------------|-------------------------------|-----------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| Passage de 9 à 12 fragments pour le minage de surface du Rhino | Billet « Rhino SRV Update », 2 septembre 2026, 11:20 UTC (problèmes connus) | Annoncé « as soon as possible », aucun billet de hotfix publié depuis                                          | Notes de version en jeu ; flux d'annonces officielles                     |
| Correctifs « Under Siege » (complétion prématurée) et interface d'escadrille à pied | Billet « Rhino SRV Update », 2 septembre 2026, 11:20 UTC | Annoncés, non livrés                                                                                            | Notes de version en jeu                                                   |
| Récompenses d'Operations manquantes (Merc Coins, crédits, matériaux, inventaires) | Billet « Operations Update — Update 3 », 9 juillet 2026, 10:24 UTC | Attribution rétroactive promise « at a later time », sans date                                                  | Notes de version en jeu                                                   |
| Nouvelles opérations au-delà des sept existantes    | Billet « Operations Update », 1er juillet 2026, 14:01 UTC (« we have more planned for future updates ») | Annoncé sans calendrier                                                                                          | Dev Logs mensuels                                                          |
| « Feature reboot » d'un système ancien, promis pour l'automne 2026 | Annoncé le 17 février 2026 (feuille de route annuelle, voir [14-rhino-nomad.md, §1.1](./14-rhino-nomad.md#11-la-feuille-de-route-2026-annoncée-le-17-février-2026-six-véhicules)) | Non détaillé à ce jour                                                                                          | Dev Log de l'automne 2026                                                 |
| Deux véhicules d'automne et d'hiver 2026            | Feuille de route du 17 février 2026 (six véhicules dans l'année) | Non identifiés à ce jour ; trois sorties sur six sont livrées (Kestrel Mk II, Lynx Highliner, Nomad) et le Rhino en constitue la quatrième | Dev Logs mensuels                                                          |
| Prochaine grande saison après Operations            | Non annoncée                  | Non annoncée — extrapolation de cadence uniquement (voir ci-dessous)                                            | Annonce officielle ; aucune date engagée                                   |

Le rythme observé sur les quatre saisons livrées (Ascendancy → Trailblazers → Vanguards → Operations) reste la seule
base pour anticiper la prochaine grande saison ; il s'agit d'une extrapolation à partir de la cadence passée, non
d'une annonce officielle — et cette cadence s'est allongée, la dernière saison ayant elle-même été reportée (voir plus
haut).

## Communications officielles de Frontier et canaux (Dev Log, GalNet)

### Le Dev Log mensuel de Frontier

Frontier publie un Dev Log mensuel (« Community Updates ») sur elitedangerous.com/news, également relayé sur le flux
d'annonces officielles. Le format est installé **au moins depuis février 2026** : les éditions de février, mai, juin,
juillet et août 2026 sont attestées, les Dev Logs de mai et de juillet étant explicitement cités par les billets
consacrés au Nomad et au Rhino. Chaque édition comprend généralement :

- Des interviews de l'équipe (game designers, art director, producteurs) ;
- Des aperçus du contenu à venir ;
- Une FAQ communautaire évolutive ;
- Un récapitulatif GalNet du mois ;
- Un point sur les ventes cosmétiques ;
- Un « Influencer Spotlight » mettant en avant l'Elite Partner Program, le programme de créateurs de contenu partenaires
  bénéficiant d'un accès anticipé aux nouveautés, avant même la sortie en ARX Early Access.

Deux éditions ont directement structuré la feuille de route 2026, et méritent d'être citées comme sources d'annonce à
part entière :

| Édition                         | Date                          | Contenu annoncé                                                                                                                   |
|---------------------------------|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| **Developer Log de février**    | 17 février 2026, 10:06 UTC    | Programme de l'année à venir, dévoilement du premier vaisseau de 2026 (Kestrel Mk II, sorti une semaine plus tard), bilan d'un an de Colonisation de systèmes, et point d'étape sur Operations |
| **August Dev Log**              | 27 août 2026, 10:04 UTC       | Premières images en jeu du Rhino, premiers détails sur le minage de surface, et aperçu de la prochaine opération — « Under Siege », sortie six jours plus tard |

Un Dev Log annonce donc régulièrement du contenu avant sa sortie : c'est, avec les notes de version, la source
primaire naturelle d'un suivi de feuille de route.

### GalNet, le fil d'actualité in-fiction du jeu

GalNet est le fil d'actualité in-fiction du jeu (daté en l'an 3312 dans l'univers de fiction). Frontier l'utilise pour
habiller narrativement chaque sortie réelle — par exemple, l'article « Vodel Reveals New SRV Rhino » fait écho au
lancement réel du Rhino — et pour animer des événements communautaires saisonniers. Le 10ᵉ anniversaire de la
**fondation de Colonia, survenue le 9 septembre 2016** (et non 2015 comme on le lit parfois dans le corpus
communautaire — une erreur d'un an corrigée ici après vérification via
[00-chronologie-canonique.md, point 10](./00-chronologie-canonique.md#10-fondation-de-colonia--10e-anniversaire)),
a ainsi été célébré en jeu de juillet à août 2026, avec des initiatives narratives (distribution de commodités,
mégamarché à Jaques Station) — voir aussi la section Community Goals ci-dessus pour les campagnes associées.

Les dates GalNet affichées sur le site (par exemple « 3 septembre 3312 ») sont des dates internes à la fiction du jeu,
et correspondent terme à terme aux dates réelles de publication — l'écart de calendrier fictif suit le calendrier réel
jour pour jour.

### Refonte du site officiel Elite Dangerous (annoncée en août 2026)

Une refonte du site officiel a été annoncée en août 2026, avec notamment :

- Une nouvelle section « **Elite Academy** », destinée aux nouveaux joueurs et aux joueurs de retour après une pause ;
- Une boutique en ligne réorganisée.

### Événements et initiatives communautaires

- **#StellarScreenshots** : concours communautaire hebdomadaire, récompensant les participants par des paint jobs
  exclusifs pour l'Asp Explorer ; relayé via un fil du forum Frontier, X (Twitter) et le Discord « Frontier Unlocked ».
- **3ᵉ expédition Distant Worlds** : expédition communautaire d'exploration collective de régions reculées de la
  galaxie, achevée en mai 2026 avec un décal commémoratif officiel.
- **Operation Warbucks** : stream caritatif ayant réuni 36 streamers Twitch en mai 2026, pour lever plus de 16 000 $ au
  profit d'associations de lutte contre le cancer.

## Tendances de développement et orientation d'Elite Dangerous (2024-2026)

Plusieurs tendances de fond se dégagent de cette période :

- **Le déplacement de l'effort vers la surface planétaire.** Les deux véhicules de l'été 2026 visent le sol, chacun sur
  une niche précise : le Nomad pour l'exobiologie de proximité (juin), le Rhino pour le minage de surface (septembre).
  Frontier a même créé pour l'occasion une catégorie inédite, le vaisseau lancé depuis un vaisseau, et un module de
  transport commun — signe d'un investissement soutenu dans la diversification des véhicules de surface plutôt que
  dans de nouveaux gros vaisseaux capitaux.
- **Modèle économique constant.** Chaque nouveau véhicule ou vaisseau sort d'abord en accès anticipé payant (ARX Early
  Access — voir la table de conversion ci-dessus), avant de devenir accessible contre crédits in-jeu plusieurs mois plus
  tard. Cette logique de pré-achat cosmétique/anticipé est assumée par Frontier comme le modèle de financement du
  développement continu, le jeu de base restant par ailleurs gratuit d'accès aux mises à jour majeures. La grille est
  d'ailleurs stable d'une sortie à l'autre — 16 520 / 33 000 / 60 000 Arx pour le Kestrel Mk II, le Nomad et le Rhino.
  Le Lynx Highliner fait exception : disponible en crédits dès sa sortie, en compensation du report d'Operations.
- **Transparence sur les défauts au lancement.** Frontier publie désormais, dans les notes de version elles-mêmes, une
  rubrique « Known Issues » énumérant les défauts identifiés et les correctifs prévus — trois cas au lancement du
  Rhino, dont le plafond de collecte à 9 fragments au lieu de 12 (voir plus haut). Le suivi de ces engagements reste à
  vérifier en jeu : à la date de rédaction, aucun billet de hotfix ne les couvre.
- **Livraison assumée en plusieurs vagues.** Operations est sorti en « Networking & Balancing Beta » revendiquée, avec
  un Update 3 correctif neuf jours plus tard, puis une septième opération deux mois après. Le report annoncé en avril
  et cette montée en charge progressive dessinent une politique de sortie étalée plutôt que d'un bloc.
- **Investissement visuel continu malgré l'ancienneté du jeu.** La refonte de l'éclairage stellaire (« Stellar
  Lighting ») et du fond galactique a bien été **livrée avec l'Operations Update** : les notes du 1er juillet 2026
  mentionnent explicitement « Made adjustments to Stellar Lighting (Issue ID: 45769) », un ajustement du colorimétrage
  du fond galactique et son rééquilibrage « using real world reference images ». Frontier la présentait comme une
  réponse à une demande de longue date de la communauté, qui souhaitait retrouver une diversité chromatique perdue
  lors de l'arrivée du gameplay à pied (Odyssey).
- **Renforcement de la transparence éditoriale.** Rythme mensuel systématique de Dev Logs détaillés avec interviews
  nommées de l'équipe et FAQ vivante mise à jour au fil des retours — une densité de communication supérieure à
  d'autres périodes de la vie du jeu.

## Voir aussi

- [Chronologie canonique du corpus](./00-chronologie-canonique.md) — dates vérifiées et sources croisées pour les
  événements évoqués ici (Ascendancy, Colonisation, Colonia, Operations).
- [Powerplay](./02-powerplay.md) — détail de la refonte Powerplay 2.0 apportée par l'extension Ascendancy.
- [Vaisseaux](./03-vaisseaux.md) — fiches techniques des vaisseaux existants, à mettre en regard des nouveautés
  listées ici.
- [Les Ingénieurs](./06-ingenieurs.md) — pour les blueprints et matériaux d'ingénierie classiques.
- [Guide complet des Opérations (Odyssey)](./13-operations.md) — le mode de jeu à pied hérité d'Odyssey, homonyme
  mais distinct du contenu multijoueur Operations sorti le 30 juin 2026, et point d'entrée pour le détail des
  opérations en escouade.
- [Guide complet du Rhino et du Nomad](./14-rhino-nomad.md) — détail technique et chronologie fine des deux véhicules
  de l'été 2026 : conception et déploiement du Nomad, baies de véhicule Mk I et Mk II, minage de surface du Rhino.
- [Le Transport de passagers](./12-transport.md) — gameplay passager, enrichi par le Lynx Highliner et ses cabines
  Mk II (avril 2026).
- [La Colonisation de systèmes](./18-colonisation.md) — mécaniques complètes de la fonctionnalité de colonisation,
  dont le suivi des patchs est amorcé plus haut.
- [Porte-vaisseaux de joueur (Fleet Carriers)](./19-fleet-carriers.md) — pour approfondir le Squadron Carrier
  mentionné dans la saison Vanguards.
- [Le Minage (Mining)](./20-minage.md) — mécaniques de minage classique (astéroïdes), à distinguer du minage de
  surface introduit par le Rhino.
- [Le Background Simulation (BGS)](./00-glossaire.md) — [BGS](./00-glossaire.md) et son interaction avec la
  Colonisation, détaillés dans [21-bgs.md](./21-bgs.md).
- [Escadrons de joueurs (Squadrons)](./22-squadrons.md) — détail de la refonte des escadrons apportée par la saison
  Vanguards.
- [Community Goals](./24-community-goals.md) — mécanique générique des CG, résumée plus haut.

Note : les guides 18 à 25 ci-dessus sont en cours d'intégration au corpus au moment de la rédaction de cette section ;
leur contenu final n'a pas pu être vérifié depuis ce document.

## Sources

### Sources primaires — annonces officielles de Frontier Developments

Relevées le 9 septembre 2026 sur le flux Steam News d'*Elite Dangerous* (appid 359320), via l'API publique
`api.steampowered.com/ISteamNews/GetNewsForApp/v2/`, qui republie mot pour mot les annonces de Frontier :

- « Elite Dangerous | Rhino SRV Update » — 2 septembre 2026, 11:20 UTC.
- « Elite Dangerous | August Dev Log » — 27 août 2026, 10:04 UTC.
- « Beneath the Surface: Your First Look at the Rhino » — 6 août 2026, 14:19 UTC.
- « Elite Dangerous | Operations Update | Update 3 » — 9 juillet 2026, 10:24 UTC.
- « Elite Dangerous | Operations Update » — 1er juillet 2026, 14:01 UTC.
- « Discover the Nomad » — 2 juin 2026, 13:03 UTC.
- « Elite Dangerous | Lynx Highliner Update Notes » — 28 avril 2026, 13:11 UTC.
- « Elite Dangerous | An Update on Operations » — 22 avril 2026, 14:02 UTC.
- « Elite Dangerous | Kestrel Mk. II Update » — 24 février 2026, 12:21 UTC.
- « Elite Dangerous | Developer Log » — 17 février 2026, 10:06 UTC.

### Autres sources

- https://www.elitedangerous.com/news
- https://www.elitedangerous.com/news/updates
- https://www.elitedangerous.com/news/elite-dangerous-august-dev-log-2026
- https://www.elitedangerous.com/news/elite-dangerous-july-dev-log-2026
- https://www.elitedangerous.com/news/elite-dangerous-june-dev-log-2026
- https://www.elitedangerous.com/news/elite-dangerous-may-dev-log-2026
- https://www.elitedangerous.com/news/rhino-available-now-arx-early-access
- https://www.elitedangerous.com/news/beneath-surface-your-first-look-rhino
- https://www.elitedangerous.com/news/galnet
- https://www.elitedangerous.com/news/updates/4-4-1-0
- https://www.elitedangerous.com/news/updates/4-4-1-1
- https://www.elitedangerous.com/news/updates/4-1-0-0 (patch notes Trailblazers, confirmant la date du 26 février 2025)
- https://www.elitedangerous.com/update-notes/4-2-2-0 (patch notes Dodec Update, confirmant la fin de bêta de la Colonisation)
- https://store.steampowered.com/itemstore/359320/browse/ (paliers de prix ARX, capturés le 8 septembre 2026)
- https://inara.cz/elite/community-goals/ (Community Goals actives, capturées le 8 septembre 2026)

### Réserve de vérification

Les pages de notes de version du site officiel (elitedangerous.com/news/updates), Fandom et Reddit renvoient des
erreurs HTTP 403 depuis cette session : les numéros de version 4.4.1.0 et 4.4.1.1 attribués au Rhino et à son hotfix
n'ont pas pu y être vérifiés, et le hotfix lui-même n'est confirmé par aucune annonce officielle relevée.
