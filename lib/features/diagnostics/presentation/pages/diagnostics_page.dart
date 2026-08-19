import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../core/responsive/window_size.dart';
import '../../../../design_system/design_system.dart';
import '../../domain/entities/diagnostics_capture.dart';
import '../../domain/entities/payload_inspection.dart';
import '../../domain/entities/raw_payload.dart';
import '../bloc/diagnostics_bloc.dart';

/// Shows what the Companion API actually returns, before the app interprets it.
///
/// The app reads a fraction of `/profile` and thirteen journal event names out
/// of the forty a session writes. Everything else is stored and ignored — so
/// deciding what a screen *could* show is a counting exercise on a real
/// account, and this is where it happens.
class DiagnosticsPage extends StatelessWidget {
  const DiagnosticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiagnosticsBloc>(
      create: (_) => getIt<DiagnosticsBloc>()..add(const DiagnosticsStarted()),
      child: const _DiagnosticsView(),
    );
  }
}

class _DiagnosticsView extends StatelessWidget {
  const _DiagnosticsView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiagnosticsBloc, DiagnosticsState>(
      listenWhen: (DiagnosticsState previous, DiagnosticsState current) =>
          previous.exportedPath != current.exportedPath ||
          previous.failure != current.failure,
      listener: (BuildContext context, DiagnosticsState state) {
        final String? message = state.failure?.message ??
            (state.exportedPath == null ? null : 'Écrit : ${state.exportedPath}');
        if (message == null) {
          return;
        }
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(message),
              action: state.exportedPath == null
                  ? null
                  : SnackBarAction(
                      label: 'Copier le chemin',
                      onPressed: () => Clipboard.setData(
                        ClipboardData(text: state.exportedPath!),
                      ),
                    ),
            ),
          );
      },
      builder: (BuildContext context, DiagnosticsState state) {
        return CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: EdPageHeader(
                kicker: 'Outil de développement',
                title: 'Diagnostic Frontier',
                deck: 'Ce que la synchronisation renvoie vraiment, avant que '
                    'l\'application n\'en fasse quoi que ce soit.',
              ),
            ),
            SliverToBoxAdapter(
              child: ReadableWidth(
                maxWidth: Breakpoints.contentColumn,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: EdSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const EdCallout(
                        tone: EdCalloutTone.info,
                        title: 'Ce que compte cet écran',
                        child: Text(
                          'Lire ce qui est déjà sur l\'appareil ne coûte rien. '
                          'Chaque « Récupérer » dépense en revanche une des '
                          'quelque une-requête-par-minute que Frontier '
                          'autorise, et le profil ne change côté serveur qu\'à '
                          'l\'amarrage.',
                          style: EdTypography.bodySmall,
                        ),
                      ),
                      const SizedBox(height: EdSpacing.xxl),
                      const EdSectionHeader(
                        title: 'Profil — GET /profile',
                        number: 1,
                      ),
                      const SizedBox(height: EdSpacing.md),
                      _ProfileSection(state: state),
                      const SizedBox(height: EdSpacing.xxl),
                      const EdSectionHeader(
                        title: 'Journal — GET /journal',
                        number: 2,
                      ),
                      const SizedBox(height: EdSpacing.md),
                      _JournalSection(state: state),
                      const SizedBox(height: EdSpacing.xxxl),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// --- Profile -----------------------------------------------------------------

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({required this.state});

  final DiagnosticsState state;

  @override
  Widget build(BuildContext context) {
    final ProfileCapture? capture = state.profile;

    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (capture == null)
            const Text(
              'Aucun profil sur cet appareil. Connecte le compte Frontier, '
              'puis « Récupérer maintenant ».',
              style: EdTypography.bodySmall,
            )
          else ...<Widget>[
            _CaptureHeader(payload: capture.payload),
            const SizedBox(height: EdSpacing.md),
            for (final InspectionFinding finding
                in capture.inspection.findings) ...<Widget>[
              _FindingTile(finding: finding),
              const SizedBox(height: EdSpacing.xs),
            ],
            const SizedBox(height: EdSpacing.xs),
            _KeyList(
              label: 'Clés de premier niveau',
              keys: capture.inspection.topLevelKeys,
            ),
            const SizedBox(height: EdSpacing.md),
            _RawBodyTile(payload: capture.payload),
          ],
          const SizedBox(height: EdSpacing.md),
          _CaptureActions(
            payload: capture?.payload,
            isBusy: state.isFetchingProfile || state.isExporting,
            fetchLabel: 'Récupérer maintenant',
            onFetch: () => context
                .read<DiagnosticsBloc>()
                .add(const DiagnosticsProfileRefreshRequested()),
          ),
        ],
      ),
    );
  }
}

