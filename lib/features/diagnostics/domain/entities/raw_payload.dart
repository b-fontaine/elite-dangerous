import 'package:equatable/equatable.dart';

/// Where a capture came from.
enum RawPayloadOrigin {
  companionApi('Companion API'),
  localCache('Cache local');

  const RawPayloadOrigin(this.label);

  final String label;
}

/// Wire shape of a capture, which also decides an export's file extension.
enum RawPayloadFormat {
  /// One JSON document, re-indented so it can be read.
  json('json'),

  /// One JSON document per line — how `/journal` answers.
  jsonLines('jsonl');

  const RawPayloadFormat(this.extension);

  final String extension;
}

/// A payload exactly as it was received or stored, with nothing interpreted.
///
/// That is the entire point: the app's DTOs read a fraction of `/profile`, and
/// the question this feature exists to answer is what sits in the part they
/// skip. Parsing it into an entity first would throw away the answer.
class RawPayload extends Equatable {
  const RawPayload({
    required this.title,
    required this.body,
    required this.origin,
    required this.format,
    required this.capturedAt,
    this.statusCode,
    this.note,
  });

  /// Endpoint or store this came from, e.g. `GET /profile`.
  final String title;

  final String body;
  final RawPayloadOrigin origin;
  final RawPayloadFormat format;
  final DateTime capturedAt;

  /// HTTP status when the capture came from the network. `204` (did not play)
  /// and `206` (incomplete) are answers from Frontier, not errors.
  final int? statusCode;

  /// Free-form remark shown alongside the capture.
  final String? note;

  bool get isEmpty => body.trim().isEmpty;

  int get characterCount => body.length;

  /// Non-blank lines, which is what a JSON-lines capture is counted in.
  List<String> get lines => body
      .split(RegExp(r'\r?\n'))
      .where((String line) => line.trim().isNotEmpty)
      .toList(growable: false);

  @override
  List<Object?> get props =>
      <Object?>[title, body, origin, format, capturedAt, statusCode, note];
}
