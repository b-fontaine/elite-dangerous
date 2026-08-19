/// Parent star class.
///
/// Two things depend on it: fuel scooping (the KGBFOAM rule) and — crucially
/// for exobiology — the *colour variant* of most genera, which is keyed to the
/// class of the star the body orbits.
enum StarClass {
  o('O', 'O — bleue géante', true),
  b('B', 'B — bleu-blanc', true),
  a('A', 'A — blanche', true),
  f('F', 'F — blanc-jaune', true),
  g('G', 'G — jaune (type solaire)', true),
  k('K', 'K — orange', true),
  m('M', 'M — naine rouge', true),
  l('L', 'L — naine brune L', false),
  t('T', 'T — naine brune T', false),
  y('Y', 'Y — naine brune Y', false),
  tTauri('TTS', 'T Tauri', false),
  aeBe('AEBE', 'Herbig Ae/Be', false),
  wolfRayet('W', 'Wolf-Rayet', false),
  carbonStar('C', 'Étoile carbonée', false),
  whiteDwarf('D', 'Naine blanche', false),
  neutronStar('N', 'Étoile à neutrons', false),
  blackHole('H', 'Trou noir', false),
  unknown('?', 'Inconnue', false);

  const StarClass(this.code, this.label, this.scoopable);

  final String code;
  final String label;

  /// KGBFOAM: the only classes a fuel scoop can refuel from.
  final bool scoopable;

  static StarClass fromCode(String? code) {
    if (code == null || code.isEmpty) {
      return StarClass.unknown;
    }
    final String upper = code.toUpperCase();
    return values.firstWhere(
      (StarClass value) => value.code == upper,
      orElse: () => StarClass.unknown,
    );
  }

  /// Parses the Journal's `StarType` (`"M"`, `"TTS"`, `"D"`, `"DA"`, `"H"`…).
  static StarClass fromJournal(String? raw) {
    if (raw == null || raw.isEmpty) {
      return StarClass.unknown;
    }
    final String upper = raw.toUpperCase();
    if (upper.startsWith('TTS')) {
      return StarClass.tTauri;
    }
    if (upper.startsWith('AEBE')) {
      return StarClass.aeBe;
    }
    if (upper.startsWith('W')) {
      return StarClass.wolfRayet;
    }
    if (upper.startsWith('D')) {
      return StarClass.whiteDwarf;
    }
    if (upper.startsWith('N')) {
      return StarClass.neutronStar;
    }
    if (upper.startsWith('H') || upper.startsWith('SUPERMASSIVEBLACKHOLE')) {
      return StarClass.blackHole;
    }
    if (upper.startsWith('C')) {
      return StarClass.carbonStar;
    }
    return fromCode(upper.substring(0, 1));
  }
}