// --- Journal -----------------------------------------------------------------

class _JournalSection extends StatelessWidget {
  const _JournalSection({required this.state});

  final DiagnosticsState state;

  @override
  Widget build(BuildContext context) {
    final JournalCapture? capture = state.journal;

    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (capture == null)
            const Text(
              'Aucune ligne de journal sur cet appareil. Importe un dossier de '
              'journaux, ou récupère la journée en cours ci-dessous.',
              style: EdTypography.bodySmall,
            )
          else ...<Widget>[
            _CaptureHeader(payload: capture.payload),
            const SizedBox(height: EdSpacing.md),
            _JournalSummary(inspection: capture.inspection),
            const SizedBox(height: EdSpacing.lg),
            const EdSubHeader('Événements attendus par le plan'),
            const SizedBox(height: EdSpacing.xs),
            _TallyTable(tallies: capture.inspection.planned),
            const SizedBox(height: EdSpacing.md),
            _AllTalliesTile(inspection: capture.inspection),
            const SizedBox(height: EdSpacing.xs),
            _RawBodyTile(payload: capture.payload),
          ],
          const SizedBox(height: EdSpacing.md),
          _CaptureActions(
            payload: capture?.payload,
            isBusy: state.isFetchingJournal || state.isExporting,
            fetchLabel: 'Récupérer la journée en cours',
            onFetch: () => context
                .read<DiagnosticsBloc>()
                .add(const DiagnosticsJournalDayRequested()),
          ),
        ],
      ),
    );
  }
}

class _JournalSummary extends StatelessWidget {
  const _JournalSummary({required this.inspection});

  final JournalInspection inspection;

  @override
  Widget build(BuildContext context) {
    return AdaptiveGrid(
      minTileWidth: 170,
      children: <Widget>[
        EdStatTile(
          label: 'Lignes',
          value: '${inspection.lineCount}',
          icon: Icons.list_alt_outlined,
          hint: inspection.unreadableLines == 0
              ? null
              : '${inspection.unreadableLines} illisible(s)',
        ),
        EdStatTile(
          label: 'Types d\'événements',
          value: '${inspection.eventTypeCount}',
          icon: Icons.category_outlined,
          valueColor: EdColors.cyanBright,
        ),
        EdStatTile(
          label: 'Attendus manquants',
          value: '${inspection.missing.length}',
          icon: Icons.help_outline,
          valueColor: inspection.missing.isEmpty
              ? EdColors.greenBright
              : EdColors.amber,
          hint: inspection.missing.isEmpty
              ? 'Tout est là'
              : inspection.missing
                  .map((JournalEventTally tally) => tally.name)
                  .join(', '),
        ),
        EdStatTile(
          label: 'Période',
          value: _range(inspection),
          icon: Icons.schedule,
        ),
      ],
    );
  }

  static String _range(JournalInspection inspection) {
    final DateTime? first = inspection.firstAt;
    final DateTime? last = inspection.lastAt;
    if (first == null || last == null) {
      return '—';
    }
    final String from = _day(first);
    final String to = _day(last);
    return from == to ? from : '$from → $to';
  }

  static String _day(DateTime at) =>
      '${at.day.toString().padLeft(2, '0')}/'
      '${at.month.toString().padLeft(2, '0')}/${at.year}';
}

class _TallyTable extends StatelessWidget {
  const _TallyTable({required this.tallies});

  final List<JournalEventTally> tallies;

