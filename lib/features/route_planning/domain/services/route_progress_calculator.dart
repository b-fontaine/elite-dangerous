import '../../../exobiology/domain/services/exobiology_reference_data.dart';
import '../../../journal/domain/entities/journal_event.dart';
import '../entities/done_index.dart';
import '../entities/route_plan.dart';
import '../entities/route_progress.dart';
import 'done_index_builder.dart';

/// Folds a journal onto a route to say what is left of it.
///
/// A pure function of (plan, events), and that is the whole design. Nothing is
/// incremented and nothing is stored, so importing the same journal twice
/// produces the same answer as importing it once — not because a guard rejects
/// the duplicate, but because there is no state for a duplicate to corrupt.
/// The same reasoning `ExobiologyActivityAggregator` already relies on.
///
/// Three joins make it work, and each has a different degree of certainty:
///
/// * **System** — `SystemAddress`, on both sides. Exact.
/// * **Body** — the route names bodies, the journal numbers them, and only
///   `Scan` / `SAASignalsFound` / `ApproachBody` carry both. Those build a
///   name→`BodyID` table per system. A body absent from that table has never
///   been scanned by this commander, so it cannot have been sampled either.
/// * **Species** — the journal's species token cannot be translated, but its
///   *genus* token can, and language-independently. Sampling therefore keys on
///   genus, which is exact unless one body carries two species of the same
///   genus; those lines are marked [SpeciesAttribution.sharedGenus] rather
///   than guessed at.
class RouteProgressCalculator {
  const RouteProgressCalculator();

  RouteProgress call(RoutePlan plan, Iterable<JournalEvent> events) {
    // Deduplicated first, and that is what keeps this idempotent now that the
    // sample counter has no ceiling. Two overlapping imports — the same day
    // fetched from the Companion API and read from a local file — carry the
    // same lines, and counting them twice would report six samples where three
    // were taken. `dedupeKey` is the journal's own identity for a line, built
    // for exactly this.
    final Map<String, JournalEvent> unique = <String, JournalEvent>{};
    for (final JournalEvent event in events) {
      unique.putIfAbsent(event.dedupeKey, () => event);
    }
    final List<JournalEvent> ordered = unique.values.toList()
      ..sort((JournalEvent a, JournalEvent b) =>
          a.timestamp.compareTo(b.timestamp));

    // Ordered, not a set: a looping route lists its departure system twice,
    // so "has this system been seen" cannot say how far along the route is.
    final List<int> positions = <int>[];
    // The name→BodyID join comes from the shared index rather than being built
    // a second time here: both read the same events to answer it, and two
    // copies would drift.
    final Map<String, int> bodyIdsByName =
        const DoneIndexBuilder()(ordered).bodyIdsByName;
    // (systemAddress, bodyId, genusId) → samples taken. NOT capped at 3: a
    // body carrying two species of one genus takes six samples, and a ceiling
    // of three would make the finished state unrepresentable.
    final Map<String, int> samplesByGenus = <String, int>{};
    // Work already paid for, which a later death cannot undo.
    final Map<String, int> bankedByGenus = <String, int>{};
    final Set<String> soldSpeciesNames = <String>{};

    for (final JournalEvent event in ordered) {
      switch (event) {
        case final LocationEvent location:
          if (location.systemAddress case final int address) {
            positions.add(address);
          }

        case final BodyScanEvent scan:
          if (scan.systemAddress case final int address) {
            positions.add(address);
          }

        case final BodySignalsEvent signals:
          if (signals.systemAddress case final int address) {
            positions.add(address);
          }

        case final ScanOrganicEvent scan:
          final String? genusId =
              ExobiologyReferenceData.genusIdFromCodex(scan.genus);
          if (genusId == null ||
              scan.systemAddress == null ||
              scan.bodyId == null) {
            break;
          }
          final String key =
              _sampleKey(scan.systemAddress!, scan.bodyId!, genusId);
          // `Analyse` closes an organism, so it lands on the next multiple of
          // three whatever we managed to observe before — an import can easily
          // begin mid-organism. The same rule the exobiology aggregator
          // applies, extended past three so a second organism of the same
          // genus on the same body can be counted.
          final int current = samplesByGenus[key] ?? 0;
          samplesByGenus[key] =
              scan.completesOrganism ? (current ~/ 3 + 1) * 3 : current + 1;

        case final SellOrganicDataEvent sale:
          for (final SoldBioData sold in sale.entries) {
            soldSpeciesNames.add(_normalise(sold.displayName));
            // Selling banks the work: a death afterwards cannot put it back on
            // the to-do list. The sale names a genus but no body, so every
            // completed organism of that genus is moved across — the same
            // reach `ExobiologyActivityAggregator` already has, and the only
            // one the event allows.
            final String? soldGenus =
                ExobiologyReferenceData.genusIdFromCodex(sold.genus);
            if (soldGenus == null) {
              continue;
            }
            for (final String key in samplesByGenus.keys.toList()) {
              if (!key.endsWith(':$soldGenus')) {
                continue;
              }
              final int taken = samplesByGenus[key]!;
              final int banked = (taken ~/ 3) * 3;
              if (banked == 0) {
                continue;
              }
              bankedByGenus[key] = (bankedByGenus[key] ?? 0) + banked;
              final int left = taken - banked;
              if (left == 0) {
                samplesByGenus.remove(key);
              } else {
                samplesByGenus[key] = left;
              }
            }
          }

        case final DiedEvent _:
          // Everything sampled and *unsold* went down with the ship, partial
          // samples included — the Genetic Sampler's progress with it. What was
          // already banked at Vista Genomics stays banked.
          samplesByGenus.clear();

        default:
          break;
      }
    }

    final int cursor = _advance(plan, positions);

    int unattributed = 0;
    final Set<String> attributedKeys = <String>{};

    final List<WaypointProgress> waypoints = <WaypointProgress>[];
    for (final RouteWaypoint waypoint in plan.waypoints) {
      final List<BodyProgress> bodies = <BodyProgress>[];

      for (final RouteBody body in waypoint.bodies) {
        final int? bodyId =
            bodyIdsByName['${waypoint.id64}:${DoneIndex.normalise(body.name)}'];

        // How many species of each genus this body carries, which is what
        // decides whether a genus count names one species or two.
        final Map<String, int> speciesPerGenus = <String, int>{};
        for (final RouteSpecies species in body.species) {
          final String genusId = _genusId(species.genus);
          speciesPerGenus[genusId] = (speciesPerGenus[genusId] ?? 0) + 1;
        }

        final List<SpeciesProgress> progress = <SpeciesProgress>[];
        for (final RouteSpecies species in body.species) {
          final String genusId = _genusId(species.genus);
          int genusSamples = 0;
          if (bodyId != null) {
            final String key = _sampleKey(waypoint.id64, bodyId, genusId);
            genusSamples =
                (bankedByGenus[key] ?? 0) + (samplesByGenus[key] ?? 0);
            if (genusSamples > 0) {
              attributedKeys.add(key);
            }
          }
          final int speciesOfGenus = speciesPerGenus[genusId] ?? 1;
          progress.add(
            SpeciesProgress(
              species: species,
              // Shown per line, so a shared genus reads as "three samples of
              // Tussock here" rather than pretending to know which Tussock.
              samplesTaken: genusSamples > 3 ? 3 : genusSamples,
              attribution: speciesOfGenus > 1
                  ? SpeciesAttribution.sharedGenus
                  : SpeciesAttribution.certain,
              genusSamplesTaken: genusSamples,
              genusSpeciesCount: speciesOfGenus,
              sold: soldSpeciesNames.contains(_normalise(species.species)),
            ),
          );
        }

        bodies.add(
          BodyProgress(
            body: body,
            species: List<SpeciesProgress>.unmodifiable(progress),
            journalBodyId: bodyId,
          ),
        );
      }

      waypoints.add(
        WaypointProgress(
          waypoint: waypoint,
          bodies: List<BodyProgress>.unmodifiable(bodies),
          visited: waypoints.length <= cursor,
        ),
      );
    }

    // Sampling recorded in a system this route visits, on a body it lists,
    // that no line could be hung on. Counted rather than dropped.
    final Set<int> routeSystems =
        plan.waypoints.map((RouteWaypoint w) => w.id64).toSet();
    for (final MapEntry<String, int> entry in <String, int>{
      ...bankedByGenus,
      ...samplesByGenus,
    }.entries) {
      if (attributedKeys.contains(entry.key)) {
        continue;
      }
      final int? system = int.tryParse(entry.key.split(':').first);
      if (system != null && routeSystems.contains(system)) {
        unattributed++;
      }
    }

    return RouteProgress(
      plan: plan,
      waypoints: List<WaypointProgress>.unmodifiable(waypoints),
      unattributedSamples: unattributed,
    );
  }

