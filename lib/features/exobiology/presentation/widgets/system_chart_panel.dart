import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/error/failure.dart';
import '../../../../design_system/design_system.dart';
import '../../../journal/domain/entities/system_survey.dart';
import '../../../system_lookup/domain/entities/body_landmarks.dart';
import '../../../system_lookup/domain/entities/charted_system.dart';
import '../../../system_lookup/presentation/bloc/system_chart_bloc.dart';
import '../../domain/entities/exobiology_catalog.dart';
import '../../domain/entities/organic_species.dart';
import 'credits_format.dart';

/// What everyone else has already found here.
///
/// The rest of the Terrain page reads files this commander's own game wrote.
/// This panel is the one thing on it that leaves the machine, and it does so
/// only when the button below is pressed. That is not timidity: Spansh
/// publishes no rate limit and no terms of service, so the only volume this
/// app can defend is the one the commander explicitly asked for.
///
/// What it adds is the half the journal structurally cannot know: the journal
/// records what its owner pointed the FSS at, and Spansh records what every
/// commander who ever came here reported — including the *species*, which no
/// amount of scanning reveals until you are standing on top of it.
class SystemChartPanel extends StatefulWidget {
  const SystemChartPanel({
    required this.id64,
    required this.systemName,
    required this.survey,
    required this.catalog,
    super.key,
  });

  /// The `SystemAddress` from the journal, or null when the position carries
  /// no address — an old journal, or no position at all.
  final int? id64;

  final String? systemName;

  /// What this commander's own journal says, so the two can be compared.
  final SystemSurvey survey;

  /// Prices the species and gives their colony range.
  final ExobiologyCatalog catalog;

  @override
  State<SystemChartPanel> createState() => _SystemChartPanelState();
}

class _SystemChartPanelState extends State<SystemChartPanel> {
  late final SystemChartBloc _bloc = getIt<SystemChartBloc>();

  @override
  void initState() {
    super.initState();
    _retarget();
  }

  @override
  void didUpdateWidget(SystemChartPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    // The commander jumped. Told rather than polled: this panel is rebuilt
    // whenever the Terrain page is, and re-sending the same address on every
    // rebuild would be a side effect in `build`.
    if (oldWidget.id64 != widget.id64) {
      _retarget();
    }
  }

  void _retarget() => _bloc.add(
        SystemChartTargetChanged(
          id64: widget.id64,
          systemName: widget.systemName,
        ),
      );

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SystemChartBloc>.value(
      value: _bloc,
      child: _SystemChartView(survey: widget.survey, catalog: widget.catalog),
    );
  }
}

class _SystemChartView extends StatelessWidget {
  const _SystemChartView({required this.survey, required this.catalog});

