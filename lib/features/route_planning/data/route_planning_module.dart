import 'package:injectable/injectable.dart';

import '../domain/services/done_index_builder.dart';
import '../domain/services/route_duration_estimator.dart';
import '../domain/services/route_filter.dart';
import '../domain/services/route_progress_calculator.dart';
import '../domain/services/session_pace_calibrator.dart';

/// Registers the route-planning domain services, which carry no framework
/// annotations so the domain layer stays free of `injectable`.
@module
abstract class RoutePlanningModule {
  @lazySingleton
  RouteProgressCalculator get progressCalculator =>
      const RouteProgressCalculator();

  @lazySingleton
  DoneIndexBuilder get doneIndexBuilder => const DoneIndexBuilder();

  @lazySingleton
  RouteFilter get routeFilter => const RouteFilter();

  @lazySingleton
  SessionPaceCalibrator get paceCalibrator => const SessionPaceCalibrator();

  @lazySingleton
  RouteDurationEstimator get durationEstimator =>
      const RouteDurationEstimator();
}
