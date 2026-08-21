import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/format/credits.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../design_system/design_system.dart';
import '../../../commander/domain/entities/commander.dart';
import '../../../commander/domain/entities/ship.dart';
import '../../../commander/presentation/bloc/commander_bloc.dart';
import '../../../exobiology/domain/entities/exobiologist_rank.dart';
import '../../../exobiology/domain/entities/roadmap.dart';
import '../../../exobiology/presentation/bloc/roadmap_bloc.dart';
import '../../../exobiology/presentation/widgets/roadmap_step_card.dart';
import '../../../journal/domain/entities/journal_event.dart';
import '../../../journal/domain/entities/journal_session_state.dart';
import '../widgets/commander_scope.dart';
import '../widgets/summary_card.dart';

/// Where the cockpit's five detail pages live.
class CockpitDestinations {
  const CockpitDestinations({
    this.onOpenRoadmap,
    this.onOpenProfile,
    this.onOpenCareer,
    this.onOpenFleet,
    this.onOpenOnFoot,
    this.onOpenEngineers,
    this.onOpenMaterials,
    this.onOpenStation,
  });

  final VoidCallback? onOpenRoadmap;
  final VoidCallback? onOpenProfile;
  final VoidCallback? onOpenCareer;
  final VoidCallback? onOpenFleet;
  final VoidCallback? onOpenOnFoot;
  final VoidCallback? onOpenEngineers;
  final VoidCallback? onOpenMaterials;
  final VoidCallback? onOpenStation;
}

/// The cockpit: who the commander is, what to do next, and a way into the rest.
///
/// Kept short enough to read on a phone without scrolling past the answer. The
/// detail — fleet, fittings, engineers, materials, career — sits one tap away
/// behind five summary cards rather than below a very long scroll.
class DashboardPage extends StatelessWidget {
  const DashboardPage({this.destinations = const CockpitDestinations(), super.key});

  final CockpitDestinations destinations;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RoadmapBloc>(
      create: (_) => getIt<RoadmapBloc>()..add(const RoadmapWatchStarted()),
      child: CommanderScope(
        builder: (BuildContext context, CommanderDossier dossier) =>
            _DashboardView(dossier: dossier, destinations: destinations),
      ),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView({required this.dossier, required this.destinations});

  final CommanderDossier dossier;
  final CockpitDestinations destinations;

  @override
  Widget build(BuildContext context) {
    final Commander commander = dossier.commander;

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: EdPageHeader(
            kicker: _kicker(dossier),
            title: commander.isKnown ? commander.name : 'Commandant',
            deck: _position(dossier),
            actions: <Widget>[
              OutlinedButton.icon(
                onPressed: dossier.isRefreshing
                    ? null
                    : () => context
                        .read<CommanderBloc>()
                        .add(const CommanderRefreshRequested()),
                icon: const Icon(Icons.sync, size: 15),
                label: const Text('Actualiser'),
              ),
              if (destinations.onOpenProfile != null)
                TextButton(
                  onPressed: destinations.onOpenProfile,
                  child: const Text('Corriger mon profil'),
                ),
            ],
          ),
        ),
        DetailSection(top: EdSpacing.md, child: _Alerts(dossier: dossier)),
        DetailSection(child: _KeyFigures(dossier: dossier)),
        DetailSection(
          child: _NextSteps(onOpenRoadmap: destinations.onOpenRoadmap),
        ),
        DetailSection(
          child: _SummaryCards(dossier: dossier, destinations: destinations),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: EdSpacing.xxxl)),
      ],
    );
  }

  /// Says where the figures come from, and how stale they are.
  static String _kicker(CommanderDossier dossier) {
    final Commander commander = dossier.commander;
    if (!dossier.isKnown) {
      return 'Aucune donnée';
    }
    final List<String> parts = <String>[
      if (commander.isKnown) commander.source.label,
      if (!dossier.session.isEmpty) 'Journal',
    ];
    return parts.isEmpty ? 'Aucune donnée' : parts.join(' + ');
  }

  static String _position(CommanderDossier dossier) {
    if (!dossier.isKnown) {
      return 'Connecte ton compte Frontier ou importe un journal pour que la '
          'feuille de route s\'adapte à toi.';
    }
    final CommanderPosition position = dossier.session.position;
    final Commander commander = dossier.commander;
    final List<String> parts = <String>[
      if (position.starSystem ?? commander.currentSystem case final String s) s,
      if (position.bodyName case final String body) body,
      if (position.stationName ?? commander.currentStation case final String p)
        p,
      position.at != null
          ? position.activity
          : commander.onFoot
              ? 'à pied'
              : commander.docked
                  ? 'amarré'
                  : 'en vol',
    ];
    return parts.join(' · ');
  }
}

