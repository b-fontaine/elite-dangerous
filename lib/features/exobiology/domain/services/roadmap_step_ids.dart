/// Canonical roadmap step identifiers.
///
/// Centralised because three things key off them: the rules' prerequisite
/// lists, the commander's manually ticked steps persisted in local storage, and
/// [RoadmapDeclarationResolver], which turns those ticks back into domain
/// state. A typo in any of the three would silently break the chain.
abstract final class RoadmapStepIds {
  static const String artemisSuit = 'equipment.artemis_suit';
  static const String artemisGradeTwo = 'equipment.artemis_grade_2';
  static const String maverickSuit = 'equipment.maverick_suit';
  static const String detailedSurfaceScanner =
      'equipment.detailed_surface_scanner';
  static const String exobiologyShip = 'equipment.exobiology_ship';

  static const String artemisMaterials = 'materials.artemis_upgrade';

  static const String samplingLoop = 'technique.sampling_loop';
  static const String stratumHeuristic = 'technique.stratum_heuristic';
  static const String bubbleLoop = 'field.bubble_loop';

  static const String sellRun = 'discipline.sell_run';

  static const String deepSpaceExpedition = 'expedition.first_logged';
  static const String pranavAntal = 'economy.pranav_antal';
  static const String fleetCarrier = 'economy.fleet_carrier';

  static const String guardianFsdBooster = 'unlock.guardian_fsd_booster';
  static const String fsdIncreasedRange = 'engineering.fsd_increased_range';
  static const String massManager = 'engineering.mass_manager';

  /// `unlock.<engineerId>` — see [RoadmapDeclarationResolver].
  static const String unlockPrefix = 'unlock.';

  /// `engineering.<modificationId>`.
  static const String engineeringPrefix = 'engineering.';

  static String unlock(String engineerId) => '$unlockPrefix$engineerId';

  static String engineering(String modificationId) =>
      '$engineeringPrefix$modificationId';
}
