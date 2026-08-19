import '../../../../core/lifecycle/disposable.dart';
import '../../../../core/result/result.dart';
import '../entities/commander.dart';
import '../entities/manual_commander_overrides.dart';

/// The commander's profile, from whichever source can supply it.
abstract interface class CommanderRepository implements Disposable {
  /// Returns the profile, already merged with the manual overrides.
  ///
  /// Without [forceRefresh] the cached profile is preferred: Frontier asks for
  /// no more than one Companion API query per minute.
  Future<Result<Commander>> getProfile({bool forceRefresh = false});

  Stream<Commander> watchProfile();

  Future<Result<ManualCommanderOverrides>> getOverrides();

  Future<Result<void>> saveOverrides(ManualCommanderOverrides overrides);

  Future<Result<void>> clearCache();
}