// --- Alerts ------------------------------------------------------------------

class _Alerts extends StatelessWidget {
  const _Alerts({required this.dossier});

  final CommanderDossier dossier;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommanderBloc, CommanderState>(
      builder: (BuildContext context, CommanderState state) {
        return BlocBuilder<RoadmapBloc, RoadmapState>(
          builder: (BuildContext context, RoadmapState roadmapState) {
            final List<Widget> alerts = <Widget>[
              if (state is CommanderReady && state.failure != null)
                EdCallout.text(
                  tone: EdCalloutTone.warning,
                  title: 'Synchronisation impossible',
                  text: state.failure!.message,
                ),
              if (roadmapState is RoadmapReady)
                if (roadmapState.roadmap.rank case final ExobiologistRankProgress _)
                  ..._dataAtRisk(roadmapState),
              if (!dossier.isKnown)
                const EdCallout(
                  tone: EdCalloutTone.info,
                  title: 'Rien à afficher pour l\'instant',
                  child: Text(
                    'Connecte un compte Frontier, importe un journal de bord, '
                    'ou renseigne ton profil à la main. Les trois voies '
                    'fonctionnent, et se complètent.',
                    style: EdTypography.bodySmall,
                  ),
                ),
            ];

            if (alerts.isEmpty) {
              return const SizedBox.shrink();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                for (final Widget alert in alerts)
                  Padding(
                    padding: const EdgeInsets.only(bottom: EdSpacing.xs),
                    child: alert,
                  ),
              ],
            );
          },
        );
      },
    );
  }

  /// Scanned-but-unsold organics are the one thing a single death erases.
  List<Widget> _dataAtRisk(RoadmapReady state) {
    final int atRisk = state.roadmap.steps
        .where((RoadmapStep step) => step.id.startsWith('discipline.'))
        .map((RoadmapStep step) => step.impact.creditGainCr ?? 0)
        .fold<int>(0, (int a, int b) => a > b ? a : b);
    if (atRisk <= 0) {
      return const <Widget>[];
    }
    return <Widget>[
      EdCallout.text(
        tone: EdCalloutTone.warning,
        title: 'Données non vendues',
        text: '${formatCredits(atRisk)} en soute. Tout est perdu en cas de '
            'destruction : la vente passe avant le reste.',
      ),
    ];
  }
}

// --- Key figures -------------------------------------------------------------

class _KeyFigures extends StatelessWidget {
  const _KeyFigures({required this.dossier});

  final CommanderDossier dossier;

  @override
  Widget build(BuildContext context) {
    final Commander commander = dossier.commander;
    final JournalSessionState session = dossier.session;

    return BlocBuilder<RoadmapBloc, RoadmapState>(
      builder: (BuildContext context, RoadmapState state) {
        final ExobiologistRankProgress? rank =
            state is RoadmapReady ? state.roadmap.rank : null;

        final CommanderPosition position = session.position;

        return AdaptiveGrid(
          minTileWidth: 200,
          children: <Widget>[
            EdStatTile(
              label: 'Système',
              value: position.starSystem ?? commander.currentSystem ?? '—',
              icon: Icons.public,
              valueColor: EdColors.cyanBright,
              hint: position.at == null ? null : position.activity,
            ),
            EdStatTile(
              label: 'Corps',
              value: position.bodyName ?? '—',
              icon: Icons.landscape_outlined,
              valueColor: EdColors.textStrong,
              // `/profile` has no notion of a body at all: this tile is empty
              // until a journal is imported, and says so.
              hint: position.bodyName == null
                  ? 'importe un journal : la CAPI ne le donne pas'
                  : position.bodyType,
            ),
            EdStatTile(
              label: 'Station',
              value: position.stationName ??
                  commander.station.stationName ??
                  '—',
              icon: Icons.store_outlined,
              valueColor: commander.station.sellsOrganicData
                  ? EdColors.greenBright
                  : EdColors.textStrong,
              hint: commander.station.sellsOrganicData
                  ? 'Vista Genomics sur place'
                  : position.stationType,
            ),
            EdStatTile(
              label: 'Solde',
              value: formatCredits(commander.credits),
              icon: Icons.account_balance_wallet_outlined,
              hint: commander.debt > 0
                  ? 'Dette : ${formatCredits(commander.debt)}'
                  : null,
            ),
            EdStatTile(
              label: 'Valeur nette',
              value: formatCredits(commander.netWorthCr),
              icon: Icons.savings_outlined,
              valueColor: EdColors.textStrong,
              hint: commander.fleet.isEmpty
                  ? null
                  : 'dont ${formatCredits(commander.fleetValueCr)} de flotte',
            ),
            EdStatTile(
              label: 'Profit exobiologie',
              value: rank == null
                  ? '—'
                  : formatCredits(rank.cumulativeProfitCr),
              icon: Icons.biotech_outlined,
              valueColor: EdColors.greenBright,
              hint: session.exobiologyProfitCr != null
                  ? 'total de carrière, énoncé par le jeu'
                  : 'estimé depuis ce qui a été importé',
            ),
            EdStatTile(
              label: 'Rang Exobiologist',
              value: rank?.rank.name ?? '—',
              icon: Icons.military_tech_outlined,
              valueColor: EdColors.purpleBright,
              hint: rank == null || rank.nextRank == null
                  ? null
                  : 'reste ${formatCredits(rank.creditsToNextRank)}',
            ),
            EdStatTile(
              label: 'Portée de saut',
              value: session.jumpRangeLy == null
                  ? '—'
                  : '${session.jumpRangeLy!.toStringAsFixed(1)} LY',
              icon: Icons.rocket_launch_outlined,
              valueColor: EdColors.cyanBright,
              hint: commander.currentShip?.displayName,
            ),
            EdStatTile(
              label: 'Rebuy',
              value: session.rebuyCr == null
                  ? '—'
                  : formatCredits(session.rebuyCr!),
              icon: Icons.shield_outlined,
              valueColor: EdColors.amber,
              hint: session.rebuyCr == null
                  ? 'importe un journal : la CAPI ne le donne pas'
                  : 'coût exact d\'une destruction',
            ),
          ],
        );
      },
    );
  }
}

