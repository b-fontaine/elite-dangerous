/// Lenient readers shared by every `/profile` mapper.
///
/// The payload is not a stable schema: collections arrive as an array or as an
/// object keyed by index depending on whether the indices are contiguous,
/// numbers arrive as int, double or string, and some localised names are the
/// raw localisation key. Everything here degrades rather than throws.
library;

Map<String, dynamic> readMap(Object? value) =>
    value is Map<String, dynamic> ? value : const <String, dynamic>{};

String? readString(Object? value) =>
    value is String && value.isNotEmpty ? value : null;

int? readInt(Object? value) => switch (value) {
      final int v => v,
      final double v => v.round(),
      final String v => int.tryParse(v),
      _ => null,
    };

double? readDouble(Object? value) => switch (value) {
      final double v => v,
      final int v => v.toDouble(),
      final String v => double.tryParse(v),
      _ => null,
    };

/// Flattens the two shapes Frontier alternates between for `ships`, `suits`
/// and `loadouts`.
///
/// Not handling the object form is the single most common way third-party
/// clients break on a real account: the map appears as soon as the commander
/// sells a ship or a suit and leaves a gap in the indices.
List<Map<String, dynamic>> normaliseJsonCollection(Object? value) {
  if (value is List<dynamic>) {
    return value.whereType<Map<String, dynamic>>().toList(growable: false);
  }
  if (value is Map<String, dynamic>) {
    return value.values
        .whereType<Map<String, dynamic>>()
        .toList(growable: false);
  }
  return const <Map<String, dynamic>>[];
}

/// Drops a localisation key Frontier failed to translate.
///
/// It ships strings like `PaintJob_Explorer_NX_02_10_Name` and `lander01_name`
/// in fields meant to hold a human name. Showing them is worse than showing
/// the symbol, which at least reads as an identifier.
String? prettyLocalised(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  final String lower = value.toLowerCase();
  if (lower.endsWith('_name') || lower.endsWith('_info')) {
    return null;
  }
  return value;
}
