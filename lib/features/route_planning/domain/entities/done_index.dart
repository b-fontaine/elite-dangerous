import 'package:equatable/equatable.dart';

/// What the commander has already done to one body.
class BodyRecord extends Equatable {
  const BodyRecord({
    required this.bodyId,
    required this.name,
    this.scanned = false,
    this.mapped = false,
    this.wasDiscoveredBefore = false,
    this.wasMappedBefore = false,
  });

  /// The in-system `BodyID`, which is how the journal names a body.
  final int bodyId;

  /// The body's full name, as the route and Spansh spell it.
  final String name;

  /// A `Scan` was recorded here.
  final bool scanned;

  /// A `SAAScanComplete` was recorded here: the surface is mapped.
  final bool mapped;

  /// Somebody had already discovered this body when it was scanned.
  ///
  /// From `Scan.WasDiscovered`. Decides whether the first-discovery bonus is
  /// still on the table, which is the only thing that makes re-scanning a body
  /// worth a detour.
  final bool wasDiscoveredBefore;

  /// From `Scan.WasMapped`, same reasoning for the surface-mapping bonus.
  final bool wasMappedBefore;

  BodyRecord merge(BodyRecord other) => BodyRecord(
        bodyId: bodyId,
        name: name.isNotEmpty ? name : other.name,
        scanned: scanned || other.scanned,
        mapped: mapped || other.mapped,
        wasDiscoveredBefore: wasDiscoveredBefore || other.wasDiscoveredBefore,
        wasMappedBefore: wasMappedBefore || other.wasMappedBefore,
      );

  @override
  List<Object?> get props =>
      <Object?>[bodyId, name, scanned, mapped, wasDiscoveredBefore, wasMappedBefore];
}

/// Everything the commander has already visited, scanned and mapped.
///
/// **Two keys, deliberately.** Systems are held by `id64` *and* by normalised
/// name, because the sources disagree on which they publish: the journal, the
/// Frontier visited-stars cache and Spansh all speak `id64`, while EDSM's
/// flight logs carry a system name and an EDSM-internal id that maps to
/// nothing else. Carrying both from the start is what lets the next lot pour
/// EDSM in without reshaping anything.
///
/// Derived from the journal, never stored — the same rule the rest of this
/// feature follows.
class DoneIndex extends Equatable {
  const DoneIndex({
    this.systemIds = const <int>{},
    this.systemNames = const <String>{},
    this.bodies = const <String, BodyRecord>{},
  });

  static const DoneIndex empty = DoneIndex();

  /// `SystemAddress` of every system the commander has been in.
  final Set<int> systemIds;

  /// The same systems by normalised name, for sources that publish no `id64`.
  final Set<String> systemNames;

  /// Bodies keyed by `"<systemAddress>:<bodyId>"`.
  final Map<String, BodyRecord> bodies;

  /// Body ids keyed by `"<systemAddress>:<normalised body name>"`.
  ///
  /// The join the route needs: routes name bodies, the journal numbers them,
  /// and only a handful of events carry both.
  Map<String, int> get bodyIdsByName => <String, int>{
        for (final MapEntry<String, BodyRecord> entry in bodies.entries)
          if (entry.value.name.isNotEmpty)
            '${entry.key.split(':').first}:${normalise(entry.value.name)}':
                entry.value.bodyId,
      };

  bool hasVisitedSystemId(int id64) => systemIds.contains(id64);

  bool hasVisitedSystemName(String name) =>
      systemNames.contains(normalise(name));

  /// Whether either key says this system has been seen.
  bool hasVisited({int? id64, String? name}) =>
      (id64 != null && hasVisitedSystemId(id64)) ||
      (name != null && hasVisitedSystemName(name));

  BodyRecord? recordFor(int systemAddress, int bodyId) =>
      bodies['$systemAddress:$bodyId'];

  /// The record for a body named rather than numbered.
  BodyRecord? recordForName(int systemAddress, String bodyName) {
    final int? bodyId = bodyIdsByName['$systemAddress:${normalise(bodyName)}'];
    return bodyId == null ? null : recordFor(systemAddress, bodyId);
  }

  /// Folds another index into this one, keeping everything either knows.
  ///
  /// How the next lot adds EDSM and the Frontier visited-stars cache without
  /// this one having to know they exist.
  DoneIndex mergedWith(DoneIndex other) {
    final Map<String, BodyRecord> merged = <String, BodyRecord>{...bodies};
    other.bodies.forEach((String key, BodyRecord record) {
      merged[key] = merged[key]?.merge(record) ?? record;
    });
    return DoneIndex(
      systemIds: <int>{...systemIds, ...other.systemIds},
      systemNames: <String>{...systemNames, ...other.systemNames},
      bodies: merged,
    );
  }

  static String normalise(String value) => value.trim().toLowerCase();

  @override
  List<Object?> get props => <Object?>[systemIds, systemNames, bodies];
}
