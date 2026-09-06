import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/route_plan.dart';
import '../entities/route_request.dart';
import '../repositories/route_planner_repository.dart';

/// Plots a route for this session.
@injectable
class PlanRoute extends UseCase<RoutePlan, RouteRequest> {
  const PlanRoute(this._repository);

  final RoutePlannerRepository _repository;

  @override
  Future<Result<RoutePlan>> call(RouteRequest input) =>
      _repository.plan(input);
}

class StoredRouteInput extends Equatable {
  const StoredRouteInput({required this.jobId, required this.request});

  final String jobId;

  /// What produced [jobId]. Spansh's results endpoint echoes the parameters it
  /// received, but in its own wire shape and with its own defaults filled in;
  /// carrying the original request is both cheaper and truer.
  final RouteRequest request;

  @override
  List<Object?> get props => <Object?>[jobId, request];
}

/// Re-reads a route Spansh has already computed.
@injectable
class ReadPlannedRoute extends UseCase<RoutePlan, StoredRouteInput> {
  const ReadPlannedRoute(this._repository);

  final RoutePlannerRepository _repository;

  @override
  Future<Result<RoutePlan>> call(StoredRouteInput input) =>
      _repository.results(input.jobId, input.request);
}

/// Whether this build can plot routes at all.
@injectable
class CanPlanRoutes {
  const CanPlanRoutes(this._repository);

  final RoutePlannerRepository _repository;

  bool call() => _repository.isSupported;
}
