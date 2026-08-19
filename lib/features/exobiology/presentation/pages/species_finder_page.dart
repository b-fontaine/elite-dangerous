import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/responsive/adaptive.dart';
import '../../../../core/responsive/window_size.dart';
import '../../../../design_system/design_system.dart';
import '../../domain/entities/atmosphere_type.dart';
import '../../domain/entities/body_profile.dart';
import '../../domain/entities/planet_class.dart';
import '../../domain/entities/species_match.dart';
import '../../domain/entities/star_class.dart';
import '../../domain/entities/volcanism_type.dart';
import '../bloc/species_finder_bloc.dart';
import '../widgets/credits_format.dart';
import '../widgets/species_match_card.dart';

/// "What grows here?" — the FSS companion.
class SpeciesFinderPage extends StatelessWidget {
  const SpeciesFinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpeciesFinderBloc>(
      create: (_) =>
          getIt<SpeciesFinderBloc>()..add(const SpeciesFinderStarted()),
      child: const _FinderView(),
    );
  }
}

class _FinderView extends StatelessWidget {
  const _FinderView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeciesFinderBloc, SpeciesFinderState>(
      builder: (BuildContext context, SpeciesFinderState state) {
        final Widget form = _SurveyForm(state: state);
        final Widget results = _Results(state: state);

        return ResponsiveBuilder(
          builder: (BuildContext context, WindowSizeClass size) {
            if (!size.usesTwoPanes) {
              return CustomScrollView(
                slivers: <Widget>[
                  const SliverToBoxAdapter(child: _Header()),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(EdSpacing.lg),
                      child: form,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        EdSpacing.lg,
                        0,
                        EdSpacing.lg,
                        EdSpacing.xxxl,
                      ),
                      child: results,
                    ),
                  ),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const _Header(),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        width: 380,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(EdSpacing.lg),
                          child: form,
                        ),
                      ),
                      const VerticalDivider(width: 1),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(EdSpacing.lg),
                          child: results,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return const EdPageHeader(
      kicker: 'Analyse FSS',
      title: 'Identifier',
      deck: 'Saisis ce que le FSS affiche : l\'app en déduit les espèces '
          'possibles, leur valeur et la Colony Range à respecter.',
    );
  }
}

class _SurveyForm extends StatelessWidget {
  const _SurveyForm({required this.state});

  final SpeciesFinderState state;

  void _update(BuildContext context, BodyProfile body) =>
      context.read<SpeciesFinderBloc>().add(SpeciesFinderBodyChanged(body));

  @override
  Widget build(BuildContext context) {
    final BodyProfile body = state.body;

    return EdPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const EdSubHeader('Relevé du corps'),
          const SizedBox(height: EdSpacing.md),
          _Dropdown<PlanetClass>(
            label: 'Type de corps',
            value: body.planetClass,
            values: PlanetClass.values,
            labelOf: (PlanetClass value) => value.label,
            onChanged: (PlanetClass value) =>
                _update(context, body.copyWith(planetClass: value)),
          ),
          const SizedBox(height: EdSpacing.sm),
          _Dropdown<AtmosphereType>(
            label: 'Atmosphère',
            value: body.atmosphere,
            values: AtmosphereType.values,
            labelOf: (AtmosphereType value) => value.label,
            onChanged: (AtmosphereType value) =>
                _update(context, body.copyWith(atmosphere: value)),
          ),
          const SizedBox(height: EdSpacing.sm),
          Row(
            children: <Widget>[
              Expanded(
                child: _NumberField(
                  label: 'Température (K)',
                  value: body.surfaceTemperatureK,
                  onChanged: (double? value) => _update(
                    context,
                    body.copyWith(surfaceTemperatureK: value),
                  ),
                ),
              ),
              const SizedBox(width: EdSpacing.sm),
              Expanded(
                child: _NumberField(
                  label: 'Gravité (g)',
                  value: body.surfaceGravityG,
                  onChanged: (double? value) =>
                      _update(context, body.copyWith(surfaceGravityG: value)),
                ),
              ),
            ],
          ),
          const SizedBox(height: EdSpacing.sm),
          Row(
            children: <Widget>[
              Expanded(
                child: _NumberField(
                  label: 'Distance (sl)',
                  value: body.distanceFromArrivalLs,
                  onChanged: (double? value) => _update(
                    context,
                    body.copyWith(distanceFromArrivalLs: value),
                  ),
                ),
              ),
              const SizedBox(width: EdSpacing.sm),
              Expanded(
                child: _NumberField(
                  label: 'Signaux bio',
                  value: body.biologicalSignalCount?.toDouble(),
                  onChanged: (double? value) => _update(
                    context,
                    body.copyWith(biologicalSignalCount: value?.round()),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: EdSpacing.sm),
          _Dropdown<VolcanismType>(
            label: 'Volcanisme',
            value: body.volcanism,
            values: VolcanismType.values,
            labelOf: (VolcanismType value) => value.label,
            onChanged: (VolcanismType value) =>
                _update(context, body.copyWith(volcanism: value)),
          ),
          const SizedBox(height: EdSpacing.sm),
          _Dropdown<StarClass>(
            label: 'Étoile parente',
            value: body.parentStarClass,
            values: StarClass.values,
            labelOf: (StarClass value) => value.label,
            onChanged: (StarClass value) =>
                _update(context, body.copyWith(parentStarClass: value)),
          ),
          const SizedBox(height: EdSpacing.md),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            value: body.nearNebula,
            onChanged: (bool value) =>
                _update(context, body.copyWith(nearNebula: value)),
            title: const Text(
              'À proximité d\'une nébuleuse',
              style: EdTypography.bodySmall,
            ),
          ),
          if (body.matchesStratumTectonicasHeuristic) ...<Widget>[
            const SizedBox(height: EdSpacing.sm),
            EdCallout.text(
              tone: EdCalloutTone.tip,
              title: 'Le repère à retenir',
              text: 'Haute teneur métallique, un seul signal biologique et '
                  'plus de 165 K : forte probabilité de Stratum Tectonicas, '
                  'l\'espèce la plus rentable du jeu.',
            ),
          ],
          if (body.isFarFromStar) ...<Widget>[
            const SizedBox(height: EdSpacing.sm),
            EdCallout.text(
              tone: EdCalloutTone.warning,
              title: 'Loin de l\'étoile',
              text: 'Au-delà de 1500 sl, le supercruise coûte souvent plus de '
                  'temps que la récolte elle-même.',
            ),
          ],
          const SizedBox(height: EdSpacing.md),
          OutlinedButton(
            onPressed: () => context
                .read<SpeciesFinderBloc>()
                .add(const SpeciesFinderReset()),
            child: const Text('Réinitialiser'),
          ),
        ],
      ),
    );
  }
}

class _Results extends StatelessWidget {
  const _Results({required this.state});

