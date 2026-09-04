import 'package:elite_dangerous/features/route_planning/domain/entities/route_progress.dart';
import 'package:elite_dangerous/features/route_planning/presentation/bloc/route_tracking_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

/// Reads the tracking bloc from inside the route page's own provider.
///
/// Asserting on the bloc rather than on rendered strings: the figures are what
/// the scenario is about, and a test that matched "2 / 4" would break the day
/// somebody puts a space around the slash.
RouteProgress routeProgressOf(WidgetTester tester) {
  final Finder finder = find.byType(ListView);
  expect(
    finder,
    findsWidgets,
    reason: "L'écran de route doit être ouvert avant cette étape.",
  );
  final RouteTrackingState state =
      BlocProvider.of<RouteTrackingBloc>(tester.element(finder.first)).state;
  final RouteProgress? progress = state.progress;
  expect(progress, isNotNull, reason: 'Aucune route active à l\'écran.');
  return progress!;
}
