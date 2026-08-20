part of 'field_report_bloc.dart';

/// The unsold hold, priced.
class UnsoldHold extends Equatable {
  const UnsoldHold({
    this.organisms = const <InProgressOrganism>[],
    this.valueCr = 0,
    this.unpriced = 0,
  });

  /// Organisms with all three samples taken, waiting for Vista Genomics.
  final List<InProgressOrganism> organisms;

  /// What they are worth at base rate, First Logged bonuses excluded.
  ///
  /// Excluded because the bonus is claimed at the sale and another commander
  /// can still take it first: quoting five times the base would be quoting a
  /// figure the commander might not get.
  final int valueCr;

  /// Organisms the catalogue could not price. Shown rather than hidden — a
  /// total that silently omits three organisms is worse than one that says so.
  final int unpriced;

  int get count => organisms.length;

  bool get isEmpty => organisms.isEmpty;

  @override
  List<Object?> get props => <Object?>[organisms, valueCr, unpriced];
}

class FieldReportState extends Equatable {
  const FieldReportState({
    this.report = const FieldReport.empty(),
    this.live = const LiveGameState.unsupported(),
    this.catalog = const ExobiologyCatalog.empty(),
    this.now,
    this.isLoading = true,
    this.isRefreshing = false,
  });

  final FieldReport report;
  final LiveGameState live;
  final ExobiologyCatalog catalog;

  /// The moment the last poll was folded in, used to age the reading.
  final DateTime? now;

  final bool isLoading;
  final bool isRefreshing;

  JournalSessionState get session => report.session;

  ExobiologyActivity get activity => report.activity;

  SystemSurvey get survey => report.survey;

  GameStatus? get status => live.status;

  /// The system the survey describes, named for the UI.
  String? get systemName => survey.systemName ?? session.position.starSystem;

  /// The body the commander is at, as the game reports it.
  ///
  /// `Status.json` is preferred over the journal here, and this is the one
  /// place it clearly wins: it names the body while the ship is still in orbit
  /// around it, whereas the journal only says so once something happened.
  String? get bodyName => status?.bodyName ?? session.position.bodyName;

  /// What the survey knows about the body underfoot.
  SurveyBody? get currentBody {
    final String? name = bodyName;
    if (name == null) {
      return null;
    }
    return survey.bodies
        .where((SurveyBody body) => body.name == name)
        .firstOrNull;
  }

  /// How stale the game's own picture is.
  Duration? get age {
    final DateTime? at = now;
    return at == null ? null : live.ageAt(at);
  }

  /// Everything sampled and not yet sold, priced against the catalogue.
  UnsoldHold get unsold {
    final List<InProgressOrganism> organisms = activity.completedNotSold;
    int value = 0;
    int unpriced = 0;
    for (final InProgressOrganism organism in organisms) {
      final OrganicSpecies? species = catalog.speciesByName(organism.species);
      if (species == null) {
        unpriced++;
      } else {
        value += species.baseValueCr;
      }
    }
    return UnsoldHold(organisms: organisms, valueCr: value, unpriced: unpriced);
  }

  /// Whether there is anything at all to show below the header.
  bool get hasAnything => !report.isEmpty || status != null;

  FieldReportState copyWith({
    FieldReport? report,
    LiveGameState? live,
    ExobiologyCatalog? catalog,
    DateTime? now,
    bool? isLoading,
    bool? isRefreshing,
  }) {
    return FieldReportState(
      report: report ?? this.report,
      live: live ?? this.live,
      catalog: catalog ?? this.catalog,
      now: now ?? this.now,
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        report,
        live,
        catalog,
        now,
        isLoading,
        isRefreshing,
      ];
}
