/// Turns the journal's micro-resource names into one stable vocabulary.
///
/// Frontier writes every inventory line twice: `Name` is an internal symbol,
/// lower-cased and stripped of spaces (`healthmonitor`), and `Name_Localised`
/// is what the commander reads — **in the language their client runs in**.
/// The Journal Manual is explicit about it (§2.4), and it omits the localised
/// key entirely when it would repeat the symbol.
///
/// Keying an inventory on `Name_Localised` therefore produces French keys on a
/// French client, and nothing in the app can match them: every material the
/// app reasons about — the Artemis grade steps, the roadmap, the manual
/// overrides the commander has already saved — is named in English, because
/// that is the vocabulary the guides and the community use.
///
/// So the symbol is resolved back to that English name here, once, at the
/// parser. Anything unknown keeps its localised name: an inventory line the
/// app has no opinion about is still worth showing, and showing it in the
/// commander's language is better than showing `manufacturinginstructions`.
abstract final class MicroResourceNames {
  /// Symbol → the English name the rest of the app uses.
  ///
  /// Deliberately explicit rather than derived, and the ship materials are why.
  /// The Odyssey convention is "display name, lower-cased, spaces removed", and
  /// it holds for every micro-resource below — but **32 of the 108 ship
  /// materials break it**: `disruptedwakeechoes` is *Atypical Disrupted Wake
  /// Echoes*, `dataminedwake` is *Datamined Wake Exceptions*, `fedcorecomposites`
  /// is *Core Dynamics Composites*. Any rule inferred from the well-behaved
  /// three quarters would mis-name the rest, silently.
  ///
  /// The ship half is transcribed from `EDCD/FDevIDs`, the game's own
  /// identifier table, and `materials_catalog_test.dart` holds it against
  /// `assets/data/materials.json` in both directions so the two cannot drift.
  static const Map<String, String> _canonical = <String, String>{
    // --- Suit grade components: the five the Artemis actually costs ---------
    'suitschematic': 'Suit Schematic',
    'healthmonitor': 'Health Monitor',
    'manufacturinginstructions': 'Manufacturing Instructions',
    'aerogel': 'Aerogel',
    'graphene': 'Graphene',

    // --- The other two suits' plating, so a Maverick or Dominator owner sees
    //     the same names the guides use ------------------------------------
    'carbonfibreplating': 'Carbon Fibre Plating',
    'titaniumplating': 'Titanium Plating',

    // --- Referral items the suit engineers ask for -------------------------
    'settlementdefenceplans': 'Settlement Defence Plans',
    'geneticrepairmeds': 'Genetic Repair Meds',
    'financialprojections': 'Financial Projections',
    'surveillanceequipment': 'Surveillance Equipment',
    'opinionpolls': 'Opinion Polls',
    'smearcampaignplans': 'Smear Campaign Plans',
    'insightentertainmentsuite': 'Insight Entertainment Suite',
    'push': 'Push',

    // --- Raw: the 28 surface and asteroid elements -----------------------
    'carbon': 'Carbon',
    'vanadium': 'Vanadium',
    'niobium': 'Niobium',
    'yttrium': 'Yttrium',
    'phosphorus': 'Phosphorus',
    'chromium': 'Chromium',
    'molybdenum': 'Molybdenum',
    'technetium': 'Technetium',
    'sulphur': 'Sulphur',
    'manganese': 'Manganese',
    'cadmium': 'Cadmium',
    'ruthenium': 'Ruthenium',
    'iron': 'Iron',
    'zinc': 'Zinc',
    'tin': 'Tin',
    'selenium': 'Selenium',
    'nickel': 'Nickel',
    'germanium': 'Germanium',
    'tungsten': 'Tungsten',
    'tellurium': 'Tellurium',
    'rhenium': 'Rhenium',
    'arsenic': 'Arsenic',
    'mercury': 'Mercury',
    'polonium': 'Polonium',
    'lead': 'Lead',
    'zirconium': 'Zirconium',
    'boron': 'Boron',
    'antimony': 'Antimony',

    // --- Manufactured: 50 salvage and High Grade Emission components ------
    'salvagedalloys': 'Salvaged Alloys',
    'galvanisingalloys': 'Galvanising Alloys',
    'phasealloys': 'Phase Alloys',
    'protolightalloys': 'Proto Light Alloys',
    'protoradiolicalloys': 'Proto Radiolic Alloys',
    'gridresistors': 'Grid Resistors',
    'hybridcapacitors': 'Hybrid Capacitors',
    'electrochemicalarrays': 'Electrochemical Arrays',
    'polymercapacitors': 'Polymer Capacitors',
    'militarysupercapacitors': 'Military Supercapacitors',
    'chemicalstorageunits': 'Chemical Storage Units',
    'chemicalprocessors': 'Chemical Processors',
    'chemicaldistillery': 'Chemical Distillery',
    'chemicalmanipulators': 'Chemical Manipulators',
    'pharmaceuticalisolators': 'Pharmaceutical Isolators',
    'compactcomposites': 'Compact Composites',
    'filamentcomposites': 'Filament Composites',
    'highdensitycomposites': 'High Density Composites',
    'fedproprietarycomposites': 'Proprietary Composites',
    'fedcorecomposites': 'Core Dynamics Composites',
    'basicconductors': 'Basic Conductors',
    'conductivecomponents': 'Conductive Components',
    'conductiveceramics': 'Conductive Ceramics',
    'conductivepolymers': 'Conductive Polymers',
    'biotechconductors': 'Biotech Conductors',
    'crystalshards': 'Crystal Shards',
    'uncutfocuscrystals': 'Flawed Focus Crystals',
    'focuscrystals': 'Focus Crystals',
    'refinedfocuscrystals': 'Refined Focus Crystals',
    'exquisitefocuscrystals': 'Exquisite Focus Crystals',
    'heatconductionwiring': 'Heat Conduction Wiring',
    'heatdispersionplate': 'Heat Dispersion Plate',
    'heatexchangers': 'Heat Exchangers',
    'heatvanes': 'Heat Vanes',
    'protoheatradiators': 'Proto Heat Radiators',
    'mechanicalscrap': 'Mechanical Scrap',
    'mechanicalequipment': 'Mechanical Equipment',
    'mechanicalcomponents': 'Mechanical Components',
    'configurablecomponents': 'Configurable Components',
    'improvisedcomponents': 'Improvised Components',
    'wornshieldemitters': 'Worn Shield Emitters',
    'shieldemitters': 'Shield Emitters',
    'shieldingsensors': 'Shielding Sensors',
    'compoundshielding': 'Compound Shielding',
    'imperialshielding': 'Imperial Shielding',
    'temperedalloys': 'Tempered Alloys',
    'heatresistantceramics': 'Heat Resistant Ceramics',
    'precipitatedalloys': 'Precipitated Alloys',
    'thermicalloys': 'Thermic Alloys',
    'militarygradealloys': 'Military Grade Alloys',

    // --- Encoded: 30 data materials --------------------------------------
    'bulkscandata': 'Anomalous Bulk Scan Data',
    'scanarchives': 'Unidentified Scan Archives',
    'scandatabanks': 'Classified Scan Databanks',
    'encodedscandata': 'Divergent Scan Data',
    'classifiedscandata': 'Classified Scan Fragment',
    'scrambledemissiondata': 'Exceptional Scrambled Emission Data',
    'archivedemissiondata': 'Irregular Emission Data',
    'emissiondata': 'Unexpected Emission Data',
    'decodedemissiondata': 'Decoded Emission Data',
    'compactemissionsdata': 'Abnormal Compact Emissions Data',
    'legacyfirmware': 'Specialised Legacy Firmware',
    'consumerfirmware': 'Modified Consumer Firmware',
    'industrialfirmware': 'Cracked Industrial Firmware',
    'securityfirmware': 'Security Firmware Patch',
    'embeddedfirmware': 'Modified Embedded Firmware',
    'encryptedfiles': 'Unusual Encrypted Files',
    'encryptioncodes': 'Tagged Encryption Codes',
    'symmetrickeys': 'Open Symmetric Keys',
    'encryptionarchives': 'Atypical Encryption Archives',
    'adaptiveencryptors': 'Adaptive Encryptors Capture',
    'shieldcyclerecordings': 'Distorted Shield Cycle Recordings',
    'shieldsoakanalysis': 'Inconsistent Shield Soak Analysis',
    'shielddensityreports': 'Untypical Shield Scans',
    'shieldpatternanalysis': 'Aberrant Shield Pattern Analysis',
    'shieldfrequencydata': 'Peculiar Shield Frequency Data',
    'disruptedwakeechoes': 'Atypical Disrupted Wake Echoes',
    'fsdtelemetry': 'Anomalous FSD Telemetry',
    'wakesolutions': 'Strange Wake Solutions',
    'hyperspacetrajectories': 'Eccentric Hyperspace Trajectories',
    'dataminedwake': 'Datamined Wake Exceptions',
  };

