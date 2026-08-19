/// Port for the application's local persistence.
///
/// The whole app is offline-first: there is no backend, so this abstraction is
/// the single source of truth for everything the commander accumulates.
/// The adapter lives in the data layer, which keeps the domain framework-free.
abstract interface class KeyValueStore {
  Future<bool> containsKey(String key);

  Future<String?> readString(String key);

  Future<void> writeString(String key, String value);

  Future<Map<String, dynamic>?> readJson(String key);

  Future<void> writeJson(String key, Map<String, dynamic> value);

  Future<List<dynamic>?> readJsonList(String key);

  Future<void> writeJsonList(String key, List<dynamic> value);

  Future<bool?> readBool(String key);

  Future<void> writeBool(String key, {required bool value});

  Future<int?> readInt(String key);

  Future<void> writeInt(String key, int value);

  Future<Set<String>> keys();

  Future<void> remove(String key);

  Future<void> clear();
}
