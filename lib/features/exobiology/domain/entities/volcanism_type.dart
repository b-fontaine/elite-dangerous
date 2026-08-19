/// Surface volcanism, required by `Fumerola` and a few other organics.
enum VolcanismType {
  none('none', 'Aucun'),
  water('water', 'Geysers d\'eau'),
  carbonDioxide('carbon_dioxide', 'Geysers de CO₂'),
  ammonia('ammonia', 'Magma d\'ammoniac'),
  methane('methane', 'Magma de méthane'),
  nitrogen('nitrogen', 'Magma d\'azote'),
  silicate('silicate', 'Magma silicaté'),
  ironMagma('iron_magma', 'Magma ferreux'),
  rocky('rocky', 'Volcanisme rocheux'),
  any('any', 'Volcanisme actif'),
  unknown('unknown', 'Inconnu');

  const VolcanismType(this.code, this.label);

  final String code;
  final String label;

  bool get isActive =>
      this != VolcanismType.none && this != VolcanismType.unknown;

  static VolcanismType fromCode(String? code) => values.firstWhere(
        (VolcanismType value) => value.code == code,
        orElse: () => VolcanismType.unknown,
      );

  /// Parses the Journal's `Volcanism` string, e.g.
  /// `"minor silicate vapour geysers volcanism"` or `""` for none.
  static VolcanismType fromJournal(String? raw) {
    if (raw == null) {
      return VolcanismType.unknown;
    }
    final String n = raw.toLowerCase();
    if (n.trim().isEmpty || n.contains('no volcanism')) {
      return VolcanismType.none;
    }
    if (n.contains('water')) {
      return VolcanismType.water;
    }
    if (n.contains('carbon dioxide')) {
      return VolcanismType.carbonDioxide;
    }
    if (n.contains('ammonia')) {
      return VolcanismType.ammonia;
    }
    if (n.contains('methane')) {
      return VolcanismType.methane;
    }
    if (n.contains('nitrogen')) {
      return VolcanismType.nitrogen;
    }
    if (n.contains('silicate')) {
      return VolcanismType.silicate;
    }
    if (n.contains('iron')) {
      return VolcanismType.ironMagma;
    }
    if (n.contains('rocky')) {
      return VolcanismType.rocky;
    }
    return VolcanismType.any;
  }
}