  @override
  Widget build(BuildContext context) {
    if (tallies.isEmpty) {
      return const Text('—', style: EdTypography.bodySmall);
    }
    return EdDataTable(
      headers: const <String>['Événement', 'Occurrences', 'Lu par l\'app'],
      rows: <List<EdCell>>[
        for (final JournalEventTally tally in tallies)
          <EdCell>[
            EdCell(tally.name, strong: tally.isPresent),
            EdCell.number(tally.isPresent ? '${tally.count}' : '—'),
            _readCell(tally),
          ],
      ],
    );
  }

  /// `SuitLoadout` is the awkward one: the app reads it for the suit and drops
  /// the weapons it carries. Saying "oui" there would be a lie.
  static EdCell _readCell(JournalEventTally tally) {
    if (!tally.isPresent) {
      return const EdCell.lose('absent de la capture');
    }
    if (tally.isPartiallyRead) {
      return const EdCell.mid('partiellement');
    }
    return tally.isParsed
        ? const EdCell.win('oui')
        : const EdCell.lose('non');
  }
}

class _AllTalliesTile extends StatelessWidget {
  const _AllTalliesTile({required this.inspection});

  final JournalInspection inspection;

  @override
  Widget build(BuildContext context) {
    final List<JournalEventTally> present = inspection.tallies
        .where((JournalEventTally tally) => tally.isPresent)
        .toList(growable: false);
    return _Expandable(
      title: 'Tous les événements rencontrés (${present.length})',
      child: _TallyTable(tallies: present),
    );
  }
}

// --- Shared pieces -----------------------------------------------------------

class _CaptureHeader extends StatelessWidget {
  const _CaptureHeader({required this.payload});

  final RawPayload payload;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Wrap(
          spacing: EdSpacing.xs,
          runSpacing: EdSpacing.xxs,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Text(payload.title, style: EdTypography.titleMedium),
            EdTag(
              label: payload.origin.label,
              background: payload.origin == RawPayloadOrigin.companionApi
                  ? EdColors.tagCyanFill
                  : EdColors.panelHeader,
              foreground: EdColors.textMuted,
            ),
            if (payload.statusCode case final int status)
              EdTag(label: 'HTTP $status'),
          ],
        ),
        const SizedBox(height: EdSpacing.xxs),
        Text(
          '${_size(payload)} · capturé le ${_stamp(payload.capturedAt)}',
          style: EdTypography.caption,
        ),
        if (payload.note case final String note) ...<Widget>[
          const SizedBox(height: EdSpacing.xxs),
          Text(note, style: EdTypography.caption),
        ],
      ],
    );
  }

  static String _size(RawPayload payload) {
    final int characters = payload.characterCount;
    if (characters < 1024) {
      return '$characters caractères';
    }
    if (characters < 1024 * 1024) {
      return '${(characters / 1024).toStringAsFixed(1)} Kio';
    }
    return '${(characters / (1024 * 1024)).toStringAsFixed(1)} Mio';
  }

  static String _stamp(DateTime at) {
    final DateTime local = at.toLocal();
    return '${local.day.toString().padLeft(2, '0')}/'
        '${local.month.toString().padLeft(2, '0')}/${local.year} à '
        '${local.hour.toString().padLeft(2, '0')}:'
        '${local.minute.toString().padLeft(2, '0')}';
  }
}

class _FindingTile extends StatelessWidget {
  const _FindingTile({required this.finding});

  final InspectionFinding finding;

  @override
  Widget build(BuildContext context) {
    return EdPanel(
      background: EdColors.panelRaised,
      accent: finding.isOpenQuestion ? EdColors.amber : null,
      padding: const EdgeInsets.all(EdSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Wrap(
            spacing: EdSpacing.xs,
            runSpacing: EdSpacing.xxs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Text(finding.subject, style: EdTypography.bodySmall),
              _VerdictTag(verdict: finding.verdict),
              if (finding.isOpenQuestion)
                const EdTag(
                  label: 'QUESTION OUVERTE',
                  background: EdColors.tagGoldFill,
                  foreground: EdColors.gold,
                  tooltip: 'Non documenté par Frontier : seule une vraie '
                      'capture tranche.',
                ),
            ],
          ),
          const SizedBox(height: EdSpacing.xxs),
          Text(finding.detail, style: EdTypography.caption),
        ],
      ),
    );
  }
}

