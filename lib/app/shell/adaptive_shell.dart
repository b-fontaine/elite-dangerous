import 'package:flutter/material.dart';

import '../../core/responsive/adaptive.dart';
import '../../core/responsive/window_size.dart';
import '../../design_system/design_system.dart';
import '../router/app_routes.dart';

/// The navigation chrome, which changes shape with the window.
///
/// Phone gets a bottom bar, tablet a collapsed rail, desktop an extended rail
/// with a wordmark. Material's own guidance, applied to the Elite palette:
/// nothing here is decorative, it is the same destinations reached three ways.
class AdaptiveShell extends StatelessWidget {
  const AdaptiveShell({
    required this.destinations,
    required this.selectedIndex,
    required this.onSelect,
    required this.child,
    super.key,
  });

  final List<AppDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, WindowSizeClass size) {
        final Widget body = EdScanlineOverlay(
          child: SafeArea(top: false, child: child),
        );

        if (!size.usesRail) {
          return Scaffold(
            body: body,
            bottomNavigationBar: NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: onSelect,
              destinations: <Widget>[
                for (final AppDestination destination in destinations)
                  NavigationDestination(
                    icon: Icon(destination.icon),
                    selectedIcon: Icon(destination.selectedIcon),
                    label: destination.shortLabel,
                    tooltip: destination.label,
                  ),
              ],
            ),
          );
        }

        final bool extended = size.usesExtendedRail;
        return Scaffold(
          body: Row(
            children: <Widget>[
              NavigationRail(
                extended: extended,
                minExtendedWidth: 210,
                selectedIndex: selectedIndex,
                onDestinationSelected: onSelect,
                labelType: extended
                    ? NavigationRailLabelType.none
                    : NavigationRailLabelType.selected,
                leading: _RailHeader(extended: extended),
                destinations: <NavigationRailDestination>[
                  for (final AppDestination destination in destinations)
                    NavigationRailDestination(
                      icon: Icon(destination.icon),
                      selectedIcon: Icon(destination.selectedIcon),
                      label: Text(destination.label),
                    ),
                ],
              ),
              const VerticalDivider(width: 1),
              Expanded(child: body),
            ],
          ),
        );
      },
    );
  }
}

class _RailHeader extends StatelessWidget {
  const _RailHeader({required this.extended});

  final bool extended;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(extended ? 16 : 0, 26, 0, 30),
      child: extended
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Codex'.toUpperCase(), style: EdTypography.kicker),
                const SizedBox(height: 6),
                Text(
                  'Exobiologique',
                  style: EdTypography.sectionHeading.copyWith(fontSize: 13),
                ),
              ],
            )
          : const Icon(Icons.biotech, color: EdColors.orange, size: 22),
    );
  }
}
