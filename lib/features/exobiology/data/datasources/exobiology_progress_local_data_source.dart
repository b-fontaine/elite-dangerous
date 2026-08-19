import 'package:injectable/injectable.dart';

import '../../../../core/storage/key_value_store.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../domain/entities/exobiology_progress.dart';
import '../models/exobiology_progress_dto.dart';

/// Reads and writes the commander's exobiology save.
@lazySingleton
class ExobiologyProgressLocalDataSource {
  const ExobiologyProgressLocalDataSource(this._store);

  final KeyValueStore _store;

  Future<ExobiologyProgress> read() async {
    final Map<String, dynamic>? json =
        await _store.readJson(StorageKeys.exobiologyProgress);
    if (json == null) {
      return const ExobiologyProgress.empty();
    }
    return ExobiologyProgressDto.fromJson(json);
  }

  Future<void> write(ExobiologyProgress progress) => _store.writeJson(
        StorageKeys.exobiologyProgress,
        ExobiologyProgressDto.toJson(progress),
      );

  Future<void> clear() => _store.remove(StorageKeys.exobiologyProgress);
}
