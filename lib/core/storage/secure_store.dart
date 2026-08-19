/// Port for secrets that must never land in plain `SharedPreferences`:
/// Frontier OAuth access/refresh tokens and the PKCE verifier.
abstract interface class SecureStore {
  Future<String?> read(String key);

  Future<void> write(String key, String value);

  Future<void> delete(String key);

  Future<void> deleteAll();
}
