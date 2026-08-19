import 'package:elite_dangerous/core/di/injection.dart';
import 'package:elite_dangerous/features/commander/domain/entities/commander.dart';
import 'package:elite_dangerous/features/commander/domain/entities/manual_commander_overrides.dart';
import 'package:elite_dangerous/features/commander/domain/repositories/commander_repository.dart';
import 'package:elite_dangerous/features/exobiology/domain/repositories/commander_snapshot_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/path_provider_stub.dart';

/// Guards the boundary between queries and mutations.
///
/// The exobiology snapshot listens to `watchProfile()` and rebuilds itself by
/// calling `getProfile()`. If reading the profile also published on that
/// stream, the two would drive each other in an unbounded loop — which is
/// exactly what happened, and what hung the app on the roadmap screen.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  usePathProviderStub();

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    await resetDependencies();
    await configureDependencies();
  });

  tearDown(resetDependencies);

  test('reading the profile does not publish on the profile stream', () async {
    final CommanderRepository repository = getIt<CommanderRepository>();
    final List<Commander> emitted = <Commander>[];
    final sub = repository.watchProfile().listen(emitted.add);

    await Future<void>.delayed(const Duration(milliseconds: 30));
    emitted.clear();

    await repository.getProfile();
    await repository.getProfile();
    await repository.getProfile();
    await Future<void>.delayed(const Duration(milliseconds: 20));

    expect(emitted, isEmpty);
    await sub.cancel();
  });

  test('saving manual overrides does publish', () async {
    final CommanderRepository repository = getIt<CommanderRepository>();
    final List<Commander> emitted = <Commander>[];
    final sub = repository.watchProfile().listen(emitted.add);

    await Future<void>.delayed(const Duration(milliseconds: 30));
    emitted.clear();

    await repository.saveOverrides(
      const ManualCommanderOverrides(commanderName: 'Caspian'),
    );
    await Future<void>.delayed(const Duration(milliseconds: 30));

    expect(emitted, isNotEmpty);
    expect(emitted.last.name, 'Caspian');
    await sub.cancel();
  });

  test('a change made while the initial load is running is not lost', () async {
    // The window between subscribing and the first value arriving is real:
    // opening a screen and immediately saving lands squarely inside it.
    final CommanderRepository repository = getIt<CommanderRepository>();
    final List<Commander> emitted = <Commander>[];
    final sub = repository.watchProfile().listen(emitted.add);

    await repository.saveOverrides(
      const ManualCommanderOverrides(commanderName: 'Course rapide'),
    );
    await Future<void>.delayed(const Duration(milliseconds: 50));

    expect(
      emitted.map((Commander c) => c.name),
      contains('Course rapide'),
      reason: 'L\'événement émis pendant le chargement initial est perdu.',
    );
    await sub.cancel();
  });

  test('the exobiology snapshot settles instead of looping', () async {
    final CommanderSnapshotSource source = getIt<CommanderSnapshotSource>();
    final List<Object> snapshots = <Object>[];
    final sub = source.watch().listen(snapshots.add);

    // Waits for quiet rather than for a fixed delay: building a snapshot now
    // reads the journal from a file, and how long that takes is the machine's
    // business. A fixed window would either flake or hide a real loop.
    int quietRounds = 0;
    int previous = -1;
    for (int round = 0; round < 40 && quietRounds < 4; round++) {
      await Future<void>.delayed(const Duration(milliseconds: 25));
      if (snapshots.length == previous) {
        quietRounds++;
      } else {
        quietRounds = 0;
        previous = snapshots.length;
      }
    }

    expect(
      quietRounds,
      greaterThanOrEqualTo(4),
      reason: 'Le flux doit se stabiliser, pas boucler.',
    );
    // A feedback loop would run into the hundreds; a handful is the graph
    // settling as each of its three sources reports in.
    expect(snapshots.length, lessThan(8));
    await sub.cancel();
  });

  test('without a session the profile falls back to the manual entry',
      () async {
    final CommanderRepository repository = getIt<CommanderRepository>();
    await repository.saveOverrides(
      const ManualCommanderOverrides(
        commanderName: 'CMDR Hors-ligne',
        creditBalance: 45480912,
      ),
    );

    final Commander commander = (await repository.getProfile()).valueOrNull!;

    expect(commander.name, 'CMDR Hors-ligne');
    expect(commander.credits, 45480912);
  });
}
