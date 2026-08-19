import 'package:flutter/widgets.dart';

/// Material 3 window size classes, the single vocabulary the whole UI uses to
/// decide between phone, tablet and desktop layouts.
enum WindowSizeClass {
  /// Phones in portrait. Bottom navigation, single pane, full-bleed cards.
  compact,

  /// Large phones in landscape and small tablets. Collapsed navigation rail.
  medium,

  /// Tablets and small desktop windows. Extended rail, two panes.
  expanded,

  /// Desktop. Extended rail plus a persistent detail pane.
  large;

  bool get isCompact => this == WindowSizeClass.compact;

  bool get isMedium => this == WindowSizeClass.medium;

  bool get isExpanded => this == WindowSizeClass.expanded;

  bool get isLarge => this == WindowSizeClass.large;

  /// True when the layout can afford a side navigation rail.
  bool get usesRail => index >= WindowSizeClass.medium.index;

  /// True when the rail should show labels next to the icons.
  bool get usesExtendedRail => index >= WindowSizeClass.expanded.index;

  /// True when a list/detail split view fits on screen.
  bool get usesTwoPanes => index >= WindowSizeClass.expanded.index;
}

/// Width thresholds, in logical pixels.
abstract final class Breakpoints {
  static const double medium = 600;
  static const double expanded = 900;
  static const double large = 1280;

  /// Widest a text column is allowed to get, so long-form guides stay readable
  /// on a 4K monitor (the source guides cap their `.wrap` at 900 px).
  static const double readableColumn = 860;

  /// Widest a content pane is allowed to get before it starts centring.
  static const double contentColumn = 1180;

  static WindowSizeClass classify(double width) {
    if (width >= large) {
      return WindowSizeClass.large;
    }
    if (width >= expanded) {
      return WindowSizeClass.expanded;
    }
    if (width >= medium) {
      return WindowSizeClass.medium;
    }
    return WindowSizeClass.compact;
  }
}

extension WindowSizeContext on BuildContext {
  /// Window size class derived from the *view* width, not the widget width.
  WindowSizeClass get windowSize =>
      Breakpoints.classify(MediaQuery.sizeOf(this).width);

  bool get isCompact => windowSize.isCompact;

  bool get isDesktopClass => windowSize.index >= WindowSizeClass.expanded.index;
}
