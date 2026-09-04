import 'package:equatable/equatable.dart';

import 'route_plan.dart';

/// Why a stop was dropped from a route.
enum RemovalReason {
  /// Every species on this body is already analysed. Nothing left to sample.
  allSpeciesAnalysed('Toutes les espèces y sont déjà analysées'),

  /// This body's surface is already mapped by this commander, so the mapping
  /// value the route counted on has already been collected.
  bodyAlreadyMapped('Surface déjà cartographiée'),

  /// Nothing on this body is worth a landing: no species, no value.
  nothingToDo('Rien à y faire');

  const RemovalReason(this.label);

  /// Shown to the commander, so a shortened route explains itself.
  final String label;
}

/// One stop the filter took out.
class RouteRemoval extends Equatable {
  const RouteRemoval({
    required this.systemName,
    required this.reason,
    this.bodyName,
    this.valueCr = 0,
  });

  final String systemName;

  /// Null when a whole system went, because every body in it did.
  final String? bodyName;

  final RemovalReason reason;

  /// What the route thought this stop was worth. Reported so the commander can
  /// see the filter took out work already done, not value still available.
  final int valueCr;

  bool get isWholeSystem => bodyName == null;

  @override
  List<Object?> get props => <Object?>[systemName, bodyName, reason, valueCr];
}

/// A route with the already-done parts taken out.
///
/// Keeps the [original] alongside the [filtered] one on purpose. A route that
/// silently shrinks is indistinguishable from a route Spansh computed badly,
/// and a commander who cannot see what was removed cannot tell the difference
/// between "you have already done this" and "this app lost half my route".
class FilteredRoute extends Equatable {
  const FilteredRoute({
    required this.original,
    required this.filtered,
    this.removals = const <RouteRemoval>[],
    this.revisitedSystems = const <String>{},
  });

  final RoutePlan original;

  /// What is left to fly. Never null and never empty when [original] was not:
  /// a route filtered down to nothing keeps its departure waypoint, so the
  /// screen can say "everything here is done" instead of showing a blank.
  final RoutePlan filtered;

  final List<RouteRemoval> removals;

  /// Systems on the route the commander has already been to.
  ///
  /// Reported, **never removed**. Having flown through a system says nothing
  /// about having sampled it, and dropping a stop on that basis would quietly
  /// delete the best body of the route because the commander once refuelled
  /// there.
  final Set<String> revisitedSystems;

  bool get changedAnything => removals.isNotEmpty;

  int get removedBodies =>
      removals.where((RouteRemoval r) => !r.isWholeSystem).length;

  int get removedSystems =>
      removals.where((RouteRemoval r) => r.isWholeSystem).length;

  /// Value the filter took off the route, in credits.
  int get removedValueCr =>
      removals.fold<int>(0, (int sum, RouteRemoval r) => sum + r.valueCr);

  /// Whether there is anything left to do at all.
  bool get isExhausted => filtered.waypoints
      .every((RouteWaypoint w) => w.bodies.isEmpty);

  @override
  List<Object?> get props =>
      <Object?>[original, filtered, removals, revisitedSystems];
}
