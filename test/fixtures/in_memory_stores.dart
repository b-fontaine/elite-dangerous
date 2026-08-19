import 'dart:convert';

import 'package:elite_dangerous/core/storage/key_value_store.dart';
import 'package:elite_dangerous/core/storage/secure_store.dart';

/// In-memory doubles for the two persistence ports.
///
/// Real code, not mocks: the tests exercise the same branches the production
/// adapters do, without a keychain or a `SharedPreferences` binding.
class InMemorySecureStore implements SecureStore {
  InMemorySecureStore([Map<String, String>? seed])
      : _values = <String, String>{...?seed};

  final Map<String, String> _values;

  @override
  Future<String?> read(String key) async => _values[key];

  @override
  Future<void> write(String key, String value) async => _values[key] = value;

  @override
  Future<void> delete(String key) async => _values.remove(key);

  @override
  Future<void> deleteAll() async => _values.clear();
}

class InMemoryKeyValueStore implements KeyValueStore {
  InMemoryKeyValueStore([Map<String, Object>? seed])
      : _values = <String, Object>{...?seed};

  final Map<String, Object> _values;

  @override
  Future<bool> containsKey(String key) async => _values.containsKey(key);

  @override
  Future<String?> readString(String key) async => _values[key] as String?;

  @override
  Future<void> writeString(String key, String value) async =>
      _values[key] = value;

  @override
  Future<Map<String, dynamic>?> readJson(String key) async {
    final String? raw = await readString(key);
    return raw == null ? null : jsonDecode(raw) as Map<String, dynamic>;
  }

  @override
  Future<void> writeJson(String key, Map<String, dynamic> value) async =>
      writeString(key, jsonEncode(value));

  @override
  Future<List<dynamic>?> readJsonList(String key) async {
    final String? raw = await readString(key);
    return raw == null ? null : jsonDecode(raw) as List<dynamic>;
  }

  @override
  Future<void> writeJsonList(String key, List<dynamic> value) async =>
      writeString(key, jsonEncode(value));

  @override
  Future<bool?> readBool(String key) async => _values[key] as bool?;

  @override
  Future<void> writeBool(String key, {required bool value}) async =>
      _values[key] = value;

  @override
  Future<int?> readInt(String key) async => _values[key] as int?;

  @override
  Future<void> writeInt(String key, int value) async => _values[key] = value;

  @override
  Future<Set<String>> keys() async => _values.keys.toSet();

  @override
  Future<void> remove(String key) async => _values.remove(key);

  @override
  Future<void> clear() async => _values.clear();
}
