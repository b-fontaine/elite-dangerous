/// Readers specific to Frontier's `/profile` payload.
///
/// The generic ones live in `core/json` and are re-exported here so the
/// mappers keep a single import.
library;

export '../../../../core/json/json_readers.dart';

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
