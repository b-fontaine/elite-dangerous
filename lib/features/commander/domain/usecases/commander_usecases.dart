import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/commander.dart';
import '../entities/manual_commander_overrides.dart';
import '../repositories/commander_repository.dart';

@injectable
class GetCommanderProfile extends UseCase<Commander, NoParams> {
  const GetCommanderProfile(this._repository);

  final CommanderRepository _repository;

  @override
  Future<Result<Commander>> call(NoParams input) => _repository.getProfile();
}

/// Forces a Companion API round-trip. Only ever triggered by the commander,
/// never automatically: Frontier's budget is one query a minute.
@injectable
class RefreshCommanderProfile extends UseCase<Commander, NoParams> {
  const RefreshCommanderProfile(this._repository);

  final CommanderRepository _repository;

  @override
  Future<Result<Commander>> call(NoParams input) =>
      _repository.getProfile(forceRefresh: true);
}

@injectable
class WatchCommander extends StreamUseCase<Commander, NoParams> {
  const WatchCommander(this._repository);

  final CommanderRepository _repository;

  @override
  Stream<Commander> call(NoParams input) => _repository.watchProfile();
}

@injectable
class GetManualOverrides extends UseCase<ManualCommanderOverrides, NoParams> {
  const GetManualOverrides(this._repository);

  final CommanderRepository _repository;

  @override
  Future<Result<ManualCommanderOverrides>> call(NoParams input) =>
      _repository.getOverrides();
}

@injectable
class SaveManualOverrides extends UseCase<void, ManualCommanderOverrides> {
  const SaveManualOverrides(this._repository);

  final CommanderRepository _repository;

  @override
  Future<Result<void>> call(ManualCommanderOverrides input) =>
      _repository.saveOverrides(input);
}
