/// Spacing scale, distilled from the source guides' rhythm
/// (17 px paragraph gaps, 24–26 px callout padding, 42–64 px section gaps).
abstract final class EdSpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 22;
  static const double xl = 30;
  static const double xxl = 44;
  static const double xxxl = 64;

  /// Vertical gap between two paragraphs (`p { margin: 0 0 17px }`).
  static const double paragraph = 17;

  /// Vertical gap before a numbered section heading (`h2 { margin-top: 64px }`).
  static const double section = 56;
}

/// Corner-notch sizes for the bevelled panels (`clip-path: polygon(...)`).
abstract final class EdNotch {
  /// `.toc` — 16 px.
  static const double panel = 16;

  /// `.cw / .ci / .ct` — 13 px.
  static const double callout = 13;

  /// `.steps li:before` — 5 px.
  static const double chip = 5;

  static const double tile = 10;
}
