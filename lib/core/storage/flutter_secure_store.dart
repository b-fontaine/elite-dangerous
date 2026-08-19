import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'secure_store.dart';

/// `flutter_secure_storage` adapter for [SecureStore].
///
/// Backed by the Keychain (iOS/macOS), the Keystore-encrypted
/// `EncryptedSharedPreferences` (Android), libsecret (Linux), DPAPI (Windows)
/// and the WebCrypto-wrapped local storage (web).
@LazySingleton(as: SecureStore)
class FlutterSecureStore implements SecureStore {
  const FlutterSecureStore(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);

  @override
  Future<void> delete(String key) => _storage.delete(key: key);

  @override
  Future<void> deleteAll() => _storage.deleteAll();
}
