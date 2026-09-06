import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:elite_dangerous/features/route_planning/presentation/widgets/shared_route_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// The caption a second screen reads before trusting its figures.
///
/// Worth its own test because it is the whole promise of the bridge: never a
/// "connected" light, always how old the answer is.
void main() {
  group('formatAge', () {
    test('reads in seconds, then minutes, then hours', () {
      expect(formatAge(const Duration(seconds: 2)), 'à l\'instant');
      expect(formatAge(Duration.zero), 'à l\'instant');
      expect(formatAge(const Duration(seconds: 42)), 'il y a 42 s');
      expect(formatAge(const Duration(minutes: 3, seconds: 20)), 'il y a 3 min');
      expect(formatAge(const Duration(minutes: 59)), 'il y a 59 min');
      expect(
        formatAge(const Duration(hours: 1, minutes: 5)),
        'il y a 1 h 05',
      );
    });
  });

  Future<void> pumpBanner(
    WidgetTester tester, {
    required Duration? age,
    VoidCallback? onRefresh,
  }) =>
      tester.pumpWidget(
        MaterialApp(
          theme: EdTheme.build(),
          home: Scaffold(
            body: SharedRouteBanner(
              host: '192.168.1.24',
              age: age,
              onRefresh: onRefresh ?? () {},
            ),
          ),
        ),
      );

  testWidgets('names the machine and how old its answer is',
      (WidgetTester tester) async {
    await pumpBanner(tester, age: const Duration(seconds: 12));

    expect(
      find.text('192.168.1.24 · données il y a 12 s'),
      findsOneWidget,
    );
  });

  testWidgets('names the machine alone when it is flying no route',
      (WidgetTester tester) async {
    await pumpBanner(tester, age: null);

    expect(find.text('192.168.1.24'), findsOneWidget);
  });

  testWidgets('re-reads on demand', (WidgetTester tester) async {
    int refreshes = 0;
    await pumpBanner(
      tester,
      age: const Duration(minutes: 4),
      onRefresh: () => refreshes++,
    );

    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    expect(refreshes, 1);
  });
}
