import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/format/credits.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../design_system/design_system.dart';
import '../../domain/entities/filtered_route.dart';
import '../../domain/entities/route_request.dart';
import '../../domain/services/route_duration_estimator.dart';
import '../bloc/route_planner_bloc.dart';
import '../bloc/route_tracking_bloc.dart';
import 'bridge_link.dart';
import 'route_progress_panel.dart';

/// Composing a route: a form, then a proposal to accept or throw away.
class RouteComposerForm extends StatelessWidget {
  const RouteComposerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RoutePlannerBloc>(
      create: (_) =>
          getIt<RoutePlannerBloc>()..add(const RoutePlannerStarted()),
      child: const _ComposerView(),
    );
  }
}

class _ComposerView extends StatelessWidget {
  const _ComposerView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoutePlannerBloc, RoutePlannerState>(
      listenWhen: (RoutePlannerState a, RoutePlannerState b) =>
          !a.isStarted && b.isStarted,
      listener: (BuildContext context, RoutePlannerState state) {
        // Accepting a route makes it the active one, so the screen behind us
        // has to go and read it again.
        context.read<RouteTrackingBloc>().add(const RouteTrackingRefreshed());
      },
      builder: (BuildContext context, RoutePlannerState state) {
        if (state.isLoading) {
          return const EdLoadingView(message: 'Lecture de votre rythme…');
        }
        if (!state.isSupported) {
          return const EdEmptyView(
            title: 'Indisponible sur cette cible',
            // Spansh sends no CORS headers, so a browser refuses the request
            // before it leaves. Saying so beats a request that never returns.
            message: 'Le calcul de route passe par Spansh, que le navigateur '
                'refuse de contacter. Utilisez l\'application de bureau ou '
                'mobile.',
            icon: Icons.public_off,
          );
        }
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          children: <Widget>[
            const EdPageHeader(
              kicker: 'Composer',
              title: 'Une route pour ce soir',
              deck: 'Le temps disponible décide de la taille ; ce qui est déjà '
                  'analysé est retiré avant affichage.',
              actions: <Widget>[
                BridgeLinkButton(
                  tooltip: 'Suivre la route d\'une autre machine',
                ),
              ],
            ),
            const SizedBox(height: 16),
            _FormPanel(state: state),
            if (state.failure case final failure?) ...<Widget>[
              const SizedBox(height: 12),
              EdCallout.warning(
                title: 'Calcul impossible',
                child: Text(failure.message),
              ),
            ],
            if (state.route case final FilteredRoute route) ...<Widget>[
              const SizedBox(height: 20),
              _Proposal(route: route, state: state),
            ],
          ],
        );
      },
    );
  }
}

class _FormPanel extends StatelessWidget {
  const _FormPanel({required this.state});

  final RoutePlannerState state;

  @override
  Widget build(BuildContext context) {
    final RoutePlannerBloc bloc = context.read<RoutePlannerBloc>();
    final RouteRequest request = state.request;

    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SegmentedButton<RouteObjective>(
            segments: const <ButtonSegment<RouteObjective>>[
              ButtonSegment<RouteObjective>(
                value: RouteObjective.exobiology,
                label: Text('Exobiologie'),
              ),
              ButtonSegment<RouteObjective>(
                value: RouteObjective.riches,
                label: Text('Exploration'),
              ),
            ],
            selected: <RouteObjective>{request.objective},
            onSelectionChanged: (Set<RouteObjective> selection) =>
                bloc.add(RoutePlannerFormChanged(
              request: request.copyWith(objective: selection.first),
            )),
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: request.fromSystem,
            decoration: const InputDecoration(
              labelText: 'Système de départ',
              helperText: 'Pré-rempli depuis le journal',
            ),
            onChanged: (String value) => bloc.add(
              RoutePlannerFormChanged(
                request: request.copyWith(fromSystem: value),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _SliderRow(
            label: 'Portée de saut',
            value: request.jumpRangeLy,
            min: 10,
            max: 90,
            suffix: 'al',
            onChanged: (double value) => bloc.add(
              RoutePlannerFormChanged(
                request: request.copyWith(jumpRangeLy: value),
              ),
            ),
          ),
          _SliderRow(
            label: 'Rayon de recherche',
            value: request.radiusLy,
            min: 20,
            max: 500,
            suffix: 'al',
            onChanged: (double value) => bloc.add(
              RoutePlannerFormChanged(
                request: request.copyWith(radiusLy: value),
              ),
            ),
          ),
          _SliderRow(
            label: 'Temps disponible',
            value: state.available.inMinutes.toDouble(),
            min: 30,
            max: 480,
            suffix: 'min',
            onChanged: (double value) => bloc.add(
              RoutePlannerFormChanged(
                available: Duration(minutes: value.round()),
              ),
            ),
          ),
          _SliderRow(
            label: 'Systèmes',
            value: request.maxSystems.toDouble(),
            min: 1,
            max: 40,
            suffix: '',
            onChanged: (double value) => bloc.add(
              RoutePlannerFormChanged(
                request: request.copyWith(maxSystems: value.round()),
              ),
            ),
          ),
          Text(
            'Votre rythme suggère ${state.suggestedSystems} système(s) pour '
            '${formatDuration(state.available)}. ${state.pace.source.label}.',
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: EdColors.textMuted),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Revenir au point de départ'),
            value: request.loop,
            onChanged: (bool value) => bloc.add(
              RoutePlannerFormChanged(request: request.copyWith(loop: value)),
            ),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Éviter les Thargoïdes'),
            value: request.avoidThargoids,
            onChanged: (bool value) => bloc.add(
              RoutePlannerFormChanged(
                request: request.copyWith(avoidThargoids: value),
              ),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: state.isComputing
                ? null
                : () => bloc.add(const RoutePlannerComputed()),
            icon: state.isComputing
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.route),
            label: Text(
              state.isComputing ? 'Spansh calcule…' : 'Calculer la route',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            // Never automatic, and the screen says why.
            'Une requête part vers Spansh à cet appui, et seulement à cet appui.',
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: EdColors.textMuted),
          ),
        ],
      ),
    );
  }
}

