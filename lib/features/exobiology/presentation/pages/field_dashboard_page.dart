import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../core/responsive/window_size.dart';
import '../../../../design_system/design_system.dart';
import '../../../journal/domain/entities/exobiology_activity.dart';
import '../../../journal/domain/entities/game_status.dart';
import '../../../journal/domain/entities/live_game_state.dart';
import '../../../journal/domain/entities/system_survey.dart';
import '../bloc/field_report_bloc.dart';
import '../widgets/credits_format.dart';

/// The live view: where the commander is standing, and what is left to do
/// within walking distance of it.
///
/// Everything here is read from the two things the game writes to disk — the
/// journal and `Status.json`. Nothing is fetched, and nothing is guessed: a
/// figure the files do not support is shown as unknown rather than estimated,
/// because this screen is read while flying and a wrong number costs a
/// landing.
class FieldDashboardPage extends StatelessWidget {
  const FieldDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FieldReportBloc>(
      create: (_) => getIt<FieldReportBloc>()..add(const FieldReportStarted()),
      child: const _FieldDashboardView(),
    );
  }
}

class _FieldDashboardView extends StatelessWidget {
  const _FieldDashboardView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldReportBloc, FieldReportState>(
      builder: (BuildContext context, FieldReportState state) {
        if (state.isLoading && !state.hasAnything) {
          return const EdLoadingView(message: 'Lecture des fichiers du jeu…');
        }
        return _Body(state: state);
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});

  final FieldReportState state;

  @override
  Widget build(BuildContext context) {
    final SystemSurvey survey = state.survey;

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: EdPageHeader(
            kicker: state.live.tracking.label,
            title: 'Terrain',
            deck: _deck(state),
            actions: <Widget>[
              if (state.live.tracking.isReading)
                TextButton.icon(
                  onPressed: state.isRefreshing
                      ? null
                      : () => context.read<FieldReportBloc>().add(
                            const FieldReportRefreshRequested(),
                          ),
                  icon: const Icon(Icons.refresh, size: 16),
                  label: const Text('Relire'),
                ),
            ],
          ),
        ),
        _Section(child: _TrackingNote(state: state)),
        _Section(child: _Readout(state: state)),
        if (state.status case final GameStatus status)
          _Section(child: _WhereAmI(status: status)),
        if (state.currentBody case final SurveyBody body)
          _Section(child: _RightHere(body: body)),
        if (survey.isKnown) _Section(child: _InThisSystem(survey: survey)),
        _Section(child: _UnsoldPanel(state: state)),
        const SliverToBoxAdapter(child: SizedBox(height: EdSpacing.xxxl)),
      ],
    );
  }

  static String _deck(FieldReportState state) {
    final String? system = state.systemName;
    if (system == null) {
      return 'Aucune position connue. Importez un journal, ou lancez le jeu.';
    }
    final String activity =
        state.status?.activity ?? state.session.position.activity;
    final String? body = state.bodyName;
    return body == null ? '$system · $activity' : '$system · $body · $activity';
  }
}

/// The readable column every section of this page sits in.
class _Section extends StatelessWidget {
  const _Section({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: ReadableWidth(
          maxWidth: Breakpoints.contentColumn,
          child: Padding(
            padding: const EdgeInsets.only(top: EdSpacing.lg),
            child: child,
          ),
        ),
      );
}

/// Says plainly why the page is showing what it is showing.
class _TrackingNote extends StatelessWidget {
  const _TrackingNote({required this.state});

  final FieldReportState state;

  @override
  Widget build(BuildContext context) {
    final LiveTracking tracking = state.live.tracking;
    if (tracking.isLive) {
      return const SizedBox.shrink();
    }

    return EdCallout(
      tone: tracking == LiveTracking.idle
          ? EdCalloutTone.info
          : EdCalloutTone.warning,
      title: tracking.label,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(tracking.detail, style: EdTypography.bodySmall),
          if (tracking == LiveTracking.unsupported)
            const Padding(
              padding: EdgeInsets.only(top: EdSpacing.xs),
              child: Text(
                // Dated, because it is a statement about this build and not
                // about the app forever.
                'Au 20 août 2026, seuls Windows, macOS et Linux lisent le '
                'jeu en direct. Ailleurs, cette page montre le dernier '
                'journal importé.',
                style: EdTypography.caption,
              ),
            ),
          if (state.live.directory case final String directory)
            Padding(
              padding: const EdgeInsets.only(top: EdSpacing.xs),
              child: Text(directory, style: EdTypography.caption),
            ),
        ],
      ),
    );
  }
}

