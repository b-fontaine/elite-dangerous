import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../core/responsive/window_size.dart';
import '../../../../design_system/design_system.dart';
import '../../../exobiology/presentation/widgets/credits_format.dart';
import '../../domain/entities/exobiology_activity.dart';
import '../../domain/entities/journal_event.dart';
import '../../domain/repositories/journal_repository.dart';
import '../bloc/journal_bloc.dart';
import '../widgets/journal_event_tile.dart';

/// The flight log: what the commander actually did, and what it earned.
class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JournalBloc>(
      create: (_) => getIt<JournalBloc>()..add(const JournalWatchStarted()),
      child: const _JournalView(),
    );
  }
}

class _JournalView extends StatelessWidget {
  const _JournalView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JournalBloc, JournalState>(
      builder: (BuildContext context, JournalState state) {
        return CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: EdPageHeader(
                kicker: 'Carnet de bord',
                title: 'Journal',
                deck: 'Récupère tes journaux depuis Frontier, ou importe les '
                    'fichiers Journal.*.log du jeu — aucun compte requis pour '
                    'la seconde option.',
              ),
            ),
            SliverToBoxAdapter(
              child: ReadableWidth(
                maxWidth: Breakpoints.contentColumn,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: EdSpacing.lg),
                  child: _SyncPanel(state: state),
                ),
              ),
            ),
            if (!state.isEmpty)
              SliverToBoxAdapter(
                child: ReadableWidth(
                  maxWidth: Breakpoints.contentColumn,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: EdSpacing.lg),
                    child: _ActivitySummary(activity: state.activity),
                  ),
                ),
              ),
            SliverToBoxAdapter(
              child: ReadableWidth(
                maxWidth: Breakpoints.contentColumn,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: EdSpacing.md),
                  child: Wrap(
                    spacing: EdSpacing.xs,
                    children: <Widget>[
                      for (final JournalFilter filter in JournalFilter.values)
                        ChoiceChip(
                          selected: state.filter == filter,
                          showCheckmark: false,
                          selectedColor: EdColors.tagOrangeFill,
                          onSelected: (_) => context
                              .read<JournalBloc>()
                              .add(JournalFilterChanged(filter)),
                          label: Text(
                            filter.label,
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
                  ),
                ),
              ),
            ),
            if (state.isEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(EdSpacing.xxl),
                  child: EdEmptyView(
                    icon: Icons.menu_book_outlined,
                    title: 'Journal vide',
                    message: 'Synchronise depuis Frontier ou importe un '
                        'dossier de journaux pour commencer.',
                  ),
                ),
              )
            else
              SliverToBoxAdapter(
                child: ReadableWidth(
                  maxWidth: Breakpoints.contentColumn,
                  child: Column(
                    children: <Widget>[
                      for (final JournalEvent event in state.visibleEvents)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: JournalEventTile(event: event),
                        ),
                      const SizedBox(height: EdSpacing.xxxl),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _SyncPanel extends StatefulWidget {
  const _SyncPanel({required this.state});

  final JournalState state;

  @override
  State<_SyncPanel> createState() => _SyncPanelState();
}

class _SyncPanelState extends State<_SyncPanel> {
  late final TextEditingController _directory = TextEditingController(
    text: widget.state.suggestedDirectories.isEmpty
        ? ''
        : widget.state.suggestedDirectories.first,
  );

  @override
  void didUpdateWidget(_SyncPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_directory.text.isEmpty &&
        widget.state.suggestedDirectories.isNotEmpty) {
      _directory.text = widget.state.suggestedDirectories.first;
    }
  }

  @override
  void dispose() {
    _directory.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final JournalState state = widget.state;

    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const EdSubHeader('Synchronisation'),
          const SizedBox(height: EdSpacing.md),
          Row(
            children: <Widget>[
              Expanded(
                child: FilledButton.icon(
                  onPressed: state.isSyncing
                      ? null
                      : () => context
                          .read<JournalBloc>()
                          .add(const JournalSyncRequested()),
                  icon: state.isSyncing
                      ? const SizedBox(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.cloud_download_outlined, size: 16),
                  label: const Text('Depuis Frontier (7 j)'),
                ),
              ),
            ],
          ),
          const SizedBox(height: EdSpacing.md),
          TextField(
            controller: _directory,
            style: EdTypography.bodySmall,
            decoration: const InputDecoration(
              labelText: 'DOSSIER DE JOURNAUX',
              helperText: 'Saved Games/Frontier Developments/Elite Dangerous',
              helperMaxLines: 2,
            ),
          ),
          const SizedBox(height: EdSpacing.sm),
          OutlinedButton.icon(
            onPressed: state.isSyncing
                ? null
                : () => context
                    .read<JournalBloc>()
                    .add(JournalImportRequested(_directory.text.trim())),
            icon: const Icon(Icons.folder_open_outlined, size: 16),
            label: const Text('Importer ce dossier'),
          ),
          if (state.failure != null) ...<Widget>[
            const SizedBox(height: EdSpacing.md),
            EdCallout.text(
              tone: EdCalloutTone.warning,
              title: 'Échec',
              text: state.failure!.message,
            ),
          ],
          if (state.lastReport case final JournalSyncReport report) ...<Widget>[
            const SizedBox(height: EdSpacing.md),
            EdCallout.text(
              tone: report.hasPartialDays
                  ? EdCalloutTone.warning
                  : EdCalloutTone.tip,
              title: 'Résultat',
              text: _describe(report),
            ),
          ],
        ],
      ),
    );
  }

  static String _describe(JournalSyncReport report) {
    final List<String> parts = <String>[
      '${report.eventsAdded} événement(s) ajouté(s)',
      if (report.filesRead > 0) '${report.filesRead} fichier(s) lu(s)',
      if (report.daysFetched > 0) '${report.daysFetched} jour(s) récupéré(s)',
      if (report.daysWithoutPlay > 0)
        '${report.daysWithoutPlay} jour(s) sans partie',
      if (report.eventsSkipped > 0)
        '${report.eventsSkipped} ligne(s) illisible(s)',
    ];
    final String summary = parts.join(' · ');
    if (!report.hasPartialDays) {
      return summary;
    }
    return '$summary. Frontier n\'a pas pu rassembler toutes les données pour '
        '${report.partialDays.join(", ")} : relance la synchronisation plus '
        'tard.';
  }
}

