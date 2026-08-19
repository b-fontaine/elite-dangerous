import '../entities/commander_snapshot.dart';
import '../entities/roadmap.dart';

/// A single piece of advice, expressed as a pure function of the commander's
/// state.
///
/// Rules are first-class so the roadmap stays open for extension: a future
/// "mining" or "trading" roadmap reuses [ExobiologyRoadmapEngine] with a
/// different rule set instead of forking the engine.
abstract class RoadmapRule {
  const RoadmapRule();

  /// Stable identifier, also used as the [RoadmapStep.id].
  String get id;

  /// Returns the step this rule contributes, or `null` when the rule is not
  /// relevant to this commander at all.
  ///
  /// A rule must **not** look at prerequisites of other rules: the engine
  /// resolves blocking centrally so a rule stays independently testable.
  RoadmapStep? evaluate(CommanderSnapshot snapshot);
}
