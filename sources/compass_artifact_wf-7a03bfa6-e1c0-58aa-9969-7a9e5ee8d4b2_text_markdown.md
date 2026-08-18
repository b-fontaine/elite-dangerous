# Outils tiers Elite Dangerous pour un exobiologiste/explorateur basé à Cubeo — Guide à jour (17 août 2026, PC / Live / Odyssey)

**Réponse directe : pour atteindre 1 milliard de crédits en exploration/exobiologie en sessions de 1-2 h sans combat, tu n'as besoin que de 4 outils réellement structurants — EDMC + BioScan (avec EDMCOverlay), ED Odyssey Materials Helper, Spansh et INARA — le reste est du confort.** Tout ce qui suit est calibré sur ton profil : Caspian Explorer avec FSD SCO Mk II classe 8, Nomad en Vessel Hangar, zéro ingénieur débloqué, Artemis Suit à monter, base à Cubeo (espace impérial). Aucun outil de combat/PvP/Thargoïde n'est recommandé sauf usage explorateur.

---

## TL;DR (3 points)

- **Le "stack minimal" à installer ce soir = EDMC + BioScan + EDMCOverlay (surimpression en jeu), ED Odyssey Materials Helper (montée Artemis), et deux sites web sur ton second écran (Spansh + INARA).** Cette combinaison couvre ~90 % de tes besoins sans passer la soirée à configurer.
- **Ton moteur à crédits, c'est Spansh "Expressway to Exomastery" :** il te trace depuis Cubeo une route de planètes à Stratum Tectonicas. Chaque Stratum Tectonicas vaut **19 010 800 cr de base** et **95 054 000 cr avec le bonus First Footfall (×5)** — c'est là que se joue ton milliard, sans jamais tirer un coup de feu.
- **Un seul déblocage d'ingénieur te concerne à court terme : Felicity Farseer, qui ne réclame qu'1 unité de méta-alliage** (le Elite Dangerous Wiki confirme : « A total of 43 units are needed: 1 unit to unlock Felicity Farseer »). Ta seule "montée en grade" matérielle est l'**Artemis Suit** (seule combinaison portant le Genetic Sampler), dont le rang progresse via le « Profit from Organic Data » vendu à Vista Genomics.

---

## Rappels factuels sur ton contexte (pour comprendre les choix d'outils)

- **Conformité Frontier :** tous les outils listés ici lisent le **journal de bord** (`%USERPROFILE%\Saved Games\Frontier Developments\Elite Dangerous`) et/ou l'API Companion (CAPI) de Frontier — **autorisé**. Aucun ne fait d'**injection mémoire** (interdit). Les overlays (EDMCOverlay, EDCoPilot, EDEngineer) dessinent par-dessus la fenêtre du jeu, ce qui exige que **Elite tourne en mode Fenêtré ou Fenêtré sans bordure**, jamais en plein écran exclusif. [OFFICIEL]
- **Le Nomad et les Vessel Hangars** ont été introduits par l'Operations Update du **30 juin 2026** (early access ARX ; Faulcon deLacy). Le wiki note un détail crucial pour tes outils : le Nomad **positionne le flag "SRV" (et non "fighter") dans `status.json`**, ce qui a cassé le suivi de certains outils au lancement — d'où l'importance d'utiliser des versions à jour (voir EDCoPilot ci-dessous). Autre point du wiki : **« If the Nomad is destroyed you lose all exobiology data »** — raison de plus pour un outil qui synchronise tes scans en continu (BioScan/ExploData). [OFFICIEL — Fandom]
- **Felicity Farseer (Deciat) :** 1 méta-alliage suffit. Source la plus proche : achat à **Darnielle's Progress (Maia)** ou récolte sur barnacles ; vérifie la dispo en station Odyssey via INARA. C'est ton **premier objectif d'ingénierie** car elle améliore la portée du FSD. [COMMUNAUTÉ/OFFICIEL]

---

## NIVEAU 1 — INDISPENSABLES (à installer dès la première session)

