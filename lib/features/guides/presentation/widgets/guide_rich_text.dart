import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';

/// Renders the light markup the authored guides use: `**bold**`.
///
/// A full Markdown renderer would be a lot of dependency for one construct, and
/// the guides deliberately carry structure as block *types* rather than as
/// inline syntax.
class GuideRichText extends StatelessWidget {
  const GuideRichText(
    this.text, {
    this.style,
    this.strongColor = EdColors.textStrong,
    this.textAlign,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final Color strongColor;
  final TextAlign? textAlign;

  static final RegExp _bold = RegExp(r'\*\*(.+?)\*\*', dotAll: true);

  /// Splits [text] into alternating plain and bold runs.
  static List<({String text, bool bold})> tokenize(String text) {
    final List<({String text, bool bold})> tokens =
        <({String text, bool bold})>[];
    int cursor = 0;
    for (final RegExpMatch match in _bold.allMatches(text)) {
      if (match.start > cursor) {
        tokens.add((text: text.substring(cursor, match.start), bold: false));
      }
      tokens.add((text: match.group(1)!, bold: true));
      cursor = match.end;
    }
    if (cursor < text.length) {
      tokens.add((text: text.substring(cursor), bold: false));
    }
    return tokens;
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle base = style ?? EdTypography.body;
    final List<({String text, bool bold})> tokens = tokenize(text);

    if (tokens.length == 1 && !tokens.first.bold) {
      return Text(text, style: base, textAlign: textAlign);
    }

    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          for (final ({String text, bool bold}) token in tokens)
            TextSpan(
              text: token.text,
              style: token.bold
                  ? base.copyWith(
                      color: strongColor,
                      fontWeight: FontWeight.w600,
                    )
                  : null,
            ),
        ],
      ),
      style: base,
      textAlign: textAlign,
    );
  }
}
