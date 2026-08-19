import 'package:flutter/material.dart';

import '../shapes/ed_notched_border.dart';
import '../tokens/ed_colors.dart';
import '../tokens/ed_typography.dart';

/// Reliability of a piece of information, exactly as the source guides label
/// theirs: `OFF` (Frontier / official wiki), `COM` (community databases) and
/// `EST` (estimate or range).
enum EdSourceReliability {
  official('OFF', EdColors.tagGreenFill, EdColors.greenBright, 'Source officielle Frontier ou wiki'),
  community('COM', EdColors.tagCyanFill, EdColors.cyanBright, 'Base communautaire (INARA, EDSM, Canonn, Spansh)'),
  estimate('EST', EdColors.tagGoldFill, EdColors.gold, 'Estimation ou fourchette indicative');

  const EdSourceReliability(this.label, this.background, this.foreground, this.tooltip);

  final String label;
  final Color background;
  final Color foreground;
  final String tooltip;
}

/// The `.tag` chip: 9 px, bold, tracked, tiny solid rectangle.
class EdTag extends StatelessWidget {
  const EdTag({
    required this.label,
    this.background = EdColors.panelHeader,
    this.foreground = EdColors.textMuted,
    this.tooltip,
    super.key,
  });

  /// Convenience constructor for the OFF / COM / EST reliability chips.
  EdTag.reliability(EdSourceReliability reliability, {super.key})
      : label = reliability.label,
        background = reliability.background,
        foreground = reliability.foreground,
        tooltip = reliability.tooltip;

  final String label;
  final Color background;
  final Color foreground;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final Widget chip = Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: ShapeDecoration(
        color: background,
        shape: const EdNotchedBorder(notch: 3),
      ),
      child: Text(
        label.toUpperCase(),
        style: EdTypography.tag.copyWith(color: foreground),
      ),
    );
    return tooltip == null ? chip : Tooltip(message: tooltip!, child: chip);
  }
}
