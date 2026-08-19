import 'package:flutter/material.dart';

import '../shapes/ed_notched_border.dart';
import '../tokens/ed_colors.dart';
import '../tokens/ed_spacing.dart';

/// The workhorse container: a bevelled panel with a hairline border.
///
/// Mirrors `.toc` and `table` from the guides — flat fill, 1 px `#1e2833`
/// border, top-right and bottom-left corners cut at 16 px.
class EdPanel extends StatelessWidget {
  const EdPanel({
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: EdSpacing.lg,
      vertical: EdSpacing.lg,
    ),
    this.background = EdColors.panel,
    this.borderColor = EdColors.border,
    this.accent,
    this.notch = EdNotch.panel,
    this.onTap,
    this.semanticLabel,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color background;
  final Color borderColor;

  /// When set, draws a 3 px coloured rule along the top edge — the `.verdict`
  /// treatment (`border-top: 3px solid #ff7100`).
  final Color? accent;

  final double notch;
  final VoidCallback? onTap;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final EdNotchedBorder shape = EdNotchedBorder(
      side: BorderSide(color: borderColor),
      notch: notch,
    );

    Widget content = Padding(padding: padding, child: child);

    if (accent != null) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(height: 3, color: accent),
          Flexible(child: content),
        ],
      );
    }

    final Widget panel = Material(
      color: background,
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: onTap == null
          ? content
          : InkWell(
              onTap: onTap,
              hoverColor: EdColors.orangeHover,
              child: content,
            ),
    );

    return semanticLabel == null
        ? panel
        : Semantics(label: semanticLabel, container: true, child: panel);
  }
}