/// The four figures worth a glance mid-flight.
class _Readout extends StatelessWidget {
  const _Readout({required this.state});

  final FieldReportState state;

  @override
  Widget build(BuildContext context) {
    final SystemSurvey survey = state.survey;
    final int left = survey.biologicalSignalsLeft;

    return Wrap(
      spacing: EdSpacing.sm,
      runSpacing: EdSpacing.sm,
      children: <Widget>[
        _Tile(
          label: 'Système',
          value: state.systemName ?? '—',
          hint: survey.wasHonked
              ? '${survey.bodyCount} corps annoncés'
              : 'Pas de balayage de découverte',
          icon: Icons.hub_outlined,
        ),
        _Tile(
          label: 'Corps',
          value: state.bodyName ?? '—',
          hint: state.status?.activity ?? state.session.position.activity,
          icon: Icons.public,
        ),
        _Tile(
          label: 'Biologie restante',
          value: '$left',
          hint: left == 0
              ? 'Rien à échantillonner ici'
              : '${survey.landingTargets.length} corps à poser',
          icon: Icons.biotech_outlined,
          valueColor: left > 0 ? EdColors.greenBright : EdColors.textMuted,
        ),
        _Tile(
          label: 'Lecture',
          value: _age(state.age),
          hint: state.live.followedFile ?? '—',
          icon: Icons.schedule,
        ),
      ],
    );
  }

  /// How long ago the game last wrote its state.
  ///
  /// Shown rather than a green "connected" dot: the game only rewrites
  /// `Status.json` when something changes, so twenty quiet minutes at a
  /// station are normal and a light that went out would be a lie.
  static String _age(Duration? age) {
    if (age == null) {
      return '—';
    }
    if (age.inSeconds < 60) {
      return 'à l\'instant';
    }
    if (age.inMinutes < 60) {
      return 'il y a ${age.inMinutes} min';
    }
    if (age.inHours < 24) {
      return 'il y a ${age.inHours} h';
    }
    return 'il y a ${age.inDays} j';
  }
}

/// A stat tile sized so four of them wrap into a phone-friendly grid.
class _Tile extends StatelessWidget {
  const _Tile({
    required this.label,
    required this.value,
    required this.icon,
    this.hint,
    this.valueColor = EdColors.gold,
  });

  final String label;
  final String value;
  final IconData icon;
  final String? hint;
  final Color valueColor;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 210,
        child: EdStatTile(
          label: label,
          value: value,
          hint: hint,
          icon: icon,
          valueColor: valueColor,
        ),
      );
}

/// What `Status.json` says that no other source can.
class _WhereAmI extends StatelessWidget {
  const _WhereAmI({required this.status});

  final GameStatus status;

  @override
  Widget build(BuildContext context) {
    final List<(String, String)> rows = <(String, String)>[
      if (status.hasLatLong &&
          status.latitude != null &&
          status.longitude != null)
        (
          'Coordonnées',
          '${status.latitude!.toStringAsFixed(4)} · '
              '${status.longitude!.toStringAsFixed(4)}',
        ),
      if (status.headingDegrees case final double heading)
        ('Cap', '${heading.round()}°'),
      if (status.altitudeM case final double altitude)
        ('Altitude', '${_metres(altitude.round())} m'),
      if (status.gravityG case final double gravity)
        ('Gravité', '${gravity.toStringAsFixed(2)} g'),
      if (status.temperatureK case final double temperature)
        ('Température', '${temperature.round()} K'),
      if (status.onFoot)
        (
          'Atmosphère',
          status.breathableAtmosphere ? 'respirable' : 'combinaison requise',
        ),
      if (status.destination?.name case final String destination)
        ('Destination', destination),
      if (status.fuelMainT case final double fuel)
        ('Carburant', '${fuel.toStringAsFixed(1)} t'),
    ];

    if (rows.isEmpty) {
      return const SizedBox.shrink();
    }

    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const EdSubHeader('Position'),
          const SizedBox(height: EdSpacing.sm),
          for (final (String label, String value) in rows)
            _LabelledValue(label: label, value: value),
        ],
      ),
    );
  }

  /// Grouped with the same narrow no-break space the credit figures use, so
  /// two numbers side by side on this page are punctuated the same way.
  static String _metres(int value) {
    final String digits = value.abs().toString();
    final StringBuffer out = StringBuffer(value < 0 ? '-' : '');
    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) {
        out.write(thousandsSeparator);
      }
      out.write(digits[i]);
    }
    return out.toString();
  }
}

