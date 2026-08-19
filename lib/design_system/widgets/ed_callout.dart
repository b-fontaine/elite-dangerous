import 'package:flutter/material.dart';

import '../shapes/ed_notched_border.dart';
import '../tokens/ed_colors.dart';
import '../tokens/ed_spacing.dart';
import '../tokens/ed_typography.dart';

/// The three callout flavours used throughout the source guides:
/// `.cw` (red, "the trap"), `.ci` (cyan, "good to know") and `.ct` (green,
/// "do this").
enum EdCalloutTone {
  warning(
    EdColors.warnFill,
    EdColors.warnBorder,
    EdColors.red,
    EdColors.redBright,
    Icons.warning_amber_rounded,
  ),
  info(
    EdColors.infoFill,
    EdColors.infoBorder,
    EdColors.cyan,
    EdColors.cyanBright,
    Icons.info_outline_rounded,
  ),
  tip(
    EdColors.tipFill,
    EdColors.tipBorder,
    EdColors.green,
    EdColors.greenBright,
    Icons.check_circle_outline_rounded,
  );

  const EdCalloutTone(this.fill, this.border, this.accent, this.title, this.icon);

  final Color fill;
  final Color border;
  final Color accent;
  final Color title;
  final IconData icon;
}

/// A bevelled tinted box with a thick coloured left rule and a tracked
/// uppercase title — the guides' `.cw / .ci / .ct` blocks.
class EdCallout extends StatelessWidget {
  const EdCallout({
    required this.tone,
    required this.child,
    this.title,
    this.showIcon = true,
    super.key,
  });

  const EdCallout.warning({required Widget child, String? title, Key? key})
      : this(tone: EdCalloutTone.warning, title: title, key: key, child: child);

  const EdCallout.info({required Widget child, String? title, Key? key})
      : this(tone: EdCalloutTone.info, title: title, key: key, child: child);

  const EdCallout.tip({required Widget child, String? title, Key? key})
      : this(tone: EdCalloutTone.tip, title: title, key: key, child: child);

  /// Convenience for plain-text callouts.
  EdCallout.text({
    required EdCalloutTone tone,
    required String text,
    String? title,
    Key? key,
  }) : this(
          tone: tone,
          title: title,
          key: key,
          child: Text(text, style: EdTypography.bodySmall),
        );

  final EdCalloutTone tone;
  final String? title;
  final Widget child;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: tone.fill,
        shape: EdNotchedBorder(
          side: BorderSide(color: tone.border),
          notch: EdNotch.callout,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: tone.accent, width: 3)),
        ),
        padding: const EdgeInsets.fromLTRB(19, 18, 22, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (title != null) ...<Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (showIcon) ...<Widget>[
                    Icon(tone.icon, size: 14, color: tone.title),
                    const SizedBox(width: 7),
                  ],
                  Flexible(
                    child: Text(
                      title!.toUpperCase(),
                      style: EdTypography.tag.copyWith(
                        fontSize: 10,
                        letterSpacing: 2.4,
                        color: tone.title,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 9),
            ],
            DefaultTextStyle.merge(
              style: EdTypography.bodySmall.copyWith(height: 1.65),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