### 1. Spansh — le cerveau de ta stratégie crédits
- **Nom exact / lien :** Spansh — **https://spansh.co.uk** (routeur exobio : **https://spansh.co.uk/exobiology** ; body search : **https://spansh.co.uk/bodies** ; plotter neutron : **https://spansh.co.uk/plotter**). [OFFICIEL]
- **Type :** site web, rien à installer, gratuit (dons). **Excellent sur second écran.**
- **À quoi ça te sert concrètement :**
  - **Expressway to Exomastery** = ton "Road to Riches" de l'exobio. Il te génère une liste ordonnée de systèmes riches en bios à haute valeur. **Configuration pour toi :** *Source System* = **Cubeo** ; *Destination* = laisse vide (« Leave destination blank if you don't mind where you finish ») ; *Range (LY)* = la portée réelle de ton Caspian ; *Radius* = 50-100 LY ; *Minimum value* = **16 000 000 cr** minimum (recommandation communautaire : ne perds pas ton temps sous ce seuil) ; coche **Avoid Thargoids**. Note : dans la bulle/proche, tu ne toucheras pas les bonus First Footfall (déjà visité), mais c'est le moyen le plus rapide de **monter le rang Exobiologist** (tu es "Mostly Directionless").
  - **Body Search** = ta chasse au Stratum Tectonicas quand tu es dans le "black". Filtres à régler pour maximiser les Tectonicas et minimiser les faux positifs (données Canonn/communauté) : *Subtype* = **High metal content world** ; *Gravity* = 0 à ~**0,27 g** (aller jusqu'à 0,3 g max filtre l'essentiel des autres bios) ; *Atmosphere* = **Thin Carbon dioxide / Thin Sulphur dioxide / Thin Water / Thin Ammonia / Thin Oxygen** ; *Surface pressure* ≤ ~0,05-0,09 atm ; *Surface temperature* > 165 K ; et surtout *Last Updated At* = **avant le 19 mai 2021** (release d'Odyssey) pour cibler des corps jamais foulés. Ta référence = Cubeo.
  - **Neutron Router / Galaxy Plotter** = pour tes longs trajets. Le Neutron Router (plotter) demande **système source, système destination, portée de saut (LY) et efficacité (%)** ; une efficacité de 100 ne dévie pas de la route directe, une efficacité plus basse (40-60 %) dévie pour enchaîner plus d'étoiles à neutrons et réduire le nombre total de sauts. Le **Galaxy Plotter (exact)** peut prendre ton **build de vaisseau** (voir EDSY §7) : il affiche « Paste ship build JSON exported from coriolis.io or SLEF from edsy.org ».
  - **Road to Riches / Tourist / Riches Router :** utiles si tu veux mixer cartographie pure (planètes à haute valeur de scan/mapping) avec l'exobio. Le Fleet Carrier Router ne te concerne que si tu achètes un porte-vaisseaux plus tard.
- **Piège :** si ton système de départ n'est pas dans la base Spansh, choisis un système voisin déjà indexé (vérifie la distance sur la carte galaxie).
- **Astuce :** garde en permanence l'onglet résultats ouvert sur ton second écran et coche les corps au fur et à mesure ; l'Expressway sépare le suivi de scan du Road to Riches.

### 2. INARA — ton annuaire de services et de matériaux
- **Nom exact / lien :** INARA — **https://inara.cz** (nearest : **https://inara.cz/elite/nearest/** ; nearest stations : **https://inara.cz/elite/nearest-stations/** ; matériaux marché : **https://inara.cz/market-materials/** ; tech brokers : **https://inara.cz/galaxy-techbroker/** ; ingénieurs : **https://inara.cz/galaxy-engineer/**). [OFFICIEL]
- **Type :** site web, gratuit (compte facultatif). **Indispensable sur second écran.**
- **À quoi ça te sert concrètement :**
  - **Trouver Vista Genomics** (vendre tes échantillons/monter le rang Exo) et **Pioneer Supplies** (acheter/mettre à niveau l'Artemis Suit) : *Nearest → Systems and Stations → Nearest stations*, entre **Cubeo** en système de référence, coche le service voulu. Astuce : **les Pioneer Supplies des stations à économie militaire** vendent parfois des combinaisons pré-ingénierées grades 2-3, stock qui se réinitialise **chaque jeudi après le tick serveur** — filtre les stations à économie militaire pour choper une Artemis pré-moddée. [COMMUNAUTÉ]
  - **Localiser un méta-alliage pour Farseer** : *Find Trade Offer* / market-materials, ou vérifie les stations Odyssey vendant des méta-alliages proches de ta route vers Deciat.
  - **Nearest Outfitting / Material Trader / Bartender / Technology Broker / Universal Cartographics** : tri par distance depuis Cubeo, ou par distance à l'étoile (souvent plus important que le nombre de sauts).
  - **Fiches ingénieurs, blueprints de combinaisons, suivi via API** : la fiche de Felicity Farseer te donne localisation et prérequis ; tu peux synchroniser ton commandant via l'API (EDMC pousse tes données).
- **Astuce :** sur les recherches de matériaux de porte-vaisseaux, regarde toujours la date "updated" — une offre de plus de 2-3 jours a souvent disparu.

### 3. EDMC (Elite Dangerous Market Connector) + BioScan + EDMCOverlay — ton cockpit d'exobio
- **Noms / liens :** EDMC — **https://github.com/EDCD/EDMarketConnector** ; BioScan — **https://github.com/Silarn/EDMC-BioScan** ; EDMCOverlay — **https://github.com/inorton/EDMCOverlay**. [OFFICIEL]
- **Type :** EDMC = application de bureau (Windows 10+, .msi) gratuite open source ; BioScan et EDMCOverlay = **plugins** gratuits open source. **Surimpression en jeu → parfait aussi bien en overlay que sur second écran.**
- **À quoi ça te sert concrètement :**
  - **EDMC** lit ton journal et alimente l'écosystème (EDDN, INARA, EDSM) — c'est le socle qui rend BioScan possible et qui fait apparaître ta position "near star" automatiquement dans INARA/EDSM.
  - **BioScan** est le cœur de ta boucle exobio : dès le scan FSS, il **déduit les espèces probables présentes sur un corps et leur valeur estimée**, t'affiche la **distance d'échantillonnage requise** entre deux prélèvements (fini les allers-retours ratés), et **conserve ta progression en base** (via le module ExploData) par commandant — tu peux fermer/rouvrir EDMC sans rien perdre, et **importer tes anciens journaux**. Crucial vu l'avertissement du jeu : perdre le Nomad = perdre les données d'exobio non synchronisées.
  - **EDMCOverlay** affiche les infos de BioScan directement par-dessus le jeu.
- **Installation détaillée :**
  1. Installe EDMC (.msi depuis la page Releases), lance-le une fois : il doit détecter le dossier journal `%USERPROFILE%\Saved Games\Frontier Developments\Elite Dangerous`. Autorise l'accès CAPI (login Frontier) quand demandé.
  2. Ouvre *File → Settings → Plugins → Open* : ça ouvre `%LOCALAPPDATA%\EDMarketConnector\plugins`.
  3. Dézippe **ExploData** puis **BioScan** dans ce dossier (garde les noms de dossiers). Sur EDMC 6.0.x/6.x sous Windows, utilise la version d'ExploData compatible Python 3.13.
  4. Installe **EDMCOverlay** : télécharge le .msi depuis inorton/EDMCOverlay et installe-le sous le **même utilisateur Windows** que le jeu (le dossier plugin doit s'appeler `EDMCOverlay` ou `edmcoverlay`). Il écoute en local sur 127.0.0.1:5010 et **quitte silencieusement si EliteDangerous64.exe n'est pas lancé** — donc lance le jeu.
  5. Redémarre EDMC. Active l'overlay dans les réglages BioScan.
- **Pièges :** (a) EDMCOverlay **v1.0.6 (janv. 2022) est stable mais dormant** ; il fonctionne toujours en 2026, mais si tu as des soucis (multi-écran, sans-bordure), le successeur activement maintenu est **EDMCModernOverlay** (https://github.com/SweetJonnySauce/EDMCModernOverlay), compatible Windows/Linux, plein écran/sans bordure/fenêtré. (b) L'overlay exige le jeu en **fenêtré/sans bordure** (README inorton : « 'Windowed' or 'Bordless Fullscreen' mode only »). (c) Lance EDMC **avant ou après** le jeu, peu importe, mais l'overlay ne s'affiche qu'une fois le jeu détecté. [OFFICIEL/COMMUNAUTÉ]

### 4. ED Odyssey Materials Helper — pour faire monter l'Artemis Suit sans t'arracher les cheveux
- **Nom / lien :** ED Odyssey Materials Helper (jixxed) — **https://github.com/jixxed/ed-odyssey-materials-helper** (dernière version vue : **3.14.2**, 8 août 2026). [OFFICIEL]
- **Type :** application de bureau (Windows : .msi auto-updater ; Linux/Mac aussi), gratuite (EULA propriétaire, code "source available"). **Overlay + second écran.**
- **À quoi ça te sert concrètement :** c'est **l'outil clé pour ta montée d'Artemis Suit**. Il lit le journal, **suit en temps réel tes matériaux à pied** (chimiques, circuits, tech, données…), te dit **combien il te manque pour chaque grade/modification de combinaison** ou pour débloquer un ingénieur, gère une **wishlist** (importable depuis EDSY), et — fonctionnalité phare — affiche une **surimpression au comptoir de troc (Bartender) / terminal de données** qui te montre instantanément la pertinence de ce que tu as sous les yeux. Il suit aussi tes ordres et stocks sur porte-vaisseaux.
- **Installation :** télécharge le **.msi auto-updater** (Windows), installe, lance : il trouve seul le dossier journal. Vérifie l'analyse **VirusTotal** publiée à chaque release (rassure sur les faux positifs antivirus). Se met à jour au lancement.
- **Astuce :** monte d'abord les mods Artemis les plus rentables pour l'exobio — **Improved Battery Capacity / Reduced Tool Consumption** (autonomie du Genetic Sampler) et **Night Vision** (échantillonnage côté nuit quand le côté jour est trop chaud), plus **Increased Sprint Duration / Improved Jump Assist** pour se déplacer entre spécimens. [COMMUNAUTÉ]

---

## NIVEAU 2 — TRÈS UTILES (à ajouter quand le stack minimal tourne)

### 5. Elite Observatory Core + plugins BioInsights / Evaluator / Botanist / Herald
- **Nom / lien :** Elite Observatory Core (Xjph) — **https://observatory.xjph.net** et **https://github.com/Xjph/ObservatoryCore** ; suite de plugins (fredjk-gh) — **https://github.com/fredjk-gh/ObservatoryPlugins** ; plugins MattG (BioInsights/Evaluator) — **https://edjp.colacube.net/observatory**. [OFFICIEL]
- **Type :** application de bureau (.NET 8, installeur fourni), gratuite open source ; plugins au format **.eop**. **Second écran recommandé.**
- **À quoi ça te sert concrètement :** Observatory **surveille ton journal et te notifie automatiquement des corps intéressants**. Pour toi :
  - **Botanist** (préinstallé) : catalogue simple de tes signaux bio et **valide les échantillons plus vite que le jeu**.
  - **BioInsights** (plugin) : prédit les bios probables **dès le scan FSS** et affine à mesure que tu scannes au sol, avec valeur de base — parfait pour décider "j'atterris ou je passe mon chemin". Redondant avec BioScan (choisis-en un comme principal ; BioScan est plus compact/overlay, BioInsights parfois légèrement plus précis sur certains cas limites).
  - **Evaluator** : décompose la valeur d'un système, masque les corps sous un seuil, tague ceux à cartographier — utile pour l'exploration pure en complément.
  - **Herald** : notifications vocales améliorées (confort si tu ne veux pas quitter le cockpit des yeux).
- **Installation des plugins :** installeur Observatory → **ferme Observatory** → **double-clique le fichier .eop** (il se déballe seul et gère les dépendances) ; ou, en version .zip, copie le .eop dans le sous-dossier `.\plugins`. Le plugin **AutoUpdater** (fredjk-gh) maintient ensuite tout à jour. Relance Observatory après chaque ajout. [OFFICIEL]
- **Verdict :** excellent, mais **ne fais pas doublon** — si tu prends BioScan (stack minimal), Observatory devient optionnel/confort. Prends l'un OU l'autre comme moteur de prédiction bio, pas les deux en parallèle.

### 6. EDDiscovery — ton journal de bord et tes statistiques
- **Nom / lien :** EDDiscovery — **https://github.com/EDDiscovery/EDDiscovery** (wiki actif, révisions déc. 2025). Version allégée : **EDDLite**. [OFFICIEL]
- **Type :** application de bureau (Windows), gratuite open source. **Second écran.**
- **À quoi ça te sert concrètement :** carnet de voyage complet (systèmes visités, découvertes, gains), **cartographie 3D**, onglet **Estimated Values** (savoir si un corps FSS vaut le scan), et surtout le **Discoveries/Surveyor panel** avec des recherches intégrées et **alertes personnalisables** (grandes planètes atterrissables, lunes près d'anneaux, corps à haute valeur…). Il peut aussi pousser les données vers EDSM/EDDN comme EDMC.
- **Piège :** gourmand en mémoire sur de gros journaux — si tu joues en sessions courtes et veux du léger, prends **EDDLite**. Ne fais pas tourner EDDiscovery ET EDMC comme "émetteurs" en double vers les mêmes cibles (ce n'est pas bloquant, mais inutile).

### 7. EDSY + Coriolis — simulateurs de build pour optimiser le Caspian
- **Noms / liens :** EDSY — **https://edsy.org** ; Coriolis — **https://coriolis.io** (et beta.coriolis.io). [OFFICIEL]
- **Type :** sites web, gratuits open source.
- **À quoi ça te sert concrètement :** simuler et optimiser ton **Caspian Explorer** (portée de saut avec le **FSD SCO Mk II classe 8**, masse, thermique, autonomie) avant de dépenser des crédits/matériaux d'ingénierie. **EDSY est la référence à jour en 2026** (il a intégré rapidement les nouveaux modules et les **SCO** ; Coriolis a pris du retard côté maintenance mais reste utilisable via beta.coriolis.io).
- **Comment charger ton propre vaisseau :** synchronise ton profil Frontier vers **INARA/EDSM**, puis exporte le loadout ; **EDSY importe/exporte le format SLEF** (import direct de ta flotte via l'API Frontier). Pour alimenter le **Spansh Galaxy Plotter** : dans EDSY, onglet **OPS → Export → coche SLEF → Ctrl+C**, puis colle (Ctrl+V) dans Spansh ; dans Coriolis, **Ctrl+E puis Ctrl+C** et colle dans Spansh.
- **Piège :** l'inter-échange EDSY↔Coriolis n'est pas parfait (Coriolis ne parse pas toujours le SLEF d'EDSY) ; passe par SLEF pour Spansh, par le format natif pour chaque site.

### 8. EDSM (Elite Dangerous Star Map)
- **Nom / lien :** EDSM — **https://www.edsm.net** (ingénieurs : **https://www.edsm.net/en/engineers**). Live et à jour en 2026 (contient déjà les ingénieurs de combinaisons Odyssey). [OFFICIEL]
- **Type :** site web, gratuit. Reçoit les données via EDMC/EDDiscovery.
- **À quoi ça te sert concrètement :** cartographie et **fiches systèmes/stations**, et surtout la **liste des ingénieurs** avec localisation, spécialisations et prérequis (ex. « Deciat / Farseer Inc — Frame shift drives, Engines and thrusters ») — pratique pour planifier Farseer puis la suite. Tagline officielle : « The Galactic Positioning System of Elite: Dangerous at your service. »
- **Verdict :** utile mais **recouvre largement INARA**. Si tu dois choisir un seul annuaire web, garde **INARA** ; EDSM en complément pour la carto 3D et la vérif croisée.

---

## NIVEAU 3 — OPTIONNELS / CONFORT

### 9. EDCoPilot — assistant vocal "Alexa-in-space"
- **Nom / lien :** EDCoPilot (Razzafrag) — **https://www.razzafrag.com** ; installeur — **https://github.com/Razzafrag/EDCoPilot-Installer**. [OFFICIEL]
- **Type :** application de bureau, gratuite avec fonctions premium/donation ; VoiceAttack optionnel pour le contrôle vocal.
- **À quoi ça te sert concrètement :** immersion + confort en sessions courtes. Il **appelle Spansh** pour te générer et suivre des routes (Road to Riches, Neutron, Fleet Carrier) en bookmarks automatiques, te **guide vocalement vers Vista Genomics / Pioneer Supplies / Universal Cartographics / Bartender**, affiche panneaux "Bodies" (avec valeurs R2R et gravité/temp/compo de surface — utile pour trier les cibles bio) et un **Discovery Estimator**. Pensé pour VR mais **excellent sur second écran / tablette** (via SpaceDesk, il devient tactile).
- **Piège Nomad :** un correctif "jour 0" a été publié car le Nomad met le flag SRV dans `status.json` — **mets EDCoPilot à jour** si tu l'utilises avec le Nomad. [OFFICIEL/COMMUNAUTÉ]
- **Verdict :** génial si tu aimes le côté vocal/immersif ; **pur confort**, pas nécessaire pour le milliard.

### 10. Canonn Research — la référence data exobio
- **Nom / lien :** **https://canonn.science** (guide de scan organique, valeurs, codex). Plugin optionnel EDMC-Canonn. [OFFICIEL]
- **Type :** site web (+ plugin), gratuit open source.
- **À quoi ça te sert concrètement :** comprendre **où pousse chaque espèce** (conditions planétaires), les **valeurs Vista Genomics**, et la mécanique des 3 prélèvements. Le **Guide de scan organique** de Canonn est la meilleure ressource pour optimiser ta boucle. Sites Guardian/Thargoïd présents mais **hors de ton scope** (pas de combat).
- **Astuce :** couple-le à **ed-dsn.net** (Deep Space Network) qui liste les conditions d'apparition par atmosphère et les valeurs Vista Genomics — très pratique sur second écran. [COMMUNAUTÉ]

### 11. StratumFinder — first footfall + exobio de valeur
- **Nom / lien :** StratumFinder (lynnel1) — **https://github.com/lynnel1/StratumFinder**. [COMMUNAUTÉ]
- **Type :** application de bureau, gratuite open source.
- **À quoi ça te sert concrètement :** cherche les **systèmes à exobio de valeur avec bonus First Footfall probablement libre** — exactement ta cible quand tu sors de la bulle pour toucher le ×5. Alternative/complément au Body Search de Spansh (filtre "last updated < release Odyssey").
- **Réserve :** projet communautaire de niche — **vérifie qu'il est encore maintenu et compatible** avec les journaux post-Operations avant d'en dépendre. Le Body Search de Spansh reste ta valeur sûre. **Note importante :** aucun outil ne garantit un système *jamais visité* — 95 % des joueurs n'uploadent pas leurs données, donc les bases sous-estiment ce qui est déjà exploré ; à plus de ~1 000 LY de Sol, les vrais first footfall deviennent fréquents. [COMMUNAUTÉ]

### Applications mobiles
- **INARA** et **EDSM** sont utilisables depuis le navigateur mobile (pas besoin d'app native) pour préparer une route depuis ton téléphone. Il n'existe pas d'app mobile officielle indispensable pour ton profil ; ton **second écran PC** couvre déjà ce besoin. [ESTIMATION]

---

## "INUTILE POUR TOI" (pour ne pas perdre de temps)

| Outil | Pourquoi tu peux t'en passer |
|---|---|
| **EDEngineer** (https://github.com/msarilar/EDEngineer) | Suivi des **matériaux d'ingénierie de vaisseau** (raw/manufactured/data) et listes de courses. Utile pour l'ingénierie lourde de coque/armes, **pas pour l'exobio à pied**. Le dépôt d'origine msarilar a été **archivé le 4 juillet 2025** (un fork Pumpken existe). ED Odyssey Materials Helper couvre déjà tes matériaux à pied. **Ignore** sauf si tu te lances plus tard dans l'ingénierie poussée du Caspian. |
| **CMDRs Toolbox** (https://cmdrs-toolbox.com) | Localisation de settlements pour farmer les matériaux Odyssey. **Data datant de l'alpha Odyssey**, peu fiable en 2026 ; INARA (Nearest → Surface Settlement) et ED Odyssey Materials Helper font mieux et à jour. Tu farmes surtout via Vista Genomics, pas via raids de settlements. **Périmé.** |
| **Outils combat/PvP/Thargoïdes** (EDR, ED Recon, EDMC-Triumvirate, StreamSource…) | Hors profil (Harmless/Defenceless, tu évites le combat). **Aucun intérêt.** |
| **EDDI, EDAutopilot, autopilotes OpenCV** | EDDI fait doublon avec EDCoPilot ; les autopilotes par vision écran sont à la limite des CGU et fragiles. **À éviter.** |
| **Elite Observatory (ancien, Xjph/EliteObservatory)** | **Dépôt archivé le 9 janvier 2025**, read-only. Utilise **Observatory Core** (§5), son successeur. |

---

## Tableau récapitulatif

| # | Outil | Type | Coût | Second écran | Priorité | État 2026 |
|---|---|---|---|---|---|---|
| 1 | Spansh | Site web | Gratuit | ✅✅ | Indispensable | Actif [OFFICIEL] |
| 2 | INARA | Site web | Gratuit | ✅✅ | Indispensable | Actif [OFFICIEL] |
| 3 | EDMC + BioScan + EDMCOverlay | App + plugins | Gratuit/OSS | ✅ (overlay) | Indispensable | Actif ; overlay inorton dormant→ EDMCModernOverlay [OFFICIEL] |
| 4 | ED Odyssey Materials Helper | App | Gratuit | ✅ (overlay) | Indispensable | Actif, v3.14.2 (août 2026) [OFFICIEL] |
| 5 | Observatory Core + plugins | App + .eop | Gratuit/OSS | ✅ | Très utile | Actif [OFFICIEL] |
| 6 | EDDiscovery / EDDLite | App | Gratuit/OSS | ✅ | Très utile | Actif (déc. 2025) [OFFICIEL] |
| 7 | EDSY / Coriolis | Site web | Gratuit/OSS | ➖ | Très utile | EDSY à jour ; Coriolis en retard [OFFICIEL] |
| 8 | EDSM | Site web | Gratuit | ✅ | Utile (doublon INARA) | Actif [OFFICIEL] |
| 9 | EDCoPilot | App | Donation | ✅✅ | Confort | Actif, patch Nomad [OFFICIEL] |
| 10 | Canonn / ed-dsn | Site web | Gratuit | ✅ | Confort/référence | Actif [OFFICIEL] |
| 11 | StratumFinder | App | Gratuit/OSS | ➖ | Optionnel | À vérifier [COMMUNAUTÉ] |

---

## Recommandations — ordre d'installation pour ta première session de config

**Étape 1 (10 min) — le socle.** Installe **EDMC**, lance-le, autorise le login Frontier, vérifie qu'il lit ton dossier journal.

**Étape 2 (5 min) — l'overlay.** Installe **EDMCOverlay** (ou EDMCModernOverlay si tu es multi-écran/sans-bordure) dans `%LOCALAPPDATA%\EDMarketConnector\plugins`.

**Étape 3 (10 min) — l'exobio.** Dépose **ExploData** puis **BioScan** dans le dossier plugins d'EDMC, relance EDMC, active l'overlay dans BioScan. Lance une fois l'import de tes anciens journaux.

**Étape 4 (10 min) — la montée Artemis.** Installe **ED Odyssey Materials Helper** (.msi auto-updater), lance-le, crée ta **wishlist** des mods Artemis prioritaires (batterie, réduction conso outil, night vision).

**Étape 5 (5 min) — les onglets second écran.** Ouvre **Spansh** (configure l'Expressway to Exomastery depuis Cubeo, min value 16 M, Avoid Thargoids) et **INARA** (repère ta Vista Genomics et ta Pioneer Supplies les plus proches de Cubeo).

**Étape 6 (optionnel, plus tard).** Ajoute **EDDiscovery/EDDLite** pour le carnet de bord, **EDSY** pour optimiser le Caspian, **EDCoPilot** pour l'immersion vocale, **Canonn/ed-dsn** en référence.

**Première sortie type :** génère ta route Expressway depuis Cubeo → suis-la → à chaque système, honk + FSS → BioScan te dit quels corps valent l'atterrissage → prélève 3 échantillons par espèce (BioScan/Botanist affiche la distance requise) → revends à Vista Genomics pour monter le rang Exo et remplir la caisse. Au premier passage, va chercher **1 méta-alliage** (Maia/Darnielle's Progress via INARA) pour débloquer **Farseer** à Deciat et gagner de la portée FSD.

**Seuils qui changent la stratégie :**
- **Rang Exobiologist qui monte vite** → passe du farm "dans la bulle" (Expressway) au **first footfall hors bulle** (>1 000 LY) pour toucher le ×5 (95 M/Stratum) : bascule sur le **Body Search** de Spansh + StratumFinder.
- **Portée FSD après Farseer G5** → recalcule tes routes Neutron/Galaxy Plotter avec le nouveau build EDSY (SLEF) pour réduire le nombre de sauts par session.
- **Si tu vises le milliard vite** → priorise **uniquement les Stratum Tectonicas et bios ≥16 M**, ignore bacterium/bios à faible valeur ; c'est le facteur n°1 de vitesse de gain.

---

## Caveats (rigueur factuelle)

- **Valeurs bio :** le chiffre "19 010 800 cr base / 95 054 000 cr avec First Footfall (×5)" pour Stratum Tectonicas provient de guides communautaires (PMC Elite Dangerous) et de la mécanique du jeu ; **les valeurs exactes peuvent avoir été ajustées par Frontier** — vérifie sur Canonn/ed-dsn (valeurs Vista Genomics) avant de te fier à un montant précis. Attention à ne pas confondre le bonus **First Footfall (×5 sur la valeur du corps)** et le bonus **"First Logged" (×4 le bonus sur l'échantillon)** mentionné par le wiki. [COMMUNAUTÉ]
- **Impact du Nomad sur les outils :** le flag SRV dans `status.json` a cassé le suivi de plusieurs outils au lancement (30 juin 2026) ; certains ont patché (EDCoPilot), d'autres peut-être pas encore. **Teste tes outils avec le Nomad** et mets-les à jour. [OFFICIEL/COMMUNAUTÉ]
- **EDMCOverlay v1.0.6 = dernière release stable (janv. 2022)** : fonctionne mais n'est plus développé ; EDMCModernOverlay est le successeur actif si problème. [OFFICIEL]
- **StratumFinder et CMDRs Toolbox** sont des projets communautaires dont la maintenance en 2026 n'est pas garantie — je les classe optionnel/périmé pour cette raison. Privilégie Spansh/INARA/ED Odyssey Materials Helper, qui sont clairement actifs (versions datées de 2026). [COMMUNAUTÉ]
- **Coriolis** accuse un retard de maintenance (l'auteur original ne joue plus, se contente de merger) ; **EDSY est le simulateur de référence à jour** pour les modules récents et les SCO. [COMMUNAUTÉ]
- Les liens ci-dessus sont ceux des dépôts/sites officiels vérifiés lors de la recherche ; **n'installe jamais depuis un miroir tiers** (risque de malware et faux positifs). Contrôle systématiquement les analyses VirusTotal fournies dans les releases GitHub.