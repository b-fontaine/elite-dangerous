import 'package:injectable/injectable.dart';

import '../../../../core/storage/key_value_store.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../domain/entities/manual_commander_overrides.dart';
import '../models/manual_overrides_dto.dart';

/// Caches the last Companion API profile and stores the manual overrides.
///
/// Caching matters more than usual here: the Companion API is rate limited to
/// roughly one query a minute, and only refreshes server-side when the
/// commander docks — so replaying the last response is often the *correct*
/// answer, not a degraded one.
@lazySingleton
class CommanderLocalDataSource {
  const CommanderLocalDataSource(this._store);

  final KeyValueStore _store;

  Future<Map<String, dynamic>?> readCachedProfile() =>
      _store.readJson(StorageKeys.commanderProfile);

  Future<void> writeCachedProfile(Map<String, dynamic> json) =>
      _store.writeJson(StorageKeys.commanderProfile, json);

  Future<DateTime?> readLastSync() async {
    final String? raw =
        await _store.readString(StorageKeys.commanderLastSync);
    return raw == null ? null : DateTime.tryParse(raw);
  }

  Future<void> writeLastSync(DateTime at) =>
      _store.writeString(StorageKeys.commanderLastSync, at.toIso8601String());

  Future<ManualCommanderOverrides> readOverrides() async {
    final Map<String, dynamic>? json =
        await _store.readJson(StorageKeys.commanderManualOverrides);
    return json == null
        ? const ManualCommanderOverrides.empty()
        : ManualOverridesDto.fromJson(json);
  }

  Future<void> writeOverrides(ManualCommanderOverrides overrides) =>
      _store.writeJson(
        StorageKeys.commanderManualOverrides,
        ManualOverridesDto.toJson(overrides),
      );

  Future<void> clear() async {
    await _store.remove(StorageKeys.commanderProfile);
    await _store.remove(StorageKeys.commanderLastSync);
  }
}
