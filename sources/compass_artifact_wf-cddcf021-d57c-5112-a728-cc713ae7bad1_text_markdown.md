# Documentation complète Elite Dangerous — édition août 2026 (PC / Odyssey / Live)

*Date de rédaction : 12 août 2026. Toutes les valeurs en crédits (Cr) et Cr/h sont des estimations communautaires sauf mention « donnée officielle ». Le jeu utilise une économie vivante : les chiffres varient. Niveaux de confiance : [OFFICIEL] = patch notes/site Frontier ; [COMMUNAUTÉ] = mesure récente de joueurs/créateurs ; [ESTIMATION] = ordre de grandeur.*

---

## TL;DR
- **Argent** : en 2026 les trois piliers non-exploités les plus rentables sont l'**exobiologie** (jusqu'à ~150–300 M Cr/h en zone vierge, meilleure activité solo sûre), le **laser mining Platinum** (100–400 M Cr/h [COMMUNAUTÉ], surtout en Type-11 Prospector) et le **stacking de missions massacre/trade en wing** (jusqu'aux milliards par session en groupe). Le core mining (Void Opals/LTD) reste nerfé depuis 2021 ; l'ancien farm d'Orthrus/Spires est en zone grise et instable depuis la fin de la guerre Thargoïde.
- **Combat** : vous perdez surtout à cause d'erreurs de fondamentaux (gestion des pips SYS/WEP/ENG, throttle hors « blue zone », pas de FA-off ponctuel, boucliers/thrusters non ingénierés, mauvaise séquence lasers→cinétique). La méta 2026 reste **Overcharged** sur armes, boucliers **Bi-Weave Reinforced/Thermal Resistant** ou **Prismatic**, thrusters **Dirty Drive Tuning + Drag Drives**, distributeur **Charge Enhanced + Super Conduits**. Vaisseaux rois : **Python Mk II** (médium combat), **Corsair** (multirôle), **Fer-de-Lance**, **Federal Corvette**/**Imperial Cutter** (large).
- **Exobiologie & colonisation** : équipez un **Mandalay** (SCO natif, ~75–80 ly de saut ingénieré) et utilisez **Spansh Exobiology** + **Elite Observatory**. La colonisation (Trailblazers, 2025, fortement itérée en 2026) est un **puits de temps, pas une source de revenus** : le revenu d'architecte est de l'ordre de quelques centaines de milliers de Cr/semaine — faites-la pour l'accomplissement et les ports personnalisés, pas pour l'argent.

---

## Contexte 2026 : ce qu'il faut savoir avant tout

Frontier a publié une **roadmap 2026** via le dev log du **16 février 2026** [OFFICIEL] annonçant **six vaisseaux** sur l'année (le terme employé est « vessels » et non « ships », relevé comme notable par la presse) et le mode **Operations** :
- **Phase 1 (24 février 2026)** : mise à jour **Kestrel Mk II** (patch 4.3.1.0), petit chasseur de combat Core Dynamics.
- **Phase 2 (prévue avril, Operations)** : la roadmap plaçait initialement **Operations en avril** ; le mode a été **reporté à juin**. En compensation, le paquebot **Lynx Highliner** a été offert gratuitement le **28 avril 2026**, avec retour des missions de sauvetage dans les stations en feu.
- **Phase 3 (été 2026)** : mise à jour **Operations** — lancée le **30 juin 2026** [OFFICIEL], scénarios instanciés type « raid » pour 1 à 4 commandants, à pied dans des mégavaisseaux / sur planètes / en espace. Ajout du **Nomad** (véhicule lancé depuis vaisseau, SLV). Nouvelle monnaie **Merc Coin**. Deux vaisseaux prévus cette phase.
- **Phase 4 (automne 2026)** : « reboot » d'une fonctionnalité cœur, non précisée.
- **Phase 5 (hiver 2026)** : un vaisseau supplémentaire.

**Guerre Thargoïde** : le dernier Titan (**Cocijo**) est devenu vulnérable le 12 décembre et sa destruction a été confirmée le **18 décembre 3310 (2024)**, libérant **Sol** (Galnet : « Titan Cocijo Destroyed, Sol Liberated ») [OFFICIEL]. En 2026 il n'y a **plus de Titan actif** ; le combat AX subsiste de façon résiduelle (sites de Spires, nébuleuses Witch Head/California/Coal Sack, restes de Titans à piller). **Le grand loop de farm AX de guerre a donc disparu** — un point majeur que beaucoup de guides ne reflètent pas.

**Nouveaux vaisseaux 2024-2026 à connaître** : **Python Mk II** (accès anticipé ARX le 7 mai 2024 pour 16 250 ARX, puis crédits pour les possesseurs d'Odyssey le **7 août 2024** — premier nouveau vaisseau depuis le Mamba de 2018), Type-8 Transporter, Mandalay (explorateur), Cobra Mk V, **Corsair** (Gutamaya, ARX avril 2025 / crédits juillet 2025), **Panther Clipper Mk II** (cargo lourd), **Type-11 Prospector** (minage dédié, oct. 2025), **Caspian** (explorateur, déc. 2025), **Kestrel Mk II** (fév. 2026), **Nomad** (SLV, juin 2026).

---

# GUIDE 1 — PROGRESSION FINANCIÈRE PAR JALONS

### Avertissement méthodo
Les Cr/h ci-dessous sont des **ordres de grandeur** issus de mesures communautaires 2025-2026. Un débutant réalisera 30–50 % de ces valeurs ; un joueur optimisé (build ingénieré, itinéraire Spansh, connaissance des hotspots) atteindra le haut de fourchette.

## Tableau de synthèse Cr/h par méthode (2026)

| Méthode | Cr/h estimé | Confiance | Investissement ship | Prérequis | Risque | Répétitivité |
|---|---|---|---|---|---|---|
| Exobiologie (zone vierge, first footfall x5) | 150–300 M | [COMMUNAUTÉ] | 15–50 M (Mandalay) | Odyssey, Artemis Suit | Faible | Élevée |
| Exobiologie (bulle, déjà découvert) | 40–120 M | [COMMUNAUTÉ] | idem | Odyssey | Très faible | Élevée |
| Laser mining Platinum (Type-11) | 100–400 M | [COMMUNAUTÉ] | 60–200 M | aucun | Faible-moyen | Élevée |
| Core mining (Painite/monazite) | 50–150 M | [COMMUNAUTÉ] | 60–150 M | aucun | Moyen | Élevée |
| Tritium mining (T11) | 30–80 M valeur | [COMMUNAUTÉ] | 60–150 M | Fleet Carrier utile | Faible | Élevée |
| Missions massacre stackées (solo) | 40–100 M | [COMMUNAUTÉ] | 50–300 M combat ship | rangs faction | Moyen | Moyenne |
| Missions massacre/trade en WING | jusqu'à plusieurs milliards/session | [COMMUNAUTÉ] | idem x3 joueurs | wing | Moyen | Moyenne |
| Passenger/tourisme (stacking) | 50–100 M | [COMMUNAUTÉ] | 30–200 M | cabines | Faible | Moyenne |
| Robigo (passagers « shady ») | ~90 M | [COMMUNAUTÉ] | petit ship léger | aucun | Faible | Très élevée |
| Bounty hunting HazRES | 20–60 M | [COMMUNAUTÉ] | 50–300 M | aucun | Moyen | Moyenne |
| Conflict Zones (High) | 20–40 M | [COMMUNAUTÉ] | combat ship | aucun | Élevé | Moyenne |
| Trading (Cutter/T9/Panther) | 10–40 M/run | [COMMUNAUTÉ] | 150 M–1 Md+ | aucun | Faible | Élevée |
| Fleet Carrier trading (arbitrage) | 300 M+/run | [COMMUNAUTÉ] | ~5 Md (FC) | Fleet Carrier | Faible | Moyenne |
| Powerplay 2.0 mérites (revenus annexes) | variable + care packages | [OFFICIEL] | pledge | pledge | variable | Moyenne |
| Colonisation (tax d'architecte) | ~0,1–0,6 M/semaine/système | [COMMUNAUTÉ] | très élevé | Odyssey | Faible | — |

## Jalon 1 — Atteindre 10 millions de Cr

1. **Bounty hunting en RES basse/haute** — Viper Mk IV ou Vulture (~5 M équipé). ~5–15 M Cr/h. Risque faible en Low RES, sans ingénierie. Temps vers 100 M : 8–15 h.
2. **Road to Riches (exploration + scan)** — Diamondback Explorer ou AspX avec DSS ; Spansh Road to Riches. ~10–20 M Cr/h. Aucun risque. Débloque aussi Felicity Farseer (vente de données d'exploration).
3. **Missions de transport/données simples** — Cobra Mk III / Type-6. ~5–10 M Cr/h. Idéal pour monter la réputation de faction (utile pour l'ingénierie et les missions massacre plus tard).

**Recommandation** : commencez par Road to Riches — cela finance ET débloque l'ingénierie FSD (Farseer), fondement de tout le reste.

## Jalon 2 — 10 M → 100 M

1. **Laser mining Platinum** — Python (Mk I) ou Type-8, puis Type-11 Prospector. Cherchez un **double/triple overlap hotspot** de Platinum en anneau **metallic** (pas metal-rich). 100–250 M Cr/h possible. Vendez en station à forte demande. [COMMUNAUTÉ]
2. **Exobiologie dans la bulle** — Mandalay + Artemis Suit ; suivez Billionaire's Boulevard / Spansh Exobiology. 40–120 M Cr/h. Zéro combat.
3. **Passenger stacking / tourisme** — Dolphin (économique) ou Orca/Beluga. Empilez des missions vers la même destination. 50–100 M Cr/h.

## Jalon 3 — 100 M → 1 milliard

1. **Exobiologie en expédition (zone vierge)** — première découverte = **x5 la valeur** [OFFICIEL wiki : « First Logged... five times the amount »]. Une seule expédition de plusieurs jours peut rapporter 1–5 Md. C'est la méthode reine solo.
2. **Laser mining Platinum optimisé** en Type-11 avec Fleet Carrier tampon. 200–400 M Cr/h.
3. **Missions massacre stackées** en Conflict Zones/RES avec un bon combat ship (Python Mk II). 40–100 M Cr/h + matériaux d'ingénierie.

## Jalon 4 — 1 Md → 10 Md

1. **Achetez un Fleet Carrier** (~5 Md) puis faites de l'**arbitrage de commodités** / tritium ; 300 M+/run en Cutter/Panther Clipper Mk II depuis le FC.
2. **Exobiologie longue** (Colonia, nébuleuses) — sessions de plusieurs milliards.
3. **Massacre missions en WING** — le vrai accélérateur : partage des primes et des récompenses de mission entre 3 joueurs, jusqu'aux milliards par session.

## Jalon 5 — 10 Md → 100 Md et au-delà

À ce stade c'est du volume et de la répétition : rotations FC de trading/tritium, expéditions exobio massives, wing massacre en continu. Il n'existe **pas de « money printer » légitime** : les exploits historiques (stacking abusif d'anciennes versions de Robigo, farm de crashed Anaconda, relog HGE, farm Orthrus/Spires) ont soit été corrigés soit sont en zone grise instable.

## Ce qui a été nerfé/modifié (argent)
- **Core mining Void Opals / LTD** : nerfé en profondeur depuis mars 2021 ; « graphs are not relevant anymore » [COMMUNAUTÉ]. Ce n'est plus la ruée aux diamants.
- **Painite** : nerfé il y a plusieurs années ; le **laser Platinum** est devenu le méta minage.
- **Tritium** : longtemps pénible ; **amélioré/« fixé » avec le Type-11 Prospector** [COMMUNAUTÉ], désormais aussi rapide que le platine selon des joueurs.
- **Farm AX Orthrus/Spires** : autrefois 400–500 M Cr/h en groupe [COMMUNAUTÉ] ; devenu instable/marginal depuis la fin de la guerre (plus de Titan actif).
- **Mérites Powerplay** : rééquilibrés en 2025 (Trailblazers U3, 29-30 avril 2025) — bonus offensif (+5 % undermining/acquisition), malus défensif (-35 % reinforcement), partiellement révisé en U3.4 (barème glissant). Les mérites **ne décroissent plus** en Powerplay 2.0 [OFFICIEL].
- **Juin-août 2026** : **aucune preuve** d'un nerf/buff numérique du minage, de l'exobiologie ou du bounty hunting dans les patchs Operations (30 juin) et suivants. Les patchs de la période sont surtout des correctifs (restauration de récompenses Operations manquantes, latence). La grande nouveauté monétaire est le **Merc Coin** (voir ci-dessous), plafonné et non « farmable ».

## Parcours optimal recommandé
1. **Road to Riches** → 10-30 M + débloque Farseer (FSD).
2. **Ingénierie FSD (Farseer) d'abord**, puis un ship minier ou Mandalay.
3. **Exobiologie / laser mining** jusqu'au premier milliard.
4. **Fleet Carrier** vers 5-6 Md → arbitrage/tritium en base avancée.
5. **Wing massacre** avec des amis pour franchir 10 Md+.

**Priorité ingénierie** : **FSD > Thrusters (Dirty Drive) > Power Distributor (Charge Enhanced) > Boucliers > Power Plant > Armes.**

---

# GUIDE 2 — COMBAT SPATIAL (correction d'erreurs)

## A. Pourquoi vous perdez : checklist de diagnostic
1. **Pips mal gérés** : le distributeur SYS/ENG/WEP doit être piloté en continu. 4 pips SYS ≈ résistance bouclier fortement accrue. Erreur n°1 débutant : laisser 2-2-2 en permanence.
2. **Throttle plein gaz** : hors de la **blue zone** (portion bleue du tachymètre, ~40-70 %) votre rayon de virage explose. Réglez le throttle dans le bleu en dogfight.
3. **Pas de FA-off ponctuel** : le **Flight Assist Off** momentané (toggle) permet des rotations serrées et le « reverski » (reverse thrust pour rester face à la cible). Entraînez-le par petites touches, pas en permanence.
4. **Boucliers/thrusters non ingénierés** : un ship non ingénieré perd contre un ship ingénieré à skill égal.
5. **Mauvaise séquence d'armes** : lasers pour casser le bouclier, **puis** cinétique (multi-cannons) pour fondre la coque.
6. **Chaleur ignorée** : gérez heat sinks ; silent running seulement en urgence.
7. **Pas de désengagement** : sachez rompre (boost + charge FSD, ou high-wake).

## B. Fondamentaux de pilotage
- **Blue zone** : virage optimal quand le throttle est dans la portion bleue.
- **Pips dynamiques** : 4 SYS en défense, 4 WEP en burst offensif, 4 ENG pour fuir/boost. Basculez sans cesse.
- **Reverski / reverse thrust** : ralentir/reculer pour garder la cible dans le viseur.
- **High-g turn** : virage dans le plan vertical (pitch), plus rapide que le yaw.
- **Chaff** : brouille les armes **gimballed** et **turreted** adverses — déclenchez-le quand l'ennemi vous canarde au gimballed.
- **Heat sink** : évacue la chaleur (couvre le spin-up des SCB, le silent running).
- **Point defence** : abat missiles et torpilles.
- **Rupture** : 4 ENG, boost à l'opposé, charge FSD (high wake vers un autre système pour semer un interdicteur).

## C. Ciblage et sous-systèmes
- Ciblez **Power Plant** (met la cible en détresse), **Drives** (immobilise), **FSD** (empêche la fuite).
- **Gimballed** : visée assistée mais neutralisée par le chaff. **Fixed** : dégâts max, exige précision, insensible au chaff. **Turreted** : faible dégât, pratique en multi-crew/gunner NPC.
- Utilisez le **target subsystem** (sous-menu de ciblage) pour concentrer le feu.

## D. Comparatif des armes (2026)

| Arme | Type dégât | Rôle | Note méta |
|---|---|---|---|
| Beam laser | Thermique | Casse-bouclier soutenu | Thermal Vent = refroidit (heatsink gratuit) |
| Pulse laser | Thermique | Efficace, peu de chaleur | Overcharged/Efficient |
| Burst laser | Thermique | Compromis | — |
| Multi-cannon | Cinétique | Fond la coque | **Overcharged + Corrosive Shell/Autoloader** |
| Frag cannon / Pacifier | Cinétique | Brawler courte portée | Excellent sur Python Mk II |
| Railgun | Cinétique/thermique | Sniping sous-systèmes | Feedback Cascade / Super Penetrator |
| Plasma Accelerator | Absolu | Burst énorme | Difficile à viser ; Overcharged/Oversized |
| Cannon | Cinétique | Longue portée | — |
| Missiles (seeker/dumbfire) | Explosif | Anti-coque | Seeker = suivi, Dumbfire = tir direct |
| Torpedo | Explosif | Anti-gros | Pack-Hound viable |
| Mines | Explosif | Défensif | Niche |

**Synergie type** : 2 beam lasers (bouclier) + 2-4 multi-cannons Overcharged/Corrosive (coque). Le **Corrosive Shell** réduit la dureté de coque et amplifie tous les dégâts.

**Armes AX/Guardian (Thargoïdes, résiduel 2026)** : Enhanced AX Multi-cannons, AX Missile Racks, Guardian Gauss Cannon, Shard Cannon, Plasma Charger. **Patch 18.07 [OFFICIEL] : la réduction de dégâts des armes Guardian a été supprimée, et tous les modules Guardian peuvent recevoir l'Anti-Guardian Zone Resistance sans pénalité.**

## E. Ingénierie de combat — méta 2026
- **Boucliers** : Bi-Weave + **Reinforced** ou **Thermal Resistant** ; ou **Prismatic** (Powerplay) pour tank max. Boosters : Resistance Augmented / Heavy Duty.
- **Blindage** : **Heavy Duty + Deep Plating**.
- **Power Distributor** : **Charge Enhanced + Super Conduits**.
- **Thrusters** : **Dirty Drive Tuning + Drag Drives**.
- **Power Plant** : **Overcharged** (dégâts) ou **Low Emissions** (froid/SCO).
- **Modules Guardian** : Shield/Module/Hull Reinforcement Packages (SRP/MRP/HRP).

**Ordre de déblocage des ingénieurs** :
1. **Felicity Farseer** (FSD, thrusters G5 ; rang Scout requis) — le premier, toujours.
2. **The Dweller** (power distributor, lasers).
3. **Tod « The Blaster » McQuinn** (multi-cannons, railguns).
4. **Elvira Martuuk** (boucliers, FSD).
5. **Selene Jean** (blindage) / **Didi Vatermann** (bouclier boosters).
6. Puis Guardian (via sites Guardian, Ram Tah).

Astuce : épinglez (pin) un blueprint par ingénieur pour l'ingénierie à distance.

## F. Builds concrets 2026

**Débutant petit budget (~5-8 M)** : **Vulture** — 2 hardpoints Large ; 1 beam laser gimballed + 1 multi-cannon gimballed ; boucliers D-rated + 1 booster ; Dirty Drives G1-3. Excellent en Low/Med RES.

**Intermédiaire (~50-80 M)** : **Krait Mk II** ou **Alliance Chieftain** — 2 beam + 3 multi-cannons Overcharged/Corrosive ; Bi-Weave Reinforced ; distributeur Charge Enhanced. Fighter bay possible sur Krait.

**Haut de gamme médium** : **Python Mk II** — 4 hardpoints Class 3 + 2 Class 2, agilité de médium mais frappe de large. **Build brawler roi : 4x Pacifier (frag) + Corrosive**, à jouer comme un « gros Vulture » en courte portée [COMMUNAUTÉ]. Attention : **convergence des hardpoints médiocre** contre petites cibles ; **distributeur réduit à size 6** (vs size 7 du Python Mk I) — privilégiez multi-cannons/frags plutôt qu'une pléthore de lasers énergivores.

**Multirôle / alternative** : **Corsair** (Gutamaya) — **3 Large + 3 Medium hardpoints tous sur le fuselage** (convergence serrée), Power Plant / Thrusters / Power Distributor **size 7**, **FSD size 5 SCO**, jusqu'à **10 optional internals**. Supérieur en polyvalence (combat/trade/exploration) mais **ne détrône pas le Python Mk II en combat pur** [COMMUNAUTÉ ; la prémisse « power crept the Python Mk II » circule mais est exagérée — le consensus des joueurs expérimentés est « the corsair can't hold a torch to the Python 2 » en combat].

**Nouveau Kestrel Mk II** (petit combat, fév. 2026) : **3 Large (Class 3) + 2 Small (Class 1) + 4 utility** ; Power Plant / Distributor **size 5** ; **FSD SCO** ; arme signature **Mk II Plasma Shock Accelerator** (« Burst fire Shock Cannon with plasma damage type and built in plasma slug functionality » [OFFICIEL 4.3.1.0]) qui **consomme le carburant** comme munition. Très agile ; concurrent du Vulture sur petit gabarit.

**Large haut de gamme** : **Federal Corvette** (agile, exige rang Federal) ou **Imperial Cutter** (tanky, rang Imperial). Le Corvette est le meilleur ship PvE selon la communauté.

**AX/Thargoïde (résiduel)** : Python Mk II Stellar AX ou Alliance Chieftain AX Jumpstart, Enhanced AX Multi-cannons + modules Guardian.

## G. Ship-Launched Fighters (SLF) — pourquoi vous perdez en fighter
- **Hangar** requis (size 5/6/7) : ships porteurs = Keelback, Alliance Crusader, Federal Gunship, Krait Mk II, Type-9, Beluga, Type-10, Anaconda, Federal Corvette, Imperial Cutter (+ certains large 2025-26).
- **Un seul fighter en vol** en solo (deux en multi-crew).
- **Fighters** : **Taipan** (indépendant, robuste, heat sink) ; **Gu-97 / F63 Condor** (impérial/fédéral, très agiles mais fragiles — le Gu-97 n'a que ~15 HP bouclier / 15 HP coque, « splattered almost instantly ») ; Guardian (**Trident** polyvalent, **Javelin** anti-coque, **Lance** dégâts max mais faible vs boucliers). Guardian = meilleurs (rapides, bon bouclier), à débloquer via sites Guardian.
- **Crew NPC** : rang Harmless→Elite ; **part de profit ~2 % (Harmless) à ~16 % (Expert monté Elite)** [COMMUNAUTÉ]. Prenez un Harmless et montez-le : moins cher à terme. La part se paie **que le crew soit actif ou non**.
- **Ordres** : configurez les touches Fighter Orders (Attack target / Defend / Hold position / Follow / Dock).
- **Pourquoi vous perdez en fighter** : (1) vous pilotez le fighter fragile au lieu de laisser le NPC piloter le gros ship ; (2) vous ne gérez pas l'aggro (basculez le NPC en défense quand vous êtes visé) ; (3) pas de heat sink sur Taipan pour le burst. **Conseil** : laissez le NPC piloter le vaisseau-mère (turrets « fire at will ») et pilotez le fighter seulement si vous maîtrisez ; sinon faites l'inverse.

## H. Où s'entraîner (progression)
1. **Nav Beacon** d'un système à basse sécurité (cibles faibles).
2. **Low RES** → **High RES** → **HazRES**.
3. **Conflict Zones Low → High**.
4. **CQC** (arène PvP) pour le pilotage pur sans risque de rebuy.

Montez en difficulté progressivement ; volez toujours avec le rebuy en poche.

---

# GUIDE 3 — EXPLORATION & EXOBIOLOGIE

## A. Build d'exploration optimal 2026
**Vaisseau recommandé : Mandalay** (SCO natif, ~230 t, meilleur explorateur polyvalent, thermals excellents). Alternatives : Diamondback Explorer (petit budget), AspX, Krait Phantom (plus d'espace), Anaconda (range max ~84 ly mais grosse), Dolphin (léger). Le Python Mk II n'est **pas** un explorateur.

**Build Mandalay type (~75-80 ly ingénieré)** :
- **5A Frame Shift Drive (SCO)** — Increased Range G5 + **Mass Manager** (experimental). Base ~31 ly stock ; ~39 ly nu ; 75-80 ly optimisé.
- **Guardian FSD Booster 5H** (+10,5 ly).
- **Power Plant 2A/3A** (le plus petit A qui alimente ; Low Emissions pour le froid SCO).
- **Power Distributor 3D** (Engine Focus, permet le boost).
- **Thrusters** : A-rated recommandé (l'exobio implique beaucoup de vol atmosphérique/planétaire, pas que du supercruise).
- **Life Support 4D Lightweight**, **Sensors 5D Lightweight** (gain de range).
- **6A/6C Fuel Scoop** (ravitaillement ~10 s).
- **Detailed Surface Scanner (DSS)** — utilisez le **V1 pré-ingénieré** pour un mapping facilité.
- **AFMU** (Auto Field-Maintenance Unit) — répare après surchauffe/neutron ; désactivé quand inutile.
- **SRV / Vehicle Hangar** (Scarab) pour prospection matériaux/exobio au sol.
- **Shield Generator léger** (crashs d'atterrissage).
- **Heat Sink Launcher** (urgences neutron/étoile).
- **Repair Limpets** optionnel.

**Note SCO 2026** : les FSD **SCO** ont totalement remplacé les FSD classiques (obsolètes). Les drives SCO **pré-ingénierés** sont les plus longs sauteurs du jeu. Le SCO permet aussi d'accélérer en supercruise (pratique pour rejoindre les corps lointains) — mais il chauffe et consomme le carburant s'il est boosté : construisez froid (Low Emissions PP + Clean/Drag Drives).

## B. Mécaniques
- **Honk (Discovery Scanner)** : à l'arrivée dans chaque système, « honk » révèle les corps.
- **FSS (Full Spectrum System Scanner)** : identifie et scanne chaque corps (first discovery bonus).
- **DSS + probes** : cartographie détaillée d'une planète (first mapped bonus) et révèle les **signaux biologiques**.
- **First discovery / first mapped** : bonus de vente majeur (votre nom sur le corps).
- **Fuel scooping** : ravitaillez sur étoiles KGBFOAM (jamais sur naines/neutron).
- **Neutron highway** : boost de saut x4 dans le cône de jets ; **risque** de dégâts FSD — utilisez Spansh Neutron Plotter, approchez lentement, gardez un AFMU.
- **Vente des données** : **Universal Cartographics** (station avec service). Bonus si vous vendez dans un système où une faction est en boom/expansion. Les colonies peuvent aussi acheter.

## C. Exobiologie en détail
**Vista Genomics** (dans les concourses Odyssey) achète les données génétiques collectées avec le **Genetic Sampler** de l'**Artemis Suit**. Il faut **3 échantillons** par espèce, séparés par la **Colony Range** (distance clonale, 100 m à 1 km selon le genre). **First Logged = x5 la valeur** [OFFICIEL wiki].

**Valeurs de vente 2026 (Cr par espèce, source : wiki ED / données Canonn) [COMMUNAUTÉ]** — extraits des plus rentables :

| Genre / espèce | Valeur (Cr) | Colony range | Conditions clés |
|---|---|---|---|
| Fonticulua Segmentatus | 19 010 800 | 500 m | atmo Neon/Neon-Rich |
| Stratum Tectonicas | 19 010 800 | 500 m | HMC, >165 K, any atmo |
| Tussock Stigmasis | 19 010 800 | 200 m | atmo SO2 |
| Concha Biconcavis | 16 777 215 | 150 m | atmo Nitrogen |
| Fonticulua Fluctus | 16 777 215 | 500 m | atmo Oxygen |
| Cactoida Vermis | 16 202 800 | 300 m | atmo Water |
| Clypeus Speculumi | 16 202 800 | 150 m | Rocky/HMC, >2500 Ls |
| Fumerola Extremus | 16 202 800 | 100 m | volcanisme silicate/iron |
| Recepta Deltahedronix | 16 202 800 | 150 m | atmo SO2 |
| Stratum Cucumisis | 16 202 800 | 500 m | Rocky, SO2/CO2, >190 K |
| Tussock Virgam | 14 313 700 | 200 m | atmo Water |
| Recepta Conditivus | 14 313 700 | 150 m | Icy/Rocky Ice, SO2 |
| Aleoida Gravis | 12 934 900 | 150 m | CO2, 190-195 K |
| Osseus Discus | 12 934 900 | 800 m | Rocky/HMC, Water |
| Recepta Umbrux | 12 934 900 | 150 m | SO2 |
| Tubus Cavas | 11 873 200 | 800 m | Rocky, CO2, 160-190 K |
| Clypeus Margaritus | 11 873 200 | 150 m | Rocky/HMC, >190 K |
| Frutexa Flammasis | 10 326 000 | 150 m | Rocky, Ammonia |
| Osseus Pellebantus | 9 739 000 | 800 m | Rocky/HMC, CO2, 190-195 K |
| Bacterium Nebulus | 9 116 600 | 500 m | atmo Helium |

*Note : la valeur de base du Stratum Tectonicas est **19 010 800 Cr** selon le wiki ; certains joueurs citent une valeur légèrement différente (~19,8 M) — écart mineur entre sources, à considérer comme « ~19 M ». Le bonus first-footfall multiplie par 5.*

Genres à connaître : **Bacterium, Cactoida, Clypeus, Concha, Electricae, Fonticulua, Frutexa, Fumerola, Fungoida, Osseus, Recepta, Stratum, Tubus, Tussock, Aleoida** ; + spéciaux **Amphora Plant, Anemone, Bark Mound, Brain Tree, Crystalline Shard, Sinuous Tuber** (souvent liés à un type d'étoile/planète particulier dans le système). Les moins chers plafonnent à **1 000 000 Cr** (Bacterium Acies/Vesicula, Tussock Pennatis, Fonticulua Campestris).

**Conditions d'apparition** : dépendent du **type d'atmosphère, gravité (souvent ≤ 0,27 g), température moyenne, type de planète (Rocky/HMC/Icy…), et parfois de la présence d'un certain type d'étoile ou d'une ELW/Gas Giant dans le système**. Astuce : HMC + atmo Methane/SO2 + 1 seul signal bio = forte chance de **Stratum Tectonicas** (~19 M).

**Nouveauté 2026** : le **Nomad** (Operations Update, 30 juin 2026) embarque un **MK II Biological Scanner** détectant les signaux bio directement depuis le cockpit — accélère fortement le repérage exobio.

## D. Outils tiers indispensables (liens en fin de doc)
- **Spansh Road to Riches** et **Spansh Exobiology** (itinéraires optimisés).
- **Elite Observatory** + plugins **Botanist** (enregistre les échantillons plus vite), **Herald**, **Evaluator**.
- **EDDiscovery**, **EDMC (ED Market Connector)**, **EDCoPilot** (assistant vocal).
- **Canonn Research** (valeurs Vista Genomics), **EDSM**, **Inara**.

## E. Méthode « sans stress »
- Routine **« jump, honk, scan »** systématique.
- Ne sautez jamais à l'aveugle vers une naine/neutron sans vérifier ; sortez du supercruise avec marge.
- Gérez le carburant (fuel scoop + Guardian booster pour toujours atteindre une étoile scoopable).
- **Vendez régulièrement** : perdre des heures de données à la mort fait mal. Utilisez un **Fleet Carrier comme base avancée** pour déposer/vendre (Universal Cartographics à bord).
- Faites des sessions courtes ; l'exobio est répétitif — alternez avec autre chose pour éviter la lassitude.

## F. Où aller en 2026
- **Dans la bulle / périphérie** : suffisant pour gagner beaucoup (pas besoin de first footfall pour être rentable ; ~300 M en visitant des planètes bio proches).
- **Zone vierge (>1000 ly)** : pour le **first footfall x5**.
- **Nébuleuses** riches en bio (Bark Mounds, Brain Trees), **Colonia**, **Sagittarius A***.
- **Omega Nebula** : ouverte à la communauté le **6 janvier 2026** via le Grand Tiberian Highway (40+ water worlds à anneaux, 31 systèmes à trou noir, 57 à étoile à neutron le long de la route) — nouvelle région d'intérêt 2026.

---

# GUIDE 4 — COLONISATION (Trailblazers, état août 2026)

## A. Principe
Introduite en bêta le **26 février 2025**, sortie complète le **11 novembre 2025**, puis fortement itérée (Trailblazers Update 3 le 30 avril 2025 : refonte des économies et de la croissance de population). Requiert **Odyssey**. La colonisation permet de **claim un système inhabité et d'y construire** stations et installations. Vous devenez **System Architect** (statut permanent, non perdable). **Au 16 février 2026 : 101 862 systèmes colonisés, 175 973 installations de surface, 307 014 installations orbitales** [OFFICIEL dev log].

## B. Prérequis et mécanique du claim
- **Module System Colonisation Suite** : désormais présent sur **tous les vaisseaux** (comme le Discovery Scanner).
- **Claim** au **System Colonisation Contact** (dans les star ports), sur un système inhabité **dans un rayon de ~15 ly d'un système déjà peuplé** (premier arrivé, premier servi). *(Certains joueurs rapportent des cas jusqu'à ~25 ly ; la valeur a été discutée par Frontier — traiter 15 ly comme la règle de base.)*
- **Coût du claim** : ~**25 M Cr** [COMMUNAUTÉ].
- Scannez le système au **FSS** au préalable : révèle le nombre de **slots de construction** disponibles (plus de gros corps = plus d'installations de surface).
- **Pas de limite de temps** pour construire des installations additionnelles après le port primaire ; mais l'**effort de colonisation initial** (port primaire) a un **timer**.

## C. Déroulé
1. Déployez le **System Colonisation Beacon** → arrivée du **System Colonisation Ship** (hub temporaire) avec compte à rebours.
2. Livrez les **commodités de construction** (achetées + minées). Si manque, un prompt indique où sourcer.
3. Choix du **port primaire** : **Outpost** (petit, medium pad) / **Coriolis** / **Orbis** / **Ocellus** (large pad, bonus plus forts). Astuce : on peut **construire directement un T3** comme installation primaire pour les systèmes à peu de slots.
4. À la complétion, le port apparaît ; le système devient **Uncontrolled Populated** (éligible Powerplay).

**Tonnages de commodités (approximatifs, aléatoires ±10 %) [COMMUNAUTÉ]** — les « trois rois » sont **Steel (~7000 t), Titanium (~5700 t), CMM Composite (~4600 t)**, plus Liquid Oxygen (~1900 t), Aluminium, Ceramic Composites, etc. Un Outpost ≈ 50 000+ commodités ; un Coriolis ≈ 54 000-70 000. CMM Composite et Ceramic Composites ne se trouvent que dans certaines économies (achat, pas production locale).

## D. Tiers, points et économie
- Système de **Tier 1/2/3** avec **points de construction** (« construction tokens »). Le coût en tokens **double pour un 3e port T2/T3** — planifiez.
- Chaque installation modifie : **Population, Max Population, Security, Tech Level, Wealth, Standard of Living, Development Level**.
- **Links automatiques** (depuis Trailblazers U3, avril 2025) : les installations complétées se lient et partagent une part de leur économie aux ports du système, augmentant offre/demande/types de commodités.
- **Orienter l'économie** (agricole, extraction, industriel, high-tech, tourisme, militaire, réfugié) détermine **quelles commodités et services** seront disponibles — crucial pour l'auto-approvisionnement (ex. une économie Refinery fournit acier/titane). Mixez installations pour créer les synergies voulues.

## E. Stratégie SOLO
- **Cargo** : Type-9 Heavy, Type-10, Imperial Cutter, ou **Panther Clipper Mk II** (le plus gros cargo, ouvre de nouvelles stratégies 2026).
- **Fleet Carrier** comme **entrepôt tampon** : achetez en gros les commodités près du système, stockez sur le FC, puis navette FC→chantier. Réduit énormément le temps.
- **Achat au meilleur prix** : utilisez Inara/EDDB pour localiser Steel/Titanium/CMM Composite à bas prix ; visez un système à coloniser **proche d'une source** (< 50-60 ly) pour minimiser l'effort.
- **Temps réel** : un Outpost solo = plusieurs heures à quelques jours de hauling ; un T2/T3 solo = très long. Choisissez **Outpost** pour démarrer léger.

## F. Stratégie EN GROUPE
- **Squadron** : répartissez rôles (mineurs de tritium/matériaux, acheteurs, haulers, coordinateur).
- **Outils** : trackers communautaires (planificateur type **Raven Colonial Corporation**, Elite Colonisation Tracker), feuilles de calcul partagées, **Discords dédiés**.
- **Fleet Carrier collectif** : un FC mutualisé comme dépôt central ; gérez les droits de transfert cargo.
- **T2/T3** : « faciles » pour un groupe de 3-4 selon la communauté ; irréalistes en solo raisonnable.
- **Pièges** : quelqu'un peut « camper » votre station au server tick pour claim un système à 15 ly ; coordonnez les claims. Évitez les liens économiques conflictuels (deux strong links de force égale = marchés cassés).

## G. Rentabilité — verdict sans complaisance
La colonisation **ne rapporte quasiment rien en crédits** : la **tax d'architecte** est versée **hebdomadairement** (redeemable à un Administration contact), fonction du nombre/échelle d'installations. Des architectes rapportent **~627 000 Cr pour une semaine** après avoir livré ~800 000 t de commodités — soit une fraction de ce qu'un simple run de hauling profitable aurait rapporté [COMMUNAUTÉ]. Une **taxe galactique** s'applique au-delà de 5 M Cr gagnés. Bénéfices réels : **expansion de la bulle**, **ports personnalisés**, **petit rabais ships/outfitting** (systèmes à ≥10 installations), sentiment d'accomplissement, et potentiellement accès facilité à certaines ressources/économies. **Faites-la par passion, pas pour l'argent.**

## H. Erreurs fréquentes
1. Claim d'un système loin de toute source de Steel/Titanium/CMM → hauling interminable.
2. Vouloir un T3 en solo dès le départ.
3. Négliger le Fleet Carrier tampon.
4. Mal orienter l'économie → marchés sans commodités utiles.
5. Sous-estimer les tonnages (les « trois rois »).

---

# CE QUI A CHANGÉ EN 2026 (récapitulatif)
- **Kestrel Mk II** (24 fév. 2026, patch 4.3.1.0) : petit combat Core Dynamics, FSD SCO, arme **Mk II Plasma Shock Accelerator** (plasma + plasma slug, consomme le carburant) [OFFICIEL].
- **Roadmap 2026** (dev log 16 fév.) : 6 « vessels », mode Operations, reboot d'une feature à l'automne [OFFICIEL].
- **Lynx Highliner** (28 avril 2026) : paquebot offert gratuitement (compensation du report d'Operations) ; retour des missions de stations en feu.
- **Operations Update** (30 juin 2026, patch 4.4.0.x) : scénarios coop 1-4 joueurs (modes Mercenary/Powerplay), 6 opérations, nouveau **Nomad** (SLV avec MK II Biological Scanner), nouvelle monnaie **Merc Coin** [OFFICIEL]. Lancement chaotique (serveurs surchargés, opérations retardées de quelques heures le 1er juillet, patchs correctifs les jours suivants restaurant les récompenses manquantes et corrigeant la latence).
- **Merc Coin** : gagnée en complétant des Operations ; **plafond hebdo 1000, max 9999** [COMMUNAUTÉ wiki] ; s'échange contre des **modules pré-ingénierés (grade 1) et des blueprints d'ingénierie** (à monter ensuite chez un ingénieur avec matériaux). Une opération difficile ≈ 20 M Cr.
- **Patch 18.07** (guerre Thargoïde, antérieur mais structurant) : suppression du malus de dégâts des armes Guardian ; Anti-Guardian Zone Resistance sur tous les modules Guardian sans pénalité [OFFICIEL].
- **Omega Nebula** ouverte à la communauté (6 janv. 2026).
- **Colonisation** : chiffres records (101 862 systèmes au 16 fév. 2026) ; économies et population fortement rééquilibrées depuis avril 2025.
- **Aucune preuve** d'un nerf/buff numérique du minage, de l'exobiologie ou du bounty hunting dans les patchs juin-août 2026 — les guides prétendant le contraire sont à vérifier. La grande nouveauté monétaire de la période est le Merc Coin (limité, non « farmable »).

---

# SOURCES ET OUTILS
- **Patch notes officiels** : elitedangerous.com/update-notes ; forums.frontier.co.uk (News & Bulletins).
- **Wiki** : elite-dangerous.fandom.com (valeurs exobio, ships, colonisation).
- **Plotters** : spansh.co.uk (Road to Riches, Exobiology, Neutron, Tourist) ; edsm.net.
- **Builds** : coriolis.io ; edsy.org ; s.orbis.zone.
- **Marché/données** : inara.cz ; eddb ; canonn.science (Vista Genomics).
- **Exploration** : Elite Observatory (+ Botanist/Herald/Evaluator) ; EDDiscovery ; EDMC ; EDCoPilot.
- **Créateurs** : Down to Earth Astronomy, Exigeous, CMDR Mechan, The Buur Pit, ObsidianAnt, Yamiks, Vindicator Jones, Aussie Toast Gaming, Ricardos Gaming.
- **Communautés** : r/EliteDangerous, r/EliteMiners, r/EliteExplorers, r/EliteTraders ; Discords de colonisation.

*Note de fiabilité : les valeurs exobio et Cr/h proviennent de données communautaires (Canonn, Spansh, Reddit/Steam) et peuvent varier avec l'économie vivante. Les faits datés/patchés sont marqués [OFFICIEL]. Vérifiez toujours les prix marché en temps réel via Inara avant de vendre/acheter. Deux prémisses répandues sont corrigées ici : (1) « le Corsair a power-crept le Python Mk II en combat » est exagéré — le Python Mk II reste le roi du combat médium ; (2) aucun nerf/buff numérique des activités monétaires n'est documenté dans les patchs juin-août 2026.*