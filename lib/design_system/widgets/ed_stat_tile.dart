import 'package:flutter/material.dart';

import '../tokens/ed_colors.dart';
import '../tokens/ed_typography.dart';
import 'ed_panel.dart';

/// A HUD readout: tracked uppercase label above a large monospace value.
///
/// Modelled on the `caspian-guide.html` status strip
/// (Position / Solde / Rebuy / Explorer / Combat…).
class EdStatTile extends StatelessWidget {
  const EdStatTile({
    required this.label,
    required this.value,
    this.hint,
    this.icon,
    this.valueColor = EdColors.gold,
    this.onTap,
    super.key,
  });

  final String label;
  final String value;
  final String? hint;
  final IconData? icon;
  final Color valueColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return EdPanel(
      onTap: onTap,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      notch: 10,
      semanticLabel: '$label : $value',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              if (icon != null) ...<Widget>[
                Icon(icon, size: 13, color: EdColors.textFainter),
                const SizedBox(width: 6),
              ],
              Flexible(
                child: Text(
                  label.toUpperCase(),
                  style: EdTypography.tag.copyWith(
                    fontSize: 9.5,
                    letterSpacing: 2,
                    color: EdColors.textFainter,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: EdTypography.numericLarge.copyWith(color: valueColor),
            ),
          ),
          if (hint != null) ...<Widget>[
            const SizedBox(height: 4),
            Text(hint!, style: EdTypography.caption.copyWith(fontSize: 11)),
          ],
        ],
      ),
    );
  }
}
