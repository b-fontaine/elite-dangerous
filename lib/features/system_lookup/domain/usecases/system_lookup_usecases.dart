import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/body_landmarks.dart';
import '../entities/charted_system.dart';
import '../repositories/system_lookup_repository.dart';

class SystemLookupInput extends Equatable {
  const SystemLookupInput({required this.id64, this.refresh = false});

  /// The `SystemAddress` the journal wrote. Never a name: two systems can
  /// share one.
  final int id64;

  final bool refresh;

  @override
  List<Object?> get props => <Object?>[id64, refresh];
}

class BodyLandmarksInput extends Equatable {
  const BodyLandmarksInput({
    required this.bodyId64,
    this.signalsUpdatedAt,
    this.refresh = false,
  });

  /// The body's own `id64`, from [ChartedBody.id64].
  final int bodyId64;

  /// What the system dump said about this body's signals, which is what
  /// decides whether a cached species list is still true.
  final DateTime? signalsUpdatedAt;

  final bool refresh;

  @override
  List<Object?> get props => <Object?>[bodyId64, signalsUpdatedAt, refresh];
}

/// Looks up everything the community knows about one system.
@injectable
class LookupSystem extends UseCase<ChartedSystem, SystemLookupInput> {
  const LookupSystem(this._repository);

  final SystemLookupRepository _repository;

  @override
  Future<Result<ChartedSystem>> call(SystemLookupInput input) =>
      _repository.system(input.id64, refresh: input.refresh);
}

/// Looks up the species recorded on the surface of one body.
@injectable
class LookupBodyLandmarks extends UseCase<BodyLandmarks, BodyLandmarksInput> {
  const LookupBodyLandmarks(this._repository);

  final SystemLookupRepository _repository;

  @override
  Future<Result<BodyLandmarks>> call(BodyLandmarksInput input) =>
      _repository.landmarks(
        input.bodyId64,
        signalsUpdatedAt: input.signalsUpdatedAt,
        refresh: input.refresh,
      );
}

/// The copy already held, however old, without touching the network.
///
/// This is what runs when the commander jumps into a system: showing what is
/// already known costs nothing, and asking is their decision, not the app's.
@injectable
class ReadCachedSystem {
  const ReadCachedSystem(this._repository);

  final SystemLookupRepository _repository;

  Future<ChartedSystem?> call(int id64) => _repository.cachedSystem(id64);
}

/// Whether this build can reach Spansh at all.
@injectable
class CanLookUpSystems {
  const CanLookUpSystems(this._repository);

  final SystemLookupRepository _repository;

  bool call() => _repository.isSupported;
}
