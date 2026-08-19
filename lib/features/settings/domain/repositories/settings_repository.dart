import '../../../../core/lifecycle/disposable.dart';
import '../../../../core/result/result.dart';
import '../entities/app_settings.dart';

abstract interface class SettingsRepository implements Disposable {
  Future<Result<AppSettings>> load();

  Stream<AppSettings> watch();

  Future<Result<void>> save(AppSettings settings);

  /// Wipes every key the commander owns, leaving the OAuth client
  /// configuration and the bundled reference data untouched.
  Future<Result<void>> resetLocalData();
}
