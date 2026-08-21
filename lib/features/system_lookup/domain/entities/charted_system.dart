import 'package:equatable/equatable.dart';

/// One body as the community has recorded it, independently of what this
/// commander has personally scanned.
///
/// This is the whole point of asking a third party: the journal only knows
/// what its owner pointed the FSS at, while Spansh knows what everyone who
/// ever flew here reported. A body that appears here and not in the journal is
/// not a contradiction — it is the answer to "is it worth honking this system".
class ChartedBody extends Equatable {
  const ChartedBody({
    required this.id64,
    required this.name,
    this.bodyId,
    this.type,
    this.subType,
    this.atmosphere,
    this.volcanism,
    this.gravityG,
    this.surfaceTemperatureK,
    this.distanceFromArrivalLs,
    this.landable = false,
    this.terraformingState,
    this.biologicalSignals = 0,
    this.genusNames = const <String>[],
    this.signalsUpdatedAt,
  });

  /// The body's own `id64` — the key of `/api/body/{id64}`, and **not** the
  /// system's. Mixing the two returns a 404 with a helpful message.
  final int id64;

  final String name;

  /// The in-system body number the journal also uses. This is the reliable
  /// join key with `ScanOrganic`, which carries a `BodyID` and no name.
  final int? bodyId;

  /// `Star`, `Planet`… Stars are kept because a system's genera depend on the
  /// parent star's class, and dropping them would lose that.
  final String? type;

  /// `High metal content world`, `Icy body`…
  final String? subType;

  /// `Thin Sulphur dioxide`, `No atmosphere`… Frequently null even on bodies
  /// that have one: the dump carries `atmosphereComposition` separately and
  /// this field is only populated when a scan reported it.
  final String? atmosphere;

  final String? volcanism;

  /// Surface gravity in g. Spansh already publishes g, unlike the journal
  /// which reports m/s².
  final double? gravityG;

  final double? surfaceTemperatureK;

  final double? distanceFromArrivalLs;

  final bool landable;

  final String? terraformingState;

  /// How many biological signals were reported here.
  final int biologicalSignals;

  /// The genera, already decoded from their codex tokens. Empty when nobody
  /// has mapped the body with the DSS — the FSS count alone names nothing.
  final List<String> genusNames;

  /// When the *signals* were last updated, which is not when the body was.
  /// Nine days of drift between the two has been observed, and it is this one
  /// that decides whether a cached species list is still good.
  final DateTime? signalsUpdatedAt;

  bool get isStar => type == 'Star';

  bool get hasBiology => biologicalSignals > 0;

  /// Worth flying to: life is down there and the ship can land on it.
  bool get invitesLanding => landable && hasBiology;

  /// A body whose genera are known can be searched deliberately; one whose
  /// genera are not can only be surveyed.
  bool get genusesKnown => genusNames.isNotEmpty;

  @override
  List<Object?> get props => <Object?>[
        id64,
        name,
        bodyId,
        type,
        subType,
        atmosphere,
        volcanism,
        gravityG,
        surfaceTemperatureK,
        distanceFromArrivalLs,
        landable,
        terraformingState,
        biologicalSignals,
        genusNames,
        signalsUpdatedAt,
      ];
}

/// What the community knows about a system, fetched once and cached.
class ChartedSystem extends Equatable {
  const ChartedSystem({
    required this.id64,
    required this.name,
    required this.fetchedAt,
    this.bodyCount,
    this.bodies = const <ChartedBody>[],
    this.updatedAt,
    this.fromCache = false,
  });

  final int id64;
  final String name;

  /// When this app fetched it. Shown to the commander, because a three-week-old
  /// answer and a fresh one look identical otherwise.
  final DateTime fetchedAt;

  /// How many bodies the system is known to hold. Spansh's own count, which
  /// can exceed [bodies] when some are recorded without detail.
  final int? bodyCount;

  final List<ChartedBody> bodies;

  /// Spansh's last update of the system record itself.
  final DateTime? updatedAt;

  /// Whether this came from the local cache rather than the network.
  final bool fromCache;

  /// Bodies with life on them, nearest first.
  List<ChartedBody> get bodiesWithBiology {
    final List<ChartedBody> found = bodies
        .where((ChartedBody body) => body.hasBiology)
        .toList(growable: false);
    return List<ChartedBody>.unmodifiable(found..sort(_nearestFirst));
  }

  /// Bodies worth landing on, nearest first.
  List<ChartedBody> get landingTargets {
    final List<ChartedBody> found = bodies
        .where((ChartedBody body) => body.invitesLanding)
        .toList(growable: false);
    return List<ChartedBody>.unmodifiable(found..sort(_nearestFirst));
  }

  int get biologicalSignalCount => bodies.fold<int>(
        0,
        (int total, ChartedBody body) => total + body.biologicalSignals,
      );

  /// Every genus named anywhere in the system, deduplicated and sorted.
  List<String> get genusNames {
    final Set<String> names = <String>{};
    for (final ChartedBody body in bodies) {
      names.addAll(body.genusNames);
    }
    return List<String>.unmodifiable(names.toList()..sort());
  }

  ChartedBody? bodyNamed(String name) =>
      bodies.where((ChartedBody body) => body.name == name).firstOrNull;

  ChartedBody? bodyWithId(int bodyId) =>
      bodies.where((ChartedBody body) => body.bodyId == bodyId).firstOrNull;

  static int _nearestFirst(ChartedBody a, ChartedBody b) {
    final double left = a.distanceFromArrivalLs ?? double.maxFinite;
    final double right = b.distanceFromArrivalLs ?? double.maxFinite;
    return left.compareTo(right);
  }

  @override
  List<Object?> get props => <Object?>[
        id64,
        name,
        fetchedAt,
        bodyCount,
        bodies,
        updatedAt,
        fromCache,
      ];
}
