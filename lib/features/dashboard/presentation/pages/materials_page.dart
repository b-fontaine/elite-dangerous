import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import '../../../commander/domain/entities/suit_info.dart';
import '../../../exobiology/domain/entities/suit.dart';
import '../../../exobiology/domain/services/exobiology_reference_data.dart';
import '../../../journal/domain/entities/journal_session_state.dart';
import '../widgets/commander_scope.dart';
import '../widgets/summary_card.dart';

/// On-foot and ship materials, measured against the next Artemis upgrade.
class MaterialsPage extends StatelessWidget {
  const MaterialsPage({super.key});

  @override
  Widget build(BuildContext context) => CommanderScope(
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

    return DetailPageScaffold(
      kicker: 'Dossier',
      title: 'Matériaux',
      deck: empty ? null : 'Inventaire à pied et matériaux de vaisseau.',
      slivers: <Widget>[
        if (empty)
          const DetailSection(
            top: EdSpacing.lg,
            child: MissingDataNote(
              what: 'Aucun inventaire',
              remedy: 'La Companion API ne renvoie ni les matériaux à pied ni '
                  'ceux du vaisseau. Ils viennent des événements `ShipLocker` '
                  'et `Materials` du journal.',
            ),
          )
        else ...<Widget>[
          DetailSection(
            top: EdSpacing.lg,
            child: _NextUpgradePanel(
              artemis: dossier.commander.artemis,
              inventory: session.onFootInventory,
            ),
          ),
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
  }
}

/// What the next Artemis grade costs, and what is still missing for it.
class _NextUpgradePanel extends StatelessWidget {
  const _NextUpgradePanel({required this.artemis, required this.inventory});

  final SuitInfo? artemis;
  final Map<String, int> inventory;

  @override
  Widget build(BuildContext context) {
    final SuitInfo? suit = artemis;
    if (suit == null) {
      return const SizedBox.shrink();
    }

    final SuitGradeStep? step = _stepFrom(suit.grade);
    if (step == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const EdSectionHeader(title: 'Montée en grade'),
          const SizedBox(height: EdSpacing.md),
          EdCallout.text(
            tone: EdCalloutTone.tip,
            title: 'Artemis au grade maximal',
            text: 'Plus rien à collecter pour la combinaison elle-même.',
          ),
        ],
      );
    }

    final List<MapEntry<String, int>> required =
        step.materials.entries.toList(growable: false);
    final int missingTotal = required.fold<int>(
      0,
      (int sum, MapEntry<String, int> entry) =>
          sum + _missing(entry.key, entry.value),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        EdSectionHeader(
          title: 'Grade ${step.fromGrade} → ${step.toGrade}',
        ),
        const SizedBox(height: EdSpacing.md),
        EdPanel(
          accent: missingTotal == 0 ? EdColors.green : EdColors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (missingTotal == 0)
                const Text(
                  'Tout est là : la montée en grade peut se faire chez un '
                  'ingénieur à pied.',
                  style: EdTypography.bodySmall,
                )
              else
                Text(
                  'Il manque $missingTotal unité(s) au total.',
                  style: EdTypography.bodySmall,
                ),
              const SizedBox(height: EdSpacing.xs),
              for (final MapEntry<String, int> entry in required)
                FactRow(
                  label: entry.key,
                  value: '${inventory[entry.key] ?? 0} / ${entry.value}',
                  tone: _missing(entry.key, entry.value) == 0
                      ? EdColors.greenBright
                      : EdColors.amber,
                ),
              const SizedBox(height: EdSpacing.xs),
              const Text(
                'Une montée en grade ne coûte aucun crédit — seulement des '
                'matériaux.',
                style: EdTypography.caption,
              ),
            ],
          ),
        ),
      ],
    );
  }

  int _missing(String material, int target) =>
      (target - (inventory[material] ?? 0)).clamp(0, target);

  static SuitGradeStep? _stepFrom(int grade) {
    for (final SuitGradeStep step
        in ExobiologyReferenceData.artemisGradeSteps) {
      if (step.fromGrade == grade) {
        return step;
      }
    }
    return null;
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
