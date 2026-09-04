import '../../../journal/domain/entities/journal_event.dart';
import '../entities/done_index.dart';

/// Builds the "already done" index from a journal.
///
/// A pure fold, like everything else in this feature: the index is derived on
/// every read rather than stored, so a fresh import corrects it instead of
/// duplicating into it.
///
/// Only the events that establish *presence* or *work* count here. Notably
/// absent: `ScanOrganic`. Sampling belongs to a route, which is
/// `RouteProgressCalculator`'s job — this index answers the question a route
/// has not been drawn yet: "where have I already been, and what did I do
/// there?"
class DoneIndexBuilder {
  const DoneIndexBuilder();

  DoneIndex call(Iterable<JournalEvent> events) {
    final Set<int> systemIds = <int>{};
    final Set<String> systemNames = <String>{};
    final Map<String, BodyRecord> bodies = <String, BodyRecord>{};

    void remember(int systemAddress, String? starSystem) {
      systemIds.add(systemAddress);
      if (starSystem != null && starSystem.isNotEmpty) {
        systemNames.add(DoneIndex.normalise(starSystem));
      }
    }

    void upsert(int systemAddress, BodyRecord record) {
      final String key = '$systemAddress:${record.bodyId}';
      bodies[key] = bodies[key]?.merge(record) ?? record;
    }

    for (final JournalEvent event in events) {
      switch (event) {
        case final LocationEvent location:
          if (location.systemAddress case final int address) {
            remember(address, location.starSystem);
            // `ApproachBody` is one of the few events carrying a body's name
            // and its number together, which is what the route join needs.
            // Not filtered on `isPlanet`: the journal does not always carry
            // `BodyType`, and a name plus a number is the whole requirement.
            if (location.bodyName case final String name
                when location.bodyId != null) {
              upsert(
                address,
                BodyRecord(bodyId: location.bodyId!, name: name),
              );
            }
          }

        case final BodyScanEvent scan:
          if (scan.systemAddress case final int address) {
            remember(address, scan.starSystem);
            if (scan.bodyId case final int bodyId) {
              upsert(
                address,
                BodyRecord(
                  bodyId: bodyId,
                  name: scan.bodyName,
                  scanned: true,
                  wasDiscoveredBefore: scan.wasDiscovered,
                  wasMappedBefore: scan.wasMapped,
                ),
              );
            }
          }

        case final BodySignalsEvent signals:
          if (signals.systemAddress case final int address) {
            remember(address, null);
            if (signals.bodyId case final int bodyId) {
              upsert(
                address,
                BodyRecord(bodyId: bodyId, name: signals.bodyName ?? ''),
              );
            }
          }

        case final SurfaceMappedEvent mapped:
          if (mapped.systemAddress case final int address) {
            remember(address, null);
            if (mapped.bodyId case final int bodyId) {
              upsert(
                address,
                BodyRecord(
                  bodyId: bodyId,
                  name: mapped.bodyName,
                  mapped: true,
                ),
              );
            }
          }

        default:
          break;
      }
    }

    return DoneIndex(
      systemIds: Set<int>.unmodifiable(systemIds),
      systemNames: Set<String>.unmodifiable(systemNames),
      bodies: Map<String, BodyRecord>.unmodifiable(bodies),
    );
  }
}
