import 'package:equatable/equatable.dart';

/// What a route is optimised for.
///
/// The two objectives are the same endpoint shape with a different scoring
/// function on Spansh's side, so they share every parameter below except
/// [RouteRequest.useMappingValue], which only `riches` reads.
enum RouteObjective {
  /// `/api/exobiology/route` — ranks systems by the value of the organisms
  /// recorded on their bodies.
  exobiology,

  /// `/api/riches/route` — the "Road to Riches": ranks systems by scan and
  /// surface-mapping value.
  riches,
}

/// The parameters of one route request.
///
/// The field names here are the app's; the wire names are Spansh's and live in
/// the DTO layer. They differ in two places on purpose — `maxSystems` is
/// `max_results` on the wire, and [fromSystem] is `from` — because the wire
/// names read as a form and these read as a question.
///
/// Every bound is a system name rather than an `id64`: the routing endpoints
/// take names, unlike `/api/dump/{id64}`. That is Spansh's choice, not ours.
class RouteRequest extends Equatable {
  const RouteRequest({
    required this.objective,
    required this.fromSystem,
    required this.jumpRangeLy,
    required this.radiusLy,
    required this.maxSystems,
    this.toSystem,
    this.maxDistanceToArrivalLs,
    this.minValueCr,
    this.avoidThargoids = false,
    this.loop = false,
    this.useMappingValue = true,
  });

  final RouteObjective objective;

  /// Where the commander is. Pre-filled from the journal in the screen that
  /// will call this; there is no default here.
  final String fromSystem;

  /// Where the route must end. Null asks Spansh for an open route, or — with
  /// [loop] — one that returns to [fromSystem].
  final String? toSystem;

  /// Laden jump range, in light years. Read from `Loadout.MaxJumpRange`.
  final double jumpRangeLy;

  /// How far off the direct path Spansh may wander to find good systems.
  final double radiusLy;

  /// How many systems to retain. This is the knob the time model turns.
  final int maxSystems;

  /// Ceiling on a body's distance from its arrival star, in light seconds.
  ///
  /// The parameter that most changes how a route *feels*: a 200 000 Ls body
  /// is worth the same credits and costs ten minutes of supercruise.
  final double? maxDistanceToArrivalLs;

  /// Floor on a body's value before it is worth a stop, in credits.
  ///
  /// Spansh's own default is 10 000 000 when the field is omitted.
  final int? minValueCr;

  final bool avoidThargoids;

  /// Whether the route returns to [fromSystem].
  final bool loop;

  /// Count the surface-mapping bonus in the ranking. Read by `riches` only,
  /// and sent only for that objective.
  final bool useMappingValue;

  RouteRequest copyWith({
    RouteObjective? objective,
    String? fromSystem,
    String? toSystem,
    double? jumpRangeLy,
    double? radiusLy,
    int? maxSystems,
    double? maxDistanceToArrivalLs,
    int? minValueCr,
    bool? avoidThargoids,
    bool? loop,
    bool? useMappingValue,
  }) =>
      RouteRequest(
        objective: objective ?? this.objective,
        fromSystem: fromSystem ?? this.fromSystem,
        toSystem: toSystem ?? this.toSystem,
        jumpRangeLy: jumpRangeLy ?? this.jumpRangeLy,
        radiusLy: radiusLy ?? this.radiusLy,
        maxSystems: maxSystems ?? this.maxSystems,
        maxDistanceToArrivalLs:
            maxDistanceToArrivalLs ?? this.maxDistanceToArrivalLs,
        minValueCr: minValueCr ?? this.minValueCr,
        avoidThargoids: avoidThargoids ?? this.avoidThargoids,
        loop: loop ?? this.loop,
        useMappingValue: useMappingValue ?? this.useMappingValue,
      );

  @override
  List<Object?> get props => <Object?>[
        objective,
        fromSystem,
        toSystem,
        jumpRangeLy,
        radiusLy,
        maxSystems,
        maxDistanceToArrivalLs,
        minValueCr,
        avoidThargoids,
        loop,
        useMappingValue,
      ];
}