  /// How far along the route the commander has actually got.
  ///
  /// Advances one waypoint at a time, and only to the *next* one. Two
  /// properties of real routes force that:
  ///
  /// * Spansh loops a route back to its departure system by default, so the
  ///   first and last waypoints share one `id64`. Anything that searched ahead
  ///   for a matching system would land on the last waypoint the moment the
  ///   commander stood in the first — reporting a route as finished before it
  ///   began.
  /// * There is no event for "I have given up on this stop". A commander who
  ///   bypasses a waypoint therefore stalls the cursor rather than skipping it.
  ///
  /// That second point is a real limitation, and it is the conservative
  /// direction: over-reporting what is left is recoverable, telling a
  /// commander they are done when they are not is not.
  static int _advance(RoutePlan plan, List<int> positions) {
    int cursor = 0;
    for (final int address in positions) {
      final int next = cursor + 1;
      if (next < plan.waypoints.length &&
          plan.waypoints[next].id64 == address) {
        cursor = next;
      }
    }
    return cursor;
  }

  static String _sampleKey(int systemAddress, int bodyId, String genusId) =>
      '$systemAddress:$bodyId:$genusId';

  /// Spansh's genus name reduced to the catalogue's genus id.
  ///
  /// `Amphora Plant` → `amphora_plant`. Verified to hold for all twenty-two
  /// genera the catalogue carries; a test pins it, because it is a convention
  /// rather than a guarantee.
  static String _genusId(String genusName) =>
      genusName.trim().toLowerCase().replaceAll(' ', '_');

  static String _normalise(String value) => value.trim().toLowerCase();
}
