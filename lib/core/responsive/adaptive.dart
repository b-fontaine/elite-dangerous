import 'package:flutter/widgets.dart';

import 'window_size.dart';

/// Rebuilds against the *incoming constraints* rather than the screen, so the
/// same widget adapts correctly inside a detail pane of a desktop split view.
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({required this.builder, super.key});

  final Widget Function(BuildContext context, WindowSizeClass size) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.hasBoundedWidth
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        return builder(context, Breakpoints.classify(width));
      },
    );
  }
}

/// Picks one of four widgets according to the available width.
///
/// [medium], [expanded] and [large] fall back to the next smaller one that was
/// provided, so a caller only has to describe the breakpoints it cares about.
class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    required this.compact,
    this.medium,
    this.expanded,
    this.large,
    super.key,
  });

  final WidgetBuilder compact;
  final WidgetBuilder? medium;
  final WidgetBuilder? expanded;
  final WidgetBuilder? large;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, WindowSizeClass size) {
        final WidgetBuilder builder = switch (size) {
          WindowSizeClass.large => large ?? expanded ?? medium ?? compact,
          WindowSizeClass.expanded => expanded ?? medium ?? compact,
          WindowSizeClass.medium => medium ?? compact,
          WindowSizeClass.compact => compact,
        };
        return builder(context);
      },
    );
  }
}

/// Centres and caps its child's width, the desktop counterpart of the guides'
/// `.wrap { max-width: 900px; margin: 0 auto }`.
class ReadableWidth extends StatelessWidget {
  const ReadableWidth({
    required this.child,
    this.maxWidth = Breakpoints.readableColumn,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    super.key,
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth + 40),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

/// Lays children out in a responsive grid whose column count is derived from
/// the minimum tile width instead of a hard-coded count.
class AdaptiveGrid extends StatelessWidget {
  const AdaptiveGrid({
    required this.children,
    this.minTileWidth = 280,
    this.spacing = 12,
    this.runSpacing = 12,
    super.key,
  });

  final List<Widget> children;
  final double minTileWidth;
  final double spacing;
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.hasBoundedWidth
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        final int columns = (width / minTileWidth).floor().clamp(1, 6);
        final double tileWidth =
            (width - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: runSpacing,
          children: <Widget>[
            for (final Widget child in children)
              SizedBox(width: tileWidth, child: child),
          ],
        );
      },
    );
  }
}
