import 'package:flutter/material.dart';

import '../tokens/ed_colors.dart';

/// Reproduces the two fixed overlays every source guide paints over the page:
///
/// ```css
/// .page:before { background: repeating-linear-gradient(0deg,
///     rgba(255,113,0,.02) 0 1px, transparent 1px 3px) }
/// .page:after  { background: radial-gradient(ellipse at 50% 0%,
///     rgba(255,113,0,.09), transparent 60%) }
/// ```
///
/// Both are non-interactive and sit above the content, which is what gives the
/// UI its CRT-cockpit feel.
class EdScanlineOverlay extends StatelessWidget {
  const EdScanlineOverlay({
    required this.child,
    this.scanlines = true,
    this.topGlow = true,
    super.key,
  });

  final Widget child;
  final bool scanlines;
  final bool topGlow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        child,
        if (topGlow)
          const IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0, -1.35),
                  radius: 1.1,
                  colors: <Color>[EdColors.topGlow, Colors.transparent],
                  stops: <double>[0, 0.6],
                ),
              ),
              child: SizedBox.expand(),
            ),
          ),
        if (scanlines)
          const IgnorePointer(
            child: CustomPaint(painter: _ScanlinePainter(), child: SizedBox.expand()),
          ),
      ],
    );
  }
}

class _ScanlinePainter extends CustomPainter {
  const _ScanlinePainter();

  static const double _period = 3;
  static const double _lineHeight = 1;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = EdColors.scanline;
    for (double y = 0; y < size.height; y += _period) {
      canvas.drawRect(Rect.fromLTWH(0, y, size.width, _lineHeight), paint);
    }
  }

  @override
  bool shouldRepaint(_ScanlinePainter oldDelegate) => false;
}
