import 'package:flutter/material.dart';

import '../../../../core/format/credits.dart';
import '../../../../design_system/design_system.dart';
import '../../../commander/domain/entities/commander.dart';
import '../../../commander/domain/entities/rank.dart';
import '../../../journal/domain/entities/journal_event.dart';
import '../../../journal/domain/entities/journal_session_state.dart';
import '../widgets/commander_scope.dart';
import '../widgets/summary_card.dart';

/// Ranks, reputations, Powerplay and the career totals.
class CareerPage extends StatelessWidget {
  const CareerPage({super.key});

  @override
  Widget build(BuildContext context) => CommanderScope(
        builder: (BuildContext context, CommanderDossier dossier) =>
            _CareerView(dossier: dossier),
      );
}

class _CareerView extends StatelessWidget {
  const _CareerView({required this.dossier});

  final CommanderDossier dossier;

  /// The pilot ladders, in the order the game lists them.
  static const List<RankType> pilotLadders = <RankType>[
    RankType.exobiologist,
    RankType.explore,
    RankType.trade,
    RankType.combat,
    RankType.soldier,
    RankType.cqc,
  ];

  static const List<RankType> navyLadders = <RankType>[
    RankType.federation,
    RankType.empire,
  ];

  @override
  Widget build(BuildContext context) {
    final Commander commander = dossier.commander;
    final JournalSessionState session = dossier.session;

    return DetailPageScaffold(
      kicker: 'Dossier',
      title: 'Carrière',
      deck: 'Rangs, réputations, allégeance et totaux de carrière.',
      slivers: <Widget>[
        DetailSection(
          top: EdSpacing.lg,
          child: _RankPanel(
            title: 'Rangs pilote',
            ladders: pilotLadders,
            commander: commander,
          ),
        ),
        DetailSection(
          child: _RankPanel(
            title: 'Rangs navals',
            ladders: navyLadders,
            commander: commander,
          ),
        ),
        DetailSection(child: _ReputationPanel(session: session)),
        DetailSection(child: _PowerplayPanel(session: session)),
        DetailSection(child: _StatisticsPanel(session: session)),
      ],
    );
  }
}

class _RankPanel extends StatelessWidget {
  const _RankPanel({
    required this.title,
    required this.ladders,
    required this.commander,
  });

  final String title;
  final List<RankType> ladders;
  final Commander commander;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        EdSectionHeader(title: title),
        const SizedBox(height: EdSpacing.md),
        EdPanel(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final RankType type in ladders)
                Padding(
                  padding: const EdgeInsets.only(bottom: EdSpacing.md),
                  child: _RankRow(
                    type: type,
                    progress: commander.rank(type),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RankRow extends StatelessWidget {
  const _RankRow({required this.type, this.progress});

  final RankType type;
  final RankProgress? progress;

  @override
  Widget build(BuildContext context) {
    final RankProgress rank =
        progress ?? RankProgress(type: type, level: 0);
    final int? percent = rank.progressPercent;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        EdProgressBar(
          progress: rank.fraction,
          label: type.label,
          trailingLabel: rank.name,
        ),
        if (percent != null)
          Padding(
            padding: const EdgeInsets.only(top: EdSpacing.xxs),
            child: Text(
              '$percent % vers le rang suivant',
              style: EdTypography.caption,
            ),
          )
        else if (!type.hasNamedTiers)
          const Padding(
            padding: EdgeInsets.only(top: EdSpacing.xxs),
            child: Text(
              'Frontier ne publie aucun nom de palier pour cette échelle.',
              style: EdTypography.caption,
            ),
          ),
      ],
    );
  }
}

class _ReputationPanel extends StatelessWidget {
  const _ReputationPanel({required this.session});

  final JournalSessionState session;

  /// The thresholds the game uses, from hostile to allied.
  static String standingFor(double value) => switch (value) {
        >= 90 => 'Allié',
        >= 35 => 'Amical',
        >= 4 => 'Cordial',
        > -2 => 'Neutre',
        > -35 => 'Méfiant',
        _ => 'Hostile',
      };

