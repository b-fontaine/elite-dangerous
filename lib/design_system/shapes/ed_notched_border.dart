import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../tokens/ed_spacing.dart';

/// Which corners get sliced off.
enum EdCorner { topLeft, topRight, bottomRight, bottomLeft }

/// The signature Elite panel outline.
///
/// Reproduces the guides' `clip-path: polygon(0 0, calc(100% - 16px) 0,
/// 100% 16px, 100% 100%, 16px 100%, 0 calc(100% - 16px))` — a rectangle with
/// the top-right and bottom-left corners cut at 45°, which reads as a HUD
/// element rather than a rounded Material card.
class EdNotchedBorder extends OutlinedBorder {
  const EdNotchedBorder({
    super.side = BorderSide.none,
    this.notch = EdNotch.panel,
    this.corners = const <EdCorner>{EdCorner.topRight, EdCorner.bottomLeft},
  });

  final double notch;
  final Set<EdCorner> corners;

  Path _build(Rect rect, double notchSize) {
    final double n = notchSize.clamp(0, rect.shortestSide / 2);
    final bool tl = corners.contains(EdCorner.topLeft);
    final bool tr = corners.contains(EdCorner.topRight);
    final bool br = corners.contains(EdCorner.bottomRight);
    final bool bl = corners.contains(EdCorner.bottomLeft);

    final Path path = Path()..moveTo(rect.left + (tl ? n : 0), rect.top);
    path.lineTo(rect.right - (tr ? n : 0), rect.top);
    if (tr) {
      path.lineTo(rect.right, rect.top + n);
    }
    path.lineTo(rect.right, rect.bottom - (br ? n : 0));
    if (br) {
      path.lineTo(rect.right - n, rect.bottom);
    }
    path.lineTo(rect.left + (bl ? n : 0), rect.bottom);
    if (bl) {
      path.lineTo(rect.left, rect.bottom - n);
    }
    path.lineTo(rect.left, rect.top + (tl ? n : 0));
    if (tl) {
      path.lineTo(rect.left + n, rect.top);
    }
    return path..close();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      _build(rect, notch);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      _build(rect.deflate(side.strokeInset), notch - side.strokeInset);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (side.style == BorderStyle.none || side.width == 0) {
      return;
    }
    final double inset = side.strokeOffset / 2;
    canvas.drawPath(
      _build(rect.deflate(-inset), notch + inset),
      side.toPaint(),
    );
  }

  @override
  EdNotchedBorder copyWith({
    BorderSide? side,
    double? notch,
    Set<EdCorner>? corners,
  }) {
    return EdNotchedBorder(
      side: side ?? this.side,
      notch: notch ?? this.notch,
      corners: corners ?? this.corners,
    );
  }

  @override
  ShapeBorder scale(double t) =>
      EdNotchedBorder(side: side.scale(t), notch: notch * t, corners: corners);

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is EdNotchedBorder && a.corners.length == corners.length) {
      return EdNotchedBorder(
        side: BorderSide.lerp(a.side, side, t),
        notch: lerpDouble(a.notch, notch, t),
        corners: corners,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is EdNotchedBorder && b.corners.length == corners.length) {
      return EdNotchedBorder(
        side: BorderSide.lerp(side, b.side, t),
        notch: lerpDouble(notch, b.notch, t),
        corners: corners,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  bool operator ==(Object other) =>
      other is EdNotchedBorder &&
      other.side == side &&
      other.notch == notch &&
      setEquals(other.corners, corners);

  @override
  int get hashCode => Object.hash(side, notch, Object.hashAllUnordered(corners));

  static double lerpDouble(double a, double b, double t) => a + (b - a) * t;
}

/// Clips a child to the same silhouette, for images or gradients that must not
/// bleed past a notched panel.
class EdNotchedClipper extends CustomClipper<Path> {
  const EdNotchedClipper({
    this.notch = EdNotch.panel,
    this.corners = const <EdCorner>{EdCorner.topRight, EdCorner.bottomLeft},
  });

  final double notch;
  final Set<EdCorner> corners;

  @override
  Path getClip(Size size) => EdNotchedBorder(notch: notch, corners: corners)
      .getOuterPath(Offset.zero & size);

  @override
  bool shouldReclip(EdNotchedClipper oldClipper) =>
      oldClipper.notch != notch || !setEquals(oldClipper.corners, corners);
}
