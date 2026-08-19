import 'package:elite_dangerous/core/format/credits.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('formatCredits', () {
    test('uses the French decimal comma, never a dot', () {
      expect(formatCredits(12934900), '12,9 M Cr');
      expect(formatCredits(1500), '1,5 k Cr');
      expect(formatCredits(2262600000), '2,26 Md Cr');
    });

    test('drops trailing zeros', () {
      expect(formatCredits(19000000), '19 M Cr');
      expect(formatCredits(5000000000), '5 Md Cr');
    });

    test('switches unit at each thousand', () {
      expect(formatCredits(999), '999 Cr');
      expect(formatCredits(1000), '1 k Cr');
      expect(formatCredits(999999), '1000 k Cr');
      expect(formatCredits(1000000), '1 M Cr');
      expect(formatCredits(1000000000), '1 Md Cr');
    });

    test('keeps one more decimal below ten', () {
      expect(formatCredits(19010800), '19 M Cr');
      expect(formatCredits(95054000), '95,1 M Cr');
      expect(formatCredits(1628800), '1,63 M Cr');
    });

    test('handles zero and negatives', () {
      expect(formatCredits(0), '0 Cr');
      expect(formatCredits(-750000), '-750 k Cr');
    });
  });

  group('formatCreditsExact', () {
    test('groups thousands with a narrow no-break space', () {
      expect(formatCreditsExact(19010800), '19\u202F010\u202F800 Cr');
      expect(formatCreditsExact(45480912), '45\u202F480\u202F912 Cr');
      expect(formatCreditsExact(0), '0 Cr');
      expect(formatCreditsExact(-1234), '-1\u202F234 Cr');
      expect(formatCreditsExact(100), '100 Cr');
    });
  });
}
