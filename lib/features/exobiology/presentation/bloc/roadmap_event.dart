part of 'roadmap_bloc.dart';

sealed class RoadmapEvent extends Equatable {
  const RoadmapEvent();

  @override
  List<Object?> get props => const <Object?>[];
}

/// Subscribes to the commander's state and starts recomputing the plan.
final class RoadmapWatchStarted extends RoadmapEvent {
  const RoadmapWatchStarted();
}

/// Internal: a freshly computed roadmap arrived.
final class RoadmapUpdated extends RoadmapEvent {
  const RoadmapUpdated(this.roadmap);

  final Roadmap roadmap;

  @override
  List<Object?> get props => <Object?>[roadmap];
}

/// Internal: the underlying stream failed.
final class RoadmapFailed extends RoadmapEvent {
  const RoadmapFailed(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => <Object?>[failure];
}

/// The commander declares a step done, or undone.
final class RoadmapStepCompletionToggled extends RoadmapEvent {
  const RoadmapStepCompletionToggled({
    required this.stepId,
    required this.completed,
  });

  final String stepId;
  final bool completed;

  @override
  List<Object?> get props => <Object?>[stepId, completed];
}

/// The commander deliberately skips a step.
final class RoadmapStepDismissalToggled extends RoadmapEvent {
  const RoadmapStepDismissalToggled({
    required this.stepId,
    required this.dismissed,
  });

  final String stepId;
  final bool dismissed;

  @override
  List<Object?> get props => <Object?>[stepId, dismissed];
}

final class RoadmapFilterChanged extends RoadmapEvent {
  const RoadmapFilterChanged(this.filter);

  final RoadmapFilter filter;

  @override
  List<Object?> get props => <Object?>[filter];
}
