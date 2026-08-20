import '../entities/exobiology_activity.dart';
import '../entities/journal_event.dart';

/// Folds a journal into the exobiology picture.
///
/// Three game rules drive the whole aggregation:
///
/// * three `ScanOrganic` events complete one organism, and the third one is
///   always `Analyse`;
/// * a `SellOrganicData` clears every completed organism of the species it
///   names — the game sells the whole hold, not a selection;
/// * losing the ship loses everything sampled and not yet sold.
///
/// That third rule is the one with no event of its own: the journal never says
/// "your organic data was lost". It says the commander died. So `Died` is what
/// this keys on — as BioScan does — with `Resurrect` as a second net for a
/// loss whose `Died` line never made it into the import.
///
/// Reading `Resurrect.Option` *instead* of `Died` is the trap here, and it is
/// worth naming: the most ordinary death of all ends on the rebuy screen and
/// writes `Option: rebuy`, so a filter built from BioScan's three fallback
/// values misses precisely the case it was written for.
///
/// Known limit, inherited from BioScan: an on-foot death also clears. It very
/// probably should not — the ship and the samples aboard it survive — but
/// nothing in the journal marks the difference, and over-reporting a hold
/// forever is the worse of the two errors.
class ExobiologyActivityAggregator {
  const ExobiologyActivityAggregator();

  ExobiologyActivity aggregate(Iterable<JournalEvent> events) {
    final List<JournalEvent> ordered = events.toList()
      ..sort((JournalEvent a, JournalEvent b) =>
          a.timestamp.compareTo(b.timestamp));

    final Map<String, InProgressOrganism> pending =
        <String, InProgressOrganism>{};
    final Set<String> soldKeys = <String>{};
    final Set<String> soldSpecies = <String>{};
    int totalSold = 0;
    int firstLogged = 0;
    int saleCount = 0;
    int lostToDeath = 0;
    DateTime? lastSale;
    DateTime? lastLoss;

    for (final JournalEvent event in ordered) {
      switch (event) {
        case final ScanOrganicEvent scan:
          final String key = InProgressOrganism(
            genus: scan.genusLocalised ?? scan.genus,
            species: scan.displayName,
            samplesTaken: 0,
            bodyId: scan.bodyId,
            systemAddress: scan.systemAddress,
          ).key;

          final InProgressOrganism? current = pending[key];
          // `Analyse` is always the third sample, whatever we managed to
          // observe before — an import can easily start mid-organism.
          final int samples = scan.completesOrganism
              ? 3
              : ((current?.samplesTaken ?? 0) + 1).clamp(1, 3);
          pending[key] = InProgressOrganism(
            genus: scan.genusLocalised ?? scan.genus,
            species: scan.displayName,
            samplesTaken: samples,
            bodyId: scan.bodyId,
            systemAddress: scan.systemAddress,
            lastScanAt: scan.timestamp,
          );

        case final SellOrganicDataEvent sale:
          saleCount++;
          lastSale = sale.timestamp;
          totalSold += sale.totalCr;
          firstLogged += sale.firstLoggedCount;
          for (final SoldBioData sold in sale.entries) {
            soldSpecies.add(sold.displayName);
            pending.removeWhere((String key, InProgressOrganism organism) {
              final bool matches = organism.species == sold.displayName &&
                  organism.isComplete;
              if (matches) {
                soldKeys.add(key);
              }
              return matches;
            });
          }

        case final DiedEvent died:
          // Everything sampled since the last sale goes, the partial samples
          // included: the Genetic Sampler's own progress went down with it.
          if (pending.isNotEmpty) {
            lostToDeath += pending.length;
            lastLoss = died.timestamp;
            pending.clear();
          }

        case final ResurrectEvent resurrect:
          // Only reached when the matching `Died` is absent — an import that
          // starts mid-session, or a journal truncated by a crash.
          if (resurrect.losesUnsoldData && pending.isNotEmpty) {
            lostToDeath += pending.length;
            lastLoss = resurrect.timestamp;
            pending.clear();
          }

        case _:
          break;
      }
    }

    final List<InProgressOrganism> remaining = pending.values.toList();
    return ExobiologyActivity(
      totalSoldCr: totalSold,
      firstLoggedCount: firstLogged,
      samplesInProgress: remaining
          .where((InProgressOrganism o) => !o.isComplete)
          .toList(growable: false),
      completedNotSold: remaining
          .where((InProgressOrganism o) => o.isComplete)
          .toList(growable: false),
      soldSpeciesKeys: soldKeys,
      distinctSpeciesSold: soldSpecies.length,
      saleCount: saleCount,
      lastSaleAt: lastSale,
      organismsLostToDeath: lostToDeath,
      lastLossAt: lastLoss,
    );
  }
}
