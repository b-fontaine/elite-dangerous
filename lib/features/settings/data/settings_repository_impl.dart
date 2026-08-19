import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../core/error/failure.dart';
import '../../../core/result/result.dart';
import '../../../core/storage/key_value_store.dart';
import '../../../core/storage/storage_keys.dart';
import '../../../core/stream/initial_then.dart';
import '../domain/entities/app_settings.dart';
import '../domain/repositories/settings_repository.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._store);

  final KeyValueStore _store;

  static const String _key = 'settings.app';

  final StreamController<AppSettings> _controller =
      StreamController<AppSettings>.broadcast();

  @override
  Future<Result<AppSettings>> load() => guard(
        () async {
          final Map<String, dynamic>? json = await _store.readJson(_key);
          if (json == null) {
            return const AppSettings.defaults();
          }
          return AppSettings(
            journalDirectory: json['journalDirectory'] as String?,
            autoSyncOnLaunch: json['autoSyncOnLaunch'] == true,
            showReliabilityTags: json['showReliabilityTags'] != false,
            compactDensity: json['compactDensity'] == true,
          );
        },
        onError: (Object error, _) =>
            CacheFailure(message: 'Réglages illisibles.', cause: error),
      );

  @override
  Stream<AppSettings> watch() => initialThen<AppSettings>(
        () async =>
            (await load()).getOrElse((_) => const AppSettings.defaults()),
        _controller.stream,
      );

  @override
  Future<Result<void>> save(AppSettings settings) => guard(() async {
        await _store.writeJson(_key, <String, dynamic>{
          'journalDirectory': settings.journalDirectory,
          'autoSyncOnLaunch': settings.autoSyncOnLaunch,
          'showReliabilityTags': settings.showReliabilityTags,
          'compactDensity': settings.compactDensity,
        });
        _controller.add(settings);
      });

  @override
  Future<Result<void>> resetLocalData() => guard(() async {
        for (final String key in StorageKeys.resettable) {
          await _store.remove(key);
        }
      });

  @disposeMethod
  @override
  Future<void> dispose() => _controller.close();
}