  final SpeciesFinderState state;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Padding(
        padding: EdgeInsets.all(EdSpacing.xxl),
        child: EdLoadingView(),
      );
    }
    if (state.failure case final failure?) {
      return EdErrorView(message: failure.message);
    }
    if (!state.hasSurvey) {
      return const EdEmptyView(
        icon: Icons.travel_explore,
        title: 'Renseigne un relevé',
        message: 'Choisis au moins un type de corps ou une atmosphère pour '
            'obtenir des candidates.',
      );
    }
    if (state.matches.isEmpty) {
      return const EdEmptyView(
        icon: Icons.search_off,
        title: 'Aucune espèce compatible',
        message: 'Aucune espèce connue ne pousse dans ces conditions. '
            'Vérifie le relevé, ou passe ton chemin.',
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        EdPanel(
          accent: EdColors.orange,
          background: EdColors.panelRaised,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Valeur estimée du corps'.toUpperCase(),
                      style: EdTypography.tag.copyWith(
                        fontSize: 9.5,
                        letterSpacing: 2,
                        color: EdColors.textFainter,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      formatCredits(state.estimatedValueCr),
                      style: EdTypography.numericLarge,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '${state.probable.length} probable(s)',
                    style: EdTypography.bodySmall
                        .copyWith(color: EdColors.greenBright),
                  ),
                  Text(
                    '${state.possible.length} possible(s)',
                    style:
                        EdTypography.bodySmall.copyWith(color: EdColors.gold),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: EdSpacing.md),
        for (final SpeciesMatch match in state.matches)
          Padding(
            padding: const EdgeInsets.only(bottom: EdSpacing.xs),
            child: SpeciesMatchCard(match: match, catalog: state.catalog),
          ),
      ],
    );
  }
}

class _Dropdown<T> extends StatelessWidget {
  const _Dropdown({
    required this.label,
    required this.value,
    required this.values,
    required this.labelOf,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<T> values;
  final String Function(T value) labelOf;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      isExpanded: true,
      decoration: InputDecoration(labelText: label.toUpperCase()),
      style: EdTypography.bodySmall,
      dropdownColor: EdColors.panelHeader,
      items: <DropdownMenuItem<T>>[
        for (final T item in values)
          DropdownMenuItem<T>(
            value: item,
            child: Text(labelOf(item), style: EdTypography.bodySmall),
          ),
      ],
      onChanged: (T? selected) {
        if (selected != null) {
          onChanged(selected);
        }
      },
    );
  }
}

class _NumberField extends StatefulWidget {
  const _NumberField({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final double? value;
  final ValueChanged<double?> onChanged;

  @override
  State<_NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<_NumberField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.value == null ? '' : _format(widget.value!),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static String _format(double value) => value == value.roundToDouble()
      ? value.toStringAsFixed(0)
      : value.toString();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
      ],
      style: EdTypography.numeric.copyWith(color: EdColors.textStrong),
      decoration: InputDecoration(labelText: widget.label.toUpperCase()),
      onChanged: (String raw) =>
          widget.onChanged(double.tryParse(raw.replaceAll(',', '.'))),
    );
  }
}