// --- The next three steps ----------------------------------------------------

class _NextSteps extends StatelessWidget {
  const _NextSteps({this.onOpenRoadmap});

  final VoidCallback? onOpenRoadmap;

  /// One step answers "what now"; three answer "and then?" without turning the
  /// cockpit into the roadmap page.
  static const int shown = 3;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoadmapBloc, RoadmapState>(
      builder: (BuildContext context, RoadmapState state) {
        return switch (state) {
          RoadmapInitial() || RoadmapLoading() => const Padding(
              padding: EdgeInsets.all(EdSpacing.xxl),
              child: EdLoadingView(message: 'Calcul des prochaines étapes…'),
            ),
          RoadmapError(:final failure) =>
            EdCallout.text(tone: EdCalloutTone.warning, text: failure.message),
          RoadmapReady(:final Roadmap roadmap) => _StepList(
              steps: roadmap.actionable.take(shown).toList(growable: false),
              roadmap: roadmap,
              onOpenRoadmap: onOpenRoadmap,
            ),
        };
      },
    );
  }
}

class _StepList extends StatelessWidget {
  const _StepList({
    required this.steps,
    required this.roadmap,
    this.onOpenRoadmap,
  });

  final List<RoadmapStep> steps;
  final Roadmap roadmap;
  final VoidCallback? onOpenRoadmap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        EdSectionHeader(
          title: 'Prochaines étapes',
          trailing: onOpenRoadmap == null
              ? null
              : TextButton(
                  onPressed: onOpenRoadmap,
                  child: const Text('Tout voir'),
                ),
        ),
        const SizedBox(height: EdSpacing.xs),
        Text(
          '${roadmap.currentPhase.label} — ${roadmap.currentPhase.goal}',
          style: EdTypography.caption,
        ),
        const SizedBox(height: EdSpacing.md),
        if (steps.isEmpty)
          const EdEmptyView(
            icon: Icons.done_all,
            title: 'Plan terminé',
            message: 'Reste sur la boucle scan → vente.',
          )
        else
          for (final (int index, RoadmapStep step) in steps.indexed)
            Padding(
              padding: const EdgeInsets.only(bottom: EdSpacing.sm),
              child: RoadmapStepCard(
                step: step,
                // Only the first is the answer to "what now"; the other two
                // are context, and shouting all three would say nothing.
                isHighlighted: index == 0,
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
            ),
      ],
    );
  }
}

// --- The five doors ----------------------------------------------------------

class _SummaryCards extends StatelessWidget {
  const _SummaryCards({required this.dossier, required this.destinations});

  final CommanderDossier dossier;
  final CockpitDestinations destinations;