  final SystemSurvey survey;
  final ExobiologyCatalog catalog;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SystemChartBloc, SystemChartState>(
      builder: (BuildContext context, SystemChartState state) {
        if (!state.isSupported) {
          return const SizedBox.shrink();
        }
        return EdPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const EdSubHeader('Relevé de la communauté'),
              const SizedBox(height: EdSpacing.xs),
              _Intro(state: state),
              const SizedBox(height: EdSpacing.sm),
              _Actions(state: state),
              if (state.failure case final Failure failure) ...<Widget>[
                const SizedBox(height: EdSpacing.sm),
                _FailureNote(failure: failure),
              ],
              if (state.system case final ChartedSystem system) ...<Widget>[
                const SizedBox(height: EdSpacing.md),
                _Summary(system: system),
                const SizedBox(height: EdSpacing.sm),
                _Bodies(system: system, survey: survey, catalog: catalog),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _Intro extends StatelessWidget {
  const _Intro({required this.state});

  final SystemChartState state;

  @override
  Widget build(BuildContext context) {
    if (state.id64 == null) {
      return const Text(
        // Not a failure: a journal from before Frontier added SystemAddress to
        // this event, or simply no position at all.
        'Aucun identifiant de système dans le journal. Spansh ne répond qu\'à '
        'un id64, jamais à un nom : deux systèmes peuvent porter le même.',
        style: EdTypography.bodySmall,
      );
    }
    if (!state.hasAnswer) {
      return const Text(
        'Spansh sait ce que les autres commandants ont relevé ici — les corps '
        'que vous n\'avez pas scannés, et les espèces exactes avec leurs '
        'coordonnées. Rien n\'est demandé sans votre accord.',
        style: EdTypography.bodySmall,
      );
    }
    return const SizedBox.shrink();
  }
}

class _Actions extends StatelessWidget {
  const _Actions({required this.state});

  final SystemChartState state;

  @override
  Widget build(BuildContext context) {
    if (!state.canAsk) {
      return const SizedBox.shrink();
    }

    final SystemChartBloc bloc = context.read<SystemChartBloc>();

    return Wrap(
      spacing: EdSpacing.sm,
      runSpacing: EdSpacing.xs,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        FilledButton.icon(
          onPressed: state.isLoading
              ? null
              : () => bloc.add(SystemChartRequested(refresh: state.hasAnswer)),
          icon: state.isLoading
              ? const SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.travel_explore, size: 16),
          label: Text(
            state.hasAnswer ? 'Redemander à Spansh' : 'Interroger Spansh',
          ),
        ),
        if (state.system case final ChartedSystem system)
          Text(_freshness(system), style: EdTypography.caption),
      ],
    );
  }

  /// Says where the answer came from and when.
  ///
  /// A cached answer and a fresh one look identical on screen otherwise, and
  /// the difference decides whether a missing body means "nobody has been
  /// here" or "nobody had been here two weeks ago".
  static String _freshness(ChartedSystem system) {
    final String origin = system.fromCache ? 'en cache' : 'reçu à l\'instant';
    final DateTime at = system.fetchedAt.toLocal();
    final String date = '${at.day.toString().padLeft(2, '0')}/'
        '${at.month.toString().padLeft(2, '0')} '
        '${at.hour.toString().padLeft(2, '0')}:'
        '${at.minute.toString().padLeft(2, '0')}';
    return '$origin · $date';
  }
}

class _FailureNote extends StatelessWidget {
  const _FailureNote({required this.failure});

  final Failure failure;

  @override
  Widget build(BuildContext context) => EdCallout.warning(
        title: 'Spansh injoignable',
        child: Text(
          '${failure.message}\n'
          'Le reste de cette page ne dépend pas de Spansh : ce que votre '
          'journal sait reste affiché.',
          style: EdTypography.bodySmall,
        ),
      );
}

class _Summary extends StatelessWidget {
  const _Summary({required this.system});

  final ChartedSystem system;

  @override
  Widget build(BuildContext context) {
    final List<String> genera = system.genusNames;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          <String>[
            '${system.bodies.length} corps connus',
            if (system.bodyCount case final int count) 'sur $count relevés',
            '${system.bodiesWithBiology.length} avec de la biologie',
          ].join(' · '),
          style: EdTypography.bodySmall,
        ),
        if (genera.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: EdSpacing.xxs),
            child: Text(
              'Genres présents : ${genera.join(', ')}',
              style: EdTypography.caption,
            ),
          ),
      ],
    );
  }
}

class _Bodies extends StatelessWidget {
  const _Bodies({
    required this.system,
    required this.survey,
    required this.catalog,
  });

  final ChartedSystem system;
  final SystemSurvey survey;
  final ExobiologyCatalog catalog;

  @override
  Widget build(BuildContext context) {
    final List<ChartedBody> bodies = system.bodiesWithBiology;
    if (bodies.isEmpty) {
      return const Text(
        'Aucun signal biologique relevé ici par la communauté. Ce qui ne veut '
        'pas dire qu\'il n\'y en a pas : cela veut dire que personne ne l\'a '
        'encore signalé.',
        style: EdTypography.bodySmall,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (final ChartedBody body in bodies)
          _BodyCard(
            body: body,
            known: _knownToJournal(body),
            catalog: catalog,
          ),
      ],
    );
  }

  /// The matching body in this commander's own journal, if they have seen it.
  ///
  /// Matched on the in-system body id first, which is the only key both
  /// sources agree on; the name is a fallback for bodies the journal only ever
  /// named.
  SurveyBody? _knownToJournal(ChartedBody body) {
    if (body.bodyId case final int id) {
      final SurveyBody? byId = survey.bodies
          .where((SurveyBody candidate) => candidate.bodyId == id)
          .firstOrNull;
      if (byId != null) {
        return byId;
      }
    }
    return survey.bodies
        .where((SurveyBody candidate) => candidate.name == body.name)
        .firstOrNull;
  }
}

class _BodyCard extends StatelessWidget {
  const _BodyCard({
    required this.body,
    required this.known,
    required this.catalog,
  });