/// A label on the left, its value on the right, both allowed to wrap.
///
/// Neither half is given a fixed share: on a 360 px window "Coordonnées" and
/// "50.5426 · 137.4150" do not fit on one line, and a plain `Row` overflows by
/// a hundred pixels rather than wrapping. This screen is read on a second
/// monitor as often as on a full one.
class _LabelledValue extends StatelessWidget {
  const _LabelledValue({
    required this.label,
    required this.value,
    this.labelStyle = EdTypography.caption,
    this.valueStyle = EdTypography.bodySmall,
  });

  final String label;
  final String value;
  final TextStyle labelStyle;
  final TextStyle valueStyle;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: EdSpacing.xxs),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: Text(label, style: labelStyle)),
            const SizedBox(width: EdSpacing.sm),
            Flexible(
              child: Text(
                value,
                style: valueStyle,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      );
}

/// The body underfoot, and whether it still owes the commander anything.
class _RightHere extends StatelessWidget {
  const _RightHere({required this.body});

  final SurveyBody body;

  @override
  Widget build(BuildContext context) {
    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          EdSubHeader('Ici — ${body.name}'),
          const SizedBox(height: EdSpacing.xs),
          Wrap(
            spacing: EdSpacing.xs,
            runSpacing: EdSpacing.xs,
            children: <Widget>[
              if (body.scan?.planetClass case final String planetClass)
                EdTag(label: planetClass),
              if (body.landable) const EdTag(label: 'posable'),
              if (body.mapped) const EdTag(label: 'cartographié'),
              if (body.firstDiscovery)
                const EdTag(
                  label: 'première découverte',
                  background: EdColors.tagGoldFill,
                  foreground: EdColors.gold,
                ),
            ],
          ),
          const SizedBox(height: EdSpacing.sm),
          if (!body.hasBiology)
            const Text(
              'Aucun signal biologique relevé sur ce corps.',
              style: EdTypography.bodySmall,
            )
          else ...<Widget>[
            Text(
              '${body.biologicalSignals} signal(aux) · '
              '${body.organismsCompleted} analysé(s) · '
              '${body.biologyLeft} restant(s)',
              style: EdTypography.bodySmall.copyWith(
                color: body.biologyLeft > 0
                    ? EdColors.greenBright
                    : EdColors.textMuted,
              ),
            ),
            if (body.genusNames.isNotEmpty) ...<Widget>[
              const SizedBox(height: EdSpacing.xs),
              Text(
                'Genres relevés : ${body.genusNames.join(', ')}',
                style: EdTypography.caption,
              ),
            ] else if (body.biologyLeft > 0) ...<Widget>[
              const SizedBox(height: EdSpacing.xs),
              const Text(
                // The single most useful instruction this screen can give: the
                // FSS counts the signals, only the DSS names them.
                'Cartographiez ce corps au DSS pour savoir quels genres '
                'chercher plutôt que de survoler au hasard.',
                style: EdTypography.caption,
              ),
            ],
          ],
        ],
      ),
    );
  }
}

/// What the system still holds, beyond the body underfoot.
class _InThisSystem extends StatelessWidget {
  const _InThisSystem({required this.survey});

  final SystemSurvey survey;

  @override
  Widget build(BuildContext context) {
    final List<SurveyBody> landings = survey.landingTargets;
    final List<SurveyBody> mappings = survey.mappingTargets;
    final int? unscanned = survey.unscannedCount;

    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          EdSubHeader('Dans ${survey.systemName ?? 'ce système'}'),
          const SizedBox(height: EdSpacing.sm),
          if (!survey.wasHonked)
            const Text(
              'Pas encore de balayage de découverte : lancez le FSS pour '
              'savoir combien de corps ce système contient.',
              style: EdTypography.bodySmall,
            )
          else
            Text(
              <String>[
                '${survey.scannedCount} corps scanné(s) sur ${survey.bodyCount}',
                if (unscanned != null && unscanned > 0)
                  '$unscanned encore à trouver',
                if (survey.allBodiesFound) 'système complet',
              ].join(' · '),
              style: EdTypography.bodySmall,
            ),
          if (landings.isNotEmpty) ...<Widget>[
            const SizedBox(height: EdSpacing.md),
            const Text('À poser', style: EdTypography.overline),
            const SizedBox(height: EdSpacing.xxs),
            for (final SurveyBody body in landings) _BodyLine(body: body),
          ],
          if (mappings.isNotEmpty) ...<Widget>[
            const SizedBox(height: EdSpacing.md),
            const Text('À cartographier', style: EdTypography.overline),
            const SizedBox(height: EdSpacing.xxs),
            for (final SurveyBody body in mappings) _BodyLine(body: body),
          ],
          if (survey.wasHonked &&
              landings.isEmpty &&
              mappings.isEmpty) ...<Widget>[
            const SizedBox(height: EdSpacing.sm),
            const Text(
              'Rien à échantillonner ici d\'après le journal.',
              style: EdTypography.caption,
            ),
          ],
        ],
      ),
    );
  }
}

