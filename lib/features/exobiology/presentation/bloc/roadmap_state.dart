part of 'roadmap_bloc.dart';

/// Which slice of the plan the commander is looking at.
enum RoadmapFilter {
  todo('À faire'),
  blocked('Bloqué'),
  done('Fait'),
  all('Tout');

  const RoadmapFilter(this.label);

  final String label;

  bool matches(RoadmapStep step) => switch (this) {
        RoadmapFilter.todo => step.status.isActionable,
        RoadmapFilter.blocked => step.status == RoadmapStatus.blocked,
        RoadmapFilter.done => step.status == RoadmapStatus.done ||
            step.status == RoadmapStatus.dismissed,
        RoadmapFilter.all => true,
      };
}

sealed class RoadmapState extends Equatable {
  const RoadmapState();

  @override
  List<Object?> get props => const <Object?>[];
}

final class RoadmapInitial extends RoadmapState {
  const RoadmapInitial();
}

final class RoadmapLoading extends RoadmapState {
  const RoadmapLoading();
}

final class RoadmapReady extends RoadmapState {
  const RoadmapReady({
    required this.roadmap,
    this.filter = RoadmapFilter.todo,
  });

  final Roadmap roadmap;
  final RoadmapFilter filter;

  List<RoadmapStep> get visibleSteps =>
      roadmap.steps.where(filter.matches).toList(growable: false);

  int countFor(RoadmapFilter candidate) =>
      roadmap.steps.where(candidate.matches).length;

  RoadmapReady copyWith({Roadmap? roadmap, RoadmapFilter? filter}) =>
      RoadmapReady(
        roadmap: roadmap ?? this.roadmap,
        filter: filter ?? this.filter,
      );

  @override
  List<Object?> get props => <Object?>[roadmap, filter];
}

final class RoadmapError extends RoadmapState {
  const RoadmapError(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => <Object?>[failure];
}