  @override
  Widget build(BuildContext context) {
    final Commander commander = dossier.commander;
    final JournalSessionState session = dossier.session;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Le dossier'),
        const SizedBox(height: EdSpacing.md),
        AdaptiveGrid(
          minTileWidth: 280,
          children: <Widget>[
            SummaryCard(
              title: 'Carrière',
              icon: Icons.military_tech_outlined,
              accent: EdColors.purple,
              onOpen: destinations.onOpenCareer,
              facts: _careerFacts(commander, session),
            ),
            SummaryCard(
              title: 'Flotte',
              icon: Icons.rocket_launch_outlined,
              accent: EdColors.cyan,
              onOpen: destinations.onOpenFleet,
              note: commander.fleet.isEmpty
                  ? 'Synchronise ton compte Frontier pour voir tes vaisseaux.'
                  : null,
              facts: <SummaryFact>[
                SummaryFact('Vaisseaux', '${commander.fleet.length}'),
                SummaryFact(
                  'Valeur totale',
                  formatCredits(commander.fleetValueCr),
                ),
                if (commander.currentShip case final Ship ship)
                  SummaryFact('En vol', ship.displayName,
                      tone: EdColors.cyanBright),
              ],
            ),
            SummaryCard(
              title: 'Équipement à pied',
              icon: Icons.checkroom_outlined,
              accent: EdColors.green,
              onOpen: destinations.onOpenOnFoot,
              note: commander.suits.isEmpty && commander.suitLoadouts.isEmpty
                  ? 'Aucune combinaison connue.'
                  : null,
              facts: <SummaryFact>[
                SummaryFact(
                  'Artemis',
                  commander.artemis == null
                      ? 'aucune'
                      : 'grade ${commander.artemis!.grade}',
                  tone: commander.artemis == null
                      ? EdColors.redBright
                      : EdColors.greenBright,
                ),
                SummaryFact('Combinaisons', '${commander.suits.length}'),
                SummaryFact('Loadouts', '${commander.suitLoadouts.length}'),
              ],
            ),
            SummaryCard(
              title: 'Ingénieurs',
              icon: Icons.build_outlined,
              accent: EdColors.orange,
              onOpen: destinations.onOpenEngineers,
              note: session.engineers.isEmpty
                  ? 'Importe un journal : la CAPI n\'expose pas les '
                      'ingénieurs.'
                  : null,
              facts: <SummaryFact>[
                SummaryFact(
                  'Débloqués',
                  '${session.unlockedEngineers.length} / '
                      '${session.engineers.length}',
                  tone: EdColors.greenBright,
                ),
              ],
            ),
            SummaryCard(
              title: 'Matériaux',
              icon: Icons.science_outlined,
              accent: EdColors.amber,
              onOpen: destinations.onOpenMaterials,
              note: session.onFootInventory.isEmpty &&
                      session.shipMaterials.isEmpty
                  ? 'Importe un journal pour compter ton inventaire.'
                  : null,
              facts: <SummaryFact>[
                SummaryFact(
                  'À pied',
                  '${session.onFootInventory.length} type(s)',
                ),
                SummaryFact(
                  'Vaisseau',
                  '${session.shipMaterials.length} type(s)',
                ),
              ],
            ),
            SummaryCard(
              title: 'Station',
              icon: Icons.store_outlined,
              accent: EdColors.gold,
              onOpen: destinations.onOpenStation,
              note: commander.station.isKnown
                  ? null
                  : 'Amarre-toi puis synchronise.',
              facts: <SummaryFact>[
                SummaryFact(
                  'Vista Genomics',
                  commander.station.sellsOrganicData ? 'oui' : 'non',
                  tone: commander.station.sellsOrganicData
                      ? EdColors.greenBright
                      : EdColors.textDim,
                ),
                SummaryFact(
                  'Barman',
                  commander.station.hasBartender ? 'oui' : 'non',
                ),
                SummaryFact(
                  'Ingénieur',
                  commander.station.hasEngineer ? 'oui' : 'non',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  List<SummaryFact> _careerFacts(
    Commander commander,
    JournalSessionState session,
  ) {
    final StatisticsEvent? stats = session.statistics;
    return <SummaryFact>[
      if (stats?.systemsVisited case final int visited)
        SummaryFact('Systèmes visités', '$visited'),
      if (stats?.firstFootfalls case final int footfalls)
        SummaryFact('First Footfalls', '$footfalls',
            tone: EdColors.greenBright),
      if (session.pledgedPower case final String power)
        SummaryFact('Powerplay', power,
            tone: session.boostsOrganicSales
                ? EdColors.greenBright
                : EdColors.textDim),
      if (stats == null && session.pledgedPower == null)
        SummaryFact('Rangs', '${commander.ranks.length} échelles'),
    ];
  }
}
