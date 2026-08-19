import 'package:flutter/material.dart';

import '../tokens/ed_colors.dart';
import '../tokens/ed_typography.dart';

/// A flat progress rule with the guides' orange→amber gradient and glow
/// (`.rp { background: linear-gradient(90deg,#ff7100,#ffb62e) }`).
class EdProgressBar extends StatelessWidget {
  const EdProgressBar({
    required this.progress,
    this.label,
    this.trailingLabel,
    this.height = 6,
    this.gradient = const <Color>[EdColors.orange, EdColors.amber],
    super.key,
  });

  /// 0.0 → 1.0. Values outside the range are clamped.
  final double progress;
  final String? label;
  final String? trailingLabel;
  final double height;
  final List<Color> gradient;

  @override
  Widget build(BuildContext context) {
    final double value = progress.clamp(0.0, 1.0);
    return Semantics(
      value: '${(value * 100).round()} %',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (label != null || trailingLabel != null) ...<Widget>[
            Row(
              children: <Widget>[
                if (label != null)
                  Expanded(
                    child: Text(
                      label!.toUpperCase(),
                      style: EdTypography.tag.copyWith(
                        fontSize: 9.5,
                        letterSpacing: 2,
                        color: EdColors.textFainter,
                      ),
                    ),
                  ),
                if (trailingLabel != null)
                  Text(
                    trailingLabel!,
                    style: EdTypography.numeric.copyWith(fontSize: 12),
                  ),
              ],
            ),
            const SizedBox(height: 7),
          ],
          ClipRect(
            child: Stack(
              children: <Widget>[
                Container(height: height, color: EdColors.panelHeader),
                FractionallySizedBox(
                  widthFactor: value,
                  child: Container(
                    height: height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: gradient),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: gradient.first.withValues(alpha: 0.55),
                          blurRadius: 10,
                        ),
                      ],
                    ),
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
