import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../core/responsive/window_size.dart';
import '../../../../design_system/design_system.dart';
import '../../../commander/domain/entities/commander.dart';
import '../../../commander/domain/entities/rank.dart';
import '../../../commander/domain/entities/suit_info.dart';
import '../../../commander/presentation/bloc/commander_bloc.dart';
import '../../../exobiology/domain/entities/exobiologist_rank.dart';
import '../../../exobiology/domain/entities/roadmap.dart';
import '../../../exobiology/presentation/bloc/roadmap_bloc.dart';
import '../../../exobiology/presentation/widgets/credits_format.dart';
import '../../../exobiology/presentation/widgets/roadmap_step_card.dart';

/// The cockpit: who the commander is, and the single next thing to do.
class DashboardPage extends StatelessWidget {
  const DashboardPage({this.onOpenRoadmap, this.onOpenProfile, super.key});

  final VoidCallback? onOpenRoadmap;
  final VoidCallback? onOpenProfile;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<CommanderBloc>(
          create: (_) =>
              getIt<CommanderBloc>()..add(const CommanderWatchStarted()),
        ),
        BlocProvider<RoadmapBloc>(
          create: (_) => getIt<RoadmapBloc>()..add(const RoadmapWatchStarted()),
        ),
      ],
      child: _DashboardView(
        onOpenRoadmap: onOpenRoadmap,
        onOpenProfile: onOpenProfile,
      ),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView({this.onOpenRoadmap, this.onOpenProfile});

  final VoidCallback? onOpenRoadmap;
  final VoidCallback? onOpenProfile;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommanderBloc, CommanderState>(
      builder: (BuildContext context, CommanderState commanderState) {
        final Commander commander = switch (commanderState) {
          CommanderReady(:final Commander commander) => commander,
          _ => const Commander.unknown(),
        };

        return CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: EdPageHeader(
                kicker: commander.isKnown
                    ? commander.source.label
                    : 'Aucune donnée',
                title: commander.isKnown ? commander.name : 'Commandant',
                deck: commander.currentSystem == null
                    ? 'Connecte ton compte Frontier ou renseigne ton profil '
                        'pour que la feuille de route s\'adapte à toi.'
                    : 'Position : ${commander.currentSystem}',
                actions: <Widget>[
                  OutlinedButton.icon(
                    onPressed: () => context
                        .read<CommanderBloc>()
                        .add(const CommanderRefreshRequested()),
                    icon: const Icon(Icons.sync, size: 15),
                    label: const Text('Actualiser'),
                  ),
                  if (onOpenProfile != null)
                    TextButton(
                      onPressed: onOpenProfile,
                      child: const Text('Mon profil'),
                    ),
                ],
              ),
            ),
            if (commanderState is CommanderReady &&
                commanderState.failure != null)
              SliverToBoxAdapter(
                child: ReadableWidth(
                  maxWidth: Breakpoints.contentColumn,
                  child: Padding(
                    padding: const EdgeInsets.only(top: EdSpacing.md),
                    child: EdCallout.text(
                      tone: EdCalloutTone.warning,
                      title: 'Synchronisation impossible',
                      text: commanderState.failure!.message,
                    ),
                  ),
                ),
              ),
            SliverToBoxAdapter(
              child: ReadableWidth(
                maxWidth: Breakpoints.contentColumn,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: EdSpacing.lg),
                  child: _StatGrid(commander: commander),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ReadableWidth(
                maxWidth: Breakpoints.contentColumn,
                child: _NextStepPanel(onOpenRoadmap: onOpenRoadmap),
              ),
            ),
            SliverToBoxAdapter(
              child: ReadableWidth(
                maxWidth: Breakpoints.contentColumn,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: EdSpacing.xxl),
                  child: _RankPanel(commander: commander),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _StatGrid extends StatelessWidget {
  const _StatGrid({required this.commander});

  final Commander commander;

  @override
  Widget build(BuildContext context) {
    final SuitInfo? artemis = commander.artemis;

    return AdaptiveGrid(
      minTileWidth: 200,
      children: <Widget>[
        EdStatTile(
          label: 'Solde',
          value: formatCredits(commander.credits),
          icon: Icons.account_balance_wallet_outlined,
          hint: commander.debt > 0
              ? 'Dette : ${formatCredits(commander.debt)}'
              : null,
        ),
        EdStatTile(
          label: 'Système',
          value: commander.currentSystem ?? '—',
          icon: Icons.public,
          valueColor: EdColors.cyanBright,
          hint: commander.currentStation,
        ),
        EdStatTile(
          label: 'Vaisseau',
          value: commander.shipName ?? commander.shipType ?? '—',
          icon: Icons.rocket_launch_outlined,
          valueColor: EdColors.textStrong,
          hint: commander.jumpRangeLy == null
              ? null
              : '${commander.jumpRangeLy!.toStringAsFixed(1)} LY',
        ),
        EdStatTile(
          label: 'Artemis',
          value: artemis == null ? 'Aucune' : 'Grade ${artemis.grade}',
          icon: Icons.science_outlined,
          valueColor:
              artemis == null ? EdColors.redBright : EdColors.greenBright,
          hint: artemis == null
              ? 'Indispensable à l\'exobiologie'
              : '${artemis.modIds.length} mod(s) · '
                  '${artemis.modificationSlots} emplacement(s)',
        ),
      ],
    );
  }
}

class _NextStepPanel extends StatelessWidget {
  const _NextStepPanel({this.onOpenRoadmap});

  final VoidCallback? onOpenRoadmap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoadmapBloc, RoadmapState>(
      builder: (BuildContext context, RoadmapState state) {
        return switch (state) {
          RoadmapInitial() || RoadmapLoading() => const Padding(
              padding: EdgeInsets.all(EdSpacing.xxl),
              child: EdLoadingView(message: 'Calcul de la prochaine étape…'),
            ),
          RoadmapError(:final failure) =>
            EdCallout.text(tone: EdCalloutTone.warning, text: failure.message),
          RoadmapReady(:final Roadmap roadmap) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: EdSectionHeader(title: 'Prochaine étape'),
                    ),
                    if (onOpenRoadmap != null)
                      TextButton(
                        onPressed: onOpenRoadmap,
                        child: const Text('Tout voir'),
                      ),
                  ],
                ),
                const SizedBox(height: EdSpacing.md),
                if (roadmap.nextStep case final RoadmapStep step)
                  RoadmapStepCard(
                    step: step,
                    isHighlighted: true,
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
                  )
                else
                  const EdEmptyView(
                    icon: Icons.done_all,
                    title: 'Plan terminé',
                    message: 'Reste sur la boucle scan → vente.',
                  ),
              ],
            ),
        };
      },
    );
  }
}

