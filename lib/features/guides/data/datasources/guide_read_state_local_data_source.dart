import 'package:injectable/injectable.dart';

import '../../../../core/storage/key_value_store.dart';
import '../../../../core/storage/storage_keys.dart';

/// Remembers which sections the commander already read.
///
/// Stored as `{guideId: [sectionId, …]}` under a single key, so clearing local
/// data is one removal rather than a scan.
@lazySingleton
class GuideReadStateLocalDataSource {
  const GuideReadStateLocalDataSource(this._store);

  final KeyValueStore _store;

  Future<Set<String>> readSections(String guideId) async {
    final Map<String, dynamic> all = await _readAll();
    final Object? sections = all[guideId];
    return sections is List<dynamic>
        ? sections.whereType<String>().toSet()
        : const <String>{};
  }

  Future<void> markRead(String guideId, String sectionId) async {
    final Map<String, dynamic> all = await _readAll();
    final Set<String> sections = await readSections(guideId)
      ..add(sectionId);
    all[guideId] = sections.toList();
    await _store.writeJson(StorageKeys.guidesReadState, all);
  }

  Future<Map<String, dynamic>> _readAll() async =>
      await _store.readJson(StorageKeys.guidesReadState) ??
      <String, dynamic>{};
}
