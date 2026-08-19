import 'package:flutter/material.dart';

import '../tokens/ed_colors.dart';
import '../tokens/ed_spacing.dart';
import '../tokens/ed_typography.dart';

/// The guides' `h2`: an uppercase tracked orange label sitting behind a
/// horizontal orange wash, with a 3 px orange rule on its left edge and an
/// optional zero-padded section number in monospace.
class EdSectionHeader extends StatelessWidget {
  const EdSectionHeader({
    required this.title,
    this.number,
    this.trailing,
    this.accent = EdColors.orange,
    this.wash = EdColors.orangeWash,
    this.labelColor = EdColors.orangeBright,
    super.key,
  });

  final String title;
  final int? number;
  final Widget? trailing;
  final Color accent;
  final Color wash;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: accent, width: 3)),
          gradient: LinearGradient(
            colors: <Color>[wash, Colors.transparent],
            stops: const <double>[0, 0.6],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(EdSpacing.md, 12, EdSpacing.sm, 12),
        child: Row(
          children: <Widget>[
            if (number != null) ...<Widget>[
              Text(
                number!.toString().padLeft(2, '0'),
                style: EdTypography.numeric.copyWith(
                  color: EdColors.textFainter,
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Text(
                title.toUpperCase(),
                style: EdTypography.sectionHeading.copyWith(color: labelColor),
              ),
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }
}

/// The guides' `h4`: a small cyan uppercase label used inside a section.
class EdSubHeader extends StatelessWidget {
  const EdSubHeader(this.title, {this.color = EdColors.cyan, super.key});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Text(
        title.toUpperCase(),
        style: EdTypography.subHeading.copyWith(color: color),
      ),
    );
  }
}
