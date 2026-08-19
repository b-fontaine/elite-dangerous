import 'package:equatable/equatable.dart';

import 'exobiologist_rank.dart';

/// What kind of work a step represents. Drives the icon and accent colour.
enum RoadmapCategory {
  equipment('Équipement', 'Acheter ou monter en grade du matériel'),
  unlock('Déblocage', 'Débloquer un ingénieur ou une technologie'),
  engineering('Ingénierie', 'Poser une modification'),
  materials('Matériaux', 'Récolter des composants'),
  technique('Technique', 'Acquérir un geste de terrain'),
  expedition('Expédition', 'Planifier et exécuter une sortie'),
  discipline('Discipline', 'Sécuriser ce qui est déjà acquis'),
  economy('Économie', 'Augmenter le rendement des ventes');

  const RoadmapCategory(this.label, this.description);

  final String label;
  final String description;
}

/// Lifecycle of a step for a given commander.
enum RoadmapStatus {
  /// Prerequisites unmet — shown greyed with the blocking reason.
  blocked('Bloqué'),

  /// Actionable right now.
  available('À faire'),

  /// Partially done (e.g. 6 of 12 Suit Schematics collected).
  inProgress('En cours'),

  /// Satisfied by the commander's current state.
  done('Fait'),

  /// Explicitly skipped by the commander.
  dismissed('Ignoré');

  const RoadmapStatus(this.label);

  final String label;

  bool get isActionable =>
      this == RoadmapStatus.available || this == RoadmapStatus.inProgress;
}

/// Coarse stage of the exobiology career, used to group the roadmap.
enum RoadmapPhase {
  preparation(0, 'Préparation', 'Rendre l\'exobiologie possible'),
  equipement(1, 'Équipement', 'Artemis opérationnelle'),
  ingenierie(2, 'Ingénierie', 'Portée de saut et confort de terrain'),
  apprentissage(3, 'Apprentissage', 'Boucle rentable près de la Bulle'),
  expedition(4, 'Expédition', 'First Footfall et multiplicateur ×5'),
  industrialisation(5, 'Industrialisation', 'Porte-vaisseaux et rendement');

  const RoadmapPhase(this.order, this.label, this.goal);

  final int order;
  final String label;
  final String goal;
}

/// A pointer to where the advice comes from — an in-app guide section or an
/// external community tool. Every step carries at least one, so the commander
/// can always audit the reasoning.
class RoadmapReference extends Equatable {
  const RoadmapReference({
    required this.label,
    this.guideId,
    this.sectionId,
    this.url,
  });

  final String label;
  final String? guideId;
  final String? sectionId;
  final String? url;

  bool get isExternal => url != null;

  @override
  List<Object?> get props => <Object?>[label, guideId, sectionId, url];
}

/// A quantified expectation attached to a step.
class RoadmapImpact extends Equatable {
  const RoadmapImpact({
    this.creditGainCr,
    this.creditGainPerSessionCr,
    this.sessions,
    this.label,
  });

  /// One-off credit gain, when the step directly earns money.
  final int? creditGainCr;

  /// Sustained gain per 1–2 h session once the step is done.
  final int? creditGainPerSessionCr;

  /// Rough number of 1–2 h sessions the step costs.
  final double? sessions;

  /// Free-form summary shown when no figure is reliable, e.g. "+10,5 LY".
  final String? label;

  bool get hasFigures =>
      creditGainCr != null || creditGainPerSessionCr != null || label != null;

  @override
  List<Object?> get props =>
      <Object?>[creditGainCr, creditGainPerSessionCr, sessions, label];
}

/// One prioritised action in the exobiology roadmap.
class RoadmapStep extends Equatable {
  const RoadmapStep({
    required this.id,
    required this.title,
    required this.summary,
    required this.rationale,
    required this.category,
    required this.phase,
    required this.status,
    required this.priority,
    this.impact = const RoadmapImpact(),
    this.actions = const <String>[],
    this.blockedReasons = const <String>[],
    this.prerequisiteStepIds = const <String>[],
    this.references = const <RoadmapReference>[],
    this.progress,
    this.progressLabel,
  });

  final String id;

  /// Imperative, short: "Acheter l'Artemis Suit".
  final String title;

  /// One sentence describing the outcome.
  final String summary;

  /// Why this is the next thing to do, given the commander's state.
  final String rationale;

  final RoadmapCategory category;
  final RoadmapPhase phase;
  final RoadmapStatus status;

  /// Higher runs first. Computed by the rule, never hard-coded in the UI.
  final int priority;

  final RoadmapImpact impact;

  /// Concrete checklist the commander can tick off in game.
  final List<String> actions;

  /// Why the step is blocked, when [status] is [RoadmapStatus.blocked].
  final List<String> blockedReasons;

  final List<String> prerequisiteStepIds;
  final List<RoadmapReference> references;

  /// 0.0 → 1.0 when the step is measurable (materials, credits, rank).
  final double? progress;

  /// Human label for [progress], e.g. "7 / 12 Suit Schematics".
  final String? progressLabel;

  RoadmapStep copyWith({
    RoadmapStatus? status,
    int? priority,
    List<String>? blockedReasons,
  }) {
    return RoadmapStep(
      id: id,
      title: title,
      summary: summary,
      rationale: rationale,
      category: category,
      phase: phase,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      impact: impact,
      actions: actions,
      blockedReasons: blockedReasons ?? this.blockedReasons,
      prerequisiteStepIds: prerequisiteStepIds,
      references: references,
      progress: progress,
      progressLabel: progressLabel,
    );
  }

  @override
  List<Object?> get props => <Object?>[id, status, priority, progress];
}

/// The full prioritised plan.
class Roadmap extends Equatable {
  const Roadmap({
    required this.steps,
    required this.currentPhase,
    required this.headline,
    required this.rank,
    this.generatedFor,
  });

  /// All steps, already sorted: actionable first, by descending priority.
  final List<RoadmapStep> steps;

  /// The phase the commander is currently in.
  final RoadmapPhase currentPhase;

  /// One-sentence answer to "what do I do next?".
  final String headline;

  /// Where the commander stands on the Exobiologist ladder, carried here so the
  /// UI never has to re-derive it from a progress bar.
  final ExobiologistRankProgress rank;

  final String? generatedFor;

  List<RoadmapStep> get actionable => steps
      .where((RoadmapStep step) => step.status.isActionable)
      .toList(growable: false);

  List<RoadmapStep> get blocked => steps
      .where((RoadmapStep step) => step.status == RoadmapStatus.blocked)
      .toList(growable: false);

  List<RoadmapStep> get done => steps
      .where((RoadmapStep step) => step.status == RoadmapStatus.done)
      .toList(growable: false);

  /// The single most important thing to do right now.
  RoadmapStep? get nextStep => actionable.isEmpty ? null : actionable.first;

  /// Share of steps already satisfied, for the top-level progress bar.
  double get completionRatio {
    final int relevant = steps
        .where((RoadmapStep step) => step.status != RoadmapStatus.dismissed)
        .length;
    if (relevant == 0) {
      return 0;
    }
    return done.length / relevant;
  }

  List<RoadmapStep> stepsForPhase(RoadmapPhase phase) => steps
      .where((RoadmapStep step) => step.phase == phase)
      .toList(growable: false);

  @override
  List<Object?> get props => <Object?>[steps, currentPhase, headline, rank];
}
