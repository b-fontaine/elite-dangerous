import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';

/// One line of a summary card: a label and a figure.
class SummaryFact {
  const SummaryFact(this.label, this.value, {this.tone});

  final String label;
  final String value;
  final Color? tone;
}

/// A tappable panel: what a detail page holds, in two or three figures.
///
/// The cockpit is meant to be readable on a phone in one screen, so it carries
/// only enough of each subject to say whether it is worth opening.
class SummaryCard extends StatelessWidget {
  const SummaryCard({
    required this.title,
    required this.icon,
    required this.facts,
    required this.onOpen,
    this.accent = EdColors.orange,
    this.note,
    super.key,
  });

  final String title;
  final IconData icon;
  final List<SummaryFact> facts;
  final VoidCallback? onOpen;
  final Color accent;

  /// Shown instead of the figures when there is nothing to show yet.
  final String? note;

  @override
  Widget build(BuildContext context) {
    return EdPanel(
      onTap: onOpen,
      accent: accent,
      semanticLabel: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon, size: 16, color: accent),
              const SizedBox(width: EdSpacing.xs),
              Expanded(
                child: Text(title, style: EdTypography.titleMedium),
              ),
              if (onOpen != null)
                const Icon(
                  Icons.chevron_right,
                  size: 18,
                  color: EdColors.textFaint,
                ),
            ],
          ),
          const SizedBox(height: EdSpacing.sm),
          if (note case final String message)
            Text(message, style: EdTypography.caption)
          else
            for (final SummaryFact fact in facts)
              Padding(
                padding: const EdgeInsets.only(bottom: EdSpacing.xxs),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(fact.label, style: EdTypography.caption),
                    ),
                    const SizedBox(width: EdSpacing.xs),
                    Text(
                      fact.value,
                      style: EdTypography.numeric.copyWith(
                        color: fact.tone ?? EdColors.gold,
                      ),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}

/// A label/value row, the shape most of the detail pages are made of.
class FactRow extends StatelessWidget {
  const FactRow({
    required this.label,
    required this.value,
    this.tone,
    this.hint,
    super.key,
  });

  final String label;
  final String value;
  final Color? tone;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: EdSpacing.xxs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(label, style: EdTypography.bodySmall),
                if (hint case final String detail)
                  Text(detail, style: EdTypography.caption),
              ],
            ),
          ),
          const SizedBox(width: EdSpacing.sm),
          Text(
            value,
            style: EdTypography.numeric.copyWith(color: tone ?? EdColors.gold),
          ),
        ],
      ),
    );
  }
}
