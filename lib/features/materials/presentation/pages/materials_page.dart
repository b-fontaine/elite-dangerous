import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../design_system/design_system.dart';
import '../../../dashboard/presentation/widgets/commander_scope.dart';
import '../../../dashboard/presentation/widgets/summary_card.dart';
import '../../../journal/domain/entities/journal_session_state.dart';
import '../../domain/entities/blueprint.dart';
import '../../domain/entities/material_plan.dart';
import '../bloc/materials_bloc.dart';
import '../widgets/material_plan_view.dart';
import '../widgets/materials_scope.dart';
import '../widgets/missing_materials_guide.dart';

/// What the commander holds, measured against what they are working towards.
///
/// The old version of this page counted the next Artemis grade and stopped
/// there. The question it could not answer — *and how do I get the ones I am
/// missing?* — is what the rest of it is for.
class MaterialsPage extends StatelessWidget {
  const MaterialsPage({super.key});

  @override
  Widget build(BuildContext context) => MaterialsScope(
        builder: (BuildContext context, CommanderDossier dossier) =>
            _MaterialsView(dossier: dossier),
      );
}

class _MaterialsView extends StatelessWidget {
  const _MaterialsView({required this.dossier});

  final CommanderDossier dossier;

  @override
  Widget build(BuildContext context) {
    final JournalSessionState session = dossier.session;
    final bool empty =
        session.onFootInventory.isEmpty && session.shipMaterials.isEmpty;

    return BlocBuilder<MaterialsBloc, MaterialsState>(
      builder: (BuildContext context, MaterialsState state) {
        return DetailPageScaffold(
          kicker: 'Dossier',
          title: 'Matériaux',
          deck: empty
              ? null
              : 'Inventaire à pied et matériaux de vaisseau, mesurés contre ce '
                  'qu\'il reste à fabriquer.',
          slivers: <Widget>[
            if (empty)
              const DetailSection(
                top: EdSpacing.lg,
                child: MissingDataNote(
                  what: 'Aucun inventaire',
                  remedy:
                      'La Companion API ne renvoie ni les matériaux à pied ni '
                      'ceux du vaisseau. Ils viennent des événements '
                      '`ShipLocker` et `Materials` du journal.',
                ),
              ),
            if (state case final MaterialsError error)
              DetailSection(
                top: EdSpacing.lg,
                child: MissingDataNote(
                  what: 'Base de données des matériaux indisponible',
                  remedy: error.failure.message,
                  tone: EdCalloutTone.warning,
                ),
              ),
            if (state case final MaterialsReady ready) ...<Widget>[
              if (ready.board.suitPlan case final MaterialPlan plan)
                DetailSection(
                  top: EdSpacing.lg,
                  child: _SuitUpgradePanel(state: ready, plan: plan),
                ),
              DetailSection(child: _GoalsPanel(state: ready)),
            ],
            if (!empty) ...<Widget>[
              DetailSection(
                child: _InventoryPanel(
                  title: 'Inventaire à pied',
                  inventory: session.onFootInventory,
                ),
              ),
              DetailSection(
                child: _InventoryPanel(
                  title: 'Matériaux du vaisseau',
                  inventory: session.shipMaterials,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

/// The next suit grade, and how to get what is missing for it.
class _SuitUpgradePanel extends StatelessWidget {
  const _SuitUpgradePanel({required this.state, required this.plan});

  final MaterialsReady state;
  final MaterialPlan plan;

  @override
  Widget build(BuildContext context) {
    final SuitGradeStep? step = state.board.suitStep;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        EdSectionHeader(
          title: step == null
              ? 'Montée en grade'
              : 'Combinaison — grade ${step.fromGrade} → ${step.toGrade}',
        ),
        const SizedBox(height: EdSpacing.md),
        EdPanel(
          accent: plan.isComplete ? EdColors.green : EdColors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                plan.isComplete
                    ? 'Tout est là : la montée en grade peut se faire chez un '
                        'ingénieur à pied.'
                    : 'Il manque ${plan.missingTotal} unité(s) au total.',
                style: EdTypography.bodySmall,
              ),
              const SizedBox(height: EdSpacing.xs),
              MaterialPlanTable(plan: plan),
            ],
          ),
        ),
        if (!plan.isComplete) ...<Widget>[
          const SizedBox(height: EdSpacing.lg),
          MissingMaterialsGuide(catalog: state.catalog, plan: plan),
        ],
      ],
    );
  }
}

/// The blueprints, and how far each one still is.
class _GoalsPanel extends StatelessWidget {
  const _GoalsPanel({required this.state});

  final MaterialsReady state;

  @override
  Widget build(BuildContext context) {
    final List<Blueprint> blueprints = state.blueprints;
    if (blueprints.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const EdSectionHeader(title: 'Blueprints d\'ingénierie'),
        const SizedBox(height: EdSpacing.md),
        for (final Blueprint blueprint in blueprints) ...<Widget>[
          _GoalCard(blueprint: blueprint, plan: state.planFor(blueprint.id)),
          const SizedBox(height: EdSpacing.md),
        ],
      ],
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.blueprint, required this.plan});

  final Blueprint blueprint;
  final MaterialPlan? plan;

  @override
  Widget build(BuildContext context) {
    final MaterialPlan? measured = plan;
    return SummaryCard(
      title: '${blueprint.module} — ${blueprint.name}',
      icon: Icons.build_circle_outlined,
      accent: measured == null || measured.isComplete
          ? EdColors.green
          : EdColors.amber,
      note: measured == null
          ? 'Coût inconnu.'
          : measured.isComplete
              ? 'Tout est là, jusqu\'au grade ${blueprint.maxGrade}.'
              : null,
      facts: <SummaryFact>[
        if (measured != null && !measured.isComplete) ...<SummaryFact>[
          SummaryFact(
            'Unités manquantes',
            '${measured.missingTotal}',
            tone: EdColors.amber,
          ),
          SummaryFact(
            'Matériaux à compléter',
            '${measured.missing.length} sur ${measured.requirements.length}',
          ),
        ],
      ],
      onOpen: () => context.go(AppRoutes.materialBlueprint(blueprint.id)),
    );
  }
}

class _InventoryPanel extends StatelessWidget {
  const _InventoryPanel({required this.title, required this.inventory});

  final String title;
  final Map<String, int> inventory;

  @override
  Widget build(BuildContext context) {
    if (inventory.isEmpty) {
      return const SizedBox.shrink();
    }
    // Most plentiful first: what is scarce is what the roadmap will ask for.
    final List<MapEntry<String, int>> sorted = inventory.entries
        .toList(growable: false)
      ..sort((MapEntry<String, int> a, MapEntry<String, int> b) {
        final int byCount = b.value.compareTo(a.value);
        return byCount != 0 ? byCount : a.key.compareTo(b.key);
      });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        EdSectionHeader(title: '$title (${inventory.length})'),
        const SizedBox(height: EdSpacing.md),
        EdDataTable(
          headers: const <String>['Ressource', 'Quantité'],
          rows: <List<EdCell>>[
            for (final MapEntry<String, int> entry in sorted)
              <EdCell>[
                EdCell(entry.key),
                EdCell.number('${entry.value}'),
              ],
          ],
        ),
      ],
    );
  }
}