class _SliderRow extends StatelessWidget {
  const _SliderRow({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.suffix,
    required this.onChanged,
  });

  final String label;
  final double value;
  final double min;
  final double max;
  final String suffix;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(label, style: Theme.of(context).textTheme.labelMedium),
            ),
            Text(
              suffix.isEmpty
                  ? '${value.round()}'
                  : '${value.round()} $suffix',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: EdColors.gold),
            ),
          ],
        ),
        Slider(
          value: value.clamp(min, max),
          min: min,
          max: max,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _Proposal extends StatelessWidget {
  const _Proposal({required this.route, required this.state});

  final FilteredRoute route;
  final RoutePlannerState state;

  @override
  Widget build(BuildContext context) {
    final RoutePlannerBloc bloc = context.read<RoutePlannerBloc>();
    final SessionReach? reach = state.reach;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const EdSectionHeader(title: 'Proposition'),
        const SizedBox(height: 10),
        AdaptiveGrid(
          children: <Widget>[
            EdStatTile(
              label: 'Systèmes',
              value: '${route.filtered.systemCount}',
              hint: '${route.filtered.totalJumps} sauts',
            ),
            EdStatTile(
              label: 'Corps',
              value: '${route.filtered.totalBodies}',
            ),
            EdStatTile(
              label: 'Valeur exobiologie',
              value: formatCredits(route.filtered.totalLandmarkValueCr),
              hint: 'Base, hors bonus',
            ),
            if (reach != null)
              EdStatTile(
                label: 'Durée estimée',
                value: formatDuration(reach.estimate.total),
                hint: reach.coversWholeRoute
                    ? 'La route tient dans la soirée'
                    : 'Environ ${reach.lastWaypointIndex} étape(s) ce soir',
                valueColor:
                    reach.coversWholeRoute ? EdColors.green : EdColors.gold,
              ),
          ],
        ),
        if (route.changedAnything) ...<Widget>[
          const SizedBox(height: 12),
          EdCallout.tip(
            // What was removed is said, never silently dropped: a route that
            // shrinks without explanation reads as a bug.
            title: 'Déjà fait, retiré de la route',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${route.removedBodies} corps et ${route.removedSystems} '
                  'système(s) retirés, soit '
                  '${formatCredits(route.removedValueCr)} déjà acquis.',
                ),
                const SizedBox(height: 6),
                for (final RouteRemoval removal in route.removals.take(6))
                  Text(
                    '· ${removal.bodyName ?? removal.systemName} — '
                    '${removal.reason.label}',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: EdColors.textMuted),
                  ),
              ],
            ),
          ),
        ],
        if (route.revisitedSystems.isNotEmpty) ...<Widget>[
          const SizedBox(height: 12),
          EdCallout.info(
            title: 'Systèmes déjà traversés',
            child: Text(
              // Reported, never removed: having flown through a system says
              // nothing about having sampled it.
              '${route.revisitedSystems.length} système(s) de cette route ont '
              'déjà été visités. Ils sont conservés : y être passé ne dit rien '
              'de ce qui y a été échantillonné.',
            ),
          ),
        ],
        if (route.isExhausted) ...<Widget>[
          const SizedBox(height: 12),
          const EdCallout.warning(
            title: 'Rien à y faire',
            child: Text(
              'Tout ce que cette route proposait est déjà analysé. Élargir le '
              'rayon, ou baisser la valeur minimale.',
            ),
          ),
        ],
        const SizedBox(height: 16),
        Row(
          children: <Widget>[
            FilledButton(
              onPressed: route.isExhausted
                  ? null
                  : () => bloc.add(const RoutePlannerAccepted()),
              child: const Text('Suivre cette route'),
            ),
            const SizedBox(width: 12),
            TextButton(
              onPressed: () => bloc.add(const RoutePlannerDiscarded()),
              child: const Text('Recommencer'),
            ),
          ],
        ),
      ],
    );
  }
}