class _BodyLine extends StatelessWidget {
  const _BodyLine({required this.body});

  final SurveyBody body;

  @override
  Widget build(BuildContext context) {
    final String detail = <String>[
      if (body.biologicalSignals case final int signals) '$signals signal(aux)',
      if (body.organismsCompleted > 0) '${body.organismsCompleted} fait(s)',
      if (body.genusNames.isNotEmpty) body.genusNames.join(', '),
      if (body.distanceFromArrivalLs case final double distance)
        '${distance.round()} Ls',
    ].join(' · ');

    return Padding(
      padding: const EdgeInsets.only(bottom: EdSpacing.xxs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Icon(
            Icons.chevron_right,
            size: 14,
            color: EdColors.textFainter,
          ),
          const SizedBox(width: EdSpacing.xxs),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(body.name, style: EdTypography.bodySmall),
                if (detail.isNotEmpty)
                  Text(detail, style: EdTypography.caption),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// The hold: what is sampled, complete, and one death away from gone.
class _UnsoldPanel extends StatelessWidget {
  const _UnsoldPanel({required this.state});

  final FieldReportState state;

  @override
  Widget build(BuildContext context) {
    final UnsoldHold hold = state.unsold;
    final List<InProgressOrganism> partial = state.activity.samplesInProgress;

    if (hold.isEmpty && partial.isEmpty) {
      return const EdPanel(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            EdSubHeader('Données non vendues'),
            SizedBox(height: EdSpacing.xs),
            Text(
              'Rien en soute. Tout ce qui a été analysé a été vendu.',
              style: EdTypography.bodySmall,
            ),
          ],
        ),
      );
    }

    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const EdSubHeader('Données non vendues'),
          const SizedBox(height: EdSpacing.xs),
          if (!hold.isEmpty)
            Text(
              '${hold.count} organisme(s) complet(s) · '
              '${formatCreditsExact(hold.valueCr)}',
              style: EdTypography.bodySmall.copyWith(color: EdColors.gold),
            ),
          if (hold.unpriced > 0)
            Padding(
              padding: const EdgeInsets.only(top: EdSpacing.xxs),
              child: Text(
                '${hold.unpriced} organisme(s) absent(s) du catalogue, non '
                'comptés dans ce total.',
                style: EdTypography.caption,
              ),
            ),
          if (partial.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: EdSpacing.xxs),
              child: Text(
                '${partial.length} organisme(s) entamé(s) : '
                '${partial.map((InProgressOrganism o) => '${o.species} '
                    '${o.samplesTaken}/3').join(' · ')}',
                style: EdTypography.caption,
              ),
            ),
          if (!hold.isEmpty) ...<Widget>[
            const SizedBox(height: EdSpacing.sm),
            EdCallout(
              tone: EdCalloutTone.warning,
              title: 'Une mort efface tout',
              child: Text(
                'Les données non vendues disparaissent avec le vaisseau. '
                '${formatCreditsExact(hold.valueCr)} sont en jeu tant que '
                'Vista Genomics n\'a pas été atteint.',
                style: EdTypography.bodySmall,
              ),
            ),
            const SizedBox(height: EdSpacing.sm),
            for (final InProgressOrganism organism in hold.organisms)
              Padding(
                padding: const EdgeInsets.only(bottom: EdSpacing.xxs),
                child: _LabelledValue(
                  label: organism.species,
                  value: formatCreditsExact(
                    state.catalog
                            .speciesByName(organism.species)
                            ?.baseValueCr ??
                        0,
                  ),
                  labelStyle: EdTypography.bodySmall,
                  valueStyle: EdTypography.caption,
                ),
              ),
          ],
        ],
      ),
    );
  }
}
