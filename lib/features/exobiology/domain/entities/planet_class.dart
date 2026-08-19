/// Body classes that can carry organic life, as named by the game's Journal
/// (`Scan` event, `PlanetClass` field).
enum PlanetClass {
  rockyBody('Rocky body', 'Rocheuse'),
  highMetalContentBody('High metal content body', 'Haute teneur métallique'),
  icyBody('Icy body', 'Glacée'),
  rockyIceBody('Rocky ice body', 'Rocheuse glacée'),
  metalRichBody('Metal rich body', 'Riche en métaux'),
  unknown('Unknown', 'Inconnue');

  const PlanetClass(this.journalName, this.label);

  /// Exact string used by the Journal and the Companion API.
  final String journalName;

  /// French label shown in the UI.
  final String label;

  /// Short code used in the bundled catalogue JSON.
  String get code => switch (this) {
        PlanetClass.rockyBody => 'rocky',
        PlanetClass.highMetalContentBody => 'hmc',
        PlanetClass.icyBody => 'icy',
        PlanetClass.rockyIceBody => 'rocky_ice',
        PlanetClass.metalRichBody => 'metal_rich',
        PlanetClass.unknown => 'unknown',
      };

  static PlanetClass fromCode(String? code) => values.firstWhere(
        (PlanetClass value) => value.code == code,
        orElse: () => PlanetClass.unknown,
      );

  /// Tolerant parser for Journal / CAPI payloads, which vary in casing and
  /// sometimes omit the trailing "body".
  static PlanetClass fromJournal(String? raw) {
    if (raw == null || raw.isEmpty) {
      return PlanetClass.unknown;
    }
    final String normalised = raw.toLowerCase().trim();
    if (normalised.contains('high metal')) {
      return PlanetClass.highMetalContentBody;
    }
    if (normalised.contains('metal rich') || normalised.contains('metal-rich')) {
      return PlanetClass.metalRichBody;
    }
    if (normalised.contains('rocky ice') || normalised.contains('rocky-ice')) {
      return PlanetClass.rockyIceBody;
    }
    if (normalised.contains('icy')) {
      return PlanetClass.icyBody;
    }
    if (normalised.contains('rocky')) {
      return PlanetClass.rockyBody;
    }
    return PlanetClass.unknown;
  }
}
