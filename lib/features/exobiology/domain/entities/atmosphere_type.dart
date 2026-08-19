/// Atmosphere composition of a landable body.
///
/// Exobiology only occurs on bodies with a *thin* atmosphere (or none, for a
/// handful of special organics), and the composition is the single strongest
/// predictor of which genus can grow there.
enum AtmosphereType {
  none('none', 'Aucune'),
  ammonia('ammonia', 'Ammoniac'),
  argon('argon', 'Argon'),
  carbonDioxide('carbon_dioxide', 'Dioxyde de carbone'),
  helium('helium', 'Hélium'),
  methane('methane', 'Méthane'),
  neon('neon', 'Néon'),
  nitrogen('nitrogen', 'Azote'),
  oxygen('oxygen', 'Oxygène'),
  sulphurDioxide('sulphur_dioxide', 'Dioxyde de soufre'),
  water('water', 'Eau'),
  unknown('unknown', 'Inconnue');

  const AtmosphereType(this.code, this.label);

  final String code;
  final String label;

  static AtmosphereType fromCode(String? code) => values.firstWhere(
        (AtmosphereType value) => value.code == code,
        orElse: () => AtmosphereType.unknown,
      );

  /// Parses the Journal's free-form `Atmosphere` string, e.g.
  /// `"thin sulphur dioxide atmosphere"`, `"Thin Ammonia"`, `"No atmosphere"`,
  /// as well as the `AtmosphereType` enum-ish field (`"SulphurDioxide"`).
  static AtmosphereType fromJournal(String? raw) {
    if (raw == null || raw.trim().isEmpty) {
      return AtmosphereType.unknown;
    }
    final String n = raw.toLowerCase().replaceAll(RegExp(r'[\s_-]'), '');
    if (n.isEmpty || n == 'none' || n.startsWith('noatmosphere')) {
      return AtmosphereType.none;
    }
    if (n.contains('sulphurdioxide') || n.contains('sulfurdioxide')) {
      return AtmosphereType.sulphurDioxide;
    }
    if (n.contains('carbondioxide')) {
      return AtmosphereType.carbonDioxide;
    }
    if (n.contains('ammonia')) {
      return AtmosphereType.ammonia;
    }
    if (n.contains('nitrogen')) {
      return AtmosphereType.nitrogen;
    }
    if (n.contains('methane')) {
      return AtmosphereType.methane;
    }
    if (n.contains('argon')) {
      return AtmosphereType.argon;
    }
    if (n.contains('neon')) {
      return AtmosphereType.neon;
    }
    if (n.contains('oxygen')) {
      return AtmosphereType.oxygen;
    }
    if (n.contains('helium')) {
      return AtmosphereType.helium;
    }
    if (n.contains('water')) {
      return AtmosphereType.water;
    }
    return AtmosphereType.unknown;
  }
}