class _RankPanel extends StatelessWidget {
  const _RankPanel({required this.commander});

  final Commander commander;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoadmapBloc, RoadmapState>(
      builder: (BuildContext context, RoadmapState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const EdSectionHeader(title: 'Rangs'),
            const SizedBox(height: EdSpacing.md),
            EdPanel(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  for (final RankType type in <RankType>[
                    RankType.exobiologist,
                    RankType.explore,
                    RankType.trade,
                    RankType.combat,
                  ])
                    Padding(
                      padding: const EdgeInsets.only(bottom: EdSpacing.md),
                      child: EdProgressBar(
                        progress: commander.rank(type)?.fraction ?? 0,
                        label: type.label,
                        trailingLabel:
                            commander.rank(type)?.name ?? type.names.first,
                      ),
                    ),
                  const Divider(height: EdSpacing.lg),
                  const _ExobiologistProgress(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// The Exobiologist ladder is credit-driven, so it is shown against the profit
/// the app actually knows about rather than against the CAPI rank index — which
/// only reports a coarse tier and lags behind the commander's real total.
class _ExobiologistProgress extends StatelessWidget {
  const _ExobiologistProgress();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoadmapBloc, RoadmapState>(
      builder: (BuildContext context, RoadmapState state) {
        if (state is! RoadmapReady) {
          return const SizedBox.shrink();
        }
        final ExobiologistRankProgress progress = state.roadmap.rank;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            EdProgressBar(
              progress: progress.progressToNextRank,
              label: 'Profit exobiologie',
              trailingLabel: formatCredits(progress.cumulativeProfitCr),
            ),
            const SizedBox(height: EdSpacing.xs),
            Text(
              progress.nextRank == null
                  ? '${progress.rank.name} — palier maximal'
                  : '${progress.rank.name} → ${progress.nextRank!.name} '
                      'dans ${formatCredits(progress.creditsToNextRank)}',
              style: EdTypography.caption,
            ),
          ],
        );
      },
    );
  }

}
