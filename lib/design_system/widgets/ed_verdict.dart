import 'package:flutter/material.dart';

import '../tokens/ed_colors.dart';
import '../tokens/ed_typography.dart';
import 'ed_panel.dart';

/// The guides' `.verdict` card: a raised panel topped by a 3 px orange rule,
/// used to close a section with a decision.
class EdVerdict extends StatelessWidget {
  const EdVerdict({
    required this.title,
    required this.child,
    this.accent = EdColors.orange,
    super.key,
  });

  EdVerdict.text({
    required String title,
    required String text,
    Color accent = EdColors.orange,
    Key? key,
  }) : this(
          title: title,
          accent: accent,
          key: key,
          child: Text(text, style: EdTypography.bodySmall),
        );

  final String title;
  final Widget child;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return EdPanel(
      background: EdColors.panelRaised,
      accent: accent,
      padding: const EdgeInsets.fromLTRB(26, 22, 26, 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: EdTypography.tag.copyWith(
              fontSize: 11,
              letterSpacing: 2.5,
              color: accent == EdColors.orange ? EdColors.orangeBright : accent,
            ),
          ),
          const SizedBox(height: 10),
          DefaultTextStyle.merge(
            style: EdTypography.bodySmall.copyWith(fontSize: 14.5),
            child: child,
          ),
        ],
      ),
    );
  }
}
