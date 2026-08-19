import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import '../../domain/entities/exobiology_catalog.dart';
import '../../domain/entities/species_match.dart';
import 'credits_format.dart';

/// One candidate species on the surveyed body.
///
/// Shows *why* it matches, not just that it does: in the field the commander
/// needs to know which criterion is still unverified before committing to a
/// landing that costs several minutes of supercruise.
class SpeciesMatchCard extends StatelessWidget {
  const SpeciesMatchCard({
    required this.match,
    required this.catalog,
    super.key,
  });

  final SpeciesMatch match;
  final ExobiologyCatalog catalog;

  @override
  Widget build(BuildContext context) {
    final int? colonyRange = catalog.colonyRangeFor(match.species.id);
    final Color confidenceColor = switch (match.confidence) {
      MatchConfidence.probable => EdColors.greenBright,
      MatchConfidence.possible => EdColors.gold,
      MatchConfidence.excluded => EdColors.redBright,
    };

    return EdPanel(
      background:
          match.alreadySoldHere ? EdColors.panel : EdColors.panelRaised,
      padding: const EdgeInsets.fromLTRB(
        EdSpacing.md,
        EdSpacing.sm,
        EdSpacing.md,
        EdSpacing.sm,
      ),
      notch: EdNotch.tile,
      semanticLabel: '${match.species.name}, ${match.confidence.label}',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  match.species.name,
                  style: EdTypography.titleMedium.copyWith(
                    color: match.alreadySoldHere
                        ? EdColors.textFaint
                        : EdColors.textStrong,
                  ),
                ),
              ),
              const SizedBox(width: EdSpacing.xs),
              EdTag(
                label: match.confidence.label,
                background: EdColors.panelHeader,
                foreground: confidenceColor,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: <Widget>[
              Text(
                formatCredits(match.species.baseValueCr),
                style: EdTypography.numeric,
              ),
              const SizedBox(width: EdSpacing.sm),
              Text(
                '×5 : ${formatCredits(match.species.firstLoggedValueCr)}',
                style: EdTypography.caption,
              ),
              const Spacer(),
              if (colonyRange != null)
                Tooltip(
                  message: 'Distance minimale entre deux prélèvements',
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(
                        Icons.straighten,
                        size: 13,
                        color: EdColors.cyan,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$colonyRange m',
                        style: EdTypography.bodySmall
                            .copyWith(color: EdColors.cyanBright),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          if (match.alreadySoldHere) ...<Widget>[
            const SizedBox(height: EdSpacing.xs),
            EdCallout.text(
              tone: EdCalloutTone.warning,
              text: 'Déjà vendue depuis ce corps : le jeu refusera le '
                  'prélèvement. Une espèce, une planète, une fois.',
            ),
          ],
          if (match.criteria.isNotEmpty) ...<Widget>[
            const SizedBox(height: EdSpacing.xs),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: <Widget>[
                for (final MatchCriterion criterion in match.criteria)
                  _CriterionChip(criterion: criterion),
              ],
            ),
          ],
          if (match.species.conditions.notes case final String notes) ...<Widget>[
            const SizedBox(height: EdSpacing.xs),
            Text(notes, style: EdTypography.caption),
          ],
        ],
      ),
    );
  }
}

class _CriterionChip extends StatelessWidget {
  const _CriterionChip({required this.criterion});

  final MatchCriterion criterion;

  @override
  Widget build(BuildContext context) {
    final (IconData icon, Color colour) = switch (criterion.satisfied) {
      true => (Icons.check, EdColors.greenBright),
      false => (Icons.close, EdColors.redBright),
      null => (Icons.help_outline, EdColors.textFainter),
    };

    return Tooltip(
      message: criterion.isUnknown
          ? '${criterion.label} attendue : ${criterion.expected}. '
              'Non renseignée pour ce corps.'
          : '${criterion.label} : ${criterion.observed} '
              '(attendu ${criterion.expected})',
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: const BoxDecoration(color: EdColors.panelHeader),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 11, color: colour),
            const SizedBox(width: 4),
            Text(
              criterion.label,
              style: EdTypography.tag.copyWith(
                fontSize: 9.5,
                letterSpacing: 1.1,
                color: criterion.isUnknown
                    ? EdColors.textFainter
                    : EdColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
