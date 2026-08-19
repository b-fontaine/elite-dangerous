import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/app_settings.dart';
import '../repositories/settings_repository.dart';

@injectable
class WatchSettings extends StreamUseCase<AppSettings, NoParams> {
  const WatchSettings(this._repository);

  final SettingsRepository _repository;

  @override
  Stream<AppSettings> call(NoParams input) => _repository.watch();
}

@injectable
class SaveSettings extends UseCase<void, AppSettings> {
  const SaveSettings(this._repository);

  final SettingsRepository _repository;

  @override
  Future<Result<void>> call(AppSettings input) => _repository.save(input);
}

/// Erases every piece of data the commander accumulated locally.
///
/// Confirmation is the UI's job: a repository that asks questions cannot be
/// reused, and a repository that silently wipes a save is a bug waiting to
/// happen.
@injectable
class ResetLocalData extends UseCase<void, NoParams> {
  const ResetLocalData(this._repository);

  final SettingsRepository _repository;

  @override
  Future<Result<void>> call(NoParams input) => _repository.resetLocalData();
}
