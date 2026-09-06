import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../bloc/route_tracking_bloc.dart';

/// Opens the pairing screen, and re-reads the route on the way back.
///
/// The re-read is the point. Pairing — or forgetting a pairing — changes which
/// machine the follow screen reads, and nothing else would tell it: the poll
/// timer runs only on a second screen, so a commander who has just unpaired
/// would keep looking at the other machine's route until they refreshed by
/// hand.
///
/// Always rendered inside [RoutesPage]'s provider, which is where the bloc it
/// notifies comes from.
class BridgeLinkButton extends StatelessWidget {
  const BridgeLinkButton({required this.tooltip, super.key});

  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: () => openBridgePairing(context),
      icon: const Icon(Icons.devices_outlined),
    );
  }
}

/// Same navigation, for callers that want their own affordance.
Future<void> openBridgePairing(BuildContext context) async {
  final RouteTrackingBloc bloc = context.read<RouteTrackingBloc>();
  await context.push(AppRoutes.routeBridge);
  if (!bloc.isClosed) {
    bloc.add(const RouteTrackingRefreshed());
  }
}
