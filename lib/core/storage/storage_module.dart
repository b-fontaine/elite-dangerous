import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'file_line_store.dart';
import 'key_value_line_store.dart';
import 'key_value_store.dart';
import 'line_store.dart';
import 'storage_keys.dart';

/// Picks the line store the platform can actually offer.
@module
abstract class StorageModule {
  /// A file on every native target; the key/value store on the web, which has
  /// no file system and cannot sign in to Frontier anyway.
  @lazySingleton
  LineStore lineStore(KeyValueStore store) => kIsWeb
      ? KeyValueLineStore(store, StorageKeys.journalEvents)
      : FileLineStore();
}
