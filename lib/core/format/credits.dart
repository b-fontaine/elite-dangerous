/// Formats credit amounts the way the game and the guides write them.
///
/// Lives in `core` because both sides need the exact same output: the roadmap
/// composes French sentences around these figures in the domain, and the UI
/// renders them again in tiles and tables. Two implementations would drift, and
/// the difference — `12.9 M Cr` against `12,9 M Cr` — is the kind that only
/// shows up in a screenshot.
String formatCredits(int value) {
  final bool negative = value < 0;
  final int absolute = value.abs();
  final String formatted = switch (absolute) {
    >= 1000000000 => '${_trim(absolute / 1000000000)} Md Cr',
    >= 1000000 => '${_trim(absolute / 1000000)} M Cr',
    >= 1000 => '${_trim(absolute / 1000)} k Cr',
    _ => '$absolute Cr',
  };
  return negative ? '-$formatted' : formatted;
}

/// Full, space-grouped amount, for a balance or a payout table where the exact
/// figure matters.
///
/// The separator is a narrow no-break space (U+202F), the French typographic
/// convention and the one the source guides use — written as an escape so no
/// editor can silently turn it into an ordinary space.
const String thousandsSeparator = '\u202F';

String formatCreditsExact(int value) {
  final String digits = value.abs().toString();
  final StringBuffer buffer = StringBuffer();
  for (int i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      buffer.write(thousandsSeparator);
    }
    buffer.write(digits[i]);
  }
  return '${value < 0 ? '-' : ''}$buffer Cr';
}

/// Two significant decimals below ten, one above, trailing zeros dropped,
/// decimal comma — French convention.
String _trim(double value) {
  final String text = value.toStringAsFixed(value < 10 ? 2 : 1);
  return text.replaceFirst(RegExp(r'\.?0+$'), '').replaceAll('.', ',');
}
