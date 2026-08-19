import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../core/responsive/window_size.dart';
import '../../../../design_system/design_system.dart';
import '../../domain/entities/roadmap.dart';
import '../bloc/roadmap_bloc.dart';
import '../widgets/roadmap_step_card.dart';

/// The prioritised plan: what to do next in exobiology, and why.
class RoadmapPage extends StatelessWidget {
  const RoadmapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RoadmapBloc>(
      create: (_) => getIt<RoadmapBloc>()..add(const RoadmapWatchStarted()),
      child: const _RoadmapView(),
    );
  }
}

class _RoadmapView extends StatelessWidget {
  const _RoadmapView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoadmapBloc, RoadmapState>(
      builder: (BuildContext context, RoadmapState state) {
        return switch (state) {
          RoadmapInitial() || RoadmapLoading() => const EdLoadingView(
              message: 'Calcul de ta feuille de route…',
            ),
          RoadmapError(:final failure) => EdErrorView(
              message: failure.message,
              onRetry: () =>
                  context.read<RoadmapBloc>().add(const RoadmapWatchStarted()),
            ),
          final RoadmapReady ready => _RoadmapBody(state: ready),
        };
      },
    );
  }
}

class _RoadmapBody extends StatelessWidget {
  const _RoadmapBody({required this.state});

  final RoadmapReady state;

  @override
  Widget build(BuildContext context) {
    final Roadmap roadmap = state.roadmap;
    final RoadmapStep? next = roadmap.nextStep;
    final List<RoadmapStep> steps = state.visibleSteps;

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: EdPageHeader(
            kicker: 'Phase ${roadmap.currentPhase.order} · '
                '${roadmap.currentPhase.label}',
            title: 'Feuille de route',
            deck: roadmap.headline,
          ),
        ),
        SliverToBoxAdapter(
          child: ReadableWidth(
            maxWidth: Breakpoints.contentColumn,
            child: Padding(
              padding: const EdgeInsets.only(top: EdSpacing.lg),
              child: _ProgressSummary(roadmap: roadmap),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ReadableWidth(
            maxWidth: Breakpoints.contentColumn,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: EdSpacing.lg),
              child: _FilterBar(state: state),
            ),
          ),
        ),
        if (steps.isEmpty)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(EdSpacing.xxl),
              child: EdEmptyView(
                icon: Icons.done_all,
                title: 'Rien ici',
                message: 'Aucune étape ne correspond à ce filtre.',
              ),
            ),
          )
        else
          SliverToBoxAdapter(
            child: ReadableWidth(
              maxWidth: Breakpoints.contentColumn,
              child: ResponsiveBuilder(
                builder: (BuildContext context, WindowSizeClass size) {
                  final List<Widget> cards = <Widget>[
                    for (final RoadmapStep step in steps)
                      RoadmapStepCard(
                        step: step,
                        isHighlighted: step.id == next?.id,
                        onToggleCompleted: (bool completed) =>
                            context.read<RoadmapBloc>().add(
                                  RoadmapStepCompletionToggled(
                                    stepId: step.id,
                                    completed: completed,
                                  ),
                                ),
                        onToggleDismissed: (bool dismissed) =>
                            context.read<RoadmapBloc>().add(
                                  RoadmapStepDismissalToggled(
                                    stepId: step.id,
                                    dismissed: dismissed,
                                  ),
                                ),
                      ),
                  ];

                  // Two columns only from `expanded` up: the cards are dense,
                  // and squeezing them on a tablet in portrait hurts scanning.
                  if (!size.usesTwoPanes) {
                    return Column(
                      children: <Widget>[
                        for (final Widget card in cards)
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: EdSpacing.md),
                            child: card,
                          ),
                      ],
                    );
                  }
                  return AdaptiveGrid(minTileWidth: 420, children: cards);
                },
              ),
            ),
          ),
        const SliverToBoxAdapter(child: SizedBox(height: EdSpacing.xxxl)),
      ],
    );
  }
}

class _ProgressSummary extends StatelessWidget {
  const _ProgressSummary({required this.roadmap});

  final Roadmap roadmap;

  @override
  Widget build(BuildContext context) {
    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          EdProgressBar(
            progress: roadmap.completionRatio,
            label: 'Avancement du plan',
            trailingLabel:
                '${roadmap.done.length} / ${roadmap.steps.length}',
          ),
          const SizedBox(height: EdSpacing.md),
          Wrap(
            spacing: EdSpacing.lg,
            runSpacing: EdSpacing.xs,
            children: <Widget>[
              for (final RoadmapPhase phase in RoadmapPhase.values)
                _PhaseChip(
                  phase: phase,
                  isCurrent: phase == roadmap.currentPhase,
                  stepCount: roadmap.stepsForPhase(phase).length,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PhaseChip extends StatelessWidget {
  const _PhaseChip({
    required this.phase,
    required this.isCurrent,
    required this.stepCount,
  });

  final RoadmapPhase phase;
  final bool isCurrent;
  final int stepCount;

  @override
  Widget build(BuildContext context) {
    if (stepCount == 0) {
      return const SizedBox.shrink();
    }
    return Tooltip(
      message: phase.goal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 7,
            height: 7,
            color: isCurrent ? EdColors.orange : EdColors.borderStrong,
          ),
          const SizedBox(width: 7),
          Text(
            phase.label.toUpperCase(),
            style: EdTypography.tag.copyWith(
              fontSize: 9.5,
              letterSpacing: 1.6,
              color: isCurrent ? EdColors.orangeBright : EdColors.textFainter,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  const _FilterBar({required this.state});

  final RoadmapReady state;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: EdSpacing.xs,
      runSpacing: EdSpacing.xs,
      children: <Widget>[
        for (final RoadmapFilter filter in RoadmapFilter.values)
          ChoiceChip(
            selected: state.filter == filter,
            onSelected: (_) =>
                context.read<RoadmapBloc>().add(RoadmapFilterChanged(filter)),
            showCheckmark: false,
            selectedColor: EdColors.tagOrangeFill,
            label: Text(
              '${filter.label} · ${state.countFor(filter)}',
              style: EdTypography.tag.copyWith(
                fontSize: 10,
                letterSpacing: 1.4,
                color: state.filter == filter
                    ? EdColors.orangeBright
                    : EdColors.textMuted,
              ),
            ),
          ),
      ],
    );
  }
}
