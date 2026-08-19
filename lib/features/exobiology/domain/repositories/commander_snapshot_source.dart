import '../../../../core/result/result.dart';
import '../entities/commander_snapshot.dart';

/// Anti-corruption layer between the exobiology context and everything that
/// knows about the commander (Companion API profile, journal, manual entry).
///
/// The exobiology domain deliberately does not import the commander feature: it
/// declares the flat read model it needs and lets the data layer adapt.
abstract interface class CommanderSnapshotSource {
  Future<Result<CommanderSnapshot>> current();

  Stream<CommanderSnapshot> watch();
}