class _VerdictTag extends StatelessWidget {
  const _VerdictTag({required this.verdict});

  final InspectionVerdict verdict;

  @override
  Widget build(BuildContext context) {
    final (Color background, Color foreground) = switch (verdict) {
      InspectionVerdict.present => (EdColors.tagGreenFill, EdColors.greenBright),
      InspectionVerdict.partial => (EdColors.tagGoldFill, EdColors.amber),
      InspectionVerdict.absent => (EdColors.warnFill, EdColors.redBright),
      InspectionVerdict.unknown => (EdColors.panelHeader, EdColors.textDim),
    };
    return EdTag(
      label: verdict.label.toUpperCase(),
      background: background,
      foreground: foreground,
    );
  }
}

class _KeyList extends StatelessWidget {
  const _KeyList({required this.label, required this.keys});

  final String label;
  final List<String> keys;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(label.toUpperCase(), style: EdTypography.overline),
        const SizedBox(height: EdSpacing.xxs),
        Text(
          keys.isEmpty ? '—' : keys.join(' · '),
          style: EdTypography.numeric,
        ),
      ],
    );
  }
}

class _RawBodyTile extends StatelessWidget {
  const _RawBodyTile({required this.payload});

  final RawPayload payload;

  /// A `/profile` runs to hundreds of kilobytes and a journal day to several
  /// megabytes; rendering all of it would stall the frame for no benefit.
  /// The whole capture still leaves by « Copier » and « Exporter ».
  static const int previewLimit = 4000;

  @override
  Widget build(BuildContext context) {
    final bool truncated = payload.characterCount > previewLimit;
    final String preview = truncated
        ? payload.body.substring(0, previewLimit)
        : payload.body;

    return _Expandable(
      title: 'Voir le contenu brut',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (truncated)
            Padding(
              padding: const EdgeInsets.only(bottom: EdSpacing.xs),
              child: Text(
                'Aperçu des $previewLimit premiers caractères sur '
                '${payload.characterCount}. « Copier » et « Exporter » '
                'prennent tout.',
                style: EdTypography.caption,
              ),
            ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(EdSpacing.sm),
            decoration: const BoxDecoration(color: EdColors.space),
            child: SelectableText(
              preview.isEmpty ? '(vide)' : preview,
              style: EdTypography.numeric,
            ),
          ),
        ],
      ),
    );
  }
}

class _CaptureActions extends StatelessWidget {
  const _CaptureActions({
    required this.payload,
    required this.isBusy,
    required this.fetchLabel,
    required this.onFetch,
  });

  final RawPayload? payload;
  final bool isBusy;
  final String fetchLabel;
  final VoidCallback onFetch;

  @override
  Widget build(BuildContext context) {
    final RawPayload? capture = payload;
    return Wrap(
      spacing: EdSpacing.xs,
      runSpacing: EdSpacing.xs,
      children: <Widget>[
        OutlinedButton.icon(
          onPressed: isBusy ? null : onFetch,
          icon: const Icon(Icons.sync, size: 15),
          label: Text(fetchLabel),
        ),
        TextButton.icon(
          onPressed: capture == null
              ? null
              : () => _copy(context, capture),
          icon: const Icon(Icons.copy_all_outlined, size: 15),
          label: const Text('Copier'),
        ),
        TextButton.icon(
          onPressed: capture == null || isBusy
              ? null
              : () => context
                  .read<DiagnosticsBloc>()
                  .add(DiagnosticsExportRequested(capture)),
          icon: const Icon(Icons.save_alt, size: 15),
          label: const Text('Exporter'),
        ),
      ],
    );
  }

  Future<void> _copy(BuildContext context, RawPayload capture) async {
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    await Clipboard.setData(ClipboardData(text: capture.body));
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('Capture copiée dans le presse-papiers.')),
      );
  }
}

/// A disclosure row that keeps the panel's flat look rather than Material's.
class _Expandable extends StatelessWidget {
  const _Expandable({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(title, style: EdTypography.bodySmall),
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.only(bottom: EdSpacing.xs),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[child],
      ),
    );
  }
}