  /// Every symbol the table resolves, for the test that holds it against
  /// `assets/data/materials.json`.
  static Iterable<String> get knownSymbols => _canonical.keys;

  /// The canonical name for one inventory line.
  ///
  /// [symbol] is the journal's `Name`, [localised] its `Name_Localised`.
  /// Returns `null` only when neither is usable.
  static String? canonical(String? symbol, String? localised) {
    final String? key = _key(symbol);
    if (key != null) {
      final String? known = _canonical[key];
      if (known != null) {
        return known;
      }
    }

    final String fallback = localised?.trim() ?? '';
    if (fallback.isNotEmpty) {
      return fallback;
    }
    final String raw = symbol?.trim() ?? '';
    return raw.isEmpty ? null : raw;
  }

  /// The lookup key for a symbol: unwrapped from `$…_name;` when Frontier
  /// wrote the template form, lower-cased.
  ///
  /// Both forms occur — `ShipLocker` writes `healthmonitor`, while some events
  /// write `$healthmonitor_name;` for the same item.
  static String? _key(String? symbol) {
    final String raw = symbol?.trim() ?? '';
    if (raw.isEmpty) {
      return null;
    }
    final RegExpMatch? wrapped =
        RegExp(r'^\$(.+?)_name;$', caseSensitive: false).firstMatch(raw);
    return (wrapped?.group(1) ?? raw).toLowerCase();
  }
}
