import 'package:injectable/injectable.dart';

import '../../../../core/storage/key_value_store.dart';
import '../../../../core/storage/storage_keys.dart';
import '../../domain/entities/route_plan.dart';
import '../../domain/repositories/active_route_repository.dart';
import '../models/route_plan_codec.dart';

/// Stores routes in the key/value store, one JSON document each.
///
/// The key/value store rather than a `LineStore`, and the difference is worth
/// stating because the journal went the other way. A `LineStore` exists to
/// append to tens of thousands of lines without rewriting them; a route is a
/// single document of a few dozen kilobytes that is replaced whole every time
/// it changes. The append-only machinery would buy nothing and cost a second
/// file format.
@LazySingleton(as: ActiveRouteRepository)
class ActiveRouteRepositoryImpl implements ActiveRouteRepository {
  const ActiveRouteRepositoryImpl(this._store);

  final KeyValueStore _store;

  /// How many past routes are kept.
  ///
  /// Enough to find last week's run, few enough that the archive stays a
  /// readable list rather than a second journal.
  static const int archiveLimit = 20;

  @override
  Future<RoutePlan?> readActive() async {
    final Map<String, dynamic>? json =
        await _store.readJson(StorageKeys.routeActive);
    if (json == null) {
      return null;
    }
    return RoutePlanCodec.fromJson(json);
  }

  @override
  Future<void> setActive(RoutePlan plan) async {
    final RoutePlan? previous = await readActive();
    if (previous != null && previous.jobId != plan.jobId) {
      await _archive(previous);
    }
    await _store.writeJson(
      StorageKeys.routeActive,
      RoutePlanCodec.toJson(plan),
    );
  }

  @override
  Future<void> clearActive() async {
    final RoutePlan? active = await readActive();
    if (active != null) {
      await _archive(active);
    }
    await _store.remove(StorageKeys.routeActive);
  }

  @override
  Future<List<RoutePlan>> archived() async {
    final List<dynamic>? raw =
        await _store.readJsonList(StorageKeys.routeArchive);
    if (raw == null) {
      return const <RoutePlan>[];
    }
    final List<RoutePlan> plans = <RoutePlan>[];
    for (final Map<String, dynamic> entry
        in raw.whereType<Map<String, dynamic>>()) {
      final RoutePlan? plan = RoutePlanCodec.fromJson(entry);
      if (plan != null) {
        plans.add(plan);
      }
    }
    return List<RoutePlan>.unmodifiable(plans);
  }

  @override
  Future<void> clear() async {
    await _store.remove(StorageKeys.routeActive);
    await _store.remove(StorageKeys.routeArchive);
  }

  /// Puts [plan] at the head of the archive, replacing any earlier copy of the
  /// same job so that archiving twice does not duplicate a route.
  Future<void> _archive(RoutePlan plan) async {
    final List<RoutePlan> existing = await archived();
    final List<Map<String, dynamic>> updated = <Map<String, dynamic>>[
      RoutePlanCodec.toJson(plan),
      ...existing
          .where((RoutePlan p) => p.jobId != plan.jobId)
          .map(RoutePlanCodec.toJson),
    ];
    await _store.writeJsonList(
      StorageKeys.routeArchive,
      updated.take(archiveLimit).toList(growable: false),
    );
  }
}
