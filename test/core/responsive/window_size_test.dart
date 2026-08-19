import 'package:elite_dangerous/core/responsive/window_size.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Breakpoints.classify', () {
    test('phones are compact', () {
      expect(Breakpoints.classify(320), WindowSizeClass.compact);
      expect(Breakpoints.classify(599.9), WindowSizeClass.compact);
    });

    test('small tablets and landscape phones are medium', () {
      expect(Breakpoints.classify(600), WindowSizeClass.medium);
      expect(Breakpoints.classify(899), WindowSizeClass.medium);
    });

    test('tablets and small desktop windows are expanded', () {
      expect(Breakpoints.classify(900), WindowSizeClass.expanded);
      expect(Breakpoints.classify(1279), WindowSizeClass.expanded);
    });

    test('desktop is large', () {
      expect(Breakpoints.classify(1280), WindowSizeClass.large);
      expect(Breakpoints.classify(2560), WindowSizeClass.large);
    });
  });

  group('WindowSizeClass capabilities', () {
    test('only compact uses bottom navigation', () {
      expect(WindowSizeClass.compact.usesRail, isFalse);
      expect(WindowSizeClass.medium.usesRail, isTrue);
      expect(WindowSizeClass.expanded.usesRail, isTrue);
      expect(WindowSizeClass.large.usesRail, isTrue);
    });

    test('labels appear on the rail from expanded upwards', () {
      expect(WindowSizeClass.medium.usesExtendedRail, isFalse);
      expect(WindowSizeClass.expanded.usesExtendedRail, isTrue);
    });

    test('two panes require at least expanded', () {
      expect(WindowSizeClass.medium.usesTwoPanes, isFalse);
      expect(WindowSizeClass.large.usesTwoPanes, isTrue);
    });
  });
}
