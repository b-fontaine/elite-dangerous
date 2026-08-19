import '../entities/commander_snapshot.dart';
import '../entities/roadmap.dart';
import 'exobiology_roadmap_rules.dart';
import 'roadmap_declaration_resolver.dart';
import 'roadmap_rule.dart';

/// Turns a [CommanderSnapshot] into a prioritised [Roadmap].
///
/// The engine is a pure function: same snapshot in, same roadmap out. All the
/// game knowledge lives in the [rules]; the engine only orchestrates them —
/// evaluate, apply the commander's own overrides, resolve prerequisites, sort.
class ExobiologyRoadmapEngine {
  const ExobiologyRoadmapEngine({
    this.rules = exobiologyRoadmapRules,
    this.declarationResolver = const RoadmapDeclarationResolver(),
  });

  final List<RoadmapRule> rules;

  /// Folds manually ticked steps back into the snapshot before the rules run,
  /// so a commander's own statements about their save unblock what follows.
  final RoadmapDeclarationResolver declarationResolver;

  Roadmap build(CommanderSnapshot rawSnapshot) {
    final CommanderSnapshot snapshot = declarationResolver.resolve(rawSnapshot);

    final List<RoadmapStep> evaluated = <RoadmapStep>[
      for (final RoadmapRule rule in rules)
        if (rule.evaluate(snapshot) case final RoadmapStep step) step,
    ];

    final Map<String, RoadmapStep> byId = <String, RoadmapStep>{
      for (final RoadmapStep step in evaluated) step.id: step,
    };

    final List<RoadmapStep> resolved = evaluated
        .map((RoadmapStep step) => _applyOverrides(step, snapshot))
        .map((RoadmapStep step) => _resolveBlocking(step, byId, snapshot))
        .toList();

    resolved.sort(_compare);

    final RoadmapPhase phase = _currentPhase(resolved);
    return Roadmap(
      steps: List<RoadmapStep>.unmodifiable(resolved),
      currentPhase: phase,
      headline: _headline(resolved, phase, snapshot),
      rank: snapshot.exobiologistRank,
      generatedFor: snapshot.commanderName,
    );
  }

  /// The commander can tick a step off or skip it; their word wins over the
  /// inferred state, because the app can only ever see part of their save.
  RoadmapStep _applyOverrides(RoadmapStep step, CommanderSnapshot snapshot) {
    if (snapshot.dismissedRoadmapStepIds.contains(step.id)) {
      return step.copyWith(status: RoadmapStatus.dismissed);
    }
    if (snapshot.completedRoadmapStepIds.contains(step.id)) {
      return step.copyWith(status: RoadmapStatus.done);
    }
    return step;
  }

  /// A step whose prerequisites are not all satisfied becomes blocked, and
  /// says so explicitly rather than silently disappearing.
  RoadmapStep _resolveBlocking(
    RoadmapStep step,
    Map<String, RoadmapStep> byId,
    CommanderSnapshot snapshot,
  ) {
    if (step.status == RoadmapStatus.done ||
        step.status == RoadmapStatus.dismissed) {
      return step;
    }

    final List<String> reasons = <String>[...step.blockedReasons];
    for (final String prerequisiteId in step.prerequisiteStepIds) {
      final RoadmapStep? prerequisite = byId[prerequisiteId];
      if (prerequisite == null) {
        continue;
      }
      final bool satisfied =
          snapshot.completedRoadmapStepIds.contains(prerequisiteId) ||
              prerequisite.status == RoadmapStatus.done ||
              prerequisite.status == RoadmapStatus.dismissed;
      if (!satisfied) {
        reasons.add('Prérequis : ${prerequisite.title}');
      }
    }

    if (reasons.isEmpty) {
      return step;
    }
    return step.copyWith(
      status: RoadmapStatus.blocked,
      blockedReasons: reasons,
    );
  }

  static int _statusRank(RoadmapStatus status) => switch (status) {
        RoadmapStatus.available => 0,
        RoadmapStatus.inProgress => 0,
        RoadmapStatus.blocked => 1,
        RoadmapStatus.done => 2,
        RoadmapStatus.dismissed => 3,
      };

  int _compare(RoadmapStep a, RoadmapStep b) {
    final int byStatus = _statusRank(a.status).compareTo(_statusRank(b.status));
    if (byStatus != 0) {
      return byStatus;
    }
    final int byPriority = b.priority.compareTo(a.priority);
    if (byPriority != 0) {
      return byPriority;
    }
    final int byPhase = a.phase.order.compareTo(b.phase.order);
    return byPhase != 0 ? byPhase : a.id.compareTo(b.id);
  }

  /// The phase of the highest-priority actionable step; falls back to the
  /// furthest phase reached once everything is done.
  RoadmapPhase _currentPhase(List<RoadmapStep> steps) {
    final Iterable<RoadmapStep> actionable =
        steps.where((RoadmapStep step) => step.status.isActionable);
    if (actionable.isEmpty) {
      return RoadmapPhase.industrialisation;
    }
    return actionable
        .reduce((RoadmapStep a, RoadmapStep b) =>
            a.phase.order <= b.phase.order ? a : b)
        .phase;
  }

  String _headline(
    List<RoadmapStep> steps,
    RoadmapPhase phase,
    CommanderSnapshot snapshot,
  ) {
    final RoadmapStep? next = steps
        .where((RoadmapStep step) => step.status.isActionable)
        .firstOrNull;
    if (next == null) {
      return 'Tout est fait : reste sur la boucle scan → vente et monte le rang.';
    }
    return next.summary;
  }
}

extension<T> on Iterable<T> {
  T? get firstOrNull {
    final Iterator<T> iterator = this.iterator;
    return iterator.moveNext() ? iterator.current : null;
  }
}
