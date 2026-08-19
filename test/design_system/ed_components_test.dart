import 'package:elite_dangerous/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _pump(WidgetTester tester, Widget child, {double width = 400}) {
  return tester.pumpWidget(
    MaterialApp(
      theme: EdTheme.build(),
      home: Scaffold(
        body: Center(child: SizedBox(width: width, child: child)),
      ),
    ),
  );
}

void main() {
  group('EdNotchedBorder', () {
    test('cuts the two corners the source guides cut', () {
      const EdNotchedBorder border = EdNotchedBorder(notch: 16);
      final Path path = border.getOuterPath(const Rect.fromLTWH(0, 0, 100, 60));

      // The bevel removes the top-right and bottom-left corners.
      expect(path.contains(const Offset(99, 1)), isFalse);
      expect(path.contains(const Offset(1, 59)), isFalse);
      // The other two stay square.
      expect(path.contains(const Offset(1, 1)), isTrue);
      expect(path.contains(const Offset(99, 59)), isTrue);
    });

    test('a zero notch degenerates to a rectangle', () {
      const EdNotchedBorder border = EdNotchedBorder(notch: 0);
      final Path path = border.getOuterPath(const Rect.fromLTWH(0, 0, 50, 50));

      expect(path.contains(const Offset(49, 1)), isTrue);
    });

    test('the notch never exceeds half the shortest side', () {
      const EdNotchedBorder border = EdNotchedBorder(notch: 999);
      final Path path = border.getOuterPath(const Rect.fromLTWH(0, 0, 20, 20));

      expect(path.getBounds().width, 20);
    });
  });

  group('EdCallout', () {
    testWidgets('each tone renders its title and body', (tester) async {
      await _pump(
        tester,
        Column(
          children: <Widget>[
            EdCallout.text(
              tone: EdCalloutTone.warning,
              title: 'Le piège',
              text: 'Mourir efface tout.',
            ),
            EdCallout.text(
              tone: EdCalloutTone.tip,
              title: 'À faire',
              text: 'Vendre souvent.',
            ),
          ],
        ),
      );

      expect(find.text('LE PIÈGE'), findsOneWidget);
      expect(find.text('Mourir efface tout.'), findsOneWidget);
      expect(find.text('À FAIRE'), findsOneWidget);
    });
  });

  group('EdDataTable', () {
    testWidgets('renders headers and every cell', (tester) async {
      await _pump(
        tester,
        const EdDataTable(
          headers: <String>['Espèce', 'Valeur'],
          rows: <List<EdCell>>[
            <EdCell>[
              EdCell('Stratum Tectonicas'),
              EdCell.number('19 010 800'),
            ],
            <EdCell>[EdCell('Bacterium Aurasus'), EdCell.number('1 000 000')],
          ],
        ),
        width: 600,
      );

      expect(find.text('ESPÈCE'), findsOneWidget);
      expect(find.text('Stratum Tectonicas'), findsOneWidget);
      expect(find.text('19 010 800'), findsOneWidget);
    });

    testWidgets('scrolls horizontally instead of overflowing on a phone',
        (tester) async {
      await _pump(
        tester,
        const EdDataTable(
          headers: <String>['A', 'B', 'C', 'D', 'E', 'F'],
          rows: <List<EdCell>>[
            <EdCell>[
              EdCell('1'),
              EdCell('2'),
              EdCell('3'),
              EdCell('4'),
              EdCell('5'),
              EdCell('6'),
            ],
          ],
        ),
        width: 200,
      );

      expect(tester.takeException(), isNull);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
  });

  group('EdSteps', () {
    testWidgets('numbers the steps and shows their detail', (tester) async {
      await _pump(
        tester,
        const EdSteps(
          steps: <EdStep>[
            EdStep(text: 'Scanner le système', detail: 'depuis la soute'),
            EdStep(text: 'Cartographier'),
          ],
        ),
      );

      expect(find.text('01'), findsOneWidget);
      expect(find.text('02'), findsOneWidget);
      expect(find.text('depuis la soute'), findsOneWidget);
    });

    testWidgets('a done step is struck through', (tester) async {
      await _pump(
        tester,
        const EdSteps(steps: <EdStep>[EdStep(text: 'Fait', done: true)]),
      );

      final Text text = tester.widget(find.text('Fait'));
      expect(text.style?.decoration, TextDecoration.lineThrough);
    });
  });

  group('EdProgressBar', () {
    testWidgets('clamps values outside 0 to 1', (tester) async {
      await _pump(tester, const EdProgressBar(progress: 1.8));

      expect(tester.takeException(), isNull);
      expect(
        tester
            .widgetList<Semantics>(find.byType(Semantics))
            .map((Semantics s) => s.properties.value),
        contains('100 %'),
      );
    });
  });

  group('EdTag', () {
    testWidgets('the reliability chips carry their meaning', (tester) async {
      await _pump(
        tester,
        Row(
          children: <Widget>[
            EdTag.reliability(EdSourceReliability.official),
            EdTag.reliability(EdSourceReliability.community),
            EdTag.reliability(EdSourceReliability.estimate),
          ],
        ),
      );

      expect(find.text('OFF'), findsOneWidget);
      expect(find.text('COM'), findsOneWidget);
      expect(find.text('EST'), findsOneWidget);
    });
  });
}
