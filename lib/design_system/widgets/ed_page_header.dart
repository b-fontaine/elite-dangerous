import 'package:flutter/material.dart';

import '../tokens/ed_colors.dart';
import '../tokens/ed_spacing.dart';
import '../tokens/ed_typography.dart';

/// The guides' `.hero`: a warm vertical gradient closed by an orange rule,
/// carrying a tracked kicker, a glowing uppercase title, a deck and a byline.
class EdPageHeader extends StatelessWidget {
  const EdPageHeader({
    required this.title,
    this.kicker,
    this.deck,
    this.byline,
    this.actions = const <Widget>[],
    this.centered = false,
    super.key,
  });

  final String title;
  final String? kicker;
  final String? deck;
  final String? byline;
  final List<Widget> actions;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    final CrossAxisAlignment cross =
        centered ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final TextAlign align = centered ? TextAlign.center : TextAlign.start;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Color(0xFF1A0F02), EdColors.space],
        ),
        border: Border(bottom: BorderSide(color: EdColors.orange)),
      ),
      padding: const EdgeInsets.fromLTRB(
        EdSpacing.lg,
        EdSpacing.xl,
        EdSpacing.lg,
        EdSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: cross,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (kicker != null) ...<Widget>[
            Text(kicker!.toUpperCase(), style: EdTypography.kicker, textAlign: align),
            const SizedBox(height: 14),
          ],
          Semantics(
            header: true,
            child: Text(
              title.toUpperCase(),
              style: EdTypography.displayLarge,
              textAlign: align,
            ),
          ),
          if (deck != null) ...<Widget>[
            const SizedBox(height: EdSpacing.sm),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Text(
                deck!,
                style: EdTypography.body.copyWith(color: EdColors.textMuted),
                textAlign: align,
              ),
            ),
          ],
          if (byline != null) ...<Widget>[
            const SizedBox(height: EdSpacing.lg),
            Text(byline!.toUpperCase(), style: EdTypography.overline, textAlign: align),
          ],
          if (actions.isNotEmpty) ...<Widget>[
            const SizedBox(height: EdSpacing.lg),
            Wrap(
              spacing: EdSpacing.sm,
              runSpacing: EdSpacing.xs,
              alignment: centered ? WrapAlignment.center : WrapAlignment.start,
              children: actions,
            ),
          ],
        ],
      ),
    );
  }
}
