import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../design_system/design_system.dart';
import '../../domain/entities/route_progress.dart';
import '../bloc/route_tracking_bloc.dart';
import '../widgets/bridge_link.dart';
import '../widgets/route_composer_form.dart';
import '../widgets/route_progress_panel.dart';
import '../widgets/shared_route_banner.dart';

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
        if (state.failure case final failure? when !state.isStale) {
          return EdErrorView(
            // Three different problems with three different fixes: a sleeping
            // PC, one answering in a shape this version cannot read, and a
            // journal this device cannot fold. Naming the wrong one sends the
            // commander to a firewall that is working fine.
            title: switch (state) {
              RouteTrackingState(isUnreachable: true) =>
                'Machine de jeu injoignable',
              RouteTrackingState(isUnpaired: true) => 'Appairage à refaire',
              RouteTrackingState(isIncompatible: true) => 'Réponse illisible',
              _ => 'Route illisible',
            },
            message: failure.message,
            onRetry: () => context
                .read<RouteTrackingBloc>()
                .add(const RouteTrackingRefreshed()),
          );
        }
        if (state.progress case final RouteProgress progress) {
          return _FollowView(state: state, progress: progress);
        }
        if (state.isShared) {
          // Reachable, and flying nothing. Offering the composer here would let
          // a phone start a route the game machine never hears about.
          return _SharedIdleView(host: state.host ?? '');
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
              const BridgeLinkButton(
                tooltip: 'Partager avec un autre écran',
              ),
              if (state.canEditRoute)
                TextButton(
                  onPressed: () => _confirmAbandon(context, bloc),
                  child: const Text('Abandonner'),
                ),
            ],
          ),
          const SizedBox(height: 12),
          if (state.isShared && state.host != null) ...<Widget>[
            SharedRouteBanner(
              host: state.host!,
              age: state.age,
              isStale: state.isStale,
              onRefresh: () => bloc.add(const RouteTrackingRefreshed()),
            ),
            const SizedBox(height: 12),
          ],
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

/// A second screen whose game machine is reachable and flying nothing.
///
/// Deliberately not the composer: a route started here would live on this
/// device's disk, and the machine that reads the journal would never know about
/// it. The commander composes on the game machine, and this screen picks it up
/// on its next read.
class _SharedIdleView extends StatelessWidget {
  const _SharedIdleView({required this.host});

  final String host;

  @override
  Widget build(BuildContext context) {
    final RouteTrackingBloc bloc = context.read<RouteTrackingBloc>();

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      children: <Widget>[
        const EdPageHeader(
          kicker: 'Second écran',
          title: 'Aucune route en cours',
          deck: 'La machine de jeu répond, mais elle ne suit aucune route '
              'pour le moment.',
        ),
        const SizedBox(height: 16),
        if (host.isNotEmpty) ...<Widget>[
          SharedRouteBanner(
            host: host,
            age: null,
            onRefresh: () => bloc.add(const RouteTrackingRefreshed()),
          ),
          const SizedBox(height: 16),
        ],
        const EdCallout.info(
          title: 'Composer une route',
          child: Text(
            'Une route se compose sur la machine qui fait tourner le jeu : '
            'elle seule lit le journal. Cet écran la reprendra dès qu\'elle '
            'sera lancée.',
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () => openBridgePairing(context),
            icon: const Icon(Icons.devices_outlined, size: 16),
            label: const Text('Gérer l\'appairage'),
          ),
        ),
      ],
    );
  }
}
