import 'package:flutter/material.dart';

import 'ed_colors.dart';

/// Type scale transcribed from the guides.
///
/// The guides use `"Segoe UI", Roboto, system-ui, sans-serif`; we keep the same
/// intent by leaning on the platform UI font and only pin the *metrics*
/// (size, weight, letter-spacing, line-height), which are what actually carry
/// the identity — heavily tracked uppercase labels over a tight body text.
abstract final class EdTypography {
  static const List<String> sansFallback = <String>[
    'Segoe UI',
    'Roboto',
    'SF Pro Text',
    'Ubuntu',
    'Cantarell',
    'Noto Sans',
  ];

  static const List<String> monoFallback = <String>[
    'SF Mono',
    'Consolas',
    'DejaVu Sans Mono',
    'Roboto Mono',
    'Menlo',
    'monospace',
  ];

  /// `h1` — 40 px, uppercase, orange, glowing.
  static const TextStyle displayLarge = TextStyle(
    fontSize: 34,
    height: 1.15,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
    color: EdColors.orangeBright,
    fontFamilyFallback: sansFallback,
    shadows: <Shadow>[
      Shadow(color: EdColors.orangeGlow, blurRadius: 24),
    ],
  );

  /// `h3` — 20 px, near-white.
  static const TextStyle titleLarge = TextStyle(
    fontSize: 20,
    height: 1.3,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: EdColors.textStrong,
    fontFamilyFallback: sansFallback,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    height: 1.35,
    fontWeight: FontWeight.w600,
    color: EdColors.textStrong,
    fontFamilyFallback: sansFallback,
  );

  /// `h2` — 15 px, uppercase, tracked +3, orange.
  static const TextStyle sectionHeading = TextStyle(
    fontSize: 14,
    height: 1.3,
    fontWeight: FontWeight.w700,
    letterSpacing: 3,
    color: EdColors.orangeBright,
    fontFamilyFallback: sansFallback,
  );

  /// `h4` — 12 px, uppercase, tracked +2.2, cyan.
  static const TextStyle subHeading = TextStyle(
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.2,
    color: EdColors.cyan,
    fontFamilyFallback: sansFallback,
  );

  /// `.kicker` — 10 px, tracked +5, warm grey.
  static const TextStyle kicker = TextStyle(
    fontSize: 10,
    height: 1.4,
    fontWeight: FontWeight.w600,
    letterSpacing: 5,
    color: EdColors.kicker,
    fontFamilyFallback: sansFallback,
  );

  /// `.byline` — 11 px, tracked +2.5.
  static const TextStyle overline = TextStyle(
    fontSize: 11,
    height: 1.4,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.5,
    color: EdColors.textFainter,
    fontFamilyFallback: sansFallback,
  );

  /// `body` — 16 px / 1.72.
  static const TextStyle body = TextStyle(
    fontSize: 15.5,
    height: 1.72,
    color: EdColors.textBody,
    fontFamilyFallback: sansFallback,
  );

  /// `.intro` — 18 px, lighter.
  static const TextStyle intro = TextStyle(
    fontSize: 17,
    height: 1.65,
    color: EdColors.textIntro,
    fontFamilyFallback: sansFallback,
  );

  /// `table` — 13.5 px.
  static const TextStyle bodySmall = TextStyle(
    fontSize: 13.5,
    height: 1.5,
    color: EdColors.textBody,
    fontFamilyFallback: sansFallback,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    height: 1.5,
    color: EdColors.textFaint,
    fontFamilyFallback: sansFallback,
  );

  /// `th` — 10 px, uppercase, tracked +1.6, cyan.
  static const TextStyle tableHeader = TextStyle(
    fontSize: 10,
    height: 1.4,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.6,
    color: EdColors.cyan,
    fontFamilyFallback: sansFallback,
  );

  /// `td.n` — monospace gold numerics.
  static const TextStyle numeric = TextStyle(
    fontSize: 13.5,
    height: 1.4,
    color: EdColors.gold,
    fontFamilyFallback: monoFallback,
    fontFeatures: <FontFeature>[FontFeature.tabularFigures()],
  );

  /// Large monospace readouts (credits, distances) on dashboard tiles.
  static const TextStyle numericLarge = TextStyle(
    fontSize: 24,
    height: 1.1,
    fontWeight: FontWeight.w600,
    color: EdColors.gold,
    fontFamilyFallback: monoFallback,
    fontFeatures: <FontFeature>[FontFeature.tabularFigures()],
  );

  /// `.tag` — 9 px, tracked +1.2, bold.
  static const TextStyle tag = TextStyle(
    fontSize: 9,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
    fontFamilyFallback: sansFallback,
  );

  /// `.pq` — 19 px pull quote.
  static const TextStyle pullQuote = TextStyle(
    fontSize: 18,
    height: 1.55,
    fontWeight: FontWeight.w500,
    color: EdColors.textStrong,
    fontFamilyFallback: sansFallback,
  );
}
