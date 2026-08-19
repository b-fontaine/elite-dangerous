import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import '../../../exobiology/domain/entities/engineer.dart';
import '../../../exobiology/domain/services/exobiology_reference_data.dart';
import '../../../journal/domain/entities/journal_event.dart';
import '../../../journal/domain/entities/journal_session_state.dart';
import '../widgets/commander_scope.dart';

/// Engineer standing, crossed with the ones exobiology actually needs.
class EngineersPage extends StatelessWidget {
  const EngineersPage({super.key});

  @override
  Widget build(BuildContext context) => CommanderScope(
        builder: (BuildContext context, CommanderDossier dossier) =>
            _EngineersView(session: dossier.session),
      );
}

class _EngineersView extends StatelessWidget {
  const _EngineersView({required this.session});

  final JournalSessionState session;

  @override
  Widget build(BuildContext context) {
    return DetailPageScaffold(
      kicker: 'Dossier',
      title: 'Ingénieurs',
      deck: session.engineers.isEmpty
          ? null
          : '${session.unlockedEngineers.length} débloqué(s) sur '
              '${session.engineers.length} connu(s) du jeu',
      slivers: <Widget>[
        if (session.engineers.isEmpty)
          const DetailSection(
            top: EdSpacing.lg,
            child: MissingDataNote(
              what: 'Aucun ingénieur connu',
              remedy: 'La Companion API ne les expose pas du tout. '
                  'L\'événement `EngineerProgress` du journal donne le statut '
                  'et le rang de chacun ; Frontier le réécrit à chaque '
                  'démarrage de session, donc une journée jouée suffit.',
            ),
          )
        else ...<Widget>[
          DetailSection(top: EdSpacing.lg, child: _RelevantPanel(session: session)),
          DetailSection(child: _AllEngineersPanel(session: session)),
        ],
      ],
    );
  }
}

/// The engineers this app has an opinion about, and what they are for.
class _RelevantPanel extends StatelessWidget {
  const _RelevantPanel({required this.session});

  final JournalSessionState session;

  @override
  Widget build(BuildContext context) {
    final Map<String, EngineerStanding> byName = <String, EngineerStanding>{
      for (final EngineerStanding standing in session.engineers)
        standing.name.toLowerCase(): standing,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Ceux qui comptent pour l\'exobiologie'),
        const SizedBox(height: EdSpacing.md),
        for (final Engineer engineer in ExobiologyReferenceData.engineers)
          Padding(
            padding: const EdgeInsets.only(bottom: EdSpacing.xs),
            child: _EngineerCard(
              engineer: engineer,
              standing: byName[engineer.name.toLowerCase()],
            ),
          ),
      ],
    );
  }
}

class _EngineerCard extends StatelessWidget {
  const _EngineerCard({required this.engineer, this.standing});

  final Engineer engineer;
  final EngineerStanding? standing;

  @override
  Widget build(BuildContext context) {
    final EngineerUnlockStage stage =
        standing?.stage ?? EngineerUnlockStage.unknown;
    final bool unlocked = stage.isUnlocked;

    return EdPanel(
      background: EdColors.panelRaised,
      accent: unlocked ? EdColors.green : null,
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
              Text(engineer.name, style: EdTypography.bodySmall),
              _StageTag(stage: stage),
              if (unlocked && standing?.rank != null)
                EdTag(
                  label: 'RANG ${standing!.rank}',
                  background: EdColors.tagGreenFill,
                  foreground: EdColors.greenBright,
                ),
              if (engineer.requiresCombat)
                const EdTag(
                  label: 'COMBAT REQUIS',
                  background: EdColors.warnFill,
                  foreground: EdColors.redBright,
                ),
            ],
          ),
          const SizedBox(height: EdSpacing.xxs),
          Text(
            '${engineer.kind.label} · ${engineer.system}',
            style: EdTypography.caption,
          ),
          if (!unlocked && engineer.unlockRequirements.isNotEmpty) ...<Widget>[
            const SizedBox(height: EdSpacing.xs),
            for (final String requirement in engineer.unlockRequirements)
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text('• $requirement', style: EdTypography.caption),
              ),
          ],
        ],
      ),
    );
  }
}

class _StageTag extends StatelessWidget {
  const _StageTag({required this.stage});

  final EngineerUnlockStage stage;

  @override
  Widget build(BuildContext context) {
    final (Color background, Color foreground) = switch (stage) {
      EngineerUnlockStage.unlocked => (
          EdColors.tagGreenFill,
          EdColors.greenBright,
        ),
      EngineerUnlockStage.invited => (EdColors.tagGoldFill, EdColors.amber),
      EngineerUnlockStage.known => (EdColors.tagCyanFill, EdColors.cyan),
      EngineerUnlockStage.unknown => (EdColors.panelHeader, EdColors.textDim),
    };
    return EdTag(
      label: stage.label.toUpperCase(),
      background: background,
      foreground: foreground,
    );
  }
}

/// Everything the journal reported, including engineers this app has no
/// opinion about — there are more than thirty in the game.
class _AllEngineersPanel extends StatelessWidget {
  const _AllEngineersPanel({required this.session});

  final JournalSessionState session;

  @override
  Widget build(BuildContext context) {
    final List<EngineerStanding> sorted = <EngineerStanding>[
      ...session.engineers,
    ]..sort((EngineerStanding a, EngineerStanding b) {
        final int byStage = b.stage.index.compareTo(a.stage.index);
        return byStage != 0 ? byStage : a.name.compareTo(b.name);
      });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        EdSectionHeader(title: 'Tous les ingénieurs (${sorted.length})'),
        const SizedBox(height: EdSpacing.md),
        EdDataTable(
          headers: const <String>['Ingénieur', 'Statut', 'Rang'],
          rows: <List<EdCell>>[
            for (final EngineerStanding standing in sorted)
              <EdCell>[
                EdCell(standing.name, strong: standing.stage.isUnlocked),
                standing.stage.isUnlocked
                    ? EdCell.win(standing.stage.label)
                    : EdCell(standing.stage.label),
                EdCell.number(
                  standing.rank == null ? '—' : '${standing.rank}',
                ),
              ],
          ],
        ),
      ],
    );
  }
}
