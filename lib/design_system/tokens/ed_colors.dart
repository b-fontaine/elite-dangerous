import 'package:flutter/material.dart';

/// The palette, transcribed hex-for-hex from the source guides
/// (`guide-exploration-exobiologie.html`, `guide-artemis-suit.html`,
/// `caspian-guide.html`, `guide-outils.html`), which all share one identity:
/// a near-black cockpit background, Elite's signature orange, and a cyan /
/// green / gold / red semantic set for callouts and data tables.
abstract final class EdColors {
  // --- Backgrounds -------------------------------------------------------
  /// `html, body { background: #06080a }`
  static const Color space = Color(0xFF06080A);

  /// `.toc`, `table` — the standard panel fill.
  static const Color panel = Color(0xFF0A0E13);

  /// `.verdict` — a slightly lifted panel.
  static const Color panelRaised = Color(0xFF0C1116);

  /// `th` — table headers, chips, inset rows.
  static const Color panelHeader = Color(0xFF111820);

  // --- Borders -----------------------------------------------------------
  /// `border: 1px solid #1e2833` — the default hairline.
  static const Color border = Color(0xFF1E2833);

  /// `td { border-bottom: 1px solid #161e26 }` — quieter internal separators.
  static const Color borderSubtle = Color(0xFF161E26);

  /// `th { border-bottom: 1px solid #24303c }` — emphasised separators.
  static const Color borderStrong = Color(0xFF24303C);

  // --- Brand (orange) ----------------------------------------------------
  /// The primary accent: rules, left borders, step markers, glow.
  static const Color orange = Color(0xFFFF7100);

  /// Headings and links on the orange axis.
  static const Color orangeBright = Color(0xFFFF8C1A);

  /// Gradient companion for progress bars.
  static const Color amber = Color(0xFFFFB62E);

  /// `td.n` — numeric cells.
  static const Color gold = Color(0xFFFFC451);

  /// `.kicker` — the desaturated warm label above a title.
  static const Color kicker = Color(0xFF8A7050);

  // --- Semantic ----------------------------------------------------------
  /// `h4`, `th`, `.ci` — informational cyan.
  static const Color cyan = Color(0xFF5ECBF5);
  static const Color cyanBright = Color(0xFF7AD6F8);

  /// `.ct` — success / "do this" green.
  static const Color green = Color(0xFF3FCF6A);
  static const Color greenBright = Color(0xFF5ADE82);

  /// `.cw` — warning / danger red.
  static const Color red = Color(0xFFE5484D);
  static const Color redBright = Color(0xFFFF5F64);

  /// Guardian / Thargoid accents in the source guides.
  static const Color purple = Color(0xFFA06BD4);
  static const Color purpleBright = Color(0xFFBB8CE6);

  // --- Text --------------------------------------------------------------
  /// `body { color: #dce6f0 }`
  static const Color textBase = Color(0xFFDCE6F0);

  /// `p b, td b` — emphasised body text.
  static const Color textStrong = Color(0xFFE8EEF5);

  /// `p, td, li` — the default reading colour.
  static const Color textBody = Color(0xFFC3D0DD);

  /// `.intro`
  static const Color textIntro = Color(0xFFB7C6D6);

  /// `.dek`, `em`
  static const Color textMuted = Color(0xFF9FB2C6);

  /// `.pq cite`
  static const Color textDim = Color(0xFF8A9CB0);

  /// `footer`
  static const Color textFaint = Color(0xFF7D8FA3);

  /// `.byline`, `h2 .num`
  static const Color textFainter = Color(0xFF6D7F92);

  // --- Callout tints (background + border pairs) -------------------------
  /// `.cw { background: rgba(229,72,77,.07); border-color: #5c2427 }`
  static const Color warnFill = Color(0x12E5484D);
  static const Color warnBorder = Color(0xFF5C2427);

  /// `.ci { background: rgba(94,203,245,.06); border-color: #1d3d4d }`
  static const Color infoFill = Color(0x0F5ECBF5);
  static const Color infoBorder = Color(0xFF1D3D4D);

  /// `.ct { background: rgba(63,207,106,.07); border-color: #1f4d2f }`
  static const Color tipFill = Color(0x123FCF6A);
  static const Color tipBorder = Color(0xFF1F4D2F);

  /// `.t1 / .t2 / .t3` — reliability tags (OFF / COM / EST).
  static const Color tagGreenFill = Color(0xFF123322);
  static const Color tagCyanFill = Color(0xFF0F2C3A);
  static const Color tagGoldFill = Color(0xFF3A2D0F);
  static const Color tagOrangeFill = Color(0xFF5C3406);

  // --- Effects -----------------------------------------------------------
  /// `tr:hover td { background: rgba(255,113,0,.05) }`
  static const Color orangeHover = Color(0x0DFF7100);

  /// `h2 { background: linear-gradient(90deg, rgba(255,113,0,.11), transparent) }`
  static const Color orangeWash = Color(0x1CFF7100);

  /// The fixed scanline overlay: `rgba(255,113,0,.02)`.
  static const Color scanline = Color(0x05FF7100);

  /// The fixed top glow: `radial-gradient(… rgba(255,113,0,.09) …)`.
  static const Color topGlow = Color(0x17FF7100);

  /// `text-shadow: 0 0 30px rgba(255,113,0,.45)`
  static const Color orangeGlow = Color(0x73FF7100);
}