  static Color toneFor(double value) => switch (value) {
        >= 35 => EdColors.greenBright,
        > -2 => EdColors.textBase,
        _ => EdColors.redBright,
      };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Réputations'),
        const SizedBox(height: EdSpacing.md),
        if (session.reputations.isEmpty)
          const MissingDataNote(
            what: 'Aucune réputation connue',
            remedy: 'Elles viennent de l\'événement `Reputation` du journal, '
                'que Frontier écrit à chaque démarrage de session. Une seule '
                'journée jouée synchronisée suffit.',
          )
        else
          EdPanel(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for (final MapEntry<String, double> entry
                    in session.reputations.entries)
                  FactRow(
                    label: entry.key,
                    // -100..100 mapped onto a bar that starts at zero.
                    value: '${entry.value.toStringAsFixed(0)} — '
                        '${standingFor(entry.value)}',
                    tone: toneFor(entry.value),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

class _PowerplayPanel extends StatelessWidget {
  const _PowerplayPanel({required this.session});

  final JournalSessionState session;

  @override
  Widget build(BuildContext context) {
    final String? power = session.pledgedPower;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Powerplay'),
        const SizedBox(height: EdSpacing.md),
        if (power == null)
          const MissingDataNote(
            what: 'Aucune allégeance connue',
            remedy: 'S\'engager auprès de Pranav Antal majore les ventes de '
                'données organiques jusqu\'à +30 % dans son espace. '
                'L\'information vient du journal.',
          )
        else
          EdPanel(
            accent: session.boostsOrganicSales ? EdColors.green : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FactRow(label: 'Puissance', value: power),
                if (session.powerplayRank case final int rank)
                  FactRow(label: 'Rang', value: '$rank'),
                if (session.powerplayMerits case final int merits)
                  FactRow(label: 'Mérites', value: '$merits'),
                if (session.boostsOrganicSales) ...<Widget>[
                  const SizedBox(height: EdSpacing.xs),
                  const Text(
                    'Jusqu\'à +30 % sur les ventes de données organiques dans '
                    'les systèmes contrôlés.',
                    style: EdTypography.caption,
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}

class _StatisticsPanel extends StatelessWidget {
  const _StatisticsPanel({required this.session});

  final JournalSessionState session;

  @override
  Widget build(BuildContext context) {
    final StatisticsEvent? stats = session.statistics;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Statistiques'),
        const SizedBox(height: EdSpacing.md),
        if (stats == null)
          const MissingDataNote(
            what: 'Aucune statistique',
            remedy: 'L\'événement `Statistics` porte le profit exobiologique '
                'de carrière — le chiffre exact que compte l\'échelle '
                'Exobiologist. Il est réécrit à chaque démarrage de session.',
          )
        else ...<Widget>[
          EdPanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const EdSubHeader('Exobiologie'),
                const SizedBox(height: EdSpacing.xs),
                _credits('Profit total', stats.organicDataProfitCr),
                _credits('dont First Logged', stats.firstLoggedProfitCr),
                _count('Espèces First Logged', stats.firstLoggedCount),
                _count('Espèces rencontrées', stats.organicSpeciesEncountered),
                _count('Variantes rencontrées',
                    stats.organicVariantsEncountered),
                _count('Systèmes échantillonnés', stats.organicSystems),
                _count('Planètes échantillonnées', stats.organicPlanets),
              ],
            ),
          ),
          const SizedBox(height: EdSpacing.md),
          EdPanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const EdSubHeader('Exploration'),
                const SizedBox(height: EdSpacing.xs),
                _count('Systèmes visités', stats.systemsVisited),
                _count('Corps scannés au DSS', stats.bodiesScannedDetailed),
                _count('First Footfalls', stats.firstFootfalls),
                _count('Sauts hyperespace', stats.hyperspaceJumps),
                if (stats.greatestDistanceLy case final int distance)
                  FactRow(
                    label: 'Distance maximale',
                    value: '$distance LY du point de départ',
                  ),
                _credits('Profit exploration', stats.explorationProfitCr),
                if (stats.timePlayedSeconds case final int seconds)
                  FactRow(
                    label: 'Temps de jeu',
                    value: '${(seconds / 3600).round()} h',
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  static Widget _credits(String label, int? value) => value == null
      ? const SizedBox.shrink()
      : FactRow(label: label, value: formatCredits(value));

  static Widget _count(String label, int? value) => value == null
      ? const SizedBox.shrink()
      : FactRow(label: label, value: '$value');
}
