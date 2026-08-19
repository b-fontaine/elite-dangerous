import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'key_value_store.dart';

/// `SharedPreferences` adapter for [KeyValueStore].
///
/// Structured aggregates are stored as JSON strings: it keeps the adapter
/// trivial, works identically on mobile, desktop and web, and survives schema
/// evolution because decoding is owned by the data layer mappers.
@LazySingleton(as: KeyValueStore)
class SharedPreferencesKeyValueStore implements KeyValueStore {
  const SharedPreferencesKeyValueStore(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<bool> containsKey(String key) async => _prefs.containsKey(key);

  @override
  Future<String?> readString(String key) async => _prefs.getString(key);

  @override
  Future<void> writeString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  Future<Map<String, dynamic>?> readJson(String key) async {
    final String? raw = _prefs.getString(key);
    if (raw == null || raw.isEmpty) {
      return null;
    }
    final Object? decoded = jsonDecode(raw);
    return decoded is Map<String, dynamic> ? decoded : null;
  }

  @override
  Future<void> writeJson(String key, Map<String, dynamic> value) async {
    await _prefs.setString(key, jsonEncode(value));
  }

  @override
  Future<List<dynamic>?> readJsonList(String key) async {
    final String? raw = _prefs.getString(key);
    if (raw == null || raw.isEmpty) {
      return null;
    }
    final Object? decoded = jsonDecode(raw);
    return decoded is List<dynamic> ? decoded : null;
  }

  @override
  Future<void> writeJsonList(String key, List<dynamic> value) async {
    await _prefs.setString(key, jsonEncode(value));
  }

  @override
  Future<bool?> readBool(String key) async => _prefs.getBool(key);

  @override
  Future<void> writeBool(String key, {required bool value}) async {
    await _prefs.setBool(key, value);
  }

  @override
  Future<int?> readInt(String key) async => _prefs.getInt(key);

  @override
  Future<void> writeInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  @override
  Future<Set<String>> keys() async => _prefs.getKeys();

  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    await _prefs.clear();
  }
}
