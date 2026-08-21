/// A real `GET /profile`, captured on 19 August 2026 from an Odyssey account
/// with eight ships and four suits, with the commander's name and ship names
/// replaced and nothing else touched.
///
/// It exists because two claims could not be settled by reading: the community
/// CAPI reference says `ships` carries "the same format as `ship`", modules
/// included, and `suit` / `suits` / `loadout` / `loadouts` appear in no
/// Frontier document at all. This capture answers both — no on a stored ship's
/// `modules`, no on a weapon's grade — and four other things nobody wrote down:
/// `capabilities` contradicts the payload it sits in, `hull` is `0` on recent
/// ships, `rank` carries ladders the app does not model, and a third of
/// `modules` is paint.
///
/// Every test that reads it is a regression test against Frontier changing its
/// mind, which is the one thing the CAPI reliably does.
library;

import 'dart:convert';

const String capiProfileCapture = r'''
{
  "commander": {
    "alive": true,
    "capabilities": {
      "AllowCobraMkIV": false,
      "Horizons": false,
      "Odyssey": false
    },
    "credits": 249612390,
    "currentShipId": 18,
    "debt": 0,
    "docked": true,
    "id": 1000000,
    "mercCoins": 0,
    "name": "Commandant",
    "onfoot": false,
    "rank": {
      "builder": 0,
      "combat": 0,
      "cqc": 0,
      "crime": 0,
      "empire": 12,
      "exobiologist": 2,
      "explore": 5,
      "federation": 4,
      "learner": 0,
      "power": 0,
      "service": 0,
      "soldier": 0,
      "trade": 6
    }
  },
  "lastStarport": {
    "faction": "independent",
    "id": 3229849856,
    "minorfaction": "The SMC Clan",
    "name": "Bernoulli Vision",
    "services": {
      "apexinterstellar": "ok",
      "bartender": "ok",
      "blackmarket": "ok",
      "commodities": "ok",
      "contacts": "ok",
      "crewlounge": "ok",
      "dock": "ok",
      "engineer": "ok",
      "exploration": "ok",
      "frontlinesolutions": "ok",
      "livery": "ok",
      "materialtrader": "ok",
      "outfitting": "ok",
      "pioneersupplies": "ok",
      "powerplay": "ok",
      "rearm": "ok",
      "refuel": "ok",
      "registeringcolonisation": "ok",
      "repair": "ok",
      "searchrescue": "ok",
      "shipyard": "ok",
      "shop": "ok",
      "socialspace": "ok",
      "stationmenu": "ok",
      "techbroker": "ok",
      "vistagenomics": "ok"
    }
  },
  "lastSystem": {
    "faction": "independent",
    "id": 2931088689515,
    "name": "Caeritis"
  },
  "loadout": {
    "loadoutSlotId": 3,
    "name": "EXPLORATEUR",
    "slots": {
      "PrimaryWeapon1": {
        "ammo": {
          "clip": 3,
          "hopper": 30
        },
        "free": false,
        "health": 1000000,
        "id": 128937319,
        "locDescription": "x",
        "locName": "Manticore Executioner",
        "modifications": [
          "NYI"
        ],
        "name": "Wpn_M_Sniper_Plasma_Charged",
        "slots": {
          "Optics": {
            "free": false,
            "health": 1000000,
            "id": 128962677,
            "locDescription": "x",
            "locName": "x",
            "modifications": [
              "NYI"
            ],
            "name": "Wpn_M_Sniper_Plasma_Charged_Default_Optic",
            "slots": [],
            "value": 1000,
            "weaponrackId": 1700306295596932
          },
          "PaintJob": {
            "id": 128978294,
            "locDescription": "x",
            "locName": "x",
            "name": "PaintJob_PlasmaSniper_Default_Paintjob_01",
            "weaponrackId": 0
          }
        },
        "value": 175000,
        "weaponrackId": 1700306295596796
      },
      "SecondaryWeapon": {
        "ammo": {
          "clip": 6,
          "hopper": 72
        },
        "free": false,
        "health": 1000000,
        "id": 128937281,
        "locDescription": "x",
        "locName": "Manticore Tormentor",
        "modifications": [
          "NYI"
        ],
        "name": "Wpn_S_Pistol_Plasma_Charged",
        "slots": {
          "Optics": {
            "free": false,
            "health": 1000000,
            "id": 128962682,
            "locDescription": "x",
            "locName": "x",
            "modifications": [
              "NYI"
            ],
            "name": "Wpn_S_Pistol_Plasma_Charged_Default_Optic",
            "slots": [],
            "value": 1000,
            "weaponrackId": 1700306283251608
          },
          "PaintJob": {
            "id": 128978299,
            "locDescription": "x",
            "locName": "x",
            "name": "PaintJob_PlasmaPistol_Default_Paintjob_01",
            "weaponrackId": 0
          }
        },
        "value": 50000,
        "weaponrackId": 1700306283251472
      }
    },
    "state": {
      "energy": 1,
      "oxygenRemaining": 60000
    },
    "suit": {
      "locName": "Combinaison Artemis",
      "name": "ExplorationSuit_Class1",
      "suitId": 1700861040224089
    }
  },
  "loadouts": [
    {
      "id": 128937264,
      "loadoutSlotId": 0,
      "name": "<Default>",
      "slots": {
        "BaseSuit": {
          "id": "128978336",
          "locDescription": "x",
          "locName": "x",
          "name": "Humanoid_BaseSuit_FreePack01Black",
          "weaponrackId": 0
        },
        "SecondaryWeapon": {
          "id": 128937316,
          "locDescription": "x",
          "locName": "Karma P-15",
          "name": "Wpn_S_Pistol_Kinetic_SAuto",
          "weaponrackId": 1700864328587790
        }
      },
      "suit": {
        "locName": "Combinaison de vol",
        "name": "FlightSuit",
        "suitId": 1700216326509418
      }
    },
    {
      "loadoutSlotId": 1,
      "name": "combat",
      "slots": {
        "PrimaryWeapon1": {
          "id": 128937271,
          "locDescription": "x",
          "locName": "Karma AR-50",
          "name": "Wpn_M_AssaultRifle_Kinetic_FAuto",
          "weaponrackId": 1700306258217091
        },
        "PrimaryWeapon2": {
          "id": 128937319,
          "locDescription": "x",
          "locName": "Manticore Executioner",
          "name": "Wpn_M_Sniper_Plasma_Charged",
          "weaponrackId": 1700306295596796
        },
        "SecondaryWeapon": {
          "id": 128937281,
          "locDescription": "x",
          "locName": "Manticore Tormentor",
          "name": "Wpn_S_Pistol_Plasma_Charged",
          "weaponrackId": 1700306283251472
        }
      },
      "suit": {
        "locName": "Combinaison Dominator",
        "name": "TacticalSuit_Class1",
        "suitId": 1700306057036239
      }
    },
    {
      "loadoutSlotId": 2,
      "name": "INGENIEUR",
      "slots": {
        "PrimaryWeapon1": {
          "id": 128937269,
          "locDescription": "x",
          "locName": "TK Aphelion",
          "name": "Wpn_M_AssaultRifle_Laser_FAuto",
          "weaponrackId": 1700861056567438
        },
        "SecondaryWeapon": {
          "id": 128937316,
          "locDescription": "x",
          "locName": "Karma P-15",
          "name": "Wpn_S_Pistol_Kinetic_SAuto",
          "weaponrackId": 1700864328587790
        }
      },
      "suit": {
        "locName": "Combinaison Maverick",
        "name": "UtilitySuit_Class1",
        "suitId": 1700861028549803
      }
    },
    {
      "loadoutSlotId": 3,
      "name": "EXPLORATEUR",
      "slots": {
        "PrimaryWeapon1": {
          "id": 128937319,
          "locDescription": "x",
          "locName": "Manticore Executioner",
          "name": "Wpn_M_Sniper_Plasma_Charged",
          "weaponrackId": 1700306295596796
        },
        "SecondaryWeapon": {
          "id": 128937281,
          "locDescription": "x",
          "locName": "Manticore Tormentor",
          "name": "Wpn_S_Pistol_Plasma_Charged",
          "weaponrackId": 1700306283251472
        }
      },
      "suit": {
        "locName": "Combinaison Artemis",
        "name": "ExplorationSuit_Class1",
        "suitId": 1700861040224089
      }
    }
  ],
  "ship": {
    "alive": true,
    "cockpitBreached": false,
    "free": false,
    "health": {
      "hull": 1000000,
      "integrity": 0,
      "paintwork": 0,
      "shield": 1000000,
      "shieldup": true
    },
    "id": 18,
    "launchBays": {
      "Slot03_Size6": {
        "SubSlot0": {
          "loadout": "advanced",
          "loadoutName": "lander01_loadout_advanced_name",
          "locName": "lander01_name",
          "name": "lander01",
          "rebuilds": 8
        },
        "SubSlot1": {
          "loadout": "advanced",
          "loadoutName": "lander01_loadout_advanced_name",
          "locName": "lander01_name",
          "name": "lander01",
          "rebuilds": 8
        }
      },
      "Slot08_Size4": {
        "SubSlot0": {
          "loadout": "starter",
          "loadoutName": "Basique",
          "locName": "Scarabée VRS",
          "name": "testbuggy",
          "rebuilds": 1
        },
        "SubSlot1": {
          "loadout": "default",
          "loadoutName": "Par défaut",
          "locName": "Scorpion VRS",
          "name": "combat_multicrew_srv_01",
          "rebuilds": 1
        }
      }
    },
    "modules": {
      "Armour": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 129036571,
          "locName": "Alliages légers ablatifs Mk II",
          "name": "Explorer_NX_Armour_Grade1",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "Decal1": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 129018321,
          "locName": "Decal_ExoBio_Directionless_Name",
          "name": "Decal_ExoBio_Directionless",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "Decal2": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128667755,
          "locName": "Decal_Explorer_Trailblazer_Name",
          "name": "Decal_Explorer_Trailblazer",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "Decal3": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 129045703,
          "locName": "Decal_NomadOwnersClub_01_Name",
          "name": "Decal_NomadOwnersClub_01",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "FrameShiftDrive": {
        "WorkInProgress_modifications": {
          "OutfittingFieldType_FSDOptimalMass": {
            "LessIsGood": false,
            "dir": "^",
            "displayValue": "5.00%",
            "locName": "Optimised mass",
            "value": 1.05
          },
          "OutfittingFieldType_Integrity": {
            "LessIsGood": false,
            "dir": "v",
            "displayValue": "-3.00%",
            "locName": "Integrity",
            "value": 0.97
          },
          "OutfittingFieldType_Mass": {
            "LessIsGood": true,
            "dir": "v",
            "displayValue": "-10.00%",
            "locName": "Mass",
            "value": 1.1
          },
          "OutfittingFieldType_PowerDraw": {
            "LessIsGood": true,
            "dir": "v",
            "displayValue": "-3.00%",
            "locName": "Power draw",
            "value": 1.03
          }
        },
        "engineer": {
          "engineerId": 300100,
          "engineerName": "Felicity Farseer",
          "recipeLevel": 1,
          "recipeLocDescription": "x",
          "recipeLocName": "Portée FSD améliorée",
          "recipeName": "FSD_LongRange"
        },
        "module": {
          "free": false,
          "health": 1000000,
          "id": 129038968,
          "locName": "FSD (SSN)",
          "name": "Int_Hyperdrive_Overcharge_Size8_Class5_OverchargeBooster_MkII",
          "on": true,
          "priority": 0,
          "value": 0
        },
        "specialModifications": []
      },
      "FuelTank": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128064352,
          "locName": "Réservoir",
          "name": "Int_FuelTank_Size7_Class3",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "LargeHardpoint1": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128671120,
          "locDescription": "x",
          "locName": "Canon",
          "name": "Hpt_Cannon_Gimbal_Large",
          "on": true,
          "priority": 0,
          "value": 1350400
        }
      },
      "LifeSupport": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128064159,
          "locName": "Systèmes de survie",
          "name": "Int_LifeSupport_Size5_Class2",
          "on": true,
          "priority": 2,
          "value": 0
        }
      },
      "MainEngines": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 129039228,
          "locName": "Propulseurs",
          "name": "Int_Engine_Size7_Class5_GravityOptimised_MkII",
          "on": true,
          "priority": 0,
          "value": 0
        }
      },
      "MediumHardpoint1": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128049463,
          "locName": "Multi-canon",
          "name": "Hpt_MultiCannon_Turret_Medium",
          "on": true,
          "priority": 0,
          "value": 1292800
        }
      },
      "MediumHardpoint2": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128049443,
          "locName": "Canon",
          "name": "Hpt_Cannon_Gimbal_Medium",
          "on": true,
          "priority": 0,
          "value": 337600
        }
      },
      "MediumHardpoint3": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128049386,
          "locName": "Laser à impuls.",
          "name": "Hpt_PulseLaser_Gimbal_Medium",
          "on": true,
          "priority": 0,
          "value": 35400
        }
      },
      "MediumHardpoint4": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128049386,
          "locName": "Laser à impuls.",
          "name": "Hpt_PulseLaser_Gimbal_Medium",
          "on": true,
          "priority": 0,
          "value": 35400
        }
      },
      "MediumHardpoint5": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128049388,
          "locName": "Laser à impuls.",
          "name": "Hpt_PulseLaser_Turret_Small",
          "on": true,
          "priority": 0,
          "value": 26000
        }
      },
      "MediumHardpoint6": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128049408,
          "locName": "Laser à rafale",
          "name": "Hpt_PulseLaserBurst_Turret_Medium",
          "on": true,
          "priority": 0,
          "value": 162800
        }
      },
      "PaintJob": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 129038688,
          "locName": "PaintJob_Explorer_NX_02_10_Name",
          "name": "PaintJob_Explorer_NX_02_10",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "PlanetaryApproachSuite": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128975719,
          "locName": "Inst. approche planétaire perf.",
          "name": "Int_PlanetApproachSuite_Advanced",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "PowerDistributor": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128064212,
          "locName": "Répartiteur de puissance",
          "name": "Int_PowerDistributor_Size7_Class5",
          "on": true,
          "priority": 2,
          "value": 0
        }
      },
      "PowerPlant": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128064067,
          "locName": "Générateur",
          "name": "Int_Powerplant_Size8_Class5",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "Radar": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128064254,
          "locName": "Capteurs",
          "name": "Int_Sensors_Size8_Class2",
          "on": true,
          "priority": 2,
          "value": 0
        }
      },
      "ShipID0": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128758972,
          "locName": "x",
          "name": "Nameplate_ShipID_DoubleLine_White",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "ShipID1": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128758972,
          "locName": "x",
          "name": "Nameplate_ShipID_DoubleLine_White",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "ShipKitBumper": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 129038670,
          "locName": "Deep Space - Pare-chocs",
          "name": "Explorer_NX_ShipkitB_Bumper1",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "ShipKitSpoiler": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 129038666,
          "locName": "Voyage - Déporteur 1",
          "name": "Explorer_NX_ShipkitA_Spoiler1",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "ShipKitWings": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 129038668,
          "locName": "Voyage - Ailes 1",
          "name": "Explorer_NX_ShipkitA_Wings1",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "ShipName0": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128759072,
          "locName": "Nameplate_Wings01_White_Name",
          "name": "Nameplate_Wings01_White",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "ShipName1": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128759072,
          "locName": "Nameplate_Wings01_White_Name",
          "name": "Nameplate_Wings01_White",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "Slot01_Size7": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128666682,
          "locName": "Récupérateur de carburant",
          "name": "Int_FuelScoop_Size7_Class5",
          "on": true,
          "priority": 2,
          "value": 0
        }
      },
      "Slot02_Size6": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128667635,
          "locName": "Unité MAE",
          "name": "Int_Repairer_Size6_Class5",
          "on": true,
          "priority": 2,
          "value": 0
        }
      },
      "Slot03_Size6": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 129045678,
          "locName": "Hangar à vaisseaux Mk II (Gratuit)",
          "name": "Int_FighterBayMk2_Size6_Class1_Free",
          "on": true,
          "priority": 0,
          "value": 0
        }
      },
      "Slot05_Size5": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128064279,
          "locName": "Générateur de bouclier",
          "name": "Int_ShieldGenerator_Size5_Class2",
          "on": true,
          "priority": 2,
          "value": 0
        }
      },
      "Slot08_Size4": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128672291,
          "locName": "Hangar des véhicules planétaires",
          "name": "Int_BuggyBay_Size4_Class2",
          "on": true,
          "priority": 0,
          "value": 0
        }
      },
      "Slot09_Size4": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128064341,
          "locName": "Compartiment soute",
          "name": "Int_CargoRack_Size4_Class1",
          "on": true,
          "priority": 1,
          "value": 0
        }
      },
      "Slot11_Size2": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128793116,
          "locName": "Recherche",
          "name": "Int_DroneControl_UnkVesselResearch",
          "on": true,
          "priority": 2,
          "value": 0
        }
      },
      "Slot12_Size1": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128666634,
          "locName": "Détecteur de surface",
          "name": "Int_DetailedSurfaceScanner_Tiny",
          "on": true,
          "priority": 2,
          "value": 0
        }
      },
      "Slot13_Size1": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128932273,
          "locName": "Super-navigation assistée",
          "name": "Int_SupercruiseAssist",
          "on": true,
          "priority": 2,
          "value": 0
        }
      },
      "Slot14_Size1": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128935155,
          "locName": "Ordinateur d'appontage",
          "name": "Int_DockingComputer_Advanced",
          "on": true,
          "priority": 2,
          "value": 0
        }
      },
      "TinyHardpoint1": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128049519,
          "locName": "Dissipateur thermique",
          "name": "Hpt_HeatSinkLauncher_Turret_Tiny",
          "on": true,
          "priority": 2,
          "value": 0
        }
      },
      "TinyHardpoint2": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128049522,
          "locName": "Tourelle de défense ponctuelle",
          "name": "Hpt_PlasmaPointDefence_Turret_Tiny",
          "on": true,
          "priority": 0,
          "value": 18546
        }
      },
      "TinyHardpoint5": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128049522,
          "locName": "Tourelle de défense ponctuelle",
          "name": "Hpt_PlasmaPointDefence_Turret_Tiny",
          "on": true,
          "priority": 0,
          "value": 18546
        }
      },
      "VesselVoice": {
        "module": {
          "free": false,
          "health": 1000000,
          "id": 128824469,
          "locName": "COVAS Verity",
          "name": "VoicePack_Verity",
          "on": true,
          "priority": 1,
          "value": 0
        }
      }
    },
    "name": "Explorer_NX",
    "oxygenRemaining": 450000,
    "shipID": "CMD-04",
    "shipName": "VAISSEAU 4",
    "starsystem": {
      "id": 2931088689515,
      "name": "Caeritis",
      "systemaddress": 2931088689515
    },
    "station": {
      "id": 3229849856,
      "name": "Bernoulli Vision"
    },
    "value": {
      "cargo": 0,
      "hull": 0,
      "modules": 3277492,
      "total": 3277492,
      "unloaned": 0
    }
  },
  "ships": {
    "10": {
      "free": false,
      "id": 10,
      "name": "Asp",
      "shipID": "CMD-07",
      "shipName": "VAISSEAU 7",
      "starsystem": {
        "id": 2415692581235,
        "name": "Cubeo",
        "systemaddress": 2415692581235
      },
      "station": {
        "id": 3224982272,
        "name": "Medupe City"
      },
      "value": {
        "cargo": 0,
        "hull": 6661154,
        "modules": 14077576,
        "total": 20738730,
        "unloaned": 0
      }
    },
    "13": {
      "free": false,
      "id": 13,
      "name": "Python_NX",
      "shipID": "CMD-02",
      "shipName": "VAISSEAU 2",
      "starsystem": {
        "id": 2415692581235,
        "name": "Cubeo",
        "systemaddress": 2415692581235
      },
      "station": {
        "id": 3224982272,
        "name": "Medupe City"
      },
      "value": {
        "cargo": 0,
        "hull": 0,
        "modules": 303653,
        "total": 303653,
        "unloaned": 0
      }
    },
    "15": {
      "free": false,
      "id": 15,
      "name": "MediumTransport01",
      "shipID": "CMD-03",
      "shipName": "VAISSEAU 3",
      "starsystem": {
        "id": 2415692581235,
        "name": "Cubeo",
        "systemaddress": 2415692581235
      },
      "station": {
        "id": 3224982272,
        "name": "Medupe City"
      },
      "value": {
        "cargo": 0,
        "hull": 0,
        "modules": 902954,
        "total": 902954,
        "unloaned": 0
      }
    },
    "18": {
      "free": false,
      "id": 18,
      "name": "Explorer_NX",
      "shipID": "CMD-04",
      "shipName": "VAISSEAU 4",
      "starsystem": {
        "id": 2931088689515,
        "name": "Caeritis",
        "systemaddress": 2931088689515
      },
      "station": {
        "id": 3229849856,
        "name": "Bernoulli Vision"
      },
      "value": {
        "cargo": 0,
        "hull": 0,
        "modules": 3277492,
        "total": 3277492,
        "unloaned": 0
      }
    },
    "2": {
      "free": false,
      "id": 2,
      "name": "Empire_Trader",
      "shipID": "CMD-08",
      "shipName": "VAISSEAU 8",
      "starsystem": {
        "id": 2415692581235,
        "name": "Cubeo",
        "systemaddress": 2415692581235
      },
      "station": {
        "id": 3224982272,
        "name": "Medupe City"
      },
      "value": {
        "cargo": 0,
        "hull": 21107774,
        "modules": 51028982,
        "total": 72136756,
        "unloaned": 159769
      }
    },
    "22": {
      "free": false,
      "id": 22,
      "name": "BelugaLiner",
      "shipID": "CMD-01",
      "shipName": "VAISSEAU 1",
      "starsystem": {
        "id": 2415692581235,
        "name": "Cubeo",
        "systemaddress": 2415692581235
      },
      "station": {
        "id": 3224982272,
        "name": "Medupe City"
      },
      "value": {
        "cargo": 0,
        "hull": 0,
        "modules": 4500,
        "total": 4500,
        "unloaned": 0
      }
    },
    "6": {
      "free": false,
      "id": 6,
      "name": "Empire_Courier",
      "shipID": "CMD-06",
      "shipName": "VAISSEAU 6",
      "starsystem": {
        "id": 2415692581235,
        "name": "Cubeo",
        "systemaddress": 2415692581235
      },
      "station": {
        "id": 3224982272,
        "name": "Medupe City"
      },
      "value": {
        "cargo": 0,
        "hull": 2461509,
        "modules": 5589947,
        "total": 8051456,
        "unloaned": 53285
      }
    },
    "9": {
      "free": false,
      "id": 9,
      "name": "Empire_Eagle",
      "shipID": "CMD-05",
      "shipName": "VAISSEAU 5",
      "starsystem": {
        "id": 2415692581235,
        "name": "Cubeo",
        "systemaddress": 2415692581235
      },
      "station": {
        "id": 3224982272,
        "name": "Medupe City"
      },
      "value": {
        "cargo": 0,
        "hull": 50390,
        "modules": 3266651,
        "total": 3317041,
        "unloaned": 49897
      }
    }
  },
  "suit": {
    "id": 128958659,
    "locName": "Combinaison Artemis",
    "name": "ExplorationSuit_Class1",
    "slots": [],
    "state": {
      "health": {
        "hull": 1000000
      }
    },
    "suitId": 1700861040224089
  },
  "suits": {
    "1700216326509418": {
      "id": 128937264,
      "locName": "Combinaison de vol",
      "name": "FlightSuit",
      "slots": [],
      "suitId": 1700216326509418
    },
    "1700306057036239": {
      "id": 128957874,
      "locName": "Combinaison Dominator",
      "name": "TacticalSuit_Class1",
      "slots": [],
      "suitId": 1700306057036239
    },
    "1700861028549803": {
      "id": 128958394,
      "locName": "Combinaison Maverick",
      "name": "UtilitySuit_Class1",
      "slots": [],
      "suitId": 1700861028549803
    },
    "1700861040224089": {
      "id": 128958659,
      "locName": "Combinaison Artemis",
      "name": "ExplorationSuit_Class1",
      "slots": [],
      "suitId": 1700861040224089
    }
  }
}
''';

/// The same capture, decoded once.
final Map<String, dynamic> capiProfileCaptureJson =
    jsonDecode(capiProfileCapture) as Map<String, dynamic>;
