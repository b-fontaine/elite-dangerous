import 'package:elite_dangerous/app/router/app_routes.dart';
import 'package:elite_dangerous/app/shell/adaptive_shell.dart';
import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// The app must be usable on a phone, a tablet and a desktop window.
/// These sizes are the ones people actually run: a small Android phone, an
/// iPad in portrait, and a maximised desktop window.
const Size phone = Size(360, 800);
const Size tablet = Size(768, 1024);
const Size desktop = Size(1440, 900);

const List<AppDestination> _destinations = <AppDestination>[
  AppDestination(
    path: '/',
    label: 'Poste de pilotage',
    shortLabel: 'Cockpit',
    icon: Icons.dashboard_outlined,
    selectedIcon: Icons.dashboard,
  ),
  AppDestination(
    path: '/exobiologie',
    label: 'Exobiologie',
    shortLabel: 'Exobio',
    icon: Icons.biotech_outlined,
    selectedIcon: Icons.biotech,
  ),
];

Future<void> _pumpShell(WidgetTester tester, Size size) async {
  tester.view
    ..physicalSize = size
    ..devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    MaterialApp(
      theme: EdTheme.build(),
      home: AdaptiveShell(
        destinations: _destinations,
        selectedIndex: 0,
        onSelect: (_) {},
        child: const Center(child: Text('contenu')),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  testWidgets('a phone gets a bottom navigation bar', (tester) async {
    await _pumpShell(tester, phone);

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);
    expect(find.text('Cockpit'), findsOneWidget);
  });

  testWidgets('a tablet gets a collapsed navigation rail', (tester) async {
    await _pumpShell(tester, tablet);

    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
    final NavigationRail rail = tester.widget(find.byType(NavigationRail));
    expect(rail.extended, isFalse);
  });

  testWidgets('a desktop window gets an extended rail with labels',
      (tester) async {
    await _pumpShell(tester, desktop);

    final NavigationRail rail = tester.widget(find.byType(NavigationRail));
    expect(rail.extended, isTrue);
    expect(find.text('Exobiologie'), findsOneWidget);
  });

  testWidgets('the content is rendered at every size', (tester) async {
    for (final Size size in <Size>[phone, tablet, desktop]) {
      await _pumpShell(tester, size);
      expect(find.text('contenu'), findsOneWidget, reason: '$size');
    }
  });

  testWidgets('no size overflows the layout', (tester) async {
    for (final Size size in <Size>[phone, tablet, desktop]) {
      await _pumpShell(tester, size);
      expect(tester.takeException(), isNull, reason: '$size');
    }
  });
}