class _ActivitySummary extends StatelessWidget {
  const _ActivitySummary({required this.activity});

  final ExobiologyActivity activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AdaptiveGrid(
          minTileWidth: 190,
          children: <Widget>[
            EdStatTile(
              label: 'Vendu (exobio)',
              value: formatCredits(activity.totalSoldCr),
              icon: Icons.savings_outlined,
            ),
            EdStatTile(
              label: 'First Logged',
              value: '${activity.firstLoggedCount}',
              icon: Icons.emoji_events_outlined,
              valueColor: EdColors.greenBright,
              hint: 'Primes ×5 encaissées',
            ),
            EdStatTile(
              label: 'Espèces vendues',
              value: '${activity.distinctSpeciesSold}',
              icon: Icons.biotech_outlined,
              valueColor: EdColors.cyanBright,
            ),
            EdStatTile(
              label: 'En soute',
              value: '${activity.completedNotSold.length}',
              icon: Icons.warning_amber_rounded,
              valueColor: activity.hasDataAtRisk
                  ? EdColors.redBright
                  : EdColors.textFaint,
              hint: activity.hasDataAtRisk
                  ? 'Perdu en cas de destruction'
                  : 'Rien à risque',
            ),
          ],
        ),
        if (activity.samplesInProgress.isNotEmpty) ...<Widget>[
          const SizedBox(height: EdSpacing.md),
          EdPanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const EdSubHeader('Prélèvements en cours'),
                const SizedBox(height: EdSpacing.xs),
                for (final InProgressOrganism organism
                    in activity.samplesInProgress)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            organism.species,
                            style: EdTypography.bodySmall,
                          ),
                        ),
                        Text(
                          '${organism.samplesTaken}/3',
                          style: EdTypography.numeric,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
