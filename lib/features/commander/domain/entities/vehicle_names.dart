/// Human names for the ship-launched vehicles Frontier does not translate.
///
/// The Companion API returns a `locName` that is sometimes a real translation
/// (`Scarabée VRS`) and sometimes the untranslated localisation key
/// (`lander01_name`). The key is worse than useless on screen, so it is
/// dropped — which leaves the raw symbol, and `lander01` tells a commander
/// nothing about the Nomad parked in their hangar.
///
/// The mapping is small on purpose: only the vehicles Frontier fails to
/// translate need an entry, and every one of them is verified rather than
/// guessed. `lander01` is the Nomad — Frontier's own store sells it under
/// `FORC_FDEV_V_LANDER01_BUNDLE_001`, and it loads from the Vessel Hangar
/// (`Int_FighterBayMk2`) rather than a planetary vehicle bay.
abstract final class VehicleNames {
  static const Map<String, String> _bySymbol = <String, String>{
    'lander01': 'Nomad',
    'testbuggy': 'Scarabée VRS',
    'combat_multicrew_srv_01': 'Scorpion VRS',
  };

  /// Loadout names, which Frontier leaves as keys for the same vehicles.
  static const Map<String, String> _loadoutBySuffix = <String, String>{
    'starter': 'Basique',
    'default': 'Par défaut',
    'advanced': 'Avancé',
    'standard': 'Standard',
  };

  /// A readable name for [symbol], preferring [locName] when Frontier actually
  /// translated it.
  static String resolve(String symbol, {String? locName}) {
    if (locName != null && locName.isNotEmpty && !isLocalisationKey(locName)) {
      return locName;
    }
    return _bySymbol[symbol.toLowerCase()] ?? symbol;
  }

  /// A readable loadout name.
  ///
  /// Frontier writes `lander01_loadout_advanced_name`; the meaningful part is
  /// the middle word, and the vehicle prefix is already known from the symbol.
  static String? resolveLoadout(String? loadout, {String? locName}) {
    if (locName != null && locName.isNotEmpty && !isLocalisationKey(locName)) {
      return locName;
    }
    if (loadout == null || loadout.isEmpty) {
      return null;
    }
    return _loadoutBySuffix[loadout.toLowerCase()] ?? loadout;
  }

  /// `lander01_name`, `lander01_loadout_advanced_name` — a key, not a name.
  static bool isLocalisationKey(String value) {
    final String lower = value.toLowerCase();
    return lower.endsWith('_name') || lower.endsWith('_info');
  }
}
