import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../core/responsive/window_size.dart';
import '../../../../design_system/design_system.dart';
import '../../../journal/domain/entities/journal_session_state.dart';
import '../../domain/entities/commander.dart';
import '../../domain/entities/manual_commander_overrides.dart';
import '../bloc/commander_bloc.dart';

/// Where each figure comes from, and what the commander has overridden.
///
/// It used to also list ranks, suits and balances; the cockpit's detail pages
/// now own those, and two screens showing the same numbers is two screens that
/// drift. What is left is the question only this page answers: *is this value
/// from Frontier, from the flight log, or from me?*
class CommanderPage extends StatelessWidget {
  const CommanderPage({this.onEditProfile, super.key});

  final VoidCallback? onEditProfile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommanderBloc>(
      create: (_) => getIt<CommanderBloc>()..add(const CommanderWatchStarted()),
      child: _CommanderView(onEditProfile: onEditProfile),
    );
  }
}

class _CommanderView extends StatelessWidget {
  const _CommanderView({this.onEditProfile});

  final VoidCallback? onEditProfile;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommanderBloc, CommanderState>(
      builder: (BuildContext context, CommanderState state) {
        return switch (state) {
          CommanderInitial() || CommanderLoading() => const EdLoadingView(),
          CommanderError(:final failure) => EdErrorView(
              message: failure.message,
              onRetry: () => context
                  .read<CommanderBloc>()
                  .add(const CommanderWatchStarted()),
            ),
          CommanderReady(
            :final Commander commander,
            :final ManualCommanderOverrides overrides,
            :final JournalSessionState session,
          ) =>
            CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: EdPageHeader(
                    kicker: 'Provenance',
                    title: commander.isKnown ? commander.name : 'Commandant',
                    deck: 'D\'où vient chaque information, et ce que tu as '
                        'corrigé toi-même.',
                    actions: <Widget>[
                      if (onEditProfile != null)
                        FilledButton.icon(
                          onPressed: onEditProfile,
                          icon: const Icon(Icons.edit_outlined, size: 15),
                          label: const Text('Corriger'),
                        ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: ReadableWidth(
                    maxWidth: Breakpoints.contentColumn,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: EdSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          _SourcePanel(commander: commander, session: session),
                          const SizedBox(height: EdSpacing.xxl),
                          const EdSectionHeader(title: 'Ce que tu as corrigé'),
                          const SizedBox(height: EdSpacing.md),
                          _OverridesPanel(
                            overrides: overrides,
                            onEditProfile: onEditProfile,
                          ),
                          const SizedBox(height: EdSpacing.xxxl),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
        };
      },
    );
  }
}

class _SourcePanel extends StatelessWidget {
  const _SourcePanel({required this.commander, required this.session});

  final Commander commander;
  final JournalSessionState session;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Sources'),
        const SizedBox(height: EdSpacing.md),
        EdDataTable(
          headers: const <String>['Source', 'État', 'Ce qu\'elle apporte'],
          rows: <List<EdCell>>[
            <EdCell>[
              const EdCell('Companion API'),
              commander.isKnown
                  ? EdCell.win(commander.source.label)
                  : const EdCell.lose('non connectée'),
              const EdCell(
                'Solde, position, flotte, équipement du vaisseau piloté, '
                'combinaisons, armes, rangs, services de la station',
              ),
            ],
            <EdCell>[
              const EdCell('Journal de bord'),
              session.isEmpty
                  ? const EdCell.lose('aucun événement de session')
                  : EdCell.win(_freshness(session.observedAt)),
              const EdCell(
                'Profit de carrière, ingénieurs, réputations, rebuy exact, '
                'portée de saut, matériaux, Powerplay',
              ),
            ],
            <EdCell>[
              const EdCell('Saisie manuelle'),
              const EdCell('prioritaire'),
              const EdCell(
                'Corrige n\'importe laquelle des deux autres',
              ),
            ],
          ],
          caption: 'Les deux premières se complètent : ni l\'une ni l\'autre '
              'ne suffit. La troisième l\'emporte toujours — l\'application ne '
              'voit jamais qu\'une partie d\'une sauvegarde.',
        ),
        if (commander.lastSyncedAt case final DateTime syncedAt) ...<Widget>[
          const SizedBox(height: EdSpacing.md),
          Text(
            'Dernière synchronisation Frontier : ${_formatDate(syncedAt)}.',
            style: EdTypography.caption,
          ),
        ],
      ],
    );
  }

  static String _freshness(DateTime? at) =>
      at == null ? 'importé' : _formatDate(at);

  static String _formatDate(DateTime date) {
    final DateTime local = date.toLocal();
    return '${local.day.toString().padLeft(2, '0')}/'
        '${local.month.toString().padLeft(2, '0')} à '
        '${local.hour.toString().padLeft(2, '0')}h'
        '${local.minute.toString().padLeft(2, '0')}';
  }
}

class _OverridesPanel extends StatelessWidget {
  const _OverridesPanel({required this.overrides, this.onEditProfile});

  final ManualCommanderOverrides overrides;
  final VoidCallback? onEditProfile;

  @override
  Widget build(BuildContext context) {
    final List<(String, String)> stated = <(String, String)>[
      if (overrides.commanderName case final String name) ('Nom', name),
      if (overrides.currentSystem case final String system)
        ('Système', system),
      if (overrides.shipName case final String ship) ('Vaisseau', ship),
      if (overrides.jumpRangeLy case final double range)
        ('Portée de saut', '${range.toStringAsFixed(1)} LY'),
      if (overrides.artemisGrade case final int grade)
        ('Grade Artemis', '$grade'),
      if (overrides.explorerRankLevel case final int level)
        ('Rang explorateur', '$level'),
      if (overrides.pledgedPower case final String power)
        ('Powerplay', power),
      if (overrides.hasMetaAlloy) ('Meta-Alloy', 'en soute'),
      if (overrides.ownsMaverick) ('Maverick', 'possédée'),
      if (overrides.suitMaterials.isNotEmpty)
        ('Matériaux', '${overrides.suitMaterials.length} corrigé(s)'),
      if (overrides.unlockedSuitEngineerIds.isNotEmpty ||
          overrides.unlockedShipEngineerIds.isNotEmpty)
        (
          'Ingénieurs',
          '${overrides.unlockedSuitEngineerIds.length + overrides.unlockedShipEngineerIds.length} '
              'débloqué(s)'
        ),
    ];

    if (stated.isEmpty) {
      return EdCallout(
        tone: EdCalloutTone.tip,
        title: 'Rien de saisi — et rien à saisir',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Portée de saut, matériaux, ingénieurs débloqués, Meta-Alloy et '
              'allégeance Powerplay sont désormais déduits du journal. Le '
              'formulaire ne sert plus qu\'à corriger ce que l\'application '
              'aurait mal vu.',
              style: EdTypography.bodySmall,
            ),
            if (onEditProfile != null) ...<Widget>[
              const SizedBox(height: EdSpacing.sm),
              OutlinedButton(
                onPressed: onEditProfile,
                child: const Text('Ouvrir le formulaire'),
              ),
            ],
          ],
        ),
      );
    }

    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (final (String label, String value) in stated)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: EdSpacing.xxs),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(label, style: EdTypography.bodySmall),
                  ),
                  Text(value, style: EdTypography.numeric),
                ],
              ),
            ),
          const SizedBox(height: EdSpacing.xs),
          const Text(
            'Ces valeurs l\'emportent sur la Companion API et sur le journal.',
            style: EdTypography.caption,
          ),
        ],
      ),
    );
  }
}