  final ChartedBody body;
  final SurveyBody? known;
  final ExobiologyCatalog catalog;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SystemChartBloc, SystemChartState>(
      builder: (BuildContext context, SystemChartState state) {
        final BodyLandmarks? landmarks = state.landmarksFor(body);
        final bool pending = state.isPending(body);

        return Padding(
          padding: const EdgeInsets.only(bottom: EdSpacing.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(body.name, style: EdTypography.bodySmall),
              Text(_detail(body), style: EdTypography.caption),
              const SizedBox(height: EdSpacing.xxs),
              Wrap(
                spacing: EdSpacing.xs,
                runSpacing: EdSpacing.xs,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  if (body.landable) const EdTag(label: 'posable'),
                  if (known == null)
                    const EdTag(
                      // The whole reason to ask a third party: this body is
                      // down there and the commander has never scanned it.
                      label: 'absent de votre journal',
                      background: EdColors.tagGoldFill,
                      foreground: EdColors.gold,
                    )
                  else if (known!.organismsCompleted > 0)
                    EdTag(label: '${known!.organismsCompleted} déjà analysé(s)'),
                  if (landmarks == null)
                    TextButton.icon(
                      onPressed: pending
                          ? null
                          : () => context
                              .read<SystemChartBloc>()
                              .add(SystemChartBodyRequested(body)),
                      icon: pending
                          ? const SizedBox(
                              width: 12,
                              height: 12,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.biotech_outlined, size: 14),
                      label: const Text('Espèces exactes'),
                    ),
                ],
              ),
              if (landmarks != null)
                _Landmarks(landmarks: landmarks, catalog: catalog),
            ],
          ),
        );
      },
    );
  }

  static String _detail(ChartedBody body) => <String>[
        if (body.subType case final String subType) subType,
        '${body.biologicalSignals} signal(aux)',
        if (body.genusNames.isNotEmpty) body.genusNames.join(', '),
        if (body.distanceFromArrivalLs case final double distance)
          '${distance.round()} Ls',
        if (body.gravityG case final double gravity)
          '${gravity.toStringAsFixed(2)} g',
        if (body.surfaceTemperatureK case final double temperature)
          '${temperature.round()} K',
      ].join(' · ');
}

class _Landmarks extends StatelessWidget {
  const _Landmarks({required this.landmarks, required this.catalog});

  final BodyLandmarks landmarks;
  final ExobiologyCatalog catalog;

  @override
  Widget build(BuildContext context) {
    if (landmarks.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: EdSpacing.xxs),
        child: Text(
          'Des signaux, mais aucune espèce identifiée par la communauté : '
          'personne n\'est encore descendu.',
          style: EdTypography.caption,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: EdSpacing.xs, left: EdSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (final SpeciesSighting sighting in landmarks.species)
            _SpeciesLine(sighting: sighting, catalog: catalog),
          Padding(
            padding: const EdgeInsets.only(top: EdSpacing.xxs),
            child: Text(
              'Total sur ce corps : '
              '${formatCreditsExact(landmarks.totalValueCr)}',
              style: EdTypography.caption.copyWith(color: EdColors.gold),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpeciesLine extends StatelessWidget {
  const _SpeciesLine({required this.sighting, required this.catalog});

  final SpeciesSighting sighting;
  final ExobiologyCatalog catalog;

  @override
  Widget build(BuildContext context) {
    final OrganicSpecies? known = catalog.speciesByName(sighting.species);
    final int? colonyRange =
        known == null ? null : catalog.colonyRangeFor(known.id);

    return Padding(
      padding: const EdgeInsets.only(bottom: EdSpacing.xxs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            <String>[
              sighting.species,
              if (sighting.variant case final String variant) variant,
            ].join(' · '),
            style: EdTypography.bodySmall.copyWith(color: EdColors.greenBright),
          ),
          Text(
            <String>[
              formatCreditsExact(sighting.valueCr),
              // The number that decides how far the commander walks between
              // two samples, and the most common reason a sampling run fails.
              if (colonyRange != null) '$colonyRange m entre échantillons',
              '${sighting.sightings} relevé(s)',
            ].join(' · '),
            style: EdTypography.caption,
          ),
          if (sighting.locations.isNotEmpty)
            Text(
              'Repère : ${_coordinates(sighting.locations.first)}',
              style: EdTypography.caption,
            ),
        ],
      ),
    );
  }

  static String _coordinates(SurfaceLocation location) =>
      '${location.latitude.toStringAsFixed(4)} · '
      '${location.longitude.toStringAsFixed(4)}';
}
