/// Lenient readers for payloads that are not a stable schema.
///
/// Every remote source this app reads is someone else's JSON, and none of them
/// promise a type. Numbers arrive as int, double or string; a field that is
/// documented as present is missing on half the records. Everything here
/// degrades to null rather than throwing, so one odd field never costs a whole
/// answer.
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

