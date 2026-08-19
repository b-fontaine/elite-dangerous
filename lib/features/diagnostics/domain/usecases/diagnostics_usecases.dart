import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/time/clock.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/diagnostics_capture.dart';
import '../entities/raw_payload.dart';
import '../repositories/diagnostics_repository.dart';
import '../services/payload_inspector.dart';

/// Reads the `/profile` already on the device and inspects it.
///
/// Free: it spends no query against Frontier, which is why the screen opens on
/// it rather than on a fresh call.
@injectable
class ReadCachedProfile extends UseCase<ProfileCapture?, NoParams> {
  const ReadCachedProfile(this._repository, this._inspector);

  final DiagnosticsRepository _repository;
  final PayloadInspector _inspector;

  @override
  Future<Result<ProfileCapture?>> call(NoParams input) async =>
      (await _repository.cachedProfile())
          .map((RawPayload? payload) => _inspectProfile(payload, _inspector));
}

/// Calls `/profile` and inspects the answer. Spends one query.
@injectable
class RefreshProfileCapture extends UseCase<ProfileCapture, NoParams> {
  const RefreshProfileCapture(this._repository, this._inspector);

  final DiagnosticsRepository _repository;
  final PayloadInspector _inspector;

  @override
  Future<Result<ProfileCapture>> call(NoParams input) async =>
      (await _repository.fetchProfile()).map(
        (RawPayload payload) => ProfileCapture(
          payload: payload,
          inspection: _inspector.inspectProfile(_decodeObject(payload.body)),
        ),
      );
}

/// Reads the journal lines already stored and tallies their event types.
@injectable
class ReadStoredJournal extends UseCase<JournalCapture?, NoParams> {
  const ReadStoredJournal(this._repository, this._inspector);

  final DiagnosticsRepository _repository;
  final PayloadInspector _inspector;

  @override
  Future<Result<JournalCapture?>> call(NoParams input) async =>
      (await _repository.storedJournal()).map(
        (RawPayload? payload) => payload == null
            ? null
            : JournalCapture(
                payload: payload,
                inspection: _inspector.inspectJournal(payload.lines),
              ),
      );
}

/// Calls `/journal/{day}` for one UTC day. Spends one query.
///
/// Defaults to today because `Statistics`, `EngineerProgress`, `ShipLocker`,
/// `Loadout` and `Reputation` are rewritten at every session start: one played
/// day is enough to see the commander's current state.
@injectable
class FetchJournalDayCapture extends UseCase<JournalCapture, DateTime?> {
  const FetchJournalDayCapture(this._repository, this._inspector, this._clock);

  final DiagnosticsRepository _repository;
  final PayloadInspector _inspector;
  final Clock _clock;

  @override
  Future<Result<JournalCapture>> call(DateTime? input) async {
    final DateTime now = input ?? _clock.now();
    final DateTime day = DateTime.utc(now.year, now.month, now.day);
    return (await _repository.fetchJournalDay(day)).map(
      (RawPayload payload) => JournalCapture(
        payload: payload,
        inspection: _inspector.inspectJournal(payload.lines),
      ),
    );
  }
}

/// Writes a capture to a file and returns its path.
@injectable
class ExportCapture extends UseCase<String, RawPayload> {
  const ExportCapture(this._repository);

  final DiagnosticsRepository _repository;

  @override
  Future<Result<String>> call(RawPayload input) => _repository.export(input);
}

ProfileCapture? _inspectProfile(RawPayload? payload, PayloadInspector inspector) {
  if (payload == null) {
    return null;
  }
  return ProfileCapture(
    payload: payload,
    inspection: inspector.inspectProfile(_decodeObject(payload.body)),
  );
}

/// A capture that will not decode is not an error worth failing on: the screen
/// still shows the raw text, and an empty inspection says as much.
Map<String, dynamic> _decodeObject(String body) {
  try {
    final Object? decoded = jsonDecode(body);
    return decoded is Map<String, dynamic> ? decoded : <String, dynamic>{};
  } on FormatException {
    return <String, dynamic>{};
  }
}
