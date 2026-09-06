import 'package:flutter/material.dart';

import '../../../../core/format/credits.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../design_system/design_system.dart';
import '../../domain/entities/route_plan.dart';
import '../../domain/entities/route_progress.dart';
import '../../domain/entities/session_pace.dart';

/// A duration as a commander reads one: `1 h 05`, `12 min`.
String formatDuration(Duration duration) {
  if (duration <= Duration.zero) {
    return '—';
  }
  final int hours = duration.inHours;
  final int minutes = duration.inMinutes.remainder(60);
  if (hours == 0) {
    return '$minutes min';
  }
  return '$hours h ${minutes.toString().padLeft(2, '0')}';
}

/// The jump bar: one mark per jump, filled up to where the commander is.
class RouteJumpBar extends StatelessWidget {
  const RouteJumpBar({required this.done, required this.total, super.key});

  final int done;
  final int total;

  @override
  Widget build(BuildContext context) {
    if (total <= 0) {
      return const SizedBox.shrink();
    }
    // Beyond a few dozen jumps the marks stop being countable and a bar reads
    // better; below that, a commander can see "three to go" at a glance.
    if (total > 40) {
      return EdProgressBar(
        progress: done / total,
        label: 'Sauts',
        trailingLabel: '$done / $total',
      );
    }
    return Semantics(
      label: 'Sauts : $done effectués sur $total',
      child: Wrap(
        spacing: 3,
        runSpacing: 3,
        children: <Widget>[
          for (int i = 0; i < total; i++)
            Container(
              width: 16,
              height: 7,
              color: i < done
                  ? (i == done - 1 ? EdColors.gold : EdColors.orange)
                  : EdColors.border,
            ),
        ],
      ),
    );
  }
}

/// One species line of a body being worked.
class RouteSpeciesRow extends StatelessWidget {
  const RouteSpeciesRow({required this.species, super.key});

  final SpeciesProgress species;

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;
    final bool done = species.isComplete;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Text(
              species.species.species,
              style: text.bodyMedium?.copyWith(
                color: done ? EdColors.textMuted : EdColors.textBody,
                decoration: done ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${species.samplesTaken}/3',
            style: text.labelSmall?.copyWith(
              color: done ? EdColors.green : EdColors.textMuted,
              fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 92,
            child: Text(
              formatCredits(species.species.valueCr),
              textAlign: TextAlign.right,
              style: text.labelSmall?.copyWith(
                color: done ? EdColors.textMuted : EdColors.gold,
                fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// One stop of the route, with what is left to do on it.
class RouteWaypointCard extends StatelessWidget {
  const RouteWaypointCard({
    required this.waypoint,
    required this.isCurrent,
    super.key,
  });

  final WaypointProgress waypoint;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;

    return EdPanel(
      accent: isCurrent ? EdColors.orange : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  waypoint.waypoint.name,
                  style: text.titleMedium?.copyWith(
                    color: isCurrent ? EdColors.orangeBright : EdColors.textBase,
                  ),
                ),
              ),
              if (waypoint.visited)
                const EdTag(label: 'Visité', foreground: EdColors.green),
              if (isCurrent) ...<Widget>[
                const SizedBox(width: 6),
                const EdTag(label: 'Ici', foreground: EdColors.orange),
              ],
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '+${waypoint.waypoint.jumpsFromPrevious} saut(s) · '
            '${waypoint.bodies.length} corps · '
            '${formatCredits(waypoint.remainingValueCr)} restants',
            style: text.labelSmall?.copyWith(color: EdColors.textMuted),
          ),
          for (final BodyProgress body in waypoint.bodies) ...<Widget>[
            const SizedBox(height: 10),
            _BodyBlock(body: body),
          ],
        ],
      ),
    );
  }
}

class _BodyBlock extends StatelessWidget {
  const _BodyBlock({required this.body});

  final BodyProgress body;

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;
    final bool ambiguous = body.species.any(
      (SpeciesProgress s) => s.attribution == SpeciesAttribution.sharedGenus,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                body.body.name,
                style: text.titleSmall?.copyWith(
                  color: body.isComplete ? EdColors.textMuted : EdColors.cyan,
                ),
              ),
            ),
            if (body.body.distanceFromArrivalLs case final double ls)
              Text(
                '${ls.round()} Ls',
                style: text.labelSmall?.copyWith(color: EdColors.textMuted),
              ),
          ],
        ),
        for (final SpeciesProgress species in body.species)
          RouteSpeciesRow(species: species),
        if (ambiguous)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              // Said rather than hidden: the journal names organisms by a token
              // this app cannot translate to a species, so a genus shared by two
              // species on one body cannot be attributed. Presenting a guess as
              // fact here would erase work that has not been done.
              'Deux espèces du même genre ici : le compte porte sur le genre, '
              'pas sur l\'espèce.',
              style: text.labelSmall?.copyWith(color: EdColors.gold),
            ),
          ),
      ],
    );
  }
}

/// The six figures the follow screen leads with.
class RouteHeadline extends StatelessWidget {
  const RouteHeadline({
    required this.progress,
    required this.pace,
    this.remaining,
    super.key,
  });

  final RouteProgress progress;
  final SessionPace pace;
  final RouteEstimate? remaining;

  @override
  Widget build(BuildContext context) {
    final RoutePlan plan = progress.plan;

    return AdaptiveGrid(
      children: <Widget>[
        EdStatTile(
          label: 'Sauts',
          value: '${progress.jumpsDone} / ${plan.totalJumps}',
          hint: '${progress.jumpsRemaining} restants',
        ),
        EdStatTile(
          label: 'Espèces analysées',
          value: '${progress.speciesAnalysed} / ${progress.speciesTotal}',
          hint: progress.ambiguousSpecies > 0
              ? '${progress.ambiguousSpecies} à genre partagé'
              : null,
        ),
        EdStatTile(
          label: 'En soute, non vendu',
          value: formatCredits(progress.valueAtRiskCr),
          hint: 'Perdu en cas de destruction',
          valueColor:
              progress.valueAtRiskCr > 0 ? EdColors.red : EdColors.textBase,
        ),
        EdStatTile(
          label: 'Reste sur la route',
          value: formatCredits(progress.remainingValueCr),
          hint: 'Valeur de base, hors bonus',
        ),
        if (remaining case final RouteEstimate estimate)
          EdStatTile(
            label: 'Temps restant estimé',
            value: formatDuration(estimate.total),
            hint: pace.label,
          ),
      ],
    );
  }
}

extension on SessionPace {
  /// What the estimate rests on, said next to it rather than implied.
  String get label => switch (source) {
        PaceSource.measured =>
          'Mesuré sur $landingObservations atterrissages',
        PaceSource.partial => 'Partiellement mesuré',
        PaceSource.defaults => 'Estimation par défaut',
      };
}
