import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../design_system/design_system.dart';
import '../../../dashboard/presentation/widgets/commander_scope.dart';
import '../../../dashboard/presentation/widgets/summary_card.dart';
import '../../domain/entities/blueprint.dart';
import '../../domain/entities/material_plan.dart';
import '../bloc/materials_bloc.dart';
import '../widgets/material_plan_view.dart';
import '../widgets/materials_scope.dart';
import '../widgets/missing_materials_guide.dart';

/// One blueprint, from "what is it for" down to "where do I find the last
/// three units".
class BlueprintPlanPage extends StatelessWidget {
  const BlueprintPlanPage({required this.blueprintId, super.key});

  final String blueprintId;

  @override
  Widget build(BuildContext context) => MaterialsScope(
        builder: (BuildContext context, CommanderDossier dossier) =>
            _BlueprintView(blueprintId: blueprintId),
      );
}

class _BlueprintView extends StatelessWidget {
  const _BlueprintView({required this.blueprintId});

  final String blueprintId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialsBloc, MaterialsState>(
      builder: (BuildContext context, MaterialsState state) {
        return switch (state) {
          MaterialsInitial() || MaterialsLoading() => const EdLoadingView(),
          MaterialsError(:final failure) => EdErrorView(message: failure.message),
          final MaterialsReady ready => _body(context, ready),
        };
      },
    );
  }

  Widget _body(BuildContext context, MaterialsReady state) {
    final Blueprint? blueprint = state.catalog.blueprint(blueprintId);
    if (blueprint == null) {
      return const EdEmptyView(
        title: 'Blueprint inconnu',
        message: 'Ce blueprint ne fait pas partie de la base embarquée.',
      );
    }
    final MaterialPlan? plan = state.planFor(blueprint.id);
    final int from = state.startGradeFor(blueprint.id);

    return DetailPageScaffold(
      kicker: blueprint.module,
      title: blueprint.name,
      deck: blueprint.purpose,
      slivers: <Widget>[
        if (blueprint.warning case final String warning)
          DetailSection(
            top: EdSpacing.lg,
            child: EdCallout.text(
              tone: EdCalloutTone.warning,
              title: 'Ce qui bloque',
              text: warning,
            ),
          ),
        DetailSection(
          child: _GradePicker(blueprint: blueprint, fromGrade: from),
        ),
        if (plan != null) ...<Widget>[
          DetailSection(child: _CostPanel(blueprint: blueprint, plan: plan)),
          DetailSection(child: MaterialConversionsPanel(plan: plan)),
          DetailSection(
            child: MissingMaterialsGuide(catalog: state.catalog, plan: plan),
          ),
        ],
        DetailSection(child: _EngineersPanel(blueprint: blueprint)),
        if (blueprint.experimentals.isNotEmpty)
          DetailSection(
            child: _ExperimentalsPanel(blueprint: blueprint, state: state),
          ),
        DetailSection(child: _GradeLadder(blueprint: blueprint)),
      ],
    );
  }
}

/// Lets the commander say what is already installed, so the plan stops
/// charging for grades they have.
class _GradePicker extends StatelessWidget {
  const _GradePicker({required this.blueprint, required this.fromGrade});

  final Blueprint blueprint;
  final int fromGrade;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Grade déjà posé'),
        const SizedBox(height: EdSpacing.md),
        Wrap(
          spacing: EdSpacing.sm,
          runSpacing: EdSpacing.sm,
          children: <Widget>[
            for (int grade = 0; grade < blueprint.maxGrade; grade++)
              ChoiceChip(
                label: Text(grade == 0 ? 'Aucun' : 'G$grade'),
                selected: grade == fromGrade,
                onSelected: (bool selected) {
                  if (selected) {
                    context.read<MaterialsBloc>().add(
                          MaterialsBlueprintGradeChanged(
                            blueprintId: blueprint.id,
                            fromGrade: grade,
                          ),
                        );
                  }
                },
              ),
          ],
        ),
      ],
    );
  }
}

class _CostPanel extends StatelessWidget {
  const _CostPanel({required this.blueprint, required this.plan});

  final Blueprint blueprint;
  final MaterialPlan plan;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        EdSectionHeader(title: plan.label),
        const SizedBox(height: EdSpacing.md),
        EdPanel(
          accent: plan.isComplete ? EdColors.green : EdColors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                plan.isEmpty
                    ? 'Rien à faire : le blueprint est déjà au grade maximal.'
                    : plan.isComplete
                        ? 'Tout est là. Reste à faire le trajet.'
                        : 'Il manque ${plan.missingTotal} unité(s) au total.',
                style: EdTypography.bodySmall,
              ),
              const SizedBox(height: EdSpacing.xs),
              MaterialPlanTable(plan: plan),
              for (final String warning in plan.warnings) ...<Widget>[
                const SizedBox(height: EdSpacing.sm),
                Text(warning, style: EdTypography.caption),
              ],
              const SizedBox(height: EdSpacing.xs),
              const Text(
                'Les quantités comptent les rolls : à réputation 5, un '
                'blueprint de grade N se pose en N rolls.',
                style: EdTypography.caption,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EngineersPanel extends StatelessWidget {
  const _EngineersPanel({required this.blueprint});

  final Blueprint blueprint;

  @override
  Widget build(BuildContext context) {
    if (blueprint.engineers.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Qui le pose'),
        const SizedBox(height: EdSpacing.md),
        EdPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final BlueprintEngineer engineer in blueprint.engineers)
                FactRow(
                  label: engineer.name,
                  value: 'jusqu\'au grade ${engineer.maxGrade}',
                ),
              if (blueprint.engineersNote case final String note) ...<Widget>[
                const SizedBox(height: EdSpacing.xs),
                Text(note, style: EdTypography.caption),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _ExperimentalsPanel extends StatelessWidget {
  const _ExperimentalsPanel({required this.blueprint, required this.state});

  final Blueprint blueprint;
  final MaterialsReady state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Effets expérimentaux'),
        const SizedBox(height: EdSpacing.md),
        for (final ExperimentalEffect effect in blueprint.experimentals)
          Padding(
            padding: const EdgeInsets.only(bottom: EdSpacing.md),
            child: EdPanel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  EdSubHeader(effect.name),
                  if (effect.description case final String description) ...[
                    const SizedBox(height: EdSpacing.xxs),
                    Text(description, style: EdTypography.caption),
                  ],
                  const SizedBox(height: EdSpacing.xs),
                  if (state.experimentalPlan(effect.id)
                      case final MaterialPlan plan)
                    MaterialPlanTable(plan: plan),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// What each grade gives, so the commander can stop where it stops paying.
class _GradeLadder extends StatelessWidget {
  const _GradeLadder({required this.blueprint});

  final Blueprint blueprint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Effet par grade'),
        const SizedBox(height: EdSpacing.md),
        EdDataTable(
          headers: const <String>['Grade', 'Rolls', 'Effet'],
          rows: <List<EdCell>>[
            for (final BlueprintGrade grade in blueprint.grades)
              <EdCell>[
                EdCell('G${grade.grade}'),
                EdCell.number('${grade.rollsAtReputation5}'),
                EdCell(grade.effect ?? '—'),
              ],
          ],
        ),
      ],
    );
  }
}
