import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import '../../domain/entities/roadmap.dart';
import 'credits_format.dart';

/// One prioritised action.
///
/// The card always answers three questions in this order: *what to do*, *why
/// now*, and *what it is worth* — which is the whole point of the roadmap over
/// a flat checklist.
class RoadmapStepCard extends StatelessWidget {
  const RoadmapStepCard({
    required this.step,
    required this.onToggleCompleted,
    required this.onToggleDismissed,
    this.isHighlighted = false,
    super.key,
  });

  final RoadmapStep step;
  final void Function(bool completed) onToggleCompleted;
  final void Function(bool dismissed) onToggleDismissed;

  /// The single next thing to do gets extra prominence.
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    final Color accent = _accentFor(step);
    final bool isDone = step.status == RoadmapStatus.done;
    final bool isDismissed = step.status == RoadmapStatus.dismissed;

    return EdPanel(
      accent: isHighlighted ? EdColors.orange : null,
      background: isHighlighted ? EdColors.panelRaised : EdColors.panel,
      borderColor: isHighlighted ? EdColors.borderStrong : EdColors.border,
      padding: const EdgeInsets.fromLTRB(
        EdSpacing.lg,
        EdSpacing.md,
        EdSpacing.lg,
        EdSpacing.md,
      ),
      semanticLabel: '${step.title}. ${step.summary}',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _StatusChip(status: step.status, accent: accent),
              const SizedBox(width: EdSpacing.xs),
              EdTag(
                label: step.category.label,
                background: EdColors.panelHeader,
                foreground: EdColors.textMuted,
                tooltip: step.category.description,
              ),
              const Spacer(),
              if (isHighlighted)
                const EdTag(
                  label: 'Prochaine étape',
                  background: EdColors.tagOrangeFill,
                  foreground: EdColors.orangeBright,
                ),
            ],
          ),
          const SizedBox(height: EdSpacing.sm),
          Text(
            step.title,
            style: EdTypography.titleLarge.copyWith(
              color: isDone || isDismissed
                  ? EdColors.textFaint
                  : EdColors.textStrong,
              decoration: isDismissed ? TextDecoration.lineThrough : null,
              decorationColor: EdColors.textFaint,
            ),
          ),
          const SizedBox(height: 6),
          Text(step.summary, style: EdTypography.bodySmall),
          if (step.progress != null) ...<Widget>[
            const SizedBox(height: EdSpacing.md),
            EdProgressBar(
              progress: step.progress!,
              trailingLabel: step.progressLabel,
            ),
          ],
          if (step.impact.hasFigures) ...<Widget>[
            const SizedBox(height: EdSpacing.sm),
            _ImpactRow(impact: step.impact),
          ],
          if (step.blockedReasons.isNotEmpty) ...<Widget>[
            const SizedBox(height: EdSpacing.sm),
            EdCallout(
              tone: EdCalloutTone.warning,
              title: 'Bloqué par',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  for (final String reason in step.blockedReasons)
                    Text('• $reason', style: EdTypography.bodySmall),
                ],
              ),
            ),
          ],
          const SizedBox(height: EdSpacing.sm),
          _StepDetails(step: step),
          const SizedBox(height: EdSpacing.xs),
          Row(
            children: <Widget>[
              TextButton.icon(
                onPressed: () => onToggleCompleted(!isDone),
                icon: Icon(
                  isDone
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  size: 16,
                  color: isDone ? EdColors.greenBright : EdColors.textFainter,
                ),
                label: Text(isDone ? 'Fait' : 'Marquer comme fait'),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => onToggleDismissed(!isDismissed),
                child: Text(
                  isDismissed ? 'Réactiver' : 'Ignorer',
                  style: EdTypography.caption.copyWith(
                    color: EdColors.textFaint,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Color _accentFor(RoadmapStep step) => switch (step.status) {
        RoadmapStatus.available => EdColors.orangeBright,
        RoadmapStatus.inProgress => EdColors.gold,
        RoadmapStatus.blocked => EdColors.redBright,
        RoadmapStatus.done => EdColors.greenBright,
        RoadmapStatus.dismissed => EdColors.textFainter,
      };
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status, required this.accent});

  final RoadmapStatus status;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return EdTag(
      label: status.label,
      background: EdColors.panelHeader,
      foreground: accent,
    );
  }
}

class _ImpactRow extends StatelessWidget {
  const _ImpactRow({required this.impact});

  final RoadmapImpact impact;

  @override
  Widget build(BuildContext context) {
    final List<Widget> chips = <Widget>[
      if (impact.creditGainPerSessionCr case final int gain)
        _chip(Icons.trending_up, '${formatCredits(gain)} / session'),
      if (impact.creditGainCr case final int gain)
        _chip(
          gain >= 0 ? Icons.savings_outlined : Icons.payments_outlined,
          formatCredits(gain),
        ),
      if (impact.sessions case final double sessions)
        _chip(Icons.schedule, _sessions(sessions)),
      if (impact.label case final String label) _chip(Icons.bolt, label),
    ];

    return Wrap(spacing: EdSpacing.sm, runSpacing: 6, children: chips);
  }

  static Widget _chip(IconData icon, String label) => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 13, color: EdColors.textFainter),
          const SizedBox(width: 5),
          Text(label, style: EdTypography.caption),
        ],
      );

  static String _sessions(double sessions) {
    if (sessions < 1) {
      return 'moins d\'une session';
    }
    final String rounded = sessions == sessions.roundToDouble()
        ? sessions.toStringAsFixed(0)
        : sessions.toStringAsFixed(1);
    return '$rounded session${sessions >= 2 ? 's' : ''}';
  }
}

class _StepDetails extends StatelessWidget {
  const _StepDetails({required this.step});

  final RoadmapStep step;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.only(bottom: EdSpacing.sm),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        iconColor: EdColors.orangeBright,
        collapsedIconColor: EdColors.textFainter,
        title: Text(
          'Pourquoi et comment',
          style: EdTypography.tag.copyWith(
            fontSize: 10,
            letterSpacing: 2,
            color: EdColors.cyan,
          ),
        ),
        children: <Widget>[
          Text(step.rationale, style: EdTypography.bodySmall),
          if (step.actions.isNotEmpty) ...<Widget>[
            const SizedBox(height: EdSpacing.md),
            EdSteps(
              steps: <EdStep>[
                for (final String action in step.actions)
                  EdStep(text: action),
              ],
            ),
          ],
          if (step.references.isNotEmpty) ...<Widget>[
            const SizedBox(height: EdSpacing.md),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: <Widget>[
                for (final RoadmapReference reference in step.references)
                  EdTag(
                    label: reference.label,
                    background: reference.isExternal
                        ? EdColors.tagCyanFill
                        : EdColors.tagGreenFill,
                    foreground: reference.isExternal
                        ? EdColors.cyanBright
                        : EdColors.greenBright,
                    tooltip: reference.url ?? 'Guide intégré',
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
