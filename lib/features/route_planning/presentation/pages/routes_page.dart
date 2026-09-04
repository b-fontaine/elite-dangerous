import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/di/injection.dart';
import '../../../../design_system/design_system.dart';
import '../../domain/entities/route_progress.dart';
import '../bloc/route_tracking_bloc.dart';
import '../widgets/route_composer_form.dart';
import '../widgets/route_progress_panel.dart';

/// The route screen: what is being flown, or the form to compose one.
///
/// One page rather than two destinations, because the commander only ever has
/// one of the two questions: *where am I on my route* while flying, and *what
/// should tonight look like* before starting. Making them separate tabs would
/// mean picking the right one before knowing which state they are in.
class RoutesPage extends StatelessWidget {
  const RoutesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RouteTrackingBloc>(
      create: (_) =>
          getIt<RouteTrackingBloc>()..add(const RouteTrackingStarted()),
      child: const _RoutesView(),
    );
  }
}

class _RoutesView extends StatelessWidget {
  const _RoutesView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteTrackingBloc, RouteTrackingState>(
      builder: (BuildContext context, RouteTrackingState state) {
        if (state.isLoading) {
          return const EdLoadingView(message: 'Lecture de la route…');
        }
        if (state.failure case final failure?) {
          return EdErrorView(
            title: 'Route illisible',
            message: failure.message,
            onRetry: () => context
                .read<RouteTrackingBloc>()
                .add(const RouteTrackingRefreshed()),
          );
        }
        if (state.progress case final RouteProgress progress) {
          return _FollowView(state: state, progress: progress);
        }
        // No route being flown: compose one. Not an empty state — this is the
        // screen's normal starting point.
        return const RouteComposerForm();
      },
    );
  }
}

class _FollowView extends StatelessWidget {
  const _FollowView({required this.state, required this.progress});

  final RouteTrackingState state;
  final RouteProgress progress;

  @override
  Widget build(BuildContext context) {
    final RouteTrackingBloc bloc = context.read<RouteTrackingBloc>();

    return RefreshIndicator(
      onRefresh: () async => bloc.add(const RouteTrackingRefreshed()),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: <Widget>[
          EdPageHeader(
            kicker: 'Route en cours',
            title: progress.plan.request.fromSystem,
            deck: progress.isComplete
                ? 'Tout est fait. Il reste à vendre.'
                : 'Étape ${progress.currentIndex + 1} sur '
                    '${progress.plan.waypoints.length}',
            actions: <Widget>[
              IconButton(
                tooltip: 'Partager avec un autre écran',
                onPressed: () => context.push(AppRoutes.routeBridge),
                icon: const Icon(Icons.devices_outlined),
              ),
              TextButton(
                onPressed: () => _confirmAbandon(context, bloc),
                child: const Text('Abandonner'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          RouteHeadline(
            progress: progress,
            pace: state.pace,
            remaining: state.remaining,
          ),
          const SizedBox(height: 16),
          EdPanel(
            child: RouteJumpBar(
              done: progress.jumpsDone,
              total: progress.plan.totalJumps,
            ),
          ),
          if (progress.unattributedSamples > 0) ...<Widget>[
            const SizedBox(height: 12),
            EdCallout.warning(
              // Surfaced rather than dropped: silently losing a commander's
              // work is the one error they would notice and could not explain.
              title: 'Échantillons non rattachés',
              child: Text(
                '${progress.unattributedSamples} organisme(s) échantillonné(s) '
                'sur un corps que le journal importé ne nomme pas. Importer '
                'les journaux plus anciens les rattacherait.',
              ),
            ),
          ],
          const SizedBox(height: 20),
          const EdSectionHeader(title: 'Étapes'),
          const SizedBox(height: 8),
          for (int i = 0; i < progress.waypoints.length; i++) ...<Widget>[
            RouteWaypointCard(
              waypoint: progress.waypoints[i],
              isCurrent: i == progress.currentIndex,
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }

  Future<void> _confirmAbandon(
    BuildContext context,
    RouteTrackingBloc bloc,
  ) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Abandonner cette route ?'),
        content: const Text(
          'Elle reste consultable dans les archives, et rien de ce qui a été '
          'échantillonné n\'est perdu.',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Continuer'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Abandonner'),
          ),
        ],
      ),
    );
    if (confirmed ?? false) {
      bloc.add(const RouteTrackingAbandoned());
    }
  }
}
